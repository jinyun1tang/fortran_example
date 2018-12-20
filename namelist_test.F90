program main



implicit none

character(len=20) :: fname1='watermelon'
character(len=20) :: units1="one"
character(len=20) :: avgflag1="a"
character(len=20) :: type2d1="levtrc"
character(len=20) :: long_name1="seed less watermelon"
character(len=20) :: default1="inactive"


character(len=20) :: fname
character(len=20) :: units
character(len=20) :: avgflag
character(len=20) :: type2d
character(len=20) :: long_name
character(len=20) :: default

integer :: nml_error
character(len=200):: ioerror_msg
character(len=2000):: nmlist
character(len=1) :: quote = ''''
namelist /hist2d_fmt/    &
   fname, units, avgflag,type2d,long_name, default

 print*,new_line('A')
 print*,quote
nmlist='&hist2d_fmt' &
  //' fname='//quote//trim(fname1)//quote &
  //' units='//quote//trim(units1)//quote &
  //' avgflag='//quote//trim(avgflag1)//quote &
  //' type2d='//quote//trim(type2d1)//quote &
  //' long_name='//quote//trim(long_name1)//quote &
  //' default='//quote//trim(default1)//quote//' /'
print*,nmlist

read(nmlist, nml=hist2d_fmt, iostat=nml_error, iomsg=ioerror_msg)
if(nml_error/=0)then
  write(*,*)'reading namelist failed'//ioerror_msg
endif
print*,'fname=',fname
print*,'units=',units
print*,'avgflag=',avgflag
print*,'type2d=',type2d
print*,'long_name=',long_name
print*,'default=',default
end program main
