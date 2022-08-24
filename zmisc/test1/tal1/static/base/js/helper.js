function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function getCsrfToken() {
    return getCookie('csrftoken');
}

async function getAxios(options = { content_type: 'application/json' }) {
    const instance = axios.create({
        // baseURL: 'https://some-domain.com/api/',
        timeout: 10000,
        headers: {
            'X-CSRFToken': getCsrfToken(),
            'Content-Type': options.content_type,
        },
    });

    return instance;
}

/**
 *
 * @param {*} url
 * @param {*} options
 * @returns {
 *  "status": number, //200, 404,...
 *  "data": any,
 *  "message"?: string,
 *  "pagination"?: {}
 * }
 */
async function callStdAPI(url, options = {
    method: 'post',
    data: {},
}) {
    return new Promise(async (res) => {
        // =>if 'GET' method
        if ((options.method.toLowerCase() === 'get' || options.method.toLowerCase() === 'delete') && typeof options.data === 'object') {
            let params = [];
            for (const key of Object.keys(options.data)) {
                params.push(`${key.trim()}=${encodeURIComponent(options.data[key])}`);
            }
            if (params.length > 0) {
                url += '?' + params.join('&');
            }
        }
        // =>create axios instance
        let instance = await getAxios();
        instance({
            method: options.method,
            url: url,
            data: options.data,
        })
            .then(response => {
                let data = response.data;
                if (!data) {
                    data = {
                        status: 200,
                        data: '',
                    };
                }
                res(data);
            })
            .catch(error => {
                console.error('api error respons', error);
                if (error.response && error.response.data && error.response.data.status) {
                    res({
                        status: error.response.data.status,
                        data: error.response.data.data,
                    });
                } else {
                    res({
                        status: 404,
                        data: '',
                    });
                }
            });

    });
}


async function callAPI(url, data, method = 'post') {
    return new Promise(async (res) => {
        // =>if 'GET' method
        if (method.toLowerCase() === 'get' && typeof data === 'object') {
            url += '?';
            for (const key of Object.keys(data)) {
                url += `${key}=${encodeURIComponent(data[key])}`;
            }
        }
        // =>create axios instance
        let instance = await getAxios();
        instance({
            method: method,
            url: url,
            data: data,
        })
            .then(response => {
                res(['success', response]);
            })
            .catch(error => res(['error', error]))

    });
}

async function sendAjaxRequest(url, body = {}, method = 'post') {
    return await fetch(url, {
        method: method,
        headers: {
            'Accept': 'text/html',
            'Content-Type': 'application/json',
            'X-CSRFToken': getCsrfToken()
        },
        mode: 'same-origin',
        body: JSON.stringify(body),
    });
}

function bookMark(url, pk, id) {
    let path = url.replace('0', pk);
    const csrftoken = getCookie('csrftoken');
    let method;
    if ($('#' + id).text() === "bookmark") {
        method = 'DELETE';
    } else {
        method = 'PUT';
    }
    if ($('#' + id).text() === 'bookmark') {
        $('#' + id).text('bookmark_border');
    } else {
        $('#' + id).text('bookmark');
    }
    (async () => {
        const rawResponse = await fetch(path, {
            method: method,
            headers: {
                'Accept': 'text/html',
                'Content-Type': 'application/json',
                'X-CSRFToken': csrftoken
            },
            mode: 'same-origin',
        });
        const content = await rawResponse;
        if (!(content.status === 200 || content.status === 201)) {
            console.log("OK");
            if ($('#' + id).text() === 'bookmark') {
                $('#' + id).text('bookmark_border');
            } else {
                $('#' + id).text('bookmark');
            }
        }
    })();
}

function redirect(url, pk = null) {
    window.location.href = url.replace('0', pk);
}


iziToast.settings({
    timeout: 7000,
    resetOnHover: true,
    transitionIn: 'flipInX',
    transitionOut: 'flipOutX',
    rtl: true,
    position: 'topRight',
    onOpen: function () {
        //   console.log('callback abriu!');
    },
    onClose: function () {
        //   console.log("callback fechou!");
    }
});

function showSuccessToast(title, message = '') {
    iziToast.success({
        title: title,
        message: message,
    });
}

function showErrorToast(title, message = '') {
    iziToast.error({
        title: title,
        message: message,
    });
}

function showWarningToast(title, message = '') {
    iziToast.warning({
        title: title,
        message: message,
    });
}

