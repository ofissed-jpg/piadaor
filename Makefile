TARGET := iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = OzonBank
ARCHS = arm64 arm64e

include /makefiles/common.mk

TWEAK_NAME = OzonFakeBalance
OzonFakeBalance_FILES = Tweak.x
OzonFakeBalance_CFLAGS = -fobjc-arc

include /makefiles/tweak.mk
