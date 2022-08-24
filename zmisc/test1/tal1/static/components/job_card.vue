
      
   <template>
      <div>
         <div class="ui card fluid card-res" :id="id">
  <div class="ui active inverted dimmer" v-if="loading">
    <div class="ui text loader">بارگذاری</div>
  </div>
  <div class="content" @click="jobClick($event)" v-if="!loading">
    <!-- job company -->
    <div v-if="job.company" class="meta company-logo">
      <div class="right-top">
        <img class=" ui avatar image" :src="job.company.logo">
        <div>
          <h4>{{job.title}}</h4>
          <p>{{job.company.title}}</p>
        </div>
      </div>
      <div class="actions" v-if="is_login=='true' || userInfo">
        <!-- is starred -->
        <i :id=" job.pk" class="material-icons" @click.stop="stopTheEvent" @click="toggleBookmark()">{{job.bookmark ?
          'bookmark' : 'bookmark_border'}}</i>
        <!-- send resume -->
        <template v-if="showSendResume && !job.is_owner">
          <span data-tooltip="ارسال رزومه" @click.stop="stopTheEvent" @click="send_resume($event, job)"
            v-if="!job.resume_exist">
            <i class="material-icons send-btn">send</i>
          </span>
          <span data-tooltip="رزومه ارسال شده است" v-if="job.resume_exist">
            <i class="material-icons green">done</i>
          </span>
        </template>
      </div>
    </div>
    <!-- <div class="description" v-if="shortDes">
      <p v-html="parseHtml(shortDes)"></p>    
    </div> -->
  </div>
  <span v-if="job.is_starred" class="ui red label starred">فوری</span>
  <div class="extra content">
    <span class="right floated time" v-if="publicationAt">{{publicationAt}}</span>
    <span class="category" v-if="locationText">{{locationText}}</span>
  </div>
</div>

<!--    
<div class="ui card">
    <div class="content">
      <div class="header">Cute Dog</div>
      <div class="meta">
        <span class="right floated time">2 days ago</span>
        <span class="category">Animals</span>
      </div>
      <div class="description">
        <p></p>
      </div>
    </div>
    <div class="extra content">
      <div class="right floated author">
        <img class="ui avatar image" src="/images/avatar/small/matt.jpg"> Matt
      </div>
    </div>
  </div> -->

<!-- -------------------------------dialog send resume------------------------------- -->
<div class="ui tiny modal" v-if="showSendResume" :id="sendResumeModalId">
  <div class="header">ارسال رزومه به آگهی</div>
  <div class="content">
    <!-- div image -->
    <div class="image-p">
      <img src="/static/base/img/img-pay.svg">
    </div>
    <!-- to check how to send resume -->
    <div class="ui toggle checkbox">
      <input type="checkbox" v-model="sendSpecialResume">
      <label>تمایل دارم رزومه من، به عنوان رزومه ویژه به کارفرما ارسال شود. </label>
    </div>
    <!-- <div id="price-view" class="price-view">
          <div class="about-notice-bottom ">
              <h4> هزینه ویژه کردن رزومه</h4>
              <div class="price">
                  <p>۴۵۰۰۰</p>
                  <p class="t">تومان</p>
              </div>
          </div>
          <br>
          <div class="ui input sale-code">
              <input type="text" placeholder="کد تخفیف">
          </div>
          <button class="ui button notice">
              پرداخت
              <i class="material-icons">chevron_left</i>
          </button>
      </div> -->
  </div>
  <!-- sent resume button -->
  <div class="actions">
    <button class="ui positive right labeled icon button" :disabled="resume_exist || expire" @click="send_resume_api()">
      ارسال رزومه
      <i class="checkmark icon"></i>
    </button>
  </div>
</div>
      </div>
   </template>
   
   <script>
      
      
