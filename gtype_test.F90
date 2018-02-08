
module type_mod
implicit none
public
type base_type
  character(len=20) :: name
end type base_type
!----------------------------------------
type, extends(base_type) :: child_type

 real*8 :: mem
contains
 procedure, public :: print_self
end type child_type
!----------------------------------------

type, extends(base_type) :: sister_type

end type sister_type
contains

subroutine print_self(this)
implicit none
class(child_type), intent(in) :: this

print*,this%name
end subroutine print_self

subroutine print_base(extra)

implicit none
class(base_type), intent(in) :: extra

select type(ext => extra)
type is(base_type)
  print*,ext%name
end select
end subroutine print_base

!----------------------------------------
subroutine print_child(extra)

implicit none
class(base_type), intent(in) :: extra

select type(extra)
type is(child_type)
  print*,extra%name,extra%mem
end select
end subroutine print_child

!----------------------------------------
subroutine exter_exe(sub, extra)

implicit none
class(base_type), intent(in) :: extra
external :: sub

call sub(extra)

end subroutine exter_exe

!----------------------------------------
subroutine exter_exe1(sub)

implicit none
external :: sub

call sub()

end subroutine exter_exe1
end module type_mod

!----------------------------------------
program main
use type_mod
implicit none
type(base_type) :: base
type(child_type) :: child
type(sister_type):: sister

base%name='base'

child%name='child'; child%mem=2.0

sister%name='sister'

call exter_exe(print_base,base)

call exter_exe(print_self,child)

call print_child(child)
end program main
