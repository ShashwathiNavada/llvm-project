; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 4
; RUN: opt < %s -passes=msan -S | FileCheck %s
;
; Forked from llvm/test/CodeGen/X86/vector-reduce-fmul.ll
;
; Currently handled incorrectly by visitInstruction:
; - llvm.vector.reduce.fmul

target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define float @test_v2f32(float %a0, <2 x float> %a1) #0 {
; CHECK-LABEL: define float @test_v2f32(
; CHECK-SAME: float [[A0:%.*]], <2 x float> [[A1:%.*]]) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <2 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i32 [[TMP1]], 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast <2 x i32> [[TMP2]] to i64
; CHECK-NEXT:    [[_MSCMP1:%.*]] = icmp ne i64 [[TMP3]], 0
; CHECK-NEXT:    [[_MSOR:%.*]] = or i1 [[_MSCMP]], [[_MSCMP1]]
; CHECK-NEXT:    br i1 [[_MSOR]], label [[TMP4:%.*]], label [[TMP5:%.*]], !prof [[PROF1:![0-9]+]]
; CHECK:       4:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4:[0-9]+]]
; CHECK-NEXT:    unreachable
; CHECK:       5:
; CHECK-NEXT:    [[TMP6:%.*]] = call float @llvm.vector.reduce.fmul.v2f32(float [[A0]], <2 x float> [[A1]])
; CHECK-NEXT:    store i32 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret float [[TMP6]]
;
  %1 = call float @llvm.vector.reduce.fmul.f32.v2f32(float %a0, <2 x float> %a1)
  ret float %1
}

