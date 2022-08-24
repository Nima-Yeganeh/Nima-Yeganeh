
export default {
  props: {
    context: Object,
  },
  data() {
    return {
      // form builder fields
      fields: [
        {
          title: "کد تخفیف",
          name: "code",
          required: true,
          value: '',
        },
        {
          title: "تعداد کد تخفیف",
          name: "limit",
          required: true,
          inputType: "number",
          value: '',
        },
        {
          title: "نوع",
          name: "type",
          required: true,
          type: 'select',
          value: '',
          options: [
            {
              text: '٪',
              value: 'percent',
            },
            {
              text: 'ریال',
              value: 'price',
            },
          ],
        },
        {
          title: "درصد یا قیمت تخفیف",
          name: "amount",
          required: true,
          inputType: "number",
          value: '',
        },
        {
          title: "حداکثر قیمت	مشمول تخفیف",
          name: "max_price",
          required: true,
          inputType: "number",
          value: '',
        },
        {
          title: "قابلیت استفاده",
          name: 'usage',
          required: true,
          type: 'select',
          value: '',
          options: [
            {
              text: 'همه',
              value: '1',
            },
            {
              text: 'رزومه ویژه',
              value: '2',
            },
            {
              text: 'ثبت آگهی',
              value: '3',
            },
          ],
        },
        {
          title: "تاریخ انقضا",
          name: "expired_at",
          required: true,
          type: "date",
          value: '',
        },
      ],
    };
  },
  created() {
    console.log("context:", this.context);
  },
  // create new coupon
  methods: {   
    async create_coupon() {

      let data = {}
      for (const f of this.fields) {
        // =>check required fields
        if (f.required && (!f.value || f.value == '')) {
          showErrorToast('خواهشا فیلد های الزامی رو پر کنید');
          return;
        }
        // set type to amount
        if (f.name == 'amount') {
          data[this.fields.find((i) => i.name === "type").value] = f.value
        }
        else {
          // =>set field value
          data[f.name] = f.value;
        }
      }
      // =>send data to server
      console.log(data)
      let res = await callStdAPI(this.context.url, {
        data: data,
        method: 'put',
      });
      if (res.status === 200) {
        iziToast.success({ title: 'انجام شد', message: 'کوپن با موفقیت ایجاد گردید' });
      }
      else {
        iziToast.warning({ title: 'کوپن شما ثبت نشد,', message: 'لطفا دوباره تلاش کنید' });
      }
    },
    // go to coupons list page
    redirect(url) {
      redirect(url)
    },
  },
  // add form builder component
  components: {
    'form-builder': form_builder,
  },  
};
