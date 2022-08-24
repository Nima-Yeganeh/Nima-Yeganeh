
export default {
  props: {
    showAcceptAction: {
      default: false,
    },
    showRejectAction: {
      default: false,
    },

    userId: Number,
    resumeApiUrl: {
      default: '/resume/api/resume/',
    },
  },
  data() {
    return {
      loading: false,
      keyValues: {},
      resumeInfo: {
        basic_info: {},
        skill: [],
        project:[],
        article:[],
        education: [],
        experience: [],
        language: [],
        certficate: [],
      },
      university_name: [],
      fields: [
        {
          subject: 'جنسیت:',
          text: '',
          icon: 'wc',
          name: 'gender',
        },
        {
          subject: 'وضعیت تاهل:',
          text: '',
          icon: 'favorite',
          name: 'marital_status',

        },
        {
          subject: 'وضعیت سربازی:',
          text: '',
          icon: 'person',
          name: 'military_status',

        },
        {
          subject: 'تاریخ تولد:',
          text: '',
          icon: 'calendar_today',
          name: 'birth_date',

        },
        {
          subject: 'کد ملی:',
          text: '',
          icon: 'subtitles',
          name: 'national_code',
        },
        {
          subject: 'حقوق درخواستی:',
          text: '',
          icon: 'monetization_on',
          name: 'salary',
        },
      ],
      salary_ranges: [],
      contact: [
        {
          text: '',
          icon: 'phone_iphone',
          name: 'phone',
        },
        {
          text: '',
          icon: 'email',
          name: 'email',
        },
        {
          text: '',
          icon: 'call',
          name: 'home_phone',

        },
        {
          text: '',
          icon: 'language',
          name: 'website',
        },
        {
          text: '',
          icon: 'place',
          name: 'location',
        },
        {
          text: '',
          icon: 'add',
          name: 'address',
        },
      
      ],
    };
  },
  created() {
    // =>load key values
    this.keyValues = getKeyValues();

    // =>get resume info
    this.getResumeInfo();

    this.get_config('university')
    this.get_config('salary_range')
  },


  methods: {
    parseHtml(html = "") {
      return parseHtml(html)
    },
    async getResumeInfo() {
      this.loading = true;
      // =>get resume info from server
      let res = await callStdAPI(this.resumeApiUrl, {
        method: 'get',
        data: { user_id: this.userId },
      });
      // =>if success
      if (res.status === 200) {
        this.resumeInfo = res.data;
        for (const cert of this.resumeInfo.certificate) {
          // =>if 'other' cert
          if (cert.type === 'other' && cert.settings.file) {
            cert['file_url'] = await getFileUrlById(cert.settings.file);
          }
        }
        this.set_value();
      }
      // console.log(res.data)
      this.loading = false;
    },

    acceptEvent() {
      this.$emit('accept', true);
    },
    rejectEvent() {
      this.$emit('reject', true);
    },
    downloadPDF() {
      // =>set download resume url
      window.open(PUBLIC_URLS.download_resume_url+"?user_id="+this.userId, '_blank');
    },
    //=> set basic info value
    set_value() {
      for (const f of this.fields) {
        if (f.name == "birth_date") {
          if (this.resumeInfo.basic_info[f.name]) {
            f.text = this.toPersianDate(this.resumeInfo.basic_info[f.name])
          }
        }else if(f.name == "salary"){
          let salaryy = this.getKeyValueText(f.name, this.resumeInfo.basic_info[f.name], this.resumeInfo.basic_info[f.name])
          f.text = this.get_salary_ranges(salaryy)
        } else {
          f.text = this.getKeyValueText(f.name, this.resumeInfo.basic_info[f.name], this.resumeInfo.basic_info[f.name])
        }
      }
      for (const c of this.contact) {
        if (c.name == "location") {
          c.text = this.get_loaction(this.resumeInfo.basic_info.location)
        } else {
          c.text = this.resumeInfo.basic_info[c.name]
        }
      }
    },
    //=> for translate value (persian)
    getKeyValueText(namespace, key, def = undefined) {
      if (namespace in this.keyValues) {
        let el = this.keyValues[namespace].find(i => i.value == key);
        if (!el) return def;
        return el.text;
      }
      return def
    },
    //=> for convert date to persian
    toPersianDate(timestamp) {
      let date = new Date(timestamp)
      persianDate.toLocale('fa');
      return new persianDate(date).format('YYYY/MM/DD');
    },

    //=> for write location Continuous
    get_loaction(location) {
      if (location) {

        return location.country + " - " + location.state + " - " + location.city
      }

    },
    //=> for get config from backend
    async get_config(namespace, key = undefined) {
      let data = await getConfig(namespace, key);
      console.log(data.title)
      if (namespace === 'university'){
        this.university_name = data;
      }else{
        this.salary_ranges = data
        this.get_university_name()
      }
    },
    //=> for convert to persian uni name 
    get_university_name(key, def = undefined) {
      let el = this.university_name.find(i => i.key == key);
      if (!el) return def;
      console.log(el)
      return el.value.title;
    },
    get_salary_ranges(key, def = undefined) {
      let el = this.salary_ranges.find(i => i.key == key);
      if (!el) return def;
      console.log(el)
      return el.value;
    }
  },
  components: {},
};
