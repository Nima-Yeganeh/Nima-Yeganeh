from .models import Log
from typing import (
    Optional, AnyStr, Type, Text, NewType,
)
Bool = NewType('Bool', bool)
from core.views import  StandardRender
render = StandardRender.render

class Logging:

    # define log modes
    DEBUG = 'DEBUG'
    INFO = 'INFO'
    WARNING = 'WARNING'
    ERROR = 'ERROR'
    CRITICAL = 'CRITICAL'
    CUSTOM = 'CUSTOM'

    def __main_log(**kwargs):
        """
        save a log to Log table

        The argument should contain:
            * namespace
            * mode

        It can include:
            * log_type  (it a sub namespace)
            * var1      (max length = 100)
            * var2      (no length limit)
            * user_id
            * user_ip

        sample call:
            * log(namespace='n1', log_type='t1', mode='info', var1='some thing happened')

            * input = {'namespace':'n1', 'mode':'info'}
            * log(**input)
        """
        try:
            log = Log(**kwargs)
            log.save()
            return True
        except Exception as e:
            # print("ERROR: couldn't save log: %s!" %e)
            return False


    @staticmethod
    def info_log(namespace: Text, request, log_type: Optional[Text] = '' ,var1: Optional[Text] = '', var2: Optional[Text] = '', options: Optional[dict] = {}) -> Bool:
        """
        save an INFO log to Log table

        The argument should contain:
            * namespace
            * request


        It can include:
            * log_type  (it a sub namespace)
            * var1      (max length = 100)
            * var2      (no length limit)


        sample call:
            * info_log(namespace='n1', request=request, log_type='t1', var1='some thing happened')

            * input = {'namespace':'n1', 'request':request}
            * info_log(**input)
        """
        mode = Logging.INFO

        user_ip = Logging.__get_client_ip(request)
        input_dict = {'namespace':namespace,'log_type':log_type, 'mode':mode, 'var1':var1, 'var2':var2, 'user_ip':user_ip }
        if options.get('user'):
            input_dict['user_id'] = options.get('user')
        elif request.user.is_authenticated:
            input_dict['user_id'] = request.user

        return Logging.__main_log(**input_dict)


    @staticmethod
    def warning_log(namespace: Text, request, log_type: Optional[Text] = '' ,var1: Optional[Text] = '', var2: Optional[Text] = '', options: Optional[dict] = {}) -> Bool:
        """
        save a WARNING log to Log table

        The argument should contain:
            * namespace
            * request


        It can include:
            * log_type  (it a sub namespace)
            * var1      (max length = 100)
            * var2      (no length limit)


        sample call:
            * warning_log(namespace='n1', request=request, log_type='t1', var1='some thing happened')

            * input = {'namespace':'n1', 'request':request}
            * warning_log(**input)
        """
        mode = Logging.WARNING

        user_ip = Logging.__get_client_ip(request)
        input_dict = {'namespace':namespace,'log_type':log_type, 'mode':mode, 'var1':var1, 'var2':var2, 'user_ip':user_ip }
        if options.get('user'):
            input_dict['user_id'] = options.get('user')
        elif request.user.is_authenticated:
            input_dict['user_id'] = request.user

        return Logging.__main_log(**input_dict)


    @staticmethod
    def error_log(namespace: Text, request, log_type: Optional[Text] = '' ,var1: Optional[Text] = '', var2: Optional[Text] = '', options: Optional[dict] = {}) -> Bool:
        """
        save an ERROR log to Log table

        The argument should contain:
            * namespace
            * request


        It can include:
            * log_type  (it a sub namespace)
            * var1      (max length = 100)
            * var2      (no length limit)


        sample call:
            * error_log(namespace='n1', request=request, log_type='t1', var1='some thing happened')

            * input = {'namespace':'n1', 'request':request}
            * error_log(**input)
        """
        mode = Logging.ERROR

        user_ip = Logging.__get_client_ip(request)
        input_dict = {'namespace':namespace,'log_type':log_type, 'mode':mode, 'var1':var1, 'var2':var2, 'user_ip':user_ip }
        if options.get('user'):
            input_dict['user_id'] = options.get('user')
        elif request.user.is_authenticated:
            input_dict['user_id'] = request.user

        return Logging.__main_log(**input_dict)

    @staticmethod
    def __get_client_ip(request):
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')
        return ip


    @staticmethod
    def custom_log(namespace: Text, log_type: Optional[Text] = '', var1: Optional[Text] = '', var2: Optional[Text] = '', options: Optional[dict] = {}) -> Bool:
        """
        save an CUSTOM log to Log table
        `It doesn't need a request input`

        The argument should contain:
            * namespace

        It can include:
            * log_type  (it a sub namespace)
            * var1      (max length = 100)
            * var2      (no length limit)


        sample call:
            * custom_log(namespace='n1', log_type='t1', var1='some thing happened')

            * input = {'namespace':'n1', 'var1':'some thing happened'}
            * custom_log(**input)
        """
        mode = Logging.CUSTOM

        input_dict = {'namespace':namespace, 'mode':mode,'log_type':log_type, 'var1':var1, 'var2':var2 }
        if options.get('user'):
            input_dict['user_id'] = options.get('user')
        elif request.user.is_authenticated:
            input_dict['user_id'] = request.user
        return Logging.__main_log(**input_dict)