TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CydiaWebviewModifierPrefs

CydiaWebviewModifierPrefs_FILES = CWMRootListController.m
CydiaWebviewModifierPrefs_FRAMEWORKS = UIKit
CydiaWebviewModifierPrefs_PRIVATE_FRAMEWORKS = Preferences
CydiaWebviewModifierPrefs_INSTALL_PATH = /Library/PreferenceBundles
CydiaWebviewModifierPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
