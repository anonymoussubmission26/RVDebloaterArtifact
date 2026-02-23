; ModuleID = 'req_funcs_px4.c'
source_filename = "req_funcs_px4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.FuncEntry = type { [50000 x i8], [20 x i8], %struct.UT_hash_handle, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { %struct.UT_hash_table*, i8*, i8*, %struct.UT_hash_handle*, %struct.UT_hash_handle*, i8*, i32, i32 }
%struct.UT_hash_table = type { %struct.UT_hash_bucket*, i32, i32, i32, %struct.UT_hash_handle*, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { %struct.UT_hash_handle*, i32, i32 }
%struct.LoggedAddrEntry = type { [20 x i8], %struct.UT_hash_handle }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.InstrumentationData = type { i8* }

@mode_switching = dso_local global i32 0, align 4
@allowed_functions = dso_local global %struct.FuncEntry* null, align 8
@allowed_functions_address = dso_local global %struct.FuncEntry* null, align 8
@logged_addresses = dso_local global %struct.LoggedAddrEntry* null, align 8
@curr_mode_id = dso_local global i32 0, align 4
@curr_mode_buf = dso_local global [32 x i8] c"initialized\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@new_mode_buf = dso_local global [32 x i8] c"initialized\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@curr_mode = dso_local global i8* getelementptr inbounds ([32 x i8], [32 x i8]* @curr_mode_buf, i32 0, i32 0), align 8
@new_mode = dso_local global i8* getelementptr inbounds ([32 x i8], [32 x i8]* @new_mode_buf, i32 0, i32 0), align 8
@.str = private unnamed_addr constant [36 x i8] c"New mode is equal to current mode!\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Argc==2 From %s to %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Argc==1 From %s to %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [40 x i8] c"Previous mode is %s and new mode is %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [62 x i8] c"/home/mohsen/rvd-project/RVDefender/profiles/%s_functions.txt\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.7 = private unnamed_addr constant [33 x i8] c"Error opening function list file\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"%499s %19s\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.10 = private unnamed_addr constant [30 x i8] c"Error parsing function: '%s'\0A\00", align 1
@.str.11 = private unnamed_addr constant [24 x i8] c"Memory allocation error\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"%p\00", align 1
@.str.13 = private unnamed_addr constant [12 x i8] c"initialized\00", align 1
@.str.14 = private unnamed_addr constant [75 x i8] c"/home/mohsen/rvd-project/RVDefender/profiles/access_violation_indirect.log\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.16 = private unnamed_addr constant [53 x i8] c"Indirect Call: Not allowed at address %p in mode %s\0A\00", align 1
@.str.17 = private unnamed_addr constant [25 x i8] c"Error opening log file!\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mode_entry_runtime(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca %struct.FuncEntry*, align 8
  %6 = alloca %struct.FuncEntry*, align 8
  %7 = alloca %struct.UT_hash_handle*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.UT_hash_bucket*, align 8
  %10 = alloca %struct.UT_hash_handle*, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.UT_hash_bucket*, align 8
  %13 = alloca [150 x i8], align 16
  %14 = alloca %struct._IO_FILE*, align 8
  %15 = alloca [10000 x i8], align 16
  %16 = alloca [50000 x i8], align 16
  %17 = alloca [20 x i8], align 16
  %18 = alloca i8*, align 8
  %19 = alloca %struct.FuncEntry*, align 8
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
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i8*, align 8
  %38 = alloca i32, align 4
  %39 = alloca %struct.UT_hash_bucket*, align 8
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca %struct.UT_hash_handle*, align 8
  %43 = alloca %struct.UT_hash_handle*, align 8
  %44 = alloca %struct.UT_hash_bucket*, align 8
  %45 = alloca %struct.UT_hash_bucket*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %46 = load i8*, i8** @curr_mode, align 8
  %47 = icmp ne i8* %46, null
  br i1 %47, label %48, label %60

; <label>:48:                                     ; preds = %2
  %49 = load i32, i32* %3, align 4
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %60

; <label>:51:                                     ; preds = %48
  %52 = load i8**, i8*** %4, align 8
  %53 = getelementptr inbounds i8*, i8** %52, i64 0
  %54 = load i8*, i8** %53, align 8
  %55 = load i8*, i8** @curr_mode, align 8
  %56 = call i32 @strcmp(i8* %54, i8* %55) #7
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %60, label %58

; <label>:58:                                     ; preds = %51
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i32 0, i32 0))
  br label %2304

; <label>:60:                                     ; preds = %51, %48, %2
  %61 = load i8*, i8** @curr_mode, align 8
  %62 = icmp ne i8* %61, null
  br i1 %62, label %63, label %75

; <label>:63:                                     ; preds = %60
  %64 = load i32, i32* %3, align 4
  %65 = icmp eq i32 %64, 2
  br i1 %65, label %66, label %75

; <label>:66:                                     ; preds = %63
  %67 = load i8**, i8*** %4, align 8
  %68 = getelementptr inbounds i8*, i8** %67, i64 1
  %69 = load i8*, i8** %68, align 8
  %70 = load i8*, i8** @curr_mode, align 8
  %71 = call i32 @strcmp(i8* %69, i8* %70) #7
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %75, label %73

; <label>:73:                                     ; preds = %66
  %74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str, i32 0, i32 0))
  br label %2304

; <label>:75:                                     ; preds = %66, %63, %60
  %76 = load i32, i32* %3, align 4
  %77 = icmp eq i32 %76, 2
  br i1 %77, label %78, label %94

; <label>:78:                                     ; preds = %75
  %79 = load i8*, i8** @curr_mode, align 8
  %80 = icmp ne i8* %79, null
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %78
  %82 = load i8*, i8** @curr_mode, align 8
  br label %84

; <label>:83:                                     ; preds = %78
  br label %84

; <label>:84:                                     ; preds = %83, %81
  %85 = phi i8* [ %82, %81 ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), %83 ]
  %86 = load i8**, i8*** %4, align 8
  %87 = getelementptr inbounds i8*, i8** %86, i64 1
  %88 = load i8*, i8** %87, align 8
  %89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i8* %85, i8* %88)
  %90 = load i8**, i8*** %4, align 8
  %91 = getelementptr inbounds i8*, i8** %90, i64 1
  %92 = load i8*, i8** %91, align 8
  %93 = call i8* @strncpy(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @new_mode_buf, i32 0, i32 0), i8* %92, i64 31) #8
  store i8 0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @new_mode_buf, i64 0, i64 31), align 1
  br label %110

; <label>:94:                                     ; preds = %75
  %95 = load i8*, i8** @curr_mode, align 8
  %96 = icmp ne i8* %95, null
  br i1 %96, label %97, label %99

; <label>:97:                                     ; preds = %94
  %98 = load i8*, i8** @curr_mode, align 8
  br label %100

; <label>:99:                                     ; preds = %94
  br label %100

; <label>:100:                                    ; preds = %99, %97
  %101 = phi i8* [ %98, %97 ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), %99 ]
  %102 = load i8**, i8*** %4, align 8
  %103 = getelementptr inbounds i8*, i8** %102, i64 0
  %104 = load i8*, i8** %103, align 8
  %105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i8* %101, i8* %104)
  %106 = load i8**, i8*** %4, align 8
  %107 = getelementptr inbounds i8*, i8** %106, i64 0
  %108 = load i8*, i8** %107, align 8
  %109 = call i8* @strncpy(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @new_mode_buf, i32 0, i32 0), i8* %108, i64 31) #8
  store i8 0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @new_mode_buf, i64 0, i64 31), align 1
  br label %110

; <label>:110:                                    ; preds = %100, %84
  br label %111

; <label>:111:                                    ; preds = %110
  br label %112

; <label>:112:                                    ; preds = %111
  store volatile i32 1, i32* @mode_switching, align 4
  %113 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %114 = icmp ne %struct.FuncEntry* %113, null
  br i1 %114, label %115, label %500

; <label>:115:                                    ; preds = %112
  %116 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  store %struct.FuncEntry* %116, %struct.FuncEntry** %5, align 8
  %117 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %118 = icmp ne %struct.FuncEntry* %117, null
  br i1 %118, label %119, label %124

; <label>:119:                                    ; preds = %115
  %120 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %121 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %120, i32 0, i32 2
  %122 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %121, i32 0, i32 2
  %123 = load i8*, i8** %122, align 8
  br label %125

; <label>:124:                                    ; preds = %115
  br label %125

; <label>:125:                                    ; preds = %124, %119
  %126 = phi i8* [ %123, %119 ], [ null, %124 ]
  %127 = bitcast i8* %126 to %struct.FuncEntry*
  store %struct.FuncEntry* %127, %struct.FuncEntry** %6, align 8
  br label %128

; <label>:128:                                    ; preds = %496, %125
  %129 = load %struct.FuncEntry*, %struct.FuncEntry** %5, align 8
  %130 = icmp ne %struct.FuncEntry* %129, null
  br i1 %130, label %131, label %499

; <label>:131:                                    ; preds = %128
  br label %132

; <label>:132:                                    ; preds = %131
  %133 = load %struct.FuncEntry*, %struct.FuncEntry** %5, align 8
  %134 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %133, i32 0, i32 2
  store %struct.UT_hash_handle* %134, %struct.UT_hash_handle** %7, align 8
  %135 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %136 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %135, i32 0, i32 1
  %137 = load i8*, i8** %136, align 8
  %138 = icmp eq i8* %137, null
  br i1 %138, label %139, label %157

; <label>:139:                                    ; preds = %132
  %140 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %141 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %140, i32 0, i32 2
  %142 = load i8*, i8** %141, align 8
  %143 = icmp eq i8* %142, null
  br i1 %143, label %144, label %157

; <label>:144:                                    ; preds = %139
  %145 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %146 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %145, i32 0, i32 2
  %147 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %146, i32 0, i32 0
  %148 = load %struct.UT_hash_table*, %struct.UT_hash_table** %147, align 8
  %149 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %148, i32 0, i32 0
  %150 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %149, align 8
  %151 = bitcast %struct.UT_hash_bucket* %150 to i8*
  call void @free(i8* %151) #8
  %152 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %153 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %152, i32 0, i32 2
  %154 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %153, i32 0, i32 0
  %155 = load %struct.UT_hash_table*, %struct.UT_hash_table** %154, align 8
  %156 = bitcast %struct.UT_hash_table* %155 to i8*
  call void @free(i8* %156) #8
  store %struct.FuncEntry* null, %struct.FuncEntry** @allowed_functions, align 8
  br label %306

; <label>:157:                                    ; preds = %139, %132
  %158 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %159 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %160 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %159, i32 0, i32 2
  %161 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %160, i32 0, i32 0
  %162 = load %struct.UT_hash_table*, %struct.UT_hash_table** %161, align 8
  %163 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %162, i32 0, i32 4
  %164 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %163, align 8
  %165 = icmp eq %struct.UT_hash_handle* %158, %164
  br i1 %165, label %166, label %183

; <label>:166:                                    ; preds = %157
  %167 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %168 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %167, i32 0, i32 1
  %169 = load i8*, i8** %168, align 8
  %170 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %171 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %170, i32 0, i32 2
  %172 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %171, i32 0, i32 0
  %173 = load %struct.UT_hash_table*, %struct.UT_hash_table** %172, align 8
  %174 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %173, i32 0, i32 5
  %175 = load i64, i64* %174, align 8
  %176 = getelementptr inbounds i8, i8* %169, i64 %175
  %177 = bitcast i8* %176 to %struct.UT_hash_handle*
  %178 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %179 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %178, i32 0, i32 2
  %180 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %179, i32 0, i32 0
  %181 = load %struct.UT_hash_table*, %struct.UT_hash_table** %180, align 8
  %182 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %181, i32 0, i32 4
  store %struct.UT_hash_handle* %177, %struct.UT_hash_handle** %182, align 8
  br label %183

; <label>:183:                                    ; preds = %166, %157
  %184 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %185 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %184, i32 0, i32 1
  %186 = load i8*, i8** %185, align 8
  %187 = icmp ne i8* %186, null
  br i1 %187, label %188, label %204

; <label>:188:                                    ; preds = %183
  %189 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %190 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %189, i32 0, i32 2
  %191 = load i8*, i8** %190, align 8
  %192 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %193 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %192, i32 0, i32 1
  %194 = load i8*, i8** %193, align 8
  %195 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %196 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %195, i32 0, i32 2
  %197 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %196, i32 0, i32 0
  %198 = load %struct.UT_hash_table*, %struct.UT_hash_table** %197, align 8
  %199 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %198, i32 0, i32 5
  %200 = load i64, i64* %199, align 8
  %201 = getelementptr inbounds i8, i8* %194, i64 %200
  %202 = bitcast i8* %201 to %struct.UT_hash_handle*
  %203 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %202, i32 0, i32 2
  store i8* %191, i8** %203, align 8
  br label %211

; <label>:204:                                    ; preds = %183
  br label %205

; <label>:205:                                    ; preds = %204
  %206 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %207 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %206, i32 0, i32 2
  %208 = load i8*, i8** %207, align 8
  %209 = bitcast i8* %208 to %struct.FuncEntry*
  store %struct.FuncEntry* %209, %struct.FuncEntry** @allowed_functions, align 8
  br label %210

; <label>:210:                                    ; preds = %205
  br label %211

; <label>:211:                                    ; preds = %210, %188
  %212 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %213 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %212, i32 0, i32 2
  %214 = load i8*, i8** %213, align 8
  %215 = icmp ne i8* %214, null
  br i1 %215, label %216, label %232

; <label>:216:                                    ; preds = %211
  %217 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %218 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %217, i32 0, i32 1
  %219 = load i8*, i8** %218, align 8
  %220 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %221 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %220, i32 0, i32 2
  %222 = load i8*, i8** %221, align 8
  %223 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %224 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %223, i32 0, i32 2
  %225 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %224, i32 0, i32 0
  %226 = load %struct.UT_hash_table*, %struct.UT_hash_table** %225, align 8
  %227 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %226, i32 0, i32 5
  %228 = load i64, i64* %227, align 8
  %229 = getelementptr inbounds i8, i8* %222, i64 %228
  %230 = bitcast i8* %229 to %struct.UT_hash_handle*
  %231 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %230, i32 0, i32 1
  store i8* %219, i8** %231, align 8
  br label %232

; <label>:232:                                    ; preds = %216, %211
  br label %233

; <label>:233:                                    ; preds = %232
  %234 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %235 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %234, i32 0, i32 7
  %236 = load i32, i32* %235, align 4
  %237 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %238 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %237, i32 0, i32 2
  %239 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %238, i32 0, i32 0
  %240 = load %struct.UT_hash_table*, %struct.UT_hash_table** %239, align 8
  %241 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %240, i32 0, i32 1
  %242 = load i32, i32* %241, align 8
  %243 = sub i32 %242, 1
  %244 = and i32 %236, %243
  store i32 %244, i32* %8, align 4
  br label %245

; <label>:245:                                    ; preds = %233
  br label %246

; <label>:246:                                    ; preds = %245
  %247 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %248 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %247, i32 0, i32 2
  %249 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %248, i32 0, i32 0
  %250 = load %struct.UT_hash_table*, %struct.UT_hash_table** %249, align 8
  %251 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %250, i32 0, i32 0
  %252 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %251, align 8
  %253 = load i32, i32* %8, align 4
  %254 = zext i32 %253 to i64
  %255 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %252, i64 %254
  store %struct.UT_hash_bucket* %255, %struct.UT_hash_bucket** %9, align 8
  %256 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %9, align 8
  %257 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %256, i32 0, i32 1
  %258 = load i32, i32* %257, align 8
  %259 = add i32 %258, -1
  store i32 %259, i32* %257, align 8
  %260 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %9, align 8
  %261 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %260, i32 0, i32 0
  %262 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %261, align 8
  %263 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %264 = icmp eq %struct.UT_hash_handle* %262, %263
  br i1 %264, label %265, label %271

; <label>:265:                                    ; preds = %246
  %266 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %267 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %266, i32 0, i32 4
  %268 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %267, align 8
  %269 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %9, align 8
  %270 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %269, i32 0, i32 0
  store %struct.UT_hash_handle* %268, %struct.UT_hash_handle** %270, align 8
  br label %271

; <label>:271:                                    ; preds = %265, %246
  %272 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %273 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %272, i32 0, i32 3
  %274 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %273, align 8
  %275 = icmp ne %struct.UT_hash_handle* %274, null
  br i1 %275, label %276, label %284

; <label>:276:                                    ; preds = %271
  %277 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %278 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %277, i32 0, i32 4
  %279 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %278, align 8
  %280 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %281 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %280, i32 0, i32 3
  %282 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %281, align 8
  %283 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %282, i32 0, i32 4
  store %struct.UT_hash_handle* %279, %struct.UT_hash_handle** %283, align 8
  br label %284

; <label>:284:                                    ; preds = %276, %271
  %285 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %286 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %285, i32 0, i32 4
  %287 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %286, align 8
  %288 = icmp ne %struct.UT_hash_handle* %287, null
  br i1 %288, label %289, label %297

; <label>:289:                                    ; preds = %284
  %290 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %291 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %290, i32 0, i32 3
  %292 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %291, align 8
  %293 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %7, align 8
  %294 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %293, i32 0, i32 4
  %295 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %294, align 8
  %296 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %295, i32 0, i32 3
  store %struct.UT_hash_handle* %292, %struct.UT_hash_handle** %296, align 8
  br label %297

; <label>:297:                                    ; preds = %289, %284
  br label %298

; <label>:298:                                    ; preds = %297
  %299 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %300 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %299, i32 0, i32 2
  %301 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %300, i32 0, i32 0
  %302 = load %struct.UT_hash_table*, %struct.UT_hash_table** %301, align 8
  %303 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %302, i32 0, i32 3
  %304 = load i32, i32* %303, align 8
  %305 = add i32 %304, -1
  store i32 %305, i32* %303, align 8
  br label %306

; <label>:306:                                    ; preds = %298, %144
  br label %307

; <label>:307:                                    ; preds = %306
  br label %308

; <label>:308:                                    ; preds = %307
  %309 = load %struct.FuncEntry*, %struct.FuncEntry** %5, align 8
  %310 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %309, i32 0, i32 3
  store %struct.UT_hash_handle* %310, %struct.UT_hash_handle** %10, align 8
  %311 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %312 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %311, i32 0, i32 1
  %313 = load i8*, i8** %312, align 8
  %314 = icmp eq i8* %313, null
  br i1 %314, label %315, label %333

; <label>:315:                                    ; preds = %308
  %316 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %317 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %316, i32 0, i32 2
  %318 = load i8*, i8** %317, align 8
  %319 = icmp eq i8* %318, null
  br i1 %319, label %320, label %333

; <label>:320:                                    ; preds = %315
  %321 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %322 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %321, i32 0, i32 3
  %323 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %322, i32 0, i32 0
  %324 = load %struct.UT_hash_table*, %struct.UT_hash_table** %323, align 8
  %325 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %324, i32 0, i32 0
  %326 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %325, align 8
  %327 = bitcast %struct.UT_hash_bucket* %326 to i8*
  call void @free(i8* %327) #8
  %328 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %329 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %328, i32 0, i32 3
  %330 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %329, i32 0, i32 0
  %331 = load %struct.UT_hash_table*, %struct.UT_hash_table** %330, align 8
  %332 = bitcast %struct.UT_hash_table* %331 to i8*
  call void @free(i8* %332) #8
  store %struct.FuncEntry* null, %struct.FuncEntry** @allowed_functions_address, align 8
  br label %482

; <label>:333:                                    ; preds = %315, %308
  %334 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %335 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %336 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %335, i32 0, i32 3
  %337 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %336, i32 0, i32 0
  %338 = load %struct.UT_hash_table*, %struct.UT_hash_table** %337, align 8
  %339 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %338, i32 0, i32 4
  %340 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %339, align 8
  %341 = icmp eq %struct.UT_hash_handle* %334, %340
  br i1 %341, label %342, label %359

; <label>:342:                                    ; preds = %333
  %343 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %344 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %343, i32 0, i32 1
  %345 = load i8*, i8** %344, align 8
  %346 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %347 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %346, i32 0, i32 3
  %348 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %347, i32 0, i32 0
  %349 = load %struct.UT_hash_table*, %struct.UT_hash_table** %348, align 8
  %350 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %349, i32 0, i32 5
  %351 = load i64, i64* %350, align 8
  %352 = getelementptr inbounds i8, i8* %345, i64 %351
  %353 = bitcast i8* %352 to %struct.UT_hash_handle*
  %354 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %355 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %354, i32 0, i32 3
  %356 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %355, i32 0, i32 0
  %357 = load %struct.UT_hash_table*, %struct.UT_hash_table** %356, align 8
  %358 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %357, i32 0, i32 4
  store %struct.UT_hash_handle* %353, %struct.UT_hash_handle** %358, align 8
  br label %359

; <label>:359:                                    ; preds = %342, %333
  %360 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %361 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %360, i32 0, i32 1
  %362 = load i8*, i8** %361, align 8
  %363 = icmp ne i8* %362, null
  br i1 %363, label %364, label %380

; <label>:364:                                    ; preds = %359
  %365 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %366 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %365, i32 0, i32 2
  %367 = load i8*, i8** %366, align 8
  %368 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %369 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %368, i32 0, i32 1
  %370 = load i8*, i8** %369, align 8
  %371 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %372 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %371, i32 0, i32 3
  %373 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %372, i32 0, i32 0
  %374 = load %struct.UT_hash_table*, %struct.UT_hash_table** %373, align 8
  %375 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %374, i32 0, i32 5
  %376 = load i64, i64* %375, align 8
  %377 = getelementptr inbounds i8, i8* %370, i64 %376
  %378 = bitcast i8* %377 to %struct.UT_hash_handle*
  %379 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %378, i32 0, i32 2
  store i8* %367, i8** %379, align 8
  br label %387

; <label>:380:                                    ; preds = %359
  br label %381

; <label>:381:                                    ; preds = %380
  %382 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %383 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %382, i32 0, i32 2
  %384 = load i8*, i8** %383, align 8
  %385 = bitcast i8* %384 to %struct.FuncEntry*
  store %struct.FuncEntry* %385, %struct.FuncEntry** @allowed_functions_address, align 8
  br label %386

; <label>:386:                                    ; preds = %381
  br label %387

; <label>:387:                                    ; preds = %386, %364
  %388 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %389 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %388, i32 0, i32 2
  %390 = load i8*, i8** %389, align 8
  %391 = icmp ne i8* %390, null
  br i1 %391, label %392, label %408

; <label>:392:                                    ; preds = %387
  %393 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %394 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %393, i32 0, i32 1
  %395 = load i8*, i8** %394, align 8
  %396 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %397 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %396, i32 0, i32 2
  %398 = load i8*, i8** %397, align 8
  %399 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %400 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %399, i32 0, i32 3
  %401 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %400, i32 0, i32 0
  %402 = load %struct.UT_hash_table*, %struct.UT_hash_table** %401, align 8
  %403 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %402, i32 0, i32 5
  %404 = load i64, i64* %403, align 8
  %405 = getelementptr inbounds i8, i8* %398, i64 %404
  %406 = bitcast i8* %405 to %struct.UT_hash_handle*
  %407 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %406, i32 0, i32 1
  store i8* %395, i8** %407, align 8
  br label %408

; <label>:408:                                    ; preds = %392, %387
  br label %409

; <label>:409:                                    ; preds = %408
  %410 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %411 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %410, i32 0, i32 7
  %412 = load i32, i32* %411, align 4
  %413 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %414 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %413, i32 0, i32 3
  %415 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %414, i32 0, i32 0
  %416 = load %struct.UT_hash_table*, %struct.UT_hash_table** %415, align 8
  %417 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %416, i32 0, i32 1
  %418 = load i32, i32* %417, align 8
  %419 = sub i32 %418, 1
  %420 = and i32 %412, %419
  store i32 %420, i32* %11, align 4
  br label %421

; <label>:421:                                    ; preds = %409
  br label %422

; <label>:422:                                    ; preds = %421
  %423 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %424 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %423, i32 0, i32 3
  %425 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %424, i32 0, i32 0
  %426 = load %struct.UT_hash_table*, %struct.UT_hash_table** %425, align 8
  %427 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %426, i32 0, i32 0
  %428 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %427, align 8
  %429 = load i32, i32* %11, align 4
  %430 = zext i32 %429 to i64
  %431 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %428, i64 %430
  store %struct.UT_hash_bucket* %431, %struct.UT_hash_bucket** %12, align 8
  %432 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %12, align 8
  %433 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %432, i32 0, i32 1
  %434 = load i32, i32* %433, align 8
  %435 = add i32 %434, -1
  store i32 %435, i32* %433, align 8
  %436 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %12, align 8
  %437 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %436, i32 0, i32 0
  %438 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %437, align 8
  %439 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %440 = icmp eq %struct.UT_hash_handle* %438, %439
  br i1 %440, label %441, label %447

; <label>:441:                                    ; preds = %422
  %442 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %443 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %442, i32 0, i32 4
  %444 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %443, align 8
  %445 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %12, align 8
  %446 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %445, i32 0, i32 0
  store %struct.UT_hash_handle* %444, %struct.UT_hash_handle** %446, align 8
  br label %447

; <label>:447:                                    ; preds = %441, %422
  %448 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %449 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %448, i32 0, i32 3
  %450 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %449, align 8
  %451 = icmp ne %struct.UT_hash_handle* %450, null
  br i1 %451, label %452, label %460

; <label>:452:                                    ; preds = %447
  %453 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %454 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %453, i32 0, i32 4
  %455 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %454, align 8
  %456 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %457 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %456, i32 0, i32 3
  %458 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %457, align 8
  %459 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %458, i32 0, i32 4
  store %struct.UT_hash_handle* %455, %struct.UT_hash_handle** %459, align 8
  br label %460

