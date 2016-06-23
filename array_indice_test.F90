
subroutine array_indice(arr, begc, endc, lbj,ubj)

implicit none
integer, intent(in) :: begc, endc, lbj, ubj
real*8, intent(in) :: arr(begc:endc, lbj:ubj)


print*,arr
print*,arr(1,ubj-1)
end subroutine array_indice

program main

implicit none

real*8 :: arr(3,3)
integer :: ii, jj

do jj = 1, 3
do ii = 1,3
  arr(ii,jj) = (ii-1)*3+jj
enddo
enddo

call array_indice(arr(2:2,1:3), 1, 1, 1, 3)

end program main
