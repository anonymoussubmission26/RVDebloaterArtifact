; ModuleID = 'req_funcs_plane.c'
source_filename = "req_funcs_plane.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.FuncEntry = type { [50000 x i8], [20 x i8], %struct.UT_hash_handle, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { %struct.UT_hash_table*, i8*, i8*, %struct.UT_hash_handle*, %struct.UT_hash_handle*, i8*, i32, i32 }
%struct.UT_hash_table = type { %struct.UT_hash_bucket*, i32, i32, i32, %struct.UT_hash_handle*, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { %struct.UT_hash_handle*, i32, i32 }
%struct.LoggedAddrEntry = type { [20 x i8], %struct.UT_hash_handle }
%struct.LoggedNameEntry = type { [50000 x i8], %struct.UT_hash_handle }
%struct.ReturnEntry = type { i8*, i8*, %struct.UT_hash_handle }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@mode_to_func_mapping = dso_local global <{ <{ i8, i8, i8, i8, i8, i8, [49994 x i8] }>, [28 x <{ i8, i8, i8, i8, i8, i8, [49994 x i8] }>] }> <{ <{ i8, i8, i8, i8, i8, i8, [49994 x i8] }> <{ i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, [49994 x i8] zeroinitializer }>, [28 x <{ i8, i8, i8, i8, i8, i8, [49994 x i8] }>] zeroinitializer }>, align 16
@initialized = dso_local global i32 1, align 4
@initialized2 = dso_local global i32 1, align 4
@initialized3 = dso_local global i32 1, align 4
@mode_switching = dso_local global i32 0, align 4
@counter = dso_local global i32 0, align 4
@counter2 = dso_local global i32 0, align 4
@counter4 = dso_local global i32 0, align 4
@func_addresses = dso_local global [50000 x i8*] zeroinitializer, align 16
@allowed_functions = dso_local global %struct.FuncEntry* null, align 8
@allowed_functions_address = dso_local global %struct.FuncEntry* null, align 8
@logged_addresses = dso_local global %struct.LoggedAddrEntry* null, align 8
@logged_name = dso_local global %struct.LoggedNameEntry* null, align 8
@return_table = dso_local global %struct.ReturnEntry* null, align 8
@stack_top = dso_local global i32 -1, align 4
@.str = private unnamed_addr constant [7 x i8] c"MANUAL\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"CIRCLE\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"STABILIZE\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"TRAINING\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"ACRO\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"FBWA\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"FBWB\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"CRUISE\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"AUTOTUNE\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"AUTO\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"RTL\00", align 1
@.str.11 = private unnamed_addr constant [7 x i8] c"LOITER\00", align 1
@.str.12 = private unnamed_addr constant [8 x i8] c"TAKEOFF\00", align 1
@.str.13 = private unnamed_addr constant [11 x i8] c"AVOID_ADSB\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"GUIDED\00", align 1
@.str.15 = private unnamed_addr constant [13 x i8] c"INITIALISING\00", align 1
@.str.16 = private unnamed_addr constant [11 x i8] c"QSTABILIZE\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"QHOVER\00", align 1
@.str.18 = private unnamed_addr constant [8 x i8] c"QLOITER\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"QLAND\00", align 1
@.str.20 = private unnamed_addr constant [5 x i8] c"QRTL\00", align 1
@.str.21 = private unnamed_addr constant [10 x i8] c"QAUTOTUNE\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"QACRO\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"THERMAL\00", align 1
@.str.24 = private unnamed_addr constant [17 x i8] c"LOITER_ALT_QLAND\00", align 1
@.str.25 = private unnamed_addr constant [9 x i8] c"AUTOLAND\00", align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"UNKNOWN\00", align 1
@curr_mode_id = common dso_local global i32 0, align 4
@mode_enum = common dso_local global i32 0, align 4
@.str.27 = private unnamed_addr constant [40 x i8] c"Previous mode is %s and new mode is %s\0A\00", align 1
@.str.28 = private unnamed_addr constant [62 x i8] c"/home/mohsen/rvd-project/RVDefender/profiles/%s_functions.txt\00", align 1
@.str.29 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.30 = private unnamed_addr constant [33 x i8] c"Error opening function list file\00", align 1
@.str.31 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.32 = private unnamed_addr constant [11 x i8] c"%499s %19s\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.33 = private unnamed_addr constant [30 x i8] c"Error parsing function: '%s'\0A\00", align 1
@.str.34 = private unnamed_addr constant [24 x i8] c"Memory allocation error\00", align 1
@.str.35 = private unnamed_addr constant [33 x i8] c"Loaded %u functions for mode %s\0A\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"%p\00", align 1
@.str.37 = private unnamed_addr constant [75 x i8] c"/home/mohsen/rvd-project/RVDefender/profiles/access_violation_indirect.log\00", align 1
@.str.38 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.39 = private unnamed_addr constant [53 x i8] c"Indirect Call: Not allowed at address %p in mode %s\0A\00", align 1
@.str.40 = private unnamed_addr constant [25 x i8] c"Error opening log file!\0A\00", align 1
@.str.41 = private unnamed_addr constant [20 x i8] c"Return Address: %p\0A\00", align 1
@counter3 = common dso_local global i32 0, align 4
@func_names = common dso_local global [50000 x i8*] zeroinitializer, align 16
@shadow_stack = common dso_local global [128 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @mode_to_string(i32) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  switch i32 %4, label %31 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %10
    i32 6, label %11
    i32 7, label %12
    i32 8, label %13
    i32 10, label %14
    i32 11, label %15
    i32 12, label %16
    i32 13, label %17
    i32 14, label %18
    i32 15, label %19
    i32 16, label %20
    i32 17, label %21
    i32 18, label %22
    i32 19, label %23
    i32 20, label %24
    i32 21, label %25
    i32 22, label %26
    i32 23, label %27
    i32 24, label %28
    i32 25, label %29
    i32 26, label %30
  ]

; <label>:5:                                      ; preds = %1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:6:                                      ; preds = %1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:7:                                      ; preds = %1
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:8:                                      ; preds = %1
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:9:                                      ; preds = %1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:10:                                     ; preds = %1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:11:                                     ; preds = %1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:12:                                     ; preds = %1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:13:                                     ; preds = %1
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:14:                                     ; preds = %1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:15:                                     ; preds = %1
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:16:                                     ; preds = %1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:17:                                     ; preds = %1
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:18:                                     ; preds = %1
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:19:                                     ; preds = %1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:20:                                     ; preds = %1
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.15, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:21:                                     ; preds = %1
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.16, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:22:                                     ; preds = %1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:23:                                     ; preds = %1
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:24:                                     ; preds = %1
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:25:                                     ; preds = %1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:26:                                     ; preds = %1
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.21, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:27:                                     ; preds = %1
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:28:                                     ; preds = %1
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:29:                                     ; preds = %1
  store i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.24, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:30:                                     ; preds = %1
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.25, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:31:                                     ; preds = %1
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i32 0, i32 0), i8** %2, align 8
  br label %32

; <label>:32:                                     ; preds = %31, %30, %29, %28, %27, %26, %25, %24, %23, %22, %21, %20, %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5
  %33 = load i8*, i8** %2, align 8
  ret i8* %33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mode_entry_runtime(i8 zeroext) #0 {
  %2 = alloca i8, align 1
  %3 = alloca %struct.FuncEntry*, align 8
  %4 = alloca %struct.FuncEntry*, align 8
  %5 = alloca %struct.UT_hash_handle*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.UT_hash_bucket*, align 8
  %8 = alloca %struct.UT_hash_handle*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.UT_hash_bucket*, align 8
  %11 = alloca [150 x i8], align 16
  %12 = alloca %struct._IO_FILE*, align 8
  %13 = alloca [10000 x i8], align 16
  %14 = alloca [50000 x i8], align 16
  %15 = alloca [20 x i8], align 16
  %16 = alloca i8*, align 8
  %17 = alloca %struct.FuncEntry*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i8*, align 8
  %23 = alloca i32, align 4
  %24 = alloca %struct.UT_hash_bucket*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca %struct.UT_hash_handle*, align 8
  %28 = alloca %struct.UT_hash_handle*, align 8
  %29 = alloca %struct.UT_hash_bucket*, align 8
  %30 = alloca %struct.UT_hash_bucket*, align 8
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i8*, align 8
  %36 = alloca i32, align 4
  %37 = alloca %struct.UT_hash_bucket*, align 8
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca %struct.UT_hash_handle*, align 8
  %41 = alloca %struct.UT_hash_handle*, align 8
  %42 = alloca %struct.UT_hash_bucket*, align 8
  %43 = alloca %struct.UT_hash_bucket*, align 8
  store i8 %0, i8* %2, align 1
  %44 = load i32, i32* @curr_mode_id, align 4
  %45 = load i8, i8* %2, align 1
  %46 = zext i8 %45 to i32
  %47 = icmp eq i32 %44, %46
  br i1 %47, label %48, label %49

; <label>:48:                                     ; preds = %1
  br label %2263

; <label>:49:                                     ; preds = %1
  store volatile i32 1, i32* @mode_switching, align 4
  %50 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %51 = icmp ne %struct.FuncEntry* %50, null
  br i1 %51, label %52, label %437

; <label>:52:                                     ; preds = %49
  %53 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  store %struct.FuncEntry* %53, %struct.FuncEntry** %3, align 8
  %54 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %55 = icmp ne %struct.FuncEntry* %54, null
  br i1 %55, label %56, label %61

; <label>:56:                                     ; preds = %52
  %57 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %58 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %57, i32 0, i32 2
  %59 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %58, i32 0, i32 2
  %60 = load i8*, i8** %59, align 8
  br label %62

; <label>:61:                                     ; preds = %52
  br label %62

; <label>:62:                                     ; preds = %61, %56
  %63 = phi i8* [ %60, %56 ], [ null, %61 ]
  %64 = bitcast i8* %63 to %struct.FuncEntry*
  store %struct.FuncEntry* %64, %struct.FuncEntry** %4, align 8
  br label %65

; <label>:65:                                     ; preds = %433, %62
  %66 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %67 = icmp ne %struct.FuncEntry* %66, null
  br i1 %67, label %68, label %436

; <label>:68:                                     ; preds = %65
  br label %69

; <label>:69:                                     ; preds = %68
  %70 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %71 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %70, i32 0, i32 2
  store %struct.UT_hash_handle* %71, %struct.UT_hash_handle** %5, align 8
  %72 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %73 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %72, i32 0, i32 1
  %74 = load i8*, i8** %73, align 8
  %75 = icmp eq i8* %74, null
  br i1 %75, label %76, label %94

; <label>:76:                                     ; preds = %69
  %77 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %78 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %77, i32 0, i32 2
  %79 = load i8*, i8** %78, align 8
  %80 = icmp eq i8* %79, null
  br i1 %80, label %81, label %94

; <label>:81:                                     ; preds = %76
  %82 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %83 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %82, i32 0, i32 2
  %84 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %83, i32 0, i32 0
  %85 = load %struct.UT_hash_table*, %struct.UT_hash_table** %84, align 8
  %86 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %85, i32 0, i32 0
  %87 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %86, align 8
  %88 = bitcast %struct.UT_hash_bucket* %87 to i8*
  call void @free(i8* %88) #6
  %89 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %90 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %89, i32 0, i32 2
  %91 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %90, i32 0, i32 0
  %92 = load %struct.UT_hash_table*, %struct.UT_hash_table** %91, align 8
  %93 = bitcast %struct.UT_hash_table* %92 to i8*
  call void @free(i8* %93) #6
  store %struct.FuncEntry* null, %struct.FuncEntry** @allowed_functions, align 8
  br label %243

; <label>:94:                                     ; preds = %76, %69
  %95 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %96 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %97 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %96, i32 0, i32 2
  %98 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %97, i32 0, i32 0
  %99 = load %struct.UT_hash_table*, %struct.UT_hash_table** %98, align 8
  %100 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %99, i32 0, i32 4
  %101 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %100, align 8
  %102 = icmp eq %struct.UT_hash_handle* %95, %101
  br i1 %102, label %103, label %120

; <label>:103:                                    ; preds = %94
  %104 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %105 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %104, i32 0, i32 1
  %106 = load i8*, i8** %105, align 8
  %107 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %108 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %107, i32 0, i32 2
  %109 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %108, i32 0, i32 0
  %110 = load %struct.UT_hash_table*, %struct.UT_hash_table** %109, align 8
  %111 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %110, i32 0, i32 5
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds i8, i8* %106, i64 %112
  %114 = bitcast i8* %113 to %struct.UT_hash_handle*
  %115 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %116 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %115, i32 0, i32 2
  %117 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %116, i32 0, i32 0
  %118 = load %struct.UT_hash_table*, %struct.UT_hash_table** %117, align 8
  %119 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %118, i32 0, i32 4
  store %struct.UT_hash_handle* %114, %struct.UT_hash_handle** %119, align 8
  br label %120

; <label>:120:                                    ; preds = %103, %94
  %121 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %122 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %121, i32 0, i32 1
  %123 = load i8*, i8** %122, align 8
  %124 = icmp ne i8* %123, null
  br i1 %124, label %125, label %141

; <label>:125:                                    ; preds = %120
  %126 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %127 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %126, i32 0, i32 2
  %128 = load i8*, i8** %127, align 8
  %129 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %130 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %129, i32 0, i32 1
  %131 = load i8*, i8** %130, align 8
  %132 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %133 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %132, i32 0, i32 2
  %134 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %133, i32 0, i32 0
  %135 = load %struct.UT_hash_table*, %struct.UT_hash_table** %134, align 8
  %136 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %135, i32 0, i32 5
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds i8, i8* %131, i64 %137
  %139 = bitcast i8* %138 to %struct.UT_hash_handle*
  %140 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %139, i32 0, i32 2
  store i8* %128, i8** %140, align 8
  br label %148

; <label>:141:                                    ; preds = %120
  br label %142

; <label>:142:                                    ; preds = %141
  %143 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %144 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %143, i32 0, i32 2
  %145 = load i8*, i8** %144, align 8
  %146 = bitcast i8* %145 to %struct.FuncEntry*
  store %struct.FuncEntry* %146, %struct.FuncEntry** @allowed_functions, align 8
  br label %147

; <label>:147:                                    ; preds = %142
  br label %148

; <label>:148:                                    ; preds = %147, %125
  %149 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %150 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %149, i32 0, i32 2
  %151 = load i8*, i8** %150, align 8
  %152 = icmp ne i8* %151, null
  br i1 %152, label %153, label %169

; <label>:153:                                    ; preds = %148
  %154 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %155 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %154, i32 0, i32 1
  %156 = load i8*, i8** %155, align 8
  %157 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %158 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %157, i32 0, i32 2
  %159 = load i8*, i8** %158, align 8
  %160 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %161 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %160, i32 0, i32 2
  %162 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %161, i32 0, i32 0
  %163 = load %struct.UT_hash_table*, %struct.UT_hash_table** %162, align 8
  %164 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %163, i32 0, i32 5
  %165 = load i64, i64* %164, align 8
  %166 = getelementptr inbounds i8, i8* %159, i64 %165
  %167 = bitcast i8* %166 to %struct.UT_hash_handle*
  %168 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %167, i32 0, i32 1
  store i8* %156, i8** %168, align 8
  br label %169

; <label>:169:                                    ; preds = %153, %148
  br label %170

; <label>:170:                                    ; preds = %169
  %171 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %172 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %171, i32 0, i32 7
  %173 = load i32, i32* %172, align 4
  %174 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %175 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %174, i32 0, i32 2
  %176 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %175, i32 0, i32 0
  %177 = load %struct.UT_hash_table*, %struct.UT_hash_table** %176, align 8
  %178 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %177, i32 0, i32 1
  %179 = load i32, i32* %178, align 8
  %180 = sub i32 %179, 1
  %181 = and i32 %173, %180
  store i32 %181, i32* %6, align 4
  br label %182

; <label>:182:                                    ; preds = %170
  br label %183

; <label>:183:                                    ; preds = %182
  %184 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %185 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %184, i32 0, i32 2
  %186 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %185, i32 0, i32 0
  %187 = load %struct.UT_hash_table*, %struct.UT_hash_table** %186, align 8
  %188 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %187, i32 0, i32 0
  %189 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %188, align 8
  %190 = load i32, i32* %6, align 4
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %189, i64 %191
  store %struct.UT_hash_bucket* %192, %struct.UT_hash_bucket** %7, align 8
  %193 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %7, align 8
  %194 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %193, i32 0, i32 1
  %195 = load i32, i32* %194, align 8
  %196 = add i32 %195, -1
  store i32 %196, i32* %194, align 8
  %197 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %7, align 8
  %198 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %197, i32 0, i32 0
  %199 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %198, align 8
  %200 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %201 = icmp eq %struct.UT_hash_handle* %199, %200
  br i1 %201, label %202, label %208

; <label>:202:                                    ; preds = %183
  %203 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %204 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %203, i32 0, i32 4
  %205 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %204, align 8
  %206 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %7, align 8
  %207 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %206, i32 0, i32 0
  store %struct.UT_hash_handle* %205, %struct.UT_hash_handle** %207, align 8
  br label %208

; <label>:208:                                    ; preds = %202, %183
  %209 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %210 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %209, i32 0, i32 3
  %211 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %210, align 8
  %212 = icmp ne %struct.UT_hash_handle* %211, null
  br i1 %212, label %213, label %221

; <label>:213:                                    ; preds = %208
  %214 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %215 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %214, i32 0, i32 4
  %216 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %215, align 8
  %217 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %218 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %217, i32 0, i32 3
  %219 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %218, align 8
  %220 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %219, i32 0, i32 4
  store %struct.UT_hash_handle* %216, %struct.UT_hash_handle** %220, align 8
  br label %221

; <label>:221:                                    ; preds = %213, %208
  %222 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %223 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %222, i32 0, i32 4
  %224 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %223, align 8
  %225 = icmp ne %struct.UT_hash_handle* %224, null
  br i1 %225, label %226, label %234

; <label>:226:                                    ; preds = %221
  %227 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %228 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %227, i32 0, i32 3
  %229 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %228, align 8
  %230 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %5, align 8
  %231 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %230, i32 0, i32 4
  %232 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %231, align 8
  %233 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %232, i32 0, i32 3
  store %struct.UT_hash_handle* %229, %struct.UT_hash_handle** %233, align 8
  br label %234

; <label>:234:                                    ; preds = %226, %221
  br label %235

; <label>:235:                                    ; preds = %234
  %236 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %237 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %236, i32 0, i32 2
  %238 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %237, i32 0, i32 0
  %239 = load %struct.UT_hash_table*, %struct.UT_hash_table** %238, align 8
  %240 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %239, i32 0, i32 3
  %241 = load i32, i32* %240, align 8
  %242 = add i32 %241, -1
  store i32 %242, i32* %240, align 8
  br label %243

; <label>:243:                                    ; preds = %235, %81
  br label %244

; <label>:244:                                    ; preds = %243
  br label %245

; <label>:245:                                    ; preds = %244
  %246 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %247 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %246, i32 0, i32 3
  store %struct.UT_hash_handle* %247, %struct.UT_hash_handle** %8, align 8
  %248 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %249 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %248, i32 0, i32 1
  %250 = load i8*, i8** %249, align 8
  %251 = icmp eq i8* %250, null
  br i1 %251, label %252, label %270

; <label>:252:                                    ; preds = %245
  %253 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %254 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %253, i32 0, i32 2
  %255 = load i8*, i8** %254, align 8
  %256 = icmp eq i8* %255, null
  br i1 %256, label %257, label %270

; <label>:257:                                    ; preds = %252
  %258 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %259 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %258, i32 0, i32 3
  %260 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %259, i32 0, i32 0
  %261 = load %struct.UT_hash_table*, %struct.UT_hash_table** %260, align 8
  %262 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %261, i32 0, i32 0
  %263 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %262, align 8
  %264 = bitcast %struct.UT_hash_bucket* %263 to i8*
  call void @free(i8* %264) #6
  %265 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %266 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %265, i32 0, i32 3
  %267 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %266, i32 0, i32 0
  %268 = load %struct.UT_hash_table*, %struct.UT_hash_table** %267, align 8
  %269 = bitcast %struct.UT_hash_table* %268 to i8*
  call void @free(i8* %269) #6
  store %struct.FuncEntry* null, %struct.FuncEntry** @allowed_functions_address, align 8
  br label %419

; <label>:270:                                    ; preds = %252, %245
  %271 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %272 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %273 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %272, i32 0, i32 3
  %274 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %273, i32 0, i32 0
  %275 = load %struct.UT_hash_table*, %struct.UT_hash_table** %274, align 8
  %276 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %275, i32 0, i32 4
  %277 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %276, align 8
  %278 = icmp eq %struct.UT_hash_handle* %271, %277
  br i1 %278, label %279, label %296

; <label>:279:                                    ; preds = %270
  %280 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %281 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %280, i32 0, i32 1
  %282 = load i8*, i8** %281, align 8
  %283 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %284 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %283, i32 0, i32 3
  %285 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %284, i32 0, i32 0
  %286 = load %struct.UT_hash_table*, %struct.UT_hash_table** %285, align 8
  %287 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %286, i32 0, i32 5
  %288 = load i64, i64* %287, align 8
  %289 = getelementptr inbounds i8, i8* %282, i64 %288
  %290 = bitcast i8* %289 to %struct.UT_hash_handle*
  %291 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %292 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %291, i32 0, i32 3
  %293 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %292, i32 0, i32 0
  %294 = load %struct.UT_hash_table*, %struct.UT_hash_table** %293, align 8
  %295 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %294, i32 0, i32 4
  store %struct.UT_hash_handle* %290, %struct.UT_hash_handle** %295, align 8
  br label %296

; <label>:296:                                    ; preds = %279, %270
  %297 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %298 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %297, i32 0, i32 1
  %299 = load i8*, i8** %298, align 8
  %300 = icmp ne i8* %299, null
  br i1 %300, label %301, label %317

; <label>:301:                                    ; preds = %296
  %302 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %303 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %302, i32 0, i32 2
  %304 = load i8*, i8** %303, align 8
  %305 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %306 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %305, i32 0, i32 1
  %307 = load i8*, i8** %306, align 8
  %308 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %309 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %308, i32 0, i32 3
  %310 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %309, i32 0, i32 0
  %311 = load %struct.UT_hash_table*, %struct.UT_hash_table** %310, align 8
  %312 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %311, i32 0, i32 5
  %313 = load i64, i64* %312, align 8
  %314 = getelementptr inbounds i8, i8* %307, i64 %313
  %315 = bitcast i8* %314 to %struct.UT_hash_handle*
  %316 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %315, i32 0, i32 2
  store i8* %304, i8** %316, align 8
  br label %324

; <label>:317:                                    ; preds = %296
  br label %318

; <label>:318:                                    ; preds = %317
  %319 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %320 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %319, i32 0, i32 2
  %321 = load i8*, i8** %320, align 8
  %322 = bitcast i8* %321 to %struct.FuncEntry*
  store %struct.FuncEntry* %322, %struct.FuncEntry** @allowed_functions_address, align 8
  br label %323

; <label>:323:                                    ; preds = %318
  br label %324

; <label>:324:                                    ; preds = %323, %301
  %325 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %326 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %325, i32 0, i32 2
  %327 = load i8*, i8** %326, align 8
  %328 = icmp ne i8* %327, null
  br i1 %328, label %329, label %345

; <label>:329:                                    ; preds = %324
  %330 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %331 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %330, i32 0, i32 1
  %332 = load i8*, i8** %331, align 8
  %333 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %334 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %333, i32 0, i32 2
  %335 = load i8*, i8** %334, align 8
  %336 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %337 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %336, i32 0, i32 3
  %338 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %337, i32 0, i32 0
  %339 = load %struct.UT_hash_table*, %struct.UT_hash_table** %338, align 8
  %340 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %339, i32 0, i32 5
  %341 = load i64, i64* %340, align 8
  %342 = getelementptr inbounds i8, i8* %335, i64 %341
  %343 = bitcast i8* %342 to %struct.UT_hash_handle*
  %344 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %343, i32 0, i32 1
  store i8* %332, i8** %344, align 8
  br label %345

; <label>:345:                                    ; preds = %329, %324
  br label %346

; <label>:346:                                    ; preds = %345
  %347 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %348 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %347, i32 0, i32 7
  %349 = load i32, i32* %348, align 4
  %350 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %351 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %350, i32 0, i32 3
  %352 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %351, i32 0, i32 0
  %353 = load %struct.UT_hash_table*, %struct.UT_hash_table** %352, align 8
  %354 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %353, i32 0, i32 1
  %355 = load i32, i32* %354, align 8
  %356 = sub i32 %355, 1
  %357 = and i32 %349, %356
  store i32 %357, i32* %9, align 4
  br label %358

; <label>:358:                                    ; preds = %346
  br label %359

; <label>:359:                                    ; preds = %358
  %360 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %361 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %360, i32 0, i32 3
  %362 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %361, i32 0, i32 0
  %363 = load %struct.UT_hash_table*, %struct.UT_hash_table** %362, align 8
  %364 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %363, i32 0, i32 0
  %365 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %364, align 8
  %366 = load i32, i32* %9, align 4
  %367 = zext i32 %366 to i64
  %368 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %365, i64 %367
  store %struct.UT_hash_bucket* %368, %struct.UT_hash_bucket** %10, align 8
  %369 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %370 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %369, i32 0, i32 1
  %371 = load i32, i32* %370, align 8
  %372 = add i32 %371, -1
  store i32 %372, i32* %370, align 8
  %373 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %374 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %373, i32 0, i32 0
  %375 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %374, align 8
  %376 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %377 = icmp eq %struct.UT_hash_handle* %375, %376
  br i1 %377, label %378, label %384

; <label>:378:                                    ; preds = %359
  %379 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %380 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %379, i32 0, i32 4
  %381 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %380, align 8
  %382 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %10, align 8
  %383 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %382, i32 0, i32 0
  store %struct.UT_hash_handle* %381, %struct.UT_hash_handle** %383, align 8
  br label %384

; <label>:384:                                    ; preds = %378, %359
  %385 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %386 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %385, i32 0, i32 3
  %387 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %386, align 8
  %388 = icmp ne %struct.UT_hash_handle* %387, null
  br i1 %388, label %389, label %397

; <label>:389:                                    ; preds = %384
  %390 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %391 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %390, i32 0, i32 4
  %392 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %391, align 8
  %393 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %394 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %393, i32 0, i32 3
  %395 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %394, align 8
  %396 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %395, i32 0, i32 4
  store %struct.UT_hash_handle* %392, %struct.UT_hash_handle** %396, align 8
  br label %397

; <label>:397:                                    ; preds = %389, %384
  %398 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %399 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %398, i32 0, i32 4
  %400 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %399, align 8
  %401 = icmp ne %struct.UT_hash_handle* %400, null
  br i1 %401, label %402, label %410

; <label>:402:                                    ; preds = %397
  %403 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %404 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %403, i32 0, i32 3
  %405 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %404, align 8
  %406 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %8, align 8
  %407 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %406, i32 0, i32 4
  %408 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %407, align 8
  %409 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %408, i32 0, i32 3
  store %struct.UT_hash_handle* %405, %struct.UT_hash_handle** %409, align 8
  br label %410

; <label>:410:                                    ; preds = %402, %397
  br label %411

; <label>:411:                                    ; preds = %410
  %412 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %413 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %412, i32 0, i32 3
  %414 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %413, i32 0, i32 0
  %415 = load %struct.UT_hash_table*, %struct.UT_hash_table** %414, align 8
  %416 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %415, i32 0, i32 3
  %417 = load i32, i32* %416, align 8
  %418 = add i32 %417, -1
  store i32 %418, i32* %416, align 8
  br label %419

; <label>:419:                                    ; preds = %411, %257
  br label %420

; <label>:420:                                    ; preds = %419
  %421 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %422 = bitcast %struct.FuncEntry* %421 to i8*
  call void @free(i8* %422) #6
  br label %423

; <label>:423:                                    ; preds = %420
  %424 = load %struct.FuncEntry*, %struct.FuncEntry** %4, align 8
  store %struct.FuncEntry* %424, %struct.FuncEntry** %3, align 8
  %425 = load %struct.FuncEntry*, %struct.FuncEntry** %4, align 8
  %426 = icmp ne %struct.FuncEntry* %425, null
  br i1 %426, label %427, label %432

; <label>:427:                                    ; preds = %423
  %428 = load %struct.FuncEntry*, %struct.FuncEntry** %4, align 8
  %429 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %428, i32 0, i32 2
  %430 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %429, i32 0, i32 2
  %431 = load i8*, i8** %430, align 8
  br label %433

; <label>:432:                                    ; preds = %423
  br label %433

; <label>:433:                                    ; preds = %432, %427
  %434 = phi i8* [ %431, %427 ], [ null, %432 ]
  %435 = bitcast i8* %434 to %struct.FuncEntry*
  store %struct.FuncEntry* %435, %struct.FuncEntry** %4, align 8
  br label %65

; <label>:436:                                    ; preds = %65
  store %struct.FuncEntry* null, %struct.FuncEntry** @allowed_functions, align 8
  store %struct.FuncEntry* null, %struct.FuncEntry** @allowed_functions_address, align 8
  br label %437

