
      
   <template>
      <div>
         <div class="ui basic segment resume-div">
    <div class="ui breadcrumb title-r">
        <a class="section">رزومه‌های دریافتی</a>
        <template v-if="jobInfo">
            <div class="divider"> /</div>
            <div class="section-2">{{ jobInfo.title }}</div>
        </template>
        <template v-if="companyInfo">
            <div class="divider"> /</div>
            <div class="section-2">{{ companyInfo.title }}</div>
        </template>
    </div>
    <!-- tabs -->
    <div class="ui pointing secondary menu responsive_menu">
        <a class=" item" v-for="tab in tabs" :class="{active: activeTab === tab.value, disabled: tab.disabled}"
            @click="selectTab(tab)">{{tab.title}}</a>
    </div>
    <div class="ui basic segment main-content">
        <!-- loading -->
        <div class="ui active inverted dimmer loader_display" v-if="loading">
            <div class="ui text loader">بارگذاری</div>
        </div>
        <!-- table -->
        <table v-if="resumes.length > 0" class="ui very compact unstackable selectable celled table resume-sent">
            <thead>
                <tr>
                    <th class="head">
                        <p class="th-r">عکس</p>
                    </th>
                    <th class="head">نام و نام خانوادگی</th>
                    <th class="head">سن</th>
                    <th class="head">شهر</th>
                    <th class="head" v-if="!jobInfo">آگهی</th>
                    <th class="head" v-if="role === 'employer'">
                        <p class="th-r">گزینه ها</p>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in resumes">
                    <td data-label="type">
                        <div class="td-r">
                            <div class="person-logo" :style="{'background-image': 'url(' + item.image+')'}"></div>
                            <!-- is special -->
                            <label class="ui label red mini" v-if="role === 'admin' && item.is_special">ویژه</label>
                        </div>
                    </td>
                    <td data-label="name">
                        <p class="responsive-r"> {{item.full_name}} </p>
                    </td>
                    <td data-label="name">
                        <p class="responsive-r"> {{item.user_age}} </p>
                    </td>
                    <td data-label="name">
                        <p class="responsive-r"> {{item.state}} </p>
                    </td>
                    <td v-if="!jobInfo">
                        <p class="responsive-r"> {{item.job.title}} </p>
                    </td>
                    <!-- buttons -->
                    <td data-label="more" v-if="role === 'employer'">
                        <div class=" ui buttons">
                            <a class="ui black basic button display-btn" target="_blank" @click="viewResume(item)"
                                data-tooltip="مشاهده رزومه"><i class="eye icon"></i></a>
                            <template v-if="activeTab === 'waiting'">
                                <button class="ui green basic button display-btn" data-tooltip="قبول کردن رزومه"
                                    @click="action(item,'accept')">
                                    <i class="check icon"></i>
                                </button>
                                <button class="ui red basic button display-btn" data-tooltip="رد کردن رزومه"
                                    @click="action(item,'reject')">
                                    <i class="close icon"></i>
                                </button>
                            </template>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- pagination -->
        <pagination :page_counts="this.page_counts" :p_index="this.index" @reload="loadResumes($event)"></pagination>

        <!-- not found -->
        <not-found v-if="not_found"></not-found>
    </div>
</div>
      </div>
   </template>
   
   <script>
      import pagination from './pagination.vue';
