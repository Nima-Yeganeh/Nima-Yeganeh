
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
