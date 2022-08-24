
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      statuteHash: '',
      lastEditionHash: '',
      statute_id: 0,
      last_edition_id: 0,
      status: undefined,
      fields: [
        {
          title: "نام شرکت",
          name: "company_name",
          required: true,
          value: '',
          readOnly: false,
        },
        {
          title: "شناسه ملی",
          name: "national_id",
          required: true,
          inputType: "number",
          value: '',
          readOnly: false,
        },
        {
          title: "شناسه ثبت",
          name: "registration_number",
          required: true,
          inputType: "number",
          value: '',
          readOnly: false,
        },
        {
          title: "تاریخ ثبت",
          name: "registration_date",
          required: true,
          type: "date",
          value: '',
        },
        {
          title: "شماره تلفن شرکت",
          name: "company_phone",
          required: true,
          inputType: "number",
          value: '',
          readOnly: false,
        },
        {
          title: "نام و نام‌خانوادگی مدیر عامل",
          name: "CEO_name",
          required: true,
          value: '',
          readOnly: false,
        },
        {
          title: "شماره تلفن همراه مدیر عامل",
          name: "CEO_phone",
          required: true,
          inputType: "number",
          value: '',
          readOnly: false,
        },
        {
          title: "آدرس سایت",
          name: "website_url",
          required: false,
          value: '',
          readOnly: false,
        },
        {
          title: "آدرس",
          name: "address",
          required: true,
          type: 'textarea',
          value: '',
          readOnly: false,
          // grid: 'sixteen',  
        },
      ],
    };
  },

  async created() {
    this.statuteHash = (await callAPI(this.context.panel_file_hash, {}, 'get'))[1].data;
    this.lastEditionHash = (await callAPI(this.context.panel_file_hash, {}, 'get'))[1].data;
  },
  mounted() {
    // console.log(this.context.waiting)
  },
  methods: {
    async uploadStatute() {
      let statute = await this.$refs.panel_request_image_uploader.open({
        uploadHash: this.statuteHash,
        title: 'بارگذاری اساسنامه',
        allowedMimeTypes: ['application/pdf'],
        maxFileSize: 2048000,
      });
      console.log('statute:', statute);
      if (statute.length > 0) {
        let tick = $("#tick")
        tick.attr("src", this.context.tick);
        this.statute_id = statute[0]
        console.log(this.statute_id)

      }
    },
    async uploadLastEdition() {
      let last_edition = await this.$refs.panel_request_image_uploader.open({
        uploadHash: this.lastEditionHash,
        title: 'بارگذاری آخرین تغییرات',
        allowedMimeTypes: ['application/pdf'],
        maxFileSize: 1004800,
      });
      console.log('last_edition:', last_edition);
      if (last_edition.length > 0) {
        let tick = $("#tick1")
        tick.attr("src", this.context.tick);
        this.last_edition_id = last_edition[0]
        console.log(this.last_edition_id)
      }
    },
    async addCompany() {
      let data = {}
      for (const f of this.fields) {
        // =>check required fields
        if (f.required && (!f.value || f.value == '')) {
          showErrorToast('خواهشا فیلد های الزامی رو پر کنید');
          return;
        }
        // =>set field value
        data[f.name] = f.value;
      }
      // =>check if statute updated
      if (!this.statute_id) {
        showErrorToast('لطفا فایل اساسنامه را بارگذاری کنید.');
        return;
      }
      if (this.last_edition_id) {
        data["last_edition"] = this.last_edition_id;
      }
      data["statute"] = this.statute_id;
      data["user_id"] = context.user

      // =>send data to server
      let res = await callStdAPI(this.context.companyApi, {
        method: 'put',
        data: data
      });
      console.log(data)
      // =>if success
      if (res.status === 200) {
        iziToast.success({ title: 'انجام شد', message: 'پنل با موفقیت ثبت شد.' });
        this.status = 'waiting';
      }
      else {
        iziToast.warning({ title: '', message: 'مشکلی در ثبت بوجود آمده است.' });
      }
    },
  },

  components: {
    'form-builder': form_builder,
    'file-uploader': file_uploader,
  },
};