define float @test_v4f32(float %a0, <4 x float> %a1) #0 {
; CHECK-LABEL: define float @test_v4f32(
; CHECK-SAME: float [[A0:%.*]], <4 x float> [[A1:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i32 [[TMP1]], 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast <4 x i32> [[TMP2]] to i128
; CHECK-NEXT:    [[_MSCMP1:%.*]] = icmp ne i128 [[TMP3]], 0
; CHECK-NEXT:    [[_MSOR:%.*]] = or i1 [[_MSCMP]], [[_MSCMP1]]
; CHECK-NEXT:    br i1 [[_MSOR]], label [[TMP4:%.*]], label [[TMP5:%.*]], !prof [[PROF1]]
; CHECK:       4:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       5:
; CHECK-NEXT:    [[TMP6:%.*]] = call float @llvm.vector.reduce.fmul.v4f32(float [[A0]], <4 x float> [[A1]])
; CHECK-NEXT:    store i32 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret float [[TMP6]]
;
  %1 = call float @llvm.vector.reduce.fmul.f32.v4f32(float %a0, <4 x float> %a1)
  ret float %1
}

define float @test_v8f32(float %a0, <8 x float> %a1) #0 {
; CHECK-LABEL: define float @test_v8f32(
; CHECK-SAME: float [[A0:%.*]], <8 x float> [[A1:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <8 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i32 [[TMP1]], 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast <8 x i32> [[TMP2]] to i256
; CHECK-NEXT:    [[_MSCMP1:%.*]] = icmp ne i256 [[TMP3]], 0
; CHECK-NEXT:    [[_MSOR:%.*]] = or i1 [[_MSCMP]], [[_MSCMP1]]
; CHECK-NEXT:    br i1 [[_MSOR]], label [[TMP4:%.*]], label [[TMP5:%.*]], !prof [[PROF1]]
; CHECK:       4:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       5:
; CHECK-NEXT:    [[TMP6:%.*]] = call float @llvm.vector.reduce.fmul.v8f32(float [[A0]], <8 x float> [[A1]])
; CHECK-NEXT:    store i32 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret float [[TMP6]]
;
  %1 = call float @llvm.vector.reduce.fmul.f32.v8f32(float %a0, <8 x float> %a1)
  ret float %1
}

define float @test_v16f32(float %a0, <16 x float> %a1) #0 {
; CHECK-LABEL: define float @test_v16f32(
; CHECK-SAME: float [[A0:%.*]], <16 x float> [[A1:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <16 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i32 [[TMP1]], 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast <16 x i32> [[TMP2]] to i512
; CHECK-NEXT:    [[_MSCMP1:%.*]] = icmp ne i512 [[TMP3]], 0
; CHECK-NEXT:    [[_MSOR:%.*]] = or i1 [[_MSCMP]], [[_MSCMP1]]
; CHECK-NEXT:    br i1 [[_MSOR]], label [[TMP4:%.*]], label [[TMP5:%.*]], !prof [[PROF1]]
; CHECK:       4:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       5:
; CHECK-NEXT:    [[TMP6:%.*]] = call float @llvm.vector.reduce.fmul.v16f32(float [[A0]], <16 x float> [[A1]])
; CHECK-NEXT:    store i32 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret float [[TMP6]]
;
  %1 = call float @llvm.vector.reduce.fmul.f32.v16f32(float %a0, <16 x float> %a1)
  ret float %1
}


define float @test_v2f32_one(<2 x float> %a0) #0 {
; CHECK-LABEL: define float @test_v2f32_one(
; CHECK-SAME: <2 x float> [[A0:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast <2 x i32> [[TMP1]] to i64
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i64 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[_MSCMP]], label [[TMP3:%.*]], label [[TMP4:%.*]], !prof [[PROF1]]
; CHECK:       3:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       4:
; CHECK-NEXT:    [[TMP5:%.*]] = call float @llvm.vector.reduce.fmul.v2f32(float 1.000000e+00, <2 x float> [[A0]])
; CHECK-NEXT:    store i32 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret float [[TMP5]]
;
  %1 = call float @llvm.vector.reduce.fmul.f32.v2f32(float 1.0, <2 x float> %a0)
  ret float %1
}

define float @test_v4f32_one(<4 x float> %a0) #0 {
; CHECK-LABEL: define float @test_v4f32_one(
; CHECK-SAME: <4 x float> [[A0:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast <4 x i32> [[TMP1]] to i128
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i128 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[_MSCMP]], label [[TMP3:%.*]], label [[TMP4:%.*]], !prof [[PROF1]]
; CHECK:       3:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       4:
; CHECK-NEXT:    [[TMP5:%.*]] = call float @llvm.vector.reduce.fmul.v4f32(float 1.000000e+00, <4 x float> [[A0]])
; CHECK-NEXT:    store i32 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret float [[TMP5]]
;
  %1 = call float @llvm.vector.reduce.fmul.f32.v4f32(float 1.0, <4 x float> %a0)
  ret float %1
}

define float @test_v8f32_one(<8 x float> %a0) #0 {
; CHECK-LABEL: define float @test_v8f32_one(
; CHECK-SAME: <8 x float> [[A0:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast <8 x i32> [[TMP1]] to i256
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i256 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[_MSCMP]], label [[TMP3:%.*]], label [[TMP4:%.*]], !prof [[PROF1]]
; CHECK:       3:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       4:
; CHECK-NEXT:    [[TMP5:%.*]] = call float @llvm.vector.reduce.fmul.v8f32(float 1.000000e+00, <8 x float> [[A0]])
; CHECK-NEXT:    store i32 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret float [[TMP5]]
;
  %1 = call float @llvm.vector.reduce.fmul.f32.v8f32(float 1.0, <8 x float> %a0)
  ret float %1
}

define float @test_v16f32_one(<16 x float> %a0) #0 {
; CHECK-LABEL: define float @test_v16f32_one(
; CHECK-SAME: <16 x float> [[A0:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <16 x i32>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast <16 x i32> [[TMP1]] to i512
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i512 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[_MSCMP]], label [[TMP3:%.*]], label [[TMP4:%.*]], !prof [[PROF1]]
; CHECK:       3:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       4:
; CHECK-NEXT:    [[TMP5:%.*]] = call float @llvm.vector.reduce.fmul.v16f32(float 1.000000e+00, <16 x float> [[A0]])
; CHECK-NEXT:    store i32 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret float [[TMP5]]
;
  %1 = call float @llvm.vector.reduce.fmul.f32.v16f32(float 1.0, <16 x float> %a0)
  ret float %1
}

define double @test_v2f64(double %a0, <2 x double> %a1) #0 {
; CHECK-LABEL: define double @test_v2f64(
; CHECK-SAME: double [[A0:%.*]], <2 x double> [[A1:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i64, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i64 [[TMP1]], 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast <2 x i64> [[TMP2]] to i128
; CHECK-NEXT:    [[_MSCMP1:%.*]] = icmp ne i128 [[TMP3]], 0
; CHECK-NEXT:    [[_MSOR:%.*]] = or i1 [[_MSCMP]], [[_MSCMP1]]
; CHECK-NEXT:    br i1 [[_MSOR]], label [[TMP4:%.*]], label [[TMP5:%.*]], !prof [[PROF1]]
; CHECK:       4:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       5:
; CHECK-NEXT:    [[TMP6:%.*]] = call double @llvm.vector.reduce.fmul.v2f64(double [[A0]], <2 x double> [[A1]])
; CHECK-NEXT:    store i64 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret double [[TMP6]]
;
  %1 = call double @llvm.vector.reduce.fmul.f64.v2f64(double %a0, <2 x double> %a1)
  ret double %1
}

define double @test_v4f64(double %a0, <4 x double> %a1) #0 {
; CHECK-LABEL: define double @test_v4f64(
; CHECK-SAME: double [[A0:%.*]], <4 x double> [[A1:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i64, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <4 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i64 [[TMP1]], 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast <4 x i64> [[TMP2]] to i256
; CHECK-NEXT:    [[_MSCMP1:%.*]] = icmp ne i256 [[TMP3]], 0
; CHECK-NEXT:    [[_MSOR:%.*]] = or i1 [[_MSCMP]], [[_MSCMP1]]
; CHECK-NEXT:    br i1 [[_MSOR]], label [[TMP4:%.*]], label [[TMP5:%.*]], !prof [[PROF1]]
; CHECK:       4:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       5:
; CHECK-NEXT:    [[TMP6:%.*]] = call double @llvm.vector.reduce.fmul.v4f64(double [[A0]], <4 x double> [[A1]])
; CHECK-NEXT:    store i64 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret double [[TMP6]]
;
  %1 = call double @llvm.vector.reduce.fmul.f64.v4f64(double %a0, <4 x double> %a1)
  ret double %1
}

define double @test_v8f64(double %a0, <8 x double> %a1) #0 {
; CHECK-LABEL: define double @test_v8f64(
; CHECK-SAME: double [[A0:%.*]], <8 x double> [[A1:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i64, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <8 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i64 [[TMP1]], 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast <8 x i64> [[TMP2]] to i512
; CHECK-NEXT:    [[_MSCMP1:%.*]] = icmp ne i512 [[TMP3]], 0
; CHECK-NEXT:    [[_MSOR:%.*]] = or i1 [[_MSCMP]], [[_MSCMP1]]
; CHECK-NEXT:    br i1 [[_MSOR]], label [[TMP4:%.*]], label [[TMP5:%.*]], !prof [[PROF1]]
; CHECK:       4:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       5:
; CHECK-NEXT:    [[TMP6:%.*]] = call double @llvm.vector.reduce.fmul.v8f64(double [[A0]], <8 x double> [[A1]])
; CHECK-NEXT:    store i64 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret double [[TMP6]]
;
  %1 = call double @llvm.vector.reduce.fmul.f64.v8f64(double %a0, <8 x double> %a1)
  ret double %1
}

define double @test_v16f64(double %a0, <16 x double> %a1) #0 {
; CHECK-LABEL: define double @test_v16f64(
; CHECK-SAME: double [[A0:%.*]], <16 x double> [[A1:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load i64, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load <16 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i64 [[TMP1]], 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast <16 x i64> [[TMP2]] to i1024
; CHECK-NEXT:    [[_MSCMP1:%.*]] = icmp ne i1024 [[TMP3]], 0
; CHECK-NEXT:    [[_MSOR:%.*]] = or i1 [[_MSCMP]], [[_MSCMP1]]
; CHECK-NEXT:    br i1 [[_MSOR]], label [[TMP4:%.*]], label [[TMP5:%.*]], !prof [[PROF1]]
; CHECK:       4:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       5:
; CHECK-NEXT:    [[TMP6:%.*]] = call double @llvm.vector.reduce.fmul.v16f64(double [[A0]], <16 x double> [[A1]])
; CHECK-NEXT:    store i64 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret double [[TMP6]]
;
  %1 = call double @llvm.vector.reduce.fmul.f64.v16f64(double %a0, <16 x double> %a1)
  ret double %1
}


define double @test_v2f64_one(<2 x double> %a0) #0 {
; CHECK-LABEL: define double @test_v2f64_one(
; CHECK-SAME: <2 x double> [[A0:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i64>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast <2 x i64> [[TMP1]] to i128
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i128 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[_MSCMP]], label [[TMP3:%.*]], label [[TMP4:%.*]], !prof [[PROF1]]
; CHECK:       3:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       4:
; CHECK-NEXT:    [[TMP5:%.*]] = call double @llvm.vector.reduce.fmul.v2f64(double 1.000000e+00, <2 x double> [[A0]])
; CHECK-NEXT:    store i64 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret double [[TMP5]]
;
  %1 = call double @llvm.vector.reduce.fmul.f64.v2f64(double 1.0, <2 x double> %a0)
  ret double %1
}

define double @test_v4f64_one(<4 x double> %a0) #0 {
; CHECK-LABEL: define double @test_v4f64_one(
; CHECK-SAME: <4 x double> [[A0:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <4 x i64>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast <4 x i64> [[TMP1]] to i256
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i256 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[_MSCMP]], label [[TMP3:%.*]], label [[TMP4:%.*]], !prof [[PROF1]]
; CHECK:       3:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       4:
; CHECK-NEXT:    [[TMP5:%.*]] = call double @llvm.vector.reduce.fmul.v4f64(double 1.000000e+00, <4 x double> [[A0]])
; CHECK-NEXT:    store i64 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret double [[TMP5]]
;
  %1 = call double @llvm.vector.reduce.fmul.f64.v4f64(double 1.0, <4 x double> %a0)
  ret double %1
}

define double @test_v8f64_one(<8 x double> %a0) #0 {
; CHECK-LABEL: define double @test_v8f64_one(
; CHECK-SAME: <8 x double> [[A0:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <8 x i64>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast <8 x i64> [[TMP1]] to i512
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i512 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[_MSCMP]], label [[TMP3:%.*]], label [[TMP4:%.*]], !prof [[PROF1]]
; CHECK:       3:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       4:
; CHECK-NEXT:    [[TMP5:%.*]] = call double @llvm.vector.reduce.fmul.v8f64(double 1.000000e+00, <8 x double> [[A0]])
; CHECK-NEXT:    store i64 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret double [[TMP5]]
;
  %1 = call double @llvm.vector.reduce.fmul.f64.v8f64(double 1.0, <8 x double> %a0)
  ret double %1
}

define double @test_v16f64_one(<16 x double> %a0) #0 {
; CHECK-LABEL: define double @test_v16f64_one(
; CHECK-SAME: <16 x double> [[A0:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:    [[TMP1:%.*]] = load <16 x i64>, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast <16 x i64> [[TMP1]] to i1024
; CHECK-NEXT:    [[_MSCMP:%.*]] = icmp ne i1024 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[_MSCMP]], label [[TMP3:%.*]], label [[TMP4:%.*]], !prof [[PROF1]]
; CHECK:       3:
; CHECK-NEXT:    call void @__msan_warning_noreturn() #[[ATTR4]]
; CHECK-NEXT:    unreachable
; CHECK:       4:
; CHECK-NEXT:    [[TMP5:%.*]] = call double @llvm.vector.reduce.fmul.v16f64(double 1.000000e+00, <16 x double> [[A0]])
; CHECK-NEXT:    store i64 0, ptr @__msan_retval_tls, align 8
; CHECK-NEXT:    ret double [[TMP5]]
;
  %1 = call double @llvm.vector.reduce.fmul.f64.v16f64(double 1.0, <16 x double> %a0)
  ret double %1
}

declare float @llvm.vector.reduce.fmul.f32.v2f32(float, <2 x float>)
declare float @llvm.vector.reduce.fmul.f32.v4f32(float, <4 x float>)
declare float @llvm.vector.reduce.fmul.f32.v8f32(float, <8 x float>)
declare float @llvm.vector.reduce.fmul.f32.v16f32(float, <16 x float>)

declare double @llvm.vector.reduce.fmul.f64.v2f64(double, <2 x double>)
declare double @llvm.vector.reduce.fmul.f64.v4f64(double, <4 x double>)
declare double @llvm.vector.reduce.fmul.f64.v8f64(double, <8 x double>)
declare double @llvm.vector.reduce.fmul.f64.v16f64(double, <16 x double>)

attributes #0 = { sanitize_memory }
;.
; CHECK: [[PROF1]] = !{!"branch_weights", i32 1, i32 1048575}
;.
