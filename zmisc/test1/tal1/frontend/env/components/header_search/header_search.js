
export default {
  props: {
    context: Object,
  },     
  data() {
    return {
      searchInput: '',
      showResults: false,
      loading: false,
      jobResults: [],
      companyResults: [],
      searchApi: '/jobs/api/suggest_job',
    };
  },
  created() {
    // $(document).mouseup((e) => {
    //   var container = $("#header_search_el");

    //   // if the target of the click isn't the container nor a descendant of the container
    //   if (!container.is(e.target) && container.has(e.target).length === 0) {
    //     this.showResults = false;
    //   }
    // });


  },
  mounted() {
    $(document).click((event) => {
      var container = $("#header_search_el");
      if (!container.is(event.target) && !container.has(event.target).length) {
        this.showResults = false;
      }
    });
  },
  methods: {
    async changeSearchText() {
      this.showResults = false;
      // =>check search input
      if (!this.searchInput || this.searchInput.trim().length === 0) {
        return;
      }
      // =>set loading
      this.loading = true;
      // =>call api
      let res = await callStdAPI(this.searchApi, {
        data: {
          search: this.searchInput,
        },
        method: 'get',
      });
      // =>if success
      if (res.status === 200) {
        console.log('search results:', res.data);
        // =>set job results
        this.jobResults = res.data.job;
        // =>set company results
        this.companyResults = res.data.company;
        // =>show results
        this.showResults = true;
      } else {
        this.showResults = false;
      }
      // =>disable loading
      this.loading = false;
    },
    shortDescription(des) {
      let str = parseHtml(des)
      if (str.length > 105) {
        return str.slice(0, 100) + '...';
      }
      return str;
    },
    goToPage(url) {
      window.location.href = url;
    }
  },

  components: {},
};
