
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      logs: [],
      stats: [
        {
          color: 'red',
          icon: 'people',
          value: this.context.users,
          label: 'کاربر',
          des: 'تعداد کاربران فعال سیستم',
          button: 'لیست همه کاربران',
          // buttonDisabled: true,
          buttonLink: context.users_page,
        },
        {
          color: 'purple',
          icon: 'online_prediction',
          value: this.context.active_users,
          label: 'کاربر',
          des: 'تعداد کاربران آنلاین سیستم',
          button: 'لیست همه کاربران',
          // buttonDisabled: true,
          buttonLink: context.users_page,
        },
        {
          color: 'yellow',
          icon: 'work',
          value: this.context.active_jobs,
          label: 'آگهی',
          des: 'تعداد آگهی های فعال سیستم',
          button: 'لیست همه آگهی ها',
          buttonLink: context.jobs_page,
        },
        {
          color: 'green',
          icon: 'business',
          value: this.context.active_panel_requests,
          label: 'درخواست',
          des: 'تعداد درخواست های فعال برای پنل حقوقی',
          button: 'لیست درخواست های پنل حقوقی',
          buttonLink: context.tickets_page,
        },
      ],
      log: [
        {
          log_type: 'نوع گزارش',
          id: 'شناسه',
          name: 'نام',
          mode: 'حالت',
          desc1: 'توضیح ۱',
          desc2: 'توضیح ۲',
          time: 'تاریخ',
          user_ip: 'آی پی کاربر',
          user_id: 'شناسه کاربر'
        },
      ],
    };
  },
  created() {
    console.log("context:", this.context);
    this.getlog();
  },
  methods: {
    async getlog() {
      let res = await callStdAPI(this.context.log_API, {
        method: 'post',
        data: {}
      });
      // =>if success
      if (res.status === 200) {
        this.logs = res.data;
      }
    },
    //=> for convert date to persian
    toPersianDate(timestamp) {
      let date = new Date(timestamp)
      persianDate.toLocale('fa');
      return new persianDate(date).format('YYYY/MM/DD');
    },
    // get persian number
    convertNumbersToPersian(str) {
      return convertNumbersToPersian(str);
    },
  },
  components: {},
};
