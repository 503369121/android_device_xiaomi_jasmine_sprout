#
# Copyright 2018 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := cannon-q-oss

$(call inherit-product, build/target/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit language packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

PRODUCT_PACKAGES += \
    bootctrl.MT6853

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.MT6853 \
    libgptutils \
    libz \
    libcutils

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2025-12-31

# Device identifier. This must come after all inclusions
PRODUCT_PLATFORM := MT6853V/TNZA
PRODUCT_NAME := omni_cannon-q-oss
PRODUCT_DEVICE := cannon
PRODUCT_BRAND := xiaomi
PRODUCT_MODEL := Redmi Note 9
PRODUCT_MANUFACTURER := Redmi

# add support for future ota updates
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.allow.mock.location=0
    
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="cannon-q-oss" \
    PRODUCT_NAME="cannon" \
    PRIVATE_BUILD_DESC="cannon-user 11 /RP1A.200720.011 21.6.9 release-keys"
	
TARGET_VENDOR_PRODUCT_NAME := jasmine

BUILD_FINGERPRINT := "Redmi/cannon/cannon:11/RP1A.200720.011/21.6.9:user/release-keys"

# Maintainer Prop
PRODUCT_BUILD_PROP_OVERRIDES += \
DEVICE_MAINTAINERS="LimChow"
