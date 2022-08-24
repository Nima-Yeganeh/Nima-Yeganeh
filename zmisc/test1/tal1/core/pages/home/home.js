
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      activeTab: 'first',
      jobs: [],
      starredjobs: [],
      specialJobs: [],
      customers: [],
      disabled: false,
      slickConfigs: {
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 1,
        centerMode: true,   
        // variableWidth: true,
        dots: true,
        rtl: true,
        autoplay: true,
        focusOnSelect: true,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ]
      },
      slickConfigs2: {},
      tabs: [
        {
          icon: 'campaign',
          des: 'موقعیت های شغلی',
          value: 'first',

        },
        {
          icon: 'description',
          des: 'رزومه ساز',
          value: 'second',

        },
        {
          icon: 'work',
          des: 'معرفی مشاغل',
          value: 'third',

        },
        {
          icon: 'business',
          des: 'معرفی شرکت ها',
          value: 'four',

        },
        {
          icon: 'psychology',
          des: 'آزمون ها',
          value: 'five',
        }
      ],
      steps: [
        {
          title: 'شناسایی استعداد',
          text: '',
          src: this.context.img_one,
        },
        {
          class: 'step-two',
          title: 'توسعه استعداد',
          text: '',
          src: this.context.img_two,
        },
        {
          title: 'بکارگیری استعداد',
          text: '',
          src: this.context.img_three,
        }
      ],
      Shareholders: [
        {
          src: this.context.logo_one,
          modal: 'modal_one'
        },
        {
          src: this.context.logo_two,
          modal: 'modal_two'

        },
        {
          src: this.context.logo_three,
          modal: 'modal_three'

        },
        {
          src: this.context.logo_four,
          modal: 'modal_four'

        },
        {
          src: this.context.logo_five,
          modal: 'modal_five'

        },

      ],

      cons_req: [
        {
          placeholder: 'نام و نام خانوادگی',
          value: '',
          name: 'name'
        },
        {
          placeholder: 'تلفن همراه',
          value: '',
          name: 'phone'
        },
        {
          placeholder: 'موضوع',
          value: '',
          name: 'title'
        }
      ],
      modal: [
        {
          id: 'modal_one',
          image: this.context.logo_one,
          desc: '',
          link: 'http://domain.local/',
        },
        {
          id: 'modal_two',
          image: this.context.logo_two,
          desc: '',
          link: 'http://domain.local/',
        },
        {
          id: 'modal_three',
          image: this.context.logo_three,
          desc: '',
          link: 'http://domain.local/',
        },
        {
          id: 'modal_four',
          image: this.context.logo_four,
          desc: '',
          link: 'http://domain.local/',
        },
        {
          id: 'modal_five',
          image: this.context.logo_five,
          desc: '',
          link: 'http://domain.local/',
        },
      ]
    };
  },
  created() {
    Object.assign(this.slickConfigs2, this.slickConfigs);
    this.slickConfigs2.slidesToShow = 7;
    this.slickConfigs2.dots = false;

    console.log("context:", this.context);
    // =>load jobs
    this.getSpecialJobs();
    this.getStarredjobs();
    this.set_customers();
  },
  mounted() {
    // =>set header image as window height
    if ($(document).height() < 400) {
      $('.header-home').height($(document).height());
    }
  },
  methods: {
    // show modal 
    showModal(id) {

      $('#' + id)
        .modal({
          blurring: true
        })
        .modal('show');
    },
    // => active tab
    async goToTab(tab_id) {
      // console.log(tab_id)
      // $(".first").transition({
      //   animation: 'scale',
      //   duration: '2s',
      // });
      this.activeTab = tab_id;
    },
    // => go to pages
    goToPage(url) {
      window.location.href = url
    },
    goToIfc() {
      window.open(this.context.ifc_site, "_blank")
    },
    // => Consultation Request Form
    async getConsultationRequest() {
      let data = {
        "name": this.cons_req.find(i => i.name === 'name').value,
        "phone": this.cons_req.find(i => i.name === 'phone').value,
        "title": this.cons_req.find(i => i.name === 'title').value,
      }
      console.log("SSSSS", data)
      if (data.name === "" || data.phone === "" || data.title === "") {
        iziToast.error({ title: 'لطفا', message: 'تمام فیلد ها را تکمیل کنید.' });
      } else {
        let res = await callStdAPI(this.context.cons_request_api, {
          method: 'post',
          data: data
        });
        // => if success
        if (res.status === 200) {
          iziToast.success({ title: 'انجام شد', message: ' درخواست مشاوره شما ثبت شد.' });
          this.disabled = true;
        }
        // => if not success
        else if (res.status === 400) {
          console.log('hiiiiiiiiiiiiiiii', res, res.message)
          if (res.data === "duplicate request") {
            iziToast.error({ title: 'درخواست ثبت نشد', message: 'عنوان درخواست تکراری است' });
          }
          else {
            iziToast.error({ title: 'درخواست ثبت نشد', message: 'متن درخواست طولانی است' });
          }
        }
      }
    },
    async getSpecialJobs() {
      // =>call api
      let res = await callStdAPI(this.context.special_jobs_api, {
        method: 'get',
        data: {},
      });
      // =>if success
      if (res.status === 200) {
        this.specialJobs = res.data;
        // console.log('jobs:', this.specialJobs);
        setTimeout(() => {
          $('#special_jobs').slick(this.slickConfigs);
        }, 200);
      }
    },
    async getStarredjobs() {
      // =>call api
      let res = await callStdAPI(this.context.jobs_starred_api, {
        method: 'get',
        data: { "count": 8 },
      });
      // =>if success
      if (res.status === 200) {
        this.starredjobs = res.data;
        setTimeout(() => {
          $('#immediate_jobs').slick(this.slickConfigs);
        }, 200);
      }
    },
    goToJob(job) {
      window.location.href = this.context.job_page_url.replace('0', job.pk);
    },

    // for slider customers
    async set_customers() {
      // =>call api
      let res = await callStdAPI(this.context.company_list_api, {
        method: 'get',
        data: {},
      });
      // =>if success
      if (res.status === 200) {
        this.customers = res.data;

        if (this.customers.length <= 2) {
          this.slickConfigs2.slidesToShow = this.customers.length;
        } else if (this.customers.length <= 7) {
          this.slickConfigs2.slidesToShow = this.customers.length - 1;
        }

        setTimeout(() => {
          $('#customers').slick(this.slickConfigs2);
        }, 200);
      }
    },
    // get persian number
    convertNumbersToPersian(str) {
      return convertNumbersToPersian(str);
    },
  },
  components: {
    'job-card': job_card,
  },
};
