module BaseType
implicit none

 type, public :: base_type

  real*8 :: a
 contains
  procedure, public :: init
  procedure, public :: something
 end type base_type

contains

  subroutine init(this)

  implicit none

  class(base_type), intent(inout) :: this

  this%a=0
  end subroutine init


  subroutine something(this)

  implicit none

  class(base_type), intent(inout) :: this

  print*,'this%a',this%a

  end subroutine something
end module BaseType
