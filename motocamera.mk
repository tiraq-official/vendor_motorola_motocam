#
# Motorola camera stack for fogos (moto g34 5G) — full port
#
# Drop-in replacement for vendor/motorola/motocamera/motocamera.mk
#
# Notes
#  * The four vendor/etc/permissions/android.hardware.camera.*.xml files are NOT
#    copied here on purpose: device/motorola/sm6375-common/common.mk already
#    copies them from frameworks/native/data/etc to the same destination, and a
#    second copy of the same PRODUCT_COPY_FILES destination breaks the build.
#  * camera_click.ogg / camera_focus.ogg are also left out: AOSP already installs
#    those two files into $(TARGET_COPY_OUT_PRODUCT)/media/audio/ui.
#

PRODUCT_SOONG_NAMESPACES += vendor/motorola/motocamera

MOTOCAMERA := vendor/motorola/motocamera
MOTOCAMERA_PROPRIETARY := $(MOTOCAMERA)/proprietary

# Optional parts of the stock stack. Set to false in your device mk before
# inheriting this file if you do not want them.
#   MOTOCAMERA_DESKTOP     - Moto Camera Desktop app (phone-as-webcam / desktop)
#   MOTOCAMERA_IMAGERTUNING - ImagerTuning-V app + motorola.hardware.camera.imgtuner HAL
MOTOCAMERA_DESKTOP ?= true
MOTOCAMERA_IMAGERTUNING ?= true

# ---------------------------------------------------------------------------
# Apps / jars / binaries built as Soong modules
# ---------------------------------------------------------------------------
PRODUCT_PACKAGES += \
    MotoSignatureApp \
    MotCamera3AI \
    MotCamera4 \
    MotorolaSettingsProvider \
    com.motorola.motosignature \
    moto-core_services \
    moto-settings \
    motsettings \
    libAncFaceDetect \
    libancbase_fd \
    MotoSignature2App \
    CameraExtensionsProxy \
    MotoSettingsProviderOverlayDPPCamera \
    MotorolaSettingsProvider__fogos_g__auto_generated_rro_product

# ---------------------------------------------------------------------------
# /product configuration
# ---------------------------------------------------------------------------
PRODUCT_COPY_FILES += \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/sysconfig/initial-package-stopped-states-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/initial-package-stopped-states-com.motorola.camera3.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/sysconfig/hiddenapi-whitelist-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hiddenapi-whitelist-com.motorola.camera3.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/permissions/privapp-permissions-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.camera3.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/permissions/deviceowner-configuration-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/deviceowner-configuration-com.motorola.camera3.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/permissions/com.motorola.moto-uirefresh.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.moto-uirefresh.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/permissions/com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/permissions/com.motorola.camera3.content.ai.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.content.ai.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/permissions/com.motorola.camera3.fogos.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.fogos.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/permissions/com.motorola.camera3.lens.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.lens.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/permissions/feature-com.motorola.motcameradesktop.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/feature-com.motorola.motcameradesktop.xml \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/init/init.motcamera3.lens.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.motcamera3.lens.rc \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/MotoDesktopAppConfig/com.motorola.camera3.desktop-config.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/MotoDesktopAppConfig/com.motorola.camera3.desktop-config.xml

# ---------------------------------------------------------------------------
# /system configuration + the second Moto signature app
# ---------------------------------------------------------------------------
PRODUCT_COPY_FILES += \
    $(MOTOCAMERA_PROPRIETARY)/system/etc/permissions/moto-settings.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/moto-settings.xml \
    $(MOTOCAMERA_PROPRIETARY)/system/etc/permissions/moto-core_services.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/moto-core_services.xml \
    $(MOTOCAMERA_PROPRIETARY)/system/etc/permissions/com.motorola.motosignature.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.motorola.motosignature.xml

# ---------------------------------------------------------------------------
# /system_ext: Moto settings/libraries the camera binds to
# ---------------------------------------------------------------------------
PRODUCT_COPY_FILES += \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/framework/androidx.window.extensions.jar:$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/androidx.window.extensions.jar \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/framework/androidx.window.sidecar.jar:$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/androidx.window.sidecar.jar \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/androidx.window.extensions.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/androidx.window.extensions.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/androidx.window.sidecar.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/androidx.window.sidecar.xml

# ---------------------------------------------------------------------------
# /vendor: tuning data for the secondary rear sensor
# ---------------------------------------------------------------------------
PRODUCT_COPY_FILES += \
    $(MOTOCAMERA_PROPRIETARY)/vendor/lib64/camera/com.qti.sensormodule.mot_fogor_s5kjns_qtech_2nd.bin:$(TARGET_COPY_OUT_VENDOR)/lib64/camera/com.qti.sensormodule.mot_fogor_s5kjns_qtech_2nd.bin \
    $(MOTOCAMERA_PROPRIETARY)/vendor/lib64/camera/com.qti.tuned.mot_fogor_s5kjns_2nd.bin:$(TARGET_COPY_OUT_VENDOR)/lib64/camera/com.qti.tuned.mot_fogor_s5kjns_2nd.bin

