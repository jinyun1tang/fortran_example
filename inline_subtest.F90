


program main


implicit none
external :: ext1
  call ext1()
end program main


subroutine ext1()

implicit none
  integer :: a
  integer :: b
  a= 2
  call ex2(3)
  a=4
  call ex2(5)
contains

  subroutine ex2(j)
  implicit none
  integer, intent(in) :: j

  print*, j
  print*,'a=',a
  end subroutine ex2
end subroutine ext1
