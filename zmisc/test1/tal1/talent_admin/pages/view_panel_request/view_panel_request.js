
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      fields: [
        {
          title: 'نام شرکت',
          value: this.context.ticket.settings.company_name,
        },
        {
          title: 'شناسه ملی',
          value: this.context.ticket.settings.national_id,
        },
        {
          title: 'شناسه ثبت',
          value: this.context.ticket.settings.registration_number,
        },
        {
          title: 'تاریخ ثبت',
          value: this.context.ticket.settings.registration_date,
        },
        {
          title: 'شماره تلفن شرکت',
          value: this.context.ticket.settings.company_phone,
        },
        {
          title: 'نام و نام‌خانوادگی مدیر عامل',
          value: this.context.ticket.settings.CEO_name,
        },
        {
          title: 'شماره تلفن همراه مدیر عامل',
          value: this.context.ticket.settings.CEO_phone,
        },
        {
          title: 'آدرس وبسایت',
          value: this.context.ticket.settings.website_url,
        },
        {
          title: 'آدرس',
          value: this.context.ticket.settings.address,
        },
      ],
      files: this.context.ticket.settings.statute,
      filePaths: [],
    };
  },
  async created() {
    console.log("context:", this.context);
    // =>load file paths, if exist
    // if (this.files && this.files.length > 0) {
    //   for (const f of this.files) {
    //     let res = await callStdAPI(this.context.uploadFileApi, { method: 'get', data: { id: f } });
    //     if (res.status === 200) {
    //       this.filePaths.push(res.data);
    //     }
    //   }
    //   console.log('file paths:', this.filePaths)
    // }
    let registration_date = this.fields.find((i) => i.title === "تاریخ ثبت")
    registration_date.value = toPersianDate(new Date( registration_date.value ),"YYYY/MM/DD");
    if (this.filePaths){
      this.filePaths.push(await getFileUrlById(this.files))
      if(this.context.ticket.settings.last_edition){
        this.filePaths.push(await getFileUrlById(this.context.ticket.settings.last_edition))
      } 
    }
  
  },

  methods: {
    async action(status = 'accept') {
      // =>call api
      let res = await callStdAPI(this.context.ticketsApi, {
        method: 'post',
        data: {
          code: this.context.ticket.ticket_code,
          answer: status,
        }
      });
      // =>if success
      if (res.status === 200) {
        // =>redirect to tickets list
        window.location.href = this.context.ticketsList;
      }
      // =>if failed
      else {
        showErrorToast('مشکلی در ثبت اطلاعات بوجود آمده است.');
      }
    },
  },
  components: {},
};
