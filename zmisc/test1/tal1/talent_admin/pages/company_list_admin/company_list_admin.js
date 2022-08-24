
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      index: 1,
      size: 10,
      page_counts: 0,
      loading: false,
    };
  },
  created() {
    console.log("context:", this.context);
    this.companyListAdmin(1);
  },
  methods: {
    async companyListAdmin(event) {
      if (event !== undefined){
        this.index = event;
      }
      this.loading = true;
      this.company = [];
      let res = await callStdAPI(this.context.companyApi, {
        method: 'get',
        data: {
          "page_index": this.index,
          "page_size": this.size,
        }
      });
      // =>if success
      if (res.status === 200) {
        this.company = res.data.companies;
        this.page_counts = res.data.page_counts;
        this.loading = false
      } 
      console.log("company", this.company)
    },
    // change html value to text
    // parseHtml(html = "") {
    //   return parseHtml(html)
    // },
    short(text) {
      if (!text) return '';
      if (text.length > 105) {
        // console.log(text, typeof text)
        return text.substring(0, 100) + '<p>...</p>';
      }
      return parseHtml(text);
    },
    async disableCompany(company) {
      // =>update coupon info
      let res = await callStdAPI(this.context.companyApi, {
        method: 'post',
        data: { "company_id": company.pk, 'active': company.is_active },
      });
      // =>if success 
      if (res.status === 200) {
        showSuccessToast(`شرکت با موفقیت بروزرسانی شد`);
        this.companyListAdmin()
      }
      // =>if failed 
      else { 
        showErrorToast('متاسفانه بروزرسانی شرکت با خطا مواجه شد');
      }
    },
    redirect(url, pk) {
      redirect(url, pk)
    }, 
    async downloadAttach(event){
      let url = await getFileUrlById(event)
      window.open(url, "_blank");
    }
  },
  components: {
    'pagination': pagination,
  },
}; 
