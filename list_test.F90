program main
use ListModule

implicit none

  type(listString), pointer :: head
  type(listString), pointer :: elem
  nullify(head)

  allocate(elem)
  elem%string_val='xdalg;1'
  head=>InsertList_string(head, elem)

  allocate(elem)
  elem%string_val='dxdalg;2'
  head => InsertList_string(head, elem)

  allocate(elem)
  elem%string_val='xdagg;3'
  head => InsertList_string(head, elem)

  call PrintList_string(head)

  print*,head%string_val
  call PrintList_string(head)

end program main
