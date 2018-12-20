

#define PRINT_DEF(oks) call do_sth(oks); print*,'OK'; stop

program main

implicit none

PRINT_DEF('dddd')

print*,'ddkkfk'
end program main


subroutine do_sth(oks)
implicit none
character(len=*), intent(in) :: oks

print*,'do sth '//trim(oks)

end subroutine do_sth