; <label>:460:                                    ; preds = %452, %447
  %461 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %462 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %461, i32 0, i32 4
  %463 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %462, align 8
  %464 = icmp ne %struct.UT_hash_handle* %463, null
  br i1 %464, label %465, label %473

; <label>:465:                                    ; preds = %460
  %466 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %467 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %466, i32 0, i32 3
  %468 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %467, align 8
  %469 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %10, align 8
  %470 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %469, i32 0, i32 4
  %471 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %470, align 8
  %472 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %471, i32 0, i32 3
  store %struct.UT_hash_handle* %468, %struct.UT_hash_handle** %472, align 8
  br label %473

; <label>:473:                                    ; preds = %465, %460
  br label %474

; <label>:474:                                    ; preds = %473
  %475 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %476 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %475, i32 0, i32 3
  %477 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %476, i32 0, i32 0
  %478 = load %struct.UT_hash_table*, %struct.UT_hash_table** %477, align 8
  %479 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %478, i32 0, i32 3
  %480 = load i32, i32* %479, align 8
  %481 = add i32 %480, -1
  store i32 %481, i32* %479, align 8
  br label %482

; <label>:482:                                    ; preds = %474, %320
  br label %483

; <label>:483:                                    ; preds = %482
  %484 = load %struct.FuncEntry*, %struct.FuncEntry** %5, align 8
  %485 = bitcast %struct.FuncEntry* %484 to i8*
  call void @free(i8* %485) #8
  br label %486

; <label>:486:                                    ; preds = %483
  %487 = load %struct.FuncEntry*, %struct.FuncEntry** %6, align 8
  store %struct.FuncEntry* %487, %struct.FuncEntry** %5, align 8
  %488 = load %struct.FuncEntry*, %struct.FuncEntry** %6, align 8
  %489 = icmp ne %struct.FuncEntry* %488, null
  br i1 %489, label %490, label %495

; <label>:490:                                    ; preds = %486
  %491 = load %struct.FuncEntry*, %struct.FuncEntry** %6, align 8
  %492 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %491, i32 0, i32 2
  %493 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %492, i32 0, i32 2
  %494 = load i8*, i8** %493, align 8
  br label %496

; <label>:495:                                    ; preds = %486
  br label %496

; <label>:496:                                    ; preds = %495, %490
  %497 = phi i8* [ %494, %490 ], [ null, %495 ]
  %498 = bitcast i8* %497 to %struct.FuncEntry*
  store %struct.FuncEntry* %498, %struct.FuncEntry** %6, align 8
  br label %128

; <label>:499:                                    ; preds = %128
  store %struct.FuncEntry* null, %struct.FuncEntry** @allowed_functions, align 8
  store %struct.FuncEntry* null, %struct.FuncEntry** @allowed_functions_address, align 8
  br label %500

; <label>:500:                                    ; preds = %499, %112
  %501 = load i8*, i8** @curr_mode, align 8
  %502 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.4, i32 0, i32 0), i8* %501, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @new_mode_buf, i32 0, i32 0))
  %503 = getelementptr inbounds [150 x i8], [150 x i8]* %13, i32 0, i32 0
  %504 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %503, i64 150, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([32 x i8], [32 x i8]* @new_mode_buf, i32 0, i32 0)) #8
  %505 = getelementptr inbounds [150 x i8], [150 x i8]* %13, i32 0, i32 0
  %506 = call noalias %struct._IO_FILE* @fopen(i8* %505, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %506, %struct._IO_FILE** %14, align 8
  %507 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 8
  %508 = icmp ne %struct._IO_FILE* %507, null
  br i1 %508, label %510, label %509

; <label>:509:                                    ; preds = %500
  call void @perror(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.7, i32 0, i32 0))
  br label %2304

; <label>:510:                                    ; preds = %500
  br label %511

; <label>:511:                                    ; preds = %2300, %542, %510
  %512 = getelementptr inbounds [10000 x i8], [10000 x i8]* %15, i32 0, i32 0
  %513 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 8
  %514 = call i8* @fgets(i8* %512, i32 10000, %struct._IO_FILE* %513)
  %515 = icmp ne i8* %514, null
  br i1 %515, label %516, label %2301

; <label>:516:                                    ; preds = %511
  %517 = getelementptr inbounds [10000 x i8], [10000 x i8]* %15, i32 0, i32 0
  %518 = call i64 @strcspn(i8* %517, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0)) #7
  %519 = getelementptr inbounds [10000 x i8], [10000 x i8]* %15, i64 0, i64 %518
  store i8 0, i8* %519, align 1
  %520 = getelementptr inbounds [10000 x i8], [10000 x i8]* %15, i32 0, i32 0
  store i8* %520, i8** %18, align 8
  br label %521

; <label>:521:                                    ; preds = %533, %516
  %522 = load i8*, i8** %18, align 8
  %523 = load i8, i8* %522, align 1
  %524 = sext i8 %523 to i32
  %525 = icmp eq i32 %524, 32
  br i1 %525, label %531, label %526

; <label>:526:                                    ; preds = %521
  %527 = load i8*, i8** %18, align 8
  %528 = load i8, i8* %527, align 1
  %529 = sext i8 %528 to i32
  %530 = icmp eq i32 %529, 9
  br label %531

; <label>:531:                                    ; preds = %526, %521
  %532 = phi i1 [ true, %521 ], [ %530, %526 ]
  br i1 %532, label %533, label %536

; <label>:533:                                    ; preds = %531
  %534 = load i8*, i8** %18, align 8
  %535 = getelementptr inbounds i8, i8* %534, i32 1
  store i8* %535, i8** %18, align 8
  br label %521

; <label>:536:                                    ; preds = %531
  %537 = load i8*, i8** %18, align 8
  %538 = getelementptr inbounds [50000 x i8], [50000 x i8]* %16, i32 0, i32 0
  %539 = getelementptr inbounds [20 x i8], [20 x i8]* %17, i32 0, i32 0
  %540 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %537, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i32 0, i32 0), i8* %538, i8* %539) #8
  %541 = icmp ne i32 %540, 2
  br i1 %541, label %542, label %546

; <label>:542:                                    ; preds = %536
  %543 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %544 = load i8*, i8** %18, align 8
  %545 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %543, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i32 0, i32 0), i8* %544)
  br label %511

; <label>:546:                                    ; preds = %536
  %547 = call noalias i8* @malloc(i64 50136) #8
  %548 = bitcast i8* %547 to %struct.FuncEntry*
  store %struct.FuncEntry* %548, %struct.FuncEntry** %19, align 8
  %549 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %550 = icmp ne %struct.FuncEntry* %549, null
  br i1 %550, label %554, label %551

; <label>:551:                                    ; preds = %546
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i32 0, i32 0))
  %552 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 8
  %553 = call i32 @fclose(%struct._IO_FILE* %552)
  br label %2304

; <label>:554:                                    ; preds = %546
  %555 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %556 = bitcast %struct.FuncEntry* %555 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %556, i8 0, i64 50136, i1 false)
  %557 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %558 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %557, i32 0, i32 0
  %559 = getelementptr inbounds [50000 x i8], [50000 x i8]* %558, i32 0, i32 0
  %560 = getelementptr inbounds [50000 x i8], [50000 x i8]* %16, i32 0, i32 0
  %561 = call i8* @strncpy(i8* %559, i8* %560, i64 49999) #8
  %562 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %563 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %562, i32 0, i32 1
  %564 = getelementptr inbounds [20 x i8], [20 x i8]* %563, i32 0, i32 0
  %565 = getelementptr inbounds [20 x i8], [20 x i8]* %17, i32 0, i32 0
  %566 = call i8* @strncpy(i8* %564, i8* %565, i64 19) #8
  br label %567

; <label>:567:                                    ; preds = %554
  br label %568

; <label>:568:                                    ; preds = %567
  br label %569

; <label>:569:                                    ; preds = %568
  %570 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %571 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %570, i32 0, i32 0
  %572 = bitcast [50000 x i8]* %571 to i8*
  store i8* %572, i8** %24, align 8
  store i32 -17973521, i32* %20, align 4
  store i32 -1640531527, i32* %22, align 4
  store i32 -1640531527, i32* %21, align 4
  %573 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %574 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %573, i32 0, i32 0
  %575 = getelementptr inbounds [50000 x i8], [50000 x i8]* %574, i32 0, i32 0
  %576 = call i64 @strlen(i8* %575) #7
  %577 = trunc i64 %576 to i32
  store i32 %577, i32* %23, align 4
  br label %578

; <label>:578:                                    ; preds = %745, %569
  %579 = load i32, i32* %23, align 4
  %580 = icmp uge i32 %579, 12
  br i1 %580, label %581, label %750

; <label>:581:                                    ; preds = %578
  %582 = load i8*, i8** %24, align 8
  %583 = getelementptr inbounds i8, i8* %582, i64 0
  %584 = load i8, i8* %583, align 1
  %585 = zext i8 %584 to i32
  %586 = load i8*, i8** %24, align 8
  %587 = getelementptr inbounds i8, i8* %586, i64 1
  %588 = load i8, i8* %587, align 1
  %589 = zext i8 %588 to i32
  %590 = shl i32 %589, 8
  %591 = add i32 %585, %590
  %592 = load i8*, i8** %24, align 8
  %593 = getelementptr inbounds i8, i8* %592, i64 2
  %594 = load i8, i8* %593, align 1
  %595 = zext i8 %594 to i32
  %596 = shl i32 %595, 16
  %597 = add i32 %591, %596
  %598 = load i8*, i8** %24, align 8
  %599 = getelementptr inbounds i8, i8* %598, i64 3
  %600 = load i8, i8* %599, align 1
  %601 = zext i8 %600 to i32
  %602 = shl i32 %601, 24
  %603 = add i32 %597, %602
  %604 = load i32, i32* %21, align 4
  %605 = add i32 %604, %603
  store i32 %605, i32* %21, align 4
  %606 = load i8*, i8** %24, align 8
  %607 = getelementptr inbounds i8, i8* %606, i64 4
  %608 = load i8, i8* %607, align 1
  %609 = zext i8 %608 to i32
  %610 = load i8*, i8** %24, align 8
  %611 = getelementptr inbounds i8, i8* %610, i64 5
  %612 = load i8, i8* %611, align 1
  %613 = zext i8 %612 to i32
  %614 = shl i32 %613, 8
  %615 = add i32 %609, %614
  %616 = load i8*, i8** %24, align 8
  %617 = getelementptr inbounds i8, i8* %616, i64 6
  %618 = load i8, i8* %617, align 1
  %619 = zext i8 %618 to i32
  %620 = shl i32 %619, 16
  %621 = add i32 %615, %620
  %622 = load i8*, i8** %24, align 8
  %623 = getelementptr inbounds i8, i8* %622, i64 7
  %624 = load i8, i8* %623, align 1
  %625 = zext i8 %624 to i32
  %626 = shl i32 %625, 24
  %627 = add i32 %621, %626
  %628 = load i32, i32* %22, align 4
  %629 = add i32 %628, %627
  store i32 %629, i32* %22, align 4
  %630 = load i8*, i8** %24, align 8
  %631 = getelementptr inbounds i8, i8* %630, i64 8
  %632 = load i8, i8* %631, align 1
  %633 = zext i8 %632 to i32
  %634 = load i8*, i8** %24, align 8
  %635 = getelementptr inbounds i8, i8* %634, i64 9
  %636 = load i8, i8* %635, align 1
  %637 = zext i8 %636 to i32
  %638 = shl i32 %637, 8
  %639 = add i32 %633, %638
  %640 = load i8*, i8** %24, align 8
  %641 = getelementptr inbounds i8, i8* %640, i64 10
  %642 = load i8, i8* %641, align 1
  %643 = zext i8 %642 to i32
  %644 = shl i32 %643, 16
  %645 = add i32 %639, %644
  %646 = load i8*, i8** %24, align 8
  %647 = getelementptr inbounds i8, i8* %646, i64 11
  %648 = load i8, i8* %647, align 1
  %649 = zext i8 %648 to i32
  %650 = shl i32 %649, 24
  %651 = add i32 %645, %650
  %652 = load i32, i32* %20, align 4
  %653 = add i32 %652, %651
  store i32 %653, i32* %20, align 4
  br label %654

; <label>:654:                                    ; preds = %581
  %655 = load i32, i32* %22, align 4
  %656 = load i32, i32* %21, align 4
  %657 = sub i32 %656, %655
  store i32 %657, i32* %21, align 4
  %658 = load i32, i32* %20, align 4
  %659 = load i32, i32* %21, align 4
  %660 = sub i32 %659, %658
  store i32 %660, i32* %21, align 4
  %661 = load i32, i32* %20, align 4
  %662 = lshr i32 %661, 13
  %663 = load i32, i32* %21, align 4
  %664 = xor i32 %663, %662
  store i32 %664, i32* %21, align 4
  %665 = load i32, i32* %20, align 4
  %666 = load i32, i32* %22, align 4
  %667 = sub i32 %666, %665
  store i32 %667, i32* %22, align 4
  %668 = load i32, i32* %21, align 4
  %669 = load i32, i32* %22, align 4
  %670 = sub i32 %669, %668
  store i32 %670, i32* %22, align 4
  %671 = load i32, i32* %21, align 4
  %672 = shl i32 %671, 8
  %673 = load i32, i32* %22, align 4
  %674 = xor i32 %673, %672
  store i32 %674, i32* %22, align 4
  %675 = load i32, i32* %21, align 4
  %676 = load i32, i32* %20, align 4
  %677 = sub i32 %676, %675
  store i32 %677, i32* %20, align 4
  %678 = load i32, i32* %22, align 4
  %679 = load i32, i32* %20, align 4
  %680 = sub i32 %679, %678
  store i32 %680, i32* %20, align 4
  %681 = load i32, i32* %22, align 4
  %682 = lshr i32 %681, 13
  %683 = load i32, i32* %20, align 4
  %684 = xor i32 %683, %682
  store i32 %684, i32* %20, align 4
  %685 = load i32, i32* %22, align 4
  %686 = load i32, i32* %21, align 4
  %687 = sub i32 %686, %685
  store i32 %687, i32* %21, align 4
  %688 = load i32, i32* %20, align 4
  %689 = load i32, i32* %21, align 4
  %690 = sub i32 %689, %688
  store i32 %690, i32* %21, align 4
  %691 = load i32, i32* %20, align 4
  %692 = lshr i32 %691, 12
  %693 = load i32, i32* %21, align 4
  %694 = xor i32 %693, %692
  store i32 %694, i32* %21, align 4
  %695 = load i32, i32* %20, align 4
  %696 = load i32, i32* %22, align 4
  %697 = sub i32 %696, %695
  store i32 %697, i32* %22, align 4
  %698 = load i32, i32* %21, align 4
  %699 = load i32, i32* %22, align 4
  %700 = sub i32 %699, %698
  store i32 %700, i32* %22, align 4
  %701 = load i32, i32* %21, align 4
  %702 = shl i32 %701, 16
  %703 = load i32, i32* %22, align 4
  %704 = xor i32 %703, %702
  store i32 %704, i32* %22, align 4
  %705 = load i32, i32* %21, align 4
  %706 = load i32, i32* %20, align 4
  %707 = sub i32 %706, %705
  store i32 %707, i32* %20, align 4
  %708 = load i32, i32* %22, align 4
  %709 = load i32, i32* %20, align 4
  %710 = sub i32 %709, %708
  store i32 %710, i32* %20, align 4
  %711 = load i32, i32* %22, align 4
  %712 = lshr i32 %711, 5
  %713 = load i32, i32* %20, align 4
  %714 = xor i32 %713, %712
  store i32 %714, i32* %20, align 4
  %715 = load i32, i32* %22, align 4
  %716 = load i32, i32* %21, align 4
  %717 = sub i32 %716, %715
  store i32 %717, i32* %21, align 4
  %718 = load i32, i32* %20, align 4
  %719 = load i32, i32* %21, align 4
  %720 = sub i32 %719, %718
  store i32 %720, i32* %21, align 4
  %721 = load i32, i32* %20, align 4
  %722 = lshr i32 %721, 3
  %723 = load i32, i32* %21, align 4
  %724 = xor i32 %723, %722
  store i32 %724, i32* %21, align 4
  %725 = load i32, i32* %20, align 4
  %726 = load i32, i32* %22, align 4
  %727 = sub i32 %726, %725
  store i32 %727, i32* %22, align 4
  %728 = load i32, i32* %21, align 4
  %729 = load i32, i32* %22, align 4
  %730 = sub i32 %729, %728
  store i32 %730, i32* %22, align 4
  %731 = load i32, i32* %21, align 4
  %732 = shl i32 %731, 10
  %733 = load i32, i32* %22, align 4
  %734 = xor i32 %733, %732
  store i32 %734, i32* %22, align 4
  %735 = load i32, i32* %21, align 4
  %736 = load i32, i32* %20, align 4
  %737 = sub i32 %736, %735
  store i32 %737, i32* %20, align 4
  %738 = load i32, i32* %22, align 4
  %739 = load i32, i32* %20, align 4
  %740 = sub i32 %739, %738
  store i32 %740, i32* %20, align 4
  %741 = load i32, i32* %22, align 4
  %742 = lshr i32 %741, 15
  %743 = load i32, i32* %20, align 4
  %744 = xor i32 %743, %742
  store i32 %744, i32* %20, align 4
  br label %745

; <label>:745:                                    ; preds = %654
  %746 = load i8*, i8** %24, align 8
  %747 = getelementptr inbounds i8, i8* %746, i64 12
  store i8* %747, i8** %24, align 8
  %748 = load i32, i32* %23, align 4
  %749 = sub i32 %748, 12
  store i32 %749, i32* %23, align 4
  br label %578

; <label>:750:                                    ; preds = %578
  %751 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %752 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %751, i32 0, i32 0
  %753 = getelementptr inbounds [50000 x i8], [50000 x i8]* %752, i32 0, i32 0
  %754 = call i64 @strlen(i8* %753) #7
  %755 = trunc i64 %754 to i32
  %756 = load i32, i32* %20, align 4
  %757 = add i32 %756, %755
  store i32 %757, i32* %20, align 4
  %758 = load i32, i32* %23, align 4
  switch i32 %758, label %845 [
    i32 11, label %759
    i32 10, label %767
    i32 9, label %775
    i32 8, label %783
    i32 7, label %791
    i32 6, label %799
    i32 5, label %807
    i32 4, label %814
    i32 3, label %822
    i32 2, label %830
    i32 1, label %838
  ]

; <label>:759:                                    ; preds = %750
  %760 = load i8*, i8** %24, align 8
  %761 = getelementptr inbounds i8, i8* %760, i64 10
  %762 = load i8, i8* %761, align 1
  %763 = zext i8 %762 to i32
  %764 = shl i32 %763, 24
  %765 = load i32, i32* %20, align 4
  %766 = add i32 %765, %764
  store i32 %766, i32* %20, align 4
  br label %767

; <label>:767:                                    ; preds = %750, %759
  %768 = load i8*, i8** %24, align 8
  %769 = getelementptr inbounds i8, i8* %768, i64 9
  %770 = load i8, i8* %769, align 1
  %771 = zext i8 %770 to i32
  %772 = shl i32 %771, 16
  %773 = load i32, i32* %20, align 4
  %774 = add i32 %773, %772
  store i32 %774, i32* %20, align 4
  br label %775

; <label>:775:                                    ; preds = %750, %767
  %776 = load i8*, i8** %24, align 8
  %777 = getelementptr inbounds i8, i8* %776, i64 8
  %778 = load i8, i8* %777, align 1
  %779 = zext i8 %778 to i32
  %780 = shl i32 %779, 8
  %781 = load i32, i32* %20, align 4
  %782 = add i32 %781, %780
  store i32 %782, i32* %20, align 4
  br label %783

; <label>:783:                                    ; preds = %750, %775
  %784 = load i8*, i8** %24, align 8
  %785 = getelementptr inbounds i8, i8* %784, i64 7
  %786 = load i8, i8* %785, align 1
  %787 = zext i8 %786 to i32
  %788 = shl i32 %787, 24
  %789 = load i32, i32* %22, align 4
  %790 = add i32 %789, %788
  store i32 %790, i32* %22, align 4
  br label %791

; <label>:791:                                    ; preds = %750, %783
  %792 = load i8*, i8** %24, align 8
  %793 = getelementptr inbounds i8, i8* %792, i64 6
  %794 = load i8, i8* %793, align 1
  %795 = zext i8 %794 to i32
  %796 = shl i32 %795, 16
  %797 = load i32, i32* %22, align 4
  %798 = add i32 %797, %796
  store i32 %798, i32* %22, align 4
  br label %799

; <label>:799:                                    ; preds = %750, %791
  %800 = load i8*, i8** %24, align 8
  %801 = getelementptr inbounds i8, i8* %800, i64 5
  %802 = load i8, i8* %801, align 1
  %803 = zext i8 %802 to i32
  %804 = shl i32 %803, 8
  %805 = load i32, i32* %22, align 4
  %806 = add i32 %805, %804
  store i32 %806, i32* %22, align 4
  br label %807

; <label>:807:                                    ; preds = %750, %799
  %808 = load i8*, i8** %24, align 8
  %809 = getelementptr inbounds i8, i8* %808, i64 4
  %810 = load i8, i8* %809, align 1
  %811 = zext i8 %810 to i32
  %812 = load i32, i32* %22, align 4
  %813 = add i32 %812, %811
  store i32 %813, i32* %22, align 4
  br label %814

; <label>:814:                                    ; preds = %750, %807
  %815 = load i8*, i8** %24, align 8
  %816 = getelementptr inbounds i8, i8* %815, i64 3
  %817 = load i8, i8* %816, align 1
  %818 = zext i8 %817 to i32
  %819 = shl i32 %818, 24
  %820 = load i32, i32* %21, align 4
  %821 = add i32 %820, %819
  store i32 %821, i32* %21, align 4
  br label %822

; <label>:822:                                    ; preds = %750, %814
  %823 = load i8*, i8** %24, align 8
  %824 = getelementptr inbounds i8, i8* %823, i64 2
  %825 = load i8, i8* %824, align 1
  %826 = zext i8 %825 to i32
  %827 = shl i32 %826, 16
  %828 = load i32, i32* %21, align 4
  %829 = add i32 %828, %827
  store i32 %829, i32* %21, align 4
  br label %830

; <label>:830:                                    ; preds = %750, %822
  %831 = load i8*, i8** %24, align 8
  %832 = getelementptr inbounds i8, i8* %831, i64 1
  %833 = load i8, i8* %832, align 1
  %834 = zext i8 %833 to i32
  %835 = shl i32 %834, 8
  %836 = load i32, i32* %21, align 4
  %837 = add i32 %836, %835
  store i32 %837, i32* %21, align 4
  br label %838

; <label>:838:                                    ; preds = %750, %830
  %839 = load i8*, i8** %24, align 8
  %840 = getelementptr inbounds i8, i8* %839, i64 0
  %841 = load i8, i8* %840, align 1
  %842 = zext i8 %841 to i32
  %843 = load i32, i32* %21, align 4
  %844 = add i32 %843, %842
  store i32 %844, i32* %21, align 4
  br label %845

; <label>:845:                                    ; preds = %750, %838
  br label %846

; <label>:846:                                    ; preds = %845
  br label %847

; <label>:847:                                    ; preds = %846
  %848 = load i32, i32* %22, align 4
  %849 = load i32, i32* %21, align 4
  %850 = sub i32 %849, %848
  store i32 %850, i32* %21, align 4
  %851 = load i32, i32* %20, align 4
  %852 = load i32, i32* %21, align 4
  %853 = sub i32 %852, %851
  store i32 %853, i32* %21, align 4
  %854 = load i32, i32* %20, align 4
  %855 = lshr i32 %854, 13
  %856 = load i32, i32* %21, align 4
  %857 = xor i32 %856, %855
  store i32 %857, i32* %21, align 4
  %858 = load i32, i32* %20, align 4
  %859 = load i32, i32* %22, align 4
  %860 = sub i32 %859, %858
  store i32 %860, i32* %22, align 4
  %861 = load i32, i32* %21, align 4
  %862 = load i32, i32* %22, align 4
  %863 = sub i32 %862, %861
  store i32 %863, i32* %22, align 4
  %864 = load i32, i32* %21, align 4
  %865 = shl i32 %864, 8
  %866 = load i32, i32* %22, align 4
  %867 = xor i32 %866, %865
  store i32 %867, i32* %22, align 4
  %868 = load i32, i32* %21, align 4
  %869 = load i32, i32* %20, align 4
  %870 = sub i32 %869, %868
  store i32 %870, i32* %20, align 4
  %871 = load i32, i32* %22, align 4
  %872 = load i32, i32* %20, align 4
  %873 = sub i32 %872, %871
  store i32 %873, i32* %20, align 4
  %874 = load i32, i32* %22, align 4
  %875 = lshr i32 %874, 13
  %876 = load i32, i32* %20, align 4
  %877 = xor i32 %876, %875
  store i32 %877, i32* %20, align 4
  %878 = load i32, i32* %22, align 4
  %879 = load i32, i32* %21, align 4
  %880 = sub i32 %879, %878
  store i32 %880, i32* %21, align 4
  %881 = load i32, i32* %20, align 4
  %882 = load i32, i32* %21, align 4
  %883 = sub i32 %882, %881
  store i32 %883, i32* %21, align 4
  %884 = load i32, i32* %20, align 4
  %885 = lshr i32 %884, 12
  %886 = load i32, i32* %21, align 4
  %887 = xor i32 %886, %885
  store i32 %887, i32* %21, align 4
  %888 = load i32, i32* %20, align 4
  %889 = load i32, i32* %22, align 4
  %890 = sub i32 %889, %888
  store i32 %890, i32* %22, align 4
  %891 = load i32, i32* %21, align 4
  %892 = load i32, i32* %22, align 4
  %893 = sub i32 %892, %891
  store i32 %893, i32* %22, align 4
  %894 = load i32, i32* %21, align 4
  %895 = shl i32 %894, 16
  %896 = load i32, i32* %22, align 4
  %897 = xor i32 %896, %895
  store i32 %897, i32* %22, align 4
  %898 = load i32, i32* %21, align 4
  %899 = load i32, i32* %20, align 4
  %900 = sub i32 %899, %898
  store i32 %900, i32* %20, align 4
  %901 = load i32, i32* %22, align 4
  %902 = load i32, i32* %20, align 4
  %903 = sub i32 %902, %901
  store i32 %903, i32* %20, align 4
  %904 = load i32, i32* %22, align 4
  %905 = lshr i32 %904, 5
  %906 = load i32, i32* %20, align 4
  %907 = xor i32 %906, %905
  store i32 %907, i32* %20, align 4
  %908 = load i32, i32* %22, align 4
  %909 = load i32, i32* %21, align 4
  %910 = sub i32 %909, %908
  store i32 %910, i32* %21, align 4
  %911 = load i32, i32* %20, align 4
  %912 = load i32, i32* %21, align 4
  %913 = sub i32 %912, %911
  store i32 %913, i32* %21, align 4
  %914 = load i32, i32* %20, align 4
  %915 = lshr i32 %914, 3
  %916 = load i32, i32* %21, align 4
  %917 = xor i32 %916, %915
  store i32 %917, i32* %21, align 4
  %918 = load i32, i32* %20, align 4
  %919 = load i32, i32* %22, align 4
  %920 = sub i32 %919, %918
  store i32 %920, i32* %22, align 4
  %921 = load i32, i32* %21, align 4
  %922 = load i32, i32* %22, align 4
  %923 = sub i32 %922, %921
  store i32 %923, i32* %22, align 4
  %924 = load i32, i32* %21, align 4
  %925 = shl i32 %924, 10
  %926 = load i32, i32* %22, align 4
  %927 = xor i32 %926, %925
  store i32 %927, i32* %22, align 4
  %928 = load i32, i32* %21, align 4
  %929 = load i32, i32* %20, align 4
  %930 = sub i32 %929, %928
  store i32 %930, i32* %20, align 4
  %931 = load i32, i32* %22, align 4
  %932 = load i32, i32* %20, align 4
  %933 = sub i32 %932, %931
  store i32 %933, i32* %20, align 4
  %934 = load i32, i32* %22, align 4
  %935 = lshr i32 %934, 15
  %936 = load i32, i32* %20, align 4
  %937 = xor i32 %936, %935
  store i32 %937, i32* %20, align 4
  br label %938