; <label>:437:                                    ; preds = %436, %49
  %438 = load i8, i8* %2, align 1
  %439 = zext i8 %438 to i32
  store i32 %439, i32* @mode_enum, align 4
  %440 = load i32, i32* @curr_mode_id, align 4
  %441 = call i8* @mode_to_string(i32 %440)
  %442 = load i32, i32* @mode_enum, align 4
  %443 = call i8* @mode_to_string(i32 %442)
  %444 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.27, i32 0, i32 0), i8* %441, i8* %443)
  %445 = getelementptr inbounds [150 x i8], [150 x i8]* %11, i32 0, i32 0
  %446 = load i32, i32* @mode_enum, align 4
  %447 = call i8* @mode_to_string(i32 %446)
  %448 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %445, i64 150, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.28, i32 0, i32 0), i8* %447) #6
  %449 = getelementptr inbounds [150 x i8], [150 x i8]* %11, i32 0, i32 0
  %450 = call noalias %struct._IO_FILE* @fopen(i8* %449, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.29, i32 0, i32 0))
  store %struct._IO_FILE* %450, %struct._IO_FILE** %12, align 8
  %451 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %452 = icmp ne %struct._IO_FILE* %451, null
  br i1 %452, label %454, label %453

; <label>:453:                                    ; preds = %437
  call void @perror(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.30, i32 0, i32 0))
  br label %2263

; <label>:454:                                    ; preds = %437
  br label %455

; <label>:455:                                    ; preds = %2244, %486, %454
  %456 = getelementptr inbounds [10000 x i8], [10000 x i8]* %13, i32 0, i32 0
  %457 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %458 = call i8* @fgets(i8* %456, i32 10000, %struct._IO_FILE* %457)
  %459 = icmp ne i8* %458, null
  br i1 %459, label %460, label %2245

; <label>:460:                                    ; preds = %455
  %461 = getelementptr inbounds [10000 x i8], [10000 x i8]* %13, i32 0, i32 0
  %462 = call i64 @strcspn(i8* %461, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.31, i32 0, i32 0)) #7
  %463 = getelementptr inbounds [10000 x i8], [10000 x i8]* %13, i64 0, i64 %462
  store i8 0, i8* %463, align 1
  %464 = getelementptr inbounds [10000 x i8], [10000 x i8]* %13, i32 0, i32 0
  store i8* %464, i8** %16, align 8
  br label %465

; <label>:465:                                    ; preds = %477, %460
  %466 = load i8*, i8** %16, align 8
  %467 = load i8, i8* %466, align 1
  %468 = sext i8 %467 to i32
  %469 = icmp eq i32 %468, 32
  br i1 %469, label %475, label %470

; <label>:470:                                    ; preds = %465
  %471 = load i8*, i8** %16, align 8
  %472 = load i8, i8* %471, align 1
  %473 = sext i8 %472 to i32
  %474 = icmp eq i32 %473, 9
  br label %475

; <label>:475:                                    ; preds = %470, %465
  %476 = phi i1 [ true, %465 ], [ %474, %470 ]
  br i1 %476, label %477, label %480

; <label>:477:                                    ; preds = %475
  %478 = load i8*, i8** %16, align 8
  %479 = getelementptr inbounds i8, i8* %478, i32 1
  store i8* %479, i8** %16, align 8
  br label %465

; <label>:480:                                    ; preds = %475
  %481 = load i8*, i8** %16, align 8
  %482 = getelementptr inbounds [50000 x i8], [50000 x i8]* %14, i32 0, i32 0
  %483 = getelementptr inbounds [20 x i8], [20 x i8]* %15, i32 0, i32 0
  %484 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %481, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.32, i32 0, i32 0), i8* %482, i8* %483) #6
  %485 = icmp ne i32 %484, 2
  br i1 %485, label %486, label %490

; <label>:486:                                    ; preds = %480
  %487 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %488 = load i8*, i8** %16, align 8
  %489 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %487, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.33, i32 0, i32 0), i8* %488)
  br label %455

; <label>:490:                                    ; preds = %480
  %491 = call noalias i8* @malloc(i64 50136) #6
  %492 = bitcast i8* %491 to %struct.FuncEntry*
  store %struct.FuncEntry* %492, %struct.FuncEntry** %17, align 8
  %493 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %494 = icmp ne %struct.FuncEntry* %493, null
  br i1 %494, label %498, label %495

; <label>:495:                                    ; preds = %490
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.34, i32 0, i32 0))
  %496 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %497 = call i32 @fclose(%struct._IO_FILE* %496)
  br label %2263

; <label>:498:                                    ; preds = %490
  %499 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %500 = bitcast %struct.FuncEntry* %499 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %500, i8 0, i64 50136, i1 false)
  %501 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %502 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %501, i32 0, i32 0
  %503 = getelementptr inbounds [50000 x i8], [50000 x i8]* %502, i32 0, i32 0
  %504 = getelementptr inbounds [50000 x i8], [50000 x i8]* %14, i32 0, i32 0
  %505 = call i8* @strncpy(i8* %503, i8* %504, i64 49999) #6
  %506 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %507 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %506, i32 0, i32 1
  %508 = getelementptr inbounds [20 x i8], [20 x i8]* %507, i32 0, i32 0
  %509 = getelementptr inbounds [20 x i8], [20 x i8]* %15, i32 0, i32 0
  %510 = call i8* @strncpy(i8* %508, i8* %509, i64 19) #6
  br label %511

; <label>:511:                                    ; preds = %498
  br label %512

; <label>:512:                                    ; preds = %511
  br label %513

; <label>:513:                                    ; preds = %512
  %514 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %515 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %514, i32 0, i32 0
  %516 = bitcast [50000 x i8]* %515 to i8*
  store i8* %516, i8** %22, align 8
  store i32 -17973521, i32* %18, align 4
  store i32 -1640531527, i32* %20, align 4
  store i32 -1640531527, i32* %19, align 4
  %517 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %518 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %517, i32 0, i32 0
  %519 = getelementptr inbounds [50000 x i8], [50000 x i8]* %518, i32 0, i32 0
  %520 = call i64 @strlen(i8* %519) #7
  %521 = trunc i64 %520 to i32
  store i32 %521, i32* %21, align 4
  br label %522

; <label>:522:                                    ; preds = %689, %513
  %523 = load i32, i32* %21, align 4
  %524 = icmp uge i32 %523, 12
  br i1 %524, label %525, label %694

; <label>:525:                                    ; preds = %522
  %526 = load i8*, i8** %22, align 8
  %527 = getelementptr inbounds i8, i8* %526, i64 0
  %528 = load i8, i8* %527, align 1
  %529 = zext i8 %528 to i32
  %530 = load i8*, i8** %22, align 8
  %531 = getelementptr inbounds i8, i8* %530, i64 1
  %532 = load i8, i8* %531, align 1
  %533 = zext i8 %532 to i32
  %534 = shl i32 %533, 8
  %535 = add i32 %529, %534
  %536 = load i8*, i8** %22, align 8
  %537 = getelementptr inbounds i8, i8* %536, i64 2
  %538 = load i8, i8* %537, align 1
  %539 = zext i8 %538 to i32
  %540 = shl i32 %539, 16
  %541 = add i32 %535, %540
  %542 = load i8*, i8** %22, align 8
  %543 = getelementptr inbounds i8, i8* %542, i64 3
  %544 = load i8, i8* %543, align 1
  %545 = zext i8 %544 to i32
  %546 = shl i32 %545, 24
  %547 = add i32 %541, %546
  %548 = load i32, i32* %19, align 4
  %549 = add i32 %548, %547
  store i32 %549, i32* %19, align 4
  %550 = load i8*, i8** %22, align 8
  %551 = getelementptr inbounds i8, i8* %550, i64 4
  %552 = load i8, i8* %551, align 1
  %553 = zext i8 %552 to i32
  %554 = load i8*, i8** %22, align 8
  %555 = getelementptr inbounds i8, i8* %554, i64 5
  %556 = load i8, i8* %555, align 1
  %557 = zext i8 %556 to i32
  %558 = shl i32 %557, 8
  %559 = add i32 %553, %558
  %560 = load i8*, i8** %22, align 8
  %561 = getelementptr inbounds i8, i8* %560, i64 6
  %562 = load i8, i8* %561, align 1
  %563 = zext i8 %562 to i32
  %564 = shl i32 %563, 16
  %565 = add i32 %559, %564
  %566 = load i8*, i8** %22, align 8
  %567 = getelementptr inbounds i8, i8* %566, i64 7
  %568 = load i8, i8* %567, align 1
  %569 = zext i8 %568 to i32
  %570 = shl i32 %569, 24
  %571 = add i32 %565, %570
  %572 = load i32, i32* %20, align 4
  %573 = add i32 %572, %571
  store i32 %573, i32* %20, align 4
  %574 = load i8*, i8** %22, align 8
  %575 = getelementptr inbounds i8, i8* %574, i64 8
  %576 = load i8, i8* %575, align 1
  %577 = zext i8 %576 to i32
  %578 = load i8*, i8** %22, align 8
  %579 = getelementptr inbounds i8, i8* %578, i64 9
  %580 = load i8, i8* %579, align 1
  %581 = zext i8 %580 to i32
  %582 = shl i32 %581, 8
  %583 = add i32 %577, %582
  %584 = load i8*, i8** %22, align 8
  %585 = getelementptr inbounds i8, i8* %584, i64 10
  %586 = load i8, i8* %585, align 1
  %587 = zext i8 %586 to i32
  %588 = shl i32 %587, 16
  %589 = add i32 %583, %588
  %590 = load i8*, i8** %22, align 8
  %591 = getelementptr inbounds i8, i8* %590, i64 11
  %592 = load i8, i8* %591, align 1
  %593 = zext i8 %592 to i32
  %594 = shl i32 %593, 24
  %595 = add i32 %589, %594
  %596 = load i32, i32* %18, align 4
  %597 = add i32 %596, %595
  store i32 %597, i32* %18, align 4
  br label %598

; <label>:598:                                    ; preds = %525
  %599 = load i32, i32* %20, align 4
  %600 = load i32, i32* %19, align 4
  %601 = sub i32 %600, %599
  store i32 %601, i32* %19, align 4
  %602 = load i32, i32* %18, align 4
  %603 = load i32, i32* %19, align 4
  %604 = sub i32 %603, %602
  store i32 %604, i32* %19, align 4
  %605 = load i32, i32* %18, align 4
  %606 = lshr i32 %605, 13
  %607 = load i32, i32* %19, align 4
  %608 = xor i32 %607, %606
  store i32 %608, i32* %19, align 4
  %609 = load i32, i32* %18, align 4
  %610 = load i32, i32* %20, align 4
  %611 = sub i32 %610, %609
  store i32 %611, i32* %20, align 4
  %612 = load i32, i32* %19, align 4
  %613 = load i32, i32* %20, align 4
  %614 = sub i32 %613, %612
  store i32 %614, i32* %20, align 4
  %615 = load i32, i32* %19, align 4
  %616 = shl i32 %615, 8
  %617 = load i32, i32* %20, align 4
  %618 = xor i32 %617, %616
  store i32 %618, i32* %20, align 4
  %619 = load i32, i32* %19, align 4
  %620 = load i32, i32* %18, align 4
  %621 = sub i32 %620, %619
  store i32 %621, i32* %18, align 4
  %622 = load i32, i32* %20, align 4
  %623 = load i32, i32* %18, align 4
  %624 = sub i32 %623, %622
  store i32 %624, i32* %18, align 4
  %625 = load i32, i32* %20, align 4
  %626 = lshr i32 %625, 13
  %627 = load i32, i32* %18, align 4
  %628 = xor i32 %627, %626
  store i32 %628, i32* %18, align 4
  %629 = load i32, i32* %20, align 4
  %630 = load i32, i32* %19, align 4
  %631 = sub i32 %630, %629
  store i32 %631, i32* %19, align 4
  %632 = load i32, i32* %18, align 4
  %633 = load i32, i32* %19, align 4
  %634 = sub i32 %633, %632
  store i32 %634, i32* %19, align 4
  %635 = load i32, i32* %18, align 4
  %636 = lshr i32 %635, 12
  %637 = load i32, i32* %19, align 4
  %638 = xor i32 %637, %636
  store i32 %638, i32* %19, align 4
  %639 = load i32, i32* %18, align 4
  %640 = load i32, i32* %20, align 4
  %641 = sub i32 %640, %639
  store i32 %641, i32* %20, align 4
  %642 = load i32, i32* %19, align 4
  %643 = load i32, i32* %20, align 4
  %644 = sub i32 %643, %642
  store i32 %644, i32* %20, align 4
  %645 = load i32, i32* %19, align 4
  %646 = shl i32 %645, 16
  %647 = load i32, i32* %20, align 4
  %648 = xor i32 %647, %646
  store i32 %648, i32* %20, align 4
  %649 = load i32, i32* %19, align 4
  %650 = load i32, i32* %18, align 4
  %651 = sub i32 %650, %649
  store i32 %651, i32* %18, align 4
  %652 = load i32, i32* %20, align 4
  %653 = load i32, i32* %18, align 4
  %654 = sub i32 %653, %652
  store i32 %654, i32* %18, align 4
  %655 = load i32, i32* %20, align 4
  %656 = lshr i32 %655, 5
  %657 = load i32, i32* %18, align 4
  %658 = xor i32 %657, %656
  store i32 %658, i32* %18, align 4
  %659 = load i32, i32* %20, align 4
  %660 = load i32, i32* %19, align 4
  %661 = sub i32 %660, %659
  store i32 %661, i32* %19, align 4
  %662 = load i32, i32* %18, align 4
  %663 = load i32, i32* %19, align 4
  %664 = sub i32 %663, %662
  store i32 %664, i32* %19, align 4
  %665 = load i32, i32* %18, align 4
  %666 = lshr i32 %665, 3
  %667 = load i32, i32* %19, align 4
  %668 = xor i32 %667, %666
  store i32 %668, i32* %19, align 4
  %669 = load i32, i32* %18, align 4
  %670 = load i32, i32* %20, align 4
  %671 = sub i32 %670, %669
  store i32 %671, i32* %20, align 4
  %672 = load i32, i32* %19, align 4
  %673 = load i32, i32* %20, align 4
  %674 = sub i32 %673, %672
  store i32 %674, i32* %20, align 4
  %675 = load i32, i32* %19, align 4
  %676 = shl i32 %675, 10
  %677 = load i32, i32* %20, align 4
  %678 = xor i32 %677, %676
  store i32 %678, i32* %20, align 4
  %679 = load i32, i32* %19, align 4
  %680 = load i32, i32* %18, align 4
  %681 = sub i32 %680, %679
  store i32 %681, i32* %18, align 4
  %682 = load i32, i32* %20, align 4
  %683 = load i32, i32* %18, align 4
  %684 = sub i32 %683, %682
  store i32 %684, i32* %18, align 4
  %685 = load i32, i32* %20, align 4
  %686 = lshr i32 %685, 15
  %687 = load i32, i32* %18, align 4
  %688 = xor i32 %687, %686
  store i32 %688, i32* %18, align 4
  br label %689

; <label>:689:                                    ; preds = %598
  %690 = load i8*, i8** %22, align 8
  %691 = getelementptr inbounds i8, i8* %690, i64 12
  store i8* %691, i8** %22, align 8
  %692 = load i32, i32* %21, align 4
  %693 = sub i32 %692, 12
  store i32 %693, i32* %21, align 4
  br label %522

; <label>:694:                                    ; preds = %522
  %695 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %696 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %695, i32 0, i32 0
  %697 = getelementptr inbounds [50000 x i8], [50000 x i8]* %696, i32 0, i32 0
  %698 = call i64 @strlen(i8* %697) #7
  %699 = trunc i64 %698 to i32
  %700 = load i32, i32* %18, align 4
  %701 = add i32 %700, %699
  store i32 %701, i32* %18, align 4
  %702 = load i32, i32* %21, align 4
  switch i32 %702, label %789 [
    i32 11, label %703
    i32 10, label %711
    i32 9, label %719
    i32 8, label %727
    i32 7, label %735
    i32 6, label %743
    i32 5, label %751
    i32 4, label %758
    i32 3, label %766
    i32 2, label %774
    i32 1, label %782
  ]

; <label>:703:                                    ; preds = %694
  %704 = load i8*, i8** %22, align 8
  %705 = getelementptr inbounds i8, i8* %704, i64 10
  %706 = load i8, i8* %705, align 1
  %707 = zext i8 %706 to i32
  %708 = shl i32 %707, 24
  %709 = load i32, i32* %18, align 4
  %710 = add i32 %709, %708
  store i32 %710, i32* %18, align 4
  br label %711

; <label>:711:                                    ; preds = %694, %703
  %712 = load i8*, i8** %22, align 8
  %713 = getelementptr inbounds i8, i8* %712, i64 9
  %714 = load i8, i8* %713, align 1
  %715 = zext i8 %714 to i32
  %716 = shl i32 %715, 16
  %717 = load i32, i32* %18, align 4
  %718 = add i32 %717, %716
  store i32 %718, i32* %18, align 4
  br label %719

; <label>:719:                                    ; preds = %694, %711
  %720 = load i8*, i8** %22, align 8
  %721 = getelementptr inbounds i8, i8* %720, i64 8
  %722 = load i8, i8* %721, align 1
  %723 = zext i8 %722 to i32
  %724 = shl i32 %723, 8
  %725 = load i32, i32* %18, align 4
  %726 = add i32 %725, %724
  store i32 %726, i32* %18, align 4
  br label %727

; <label>:727:                                    ; preds = %694, %719
  %728 = load i8*, i8** %22, align 8
  %729 = getelementptr inbounds i8, i8* %728, i64 7
  %730 = load i8, i8* %729, align 1
  %731 = zext i8 %730 to i32
  %732 = shl i32 %731, 24
  %733 = load i32, i32* %20, align 4
  %734 = add i32 %733, %732
  store i32 %734, i32* %20, align 4
  br label %735

; <label>:735:                                    ; preds = %694, %727
  %736 = load i8*, i8** %22, align 8
  %737 = getelementptr inbounds i8, i8* %736, i64 6
  %738 = load i8, i8* %737, align 1
  %739 = zext i8 %738 to i32
  %740 = shl i32 %739, 16
  %741 = load i32, i32* %20, align 4
  %742 = add i32 %741, %740
  store i32 %742, i32* %20, align 4
  br label %743

; <label>:743:                                    ; preds = %694, %735
  %744 = load i8*, i8** %22, align 8
  %745 = getelementptr inbounds i8, i8* %744, i64 5
  %746 = load i8, i8* %745, align 1
  %747 = zext i8 %746 to i32
  %748 = shl i32 %747, 8
  %749 = load i32, i32* %20, align 4
  %750 = add i32 %749, %748
  store i32 %750, i32* %20, align 4
  br label %751

; <label>:751:                                    ; preds = %694, %743
  %752 = load i8*, i8** %22, align 8
  %753 = getelementptr inbounds i8, i8* %752, i64 4
  %754 = load i8, i8* %753, align 1
  %755 = zext i8 %754 to i32
  %756 = load i32, i32* %20, align 4
  %757 = add i32 %756, %755
  store i32 %757, i32* %20, align 4
  br label %758

; <label>:758:                                    ; preds = %694, %751
  %759 = load i8*, i8** %22, align 8
  %760 = getelementptr inbounds i8, i8* %759, i64 3
  %761 = load i8, i8* %760, align 1
  %762 = zext i8 %761 to i32
  %763 = shl i32 %762, 24
  %764 = load i32, i32* %19, align 4
  %765 = add i32 %764, %763
  store i32 %765, i32* %19, align 4
  br label %766

; <label>:766:                                    ; preds = %694, %758
  %767 = load i8*, i8** %22, align 8
  %768 = getelementptr inbounds i8, i8* %767, i64 2
  %769 = load i8, i8* %768, align 1
  %770 = zext i8 %769 to i32
  %771 = shl i32 %770, 16
  %772 = load i32, i32* %19, align 4
  %773 = add i32 %772, %771
  store i32 %773, i32* %19, align 4
  br label %774

; <label>:774:                                    ; preds = %694, %766
  %775 = load i8*, i8** %22, align 8
  %776 = getelementptr inbounds i8, i8* %775, i64 1
  %777 = load i8, i8* %776, align 1
  %778 = zext i8 %777 to i32
  %779 = shl i32 %778, 8
  %780 = load i32, i32* %19, align 4
  %781 = add i32 %780, %779
  store i32 %781, i32* %19, align 4
  br label %782

; <label>:782:                                    ; preds = %694, %774
  %783 = load i8*, i8** %22, align 8
  %784 = getelementptr inbounds i8, i8* %783, i64 0
  %785 = load i8, i8* %784, align 1
  %786 = zext i8 %785 to i32
  %787 = load i32, i32* %19, align 4
  %788 = add i32 %787, %786
  store i32 %788, i32* %19, align 4
  br label %789

; <label>:789:                                    ; preds = %694, %782
  br label %790

; <label>:790:                                    ; preds = %789
  br label %791

; <label>:791:                                    ; preds = %790
  %792 = load i32, i32* %20, align 4
  %793 = load i32, i32* %19, align 4
  %794 = sub i32 %793, %792
  store i32 %794, i32* %19, align 4
  %795 = load i32, i32* %18, align 4
  %796 = load i32, i32* %19, align 4
  %797 = sub i32 %796, %795
  store i32 %797, i32* %19, align 4
  %798 = load i32, i32* %18, align 4
  %799 = lshr i32 %798, 13
  %800 = load i32, i32* %19, align 4
  %801 = xor i32 %800, %799
  store i32 %801, i32* %19, align 4
  %802 = load i32, i32* %18, align 4
  %803 = load i32, i32* %20, align 4
  %804 = sub i32 %803, %802
  store i32 %804, i32* %20, align 4
  %805 = load i32, i32* %19, align 4
  %806 = load i32, i32* %20, align 4
  %807 = sub i32 %806, %805
  store i32 %807, i32* %20, align 4
  %808 = load i32, i32* %19, align 4
  %809 = shl i32 %808, 8
  %810 = load i32, i32* %20, align 4
  %811 = xor i32 %810, %809
  store i32 %811, i32* %20, align 4
  %812 = load i32, i32* %19, align 4
  %813 = load i32, i32* %18, align 4
  %814 = sub i32 %813, %812
  store i32 %814, i32* %18, align 4
  %815 = load i32, i32* %20, align 4
  %816 = load i32, i32* %18, align 4
  %817 = sub i32 %816, %815
  store i32 %817, i32* %18, align 4
  %818 = load i32, i32* %20, align 4
  %819 = lshr i32 %818, 13
  %820 = load i32, i32* %18, align 4
  %821 = xor i32 %820, %819
  store i32 %821, i32* %18, align 4
  %822 = load i32, i32* %20, align 4
  %823 = load i32, i32* %19, align 4
  %824 = sub i32 %823, %822
  store i32 %824, i32* %19, align 4
  %825 = load i32, i32* %18, align 4
  %826 = load i32, i32* %19, align 4
  %827 = sub i32 %826, %825
  store i32 %827, i32* %19, align 4
  %828 = load i32, i32* %18, align 4
  %829 = lshr i32 %828, 12
  %830 = load i32, i32* %19, align 4
  %831 = xor i32 %830, %829
  store i32 %831, i32* %19, align 4
  %832 = load i32, i32* %18, align 4
  %833 = load i32, i32* %20, align 4
  %834 = sub i32 %833, %832
  store i32 %834, i32* %20, align 4
  %835 = load i32, i32* %19, align 4
  %836 = load i32, i32* %20, align 4
  %837 = sub i32 %836, %835
  store i32 %837, i32* %20, align 4
  %838 = load i32, i32* %19, align 4
  %839 = shl i32 %838, 16
  %840 = load i32, i32* %20, align 4
  %841 = xor i32 %840, %839
  store i32 %841, i32* %20, align 4
  %842 = load i32, i32* %19, align 4
  %843 = load i32, i32* %18, align 4
  %844 = sub i32 %843, %842
  store i32 %844, i32* %18, align 4
  %845 = load i32, i32* %20, align 4
  %846 = load i32, i32* %18, align 4
  %847 = sub i32 %846, %845
  store i32 %847, i32* %18, align 4
  %848 = load i32, i32* %20, align 4
  %849 = lshr i32 %848, 5
  %850 = load i32, i32* %18, align 4
  %851 = xor i32 %850, %849
  store i32 %851, i32* %18, align 4
  %852 = load i32, i32* %20, align 4
  %853 = load i32, i32* %19, align 4
  %854 = sub i32 %853, %852
  store i32 %854, i32* %19, align 4
  %855 = load i32, i32* %18, align 4
  %856 = load i32, i32* %19, align 4
  %857 = sub i32 %856, %855
  store i32 %857, i32* %19, align 4
  %858 = load i32, i32* %18, align 4
  %859 = lshr i32 %858, 3
  %860 = load i32, i32* %19, align 4
  %861 = xor i32 %860, %859
  store i32 %861, i32* %19, align 4
  %862 = load i32, i32* %18, align 4
  %863 = load i32, i32* %20, align 4
  %864 = sub i32 %863, %862
  store i32 %864, i32* %20, align 4
  %865 = load i32, i32* %19, align 4
  %866 = load i32, i32* %20, align 4
  %867 = sub i32 %866, %865
  store i32 %867, i32* %20, align 4
  %868 = load i32, i32* %19, align 4
  %869 = shl i32 %868, 10
  %870 = load i32, i32* %20, align 4
  %871 = xor i32 %870, %869
  store i32 %871, i32* %20, align 4
  %872 = load i32, i32* %19, align 4
  %873 = load i32, i32* %18, align 4
  %874 = sub i32 %873, %872
  store i32 %874, i32* %18, align 4
  %875 = load i32, i32* %20, align 4
  %876 = load i32, i32* %18, align 4
  %877 = sub i32 %876, %875
  store i32 %877, i32* %18, align 4
  %878 = load i32, i32* %20, align 4
  %879 = lshr i32 %878, 15
  %880 = load i32, i32* %18, align 4
  %881 = xor i32 %880, %879
  store i32 %881, i32* %18, align 4
  br label %882

; <label>:882:                                    ; preds = %791
  br label %883

; <label>:883:                                    ; preds = %882
  br label %884

; <label>:884:                                    ; preds = %883
  br label %885

; <label>:885:                                    ; preds = %884
  %886 = load i32, i32* %18, align 4
  %887 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %888 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %887, i32 0, i32 2
  %889 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %888, i32 0, i32 7
  store i32 %886, i32* %889, align 4
  %890 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %891 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %890, i32 0, i32 0
  %892 = bitcast [50000 x i8]* %891 to i8*
  %893 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %894 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %893, i32 0, i32 2
  %895 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %894, i32 0, i32 5
  store i8* %892, i8** %895, align 8
  %896 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %897 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %896, i32 0, i32 0
  %898 = getelementptr inbounds [50000 x i8], [50000 x i8]* %897, i32 0, i32 0
  %899 = call i64 @strlen(i8* %898) #7
  %900 = trunc i64 %899 to i32
  %901 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %902 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %901, i32 0, i32 2
  %903 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %902, i32 0, i32 6
  store i32 %900, i32* %903, align 8
  %904 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %905 = icmp ne %struct.FuncEntry* %904, null
  br i1 %905, label %993, label %906

; <label>:906:                                    ; preds = %885
  %907 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %908 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %907, i32 0, i32 2
  %909 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %908, i32 0, i32 2
  store i8* null, i8** %909, align 8
  %910 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %911 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %910, i32 0, i32 2
  %912 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %911, i32 0, i32 1
  store i8* null, i8** %912, align 8
  br label %913

; <label>:913:                                    ; preds = %906
  %914 = call noalias i8* @malloc(i64 64) #6
  %915 = bitcast i8* %914 to %struct.UT_hash_table*
  %916 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %917 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %916, i32 0, i32 2
  %918 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %917, i32 0, i32 0
  store %struct.UT_hash_table* %915, %struct.UT_hash_table** %918, align 8
  %919 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %920 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %919, i32 0, i32 2
  %921 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %920, i32 0, i32 0
  %922 = load %struct.UT_hash_table*, %struct.UT_hash_table** %921, align 8
  %923 = icmp ne %struct.UT_hash_table* %922, null
  br i1 %923, label %925, label %924

; <label>:924:                                    ; preds = %913
  call void @exit(i32 -1) #8
  unreachable

