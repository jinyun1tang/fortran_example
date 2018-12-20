program main

implicit none

  logical :: yesno
  integer :: god_number
  real*8  :: god_value

  character(len=*),  parameter :: mod_filename = &
       __FILE__
  namelist /test_parm/ yesno, god_number, god_value

  character(len=512) :: testname_list
  character(len=512) :: testname_list_new

  character(len=256) :: ioerror_msg
  integer :: nml_unit, nml_error
  integer :: stdout
  stdout=6
  open(unit=nml_unit, file='test_nml', action='read',access='stream', form='unformatted', iostat=nml_error)
  if(nml_error==0)then
    read(nml_unit, iostat=nml_error, iomsg=ioerror_msg)testname_list

    if (.not. is_iostat_end(nml_error)) then
        write(stdout, '(a, a, i8)') mod_filename, &
             ": IO ERROR reading namelist file into buffer: ", nml_error
        write(stdout, '(a)') ioerror_msg
        call abort()
     else
        write(stdout, '(a, a, a)') "Read test_nml until EOF."
     end if
  else
     write(stdout, '(a, a, i8, a, a)') mod_filename, ": IO ERROR ", nml_error, &
          " opening namelist file :  test_nml "
     call abort()
  endif

  print*,trim(testname_list)
  write(testname_list_new,'(a)')'&test_parm'//' '//'yesno='//log2str(yesno)//' god_value=10.0'//' '//'god_number=1'
  print*,trim(testname_list_new)
  if(index(trim(testname_list_new),'test_parm')/=0)then
    ioerror_msg=''
    read(testname_list,nml=test_parm,iostat=nml_error, iomsg=ioerror_msg)
    if (nml_error /= 0) then
      write(stdout, *)'read name list test_parm error'
      call abort()
    endif
    print*,'yesno=',yesno
    print*,'god_value=',god_value
    print*,'god_number=',god_number

  endif
contains
  function log2str(logvar)result(ans)
  implicit none
  logical, intent(in) :: logvar
  character(len=7) :: ans

  if(logvar)then
    ans='.true.'
  else
    ans='.false.'
  endif
  end function log2str
end program main