; <label>:938:                                    ; preds = %847
  br label %939

; <label>:939:                                    ; preds = %938
  br label %940

; <label>:940:                                    ; preds = %939
  br label %941

; <label>:941:                                    ; preds = %940
  %942 = load i32, i32* %20, align 4
  %943 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %944 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %943, i32 0, i32 2
  %945 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %944, i32 0, i32 7
  store i32 %942, i32* %945, align 4
  %946 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %947 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %946, i32 0, i32 0
  %948 = bitcast [50000 x i8]* %947 to i8*
  %949 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %950 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %949, i32 0, i32 2
  %951 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %950, i32 0, i32 5
  store i8* %948, i8** %951, align 8
  %952 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %953 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %952, i32 0, i32 0
  %954 = getelementptr inbounds [50000 x i8], [50000 x i8]* %953, i32 0, i32 0
  %955 = call i64 @strlen(i8* %954) #7
  %956 = trunc i64 %955 to i32
  %957 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %958 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %957, i32 0, i32 2
  %959 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %958, i32 0, i32 6
  store i32 %956, i32* %959, align 8
  %960 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %961 = icmp ne %struct.FuncEntry* %960, null
  br i1 %961, label %1049, label %962

; <label>:962:                                    ; preds = %941
  %963 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %964 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %963, i32 0, i32 2
  %965 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %964, i32 0, i32 2
  store i8* null, i8** %965, align 8
  %966 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %967 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %966, i32 0, i32 2
  %968 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %967, i32 0, i32 1
  store i8* null, i8** %968, align 8
  br label %969

; <label>:969:                                    ; preds = %962
  %970 = call noalias i8* @malloc(i64 64) #8
  %971 = bitcast i8* %970 to %struct.UT_hash_table*
  %972 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %973 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %972, i32 0, i32 2
  %974 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %973, i32 0, i32 0
  store %struct.UT_hash_table* %971, %struct.UT_hash_table** %974, align 8
  %975 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %976 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %975, i32 0, i32 2
  %977 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %976, i32 0, i32 0
  %978 = load %struct.UT_hash_table*, %struct.UT_hash_table** %977, align 8
  %979 = icmp ne %struct.UT_hash_table* %978, null
  br i1 %979, label %981, label %980

; <label>:980:                                    ; preds = %969
  call void @exit(i32 -1) #9
  unreachable

; <label>:981:                                    ; preds = %969
  %982 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %983 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %982, i32 0, i32 2
  %984 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %983, i32 0, i32 0
  %985 = load %struct.UT_hash_table*, %struct.UT_hash_table** %984, align 8
  %986 = bitcast %struct.UT_hash_table* %985 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %986, i8 0, i64 64, i1 false)
  %987 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %988 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %987, i32 0, i32 2
  %989 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %990 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %989, i32 0, i32 2
  %991 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %990, i32 0, i32 0
  %992 = load %struct.UT_hash_table*, %struct.UT_hash_table** %991, align 8
  %993 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %992, i32 0, i32 4
  store %struct.UT_hash_handle* %988, %struct.UT_hash_handle** %993, align 8
  %994 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %995 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %994, i32 0, i32 2
  %996 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %995, i32 0, i32 0
  %997 = load %struct.UT_hash_table*, %struct.UT_hash_table** %996, align 8
  %998 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %997, i32 0, i32 1
  store i32 32, i32* %998, align 8
  %999 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1000 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %999, i32 0, i32 2
  %1001 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1000, i32 0, i32 0
  %1002 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1001, align 8
  %1003 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1002, i32 0, i32 2
  store i32 5, i32* %1003, align 4
  %1004 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1005 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1004, i32 0, i32 2
  %1006 = bitcast %struct.UT_hash_handle* %1005 to i8*
  %1007 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1008 = bitcast %struct.FuncEntry* %1007 to i8*
  %1009 = ptrtoint i8* %1006 to i64
  %1010 = ptrtoint i8* %1008 to i64
  %1011 = sub i64 %1009, %1010
  %1012 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1013 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1012, i32 0, i32 2
  %1014 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1013, i32 0, i32 0
  %1015 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1014, align 8
  %1016 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1015, i32 0, i32 5
  store i64 %1011, i64* %1016, align 8
  %1017 = call noalias i8* @malloc(i64 512) #8
  %1018 = bitcast i8* %1017 to %struct.UT_hash_bucket*
  %1019 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1020 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1019, i32 0, i32 2
  %1021 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1020, i32 0, i32 0
  %1022 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1021, align 8
  %1023 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1022, i32 0, i32 0
  store %struct.UT_hash_bucket* %1018, %struct.UT_hash_bucket** %1023, align 8
  %1024 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1025 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1024, i32 0, i32 2
  %1026 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1025, i32 0, i32 0
  %1027 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1026, align 8
  %1028 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1027, i32 0, i32 10
  store i32 -1609490463, i32* %1028, align 8
  %1029 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1030 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1029, i32 0, i32 2
  %1031 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1030, i32 0, i32 0
  %1032 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1031, align 8
  %1033 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1032, i32 0, i32 0
  %1034 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1033, align 8
  %1035 = icmp ne %struct.UT_hash_bucket* %1034, null
  br i1 %1035, label %1037, label %1036

; <label>:1036:                                   ; preds = %981
  call void @exit(i32 -1) #9
  unreachable

; <label>:1037:                                   ; preds = %981
  %1038 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1039 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1038, i32 0, i32 2
  %1040 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1039, i32 0, i32 0
  %1041 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1040, align 8
  %1042 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1041, i32 0, i32 0
  %1043 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1042, align 8
  %1044 = bitcast %struct.UT_hash_bucket* %1043 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1044, i8 0, i64 512, i1 false)
  br label %1045

; <label>:1045:                                   ; preds = %1037
  br label %1046

; <label>:1046:                                   ; preds = %1045
  br label %1047

; <label>:1047:                                   ; preds = %1046
  %1048 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  store %struct.FuncEntry* %1048, %struct.FuncEntry** @allowed_functions, align 8
  br label %1096

; <label>:1049:                                   ; preds = %941
  %1050 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1051 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1050, i32 0, i32 2
  %1052 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1051, i32 0, i32 0
  %1053 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1052, align 8
  %1054 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1055 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1054, i32 0, i32 2
  %1056 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1055, i32 0, i32 0
  store %struct.UT_hash_table* %1053, %struct.UT_hash_table** %1056, align 8
  br label %1057

; <label>:1057:                                   ; preds = %1049
  %1058 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1059 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1058, i32 0, i32 2
  %1060 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1059, i32 0, i32 2
  store i8* null, i8** %1060, align 8
  %1061 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1062 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1061, i32 0, i32 2
  %1063 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1062, i32 0, i32 0
  %1064 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1063, align 8
  %1065 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1064, i32 0, i32 4
  %1066 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1065, align 8
  %1067 = bitcast %struct.UT_hash_handle* %1066 to i8*
  %1068 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1069 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1068, i32 0, i32 2
  %1070 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1069, i32 0, i32 0
  %1071 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1070, align 8
  %1072 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1071, i32 0, i32 5
  %1073 = load i64, i64* %1072, align 8
  %1074 = sub i64 0, %1073
  %1075 = getelementptr inbounds i8, i8* %1067, i64 %1074
  %1076 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1077 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1076, i32 0, i32 2
  %1078 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1077, i32 0, i32 1
  store i8* %1075, i8** %1078, align 8
  %1079 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1080 = bitcast %struct.FuncEntry* %1079 to i8*
  %1081 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1082 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1081, i32 0, i32 2
  %1083 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1082, i32 0, i32 0
  %1084 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1083, align 8
  %1085 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1084, i32 0, i32 4
  %1086 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1085, align 8
  %1087 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1086, i32 0, i32 2
  store i8* %1080, i8** %1087, align 8
  %1088 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1089 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1088, i32 0, i32 2
  %1090 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1091 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1090, i32 0, i32 2
  %1092 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1091, i32 0, i32 0
  %1093 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1092, align 8
  %1094 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1093, i32 0, i32 4
  store %struct.UT_hash_handle* %1089, %struct.UT_hash_handle** %1094, align 8
  br label %1095

; <label>:1095:                                   ; preds = %1057
  br label %1096

; <label>:1096:                                   ; preds = %1095, %1047
  br label %1097

; <label>:1097:                                   ; preds = %1096
  %1098 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1099 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1098, i32 0, i32 2
  %1100 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1099, i32 0, i32 0
  %1101 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1100, align 8
  %1102 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1101, i32 0, i32 3
  %1103 = load i32, i32* %1102, align 8
  %1104 = add i32 %1103, 1
  store i32 %1104, i32* %1102, align 8
  br label %1105

; <label>:1105:                                   ; preds = %1097
  %1106 = load i32, i32* %20, align 4
  %1107 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1108 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1107, i32 0, i32 2
  %1109 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1108, i32 0, i32 0
  %1110 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1109, align 8
  %1111 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1110, i32 0, i32 1
  %1112 = load i32, i32* %1111, align 8
  %1113 = sub i32 %1112, 1
  %1114 = and i32 %1106, %1113
  store i32 %1114, i32* %25, align 4
  br label %1115

; <label>:1115:                                   ; preds = %1105
  br label %1116

; <label>:1116:                                   ; preds = %1115
  %1117 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions, align 8
  %1118 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1117, i32 0, i32 2
  %1119 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1118, i32 0, i32 0
  %1120 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1119, align 8
  %1121 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1120, i32 0, i32 0
  %1122 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1121, align 8
  %1123 = load i32, i32* %25, align 4
  %1124 = zext i32 %1123 to i64
  %1125 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1122, i64 %1124
  store %struct.UT_hash_bucket* %1125, %struct.UT_hash_bucket** %26, align 8
  %1126 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1127 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1126, i32 0, i32 1
  %1128 = load i32, i32* %1127, align 8
  %1129 = add i32 %1128, 1
  store i32 %1129, i32* %1127, align 8
  %1130 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1131 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1130, i32 0, i32 0
  %1132 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1131, align 8
  %1133 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1134 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1133, i32 0, i32 2
  %1135 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1134, i32 0, i32 4
  store %struct.UT_hash_handle* %1132, %struct.UT_hash_handle** %1135, align 8
  %1136 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1137 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1136, i32 0, i32 2
  %1138 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1137, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1138, align 8
  %1139 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1140 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1139, i32 0, i32 0
  %1141 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1140, align 8
  %1142 = icmp ne %struct.UT_hash_handle* %1141, null
  br i1 %1142, label %1143, label %1150

; <label>:1143:                                   ; preds = %1116
  %1144 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1145 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1144, i32 0, i32 2
  %1146 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1147 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1146, i32 0, i32 0
  %1148 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1147, align 8
  %1149 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1148, i32 0, i32 3
  store %struct.UT_hash_handle* %1145, %struct.UT_hash_handle** %1149, align 8
  br label %1150

; <label>:1150:                                   ; preds = %1143, %1116
  %1151 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1152 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1151, i32 0, i32 2
  %1153 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1154 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1153, i32 0, i32 0
  store %struct.UT_hash_handle* %1152, %struct.UT_hash_handle** %1154, align 8
  %1155 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1156 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1155, i32 0, i32 1
  %1157 = load i32, i32* %1156, align 8
  %1158 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1159 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1158, i32 0, i32 2
  %1160 = load i32, i32* %1159, align 4
  %1161 = add i32 %1160, 1
  %1162 = mul i32 %1161, 10
  %1163 = icmp uge i32 %1157, %1162
  br i1 %1163, label %1164, label %1429

; <label>:1164:                                   ; preds = %1150
  %1165 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1166 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1165, i32 0, i32 2
  %1167 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1166, i32 0, i32 0
  %1168 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1167, align 8
  %1169 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1168, i32 0, i32 9
  %1170 = load i32, i32* %1169, align 4
  %1171 = icmp ne i32 %1170, 0
  br i1 %1171, label %1429, label %1172

; <label>:1172:                                   ; preds = %1164
  br label %1173

; <label>:1173:                                   ; preds = %1172
  %1174 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1175 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1174, i32 0, i32 2
  %1176 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1175, i32 0, i32 0
  %1177 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1176, align 8
  %1178 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1177, i32 0, i32 1
  %1179 = load i32, i32* %1178, align 8
  %1180 = zext i32 %1179 to i64
  %1181 = mul i64 16, %1180
  %1182 = mul i64 %1181, 2
  %1183 = call noalias i8* @malloc(i64 %1182) #8
  %1184 = bitcast i8* %1183 to %struct.UT_hash_bucket*
  store %struct.UT_hash_bucket* %1184, %struct.UT_hash_bucket** %31, align 8
  %1185 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1186 = icmp ne %struct.UT_hash_bucket* %1185, null
  br i1 %1186, label %1188, label %1187

; <label>:1187:                                   ; preds = %1173
  call void @exit(i32 -1) #9
  unreachable

; <label>:1188:                                   ; preds = %1173
  %1189 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1190 = bitcast %struct.UT_hash_bucket* %1189 to i8*
  %1191 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1192 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1191, i32 0, i32 2
  %1193 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1192, i32 0, i32 0
  %1194 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1193, align 8
  %1195 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1194, i32 0, i32 1
  %1196 = load i32, i32* %1195, align 8
  %1197 = zext i32 %1196 to i64
  %1198 = mul i64 16, %1197
  %1199 = mul i64 %1198, 2
  call void @llvm.memset.p0i8.i64(i8* align 8 %1190, i8 0, i64 %1199, i1 false)
  %1200 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1201 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1200, i32 0, i32 2
  %1202 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1201, i32 0, i32 0
  %1203 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1202, align 8
  %1204 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1203, i32 0, i32 3
  %1205 = load i32, i32* %1204, align 8
  %1206 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1207 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1206, i32 0, i32 2
  %1208 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1207, i32 0, i32 0
  %1209 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1208, align 8
  %1210 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1209, i32 0, i32 2
  %1211 = load i32, i32* %1210, align 4
  %1212 = add i32 %1211, 1
  %1213 = lshr i32 %1205, %1212
  %1214 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1215 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1214, i32 0, i32 2
  %1216 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1215, i32 0, i32 0
  %1217 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1216, align 8
  %1218 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1217, i32 0, i32 3
  %1219 = load i32, i32* %1218, align 8
  %1220 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1221 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1220, i32 0, i32 2
  %1222 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1221, i32 0, i32 0
  %1223 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1222, align 8
  %1224 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1223, i32 0, i32 1
  %1225 = load i32, i32* %1224, align 8
  %1226 = mul i32 %1225, 2
  %1227 = sub i32 %1226, 1
  %1228 = and i32 %1219, %1227
  %1229 = icmp ne i32 %1228, 0
  %1230 = zext i1 %1229 to i64
  %1231 = select i1 %1229, i32 1, i32 0
  %1232 = add i32 %1213, %1231
  %1233 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1234 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1233, i32 0, i32 2
  %1235 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1234, i32 0, i32 0
  %1236 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1235, align 8
  %1237 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1236, i32 0, i32 6
  store i32 %1232, i32* %1237, align 8
  %1238 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1239 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1238, i32 0, i32 2
  %1240 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1239, i32 0, i32 0
  %1241 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1240, align 8
  %1242 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1241, i32 0, i32 7
  store i32 0, i32* %1242, align 4
  store i32 0, i32* %28, align 4
  br label %1243

; <label>:1243:                                   ; preds = %1352, %1188
  %1244 = load i32, i32* %28, align 4
  %1245 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1246 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1245, i32 0, i32 2
  %1247 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1246, i32 0, i32 0
  %1248 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1247, align 8
  %1249 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1248, i32 0, i32 1
  %1250 = load i32, i32* %1249, align 8
  %1251 = icmp ult i32 %1244, %1250
  br i1 %1251, label %1252, label %1355

; <label>:1252:                                   ; preds = %1243
  %1253 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1254 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1253, i32 0, i32 2
  %1255 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1254, i32 0, i32 0
  %1256 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1255, align 8
  %1257 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1256, i32 0, i32 0
  %1258 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1257, align 8
  %1259 = load i32, i32* %28, align 4
  %1260 = zext i32 %1259 to i64
  %1261 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1258, i64 %1260
  %1262 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1261, i32 0, i32 0
  %1263 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1262, align 8
  store %struct.UT_hash_handle* %1263, %struct.UT_hash_handle** %29, align 8
  br label %1264

; <label>:1264:                                   ; preds = %1346, %1252
  %1265 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1266 = icmp ne %struct.UT_hash_handle* %1265, null
  br i1 %1266, label %1267, label %1351

; <label>:1267:                                   ; preds = %1264
  %1268 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1269 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1268, i32 0, i32 4
  %1270 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1269, align 8
  store %struct.UT_hash_handle* %1270, %struct.UT_hash_handle** %30, align 8
  br label %1271

; <label>:1271:                                   ; preds = %1267
  %1272 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1273 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1272, i32 0, i32 7
  %1274 = load i32, i32* %1273, align 4
  %1275 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1276 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1275, i32 0, i32 2
  %1277 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1276, i32 0, i32 0
  %1278 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1277, align 8
  %1279 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1278, i32 0, i32 1
  %1280 = load i32, i32* %1279, align 8
  %1281 = mul i32 %1280, 2
  %1282 = sub i32 %1281, 1
  %1283 = and i32 %1274, %1282
  store i32 %1283, i32* %27, align 4
  br label %1284

; <label>:1284:                                   ; preds = %1271
  %1285 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1286 = load i32, i32* %27, align 4
  %1287 = zext i32 %1286 to i64
  %1288 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1285, i64 %1287
  store %struct.UT_hash_bucket* %1288, %struct.UT_hash_bucket** %32, align 8
  %1289 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1290 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1289, i32 0, i32 1
  %1291 = load i32, i32* %1290, align 8
  %1292 = add i32 %1291, 1
  store i32 %1292, i32* %1290, align 8
  %1293 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1294 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1293, i32 0, i32 2
  %1295 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1294, i32 0, i32 0
  %1296 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1295, align 8
  %1297 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1296, i32 0, i32 6
  %1298 = load i32, i32* %1297, align 8
  %1299 = icmp ugt i32 %1292, %1298
  br i1 %1299, label %1300, label %1328

; <label>:1300:                                   ; preds = %1284
  %1301 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1302 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1301, i32 0, i32 2
  %1303 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1302, i32 0, i32 0
  %1304 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1303, align 8
  %1305 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1304, i32 0, i32 7
  %1306 = load i32, i32* %1305, align 4
  %1307 = add i32 %1306, 1
  store i32 %1307, i32* %1305, align 4
  %1308 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1309 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1308, i32 0, i32 1
  %1310 = load i32, i32* %1309, align 8
  %1311 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1312 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1311, i32 0, i32 2
  %1313 = load i32, i32* %1312, align 4
  %1314 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1315 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1314, i32 0, i32 2
  %1316 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1315, i32 0, i32 0
  %1317 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1316, align 8
  %1318 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1317, i32 0, i32 6
  %1319 = load i32, i32* %1318, align 8
  %1320 = mul i32 %1313, %1319
  %1321 = icmp ugt i32 %1310, %1320
  br i1 %1321, label %1322, label %1327

; <label>:1322:                                   ; preds = %1300
  %1323 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1324 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1323, i32 0, i32 2
  %1325 = load i32, i32* %1324, align 4
  %1326 = add i32 %1325, 1
  store i32 %1326, i32* %1324, align 4
  br label %1327

; <label>:1327:                                   ; preds = %1322, %1300
  br label %1328

; <label>:1328:                                   ; preds = %1327, %1284
  %1329 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1330 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1329, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1330, align 8
  %1331 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1332 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1331, i32 0, i32 0
  %1333 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1332, align 8
  %1334 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1335 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1334, i32 0, i32 4
  store %struct.UT_hash_handle* %1333, %struct.UT_hash_handle** %1335, align 8
  %1336 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1337 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1336, i32 0, i32 0
  %1338 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1337, align 8
  %1339 = icmp ne %struct.UT_hash_handle* %1338, null
  br i1 %1339, label %1340, label %1346

; <label>:1340:                                   ; preds = %1328
  %1341 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1342 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1343 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1342, i32 0, i32 0
  %1344 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1343, align 8
  %1345 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1344, i32 0, i32 3
  store %struct.UT_hash_handle* %1341, %struct.UT_hash_handle** %1345, align 8
  br label %1346

; <label>:1346:                                   ; preds = %1340, %1328
  %1347 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1348 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1349 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1348, i32 0, i32 0
  store %struct.UT_hash_handle* %1347, %struct.UT_hash_handle** %1349, align 8
  %1350 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %30, align 8
  store %struct.UT_hash_handle* %1350, %struct.UT_hash_handle** %29, align 8
  br label %1264

; <label>:1351:                                   ; preds = %1264
  br label %1352

; <label>:1352:                                   ; preds = %1351
  %1353 = load i32, i32* %28, align 4
  %1354 = add i32 %1353, 1
  store i32 %1354, i32* %28, align 4
  br label %1243

; <label>:1355:                                   ; preds = %1243
  %1356 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1357 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1356, i32 0, i32 2
  %1358 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1357, i32 0, i32 0
  %1359 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1358, align 8
  %1360 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1359, i32 0, i32 0
  %1361 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1360, align 8
  %1362 = bitcast %struct.UT_hash_bucket* %1361 to i8*
  call void @free(i8* %1362) #8
  %1363 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1364 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1363, i32 0, i32 2
  %1365 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1364, i32 0, i32 0
  %1366 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1365, align 8
  %1367 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1366, i32 0, i32 1
  %1368 = load i32, i32* %1367, align 8
  %1369 = mul i32 %1368, 2
  store i32 %1369, i32* %1367, align 8
  %1370 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1371 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1370, i32 0, i32 2
  %1372 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1371, i32 0, i32 0
  %1373 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1372, align 8
  %1374 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1373, i32 0, i32 2
  %1375 = load i32, i32* %1374, align 4
  %1376 = add i32 %1375, 1
  store i32 %1376, i32* %1374, align 4
  %1377 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1378 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1379 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1378, i32 0, i32 2
  %1380 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1379, i32 0, i32 0
  %1381 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1380, align 8
  %1382 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1381, i32 0, i32 0
  store %struct.UT_hash_bucket* %1377, %struct.UT_hash_bucket** %1382, align 8
  %1383 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1384 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1383, i32 0, i32 2
  %1385 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1384, i32 0, i32 0
  %1386 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1385, align 8
  %1387 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1386, i32 0, i32 7
  %1388 = load i32, i32* %1387, align 4
  %1389 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1390 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1389, i32 0, i32 2
  %1391 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1390, i32 0, i32 0
  %1392 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1391, align 8
  %1393 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1392, i32 0, i32 3
  %1394 = load i32, i32* %1393, align 8
  %1395 = lshr i32 %1394, 1
  %1396 = icmp ugt i32 %1388, %1395
  br i1 %1396, label %1397, label %1405

; <label>:1397:                                   ; preds = %1355
  %1398 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1399 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1398, i32 0, i32 2
  %1400 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1399, i32 0, i32 0
  %1401 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1400, align 8
  %1402 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1401, i32 0, i32 8
  %1403 = load i32, i32* %1402, align 8
  %1404 = add i32 %1403, 1
  br label %1406

; <label>:1405:                                   ; preds = %1355
  br label %1406

