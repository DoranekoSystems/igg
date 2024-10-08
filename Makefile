export THEOS_DEVICE_IP = 192.168.11.10
ARCHS = arm64
THEOS_PACKAGE_SCHEME = rootless
TARGET := iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = igg

# 设置 Objective-C 文件的编译标志
igg_CFLAGS = -fobjc-arc

# 设置 Objective-C++ 文件的编译标志
igg_CXXFLAGS = -fobjc-arc -std=c++11

igg_FILES = Tweak.xm \
            SystemWideOverlay/ProcessManager.m  \
            SystemWideOverlay/ProcessPageView.m \
            SystemWideOverlay/SearchPageView.m  \
            SystemWideOverlay/LogPageView.m  \
            SystemWideOverlay/MemoryPageView.m  \
            SystemWideOverlay/SettingsPageView.m    \
            SystemWideOverlay/SystemWideOverlay.m \
            SystemWideOverlay/SystemWideOverlay+Layout.m \
            SystemWideOverlay/SystemWideOverlay+MenuSetup.m \
            JHDragView/JHDragView.m \
            Utilities/UIConstants.m \
            Utilities/LogManager.m\
            Crossprocess/ProcessModule.mm

igg_FRAMEWORKS = UIKit
igg_PRIVATE_FRAMEWORKS = SpringBoardServices

include $(THEOS_MAKE_PATH)/tweak.mk
