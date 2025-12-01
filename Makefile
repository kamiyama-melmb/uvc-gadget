-include ../../Rules.make

CROSS_COMPILE	?= $(TI_SDK_PATH)/linux-devkit/sysroots/x86_64-arago-linux/usr/bin/aarch64-oe-linux/aarch64-oe-linux-
ARCH		?= arm64
KERNEL_DIR	?= $(TI_SDK_PATH)/linux-devkit/sysroots/aarch64-oe-linux/usr

CC		:= $(CROSS_COMPILE)gcc --sysroot=$(LINUX_DEVKIT_PATH)/sysroots/aarch64-oe-linux
KERNEL_INCLUDE	:= -I$(KERNEL_DIR)/include -I$(KERNEL_DIR)/arch/$(ARCH)/include
CFLAGS		:= -W -Wall -g $(KERNEL_INCLUDE)
LDFLAGS		:= -g -lturbojpeg

all: uvc-gadget

uvc-gadget: uvc-gadget.o
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -f *.o
	rm -f uvc-gadget
