program main

implicit none

 real*8, pointer :: a(:)
 real*8, pointer :: b(:)

 integer :: n

 allocate(a(9))
 allocate(b(9))
 do n = 1, 9
   a(n)=n*2.0
 enddo 

 b => (/a(3),a(4),a(7)/)
 
 print*,b


 do n = 1, 9
   a(n)=n*3.0
 enddo

 print*,b

end program main
