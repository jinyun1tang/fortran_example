
module type_mod
implicit none
public
type base_type
  character(len=20) :: name
end type base_type
!----------------------------------------
type, extends(base_type) :: child_type

 real*8 :: mem
end type child_type
!----------------------------------------

contains
subroutine print_base(extra)

implicit none
class(base_type), intent(in) :: extra

select type(extra)
type is(base_type)
  print*,extra%name
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

end module type_mod

!----------------------------------------
program main
use type_mod
implicit none
type(base_type) :: base
type(child_type) :: child


base%name='base'

child%name='child'; child%mem=2.0

call exter_exe(print_base,base)

call exter_exe(print_child,child)

end program main
