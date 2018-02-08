module data_type

implicit none

 type, public :: gbetr_type

 end type gbetr_type


  type, extends(gbetr_type), public :: Extra_type
     real*8, pointer :: zi(:)  => null()             !interfaces
     real*8, pointer :: us(:)  => null()             !flow velocity at the interfaces
     integer           :: nlen                         !total number of interfaces
  end type Extra_type

  public :: InitAllocate
  public :: AAssign
  public :: DDeallocate
  public :: do_sth1
contains
  !-------------------------------------------------------------------------------
  subroutine InitAllocate(this, lbj, ubj)
    !
    ! !DESCRIPTION:
    ! allocate memory for arrays of the specified data type

    ! !ARGUMENTS:
    class(gbetr_type), pointer  :: this
    integer, intent(in) :: lbj, ubj
    character(len=32) :: subname ='InitAllocate'

    select type(this)
    class is (Extra_type)
      allocate(this%zi(lbj:ubj))
      allocate(this%us(lbj:ubj))
    end select
  end subroutine InitAllocate
  !-------------------------------------------------------------------------------

  subroutine DDeallocate(this)
    !
    ! !DESCRIPTION:
    ! Deallocate memories
    !
    ! !ARGUMENTS:
    class(gbetr_type), pointer :: this
    character(len=32) :: subname ='DDeallocate'

    select type(this)
    class is (Extra_type)
    deallocate(this%zi)
    deallocate(this%us)
    end select
  end subroutine DDeallocate

  !-------------------------------------------------------------------------------

  subroutine AAssign(this, n1)
    !
    ! !DESCRIPTION:
    ! Assgin values for member variables for the specified data type
    !
    implicit none
    ! !ARGUMENTS:
    class(gbetr_type), pointer :: this
    integer, intent(in) :: n1


    ! !LOCAL VARIABLES:
    integer :: nn
    character(len=32) :: subname ='AAssign'

    select type(this)
    class is (Extra_type)
    do nn = 1, n1
      this%zi(nn) = nn
      this%us(nn) = nn
    enddo
    this%nlen = nn
    end select
  end subroutine AAssign


  subroutine do_sth1(Extra_inst, nn)
  implicit none
  class(gbetr_type), pointer :: extra_inst
  integer, intent(in) :: nn
  integer :: nj


  call aassign(extra_inst, nn)
  select type(extra_inst)
  class is (Extra_type)

    do nj = 1, extra_inst%nlen
      print*,'zi,us',extra_inst%zi(nj),extra_inst%us(nj)
    enddo
  end select
  end subroutine do_sth1


  subroutine do_print(gtype)

  class(gbetr_type), pointer :: gtype

  integer :: nj

  select type(gtype)
  class is (Extra_type)
    print*,'------------------------------------------------------'
    do nj = 1, gtype%nlen
      print*,'zi,us',gtype%zi(nj),gtype%us(nj)
    enddo
  end select

  end subroutine do_print
end module data_type
