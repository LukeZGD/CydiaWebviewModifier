TARGET = iphone:clang:6.1:3.0

ARCHS = armv7
GO_EASY_ON_ME = 1

TWEAK_NAME = CydiaWebviewModifier
CydiaWebviewModifier_FILES = Tweak.xm
CydiaWebviewModifier_CFLAGS = -fno-objc-arc

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
