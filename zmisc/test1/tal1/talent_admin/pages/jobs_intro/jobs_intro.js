
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      jobs: [],
      mode: 'list',
      model: {
        description: '',
        image: undefined,
        title: '',
        salary_range: '',
        educations: [],
        certificates: [],
        duties: [],
        related_courses: [],
        key: undefined,
        uploadedImage: undefined,
      },
      fields: [
        {
          name: 'title',
          required: true,
          title: 'عنوان شغل',
        },
        {
          name: 'salary_range',
          // required: true,
          title: 'رنج حقوق',
        },
        {
          name: 'educations',
          // required: true,
          type: 'labels',
          title: 'تحصیلات مورد نیاز',
        },
        {
          name: 'certificates',
          // required: true,
          type: 'labels',
          title: 'مدارک مورد نیاز',
        },
        {
          name: 'duties',
          // required: true,
          type: 'labels',
          title: 'وظایف',
        },
      ],
    };
  },
  created() {
    this.loadJobs();
  },
  methods: {
    //=> for convert date to persian
    toPersianDate(date) {
      return toPersianDate(new Date(date), 'YYYY/MM/DD'); 
    },
    async loadJobs() {
      let configsData = await callStdAPI(this.context.get_configs_api, {
        method: 'get',
        data: { type: 'job_info' },
      });
      if (configsData.status === 200) {
        this.jobs = configsData.data;
        for (let i = 0; i < this.jobs.length; i++) {
          // =>set image path, if exist
          if (this.jobs[i].value.image) {
            this.$set(this.jobs[i], 'image', await getFileUrlById(Number(this.jobs[i].value.image)));
          }

        }
      }
    },
    async uploadImage() {
      let fileId = await this.$refs.image_uploader.open({
        title: 'آپلود تصویر شغل',
        uploadHash: '',
        allowedMimeTypes: ['image/png', 'image/svg', 'image/jpg'],
        maxFileSize: 500000,
      });
      if (fileId && fileId.length > 0) {
        this.model.image = fileId[0];
      }
    },
    addJob() {
      this.mode = 'add';
      this.model = {
        description: '',
        image: 0,
        title: '',
        salary_range: '',
        educations: [],
        certificates: [],
        duties: [],
        related_courses: [],
        key: 'job_' + Math.round(Math.random() * 100000),
      };
      // =>iterate form fields
      for (let i = 0; i < this.fields.length; i++) {
        this.$set(this.fields[i], 'value', '');
        // this.fields[i].value = '';
        if (this.fields[i].type === 'labels') {
          this.$set(this.fields[i], 'labels', []);
          // this.fields[i].labels = [];
        }
      }
    },
    viewJob(job) {
      window.location.href = '/jobs/job_info/'
    },
    async editJob(job) {
      this.mode = 'edit';
      this.model = {
        description: job.value.description,
        image: job.value.image,
        title: job.value.title,
        salary_range: job.value.salary_range,
        educations: job.value.educations,
        certificates: job.value.certificates,
        duties: job.value.duties,
        related_courses: job.value.related_courses ? job.value.related_courses : [],
        key: job.key,
      };
      // =>load uploaded image path, if exist
      if (this.model.image) {
        this.model.image = Number(this.model.image);
        this.$set(this.model, 'uploadImage', await getFileUrlById(this.model.image));
      }
      // =>iterate form fields
      for (let i = 0; i < this.fields.length; i++) {
        // =>load title
        if (this.fields[i].name === 'title') {
          this.$set(this.fields[i], 'value', this.model.title);
        }
        // =>load salary range
        if (this.fields[i].name === 'salary_range' && this.model.salary_range) {
          this.$set(this.fields[i], 'value', this.model.salary_range);
        }

        // =>load educations labels
        if (this.fields[i].name === 'educations' && this.model.educations) {
          this.$set(this.fields[i], 'labels', this.model.educations);
        }
        // =>load certificates labels
        if (this.fields[i].name === 'certificates' && this.model.certificates) {
          this.$set(this.fields[i], 'labels', this.model.certificates);
        }
        // =>load duties labels
        if (this.fields[i].name === 'duties' && this.model.duties) {
          this.$set(this.fields[i], 'labels', this.model.duties);
        }
      }
    },
    async deleteJob(job) {
      let res = await callAPI(this.context.delete_configs_api, {
        namespace: 'job_info',
        key: job.key,
      }, 'delete');
      // =>if success
      if (res[0] === 'success') {
        this.loadJobs();
        this.mode = 'list';
        showSuccessToast('شغل با موفقیت حذف شد');
      } else {
        showErrorToast('مشکلی در حذف بوجود آمده است.');
      }
    },
    short(text) {
      if (!text) return '';
      if (text.length > 105) {
        // console.log(text, typeof text)
        return text.substring(0, 100) + '...';
      }
      return text;
    },
    async addOrEdit() {
      // =>normalize model
      let values = {};
      for (const k of Object.keys(this.model)) {
        if (k === 'key' || k === 'uploadImage') {
          continue;
        }
        values[k] = this.model[k];
      }
      // =>iterate fields
      for (const f of this.fields) {
        if (f.type === 'labels') {
          values[f.name] = f.labels;
        } else {
          values[f.name] = f.value;
        }
      }
      // =>send edited to server 
      let res = await callStdAPI(this.context.get_configs_api, {
        method: 'post',
        data: {
          namespace: 'job_info',
          key: this.model.key,
          data_type: 'object',
          value: JSON.stringify(values),
        },
      });
      // =>if success
      if (res.status === 200) {
        this.loadJobs();
        this.mode = 'list';
        showSuccessToast('اطلاعات با موفقیت ثبت شد');
      } else {
        showErrorToast('مشکلی در ثبت اطلاعات بوجود آمده است.');
      }
    },
  },
  components: {
    'form-builder': form_builder,
    'related-courses': related_courses,
    'file-uploader': file_uploader
  },
};
