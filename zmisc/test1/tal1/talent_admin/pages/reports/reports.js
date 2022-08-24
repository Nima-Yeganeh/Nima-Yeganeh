
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      loading: false,
      payment: {},
      page_counts: undefined,
      total_price: undefined,
      total_payment: undefined,
      index: 1,
      size: 10,
    };
  },
  async created() {
    this.getPayment();
  },
  methods: {
    async getPayment(event) {
      this.loading = true;
      if (event !== undefined){
        this.index = event
      }
      let res = await callStdAPI(this.context.payment, {
        method: 'get',
        data: {
          "page_index": this.index,
          "page_size": this.size,
        }
      });
      // =>if success
      if (res.status === 200) {
        this.payment = res.data.payment;
        this.page_counts = res.data.page_counts;
        this.total_price = res.data.total_price;
        this.total_payment = res.data.total_payment;
        this.loading = false;
      }
    },
    toPersianDate(timestamp) {
      let date = new Date(timestamp)
      persianDate.toLocale('fa');
      return new persianDate(date).format('YYYY/MM/DD');
    },
    // get persian number
    humanizePrice(str) {
      return humanizePrice(str);
    },
  },
  components: {
    'pagination': pagination,
  },
};