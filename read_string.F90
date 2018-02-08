program main


implicit none

character(len=200) :: longstr='13,5,7,anh'//new_line('A')//'25.4'
real*4 :: a,b,e
integer :: c
character(len=3) :: d

read(longstr,*)a,b,c,d,e
write(*,*)a,b,c,d,e
end program main
