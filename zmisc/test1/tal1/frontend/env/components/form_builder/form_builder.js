export default {
  // name: 'form_builder',
  props: {
    fields: Array,
    loading: {
      default: false,
      type: Boolean,
    },
  },
  model: {
    prop: 'fields',
    event: 'fields',
  },
  data() {
    return {
      // hidden:false,
      dateInputTexts: {

      },
      keyValues: {},
      dateTimeFormat: 'dddd D MMMM YYYY',
    };
  },
  created() {
    // alert(';heee')
    // console.log("context:", this.context);

    // =>load key values
    this.keyValues = getKeyValues();
    // =>set options of select inputs by 'optionsLoad' prop
    for (const f of this.fields) {
      if (f.type && f.type === 'select' && f.optionsLoad) {
        f.options = this.keyValues[f.optionsLoad];
        // =>add no matter, if allowed
        if (f.addNoMatterOption) {
          f.options.push({
            text: "فرقی نمیکند",
            value: "no_matter",
          });
        }
      }
    }
  },
  mounted() {
    // this.loading = false;
    setTimeout(() => {
      this.enableDatePickers();
      this.activateDropDowns();
      this.activateEditors();
    }, 40);
    if (this.fields && this.fields.length > 0) {
      this.changedInput(this.fields[0]);
    }

  },
  methods: {
    addLabel(field) {
      if (!field.value || field.value.trim() === "") return;
      if (!field.labels) field.labels = [];
      field.labels.push(field.value);
      field.value = null;
      this.changedInput(field);
    },
    removeLabel(field, label) {
      let ind = field.labels.indexOf(label);
      if (ind < 0) return;
      field.labels.splice(ind, 1);
      console.log('remove label:', label, ind);
      this.changedInput(field);
    },
    OnInputEnter(field) {
      // =>if type is labels
      if (field.type === "labels") {
        this.addLabel(field);
      }
    },
    enableDatePickers() {
      // =>enable date picker for date types
      for (let inp of this.fields) {
        if (inp.type === 'date') {
          this.$set(this.dateInputTexts, inp.name, '');
          // =>if exist value, set it
          if (inp.value) {
            this.dateInputTexts[inp.name] = new persianDate(inp.value).format(this.dateTimeFormat);
            console.log(this.dateInputTexts[inp.name], inp.value)
          }
          // =>init date picker
          $(`#${inp.name}_input_date`).pDatepicker({
            // position: 'right',
            initialValue: inp.value ? false : true,
            autoClose: true,
            // format: 'YYYY/MM/DD',
            formatter: (unix) => {
              inp.value = unix;
              console.log('date picker change:', inp);
              this.changedInput(inp);
              let val = new persianDate(unix).format(this.dateTimeFormat);
              this.dateInputTexts[inp.name] = val;
            }

          });
        }
      }
    },
    changedInput(field) {
      if (field.value === undefined || field.value === null || this.loading) {
        return;
      }

      console.log('changed field:', field.name, field.value);
      this.$emit('fields', this.fields);
      this.$emit('changeField', field);
    },
    activateDropDowns() {
      $(".ui.dropdown").dropdown({
        match: 'text',
        message: {
          noResults: 'نتیجه ای یافت نشد!',
        },
      });
    },
    activateEditors() {
      // =>activate editors
      for (const f of this.fields) {
        if (f.type === 'textarea' && f.editorMode) {
          // =>try to init editor
          let editorInt = setInterval(() => {
            let id = f.name + '_input';
            var container = document.getElementById(id);
            if (!container) return;
            // =>set configs by mode
            let configs = {};
            if (f.editorMode === 'basic') {
              configs = {
                tabsize: 2,
                width: '100%',
                height: 120,
                toolbar: [
                  ['style', ['style']],
                  ['font', ['bold', 'underline', 'clear']],
                  ['color'],
                  ['para', ['ul', 'ol', 'paragraph']],
                  ['insert', ['link']],
                  ['view'] 
                ],
              };
            }
            // =>if advanced mode
            else if (f.editorMode === 'advanced') {
              configs = {
                tabsize: 2,
                width: '100%',
                minHeight: 120,
                toolbar: [
                  ['style', ['style']],
                  ['font', ['bold', 'underline', 'clear']],
                  ['color', ['color']],
                  ['para', ['ul', 'ol', 'paragraph']],
                  ['table', ['table']],
                  ['insert', ['link', 'picture', 'video']],
                  ['view', ['fullscreen', 'codeview', 'help']]
                ],
              };
            }
            configs['lang'] = 'fa-IR';
            configs['callbacks'] = {
              onChange: (contents, $editable) => {
                // console.log('onChange:', contents, $editable);
                f.value = contents;
                this.changedInput(f);
              }
            };
            // =>init editor
            $('#' + f.name + '_input').summernote(configs);
            clearInterval(editorInt);
          }, 100);

        }
      }
    }
  },
  watch: {
    loading: function (newValue, oldValue) {
      // console.log("newValue: %s, previousValue: %s", newValue, oldValue);
      console.log("fields:", this.fields)
      setTimeout(() => {
        this.enableDatePickers();
        this.activateDropDowns();
        this.activateEditors();
      }, 30);
    },
  },
  components: {
    'location-chooser': location_chooser,
    'auto-complete': auto_complete
  },
};