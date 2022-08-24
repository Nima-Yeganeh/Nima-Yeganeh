
      
   <template>
      <div>
         <div class="ui segment placeholder main-res">
    <div class="ui active inverted dimmer" v-if="loading">
        <div class="ui text loader">بارگذاری</div>
    </div>
    <div class="resume" v-if="!loading">
        <h2 class="ui header">
            <img class="person-photo" :src="resumeInfo.basic_info.user_avatar">
            <div class="content">
                {{resumeInfo.basic_info.full_name}}
                <div class="sub header">{{resumeInfo.basic_info.job_title}}</div>
            </div>
            <div class="actions">
                <div class="ui labeled icon green button" @click="acceptEvent()" v-if="showAcceptAction">
                    <i class="check icon"></i>
                    تایید
                </div>
                <div class="ui labeled icon red button" @click="rejectEvent()" v-if="showRejectAction">
                    <i class="close icon"></i>
                    رد
                </div>
                <div class="ui labeled icon green button" @click="downloadPDF()">
                    <i class="download icon"></i>
                    دانلود
                </div>
            </div>
        </h2>
        <div class="resume-info" v-if="!loading">
            <div class="right">
                <div class="phone-resume">
                    <h3>اطلاعات تماس:</h3>
                    <template v-for="item in contact" v-if="item.text !== '' && item.text !== undefined ">
                        <div class="individual-info" >
                            <i class="material-icons" v-text="item.icon"></i>
                            <p class="text" v-text="item.text"></p>
                        </div>
                    </template>
                </div>
                <div class="person-resume">
                    <div class="ui clearing divider divider-resume"></div>
                    <h3>اطلاعات فردی:</h3>
                    <template v-for="item in fields">
                        <div class="contact-info" v-if="item.text !== ''">
                            <div class="icon-sub">
                                <i class="material-icons" v-text="item.icon"></i>
                                <p class="subject" v-text="item.subject"></p>
                            </div>
                            <p class="text" v-text="item.text"></p>
                        </div>
                    </template>
                </div>
                <div>
                    <template v-if="resumeInfo.skill && resumeInfo.skill.length > 0">
                        <div class="ui clearing divider divider-resume"></div>
                        <h3>مهارت ها:</h3>
                        <div class="skill-info" v-for="item in resumeInfo.skill">
                            <div class="icon-sub">
                                <p class="subject" v-text=" item.title"></p>
                            </div>
                            <p class="text" v-text="getKeyValueText('skill_levels',item.level,item.level)"></p>
                        </div>
                    </template>
                </div>
                <div>
                    <template v-if="resumeInfo.language && resumeInfo.language.length > 0">
                        <div class="ui clearing divider divider-resume"></div>
                        <h3>زبان ها</h3>
                        <div class="lang-info" v-for="item in resumeInfo.language">
                            <div class="icon-sub">
                                <p class="subject" v-text="getKeyValueText('language_names',item.title,item.title)"></p>
                            </div>
                            <p class="text" v-text="getKeyValueText('language_levels',item.level,item.level)"></p>
                        </div>
                    </template>
                </div>
                <div>
                    <template
                        v-if="resumeInfo.basic_info.settings && resumeInfo.basic_info.settings.socials && resumeInfo.basic_info.settings.socials.length > 0">
                        <div class="ui clearing divider divider-resume"></div>

                        <h3>شبکه های اجتماعی</h3>
                        <div class="social-media" v-for="item in resumeInfo.basic_info.settings.socials">
                            <i :class="[item.type]" class="icon"></i>
                            <p class="text" v-text="item.link"></p>
                        </div>

                    </template>
                </div>
            </div>

            <div class="left">
                <div class="both-left">

                    <div class="ui grey segment about-me"
                        v-if="resumeInfo.basic_info.about_me && resumeInfo.basic_info.about_me.length > 0">
                        <h3>درباره من</h3>
                        <p v-html="parseHtml(resumeInfo.basic_info.about_me)"></p>
                    </div>
                    <div class="res-card">
                        <!-- expreinces -->
                        <div class="ui purple segment job"
                            v-if="resumeInfo.experience && resumeInfo.experience.length > 0">

                            <h3>سابقه شغلی</h3>
                            <ul v-for="item in resumeInfo.experience" class="ui grid segment">
                                <li class="eight wide column edu-list">
                                    <h4>سمت:</h4>
                                    <p v-text="item.job_side"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>شرکت/موسسه:</h4>
                                    <p v-text="item.department_name"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>موقعیت مکانی:</h4>
                                    <p v-text="get_loaction(item.location)"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>تاریخ آغاز:</h4>
                                    <p v-text="toPersianDate(item.start_date)"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>تاریخ فراغت:</h4>
                                    <p>
                                        <template v-if="!item.settings.busy_now">
                                            {{toPersianDate(item.end_date)}}
                                        </template>
                                        <template v-if="item.settings.busy_now">
                                            مشغول به کار
                                        </template>
                                    </p>
                                </li>
                                <li v-if="item.settings" class="eight wide column edu-list">
                                    <h4>توضیحات:</h4>
                                    <p v-html="parseHtml(item.settings.des)"></p>
                                </li>
                            </ul>
                        </div>
                        <!-- educations -->
                        <div class="ui yellow segment edu"
                            v-if="resumeInfo.education && resumeInfo.education.length > 0">
                            <h3>سابقه تحصیلی</h3>
                            <ul v-for="item in resumeInfo.education" class="ui grid segment">
                                <li class="eight wide column edu-list">
                                    <h4>رشته:</h4>
                                    <p v-text="item.title"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>گرایش:</h4>
                                    <p v-text="item.field"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>مقطع:</h4>
                                    <p v-text="getKeyValueText('degree_level',item.degree_level,item.degree_level)"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>نوع دانشگاه:</h4>
                                    <p
                                        v-text="getKeyValueText('university_type',item.settings.university_type,item.settings.university_type) ">
                                    </p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>نام دانشگاه:</h4>
                                    <p v-text="get_university_name(item.settings.university,item.settings.university)">
                                    </p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>موقعیت مکانی:</h4>
                                    <p v-text="get_loaction(item.location)"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>معدل:</h4>
                                    <p v-text="item.settings.grade"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>تاریخ آغاز:</h4>
                                    <p v-text="toPersianDate(item.start_date)"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>تاریخ فراغت:</h4>
                                    <p>
                                        <template v-if="!item.settings.busy_now">
                                            {{toPersianDate(item.end_date)}}
                                        </template>
                                        <template v-if="item.settings.busy_now">
                                            در حال تحصیل
                                        </template>
                                    </p>
                                </li>
                            </ul>
                        </div>
                        <!-- project -->
                        <div class="ui blue segment edu"
                            v-if="resumeInfo.project && resumeInfo.project.length > 0">
                            <h3>پروژه ها</h3>
                            <ul v-for="item in resumeInfo.project" class="ui grid segment">
                                <li class="eight wide column edu-list">
                                    <h3>عنوان پروژه:</h3>
                                    <h5 v-text="item.title" style="margin-top: 0;"></h5>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>کارفرما:</h4>
                                    <p v-text="item.settings.employee"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>تاریخ:</h4>
                                    <p>{{toPersianDate(item.settings.date)}}</p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>لینک:</h4>
                                    <p v-text="item.settings.link"></p>
                                </li>
                                <li class="sixteen wide column edu-list">
                                    <h4>توضیحات:</h4>
                                    <p v-html="parseHtml(item.settings.des)"></p>
                                </li>
                
                            </ul>
                        </div>
                        <!-- article -->
                        <div class="ui brown segment edu"
                            v-if="resumeInfo.article && resumeInfo.article.length > 0">
                            <h3>تحقیقات و مقالات</h3>
                            <ul v-for="item in resumeInfo.article" class="ui grid segment">
                                <li class="eight wide column edu-list">
                                    <h4>عنوان:</h4>
                                    <p v-text="item.title"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>ناشر:</h4>
                                    <p v-text="item.settings.publisher"></p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>تاریخ:</h4>
                                    <p>{{toPersianDate(item.settings.date)}}</p>
                                </li>
                                <li class="eight wide column edu-list">
                                    <h4>لینک:</h4>
                                    <p v-text="item.settings.link"></p>
                                </li>
                                <li class="sixteen wide column edu-list">
                                    <h4>توضیحات:</h4>
                                    <p v-html="parseHtml(item.settings.des)"></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- certificates -->
                    <div class="ui green segment edu"
                        v-if="resumeInfo.certificate && resumeInfo.certificate.length > 0">
                        <h3>گواهینامه ها</h3>
                        <div class="ui two column padded stackable grid ">
                            <div class=" column " v-for="cert in resumeInfo.certificate">
                                <div class="ui  segment" v-if="cert.type=='ifc'"
                                    style="min-width: 200px;min-height: 115px; text-align: center;">
                                    <p>{{cert.title}}</p>
                                    <div class="ui label">{{cert.certificate_code}}</div>
                                    <div class="ui teal  label">{{cert.settings.certificateTypeName}}</div>
                                </div>
                                <div class="ui  segment" v-if="cert.type=='other'"
                                    style="min-width: 200px;text-align: center;">
                                    <p>{{cert.title}}</p>
                                    <div class="ui label">{{cert.settings.institution_name}}</div>
                                    <div class="ui teal  label">{{cert.settings.year}}</div>
                                    <a class="ui red label" target="_blank" :href="cert.file_url"
                                        v-if="cert.settings.file">دانلود فایل گواهینامه</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>

