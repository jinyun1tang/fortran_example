

module listMod

implicit none
type, public :: node
  character(len=20)   :: name
  type(node), pointer :: next
end type node

end module listMod

program main

use listMod
implicit none
type(node), pointer :: head, temp
type(node), pointer :: tail, temp1


!create head
allocate(head)
head%name="one"
nullify(head%next)

allocate(temp)
temp%name="two"
temp%next=> head
head => temp
nullify(temp)

allocate(temp)
temp%name="three"
temp%next=>head
head=> temp
nullify(temp)

allocate(tail)
tail%name=head%name
nullify(tail%next)
print*,head%name

temp=>head%next
do while(associated(temp))
  allocate(temp1)
  temp1%name=temp%name
  temp1%next=>tail
  tail => temp1
  print*,temp%name
  temp=> temp%next
enddo

nullify(temp1)
print*,''
temp1=>tail
do while(associated(temp1))
  print*,temp1%name
  temp1=> temp1%next
enddo

end program main
