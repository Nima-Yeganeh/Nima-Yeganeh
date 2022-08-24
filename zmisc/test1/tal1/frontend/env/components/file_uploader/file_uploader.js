
export default {
  props: {
  },
  data() {
    return {
      options: {
        title: 'آپلود فایل',
        allowedMimeTypes: [],
        maxFileSize: 20 * 1000 * 1000, // 20Mb
        multipleFiles: false,
        uploadHash: '',
        autoGetUploadInfo: true,
        uploadFileApi: '/api/file-upload',

        modalSize: 'large',
      },
      id: '',
      filesSelected: [],
      fileUploaderId: 'file_uploader',
      fileIds: [],
      formattedMaxSize: '',
      returnFileIds: false,
      closeAfterUploadFiles: true,
    };
  },
  created() {
    console.log("context:", this.context);
    // =>reset selected files
    this.filesSelected = [];
    this.fileIds = [];
  },
  methods: {
    async open(options = {}) {
      // =>generate random id
      this.id = 'upload_' + Math.ceil(Math.random() * 10000);
      this.fileUploaderId = 'file_upload_' + Math.ceil(Math.random() * 100000);
      console.log('id:', this.id);
      // =>reset selected files
      this.filesSelected = [];
      // =>merge new options with default options
      this.options.allowedMimeTypes = [];
      for (const key of Object.keys(options)) {
        this.$set(this.options, key, options[key]);
      }
      // =>check for auto get upload info form server
      if (this.options.autoGetUploadInfo) {
        console.log('hash:',this.options.uploadHash)
        let res1 = await callStdAPI(this.options.uploadFileApi, {
          method: 'put',
          data: { hash: this.options.uploadHash }
        });
        // =>if success
        if (res1.status === 200) {
          console.log('upload file info:', res1.data);
          // =>set upload options
          if (res1.data.max_size) {
          this.options.maxFileSize = res1.data.max_size;
          }
          if (res1.data.mime_types) {
            if (!Array.isArray(res1.data.mime_types)) res1.data.mime_types = [res1.data.mime_types]; 
            this.options.allowedMimeTypes = res1.data.mime_types;

          }
        }
      }
      // =>format max size
      this.formattedMaxSize = this.calcFileSize(this.options.maxFileSize);
      this.returnFileIds = false;
      // console.log('options:', this.options);
      // alert('hi')
      return new Promise((res) => {
        setTimeout(() => {
          $('#' + this.id).modal({
            transition: 'fade up',
            closable: false,
            onHide: () => {
              if (!this.returnFileIds) return false;
            },
          }).modal('show');
          // =>listen on when all files uploaded success
          let approveInt = setInterval(() => {
            if (this.returnFileIds) {
              console.log('closing...', this.fileIds)
              clearInterval(approveInt);
              // =>close uploader dialog
              $('#' + this.id).modal('hide', true);
              // =>return file ids
              res(this.fileIds);
              // =>reset vars
              this.filesSelected = [];
              this.fileIds = [];
            }
          }, 500);
        }, 30);
      });

    },
    close() {
      this.returnFileIds = true;
    },
    
    
    async approve() {
      let success = 0;
      // =>upload files
      for (const f of this.filesSelected) {
        let res = await this.uploadFile(f);
        if (res) {
          success++;
        }
      }
      // =>check uploaded files success
      // console.log('file uploading:', success, this.filesSelected.length, this.closeAfterUploadFiles, this.returnFileIds);
      if (this.closeAfterUploadFiles && success === this.filesSelected.length) {
        this.returnFileIds = true;
      }
      return false;
    },
    chooseFiles(event) {
      this.filesSelected = [];
      let validImageTypes = ['image/gif', 'image/jpeg', 'image/png'];
      // =>iterate files
      for (const file of event.target.files) {
        // =>check file type
        if (this.options.allowedMimeTypes.length > 0 && !this.options.allowedMimeTypes.includes(file.type)) {
          showErrorToast(`نوع فایل '${file.type}' برای آپلود مناسب نیست`);
          continue;
        }
        // =>check file size for max size
        if (file.size > this.options.maxFileSize) {
          showErrorToast('اندازه فایل نامناسب است', `اندازه فایل '${file.name}'  بیشتر از ${this.formattedMaxSize} است.`);
          continue;
        }
        let isImage = false;
        // =>check file is image
        if (validImageTypes.includes(file.type)) {
          isImage = true;
        }
        // =>append to file selected to upload
        this.filesSelected.push({
          id: Math.ceil(Math.random() * 10000),
          percent: 0,
          file,
          status: 'waiting', // waiting, uploading, failed, success
          is_image: isImage,
          preview: isImage ? URL.createObjectURL(file) : undefined,
        });
      }
      console.log('files:', event.target.files, this.filesSelected);
    },
    cancelUploadFile(fileSelected) {
      let ind = this.filesSelected.findIndex(i => i.id === fileSelected.id);
      // console.log('file ind:', ind);
      this.filesSelected.splice(ind, 1);
      // // =>if no any files selected, show uploader
      // if (this.filesSelected.length === 0) {

      // }
    },
    async uploadFile(fileSelected) {
      return new Promise(async (res) => {
        // =>create form data
        let formData = new FormData();
        formData.append('file', fileSelected.file);
        formData.append('file_hash', this.options.uploadHash);
        // =>update file status
        fileSelected.status = 'uploading';
        // =>Send post request
        let instance = await getAxios({ content_type: 'multipart/form-data' });
        instance({
          method: 'post',
          url: this.options.uploadFileApi,
          data: formData,
          onUploadProgress: (progressEvent) => {
            fileSelected.percent = parseInt(Math.round((progressEvent.loaded / progressEvent.total) * 100));
          }
        }).then((response) => {
          // alert('SUCCESS!!');
          // =>update file status
          // console.log('resp:', response);
          this.fileIds.push(response.data.data);
          fileSelected.status = 'success';
          res(true);
        })
          .catch(() => {
            // alert('FAILURE!!');
            // =>update file status
            fileSelected.status = 'failed';
            res(false);
          });
      });
    },
    calcFileSize(bytes) {
      let units = ['بایت', 'کیلوبایت', 'مگابایت', 'گیگابایت'];
      let num = bytes;
      for (let i = 0; i < units.length; i++) {
        if (num < 1000) {
          return num + ' ' + units[i];
        }
        num /= 1000;
      }
      return num + ' ' + units[units.length - 1];
    },
  },
  components: {},
};