</div>
      </div>
   </template>
   
   <script>
      
      
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

   </script>

   <style scoped>
      .main-res {
  border-radius: 24px !important;
  min-width: 60em;
  margin-top: 30px;
  background-color: #fafafa;
}

.resume {
  width: 100%;
  display: flex;
  flex-direction: column;
  border-radius: 6px;
}
.resume .header {
  display: flex;
  align-items: stretch;
}
.resume .header .content {
  flex: 1 1 0;
}
.resume .header .actions {
  display: flex;
  align-items: center;
}
.resume .header .actions .button {
  margin: 0 3px;
  display: flex;
  align-items: center;
  min-height: 26px;
}

.resume-info {
  display: flex;
  flex-direction: row;
}
.resume-info .right {
  min-width: 30%;
  max-width: 30%;
  border-left: 2px solid #dfdfe0;
  padding: 2%;
}
.resume-info .right .individual-info {
  margin-bottom: 8%;
  display: flex;
  flex-direction: row;
}
.resume-info .right .individual-info i {
  font-size: 20px !important;
  margin-left: 2%;
}
.resume-info .right .contact-info,
.resume-info .right .skill-info,
.resume-info .right .lang-info {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  width: 100%;
  margin-bottom: 8%;
}
.resume-info .right .contact-info .icon-sub,
.resume-info .right .skill-info .icon-sub,
.resume-info .right .lang-info .icon-sub {
  display: flex;
  flex-direction: row;
  width: 100%;
}
.resume-info .right .contact-info .icon-sub .subject,
.resume-info .right .skill-info .icon-sub .subject,
.resume-info .right .lang-info .icon-sub .subject {
  margin-right: 3%;
}
.resume-info .right .contact-info .icon-sub p,
.resume-info .right .skill-info .icon-sub p,
.resume-info .right .lang-info .icon-sub p {
  font-size: 12px;
  font-weight: 700;
}
.resume-info .right .contact-info .text,
.resume-info .right .skill-info .text,
.resume-info .right .lang-info .text {
  font-size: 11px;
  width: 100%;
  display: flex;
  justify-content: flex-end;
}
.resume-info .right .social-media {
  display: flex;
  flex-direction: row;
  margin-bottom: 8%;
}
.resume-info .right .social-media i {
  font-size: 18px;
  margin-left: 3%;
}
.resume-info .left {
  width: 70%;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}
