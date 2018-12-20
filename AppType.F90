module AppType

  use BaseType, only : base_type
implicit none

 type, extends(base_type), public :: app_type
  real*8 :: b
 contains
  procedure, public :: init
  procedure, public :: something_else
 end type app_type

contains

  subroutine init(this)

  implicit none

  class(app_type), intent(inout) :: this
  this%a=1
  this%b=2
  end subroutine init

  subroutine something_else(this)

  implicit none

  class(app_type), intent(inout) :: this

  call this%something()

  end subroutine something_else

end module AppType
