
!---------------------
program main
use shapeType
implicit none

class(shape_Type), pointer :: shape(:)

 integer :: j
 allocate(shape(3),source=create_shape())


  call shape(1)%init(3)
  call shape(2)%init(4)
  call shape(3)%init(5)

  do j = 1, 3
  call shape(j)%prt()
  print*,shape(j)%apple%y(:)
  enddo


end program main
