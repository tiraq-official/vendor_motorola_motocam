#
# Prebuilt resource overlays.
#
# android_app_import can only install into app/ or priv-app/, and
# PRODUCT_COPY_FILES refuses .apk files outright ("use BUILD_PREBUILT instead"),
# so the two Motorola settings-provider RROs are plain make prebuilts. They must
# land in <partition>/overlay or PackageManager never scans them as overlays.
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := MotoSettingsProviderOverlayDPPCamera
LOCAL_MODULE_OWNER := motorola
LOCAL_SRC_FILES := proprietary/product/overlay/MotoSettingsProviderOverlayDPPCamera.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/overlay
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := MotorolaSettingsProvider__fogos_g__auto_generated_rro_product
LOCAL_MODULE_OWNER := motorola
LOCAL_SRC_FILES := proprietary/product/overlay/MotorolaSettingsProvider__fogos_g__auto_generated_rro_product.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/overlay
include $(BUILD_PREBUILT)
