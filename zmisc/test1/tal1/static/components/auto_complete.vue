
      
   <template>
      <div>
         <div class="dropdown-main">
    <div class="dropdown-content" :class="{focused:focused}">
        <div class="co_header">
            <input type="text" v-model="search" autocomplete="off" :placeholder="placeholder" id="myInput"
                @keyup="filter()" @click="showDropdown = !showDropdown, focused = !focused" class="ac_input">
            <span @click="showDropdown = !showDropdown, focused = !focused" class="icon_dd">
                <i class="material-icons">arrow_drop_down</i>
            </span>
        </div>
        <div class="dropdown-list" v-if="showDropdown">
            <option v-for="item in dropdownlist" :value="item.value" :class="{selected: selectedId === item.value }"
                @click="selectDropdown($event), focused = !focused" class="list_of_input">
                {{item.text}}
            </option>
        </div>
    </div>
</div>
      </div>
   </template>
   
   <script>
      
      
export default {
  props: {
    context: Object,
    dataList: {
      type: Object,
      default: {}
    },
  },
  data() {
    return {
      dropdownlist: [],
      search: '',
      placeholder: '',
      selectedId: -1,
      showDropdown: false,
      focused: false,
    };
  },
  created() {
    this.dropdownlist = this.dataList.options ? this.dataList.options : [];
    console.log(typeof(this.search))
  },
  methods: {
    filter(){
      if(this.search === ""){
        this.dropdownlist = this.dataList.options
        return
      }
      let searchList = []
      this.dataList.options.forEach(item => {
        if(item.text.includes(this.search)){
          searchList.push(item);
        }
      });
      this.showDropdown = true
      this.dropdownlist = searchList
      if(searchList.length === 0){
        this.dataList.value = this.search
        this.$emit('ac_change', this.search)
      }
    },
    selectDropdown(event){
      this.search = event.target.textContent.trim()
      this.selectedId = event.target.value
      this.dropdownlist = this.dataList.options
      this.showDropdown = false
      this.dataList.value = event.target.value
      this.$emit('ac_change', event.target.value)
    }
  },
  components: {},
};

   </script>

   <style scoped>
      .dropdown-main {
  height: 36.5px;
}
.dropdown-main .dropdown-content {
  width: 100%;
  border: 1px solid rgba(34, 36, 38, 0.15);
  background-color: #ffffff;
  border-radius: 4.5px;
}
.dropdown-main .dropdown-content .co_header {
  display: flex;
  cursor: pointer;
  height: 38px;
}
.dropdown-main .dropdown-content .co_header .ac_input {
  flex-grow: 1;
  border: none;
  outline: none;
  padding: 5px 15px 5px 0;
}
.dropdown-main .dropdown-content .co_header .icon_dd {
  align-self: center;
  padding: 10px;
}
.dropdown-main .dropdown-content .co_header .icon_dd i {
  font-size: 18px;
}
.dropdown-main .dropdown-content .dropdown-list {
  max-height: 200px !important;
  overflow-y: scroll !important;
  z-index: 5;
}
.dropdown-main .dropdown-content .dropdown-list .list_of_input {
  padding: 10px;
  cursor: pointer;
}
.dropdown-main .dropdown-content .dropdown-list .selected {
  background-color: rgba(0, 0, 0, 0.03);
  font-weight: 700;
}
.dropdown-main .dropdown-content .dropdown-list .list_of_input:hover {
  background-color: #f2f2f2;
}
.dropdown-main .dropdown-content .dropdown-list .selected:hover {
  background-color: rgba(0, 0, 0, 0.03);
}
.dropdown-main .focused {
  border: 1px solid #96c8da;
}

.dropdown-main .dropdown-content:hover {
  border: 1px solid #b2b3a9;
  border-radius: 5px;
}

.dropdown-main .focused:hover {
  border: 1px solid #96c8da;
  border-radius: 5px;
}

   </style>
    
  
   