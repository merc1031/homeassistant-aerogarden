import logging

from homeassistant.helpers.discovery import load_platform
from homeassistant.const import CONF_USERNAME, CONF_PASSWORD, CONF_HOST

from . import aerogarden

_LOGGER = logging.getLogger(__name__)


def setup(hass, config):
    """ Setup the aerogarden platform """

    username = config[aerogarden.DOMAIN].get(CONF_USERNAME)
    password = config[aerogarden.DOMAIN].get(CONF_PASSWORD)
    host = config[aerogarden.DOMAIN].get(CONF_HOST)

    _LOGGER.info("Config data %s" % (config[aerogarden.DOMAIN]))

    ag = aerogarden.AerogardenAPI(username, password, host)
    if not ag.is_valid_login():
         _LOGGER.error("Invalid login: %s" % (ag.error))
         return

    ag.update()

    # store the aerogarden API object into hass data system
    hass.data[aerogarden.DATA_AEROGARDEN] = ag

    load_platform(hass, 'sensor', aerogarden.DOMAIN, {}, config)
    load_platform(hass, 'binary_sensor', aerogarden.DOMAIN, {}, config)
    load_platform(hass, 'light', aerogarden.DOMAIN, {}, config)

    return True