async function confirmToast(message) {
    return new Promise((res) => {
        iziToast.question({
            timeout: 20000,
            close: false,
            overlay: true,
            displayMode: 'once',
            id: 'question',
            zindex: 999,
            // title: 'Hey',
            message: message,
            position: 'center',
            buttons: [
                ['<button class="ui blue button">بله</button>', function (instance, toast) {

                    instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
                    res(true);
                }, true],
                ['<button class="ui red button">خیر</button>', function (instance, toast) {

                    instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
                    res(false);
                }],
            ],
            onClosing: function (instance, toast, closedBy) {
                console.info('Closing | closedBy: ' + closedBy);
            },
            onClosed: function (instance, toast, closedBy) {
                console.info('Closed | closedBy: ' + closedBy);
            }
        });
    });

}

async function getFileUrlById(id) {
    let res = await callStdAPI('/api/file-upload', {
        method: 'get',
        data: { 'id': id }
    });
    if (res.status === 200) {
        return encodeURI(res.data);
    }
    return undefined;
}

async function getConfig(namespace, key = undefined, apiUrl = '/api/config/') {
    let data = { namespace };
    if (key) {
        data['key'] = key;
    }
    let config = await callStdAPI(apiUrl, {
        method: 'get',
        data: data,
    });
    // =>if success
    if (config.status === 200) {
        return config.data;
    }
    return undefined;
}

async function getLocation(country = undefined, state = undefined, id = undefined, apiUrl = '/api/location/') {
    // =>get location object by id
    if (id) {
        let location = await callStdAPI(apiUrl, {
            method: 'get',
            data: { id },
        });
        return location.data;
    }
    // =>load all countries from server
    if (!country) {
        let countries = await callStdAPI(apiUrl, {
            method: 'get',
        });
        return countries.data;
    }
    // =>load all states list of country from server
    if (country && !state) {
        let states = await callStdAPI(apiUrl, {
            method: 'get',
            data: {
                country: country,
            },
        });
        return states.data
    }
    // =>load all city list of state from server
    if (country && state) {
        let cities = await callStdAPI(apiUrl, {
            method: 'get',
            data: {
                country: country,
                state: state,
            },
        });
        let citiesOptions = [];
        for (const city of cities.data) {
            citiesOptions.push({
                text: city.name,
                value: city.id,
            });
        }
        return citiesOptions;
    }
}


