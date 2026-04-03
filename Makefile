TARGET := iphone:clang:6.1:3.0

ARCHS = armv7
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CydiaWebviewModifier

CydiaWebviewModifier_FILES = Tweak.x
CydiaWebviewModifier_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += CydiaWebviewModifierPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
