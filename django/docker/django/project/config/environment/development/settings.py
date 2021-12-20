from django.conf import settings
from django.utils.translation import ugettext_lazy as _

CONTENT_DIR = settings.BASE_DIR / 'content'
DEBUG = True
ALLOWED_HOSTS = ['*']


# -------------------------------------------------------------------
# internalización
# -------------------------------------------------------------------
LANGUAGE_CODE = 'es'
TIME_ZONE = 'America/Argentina/Tucuman'
LANGUAGES = [
    ('es', _('Español')),
    ('en', _('Inglés')),
]


# -------------------------------------------------------------------
# reglas de validación para la clave de autenticación
# -------------------------------------------------------------------
AUTH_PASSWORD_VALIDATORS = []


# -------------------------------------------------------------------
# archivos estáticos, multimedia y traducciones
# -------------------------------------------------------------------
STATIC_ROOT = CONTENT_DIR / 'static' / 'assets'
STATIC_URL = '/static/'

MEDIA_ROOT = CONTENT_DIR / 'media'
MEDIA_URL = '/media/'

STATICFILES_DIRS = [CONTENT_DIR / 'static']
LOCALE_PATHS = [CONTENT_DIR / 'locale']


# -------------------------------------------------------------------
# ubicación de los templates públicos
# -------------------------------------------------------------------
settings.TEMPLATES[0]['DIRS'] = [CONTENT_DIR / 'templates']
