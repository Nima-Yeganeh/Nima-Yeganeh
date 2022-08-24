
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      answerTicketModel: undefined,
      updateMessages: true,
    };
  },
  created() { 
    console.log("context:", this.context);
  },
  methods: {
    showAnswerTicket() {
      this.answerTicketModel = {
        description: '',
        code: this.context.ticket.ticket_code,
        title: this.context.ticket.title,
      };
    }, 
    async answerTicket() {
      let res = await callStdAPI(this.context.addTicket, {
        method: 'put',
        data: this.answerTicketModel,
      });
      // =>if success
      if (res.status === 200) {
        this.updateMessages = false;
        setTimeout(() => {
          this.updateMessages = true;
        }, 30);
        this.answerTicketModel = undefined;
      } else {
        showErrorToast('مشکلی در ثبت تیکت پیش آمده است!');
      }
    }
  },
  components: {
    'view-tickets': view_tickets,
  },
};