export default {
  props: {
    job: Object,
    is_login: String,
    showSendResume: {
      default: true,
      type: Boolean,
    },
    // is_owner: String,
    bookmarkApiUrl: {
      default: '/jobs/api/std_bookmark_job/',
    },
  },
  data() {
    return {
      loading: true,
      sent: false,
      locationText: undefined,
      id: '44543',
      sendResumeModalId: 'gggg',
      userInfo: undefined,
      selectedJob: undefined,
      stopTheEvent: (event) => event.stopPropagation()
    };
  }, 
  async created() {
    // =>get user info
    this.userInfo = await isUserLogin(true);
    this.checkInitJob();
  },
  methods: {
    async checkInitJob(job) {
      if (job) this.job = job;
      console.log("job:", this.job);
      if (this.job) {
        this.loading = false;
      }
      // =>set random id
      this.id = Math.round(Math.random() * 100000);
      this.sendResumeModalId = Math.round(Math.random() * 100000);
      if (this.job && this.job.location && !isNaN(Number(this.job.location))) {
        // =>get location by id
        let location = await getLocation(undefined, undefined, Number(this.job.location));
        if (location) {
          this.locationText = location['city'] + ' - ' + location['state'];
        }
      }
    },
    jobClick(event) {
      $('#' + this.id).transition({
        animation: 'pulse',
        onComplete: () => {
          this.$emit('click', event);
        }
      });
    },
    async toggleBookmark() {
      //FIXME:
      let method = ""
      let icon = $('#' + this.job.pk).text()
      if (icon === "bookmark") {
        method = "delete"
      } else {
        method = "put"
      }
      let res = await callStdAPI(this.bookmarkApiUrl, {
        method: method,
        data: { "job_id": this.job.pk },
      });
      if (res.status === 200) {
        if (icon === "bookmark") {
          $('#' + this.job.pk).text("bookmark_border")
        } else {
          $('#' + this.job.pk).text("bookmark")
        }
      }
    },
    send_resume(event, job) {
      this.selectedJob = job;
      // this.$emit('show_modal', event);
      $('#' + this.sendResumeModalId).modal('show');
    },
    async send_resume_api() {
      // =>check for special resume
      if (this.sendSpecialResume) {
        this.sendResumeAsSpecial();
        return;
      }
      this.loading = true;
      let res = await callStdAPI(PUBLIC_URLS.send_resume_api, {
        method: 'PUT',
        data: { 'job_id': this.selectedJob.pk }
      });
      console.log(res)
      if (res.status === 200) {
        showSuccessToast('رزومه شما با موفقیت ارسال شد');
        this.job.resume_exist = true;
      }
      else if (res.status === 403) {
        showErrorToast(res.data);
      }
      else if (res.status === 400) {
        showErrorToast('درخواست شما با خطا مواجه شد');
      }
      $('#send_resume_modal').modal('hide');
      this.checkInitJob();
      // this.getJobs();
    },
    async sendResumeAsSpecial() {
      goToPayment('specialize_resume', { job_id: this.selectedJob.pk });
    },
    // show_modal(job) {
    //   this.selected_job = job;
    //   $('#send_resume_modal').modal('show');
    // },
  },
  components: {},
  watch: {
    job: function (newValue, oldValue) {
      this.checkInitJob(newValue);
    }
  },
  computed: {
    shortDes: function () {
      if (!this.job || !this.job.description) return undefined;
      if (this.job.description.length > 105) {
        return this.job.description.substring(0, 100) + '...';
      }
      return this.job.description;
    },
    publicationAt: function () {
      if (!this.job || !this.job.publication_date) return undefined;
      return toPersianDate(new Date(this.job.publication_date), 'dddd D MMMM');
    }
  },

};

   </script>

   <style scoped>
      .card {
  cursor: pointer;
  transition: all 0.3s;
  max-height: 200px;
  min-height: 200px;
  border-radius: 12px;
}
.card:hover {
  box-shadow: 0 1px 7px 0 rgba(0, 0, 0, 0.2);
}
.card .description {
  font-size: 10px;
}
.card .actions {
  display: flex;
  flex-direction: column !important;
  align-items: flex-end;
  flex-direction: row-reverse;
}
.card .actions i {
  cursor: pointer;
  opacity: 0.8;
  transition: all 0.3s;
  font-size: 20px !important;
  margin-left: 0px !important;
}
.card .actions i:hover {
  opacity: 1;
}
.card span {
  font-size: 12px;
  font-weight: bold;
}
.card .send-btn {
  transform: rotate(-135deg) !important;
  color: #6435c9 !important;
}
.card .starred {
  display: flex;
  align-self: flex-end;
  margin: 5px;
  text-align: center;
}

.company-logo {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.company-logo .right-top {
  display: flex;
  flex-direction: row;
  align-items: flex-start;
}
.company-logo .right-top div {
  display: flex;
  flex-direction: column;
  align-items: baseline;
}
.company-logo .right-top img {
  width: 45px !important;
  height: 45px !important;
}
.company-logo .right-top h4 {
  margin: 0.5em 0;
  font-size: 17px;
  margin: 5px 0px;
}
.company-logo .right-top p {
  color: gray;
  font-size: 12px;
}

@media only screen and (max-width: 800px) {
  .card-res {
    max-height: 220px !important;
    min-height: 220px !important;
  }
}
@media only screen and (max-width: 650px) {
  .card-res {
    max-height: 220px !important;
    min-height: 220px !important;
  }
  .card-res h4 {
    font-size: 14px !important;
  }
}
@media only screen and (max-width: 570px) {
  .card-res {
    max-height: 220px !important;
    min-height: 220px !important;
  }

  h4 {
    font-size: 12px !important;
  }

  span {
    font-size: 9px !important;
  }
}
.image-p {
  display: flex;
  justify-content: center;
}
.image-p img {
  width: 40%;
}

   </style>
    
  
   