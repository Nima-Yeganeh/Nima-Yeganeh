
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      loading: false,
      jobs: [],
      index: 1,
      size: 10,
      page_counts: 0,
      activeTab: 'all',
      tabs: [
        {
          value: 'all',
          title: 'همه',
        },
        {
          value: 'checking',
          title: 'در انتظار تایید',
        },
        {
          value: 'active',
          title: 'تایید شده',
          // disabled: true,
        },
        {
          value: 'reject',
          title: 'رد شده',
          // disabled: true,
        },
        {
          value: 'expired',
          title: 'منقضی شده',
          // disabled: true,
        },
      ],
    };
  },
  mounted() {
    $('.ui.tab').tab();
  },
  created() {
    console.log("context:", this.context);
    this.loadJobs(1);
    $('.button')
      .popup({
        inline: true
      });
  },
  methods: {
    selectTab(tab) {
      if (tab.disabled) return;
      this.activeTab = tab.value;
      this.index = 1;
      this.size = 10;
      this.loadJobs(1);
    },
    async loadJobs(event) {
      this.loading = true;
      if (event !== undefined){
        this.index = event
      }
      let res = await callStdAPI(this.context.jobs_api, {
        data: {
          "type": this.activeTab,
          "page_index": this.index,
          "page_size": this.size,
        },
        method: "get"
      });
      // console.log(res)
      let jobsResponse = [];
      if (res.status === 200) {
        jobsResponse = res.data.jobs;
        this.page_counts = res.data.page_counts;
      }
      // console.log('jobs:', this.jobs, jobsResponse)
      this.jobs = [];
      // =>normalize jobs
      for (const job of jobsResponse) {
        this.jobs.push({
          id: convertNumbersToPersian(job.pk),
          company: job.company.title,
          title: job.title,
          created_at: toPersianDate(job.publication_date, 'YYYY/MM/DD'),
          title: job.title,
          status: job.status,
        });
      }
      this.loading = false;
    },
    viewJob(job) {
      window.location.href = this.context.viewJobUrl + '?job_id=' + job.id;
    },
    async answerJobRequest(job, status) {
      let res = await callAPI(this.context.jobs_api, { id: job.id, status }, 'POST');
      // =>if success, remove job from list
      if (res[0] === 'success') {
        this.jobs.splice(this.jobs.findIndex(i => i.id === job.id), 1);
      }
    },
    async delete_job(job) {
      if (!await confirmToast(`آیا واقعا تمایل به غیرفعال کردن آگهی '${job.title}' دارید؟`)) {
        return;
      }
      let res = await callStdAPI(this.context.API_delete_job, {
        method: 'POST',
        data: {
          job_id: job.id,
          status: "expired",
        }
      })
      if (res.status === 200) {
        this.loadJobs()
        iziToast.success({ title: '', message: 'آگهی موردنظر غیرفعال شد.' })
      }
      else if (res.status === 403) {
        iziToast.warning({ title: '', message: res.data })
      }
      else if (res.status === 400) {
        showErrorToast('درخواست شما با خطا مواجه شد');
      }
    },
    async active_job(job) {
      if (!await confirmToast(`آیا واقعا تمایل به فعال کردن آگهی '${job.title}' دارید؟`)) {
        return;
      }
      let res = await callStdAPI(this.context.API_delete_job, {
        method: 'POST',
        data: {
          job_id: job.id,
          status: "active",
        }
      })
      if (res.status === 200) {
        this.loadJobs()
        iziToast.success({ title: '', message: 'آگهی موردنظر فعال شد.' })
      }
      else if (res.status === 403) {
        iziToast.warning({ title: '', message: res.data })
      }
      else if (res.status === 400) {
        showErrorToast('درخواست شما با خطا مواجه شد');
      }
    },
    convertNumbersToPersian(str) {
      return convertNumbersToPersian(str);
    },
  },
  components: {
    'pagination': pagination,
  },
};
