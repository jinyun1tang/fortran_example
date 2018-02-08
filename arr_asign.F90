program main


implicit none

real*8 :: arr(3)
real*8 :: brr(6)


arr=(/1.,2.,3./)

brr=(/arr(1:3),arr(1:3)/)

print*,brr
end program main
