
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      keyValues: {},
      loading: false,
      fields: [
        {
          subject: "دسته بندی شغلی",
          name: "job_category",
          icon: "view_list",
          text: "_",
        },
        {
          subject: "محدوده حقوق",
          name: "income",
          icon: "monetization_on",
        },
        {
          subject: "موقعیت مکانی",
          icon: "place",
          text: this.context.job_details.settings.location,
          type: 'location',
        },
        {
          subject: "سفر کاری",
          icon: "flight_takeoff",
          text: getKeyValueText('business_trip', this.context.job_details.settings.business_trip),
          keyValue: 'business_trip',
        },
        {
          subject: "نوع همکاری",
          icon: "work",
          text: getKeyValueText('cooperate', this.context.job_details.settings.cooperate),
          keyValue: 'cooperate',

        },
        {
          subject: "ساعت و روز کاری",
          icon: "schedule",
          text: this.context.job_details.settings.worktime,
        },
        {
          subject: "جنسیت",
          icon: "person",
          text: getKeyValueText("job_gender", this.context.job_details.settings.gender),
          keyValue: 'job_gender',
        },
        {
          subject: "آگهی فوری",
          icon: "star",
          text: this.context.job_details.is_starred,
          type: 'toggle',
        },
        {
          subject: "وضعیت نظام وظیفه",
          icon: "local_police",
          text: getKeyValueText('military_status', this.context.job_details.settings.experience),
          keyValue: 'military_status',
        },
        {
          subject: "حداقل مدرک تحصیلی",
          icon: "school",
          text: getKeyValueText('degree_level', this.context.job_details.settings.education),
          keyValue: 'degree_level',
        },
        // {
        //   subject: "حداقل سابقه کار در شغل مشابه",
        //   icon: "card_travel",
        //   text: this.context.job_details.settings.work_resume,
        // },
        {
          subject: "وضعیت تحصیلی",
          icon: "location_city",
          text: getKeyValueText('education_status', this.context.job_details.settings.education_status),
          keyValue: 'education_status',
        },
        {
          subject: "مهارت های مورد نیاز",
          icon: "handyman",
          text: this.context.job_details.settings.skills,
          type: 'list'
        },
        {
          subject: "زبان ها",
          icon: "translate",
          text: this.context.job_details.settings.languages,
          type: 'language'
        },
        {
          subject: "داشتن ویژگی های زیر مزیت حساب می شوند",
          icon: "star",
          text: this.context.job_details.settings.more_skills,
          type: 'list'
        },
        {
          subject: "مزایای این شغل",
          icon: "done",
          text: this.context.job_details.settings.position_benefits,
          type: 'list'
        },
        {
          subject: "شرح موقعیت شغلی",
          text: parseHtml(this.context.job_details.description),
          type: 'text',
        },
      ],
      notifList: [
        {
          title: 'عنوان اعلان',
          name: 'title',
          value: 'آگهی ' + this.context.job_details.title + ' تایید نشد.',
          readOnly: true,
          grid: 'sixteen',
        },
        {
          name: 'receiver',
          value: 'custom',
          hidden: true,
        },
        {
          name: 'user_list',
          value: [this.context.job_details.company.user_id],
          hidden: true,
        },
        {
          title: 'متن اعلان',
          name: 'description',
          required: true,
          type: 'textarea',
          grid: 'sixteen',
        },
        {
          title: 'ارسال ایمیل',
          name: 'send_email',
          type: "checkbox",
          value: false,
          grid: 'four',
        },
        {
          title: 'ارسال پیامک',
          name: 'send_sms',
          type: "checkbox",
          value: false,
          grid: 'four',
        }
      ],
      coursesList: [],
      courseSearchName: '',
      selectedCourseIds: [],
    };
  },
  async created() {
    // =>load key values
    this.keyValues = getKeyValues();
    // this.job_category();
    for (const f of this.fields) {
      // =>check for disabled field
      if (f.text == 'no_matter' || (f.type == 'list' && f.text.length == 0) || f.text === undefined || f.text === null || f.text === '') {
        f.disabled = true;
        continue;
      }
      // if (f.keyValue) {
      //   let tmp = this.keyValues[f.keyValue].find(i => i.value === f.text);
      //   if (!tmp) f.disabled = true;
      //   f.text = tmp.text;
      // }
    }
    // =>load courses list
    this.getCourses();
    this.job_category = await getConfig('job', this.context.job_details.category);
    this.fields.find(i => i.name === 'job_category').text = this.job_category.title
    if (this.context.job_details.income === null) {
      this.fields.find(i => i.name === 'income').text = 'توافقی'
    }
    else {
      this.fields.find(i => i.name === 'income').text = this.context.job_details.income + 'تومان'
    }
  },
  methods: {
    // show modal 
    showModal() {
      $('.ui.modal')
        .modal('show');
    },
    async getCourses() {
      this.coursesList = [];
      // =>call api
      let res = await callStdAPI(this.context.courses_api, {
        method: 'get',
        data: {
          search: this.courseSearchName,
          page_size: 10,
        }
      });
      // =>if success
      if (res.status === 200) {
        this.selectedCourseIds = this.context.job_details.settings.related_course_ids ? this.context.job_details.settings.related_course_ids : [];
        this.coursesList = res.data;
      }
    },
    getKeyValueText(namespace, key, def = undefined) {
      return getKeyValueText(namespace, key, def);
    },
    // toggleSelectCourse(course) {
    //   if (this.checkSelectedCourse(course)) {
    //     this.selectedCourseIds.splice(this.selectedCourseIds.indexOf(course.id), 1);  
    //   } else {
    //     this.selectedCourseIds.push(course.id);
    //   }
    // },
    // checkSelectedCourse(course) {
    //   return this.selectedCourseIds.includes(course.id)
    // },
    async action(status = 'active') {
      // =>call api
      let res = await callStdAPI(this.context.job_action_api, {
        method: 'post',
        data: {
          id: this.context.job_details.pk,
          status: status,
          related_course_ids: this.selectedCourseIds,
        }
      });
      // =>if success
      if (res.status === 200) {
        // =>redirect to jobs list
        window.location.href = this.context.jobs_list;
      }
      // =>if failed
      else {
        showErrorToast('مشکلی در ثبت اطلاعات بوجود آمده است.');
      }
    },
    async sendNotification(){
      this.loading = true;
      let data = {}
      for (const f of this.notifList) {
        // =>check required fields
        if (f.required && (!f.value || f.value == '')) {
          showErrorToast('خواهشا فیلد های الزامی رو پر کنید');
          this.loading = false;
          return;
        }
        else {
          // =>set field value
          data[f.name] = f.value;
        }
      }
      // =>send data to server
      let res = await callStdAPI(this.context.add_notification, {
        data: data,
        method: 'post',
      });      
      if (res.status === 200) {
        iziToast.success({ title: 'انجام شد', message: 'اعلان با موفقیت ارسال گردید' });
        this.action('reject');
      }
      else {
        iziToast.warning({ title: 'اعلان ثبت نشد,', message: 'لطفا دوباره تلاش کنید' });
      }
      this.loading = false;
    },
    parseHtml(html = "") {
      return parseHtml(html)
    },
  },
  components: {
    'form-builder': form_builder,
    'related-courses': related_courses
  },
};
