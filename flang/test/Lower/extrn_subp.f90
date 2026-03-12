! RUN: bbc -emit-hlfir -o - %s | FileCheck %s

module m1
  external :: sub
  type ty
    procedure(), pointer, nopass :: ptr5 => sub
  end type
  procedure(), pointer :: ptr6 => sub
end module

use m1
integer :: jj = 4
call ptr6(10)
print *, "Pass"
end

subroutine sub(a)
  integer :: a
  print *, "sub"
end subroutine

! CHECK-LABEL: func.func @_QQmain() {
! CHECK:         %[[PTR6_ADDR:.*]] = fir.address_of(@_QMm1Eptr6) : !fir.ref<!fir.boxproc<() -> ()>>
! CHECK:         %[[PTR6:.*]]:2 = hlfir.declare %[[PTR6_ADDR]] {fortran_attrs = #fir.var_attrs<pointer>, uniq_name = "_QMm1Eptr6"}
! CHECK:         %[[C10:.*]] = arith.constant 10 : i32
! CHECK:         %[[TMP:.*]]:3 = hlfir.associate %[[C10]] {adapt.valuebyref} : (i32) -> (!fir.ref<i32>, !fir.ref<i32>, i1)
! CHECK:         %[[P:.*]] = fir.load %[[PTR6]]#0 : !fir.ref<!fir.boxproc<() -> ()>>
! CHECK:         %[[F:.*]] = fir.box_addr %[[P]] : (!fir.boxproc<() -> ()>) -> ((!fir.ref<i32>) -> ())
! CHECK:         fir.call %[[F]](%[[TMP]]#0) fastmath<contract> : (!fir.ref<i32>) -> ()
! CHECK:         hlfir.end_associate %[[TMP]]#1, %[[TMP]]#2 : !fir.ref<i32>, i1