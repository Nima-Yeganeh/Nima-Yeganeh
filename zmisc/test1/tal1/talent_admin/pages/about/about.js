
export default {
  props: {
    context: Object,
  },
  data() {
    return {};
  },
  created() {
    console.log("context:", this.context);
  },
  methods: {
    async delete_cache(){
      let res = await callStdAPI(this.context.delete_cache_api, {
        method: "post",
        data: {
        },
      });
      // =>if success
      if (res.status === 200) {
        iziToast.success({title: "", message: "پاک کردن کش با موفقیت انجام شد."});
      }
    }
  },
  components: {},
};
