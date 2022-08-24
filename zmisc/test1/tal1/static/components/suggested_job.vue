
      
   <template>
      <div>
         <div class="main-jobs" v-if="hasHeader">
    <h2> مشاغل پیشنهادی </h2>
    <p>مشاغلی که به شما پیشنهاد میکنیم </p>
        
    </div>
    <div class="ui basic segment very padded items courses-ifc">
        <div class="ui active inverted dimmer" v-if="!similarJob">
            <div class="ui text loader">بارگذاری</div>
        </div>
        <template v-if="similarJob">
            <!-- not found -->
            <not-found v-if="similarJob.length === 0 "></not-found>
            <div class="ui vertical segment item" v-for="item in similarJob">
                <!-- <div class="item"> -->
                <div class="image">
                    <img v-if="item.image" :src="item.image">
                </div>
                <div class="content">
                    <a class="header">{{item.title}}</a>
                    <div class="meta">

                    </div>
                    <div class="description">   
                        <p>{{item.description}}</p>
                    </div>
                    <div class="extra">
                        <div class="ui green label" v-if="item.semesterStatusName">{{item.semesterStatusName}}</div>
                       {{item.productTypeName}}</div>
                    </div>
                </div>

            </div>
        </template>
    </div>
      </div>
   </template>
   
   <script>
      import not_found from './not_found.vue';

      
export default {
  props: {
    context: Object,
    hasHeader: {
      default: true,
      type: Boolean,
    },
    similarJob: {
      type: Array,
    },
  },
  data() {
    return {};
  },
  created() {
    console.log("context:", this.context);
  },
  methods: {},
  components: {},
};

   </script>

   <style scoped>
      .courses-ifc {
  max-height: 480px !important;
  overflow-y: auto !important;
  margin-block-end: 5%;
}

   </style>
    
  
   