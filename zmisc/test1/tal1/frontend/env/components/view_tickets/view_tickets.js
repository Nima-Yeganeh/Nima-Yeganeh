
export default {
  props: {
    ticketCode: String,
    userId: Number,
    userAs: {
      default: 'user' // or 'admin'
    },
  },
  data() {
    return {
      loading: true,
      ticketMessagesApi: '/ticket/api/messages',
      messages: [],
      supportAvatar: '/static/base/img/default-user-avatar.webp',
      files: [],
    };
  },
  created() {
    console.log('changed tidiehukehucehudccket code:');
    console.log('changed ticket code:', this.ticketCode, this.userId);
    this.getTicketMessages();
  },
  methods: {
    
    async getTicketMessages() {
      this.loading = true;
      // =>check if empty ticket code
      if (!this.ticketCode || this.ticketCode === '') return;
      // =>get ticket messages by code
      let res = await callStdAPI(this.ticketMessagesApi, {
        method: 'get',
        data: {
          code: this.ticketCode,
        }
      });
      // =>if success
      if (res.status === 200) {
        console.log('messages:', res.data);
        this.messages = res.data;
        this.files = res.data[0].files;
      }
      this.loading = false;
    },
    userAvatar(message) {
      // =>if this user as 'user'
      if (this.userAs === 'user') {
        if (this.userId === message.created_by) {
          return message.user_avatar;
        }
        else {
          return this.supportAvatar;
        }
      }
      // =>if this user as 'admin'
      if (this.userAs === 'admin') {
        return message.user_avatar;
      }
    },
    userName(message) {
      // userId == m.created_by ? username : 'پشتیبان'
      // =>if this user as 'user'
      if (this.userAs === 'user') {
        if (this.userId === message.created_by) {
          return message.created_by_email;
        }
        else {
          return 'پشتیبان';
        }
      }
      // =>if this user as 'admin'
      if (this.userAs === 'admin') {
        return message.created_by_email;
      }
    },
    toPersianDate(date) {
      return toPersianDate(new Date(date),'YYYY/MM/DD'); 
    }
  },
  watch: {
    ticketCode:  function(newVal, oldVal) {
      console.log('changed ticket code:', newVal);
      this.ticketCode = newVal; 
      this.getTicketMessages();
    }
  },
  components: {},
};
