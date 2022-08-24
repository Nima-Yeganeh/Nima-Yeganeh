
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
