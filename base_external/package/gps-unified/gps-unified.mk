
##############################################################
#
# GPS_UNIFIED
#
##############################################################
$(eval $(kernel-module))
#Reference to the gps userspace code(Ganesh's repo)
GPS_UNIFIED_VERSION = 49cb63820f5263ec7eaa588e10e511c7892c2fbf
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
GPS_UNIFIED_SITE = git@github.com:cu-ecen-aeld/final-project-Ganeshkm10.git
GPS_UNIFIED_SITE_METHOD = git
GPS_UNIFIED_GIT_SUBMODULES = YES
GPS_UNIFIED_MODULE_SUBDIRS = UART_Driver/

define GPS_UNIFIED_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/Updated_Userspace_GPS clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/Updated_Userspace_GPS all

	
endef

# Installing the gps_unified executable
define GPS_UNIFIED_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/Updated_Userspace_GPS/gps_unified $(TARGET_DIR)/usr/bin

	
endef


$(eval $(generic-package))
