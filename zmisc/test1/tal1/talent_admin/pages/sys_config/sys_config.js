
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      translated: {
        public: {
          job_expire_day: 'مدت روز انقضا آگهی',
          job_expire_day_des: 'تعداد روز های پس از ثبت آگهی که آگهی بایستی منقضی شود.',
          specialize_resume: 'هزینه رزومه ویژه',
          email: 'ایمیل',
          youtube: 'یوتیوب',
          twitter: 'توییتر',
          // top_jobs: 'آگهی های پیشنهادی',
          // top_jobs_des: 'توضیحات آگهی های پیشنهادی',
          top_jobs: 'آگهی های پیشنهادی',
          top_jobs_des: 'آگهی های پیشنهادی که در صفحه اصلی نمایش داده می‌شود',
          about_us: 'درباره ما',
          submit_job: 'آگهی های ثبت شده',
          immediate_job: 'آگهی های فوری',
          signup: 'ثبت نام',
          percent: 'درصد تکمیل رزومه',
          copy_right: 'حق کپی رایت',
          address: 'آدرس',
          phone: 'تلفن',
          about: 'لینک صفحه درباره ما',
          contact: 'لینک ارتباط با ما',
          aparat: 'آپارات',
          instagram: 'اینستاگرام',
          facebook: 'فیسبوک',
          linkedin: 'لینکدین'

        },
      },
      activeCategory: undefined,
      categories: [
        {
          title: 'عمومی',
          value: 'public',
          editable: true,
          headers: [
            {
              title: 'گروه بندی',
              value: 'namespace',
              readonly: true,
            },
            {
              title: 'کلید',
              value: 'key',
              translate: 'public',
              readonly: true,
            },
            {
              title: 'مقدار',
              value: 'value',
            },
          ],
        },
        // {
        //   title: 'معرفی مشاغل',
        //   value: 'job_info',
        //   data_type: 'object',
        //   editable: true,
        //   deletable: true,
        //   addItem: {
        //     title: 'افزودن شغل جدید',
        //   },
        //   headers: [
        //     {
        //       title: 'کلید شغل',
        //       value: 'key',
        //     },
        //     {
        //       title: 'عنوان شغل',
        //       value: 'value.title',
        //     },
        //     {
        //       title: 'توضیحات شغل',
        //       value: 'value.description',
        //     },
        //     {
        //       title: 'رنج حقوق',
        //       value: 'value.salary_range',
        //     },
        //     {
        //       title: 'تحصیلات موردنیاز',
        //       value: 'value.education',
        //     },
        //     {
        //       title: 'تصویر شغل',
        //       value: 'value.image',
        //       type: 'image',
        //     },
        //   ],
        // },
        {
          title: 'حقوق دریافتی',
          value: 'salary_range',
          data_type: 'string',
          editable: true,
          deletable: true,
          addItem: {
            title: 'افزودن حقوق جدید',
          },
          headers: [
            {
              title: 'کلید حقوق',
              value: 'key',
              readonly: true,
            },
            {
              title: 'عنوان حقوق',
              value: 'value',
            },
          ],
        },
        {
          title: 'دسته بندی مشاغل',
          value: 'job',
          editable: true,
          deletable: true,
          data_type: 'object',
          addItem: {
            title: 'افزودن دسته بندی جدید',
          },
          headers: [
            {
              title: 'کلید دسته بندی',
              value: 'key',
              readonly: true,
            },
            {
              title: 'عنوان دسته بندی',
              value: 'value.title',
            },
          ],
        },
        {
          title: 'دانشگاه ها و موسسات',
          value: 'university',
          data_type: 'object',
          editable: true,
          deletable: true,
          addItem: {
            title: 'افزودن دانشگاه جدید',
          },
          headers: [
            {
              title: 'کلید دانشگاه',
              value: 'key',
              readonly: true,
            },
            {
              title: 'عنوان دانشگاه',
              value: 'value.title',
            },
            {
              title: 'نوع دانشگاه',
              value: 'value.type',
            },
          ],
        },
        {
          title: 'سوابق کاری',
          value: 'job_experience',
          editable: true,
          deletable: true,
          addItem: {
            title: 'افزودن سابقه جدید',
          },
          headers: [
            {
              title: 'کلید',
              value: 'key',
              readonly: true,
            },
            {
              title: 'عنوان سابقه کاری',
              value: 'value',
            },
          ],
        },
        {
          title: 'رشته های تحصیلی',
          value: 'study_field',
          editable: true,
          deletable: true,
          addItem: {
            title: 'افزودن رشته جدید',
          },
          headers: [
            {
              title: 'کلید',
              value: 'key',
              readonly: true,
            },
            {
              title: 'عنوان رشته تحصیلی',
              value: 'value',
            },
          ],
        },
        {
          title: 'حوزه فعالیت شرکت',
          value: 'company_activity',
          editable: true,
          deletable: true,
          addItem: {
            title: 'افزودن حوزه جدید',
          },
          headers: [
            {
              title: 'کلید',
              value: 'key',
              readonly: true,
            },
            {
              title: 'عنوان حوزه فعالیت',
              value: 'value',
            },
          ],
        },
        {
          title: 'پیغام ها',
          value: 'message',
          data_type: 'string',
          editable: true,
          headers: [
            {
              title: 'کلید',
              value: 'key',
              readonly: true,
            },
            {
              title: 'متن',
              value: 'value',
            },
          ],
        },
        {
          title: 'لینک های مفید',
          value: 'useful_links',
          data_type: 'string',
          editable: true,
          deletable: true,
          addItem: {
            title: 'افزودن لینک جدید',
          },
          headers: [
            {
              title: 'عنوان لینک',
              value: 'key',
            },
            {
              title: 'آدرس لینک',
              value: 'value',
            },
          ],
        },
        {
          title: 'متغیر های سیستمی',
          value: 'system',
          data_type: 'string',
          editable: true,
          headers: [
            {
              title: 'کلید',
              value: 'key',
              readonly: true,
            },
            {
              title: 'مقدار',
              value: 'value',
            },
          ],
        },
      ],
      configs: [],
      showNewItemValue: undefined,
      showNewItemDataType: 'string',
      editableConfig: undefined,
    };
  },
  created() {
    // =>set default category
    this.activeCategory = this.categories[0];
    this.loadConfigs();
  },
  mounted() {
    $('.ui.dropdown').dropdown();
    $('.content').popup();
  },
  methods: {
    goToCategory(cat) {
      this.activeCategory = cat;
      this.showNewItemValue = undefined;
      this.editableConfig = undefined;
      this.loadConfigs();
    },
    async loadConfigs() {
      this.configs = [];
      let configsData = await callStdAPI(this.context.get_configs_api, {
        method: 'get',
        data: { type: this.activeCategory.value },
      });
      if (configsData.status === 200) {
        this.configs = configsData.data;
        setTimeout(() => {
          $('.content').popup();
        }, 40);
      }
    },
    getValue(config, header, returnDescription = false, returnOriginalValue = false) {
      let value;
      if (header.value.indexOf('.') > -1) {
        let sp = header.value.split('.');
        value = config[sp[0]][sp[1]];
      } else {
        value = config[header.value];
      }
      // =>if return original value
      if (returnOriginalValue) {
        return value;
      }
      // =>if need for translated
      if (header.translate && this.translated[header.translate]) {
        for (const key of Object.keys(this.translated[header.translate])) {
          // =>if match value
          if (key === value) {
            // =>if must return des
            if (returnDescription) {
              if (this.translated[header.translate][key + '_des']) {
                return this.translated[header.translate][key + '_des'];
              }
              return undefined;
            }
            // =>return translate of text
            return this.translated[header.translate][key];
          }
        }
        // =>if must return des
        if (returnDescription) {
          return undefined;
        }
      }
      return value;
    },
    async deleteConfig(config) {
      let res = await callAPI(this.context.delete_configs_api, {
        namespace: config.namespace,
        key: config.key,
      }, 'delete');
      // =>if success
      if (res[0] === 'success') {
        this.loadConfigs();
        showSuccessToast('حذف با موفقیت انجام شد');
      } else {
        showErrorToast('مشکلی در حذف بوجود آمده است.');
      }
    },
    showEditableConfig(config) {
      this.editableConfig = config;
      // =>if config is array
      if (config.is_array) {
        // =>check value to convert to array
        if (typeof config.value === 'string') {
          if (config.value[0] === '[') {
            config.value = config.value.substring(1, config.value.length - 2).split(',');
          } else {
            config.value = [config.value];
          }
        }
        // =>set array list
        this.$set(this.editableConfig, 'array_list', JSON.parse(JSON.stringify(config.value)));
        if (!Array.isArray(this.editableConfig.array_list)) this.editableConfig.array_list = [];
        // =>check for item types
        for (let i = 0; i < this.editableConfig.array_list.length; i++) {
          if (this.editableConfig.array_type === 'number') {
            this.editableConfig.array_list[i] = Number(this.editableConfig.array_list[i]);
          }
        }
        if (this.editableConfig.array_type === 'number') {
          this.$set(this.editableConfig, 'tmp_value', 0);
        } else {
          this.$set(this.editableConfig, 'tmp_value', '');
        }
      }

      // =>load init values of fields
      for (const head of this.activeCategory.headers) {
        this.changeEditableField(head, this.getValue(config, head, false, true));
      }
    },
    addFieldToArray() {
      // =>if number type
      if (this.editableConfig.array_type === 'number') {
        this.editableConfig.array_list.push(Number(this.editableConfig.tmp_value));
        this.editableConfig.tmp_value = 0;
      }
      // =>if any type
      else {
        this.editableConfig.array_list.push(this.editableConfig.tmp_value);
        this.editableConfig.tmp_value = '';
      }
      // =>set new value
      this.editableConfig.value = JSON.parse(JSON.stringify(this.editableConfig.array_list));
    },
    removeFieldFromArray(index) {
      this.editableConfig.array_list.splice(index, 1);
      // =>set new value
      this.editableConfig.value = JSON.parse(JSON.stringify(this.editableConfig.array_list));
    },
    cancelEdit() {
      this.editableConfig = undefined;
    },
    changeEditableField(header, value) {
      // let value = event.target.value;
      if (header.value.indexOf('.') > -1) {
        let sp = header.value.split('.');
        this.editableConfig[sp[0]][sp[1]] = value;
      }
      this.editableConfig[header.value] = value;
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
        console.log('normalize value:', head.value, item[head.value]);
      }
      return value;
    },
    async editConfig() {
      // =>normalize value
      let value = this.normalizeValue(this.editableConfig);
      console.log('edit:', this.editableConfig, value)
      // =>send edited to server 
      let res = await callStdAPI(this.context.get_configs_api, {
        method: 'post',
        data: {
          namespace: this.editableConfig.namespace,
          key: this.editableConfig.key,
          data_type: this.editableConfig.data_type,
          value: this.editableConfig.data_type === 'object' ? JSON.stringify(value['value']) : value['value'],
          is_array: this.editableConfig.is_array,
          array_type: this.editableConfig.array_type,
        },
      });
      // =>if success
      if (res.status === 200) {
        // this.configs.push(this.showNewItemValue);
        this.loadConfigs();
        this.editableConfig = undefined;
      }
    },
    async addItem() {
      // =>normalize value
      let value = {};
      for (const head of this.activeCategory.headers) {
        if (head.value.indexOf('.') > -1) {
          let sp = head.value.split('.');
          if (typeof value[sp[0]] !== 'object') {
            value[sp[0]] = {};
          }
          value[sp[0]][sp[1]] = this.showNewItemValue[head.value];
        } else {
          value[head.value] = this.showNewItemValue[head.value];
        }
      }
      let res = await callStdAPI(this.context.get_configs_api, {
        method: 'post',
        data: {
          namespace: this.activeCategory.value,
          key: this.showNewItemValue['key'],
          data_type: this.showNewItemDataType,
          value: this.showNewItemDataType === 'object' ? JSON.stringify(value['value']) : value['value'],
        },
      });
      // =>if success
      if (res.status === 200) {
        // this.configs.push(this.showNewItemValue);
        this.loadConfigs();
        this.showNewItemValue = undefined;
        this.editableConfig = undefined;
      }
    },
    showNewItem() {
      if (!this.showNewItemValue) {
        this.showNewItemValue = {};
        this.showNewItemDataType = this.activeCategory.data_type ? this.activeCategory.data_type : 'string';
        for (const head of this.activeCategory.headers) {
          this.showNewItemValue[head.value] = '';
        }
        setTimeout(() => {
          $('.ui.dropdown').dropdown();
        }, 40);
      } else {
        this.addItem();
      }
    },
    async uploadImage(newItemField) {
      let fileId = await this.$refs.image_uploader.open({
        uploadHash: '',
        allowedMimeTypes: ['image/png', 'image/svg', 'image/jpg'],
        maxFileSize: 500000,
      });
      if (fileId && fileId.length > 0) {
        this.showNewItemValue[newItemField] = fileId[0];
      }
    },
    //=> for convert date to persian
    toPersianDate(date) {
      return toPersianDate(new Date(date), 'YYYY/MM/DD');
    },
  },
  components: {
    'file-uploader': file_uploader,
  },
};