; <label>:925:                                    ; preds = %913
  %926 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %927 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %926, i32 0, i32 2
  %928 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %927, i32 0, i32 0
  %929 = load %struct.UT_hash_table*, %struct.UT_hash_table** %928, align 8
  %930 = bitcast %struct.UT_hash_table* %929 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %930, i8 0, i64 64, i1 false)
  %931 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %932 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %931, i32 0, i32 2
  %933 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %934 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %933, i32 0, i32 2
  %935 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %934, i32 0, i32 0
  %936 = load %struct.UT_hash_table*, %struct.UT_hash_table** %935, align 8
  %937 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %936, i32 0, i32 4
  store %struct.UT_hash_handle* %932, %struct.UT_hash_handle** %937, align 8
  %938 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %939 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %938, i32 0, i32 2
  %940 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %939, i32 0, i32 0
  %941 = load %struct.UT_hash_table*, %struct.UT_hash_table** %940, align 8
  %942 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %941, i32 0, i32 1
  store i32 32, i32* %942, align 8
  %943 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %944 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %943, i32 0, i32 2
  %945 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %944, i32 0, i32 0
  %946 = load %struct.UT_hash_table*, %struct.UT_hash_table** %945, align 8
  %947 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %946, i32 0, i32 2
  store i32 5, i32* %947, align 4
  %948 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %949 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %948, i32 0, i32 2
  %950 = bitcast %struct.UT_hash_handle* %949 to i8*
  %951 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %952 = bitcast %struct.FuncEntry* %951 to i8*
  %953 = ptrtoint i8* %950 to i64
  %954 = ptrtoint i8* %952 to i64
  %955 = sub i64 %953, %954
  %956 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %957 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %956, i32 0, i32 2
  %958 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %957, i32 0, i32 0
  %959 = load %struct.UT_hash_table*, %struct.UT_hash_table** %958, align 8
  %960 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %959, i32 0, i32 5
  store i64 %955, i64* %960, align 8
  %961 = call noalias i8* @malloc(i64 512) #6
  %962 = bitcast i8* %961 to %struct.UT_hash_bucket*
  %963 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %964 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %963, i32 0, i32 2
  %965 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %964, i32 0, i32 0
  %966 = load %struct.UT_hash_table*, %struct.UT_hash_table** %965, align 8
  %967 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %966, i32 0, i32 0
  store %struct.UT_hash_bucket* %962, %struct.UT_hash_bucket** %967, align 8
  %968 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %969 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %968, i32 0, i32 2
  %970 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %969, i32 0, i32 0
  %971 = load %struct.UT_hash_table*, %struct.UT_hash_table** %970, align 8
  %972 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %971, i32 0, i32 10
  store i32 -1609490463, i32* %972, align 8
  %973 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %974 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %973, i32 0, i32 2
  %975 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %974, i32 0, i32 0
  %976 = load %struct.UT_hash_table*, %struct.UT_hash_table** %975, align 8
  %977 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %976, i32 0, i32 0
  %978 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %977, align 8
  %979 = icmp ne %struct.UT_hash_bucket* %978, null
  br i1 %979, label %981, label %980

; <label>:980:                                    ; preds = %925
  call void @exit(i32 -1) #8
  unreachable

; <label>:981:                                    ; preds = %925
  %982 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %983 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %982, i32 0, i32 2
  %984 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %983, i32 0, i32 0
  %985 = load %struct.UT_hash_table*, %struct.UT_hash_table** %984, align 8
  %986 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %985, i32 0, i32 0
  %987 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %986, align 8
  %988 = bitcast %struct.UT_hash_bucket* %987 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %988, i8 0, i64 512, i1 false)
  br label %989

; <label>:989:                                    ; preds = %981
  br label %990

; <label>:990:                                    ; preds = %989
  br label %991

; <label>:991:                                    ; preds = %990
  %992 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  store %struct.FuncEntry* %992, %struct.FuncEntry** @allowed_functions, align 8
  br label %1040

; <label>:993:                                    ; preds = %885
  %994 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %995 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %994, i32 0, i32 2
  %996 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %995, i32 0, i32 0
  %997 = load %struct.UT_hash_table*, %struct.UT_hash_table** %996, align 8
  %998 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %999 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %998, i32 0, i32 2
  %1000 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %999, i32 0, i32 0
  store %struct.UT_hash_table* %997, %struct.UT_hash_table** %1000, align 8
  br label %1001

; <label>:1001:                                   ; preds = %993
  %1002 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1003 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1002, i32 0, i32 2
  %1004 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1003, i32 0, i32 2
  store i8* null, i8** %1004, align 8
  %1005 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1006 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1005, i32 0, i32 2
  %1007 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1006, i32 0, i32 0
  %1008 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1007, align 8
  %1009 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1008, i32 0, i32 4
  %1010 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1009, align 8
  %1011 = bitcast %struct.UT_hash_handle* %1010 to i8*
  %1012 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1013 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1012, i32 0, i32 2
  %1014 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1013, i32 0, i32 0
  %1015 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1014, align 8
  %1016 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1015, i32 0, i32 5
  %1017 = load i64, i64* %1016, align 8
  %1018 = sub i64 0, %1017
  %1019 = getelementptr inbounds i8, i8* %1011, i64 %1018
  %1020 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1021 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1020, i32 0, i32 2
  %1022 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1021, i32 0, i32 1
  store i8* %1019, i8** %1022, align 8
  %1023 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1024 = bitcast %struct.FuncEntry* %1023 to i8*
  %1025 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1026 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1025, i32 0, i32 2
  %1027 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1026, i32 0, i32 0
  %1028 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1027, align 8
  %1029 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1028, i32 0, i32 4
  %1030 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1029, align 8
  %1031 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1030, i32 0, i32 2
  store i8* %1024, i8** %1031, align 8
  %1032 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1033 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1032, i32 0, i32 2
  %1034 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1035 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1034, i32 0, i32 2
  %1036 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1035, i32 0, i32 0
  %1037 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1036, align 8
  %1038 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1037, i32 0, i32 4
  store %struct.UT_hash_handle* %1033, %struct.UT_hash_handle** %1038, align 8
  br label %1039

; <label>:1039:                                   ; preds = %1001
  br label %1040

; <label>:1040:                                   ; preds = %1039, %991
  br label %1041

; <label>:1041:                                   ; preds = %1040
  %1042 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1043 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1042, i32 0, i32 2
  %1044 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1043, i32 0, i32 0
  %1045 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1044, align 8
  %1046 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1045, i32 0, i32 3
  %1047 = load i32, i32* %1046, align 8
  %1048 = add i32 %1047, 1
  store i32 %1048, i32* %1046, align 8
  br label %1049

; <label>:1049:                                   ; preds = %1041
  %1050 = load i32, i32* %18, align 4
  %1051 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1052 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1051, i32 0, i32 2
  %1053 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1052, i32 0, i32 0
  %1054 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1053, align 8
  %1055 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1054, i32 0, i32 1
  %1056 = load i32, i32* %1055, align 8
  %1057 = sub i32 %1056, 1
  %1058 = and i32 %1050, %1057
  store i32 %1058, i32* %23, align 4
  br label %1059

; <label>:1059:                                   ; preds = %1049
  br label %1060

; <label>:1060:                                   ; preds = %1059
  %1061 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1062 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1061, i32 0, i32 2
  %1063 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1062, i32 0, i32 0
  %1064 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1063, align 8
  %1065 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1064, i32 0, i32 0
  %1066 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1065, align 8
  %1067 = load i32, i32* %23, align 4
  %1068 = zext i32 %1067 to i64
  %1069 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1066, i64 %1068
  store %struct.UT_hash_bucket* %1069, %struct.UT_hash_bucket** %24, align 8
  %1070 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %24, align 8
  %1071 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1070, i32 0, i32 1
  %1072 = load i32, i32* %1071, align 8
  %1073 = add i32 %1072, 1
  store i32 %1073, i32* %1071, align 8
  %1074 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %24, align 8
  %1075 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1074, i32 0, i32 0
  %1076 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1075, align 8
  %1077 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1078 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1077, i32 0, i32 2
  %1079 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1078, i32 0, i32 4
  store %struct.UT_hash_handle* %1076, %struct.UT_hash_handle** %1079, align 8
  %1080 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1081 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1080, i32 0, i32 2
  %1082 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1081, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1082, align 8
  %1083 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %24, align 8
  %1084 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1083, i32 0, i32 0
  %1085 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1084, align 8
  %1086 = icmp ne %struct.UT_hash_handle* %1085, null
  br i1 %1086, label %1087, label %1094

; <label>:1087:                                   ; preds = %1060
  %1088 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1089 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1088, i32 0, i32 2
  %1090 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %24, align 8
  %1091 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1090, i32 0, i32 0
  %1092 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1091, align 8
  %1093 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1092, i32 0, i32 3
  store %struct.UT_hash_handle* %1089, %struct.UT_hash_handle** %1093, align 8
  br label %1094

; <label>:1094:                                   ; preds = %1087, %1060
  %1095 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1096 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1095, i32 0, i32 2
  %1097 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %24, align 8
  %1098 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1097, i32 0, i32 0
  store %struct.UT_hash_handle* %1096, %struct.UT_hash_handle** %1098, align 8
  %1099 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %24, align 8
  %1100 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1099, i32 0, i32 1
  %1101 = load i32, i32* %1100, align 8
  %1102 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %24, align 8
  %1103 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1102, i32 0, i32 2
  %1104 = load i32, i32* %1103, align 4
  %1105 = add i32 %1104, 1
  %1106 = mul i32 %1105, 10
  %1107 = icmp uge i32 %1101, %1106
  br i1 %1107, label %1108, label %1373

; <label>:1108:                                   ; preds = %1094
  %1109 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1110 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1109, i32 0, i32 2
  %1111 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1110, i32 0, i32 0
  %1112 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1111, align 8
  %1113 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1112, i32 0, i32 9
  %1114 = load i32, i32* %1113, align 4
  %1115 = icmp ne i32 %1114, 0
  br i1 %1115, label %1373, label %1116

; <label>:1116:                                   ; preds = %1108
  br label %1117

; <label>:1117:                                   ; preds = %1116
  %1118 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1119 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1118, i32 0, i32 2
  %1120 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1119, i32 0, i32 0
  %1121 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1120, align 8
  %1122 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1121, i32 0, i32 1
  %1123 = load i32, i32* %1122, align 8
  %1124 = zext i32 %1123 to i64
  %1125 = mul i64 16, %1124
  %1126 = mul i64 %1125, 2
  %1127 = call noalias i8* @malloc(i64 %1126) #6
  %1128 = bitcast i8* %1127 to %struct.UT_hash_bucket*
  store %struct.UT_hash_bucket* %1128, %struct.UT_hash_bucket** %29, align 8
  %1129 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %29, align 8
  %1130 = icmp ne %struct.UT_hash_bucket* %1129, null
  br i1 %1130, label %1132, label %1131

; <label>:1131:                                   ; preds = %1117
  call void @exit(i32 -1) #8
  unreachable

; <label>:1132:                                   ; preds = %1117
  %1133 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %29, align 8
  %1134 = bitcast %struct.UT_hash_bucket* %1133 to i8*
  %1135 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1136 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1135, i32 0, i32 2
  %1137 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1136, i32 0, i32 0
  %1138 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1137, align 8
  %1139 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1138, i32 0, i32 1
  %1140 = load i32, i32* %1139, align 8
  %1141 = zext i32 %1140 to i64
  %1142 = mul i64 16, %1141
  %1143 = mul i64 %1142, 2
  call void @llvm.memset.p0i8.i64(i8* align 8 %1134, i8 0, i64 %1143, i1 false)
  %1144 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1145 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1144, i32 0, i32 2
  %1146 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1145, i32 0, i32 0
  %1147 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1146, align 8
  %1148 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1147, i32 0, i32 3
  %1149 = load i32, i32* %1148, align 8
  %1150 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1151 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1150, i32 0, i32 2
  %1152 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1151, i32 0, i32 0
  %1153 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1152, align 8
  %1154 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1153, i32 0, i32 2
  %1155 = load i32, i32* %1154, align 4
  %1156 = add i32 %1155, 1
  %1157 = lshr i32 %1149, %1156
  %1158 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1159 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1158, i32 0, i32 2
  %1160 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1159, i32 0, i32 0
  %1161 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1160, align 8
  %1162 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1161, i32 0, i32 3
  %1163 = load i32, i32* %1162, align 8
  %1164 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1165 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1164, i32 0, i32 2
  %1166 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1165, i32 0, i32 0
  %1167 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1166, align 8
  %1168 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1167, i32 0, i32 1
  %1169 = load i32, i32* %1168, align 8
  %1170 = mul i32 %1169, 2
  %1171 = sub i32 %1170, 1
  %1172 = and i32 %1163, %1171
  %1173 = icmp ne i32 %1172, 0
  %1174 = zext i1 %1173 to i64
  %1175 = select i1 %1173, i32 1, i32 0
  %1176 = add i32 %1157, %1175
  %1177 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1178 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1177, i32 0, i32 2
  %1179 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1178, i32 0, i32 0
  %1180 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1179, align 8
  %1181 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1180, i32 0, i32 6
  store i32 %1176, i32* %1181, align 8
  %1182 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1183 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1182, i32 0, i32 2
  %1184 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1183, i32 0, i32 0
  %1185 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1184, align 8
  %1186 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1185, i32 0, i32 7
  store i32 0, i32* %1186, align 4
  store i32 0, i32* %26, align 4
  br label %1187

; <label>:1187:                                   ; preds = %1296, %1132
  %1188 = load i32, i32* %26, align 4
  %1189 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1190 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1189, i32 0, i32 2
  %1191 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1190, i32 0, i32 0
  %1192 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1191, align 8
  %1193 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1192, i32 0, i32 1
  %1194 = load i32, i32* %1193, align 8
  %1195 = icmp ult i32 %1188, %1194
  br i1 %1195, label %1196, label %1299

; <label>:1196:                                   ; preds = %1187
  %1197 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1198 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1197, i32 0, i32 2
  %1199 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1198, i32 0, i32 0
  %1200 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1199, align 8
  %1201 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1200, i32 0, i32 0
  %1202 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1201, align 8
  %1203 = load i32, i32* %26, align 4
  %1204 = zext i32 %1203 to i64
  %1205 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1202, i64 %1204
  %1206 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1205, i32 0, i32 0
  %1207 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1206, align 8
  store %struct.UT_hash_handle* %1207, %struct.UT_hash_handle** %27, align 8
  br label %1208

; <label>:1208:                                   ; preds = %1290, %1196
  %1209 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %27, align 8
  %1210 = icmp ne %struct.UT_hash_handle* %1209, null
  br i1 %1210, label %1211, label %1295

; <label>:1211:                                   ; preds = %1208
  %1212 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %27, align 8
  %1213 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1212, i32 0, i32 4
  %1214 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1213, align 8
  store %struct.UT_hash_handle* %1214, %struct.UT_hash_handle** %28, align 8
  br label %1215

; <label>:1215:                                   ; preds = %1211
  %1216 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %27, align 8
  %1217 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1216, i32 0, i32 7
  %1218 = load i32, i32* %1217, align 4
  %1219 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1220 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1219, i32 0, i32 2
  %1221 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1220, i32 0, i32 0
  %1222 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1221, align 8
  %1223 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1222, i32 0, i32 1
  %1224 = load i32, i32* %1223, align 8
  %1225 = mul i32 %1224, 2
  %1226 = sub i32 %1225, 1
  %1227 = and i32 %1218, %1226
  store i32 %1227, i32* %25, align 4
  br label %1228

; <label>:1228:                                   ; preds = %1215
  %1229 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %29, align 8
  %1230 = load i32, i32* %25, align 4
  %1231 = zext i32 %1230 to i64
  %1232 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1229, i64 %1231
  store %struct.UT_hash_bucket* %1232, %struct.UT_hash_bucket** %30, align 8
  %1233 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %30, align 8
  %1234 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1233, i32 0, i32 1
  %1235 = load i32, i32* %1234, align 8
  %1236 = add i32 %1235, 1
  store i32 %1236, i32* %1234, align 8
  %1237 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1238 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1237, i32 0, i32 2
  %1239 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1238, i32 0, i32 0
  %1240 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1239, align 8
  %1241 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1240, i32 0, i32 6
  %1242 = load i32, i32* %1241, align 8
  %1243 = icmp ugt i32 %1236, %1242
  br i1 %1243, label %1244, label %1272

; <label>:1244:                                   ; preds = %1228
  %1245 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1246 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1245, i32 0, i32 2
  %1247 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1246, i32 0, i32 0
  %1248 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1247, align 8
  %1249 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1248, i32 0, i32 7
  %1250 = load i32, i32* %1249, align 4
  %1251 = add i32 %1250, 1
  store i32 %1251, i32* %1249, align 4
  %1252 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %30, align 8
  %1253 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1252, i32 0, i32 1
  %1254 = load i32, i32* %1253, align 8
  %1255 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %30, align 8
  %1256 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1255, i32 0, i32 2
  %1257 = load i32, i32* %1256, align 4
  %1258 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1259 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1258, i32 0, i32 2
  %1260 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1259, i32 0, i32 0
  %1261 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1260, align 8
  %1262 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1261, i32 0, i32 6
  %1263 = load i32, i32* %1262, align 8
  %1264 = mul i32 %1257, %1263
  %1265 = icmp ugt i32 %1254, %1264
  br i1 %1265, label %1266, label %1271

; <label>:1266:                                   ; preds = %1244
  %1267 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %30, align 8
  %1268 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1267, i32 0, i32 2
  %1269 = load i32, i32* %1268, align 4
  %1270 = add i32 %1269, 1
  store i32 %1270, i32* %1268, align 4
  br label %1271

; <label>:1271:                                   ; preds = %1266, %1244
  br label %1272

; <label>:1272:                                   ; preds = %1271, %1228
  %1273 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %27, align 8
  %1274 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1273, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1274, align 8
  %1275 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %30, align 8
  %1276 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1275, i32 0, i32 0
  %1277 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1276, align 8
  %1278 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %27, align 8
  %1279 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1278, i32 0, i32 4
  store %struct.UT_hash_handle* %1277, %struct.UT_hash_handle** %1279, align 8
  %1280 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %30, align 8
  %1281 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1280, i32 0, i32 0
  %1282 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1281, align 8
  %1283 = icmp ne %struct.UT_hash_handle* %1282, null
  br i1 %1283, label %1284, label %1290

; <label>:1284:                                   ; preds = %1272
  %1285 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %27, align 8
  %1286 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %30, align 8
  %1287 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1286, i32 0, i32 0
  %1288 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1287, align 8
  %1289 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1288, i32 0, i32 3
  store %struct.UT_hash_handle* %1285, %struct.UT_hash_handle** %1289, align 8
  br label %1290

; <label>:1290:                                   ; preds = %1284, %1272
  %1291 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %27, align 8
  %1292 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %30, align 8
  %1293 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1292, i32 0, i32 0
  store %struct.UT_hash_handle* %1291, %struct.UT_hash_handle** %1293, align 8
  %1294 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %28, align 8
  store %struct.UT_hash_handle* %1294, %struct.UT_hash_handle** %27, align 8
  br label %1208

; <label>:1295:                                   ; preds = %1208
  br label %1296

; <label>:1296:                                   ; preds = %1295
  %1297 = load i32, i32* %26, align 4
  %1298 = add i32 %1297, 1
  store i32 %1298, i32* %26, align 4
  br label %1187

; <label>:1299:                                   ; preds = %1187
  %1300 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1301 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1300, i32 0, i32 2
  %1302 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1301, i32 0, i32 0
  %1303 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1302, align 8
  %1304 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1303, i32 0, i32 0
  %1305 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1304, align 8
  %1306 = bitcast %struct.UT_hash_bucket* %1305 to i8*
  call void @free(i8* %1306) #6
  %1307 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1308 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1307, i32 0, i32 2
  %1309 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1308, i32 0, i32 0
  %1310 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1309, align 8
  %1311 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1310, i32 0, i32 1
  %1312 = load i32, i32* %1311, align 8
  %1313 = mul i32 %1312, 2
  store i32 %1313, i32* %1311, align 8
  %1314 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1315 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1314, i32 0, i32 2
  %1316 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1315, i32 0, i32 0
  %1317 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1316, align 8
  %1318 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1317, i32 0, i32 2
  %1319 = load i32, i32* %1318, align 4
  %1320 = add i32 %1319, 1
  store i32 %1320, i32* %1318, align 4
  %1321 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %29, align 8
  %1322 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1323 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1322, i32 0, i32 2
  %1324 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1323, i32 0, i32 0
  %1325 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1324, align 8
  %1326 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1325, i32 0, i32 0
  store %struct.UT_hash_bucket* %1321, %struct.UT_hash_bucket** %1326, align 8
  %1327 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1328 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1327, i32 0, i32 2
  %1329 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1328, i32 0, i32 0
  %1330 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1329, align 8
  %1331 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1330, i32 0, i32 7
  %1332 = load i32, i32* %1331, align 4
  %1333 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1334 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1333, i32 0, i32 2
  %1335 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1334, i32 0, i32 0
  %1336 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1335, align 8
  %1337 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1336, i32 0, i32 3
  %1338 = load i32, i32* %1337, align 8
  %1339 = lshr i32 %1338, 1
  %1340 = icmp ugt i32 %1332, %1339
  br i1 %1340, label %1341, label %1349

; <label>:1341:                                   ; preds = %1299
  %1342 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1343 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1342, i32 0, i32 2
  %1344 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1343, i32 0, i32 0
  %1345 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1344, align 8
  %1346 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1345, i32 0, i32 8
  %1347 = load i32, i32* %1346, align 8
  %1348 = add i32 %1347, 1
  br label %1350

; <label>:1349:                                   ; preds = %1299
  br label %1350

; <label>:1350:                                   ; preds = %1349, %1341
  %1351 = phi i32 [ %1348, %1341 ], [ 0, %1349 ]
  %1352 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1353 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1352, i32 0, i32 2
  %1354 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1353, i32 0, i32 0
  %1355 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1354, align 8
  %1356 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1355, i32 0, i32 8
  store i32 %1351, i32* %1356, align 8
  %1357 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1358 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1357, i32 0, i32 2
  %1359 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1358, i32 0, i32 0
  %1360 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1359, align 8
  %1361 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1360, i32 0, i32 8
  %1362 = load i32, i32* %1361, align 8
  %1363 = icmp ugt i32 %1362, 1
  br i1 %1363, label %1364, label %1370

; <label>:1364:                                   ; preds = %1350
  %1365 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1366 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1365, i32 0, i32 2
  %1367 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1366, i32 0, i32 0
  %1368 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1367, align 8
  %1369 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1368, i32 0, i32 9
  store i32 1, i32* %1369, align 4
  br label %1370

; <label>:1370:                                   ; preds = %1364, %1350
  br label %1371

; <label>:1371:                                   ; preds = %1370
  br label %1372

; <label>:1372:                                   ; preds = %1371
  br label %1373

; <label>:1373:                                   ; preds = %1372, %1108, %1094
  br label %1374

; <label>:1374:                                   ; preds = %1373
  br label %1375

; <label>:1375:                                   ; preds = %1374
  br label %1376

; <label>:1376:                                   ; preds = %1375
  br label %1377

; <label>:1377:                                   ; preds = %1376
  br label %1378

; <label>:1378:                                   ; preds = %1377
  br label %1379

; <label>:1379:                                   ; preds = %1378
  br label %1380

; <label>:1380:                                   ; preds = %1379
  %1381 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1382 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1381, i32 0, i32 1
  %1383 = bitcast [20 x i8]* %1382 to i8*
  store i8* %1383, i8** %35, align 8
  store i32 -17973521, i32* %31, align 4
  store i32 -1640531527, i32* %33, align 4
  store i32 -1640531527, i32* %32, align 4
  %1384 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1385 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1384, i32 0, i32 1
  %1386 = getelementptr inbounds [20 x i8], [20 x i8]* %1385, i32 0, i32 0
  %1387 = call i64 @strlen(i8* %1386) #7
  %1388 = trunc i64 %1387 to i32
  store i32 %1388, i32* %34, align 4
  br label %1389

; <label>:1389:                                   ; preds = %1556, %1380
  %1390 = load i32, i32* %34, align 4
  %1391 = icmp uge i32 %1390, 12
  br i1 %1391, label %1392, label %1561

; <label>:1392:                                   ; preds = %1389
  %1393 = load i8*, i8** %35, align 8
  %1394 = getelementptr inbounds i8, i8* %1393, i64 0
  %1395 = load i8, i8* %1394, align 1
  %1396 = zext i8 %1395 to i32
  %1397 = load i8*, i8** %35, align 8
  %1398 = getelementptr inbounds i8, i8* %1397, i64 1
  %1399 = load i8, i8* %1398, align 1
  %1400 = zext i8 %1399 to i32
  %1401 = shl i32 %1400, 8
  %1402 = add i32 %1396, %1401
  %1403 = load i8*, i8** %35, align 8
  %1404 = getelementptr inbounds i8, i8* %1403, i64 2
  %1405 = load i8, i8* %1404, align 1
  %1406 = zext i8 %1405 to i32
  %1407 = shl i32 %1406, 16
  %1408 = add i32 %1402, %1407
  %1409 = load i8*, i8** %35, align 8
  %1410 = getelementptr inbounds i8, i8* %1409, i64 3
  %1411 = load i8, i8* %1410, align 1
  %1412 = zext i8 %1411 to i32
  %1413 = shl i32 %1412, 24
  %1414 = add i32 %1408, %1413
  %1415 = load i32, i32* %32, align 4
  %1416 = add i32 %1415, %1414
  store i32 %1416, i32* %32, align 4
  %1417 = load i8*, i8** %35, align 8
  %1418 = getelementptr inbounds i8, i8* %1417, i64 4
  %1419 = load i8, i8* %1418, align 1
  %1420 = zext i8 %1419 to i32
  %1421 = load i8*, i8** %35, align 8
  %1422 = getelementptr inbounds i8, i8* %1421, i64 5
  %1423 = load i8, i8* %1422, align 1
  %1424 = zext i8 %1423 to i32
  %1425 = shl i32 %1424, 8
  %1426 = add i32 %1420, %1425
  %1427 = load i8*, i8** %35, align 8
  %1428 = getelementptr inbounds i8, i8* %1427, i64 6
  %1429 = load i8, i8* %1428, align 1
  %1430 = zext i8 %1429 to i32
  %1431 = shl i32 %1430, 16
  %1432 = add i32 %1426, %1431
  %1433 = load i8*, i8** %35, align 8
  %1434 = getelementptr inbounds i8, i8* %1433, i64 7
  %1435 = load i8, i8* %1434, align 1
  %1436 = zext i8 %1435 to i32
  %1437 = shl i32 %1436, 24
  %1438 = add i32 %1432, %1437
  %1439 = load i32, i32* %33, align 4
  %1440 = add i32 %1439, %1438
  store i32 %1440, i32* %33, align 4
  %1441 = load i8*, i8** %35, align 8
  %1442 = getelementptr inbounds i8, i8* %1441, i64 8
  %1443 = load i8, i8* %1442, align 1
  %1444 = zext i8 %1443 to i32
  %1445 = load i8*, i8** %35, align 8
  %1446 = getelementptr inbounds i8, i8* %1445, i64 9
  %1447 = load i8, i8* %1446, align 1
  %1448 = zext i8 %1447 to i32
  %1449 = shl i32 %1448, 8
  %1450 = add i32 %1444, %1449
  %1451 = load i8*, i8** %35, align 8
  %1452 = getelementptr inbounds i8, i8* %1451, i64 10
  %1453 = load i8, i8* %1452, align 1
  %1454 = zext i8 %1453 to i32
  %1455 = shl i32 %1454, 16
  %1456 = add i32 %1450, %1455
  %1457 = load i8*, i8** %35, align 8
  %1458 = getelementptr inbounds i8, i8* %1457, i64 11
  %1459 = load i8, i8* %1458, align 1
  %1460 = zext i8 %1459 to i32
  %1461 = shl i32 %1460, 24
  %1462 = add i32 %1456, %1461
  %1463 = load i32, i32* %31, align 4
  %1464 = add i32 %1463, %1462
  store i32 %1464, i32* %31, align 4
  br label %1465

