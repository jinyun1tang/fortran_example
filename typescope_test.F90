module type1Mod

implicit none

  type, public :: type1_type

   character(len=20) :: name
  end type type1_type

end module type1Mod

module classMod
 use type1Mod, only : type1_type
implicit none

  type(type1_type), private :: type1

  type, public :: class_type
  contains
   procedure :: Init
   procedure :: print_name
  end type class_type
contains

  subroutine Init(this, val)

  implicit none
  class(class_type), intent(inout) :: this
  character(len=*), intent(in) :: val

  type1%name = 'test'//trim(val)
  end subroutine Init

  subroutine print_name(this)
  implicit none
  class(class_type), intent(inout) :: this
  print*,type1%name
  end subroutine print_name
end module classMod


program main
use classMod, only : class_type
implicit none

type(class_type) :: class(2)


call class(1)%init('1')

call class(2)%init('2')

call class(1)%print_name()

call class(2)%print_name()

end program main
