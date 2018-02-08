module type_mod
  
implicit none

  type, public :: new_type
   character(len=3), pointer :: str(:) => null()
  end type new_type

end module type_mod