# ---------------------------------------------------------------------------
# Moto Camera Desktop (optional)
# ---------------------------------------------------------------------------
ifeq ($(MOTOCAMERA_DESKTOP),true)

PRODUCT_PACKAGES += \
    MotCameraDesktop

PRODUCT_COPY_FILES += \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/framework/com.motorola.hardware.camera.desktop.jar:$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/com.motorola.hardware.camera.desktop.jar \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/com.motorola.camera.desktop.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.camera.desktop.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/privapp-permissions-com.motorola.motcameradesktop.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-com.motorola.motcameradesktop.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/sysconfig/hiddenapi-whitelist-com.motorola.motcameradesktop.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/hiddenapi-whitelist-com.motorola.motcameradesktop.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/public.libraries-motocameradesktop.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries-motocameradesktop.txt \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/enable-disable-packages/enable-disable-com.motorola.motcameradesktop.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/enable-disable-packages/enable-disable-com.motorola.motcameradesktop.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/lib64/motorola.hardware.camera.desktop@1.0.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/motorola.hardware.camera.desktop@1.0.so \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/lib64/motorola.hardware.camera.desktop@2.0.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/motorola.hardware.camera.desktop@2.0.so \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/lib64/libjni_helper.motocameradesktop.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libjni_helper.motocameradesktop.so \
    $(MOTOCAMERA_PROPRIETARY)/product/etc/init/init.motcameradesktop.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.motcameradesktop.rc

endif

# ---------------------------------------------------------------------------
# ImagerTuning-V + motorola.hardware.camera.imgtuner HAL (optional)
#
# The app reaches the HAL through com.motorola.libimgTuner.jar ->
# libimgTuner_jni.motoimagetuner.so -> motorola.hardware.camera.imgtuner.aidl.
# The camera app itself does not use any of this, so it is safe to disable.
# If you enable it, the imgtuner service needs a SELinux domain; see README.
# ---------------------------------------------------------------------------
ifeq ($(MOTOCAMERA_IMAGERTUNING),true)

PRODUCT_PACKAGES += \
    ImagerTuning-V \
    motocamera_imgtuner_aidl_service \
    motocamera_imgtuner_hidl_service

PRODUCT_COPY_FILES += \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/framework/com.motorola.libimgTuner.jar:$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/com.motorola.libimgTuner.jar \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/framework/com.motorola.imager.v.jar:$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/com.motorola.imager.v.jar \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/com.motorola.libimgTuner.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.libimgTuner.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/com.motorola.imager.v.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.imager.v.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/com.motorola.imagertuning.v.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.imagertuning.v.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/com.motorola.imagertuning.v.fogos.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.motorola.imagertuning.v.fogos.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/permissions/privapp-permissions-com.motorola.imagertuning.v.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-com.motorola.imagertuning.v.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/etc/enable-disable-packages/enable-disable-com.motorola.imagertuning_u.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/enable-disable-packages/enable-disable-com.motorola.imagertuning_u.xml \
    $(MOTOCAMERA_PROPRIETARY)/system_ext/lib64/libimgTuner_jni.motoimagetuner.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libimgTuner_jni.motoimagetuner.so \
    $(MOTOCAMERA_PROPRIETARY)/system/lib64/motorola.hardware.camera.imgtuner.aidl-V1-ndk.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/motorola.hardware.camera.imgtuner.aidl-V1-ndk.so \
    $(MOTOCAMERA_PROPRIETARY)/vendor/lib64/motorola.hardware.camera.imgtuner@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/motorola.hardware.camera.imgtuner@1.0.so \
    $(MOTOCAMERA_PROPRIETARY)/vendor/lib64/motorola.hardware.camera.imgtuner.aidl-V1-ndk_platform.so:$(TARGET_COPY_OUT_VENDOR)/lib64/motorola.hardware.camera.imgtuner.aidl-V1-ndk_platform.so \
    $(MOTOCAMERA_PROPRIETARY)/vendor/lib64/hw/motorola.hardware.camera.imgtuner@1.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/motorola.hardware.camera.imgtuner@1.0-impl.so \
    $(MOTOCAMERA_PROPRIETARY)/vendor/etc/init/motorola.hardware.camera.imgtuner.aidl-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/motorola.hardware.camera.imgtuner.aidl-service.rc \
    $(MOTOCAMERA_PROPRIETARY)/vendor/etc/init/motorola.hardware.camera.imgtuner@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/motorola.hardware.camera.imgtuner@1.0-service.rc \
    $(MOTOCAMERA_PROPRIETARY)/vendor/etc/vintf/manifest/motorola.hardware.camera.imgtuner.aidl.xml:$(TARGET_COPY_OUT_VENDOR)/etc/vintf/manifest/motorola.hardware.camera.imgtuner.aidl.xml

endif
