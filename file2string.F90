program file2string

implicit none

character(len=12288) :: long_str
character(len=255) :: line_read

character(len=255) :: filename
integer :: ios
logical :: start

call getarg(1,filename)
print*,'read from file: '//filename
open(unit=999, file=trim(filename),status='old',action='read',form='formatted')
start=.true.
do
  read(999,'(a)',IOSTAT=ios)line_read
  if(ios>0)then
    print*,'reading error'
    stop
  elseif(ios==0)then
    if(start)then
      long_str=trim(line_read)//new_line('A')
      start=.false.
    else
      long_str=trim(long_str)//trim(line_read)//new_line('A')
    endif
  else
    exit
  endif
enddo
print*,trim(long_str)
close(999)
end program file2string
