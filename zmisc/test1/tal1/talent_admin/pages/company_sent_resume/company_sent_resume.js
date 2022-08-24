

export default {
  props: {
    context: Object,
  },
  data() {
    return {
      companyId: 0,
    };
  },
  created() {
    console.log("context:", this.context);
    this.companyId = Number(getQueryParam('company_id', 0));  
  },  
  methods: {},  
  components: {
    "recieved-resumes": recieved_resumes,
  },    
};
  