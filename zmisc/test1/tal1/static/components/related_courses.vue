
      
   <template>
      <div>
         <!-- choose courses for job -->
<div class="related-courses">
   <h2>دروس مرتبط با آگهی</h2>
   <div class="ui icon input fluid">
      <input v-model="courseSearchName" @input="getCourses()" class="prompt" type="text" placeholder="جستجو نام درس">
      <i class="search icon"></i>
   </div>
   <div class="table-container">
      <table class="ui celled table">
         <thead>
            <tr>
               <th>شناسه</th>
               <th>نام</th>
            </tr>
         </thead>
         <tbody>
            <tr v-for="c in coursesList" :class="{positive: checkSelectedCourse(c) }" @click="toggleSelectCourse(c)"
               style="cursor: pointer;">
               <td>{{c.id}}</td>
               <td>{{c.name}}</td>
            </tr>

         </tbody>
      </table>
   </div>
</div>
      </div>
   </template>
   
   <script>
      
      
export default {
  props: {
    selectable: {
      type: Boolean,
      default: true
    },
    selectedCourseIds: {
      // default: [],
      type: Array,
    },
  },
  data() {
    return {
      coursesList: [],
      courseSearchName: '',
      // selectedCourseIds: [],
      coursesApi: '/jobs/api/get_courses/',
    };
  },
  created() {
    console.log("context:", this.context);
    this.getCourses();
  },
  methods: {
    async getCourses() {
      if (!this.selectedCourseIds) {
        this.selectedCourseIds = [];
      }
      this.coursesList = [];
      // =>call api
      let res = await callStdAPI(this.coursesApi, {
        method: 'get',
        data: {
          search: this.courseSearchName,
          page_size: 10,
        }
      });
      // =>if success
      if (res.status === 200) {
        console.log('courses:', res.data);
        this.coursesList = res.data;
      }
    },
    toggleSelectCourse(course) {
      if (!this.selectable) {return}
      if (this.checkSelectedCourse(course)) {
        this.selectedCourseIds.splice(this.selectedCourseIds.indexOf(course.id), 1);
      } else {
        this.selectedCourseIds.push(course.id);
      }
      this.$emit('course_ids', this.selectedCourseIds);
    },
    checkSelectedCourse(course) {
      return this.selectedCourseIds.includes(course.id);
    },
  },
  watch: {
    course_ids: function (newVal, oldVal) {
      if (Array.isArray(newVal)) {
        this.selectedCourseIds = newVal;
      }
    },
    selectedCourseIds: function (newVal, oldVal) {
      if (Array.isArray(newVal)) {
        this.selectedCourseIds = newVal;
      }
    }
  },
  components: {},
};

   </script>

   <style scoped>
      tr.positive {
  background: #81a828 !important;
  color: #fff !important;
  font-weight: bold;
}

   </style>
    
  
   