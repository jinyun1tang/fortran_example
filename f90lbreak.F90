


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
    integer :: trimlen
    logical :: is_head
    logical :: is_comma
    integer :: k

    narg=iargc()
    if (narg/=1)then
      print*,'please use as: f90lbreak f90.f'
    endif
    CALL get_command_argument(1, infile)

    oufile = infile
    slen=len(trim(oufile))
    is_head=.false.
    do ii = 1, slen
      if(oufile(ii:ii+3)=='.F90')then
        oufile(ii+1:ii+5)='F90_1'
      elseif(oufile(ii:ii+1)=='.h')then
        is_head=.true.
        oufile(ii+1:ii+2)='h1'
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

      if(is_comma(line2))then
      !modify line1
        do k = trimlen(line1), 1, -1
          if(line1(k:k)=='&')then
            line1(k:k+1)=',&'
          endif
        enddo
      endif
      write(wrt_unit,*)line1
      line1=line2
    end do

    write(wrt_unit,*)line1
    close(read_unit)
    close(wrt_unit)
    write(*,*)trim(infile)//' is converted to '//oufile
!    if(is_head)then
!      call system('mv '//trim(oufile)//' '//trim(infile))
!    endif
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


function trimlen(string)
  implicit none
  character(len=*), intent(in) :: string
  integer :: trimlen

  trimlen=len(trim(string))
end function trimlen

function is_comma(string)

  implicit none
  character(len=*), intent(inout) :: string
  integer :: trlen
  integer :: j, k
  logical :: is_comma
  integer :: trimlen

  trlen=trimlen(string)

  is_comma=.false.
  do j = 1, trlen
    if(string(j:j)/=' ')then
      if(string(j:j)==',')then
        is_comma=.true.
        k = j
      endif
      exit
    endif
  enddo
  if(is_comma)string(k:k)=' '
end function is_comma
