# this settings_production.py is used by uWSGI when starting djangocms
import os
# import common settings from settings.py
try:
    from website1.settings import *
except ImportError:
    pass

## see here for more production settings: https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/
DEBUG = False
TEMPLATE_DEBUG = False

ALLOWED_HOSTS = ${CMS_ALLOWED_HOSTS}
SECRET_KEY = '${CMS_SECRET_KEY}'

## add apps:
INSTALLED_APPS +=  ('djangocms_snippet',
)

## add modules: (merging 2 dictionaries)
MIGRATION_MODULES_APPEND =    {'djangocms_snippet': 'djangocms_snippet.migrations_django',
}

MIGRATION_MODULES.update(MIGRATION_MODULES_APPEND) 

print "---------- settings_production.py has been applied ----------"