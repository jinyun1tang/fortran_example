


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
    integer, parameter :: clen=len('CHARACTER*')
    integer :: k, j

    narg=iargc()
    if (narg/=1)then
      print*,'please use as: f90lbreak f90.f'
    endif
    CALL get_command_argument(1, infile)

    oufile = infile
    slen=len(trim(oufile))

    do ii = 1, slen
      if(oufile(ii:ii+3)=='.F90')then
        oufile(ii+1:ii+5)='F90_1'
      endif
    enddo

    print*, 'processing file ', infile

    OPEN (UNIT=read_unit, file=infile, status='old', err=100)
    open (unit=wrt_unit, file=oufile, status='replace', err=101)

    do
      read(read_unit, '(A)', iostat=ios) line1
      if (ios /= 0) exit
      slen=len(trim(line1))
      line2=line1
      do k = 1, slen
        if(line1(k:k+clen-1)=='CHARACTER*')then
          !find the the space
          do j = k+clen, slen
            if(line1(j:j)==' ')then
              !form the new line
              write(line2,*)line1(1:k-1)//'character(len='//line1(k+clen:j-1)//') :: '//line1(j+1:slen)
              exit
            endif
          enddo
        endif
      enddo
      write(wrt_unit,*)line2
    end do

    close(read_unit)
    close(wrt_unit)
    write(*,*)trim(infile)//' is converted to '//oufile
!    if(is_head)then
      call system('mv '//trim(oufile)//' '//trim(infile))
!    endif
    stop
100 write(*,*)'fail to open file ', infile
101 write(*,*)'fail to create file ',oufile
102 write(*,*)'fail to read the first line of file ',infile
end program main
