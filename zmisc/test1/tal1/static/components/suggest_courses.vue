
      
   <template>
      <div>
         <div class="main-part" v-if="hasHeader">
    <h2>دوره های پیشنهادی شغل</h2>
    <p>با گذراندن دوره های زیر میتوانید گواهینامه دوره را دریافت کنید و با گواهینامه خود به راحتی شغل مورد
        علاقه
        خود را با شانس بیشتری به دست بیاورید</p>
</div>
<div class="ui basic segment very padded items courses-ifc">
    <div class="ui active inverted dimmer" v-if="!suggestProducts">
        <div class="ui text loader">بارگذاری</div>
    </div>
    <template v-if="suggestProducts">
        <!-- not found -->
        <not-found v-if="suggestProducts.length === 0 "></not-found>
        <div class="ui vertical segment item" v-for="item in suggestProducts">
            <!-- <div class="item"> -->
            <div class="image">
                <img v-if="item.imageUrl" :src="item.imageUrl">
            </div>
            <div class="content">
                <a :href="item.detailsPageUrl" target="_blank" class="header">{{item.name}}</a>
                <div class="meta">

                </div>
                <div class="description">
                    <p></p>
                </div>
                <div class="extra">
                    <div class="ui green label" v-if="item.semesterStatusName">{{item.semesterStatusName}}</div>
                    <div class="ui label" v-if="item.productTypeName"><i class="globe icon"></i>
                        {{item.productTypeName}}</div>
                </div>
            </div>
            <!-- </div> -->
            <!-- <h2 class="ui header">
                <div class="content">
                    {{item.name}}
                    <span class="ui green label">{{item.productTypeName}}</span>
                    <div class="sub header">{{item.holdingStartDateTimeUtc}} تا
                        {{item.holdingEndDateTimeUtc}}</div>
                </div>
            </h2> -->
        </div>
    </template>
</div>
      </div>
   </template>
   
   <script>
      import not_found from './not_found.vue';

      
export default {
  props: {
    hasHeader: {
      default: true,
      type: Boolean,
    },
    suggestProducts: {
      type: Array,
    },
  },
  data() {
    return {
      // suggestProducts: undefined,
    };
  },
  created() {
  },
  methods: {},
  components: {
    "not-found": not_found,
  },
};

   </script>

   <style scoped>
      .courses-ifc {
  max-height: 480px !important;
  overflow-y: auto !important;
}

   </style>
    
  
   