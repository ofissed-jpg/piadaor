THEOS_PACKAGE_SCHEME = rootless
TARGET := iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = OzonBank
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = OzonFakeBalance
OzonFakeBalance_FILES = Tweak.x
OzonFakeBalance_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
