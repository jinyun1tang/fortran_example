module do_data


implicit none

  public :: do_sth2

contains

   subroutine do_sth2(fun, extra)
   use data_type, only : gbetr_type
   implicit none
   class(gbetr_type),  pointer  :: extra


   external :: fun

   call fun(extra)
   end subroutine do_sth2


end module do_data
