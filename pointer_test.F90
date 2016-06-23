program pointer_test

!test conclusion,
!when b => a
!array b and a have identical behavior and
!should be cited identically.

implicit none

real*8, pointer :: a(:,:)
real*8, pointer :: b(:,:)
integer :: i,j


allocate(a(-1:2,-1:2))

b => a

do j = -1, 2
  do i = -1, 2
    a(i,j) = i*j*2.
  enddo
  print*,(a(i,j),i=-1,2)
enddo

print*,'b'
do j = -1, 2
 print*,(b(i,j),i=-1,2)
enddo
deallocate(a)
end program pointer_test