function getKeyValues() {
    return {
        'gender': [
            {
                text: 'مجرد',
                value: 'single',
            },
            {
                text: 'متأهل',
                value: 'married',
            },
        ],
        'marital_status': [
            {
                text: 'مجرد',
                value: 'single',
            },
            {
                text: 'متأهل',
                value: 'married',
            },
        ],
        'skill_levels': [
            {
                text: 'در حد آشنایی',
                value: '0',
            },
            {
                text: 'کم',
                value: '1',
            },
            {
                text: 'متوسط',
                value: '2',
            },
            {
                text: 'مسلط',
                value: '3',
            },
        ],
        'language_levels': [
            {
                text: 'در حد آشنایی',
                value: '0',
            },
            {
                text: 'کم',
                value: '1',
            },
            {
                text: 'متوسط',
                value: '2',
            },
            {
                text: 'مسلط',
                value: '3',
            },
            {
                text: 'زبان مادری',
                value: '4',
            },
        ],
        'language_names': [
            {
                text: 'فارسی',
                value: 'farsi',
            },
            {
                text: 'English',
                value: 'english',
            },
            {
                text: 'اردو',
                value: 'urd',
            },
            {
                text: 'العربية',
                value: 'arabic',
            },
            {
                text: '한국어',
                value: 'korean',
            },
            {
                text: 'Deutsch',
                value: 'german',
            },
            {
                text: 'Français',
                value: 'france',
            },
            {
                text: 'Español',
                value: 'spanish',
            },
            {
                text: 'Русский',
                value: 'russian',
            },
            {
                text: 'Italiano',
                value: 'italian',
            },
            {
                text: 'Türkçe',
                value: 'turkish',
            },
            {
                text: '中文',
                value: 'chineese',
            },
            {
                text: 'Հայերեն',
                value: 'armenian',
            },
            {
                text: '日本語',
                value: 'japaneese',
            },
            {
                text: 'Latina',
                value: 'latin',
            },
        ],
        'degree_level': [
            {
                text: 'زیر دیپلم',
                value: 'under_diplom',
            },
            {
                text: 'دیپلم',
                value: 'diplom',
            },
            {
                text: 'کاردانی',
                value: 'kardani',
            },
            {
                text: 'کارشناسی',
                value: 'karshenasi',
            },
            {
                text: 'کارشناسی ارشد',
                value: 'arshad',
            },
            {
                text: 'دکتری',
                value: 'dr',
            },
            {
                text: 'فوق دکتری',
                value: 'up_to_dr',
            },
        ],
        'military_status': [
            {
                text: 'مشمول',
                value: 'inductee',
            },
            {
                text: 'معاف',
                value: 'exempt',
            },
            {
                text: 'در حال خدمت',
                value: 'Serving',
            },
            {
                text: 'پایان خدمت',
                value: 'end_Serving',
            },
        ],
        'business_trip': [
            {
                text: "سفر کاری منظم",
                value: "trip1",
            },
            {
                text: "سفر کاری در صورت نیاز",
                value: "trip2",
            },
            {
                text: "سفر کاری ندارد",
                value: "not",
            },
        ],
        'job_gender': [
            {
                text: "آقا",
                value: "male",
            },
            {
                text: "خانم",
                value: "female",
            },
            {
                text: "ترجیحا آقا",
                value: "most_male",
            },
            {
                text: "ترجیحا خانم",
                value: "most_female",
            },
        ],
        'education_status': [
            {
                text: "در حال تحصیل",
                value: "studying",
            },
            {
                text: "اتمام تحصیل",
                value: "complete",
            },
            {
                text: "مهم نیست",
                value: "no_matter",
            },

        ],
        'cooperate': [
            {
                text: "تمام وقت",
                value: "full",
            },
            {
                text: "پاره وقت",
                value: "part",
            },
            {
                text: "دورکاری",
                value: "remote",
            },
            {
                text: "کارآموزی",
                value: "intership",
            },
            {
                text: "پروژه ای",
                value: "project",
            },
        ],
        'gender': [
            {
                text: "مذکر",
                value: "male",
            },
            {
                text: "مونث",
                value: "female",
            },

        ],
        'marital_status': [
            {
                text: "مجرد",
                value: "single",
            },
            {
                text: "متاهل",
                value: "married",
            },
        ],
        'company_type': [
            {
                text: 'دولتی',
                value: 'govermenti',
            },
            {
                text: 'نیمه خصوصی',
                value: 'half_private',
            },
            {
                text: 'خصوصی',
                value: 'private',
            },
        ],
        'employees_range': [
            {
                text: 'زیر ۱۰ نفر',
                value: '1',
            },
            {
                text: 'از ۱۱ تا ۵۰ نفر',
                value: '2',
            },
            {
                text: 'از ۵۱ تا ۲۰۰ نفر',
                value: '3',
            },
            {
                text: 'از ۲۰۱ تا ۱۰۰۰ نفر',
                value: '4',
            },
            {
                text: 'بالای ۱۰۰۰ نفر',
                value: '5',
            },
        ],
        'university_type': [
            {
                text: 'دولتی',
                value: 'dolati',
            },
            {
                text: 'آزاد',
                value: 'azad',
            },
            {
                text: 'پیام نور',
                value: 'payamnoor'
            },
            {
                text: 'علمی کاربردی',
                value: 'karbordi',
            },
            {
                text: 'غیر انتفاعی',
                value: 'entefai',
            },
            {
                text: 'سایر',
                value: 'other'
            },
        ],
    };
}

function getKeyValueText(namespace, key = undefined, def = undefined) {
    let keyValues = getKeyValues();
    if (key === undefined) {
        return keyValues[namespace];
    } else {
        let el = keyValues[namespace].find(i => i.value == key);
        if (!el) return def;
        return el.text;
    }
}
/**
 * 
 * @param {*} namespace 
 * @param {*} valueKey like value , value.title
 * @returns list of objects {text: string, value: string}
 */
async function getConfigsAsKeyValues(namespace, valueKey = 'value') {
    // =>get configs list
    let configs = await getConfig(namespace);
    let keyValues = [];
    for (const conf of configs) {
        let value = '';
        // =>get value by key
        if (valueKey.indexOf('.') > -1) {
            // console.log('fgf:', config, sp)
            let sp = header.value.split('.');
            value = conf.value[sp[0]][sp[1]];
        } else {
            value = conf.value;
        }
        // =>add new key value
        keyValues.push({
            value: conf.key,
            text: value,
        });
    }
    return keyValues;
}

function toPersianDate(date, format = '') {
    persianDate.toLocale('fa');
    return new persianDate(date).format(format); // "۱۳۹۶-۰۶-۱۷ ۰۰:۰۰:۰۰ ق ظ"
}