; <label>:1465:                                   ; preds = %1392
  %1466 = load i32, i32* %33, align 4
  %1467 = load i32, i32* %32, align 4
  %1468 = sub i32 %1467, %1466
  store i32 %1468, i32* %32, align 4
  %1469 = load i32, i32* %31, align 4
  %1470 = load i32, i32* %32, align 4
  %1471 = sub i32 %1470, %1469
  store i32 %1471, i32* %32, align 4
  %1472 = load i32, i32* %31, align 4
  %1473 = lshr i32 %1472, 13
  %1474 = load i32, i32* %32, align 4
  %1475 = xor i32 %1474, %1473
  store i32 %1475, i32* %32, align 4
  %1476 = load i32, i32* %31, align 4
  %1477 = load i32, i32* %33, align 4
  %1478 = sub i32 %1477, %1476
  store i32 %1478, i32* %33, align 4
  %1479 = load i32, i32* %32, align 4
  %1480 = load i32, i32* %33, align 4
  %1481 = sub i32 %1480, %1479
  store i32 %1481, i32* %33, align 4
  %1482 = load i32, i32* %32, align 4
  %1483 = shl i32 %1482, 8
  %1484 = load i32, i32* %33, align 4
  %1485 = xor i32 %1484, %1483
  store i32 %1485, i32* %33, align 4
  %1486 = load i32, i32* %32, align 4
  %1487 = load i32, i32* %31, align 4
  %1488 = sub i32 %1487, %1486
  store i32 %1488, i32* %31, align 4
  %1489 = load i32, i32* %33, align 4
  %1490 = load i32, i32* %31, align 4
  %1491 = sub i32 %1490, %1489
  store i32 %1491, i32* %31, align 4
  %1492 = load i32, i32* %33, align 4
  %1493 = lshr i32 %1492, 13
  %1494 = load i32, i32* %31, align 4
  %1495 = xor i32 %1494, %1493
  store i32 %1495, i32* %31, align 4
  %1496 = load i32, i32* %33, align 4
  %1497 = load i32, i32* %32, align 4
  %1498 = sub i32 %1497, %1496
  store i32 %1498, i32* %32, align 4
  %1499 = load i32, i32* %31, align 4
  %1500 = load i32, i32* %32, align 4
  %1501 = sub i32 %1500, %1499
  store i32 %1501, i32* %32, align 4
  %1502 = load i32, i32* %31, align 4
  %1503 = lshr i32 %1502, 12
  %1504 = load i32, i32* %32, align 4
  %1505 = xor i32 %1504, %1503
  store i32 %1505, i32* %32, align 4
  %1506 = load i32, i32* %31, align 4
  %1507 = load i32, i32* %33, align 4
  %1508 = sub i32 %1507, %1506
  store i32 %1508, i32* %33, align 4
  %1509 = load i32, i32* %32, align 4
  %1510 = load i32, i32* %33, align 4
  %1511 = sub i32 %1510, %1509
  store i32 %1511, i32* %33, align 4
  %1512 = load i32, i32* %32, align 4
  %1513 = shl i32 %1512, 16
  %1514 = load i32, i32* %33, align 4
  %1515 = xor i32 %1514, %1513
  store i32 %1515, i32* %33, align 4
  %1516 = load i32, i32* %32, align 4
  %1517 = load i32, i32* %31, align 4
  %1518 = sub i32 %1517, %1516
  store i32 %1518, i32* %31, align 4
  %1519 = load i32, i32* %33, align 4
  %1520 = load i32, i32* %31, align 4
  %1521 = sub i32 %1520, %1519
  store i32 %1521, i32* %31, align 4
  %1522 = load i32, i32* %33, align 4
  %1523 = lshr i32 %1522, 5
  %1524 = load i32, i32* %31, align 4
  %1525 = xor i32 %1524, %1523
  store i32 %1525, i32* %31, align 4
  %1526 = load i32, i32* %33, align 4
  %1527 = load i32, i32* %32, align 4
  %1528 = sub i32 %1527, %1526
  store i32 %1528, i32* %32, align 4
  %1529 = load i32, i32* %31, align 4
  %1530 = load i32, i32* %32, align 4
  %1531 = sub i32 %1530, %1529
  store i32 %1531, i32* %32, align 4
  %1532 = load i32, i32* %31, align 4
  %1533 = lshr i32 %1532, 3
  %1534 = load i32, i32* %32, align 4
  %1535 = xor i32 %1534, %1533
  store i32 %1535, i32* %32, align 4
  %1536 = load i32, i32* %31, align 4
  %1537 = load i32, i32* %33, align 4
  %1538 = sub i32 %1537, %1536
  store i32 %1538, i32* %33, align 4
  %1539 = load i32, i32* %32, align 4
  %1540 = load i32, i32* %33, align 4
  %1541 = sub i32 %1540, %1539
  store i32 %1541, i32* %33, align 4
  %1542 = load i32, i32* %32, align 4
  %1543 = shl i32 %1542, 10
  %1544 = load i32, i32* %33, align 4
  %1545 = xor i32 %1544, %1543
  store i32 %1545, i32* %33, align 4
  %1546 = load i32, i32* %32, align 4
  %1547 = load i32, i32* %31, align 4
  %1548 = sub i32 %1547, %1546
  store i32 %1548, i32* %31, align 4
  %1549 = load i32, i32* %33, align 4
  %1550 = load i32, i32* %31, align 4
  %1551 = sub i32 %1550, %1549
  store i32 %1551, i32* %31, align 4
  %1552 = load i32, i32* %33, align 4
  %1553 = lshr i32 %1552, 15
  %1554 = load i32, i32* %31, align 4
  %1555 = xor i32 %1554, %1553
  store i32 %1555, i32* %31, align 4
  br label %1556

; <label>:1556:                                   ; preds = %1465
  %1557 = load i8*, i8** %35, align 8
  %1558 = getelementptr inbounds i8, i8* %1557, i64 12
  store i8* %1558, i8** %35, align 8
  %1559 = load i32, i32* %34, align 4
  %1560 = sub i32 %1559, 12
  store i32 %1560, i32* %34, align 4
  br label %1389

; <label>:1561:                                   ; preds = %1389
  %1562 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1563 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1562, i32 0, i32 1
  %1564 = getelementptr inbounds [20 x i8], [20 x i8]* %1563, i32 0, i32 0
  %1565 = call i64 @strlen(i8* %1564) #7
  %1566 = trunc i64 %1565 to i32
  %1567 = load i32, i32* %31, align 4
  %1568 = add i32 %1567, %1566
  store i32 %1568, i32* %31, align 4
  %1569 = load i32, i32* %34, align 4
  switch i32 %1569, label %1656 [
    i32 11, label %1570
    i32 10, label %1578
    i32 9, label %1586
    i32 8, label %1594
    i32 7, label %1602
    i32 6, label %1610
    i32 5, label %1618
    i32 4, label %1625
    i32 3, label %1633
    i32 2, label %1641
    i32 1, label %1649
  ]

; <label>:1570:                                   ; preds = %1561
  %1571 = load i8*, i8** %35, align 8
  %1572 = getelementptr inbounds i8, i8* %1571, i64 10
  %1573 = load i8, i8* %1572, align 1
  %1574 = zext i8 %1573 to i32
  %1575 = shl i32 %1574, 24
  %1576 = load i32, i32* %31, align 4
  %1577 = add i32 %1576, %1575
  store i32 %1577, i32* %31, align 4
  br label %1578

; <label>:1578:                                   ; preds = %1561, %1570
  %1579 = load i8*, i8** %35, align 8
  %1580 = getelementptr inbounds i8, i8* %1579, i64 9
  %1581 = load i8, i8* %1580, align 1
  %1582 = zext i8 %1581 to i32
  %1583 = shl i32 %1582, 16
  %1584 = load i32, i32* %31, align 4
  %1585 = add i32 %1584, %1583
  store i32 %1585, i32* %31, align 4
  br label %1586

; <label>:1586:                                   ; preds = %1561, %1578
  %1587 = load i8*, i8** %35, align 8
  %1588 = getelementptr inbounds i8, i8* %1587, i64 8
  %1589 = load i8, i8* %1588, align 1
  %1590 = zext i8 %1589 to i32
  %1591 = shl i32 %1590, 8
  %1592 = load i32, i32* %31, align 4
  %1593 = add i32 %1592, %1591
  store i32 %1593, i32* %31, align 4
  br label %1594

; <label>:1594:                                   ; preds = %1561, %1586
  %1595 = load i8*, i8** %35, align 8
  %1596 = getelementptr inbounds i8, i8* %1595, i64 7
  %1597 = load i8, i8* %1596, align 1
  %1598 = zext i8 %1597 to i32
  %1599 = shl i32 %1598, 24
  %1600 = load i32, i32* %33, align 4
  %1601 = add i32 %1600, %1599
  store i32 %1601, i32* %33, align 4
  br label %1602

; <label>:1602:                                   ; preds = %1561, %1594
  %1603 = load i8*, i8** %35, align 8
  %1604 = getelementptr inbounds i8, i8* %1603, i64 6
  %1605 = load i8, i8* %1604, align 1
  %1606 = zext i8 %1605 to i32
  %1607 = shl i32 %1606, 16
  %1608 = load i32, i32* %33, align 4
  %1609 = add i32 %1608, %1607
  store i32 %1609, i32* %33, align 4
  br label %1610

; <label>:1610:                                   ; preds = %1561, %1602
  %1611 = load i8*, i8** %35, align 8
  %1612 = getelementptr inbounds i8, i8* %1611, i64 5
  %1613 = load i8, i8* %1612, align 1
  %1614 = zext i8 %1613 to i32
  %1615 = shl i32 %1614, 8
  %1616 = load i32, i32* %33, align 4
  %1617 = add i32 %1616, %1615
  store i32 %1617, i32* %33, align 4
  br label %1618

; <label>:1618:                                   ; preds = %1561, %1610
  %1619 = load i8*, i8** %35, align 8
  %1620 = getelementptr inbounds i8, i8* %1619, i64 4
  %1621 = load i8, i8* %1620, align 1
  %1622 = zext i8 %1621 to i32
  %1623 = load i32, i32* %33, align 4
  %1624 = add i32 %1623, %1622
  store i32 %1624, i32* %33, align 4
  br label %1625

; <label>:1625:                                   ; preds = %1561, %1618
  %1626 = load i8*, i8** %35, align 8
  %1627 = getelementptr inbounds i8, i8* %1626, i64 3
  %1628 = load i8, i8* %1627, align 1
  %1629 = zext i8 %1628 to i32
  %1630 = shl i32 %1629, 24
  %1631 = load i32, i32* %32, align 4
  %1632 = add i32 %1631, %1630
  store i32 %1632, i32* %32, align 4
  br label %1633

; <label>:1633:                                   ; preds = %1561, %1625
  %1634 = load i8*, i8** %35, align 8
  %1635 = getelementptr inbounds i8, i8* %1634, i64 2
  %1636 = load i8, i8* %1635, align 1
  %1637 = zext i8 %1636 to i32
  %1638 = shl i32 %1637, 16
  %1639 = load i32, i32* %32, align 4
  %1640 = add i32 %1639, %1638
  store i32 %1640, i32* %32, align 4
  br label %1641

; <label>:1641:                                   ; preds = %1561, %1633
  %1642 = load i8*, i8** %35, align 8
  %1643 = getelementptr inbounds i8, i8* %1642, i64 1
  %1644 = load i8, i8* %1643, align 1
  %1645 = zext i8 %1644 to i32
  %1646 = shl i32 %1645, 8
  %1647 = load i32, i32* %32, align 4
  %1648 = add i32 %1647, %1646
  store i32 %1648, i32* %32, align 4
  br label %1649

; <label>:1649:                                   ; preds = %1561, %1641
  %1650 = load i8*, i8** %35, align 8
  %1651 = getelementptr inbounds i8, i8* %1650, i64 0
  %1652 = load i8, i8* %1651, align 1
  %1653 = zext i8 %1652 to i32
  %1654 = load i32, i32* %32, align 4
  %1655 = add i32 %1654, %1653
  store i32 %1655, i32* %32, align 4
  br label %1656

; <label>:1656:                                   ; preds = %1561, %1649
  br label %1657

; <label>:1657:                                   ; preds = %1656
  br label %1658

; <label>:1658:                                   ; preds = %1657
  %1659 = load i32, i32* %33, align 4
  %1660 = load i32, i32* %32, align 4
  %1661 = sub i32 %1660, %1659
  store i32 %1661, i32* %32, align 4
  %1662 = load i32, i32* %31, align 4
  %1663 = load i32, i32* %32, align 4
  %1664 = sub i32 %1663, %1662
  store i32 %1664, i32* %32, align 4
  %1665 = load i32, i32* %31, align 4
  %1666 = lshr i32 %1665, 13
  %1667 = load i32, i32* %32, align 4
  %1668 = xor i32 %1667, %1666
  store i32 %1668, i32* %32, align 4
  %1669 = load i32, i32* %31, align 4
  %1670 = load i32, i32* %33, align 4
  %1671 = sub i32 %1670, %1669
  store i32 %1671, i32* %33, align 4
  %1672 = load i32, i32* %32, align 4
  %1673 = load i32, i32* %33, align 4
  %1674 = sub i32 %1673, %1672
  store i32 %1674, i32* %33, align 4
  %1675 = load i32, i32* %32, align 4
  %1676 = shl i32 %1675, 8
  %1677 = load i32, i32* %33, align 4
  %1678 = xor i32 %1677, %1676
  store i32 %1678, i32* %33, align 4
  %1679 = load i32, i32* %32, align 4
  %1680 = load i32, i32* %31, align 4
  %1681 = sub i32 %1680, %1679
  store i32 %1681, i32* %31, align 4
  %1682 = load i32, i32* %33, align 4
  %1683 = load i32, i32* %31, align 4
  %1684 = sub i32 %1683, %1682
  store i32 %1684, i32* %31, align 4
  %1685 = load i32, i32* %33, align 4
  %1686 = lshr i32 %1685, 13
  %1687 = load i32, i32* %31, align 4
  %1688 = xor i32 %1687, %1686
  store i32 %1688, i32* %31, align 4
  %1689 = load i32, i32* %33, align 4
  %1690 = load i32, i32* %32, align 4
  %1691 = sub i32 %1690, %1689
  store i32 %1691, i32* %32, align 4
  %1692 = load i32, i32* %31, align 4
  %1693 = load i32, i32* %32, align 4
  %1694 = sub i32 %1693, %1692
  store i32 %1694, i32* %32, align 4
  %1695 = load i32, i32* %31, align 4
  %1696 = lshr i32 %1695, 12
  %1697 = load i32, i32* %32, align 4
  %1698 = xor i32 %1697, %1696
  store i32 %1698, i32* %32, align 4
  %1699 = load i32, i32* %31, align 4
  %1700 = load i32, i32* %33, align 4
  %1701 = sub i32 %1700, %1699
  store i32 %1701, i32* %33, align 4
  %1702 = load i32, i32* %32, align 4
  %1703 = load i32, i32* %33, align 4
  %1704 = sub i32 %1703, %1702
  store i32 %1704, i32* %33, align 4
  %1705 = load i32, i32* %32, align 4
  %1706 = shl i32 %1705, 16
  %1707 = load i32, i32* %33, align 4
  %1708 = xor i32 %1707, %1706
  store i32 %1708, i32* %33, align 4
  %1709 = load i32, i32* %32, align 4
  %1710 = load i32, i32* %31, align 4
  %1711 = sub i32 %1710, %1709
  store i32 %1711, i32* %31, align 4
  %1712 = load i32, i32* %33, align 4
  %1713 = load i32, i32* %31, align 4
  %1714 = sub i32 %1713, %1712
  store i32 %1714, i32* %31, align 4
  %1715 = load i32, i32* %33, align 4
  %1716 = lshr i32 %1715, 5
  %1717 = load i32, i32* %31, align 4
  %1718 = xor i32 %1717, %1716
  store i32 %1718, i32* %31, align 4
  %1719 = load i32, i32* %33, align 4
  %1720 = load i32, i32* %32, align 4
  %1721 = sub i32 %1720, %1719
  store i32 %1721, i32* %32, align 4
  %1722 = load i32, i32* %31, align 4
  %1723 = load i32, i32* %32, align 4
  %1724 = sub i32 %1723, %1722
  store i32 %1724, i32* %32, align 4
  %1725 = load i32, i32* %31, align 4
  %1726 = lshr i32 %1725, 3
  %1727 = load i32, i32* %32, align 4
  %1728 = xor i32 %1727, %1726
  store i32 %1728, i32* %32, align 4
  %1729 = load i32, i32* %31, align 4
  %1730 = load i32, i32* %33, align 4
  %1731 = sub i32 %1730, %1729
  store i32 %1731, i32* %33, align 4
  %1732 = load i32, i32* %32, align 4
  %1733 = load i32, i32* %33, align 4
  %1734 = sub i32 %1733, %1732
  store i32 %1734, i32* %33, align 4
  %1735 = load i32, i32* %32, align 4
  %1736 = shl i32 %1735, 10
  %1737 = load i32, i32* %33, align 4
  %1738 = xor i32 %1737, %1736
  store i32 %1738, i32* %33, align 4
  %1739 = load i32, i32* %32, align 4
  %1740 = load i32, i32* %31, align 4
  %1741 = sub i32 %1740, %1739
  store i32 %1741, i32* %31, align 4
  %1742 = load i32, i32* %33, align 4
  %1743 = load i32, i32* %31, align 4
  %1744 = sub i32 %1743, %1742
  store i32 %1744, i32* %31, align 4
  %1745 = load i32, i32* %33, align 4
  %1746 = lshr i32 %1745, 15
  %1747 = load i32, i32* %31, align 4
  %1748 = xor i32 %1747, %1746
  store i32 %1748, i32* %31, align 4
  br label %1749

; <label>:1749:                                   ; preds = %1658
  br label %1750

; <label>:1750:                                   ; preds = %1749
  br label %1751

; <label>:1751:                                   ; preds = %1750
  br label %1752

; <label>:1752:                                   ; preds = %1751
  %1753 = load i32, i32* %31, align 4
  %1754 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1755 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1754, i32 0, i32 3
  %1756 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1755, i32 0, i32 7
  store i32 %1753, i32* %1756, align 4
  %1757 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1758 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1757, i32 0, i32 1
  %1759 = bitcast [20 x i8]* %1758 to i8*
  %1760 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1761 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1760, i32 0, i32 3
  %1762 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1761, i32 0, i32 5
  store i8* %1759, i8** %1762, align 8
  %1763 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1764 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1763, i32 0, i32 1
  %1765 = getelementptr inbounds [20 x i8], [20 x i8]* %1764, i32 0, i32 0
  %1766 = call i64 @strlen(i8* %1765) #7
  %1767 = trunc i64 %1766 to i32
  %1768 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1769 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1768, i32 0, i32 3
  %1770 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1769, i32 0, i32 6
  store i32 %1767, i32* %1770, align 8
  %1771 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1772 = icmp ne %struct.FuncEntry* %1771, null
  br i1 %1772, label %1860, label %1773

; <label>:1773:                                   ; preds = %1752
  %1774 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1775 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1774, i32 0, i32 3
  %1776 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1775, i32 0, i32 2
  store i8* null, i8** %1776, align 8
  %1777 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1778 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1777, i32 0, i32 3
  %1779 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1778, i32 0, i32 1
  store i8* null, i8** %1779, align 8
  br label %1780

; <label>:1780:                                   ; preds = %1773
  %1781 = call noalias i8* @malloc(i64 64) #6
  %1782 = bitcast i8* %1781 to %struct.UT_hash_table*
  %1783 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1784 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1783, i32 0, i32 3
  %1785 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1784, i32 0, i32 0
  store %struct.UT_hash_table* %1782, %struct.UT_hash_table** %1785, align 8
  %1786 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1787 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1786, i32 0, i32 3
  %1788 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1787, i32 0, i32 0
  %1789 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1788, align 8
  %1790 = icmp ne %struct.UT_hash_table* %1789, null
  br i1 %1790, label %1792, label %1791

; <label>:1791:                                   ; preds = %1780
  call void @exit(i32 -1) #8
  unreachable

; <label>:1792:                                   ; preds = %1780
  %1793 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1794 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1793, i32 0, i32 3
  %1795 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1794, i32 0, i32 0
  %1796 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1795, align 8
  %1797 = bitcast %struct.UT_hash_table* %1796 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1797, i8 0, i64 64, i1 false)
  %1798 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1799 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1798, i32 0, i32 3
  %1800 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1801 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1800, i32 0, i32 3
  %1802 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1801, i32 0, i32 0
  %1803 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1802, align 8
  %1804 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1803, i32 0, i32 4
  store %struct.UT_hash_handle* %1799, %struct.UT_hash_handle** %1804, align 8
  %1805 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1806 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1805, i32 0, i32 3
  %1807 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1806, i32 0, i32 0
  %1808 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1807, align 8
  %1809 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1808, i32 0, i32 1
  store i32 32, i32* %1809, align 8
  %1810 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1811 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1810, i32 0, i32 3
  %1812 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1811, i32 0, i32 0
  %1813 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1812, align 8
  %1814 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1813, i32 0, i32 2
  store i32 5, i32* %1814, align 4
  %1815 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1816 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1815, i32 0, i32 3
  %1817 = bitcast %struct.UT_hash_handle* %1816 to i8*
  %1818 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1819 = bitcast %struct.FuncEntry* %1818 to i8*
  %1820 = ptrtoint i8* %1817 to i64
  %1821 = ptrtoint i8* %1819 to i64
  %1822 = sub i64 %1820, %1821
  %1823 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1824 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1823, i32 0, i32 3
  %1825 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1824, i32 0, i32 0
  %1826 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1825, align 8
  %1827 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1826, i32 0, i32 5
  store i64 %1822, i64* %1827, align 8
  %1828 = call noalias i8* @malloc(i64 512) #6
  %1829 = bitcast i8* %1828 to %struct.UT_hash_bucket*
  %1830 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1831 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1830, i32 0, i32 3
  %1832 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1831, i32 0, i32 0
  %1833 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1832, align 8
  %1834 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1833, i32 0, i32 0
  store %struct.UT_hash_bucket* %1829, %struct.UT_hash_bucket** %1834, align 8
  %1835 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1836 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1835, i32 0, i32 3
  %1837 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1836, i32 0, i32 0
  %1838 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1837, align 8
  %1839 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1838, i32 0, i32 10
  store i32 -1609490463, i32* %1839, align 8
  %1840 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1841 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1840, i32 0, i32 3
  %1842 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1841, i32 0, i32 0
  %1843 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1842, align 8
  %1844 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1843, i32 0, i32 0
  %1845 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1844, align 8
  %1846 = icmp ne %struct.UT_hash_bucket* %1845, null
  br i1 %1846, label %1848, label %1847

; <label>:1847:                                   ; preds = %1792
  call void @exit(i32 -1) #8
  unreachable

; <label>:1848:                                   ; preds = %1792
  %1849 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1850 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1849, i32 0, i32 3
  %1851 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1850, i32 0, i32 0
  %1852 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1851, align 8
  %1853 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1852, i32 0, i32 0
  %1854 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1853, align 8
  %1855 = bitcast %struct.UT_hash_bucket* %1854 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1855, i8 0, i64 512, i1 false)
  br label %1856

; <label>:1856:                                   ; preds = %1848
  br label %1857

; <label>:1857:                                   ; preds = %1856
  br label %1858

; <label>:1858:                                   ; preds = %1857
  %1859 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  store %struct.FuncEntry* %1859, %struct.FuncEntry** @allowed_functions_address, align 8
  br label %1907

; <label>:1860:                                   ; preds = %1752
  %1861 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1862 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1861, i32 0, i32 3
  %1863 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1862, i32 0, i32 0
  %1864 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1863, align 8
  %1865 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1866 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1865, i32 0, i32 3
  %1867 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1866, i32 0, i32 0
  store %struct.UT_hash_table* %1864, %struct.UT_hash_table** %1867, align 8
  br label %1868

; <label>:1868:                                   ; preds = %1860
  %1869 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1870 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1869, i32 0, i32 3
  %1871 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1870, i32 0, i32 2
  store i8* null, i8** %1871, align 8
  %1872 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1873 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1872, i32 0, i32 3
  %1874 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1873, i32 0, i32 0
  %1875 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1874, align 8
  %1876 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1875, i32 0, i32 4
  %1877 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1876, align 8
  %1878 = bitcast %struct.UT_hash_handle* %1877 to i8*
  %1879 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1880 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1879, i32 0, i32 3
  %1881 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1880, i32 0, i32 0
  %1882 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1881, align 8
  %1883 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1882, i32 0, i32 5
  %1884 = load i64, i64* %1883, align 8
  %1885 = sub i64 0, %1884
  %1886 = getelementptr inbounds i8, i8* %1878, i64 %1885
  %1887 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1888 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1887, i32 0, i32 3
  %1889 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1888, i32 0, i32 1
  store i8* %1886, i8** %1889, align 8
  %1890 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1891 = bitcast %struct.FuncEntry* %1890 to i8*
  %1892 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1893 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1892, i32 0, i32 3
  %1894 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1893, i32 0, i32 0
  %1895 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1894, align 8
  %1896 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1895, i32 0, i32 4
  %1897 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1896, align 8
  %1898 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1897, i32 0, i32 2
  store i8* %1891, i8** %1898, align 8
  %1899 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1900 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1899, i32 0, i32 3
  %1901 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1902 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1901, i32 0, i32 3
  %1903 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1902, i32 0, i32 0
  %1904 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1903, align 8
  %1905 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1904, i32 0, i32 4
  store %struct.UT_hash_handle* %1900, %struct.UT_hash_handle** %1905, align 8
  br label %1906

; <label>:1906:                                   ; preds = %1868
  br label %1907

; <label>:1907:                                   ; preds = %1906, %1858
  br label %1908

; <label>:1908:                                   ; preds = %1907
  %1909 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1910 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1909, i32 0, i32 3
  %1911 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1910, i32 0, i32 0
  %1912 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1911, align 8
  %1913 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1912, i32 0, i32 3
  %1914 = load i32, i32* %1913, align 8
  %1915 = add i32 %1914, 1
  store i32 %1915, i32* %1913, align 8
  br label %1916

; <label>:1916:                                   ; preds = %1908
  %1917 = load i32, i32* %31, align 4
  %1918 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1919 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1918, i32 0, i32 3
  %1920 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1919, i32 0, i32 0
  %1921 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1920, align 8
  %1922 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1921, i32 0, i32 1
  %1923 = load i32, i32* %1922, align 8
  %1924 = sub i32 %1923, 1
  %1925 = and i32 %1917, %1924
  store i32 %1925, i32* %36, align 4
  br label %1926

; <label>:1926:                                   ; preds = %1916
  br label %1927

; <label>:1927:                                   ; preds = %1926
  %1928 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1929 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1928, i32 0, i32 3
  %1930 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1929, i32 0, i32 0
  %1931 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1930, align 8
  %1932 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1931, i32 0, i32 0
  %1933 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1932, align 8
  %1934 = load i32, i32* %36, align 4
  %1935 = zext i32 %1934 to i64
  %1936 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1933, i64 %1935
  store %struct.UT_hash_bucket* %1936, %struct.UT_hash_bucket** %37, align 8
  %1937 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %37, align 8
  %1938 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1937, i32 0, i32 1
  %1939 = load i32, i32* %1938, align 8
  %1940 = add i32 %1939, 1
  store i32 %1940, i32* %1938, align 8
  %1941 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %37, align 8
  %1942 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1941, i32 0, i32 0
  %1943 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1942, align 8
  %1944 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1945 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1944, i32 0, i32 3
  %1946 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1945, i32 0, i32 4
  store %struct.UT_hash_handle* %1943, %struct.UT_hash_handle** %1946, align 8
  %1947 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1948 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1947, i32 0, i32 3
  %1949 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1948, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1949, align 8
  %1950 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %37, align 8
  %1951 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1950, i32 0, i32 0
  %1952 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1951, align 8
  %1953 = icmp ne %struct.UT_hash_handle* %1952, null
  br i1 %1953, label %1954, label %1961

; <label>:1954:                                   ; preds = %1927
  %1955 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1956 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1955, i32 0, i32 3
  %1957 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %37, align 8
  %1958 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1957, i32 0, i32 0
  %1959 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1958, align 8
  %1960 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1959, i32 0, i32 3
  store %struct.UT_hash_handle* %1956, %struct.UT_hash_handle** %1960, align 8
  br label %1961

; <label>:1961:                                   ; preds = %1954, %1927
  %1962 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1963 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1962, i32 0, i32 3
  %1964 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %37, align 8
  %1965 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1964, i32 0, i32 0
  store %struct.UT_hash_handle* %1963, %struct.UT_hash_handle** %1965, align 8
  %1966 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %37, align 8
  %1967 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1966, i32 0, i32 1
  %1968 = load i32, i32* %1967, align 8
  %1969 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %37, align 8
  %1970 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1969, i32 0, i32 2
  %1971 = load i32, i32* %1970, align 4
  %1972 = add i32 %1971, 1
  %1973 = mul i32 %1972, 10
  %1974 = icmp uge i32 %1968, %1973
  br i1 %1974, label %1975, label %2240

; <label>:1975:                                   ; preds = %1961
  %1976 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1977 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1976, i32 0, i32 3
  %1978 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1977, i32 0, i32 0
  %1979 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1978, align 8
  %1980 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1979, i32 0, i32 9
  %1981 = load i32, i32* %1980, align 4
  %1982 = icmp ne i32 %1981, 0
  br i1 %1982, label %2240, label %1983

; <label>:1983:                                   ; preds = %1975
  br label %1984

; <label>:1984:                                   ; preds = %1983
  %1985 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %1986 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1985, i32 0, i32 3
  %1987 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1986, i32 0, i32 0
  %1988 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1987, align 8
  %1989 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1988, i32 0, i32 1
  %1990 = load i32, i32* %1989, align 8
  %1991 = zext i32 %1990 to i64
  %1992 = mul i64 16, %1991
  %1993 = mul i64 %1992, 2
  %1994 = call noalias i8* @malloc(i64 %1993) #6
  %1995 = bitcast i8* %1994 to %struct.UT_hash_bucket*
  store %struct.UT_hash_bucket* %1995, %struct.UT_hash_bucket** %42, align 8
  %1996 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %42, align 8
  %1997 = icmp ne %struct.UT_hash_bucket* %1996, null
  br i1 %1997, label %1999, label %1998

; <label>:1998:                                   ; preds = %1984
  call void @exit(i32 -1) #8
  unreachable

