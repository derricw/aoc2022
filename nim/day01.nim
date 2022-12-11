import system
import std/[strutils, math, algorithm]

proc p1(items: openArray[string]) =
  var biggest = 0
  var sack: seq[int]
  for cal in items:
    if cal != "":
      sack.add(parseInt(cal))
    else:
      let total = sum(sack)
      if total > biggest:
        biggest = total
      sack = @[]
  if len(sack) > 0:
    let total = sum(sack)
    if total > biggest:
      biggest = total

  echo biggest

proc p2(items: openArray[string]) =
  var manifest: seq[int]
  var sack: seq[int]
  for cal in items:
    if cal != "":
      sack.add(parseInt(cal))
    else:
      if sack.len > 0:
        manifest.add(sum(sack))
        sack = @[]
  if len(sack) > 0:
    manifest.add(sum(sack))
  manifest.sort(order=SortOrder.Descending)

  echo sum(manifest[0 .. 2])


let input = splitLines(readAll(system.stdin))
p1 input
p2 input