function checkFormRequiredFields(fields = [], returnFields = false) {
    let invalidForm = false;
    // =>iterate fields
    for (const f of fields) {
        f.hasError = false;
        // =>check for validations
        if (f.validations) {
            for (const val of f.validations) {
                let raiseError = false;
                for (const reg of val.match) {
                    if (!reg.test(f.value)) {
                        raiseError = true;
                        break;
                    }
                }
                // =>if raise error
                if (raiseError) {
                    showErrorToast(val.error);
                    console.warn(`field ${f.name} is invalid match!`, f.value);
                    f.hasError = true;
                    invalidForm = true;
                    break;
                }
            }
        }
        // =>check for required
        if (f.required && f.value === undefined) {
            console.warn(`field ${f.name} is empty!`);
            f.hasError = true;
            if (!invalidForm) {
                showErrorToast('لطفا فیلد های الزامی را پر کنید.');
            }
            invalidForm = true;
            break;
        }
    }
    if (returnFields) {
        return { 'result': !invalidForm, fields };
    }
    return !invalidForm;
}

function humanizePrice(price = 0) {
    price = String(price).split("").reverse().join('');
    let hPrice = '';
    let counter = 0;
    // console.log('price:', price)
    for (let i = 0; i < price.length; i++) {
        hPrice += price[i];
        counter++;
        if (counter === 3) {
            hPrice += ',';
            counter = 0;
        }

    }
    return convertNumbersToPersian(hPrice.split("").reverse().join(''));
}

async function goToPayment(type = 'job_request', argvs = {}) {
    let res1 = {};
    // =>if type job request
    if (type === 'job_request') {
        // =>get payment hash
        res1 = await callStdAPI('/jobs/api/job_payment', {
            data: { id: argvs.job_id },
            method: 'get',
        });
        // =>if failed
        if (res1.status !== 200) {
            showErrorToast('مشکلی در انتشار آگهی بوجود آمده است.');
            return;
        }
    }
    // =>if type specialize resume
    else if (type === 'specialize_resume') {
        let data = { job_id: argvs.job_id };
        if (argvs.is_exist) {
            data['is_exist'] = argvs.is_exist;
        }
        // =>get payment hash
        res1 = await callStdAPI(PUBLIC_URLS.resume_special_payment_api, {
            data: data,
            method: 'get',
        });
        // =>if failed
        if (res1.status !== 200) {
            showErrorToast('مشکلی در ارسال رزومه بوجود آمده است.');
            return false;
        }
    }
    return new Promise((res) => {
        setTimeout(() => {
            // =>get payment hash
            let paymentHash = res1.data;
            // =>go to payment page
            window.location.href = "/payment/info?payment_hash=" + paymentHash;
            res(true);
        }, 100);
    });
}

function convertNumbersToPersian(str) {
    if (str === undefined || str === null) return '';
    if (typeof str !== 'string') str = String(str);
    let newStr = '';
    let englishNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    let persianNumbers = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    for (let i = 0; i < str.length; i++) {
        let exist = false;
        for (let j = 0; j < englishNumbers.length; j++) {
            if (str[i] == englishNumbers[j]) {
                newStr += persianNumbers[j];
                exist = true;
                break;
            }
        }
        if (!exist) {
            newStr += str[i];
        }
    }
    return newStr;
}

function getQueryParam(key, def = undefined) {
    var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has(key)) {
        return urlParams.get(key);
    }
    return def;
}

// change html value to text
function parseHtml(html = "") {
    html = html.replace(/&lt;/g, '<');
    html = html.replace(/&gt;/g, '>');
    html = html.replace(/&amp;/g, '&');
    html = html.replace(/&quot;/g, '"');
    html = html.replace(/&zwnj;/g, '‌');
    return html;
}

// Translate Array value to Persian with getKeyValue function
function getKeyValueArray(namespace, array) {
    let resault = [];
    for (let i in array) {
        resault.push(getKeyValueText(namespace, array[i]));
    }
    return resault;
}

// Translate array value with getConfig function
async function getConfigArray(namespace, array) {
    let resault = [];
    for (let i in array) {
        resault.push(await getConfig(namespace, array[i]));
    };
    return resault;
}

function goToPage(url) {
    // =>check role exist, and not set to url
    if (url.indexOf('role=') === -1 && getQueryParam('role')) {
        if (url.indexOf('?') === -1) {
            url += '?role=' + getQueryParam('role');
        } else {
            if (url.endsWith('/')) {
                url = url.substring(0, url.length - 1);
            }
            url += '&role=' + getQueryParam('role');
        }
    }
    // =>redirect to page
    window.location.href = url;
}

async function isUserLogin(returnUserInfo = false) {
    let res = await callStdAPI(PUBLIC_URLS.user_info_api, {
        method: 'get'
    });
    // =>if success
    if (res.status === 200) {
        if (returnUserInfo) return res.data;
        return true;
    }
    if (returnUserInfo) return undefined;
    return false;
}