import not_found from './not_found.vue';

      
export default {
  props: {
    role: {
      type: String,
      default: 'employer',
    },
    companyId: Number,
    jobId: Number,
  },
  data() {
    return {
      not_found: false,
      jobId: undefined,
      jobInfo: undefined,
      companyInfo: undefined,
      resumes: [],
      loading: false,
      activeTab: 'waiting',
      loading: false,
      index: 1,
      size: 10,
      page_counts: 0,
      tabs: [
        {
          value: 'waiting',
          title: 'در انتظار تعیین وضعیت',
        },
        {
          value: 'checking',
          title: 'در حال بررسی',
          // disabled: true,
        },
        {
          value: 'accept',
          title: 'تایید اولیه',
          // disabled: true,
        },
        {
          value: 'reject',
          title: 'رد شده',
          // disabled: true,
        },
      ],
    };
  },
  async created() {
    // console.log("context:", this.context);
    // =>select waiting tab
    this.selectTab(this.tabs[0]);
    // =>if job id exist
    if (this.jobId) {
      this.getJobInfo();
    }
    // =>if admin role and company id exist
    if (this.role === 'admin' && this.companyId) {
      this.getCompanyInfo();
    }
  },
  methods: {
    async getJobInfo() {
      let res = await callStdAPI(PUBLIC_URLS.job_details_api, {
        method: 'get',
        data: {
          job_id: this.jobId,
        },
      });
      // =>if sucess
      if (res.status === 200) {
        this.jobInfo = res.data;
      }
    },
    async getCompanyInfo() {
      let res = await callStdAPI(PUBLIC_URLS.company_info_api, {
        method: 'get',
        data: {
          company_id: this.companyId,
        },
      });
      // =>if sucess
      if (res.status === 200) {
        this.companyInfo = res.data;
      }
    },
    selectTab(tab) {
      if (tab.disabled) return;
      this.activeTab = tab.value;
      this.index = 1;
      this.size = 10;
      this.loadResumes(1);
    },
    async loadResumes(event) {
      this.loading = true;
      if (event !== undefined) {
        this.index = event
      }
      this.resumes = [];
      // =>call api
      let data = {
        "type": this.activeTab,
        tab: this.activeTab,
        "page_index": this.index,
        "page_size": this.size,
      };
      if (this.jobId) {
        data['job_id'] = this.jobId;
      }
      if (this.role === 'admin' && this.companyId) {
        data['company_id'] = this.companyId;
      }
      // =>call api
      let res = await callStdAPI(PUBLIC_URLS.recieved_resumes_api, {
        method: 'get',
        data: data,
      });
      // =>if success
      if (res.status === 200) {
        this.resumes = res.data.receive_resume;
        this.page_counts = res.data.page_counts;
        // for set user age
        for (let r in this.resumes) {
          // te setage for user
          if (this.resumes[r].user_age === 0) {
            this.resumes[r].user_age = "-"
          }
          else {
            this.resumes[r].user_age = convertNumbersToPersian(this.resumes[r].user_age)
          }
        }
      } else {
        this.resumes = [];
      }
      // =>iterate resumes
      for (const r of this.resumes) {
        r.created_at = toPersianDate(new Date(r.created_at));
      }
      this.loading = false;
      this.not_found = this.resumes.length === 0
    },
    viewResume(resume) {
      let url = PUBLIC_URLS.preview_resume_url + `?user_id=${resume.user_id}&job_id=${resume.job.pk}`;
      if (this.role === 'admin' && this.companyId) {
        url += `&company_id=${this.companyId}`;
      }

      goToPage(url);
    },
    // for accept or decline resume
    async action(resume, type) {
      let data = {
        "user_id": resume.user_id,
        "job_id": resume.job.pk,
        "status": type
      }
      let res = await callStdAPI(PUBLIC_URLS.check_resume_api, {
        data: data,
        method: 'post',
      });
      if (res.status === 200) {
        if (type === 'accept')
          iziToast.success({ title: 'انجام شد', message: 'رزومه با موفقیت تایید شد' });
        else
          iziToast.warning({ title: 'انجام شد', message: 'رزومه با موفقیت حذف شد' });
        this.loadResumes();
      }
      else {
        iziToast.error({ title: '', message: 'مشکلی در ثبت درخواست شما بوجود آمده است.' });
      }
    },
    convertNumbersToPersian(str) {
      return convertNumbersToPersian(str);
    },
  },
  components: {
    'pagination': pagination,
    "not-found": not_found
  },
};

   </script>

   <style scoped>
      .title-r {
  display: flex !important;
  font-size: 24px !important;
  padding: 20px;
}

.td-r {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  min-height: 60px;
}
.td-r .person-logo {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
}
.td-r label {
  position: absolute;
  bottom: -3px;
  left: -3px;
}

.resume-sent {
  text-align: center !important;
}

.section {
  color: #232323 !important;
}

.see {
  color: #000000de !important;
}

.display-btn {
  padding: 10px !important;
}
.display-btn i {
  margin: 0px !important;
}

.loader_display {
  z-index: 2;
}

.main-content {
  min-height: 500px;
}

@media only screen and (max-width: 1050px) {
  .resume-div {
    padding: 0px !important;
  }
  .resume-div .main-content {
    padding: 0px !important;
  }
}
@media only screen and (max-width: 700px) {
  .main-content {
    overflow-x: auto !important;
  }
  .main-content .resume-sent {
    min-width: 600px !important;
    margin-bottom: 25px;
  }

  .responsive_menu {
    overflow-x: auto;
    overflow-y: hidden;
  }
}

   </style>
    
  
   