; <label>:1406:                                   ; preds = %1405, %1397
  %1407 = phi i32 [ %1404, %1397 ], [ 0, %1405 ]
  %1408 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1409 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1408, i32 0, i32 2
  %1410 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1409, i32 0, i32 0
  %1411 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1410, align 8
  %1412 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1411, i32 0, i32 8
  store i32 %1407, i32* %1412, align 8
  %1413 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1414 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1413, i32 0, i32 2
  %1415 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1414, i32 0, i32 0
  %1416 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1415, align 8
  %1417 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1416, i32 0, i32 8
  %1418 = load i32, i32* %1417, align 8
  %1419 = icmp ugt i32 %1418, 1
  br i1 %1419, label %1420, label %1426

; <label>:1420:                                   ; preds = %1406
  %1421 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1422 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1421, i32 0, i32 2
  %1423 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1422, i32 0, i32 0
  %1424 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1423, align 8
  %1425 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1424, i32 0, i32 9
  store i32 1, i32* %1425, align 4
  br label %1426

; <label>:1426:                                   ; preds = %1420, %1406
  br label %1427

; <label>:1427:                                   ; preds = %1426
  br label %1428

; <label>:1428:                                   ; preds = %1427
  br label %1429

; <label>:1429:                                   ; preds = %1428, %1164, %1150
  br label %1430

; <label>:1430:                                   ; preds = %1429
  br label %1431

; <label>:1431:                                   ; preds = %1430
  br label %1432

; <label>:1432:                                   ; preds = %1431
  br label %1433

; <label>:1433:                                   ; preds = %1432
  br label %1434

; <label>:1434:                                   ; preds = %1433
  br label %1435

; <label>:1435:                                   ; preds = %1434
  br label %1436

; <label>:1436:                                   ; preds = %1435
  %1437 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1438 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1437, i32 0, i32 1
  %1439 = bitcast [20 x i8]* %1438 to i8*
  store i8* %1439, i8** %37, align 8
  store i32 -17973521, i32* %33, align 4
  store i32 -1640531527, i32* %35, align 4
  store i32 -1640531527, i32* %34, align 4
  %1440 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1441 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1440, i32 0, i32 1
  %1442 = getelementptr inbounds [20 x i8], [20 x i8]* %1441, i32 0, i32 0
  %1443 = call i64 @strlen(i8* %1442) #7
  %1444 = trunc i64 %1443 to i32
  store i32 %1444, i32* %36, align 4
  br label %1445

; <label>:1445:                                   ; preds = %1612, %1436
  %1446 = load i32, i32* %36, align 4
  %1447 = icmp uge i32 %1446, 12
  br i1 %1447, label %1448, label %1617

; <label>:1448:                                   ; preds = %1445
  %1449 = load i8*, i8** %37, align 8
  %1450 = getelementptr inbounds i8, i8* %1449, i64 0
  %1451 = load i8, i8* %1450, align 1
  %1452 = zext i8 %1451 to i32
  %1453 = load i8*, i8** %37, align 8
  %1454 = getelementptr inbounds i8, i8* %1453, i64 1
  %1455 = load i8, i8* %1454, align 1
  %1456 = zext i8 %1455 to i32
  %1457 = shl i32 %1456, 8
  %1458 = add i32 %1452, %1457
  %1459 = load i8*, i8** %37, align 8
  %1460 = getelementptr inbounds i8, i8* %1459, i64 2
  %1461 = load i8, i8* %1460, align 1
  %1462 = zext i8 %1461 to i32
  %1463 = shl i32 %1462, 16
  %1464 = add i32 %1458, %1463
  %1465 = load i8*, i8** %37, align 8
  %1466 = getelementptr inbounds i8, i8* %1465, i64 3
  %1467 = load i8, i8* %1466, align 1
  %1468 = zext i8 %1467 to i32
  %1469 = shl i32 %1468, 24
  %1470 = add i32 %1464, %1469
  %1471 = load i32, i32* %34, align 4
  %1472 = add i32 %1471, %1470
  store i32 %1472, i32* %34, align 4
  %1473 = load i8*, i8** %37, align 8
  %1474 = getelementptr inbounds i8, i8* %1473, i64 4
  %1475 = load i8, i8* %1474, align 1
  %1476 = zext i8 %1475 to i32
  %1477 = load i8*, i8** %37, align 8
  %1478 = getelementptr inbounds i8, i8* %1477, i64 5
  %1479 = load i8, i8* %1478, align 1
  %1480 = zext i8 %1479 to i32
  %1481 = shl i32 %1480, 8
  %1482 = add i32 %1476, %1481
  %1483 = load i8*, i8** %37, align 8
  %1484 = getelementptr inbounds i8, i8* %1483, i64 6
  %1485 = load i8, i8* %1484, align 1
  %1486 = zext i8 %1485 to i32
  %1487 = shl i32 %1486, 16
  %1488 = add i32 %1482, %1487
  %1489 = load i8*, i8** %37, align 8
  %1490 = getelementptr inbounds i8, i8* %1489, i64 7
  %1491 = load i8, i8* %1490, align 1
  %1492 = zext i8 %1491 to i32
  %1493 = shl i32 %1492, 24
  %1494 = add i32 %1488, %1493
  %1495 = load i32, i32* %35, align 4
  %1496 = add i32 %1495, %1494
  store i32 %1496, i32* %35, align 4
  %1497 = load i8*, i8** %37, align 8
  %1498 = getelementptr inbounds i8, i8* %1497, i64 8
  %1499 = load i8, i8* %1498, align 1
  %1500 = zext i8 %1499 to i32
  %1501 = load i8*, i8** %37, align 8
  %1502 = getelementptr inbounds i8, i8* %1501, i64 9
  %1503 = load i8, i8* %1502, align 1
  %1504 = zext i8 %1503 to i32
  %1505 = shl i32 %1504, 8
  %1506 = add i32 %1500, %1505
  %1507 = load i8*, i8** %37, align 8
  %1508 = getelementptr inbounds i8, i8* %1507, i64 10
  %1509 = load i8, i8* %1508, align 1
  %1510 = zext i8 %1509 to i32
  %1511 = shl i32 %1510, 16
  %1512 = add i32 %1506, %1511
  %1513 = load i8*, i8** %37, align 8
  %1514 = getelementptr inbounds i8, i8* %1513, i64 11
  %1515 = load i8, i8* %1514, align 1
  %1516 = zext i8 %1515 to i32
  %1517 = shl i32 %1516, 24
  %1518 = add i32 %1512, %1517
  %1519 = load i32, i32* %33, align 4
  %1520 = add i32 %1519, %1518
  store i32 %1520, i32* %33, align 4
  br label %1521

; <label>:1521:                                   ; preds = %1448
  %1522 = load i32, i32* %35, align 4
  %1523 = load i32, i32* %34, align 4
  %1524 = sub i32 %1523, %1522
  store i32 %1524, i32* %34, align 4
  %1525 = load i32, i32* %33, align 4
  %1526 = load i32, i32* %34, align 4
  %1527 = sub i32 %1526, %1525
  store i32 %1527, i32* %34, align 4
  %1528 = load i32, i32* %33, align 4
  %1529 = lshr i32 %1528, 13
  %1530 = load i32, i32* %34, align 4
  %1531 = xor i32 %1530, %1529
  store i32 %1531, i32* %34, align 4
  %1532 = load i32, i32* %33, align 4
  %1533 = load i32, i32* %35, align 4
  %1534 = sub i32 %1533, %1532
  store i32 %1534, i32* %35, align 4
  %1535 = load i32, i32* %34, align 4
  %1536 = load i32, i32* %35, align 4
  %1537 = sub i32 %1536, %1535
  store i32 %1537, i32* %35, align 4
  %1538 = load i32, i32* %34, align 4
  %1539 = shl i32 %1538, 8
  %1540 = load i32, i32* %35, align 4
  %1541 = xor i32 %1540, %1539
  store i32 %1541, i32* %35, align 4
  %1542 = load i32, i32* %34, align 4
  %1543 = load i32, i32* %33, align 4
  %1544 = sub i32 %1543, %1542
  store i32 %1544, i32* %33, align 4
  %1545 = load i32, i32* %35, align 4
  %1546 = load i32, i32* %33, align 4
  %1547 = sub i32 %1546, %1545
  store i32 %1547, i32* %33, align 4
  %1548 = load i32, i32* %35, align 4
  %1549 = lshr i32 %1548, 13
  %1550 = load i32, i32* %33, align 4
  %1551 = xor i32 %1550, %1549
  store i32 %1551, i32* %33, align 4
  %1552 = load i32, i32* %35, align 4
  %1553 = load i32, i32* %34, align 4
  %1554 = sub i32 %1553, %1552
  store i32 %1554, i32* %34, align 4
  %1555 = load i32, i32* %33, align 4
  %1556 = load i32, i32* %34, align 4
  %1557 = sub i32 %1556, %1555
  store i32 %1557, i32* %34, align 4
  %1558 = load i32, i32* %33, align 4
  %1559 = lshr i32 %1558, 12
  %1560 = load i32, i32* %34, align 4
  %1561 = xor i32 %1560, %1559
  store i32 %1561, i32* %34, align 4
  %1562 = load i32, i32* %33, align 4
  %1563 = load i32, i32* %35, align 4
  %1564 = sub i32 %1563, %1562
  store i32 %1564, i32* %35, align 4
  %1565 = load i32, i32* %34, align 4
  %1566 = load i32, i32* %35, align 4
  %1567 = sub i32 %1566, %1565
  store i32 %1567, i32* %35, align 4
  %1568 = load i32, i32* %34, align 4
  %1569 = shl i32 %1568, 16
  %1570 = load i32, i32* %35, align 4
  %1571 = xor i32 %1570, %1569
  store i32 %1571, i32* %35, align 4
  %1572 = load i32, i32* %34, align 4
  %1573 = load i32, i32* %33, align 4
  %1574 = sub i32 %1573, %1572
  store i32 %1574, i32* %33, align 4
  %1575 = load i32, i32* %35, align 4
  %1576 = load i32, i32* %33, align 4
  %1577 = sub i32 %1576, %1575
  store i32 %1577, i32* %33, align 4
  %1578 = load i32, i32* %35, align 4
  %1579 = lshr i32 %1578, 5
  %1580 = load i32, i32* %33, align 4
  %1581 = xor i32 %1580, %1579
  store i32 %1581, i32* %33, align 4
  %1582 = load i32, i32* %35, align 4
  %1583 = load i32, i32* %34, align 4
  %1584 = sub i32 %1583, %1582
  store i32 %1584, i32* %34, align 4
  %1585 = load i32, i32* %33, align 4
  %1586 = load i32, i32* %34, align 4
  %1587 = sub i32 %1586, %1585
  store i32 %1587, i32* %34, align 4
  %1588 = load i32, i32* %33, align 4
  %1589 = lshr i32 %1588, 3
  %1590 = load i32, i32* %34, align 4
  %1591 = xor i32 %1590, %1589
  store i32 %1591, i32* %34, align 4
  %1592 = load i32, i32* %33, align 4
  %1593 = load i32, i32* %35, align 4
  %1594 = sub i32 %1593, %1592
  store i32 %1594, i32* %35, align 4
  %1595 = load i32, i32* %34, align 4
  %1596 = load i32, i32* %35, align 4
  %1597 = sub i32 %1596, %1595
  store i32 %1597, i32* %35, align 4
  %1598 = load i32, i32* %34, align 4
  %1599 = shl i32 %1598, 10
  %1600 = load i32, i32* %35, align 4
  %1601 = xor i32 %1600, %1599
  store i32 %1601, i32* %35, align 4
  %1602 = load i32, i32* %34, align 4
  %1603 = load i32, i32* %33, align 4
  %1604 = sub i32 %1603, %1602
  store i32 %1604, i32* %33, align 4
  %1605 = load i32, i32* %35, align 4
  %1606 = load i32, i32* %33, align 4
  %1607 = sub i32 %1606, %1605
  store i32 %1607, i32* %33, align 4
  %1608 = load i32, i32* %35, align 4
  %1609 = lshr i32 %1608, 15
  %1610 = load i32, i32* %33, align 4
  %1611 = xor i32 %1610, %1609
  store i32 %1611, i32* %33, align 4
  br label %1612

; <label>:1612:                                   ; preds = %1521
  %1613 = load i8*, i8** %37, align 8
  %1614 = getelementptr inbounds i8, i8* %1613, i64 12
  store i8* %1614, i8** %37, align 8
  %1615 = load i32, i32* %36, align 4
  %1616 = sub i32 %1615, 12
  store i32 %1616, i32* %36, align 4
  br label %1445

; <label>:1617:                                   ; preds = %1445
  %1618 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1619 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1618, i32 0, i32 1
  %1620 = getelementptr inbounds [20 x i8], [20 x i8]* %1619, i32 0, i32 0
  %1621 = call i64 @strlen(i8* %1620) #7
  %1622 = trunc i64 %1621 to i32
  %1623 = load i32, i32* %33, align 4
  %1624 = add i32 %1623, %1622
  store i32 %1624, i32* %33, align 4
  %1625 = load i32, i32* %36, align 4
  switch i32 %1625, label %1712 [
    i32 11, label %1626
    i32 10, label %1634
    i32 9, label %1642
    i32 8, label %1650
    i32 7, label %1658
    i32 6, label %1666
    i32 5, label %1674
    i32 4, label %1681
    i32 3, label %1689
    i32 2, label %1697
    i32 1, label %1705
  ]

; <label>:1626:                                   ; preds = %1617
  %1627 = load i8*, i8** %37, align 8
  %1628 = getelementptr inbounds i8, i8* %1627, i64 10
  %1629 = load i8, i8* %1628, align 1
  %1630 = zext i8 %1629 to i32
  %1631 = shl i32 %1630, 24
  %1632 = load i32, i32* %33, align 4
  %1633 = add i32 %1632, %1631
  store i32 %1633, i32* %33, align 4
  br label %1634

; <label>:1634:                                   ; preds = %1617, %1626
  %1635 = load i8*, i8** %37, align 8
  %1636 = getelementptr inbounds i8, i8* %1635, i64 9
  %1637 = load i8, i8* %1636, align 1
  %1638 = zext i8 %1637 to i32
  %1639 = shl i32 %1638, 16
  %1640 = load i32, i32* %33, align 4
  %1641 = add i32 %1640, %1639
  store i32 %1641, i32* %33, align 4
  br label %1642

; <label>:1642:                                   ; preds = %1617, %1634
  %1643 = load i8*, i8** %37, align 8
  %1644 = getelementptr inbounds i8, i8* %1643, i64 8
  %1645 = load i8, i8* %1644, align 1
  %1646 = zext i8 %1645 to i32
  %1647 = shl i32 %1646, 8
  %1648 = load i32, i32* %33, align 4
  %1649 = add i32 %1648, %1647
  store i32 %1649, i32* %33, align 4
  br label %1650

; <label>:1650:                                   ; preds = %1617, %1642
  %1651 = load i8*, i8** %37, align 8
  %1652 = getelementptr inbounds i8, i8* %1651, i64 7
  %1653 = load i8, i8* %1652, align 1
  %1654 = zext i8 %1653 to i32
  %1655 = shl i32 %1654, 24
  %1656 = load i32, i32* %35, align 4
  %1657 = add i32 %1656, %1655
  store i32 %1657, i32* %35, align 4
  br label %1658

; <label>:1658:                                   ; preds = %1617, %1650
  %1659 = load i8*, i8** %37, align 8
  %1660 = getelementptr inbounds i8, i8* %1659, i64 6
  %1661 = load i8, i8* %1660, align 1
  %1662 = zext i8 %1661 to i32
  %1663 = shl i32 %1662, 16
  %1664 = load i32, i32* %35, align 4
  %1665 = add i32 %1664, %1663
  store i32 %1665, i32* %35, align 4
  br label %1666

; <label>:1666:                                   ; preds = %1617, %1658
  %1667 = load i8*, i8** %37, align 8
  %1668 = getelementptr inbounds i8, i8* %1667, i64 5
  %1669 = load i8, i8* %1668, align 1
  %1670 = zext i8 %1669 to i32
  %1671 = shl i32 %1670, 8
  %1672 = load i32, i32* %35, align 4
  %1673 = add i32 %1672, %1671
  store i32 %1673, i32* %35, align 4
  br label %1674

; <label>:1674:                                   ; preds = %1617, %1666
  %1675 = load i8*, i8** %37, align 8
  %1676 = getelementptr inbounds i8, i8* %1675, i64 4
  %1677 = load i8, i8* %1676, align 1
  %1678 = zext i8 %1677 to i32
  %1679 = load i32, i32* %35, align 4
  %1680 = add i32 %1679, %1678
  store i32 %1680, i32* %35, align 4
  br label %1681

; <label>:1681:                                   ; preds = %1617, %1674
  %1682 = load i8*, i8** %37, align 8
  %1683 = getelementptr inbounds i8, i8* %1682, i64 3
  %1684 = load i8, i8* %1683, align 1
  %1685 = zext i8 %1684 to i32
  %1686 = shl i32 %1685, 24
  %1687 = load i32, i32* %34, align 4
  %1688 = add i32 %1687, %1686
  store i32 %1688, i32* %34, align 4
  br label %1689

; <label>:1689:                                   ; preds = %1617, %1681
  %1690 = load i8*, i8** %37, align 8
  %1691 = getelementptr inbounds i8, i8* %1690, i64 2
  %1692 = load i8, i8* %1691, align 1
  %1693 = zext i8 %1692 to i32
  %1694 = shl i32 %1693, 16
  %1695 = load i32, i32* %34, align 4
  %1696 = add i32 %1695, %1694
  store i32 %1696, i32* %34, align 4
  br label %1697

; <label>:1697:                                   ; preds = %1617, %1689
  %1698 = load i8*, i8** %37, align 8
  %1699 = getelementptr inbounds i8, i8* %1698, i64 1
  %1700 = load i8, i8* %1699, align 1
  %1701 = zext i8 %1700 to i32
  %1702 = shl i32 %1701, 8
  %1703 = load i32, i32* %34, align 4
  %1704 = add i32 %1703, %1702
  store i32 %1704, i32* %34, align 4
  br label %1705

; <label>:1705:                                   ; preds = %1617, %1697
  %1706 = load i8*, i8** %37, align 8
  %1707 = getelementptr inbounds i8, i8* %1706, i64 0
  %1708 = load i8, i8* %1707, align 1
  %1709 = zext i8 %1708 to i32
  %1710 = load i32, i32* %34, align 4
  %1711 = add i32 %1710, %1709
  store i32 %1711, i32* %34, align 4
  br label %1712

; <label>:1712:                                   ; preds = %1617, %1705
  br label %1713

; <label>:1713:                                   ; preds = %1712
  br label %1714

; <label>:1714:                                   ; preds = %1713
  %1715 = load i32, i32* %35, align 4
  %1716 = load i32, i32* %34, align 4
  %1717 = sub i32 %1716, %1715
  store i32 %1717, i32* %34, align 4
  %1718 = load i32, i32* %33, align 4
  %1719 = load i32, i32* %34, align 4
  %1720 = sub i32 %1719, %1718
  store i32 %1720, i32* %34, align 4
  %1721 = load i32, i32* %33, align 4
  %1722 = lshr i32 %1721, 13
  %1723 = load i32, i32* %34, align 4
  %1724 = xor i32 %1723, %1722
  store i32 %1724, i32* %34, align 4
  %1725 = load i32, i32* %33, align 4
  %1726 = load i32, i32* %35, align 4
  %1727 = sub i32 %1726, %1725
  store i32 %1727, i32* %35, align 4
  %1728 = load i32, i32* %34, align 4
  %1729 = load i32, i32* %35, align 4
  %1730 = sub i32 %1729, %1728
  store i32 %1730, i32* %35, align 4
  %1731 = load i32, i32* %34, align 4
  %1732 = shl i32 %1731, 8
  %1733 = load i32, i32* %35, align 4
  %1734 = xor i32 %1733, %1732
  store i32 %1734, i32* %35, align 4
  %1735 = load i32, i32* %34, align 4
  %1736 = load i32, i32* %33, align 4
  %1737 = sub i32 %1736, %1735
  store i32 %1737, i32* %33, align 4
  %1738 = load i32, i32* %35, align 4
  %1739 = load i32, i32* %33, align 4
  %1740 = sub i32 %1739, %1738
  store i32 %1740, i32* %33, align 4
  %1741 = load i32, i32* %35, align 4
  %1742 = lshr i32 %1741, 13
  %1743 = load i32, i32* %33, align 4
  %1744 = xor i32 %1743, %1742
  store i32 %1744, i32* %33, align 4
  %1745 = load i32, i32* %35, align 4
  %1746 = load i32, i32* %34, align 4
  %1747 = sub i32 %1746, %1745
  store i32 %1747, i32* %34, align 4
  %1748 = load i32, i32* %33, align 4
  %1749 = load i32, i32* %34, align 4
  %1750 = sub i32 %1749, %1748
  store i32 %1750, i32* %34, align 4
  %1751 = load i32, i32* %33, align 4
  %1752 = lshr i32 %1751, 12
  %1753 = load i32, i32* %34, align 4
  %1754 = xor i32 %1753, %1752
  store i32 %1754, i32* %34, align 4
  %1755 = load i32, i32* %33, align 4
  %1756 = load i32, i32* %35, align 4
  %1757 = sub i32 %1756, %1755
  store i32 %1757, i32* %35, align 4
  %1758 = load i32, i32* %34, align 4
  %1759 = load i32, i32* %35, align 4
  %1760 = sub i32 %1759, %1758
  store i32 %1760, i32* %35, align 4
  %1761 = load i32, i32* %34, align 4
  %1762 = shl i32 %1761, 16
  %1763 = load i32, i32* %35, align 4
  %1764 = xor i32 %1763, %1762
  store i32 %1764, i32* %35, align 4
  %1765 = load i32, i32* %34, align 4
  %1766 = load i32, i32* %33, align 4
  %1767 = sub i32 %1766, %1765
  store i32 %1767, i32* %33, align 4
  %1768 = load i32, i32* %35, align 4
  %1769 = load i32, i32* %33, align 4
  %1770 = sub i32 %1769, %1768
  store i32 %1770, i32* %33, align 4
  %1771 = load i32, i32* %35, align 4
  %1772 = lshr i32 %1771, 5
  %1773 = load i32, i32* %33, align 4
  %1774 = xor i32 %1773, %1772
  store i32 %1774, i32* %33, align 4
  %1775 = load i32, i32* %35, align 4
  %1776 = load i32, i32* %34, align 4
  %1777 = sub i32 %1776, %1775
  store i32 %1777, i32* %34, align 4
  %1778 = load i32, i32* %33, align 4
  %1779 = load i32, i32* %34, align 4
  %1780 = sub i32 %1779, %1778
  store i32 %1780, i32* %34, align 4
  %1781 = load i32, i32* %33, align 4
  %1782 = lshr i32 %1781, 3
  %1783 = load i32, i32* %34, align 4
  %1784 = xor i32 %1783, %1782
  store i32 %1784, i32* %34, align 4
  %1785 = load i32, i32* %33, align 4
  %1786 = load i32, i32* %35, align 4
  %1787 = sub i32 %1786, %1785
  store i32 %1787, i32* %35, align 4
  %1788 = load i32, i32* %34, align 4
  %1789 = load i32, i32* %35, align 4
  %1790 = sub i32 %1789, %1788
  store i32 %1790, i32* %35, align 4
  %1791 = load i32, i32* %34, align 4
  %1792 = shl i32 %1791, 10
  %1793 = load i32, i32* %35, align 4
  %1794 = xor i32 %1793, %1792
  store i32 %1794, i32* %35, align 4
  %1795 = load i32, i32* %34, align 4
  %1796 = load i32, i32* %33, align 4
  %1797 = sub i32 %1796, %1795
  store i32 %1797, i32* %33, align 4
  %1798 = load i32, i32* %35, align 4
  %1799 = load i32, i32* %33, align 4
  %1800 = sub i32 %1799, %1798
  store i32 %1800, i32* %33, align 4
  %1801 = load i32, i32* %35, align 4
  %1802 = lshr i32 %1801, 15
  %1803 = load i32, i32* %33, align 4
  %1804 = xor i32 %1803, %1802
  store i32 %1804, i32* %33, align 4
  br label %1805

; <label>:1805:                                   ; preds = %1714
  br label %1806

; <label>:1806:                                   ; preds = %1805
  br label %1807

; <label>:1807:                                   ; preds = %1806
  br label %1808

; <label>:1808:                                   ; preds = %1807
  %1809 = load i32, i32* %33, align 4
  %1810 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1811 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1810, i32 0, i32 3
  %1812 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1811, i32 0, i32 7
  store i32 %1809, i32* %1812, align 4
  %1813 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1814 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1813, i32 0, i32 1
  %1815 = bitcast [20 x i8]* %1814 to i8*
  %1816 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1817 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1816, i32 0, i32 3
  %1818 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1817, i32 0, i32 5
  store i8* %1815, i8** %1818, align 8
  %1819 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1820 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1819, i32 0, i32 1
  %1821 = getelementptr inbounds [20 x i8], [20 x i8]* %1820, i32 0, i32 0
  %1822 = call i64 @strlen(i8* %1821) #7
  %1823 = trunc i64 %1822 to i32
  %1824 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1825 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1824, i32 0, i32 3
  %1826 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1825, i32 0, i32 6
  store i32 %1823, i32* %1826, align 8
  %1827 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1828 = icmp ne %struct.FuncEntry* %1827, null
  br i1 %1828, label %1916, label %1829

; <label>:1829:                                   ; preds = %1808
  %1830 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1831 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1830, i32 0, i32 3
  %1832 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1831, i32 0, i32 2
  store i8* null, i8** %1832, align 8
  %1833 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1834 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1833, i32 0, i32 3
  %1835 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1834, i32 0, i32 1
  store i8* null, i8** %1835, align 8
  br label %1836

