
import system
import std/strutils, std/math
import std/algorithm

let input = splitLines(readAll(system.stdin))

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

p1 input

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

p2 input
