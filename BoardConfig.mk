# Copyright (C) 2007 The Android Open Source Project
# Copyright (C) 2011 Kinetic Computing
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

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/motorola/motus/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := msm7k
TARGET_CPU_ABI := armeabi-v6j
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6j
TARGET_BOARD_PLATFORM_GPU := qcom

TARGET_NO_BOOTLOADER := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_5_X
BOARD_WLAN_DEVICE           := dhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/firmware/fw_bcm4325.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/firmware/fw_bcm4325_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/firmware/fw_bcm4325.bin nvram_path=/system/etc/firmware/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"

BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null quiet

# enable broadcom patchram
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# accel/gps
BOARD_VENDOR_USE_AKMD := akm8973
BOARD_GPS_LIBRARIES := libgps

BOARD_VENDOR_QCOM_AMSS_VERSION := 6225

BOARD_HAVE_FM_RADIO := true

#build our own libaudio
BOARD_PROVIDES_LIBAUDIO := true

# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

# OpenGL drivers config file path
BOARD_EGL_CFG := device/motorola/motus/prebuilt/lib/egl/egl.cfg

# needed for video authoring
BOARD_NO_PV_AUTHORING_CLOCK := true
# oepncore
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
#BUILD_WITH_FULL_STAGEFRIGHT := true
#BUILD_PV_VIDEO_ENCODERS := 1
#BUILD_PV_2WAY := 1

# haptic feedback
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/motorola/motus/vibrator.c

TARGET_RELEASETOOLS_EXTENSIONS := device/motorola/common

TARGET_BOOTLOADER_BOARD_NAME := motus
TARGET_OTA_ASSERT_DEVICE := motus,backflip
TARGET_BOOTLOADER_BOARD_NAME := motus


# # cat /proc/mtd
#dev: size erasesize name
#mtd0: 00300000 00020000 "boot"
#mtd1: 08ac0000 00020000 "system"
#mtd2: 0df80000 00020000 "userdata"
#mtd3: 00040000 00020000 "misc"
#mtd4: 00500000 00020000 "recovery"
#mtd5: 06000000 00020000 "cache"
#mtd6: 00080000 00020000 "splash"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00300000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x08ac0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0df80000
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00500000)
BOARD_HIJACK_RECOVERY_PATH := /dev/block/mtdblock3

BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x800

BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/motorola/motus/recovery/recovery_ui.c
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/motus/recovery_kernel

#write message to the misc partition to initiate recovery mode
BOARD_RECOVERY_WRITE_MISC := true

#TARGET_RECOVERY_UI_LIB := librecovery_ui_motus librecovery_ui_moto
TARGET_PREBUILT_KERNEL := device/motorola/motus/kernel
