### content of /config/settings_append.py appended to the end of website1/settings.py by djangocms-installer ###
# 
#   many ways to extend & modularize Django settings: https://code.djangoproject.com/wiki/SplitSettings
#   and http://stackoverflow.com/questions/1626326/how-to-manage-local-vs-production-settings-in-django
#
# SETTINGS TREE:
#     settings.py (base settings created by installer)
#     settings_append.py (append common settings below, which become part of settings.py during installation)
#
#         settings_production.py (imports settings.py, then override & extend it)
#             
#         settings_debug.py (imports settings.py, then override & extend it, set debug variables, etc.)
#               
# 

print "---------- settings.py has been applied ----------"
