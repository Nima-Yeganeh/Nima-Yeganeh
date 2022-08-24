
      
   <template>
      <div>
         <!-- tickets -->
<div class="ui comments">
    <!-- loading -->
    <div class="ui active inverted dimmer" v-if="loading">
        <div class="ui text loader">بارگذاری</div>
    </div>
    <!-- ticket details -->
    <div v-for="m in messages" class="comment" :class="{'you': userId == m.created_by}">
        <div class="align-text">
            <!-- user profile -->
            <div class="avatar" :style="{'background-image': 'url(' + userAvatar(m)+')'}"></div>
            <div class="content">
                <a class="author">{{userName(m)}}</a>
                <div class="metadata">
                    <span class="date">{{toPersianDate(m.created_at)}}</span>
                </div>
                <!-- ticket detail -->
                <div class="text">
                    {{m.description}}
                </div>
            </div>
        </div>
        <!-- download link -->
        <div class="attachment" v-if="m.files.length > 0">
            <a class="ui violet basic button" target="_blank" :href="m.files[0]" data-tooltip="ضمیمه"><i
                    class="download icon"></i></a>
        </div>
    </div>
</div>
      </div>
   </template>
   
   <script>
      
      
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

   </script>

   <style scoped>
      .ticket-header {
  display: flex;
  align-items: center;
}

.ticket-header h2 {
  flex: 1 1 0;
}

#ticket_details {
  width: 93% !important;
  margin-left: 80px !important;
}

.comments {
  max-width: unset !important;
  display: flex;
  flex-direction: column;
  margin-top: 25px !important;
}
.comments .comment {
  margin-top: 20px !important;
  padding-bottom: 20px !important;
  border-bottom: 0.5px solid #cfcfcf;
  margin-bottom: -1px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.comments .comment .align-text {
  display: flex;
  flex-direction: row;
}
.comments .comment .avatar {
  width: 2.5em;
  height: 2.5em;
  border-radius: 50%;
  float: right;
  margin: 0.2em 0 0;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.attachment a i {
  margin: 0px !important;
}

.comments .comment.you {
  display: flex;
  direction: ltr;
}
.comments .comment.you .avatar {
  margin-right: 10px;
}

/* responsive */
@media only screen and (max-width: 700px) {
  .comment {
    flex-direction: column !important;
  }
}

   </style>
    
  
   