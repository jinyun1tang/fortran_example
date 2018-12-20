
function dispv(inv)result(ans)

implicit none

real*8, dimension(:), intent(in) :: inv

integer :: n, j
real*8 :: ans(1:size(inv))
n = size(inv)

do j = 1, n
  print*,inv(j)
  ans(j)=inv(j)*2.0
enddo
return
end function dispv

program main

implicit none
interface
  function dispv(inv)result(ans)
  implicit none
  real*8, dimension(:), intent(in) :: inv
  real*8 :: ans(1:size(inv))
  end function dispv
end interface

real*8, pointer :: aarr(:)
real*8, pointer :: barr(:)
real*8, pointer :: aarr1(:)
real*8, pointer :: barr1(:)

allocate(aarr(3:7))
allocate(barr(1:3))
allocate(aarr1(1:5))
allocate(barr1(4:6))

aarr=(/3.,4.,5.,6.,7./)
barr=(/1.,2.,3./)

aarr1=dispv(aarr)
barr1=dispv(barr)

print*,'aarr1',aarr1

print*,'barr1',barr1

end program main
