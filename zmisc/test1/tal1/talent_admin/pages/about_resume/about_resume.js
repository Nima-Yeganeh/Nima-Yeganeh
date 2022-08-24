export default {
  props: {
    context: Object,
  },
  data() {
    return {
      form: [
        {
          title: "",
          name: "description",
          type: "textarea",
          value: "",
          editorMode: "advanced",
          grid: "sixteen",
        },
      ],
    };
  },
  created() {
    console.log("context:", this.context);
  },
  
  methods: {
    async editConfig() {
      // =>send edited to server
      let res = await callStdAPI(this.context.get_configs_api, {
        method: "post",
        data: {
          namespace: "resume",
          key: "about",
          data_type: "string",
          value: this.form[0].value,
        },
      });
      // =>if success
      if (res.status === 200) {
        iziToast.success({
          title: "ثبت شد",
          message: "توضیحات شما با موفقیت ثبت شد",
        });
      }
    },
  },
  components: {
    "form-builder": form_builder,
  },
};