; <label>:1999:                                   ; preds = %1984
  %2000 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %42, align 8
  %2001 = bitcast %struct.UT_hash_bucket* %2000 to i8*
  %2002 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2003 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2002, i32 0, i32 3
  %2004 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2003, i32 0, i32 0
  %2005 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2004, align 8
  %2006 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2005, i32 0, i32 1
  %2007 = load i32, i32* %2006, align 8
  %2008 = zext i32 %2007 to i64
  %2009 = mul i64 16, %2008
  %2010 = mul i64 %2009, 2
  call void @llvm.memset.p0i8.i64(i8* align 8 %2001, i8 0, i64 %2010, i1 false)
  %2011 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2012 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2011, i32 0, i32 3
  %2013 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2012, i32 0, i32 0
  %2014 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2013, align 8
  %2015 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2014, i32 0, i32 3
  %2016 = load i32, i32* %2015, align 8
  %2017 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2018 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2017, i32 0, i32 3
  %2019 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2018, i32 0, i32 0
  %2020 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2019, align 8
  %2021 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2020, i32 0, i32 2
  %2022 = load i32, i32* %2021, align 4
  %2023 = add i32 %2022, 1
  %2024 = lshr i32 %2016, %2023
  %2025 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2026 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2025, i32 0, i32 3
  %2027 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2026, i32 0, i32 0
  %2028 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2027, align 8
  %2029 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2028, i32 0, i32 3
  %2030 = load i32, i32* %2029, align 8
  %2031 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2032 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2031, i32 0, i32 3
  %2033 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2032, i32 0, i32 0
  %2034 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2033, align 8
  %2035 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2034, i32 0, i32 1
  %2036 = load i32, i32* %2035, align 8
  %2037 = mul i32 %2036, 2
  %2038 = sub i32 %2037, 1
  %2039 = and i32 %2030, %2038
  %2040 = icmp ne i32 %2039, 0
  %2041 = zext i1 %2040 to i64
  %2042 = select i1 %2040, i32 1, i32 0
  %2043 = add i32 %2024, %2042
  %2044 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2045 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2044, i32 0, i32 3
  %2046 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2045, i32 0, i32 0
  %2047 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2046, align 8
  %2048 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2047, i32 0, i32 6
  store i32 %2043, i32* %2048, align 8
  %2049 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2050 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2049, i32 0, i32 3
  %2051 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2050, i32 0, i32 0
  %2052 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2051, align 8
  %2053 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2052, i32 0, i32 7
  store i32 0, i32* %2053, align 4
  store i32 0, i32* %39, align 4
  br label %2054

; <label>:2054:                                   ; preds = %2163, %1999
  %2055 = load i32, i32* %39, align 4
  %2056 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2057 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2056, i32 0, i32 3
  %2058 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2057, i32 0, i32 0
  %2059 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2058, align 8
  %2060 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2059, i32 0, i32 1
  %2061 = load i32, i32* %2060, align 8
  %2062 = icmp ult i32 %2055, %2061
  br i1 %2062, label %2063, label %2166

; <label>:2063:                                   ; preds = %2054
  %2064 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2065 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2064, i32 0, i32 3
  %2066 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2065, i32 0, i32 0
  %2067 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2066, align 8
  %2068 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2067, i32 0, i32 0
  %2069 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %2068, align 8
  %2070 = load i32, i32* %39, align 4
  %2071 = zext i32 %2070 to i64
  %2072 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2069, i64 %2071
  %2073 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2072, i32 0, i32 0
  %2074 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2073, align 8
  store %struct.UT_hash_handle* %2074, %struct.UT_hash_handle** %40, align 8
  br label %2075

; <label>:2075:                                   ; preds = %2157, %2063
  %2076 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %40, align 8
  %2077 = icmp ne %struct.UT_hash_handle* %2076, null
  br i1 %2077, label %2078, label %2162

; <label>:2078:                                   ; preds = %2075
  %2079 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %40, align 8
  %2080 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2079, i32 0, i32 4
  %2081 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2080, align 8
  store %struct.UT_hash_handle* %2081, %struct.UT_hash_handle** %41, align 8
  br label %2082

; <label>:2082:                                   ; preds = %2078
  %2083 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %40, align 8
  %2084 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2083, i32 0, i32 7
  %2085 = load i32, i32* %2084, align 4
  %2086 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2087 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2086, i32 0, i32 3
  %2088 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2087, i32 0, i32 0
  %2089 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2088, align 8
  %2090 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2089, i32 0, i32 1
  %2091 = load i32, i32* %2090, align 8
  %2092 = mul i32 %2091, 2
  %2093 = sub i32 %2092, 1
  %2094 = and i32 %2085, %2093
  store i32 %2094, i32* %38, align 4
  br label %2095

; <label>:2095:                                   ; preds = %2082
  %2096 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %42, align 8
  %2097 = load i32, i32* %38, align 4
  %2098 = zext i32 %2097 to i64
  %2099 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2096, i64 %2098
  store %struct.UT_hash_bucket* %2099, %struct.UT_hash_bucket** %43, align 8
  %2100 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %43, align 8
  %2101 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2100, i32 0, i32 1
  %2102 = load i32, i32* %2101, align 8
  %2103 = add i32 %2102, 1
  store i32 %2103, i32* %2101, align 8
  %2104 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2105 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2104, i32 0, i32 3
  %2106 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2105, i32 0, i32 0
  %2107 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2106, align 8
  %2108 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2107, i32 0, i32 6
  %2109 = load i32, i32* %2108, align 8
  %2110 = icmp ugt i32 %2103, %2109
  br i1 %2110, label %2111, label %2139

; <label>:2111:                                   ; preds = %2095
  %2112 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2113 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2112, i32 0, i32 3
  %2114 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2113, i32 0, i32 0
  %2115 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2114, align 8
  %2116 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2115, i32 0, i32 7
  %2117 = load i32, i32* %2116, align 4
  %2118 = add i32 %2117, 1
  store i32 %2118, i32* %2116, align 4
  %2119 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %43, align 8
  %2120 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2119, i32 0, i32 1
  %2121 = load i32, i32* %2120, align 8
  %2122 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %43, align 8
  %2123 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2122, i32 0, i32 2
  %2124 = load i32, i32* %2123, align 4
  %2125 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2126 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2125, i32 0, i32 3
  %2127 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2126, i32 0, i32 0
  %2128 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2127, align 8
  %2129 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2128, i32 0, i32 6
  %2130 = load i32, i32* %2129, align 8
  %2131 = mul i32 %2124, %2130
  %2132 = icmp ugt i32 %2121, %2131
  br i1 %2132, label %2133, label %2138

; <label>:2133:                                   ; preds = %2111
  %2134 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %43, align 8
  %2135 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2134, i32 0, i32 2
  %2136 = load i32, i32* %2135, align 4
  %2137 = add i32 %2136, 1
  store i32 %2137, i32* %2135, align 4
  br label %2138

; <label>:2138:                                   ; preds = %2133, %2111
  br label %2139

; <label>:2139:                                   ; preds = %2138, %2095
  %2140 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %40, align 8
  %2141 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2140, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %2141, align 8
  %2142 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %43, align 8
  %2143 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2142, i32 0, i32 0
  %2144 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2143, align 8
  %2145 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %40, align 8
  %2146 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2145, i32 0, i32 4
  store %struct.UT_hash_handle* %2144, %struct.UT_hash_handle** %2146, align 8
  %2147 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %43, align 8
  %2148 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2147, i32 0, i32 0
  %2149 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2148, align 8
  %2150 = icmp ne %struct.UT_hash_handle* %2149, null
  br i1 %2150, label %2151, label %2157

; <label>:2151:                                   ; preds = %2139
  %2152 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %40, align 8
  %2153 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %43, align 8
  %2154 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2153, i32 0, i32 0
  %2155 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2154, align 8
  %2156 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2155, i32 0, i32 3
  store %struct.UT_hash_handle* %2152, %struct.UT_hash_handle** %2156, align 8
  br label %2157

; <label>:2157:                                   ; preds = %2151, %2139
  %2158 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %40, align 8
  %2159 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %43, align 8
  %2160 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2159, i32 0, i32 0
  store %struct.UT_hash_handle* %2158, %struct.UT_hash_handle** %2160, align 8
  %2161 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %41, align 8
  store %struct.UT_hash_handle* %2161, %struct.UT_hash_handle** %40, align 8
  br label %2075

; <label>:2162:                                   ; preds = %2075
  br label %2163

; <label>:2163:                                   ; preds = %2162
  %2164 = load i32, i32* %39, align 4
  %2165 = add i32 %2164, 1
  store i32 %2165, i32* %39, align 4
  br label %2054

; <label>:2166:                                   ; preds = %2054
  %2167 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2168 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2167, i32 0, i32 3
  %2169 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2168, i32 0, i32 0
  %2170 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2169, align 8
  %2171 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2170, i32 0, i32 0
  %2172 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %2171, align 8
  %2173 = bitcast %struct.UT_hash_bucket* %2172 to i8*
  call void @free(i8* %2173) #6
  %2174 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2175 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2174, i32 0, i32 3
  %2176 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2175, i32 0, i32 0
  %2177 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2176, align 8
  %2178 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2177, i32 0, i32 1
  %2179 = load i32, i32* %2178, align 8
  %2180 = mul i32 %2179, 2
  store i32 %2180, i32* %2178, align 8
  %2181 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2182 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2181, i32 0, i32 3
  %2183 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2182, i32 0, i32 0
  %2184 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2183, align 8
  %2185 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2184, i32 0, i32 2
  %2186 = load i32, i32* %2185, align 4
  %2187 = add i32 %2186, 1
  store i32 %2187, i32* %2185, align 4
  %2188 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %42, align 8
  %2189 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2190 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2189, i32 0, i32 3
  %2191 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2190, i32 0, i32 0
  %2192 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2191, align 8
  %2193 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2192, i32 0, i32 0
  store %struct.UT_hash_bucket* %2188, %struct.UT_hash_bucket** %2193, align 8
  %2194 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2195 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2194, i32 0, i32 3
  %2196 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2195, i32 0, i32 0
  %2197 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2196, align 8
  %2198 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2197, i32 0, i32 7
  %2199 = load i32, i32* %2198, align 4
  %2200 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2201 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2200, i32 0, i32 3
  %2202 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2201, i32 0, i32 0
  %2203 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2202, align 8
  %2204 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2203, i32 0, i32 3
  %2205 = load i32, i32* %2204, align 8
  %2206 = lshr i32 %2205, 1
  %2207 = icmp ugt i32 %2199, %2206
  br i1 %2207, label %2208, label %2216

; <label>:2208:                                   ; preds = %2166
  %2209 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2210 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2209, i32 0, i32 3
  %2211 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2210, i32 0, i32 0
  %2212 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2211, align 8
  %2213 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2212, i32 0, i32 8
  %2214 = load i32, i32* %2213, align 8
  %2215 = add i32 %2214, 1
  br label %2217

; <label>:2216:                                   ; preds = %2166
  br label %2217

; <label>:2217:                                   ; preds = %2216, %2208
  %2218 = phi i32 [ %2215, %2208 ], [ 0, %2216 ]
  %2219 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2220 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2219, i32 0, i32 3
  %2221 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2220, i32 0, i32 0
  %2222 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2221, align 8
  %2223 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2222, i32 0, i32 8
  store i32 %2218, i32* %2223, align 8
  %2224 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2225 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2224, i32 0, i32 3
  %2226 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2225, i32 0, i32 0
  %2227 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2226, align 8
  %2228 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2227, i32 0, i32 8
  %2229 = load i32, i32* %2228, align 8
  %2230 = icmp ugt i32 %2229, 1
  br i1 %2230, label %2231, label %2237

; <label>:2231:                                   ; preds = %2217
  %2232 = load %struct.FuncEntry*, %struct.FuncEntry** %17, align 8
  %2233 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2232, i32 0, i32 3
  %2234 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2233, i32 0, i32 0
  %2235 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2234, align 8
  %2236 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2235, i32 0, i32 9
  store i32 1, i32* %2236, align 4
  br label %2237

; <label>:2237:                                   ; preds = %2231, %2217
  br label %2238

; <label>:2238:                                   ; preds = %2237
  br label %2239

; <label>:2239:                                   ; preds = %2238
  br label %2240

; <label>:2240:                                   ; preds = %2239, %1975, %1961
  br label %2241

; <label>:2241:                                   ; preds = %2240
  br label %2242

; <label>:2242:                                   ; preds = %2241
  br label %2243

; <label>:2243:                                   ; preds = %2242
  br label %2244

; <label>:2244:                                   ; preds = %2243
  br label %455

; <label>:2245:                                   ; preds = %455
  %2246 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8
  %2247 = call i32 @fclose(%struct._IO_FILE* %2246)
  %2248 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %2249 = icmp ne %struct.FuncEntry* %2248, null
  br i1 %2249, label %2250, label %2257

; <label>:2250:                                   ; preds = %2245
  %2251 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %2252 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2251, i32 0, i32 2
  %2253 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2252, i32 0, i32 0
  %2254 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2253, align 8
  %2255 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2254, i32 0, i32 3
  %2256 = load i32, i32* %2255, align 8
  br label %2258

; <label>:2257:                                   ; preds = %2245
  br label %2258

; <label>:2258:                                   ; preds = %2257, %2250
  %2259 = phi i32 [ %2256, %2250 ], [ 0, %2257 ]
  %2260 = load i32, i32* @mode_enum, align 4
  %2261 = call i8* @mode_to_string(i32 %2260)
  %2262 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.35, i32 0, i32 0), i32 %2259, i8* %2261)
  store volatile i32 0, i32* @mode_switching, align 4
  store i32 1, i32* @initialized2, align 4
  store i32 0, i32* @counter, align 4
  store i32 1, i32* @initialized3, align 4
  store i32 0, i32* @counter2, align 4
  br label %2263

; <label>:2263:                                   ; preds = %2258, %495, %453, %48
  ret void
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #1

declare dso_local noalias %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local void @perror(i8*) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strcspn(i8*, i8*) #3

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dummy_fn(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.FuncEntry*, align 8
  %4 = alloca [20 x i8], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.LoggedAddrEntry*, align 8
  %12 = alloca [20 x i8], align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i8*, align 8
  %18 = alloca i32, align 4
  %19 = alloca %struct._IO_FILE*, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  %26 = alloca %struct.UT_hash_bucket*, align 8
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca %struct.UT_hash_handle*, align 8
  %30 = alloca %struct.UT_hash_handle*, align 8
  %31 = alloca %struct.UT_hash_bucket*, align 8
  %32 = alloca %struct.UT_hash_bucket*, align 8
  store i8* %0, i8** %2, align 8
  %33 = load volatile i32, i32* @mode_switching, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %1
  br label %1927

; <label>:36:                                     ; preds = %1
  %37 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %38 = icmp ne %struct.FuncEntry* %37, null
  br i1 %38, label %39, label %530

; <label>:39:                                     ; preds = %36
  %40 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i32 0, i32 0
  %41 = load i8*, i8** %2, align 8
  %42 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %40, i64 20, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0), i8* %41) #6
  br label %43

; <label>:43:                                     ; preds = %39
  store %struct.FuncEntry* null, %struct.FuncEntry** %3, align 8
  %44 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %45 = icmp ne %struct.FuncEntry* %44, null
  br i1 %45, label %46, label %528

; <label>:46:                                     ; preds = %43
  br label %47

; <label>:47:                                     ; preds = %46
  br label %48

; <label>:48:                                     ; preds = %47
  %49 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i32 0, i32 0
  store i8* %49, i8** %9, align 8
  store i32 -17973521, i32* %5, align 4
  store i32 -1640531527, i32* %7, align 4
  store i32 -1640531527, i32* %6, align 4
  %50 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i32 0, i32 0
  %51 = call i64 @strlen(i8* %50) #7
  %52 = trunc i64 %51 to i32
  store i32 %52, i32* %8, align 4
  br label %53

; <label>:53:                                     ; preds = %220, %48
  %54 = load i32, i32* %8, align 4
  %55 = icmp uge i32 %54, 12
  br i1 %55, label %56, label %225

; <label>:56:                                     ; preds = %53
  %57 = load i8*, i8** %9, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 0
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = load i8*, i8** %9, align 8
  %62 = getelementptr inbounds i8, i8* %61, i64 1
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = shl i32 %64, 8
  %66 = add i32 %60, %65
  %67 = load i8*, i8** %9, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 2
  %69 = load i8, i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = shl i32 %70, 16
  %72 = add i32 %66, %71
  %73 = load i8*, i8** %9, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 3
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = shl i32 %76, 24
  %78 = add i32 %72, %77
  %79 = load i32, i32* %6, align 4
  %80 = add i32 %79, %78
  store i32 %80, i32* %6, align 4
  %81 = load i8*, i8** %9, align 8
  %82 = getelementptr inbounds i8, i8* %81, i64 4
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = load i8*, i8** %9, align 8
  %86 = getelementptr inbounds i8, i8* %85, i64 5
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = shl i32 %88, 8
  %90 = add i32 %84, %89
  %91 = load i8*, i8** %9, align 8
  %92 = getelementptr inbounds i8, i8* %91, i64 6
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = shl i32 %94, 16
  %96 = add i32 %90, %95
  %97 = load i8*, i8** %9, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 7
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = shl i32 %100, 24
  %102 = add i32 %96, %101
  %103 = load i32, i32* %7, align 4
  %104 = add i32 %103, %102
  store i32 %104, i32* %7, align 4
  %105 = load i8*, i8** %9, align 8
  %106 = getelementptr inbounds i8, i8* %105, i64 8
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = load i8*, i8** %9, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 9
  %111 = load i8, i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = shl i32 %112, 8
  %114 = add i32 %108, %113
  %115 = load i8*, i8** %9, align 8
  %116 = getelementptr inbounds i8, i8* %115, i64 10
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i32
  %119 = shl i32 %118, 16
  %120 = add i32 %114, %119
  %121 = load i8*, i8** %9, align 8
  %122 = getelementptr inbounds i8, i8* %121, i64 11
  %123 = load i8, i8* %122, align 1
  %124 = zext i8 %123 to i32
  %125 = shl i32 %124, 24
  %126 = add i32 %120, %125
  %127 = load i32, i32* %5, align 4
  %128 = add i32 %127, %126
  store i32 %128, i32* %5, align 4
  br label %129

; <label>:129:                                    ; preds = %56
  %130 = load i32, i32* %7, align 4
  %131 = load i32, i32* %6, align 4
  %132 = sub i32 %131, %130
  store i32 %132, i32* %6, align 4
  %133 = load i32, i32* %5, align 4
  %134 = load i32, i32* %6, align 4
  %135 = sub i32 %134, %133
  store i32 %135, i32* %6, align 4
  %136 = load i32, i32* %5, align 4
  %137 = lshr i32 %136, 13
  %138 = load i32, i32* %6, align 4
  %139 = xor i32 %138, %137
  store i32 %139, i32* %6, align 4
  %140 = load i32, i32* %5, align 4
  %141 = load i32, i32* %7, align 4
  %142 = sub i32 %141, %140
  store i32 %142, i32* %7, align 4
  %143 = load i32, i32* %6, align 4
  %144 = load i32, i32* %7, align 4
  %145 = sub i32 %144, %143
  store i32 %145, i32* %7, align 4
  %146 = load i32, i32* %6, align 4
  %147 = shl i32 %146, 8
  %148 = load i32, i32* %7, align 4
  %149 = xor i32 %148, %147
  store i32 %149, i32* %7, align 4
  %150 = load i32, i32* %6, align 4
  %151 = load i32, i32* %5, align 4
  %152 = sub i32 %151, %150
  store i32 %152, i32* %5, align 4
  %153 = load i32, i32* %7, align 4
  %154 = load i32, i32* %5, align 4
  %155 = sub i32 %154, %153
  store i32 %155, i32* %5, align 4
  %156 = load i32, i32* %7, align 4
  %157 = lshr i32 %156, 13
  %158 = load i32, i32* %5, align 4
  %159 = xor i32 %158, %157
  store i32 %159, i32* %5, align 4
  %160 = load i32, i32* %7, align 4
  %161 = load i32, i32* %6, align 4
  %162 = sub i32 %161, %160
  store i32 %162, i32* %6, align 4
  %163 = load i32, i32* %5, align 4
  %164 = load i32, i32* %6, align 4
  %165 = sub i32 %164, %163
  store i32 %165, i32* %6, align 4
  %166 = load i32, i32* %5, align 4
  %167 = lshr i32 %166, 12
  %168 = load i32, i32* %6, align 4
  %169 = xor i32 %168, %167
  store i32 %169, i32* %6, align 4
  %170 = load i32, i32* %5, align 4
  %171 = load i32, i32* %7, align 4
  %172 = sub i32 %171, %170
  store i32 %172, i32* %7, align 4
  %173 = load i32, i32* %6, align 4
  %174 = load i32, i32* %7, align 4
  %175 = sub i32 %174, %173
  store i32 %175, i32* %7, align 4
  %176 = load i32, i32* %6, align 4
  %177 = shl i32 %176, 16
  %178 = load i32, i32* %7, align 4
  %179 = xor i32 %178, %177
  store i32 %179, i32* %7, align 4
  %180 = load i32, i32* %6, align 4
  %181 = load i32, i32* %5, align 4
  %182 = sub i32 %181, %180
  store i32 %182, i32* %5, align 4
  %183 = load i32, i32* %7, align 4
  %184 = load i32, i32* %5, align 4
  %185 = sub i32 %184, %183
  store i32 %185, i32* %5, align 4
  %186 = load i32, i32* %7, align 4
  %187 = lshr i32 %186, 5
  %188 = load i32, i32* %5, align 4
  %189 = xor i32 %188, %187
  store i32 %189, i32* %5, align 4
  %190 = load i32, i32* %7, align 4
  %191 = load i32, i32* %6, align 4
  %192 = sub i32 %191, %190
  store i32 %192, i32* %6, align 4
  %193 = load i32, i32* %5, align 4
  %194 = load i32, i32* %6, align 4
  %195 = sub i32 %194, %193
  store i32 %195, i32* %6, align 4
  %196 = load i32, i32* %5, align 4
  %197 = lshr i32 %196, 3
  %198 = load i32, i32* %6, align 4
  %199 = xor i32 %198, %197
  store i32 %199, i32* %6, align 4
  %200 = load i32, i32* %5, align 4
  %201 = load i32, i32* %7, align 4
  %202 = sub i32 %201, %200
  store i32 %202, i32* %7, align 4
  %203 = load i32, i32* %6, align 4
  %204 = load i32, i32* %7, align 4
  %205 = sub i32 %204, %203
  store i32 %205, i32* %7, align 4
  %206 = load i32, i32* %6, align 4
  %207 = shl i32 %206, 10
  %208 = load i32, i32* %7, align 4
  %209 = xor i32 %208, %207
  store i32 %209, i32* %7, align 4
  %210 = load i32, i32* %6, align 4
  %211 = load i32, i32* %5, align 4
  %212 = sub i32 %211, %210
  store i32 %212, i32* %5, align 4
  %213 = load i32, i32* %7, align 4
  %214 = load i32, i32* %5, align 4
  %215 = sub i32 %214, %213
  store i32 %215, i32* %5, align 4
  %216 = load i32, i32* %7, align 4
  %217 = lshr i32 %216, 15
  %218 = load i32, i32* %5, align 4
  %219 = xor i32 %218, %217
  store i32 %219, i32* %5, align 4
  br label %220

; <label>:220:                                    ; preds = %129
  %221 = load i8*, i8** %9, align 8
  %222 = getelementptr inbounds i8, i8* %221, i64 12
  store i8* %222, i8** %9, align 8
  %223 = load i32, i32* %8, align 4
  %224 = sub i32 %223, 12
  store i32 %224, i32* %8, align 4
  br label %53

; <label>:225:                                    ; preds = %53
  %226 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i32 0, i32 0
  %227 = call i64 @strlen(i8* %226) #7
  %228 = trunc i64 %227 to i32
  %229 = load i32, i32* %5, align 4
  %230 = add i32 %229, %228
  store i32 %230, i32* %5, align 4
  %231 = load i32, i32* %8, align 4
  switch i32 %231, label %318 [
    i32 11, label %232
    i32 10, label %240
    i32 9, label %248
    i32 8, label %256
    i32 7, label %264
    i32 6, label %272
    i32 5, label %280
    i32 4, label %287
    i32 3, label %295
    i32 2, label %303
    i32 1, label %311
  ]

; <label>:232:                                    ; preds = %225
  %233 = load i8*, i8** %9, align 8
  %234 = getelementptr inbounds i8, i8* %233, i64 10
  %235 = load i8, i8* %234, align 1
  %236 = zext i8 %235 to i32
  %237 = shl i32 %236, 24
  %238 = load i32, i32* %5, align 4
  %239 = add i32 %238, %237
  store i32 %239, i32* %5, align 4
  br label %240

; <label>:240:                                    ; preds = %225, %232
  %241 = load i8*, i8** %9, align 8
  %242 = getelementptr inbounds i8, i8* %241, i64 9
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = shl i32 %244, 16
  %246 = load i32, i32* %5, align 4
  %247 = add i32 %246, %245
  store i32 %247, i32* %5, align 4
  br label %248

; <label>:248:                                    ; preds = %225, %240
  %249 = load i8*, i8** %9, align 8
  %250 = getelementptr inbounds i8, i8* %249, i64 8
  %251 = load i8, i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = shl i32 %252, 8
  %254 = load i32, i32* %5, align 4
  %255 = add i32 %254, %253
  store i32 %255, i32* %5, align 4
  br label %256

; <label>:256:                                    ; preds = %225, %248
  %257 = load i8*, i8** %9, align 8
  %258 = getelementptr inbounds i8, i8* %257, i64 7
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = shl i32 %260, 24
  %262 = load i32, i32* %7, align 4
  %263 = add i32 %262, %261
  store i32 %263, i32* %7, align 4
  br label %264

; <label>:264:                                    ; preds = %225, %256
  %265 = load i8*, i8** %9, align 8
  %266 = getelementptr inbounds i8, i8* %265, i64 6
  %267 = load i8, i8* %266, align 1
  %268 = zext i8 %267 to i32
  %269 = shl i32 %268, 16
  %270 = load i32, i32* %7, align 4
  %271 = add i32 %270, %269
  store i32 %271, i32* %7, align 4
  br label %272

; <label>:272:                                    ; preds = %225, %264
  %273 = load i8*, i8** %9, align 8
  %274 = getelementptr inbounds i8, i8* %273, i64 5
  %275 = load i8, i8* %274, align 1
  %276 = zext i8 %275 to i32
  %277 = shl i32 %276, 8
  %278 = load i32, i32* %7, align 4
  %279 = add i32 %278, %277
  store i32 %279, i32* %7, align 4
  br label %280

; <label>:280:                                    ; preds = %225, %272
  %281 = load i8*, i8** %9, align 8
  %282 = getelementptr inbounds i8, i8* %281, i64 4
  %283 = load i8, i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = load i32, i32* %7, align 4
  %286 = add i32 %285, %284
  store i32 %286, i32* %7, align 4
  br label %287

; <label>:287:                                    ; preds = %225, %280
  %288 = load i8*, i8** %9, align 8
  %289 = getelementptr inbounds i8, i8* %288, i64 3
  %290 = load i8, i8* %289, align 1
  %291 = zext i8 %290 to i32
  %292 = shl i32 %291, 24
  %293 = load i32, i32* %6, align 4
  %294 = add i32 %293, %292
  store i32 %294, i32* %6, align 4
  br label %295

; <label>:295:                                    ; preds = %225, %287
  %296 = load i8*, i8** %9, align 8
  %297 = getelementptr inbounds i8, i8* %296, i64 2
  %298 = load i8, i8* %297, align 1
  %299 = zext i8 %298 to i32
  %300 = shl i32 %299, 16
  %301 = load i32, i32* %6, align 4
  %302 = add i32 %301, %300
  store i32 %302, i32* %6, align 4
  br label %303

; <label>:303:                                    ; preds = %225, %295
  %304 = load i8*, i8** %9, align 8
  %305 = getelementptr inbounds i8, i8* %304, i64 1
  %306 = load i8, i8* %305, align 1
  %307 = zext i8 %306 to i32
  %308 = shl i32 %307, 8
  %309 = load i32, i32* %6, align 4
  %310 = add i32 %309, %308
  store i32 %310, i32* %6, align 4
  br label %311

; <label>:311:                                    ; preds = %225, %303
  %312 = load i8*, i8** %9, align 8
  %313 = getelementptr inbounds i8, i8* %312, i64 0
  %314 = load i8, i8* %313, align 1
  %315 = zext i8 %314 to i32
  %316 = load i32, i32* %6, align 4
  %317 = add i32 %316, %315
  store i32 %317, i32* %6, align 4
  br label %318

; <label>:318:                                    ; preds = %225, %311
  br label %319

; <label>:319:                                    ; preds = %318
  br label %320

