
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
