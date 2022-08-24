
      
   <template>
      <div>
         <div class="ui labeled  fluid dropdown-main" :id="id">
    <div class="ui basic label dropdown-label" v-if="selectedCountry">
        <!-- if country selected -->
        <span class="ui label" v-if="selectedCountry" @click="reset('country')">{{selectedCountry}}</span>
        <!-- if state selected -->
        <span v-if="selectedState" class="ui teal label" @click="reset('state')">{{selectedState}}</span>
    </div>
    <!-- searching input -->
    <div class="ui selection search dropdown end-search" :id="dropdownId" :class="[loading ? 'loading': '']">
        <input v-model="dropDownValue" type="hidden" @change="dropdownChanged($event)">
        <i class="dropdown icon"></i>
        <div class="default text">{{defaultOption}}</div>
        <div class="menu">
            <div class="item" v-for="(item, ind) in dropDownOptions" :key="'loc_' + ind" :value="typeof item == 'object' ? item.value : item">
                {{typeof
                item == 'object' ? item.text : item}}</div>
        </div>
    </div>
    <!-- <select class="ui dropdown" :class="[loading ? 'loading': '']" @change="dropdownChanged($event)">
        <option readonly selected>{{defaultOption}}</option>
        <option v-for="item in dropDownOptions" :value="typeof item == 'object' ? item.value : item">{{typeof
            item == 'object' ? item.text : item}}</option>
    </select> -->
</div>
      </div>
   </template>
   
   <script>
      
      
export default {
  props: {
    context: Object,
    location: {
      type: Number,
    },
    id: {
      type: String,
      default: 'location_chooser',
    },
  },
  model: {
    prop: 'location',
    event: 'locationchange',
  },
  data() {
    return {
      dropDownValue: '',
      loading: false,
      // countryList: [],
      // stateList: [],
      // cityList: [],
      selectedCountry: undefined,
      selectedState: undefined,
      selectedCity: undefined,
      dropDownOptions: [],
      defaultOption: '',
      dropdownId: '',
    };
  },
  created() {
    // =>set random dropdown id
    this.dropdownId = 'location_' + Math.round(Math.random() * 100000);
    console.log("location:", typeof(this.location));
    
    if(this.location === undefined){
      return
    } 
    if (!isNaN(this.location) && this.location > 0) {
      this.setNewLocation(this.location, false);
    }else if(this.location.pk){
      if (!isNaN(this.location.pk) && this.location.pk > 0) {
        this.setNewLocation(this.location.pk, false);
      }
    }
  },
  mounted() {
    this.fillLocation();
    setTimeout(() => {
      $(".ui.dropdown").dropdown();
    }, 20);
  },
  methods: {
    dropdownChanged(event) {
      if (event.target.value === undefined && value === event.target.value) return;
      // =>get value
      let value = event.target.value;
      if (!this.selectedCountry) {
        this.selectedCountry = value;
        this.defaultOption = 'انتخاب استان';
      } else if (!this.selectedState) {
        this.selectedState = value;
        this.defaultOption = 'انتخاب شهر';
      } else {
        this.selectedCity = value;
        // =>search location id by city name
        let locationId = Number(this.dropDownOptions.find(i => i.text === value).value);
        // this.location = Number(value);
        // this.$emit('location', Number(value));
        this.$emit('locationchange', locationId);
      }
      this.dropDownValue = undefined;
      this.fillLocation();

    },
    async reset(type) {
      let defText = '';
      if (type === 'country') {
        this.selectedState = undefined;
        this.selectedCity = undefined;
        this.selectedCountry = undefined;
        // await this.fillLocation();
        defText = 'انتخاب کشور';
      }
      else if (type === 'state') {
        this.selectedState = undefined;
        this.selectedCity = undefined;
        defText = 'انتخاب استان';
      }
      await this.fillLocation();
      this.defaultOption = defText;
      $('#' + this.dropdownId).dropdown('clear');
      this.dropDownValue = undefined;
      // setTimeout(() => {
      //   $(".ui.dropdown").dropdown();
      // }, 20);
    },
    async fillLocation() {
      // =>fill country dropdown
      if (!this.selectedCountry) {
        this.loading = true;//'country';
        this.dropDownOptions = await getLocation();
        this.defaultOption = 'انتخاب کشور';
      }
      // =>fill state dropdown
      else if (this.selectedCountry && !this.selectedState) {
        this.loading = true;//'state';
        this.dropDownOptions = await getLocation(this.selectedCountry, undefined,);
        this.defaultOption = 'انتخاب استان';
      }
      // =>fill city dropdown
      else if (this.selectedCountry && this.selectedState) {
        this.loading = true;//'city';
        this.dropDownOptions = await getLocation(this.selectedCountry, this.selectedState);
        this.defaultOption = 'انتخاب شهر';
      }
      // console.log('options:', this.dropDownOptions, this.loading);
      // =>disable loading
      this.loading = false;
    },
    async setNewLocation(locationId, checkByOld = true) {
      this.loading = true;
      // =>if not empty
      if (!locationId || isNaN(Number(locationId)) || (checkByOld && Number(locationId) === this.location)) {
        this.loading = false;
        return;
      }
      // =>get new location info
      let locationInfo = await getLocation(undefined, undefined, Number(locationId));
      if (!locationInfo) {
        this.loading = false;
        return;
      }
      // =>set new location
      this.location = Number(locationId);
      this.selectedCountry = locationInfo['country'];
      this.selectedState = locationInfo['state'];
      this.selectedCity = locationInfo['city'];
      await this.fillLocation();
      this.dropDownValue = this.selectedCity;
      this.defaultOption = this.selectedCity;
      // =>disable loading
      this.loading = false;
    }
  },
  watch: {
    location: async function (newValue, oldValue) {
      this.setNewLocation(newValue);
    }

  },
};

   </script>

   <style scoped>
      .dropdown-main {
  display: flex;
}
.dropdown-main .dropdown-label {
  padding: 0 4px !important;
  margin: 0;
  display: flex;
  align-items: center;
  border-radius: 0 0.28571429rem 0.28571429rem 0 !important;
}
.dropdown-main .dropdown-label .label {
  cursor: pointer;
  opacity: 0.7;
  transition: all 0.3s;
}
.dropdown-main .dropdown-label .label:hover {
  opacity: 1;
}
.dropdown-main .dropdown {
  flex: 1 1 0;
}

@media only screen and (min-width: 780px) and (max-width: 1200px) {
  .end-search {
    min-width: 100px !important;
    width: 100% !important;
  }
}
@media only screen and (max-width: 400px) {
  .end-search {
    min-width: 100px !important;
    width: 100% !important;
  }
}

   </style>
    
  
   