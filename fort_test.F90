
program main
use type_mod, only : new_type
implicit none

type(new_type) :: type1

character(len=3), pointer :: tracer(:)
allocate(type1%str(3))

tracer => type1%str(:)

print*,tracer(1)

end program main
