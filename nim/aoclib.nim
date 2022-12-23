import std/[algorithm]

type
  Stack* [T] = object
    data: seq[T]

proc newStack*[T](capacity = 8): Stack[T] =
  result.data = newSeqOfCap[T](capacity)

proc len*[T](s: Stack[T]): int =
  s.data.len

proc push*[T](s: var Stack[T], item: T) =
  s.data.add(item)

proc pop*[T](s: var Stack[T]): T =
  # TODO: error on empty stack?
  result = s.data[^1]
  s.data.setLen s.data.len - 1

proc peek*[T](s: Stack[T]): T =
  s.data[^1]

proc empty*[T](s: Stack[T]): bool =
  s.len == 0

proc moveN*[T](s: var Stack[T], dest: var Stack[T], count=1) =
  # move N from source to dest
  for i in 0..<count:
    dest.push(s.pop)

proc shiftN*[T](s: var Stack[T], dest: var Stack[T], count=1) =
  # move N from source to dest, but all at once (preserving the order)
  var toMove: seq[T]
  for i in 0..<count:
    toMove.add s.pop
  for item in reversed(toMove):
    dest.push item


