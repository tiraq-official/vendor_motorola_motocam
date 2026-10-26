#
# Copyright (C) 2008 - 2025 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# SOONG NAMESPACES
PRODUCT_SOONG_NAMESPACES += \
    vendor/motorola/motocamera

PRODUCT_COPY_FILES += \
    vendor/motorola/motocamera/proprietary/product/etc/sysconfig/initial-package-stopped-states-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/initial-package-stopped-states-com.motorola.camera3.xml \
    vendor/motorola/motocamera/proprietary/product/etc/sysconfig/hiddenapi-whitelist-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hiddenapi-whitelist-com.motorola.camera3.xml \
    vendor/motorola/motocamera/proprietary/product/etc/permissions/privapp-permissions-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.motorola.camera3.xml \
    vendor/motorola/motocamera/proprietary/product/etc/permissions/deviceowner-configuration-com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/deviceowner-configuration-com.motorola.camera3.xml \
    vendor/motorola/motocamera/proprietary/product/etc/permissions/com.motorola.moto-uirefresh.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.moto-uirefresh.xml \
    vendor/motorola/motocamera/proprietary/product/etc/permissions/com.motorola.camera3.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.xml \
    vendor/motorola/motocamera/proprietary/product/etc/permissions/com.motorola.camera3.content.ai.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.content.ai.xml \
    vendor/motorola/motocamera/proprietary/product/etc/permissions/com.motorola.camera3.fogos.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.fogos.xml \
    vendor/motorola/motocamera/proprietary/product/etc/permissions/com.motorola.camera3.lens.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.motorola.camera3.lens.xml \
    vendor/motorola/motocamera/proprietary/system/etc/permissions/moto-settings.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/moto-settings.xml \
    vendor/motorola/motocamera/proprietary/system/etc/permissions/moto-core_services.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/moto-core_services.xml \
    vendor/motorola/motocamera/proprietary/system/etc/permissions/com.motorola.motosignature.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.motorola.motosignature.xml

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
    libancbase_fd
