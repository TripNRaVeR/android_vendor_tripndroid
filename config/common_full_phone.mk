# Inherit common stuff
$(call inherit-product, vendor/tripndroid/config/common_full.mk)

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=QuietlyBrilliant.ogg \
    ro.config.notification_sound=MessageAlert.ogg \
    ro.config.alarm_alert=CyanAlarm.ogg

PRODUCT_PACKAGES += \
  Mms
