
##############################################################
#
# ACCELEROMETER-I2C
#
##############################################################

#Reference to the accelerometer userspace code(Pranav's repo)
ACCELEROMETER_I2C_VERSION = ddc3bdd37fe21703644ffb02f2c80aab1ac5aa85
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
ACCELEROMETER_I2C_SITE = git@github.com:cu-ecen-aeld/final-project-prvbharadwaj1731.git
ACCELEROMETER_I2C_SITE_METHOD = git
ACCELEROMETER_I2C_GIT_SUBMODULES = YES

define ACCELEROMETER_I2C_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/accelerometer-i2c clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/accelerometer-i2c all
endef

# Installing the i2c_userspace executable
define ACCELEROMETER_I2C_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/accelerometer-i2c/aesd_test $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
