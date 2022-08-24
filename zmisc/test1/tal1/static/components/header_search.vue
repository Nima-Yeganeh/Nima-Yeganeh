
      
   <template>
      <div>
         <div class=" main" id="header_search_el">
    <div class="ui icon input " :class="[loading? 'loading': '']">
        <input v-model="searchInput" @input="changeSearchText()" type="text"
            placeholder="شرکت یا موقعیت شغلی مورد نظرتو اینجا جستجو کن.">
        <i class="search icon"></i>
    </div>
    <div class="ui stacked segment results" :class="[showResults ? 'show': 'hide']">
        <!-- not found -->
        <div class="not-found" v-if="jobResults.length === 0 && companyResults.length === 0">
            موردی یافت نشد!
        </div>
        <!-- job results -->
        <div class="jobs" :class="[companyResults.length > 0 ? 'has-company' : '']" v-if="jobResults.length > 0">
            <div class="ui vertical segment result-item" v-for="job in jobResults">
                <div class="image" :style="{'background-image': 'url(' + job.image + ')'}"></div>
                <div class="content">
                    <h1 @click="goToPage(job.url)">{{job.title}}</h1>
                    <!-- <p>{{shortDescription(job.description)}}</p> -->
                    <div v-html="shortDescription(job.description)" style="font-size: 10px !important"></div>
                </div>
            </div>
        </div>
        <!-- company results -->
        <div class="companies" v-if="companyResults.length > 0">
            <div class="ui vertical segment result-item" v-for="com in companyResults">
                <div class="image" :style="{'background-image': 'url(' + com.image + ')'}"></div>
                <div class="content">
                    <h1 @click="goToPage(com.url)">{{com.title}}</h1>
                    <!-- <p>{{shortDescription(com.description)}}</p> -->
                    <div v-html="shortDescription(com.description)" style="font-size: 10px !important"></div>
                </div>
            </div>
        </div>   
    </div>
</div>  
      </div>
   </template>
   
   <script>
      
      
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

   </script>

   <style scoped>
      .main {
  position: relative;
}
.main .input {
  width: 96%;
  margin-inline-start: 3% !important;
}
.main .input input {
  border-radius: 20px;
}

.results {
  display: none;
  min-height: 50px;
  width: 100%;
  transition: all 0.3s;
  position: absolute;
  top: 30px;
}
.results.show {
  display: flex;
  z-index: 99999;
  align-items: flex-start;
  transition: all 0.3s;
}
.results .not-found {
  color: #d65353;
  font-weight: 600;
  text-align: center;
  width: 100%;
  margin: 0 !important;
}
.results .jobs {
  width: calc(100% - 10px);
  padding: 5px;
}
.results .jobs.has-company {
  width: calc(50% - 10px) !important;
  border-left: 1px solid rgba(34, 36, 38, 0.15);
}
.results .companies {
  flex: 1 1 0;
  padding: 5px;
}
.results .result-item {
  display: flex;
  align-items: center;
  transition: all 0.3s;
  opacity: 0.8;
}
.results .result-item .image {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-position: center;
  background-size: cover;
  background-repeat: no-repeat;
  display: inline-block;
  margin: 0 4px;
}
.results .result-item:hover {
  cursor: pointer;
  opacity: 1;
}
.results .result-item:hover .content h1 {
  color: #6262fc;
}
.results .result-item .content {
  flex: 1 1 0;
}
.results .result-item .content h1 {
  font-size: 1em;
  font-weight: 500;
  transition: all 0.3s;
  margin-bottom: 5px;
}
.results .result-item .content p {
  font-size: 0.7em;
  opacity: 0.8;
}

   </style>
    
  
   