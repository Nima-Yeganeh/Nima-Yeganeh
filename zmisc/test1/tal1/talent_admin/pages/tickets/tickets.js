
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
      tickets: [],
      activeTab: 'all',
      tabs: [
        {
          value: 'all',
          title: 'همه',
        },
        {
          value: 'panel_request',
          title: 'درخواست پنل کارفرما',
        },
        {
          value: 'consultation_request',
          title: 'درخواست مشاوره',
        },
        {
          value: 'waiting',
          title: 'درخواست های پاسخ داده نشده',
        },
        // {
        //   value: 'active',
        //   title: 'تایید شده',
        //   // disabled: true,
        // },
        // {
        //   value: 'reject',
        //   title: 'رد شده',
        //   // disabled: true,
        // },
        // {
        //   value: 'expired',
        //   title: 'منقضی شده',
        //   // disabled: true,
        // },
      ],
    };
  },
  created() {
    console.log("context:", this.context);
    this.loadTickets(1);
  },
  methods: {
    selectTab(tab) {
      if (tab.disabled) return;
      this.activeTab = tab.value;
      this.loadTickets(1);
    },
    async loadTickets(event) {
      this.loading = true;
      if (event !== undefined){
        this.index = event
      }
      this.tickets = [];
      let res = await callStdAPI(this.context.ticketsApi, {
        method: 'get',
        data: { 
          type: this.activeTab,
          "page_index": this.index,
          "page_size": this.size,
         }
      });
      // =>if success
      if (res.status === 200) {
        this.tickets = res.data.tickets;
        this.page_counts = res.data.page_counts;
        this.loading = false
      } 
    },
    viewTicket(ticket) {
      window.location.href = this.context.viewTicket + '?code=' + ticket.ticket_code; 
    },
    toPersianDate(date) {
      return toPersianDate(new Date(date),'YYYY/MM/DD');
    },
    convertNumbersToPersian(num){
      return convertNumbersToPersian(num);
    }
  },
  components: {
    'pagination': pagination,
  },
};
