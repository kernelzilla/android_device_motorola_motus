#
# Copyright (C) 2008 The Android Open Source Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_PACKAGES += \
    librs_jni \
    gralloc.motus \
    copybit.motus \
    lights.motus

PRODUCT_LOCALES += mdpi

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:/system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:/system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:/system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:/system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:/system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:/system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:/system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.xml

DEVICE_PACKAGE_OVERLAYS += device/motorola/motus/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.media.dec.jpeg.memcap=20000000 \
    rild.libpath=/system/lib/libril-qc-1.so \
    ro.ril.gprsclass=10 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.setupwizard.enable_bypass=1 \
    gsm.defaultpdpcontext.active=true \
    ro.compcache.default=0 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    wifi.interface=eth0

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=45

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# set agps mode
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.def.agps.mode=1

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65536

# The kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/motus/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/motorola/motus/vold.fstab:/system/etc/vold.fstab \
    device/motorola/motus/prebuilt/bin/init.bt.sh:/system/bin/init.bt.sh \
    device/motorola/motus/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    device/motorola/motus/prebuilt/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    device/motorola/motus/prebuilt/etc/wifi/backoff.conf:/system/etc/wifi/backoff.conf \
    device/motorola/motus/prebuilt/etc/dhcpcd/dhcpcd.conf:/system/etc/dhcpcd/dhcpcd.conf \
    device/motorola/motus/prebuilt/lib/modules/dhd.ko:/system/lib/modules/dhd.ko \
    device/motorola/motus/prebuilt/lib/modules/ramzswap.ko:/system/lib/modules/ramzswap.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/fs/cifs/cifs.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/fs/cifs/cifs.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/fs/fuse/fuse.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/fs/fuse/fuse.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/fs/nfsd/nfsd.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/fs/nfsd/nfsd.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/fs/aufs/aufs.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/fs/aufs/aufs.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/fs/nfs/nfs.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/fs/nfs/nfs.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/drivers/net/tun.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/drivers/net/tun.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/net/ipv6/tunnel6.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/net/ipv6/tunnel6.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/net/sunrpc/auth_gss/rpcsec_gss_spkm3.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/net/sunrpc/auth_gss/rpcsec_gss_spkm3.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/kernel/net/sunrpc/sunrpc.ko:/system/lib/modules/2.6.29.6-motus-kz/kernel/net/sunrpc/sunrpc.ko \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/modules.dep:/system/lib/modules/2.6.29.6-motus-kz/modules.dep \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/modules.dep.bin:/system/lib/modules/2.6.29.6-motus-kz/modules.dep.bin \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/modules.alias:/system/lib/modules/2.6.29.6-motus-kz/modules.alias \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/modules.alias.bin:/system/lib/modules/2.6.29.6-motus-kz/modules.alias.bin \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/modules.symbols:/system/lib/modules/2.6.29.6-motus-kz/modules.symbols \
    device/motorola/motus/prebuilt/lib/modules/2.6.29.6-motus-kz/modules.symbols.bin:/system/lib/modules/2.6.29.6-motus-kz/modules.symbols.bin \
    device/motorola/motus/prebuilt/usr/keylayout/motus-kpd.kl:/system/usr/keylayout/motus-kpd.kl \
    device/motorola/motus/prebuilt/usr/keylayout/minipad.kl:/system/usr/keylayout/minipad.kl \
    device/motorola/motus/prebuilt/usr/keylayout/adp5588_motus.kl:/system/usr/keylayout/adp5588_motus.kl \
    device/motorola/motus/prebuilt/usr/keylayout/adp5588_motus_P1.kl:/system/usr/keylayout/adp5588_motus_P1.kl \
    device/motorola/motus/prebuilt/usr/keylayout/adp5588_motus_P2.kl:/system/usr/keylayout/adp5588_motus_P2.kl \
    device/motorola/motus/prebuilt/usr/keylayout/adp5588_motus_P3.kl:/system/usr/keylayout/adp5588_motus_P3.kl \
    device/motorola/motus/prebuilt/usr/keychars/minipad.kcm.bin:/system/usr/keychars/minipad.kcm.bin \
    device/motorola/motus/prebuilt/usr/keychars/adp5588_motus.kcm.bin:/system/usr/keychars/adp5588_motus.kcm.bin \
    device/motorola/motus/prebuilt/usr/keychars/adp5588_motus_P1.kcm.bin:/system/usr/keychars/adp5588_motus_P1.kcm.bin \
    device/motorola/motus/prebuilt/usr/keychars/adp5588_motus_P2.kcm.bin:/system/usr/keychars/adp5588_motus_P2.kcm.bin \
    device/motorola/motus/prebuilt/usr/keychars/adp5588_motus_P3.kcm.bin:/system/usr/keychars/adp5588_motus_P3.kcm.bin


## (2) Also get non-open-source aspects if available
$(call inherit-product-if-exists, vendor/motorola/motus/motus-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := motus
PRODUCT_DEVICE := motus
PRODUCT_MODEL := Full Android on Motus
