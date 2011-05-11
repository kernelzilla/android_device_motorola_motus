# Copyright (C) 2010 CyanogenMod
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

LOCAL_PATH := $(call my-dir)

# from device/motorola/motus
file := $(TARGET_OUT_KEYLAYOUT)/motus-kpd.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/motus-kpd.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.motus.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.motus.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/adp5588_motus.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/adp5588_motus.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/touchscreen.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/touchscreen.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/AVRCP.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/AVRCP.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/adp5588_motus_P1.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/adp5588_motus_P1.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/adp5588_motus_P2.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/adp5588_motus_P2.kl | $(ACP)
        $(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/adp5588_motus_P3.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/adp5588_motus_P3.kl | $(ACP)
        $(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/qwerty.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/qwerty.kl | $(ACP)
        $(transform-prebuilt-to-target)

# from AndroidBoardCommon.mk
file := $(TARGET_OUT_KEYLAYOUT)/headset.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/prebuilt/usr/keylayout/headset.kl | $(ACP)
	$(transform-prebuilt-to-target)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)


include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := vold.fstab
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

# the system properties for each device, loaded by init
file := $(TARGET_OUT)/build.motus.prop
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/build.motus.prop | $(ACP)
	$(transform-prebuilt-to-target)

# Least specific includes go first, so that they can get
# overridden further down
include $(CLEAR_VARS)

-include vendor/motorola/motus/AndroidBoardVendor.mk

