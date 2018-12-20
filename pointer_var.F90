

program main


implicit none

 real*8 :: a
 a = 3.

 call point_assign(a)
contains

subroutine point_assign(c)
implicit none
 real*8, target, intent(inout) :: c


 real*8, pointer :: b

 b=>c
 b = 4.
 print*,'c=',c,'b=',b

end subroutine point_assign

end program main