; <label>:1836:                                   ; preds = %1829
  %1837 = call noalias i8* @malloc(i64 64) #8
  %1838 = bitcast i8* %1837 to %struct.UT_hash_table*
  %1839 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1840 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1839, i32 0, i32 3
  %1841 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1840, i32 0, i32 0
  store %struct.UT_hash_table* %1838, %struct.UT_hash_table** %1841, align 8
  %1842 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1843 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1842, i32 0, i32 3
  %1844 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1843, i32 0, i32 0
  %1845 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1844, align 8
  %1846 = icmp ne %struct.UT_hash_table* %1845, null
  br i1 %1846, label %1848, label %1847

; <label>:1847:                                   ; preds = %1836
  call void @exit(i32 -1) #9
  unreachable

; <label>:1848:                                   ; preds = %1836
  %1849 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1850 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1849, i32 0, i32 3
  %1851 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1850, i32 0, i32 0
  %1852 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1851, align 8
  %1853 = bitcast %struct.UT_hash_table* %1852 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1853, i8 0, i64 64, i1 false)
  %1854 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1855 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1854, i32 0, i32 3
  %1856 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1857 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1856, i32 0, i32 3
  %1858 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1857, i32 0, i32 0
  %1859 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1858, align 8
  %1860 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1859, i32 0, i32 4
  store %struct.UT_hash_handle* %1855, %struct.UT_hash_handle** %1860, align 8
  %1861 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1862 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1861, i32 0, i32 3
  %1863 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1862, i32 0, i32 0
  %1864 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1863, align 8
  %1865 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1864, i32 0, i32 1
  store i32 32, i32* %1865, align 8
  %1866 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1867 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1866, i32 0, i32 3
  %1868 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1867, i32 0, i32 0
  %1869 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1868, align 8
  %1870 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1869, i32 0, i32 2
  store i32 5, i32* %1870, align 4
  %1871 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1872 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1871, i32 0, i32 3
  %1873 = bitcast %struct.UT_hash_handle* %1872 to i8*
  %1874 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1875 = bitcast %struct.FuncEntry* %1874 to i8*
  %1876 = ptrtoint i8* %1873 to i64
  %1877 = ptrtoint i8* %1875 to i64
  %1878 = sub i64 %1876, %1877
  %1879 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1880 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1879, i32 0, i32 3
  %1881 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1880, i32 0, i32 0
  %1882 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1881, align 8
  %1883 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1882, i32 0, i32 5
  store i64 %1878, i64* %1883, align 8
  %1884 = call noalias i8* @malloc(i64 512) #8
  %1885 = bitcast i8* %1884 to %struct.UT_hash_bucket*
  %1886 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1887 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1886, i32 0, i32 3
  %1888 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1887, i32 0, i32 0
  %1889 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1888, align 8
  %1890 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1889, i32 0, i32 0
  store %struct.UT_hash_bucket* %1885, %struct.UT_hash_bucket** %1890, align 8
  %1891 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1892 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1891, i32 0, i32 3
  %1893 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1892, i32 0, i32 0
  %1894 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1893, align 8
  %1895 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1894, i32 0, i32 10
  store i32 -1609490463, i32* %1895, align 8
  %1896 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1897 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1896, i32 0, i32 3
  %1898 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1897, i32 0, i32 0
  %1899 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1898, align 8
  %1900 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1899, i32 0, i32 0
  %1901 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1900, align 8
  %1902 = icmp ne %struct.UT_hash_bucket* %1901, null
  br i1 %1902, label %1904, label %1903

; <label>:1903:                                   ; preds = %1848
  call void @exit(i32 -1) #9
  unreachable

; <label>:1904:                                   ; preds = %1848
  %1905 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1906 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1905, i32 0, i32 3
  %1907 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1906, i32 0, i32 0
  %1908 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1907, align 8
  %1909 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1908, i32 0, i32 0
  %1910 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1909, align 8
  %1911 = bitcast %struct.UT_hash_bucket* %1910 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1911, i8 0, i64 512, i1 false)
  br label %1912

; <label>:1912:                                   ; preds = %1904
  br label %1913

; <label>:1913:                                   ; preds = %1912
  br label %1914

; <label>:1914:                                   ; preds = %1913
  %1915 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  store %struct.FuncEntry* %1915, %struct.FuncEntry** @allowed_functions_address, align 8
  br label %1963

; <label>:1916:                                   ; preds = %1808
  %1917 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1918 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1917, i32 0, i32 3
  %1919 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1918, i32 0, i32 0
  %1920 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1919, align 8
  %1921 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1922 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1921, i32 0, i32 3
  %1923 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1922, i32 0, i32 0
  store %struct.UT_hash_table* %1920, %struct.UT_hash_table** %1923, align 8
  br label %1924

; <label>:1924:                                   ; preds = %1916
  %1925 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1926 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1925, i32 0, i32 3
  %1927 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1926, i32 0, i32 2
  store i8* null, i8** %1927, align 8
  %1928 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1929 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1928, i32 0, i32 3
  %1930 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1929, i32 0, i32 0
  %1931 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1930, align 8
  %1932 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1931, i32 0, i32 4
  %1933 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1932, align 8
  %1934 = bitcast %struct.UT_hash_handle* %1933 to i8*
  %1935 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1936 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1935, i32 0, i32 3
  %1937 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1936, i32 0, i32 0
  %1938 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1937, align 8
  %1939 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1938, i32 0, i32 5
  %1940 = load i64, i64* %1939, align 8
  %1941 = sub i64 0, %1940
  %1942 = getelementptr inbounds i8, i8* %1934, i64 %1941
  %1943 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1944 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1943, i32 0, i32 3
  %1945 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1944, i32 0, i32 1
  store i8* %1942, i8** %1945, align 8
  %1946 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1947 = bitcast %struct.FuncEntry* %1946 to i8*
  %1948 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1949 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1948, i32 0, i32 3
  %1950 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1949, i32 0, i32 0
  %1951 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1950, align 8
  %1952 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1951, i32 0, i32 4
  %1953 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1952, align 8
  %1954 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1953, i32 0, i32 2
  store i8* %1947, i8** %1954, align 8
  %1955 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %1956 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1955, i32 0, i32 3
  %1957 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1958 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1957, i32 0, i32 3
  %1959 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1958, i32 0, i32 0
  %1960 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1959, align 8
  %1961 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1960, i32 0, i32 4
  store %struct.UT_hash_handle* %1956, %struct.UT_hash_handle** %1961, align 8
  br label %1962

; <label>:1962:                                   ; preds = %1924
  br label %1963

; <label>:1963:                                   ; preds = %1962, %1914
  br label %1964

; <label>:1964:                                   ; preds = %1963
  %1965 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1966 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1965, i32 0, i32 3
  %1967 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1966, i32 0, i32 0
  %1968 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1967, align 8
  %1969 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1968, i32 0, i32 3
  %1970 = load i32, i32* %1969, align 8
  %1971 = add i32 %1970, 1
  store i32 %1971, i32* %1969, align 8
  br label %1972

; <label>:1972:                                   ; preds = %1964
  %1973 = load i32, i32* %33, align 4
  %1974 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1975 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1974, i32 0, i32 3
  %1976 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1975, i32 0, i32 0
  %1977 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1976, align 8
  %1978 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1977, i32 0, i32 1
  %1979 = load i32, i32* %1978, align 8
  %1980 = sub i32 %1979, 1
  %1981 = and i32 %1973, %1980
  store i32 %1981, i32* %38, align 4
  br label %1982

; <label>:1982:                                   ; preds = %1972
  br label %1983

; <label>:1983:                                   ; preds = %1982
  %1984 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %1985 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %1984, i32 0, i32 3
  %1986 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1985, i32 0, i32 0
  %1987 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1986, align 8
  %1988 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1987, i32 0, i32 0
  %1989 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1988, align 8
  %1990 = load i32, i32* %38, align 4
  %1991 = zext i32 %1990 to i64
  %1992 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1989, i64 %1991
  store %struct.UT_hash_bucket* %1992, %struct.UT_hash_bucket** %39, align 8
  %1993 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %39, align 8
  %1994 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1993, i32 0, i32 1
  %1995 = load i32, i32* %1994, align 8
  %1996 = add i32 %1995, 1
  store i32 %1996, i32* %1994, align 8
  %1997 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %39, align 8
  %1998 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1997, i32 0, i32 0
  %1999 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1998, align 8
  %2000 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2001 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2000, i32 0, i32 3
  %2002 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2001, i32 0, i32 4
  store %struct.UT_hash_handle* %1999, %struct.UT_hash_handle** %2002, align 8
  %2003 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2004 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2003, i32 0, i32 3
  %2005 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2004, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %2005, align 8
  %2006 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %39, align 8
  %2007 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2006, i32 0, i32 0
  %2008 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2007, align 8
  %2009 = icmp ne %struct.UT_hash_handle* %2008, null
  br i1 %2009, label %2010, label %2017

; <label>:2010:                                   ; preds = %1983
  %2011 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2012 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2011, i32 0, i32 3
  %2013 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %39, align 8
  %2014 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2013, i32 0, i32 0
  %2015 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2014, align 8
  %2016 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2015, i32 0, i32 3
  store %struct.UT_hash_handle* %2012, %struct.UT_hash_handle** %2016, align 8
  br label %2017

; <label>:2017:                                   ; preds = %2010, %1983
  %2018 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2019 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2018, i32 0, i32 3
  %2020 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %39, align 8
  %2021 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2020, i32 0, i32 0
  store %struct.UT_hash_handle* %2019, %struct.UT_hash_handle** %2021, align 8
  %2022 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %39, align 8
  %2023 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2022, i32 0, i32 1
  %2024 = load i32, i32* %2023, align 8
  %2025 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %39, align 8
  %2026 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2025, i32 0, i32 2
  %2027 = load i32, i32* %2026, align 4
  %2028 = add i32 %2027, 1
  %2029 = mul i32 %2028, 10
  %2030 = icmp uge i32 %2024, %2029
  br i1 %2030, label %2031, label %2296

; <label>:2031:                                   ; preds = %2017
  %2032 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2033 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2032, i32 0, i32 3
  %2034 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2033, i32 0, i32 0
  %2035 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2034, align 8
  %2036 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2035, i32 0, i32 9
  %2037 = load i32, i32* %2036, align 4
  %2038 = icmp ne i32 %2037, 0
  br i1 %2038, label %2296, label %2039

; <label>:2039:                                   ; preds = %2031
  br label %2040

; <label>:2040:                                   ; preds = %2039
  %2041 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2042 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2041, i32 0, i32 3
  %2043 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2042, i32 0, i32 0
  %2044 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2043, align 8
  %2045 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2044, i32 0, i32 1
  %2046 = load i32, i32* %2045, align 8
  %2047 = zext i32 %2046 to i64
  %2048 = mul i64 16, %2047
  %2049 = mul i64 %2048, 2
  %2050 = call noalias i8* @malloc(i64 %2049) #8
  %2051 = bitcast i8* %2050 to %struct.UT_hash_bucket*
  store %struct.UT_hash_bucket* %2051, %struct.UT_hash_bucket** %44, align 8
  %2052 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %44, align 8
  %2053 = icmp ne %struct.UT_hash_bucket* %2052, null
  br i1 %2053, label %2055, label %2054

; <label>:2054:                                   ; preds = %2040
  call void @exit(i32 -1) #9
  unreachable

; <label>:2055:                                   ; preds = %2040
  %2056 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %44, align 8
  %2057 = bitcast %struct.UT_hash_bucket* %2056 to i8*
  %2058 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2059 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2058, i32 0, i32 3
  %2060 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2059, i32 0, i32 0
  %2061 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2060, align 8
  %2062 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2061, i32 0, i32 1
  %2063 = load i32, i32* %2062, align 8
  %2064 = zext i32 %2063 to i64
  %2065 = mul i64 16, %2064
  %2066 = mul i64 %2065, 2
  call void @llvm.memset.p0i8.i64(i8* align 8 %2057, i8 0, i64 %2066, i1 false)
  %2067 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2068 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2067, i32 0, i32 3
  %2069 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2068, i32 0, i32 0
  %2070 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2069, align 8
  %2071 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2070, i32 0, i32 3
  %2072 = load i32, i32* %2071, align 8
  %2073 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2074 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2073, i32 0, i32 3
  %2075 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2074, i32 0, i32 0
  %2076 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2075, align 8
  %2077 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2076, i32 0, i32 2
  %2078 = load i32, i32* %2077, align 4
  %2079 = add i32 %2078, 1
  %2080 = lshr i32 %2072, %2079
  %2081 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2082 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2081, i32 0, i32 3
  %2083 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2082, i32 0, i32 0
  %2084 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2083, align 8
  %2085 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2084, i32 0, i32 3
  %2086 = load i32, i32* %2085, align 8
  %2087 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2088 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2087, i32 0, i32 3
  %2089 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2088, i32 0, i32 0
  %2090 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2089, align 8
  %2091 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2090, i32 0, i32 1
  %2092 = load i32, i32* %2091, align 8
  %2093 = mul i32 %2092, 2
  %2094 = sub i32 %2093, 1
  %2095 = and i32 %2086, %2094
  %2096 = icmp ne i32 %2095, 0
  %2097 = zext i1 %2096 to i64
  %2098 = select i1 %2096, i32 1, i32 0
  %2099 = add i32 %2080, %2098
  %2100 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2101 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2100, i32 0, i32 3
  %2102 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2101, i32 0, i32 0
  %2103 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2102, align 8
  %2104 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2103, i32 0, i32 6
  store i32 %2099, i32* %2104, align 8
  %2105 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2106 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2105, i32 0, i32 3
  %2107 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2106, i32 0, i32 0
  %2108 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2107, align 8
  %2109 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2108, i32 0, i32 7
  store i32 0, i32* %2109, align 4
  store i32 0, i32* %41, align 4
  br label %2110

; <label>:2110:                                   ; preds = %2219, %2055
  %2111 = load i32, i32* %41, align 4
  %2112 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2113 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2112, i32 0, i32 3
  %2114 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2113, i32 0, i32 0
  %2115 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2114, align 8
  %2116 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2115, i32 0, i32 1
  %2117 = load i32, i32* %2116, align 8
  %2118 = icmp ult i32 %2111, %2117
  br i1 %2118, label %2119, label %2222

; <label>:2119:                                   ; preds = %2110
  %2120 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2121 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2120, i32 0, i32 3
  %2122 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2121, i32 0, i32 0
  %2123 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2122, align 8
  %2124 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2123, i32 0, i32 0
  %2125 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %2124, align 8
  %2126 = load i32, i32* %41, align 4
  %2127 = zext i32 %2126 to i64
  %2128 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2125, i64 %2127
  %2129 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2128, i32 0, i32 0
  %2130 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2129, align 8
  store %struct.UT_hash_handle* %2130, %struct.UT_hash_handle** %42, align 8
  br label %2131

; <label>:2131:                                   ; preds = %2213, %2119
  %2132 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %42, align 8
  %2133 = icmp ne %struct.UT_hash_handle* %2132, null
  br i1 %2133, label %2134, label %2218

; <label>:2134:                                   ; preds = %2131
  %2135 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %42, align 8
  %2136 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2135, i32 0, i32 4
  %2137 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2136, align 8
  store %struct.UT_hash_handle* %2137, %struct.UT_hash_handle** %43, align 8
  br label %2138

; <label>:2138:                                   ; preds = %2134
  %2139 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %42, align 8
  %2140 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2139, i32 0, i32 7
  %2141 = load i32, i32* %2140, align 4
  %2142 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2143 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2142, i32 0, i32 3
  %2144 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2143, i32 0, i32 0
  %2145 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2144, align 8
  %2146 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2145, i32 0, i32 1
  %2147 = load i32, i32* %2146, align 8
  %2148 = mul i32 %2147, 2
  %2149 = sub i32 %2148, 1
  %2150 = and i32 %2141, %2149
  store i32 %2150, i32* %40, align 4
  br label %2151

; <label>:2151:                                   ; preds = %2138
  %2152 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %44, align 8
  %2153 = load i32, i32* %40, align 4
  %2154 = zext i32 %2153 to i64
  %2155 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2152, i64 %2154
  store %struct.UT_hash_bucket* %2155, %struct.UT_hash_bucket** %45, align 8
  %2156 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %45, align 8
  %2157 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2156, i32 0, i32 1
  %2158 = load i32, i32* %2157, align 8
  %2159 = add i32 %2158, 1
  store i32 %2159, i32* %2157, align 8
  %2160 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2161 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2160, i32 0, i32 3
  %2162 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2161, i32 0, i32 0
  %2163 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2162, align 8
  %2164 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2163, i32 0, i32 6
  %2165 = load i32, i32* %2164, align 8
  %2166 = icmp ugt i32 %2159, %2165
  br i1 %2166, label %2167, label %2195

; <label>:2167:                                   ; preds = %2151
  %2168 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2169 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2168, i32 0, i32 3
  %2170 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2169, i32 0, i32 0
  %2171 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2170, align 8
  %2172 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2171, i32 0, i32 7
  %2173 = load i32, i32* %2172, align 4
  %2174 = add i32 %2173, 1
  store i32 %2174, i32* %2172, align 4
  %2175 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %45, align 8
  %2176 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2175, i32 0, i32 1
  %2177 = load i32, i32* %2176, align 8
  %2178 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %45, align 8
  %2179 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2178, i32 0, i32 2
  %2180 = load i32, i32* %2179, align 4
  %2181 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2182 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2181, i32 0, i32 3
  %2183 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2182, i32 0, i32 0
  %2184 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2183, align 8
  %2185 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2184, i32 0, i32 6
  %2186 = load i32, i32* %2185, align 8
  %2187 = mul i32 %2180, %2186
  %2188 = icmp ugt i32 %2177, %2187
  br i1 %2188, label %2189, label %2194

; <label>:2189:                                   ; preds = %2167
  %2190 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %45, align 8
  %2191 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2190, i32 0, i32 2
  %2192 = load i32, i32* %2191, align 4
  %2193 = add i32 %2192, 1
  store i32 %2193, i32* %2191, align 4
  br label %2194

; <label>:2194:                                   ; preds = %2189, %2167
  br label %2195

; <label>:2195:                                   ; preds = %2194, %2151
  %2196 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %42, align 8
  %2197 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2196, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %2197, align 8
  %2198 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %45, align 8
  %2199 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2198, i32 0, i32 0
  %2200 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2199, align 8
  %2201 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %42, align 8
  %2202 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2201, i32 0, i32 4
  store %struct.UT_hash_handle* %2200, %struct.UT_hash_handle** %2202, align 8
  %2203 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %45, align 8
  %2204 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2203, i32 0, i32 0
  %2205 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2204, align 8
  %2206 = icmp ne %struct.UT_hash_handle* %2205, null
  br i1 %2206, label %2207, label %2213

; <label>:2207:                                   ; preds = %2195
  %2208 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %42, align 8
  %2209 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %45, align 8
  %2210 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2209, i32 0, i32 0
  %2211 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %2210, align 8
  %2212 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2211, i32 0, i32 3
  store %struct.UT_hash_handle* %2208, %struct.UT_hash_handle** %2212, align 8
  br label %2213

; <label>:2213:                                   ; preds = %2207, %2195
  %2214 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %42, align 8
  %2215 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %45, align 8
  %2216 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %2215, i32 0, i32 0
  store %struct.UT_hash_handle* %2214, %struct.UT_hash_handle** %2216, align 8
  %2217 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %43, align 8
  store %struct.UT_hash_handle* %2217, %struct.UT_hash_handle** %42, align 8
  br label %2131

; <label>:2218:                                   ; preds = %2131
  br label %2219

; <label>:2219:                                   ; preds = %2218
  %2220 = load i32, i32* %41, align 4
  %2221 = add i32 %2220, 1
  store i32 %2221, i32* %41, align 4
  br label %2110

; <label>:2222:                                   ; preds = %2110
  %2223 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2224 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2223, i32 0, i32 3
  %2225 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2224, i32 0, i32 0
  %2226 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2225, align 8
  %2227 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2226, i32 0, i32 0
  %2228 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %2227, align 8
  %2229 = bitcast %struct.UT_hash_bucket* %2228 to i8*
  call void @free(i8* %2229) #8
  %2230 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2231 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2230, i32 0, i32 3
  %2232 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2231, i32 0, i32 0
  %2233 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2232, align 8
  %2234 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2233, i32 0, i32 1
  %2235 = load i32, i32* %2234, align 8
  %2236 = mul i32 %2235, 2
  store i32 %2236, i32* %2234, align 8
  %2237 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2238 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2237, i32 0, i32 3
  %2239 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2238, i32 0, i32 0
  %2240 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2239, align 8
  %2241 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2240, i32 0, i32 2
  %2242 = load i32, i32* %2241, align 4
  %2243 = add i32 %2242, 1
  store i32 %2243, i32* %2241, align 4
  %2244 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %44, align 8
  %2245 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2246 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2245, i32 0, i32 3
  %2247 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2246, i32 0, i32 0
  %2248 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2247, align 8
  %2249 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2248, i32 0, i32 0
  store %struct.UT_hash_bucket* %2244, %struct.UT_hash_bucket** %2249, align 8
  %2250 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2251 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2250, i32 0, i32 3
  %2252 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2251, i32 0, i32 0
  %2253 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2252, align 8
  %2254 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2253, i32 0, i32 7
  %2255 = load i32, i32* %2254, align 4
  %2256 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2257 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2256, i32 0, i32 3
  %2258 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2257, i32 0, i32 0
  %2259 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2258, align 8
  %2260 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2259, i32 0, i32 3
  %2261 = load i32, i32* %2260, align 8
  %2262 = lshr i32 %2261, 1
  %2263 = icmp ugt i32 %2255, %2262
  br i1 %2263, label %2264, label %2272

; <label>:2264:                                   ; preds = %2222
  %2265 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2266 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2265, i32 0, i32 3
  %2267 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2266, i32 0, i32 0
  %2268 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2267, align 8
  %2269 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2268, i32 0, i32 8
  %2270 = load i32, i32* %2269, align 8
  %2271 = add i32 %2270, 1
  br label %2273

; <label>:2272:                                   ; preds = %2222
  br label %2273

; <label>:2273:                                   ; preds = %2272, %2264
  %2274 = phi i32 [ %2271, %2264 ], [ 0, %2272 ]
  %2275 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2276 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2275, i32 0, i32 3
  %2277 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2276, i32 0, i32 0
  %2278 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2277, align 8
  %2279 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2278, i32 0, i32 8
  store i32 %2274, i32* %2279, align 8
  %2280 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2281 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2280, i32 0, i32 3
  %2282 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2281, i32 0, i32 0
  %2283 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2282, align 8
  %2284 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2283, i32 0, i32 8
  %2285 = load i32, i32* %2284, align 8
  %2286 = icmp ugt i32 %2285, 1
  br i1 %2286, label %2287, label %2293

; <label>:2287:                                   ; preds = %2273
  %2288 = load %struct.FuncEntry*, %struct.FuncEntry** %19, align 8
  %2289 = getelementptr inbounds %struct.FuncEntry, %struct.FuncEntry* %2288, i32 0, i32 3
  %2290 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %2289, i32 0, i32 0
  %2291 = load %struct.UT_hash_table*, %struct.UT_hash_table** %2290, align 8
  %2292 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %2291, i32 0, i32 9
  store i32 1, i32* %2292, align 4
  br label %2293

; <label>:2293:                                   ; preds = %2287, %2273
  br label %2294

; <label>:2294:                                   ; preds = %2293
  br label %2295

; <label>:2295:                                   ; preds = %2294
  br label %2296

; <label>:2296:                                   ; preds = %2295, %2031, %2017
  br label %2297

; <label>:2297:                                   ; preds = %2296
  br label %2298

; <label>:2298:                                   ; preds = %2297
  br label %2299

; <label>:2299:                                   ; preds = %2298
  br label %2300

; <label>:2300:                                   ; preds = %2299
  br label %511

; <label>:2301:                                   ; preds = %511
  %2302 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 8
  %2303 = call i32 @fclose(%struct._IO_FILE* %2302)
  br label %2304

; <label>:2304:                                   ; preds = %2301, %551, %509, %73, %58
  ret void
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

declare dso_local noalias %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local void @perror(i8*) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strcspn(i8*, i8*) #1

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #3

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #4

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #1

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
  br label %1922

; <label>:36:                                     ; preds = %1
  %37 = load %struct.FuncEntry*, %struct.FuncEntry** @allowed_functions_address, align 8
  %38 = icmp ne %struct.FuncEntry* %37, null
  br i1 %38, label %39, label %530

; <label>:39:                                     ; preds = %36
  %40 = getelementptr inbounds [20 x i8], [20 x i8]* %4, i32 0, i32 0
  %41 = load i8*, i8** %2, align 8
  %42 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %40, i64 20, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0), i8* %41) #8
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
  br label %1922

; <label>:531:                                    ; preds = %529
  %532 = load %struct.FuncEntry*, %struct.FuncEntry** %3, align 8
  %533 = icmp eq %struct.FuncEntry* %532, null
  br i1 %533, label %534, label %1921

; <label>:534:                                    ; preds = %531
  br i1 true, label %535, label %1921

; <label>:535:                                    ; preds = %534
  %536 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %537 = load i8*, i8** %2, align 8
  %538 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %536, i64 20, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.12, i32 0, i32 0), i8* %537) #8
  br label %539

; <label>:539:                                    ; preds = %535
  store %struct.LoggedAddrEntry* null, %struct.LoggedAddrEntry** %11, align 8
  %540 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %541 = icmp ne %struct.LoggedAddrEntry* %540, null
  br i1 %541, label %542, label %1024

; <label>:542:                                    ; preds = %539
  br label %543

; <label>:543:                                    ; preds = %542
  br label %544

; <label>:544:                                    ; preds = %543
  %545 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  store i8* %545, i8** %17, align 8
  store i32 -17973521, i32* %13, align 4
  store i32 -1640531527, i32* %15, align 4
  store i32 -1640531527, i32* %14, align 4
  %546 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %547 = call i64 @strlen(i8* %546) #7
  %548 = trunc i64 %547 to i32
  store i32 %548, i32* %16, align 4
  br label %549

