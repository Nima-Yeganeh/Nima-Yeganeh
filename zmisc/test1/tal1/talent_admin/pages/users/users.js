
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      users: [],
      showAddUser: false,
      addUserModel: {
        role: 'applicant',
        email: '', 
        phone: '',
        is_admin: false,
        password: '',
      },
      searchInput: '',
      index: 1,
      size: 10,
      page_counts: 0,
      selectedRole: '',
    };
  },
  created() {
    this.getUsersList(1);
  },
  methods: {
    async getUsersList(event) {
      this.index = event === undefined ? this.index : event
      console.log("role", this.selectedRole)
      setTimeout(async () => {
        let res = await callStdAPI(this.context.users_list_api, {
          method: 'get',
          data: {
            search: this.searchInput.trim(),
            'role': this.selectedRole,
            "page_index": this.index,
            "page_size": this.size,
          }
        });
        // =>if success
        if (res.status === 200) {
          this.users = res.data.users;
          this.page_counts = res.data.page_counts;
          // =>normalize users
          let now = new Date().getTime();
          for (const user of this.users) {
            // =>check user is online (less than 15s)
            user['is_online'] = (now - user.last_activity) <= 15 * 1000; 
          }
        }        
      }, 30);
    },
    async filterUsers(event){
      this.page_counts = 0
      this.selectedRole = event.target.value === "all" ? "" : event.target.value
      this.getUsersList(1)
    },
    async addUser() {
      if (!this.showAddUser) {
        this.showAddUser = true;
        setTimeout(() => {
          $('.ui.dropdown').dropdown();
        }, 30);
      }
      // =>add user
      else {
        let res = await callStdAPI(this.context.users_list_api, {
          method: 'post',
          data: this.addUserModel,
        });
        // =>if success 
        if (res.status === 200) {
          // this.showAddUser = false;
          showSuccessToast('کاربر جدید با موفقیت افزوده شد!');
          this.getUsersList();
          this.reset_addUserModel();
        }
        // =>if failed
        else {
          showErrorToast('مشکلی در افزودن کاربر پیش آمده است.', 'لطفا چند لحظه بعد مجددا امتحان کنید.');
        }
      }
    },
    reset_addUserModel(){
      this.addUserModel = {
        role: 'applicant',
        email: '', 
        phone: '',
        is_admin: false,
        password: '',
      }
      this.showAddUser = false
    },
    async updateUser(user) {
      console.log("role1:", user.role)
      setTimeout(async () => {
        // =>find user by id
        user = this.users.find(i => i.pk === user.pk);
        console.log("role2:", user.role)
        // =>update user info
        let res = await callStdAPI(this.context.users_list_api, {
          method: 'put',
          data: user,
        });
        // =>if success 
        if (res.status === 200) {
          showSuccessToast(`کاربر  ${user.get_full_name} با موفقیت بروز شد.`);
        }
        // =>if failed 
        else {
          showErrorToast('مشکلی در بروز رسانی کاربر پیش آمده است.', 'لطفا چند لحظه بعد مجددا امتحان کنید.');
        }
      }, 30);
    },
    redirect(user) {
      let url = context.make_employer_url + '?user_id=' + user.pk;
      redirect(url) 
    },
  },
  components: {
    'pagination': pagination
  },
};
