LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libpdfiumfreetype

LOCAL_ARM_MODE := arm
LOCAL_NDK_STL_VARIANT := gnustl_static

LOCAL_CFLAGS += -O3 -fstrict-aliasing -fprefetch-loop-arrays -fexceptions
LOCAL_CFLAGS += -Wno-non-virtual-dtor -Wall

# Mask some warnings. These are benign, but we probably want to fix them
# upstream at some point.
LOCAL_CFLAGS += -Wno-shift-negative-value -Wno-unused-parameter

LOCAL_SRC_FILES := \
	freetype/src/base/ftbase.c  \
	freetype/src/base/ftbitmap.c  \
	freetype/src/base/ftglyph.c \
	freetype/src/base/ftinit.c \
	freetype/src/base/ftlcdfil.c \
	freetype/src/base/ftmm.c \
	freetype/src/base/ftsystem.c \
	freetype/src/cff/cff.c  \
	freetype/src/cid/type1cid.c  \
	freetype/src/psaux/psaux.c \
	freetype/src/pshinter/pshinter.c\
	freetype/src/psnames/psmodule.c \
	freetype/src/raster/raster.c \
	freetype/src/sfnt/sfnt.c \
	freetype/src/smooth/smooth.c \
	freetype/src/truetype/truetype.c\
	freetype/src/type1/type1.c \

LOCAL_C_INCLUDES := \
    -I../ \
    -Ifreetype/include \
    -Ifreetype/include/freetype

include $(BUILD_STATIC_LIBRARY)

OBJS_pdfiumfreetype := $(addsuffix .o, $(LOCAL_SRC_FILES))
OBJS_pdfiumfreetype := $(addprefix build/$(_ARCH_PX_)/pdfiumfreetype/, $(OBJS_pdfiumfreetype))
	
libpdfiumfreetype.a: $(OBJS_pdfiumfreetype)
	$(AR) -rv libpdfiumfreetype.a $(OBJS_pdfiumfreetype)

build/$(_ARCH_PX_)/pdfiumfreetype/%.o: %
	@echo $<; set -x;\
	mkdir -p $(dir $@);\
	$(CC) -c -O3 $< -o $(@) -I"../" -I$(LOCAL_C_INCLUDES) -DFT2_BUILD_LIBRARY
	echo