; <label>:320:                                    ; preds = %319
  %321 = load i32, i32* %7, align 4
  %322 = load i32, i32* %6, align 4
  %323 = sub i32 %322, %321
  store i32 %323, i32* %6, align 4
  %324 = load i32, i32* %5, align 4
  %325 = load i32, i32* %6, align 4
  %326 = sub i32 %325, %324
  store i32 %326, i32* %6, align 4
  %327 = load i32, i32* %5, align 4
  %328 = lshr i32 %327, 13
  %329 = load i32, i32* %6, align 4
  %330 = xor i32 %329, %328
  store i32 %330, i32* %6, align 4
  %331 = load i32, i32* %5, align 4
  %332 = load i32, i32* %7, align 4
  %333 = sub i32 %332, %331
  store i32 %333, i32* %7, align 4
  %334 = load i32, i32* %6, align 4
  %335 = load i32, i32* %7, align 4
  %336 = sub i32 %335, %334
  store i32 %336, i32* %7, align 4
  %337 = load i32, i32* %6, align 4
  %338 = shl i32 %337, 8
  %339 = load i32, i32* %7, align 4
  %340 = xor i32 %339, %338
  store i32 %340, i32* %7, align 4
  %341 = load i32, i32* %6, align 4
  %342 = load i32, i32* %5, align 4
  %343 = sub i32 %342, %341
  store i32 %343, i32* %5, align 4
  %344 = load i32, i32* %7, align 4
  %345 = load i32, i32* %5, align 4
  %346 = sub i32 %345, %344
  store i32 %346, i32* %5, align 4
  %347 = load i32, i32* %7, align 4
  %348 = lshr i32 %347, 13
  %349 = load i32, i32* %5, align 4
  %350 = xor i32 %349, %348
  store i32 %350, i32* %5, align 4
  %351 = load i32, i32* %7, align 4
  %352 = load i32, i32* %6, align 4
  %353 = sub i32 %352, %351
  store i32 %353, i32* %6, align 4
  %354 = load i32, i32* %5, align 4
  %355 = load i32, i32* %6, align 4
  %356 = sub i32 %355, %354
  store i32 %356, i32* %6, align 4
  %357 = load i32, i32* %5, align 4
  %358 = lshr i32 %357, 12
  %359 = load i32, i32* %6, align 4
  %360 = xor i32 %359, %358
  store i32 %360, i32* %6, align 4
  %361 = load i32, i32* %5, align 4
  %362 = load i32, i32* %7, align 4
  %363 = sub i32 %362, %361
  store i32 %363, i32* %7, align 4
  %364 = load i32, i32* %6, align 4
  %365 = load i32, i32* %7, align 4
  %366 = sub i32 %365, %364
  store i32 %366, i32* %7, align 4
  %367 = load i32, i32* %6, align 4
  %368 = shl i32 %367, 16
  %369 = load i32, i32* %7, align 4
  %370 = xor i32 %369, %368
  store i32 %370, i32* %7, align 4
  %371 = load i32, i32* %6, align 4
  %372 = load i32, i32* %5, align 4
  %373 = sub i32 %372, %371
  store i32 %373, i32* %5, align 4
  %374 = load i32, i32* %7, align 4
  %375 = load i32, i32* %5, align 4
  %376 = sub i32 %375, %374
  store i32 %376, i32* %5, align 4
  %377 = load i32, i32* %7, align 4
  %378 = lshr i32 %377, 5
  %379 = load i32, i32* %5, align 4
  %380 = xor i32 %379, %378
  store i32 %380, i32* %5, align 4
  %381 = load i32, i32* %7, align 4
  %382 = load i32, i32* %6, align 4
  %383 = sub i32 %382, %381
  store i32 %383, i32* %6, align 4
  %384 = load i32, i32* %5, align 4
  %385 = load i32, i32* %6, align 4
  %386 = sub i32 %385, %384
  store i32 %386, i32* %6, align 4
  %387 = load i32, i32* %5, align 4
  %388 = lshr i32 %387, 3
  %389 = load i32, i32* %6, align 4
  %390 = xor i32 %389, %388
  store i32 %390, i32* %6, align 4
  %391 = load i32, i32* %5, align 4
  %392 = load i32, i32* %7, align 4
  %393 = sub i32 %392, %391
  store i32 %393, i32* %7, align 4
  %394 = load i32, i32* %6, align 4
  %395 = load i32, i32* %7, align 4
  %396 = sub i32 %395, %394
  store i32 %396, i32* %7, align 4
  %397 = load i32, i32* %6, align 4
  %398 = shl i32 %397, 10
  %399 = load i32, i32* %7, align 4
  %400 = xor i32 %399, %398
  store i32 %400, i32* %7, align 4
  %401 = load i32, i32* %6, align 4
  %402 = load i32, i32* %5, align 4
  %403 = sub i32 %402, %401
  store i32 %403, i32* %5, align 4
  %404 = load i32, i32* %7, align 4
  %405 = load i32, i32* %5, align 4
  %406 = sub i32 %405, %404
  store i32 %406, i32* %5, align 4
  %407 = load i32, i32* %7, align 4
  %408 = lshr i32 %407, 15
  %409 = load i32, i32* %5, align 4
  %410 = xor i32 %409, %408
  store i32 %410, i32* %5, align 4
  br label %411

; <label>:411:                                    ; preds = %320
  br label %412

; <label>:412:                                    ; preds = %411
  br label %413

; <label>:413:                                    ; preds = %412
  br label %414

; <label>:414:                                    ; preds = %413
  store %struct.FuncEntry* null, %struct.FuncEntry** %3, align 8
  %415 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %416 = icmp ne %struct.FuncEntry* %415, null
  br i1 %416, label %417, label %526

; <label>:417:                                    ; preds = %414
  br label %418

; <label>:418:                                    ; preds = %417
  %419 = load i32, i32* %5, align 4
  %420 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %421 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %420, i32 0, i32 3
  %422 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %421, i32 0, i32 0
  %423 = load %struct.UT_hash_table*, %struct.UT_hash_table** %422, align 8
  %424 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %423, i32 0, i32 1
  %425 = load i32, i32* %424, align 8
  %426 = sub i32 %425, 1
  %427 = and i32 %419, %426
  store i32 %427, i32* %10, align 4
  br label %428

; <label>:428:                                    ; preds = %418
  br label %429

; <label>:429:                                    ; preds = %428
  %430 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %431 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %430, i32 0, i32 3
  %432 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %431, i32 0, i32 0
  %433 = load %struct.UT_hash_table*, %struct.UT_hash_table** %432, align 8
  %434 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %433, i32 0, i32 0
  %435 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %434, align 8
  %436 = load i32, i32* %10, align 4
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %435, i64 %437
  %439 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %438, i32 0, i32 0
  %440 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %439, align 8
  %441 = icmp ne %struct.UT_hash_handle* %440, null
  br i1 %441, label %442, label %466

; <label>:442:                                    ; preds = %429
  br label %443

; <label>:443:                                    ; preds = %442
  %444 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %445 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %444, i32 0, i32 3
  %446 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %445, i32 0, i32 0
  %447 = load %struct.UT_hash_table*, %struct.UT_hash_table** %446, align 8
  %448 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %447, i32 0, i32 0
  %449 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %448, align 8
  %450 = load i32, i32* %10, align 4
  %451 = zext i32 %450 to i64
  %452 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %449, i64 %451
  %453 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %452, i32 0, i32 0
  %454 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %453, align 8
  %455 = bitcast %struct.UT_hash_handle* %454 to i8*
  %456 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %457 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %456, i32 0, i32 3
  %458 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %457, i32 0, i32 0
  %459 = load %struct.UT_hash_table*, %struct.UT_hash_table** %458, align 8
  %460 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %459, i32 0, i32 5
  %461 = load i64, i64* %460, align 8
  %462 = sub i64 0, %461
  %463 = getelementptr inbounds i8, i8* %455, i64 %462
  %464 = bitcast i8* %463 to %struct.FuncEntry*
  store %struct.FuncEntry* %464, %struct.FuncEntry** %3, align 8
  br label %465

; <label>:465:                                    ; preds = %443
  br label %467

; <label>:466:                                    ; preds = %429
  store %struct.FuncEntry* null, %struct.FuncEntry** %3, align 8
  br label %467

; <label>:467:                                    ; preds = %466, %465
  br label %468

; <label>:468:                                    ; preds = %523, %467
  %469 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %470 = icmp ne %struct.FuncEntry* %469, null
  br i1 %470, label %471, label %524

; <label>:471:                                    ; preds = %468
  %472 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %473 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %472, i32 0, i32 3
  %474 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %473, i32 0, i32 7
  %475 = load i32, i32* %474, align 4
  %476 = load i32, i32* %5, align 4
  %477 = icmp eq i32 %475, %476
  br i1 %477, label %478, label %499

; <label>:478:                                    ; preds = %471
  %479 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %480 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %479, i32 0, i32 3
  %481 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %480, i32 0, i32 6
  %482 = load i32, i32* %481, align 8
  %483 = zext i32 %482 to i64
  %484 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i32 0, i32 0
  %485 = call i64 @strlen(i8* %484) #7
  %486 = icmp eq i64 %483, %485
  br i1 %486, label %487, label %499

; <label>:487:                                    ; preds = %478
  %488 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %489 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %488, i32 0, i32 3
  %490 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %489, i32 0, i32 5
  %491 = load i8*, i8** %490, align 8
  %492 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i32 0, i32 0
  %493 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i32 0, i32 0
  %494 = call i64 @strlen(i8* %493) #7
  %495 = call i32 @memcmp(i8* %491, i8* %492, i64 %494) #7
  %496 = icmp eq i32 %495, 0
  br i1 %496, label %497, label %498

; <label>:497:                                    ; preds = %487
  br label %524

; <label>:498:                                    ; preds = %487
  br label %499

; <label>:499:                                    ; preds = %498, %478, %471
  %500 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %501 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %500, i32 0, i32 3
  %502 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %501, i32 0, i32 4
  %503 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %502, align 8
  %504 = icmp ne %struct.UT_hash_handle* %503, null
  br i1 %504, label %505, label %522

; <label>:505:                                    ; preds = %499
  br label %506

; <label>:506:                                    ; preds = %505
  %507 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %508 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %507, i32 0, i32 3
  %509 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %508, i32 0, i32 4
  %510 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %509, align 8
  %511 = bitcast %struct.UT_hash_handle* %510 to i8*
  %512 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %513 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %512, i32 0, i32 3
  %514 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %513, i32 0, i32 0
  %515 = load %struct.UT_hash_table*, %struct.UT_hash_table** %514, align 8
  %516 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %515, i32 0, i32 5
  %517 = load i64, i64* %516, align 8
  %518 = sub i64 0, %517
  %519 = getelementptr inbounds i8, i8* %511, i64 %518
  %520 = bitcast i8* %519 to %struct.FuncEntry*
  store %struct.FuncEntry* %520, %struct.FuncEntry** %3, align 8
  br label %521

; <label>:521:                                    ; preds = %506
  br label %523

; <label>:522:                                    ; preds = %499
  store %struct.FuncEntry* null, %struct.FuncEntry** %3, align 8
  br label %523

; <label>:523:                                    ; preds = %522, %521
  br label %468

; <label>:524:                                    ; preds = %497, %468
  br label %525

; <label>:525:                                    ; preds = %524
  br label %526

; <label>:526:                                    ; preds = %525, %414
  br label %527

; <label>:527:                                    ; preds = %526
  br label %528

; <label>:528:                                    ; preds = %527, %43
  br label %529

; <label>:529:                                    ; preds = %528
  br label %531

; <label>:530:                                    ; preds = %36
  br label %1927

; <label>:531:                                    ; preds = %529
  %532 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %533 = icmp eq %struct.FuncEntry* %532, null
  br i1 %533, label %534, label %1926

; <label>:534:                                    ; preds = %531
  %535 = load i32, i32* @mode_enum, align 4
  %536 = call i8* @mode_to_string(i32 %535)
  %537 = icmp ne i8* %536, getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0)
  br i1 %537, label %538, label %1926

; <label>:538:                                    ; preds = %534
  %539 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %540 = load i8*, i8** %2, align 8
  %541 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %539, i64 20, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0), i8* %540) #6
  br label %542

; <label>:542:                                    ; preds = %538
  store %struct.LoggedAddrEntry* null, %struct.LoggedAddrEntry** %11, align 8
  %543 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %544 = icmp ne %struct.LoggedAddrEntry* %543, null
  br i1 %544, label %545, label %1027

; <label>:545:                                    ; preds = %542
  br label %546

; <label>:546:                                    ; preds = %545
  br label %547

; <label>:547:                                    ; preds = %546
  %548 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  store i8* %548, i8** %17, align 8
  store i32 -17973521, i32* %13, align 4
  store i32 -1640531527, i32* %15, align 4
  store i32 -1640531527, i32* %14, align 4
  %549 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %550 = call i64 @strlen(i8* %549) #7
  %551 = trunc i64 %550 to i32
  store i32 %551, i32* %16, align 4
  br label %552

; <label>:552:                                    ; preds = %719, %547
  %553 = load i32, i32* %16, align 4
  %554 = icmp uge i32 %553, 12
  br i1 %554, label %555, label %724

; <label>:555:                                    ; preds = %552
  %556 = load i8*, i8** %17, align 8
  %557 = getelementptr inbounds i8, i8* %556, i64 0
  %558 = load i8, i8* %557, align 1
  %559 = zext i8 %558 to i32
  %560 = load i8*, i8** %17, align 8
  %561 = getelementptr inbounds i8, i8* %560, i64 1
  %562 = load i8, i8* %561, align 1
  %563 = zext i8 %562 to i32
  %564 = shl i32 %563, 8
  %565 = add i32 %559, %564
  %566 = load i8*, i8** %17, align 8
  %567 = getelementptr inbounds i8, i8* %566, i64 2
  %568 = load i8, i8* %567, align 1
  %569 = zext i8 %568 to i32
  %570 = shl i32 %569, 16
  %571 = add i32 %565, %570
  %572 = load i8*, i8** %17, align 8
  %573 = getelementptr inbounds i8, i8* %572, i64 3
  %574 = load i8, i8* %573, align 1
  %575 = zext i8 %574 to i32
  %576 = shl i32 %575, 24
  %577 = add i32 %571, %576
  %578 = load i32, i32* %14, align 4
  %579 = add i32 %578, %577
  store i32 %579, i32* %14, align 4
  %580 = load i8*, i8** %17, align 8
  %581 = getelementptr inbounds i8, i8* %580, i64 4
  %582 = load i8, i8* %581, align 1
  %583 = zext i8 %582 to i32
  %584 = load i8*, i8** %17, align 8
  %585 = getelementptr inbounds i8, i8* %584, i64 5
  %586 = load i8, i8* %585, align 1
  %587 = zext i8 %586 to i32
  %588 = shl i32 %587, 8
  %589 = add i32 %583, %588
  %590 = load i8*, i8** %17, align 8
  %591 = getelementptr inbounds i8, i8* %590, i64 6
  %592 = load i8, i8* %591, align 1
  %593 = zext i8 %592 to i32
  %594 = shl i32 %593, 16
  %595 = add i32 %589, %594
  %596 = load i8*, i8** %17, align 8
  %597 = getelementptr inbounds i8, i8* %596, i64 7
  %598 = load i8, i8* %597, align 1
  %599 = zext i8 %598 to i32
  %600 = shl i32 %599, 24
  %601 = add i32 %595, %600
  %602 = load i32, i32* %15, align 4
  %603 = add i32 %602, %601
  store i32 %603, i32* %15, align 4
  %604 = load i8*, i8** %17, align 8
  %605 = getelementptr inbounds i8, i8* %604, i64 8
  %606 = load i8, i8* %605, align 1
  %607 = zext i8 %606 to i32
  %608 = load i8*, i8** %17, align 8
  %609 = getelementptr inbounds i8, i8* %608, i64 9
  %610 = load i8, i8* %609, align 1
  %611 = zext i8 %610 to i32
  %612 = shl i32 %611, 8
  %613 = add i32 %607, %612
  %614 = load i8*, i8** %17, align 8
  %615 = getelementptr inbounds i8, i8* %614, i64 10
  %616 = load i8, i8* %615, align 1
  %617 = zext i8 %616 to i32
  %618 = shl i32 %617, 16
  %619 = add i32 %613, %618
  %620 = load i8*, i8** %17, align 8
  %621 = getelementptr inbounds i8, i8* %620, i64 11
  %622 = load i8, i8* %621, align 1
  %623 = zext i8 %622 to i32
  %624 = shl i32 %623, 24
  %625 = add i32 %619, %624
  %626 = load i32, i32* %13, align 4
  %627 = add i32 %626, %625
  store i32 %627, i32* %13, align 4
  br label %628

; <label>:628:                                    ; preds = %555
  %629 = load i32, i32* %15, align 4
  %630 = load i32, i32* %14, align 4
  %631 = sub i32 %630, %629
  store i32 %631, i32* %14, align 4
  %632 = load i32, i32* %13, align 4
  %633 = load i32, i32* %14, align 4
  %634 = sub i32 %633, %632
  store i32 %634, i32* %14, align 4
  %635 = load i32, i32* %13, align 4
  %636 = lshr i32 %635, 13
  %637 = load i32, i32* %14, align 4
  %638 = xor i32 %637, %636
  store i32 %638, i32* %14, align 4
  %639 = load i32, i32* %13, align 4
  %640 = load i32, i32* %15, align 4
  %641 = sub i32 %640, %639
  store i32 %641, i32* %15, align 4
  %642 = load i32, i32* %14, align 4
  %643 = load i32, i32* %15, align 4
  %644 = sub i32 %643, %642
  store i32 %644, i32* %15, align 4
  %645 = load i32, i32* %14, align 4
  %646 = shl i32 %645, 8
  %647 = load i32, i32* %15, align 4
  %648 = xor i32 %647, %646
  store i32 %648, i32* %15, align 4
  %649 = load i32, i32* %14, align 4
  %650 = load i32, i32* %13, align 4
  %651 = sub i32 %650, %649
  store i32 %651, i32* %13, align 4
  %652 = load i32, i32* %15, align 4
  %653 = load i32, i32* %13, align 4
  %654 = sub i32 %653, %652
  store i32 %654, i32* %13, align 4
  %655 = load i32, i32* %15, align 4
  %656 = lshr i32 %655, 13
  %657 = load i32, i32* %13, align 4
  %658 = xor i32 %657, %656
  store i32 %658, i32* %13, align 4
  %659 = load i32, i32* %15, align 4
  %660 = load i32, i32* %14, align 4
  %661 = sub i32 %660, %659
  store i32 %661, i32* %14, align 4
  %662 = load i32, i32* %13, align 4
  %663 = load i32, i32* %14, align 4
  %664 = sub i32 %663, %662
  store i32 %664, i32* %14, align 4
  %665 = load i32, i32* %13, align 4
  %666 = lshr i32 %665, 12
  %667 = load i32, i32* %14, align 4
  %668 = xor i32 %667, %666
  store i32 %668, i32* %14, align 4
  %669 = load i32, i32* %13, align 4
  %670 = load i32, i32* %15, align 4
  %671 = sub i32 %670, %669
  store i32 %671, i32* %15, align 4
  %672 = load i32, i32* %14, align 4
  %673 = load i32, i32* %15, align 4
  %674 = sub i32 %673, %672
  store i32 %674, i32* %15, align 4
  %675 = load i32, i32* %14, align 4
  %676 = shl i32 %675, 16
  %677 = load i32, i32* %15, align 4
  %678 = xor i32 %677, %676
  store i32 %678, i32* %15, align 4
  %679 = load i32, i32* %14, align 4
  %680 = load i32, i32* %13, align 4
  %681 = sub i32 %680, %679
  store i32 %681, i32* %13, align 4
  %682 = load i32, i32* %15, align 4
  %683 = load i32, i32* %13, align 4
  %684 = sub i32 %683, %682
  store i32 %684, i32* %13, align 4
  %685 = load i32, i32* %15, align 4
  %686 = lshr i32 %685, 5
  %687 = load i32, i32* %13, align 4
  %688 = xor i32 %687, %686
  store i32 %688, i32* %13, align 4
  %689 = load i32, i32* %15, align 4
  %690 = load i32, i32* %14, align 4
  %691 = sub i32 %690, %689
  store i32 %691, i32* %14, align 4
  %692 = load i32, i32* %13, align 4
  %693 = load i32, i32* %14, align 4
  %694 = sub i32 %693, %692
  store i32 %694, i32* %14, align 4
  %695 = load i32, i32* %13, align 4
  %696 = lshr i32 %695, 3
  %697 = load i32, i32* %14, align 4
  %698 = xor i32 %697, %696
  store i32 %698, i32* %14, align 4
  %699 = load i32, i32* %13, align 4
  %700 = load i32, i32* %15, align 4
  %701 = sub i32 %700, %699
  store i32 %701, i32* %15, align 4
  %702 = load i32, i32* %14, align 4
  %703 = load i32, i32* %15, align 4
  %704 = sub i32 %703, %702
  store i32 %704, i32* %15, align 4
  %705 = load i32, i32* %14, align 4
  %706 = shl i32 %705, 10
  %707 = load i32, i32* %15, align 4
  %708 = xor i32 %707, %706
  store i32 %708, i32* %15, align 4
  %709 = load i32, i32* %14, align 4
  %710 = load i32, i32* %13, align 4
  %711 = sub i32 %710, %709
  store i32 %711, i32* %13, align 4
  %712 = load i32, i32* %15, align 4
  %713 = load i32, i32* %13, align 4
  %714 = sub i32 %713, %712
  store i32 %714, i32* %13, align 4
  %715 = load i32, i32* %15, align 4
  %716 = lshr i32 %715, 15
  %717 = load i32, i32* %13, align 4
  %718 = xor i32 %717, %716
  store i32 %718, i32* %13, align 4
  br label %719

; <label>:719:                                    ; preds = %628
  %720 = load i8*, i8** %17, align 8
  %721 = getelementptr inbounds i8, i8* %720, i64 12
  store i8* %721, i8** %17, align 8
  %722 = load i32, i32* %16, align 4
  %723 = sub i32 %722, 12
  store i32 %723, i32* %16, align 4
  br label %552

; <label>:724:                                    ; preds = %552
  %725 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %726 = call i64 @strlen(i8* %725) #7
  %727 = trunc i64 %726 to i32
  %728 = load i32, i32* %13, align 4
  %729 = add i32 %728, %727
  store i32 %729, i32* %13, align 4
  %730 = load i32, i32* %16, align 4
  switch i32 %730, label %817 [
    i32 11, label %731
    i32 10, label %739
    i32 9, label %747
    i32 8, label %755
    i32 7, label %763
    i32 6, label %771
    i32 5, label %779
    i32 4, label %786
    i32 3, label %794
    i32 2, label %802
    i32 1, label %810
  ]

; <label>:731:                                    ; preds = %724
  %732 = load i8*, i8** %17, align 8
  %733 = getelementptr inbounds i8, i8* %732, i64 10
  %734 = load i8, i8* %733, align 1
  %735 = zext i8 %734 to i32
  %736 = shl i32 %735, 24
  %737 = load i32, i32* %13, align 4
  %738 = add i32 %737, %736
  store i32 %738, i32* %13, align 4
  br label %739

; <label>:739:                                    ; preds = %724, %731
  %740 = load i8*, i8** %17, align 8
  %741 = getelementptr inbounds i8, i8* %740, i64 9
  %742 = load i8, i8* %741, align 1
  %743 = zext i8 %742 to i32
  %744 = shl i32 %743, 16
  %745 = load i32, i32* %13, align 4
  %746 = add i32 %745, %744
  store i32 %746, i32* %13, align 4
  br label %747

; <label>:747:                                    ; preds = %724, %739
  %748 = load i8*, i8** %17, align 8
  %749 = getelementptr inbounds i8, i8* %748, i64 8
  %750 = load i8, i8* %749, align 1
  %751 = zext i8 %750 to i32
  %752 = shl i32 %751, 8
  %753 = load i32, i32* %13, align 4
  %754 = add i32 %753, %752
  store i32 %754, i32* %13, align 4
  br label %755

; <label>:755:                                    ; preds = %724, %747
  %756 = load i8*, i8** %17, align 8
  %757 = getelementptr inbounds i8, i8* %756, i64 7
  %758 = load i8, i8* %757, align 1
  %759 = zext i8 %758 to i32
  %760 = shl i32 %759, 24
  %761 = load i32, i32* %15, align 4
  %762 = add i32 %761, %760
  store i32 %762, i32* %15, align 4
  br label %763

; <label>:763:                                    ; preds = %724, %755
  %764 = load i8*, i8** %17, align 8
  %765 = getelementptr inbounds i8, i8* %764, i64 6
  %766 = load i8, i8* %765, align 1
  %767 = zext i8 %766 to i32
  %768 = shl i32 %767, 16
  %769 = load i32, i32* %15, align 4
  %770 = add i32 %769, %768
  store i32 %770, i32* %15, align 4
  br label %771

; <label>:771:                                    ; preds = %724, %763
  %772 = load i8*, i8** %17, align 8
  %773 = getelementptr inbounds i8, i8* %772, i64 5
  %774 = load i8, i8* %773, align 1
  %775 = zext i8 %774 to i32
  %776 = shl i32 %775, 8
  %777 = load i32, i32* %15, align 4
  %778 = add i32 %777, %776
  store i32 %778, i32* %15, align 4
  br label %779

; <label>:779:                                    ; preds = %724, %771
  %780 = load i8*, i8** %17, align 8
  %781 = getelementptr inbounds i8, i8* %780, i64 4
  %782 = load i8, i8* %781, align 1
  %783 = zext i8 %782 to i32
  %784 = load i32, i32* %15, align 4
  %785 = add i32 %784, %783
  store i32 %785, i32* %15, align 4
  br label %786

; <label>:786:                                    ; preds = %724, %779
  %787 = load i8*, i8** %17, align 8
  %788 = getelementptr inbounds i8, i8* %787, i64 3
  %789 = load i8, i8* %788, align 1
  %790 = zext i8 %789 to i32
  %791 = shl i32 %790, 24
  %792 = load i32, i32* %14, align 4
  %793 = add i32 %792, %791
  store i32 %793, i32* %14, align 4
  br label %794

; <label>:794:                                    ; preds = %724, %786
  %795 = load i8*, i8** %17, align 8
  %796 = getelementptr inbounds i8, i8* %795, i64 2
  %797 = load i8, i8* %796, align 1
  %798 = zext i8 %797 to i32
  %799 = shl i32 %798, 16
  %800 = load i32, i32* %14, align 4
  %801 = add i32 %800, %799
  store i32 %801, i32* %14, align 4
  br label %802

; <label>:802:                                    ; preds = %724, %794
  %803 = load i8*, i8** %17, align 8
  %804 = getelementptr inbounds i8, i8* %803, i64 1
  %805 = load i8, i8* %804, align 1
  %806 = zext i8 %805 to i32
  %807 = shl i32 %806, 8
  %808 = load i32, i32* %14, align 4
  %809 = add i32 %808, %807
  store i32 %809, i32* %14, align 4
  br label %810

; <label>:810:                                    ; preds = %724, %802
  %811 = load i8*, i8** %17, align 8
  %812 = getelementptr inbounds i8, i8* %811, i64 0
  %813 = load i8, i8* %812, align 1
  %814 = zext i8 %813 to i32
  %815 = load i32, i32* %14, align 4
  %816 = add i32 %815, %814
  store i32 %816, i32* %14, align 4
  br label %817

; <label>:817:                                    ; preds = %724, %810
  br label %818

; <label>:818:                                    ; preds = %817
  br label %819

; <label>:819:                                    ; preds = %818
  %820 = load i32, i32* %15, align 4
  %821 = load i32, i32* %14, align 4
  %822 = sub i32 %821, %820
  store i32 %822, i32* %14, align 4
  %823 = load i32, i32* %13, align 4
  %824 = load i32, i32* %14, align 4
  %825 = sub i32 %824, %823
  store i32 %825, i32* %14, align 4
  %826 = load i32, i32* %13, align 4
  %827 = lshr i32 %826, 13
  %828 = load i32, i32* %14, align 4
  %829 = xor i32 %828, %827
  store i32 %829, i32* %14, align 4
  %830 = load i32, i32* %13, align 4
  %831 = load i32, i32* %15, align 4
  %832 = sub i32 %831, %830
  store i32 %832, i32* %15, align 4
  %833 = load i32, i32* %14, align 4
  %834 = load i32, i32* %15, align 4
  %835 = sub i32 %834, %833
  store i32 %835, i32* %15, align 4
  %836 = load i32, i32* %14, align 4
  %837 = shl i32 %836, 8
  %838 = load i32, i32* %15, align 4
  %839 = xor i32 %838, %837
  store i32 %839, i32* %15, align 4
  %840 = load i32, i32* %14, align 4
  %841 = load i32, i32* %13, align 4
  %842 = sub i32 %841, %840
  store i32 %842, i32* %13, align 4
  %843 = load i32, i32* %15, align 4
  %844 = load i32, i32* %13, align 4
  %845 = sub i32 %844, %843
  store i32 %845, i32* %13, align 4
  %846 = load i32, i32* %15, align 4
  %847 = lshr i32 %846, 13
  %848 = load i32, i32* %13, align 4
  %849 = xor i32 %848, %847
  store i32 %849, i32* %13, align 4
  %850 = load i32, i32* %15, align 4
  %851 = load i32, i32* %14, align 4
  %852 = sub i32 %851, %850
  store i32 %852, i32* %14, align 4
  %853 = load i32, i32* %13, align 4
  %854 = load i32, i32* %14, align 4
  %855 = sub i32 %854, %853
  store i32 %855, i32* %14, align 4
  %856 = load i32, i32* %13, align 4
  %857 = lshr i32 %856, 12
  %858 = load i32, i32* %14, align 4
  %859 = xor i32 %858, %857
  store i32 %859, i32* %14, align 4
  %860 = load i32, i32* %13, align 4
  %861 = load i32, i32* %15, align 4
  %862 = sub i32 %861, %860
  store i32 %862, i32* %15, align 4
  %863 = load i32, i32* %14, align 4
  %864 = load i32, i32* %15, align 4
  %865 = sub i32 %864, %863
  store i32 %865, i32* %15, align 4
  %866 = load i32, i32* %14, align 4
  %867 = shl i32 %866, 16
  %868 = load i32, i32* %15, align 4
  %869 = xor i32 %868, %867
  store i32 %869, i32* %15, align 4
  %870 = load i32, i32* %14, align 4
  %871 = load i32, i32* %13, align 4
  %872 = sub i32 %871, %870
  store i32 %872, i32* %13, align 4
  %873 = load i32, i32* %15, align 4
  %874 = load i32, i32* %13, align 4
  %875 = sub i32 %874, %873
  store i32 %875, i32* %13, align 4
  %876 = load i32, i32* %15, align 4
  %877 = lshr i32 %876, 5
  %878 = load i32, i32* %13, align 4
  %879 = xor i32 %878, %877
  store i32 %879, i32* %13, align 4
  %880 = load i32, i32* %15, align 4
  %881 = load i32, i32* %14, align 4
  %882 = sub i32 %881, %880
  store i32 %882, i32* %14, align 4
  %883 = load i32, i32* %13, align 4
  %884 = load i32, i32* %14, align 4
  %885 = sub i32 %884, %883
  store i32 %885, i32* %14, align 4
  %886 = load i32, i32* %13, align 4
  %887 = lshr i32 %886, 3
  %888 = load i32, i32* %14, align 4
  %889 = xor i32 %888, %887
  store i32 %889, i32* %14, align 4
  %890 = load i32, i32* %13, align 4
  %891 = load i32, i32* %15, align 4
  %892 = sub i32 %891, %890
  store i32 %892, i32* %15, align 4
  %893 = load i32, i32* %14, align 4
  %894 = load i32, i32* %15, align 4
  %895 = sub i32 %894, %893
  store i32 %895, i32* %15, align 4
  %896 = load i32, i32* %14, align 4
  %897 = shl i32 %896, 10
  %898 = load i32, i32* %15, align 4
  %899 = xor i32 %898, %897
  store i32 %899, i32* %15, align 4
  %900 = load i32, i32* %14, align 4
  %901 = load i32, i32* %13, align 4
  %902 = sub i32 %901, %900
  store i32 %902, i32* %13, align 4
  %903 = load i32, i32* %15, align 4
  %904 = load i32, i32* %13, align 4
  %905 = sub i32 %904, %903
  store i32 %905, i32* %13, align 4
  %906 = load i32, i32* %15, align 4
  %907 = lshr i32 %906, 15
  %908 = load i32, i32* %13, align 4
  %909 = xor i32 %908, %907
  store i32 %909, i32* %13, align 4
  br label %910

