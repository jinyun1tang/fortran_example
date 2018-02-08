


program main

    implicit none
    character(len=256) :: line1
    character(len=256) :: line2

    integer :: ii, nn
    integer :: narg
    integer :: slen
    character(len=120) :: infile
    character(len=120) :: oufile
    integer, parameter :: read_unit=10
    integer, parameter :: wrt_unit=11
    integer :: ios
    logical :: is_numeric
    logical :: is_head
    narg=iargc()
    if (narg/=1)then
      print*,'please use as: f77tof90 f77.f'
    endif
    CALL get_command_argument(1, infile)

    oufile = infile
    slen=len(trim(oufile))
    is_head=.false.
    do ii = 1, slen
      if(oufile(ii:ii+2)=='.f ')then
        oufile(ii+1:ii+3)='F90'
      elseif(oufile(ii:ii+2)=='.h ')then
        is_head=.true.
        oufile(ii+1:ii+3)='.h1'
      endif
    enddo

    print*, 'processing file ', infile

    OPEN (UNIT=read_unit, file=infile, status='old', err=100)
    open (unit=wrt_unit, file=oufile, status='replace', err=101)
    read(read_unit, '(A)', iostat=ios) line1
    if (ios /= 0) goto 102

    do
      read(read_unit, '(A)', iostat=ios) line2
      if (ios /= 0) exit

      if (line2(1:1)=='C')then
        !this is a comment line
        line2(1:1)='!'
      else

        if(line2(1:1)==' ' .and. line2(6:6)/=' ')then
          !this is a continous line
          line1=trim(line1)//' &'
          line2(6:6)=' '
        endif

      endif
      write(wrt_unit,*)line1
      line1=line2
    end do

    write(wrt_unit,*)line1
    close(read_unit)
    close(wrt_unit)
    write(*,*)trim(infile)//' is converted to '//oufile
    if(is_head)then
      call system('mv '//trim(oufile)//' '//trim(infile))
    endif
    stop
100 write(*,*)'fail to open file ', infile
101 write(*,*)'fail to create file ',oufile
102 write(*,*)'fail to read the first line of file ',infile
end program main



FUNCTION is_numeric(string)
  IMPLICIT NONE
  CHARACTER(len=*), INTENT(IN) :: string
  LOGICAL :: is_numeric
  REAL :: x
  INTEGER :: e
  READ(string,*,IOSTAT=e) x
  is_numeric = e == 0
END FUNCTION is_numeric
