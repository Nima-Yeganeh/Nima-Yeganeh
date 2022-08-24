
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      activeTab: 'rules',
      activeForm: [],
      selectedTab: {},
      loading: false,
      // choose tabs
      tabs: [
        {
          title: 'قوانین و مقررات',
          value: 'rules',
          items: [
            {
              title: 'قوانین و مقررات',
              name: 'text',
              type: "textarea",
              editorMode: 'advanced',
              grid: 'sixteen',
              isHtml: true,
            },
          ],
        },
        {
          title: 'درباره ما',
          value: 'about_us',
          items: [
            {
              title: 'درباره ما',
              name: 'text',
              type: "textarea",
              editorMode: 'advanced',
              grid: 'sixteen',
              isHtml: true,
            },
          ],
        },
        {
          title: 'رزومه ساز',
          value: 'about_resume',
          items: [
            {
              title: 'درباره رزومه ساز',
              name: 'text',
              type: "textarea",
              editorMode: 'advanced',
              grid: 'sixteen',
              isHtml: true,
            },
          ],
        },
        {
          title: 'آزمون ها',
          value: 'exams',
          items: [
            {
              title: 'آزمون ها',
              name: 'text',
              type: "textarea",
              editorMode: 'advanced',
              grid: 'sixteen',
              isHtml: true,
            },
          ],
        },
        { 
          title: 'ارزیابی و توسعه',
          value: 'kanoon',
          items: [
            {
              title: 'ارزیابی و توسعه',
              name: 'text',
              type: "textarea",
              editorMode: 'advanced',
              grid: 'sixteen',
              isHtml: true,
            },
          ],
        },
      ],
    };
  },
  async created() {
    this.goToTab(this.tabs[0]);
  },
  methods: {
    // choose tab
    async goToTab(tabs) {
      this.loading = true;
      this.selectedTab = tabs;
      this.activeTab = tabs.value;
      this.activeForm = tabs.items;
      // to get informaion of fields
      console.log('abcd',tabs.value)
      for (const f of tabs.items) {
        let configValue = (await getConfig('static_page', tabs.value));
        console.log('abcdefu',configValue)
        for (const key of Object.keys(configValue)) {
          let item = tabs.items.find(i => i.name === key);
          if (!item) continue;
          this.$set(item, 'value', configValue[key]);
        }
      }
      this.loading = false;
    },
    normalizeValue(item) {
      let value = {};
      for (const head of this.activeCategory.headers) {
        if (head.value.indexOf('.') > -1) {
          let sp = head.value.split('.');
          if (typeof value[sp[0]] !== 'object') {
            value[sp[0]] = {};
          }
          value[sp[0]][sp[1]] = item[head.value];
        } else {
          value[head.value] = item[head.value];
        }
      }
      return value;
    },
    async editConfig() {
      // =>normalize value
      console.log("atabbbbbbbbbb", this.selectedTab.items[0].value, this.selectedTab)
      let obj = {
        'text': this.selectedTab.items[0].value
      }
      // =>send edited to server 
      let res = await callStdAPI(this.context.get_configs_api, {
        method: 'post',
        data: {
          namespace: 'static_page',
          key: this.activeTab,
          data_type: 'object',
          value: JSON.stringify(obj),
          is_array: 0,
          array_type: String,
        },
      });
      // =>if success
      if (res.status === 200) {
        iziToast.success({title: 'ثبت شد', message: ' تغییرات ثبت شد.'});
      }
    },
  },
  // add form builder component
  components: {
    'form-builder': form_builder,
  },
};
