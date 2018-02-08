program main

  use data_type
  use do_data
  implicit none

  type(extra_type), pointer :: extra_inst
  class(gbetr_type), pointer :: gtype
  integer :: nn

!  interface
!   subroutine do_sth2(fun, extra)
!   implicit none
!   class(gbetr_type),  pointer  :: extra
!   external :: fun
!   end subroutine do_sth2
!  end interface
  nn = 10

  nullify(extra_inst)
  allocate(extra_inst)

  gtype=> extra_inst
  call InitAllocate(gtype, 1, nn)
  print*,'do_sth'

  call do_sth1(gtype, nn)

  call do_sth2(do_print, gtype)

  call DDeallocate(gtype)

  nullify(extra_inst)

end program main
