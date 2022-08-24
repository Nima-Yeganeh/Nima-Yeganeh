
export default {
  props: {
    context: Object,
    page_counts: {
      default: 0,
      type: Number
    },
    p_index: {
      default: 1,
      type: Number
    }
  },
  data() {
    return {
      index: 1,
      size: 10,
      has_next: false,
      has_prev: false,
      show_index: false,
    };
  },
  created() {
    this.index = this.p_index;
  },
  watch: {
    page_counts: function (newValue, oldValue) {
      this.page_counts = newValue;
      if (this.page_counts > 1) {
        this.has_next = true;
        this.show_index = true
      }else{
        this.has_next = false;
        this.has_prev = false;
        this.show_index = false
      }
      if (this.index === this.page_counts) {
        this.has_next = false
      }
    },
    p_index: function (newValue, oldValue){
      this.index = this.p_index;
      if (newValue == 1){
        this.has_prev = false;
      }
    }
  },
  methods: {

    firstPage() {
      this.index = 1;
      this.has_prev = false;
      this.has_next = true;
      this.$emit('reload', this.index);
    },
    prevPage() {
      this.index -= 1;
      if (this.index === 1) {
        this.has_prev = false;
      }
      if (this.index === this.page_counts - 1){
        this.has_next = true;
      }
      this.$emit('reload', this.index);
    },
    nextPage() {
      this.index += 1;
      if (this.index === 2) {
        this.has_prev = true;
      }
      if (this.index === this.page_counts) {
        this.has_next = false;
      }
      this.$emit('reload', this.index);
    },
    lastPage() {
      this.index = this.page_counts;
      this.has_prev = true;
      this.has_next = false;
      this.$emit('reload', this.index);      
    },
    convertNumbersToPersian(str) {
      return convertNumbersToPersian(str);
    },
  },
  components: {},
};
