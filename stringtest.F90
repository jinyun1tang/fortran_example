program main

implicit none

call string_input((/'adbc','degf'/),2)

end program main


subroutine string_input(str_arr, nstr)

implicit none
integer, intent(in) :: nstr
character(len=*) :: str_arr(nstr)

integer :: jj
print*,(str_arr(jj),jj=1,nstr)
end subroutine string_input
