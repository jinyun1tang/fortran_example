program main

use AppType, only : app_type
implicit none

 type(app_type) :: app


 call app%init()

 call app%something_else()
end program main
