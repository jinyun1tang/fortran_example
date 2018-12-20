




  program main

  implicit none

  integer :: a,b

#define fab(a,b) a=b
#define iab(a,b) b=a
#define ascal(a,b) a=a*b
  b=3
  fab(a,b)
  print*,'a,b=',a,b
  a=2
  iab(a,b)

  print*,'a,b=',a,b
  ascal(a,   b)
  print*,'a,b=',a,b
  end program main
