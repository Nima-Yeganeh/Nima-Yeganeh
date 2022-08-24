
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
