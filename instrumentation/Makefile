LLVM_INCLUDE_PATH=~/rvd-project/llvm-7/include
# LLVM_INCLUDE_PATH=/usr/lib/llvm-14/include


all: build_linux build_llvm_PX

build_linux:
	gclang -emit-llvm -c req_funcs.c -o req_funcs.bc
	gclang -O0 -S -emit-llvm -o req_funcs.ll -c req_funcs.c
	gclang -emit-llvm -c req_funcs_plane.c -o req_funcs_plane.bc
	gclang -O0 -S -emit-llvm -o req_funcs_plane.ll -c req_funcs_plane.c
	gclang -emit-llvm -c req_funcs_rover.c -o req_funcs_rover.bc
	gclang -O0 -S -emit-llvm -o req_funcs_rover.ll -c req_funcs_rover.c
	gclang -emit-llvm -c req_funcs_px4.c -o req_funcs_px4.bc
	gclang -O0 -S -emit-llvm -o req_funcs_px4.ll -c req_funcs_px4.c

build_llvm:
	mkdir -p lib
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++11 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/AddDPFuncs.d.tmp" -MT "AddDPFuncs.o" -MT "AddDPFuncs.d" AddDPFuncs.cpp -o lib/AddDPFuncs.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/AddDPFuncs.so lib/AddDPFuncs.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++11 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/CheckDPFuncs.d.tmp" -MT "CheckDPFuncs.o" -MT "CheckDPFuncs.d" CheckDPFuncs.cpp -o lib/CheckDPFuncs.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/CheckDPFuncs.so lib/CheckDPFuncs.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++11 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/AddTrack.d.tmp" -MT "AddTrack.o" -MT "AddTrack.d" AddTrack.cpp -o lib/AddTrack.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/AddTrack.so lib/AddTrack.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++11 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/AddAttr.d.tmp" -MT "AddAttr.o" -MT "AddAttr.d" AddAttr.cpp -o lib/AddAttr.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/AddAttr.so lib/AddAttr.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++11 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/CallOverwrite.d.tmp" -MT "CallOverwrite.o" -MT "CallOverwrite.d" CallOverwrite.cpp -o lib/CallOverwrite.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/CallOverwrite.so lib/CallOverwrite.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++11 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/AddEnforce.d.tmp" -MT "AddEnforce.o" -MT "AddEnforce.d" AddEnforce.cpp -o lib/AddEnforce.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/AddEnforce.so lib/AddEnforce.o -lpthread -ltinfo -ldl -lm

build_llvm_PX:
	mkdir -p lib
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++14 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/AddDPFuncs.d.tmp" -MT "AddDPFuncs.o" -MT "AddDPFuncs.d" AddDPFuncs.cpp -o lib/AddDPFuncs.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/AddDPFuncs.so lib/AddDPFuncs.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++14 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/CheckDPFuncs.d.tmp" -MT "CheckDPFuncs.o" -MT "CheckDPFuncs.d" CheckDPFuncs.cpp -o lib/CheckDPFuncs.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/CheckDPFuncs.so lib/CheckDPFuncs.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++14 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/AddTrack.d.tmp" -MT "AddTrack.o" -MT "AddTrack.d" AddTrack.cpp -o lib/AddTrack.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/AddTrack.so lib/AddTrack.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++14 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/AddAttr.d.tmp" -MT "AddAttr.o" -MT "AddAttr.d" AddAttr.cpp -o lib/AddAttr.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/AddAttr.so lib/AddAttr.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++14 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/CallOverwrite.d.tmp" -MT "CallOverwrite.o" -MT "CallOverwrite.d" CallOverwrite.cpp -o lib/CallOverwrite.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/CallOverwrite.so lib/CallOverwrite.o -lpthread -ltinfo -ldl -lm
	clang -I$(LLVM_INCLUDE_PATH) -I./ -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -O3 -fomit-frame-pointer -std=c++14 -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -ffunction-sections -fdata-sections -Wcast-qual -pedantic -Wno-long-long -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcovered-switch-default -Wno-uninitialized -Wno-missing-field-initializers -Wno-comment -c -MMD -MP -MF "lib/AddEnforce.d.tmp" -MT "AddEnforce.o" -MT "AddEnforce.d" AddEnforce.cpp -o lib/AddEnforce.o
	clang -O3 -Wl,-R -Wl,'$ORIGIN' -Wl,--gc-sections -rdynamic -L./ -Lm./ -shared -o lib/AddEnforce.so lib/AddEnforce.o -lpthread -ltinfo -ldl -lm