; <label>:910:                                    ; preds = %819
  br label %911

; <label>:911:                                    ; preds = %910
  br label %912

; <label>:912:                                    ; preds = %911
  br label %913

; <label>:913:                                    ; preds = %912
  store %struct.LoggedAddrEntry* null, %struct.LoggedAddrEntry** %11, align 8
  %914 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %915 = icmp ne %struct.LoggedAddrEntry* %914, null
  br i1 %915, label %916, label %1025

; <label>:916:                                    ; preds = %913
  br label %917

; <label>:917:                                    ; preds = %916
  %918 = load i32, i32* %13, align 4
  %919 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %920 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %919, i32 0, i32 1
  %921 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %920, i32 0, i32 0
  %922 = load %struct.UT_hash_table*, %struct.UT_hash_table** %921, align 8
  %923 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %922, i32 0, i32 1
  %924 = load i32, i32* %923, align 8
  %925 = sub i32 %924, 1
  %926 = and i32 %918, %925
  store i32 %926, i32* %18, align 4
  br label %927

; <label>:927:                                    ; preds = %917
  br label %928

; <label>:928:                                    ; preds = %927
  %929 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %930 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %929, i32 0, i32 1
  %931 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %930, i32 0, i32 0
  %932 = load %struct.UT_hash_table*, %struct.UT_hash_table** %931, align 8
  %933 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %932, i32 0, i32 0
  %934 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %933, align 8
  %935 = load i32, i32* %18, align 4
  %936 = zext i32 %935 to i64
  %937 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %934, i64 %936
  %938 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %937, i32 0, i32 0
  %939 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %938, align 8
  %940 = icmp ne %struct.UT_hash_handle* %939, null
  br i1 %940, label %941, label %965

; <label>:941:                                    ; preds = %928
  br label %942

; <label>:942:                                    ; preds = %941
  %943 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %944 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %943, i32 0, i32 1
  %945 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %944, i32 0, i32 0
  %946 = load %struct.UT_hash_table*, %struct.UT_hash_table** %945, align 8
  %947 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %946, i32 0, i32 0
  %948 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %947, align 8
  %949 = load i32, i32* %18, align 4
  %950 = zext i32 %949 to i64
  %951 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %948, i64 %950
  %952 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %951, i32 0, i32 0
  %953 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %952, align 8
  %954 = bitcast %struct.UT_hash_handle* %953 to i8*
  %955 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %956 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %955, i32 0, i32 1
  %957 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %956, i32 0, i32 0
  %958 = load %struct.UT_hash_table*, %struct.UT_hash_table** %957, align 8
  %959 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %958, i32 0, i32 5
  %960 = load i64, i64* %959, align 8
  %961 = sub i64 0, %960
  %962 = getelementptr inbounds i8, i8* %954, i64 %961
  %963 = bitcast i8* %962 to %struct.LoggedAddrEntry*
  store %struct.LoggedAddrEntry* %963, %struct.LoggedAddrEntry** %11, align 8
  br label %964

; <label>:964:                                    ; preds = %942
  br label %966

; <label>:965:                                    ; preds = %928
  store %struct.LoggedAddrEntry* null, %struct.LoggedAddrEntry** %11, align 8
  br label %966

; <label>:966:                                    ; preds = %965, %964
  br label %967

; <label>:967:                                    ; preds = %1022, %966
  %968 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %969 = icmp ne %struct.LoggedAddrEntry* %968, null
  br i1 %969, label %970, label %1023

; <label>:970:                                    ; preds = %967
  %971 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %972 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %971, i32 0, i32 1
  %973 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %972, i32 0, i32 7
  %974 = load i32, i32* %973, align 4
  %975 = load i32, i32* %13, align 4
  %976 = icmp eq i32 %974, %975
  br i1 %976, label %977, label %998

; <label>:977:                                    ; preds = %970
  %978 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %979 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %978, i32 0, i32 1
  %980 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %979, i32 0, i32 6
  %981 = load i32, i32* %980, align 8
  %982 = zext i32 %981 to i64
  %983 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %984 = call i64 @strlen(i8* %983) #7
  %985 = icmp eq i64 %982, %984
  br i1 %985, label %986, label %998

; <label>:986:                                    ; preds = %977
  %987 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %988 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %987, i32 0, i32 1
  %989 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %988, i32 0, i32 5
  %990 = load i8*, i8** %989, align 8
  %991 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %992 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %993 = call i64 @strlen(i8* %992) #7
  %994 = call i32 @memcmp(i8* %990, i8* %991, i64 %993) #7
  %995 = icmp eq i32 %994, 0
  br i1 %995, label %996, label %997

; <label>:996:                                    ; preds = %986
  br label %1023

; <label>:997:                                    ; preds = %986
  br label %998

; <label>:998:                                    ; preds = %997, %977, %970
  %999 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1000 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %999, i32 0, i32 1
  %1001 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1000, i32 0, i32 4
  %1002 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1001, align 8
  %1003 = icmp ne %struct.UT_hash_handle* %1002, null
  br i1 %1003, label %1004, label %1021

; <label>:1004:                                   ; preds = %998
  br label %1005

; <label>:1005:                                   ; preds = %1004
  %1006 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1007 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1006, i32 0, i32 1
  %1008 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1007, i32 0, i32 4
  %1009 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1008, align 8
  %1010 = bitcast %struct.UT_hash_handle* %1009 to i8*
  %1011 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1012 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1011, i32 0, i32 1
  %1013 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1012, i32 0, i32 0
  %1014 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1013, align 8
  %1015 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1014, i32 0, i32 5
  %1016 = load i64, i64* %1015, align 8
  %1017 = sub i64 0, %1016
  %1018 = getelementptr inbounds i8, i8* %1010, i64 %1017
  %1019 = bitcast i8* %1018 to %struct.LoggedAddrEntry*
  store %struct.LoggedAddrEntry* %1019, %struct.LoggedAddrEntry** %11, align 8
  br label %1020

; <label>:1020:                                   ; preds = %1005
  br label %1022

; <label>:1021:                                   ; preds = %998
  store %struct.LoggedAddrEntry* null, %struct.LoggedAddrEntry** %11, align 8
  br label %1022

; <label>:1022:                                   ; preds = %1021, %1020
  br label %967

; <label>:1023:                                   ; preds = %996, %967
  br label %1024

; <label>:1024:                                   ; preds = %1023
  br label %1025

; <label>:1025:                                   ; preds = %1024, %913
  br label %1026

; <label>:1026:                                   ; preds = %1025
  br label %1027

; <label>:1027:                                   ; preds = %1026, %542
  br label %1028

; <label>:1028:                                   ; preds = %1027
  %1029 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1030 = icmp eq %struct.LoggedAddrEntry* %1029, null
  br i1 %1030, label %1031, label %1925

; <label>:1031:                                   ; preds = %1028
  %1032 = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.38, i32 0, i32 0))
  store %struct._IO_FILE* %1032, %struct._IO_FILE** %19, align 8
  %1033 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %1034 = icmp ne %struct._IO_FILE* %1033, null
  br i1 %1034, label %1035, label %1043

; <label>:1035:                                   ; preds = %1031
  %1036 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %1037 = load i8*, i8** %2, align 8
  %1038 = load i32, i32* @mode_enum, align 4
  %1039 = call i8* @mode_to_string(i32 %1038)
  %1040 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1036, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.39, i32 0, i32 0), i8* %1037, i8* %1039)
  %1041 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %1042 = call i32 @fclose(%struct._IO_FILE* %1041)
  br label %1045

; <label>:1043:                                   ; preds = %1031
  %1044 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.40, i32 0, i32 0))
  br label %1045

; <label>:1045:                                   ; preds = %1043, %1035
  %1046 = call noalias i8* @malloc(i64 80) #6
  %1047 = bitcast i8* %1046 to %struct.LoggedAddrEntry*
  store %struct.LoggedAddrEntry* %1047, %struct.LoggedAddrEntry** %11, align 8
  %1048 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1049 = icmp ne %struct.LoggedAddrEntry* %1048, null
  br i1 %1049, label %1050, label %1923

; <label>:1050:                                   ; preds = %1045
  %1051 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1052 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1051, i32 0, i32 0
  %1053 = getelementptr inbounds [20 x i8], [20 x i8]* %1052, i32 0, i32 0
  %1054 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %1055 = call i8* @strncpy(i8* %1053, i8* %1054, i64 19) #6
  br label %1056

; <label>:1056:                                   ; preds = %1050
  br label %1057

; <label>:1057:                                   ; preds = %1056
  br label %1058

; <label>:1058:                                   ; preds = %1057
  %1059 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1060 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1059, i32 0, i32 0
  %1061 = bitcast [20 x i8]* %1060 to i8*
  store i8* %1061, i8** %24, align 8
  store i32 -17973521, i32* %20, align 4
  store i32 -1640531527, i32* %22, align 4
  store i32 -1640531527, i32* %21, align 4
  %1062 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1063 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1062, i32 0, i32 0
  %1064 = getelementptr inbounds [20 x i8], [20 x i8]* %1063, i32 0, i32 0
  %1065 = call i64 @strlen(i8* %1064) #7
  %1066 = trunc i64 %1065 to i32
  store i32 %1066, i32* %23, align 4
  br label %1067

; <label>:1067:                                   ; preds = %1234, %1058
  %1068 = load i32, i32* %23, align 4
  %1069 = icmp uge i32 %1068, 12
  br i1 %1069, label %1070, label %1239

; <label>:1070:                                   ; preds = %1067
  %1071 = load i8*, i8** %24, align 8
  %1072 = getelementptr inbounds i8, i8* %1071, i64 0
  %1073 = load i8, i8* %1072, align 1
  %1074 = zext i8 %1073 to i32
  %1075 = load i8*, i8** %24, align 8
  %1076 = getelementptr inbounds i8, i8* %1075, i64 1
  %1077 = load i8, i8* %1076, align 1
  %1078 = zext i8 %1077 to i32
  %1079 = shl i32 %1078, 8
  %1080 = add i32 %1074, %1079
  %1081 = load i8*, i8** %24, align 8
  %1082 = getelementptr inbounds i8, i8* %1081, i64 2
  %1083 = load i8, i8* %1082, align 1
  %1084 = zext i8 %1083 to i32
  %1085 = shl i32 %1084, 16
  %1086 = add i32 %1080, %1085
  %1087 = load i8*, i8** %24, align 8
  %1088 = getelementptr inbounds i8, i8* %1087, i64 3
  %1089 = load i8, i8* %1088, align 1
  %1090 = zext i8 %1089 to i32
  %1091 = shl i32 %1090, 24
  %1092 = add i32 %1086, %1091
  %1093 = load i32, i32* %21, align 4
  %1094 = add i32 %1093, %1092
  store i32 %1094, i32* %21, align 4
  %1095 = load i8*, i8** %24, align 8
  %1096 = getelementptr inbounds i8, i8* %1095, i64 4
  %1097 = load i8, i8* %1096, align 1
  %1098 = zext i8 %1097 to i32
  %1099 = load i8*, i8** %24, align 8
  %1100 = getelementptr inbounds i8, i8* %1099, i64 5
  %1101 = load i8, i8* %1100, align 1
  %1102 = zext i8 %1101 to i32
  %1103 = shl i32 %1102, 8
  %1104 = add i32 %1098, %1103
  %1105 = load i8*, i8** %24, align 8
  %1106 = getelementptr inbounds i8, i8* %1105, i64 6
  %1107 = load i8, i8* %1106, align 1
  %1108 = zext i8 %1107 to i32
  %1109 = shl i32 %1108, 16
  %1110 = add i32 %1104, %1109
  %1111 = load i8*, i8** %24, align 8
  %1112 = getelementptr inbounds i8, i8* %1111, i64 7
  %1113 = load i8, i8* %1112, align 1
  %1114 = zext i8 %1113 to i32
  %1115 = shl i32 %1114, 24
  %1116 = add i32 %1110, %1115
  %1117 = load i32, i32* %22, align 4
  %1118 = add i32 %1117, %1116
  store i32 %1118, i32* %22, align 4
  %1119 = load i8*, i8** %24, align 8
  %1120 = getelementptr inbounds i8, i8* %1119, i64 8
  %1121 = load i8, i8* %1120, align 1
  %1122 = zext i8 %1121 to i32
  %1123 = load i8*, i8** %24, align 8
  %1124 = getelementptr inbounds i8, i8* %1123, i64 9
  %1125 = load i8, i8* %1124, align 1
  %1126 = zext i8 %1125 to i32
  %1127 = shl i32 %1126, 8
  %1128 = add i32 %1122, %1127
  %1129 = load i8*, i8** %24, align 8
  %1130 = getelementptr inbounds i8, i8* %1129, i64 10
  %1131 = load i8, i8* %1130, align 1
  %1132 = zext i8 %1131 to i32
  %1133 = shl i32 %1132, 16
  %1134 = add i32 %1128, %1133
  %1135 = load i8*, i8** %24, align 8
  %1136 = getelementptr inbounds i8, i8* %1135, i64 11
  %1137 = load i8, i8* %1136, align 1
  %1138 = zext i8 %1137 to i32
  %1139 = shl i32 %1138, 24
  %1140 = add i32 %1134, %1139
  %1141 = load i32, i32* %20, align 4
  %1142 = add i32 %1141, %1140
  store i32 %1142, i32* %20, align 4
  br label %1143

; <label>:1143:                                   ; preds = %1070
  %1144 = load i32, i32* %22, align 4
  %1145 = load i32, i32* %21, align 4
  %1146 = sub i32 %1145, %1144
  store i32 %1146, i32* %21, align 4
  %1147 = load i32, i32* %20, align 4
  %1148 = load i32, i32* %21, align 4
  %1149 = sub i32 %1148, %1147
  store i32 %1149, i32* %21, align 4
  %1150 = load i32, i32* %20, align 4
  %1151 = lshr i32 %1150, 13
  %1152 = load i32, i32* %21, align 4
  %1153 = xor i32 %1152, %1151
  store i32 %1153, i32* %21, align 4
  %1154 = load i32, i32* %20, align 4
  %1155 = load i32, i32* %22, align 4
  %1156 = sub i32 %1155, %1154
  store i32 %1156, i32* %22, align 4
  %1157 = load i32, i32* %21, align 4
  %1158 = load i32, i32* %22, align 4
  %1159 = sub i32 %1158, %1157
  store i32 %1159, i32* %22, align 4
  %1160 = load i32, i32* %21, align 4
  %1161 = shl i32 %1160, 8
  %1162 = load i32, i32* %22, align 4
  %1163 = xor i32 %1162, %1161
  store i32 %1163, i32* %22, align 4
  %1164 = load i32, i32* %21, align 4
  %1165 = load i32, i32* %20, align 4
  %1166 = sub i32 %1165, %1164
  store i32 %1166, i32* %20, align 4
  %1167 = load i32, i32* %22, align 4
  %1168 = load i32, i32* %20, align 4
  %1169 = sub i32 %1168, %1167
  store i32 %1169, i32* %20, align 4
  %1170 = load i32, i32* %22, align 4
  %1171 = lshr i32 %1170, 13
  %1172 = load i32, i32* %20, align 4
  %1173 = xor i32 %1172, %1171
  store i32 %1173, i32* %20, align 4
  %1174 = load i32, i32* %22, align 4
  %1175 = load i32, i32* %21, align 4
  %1176 = sub i32 %1175, %1174
  store i32 %1176, i32* %21, align 4
  %1177 = load i32, i32* %20, align 4
  %1178 = load i32, i32* %21, align 4
  %1179 = sub i32 %1178, %1177
  store i32 %1179, i32* %21, align 4
  %1180 = load i32, i32* %20, align 4
  %1181 = lshr i32 %1180, 12
  %1182 = load i32, i32* %21, align 4
  %1183 = xor i32 %1182, %1181
  store i32 %1183, i32* %21, align 4
  %1184 = load i32, i32* %20, align 4
  %1185 = load i32, i32* %22, align 4
  %1186 = sub i32 %1185, %1184
  store i32 %1186, i32* %22, align 4
  %1187 = load i32, i32* %21, align 4
  %1188 = load i32, i32* %22, align 4
  %1189 = sub i32 %1188, %1187
  store i32 %1189, i32* %22, align 4
  %1190 = load i32, i32* %21, align 4
  %1191 = shl i32 %1190, 16
  %1192 = load i32, i32* %22, align 4
  %1193 = xor i32 %1192, %1191
  store i32 %1193, i32* %22, align 4
  %1194 = load i32, i32* %21, align 4
  %1195 = load i32, i32* %20, align 4
  %1196 = sub i32 %1195, %1194
  store i32 %1196, i32* %20, align 4
  %1197 = load i32, i32* %22, align 4
  %1198 = load i32, i32* %20, align 4
  %1199 = sub i32 %1198, %1197
  store i32 %1199, i32* %20, align 4
  %1200 = load i32, i32* %22, align 4
  %1201 = lshr i32 %1200, 5
  %1202 = load i32, i32* %20, align 4
  %1203 = xor i32 %1202, %1201
  store i32 %1203, i32* %20, align 4
  %1204 = load i32, i32* %22, align 4
  %1205 = load i32, i32* %21, align 4
  %1206 = sub i32 %1205, %1204
  store i32 %1206, i32* %21, align 4
  %1207 = load i32, i32* %20, align 4
  %1208 = load i32, i32* %21, align 4
  %1209 = sub i32 %1208, %1207
  store i32 %1209, i32* %21, align 4
  %1210 = load i32, i32* %20, align 4
  %1211 = lshr i32 %1210, 3
  %1212 = load i32, i32* %21, align 4
  %1213 = xor i32 %1212, %1211
  store i32 %1213, i32* %21, align 4
  %1214 = load i32, i32* %20, align 4
  %1215 = load i32, i32* %22, align 4
  %1216 = sub i32 %1215, %1214
  store i32 %1216, i32* %22, align 4
  %1217 = load i32, i32* %21, align 4
  %1218 = load i32, i32* %22, align 4
  %1219 = sub i32 %1218, %1217
  store i32 %1219, i32* %22, align 4
  %1220 = load i32, i32* %21, align 4
  %1221 = shl i32 %1220, 10
  %1222 = load i32, i32* %22, align 4
  %1223 = xor i32 %1222, %1221
  store i32 %1223, i32* %22, align 4
  %1224 = load i32, i32* %21, align 4
  %1225 = load i32, i32* %20, align 4
  %1226 = sub i32 %1225, %1224
  store i32 %1226, i32* %20, align 4
  %1227 = load i32, i32* %22, align 4
  %1228 = load i32, i32* %20, align 4
  %1229 = sub i32 %1228, %1227
  store i32 %1229, i32* %20, align 4
  %1230 = load i32, i32* %22, align 4
  %1231 = lshr i32 %1230, 15
  %1232 = load i32, i32* %20, align 4
  %1233 = xor i32 %1232, %1231
  store i32 %1233, i32* %20, align 4
  br label %1234

; <label>:1234:                                   ; preds = %1143
  %1235 = load i8*, i8** %24, align 8
  %1236 = getelementptr inbounds i8, i8* %1235, i64 12
  store i8* %1236, i8** %24, align 8
  %1237 = load i32, i32* %23, align 4
  %1238 = sub i32 %1237, 12
  store i32 %1238, i32* %23, align 4
  br label %1067

; <label>:1239:                                   ; preds = %1067
  %1240 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1241 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1240, i32 0, i32 0
  %1242 = getelementptr inbounds [20 x i8], [20 x i8]* %1241, i32 0, i32 0
  %1243 = call i64 @strlen(i8* %1242) #7
  %1244 = trunc i64 %1243 to i32
  %1245 = load i32, i32* %20, align 4
  %1246 = add i32 %1245, %1244
  store i32 %1246, i32* %20, align 4
  %1247 = load i32, i32* %23, align 4
  switch i32 %1247, label %1334 [
    i32 11, label %1248
    i32 10, label %1256
    i32 9, label %1264
    i32 8, label %1272
    i32 7, label %1280
    i32 6, label %1288
    i32 5, label %1296
    i32 4, label %1303
    i32 3, label %1311
    i32 2, label %1319
    i32 1, label %1327
  ]

; <label>:1248:                                   ; preds = %1239
  %1249 = load i8*, i8** %24, align 8
  %1250 = getelementptr inbounds i8, i8* %1249, i64 10
  %1251 = load i8, i8* %1250, align 1
  %1252 = zext i8 %1251 to i32
  %1253 = shl i32 %1252, 24
  %1254 = load i32, i32* %20, align 4
  %1255 = add i32 %1254, %1253
  store i32 %1255, i32* %20, align 4
  br label %1256

; <label>:1256:                                   ; preds = %1239, %1248
  %1257 = load i8*, i8** %24, align 8
  %1258 = getelementptr inbounds i8, i8* %1257, i64 9
  %1259 = load i8, i8* %1258, align 1
  %1260 = zext i8 %1259 to i32
  %1261 = shl i32 %1260, 16
  %1262 = load i32, i32* %20, align 4
  %1263 = add i32 %1262, %1261
  store i32 %1263, i32* %20, align 4
  br label %1264

; <label>:1264:                                   ; preds = %1239, %1256
  %1265 = load i8*, i8** %24, align 8
  %1266 = getelementptr inbounds i8, i8* %1265, i64 8
  %1267 = load i8, i8* %1266, align 1
  %1268 = zext i8 %1267 to i32
  %1269 = shl i32 %1268, 8
  %1270 = load i32, i32* %20, align 4
  %1271 = add i32 %1270, %1269
  store i32 %1271, i32* %20, align 4
  br label %1272

; <label>:1272:                                   ; preds = %1239, %1264
  %1273 = load i8*, i8** %24, align 8
  %1274 = getelementptr inbounds i8, i8* %1273, i64 7
  %1275 = load i8, i8* %1274, align 1
  %1276 = zext i8 %1275 to i32
  %1277 = shl i32 %1276, 24
  %1278 = load i32, i32* %22, align 4
  %1279 = add i32 %1278, %1277
  store i32 %1279, i32* %22, align 4
  br label %1280

; <label>:1280:                                   ; preds = %1239, %1272
  %1281 = load i8*, i8** %24, align 8
  %1282 = getelementptr inbounds i8, i8* %1281, i64 6
  %1283 = load i8, i8* %1282, align 1
  %1284 = zext i8 %1283 to i32
  %1285 = shl i32 %1284, 16
  %1286 = load i32, i32* %22, align 4
  %1287 = add i32 %1286, %1285
  store i32 %1287, i32* %22, align 4
  br label %1288

; <label>:1288:                                   ; preds = %1239, %1280
  %1289 = load i8*, i8** %24, align 8
  %1290 = getelementptr inbounds i8, i8* %1289, i64 5
  %1291 = load i8, i8* %1290, align 1
  %1292 = zext i8 %1291 to i32
  %1293 = shl i32 %1292, 8
  %1294 = load i32, i32* %22, align 4
  %1295 = add i32 %1294, %1293
  store i32 %1295, i32* %22, align 4
  br label %1296

; <label>:1296:                                   ; preds = %1239, %1288
  %1297 = load i8*, i8** %24, align 8
  %1298 = getelementptr inbounds i8, i8* %1297, i64 4
  %1299 = load i8, i8* %1298, align 1
  %1300 = zext i8 %1299 to i32
  %1301 = load i32, i32* %22, align 4
  %1302 = add i32 %1301, %1300
  store i32 %1302, i32* %22, align 4
  br label %1303

; <label>:1303:                                   ; preds = %1239, %1296
  %1304 = load i8*, i8** %24, align 8
  %1305 = getelementptr inbounds i8, i8* %1304, i64 3
  %1306 = load i8, i8* %1305, align 1
  %1307 = zext i8 %1306 to i32
  %1308 = shl i32 %1307, 24
  %1309 = load i32, i32* %21, align 4
  %1310 = add i32 %1309, %1308
  store i32 %1310, i32* %21, align 4
  br label %1311

; <label>:1311:                                   ; preds = %1239, %1303
  %1312 = load i8*, i8** %24, align 8
  %1313 = getelementptr inbounds i8, i8* %1312, i64 2
  %1314 = load i8, i8* %1313, align 1
  %1315 = zext i8 %1314 to i32
  %1316 = shl i32 %1315, 16
  %1317 = load i32, i32* %21, align 4
  %1318 = add i32 %1317, %1316
  store i32 %1318, i32* %21, align 4
  br label %1319

; <label>:1319:                                   ; preds = %1239, %1311
  %1320 = load i8*, i8** %24, align 8
  %1321 = getelementptr inbounds i8, i8* %1320, i64 1
  %1322 = load i8, i8* %1321, align 1
  %1323 = zext i8 %1322 to i32
  %1324 = shl i32 %1323, 8
  %1325 = load i32, i32* %21, align 4
  %1326 = add i32 %1325, %1324
  store i32 %1326, i32* %21, align 4
  br label %1327

; <label>:1327:                                   ; preds = %1239, %1319
  %1328 = load i8*, i8** %24, align 8
  %1329 = getelementptr inbounds i8, i8* %1328, i64 0
  %1330 = load i8, i8* %1329, align 1
  %1331 = zext i8 %1330 to i32
  %1332 = load i32, i32* %21, align 4
  %1333 = add i32 %1332, %1331
  store i32 %1333, i32* %21, align 4
  br label %1334

; <label>:1334:                                   ; preds = %1239, %1327
  br label %1335

; <label>:1335:                                   ; preds = %1334
  br label %1336

