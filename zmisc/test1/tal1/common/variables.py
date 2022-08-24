import json

DEFAULT_CONFIGS = [
    {
        'namespace': 'price',
        'key': 'specialize_resume',
        'value': '1000',
        'data_type': 'number',
    },
    {
        'namespace': 'price',
        'key': 'submit_job',
        'value': '10000',
        'data_type': 'number',
    },
    {
        'namespace': 'price',
        'key': 'immediate_job',
        'value': '2000',
        'data_type': 'number',
    },
    {
        'namespace': 'price',
        'key': 'minimum_amount',
        'value': '1000',
        'data_type': 'number',
    },
    {
        'namespace': 'time',
        'key': 'job_expire_day',
        'value': '30',
        'data_type': 'number',
    },
    {
        'namespace': 'url',
        'key': 'signup',
        'value': 'https://domain.local/register/',
        'data_type': 'string',
    },
    {
        'namespace': 'job',
        'key': 'management',
        'value': {"title": "مدیریت"},
        'data_type': 'object',
        'just_local': True,
    },
    {
        'namespace': 'job',
        'key': 'programmer',
        'value': {"title": "برنامه نویس"},
        'data_type': 'object',
        'just_local': True,
    },
    {
        'namespace': 'system',
        'key': 'token_expire_hour',
        'value': '12',
        'data_type': 'number',
    },
    {
        'namespace': 'resume',
        'key': 'percent',
        'value': '30',
        'data_type': 'number',
    },
    {
        'namespace': 'system',
        'key': 'otp_url',
        'value': 'https://test123.domain.local/api/authentication/otp-request/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'token_url',
        'value': 'https://test123.domain.local/api/token/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'authenticate_url',
        'value': 'https://test123.domain.local/api/Authentication/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'customer_certificates',
        'value': 'https://test123.domain.local/api/certificates/{customerId}/certificates/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'certificate',
        'value': 'https://test123.domain.local/api/Certificates/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'all_course',
        'value': 'https://test123.domain.local/api/Courses/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'course',
        'value': 'https://test123.domain.local/api/Courses',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'customer_nationalCode',
        'value': 'https://test123.domain.local/api/customers/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'all_customers',
        'value': 'https://test123.domain.local/api/Customers/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'customer_id',
        'value': 'https://test123.domain.local/api/Customers/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'customer_enrollment',
        'value': 'https://test123.domain.local/api/enrollments/{customerId}/enrollments/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'enrollments',
        'value': 'https://test123.domain.local/api/Enrollments/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'course_products',
        'value': 'https://test123.domain.local/api/products/{courseId}/products/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'products',
        'value': 'https://test123.domain.local/api/Products/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'product_id',
        'value': 'https://test123.domain.local/api/Products/',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'ifc_admin_username',
        'value': 'name@gmail.com',
        'data_type': 'string',
    },
    {
        'namespace': 'system',
        'key': 'ifc_admin_password',
        'value': 'pass',
        'data_type': 'string',
    },
    {
        'namespace': 'job_info',
        'key': 'management',
        'value': {"title": "مدیریت", "description": "شغل مدیریت یک شغل سطح بالاست", "salary_range": "۵ تا ۷ میلیون تومان", "educations": ["تحصیلات ۱", "تحصیلات ۲"], "duties":["وظیفه اول", "وظیفه دوم", "وظیفه سوم"], "certificates":["دارای مدرک MBA", "مدرک ۲", "مدرک ۳"]},
        'data_type': 'object',
        'just_local': True,
    },
    {
        'namespace': 'job_info',
        'key': 'programmer',
        'value': {"title": "برنامه نویسی", "description": "شغل برنامه نویسی یک شغل خیلی سطح بالاست", "salary_range": "۵ تا ۷ میلیون تومان", "educations": ["تحصیلات ۱", "تحصیلات ۲"], "duties":["وظیفه اول", "وظیفه دوم", "وظیفه سوم"], "certificates":["دارای مدرک CCNA", "مدرک ۲", "مدرک ۳"]},
        'data_type': 'object',
    },
    {
        'namespace': 'salary_range',
        'key': '2_3',
        'value': "۲ تا ۳ میلیون تومان",
        'data_type': 'string',
    },
    {
        'namespace': 'salary_range',
        'key': '3_5',
        'value': "۳ تا ۵ میلیون تومان",
        'data_type': 'string',
    },
    {
        'namespace': 'salary_range',
        'key': '5_10',
        'value': "۵ تا ۱۰ میلیون تومان",
        'data_type': 'string',
    },
    {
        'namespace': 'salary_range',
        'key': '10_up',
        'value': "بیشتر از ۱۰ میلیون تومان",
        'data_type': 'string',
    },
    {
        'namespace': 'university',
        'key': 'yazd_uni',
        'value': {"title": "دانشگاه", "type": "سراسری"},
        'data_type': 'object',
        'just_local': True,
    },
    {
        'namespace': 'university',
        'key': 'azad_yazd_uni',
        'value': {"title": "دانشگاه آزاد", "type": "آزاد"},
        'data_type': 'object',
        'just_local': True,
    },
    {
        'namespace': 'static_page',
        'key': 'rules',
        'value': {"text": "<p>متن صفحه قوانین و مقررات را اینجا وارد کنید</p>"},
        'data_type': 'object',
    },
    {
        'namespace': 'static_page',
        'key': 'about_us',
        'value': {"text": "<p>متن صفحه درباره ما را اینجا وارد کنید</p>"},
        'data_type': 'object',
    },
    {
        'namespace': 'static_page',
        'key': 'about_resume',
        'value': {"text": "<p>متن صفحه درباره رزومه ساز را اینجا وارد کنید</p>"},
        'data_type': 'object',
    },
    {
        'namespace': 'static_page',
        'key': 'exams',
        'value': {"text": "<p>متن صفحه آزمون ها را اینجا وارد کنید</p>"},
        'data_type': 'object',
    },
    {
        'namespace': 'static_page',
        'key': 'kanoon',
        'value': {"text": "<p>متن صفحه ارزیابی و توسعه را اینجا وارد کنید</p>"},
        'data_type': 'object',
    },
    
    {
        'namespace': 'contact',
        'key': 'copy_right',
        'value': 'هیواتک',
        'data_type': 'string',
    },
    {
        'namespace': 'url',
        'key': 'copy_right',
        'value': 'https://domain.local',
        'data_type': 'string',
    },
    {
        'namespace': 'contact',
        'key': 'address',
        'value': 'address',
        'data_type': 'string',
    },
    {
        'namespace': 'contact',
        'key': 'phone',
        'value': '1234',
        'data_type': 'string',
    },
    {
        'namespace': 'contact',
        'key': 'about_us',
        'value': 'about',
        'data_type': 'string',
    },
    {
        'namespace': 'contact',
        'key': 'email',
        'value': 'info@domain.com',
        'data_type': 'string',
    },
    {
        'namespace': 'url',
        'key': 'about',
        'value': 'https://www.domain.local/introducing-iran-financial-center/',
        'data_type': 'string',
    },
    {
        'namespace': 'url',
        'key': 'contact',
        'value': 'https://www.domain.local/contacts/',
        'data_type': 'string',
    },
    {
        'namespace': 'useful_links',
        'key': 'قوانین و مقررات',
        'value': 'https://boursetalent.domain.local/rules/',
        'data_type': 'string',
        'just_local': True,
    },
    {
        'namespace': 'useful_links',
        'key': 'درباره‌ی بورس ',
        'value': 'https://xyz.domain.local/about_us/',
        'data_type': 'string',
        'just_local': True,
    },
    {
        'namespace': 'social_media',
        'key': 'aparat',
        'value': '#',
        'data_type': 'string',
    },
    {
        'namespace': 'social_media',
        'key': 'instagram',
        'value': '#',
        'data_type': 'string',
    },
    {
        'namespace': 'social_media',
        'key': 'telegram',
        'value': '#',
        'data_type': 'string',
    },
    {
        'namespace': 'social_media',
        'key': 'facebook',
        'value': '#',
        'data_type': 'string',
    },
    {
        'namespace': 'social_media',
        'key': 'linkedin',
        'value': '#',
        'data_type': 'string',
    },
    {
        'namespace': 'social_media',
        'key': 'twitter',
        'value': '#',
        'data_type': 'string',
    },
    {
        'namespace': 'social_media',
        'key': 'youtube',
        'value': '#',
        'data_type': 'string',
    },
    {
        'namespace': 'company_activity',
        'key': 'software',
        'value': 'نرم افزار',
        'data_type': 'string',
        'just_local': True,
    },
    {
        'namespace': 'company_activity',
        'key': 'site',
        'value': 'طراحی سایت',
        'data_type': 'string',
        'just_local': True,
    },
    {
        'namespace': 'home',
        'key': 'top_jobs',
        'value': [],
        'data_type': 'object',
        'is_array': True,
        'array_type': 'number',
    },
    #########################
    {
        'namespace': 'system',
        'key': 'expire_jobs_interval',
        'value': '24',
        'data_type': 'number',
    },
    ####################################### payment
    {
        'namespace': 'payment',
        'key': 'terminal_id',
        'value': 'id',
        'data_type': 'number',
    },
    {
        'namespace': 'payment',
        'key': 'url',
        'value': 'https://sep.shaparak.ir/MobilePG/MobilePayment',
        'data_type': 'string',
    },
    {
        'namespace': 'payment',
        'key': 'verify_url',
        'value': 'https://verify.sep.ir/Payments/ReferencePayment.asmx?wsdl',
        'data_type': 'string',
    },
    {
        'namespace': 'payment',
        'key': 'password',
        'value': 'value',
        'data_type': 'string',
    },
    # TODO: change this url
    # TODO: add multiple redirect_url for different payment types
    {
        'namespace': 'payment',
        'key': 'redirect_url',
        'value': 'https://xyz.domain.local/payment/redirect/',
        'data_type': 'string',
    },
    #################################################
    {
        'namespace': 'system',
        'key': 'backup_interval',
        'value': '72',
        'data_type': 'number',
    },
    {
        'namespace': 'sms',
        'key': 'api_key',
        'value': 'apikey',
        'data_type': 'string',
    },
    {
        'namespace': 'sms',
        'key': 'sender',
        'value': 'val',
        'data_type': 'string',
    },
    {
        'namespace': 'message',
        'key': 'jab_request',
        'value': 'سلام user عزیز'
                 '\n'
                 'آگهی job توسط شرکت company ثبت شده است.'
                 '\n'
                 'لطفا برای بررسی این آگهی اقدام کنید.',
        'data_type': 'string',
    },
    {
        'namespace': 'message',
        'key': 'job_accept',
        'value': 'سلام user عزیز'
                 '\n'
                 'آگهی job در سامانه بورس ثبت شد.',
        'data_type': 'string',
    },
    # TODO: in set config api for admin, check it's value to be from 0 to 100
    {
        'namespace': 'system',
        'key': 'min_similarity_ratio',
        'value': '70',
        'data_type': 'number',
    },
    {
        'namespace': 'study_field',
        'key': 'computer_eng',
        'value': 'مهندسی کامپیوتر',
        'data_type': 'string',
        'just_local': True,
    },
    {
        'namespace': 'study_field',
        'key': 'computer_sci',
        'value': 'علوم کامپیوتر',
        'data_type': 'string',
        'just_local': True,
    },
    {
        'namespace': 'job_experience',
        'key': 'less_1',
        'value': 'کمتر از یک سال',
        'data_type': 'string',
        'just_local': True,
    },
    {
        'namespace': 'job_experience',
        'key': 'less_2',
        'value': 'بین ۱ تا ۲ سال',
        'data_type': 'string',
        'just_local': True,
    },

]


"""
sample:
{
    'hash': 'sample_hash',
    'type': 'job_request',
    'title': 'hello payment',
    'price': 33545, # rial
    'expired_at': 32534534534,
    'vars': {},
    'final_price': 0,
    'callback_url': '/job/list',
}
"""
PAYMENT_HASH_DB = []

CONFIG_CACHE_DB = []
