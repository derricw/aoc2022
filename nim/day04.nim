import system
import std/[strutils, sets, sequtils]


proc parseAssignment(assignment: string): (HashSet[int], HashSet[int]) =
  let elves = split(assignment, ",")
  let (tasksDef0, tasksDef1) = (split(elves[0], "-"), split(elves[1], "-"))
  let (tasks0, tasks1) = (
    toSeq(parseInt(tasksDef0[0])..parseInt(tasksDef0[1])), 
    toSeq(parseInt(tasksDef1[0])..parseInt(tasksDef1[1]))
  )
  return (toHashSet(tasks0), toHashSet(tasks1))

  
proc p1p2(assignments: openArray[string]) =
  var fullyContains: int = 0
  var overlaps: int = 0
  for assignment in assignments:
    let (t0, t1) = parseAssignment(assignment)
    let inter = t0 * t1
    if len(t0 - inter) == 0 or len(t1 - inter) == 0:
      fullyContains += 1
    if len(inter) > 0:
      overlaps += 1
  echo fullyContains
  echo overlaps


let input = splitLines(strip(readAll(system.stdin)))
p1p2 input