.resume-info .left .about-me {
  padding: 4%;
  margin: 2%;
  min-height: 160px;
  border-radius: 12px;
}
.resume-info .left .both-left {
  display: flex;
  flex-direction: column;
}
.resume-info .left .both-left .edu {
  padding: 2%;
  margin: 2%;
  min-height: 100px;
  border-radius: 12px;
}
.resume-info .left .both-left .edu-list {
  display: flex;
  justify-content: flex-start;
  flex-direction: row;
  align-items: baseline;
  overflow: hidden;
}
.resume-info .left .both-left .edu-list h4 {
  font-size: 12px;
  font-weight: 700;
  margin-left: 4%;
}
.resume-info .left .both-left .edu-list h3 {
  margin-left: 4%;
}
.resume-info .left .both-left .job {
  padding: 2%;
  margin: 2%;
  min-height: 100px;
  border-radius: 12px;
  overflow: hidden;
}
.resume-info .left .both-left .job h4 {
  font-size: 12px;
  font-weight: 700;
}

.person-photo {
  width: 60px !important;
  height: 60px !important;
  border-radius: 100% !important;
  object-fit: cover !important;
}

@media only screen and (max-width: 980px) {
  .main-res {
    min-width: 20%;
    margin-top: 30px !important;
  }

  .resume {
    min-width: 20em;
  }

  .header {
    align-items: center !important;
  }
  .header .actions {
    align-items: stretch !important;
    flex-direction: column !important;
  }
  .header .actions .button {
    margin: 3px 3px !important;
  }

  .resume-info {
    flex-direction: column;
  }

  .right {
    min-width: 100% !important;
    border-left: none !important;
  }

  .left {
    min-width: 100%;
  }

  .contact-info,
.skill-info,
.lang-info,
.individual-info {
    margin-bottom: 2% !important;
  }
}
@media only screen and (max-width: 580px) {
  .header {
    flex-direction: column;
  }
  .header img {
    margin: 3%;
  }
  .header div {
    text-align: center;
    padding: 0 !important;
    margin: 1%;
  }
}

   </style>
    
  
   