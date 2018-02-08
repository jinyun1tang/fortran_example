  program main
  real*8, allocatable :: arr(:)
  include "blk1.h"


  integer :: j

  allocate(arr(10))
  do j = 1, 10
    arr(j)=j*2
    print*,'j',j,arr(j)
  enddo
  end program main
