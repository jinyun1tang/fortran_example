  program main

  implicit none

  integer :: a
  real*8  :: b

  character(len=32) :: str
  character(len=32) :: fmt
  a = 203

  b = 48.3
  fmt ='(I3.3)'
  write(str,fmt)a
  print*,trim(adjustl(str))
  fmt='(F4.1)'
  write(str,fmt)b
  print*,trim(adjustl(str))
  end program main
