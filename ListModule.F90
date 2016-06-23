module ListModule
implicit none
  private
  integer, parameter :: max_str_len=400
  type, public :: ListString
    character(len=max_str_len) :: string_val
    type(ListString), pointer :: next
  end type ListString

  public :: InsertList_string
  public :: PrintList_string
contains

  function InsertList_string(head, elm)
  implicit none
  type(ListString), pointer :: head, elm
  type(ListString), pointer :: InsertList_string

  elm%next => head
  InsertList_string => elm
  end function InsertList_string
!-------------------------------------------------------------------------------
  subroutine PrintList_string(head)

  implicit none
  type(ListString), pointer :: head

  type(listString), pointer :: h

  if(associated(head))then
    h = head
  endif
  do
    print*,h%string_val
    if(associated(h%next))then
      h => h%next
    else
      exit
    endif
  enddo
  end subroutine PrintList_string

end module ListModule