; <label>:549:                                    ; preds = %716, %544
  %550 = load i32, i32* %16, align 4
  %551 = icmp uge i32 %550, 12
  br i1 %551, label %552, label %721

; <label>:552:                                    ; preds = %549
  %553 = load i8*, i8** %17, align 8
  %554 = getelementptr inbounds i8, i8* %553, i64 0
  %555 = load i8, i8* %554, align 1
  %556 = zext i8 %555 to i32
  %557 = load i8*, i8** %17, align 8
  %558 = getelementptr inbounds i8, i8* %557, i64 1
  %559 = load i8, i8* %558, align 1
  %560 = zext i8 %559 to i32
  %561 = shl i32 %560, 8
  %562 = add i32 %556, %561
  %563 = load i8*, i8** %17, align 8
  %564 = getelementptr inbounds i8, i8* %563, i64 2
  %565 = load i8, i8* %564, align 1
  %566 = zext i8 %565 to i32
  %567 = shl i32 %566, 16
  %568 = add i32 %562, %567
  %569 = load i8*, i8** %17, align 8
  %570 = getelementptr inbounds i8, i8* %569, i64 3
  %571 = load i8, i8* %570, align 1
  %572 = zext i8 %571 to i32
  %573 = shl i32 %572, 24
  %574 = add i32 %568, %573
  %575 = load i32, i32* %14, align 4
  %576 = add i32 %575, %574
  store i32 %576, i32* %14, align 4
  %577 = load i8*, i8** %17, align 8
  %578 = getelementptr inbounds i8, i8* %577, i64 4
  %579 = load i8, i8* %578, align 1
  %580 = zext i8 %579 to i32
  %581 = load i8*, i8** %17, align 8
  %582 = getelementptr inbounds i8, i8* %581, i64 5
  %583 = load i8, i8* %582, align 1
  %584 = zext i8 %583 to i32
  %585 = shl i32 %584, 8
  %586 = add i32 %580, %585
  %587 = load i8*, i8** %17, align 8
  %588 = getelementptr inbounds i8, i8* %587, i64 6
  %589 = load i8, i8* %588, align 1
  %590 = zext i8 %589 to i32
  %591 = shl i32 %590, 16
  %592 = add i32 %586, %591
  %593 = load i8*, i8** %17, align 8
  %594 = getelementptr inbounds i8, i8* %593, i64 7
  %595 = load i8, i8* %594, align 1
  %596 = zext i8 %595 to i32
  %597 = shl i32 %596, 24
  %598 = add i32 %592, %597
  %599 = load i32, i32* %15, align 4
  %600 = add i32 %599, %598
  store i32 %600, i32* %15, align 4
  %601 = load i8*, i8** %17, align 8
  %602 = getelementptr inbounds i8, i8* %601, i64 8
  %603 = load i8, i8* %602, align 1
  %604 = zext i8 %603 to i32
  %605 = load i8*, i8** %17, align 8
  %606 = getelementptr inbounds i8, i8* %605, i64 9
  %607 = load i8, i8* %606, align 1
  %608 = zext i8 %607 to i32
  %609 = shl i32 %608, 8
  %610 = add i32 %604, %609
  %611 = load i8*, i8** %17, align 8
  %612 = getelementptr inbounds i8, i8* %611, i64 10
  %613 = load i8, i8* %612, align 1
  %614 = zext i8 %613 to i32
  %615 = shl i32 %614, 16
  %616 = add i32 %610, %615
  %617 = load i8*, i8** %17, align 8
  %618 = getelementptr inbounds i8, i8* %617, i64 11
  %619 = load i8, i8* %618, align 1
  %620 = zext i8 %619 to i32
  %621 = shl i32 %620, 24
  %622 = add i32 %616, %621
  %623 = load i32, i32* %13, align 4
  %624 = add i32 %623, %622
  store i32 %624, i32* %13, align 4
  br label %625

; <label>:625:                                    ; preds = %552
  %626 = load i32, i32* %15, align 4
  %627 = load i32, i32* %14, align 4
  %628 = sub i32 %627, %626
  store i32 %628, i32* %14, align 4
  %629 = load i32, i32* %13, align 4
  %630 = load i32, i32* %14, align 4
  %631 = sub i32 %630, %629
  store i32 %631, i32* %14, align 4
  %632 = load i32, i32* %13, align 4
  %633 = lshr i32 %632, 13
  %634 = load i32, i32* %14, align 4
  %635 = xor i32 %634, %633
  store i32 %635, i32* %14, align 4
  %636 = load i32, i32* %13, align 4
  %637 = load i32, i32* %15, align 4
  %638 = sub i32 %637, %636
  store i32 %638, i32* %15, align 4
  %639 = load i32, i32* %14, align 4
  %640 = load i32, i32* %15, align 4
  %641 = sub i32 %640, %639
  store i32 %641, i32* %15, align 4
  %642 = load i32, i32* %14, align 4
  %643 = shl i32 %642, 8
  %644 = load i32, i32* %15, align 4
  %645 = xor i32 %644, %643
  store i32 %645, i32* %15, align 4
  %646 = load i32, i32* %14, align 4
  %647 = load i32, i32* %13, align 4
  %648 = sub i32 %647, %646
  store i32 %648, i32* %13, align 4
  %649 = load i32, i32* %15, align 4
  %650 = load i32, i32* %13, align 4
  %651 = sub i32 %650, %649
  store i32 %651, i32* %13, align 4
  %652 = load i32, i32* %15, align 4
  %653 = lshr i32 %652, 13
  %654 = load i32, i32* %13, align 4
  %655 = xor i32 %654, %653
  store i32 %655, i32* %13, align 4
  %656 = load i32, i32* %15, align 4
  %657 = load i32, i32* %14, align 4
  %658 = sub i32 %657, %656
  store i32 %658, i32* %14, align 4
  %659 = load i32, i32* %13, align 4
  %660 = load i32, i32* %14, align 4
  %661 = sub i32 %660, %659
  store i32 %661, i32* %14, align 4
  %662 = load i32, i32* %13, align 4
  %663 = lshr i32 %662, 12
  %664 = load i32, i32* %14, align 4
  %665 = xor i32 %664, %663
  store i32 %665, i32* %14, align 4
  %666 = load i32, i32* %13, align 4
  %667 = load i32, i32* %15, align 4
  %668 = sub i32 %667, %666
  store i32 %668, i32* %15, align 4
  %669 = load i32, i32* %14, align 4
  %670 = load i32, i32* %15, align 4
  %671 = sub i32 %670, %669
  store i32 %671, i32* %15, align 4
  %672 = load i32, i32* %14, align 4
  %673 = shl i32 %672, 16
  %674 = load i32, i32* %15, align 4
  %675 = xor i32 %674, %673
  store i32 %675, i32* %15, align 4
  %676 = load i32, i32* %14, align 4
  %677 = load i32, i32* %13, align 4
  %678 = sub i32 %677, %676
  store i32 %678, i32* %13, align 4
  %679 = load i32, i32* %15, align 4
  %680 = load i32, i32* %13, align 4
  %681 = sub i32 %680, %679
  store i32 %681, i32* %13, align 4
  %682 = load i32, i32* %15, align 4
  %683 = lshr i32 %682, 5
  %684 = load i32, i32* %13, align 4
  %685 = xor i32 %684, %683
  store i32 %685, i32* %13, align 4
  %686 = load i32, i32* %15, align 4
  %687 = load i32, i32* %14, align 4
  %688 = sub i32 %687, %686
  store i32 %688, i32* %14, align 4
  %689 = load i32, i32* %13, align 4
  %690 = load i32, i32* %14, align 4
  %691 = sub i32 %690, %689
  store i32 %691, i32* %14, align 4
  %692 = load i32, i32* %13, align 4
  %693 = lshr i32 %692, 3
  %694 = load i32, i32* %14, align 4
  %695 = xor i32 %694, %693
  store i32 %695, i32* %14, align 4
  %696 = load i32, i32* %13, align 4
  %697 = load i32, i32* %15, align 4
  %698 = sub i32 %697, %696
  store i32 %698, i32* %15, align 4
  %699 = load i32, i32* %14, align 4
  %700 = load i32, i32* %15, align 4
  %701 = sub i32 %700, %699
  store i32 %701, i32* %15, align 4
  %702 = load i32, i32* %14, align 4
  %703 = shl i32 %702, 10
  %704 = load i32, i32* %15, align 4
  %705 = xor i32 %704, %703
  store i32 %705, i32* %15, align 4
  %706 = load i32, i32* %14, align 4
  %707 = load i32, i32* %13, align 4
  %708 = sub i32 %707, %706
  store i32 %708, i32* %13, align 4
  %709 = load i32, i32* %15, align 4
  %710 = load i32, i32* %13, align 4
  %711 = sub i32 %710, %709
  store i32 %711, i32* %13, align 4
  %712 = load i32, i32* %15, align 4
  %713 = lshr i32 %712, 15
  %714 = load i32, i32* %13, align 4
  %715 = xor i32 %714, %713
  store i32 %715, i32* %13, align 4
  br label %716

; <label>:716:                                    ; preds = %625
  %717 = load i8*, i8** %17, align 8
  %718 = getelementptr inbounds i8, i8* %717, i64 12
  store i8* %718, i8** %17, align 8
  %719 = load i32, i32* %16, align 4
  %720 = sub i32 %719, 12
  store i32 %720, i32* %16, align 4
  br label %549

; <label>:721:                                    ; preds = %549
  %722 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %723 = call i64 @strlen(i8* %722) #7
  %724 = trunc i64 %723 to i32
  %725 = load i32, i32* %13, align 4
  %726 = add i32 %725, %724
  store i32 %726, i32* %13, align 4
  %727 = load i32, i32* %16, align 4
  switch i32 %727, label %814 [
    i32 11, label %728
    i32 10, label %736
    i32 9, label %744
    i32 8, label %752
    i32 7, label %760
    i32 6, label %768
    i32 5, label %776
    i32 4, label %783
    i32 3, label %791
    i32 2, label %799
    i32 1, label %807
  ]

; <label>:728:                                    ; preds = %721
  %729 = load i8*, i8** %17, align 8
  %730 = getelementptr inbounds i8, i8* %729, i64 10
  %731 = load i8, i8* %730, align 1
  %732 = zext i8 %731 to i32
  %733 = shl i32 %732, 24
  %734 = load i32, i32* %13, align 4
  %735 = add i32 %734, %733
  store i32 %735, i32* %13, align 4
  br label %736

; <label>:736:                                    ; preds = %721, %728
  %737 = load i8*, i8** %17, align 8
  %738 = getelementptr inbounds i8, i8* %737, i64 9
  %739 = load i8, i8* %738, align 1
  %740 = zext i8 %739 to i32
  %741 = shl i32 %740, 16
  %742 = load i32, i32* %13, align 4
  %743 = add i32 %742, %741
  store i32 %743, i32* %13, align 4
  br label %744

; <label>:744:                                    ; preds = %721, %736
  %745 = load i8*, i8** %17, align 8
  %746 = getelementptr inbounds i8, i8* %745, i64 8
  %747 = load i8, i8* %746, align 1
  %748 = zext i8 %747 to i32
  %749 = shl i32 %748, 8
  %750 = load i32, i32* %13, align 4
  %751 = add i32 %750, %749
  store i32 %751, i32* %13, align 4
  br label %752

; <label>:752:                                    ; preds = %721, %744
  %753 = load i8*, i8** %17, align 8
  %754 = getelementptr inbounds i8, i8* %753, i64 7
  %755 = load i8, i8* %754, align 1
  %756 = zext i8 %755 to i32
  %757 = shl i32 %756, 24
  %758 = load i32, i32* %15, align 4
  %759 = add i32 %758, %757
  store i32 %759, i32* %15, align 4
  br label %760

; <label>:760:                                    ; preds = %721, %752
  %761 = load i8*, i8** %17, align 8
  %762 = getelementptr inbounds i8, i8* %761, i64 6
  %763 = load i8, i8* %762, align 1
  %764 = zext i8 %763 to i32
  %765 = shl i32 %764, 16
  %766 = load i32, i32* %15, align 4
  %767 = add i32 %766, %765
  store i32 %767, i32* %15, align 4
  br label %768

; <label>:768:                                    ; preds = %721, %760
  %769 = load i8*, i8** %17, align 8
  %770 = getelementptr inbounds i8, i8* %769, i64 5
  %771 = load i8, i8* %770, align 1
  %772 = zext i8 %771 to i32
  %773 = shl i32 %772, 8
  %774 = load i32, i32* %15, align 4
  %775 = add i32 %774, %773
  store i32 %775, i32* %15, align 4
  br label %776

; <label>:776:                                    ; preds = %721, %768
  %777 = load i8*, i8** %17, align 8
  %778 = getelementptr inbounds i8, i8* %777, i64 4
  %779 = load i8, i8* %778, align 1
  %780 = zext i8 %779 to i32
  %781 = load i32, i32* %15, align 4
  %782 = add i32 %781, %780
  store i32 %782, i32* %15, align 4
  br label %783

; <label>:783:                                    ; preds = %721, %776
  %784 = load i8*, i8** %17, align 8
  %785 = getelementptr inbounds i8, i8* %784, i64 3
  %786 = load i8, i8* %785, align 1
  %787 = zext i8 %786 to i32
  %788 = shl i32 %787, 24
  %789 = load i32, i32* %14, align 4
  %790 = add i32 %789, %788
  store i32 %790, i32* %14, align 4
  br label %791

; <label>:791:                                    ; preds = %721, %783
  %792 = load i8*, i8** %17, align 8
  %793 = getelementptr inbounds i8, i8* %792, i64 2
  %794 = load i8, i8* %793, align 1
  %795 = zext i8 %794 to i32
  %796 = shl i32 %795, 16
  %797 = load i32, i32* %14, align 4
  %798 = add i32 %797, %796
  store i32 %798, i32* %14, align 4
  br label %799

; <label>:799:                                    ; preds = %721, %791
  %800 = load i8*, i8** %17, align 8
  %801 = getelementptr inbounds i8, i8* %800, i64 1
  %802 = load i8, i8* %801, align 1
  %803 = zext i8 %802 to i32
  %804 = shl i32 %803, 8
  %805 = load i32, i32* %14, align 4
  %806 = add i32 %805, %804
  store i32 %806, i32* %14, align 4
  br label %807

; <label>:807:                                    ; preds = %721, %799
  %808 = load i8*, i8** %17, align 8
  %809 = getelementptr inbounds i8, i8* %808, i64 0
  %810 = load i8, i8* %809, align 1
  %811 = zext i8 %810 to i32
  %812 = load i32, i32* %14, align 4
  %813 = add i32 %812, %811
  store i32 %813, i32* %14, align 4
  br label %814

; <label>:814:                                    ; preds = %721, %807
  br label %815

; <label>:815:                                    ; preds = %814
  br label %816

; <label>:816:                                    ; preds = %815
  %817 = load i32, i32* %15, align 4
  %818 = load i32, i32* %14, align 4
  %819 = sub i32 %818, %817
  store i32 %819, i32* %14, align 4
  %820 = load i32, i32* %13, align 4
  %821 = load i32, i32* %14, align 4
  %822 = sub i32 %821, %820
  store i32 %822, i32* %14, align 4
  %823 = load i32, i32* %13, align 4
  %824 = lshr i32 %823, 13
  %825 = load i32, i32* %14, align 4
  %826 = xor i32 %825, %824
  store i32 %826, i32* %14, align 4
  %827 = load i32, i32* %13, align 4
  %828 = load i32, i32* %15, align 4
  %829 = sub i32 %828, %827
  store i32 %829, i32* %15, align 4
  %830 = load i32, i32* %14, align 4
  %831 = load i32, i32* %15, align 4
  %832 = sub i32 %831, %830
  store i32 %832, i32* %15, align 4
  %833 = load i32, i32* %14, align 4
  %834 = shl i32 %833, 8
  %835 = load i32, i32* %15, align 4
  %836 = xor i32 %835, %834
  store i32 %836, i32* %15, align 4
  %837 = load i32, i32* %14, align 4
  %838 = load i32, i32* %13, align 4
  %839 = sub i32 %838, %837
  store i32 %839, i32* %13, align 4
  %840 = load i32, i32* %15, align 4
  %841 = load i32, i32* %13, align 4
  %842 = sub i32 %841, %840
  store i32 %842, i32* %13, align 4
  %843 = load i32, i32* %15, align 4
  %844 = lshr i32 %843, 13
  %845 = load i32, i32* %13, align 4
  %846 = xor i32 %845, %844
  store i32 %846, i32* %13, align 4
  %847 = load i32, i32* %15, align 4
  %848 = load i32, i32* %14, align 4
  %849 = sub i32 %848, %847
  store i32 %849, i32* %14, align 4
  %850 = load i32, i32* %13, align 4
  %851 = load i32, i32* %14, align 4
  %852 = sub i32 %851, %850
  store i32 %852, i32* %14, align 4
  %853 = load i32, i32* %13, align 4
  %854 = lshr i32 %853, 12
  %855 = load i32, i32* %14, align 4
  %856 = xor i32 %855, %854
  store i32 %856, i32* %14, align 4
  %857 = load i32, i32* %13, align 4
  %858 = load i32, i32* %15, align 4
  %859 = sub i32 %858, %857
  store i32 %859, i32* %15, align 4
  %860 = load i32, i32* %14, align 4
  %861 = load i32, i32* %15, align 4
  %862 = sub i32 %861, %860
  store i32 %862, i32* %15, align 4
  %863 = load i32, i32* %14, align 4
  %864 = shl i32 %863, 16
  %865 = load i32, i32* %15, align 4
  %866 = xor i32 %865, %864
  store i32 %866, i32* %15, align 4
  %867 = load i32, i32* %14, align 4
  %868 = load i32, i32* %13, align 4
  %869 = sub i32 %868, %867
  store i32 %869, i32* %13, align 4
  %870 = load i32, i32* %15, align 4
  %871 = load i32, i32* %13, align 4
  %872 = sub i32 %871, %870
  store i32 %872, i32* %13, align 4
  %873 = load i32, i32* %15, align 4
  %874 = lshr i32 %873, 5
  %875 = load i32, i32* %13, align 4
  %876 = xor i32 %875, %874
  store i32 %876, i32* %13, align 4
  %877 = load i32, i32* %15, align 4
  %878 = load i32, i32* %14, align 4
  %879 = sub i32 %878, %877
  store i32 %879, i32* %14, align 4
  %880 = load i32, i32* %13, align 4
  %881 = load i32, i32* %14, align 4
  %882 = sub i32 %881, %880
  store i32 %882, i32* %14, align 4
  %883 = load i32, i32* %13, align 4
  %884 = lshr i32 %883, 3
  %885 = load i32, i32* %14, align 4
  %886 = xor i32 %885, %884
  store i32 %886, i32* %14, align 4
  %887 = load i32, i32* %13, align 4
  %888 = load i32, i32* %15, align 4
  %889 = sub i32 %888, %887
  store i32 %889, i32* %15, align 4
  %890 = load i32, i32* %14, align 4
  %891 = load i32, i32* %15, align 4
  %892 = sub i32 %891, %890
  store i32 %892, i32* %15, align 4
  %893 = load i32, i32* %14, align 4
  %894 = shl i32 %893, 10
  %895 = load i32, i32* %15, align 4
  %896 = xor i32 %895, %894
  store i32 %896, i32* %15, align 4
  %897 = load i32, i32* %14, align 4
  %898 = load i32, i32* %13, align 4
  %899 = sub i32 %898, %897
  store i32 %899, i32* %13, align 4
  %900 = load i32, i32* %15, align 4
  %901 = load i32, i32* %13, align 4
  %902 = sub i32 %901, %900
  store i32 %902, i32* %13, align 4
  %903 = load i32, i32* %15, align 4
  %904 = lshr i32 %903, 15
  %905 = load i32, i32* %13, align 4
  %906 = xor i32 %905, %904
  store i32 %906, i32* %13, align 4
  br label %907

; <label>:907:                                    ; preds = %816
  br label %908

; <label>:908:                                    ; preds = %907
  br label %909

; <label>:909:                                    ; preds = %908
  br label %910

; <label>:910:                                    ; preds = %909
  store %struct.LoggedAddrEntry* null, %struct.LoggedAddrEntry** %11, align 8
  %911 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %912 = icmp ne %struct.LoggedAddrEntry* %911, null
  br i1 %912, label %913, label %1022

; <label>:913:                                    ; preds = %910
  br label %914

; <label>:914:                                    ; preds = %913
  %915 = load i32, i32* %13, align 4
  %916 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %917 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %916, i32 0, i32 1
  %918 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %917, i32 0, i32 0
  %919 = load %struct.UT_hash_table*, %struct.UT_hash_table** %918, align 8
  %920 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %919, i32 0, i32 1
  %921 = load i32, i32* %920, align 8
  %922 = sub i32 %921, 1
  %923 = and i32 %915, %922
  store i32 %923, i32* %18, align 4
  br label %924

; <label>:924:                                    ; preds = %914
  br label %925

; <label>:925:                                    ; preds = %924
  %926 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %927 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %926, i32 0, i32 1
  %928 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %927, i32 0, i32 0
  %929 = load %struct.UT_hash_table*, %struct.UT_hash_table** %928, align 8
  %930 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %929, i32 0, i32 0
  %931 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %930, align 8
  %932 = load i32, i32* %18, align 4
  %933 = zext i32 %932 to i64
  %934 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %931, i64 %933
  %935 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %934, i32 0, i32 0
  %936 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %935, align 8
  %937 = icmp ne %struct.UT_hash_handle* %936, null
  br i1 %937, label %938, label %962

; <label>:938:                                    ; preds = %925
  br label %939

; <label>:939:                                    ; preds = %938
  %940 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %941 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %940, i32 0, i32 1
  %942 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %941, i32 0, i32 0
  %943 = load %struct.UT_hash_table*, %struct.UT_hash_table** %942, align 8
  %944 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %943, i32 0, i32 0
  %945 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %944, align 8
  %946 = load i32, i32* %18, align 4
  %947 = zext i32 %946 to i64
  %948 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %945, i64 %947
  %949 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %948, i32 0, i32 0
  %950 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %949, align 8
  %951 = bitcast %struct.UT_hash_handle* %950 to i8*
  %952 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %953 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %952, i32 0, i32 1
  %954 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %953, i32 0, i32 0
  %955 = load %struct.UT_hash_table*, %struct.UT_hash_table** %954, align 8
  %956 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %955, i32 0, i32 5
  %957 = load i64, i64* %956, align 8
  %958 = sub i64 0, %957
  %959 = getelementptr inbounds i8, i8* %951, i64 %958
  %960 = bitcast i8* %959 to %struct.LoggedAddrEntry*
  store %struct.LoggedAddrEntry* %960, %struct.LoggedAddrEntry** %11, align 8
  br label %961

; <label>:961:                                    ; preds = %939
  br label %963

; <label>:962:                                    ; preds = %925
  store %struct.LoggedAddrEntry* null, %struct.LoggedAddrEntry** %11, align 8
  br label %963

; <label>:963:                                    ; preds = %962, %961
  br label %964

; <label>:964:                                    ; preds = %1019, %963
  %965 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %966 = icmp ne %struct.LoggedAddrEntry* %965, null
  br i1 %966, label %967, label %1020

; <label>:967:                                    ; preds = %964
  %968 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %969 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %968, i32 0, i32 1
  %970 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %969, i32 0, i32 7
  %971 = load i32, i32* %970, align 4
  %972 = load i32, i32* %13, align 4
  %973 = icmp eq i32 %971, %972
  br i1 %973, label %974, label %995

; <label>:974:                                    ; preds = %967
  %975 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %976 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %975, i32 0, i32 1
  %977 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %976, i32 0, i32 6
  %978 = load i32, i32* %977, align 8
  %979 = zext i32 %978 to i64
  %980 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %981 = call i64 @strlen(i8* %980) #7
  %982 = icmp eq i64 %979, %981
  br i1 %982, label %983, label %995

; <label>:983:                                    ; preds = %974
  %984 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %985 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %984, i32 0, i32 1
  %986 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %985, i32 0, i32 5
  %987 = load i8*, i8** %986, align 8
  %988 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %989 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %990 = call i64 @strlen(i8* %989) #7
  %991 = call i32 @memcmp(i8* %987, i8* %988, i64 %990) #7
  %992 = icmp eq i32 %991, 0
  br i1 %992, label %993, label %994

; <label>:993:                                    ; preds = %983
  br label %1020

; <label>:994:                                    ; preds = %983
  br label %995

; <label>:995:                                    ; preds = %994, %974, %967
  %996 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %997 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %996, i32 0, i32 1
  %998 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %997, i32 0, i32 4
  %999 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %998, align 8
  %1000 = icmp ne %struct.UT_hash_handle* %999, null
  br i1 %1000, label %1001, label %1018

; <label>:1001:                                   ; preds = %995
  br label %1002

; <label>:1002:                                   ; preds = %1001
  %1003 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1004 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1003, i32 0, i32 1
  %1005 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1004, i32 0, i32 4
  %1006 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1005, align 8
  %1007 = bitcast %struct.UT_hash_handle* %1006 to i8*
  %1008 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1009 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1008, i32 0, i32 1
  %1010 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1009, i32 0, i32 0
  %1011 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1010, align 8
  %1012 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1011, i32 0, i32 5
  %1013 = load i64, i64* %1012, align 8
  %1014 = sub i64 0, %1013
  %1015 = getelementptr inbounds i8, i8* %1007, i64 %1014
  %1016 = bitcast i8* %1015 to %struct.LoggedAddrEntry*
  store %struct.LoggedAddrEntry* %1016, %struct.LoggedAddrEntry** %11, align 8
  br label %1017

; <label>:1017:                                   ; preds = %1002
  br label %1019

