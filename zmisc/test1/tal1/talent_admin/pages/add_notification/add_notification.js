export default {
  props: {
    context: Object,
  },
  data() {
    return {
      loading: false,
      users: [],
      notifList: [
        {
          title: 'عنوان اعلان',
          name: 'title',
          required: true,
        },
        {
          title: 'متن اعلان',
          name: 'description',
          required: true,
          type: 'textarea',
        },
        {
          title: 'نوع دریافت کننده',
          name: 'receiver',
          type: "select",
          options: [
            {
              text: 'کارفرما',
              value: 'employer',
            },
            {
              text: 'کارجو',
              value: 'applicant',
            },
            {
              text: 'ادمین',
              value: 'admin',
            },
            {
              text: 'همه',
              value: 'all',
            },
            // {
            //   text: 'انتخاب کاربر',
            //   value: 'custom',
            // },
          ],
        },
        // {
        //   title: 'کاربران دریافت کننده',
        //   name: 'user_list',
        //   type: "select",
        //   options: [],
        //   disabled: true,
        //   value: [],
        // },
        {
          title: 'ارسال ایمیل',
          name: 'send_email',
          type: "checkbox",
          value: false,
          grid: 'four',
        },
        {
          title: 'ارسال پیامک',
          name: 'send_sms',
          type: "checkbox",
          value: false,
          grid: 'four',
        }
      ],
    };
  },
  async created() {
    this.getUsersList();
    // this.sendNotification();
  },
  methods: {
    async sendNotification(){
      this.loading = true;
      let data = {}
      for (const f of this.notifList) {
        // =>check required fields
        if (f.required && (!f.value || f.value == '')) {
          showErrorToast('خواهشا فیلد های الزامی رو پر کنید');
          this.loading = false;
          return;
        }
        else {
          // =>set field value
          data[f.name] = f.value;
        }
      }
      // =>send data to server
      let res = await callStdAPI(this.context.add_notification, {
        data: data,
        method: 'post',
      });      
      if (res.status === 200) {
        iziToast.success({ title: 'انجام شد', message: 'اعلان با موفقیت ارسال گردید' });
      }
      else {
        iziToast.warning({ title: 'اعلان ثبت نشد,', message: 'لطفا دوباره تلاش کنید' });
      }
      this.loading = false;
    },
  },
  components: {
    'form-builder': form_builder,
  },
}; 