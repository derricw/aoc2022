import std/[strutils, sets]

proc findNDistinct(str: string, n: int): int =
  for i in n..str.len:
    let substr = str[i-n..<i]
    let charSet = toHashSet(@substr) # @ converts to a seq
    if len(charSet) == n:
      return i

proc p1(instructions: string) =
  echo findNDistinct(instructions, 4)

proc p2(instructions: string) =
  echo findNDistinct(instructions, 14)

let input = strip(readAll(system.stdin))
p1 input
p2 input