; <label>:1018:                                   ; preds = %995
  store %struct.LoggedAddrEntry* null, %struct.LoggedAddrEntry** %11, align 8
  br label %1019

; <label>:1019:                                   ; preds = %1018, %1017
  br label %964

; <label>:1020:                                   ; preds = %993, %964
  br label %1021

; <label>:1021:                                   ; preds = %1020
  br label %1022

; <label>:1022:                                   ; preds = %1021, %910
  br label %1023

; <label>:1023:                                   ; preds = %1022
  br label %1024

; <label>:1024:                                   ; preds = %1023, %539
  br label %1025

; <label>:1025:                                   ; preds = %1024
  %1026 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1027 = icmp eq %struct.LoggedAddrEntry* %1026, null
  br i1 %1027, label %1028, label %1920

; <label>:1028:                                   ; preds = %1025
  %1029 = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  store %struct._IO_FILE* %1029, %struct._IO_FILE** %19, align 8
  %1030 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %1031 = icmp ne %struct._IO_FILE* %1030, null
  br i1 %1031, label %1032, label %1038

; <label>:1032:                                   ; preds = %1028
  %1033 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %1034 = load i8*, i8** %2, align 8
  %1035 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1033, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.16, i32 0, i32 0), i8* %1034, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @new_mode_buf, i32 0, i32 0))
  %1036 = load %struct._IO_FILE*, %struct._IO_FILE** %19, align 8
  %1037 = call i32 @fclose(%struct._IO_FILE* %1036)
  br label %1040

; <label>:1038:                                   ; preds = %1028
  %1039 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.17, i32 0, i32 0))
  br label %1040

; <label>:1040:                                   ; preds = %1038, %1032
  %1041 = call noalias i8* @malloc(i64 80) #8
  %1042 = bitcast i8* %1041 to %struct.LoggedAddrEntry*
  store %struct.LoggedAddrEntry* %1042, %struct.LoggedAddrEntry** %11, align 8
  %1043 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1044 = icmp ne %struct.LoggedAddrEntry* %1043, null
  br i1 %1044, label %1045, label %1918

; <label>:1045:                                   ; preds = %1040
  %1046 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1047 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1046, i32 0, i32 0
  %1048 = getelementptr inbounds [20 x i8], [20 x i8]* %1047, i32 0, i32 0
  %1049 = getelementptr inbounds [20 x i8], [20 x i8]* %12, i32 0, i32 0
  %1050 = call i8* @strncpy(i8* %1048, i8* %1049, i64 19) #8
  br label %1051

; <label>:1051:                                   ; preds = %1045
  br label %1052

; <label>:1052:                                   ; preds = %1051
  br label %1053

; <label>:1053:                                   ; preds = %1052
  %1054 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1055 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1054, i32 0, i32 0
  %1056 = bitcast [20 x i8]* %1055 to i8*
  store i8* %1056, i8** %24, align 8
  store i32 -17973521, i32* %20, align 4
  store i32 -1640531527, i32* %22, align 4
  store i32 -1640531527, i32* %21, align 4
  %1057 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1058 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1057, i32 0, i32 0
  %1059 = getelementptr inbounds [20 x i8], [20 x i8]* %1058, i32 0, i32 0
  %1060 = call i64 @strlen(i8* %1059) #7
  %1061 = trunc i64 %1060 to i32
  store i32 %1061, i32* %23, align 4
  br label %1062

; <label>:1062:                                   ; preds = %1229, %1053
  %1063 = load i32, i32* %23, align 4
  %1064 = icmp uge i32 %1063, 12
  br i1 %1064, label %1065, label %1234

; <label>:1065:                                   ; preds = %1062
  %1066 = load i8*, i8** %24, align 8
  %1067 = getelementptr inbounds i8, i8* %1066, i64 0
  %1068 = load i8, i8* %1067, align 1
  %1069 = zext i8 %1068 to i32
  %1070 = load i8*, i8** %24, align 8
  %1071 = getelementptr inbounds i8, i8* %1070, i64 1
  %1072 = load i8, i8* %1071, align 1
  %1073 = zext i8 %1072 to i32
  %1074 = shl i32 %1073, 8
  %1075 = add i32 %1069, %1074
  %1076 = load i8*, i8** %24, align 8
  %1077 = getelementptr inbounds i8, i8* %1076, i64 2
  %1078 = load i8, i8* %1077, align 1
  %1079 = zext i8 %1078 to i32
  %1080 = shl i32 %1079, 16
  %1081 = add i32 %1075, %1080
  %1082 = load i8*, i8** %24, align 8
  %1083 = getelementptr inbounds i8, i8* %1082, i64 3
  %1084 = load i8, i8* %1083, align 1
  %1085 = zext i8 %1084 to i32
  %1086 = shl i32 %1085, 24
  %1087 = add i32 %1081, %1086
  %1088 = load i32, i32* %21, align 4
  %1089 = add i32 %1088, %1087
  store i32 %1089, i32* %21, align 4
  %1090 = load i8*, i8** %24, align 8
  %1091 = getelementptr inbounds i8, i8* %1090, i64 4
  %1092 = load i8, i8* %1091, align 1
  %1093 = zext i8 %1092 to i32
  %1094 = load i8*, i8** %24, align 8
  %1095 = getelementptr inbounds i8, i8* %1094, i64 5
  %1096 = load i8, i8* %1095, align 1
  %1097 = zext i8 %1096 to i32
  %1098 = shl i32 %1097, 8
  %1099 = add i32 %1093, %1098
  %1100 = load i8*, i8** %24, align 8
  %1101 = getelementptr inbounds i8, i8* %1100, i64 6
  %1102 = load i8, i8* %1101, align 1
  %1103 = zext i8 %1102 to i32
  %1104 = shl i32 %1103, 16
  %1105 = add i32 %1099, %1104
  %1106 = load i8*, i8** %24, align 8
  %1107 = getelementptr inbounds i8, i8* %1106, i64 7
  %1108 = load i8, i8* %1107, align 1
  %1109 = zext i8 %1108 to i32
  %1110 = shl i32 %1109, 24
  %1111 = add i32 %1105, %1110
  %1112 = load i32, i32* %22, align 4
  %1113 = add i32 %1112, %1111
  store i32 %1113, i32* %22, align 4
  %1114 = load i8*, i8** %24, align 8
  %1115 = getelementptr inbounds i8, i8* %1114, i64 8
  %1116 = load i8, i8* %1115, align 1
  %1117 = zext i8 %1116 to i32
  %1118 = load i8*, i8** %24, align 8
  %1119 = getelementptr inbounds i8, i8* %1118, i64 9
  %1120 = load i8, i8* %1119, align 1
  %1121 = zext i8 %1120 to i32
  %1122 = shl i32 %1121, 8
  %1123 = add i32 %1117, %1122
  %1124 = load i8*, i8** %24, align 8
  %1125 = getelementptr inbounds i8, i8* %1124, i64 10
  %1126 = load i8, i8* %1125, align 1
  %1127 = zext i8 %1126 to i32
  %1128 = shl i32 %1127, 16
  %1129 = add i32 %1123, %1128
  %1130 = load i8*, i8** %24, align 8
  %1131 = getelementptr inbounds i8, i8* %1130, i64 11
  %1132 = load i8, i8* %1131, align 1
  %1133 = zext i8 %1132 to i32
  %1134 = shl i32 %1133, 24
  %1135 = add i32 %1129, %1134
  %1136 = load i32, i32* %20, align 4
  %1137 = add i32 %1136, %1135
  store i32 %1137, i32* %20, align 4
  br label %1138

; <label>:1138:                                   ; preds = %1065
  %1139 = load i32, i32* %22, align 4
  %1140 = load i32, i32* %21, align 4
  %1141 = sub i32 %1140, %1139
  store i32 %1141, i32* %21, align 4
  %1142 = load i32, i32* %20, align 4
  %1143 = load i32, i32* %21, align 4
  %1144 = sub i32 %1143, %1142
  store i32 %1144, i32* %21, align 4
  %1145 = load i32, i32* %20, align 4
  %1146 = lshr i32 %1145, 13
  %1147 = load i32, i32* %21, align 4
  %1148 = xor i32 %1147, %1146
  store i32 %1148, i32* %21, align 4
  %1149 = load i32, i32* %20, align 4
  %1150 = load i32, i32* %22, align 4
  %1151 = sub i32 %1150, %1149
  store i32 %1151, i32* %22, align 4
  %1152 = load i32, i32* %21, align 4
  %1153 = load i32, i32* %22, align 4
  %1154 = sub i32 %1153, %1152
  store i32 %1154, i32* %22, align 4
  %1155 = load i32, i32* %21, align 4
  %1156 = shl i32 %1155, 8
  %1157 = load i32, i32* %22, align 4
  %1158 = xor i32 %1157, %1156
  store i32 %1158, i32* %22, align 4
  %1159 = load i32, i32* %21, align 4
  %1160 = load i32, i32* %20, align 4
  %1161 = sub i32 %1160, %1159
  store i32 %1161, i32* %20, align 4
  %1162 = load i32, i32* %22, align 4
  %1163 = load i32, i32* %20, align 4
  %1164 = sub i32 %1163, %1162
  store i32 %1164, i32* %20, align 4
  %1165 = load i32, i32* %22, align 4
  %1166 = lshr i32 %1165, 13
  %1167 = load i32, i32* %20, align 4
  %1168 = xor i32 %1167, %1166
  store i32 %1168, i32* %20, align 4
  %1169 = load i32, i32* %22, align 4
  %1170 = load i32, i32* %21, align 4
  %1171 = sub i32 %1170, %1169
  store i32 %1171, i32* %21, align 4
  %1172 = load i32, i32* %20, align 4
  %1173 = load i32, i32* %21, align 4
  %1174 = sub i32 %1173, %1172
  store i32 %1174, i32* %21, align 4
  %1175 = load i32, i32* %20, align 4
  %1176 = lshr i32 %1175, 12
  %1177 = load i32, i32* %21, align 4
  %1178 = xor i32 %1177, %1176
  store i32 %1178, i32* %21, align 4
  %1179 = load i32, i32* %20, align 4
  %1180 = load i32, i32* %22, align 4
  %1181 = sub i32 %1180, %1179
  store i32 %1181, i32* %22, align 4
  %1182 = load i32, i32* %21, align 4
  %1183 = load i32, i32* %22, align 4
  %1184 = sub i32 %1183, %1182
  store i32 %1184, i32* %22, align 4
  %1185 = load i32, i32* %21, align 4
  %1186 = shl i32 %1185, 16
  %1187 = load i32, i32* %22, align 4
  %1188 = xor i32 %1187, %1186
  store i32 %1188, i32* %22, align 4
  %1189 = load i32, i32* %21, align 4
  %1190 = load i32, i32* %20, align 4
  %1191 = sub i32 %1190, %1189
  store i32 %1191, i32* %20, align 4
  %1192 = load i32, i32* %22, align 4
  %1193 = load i32, i32* %20, align 4
  %1194 = sub i32 %1193, %1192
  store i32 %1194, i32* %20, align 4
  %1195 = load i32, i32* %22, align 4
  %1196 = lshr i32 %1195, 5
  %1197 = load i32, i32* %20, align 4
  %1198 = xor i32 %1197, %1196
  store i32 %1198, i32* %20, align 4
  %1199 = load i32, i32* %22, align 4
  %1200 = load i32, i32* %21, align 4
  %1201 = sub i32 %1200, %1199
  store i32 %1201, i32* %21, align 4
  %1202 = load i32, i32* %20, align 4
  %1203 = load i32, i32* %21, align 4
  %1204 = sub i32 %1203, %1202
  store i32 %1204, i32* %21, align 4
  %1205 = load i32, i32* %20, align 4
  %1206 = lshr i32 %1205, 3
  %1207 = load i32, i32* %21, align 4
  %1208 = xor i32 %1207, %1206
  store i32 %1208, i32* %21, align 4
  %1209 = load i32, i32* %20, align 4
  %1210 = load i32, i32* %22, align 4
  %1211 = sub i32 %1210, %1209
  store i32 %1211, i32* %22, align 4
  %1212 = load i32, i32* %21, align 4
  %1213 = load i32, i32* %22, align 4
  %1214 = sub i32 %1213, %1212
  store i32 %1214, i32* %22, align 4
  %1215 = load i32, i32* %21, align 4
  %1216 = shl i32 %1215, 10
  %1217 = load i32, i32* %22, align 4
  %1218 = xor i32 %1217, %1216
  store i32 %1218, i32* %22, align 4
  %1219 = load i32, i32* %21, align 4
  %1220 = load i32, i32* %20, align 4
  %1221 = sub i32 %1220, %1219
  store i32 %1221, i32* %20, align 4
  %1222 = load i32, i32* %22, align 4
  %1223 = load i32, i32* %20, align 4
  %1224 = sub i32 %1223, %1222
  store i32 %1224, i32* %20, align 4
  %1225 = load i32, i32* %22, align 4
  %1226 = lshr i32 %1225, 15
  %1227 = load i32, i32* %20, align 4
  %1228 = xor i32 %1227, %1226
  store i32 %1228, i32* %20, align 4
  br label %1229

; <label>:1229:                                   ; preds = %1138
  %1230 = load i8*, i8** %24, align 8
  %1231 = getelementptr inbounds i8, i8* %1230, i64 12
  store i8* %1231, i8** %24, align 8
  %1232 = load i32, i32* %23, align 4
  %1233 = sub i32 %1232, 12
  store i32 %1233, i32* %23, align 4
  br label %1062

; <label>:1234:                                   ; preds = %1062
  %1235 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1236 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1235, i32 0, i32 0
  %1237 = getelementptr inbounds [20 x i8], [20 x i8]* %1236, i32 0, i32 0
  %1238 = call i64 @strlen(i8* %1237) #7
  %1239 = trunc i64 %1238 to i32
  %1240 = load i32, i32* %20, align 4
  %1241 = add i32 %1240, %1239
  store i32 %1241, i32* %20, align 4
  %1242 = load i32, i32* %23, align 4
  switch i32 %1242, label %1329 [
    i32 11, label %1243
    i32 10, label %1251
    i32 9, label %1259
    i32 8, label %1267
    i32 7, label %1275
    i32 6, label %1283
    i32 5, label %1291
    i32 4, label %1298
    i32 3, label %1306
    i32 2, label %1314
    i32 1, label %1322
  ]

; <label>:1243:                                   ; preds = %1234
  %1244 = load i8*, i8** %24, align 8
  %1245 = getelementptr inbounds i8, i8* %1244, i64 10
  %1246 = load i8, i8* %1245, align 1
  %1247 = zext i8 %1246 to i32
  %1248 = shl i32 %1247, 24
  %1249 = load i32, i32* %20, align 4
  %1250 = add i32 %1249, %1248
  store i32 %1250, i32* %20, align 4
  br label %1251

; <label>:1251:                                   ; preds = %1234, %1243
  %1252 = load i8*, i8** %24, align 8
  %1253 = getelementptr inbounds i8, i8* %1252, i64 9
  %1254 = load i8, i8* %1253, align 1
  %1255 = zext i8 %1254 to i32
  %1256 = shl i32 %1255, 16
  %1257 = load i32, i32* %20, align 4
  %1258 = add i32 %1257, %1256
  store i32 %1258, i32* %20, align 4
  br label %1259

; <label>:1259:                                   ; preds = %1234, %1251
  %1260 = load i8*, i8** %24, align 8
  %1261 = getelementptr inbounds i8, i8* %1260, i64 8
  %1262 = load i8, i8* %1261, align 1
  %1263 = zext i8 %1262 to i32
  %1264 = shl i32 %1263, 8
  %1265 = load i32, i32* %20, align 4
  %1266 = add i32 %1265, %1264
  store i32 %1266, i32* %20, align 4
  br label %1267

; <label>:1267:                                   ; preds = %1234, %1259
  %1268 = load i8*, i8** %24, align 8
  %1269 = getelementptr inbounds i8, i8* %1268, i64 7
  %1270 = load i8, i8* %1269, align 1
  %1271 = zext i8 %1270 to i32
  %1272 = shl i32 %1271, 24
  %1273 = load i32, i32* %22, align 4
  %1274 = add i32 %1273, %1272
  store i32 %1274, i32* %22, align 4
  br label %1275

; <label>:1275:                                   ; preds = %1234, %1267
  %1276 = load i8*, i8** %24, align 8
  %1277 = getelementptr inbounds i8, i8* %1276, i64 6
  %1278 = load i8, i8* %1277, align 1
  %1279 = zext i8 %1278 to i32
  %1280 = shl i32 %1279, 16
  %1281 = load i32, i32* %22, align 4
  %1282 = add i32 %1281, %1280
  store i32 %1282, i32* %22, align 4
  br label %1283

; <label>:1283:                                   ; preds = %1234, %1275
  %1284 = load i8*, i8** %24, align 8
  %1285 = getelementptr inbounds i8, i8* %1284, i64 5
  %1286 = load i8, i8* %1285, align 1
  %1287 = zext i8 %1286 to i32
  %1288 = shl i32 %1287, 8
  %1289 = load i32, i32* %22, align 4
  %1290 = add i32 %1289, %1288
  store i32 %1290, i32* %22, align 4
  br label %1291

; <label>:1291:                                   ; preds = %1234, %1283
  %1292 = load i8*, i8** %24, align 8
  %1293 = getelementptr inbounds i8, i8* %1292, i64 4
  %1294 = load i8, i8* %1293, align 1
  %1295 = zext i8 %1294 to i32
  %1296 = load i32, i32* %22, align 4
  %1297 = add i32 %1296, %1295
  store i32 %1297, i32* %22, align 4
  br label %1298

; <label>:1298:                                   ; preds = %1234, %1291
  %1299 = load i8*, i8** %24, align 8
  %1300 = getelementptr inbounds i8, i8* %1299, i64 3
  %1301 = load i8, i8* %1300, align 1
  %1302 = zext i8 %1301 to i32
  %1303 = shl i32 %1302, 24
  %1304 = load i32, i32* %21, align 4
  %1305 = add i32 %1304, %1303
  store i32 %1305, i32* %21, align 4
  br label %1306

; <label>:1306:                                   ; preds = %1234, %1298
  %1307 = load i8*, i8** %24, align 8
  %1308 = getelementptr inbounds i8, i8* %1307, i64 2
  %1309 = load i8, i8* %1308, align 1
  %1310 = zext i8 %1309 to i32
  %1311 = shl i32 %1310, 16
  %1312 = load i32, i32* %21, align 4
  %1313 = add i32 %1312, %1311
  store i32 %1313, i32* %21, align 4
  br label %1314

; <label>:1314:                                   ; preds = %1234, %1306
  %1315 = load i8*, i8** %24, align 8
  %1316 = getelementptr inbounds i8, i8* %1315, i64 1
  %1317 = load i8, i8* %1316, align 1
  %1318 = zext i8 %1317 to i32
  %1319 = shl i32 %1318, 8
  %1320 = load i32, i32* %21, align 4
  %1321 = add i32 %1320, %1319
  store i32 %1321, i32* %21, align 4
  br label %1322

; <label>:1322:                                   ; preds = %1234, %1314
  %1323 = load i8*, i8** %24, align 8
  %1324 = getelementptr inbounds i8, i8* %1323, i64 0
  %1325 = load i8, i8* %1324, align 1
  %1326 = zext i8 %1325 to i32
  %1327 = load i32, i32* %21, align 4
  %1328 = add i32 %1327, %1326
  store i32 %1328, i32* %21, align 4
  br label %1329

; <label>:1329:                                   ; preds = %1234, %1322
  br label %1330

; <label>:1330:                                   ; preds = %1329
  br label %1331

; <label>:1331:                                   ; preds = %1330
  %1332 = load i32, i32* %22, align 4
  %1333 = load i32, i32* %21, align 4
  %1334 = sub i32 %1333, %1332
  store i32 %1334, i32* %21, align 4
  %1335 = load i32, i32* %20, align 4
  %1336 = load i32, i32* %21, align 4
  %1337 = sub i32 %1336, %1335
  store i32 %1337, i32* %21, align 4
  %1338 = load i32, i32* %20, align 4
  %1339 = lshr i32 %1338, 13
  %1340 = load i32, i32* %21, align 4
  %1341 = xor i32 %1340, %1339
  store i32 %1341, i32* %21, align 4
  %1342 = load i32, i32* %20, align 4
  %1343 = load i32, i32* %22, align 4
  %1344 = sub i32 %1343, %1342
  store i32 %1344, i32* %22, align 4
  %1345 = load i32, i32* %21, align 4
  %1346 = load i32, i32* %22, align 4
  %1347 = sub i32 %1346, %1345
  store i32 %1347, i32* %22, align 4
  %1348 = load i32, i32* %21, align 4
  %1349 = shl i32 %1348, 8
  %1350 = load i32, i32* %22, align 4
  %1351 = xor i32 %1350, %1349
  store i32 %1351, i32* %22, align 4
  %1352 = load i32, i32* %21, align 4
  %1353 = load i32, i32* %20, align 4
  %1354 = sub i32 %1353, %1352
  store i32 %1354, i32* %20, align 4
  %1355 = load i32, i32* %22, align 4
  %1356 = load i32, i32* %20, align 4
  %1357 = sub i32 %1356, %1355
  store i32 %1357, i32* %20, align 4
  %1358 = load i32, i32* %22, align 4
  %1359 = lshr i32 %1358, 13
  %1360 = load i32, i32* %20, align 4
  %1361 = xor i32 %1360, %1359
  store i32 %1361, i32* %20, align 4
  %1362 = load i32, i32* %22, align 4
  %1363 = load i32, i32* %21, align 4
  %1364 = sub i32 %1363, %1362
  store i32 %1364, i32* %21, align 4
  %1365 = load i32, i32* %20, align 4
  %1366 = load i32, i32* %21, align 4
  %1367 = sub i32 %1366, %1365
  store i32 %1367, i32* %21, align 4
  %1368 = load i32, i32* %20, align 4
  %1369 = lshr i32 %1368, 12
  %1370 = load i32, i32* %21, align 4
  %1371 = xor i32 %1370, %1369
  store i32 %1371, i32* %21, align 4
  %1372 = load i32, i32* %20, align 4
  %1373 = load i32, i32* %22, align 4
  %1374 = sub i32 %1373, %1372
  store i32 %1374, i32* %22, align 4
  %1375 = load i32, i32* %21, align 4
  %1376 = load i32, i32* %22, align 4
  %1377 = sub i32 %1376, %1375
  store i32 %1377, i32* %22, align 4
  %1378 = load i32, i32* %21, align 4
  %1379 = shl i32 %1378, 16
  %1380 = load i32, i32* %22, align 4
  %1381 = xor i32 %1380, %1379
  store i32 %1381, i32* %22, align 4
  %1382 = load i32, i32* %21, align 4
  %1383 = load i32, i32* %20, align 4
  %1384 = sub i32 %1383, %1382
  store i32 %1384, i32* %20, align 4
  %1385 = load i32, i32* %22, align 4
  %1386 = load i32, i32* %20, align 4
  %1387 = sub i32 %1386, %1385
  store i32 %1387, i32* %20, align 4
  %1388 = load i32, i32* %22, align 4
  %1389 = lshr i32 %1388, 5
  %1390 = load i32, i32* %20, align 4
  %1391 = xor i32 %1390, %1389
  store i32 %1391, i32* %20, align 4
  %1392 = load i32, i32* %22, align 4
  %1393 = load i32, i32* %21, align 4
  %1394 = sub i32 %1393, %1392
  store i32 %1394, i32* %21, align 4
  %1395 = load i32, i32* %20, align 4
  %1396 = load i32, i32* %21, align 4
  %1397 = sub i32 %1396, %1395
  store i32 %1397, i32* %21, align 4
  %1398 = load i32, i32* %20, align 4
  %1399 = lshr i32 %1398, 3
  %1400 = load i32, i32* %21, align 4
  %1401 = xor i32 %1400, %1399
  store i32 %1401, i32* %21, align 4
  %1402 = load i32, i32* %20, align 4
  %1403 = load i32, i32* %22, align 4
  %1404 = sub i32 %1403, %1402
  store i32 %1404, i32* %22, align 4
  %1405 = load i32, i32* %21, align 4
  %1406 = load i32, i32* %22, align 4
  %1407 = sub i32 %1406, %1405
  store i32 %1407, i32* %22, align 4
  %1408 = load i32, i32* %21, align 4
  %1409 = shl i32 %1408, 10
  %1410 = load i32, i32* %22, align 4
  %1411 = xor i32 %1410, %1409
  store i32 %1411, i32* %22, align 4
  %1412 = load i32, i32* %21, align 4
  %1413 = load i32, i32* %20, align 4
  %1414 = sub i32 %1413, %1412
  store i32 %1414, i32* %20, align 4
  %1415 = load i32, i32* %22, align 4
  %1416 = load i32, i32* %20, align 4
  %1417 = sub i32 %1416, %1415
  store i32 %1417, i32* %20, align 4
  %1418 = load i32, i32* %22, align 4
  %1419 = lshr i32 %1418, 15
  %1420 = load i32, i32* %20, align 4
  %1421 = xor i32 %1420, %1419
  store i32 %1421, i32* %20, align 4
  br label %1422

; <label>:1422:                                   ; preds = %1331
  br label %1423

; <label>:1423:                                   ; preds = %1422
  br label %1424

; <label>:1424:                                   ; preds = %1423
  br label %1425

