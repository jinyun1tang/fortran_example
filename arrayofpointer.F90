  module typeMod

  implicit none
  
  type container
    real*8, pointer :: obj
  end type container
  end module typeMod

  program main

  use typeMod
  implicit none

  type(container), allocatable :: objs(:)
  real*8 :: arr(4)
  integer :: j
  allocate(objs(4))
  
  arr=(/1.,2.,3.,4./)

  do j = 1, 4
    objs(j)%obj=>arr(j)
  enddo

  objs(3)%obj=6.

  print*,arr
  end program main
