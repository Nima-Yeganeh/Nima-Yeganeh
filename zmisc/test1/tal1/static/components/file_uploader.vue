
      
   <template>
      <div>
         <div class="ui modal  transition" :class="[options.modalSize]" :id="id">
    <div class="header">
        {{options.title}}
        <span class="spacer"></span>
        <div class="actions">
            <i class="material-icons" @click="close()">close</i>
        </div>
    </div>
    <div class="content">
        <!-- uploader -->
        <div class='picker' v-if="filesSelected.length === 0">
            <div class="uploder">
                <i class="material-icons">upload_file</i>
                <div class="browse">
                    <label :for="fileUploaderId" class="ui primary basic button">انتخاب فایل (ها)</label>
                    <input
                        :accept="options.allowedMimeTypes.length == 0 ? undefined : options.allowedMimeTypes.join(',')"
                        :multiple="options.multipleFiles ? true : undefined" type="file" :id="fileUploaderId"
                        @change="chooseFiles($event)"></input>
                </div>
                <div class="options">
                    <a class="ui teal image label" v-if="options.allowedMimeTypes && options.allowedMimeTypes.length > 0">
                        فایل های مجاز
                        <div class="detail">{{options.allowedMimeTypes.join(' | ')}}</div>
                    </a>
                    <a class="ui red image label">
                        حداکثر اندازه فایل <div class=" detail">{{formattedMaxSize}}</div>
                    </a>
                </div>
            </div>
        </div>
        <!-- uploading -->
        <div class="uploading" v-if="filesSelected.length > 0">
            <div class="file" v-for="f in filesSelected">
                <div class="preview">
                    <i class="material-icons" v-if="!f.is_image">insert_drive_file</i>
                    <img v-if="f.is_image" :src="f.preview">
                </div>
                <div class="info">
                    <div class="filename">
                        <span class="name">{{f.file.name}}</span>
                        <span v-if="f.status == 'uploading'" class="percent">{{f.percent}}%</span>
                        <!--success-->
                        <i class="material-icons green md-24" v-if="f.status === 'success'">check_circle</i>
                        <!--error-->
                        <i class="material-icons red md-24" v-if="f.status === 'failed'">error_outline</i>
                        <!--cancel upload-->
                        <i class="material-icons red md-24 icon-btn" v-if="f.status === 'waiting'"
                            @click="cancelUploadFile(f)">cancel</i>
                    </div> 
                    <div class="progress" v-if="f.status == 'uploading'">
                        <div class="fill" :style="{width: f.percent + '%'}"></div>
                    </div>
                </div>
                <div class="ui divider"></div>
            </div>
        </div>
    </div>
    <div class="actions">
        <div class="options">
            <div class="ui checkbox">
                <input type="checkbox" v-model="closeAfterUploadFiles">
                <label>بستن پس از آپلود فایل ها</label>
            </div>
        </div>
        <div class="spacer"></div>
        <div class="buttons">
            <div class="ui positive left labeled icon button " @click="approve()">
                آپلود
                <i class="checkmark icon"></i>
            </div>
            <div class="ui negative button left" @click="close()">بستن</div>
        </div>

    </div>
</div>
      </div>
   </template>
   
   <script>
      
      
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

   </script>

   <style scoped>
      .header {
  display: flex !important;
  align-items: center;
}
.header .spacer {
  flex: 1 1 0;
}
.header .actions {
  display: flex;
  align-items: center;
}
.header .actions i {
  margin: 0 2px;
  opacity: 0.6;
  cursor: pointer;
  transition: all 0.3s;
}
.header .actions i:hover {
  opacity: 1;
}

.picker {
  margin: 5px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 5px;
}
.picker .uploder {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
}
.picker .uploder i {
  font-size: 5em;
}
.picker .uploder .browse {
  flex: 1 1 0;
}
.picker .uploder .browse label {
  color: #1c68cc;
  opacity: 0.7;
  transition: all 0.3s;
}
.picker .uploder .browse label:hover {
  cursor: pointer;
  opacity: 1;
}
.picker .uploder .browse input {
  display: none;
}
.picker .uploder .options {
  margin-top: 30px;
  display: flex;
  align-items: flex-start;
  width: 100%;
  height: 27px;
}
.picker .uploder .options a {
  max-height: 100%;
}

.uploading {
  display: flex;
  flex-direction: column;
}
.uploading .file {
  transition: none 500ms ease-in-out;
  display: flex;
  align-items: center;
}
.uploading .file .preview {
  margin: 0 4px;
}
.uploading .file .preview i {
  color: #3f86ff;
  font-size: 4em;
}
.uploading .file .preview img {
  height: 50px;
  max-width: 100px;
  border: 1px dashed rgba(0, 0, 0, 0.7);
}
.uploading .file .info {
  flex: 1 1 0;
  display: flex;
  flex-direction: column;
}
.uploading .file .info .filename {
  display: flex;
}
.uploading .file .info .filename .name {
  flex: 1 1 0;
}
.uploading .file .info .filename .green {
  color: green;
}
.uploading .file .info .filename .percent {
  opacity: 0.6;
}
.uploading .file .info .filename .icon-btn {
  opacity: 0.8;
  transition: all 0.3s;
}
.uploading .file .info .filename .icon-btn:hover {
  opacity: 1;
  cursor: pointer;
}
.uploading .file .info .progress {
  background-color: rgba(159, 143, 143, 0.3);
  height: 0.5rem;
  border-radius: 0.625rem;
  transition: all 0.3s;
}
.uploading .file .info .progress .fill {
  transition: all 0.3s;
  background-color: #3f86ff;
  height: 100%;
  border-radius: 0.625rem;
}

.actions {
  display: flex;
  align-items: center;
}
.actions .spacer {
  flex: 1 1 0;
}

   </style>
    
  
   