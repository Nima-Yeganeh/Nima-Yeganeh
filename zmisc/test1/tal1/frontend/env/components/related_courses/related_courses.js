
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