; <label>:1336:                                   ; preds = %1335
  %1337 = load i32, i32* %22, align 4
  %1338 = load i32, i32* %21, align 4
  %1339 = sub i32 %1338, %1337
  store i32 %1339, i32* %21, align 4
  %1340 = load i32, i32* %20, align 4
  %1341 = load i32, i32* %21, align 4
  %1342 = sub i32 %1341, %1340
  store i32 %1342, i32* %21, align 4
  %1343 = load i32, i32* %20, align 4
  %1344 = lshr i32 %1343, 13
  %1345 = load i32, i32* %21, align 4
  %1346 = xor i32 %1345, %1344
  store i32 %1346, i32* %21, align 4
  %1347 = load i32, i32* %20, align 4
  %1348 = load i32, i32* %22, align 4
  %1349 = sub i32 %1348, %1347
  store i32 %1349, i32* %22, align 4
  %1350 = load i32, i32* %21, align 4
  %1351 = load i32, i32* %22, align 4
  %1352 = sub i32 %1351, %1350
  store i32 %1352, i32* %22, align 4
  %1353 = load i32, i32* %21, align 4
  %1354 = shl i32 %1353, 8
  %1355 = load i32, i32* %22, align 4
  %1356 = xor i32 %1355, %1354
  store i32 %1356, i32* %22, align 4
  %1357 = load i32, i32* %21, align 4
  %1358 = load i32, i32* %20, align 4
  %1359 = sub i32 %1358, %1357
  store i32 %1359, i32* %20, align 4
  %1360 = load i32, i32* %22, align 4
  %1361 = load i32, i32* %20, align 4
  %1362 = sub i32 %1361, %1360
  store i32 %1362, i32* %20, align 4
  %1363 = load i32, i32* %22, align 4
  %1364 = lshr i32 %1363, 13
  %1365 = load i32, i32* %20, align 4
  %1366 = xor i32 %1365, %1364
  store i32 %1366, i32* %20, align 4
  %1367 = load i32, i32* %22, align 4
  %1368 = load i32, i32* %21, align 4
  %1369 = sub i32 %1368, %1367
  store i32 %1369, i32* %21, align 4
  %1370 = load i32, i32* %20, align 4
  %1371 = load i32, i32* %21, align 4
  %1372 = sub i32 %1371, %1370
  store i32 %1372, i32* %21, align 4
  %1373 = load i32, i32* %20, align 4
  %1374 = lshr i32 %1373, 12
  %1375 = load i32, i32* %21, align 4
  %1376 = xor i32 %1375, %1374
  store i32 %1376, i32* %21, align 4
  %1377 = load i32, i32* %20, align 4
  %1378 = load i32, i32* %22, align 4
  %1379 = sub i32 %1378, %1377
  store i32 %1379, i32* %22, align 4
  %1380 = load i32, i32* %21, align 4
  %1381 = load i32, i32* %22, align 4
  %1382 = sub i32 %1381, %1380
  store i32 %1382, i32* %22, align 4
  %1383 = load i32, i32* %21, align 4
  %1384 = shl i32 %1383, 16
  %1385 = load i32, i32* %22, align 4
  %1386 = xor i32 %1385, %1384
  store i32 %1386, i32* %22, align 4
  %1387 = load i32, i32* %21, align 4
  %1388 = load i32, i32* %20, align 4
  %1389 = sub i32 %1388, %1387
  store i32 %1389, i32* %20, align 4
  %1390 = load i32, i32* %22, align 4
  %1391 = load i32, i32* %20, align 4
  %1392 = sub i32 %1391, %1390
  store i32 %1392, i32* %20, align 4
  %1393 = load i32, i32* %22, align 4
  %1394 = lshr i32 %1393, 5
  %1395 = load i32, i32* %20, align 4
  %1396 = xor i32 %1395, %1394
  store i32 %1396, i32* %20, align 4
  %1397 = load i32, i32* %22, align 4
  %1398 = load i32, i32* %21, align 4
  %1399 = sub i32 %1398, %1397
  store i32 %1399, i32* %21, align 4
  %1400 = load i32, i32* %20, align 4
  %1401 = load i32, i32* %21, align 4
  %1402 = sub i32 %1401, %1400
  store i32 %1402, i32* %21, align 4
  %1403 = load i32, i32* %20, align 4
  %1404 = lshr i32 %1403, 3
  %1405 = load i32, i32* %21, align 4
  %1406 = xor i32 %1405, %1404
  store i32 %1406, i32* %21, align 4
  %1407 = load i32, i32* %20, align 4
  %1408 = load i32, i32* %22, align 4
  %1409 = sub i32 %1408, %1407
  store i32 %1409, i32* %22, align 4
  %1410 = load i32, i32* %21, align 4
  %1411 = load i32, i32* %22, align 4
  %1412 = sub i32 %1411, %1410
  store i32 %1412, i32* %22, align 4
  %1413 = load i32, i32* %21, align 4
  %1414 = shl i32 %1413, 10
  %1415 = load i32, i32* %22, align 4
  %1416 = xor i32 %1415, %1414
  store i32 %1416, i32* %22, align 4
  %1417 = load i32, i32* %21, align 4
  %1418 = load i32, i32* %20, align 4
  %1419 = sub i32 %1418, %1417
  store i32 %1419, i32* %20, align 4
  %1420 = load i32, i32* %22, align 4
  %1421 = load i32, i32* %20, align 4
  %1422 = sub i32 %1421, %1420
  store i32 %1422, i32* %20, align 4
  %1423 = load i32, i32* %22, align 4
  %1424 = lshr i32 %1423, 15
  %1425 = load i32, i32* %20, align 4
  %1426 = xor i32 %1425, %1424
  store i32 %1426, i32* %20, align 4
  br label %1427

; <label>:1427:                                   ; preds = %1336
  br label %1428

; <label>:1428:                                   ; preds = %1427
  br label %1429

; <label>:1429:                                   ; preds = %1428
  br label %1430

; <label>:1430:                                   ; preds = %1429
  %1431 = load i32, i32* %20, align 4
  %1432 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1433 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1432, i32 0, i32 1
  %1434 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1433, i32 0, i32 7
  store i32 %1431, i32* %1434, align 4
  %1435 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1436 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1435, i32 0, i32 0
  %1437 = bitcast [20 x i8]* %1436 to i8*
  %1438 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1439 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1438, i32 0, i32 1
  %1440 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1439, i32 0, i32 5
  store i8* %1437, i8** %1440, align 8
  %1441 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1442 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1441, i32 0, i32 0
  %1443 = getelementptr inbounds [20 x i8], [20 x i8]* %1442, i32 0, i32 0
  %1444 = call i64 @strlen(i8* %1443) #7
  %1445 = trunc i64 %1444 to i32
  %1446 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1447 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1446, i32 0, i32 1
  %1448 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1447, i32 0, i32 6
  store i32 %1445, i32* %1448, align 8
  %1449 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1450 = icmp ne %struct.LoggedAddrEntry* %1449, null
  br i1 %1450, label %1538, label %1451

; <label>:1451:                                   ; preds = %1430
  %1452 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1453 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1452, i32 0, i32 1
  %1454 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1453, i32 0, i32 2
  store i8* null, i8** %1454, align 8
  %1455 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1456 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1455, i32 0, i32 1
  %1457 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1456, i32 0, i32 1
  store i8* null, i8** %1457, align 8
  br label %1458

; <label>:1458:                                   ; preds = %1451
  %1459 = call noalias i8* @malloc(i64 64) #6
  %1460 = bitcast i8* %1459 to %struct.UT_hash_table*
  %1461 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1462 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1461, i32 0, i32 1
  %1463 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1462, i32 0, i32 0
  store %struct.UT_hash_table* %1460, %struct.UT_hash_table** %1463, align 8
  %1464 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1465 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1464, i32 0, i32 1
  %1466 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1465, i32 0, i32 0
  %1467 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1466, align 8
  %1468 = icmp ne %struct.UT_hash_table* %1467, null
  br i1 %1468, label %1470, label %1469

; <label>:1469:                                   ; preds = %1458
  call void @exit(i32 -1) #8
  unreachable

; <label>:1470:                                   ; preds = %1458
  %1471 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1472 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1471, i32 0, i32 1
  %1473 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1472, i32 0, i32 0
  %1474 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1473, align 8
  %1475 = bitcast %struct.UT_hash_table* %1474 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1475, i8 0, i64 64, i1 false)
  %1476 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1477 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1476, i32 0, i32 1
  %1478 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1479 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1478, i32 0, i32 1
  %1480 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1479, i32 0, i32 0
  %1481 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1480, align 8
  %1482 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1481, i32 0, i32 4
  store %struct.UT_hash_handle* %1477, %struct.UT_hash_handle** %1482, align 8
  %1483 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1484 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1483, i32 0, i32 1
  %1485 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1484, i32 0, i32 0
  %1486 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1485, align 8
  %1487 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1486, i32 0, i32 1
  store i32 32, i32* %1487, align 8
  %1488 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1489 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1488, i32 0, i32 1
  %1490 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1489, i32 0, i32 0
  %1491 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1490, align 8
  %1492 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1491, i32 0, i32 2
  store i32 5, i32* %1492, align 4
  %1493 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1494 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1493, i32 0, i32 1
  %1495 = bitcast %struct.UT_hash_handle* %1494 to i8*
  %1496 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1497 = bitcast %struct.LoggedAddrEntry* %1496 to i8*
  %1498 = ptrtoint i8* %1495 to i64
  %1499 = ptrtoint i8* %1497 to i64
  %1500 = sub i64 %1498, %1499
  %1501 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1502 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1501, i32 0, i32 1
  %1503 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1502, i32 0, i32 0
  %1504 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1503, align 8
  %1505 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1504, i32 0, i32 5
  store i64 %1500, i64* %1505, align 8
  %1506 = call noalias i8* @malloc(i64 512) #6
  %1507 = bitcast i8* %1506 to %struct.UT_hash_bucket*
  %1508 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1509 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1508, i32 0, i32 1
  %1510 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1509, i32 0, i32 0
  %1511 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1510, align 8
  %1512 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1511, i32 0, i32 0
  store %struct.UT_hash_bucket* %1507, %struct.UT_hash_bucket** %1512, align 8
  %1513 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1514 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1513, i32 0, i32 1
  %1515 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1514, i32 0, i32 0
  %1516 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1515, align 8
  %1517 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1516, i32 0, i32 10
  store i32 -1609490463, i32* %1517, align 8
  %1518 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1519 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1518, i32 0, i32 1
  %1520 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1519, i32 0, i32 0
  %1521 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1520, align 8
  %1522 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1521, i32 0, i32 0
  %1523 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1522, align 8
  %1524 = icmp ne %struct.UT_hash_bucket* %1523, null
  br i1 %1524, label %1526, label %1525

; <label>:1525:                                   ; preds = %1470
  call void @exit(i32 -1) #8
  unreachable

; <label>:1526:                                   ; preds = %1470
  %1527 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1528 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1527, i32 0, i32 1
  %1529 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1528, i32 0, i32 0
  %1530 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1529, align 8
  %1531 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1530, i32 0, i32 0
  %1532 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1531, align 8
  %1533 = bitcast %struct.UT_hash_bucket* %1532 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1533, i8 0, i64 512, i1 false)
  br label %1534

; <label>:1534:                                   ; preds = %1526
  br label %1535

; <label>:1535:                                   ; preds = %1534
  br label %1536

; <label>:1536:                                   ; preds = %1535
  %1537 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  store %struct.LoggedAddrEntry* %1537, %struct.LoggedAddrEntry** @logged_addresses, align 8
  br label %1585

; <label>:1538:                                   ; preds = %1430
  %1539 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1540 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1539, i32 0, i32 1
  %1541 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1540, i32 0, i32 0
  %1542 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1541, align 8
  %1543 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1544 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1543, i32 0, i32 1
  %1545 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1544, i32 0, i32 0
  store %struct.UT_hash_table* %1542, %struct.UT_hash_table** %1545, align 8
  br label %1546

; <label>:1546:                                   ; preds = %1538
  %1547 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1548 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1547, i32 0, i32 1
  %1549 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1548, i32 0, i32 2
  store i8* null, i8** %1549, align 8
  %1550 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1551 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1550, i32 0, i32 1
  %1552 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1551, i32 0, i32 0
  %1553 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1552, align 8
  %1554 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1553, i32 0, i32 4
  %1555 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1554, align 8
  %1556 = bitcast %struct.UT_hash_handle* %1555 to i8*
  %1557 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1558 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1557, i32 0, i32 1
  %1559 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1558, i32 0, i32 0
  %1560 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1559, align 8
  %1561 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1560, i32 0, i32 5
  %1562 = load i64, i64* %1561, align 8
  %1563 = sub i64 0, %1562
  %1564 = getelementptr inbounds i8, i8* %1556, i64 %1563
  %1565 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1566 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1565, i32 0, i32 1
  %1567 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1566, i32 0, i32 1
  store i8* %1564, i8** %1567, align 8
  %1568 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1569 = bitcast %struct.LoggedAddrEntry* %1568 to i8*
  %1570 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1571 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1570, i32 0, i32 1
  %1572 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1571, i32 0, i32 0
  %1573 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1572, align 8
  %1574 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1573, i32 0, i32 4
  %1575 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1574, align 8
  %1576 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1575, i32 0, i32 2
  store i8* %1569, i8** %1576, align 8
  %1577 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1578 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1577, i32 0, i32 1
  %1579 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1580 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1579, i32 0, i32 1
  %1581 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1580, i32 0, i32 0
  %1582 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1581, align 8
  %1583 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1582, i32 0, i32 4
  store %struct.UT_hash_handle* %1578, %struct.UT_hash_handle** %1583, align 8
  br label %1584

; <label>:1584:                                   ; preds = %1546
  br label %1585

; <label>:1585:                                   ; preds = %1584, %1536
  br label %1586

; <label>:1586:                                   ; preds = %1585
  %1587 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1588 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1587, i32 0, i32 1
  %1589 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1588, i32 0, i32 0
  %1590 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1589, align 8
  %1591 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1590, i32 0, i32 3
  %1592 = load i32, i32* %1591, align 8
  %1593 = add i32 %1592, 1
  store i32 %1593, i32* %1591, align 8
  br label %1594

; <label>:1594:                                   ; preds = %1586
  %1595 = load i32, i32* %20, align 4
  %1596 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1597 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1596, i32 0, i32 1
  %1598 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1597, i32 0, i32 0
  %1599 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1598, align 8
  %1600 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1599, i32 0, i32 1
  %1601 = load i32, i32* %1600, align 8
  %1602 = sub i32 %1601, 1
  %1603 = and i32 %1595, %1602
  store i32 %1603, i32* %25, align 4
  br label %1604

; <label>:1604:                                   ; preds = %1594
  br label %1605

; <label>:1605:                                   ; preds = %1604
  %1606 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1607 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1606, i32 0, i32 1
  %1608 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1607, i32 0, i32 0
  %1609 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1608, align 8
  %1610 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1609, i32 0, i32 0
  %1611 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1610, align 8
  %1612 = load i32, i32* %25, align 4
  %1613 = zext i32 %1612 to i64
  %1614 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1611, i64 %1613
  store %struct.UT_hash_bucket* %1614, %struct.UT_hash_bucket** %26, align 8
  %1615 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1616 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1615, i32 0, i32 1
  %1617 = load i32, i32* %1616, align 8
  %1618 = add i32 %1617, 1
  store i32 %1618, i32* %1616, align 8
  %1619 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1620 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1619, i32 0, i32 0
  %1621 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1620, align 8
  %1622 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1623 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1622, i32 0, i32 1
  %1624 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1623, i32 0, i32 4
  store %struct.UT_hash_handle* %1621, %struct.UT_hash_handle** %1624, align 8
  %1625 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1626 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1625, i32 0, i32 1
  %1627 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1626, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1627, align 8
  %1628 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1629 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1628, i32 0, i32 0
  %1630 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1629, align 8
  %1631 = icmp ne %struct.UT_hash_handle* %1630, null
  br i1 %1631, label %1632, label %1639

; <label>:1632:                                   ; preds = %1605
  %1633 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1634 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1633, i32 0, i32 1
  %1635 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1636 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1635, i32 0, i32 0
  %1637 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1636, align 8
  %1638 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1637, i32 0, i32 3
  store %struct.UT_hash_handle* %1634, %struct.UT_hash_handle** %1638, align 8
  br label %1639

; <label>:1639:                                   ; preds = %1632, %1605
  %1640 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1641 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1640, i32 0, i32 1
  %1642 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1643 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1642, i32 0, i32 0
  store %struct.UT_hash_handle* %1641, %struct.UT_hash_handle** %1643, align 8
  %1644 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1645 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1644, i32 0, i32 1
  %1646 = load i32, i32* %1645, align 8
  %1647 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1648 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1647, i32 0, i32 2
  %1649 = load i32, i32* %1648, align 4
  %1650 = add i32 %1649, 1
  %1651 = mul i32 %1650, 10
  %1652 = icmp uge i32 %1646, %1651
  br i1 %1652, label %1653, label %1918

; <label>:1653:                                   ; preds = %1639
  %1654 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1655 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1654, i32 0, i32 1
  %1656 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1655, i32 0, i32 0
  %1657 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1656, align 8
  %1658 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1657, i32 0, i32 9
  %1659 = load i32, i32* %1658, align 4
  %1660 = icmp ne i32 %1659, 0
  br i1 %1660, label %1918, label %1661

; <label>:1661:                                   ; preds = %1653
  br label %1662

; <label>:1662:                                   ; preds = %1661
  %1663 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1664 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1663, i32 0, i32 1
  %1665 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1664, i32 0, i32 0
  %1666 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1665, align 8
  %1667 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1666, i32 0, i32 1
  %1668 = load i32, i32* %1667, align 8
  %1669 = zext i32 %1668 to i64
  %1670 = mul i64 16, %1669
  %1671 = mul i64 %1670, 2
  %1672 = call noalias i8* @malloc(i64 %1671) #6
  %1673 = bitcast i8* %1672 to %struct.UT_hash_bucket*
  store %struct.UT_hash_bucket* %1673, %struct.UT_hash_bucket** %31, align 8
  %1674 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1675 = icmp ne %struct.UT_hash_bucket* %1674, null
  br i1 %1675, label %1677, label %1676

; <label>:1676:                                   ; preds = %1662
  call void @exit(i32 -1) #8
  unreachable

; <label>:1677:                                   ; preds = %1662
  %1678 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1679 = bitcast %struct.UT_hash_bucket* %1678 to i8*
  %1680 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1681 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1680, i32 0, i32 1
  %1682 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1681, i32 0, i32 0
  %1683 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1682, align 8
  %1684 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1683, i32 0, i32 1
  %1685 = load i32, i32* %1684, align 8
  %1686 = zext i32 %1685 to i64
  %1687 = mul i64 16, %1686
  %1688 = mul i64 %1687, 2
  call void @llvm.memset.p0i8.i64(i8* align 8 %1679, i8 0, i64 %1688, i1 false)
  %1689 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1690 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1689, i32 0, i32 1
  %1691 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1690, i32 0, i32 0
  %1692 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1691, align 8
  %1693 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1692, i32 0, i32 3
  %1694 = load i32, i32* %1693, align 8
  %1695 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1696 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1695, i32 0, i32 1
  %1697 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1696, i32 0, i32 0
  %1698 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1697, align 8
  %1699 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1698, i32 0, i32 2
  %1700 = load i32, i32* %1699, align 4
  %1701 = add i32 %1700, 1
  %1702 = lshr i32 %1694, %1701
  %1703 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1704 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1703, i32 0, i32 1
  %1705 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1704, i32 0, i32 0
  %1706 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1705, align 8
  %1707 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1706, i32 0, i32 3
  %1708 = load i32, i32* %1707, align 8
  %1709 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1710 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1709, i32 0, i32 1
  %1711 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1710, i32 0, i32 0
  %1712 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1711, align 8
  %1713 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1712, i32 0, i32 1
  %1714 = load i32, i32* %1713, align 8
  %1715 = mul i32 %1714, 2
  %1716 = sub i32 %1715, 1
  %1717 = and i32 %1708, %1716
  %1718 = icmp ne i32 %1717, 0
  %1719 = zext i1 %1718 to i64
  %1720 = select i1 %1718, i32 1, i32 0
  %1721 = add i32 %1702, %1720
  %1722 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1723 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1722, i32 0, i32 1
  %1724 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1723, i32 0, i32 0
  %1725 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1724, align 8
  %1726 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1725, i32 0, i32 6
  store i32 %1721, i32* %1726, align 8
  %1727 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1728 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1727, i32 0, i32 1
  %1729 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1728, i32 0, i32 0
  %1730 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1729, align 8
  %1731 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1730, i32 0, i32 7
  store i32 0, i32* %1731, align 4
  store i32 0, i32* %28, align 4
  br label %1732

; <label>:1732:                                   ; preds = %1841, %1677
  %1733 = load i32, i32* %28, align 4
  %1734 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1735 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1734, i32 0, i32 1
  %1736 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1735, i32 0, i32 0
  %1737 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1736, align 8
  %1738 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1737, i32 0, i32 1
  %1739 = load i32, i32* %1738, align 8
  %1740 = icmp ult i32 %1733, %1739
  br i1 %1740, label %1741, label %1844

; <label>:1741:                                   ; preds = %1732
  %1742 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1743 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1742, i32 0, i32 1
  %1744 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1743, i32 0, i32 0
  %1745 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1744, align 8
  %1746 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1745, i32 0, i32 0
  %1747 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1746, align 8
  %1748 = load i32, i32* %28, align 4
  %1749 = zext i32 %1748 to i64
  %1750 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1747, i64 %1749
  %1751 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1750, i32 0, i32 0
  %1752 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1751, align 8
  store %struct.UT_hash_handle* %1752, %struct.UT_hash_handle** %29, align 8
  br label %1753

; <label>:1753:                                   ; preds = %1835, %1741
  %1754 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1755 = icmp ne %struct.UT_hash_handle* %1754, null
  br i1 %1755, label %1756, label %1840

; <label>:1756:                                   ; preds = %1753
  %1757 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1758 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1757, i32 0, i32 4
  %1759 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1758, align 8
  store %struct.UT_hash_handle* %1759, %struct.UT_hash_handle** %30, align 8
  br label %1760

; <label>:1760:                                   ; preds = %1756
  %1761 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1762 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1761, i32 0, i32 7
  %1763 = load i32, i32* %1762, align 4
  %1764 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1765 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1764, i32 0, i32 1
  %1766 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1765, i32 0, i32 0
  %1767 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1766, align 8
  %1768 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1767, i32 0, i32 1
  %1769 = load i32, i32* %1768, align 8
  %1770 = mul i32 %1769, 2
  %1771 = sub i32 %1770, 1
  %1772 = and i32 %1763, %1771
  store i32 %1772, i32* %27, align 4
  br label %1773

; <label>:1773:                                   ; preds = %1760
  %1774 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1775 = load i32, i32* %27, align 4
  %1776 = zext i32 %1775 to i64
  %1777 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1774, i64 %1776
  store %struct.UT_hash_bucket* %1777, %struct.UT_hash_bucket** %32, align 8
  %1778 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1779 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1778, i32 0, i32 1
  %1780 = load i32, i32* %1779, align 8
  %1781 = add i32 %1780, 1
  store i32 %1781, i32* %1779, align 8
  %1782 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1783 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1782, i32 0, i32 1
  %1784 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1783, i32 0, i32 0
  %1785 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1784, align 8
  %1786 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1785, i32 0, i32 6
  %1787 = load i32, i32* %1786, align 8
  %1788 = icmp ugt i32 %1781, %1787
  br i1 %1788, label %1789, label %1817

; <label>:1789:                                   ; preds = %1773
  %1790 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1791 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1790, i32 0, i32 1
  %1792 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1791, i32 0, i32 0
  %1793 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1792, align 8
  %1794 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1793, i32 0, i32 7
  %1795 = load i32, i32* %1794, align 4
  %1796 = add i32 %1795, 1
  store i32 %1796, i32* %1794, align 4
  %1797 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1798 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1797, i32 0, i32 1
  %1799 = load i32, i32* %1798, align 8
  %1800 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1801 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1800, i32 0, i32 2
  %1802 = load i32, i32* %1801, align 4
  %1803 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1804 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1803, i32 0, i32 1
  %1805 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1804, i32 0, i32 0
  %1806 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1805, align 8
  %1807 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1806, i32 0, i32 6
  %1808 = load i32, i32* %1807, align 8
  %1809 = mul i32 %1802, %1808
  %1810 = icmp ugt i32 %1799, %1809
  br i1 %1810, label %1811, label %1816

; <label>:1811:                                   ; preds = %1789
  %1812 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1813 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1812, i32 0, i32 2
  %1814 = load i32, i32* %1813, align 4
  %1815 = add i32 %1814, 1
  store i32 %1815, i32* %1813, align 4
  br label %1816

; <label>:1816:                                   ; preds = %1811, %1789
  br label %1817

; <label>:1817:                                   ; preds = %1816, %1773
  %1818 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1819 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1818, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1819, align 8
  %1820 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1821 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1820, i32 0, i32 0
  %1822 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1821, align 8
  %1823 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1824 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1823, i32 0, i32 4
  store %struct.UT_hash_handle* %1822, %struct.UT_hash_handle** %1824, align 8
  %1825 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1826 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1825, i32 0, i32 0
  %1827 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1826, align 8
  %1828 = icmp ne %struct.UT_hash_handle* %1827, null
  br i1 %1828, label %1829, label %1835

; <label>:1829:                                   ; preds = %1817
  %1830 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1831 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1832 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1831, i32 0, i32 0
  %1833 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1832, align 8
  %1834 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1833, i32 0, i32 3
  store %struct.UT_hash_handle* %1830, %struct.UT_hash_handle** %1834, align 8
  br label %1835

; <label>:1835:                                   ; preds = %1829, %1817
  %1836 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1837 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1838 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1837, i32 0, i32 0
  store %struct.UT_hash_handle* %1836, %struct.UT_hash_handle** %1838, align 8
  %1839 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %30, align 8
  store %struct.UT_hash_handle* %1839, %struct.UT_hash_handle** %29, align 8
  br label %1753

; <label>:1840:                                   ; preds = %1753
  br label %1841

; <label>:1841:                                   ; preds = %1840
  %1842 = load i32, i32* %28, align 4
  %1843 = add i32 %1842, 1
  store i32 %1843, i32* %28, align 4
  br label %1732

; <label>:1844:                                   ; preds = %1732
  %1845 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1846 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1845, i32 0, i32 1
  %1847 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1846, i32 0, i32 0
  %1848 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1847, align 8
  %1849 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1848, i32 0, i32 0
  %1850 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1849, align 8
  %1851 = bitcast %struct.UT_hash_bucket* %1850 to i8*
  call void @free(i8* %1851) #6
  %1852 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1853 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1852, i32 0, i32 1
  %1854 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1853, i32 0, i32 0
  %1855 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1854, align 8
  %1856 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1855, i32 0, i32 1
  %1857 = load i32, i32* %1856, align 8
  %1858 = mul i32 %1857, 2
  store i32 %1858, i32* %1856, align 8
  %1859 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1860 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1859, i32 0, i32 1
  %1861 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1860, i32 0, i32 0
  %1862 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1861, align 8
  %1863 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1862, i32 0, i32 2
  %1864 = load i32, i32* %1863, align 4
  %1865 = add i32 %1864, 1
  store i32 %1865, i32* %1863, align 4
  %1866 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1867 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1868 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1867, i32 0, i32 1
  %1869 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1868, i32 0, i32 0
  %1870 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1869, align 8
  %1871 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1870, i32 0, i32 0
  store %struct.UT_hash_bucket* %1866, %struct.UT_hash_bucket** %1871, align 8
  %1872 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1873 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1872, i32 0, i32 1
  %1874 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1873, i32 0, i32 0
  %1875 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1874, align 8
  %1876 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1875, i32 0, i32 7
  %1877 = load i32, i32* %1876, align 4
  %1878 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1879 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1878, i32 0, i32 1
  %1880 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1879, i32 0, i32 0
  %1881 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1880, align 8
  %1882 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1881, i32 0, i32 3
  %1883 = load i32, i32* %1882, align 8
  %1884 = lshr i32 %1883, 1
  %1885 = icmp ugt i32 %1877, %1884
  br i1 %1885, label %1886, label %1894

; <label>:1886:                                   ; preds = %1844
  %1887 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1888 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1887, i32 0, i32 1
  %1889 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1888, i32 0, i32 0
  %1890 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1889, align 8
  %1891 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1890, i32 0, i32 8
  %1892 = load i32, i32* %1891, align 8
  %1893 = add i32 %1892, 1
  br label %1895

; <label>:1894:                                   ; preds = %1844
  br label %1895

; <label>:1895:                                   ; preds = %1894, %1886
  %1896 = phi i32 [ %1893, %1886 ], [ 0, %1894 ]
  %1897 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1898 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1897, i32 0, i32 1
  %1899 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1898, i32 0, i32 0
  %1900 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1899, align 8
  %1901 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1900, i32 0, i32 8
  store i32 %1896, i32* %1901, align 8
  %1902 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1903 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1902, i32 0, i32 1
  %1904 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1903, i32 0, i32 0
  %1905 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1904, align 8
  %1906 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1905, i32 0, i32 8
  %1907 = load i32, i32* %1906, align 8
  %1908 = icmp ugt i32 %1907, 1
  br i1 %1908, label %1909, label %1915

; <label>:1909:                                   ; preds = %1895
  %1910 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1911 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1910, i32 0, i32 1
  %1912 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1911, i32 0, i32 0
  %1913 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1912, align 8
  %1914 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1913, i32 0, i32 9
  store i32 1, i32* %1914, align 4
  br label %1915

; <label>:1915:                                   ; preds = %1909, %1895
  br label %1916

; <label>:1916:                                   ; preds = %1915
  br label %1917

; <label>:1917:                                   ; preds = %1916
  br label %1918

; <label>:1918:                                   ; preds = %1917, %1653, %1639
  br label %1919

; <label>:1919:                                   ; preds = %1918
  br label %1920

; <label>:1920:                                   ; preds = %1919
  br label %1921

; <label>:1921:                                   ; preds = %1920
  br label %1922

; <label>:1922:                                   ; preds = %1921
  br label %1924

; <label>:1923:                                   ; preds = %1045
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.34, i32 0, i32 0))
  br label %1924

; <label>:1924:                                   ; preds = %1923, %1922
  br label %1925

; <label>:1925:                                   ; preds = %1924, %1028
  br label %1926

; <label>:1926:                                   ; preds = %1925, %534, %531
  br label %1927

; <label>:1927:                                   ; preds = %1926, %530, %35
  ret void
}

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @log_return_address(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i32, i32* @initialized, align 4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %14

; <label>:5:                                      ; preds = %1
  %6 = load i8*, i8** %2, align 8
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.41, i32 0, i32 0), i8* %6)
  %8 = load i32, i32* @counter4, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @counter4, align 4
  %10 = load i32, i32* @counter4, align 4
  %11 = icmp eq i32 %10, 5
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %5
  store i32 -1, i32* @initialized, align 4
  br label %13

; <label>:13:                                     ; preds = %12, %5
  br label %14

; <label>:14:                                     ; preds = %13, %1
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.1.0 "}
