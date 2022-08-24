
      
   <template>
      <div>
         <div class="ui grid stackable very padded">
    <div class="ui inverted dimmer" :class="{active: loading}">
        <div class="ui text loader">بارگذاری</div>
    </div>
    <template v-for="f in fields" :key="f.name+'_widget'">
        <div :class="[f.grid ? f.grid : 'eight', 'wide', 'column']" class=" " v-if="!f.hidden">
            <div class="field">
                <label v-if="f.type !== 'checkbox' && f.type !== 'toggle'" :for="f.name + '_input'">
                    <span v-text="f.title"></span>
                    <span v-if="f.required" style="color:red">*</span>
                </label>
                <div v-if="!loading" class="ui input"
                    :class="{'right': f.afterLabel || f.type === 'date', labeled: f.afterLabel, 'action': f.type === 'labels', 'icon': f.type === 'date', 'error': f.hasError}">
                    <!-- checkbox type -->
                    <div class="ui  checkbox" v-if="f.type === 'checkbox'">
                        <input v-model="f.value" type="checkbox" :id="f.name + '_checkbox'"
                            :readonly="f.readOnly ? true : undefined" @change="changedInput(f)">
                        <label :for="f.name + '_checkbox'">{{f.title}}</label>
                    </div>
                    <!-- input type -->
                    <input :required="f.required ? true : undefined" v-if="!f.type || f.type === 'labels'"
                        :type="f.inputType ? f.inputType : 'text'" v-model="f.value" :min="f.min ? f.min : undefined"
                        :max="f.max ? f.max : undefined" :id="f.name + '_input'" :name="f.name" :placeholder="f.title"
                        @keyup.enter="OnInputEnter(f)" :readonly="f.readOnly ? true : undefined"
                        @change="changedInput(f)" :class="f.afterLabel ? 'income-div' : ' '">
                    <!-- calndar date input -->
                    <template v-if="f.type === 'date'">
                        <!--calendar input value-->
                        <input :id="f.name + '_input_date'" readonly :value="dateInputTexts[f.name]">
                        <!--calendar icon-->
                        <i class="calendar icon"></i>
                    </template>
                    <!--textarea type-->
                    <template v-if="f.type === 'textarea'">
                        <textarea maxlength="500" rows="2" :readonly="f.readOnly ? true : undefined" v-model="f.value"
                            :id="f.name + '_input'" :name="f.name" @change="changedInput(f)"
                            :placeholder="f.title"></textarea>
                    </template>
                    <!-- after label -->
                    <div v-if="f.afterLabel" class="ui basic label label-price" v-text="f.afterLabel"></div>
                    <!-- action button of labels type -->
                    <button v-if="f.type === 'labels'" class="ui violet icon button" @click.prevent="addLabel(f)"
                        :disabled="!f.value">
                        <i class="material-icons">add</i>
                    </button>
                    <!-- auto complete type -->
                    <auto-complete v-if="f.type == 'auto_complete'" class="auto_complete" :dataList="f"
                        @ac_change="changedInput(f)" v-model="f.value" :name="f.name" :id="f.name + '_auto_complete'">
                    </auto-complete>
                    <!-- select type -->
                    <template v-if="f.type == 'select'">
                        <select :multiple="f.multiselect ? 'true' : undefined" class=""
                            :class="[, 'ui', 'dropdown', f.searchable ? 'search' : '', 'selection', 'fluid']"
                            :id="f.name + '_input'" :name="f.name" v-model="f.value" @change="changedInput(f)">
                            <template v-for="(opt, ind) in f.options">
                                <option :key="ind+'_option'" :value="typeof opt === 'object' ? opt.value : opt">{{typeof
                                    opt
                                    === 'object' ? opt.text : opt}}</option>
                            </template>
                        </select>
                    </template>
                    <!--toggle type-->
                    <div class="ui toggle checkbox" v-if="f.type === 'toggle'">
                        <input :id="f.name + '_toggle'" @change="changedInput(f)" v-model="f.value" type="checkbox">
                        <label>{{f.title}}</label>
                    </div>
                    <!-- location type -->
                    <div style="width: 100%;" v-if="f.type == 'location'">
                        <location-chooser v-model="f.value" @locationchange="changedInput(f)"
                            :id="f.name + '_location'"></location-chooser>
                    </div>
                </div>
                <!-- basic editor mode -->
                <!-- <div v-if="!loading && f.type === 'textarea' && f.editorMode" :id="f.editorId"
                    style="min-height: 200px;width:100%;direction: rtl;">
                    <p></p>
                </div> -->
            </div>
            <!--labels list-->
            <template v-if="!loading && f.type === 'labels'">
                <input type="hidden" :id="f.name + '_input_labels'" :name="f.name + '_labels'">
                <div class="ui blue labels">
                    <a v-for="lbl in f.labels" class="ui label label-item" :key="lbl+'_lbl'"
                        style="display: inline-flex;align-items: center;">
                        <span v-text="lbl"></span>
                        <i class="material-icons" style="margin: 0 4px;font-size: 1.4em;"
                            @click="removeLabel(f, lbl)">delete</i>
                    </a>
                </div>
            </template>
        </div>
    </template>
</div>
      </div>
   </template>
   
   <script>
      import location_chooser from './location_chooser.vue';
import auto_complete from './auto_complete.vue';

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
   </script>

   <style scoped>
      input:read-only,
textarea:read-only {
  opacity: 0.6;
}

.label-item {
  display: inline-flex;
  align-items: center;
}
.label-item i {
  margin: 0 4px;
  font-size: 1.4em;
}

.ui.error input,
.ui.error textarea, .ui.error select {
  background-color: #fff6f6;
  border-color: #e0b4b4;
  color: #9f3a38;
  -webkit-box-shadow: none;
  box-shadow: none;
}

.auto_complete {
  width: 100%;
  z-index: 3;
}

@media only screen and (max-width: 400px) {
  .label-price {
    width: 30% !important;
    display: flex !important;
    justify-content: center;
  }

  .income-div {
    width: 70% !important;
  }
}

   </style>
    
  
   