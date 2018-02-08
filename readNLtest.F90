
    program main
    implicit none
    character(len=32)      :: reaction_method
    logical                :: advection_on, diffusion_on, reaction_on, ebullition_on
    character(len=256)     :: betr_namelist_buffer
    character(len=1), parameter  :: quote = ''''

    reaction_method = 'bgc'
    advection_on    = .true.
    diffusion_on    = .true.
    reaction_on     = .false.
    ebullition_on   =.true.

    write(betr_namelist_buffer,*) '&betr_parameters'//new_line('A'), &
      ' reaction_method='//quote//trim(reaction_method)//quote//new_line('A'), &
      ' advection_on=',trim(logstr(advection_on)),new_line('A'), &
      ' diffusion_on=',trim(logstr(diffusion_on)),new_line('A'), &
      ' reaction_on=',trim(logstr(reaction_on)),new_line('A'), &
      ' ebullition_on=',trim(logstr(ebullition_on)),new_line('A')//'/'


    print*,betr_namelist_buffer
    contains
      function logstr(logval)result(str)
      implicit none
      logical, intent(in) :: logval
      character(len=8) :: str
      if(logval)then
        str='.true.'
      else
        str='.false.'
      endif
      end function logstr
    end program main