; <label>:1425:                                   ; preds = %1424
  %1426 = load i32, i32* %20, align 4
  %1427 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1428 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1427, i32 0, i32 1
  %1429 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1428, i32 0, i32 7
  store i32 %1426, i32* %1429, align 4
  %1430 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1431 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1430, i32 0, i32 0
  %1432 = bitcast [20 x i8]* %1431 to i8*
  %1433 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1434 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1433, i32 0, i32 1
  %1435 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1434, i32 0, i32 5
  store i8* %1432, i8** %1435, align 8
  %1436 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1437 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1436, i32 0, i32 0
  %1438 = getelementptr inbounds [20 x i8], [20 x i8]* %1437, i32 0, i32 0
  %1439 = call i64 @strlen(i8* %1438) #7
  %1440 = trunc i64 %1439 to i32
  %1441 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1442 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1441, i32 0, i32 1
  %1443 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1442, i32 0, i32 6
  store i32 %1440, i32* %1443, align 8
  %1444 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1445 = icmp ne %struct.LoggedAddrEntry* %1444, null
  br i1 %1445, label %1533, label %1446

; <label>:1446:                                   ; preds = %1425
  %1447 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1448 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1447, i32 0, i32 1
  %1449 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1448, i32 0, i32 2
  store i8* null, i8** %1449, align 8
  %1450 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1451 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1450, i32 0, i32 1
  %1452 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1451, i32 0, i32 1
  store i8* null, i8** %1452, align 8
  br label %1453

; <label>:1453:                                   ; preds = %1446
  %1454 = call noalias i8* @malloc(i64 64) #8
  %1455 = bitcast i8* %1454 to %struct.UT_hash_table*
  %1456 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1457 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1456, i32 0, i32 1
  %1458 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1457, i32 0, i32 0
  store %struct.UT_hash_table* %1455, %struct.UT_hash_table** %1458, align 8
  %1459 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1460 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1459, i32 0, i32 1
  %1461 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1460, i32 0, i32 0
  %1462 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1461, align 8
  %1463 = icmp ne %struct.UT_hash_table* %1462, null
  br i1 %1463, label %1465, label %1464

; <label>:1464:                                   ; preds = %1453
  call void @exit(i32 -1) #9
  unreachable

; <label>:1465:                                   ; preds = %1453
  %1466 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1467 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1466, i32 0, i32 1
  %1468 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1467, i32 0, i32 0
  %1469 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1468, align 8
  %1470 = bitcast %struct.UT_hash_table* %1469 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1470, i8 0, i64 64, i1 false)
  %1471 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1472 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1471, i32 0, i32 1
  %1473 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1474 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1473, i32 0, i32 1
  %1475 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1474, i32 0, i32 0
  %1476 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1475, align 8
  %1477 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1476, i32 0, i32 4
  store %struct.UT_hash_handle* %1472, %struct.UT_hash_handle** %1477, align 8
  %1478 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1479 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1478, i32 0, i32 1
  %1480 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1479, i32 0, i32 0
  %1481 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1480, align 8
  %1482 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1481, i32 0, i32 1
  store i32 32, i32* %1482, align 8
  %1483 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1484 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1483, i32 0, i32 1
  %1485 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1484, i32 0, i32 0
  %1486 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1485, align 8
  %1487 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1486, i32 0, i32 2
  store i32 5, i32* %1487, align 4
  %1488 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1489 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1488, i32 0, i32 1
  %1490 = bitcast %struct.UT_hash_handle* %1489 to i8*
  %1491 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1492 = bitcast %struct.LoggedAddrEntry* %1491 to i8*
  %1493 = ptrtoint i8* %1490 to i64
  %1494 = ptrtoint i8* %1492 to i64
  %1495 = sub i64 %1493, %1494
  %1496 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1497 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1496, i32 0, i32 1
  %1498 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1497, i32 0, i32 0
  %1499 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1498, align 8
  %1500 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1499, i32 0, i32 5
  store i64 %1495, i64* %1500, align 8
  %1501 = call noalias i8* @malloc(i64 512) #8
  %1502 = bitcast i8* %1501 to %struct.UT_hash_bucket*
  %1503 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1504 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1503, i32 0, i32 1
  %1505 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1504, i32 0, i32 0
  %1506 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1505, align 8
  %1507 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1506, i32 0, i32 0
  store %struct.UT_hash_bucket* %1502, %struct.UT_hash_bucket** %1507, align 8
  %1508 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1509 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1508, i32 0, i32 1
  %1510 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1509, i32 0, i32 0
  %1511 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1510, align 8
  %1512 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1511, i32 0, i32 10
  store i32 -1609490463, i32* %1512, align 8
  %1513 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1514 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1513, i32 0, i32 1
  %1515 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1514, i32 0, i32 0
  %1516 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1515, align 8
  %1517 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1516, i32 0, i32 0
  %1518 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1517, align 8
  %1519 = icmp ne %struct.UT_hash_bucket* %1518, null
  br i1 %1519, label %1521, label %1520

; <label>:1520:                                   ; preds = %1465
  call void @exit(i32 -1) #9
  unreachable

; <label>:1521:                                   ; preds = %1465
  %1522 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1523 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1522, i32 0, i32 1
  %1524 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1523, i32 0, i32 0
  %1525 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1524, align 8
  %1526 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1525, i32 0, i32 0
  %1527 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1526, align 8
  %1528 = bitcast %struct.UT_hash_bucket* %1527 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %1528, i8 0, i64 512, i1 false)
  br label %1529

; <label>:1529:                                   ; preds = %1521
  br label %1530

; <label>:1530:                                   ; preds = %1529
  br label %1531

; <label>:1531:                                   ; preds = %1530
  %1532 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  store %struct.LoggedAddrEntry* %1532, %struct.LoggedAddrEntry** @logged_addresses, align 8
  br label %1580

; <label>:1533:                                   ; preds = %1425
  %1534 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1535 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1534, i32 0, i32 1
  %1536 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1535, i32 0, i32 0
  %1537 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1536, align 8
  %1538 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1539 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1538, i32 0, i32 1
  %1540 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1539, i32 0, i32 0
  store %struct.UT_hash_table* %1537, %struct.UT_hash_table** %1540, align 8
  br label %1541

; <label>:1541:                                   ; preds = %1533
  %1542 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1543 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1542, i32 0, i32 1
  %1544 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1543, i32 0, i32 2
  store i8* null, i8** %1544, align 8
  %1545 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1546 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1545, i32 0, i32 1
  %1547 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1546, i32 0, i32 0
  %1548 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1547, align 8
  %1549 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1548, i32 0, i32 4
  %1550 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1549, align 8
  %1551 = bitcast %struct.UT_hash_handle* %1550 to i8*
  %1552 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1553 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1552, i32 0, i32 1
  %1554 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1553, i32 0, i32 0
  %1555 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1554, align 8
  %1556 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1555, i32 0, i32 5
  %1557 = load i64, i64* %1556, align 8
  %1558 = sub i64 0, %1557
  %1559 = getelementptr inbounds i8, i8* %1551, i64 %1558
  %1560 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1561 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1560, i32 0, i32 1
  %1562 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1561, i32 0, i32 1
  store i8* %1559, i8** %1562, align 8
  %1563 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1564 = bitcast %struct.LoggedAddrEntry* %1563 to i8*
  %1565 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1566 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1565, i32 0, i32 1
  %1567 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1566, i32 0, i32 0
  %1568 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1567, align 8
  %1569 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1568, i32 0, i32 4
  %1570 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1569, align 8
  %1571 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1570, i32 0, i32 2
  store i8* %1564, i8** %1571, align 8
  %1572 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1573 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1572, i32 0, i32 1
  %1574 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1575 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1574, i32 0, i32 1
  %1576 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1575, i32 0, i32 0
  %1577 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1576, align 8
  %1578 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1577, i32 0, i32 4
  store %struct.UT_hash_handle* %1573, %struct.UT_hash_handle** %1578, align 8
  br label %1579

; <label>:1579:                                   ; preds = %1541
  br label %1580

; <label>:1580:                                   ; preds = %1579, %1531
  br label %1581

; <label>:1581:                                   ; preds = %1580
  %1582 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1583 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1582, i32 0, i32 1
  %1584 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1583, i32 0, i32 0
  %1585 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1584, align 8
  %1586 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1585, i32 0, i32 3
  %1587 = load i32, i32* %1586, align 8
  %1588 = add i32 %1587, 1
  store i32 %1588, i32* %1586, align 8
  br label %1589

; <label>:1589:                                   ; preds = %1581
  %1590 = load i32, i32* %20, align 4
  %1591 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1592 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1591, i32 0, i32 1
  %1593 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1592, i32 0, i32 0
  %1594 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1593, align 8
  %1595 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1594, i32 0, i32 1
  %1596 = load i32, i32* %1595, align 8
  %1597 = sub i32 %1596, 1
  %1598 = and i32 %1590, %1597
  store i32 %1598, i32* %25, align 4
  br label %1599

; <label>:1599:                                   ; preds = %1589
  br label %1600

; <label>:1600:                                   ; preds = %1599
  %1601 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** @logged_addresses, align 8
  %1602 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1601, i32 0, i32 1
  %1603 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1602, i32 0, i32 0
  %1604 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1603, align 8
  %1605 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1604, i32 0, i32 0
  %1606 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1605, align 8
  %1607 = load i32, i32* %25, align 4
  %1608 = zext i32 %1607 to i64
  %1609 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1606, i64 %1608
  store %struct.UT_hash_bucket* %1609, %struct.UT_hash_bucket** %26, align 8
  %1610 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1611 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1610, i32 0, i32 1
  %1612 = load i32, i32* %1611, align 8
  %1613 = add i32 %1612, 1
  store i32 %1613, i32* %1611, align 8
  %1614 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1615 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1614, i32 0, i32 0
  %1616 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1615, align 8
  %1617 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1618 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1617, i32 0, i32 1
  %1619 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1618, i32 0, i32 4
  store %struct.UT_hash_handle* %1616, %struct.UT_hash_handle** %1619, align 8
  %1620 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1621 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1620, i32 0, i32 1
  %1622 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1621, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1622, align 8
  %1623 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1624 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1623, i32 0, i32 0
  %1625 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1624, align 8
  %1626 = icmp ne %struct.UT_hash_handle* %1625, null
  br i1 %1626, label %1627, label %1634

; <label>:1627:                                   ; preds = %1600
  %1628 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1629 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1628, i32 0, i32 1
  %1630 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1631 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1630, i32 0, i32 0
  %1632 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1631, align 8
  %1633 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1632, i32 0, i32 3
  store %struct.UT_hash_handle* %1629, %struct.UT_hash_handle** %1633, align 8
  br label %1634

; <label>:1634:                                   ; preds = %1627, %1600
  %1635 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1636 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1635, i32 0, i32 1
  %1637 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1638 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1637, i32 0, i32 0
  store %struct.UT_hash_handle* %1636, %struct.UT_hash_handle** %1638, align 8
  %1639 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1640 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1639, i32 0, i32 1
  %1641 = load i32, i32* %1640, align 8
  %1642 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %26, align 8
  %1643 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1642, i32 0, i32 2
  %1644 = load i32, i32* %1643, align 4
  %1645 = add i32 %1644, 1
  %1646 = mul i32 %1645, 10
  %1647 = icmp uge i32 %1641, %1646
  br i1 %1647, label %1648, label %1913

; <label>:1648:                                   ; preds = %1634
  %1649 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1650 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1649, i32 0, i32 1
  %1651 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1650, i32 0, i32 0
  %1652 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1651, align 8
  %1653 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1652, i32 0, i32 9
  %1654 = load i32, i32* %1653, align 4
  %1655 = icmp ne i32 %1654, 0
  br i1 %1655, label %1913, label %1656

; <label>:1656:                                   ; preds = %1648
  br label %1657

; <label>:1657:                                   ; preds = %1656
  %1658 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1659 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1658, i32 0, i32 1
  %1660 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1659, i32 0, i32 0
  %1661 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1660, align 8
  %1662 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1661, i32 0, i32 1
  %1663 = load i32, i32* %1662, align 8
  %1664 = zext i32 %1663 to i64
  %1665 = mul i64 16, %1664
  %1666 = mul i64 %1665, 2
  %1667 = call noalias i8* @malloc(i64 %1666) #8
  %1668 = bitcast i8* %1667 to %struct.UT_hash_bucket*
  store %struct.UT_hash_bucket* %1668, %struct.UT_hash_bucket** %31, align 8
  %1669 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1670 = icmp ne %struct.UT_hash_bucket* %1669, null
  br i1 %1670, label %1672, label %1671

; <label>:1671:                                   ; preds = %1657
  call void @exit(i32 -1) #9
  unreachable

; <label>:1672:                                   ; preds = %1657
  %1673 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1674 = bitcast %struct.UT_hash_bucket* %1673 to i8*
  %1675 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1676 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1675, i32 0, i32 1
  %1677 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1676, i32 0, i32 0
  %1678 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1677, align 8
  %1679 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1678, i32 0, i32 1
  %1680 = load i32, i32* %1679, align 8
  %1681 = zext i32 %1680 to i64
  %1682 = mul i64 16, %1681
  %1683 = mul i64 %1682, 2
  call void @llvm.memset.p0i8.i64(i8* align 8 %1674, i8 0, i64 %1683, i1 false)
  %1684 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1685 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1684, i32 0, i32 1
  %1686 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1685, i32 0, i32 0
  %1687 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1686, align 8
  %1688 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1687, i32 0, i32 3
  %1689 = load i32, i32* %1688, align 8
  %1690 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1691 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1690, i32 0, i32 1
  %1692 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1691, i32 0, i32 0
  %1693 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1692, align 8
  %1694 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1693, i32 0, i32 2
  %1695 = load i32, i32* %1694, align 4
  %1696 = add i32 %1695, 1
  %1697 = lshr i32 %1689, %1696
  %1698 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1699 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1698, i32 0, i32 1
  %1700 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1699, i32 0, i32 0
  %1701 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1700, align 8
  %1702 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1701, i32 0, i32 3
  %1703 = load i32, i32* %1702, align 8
  %1704 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1705 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1704, i32 0, i32 1
  %1706 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1705, i32 0, i32 0
  %1707 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1706, align 8
  %1708 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1707, i32 0, i32 1
  %1709 = load i32, i32* %1708, align 8
  %1710 = mul i32 %1709, 2
  %1711 = sub i32 %1710, 1
  %1712 = and i32 %1703, %1711
  %1713 = icmp ne i32 %1712, 0
  %1714 = zext i1 %1713 to i64
  %1715 = select i1 %1713, i32 1, i32 0
  %1716 = add i32 %1697, %1715
  %1717 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1718 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1717, i32 0, i32 1
  %1719 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1718, i32 0, i32 0
  %1720 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1719, align 8
  %1721 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1720, i32 0, i32 6
  store i32 %1716, i32* %1721, align 8
  %1722 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1723 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1722, i32 0, i32 1
  %1724 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1723, i32 0, i32 0
  %1725 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1724, align 8
  %1726 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1725, i32 0, i32 7
  store i32 0, i32* %1726, align 4
  store i32 0, i32* %28, align 4
  br label %1727

; <label>:1727:                                   ; preds = %1836, %1672
  %1728 = load i32, i32* %28, align 4
  %1729 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1730 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1729, i32 0, i32 1
  %1731 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1730, i32 0, i32 0
  %1732 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1731, align 8
  %1733 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1732, i32 0, i32 1
  %1734 = load i32, i32* %1733, align 8
  %1735 = icmp ult i32 %1728, %1734
  br i1 %1735, label %1736, label %1839

; <label>:1736:                                   ; preds = %1727
  %1737 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1738 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1737, i32 0, i32 1
  %1739 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1738, i32 0, i32 0
  %1740 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1739, align 8
  %1741 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1740, i32 0, i32 0
  %1742 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1741, align 8
  %1743 = load i32, i32* %28, align 4
  %1744 = zext i32 %1743 to i64
  %1745 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1742, i64 %1744
  %1746 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1745, i32 0, i32 0
  %1747 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1746, align 8
  store %struct.UT_hash_handle* %1747, %struct.UT_hash_handle** %29, align 8
  br label %1748

; <label>:1748:                                   ; preds = %1830, %1736
  %1749 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1750 = icmp ne %struct.UT_hash_handle* %1749, null
  br i1 %1750, label %1751, label %1835

; <label>:1751:                                   ; preds = %1748
  %1752 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1753 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1752, i32 0, i32 4
  %1754 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1753, align 8
  store %struct.UT_hash_handle* %1754, %struct.UT_hash_handle** %30, align 8
  br label %1755

; <label>:1755:                                   ; preds = %1751
  %1756 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1757 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1756, i32 0, i32 7
  %1758 = load i32, i32* %1757, align 4
  %1759 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1760 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1759, i32 0, i32 1
  %1761 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1760, i32 0, i32 0
  %1762 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1761, align 8
  %1763 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1762, i32 0, i32 1
  %1764 = load i32, i32* %1763, align 8
  %1765 = mul i32 %1764, 2
  %1766 = sub i32 %1765, 1
  %1767 = and i32 %1758, %1766
  store i32 %1767, i32* %27, align 4
  br label %1768

; <label>:1768:                                   ; preds = %1755
  %1769 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1770 = load i32, i32* %27, align 4
  %1771 = zext i32 %1770 to i64
  %1772 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1769, i64 %1771
  store %struct.UT_hash_bucket* %1772, %struct.UT_hash_bucket** %32, align 8
  %1773 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1774 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1773, i32 0, i32 1
  %1775 = load i32, i32* %1774, align 8
  %1776 = add i32 %1775, 1
  store i32 %1776, i32* %1774, align 8
  %1777 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1778 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1777, i32 0, i32 1
  %1779 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1778, i32 0, i32 0
  %1780 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1779, align 8
  %1781 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1780, i32 0, i32 6
  %1782 = load i32, i32* %1781, align 8
  %1783 = icmp ugt i32 %1776, %1782
  br i1 %1783, label %1784, label %1812

; <label>:1784:                                   ; preds = %1768
  %1785 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1786 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1785, i32 0, i32 1
  %1787 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1786, i32 0, i32 0
  %1788 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1787, align 8
  %1789 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1788, i32 0, i32 7
  %1790 = load i32, i32* %1789, align 4
  %1791 = add i32 %1790, 1
  store i32 %1791, i32* %1789, align 4
  %1792 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1793 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1792, i32 0, i32 1
  %1794 = load i32, i32* %1793, align 8
  %1795 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1796 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1795, i32 0, i32 2
  %1797 = load i32, i32* %1796, align 4
  %1798 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1799 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1798, i32 0, i32 1
  %1800 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1799, i32 0, i32 0
  %1801 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1800, align 8
  %1802 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1801, i32 0, i32 6
  %1803 = load i32, i32* %1802, align 8
  %1804 = mul i32 %1797, %1803
  %1805 = icmp ugt i32 %1794, %1804
  br i1 %1805, label %1806, label %1811

; <label>:1806:                                   ; preds = %1784
  %1807 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1808 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1807, i32 0, i32 2
  %1809 = load i32, i32* %1808, align 4
  %1810 = add i32 %1809, 1
  store i32 %1810, i32* %1808, align 4
  br label %1811

; <label>:1811:                                   ; preds = %1806, %1784
  br label %1812

; <label>:1812:                                   ; preds = %1811, %1768
  %1813 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1814 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1813, i32 0, i32 3
  store %struct.UT_hash_handle* null, %struct.UT_hash_handle** %1814, align 8
  %1815 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1816 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1815, i32 0, i32 0
  %1817 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1816, align 8
  %1818 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1819 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1818, i32 0, i32 4
  store %struct.UT_hash_handle* %1817, %struct.UT_hash_handle** %1819, align 8
  %1820 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1821 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1820, i32 0, i32 0
  %1822 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1821, align 8
  %1823 = icmp ne %struct.UT_hash_handle* %1822, null
  br i1 %1823, label %1824, label %1830

; <label>:1824:                                   ; preds = %1812
  %1825 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1826 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1827 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1826, i32 0, i32 0
  %1828 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %1827, align 8
  %1829 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1828, i32 0, i32 3
  store %struct.UT_hash_handle* %1825, %struct.UT_hash_handle** %1829, align 8
  br label %1830

; <label>:1830:                                   ; preds = %1824, %1812
  %1831 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %29, align 8
  %1832 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %32, align 8
  %1833 = getelementptr inbounds %struct.UT_hash_bucket, %struct.UT_hash_bucket* %1832, i32 0, i32 0
  store %struct.UT_hash_handle* %1831, %struct.UT_hash_handle** %1833, align 8
  %1834 = load %struct.UT_hash_handle*, %struct.UT_hash_handle** %30, align 8
  store %struct.UT_hash_handle* %1834, %struct.UT_hash_handle** %29, align 8
  br label %1748

; <label>:1835:                                   ; preds = %1748
  br label %1836

; <label>:1836:                                   ; preds = %1835
  %1837 = load i32, i32* %28, align 4
  %1838 = add i32 %1837, 1
  store i32 %1838, i32* %28, align 4
  br label %1727

; <label>:1839:                                   ; preds = %1727
  %1840 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1841 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1840, i32 0, i32 1
  %1842 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1841, i32 0, i32 0
  %1843 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1842, align 8
  %1844 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1843, i32 0, i32 0
  %1845 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %1844, align 8
  %1846 = bitcast %struct.UT_hash_bucket* %1845 to i8*
  call void @free(i8* %1846) #8
  %1847 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1848 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1847, i32 0, i32 1
  %1849 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1848, i32 0, i32 0
  %1850 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1849, align 8
  %1851 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1850, i32 0, i32 1
  %1852 = load i32, i32* %1851, align 8
  %1853 = mul i32 %1852, 2
  store i32 %1853, i32* %1851, align 8
  %1854 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1855 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1854, i32 0, i32 1
  %1856 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1855, i32 0, i32 0
  %1857 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1856, align 8
  %1858 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1857, i32 0, i32 2
  %1859 = load i32, i32* %1858, align 4
  %1860 = add i32 %1859, 1
  store i32 %1860, i32* %1858, align 4
  %1861 = load %struct.UT_hash_bucket*, %struct.UT_hash_bucket** %31, align 8
  %1862 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1863 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1862, i32 0, i32 1
  %1864 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1863, i32 0, i32 0
  %1865 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1864, align 8
  %1866 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1865, i32 0, i32 0
  store %struct.UT_hash_bucket* %1861, %struct.UT_hash_bucket** %1866, align 8
  %1867 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1868 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1867, i32 0, i32 1
  %1869 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1868, i32 0, i32 0
  %1870 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1869, align 8
  %1871 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1870, i32 0, i32 7
  %1872 = load i32, i32* %1871, align 4
  %1873 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1874 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1873, i32 0, i32 1
  %1875 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1874, i32 0, i32 0
  %1876 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1875, align 8
  %1877 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1876, i32 0, i32 3
  %1878 = load i32, i32* %1877, align 8
  %1879 = lshr i32 %1878, 1
  %1880 = icmp ugt i32 %1872, %1879
  br i1 %1880, label %1881, label %1889

; <label>:1881:                                   ; preds = %1839
  %1882 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1883 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1882, i32 0, i32 1
  %1884 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1883, i32 0, i32 0
  %1885 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1884, align 8
  %1886 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1885, i32 0, i32 8
  %1887 = load i32, i32* %1886, align 8
  %1888 = add i32 %1887, 1
  br label %1890

; <label>:1889:                                   ; preds = %1839
  br label %1890

; <label>:1890:                                   ; preds = %1889, %1881
  %1891 = phi i32 [ %1888, %1881 ], [ 0, %1889 ]
  %1892 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1893 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1892, i32 0, i32 1
  %1894 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1893, i32 0, i32 0
  %1895 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1894, align 8
  %1896 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1895, i32 0, i32 8
  store i32 %1891, i32* %1896, align 8
  %1897 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1898 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1897, i32 0, i32 1
  %1899 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1898, i32 0, i32 0
  %1900 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1899, align 8
  %1901 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1900, i32 0, i32 8
  %1902 = load i32, i32* %1901, align 8
  %1903 = icmp ugt i32 %1902, 1
  br i1 %1903, label %1904, label %1910

; <label>:1904:                                   ; preds = %1890
  %1905 = load %struct.LoggedAddrEntry*, %struct.LoggedAddrEntry** %11, align 8
  %1906 = getelementptr inbounds %struct.LoggedAddrEntry, %struct.LoggedAddrEntry* %1905, i32 0, i32 1
  %1907 = getelementptr inbounds %struct.UT_hash_handle, %struct.UT_hash_handle* %1906, i32 0, i32 0
  %1908 = load %struct.UT_hash_table*, %struct.UT_hash_table** %1907, align 8
  %1909 = getelementptr inbounds %struct.UT_hash_table, %struct.UT_hash_table* %1908, i32 0, i32 9
  store i32 1, i32* %1909, align 4
  br label %1910

; <label>:1910:                                   ; preds = %1904, %1890
  br label %1911

; <label>:1911:                                   ; preds = %1910
  br label %1912

; <label>:1912:                                   ; preds = %1911
  br label %1913

; <label>:1913:                                   ; preds = %1912, %1648, %1634
  br label %1914

; <label>:1914:                                   ; preds = %1913
  br label %1915

; <label>:1915:                                   ; preds = %1914
  br label %1916

; <label>:1916:                                   ; preds = %1915
  br label %1917

; <label>:1917:                                   ; preds = %1916
  br label %1919

; <label>:1918:                                   ; preds = %1040
  call void @perror(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i32 0, i32 0))
  br label %1919

; <label>:1919:                                   ; preds = %1918, %1917
  br label %1920

; <label>:1920:                                   ; preds = %1919, %1025
  br label %1921

; <label>:1921:                                   ; preds = %1920, %534, %531
  br label %1922

; <label>:1922:                                   ; preds = %1921, %530, %35
  ret void
}

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ret_function() #0 {
  %1 = alloca %struct.InstrumentationData, align 8
  %2 = call i8* @llvm.returnaddress(i32 0)
  %3 = getelementptr inbounds %struct.InstrumentationData, %struct.InstrumentationData* %1, i32 0, i32 0
  store i8* %2, i8** %3, align 8
  ret void
}

; Function Attrs: nounwind readnone
declare i8* @llvm.returnaddress(i32) #6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @log_return_address(i8*) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.1.0 "}
