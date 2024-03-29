# External libraries makefile

# LIB SECTION: cpp-httplib

libname := cpp-httplib

$(v_lib_dir)      := lib/cpp-httplib
$(v_lib_objdir)   :=
$(v_lib_obj)      :=

$(v_lib_cppflags) := -I$(lib_dir)
$(v_lib_ldflags)  := -pthread -lssl -lcrypto

$(v_lib_clean):
# Nothing to clean

include $(libEnable)

# LIB SECTION: Json for Modern C++
# NOTE: HEADER-ONLY LIBRARY

libname := nlohmann-json

$(v_lib_dir)      := lib/json
$(v_lib_objdir)   :=
$(v_lib_obj)      :=

$(v_lib_cppflags) := -I$(lib_dir)/single_include
$(v_lib_ldflags)  :=

$(v_lib_clean):
# Nothing to clean

include $(libEnable)

# LIB SECTION: sqlite_modern_cpp

libname := sqlite_modern_cpp

$(v_lib_dir)      := lib/$(libname)
$(v_lib_objdir)   :=
$(v_lib_obj)      :=

$(v_lib_cppflags) := -I$(lib_dir)/hdr
$(v_lib_ldflags)  := -lsqlite3

$(v_lib_clean):
# Nothing to clean

include $(libEnable)

# LIB SECTION: flags.hh

libname := flags_hh

$(v_lib_dir)    := lib/flags.hh
$(v_lib_objdir) :=
$(v_lib_obj)    :=

$(v_lib_cppflags) := -I$(lib_dir)
$(v_lib_ldflags)  :=

$(v_lib_clean):
# Nothing to clean

include $(libEnable)

# LIB SECTION: Date
# NOTE: HEADER-ONLY LIBRARY

libname := date

$(v_lib_dir)      := lib/date
$(v_lib_objdir)   :=
$(v_lib_obj)      :=

$(v_lib_cppflags) := -I$(lib_dir)/include/date
$(v_lib_ldflags)  :=

$(v_lib_clean):
# Nothing to clean

include $(libEnable)

# LIB SECTION: BCrypt

libname := bcrypt

$(v_lib_dir)      := lib/bcrypt
$(v_lib_objdir)   :=
$(v_lib_obj)      := $(lib_dir)/build/libbcrypt.a

$(v_lib_cppflags) := -I$(lib_dir)/include
$(v_lib_ldflags)  :=

$(lib_obj): lib_dir := $(lib_dir)
$(lib_obj): $(lib_dir)
	mkdir "$(lib_dir)/build"
	cd "$(lib_dir)/build" && cmake .. && $(MAKE)

$(v_lib_clean): lib_dir := $(lib_dir)
$(v_lib_clean):
	rm -r $(lib_dir)/build

include $(libEnable)
