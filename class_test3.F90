
module FruitType

type, public :: fruit_type
  character(len=20) :: name
  contains
    procedure, public :: init_name
    procedure, public :: print_name
end type fruit_type

contains
  subroutine print_name(this)

  implicit none
  class(fruit_type) :: this

  print*,this%name

  end subroutine print_name

  subroutine init_name(this, name)

  implicit none
  class(fruit_type) :: this
  character(len=*), intent(in) :: name

  this%name = trim(name)

  call this%print_name
  end subroutine init_name

end module FruitType



module appleType
use FruitType
implicit none
  type, public, extends(fruit_type) :: apple_type
  contains
    procedure, public :: do_sth
  end type apple_type

contains
  subroutine do_sth(this)
  implicit none
  class(apple_type) :: this

  print*, 'walawala'
  call this%print_name
  end subroutine do_sth
end module appleType



program main
use appletype
implicit none

type(apple_type) :: apple

call apple%init_name("fuji")
call apple%do_sth()
end program
