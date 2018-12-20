
module gtypeMod

implicit none

  public
  type,public :: gtype_type
   real*4, pointer :: aval(:)
  end type gtype_type

contains

  function create_gtype()
  implicit none
  class(gtype_type), pointer :: create_gtype
  class(gtype_type), pointer :: gtp

  allocate(gtp)
  create_gtype => gtp
  end function create_gtype


  subroutine setgtp(arr, gtp)

  implicit none
  real*4, dimension(:), intent(in) :: arr
  class(gtype_type), pointer :: gtp

  integer :: sz,j

  allocate(gtp, source=create_gtype())

  sz = size(arr)

  allocate(gtp%aval(sz))
  do j = 1, sz
    gtp%aval(j)=arr(j)
  enddo
  end subroutine setgtp

  subroutine print_gtp(gtp)

  implicit none
  class(gtype_type), intent(in) :: gtp

  print*,gtp%aval
  end subroutine print_gtp
end module gtypeMod

  program main
  use gtypeMod
  implicit none

  class(gtype_type), pointer:: gtp

  call setgtp((/1.,3.4,5.,6.,3./),gtp)

  call print_gtp(gtp) 

  deallocate(gtp)
  nullify(gtp)
  end program main

