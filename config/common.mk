PRODUCT_BRAND ?= tripndroid

SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# init.d support
PRODUCT_COPY_FILES += \
    vendor/tripndroid/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/tripndroid/prebuilt/common/bin/sysinit:system/bin/sysinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/tripndroid/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/tripndroid/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Nam configuration script
PRODUCT_COPY_FILES += \
    vendor/tripndroid/prebuilt/common/bin/modelid_cfg.sh:system/bin/modelid_cfg.sh

PRODUCT_COPY_FILES += \
    vendor/tripndroid/proprietary/Term.apk:system/app/Term.apk

# Copy JNI libarary of Term
ifeq ($(TARGET_ARCH),arm)
PRODUCT_COPY_FILES +=  \
    vendor/tripndroid/proprietary/lib/armeabi/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so
endif

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/tripndroid/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/tripndroid/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# CM stuff
PRODUCT_COPY_FILES += \
    vendor/tripndroid/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/tripndroid/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
include vendor/tripndroid/config/themes_common.mk

# Required packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic \
    LockClock

# Custom packages
PRODUCT_PACKAGES += \
    Trebuchet \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    vim \
    nano \
    lsof

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

PRODUCT_PACKAGE_OVERLAYS += vendor/tripndroid/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/tripndroid/overlay/common

PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0-B0

    # Set to OFFICIAL
    CM_BUILDTYPE := OFFICIAL
    CM_EXTRAVERSION :=

    CM_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(CM_BUILDTYPE)-$(CM_BUILD)$(CM_EXTRAVERSION)


PRODUCT_PROPERTY_OVERRIDES += \
  ro.tripndroid.version=$(CM_VERSION) \
  ro.modversion=$(CM_VERSION)


-include $(WORKSPACE)/hudson/image-auto-bits.mk
