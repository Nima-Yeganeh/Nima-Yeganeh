
      
   <template>
      <div>
         <div class="not-found">
    <img src="/static/base/img/no-input.svg">
    <p>موردی یافت نشد</p>
</div>
      </div>
   </template>
   
   <script>
      
      
export default {
  props: {
    context: Object,
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
      .not-found {
  margin-top: 5%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.not-found p {
  color: #252525;
  font-size: 20px;
  margin-top: 2%;
}

@media only screen and (max-width: 400px) {
  .not-found {
    overflow-x: hidden;
  }
  .not-found img {
    width: 300px;
    height: auto;
  }
}

   </style>
    
  
   