


subroutine exam1(rect)
use rectType
use shapeType
implicit none
type(rectangle), intent(in) :: rect
type(shape) :: sh

sh%x => rect%x

call exam2(sh)
end subroutine exam1


subroutine exam2(sh)
use shapeType
implicit none

type(shape), intent(in) :: sh

integer, pointer :: x(:)


x => sh%x

print*,x
end subroutine exam2

subroutine exam3(rect)
use rectType
implicit none
type(rectangle), intent(out) :: rect


allocate(rect%x(2))
end subroutine exam3
!---------------------
program main
use rectType
implicit none

type(rectangle) :: rect

call exam3(rect)
 rect%x(1)=1; rect%x(2)=2



call exam1(rect)

rect%x(1)=3; rect%x(2)=4
call exam1(rect)
end program main
