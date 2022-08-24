
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      index: 1,
      size: 10,
      page_counts: 0,
      activeTab: 'all',
      active_coupon: 0,
      coupon: [],
      // choose tabs
      tabs: [
        {
          title: 'همه',
          value: 'all',
        },
        {
          title: 'فعال',
          value: 'active',
        },
        {
          title: 'منقضی شده',
          value: 'expired',
        },
      ],
    };
  },
  created() {
    console.log("context:", this.context);
    this.getCouponList(1);
  },
  methods: {
    // persian calender
    toPersianDate(timestamp) {
      return toPersianDate(new Date(timestamp), 'YYYY/MM/DD');
    },
    // choose tab
    goToTab(tab_id) {
      this.activeTab = tab_id;
      this.getCouponList(1)
    },
    // go to create coupon
    redirect(url) {
      redirect(url)
    },
    // call API
    async getCouponList(event) {
      if (event !== undefined){
        this.index = event;
      }
      let res = await callStdAPI(this.context.coupon_list, {
        method: 'get',
        data: {
          tab: this.activeTab,
          "page_index": this.index,
          "page_size": this.size,
        }
      });
      // =>if success
      if (res.status === 200) {
        console.log('coupon:', res.data);
        this.coupon = res.data.coupon;
        this.active_coupon = res.data.active_num;
        this.page_counts = res.data.page_counts;
      }
    },
    // enable or disable Coupon
    async disableCoupon(coupon) {
      // =>update coupon info
      let res = await callStdAPI(this.context.active_API, {
        method: 'post',
        data: { "code": coupon.code, 'is_active': coupon.is_active },
      });
      // =>if success 
      if (res.status === 200) {
        showSuccessToast(`کوپن با موفقیت بروزرسانی شد`);
        this.getCouponList()
      }
      // =>if failed 
      else {
        showErrorToast('متاسفانه بروزرسانی کوپن با خطا مواجه شد');
      }
    },
  },
  components: {
    'pagination': pagination,
  },
};
