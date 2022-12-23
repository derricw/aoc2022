import std/[strutils, enumerate]
import aoclib

proc parseStacks(stackDef: openArray[string]): seq[Stack[char]]= 
  for i, s in enumerate(stackDef[^1]):
    if not "\n ".contains(s):
      var stack = Stack[char]()
      var z = len(stackDef) - 2
      while z >= 0:
        if (len(stackDef[z]) >= i and stackDef[z][i] != ' '):
          stack.push stackDef[z][i]
          #echo stackDef[z][i]
          z -= 1
        else:
          break
      result.add(stack)

proc parseMove(move: string): (int, int, int) =
  let tokens = split(move)
  return (parseInt(tokens[1]), parseInt(tokens[3]), parseInt(tokens[5]))

proc p1p2(instructions: openArray[string]) =
  var stacks: seq[Stack[char]]
  var movesStart: int
  var p1output: string
  var p2output: string

  for i, l in enumerate(instructions):
    if l.len > 2:
      if l[0..1] == " 1":
        stacks = parseStacks(instructions[0..i])
        movesStart = i + 2
        break

  var p1stacks = stacks
  var p2stacks = stacks

  for move in instructions[movesStart..<instructions.len]:
    let (count, source, dest) = parseMove(move)
    p1stacks[source-1].moveN(p1stacks[dest-1], count)
    p2stacks[source-1].shiftN(p2stacks[dest-1], count)
  for stack in p1stacks:
    p1output = p1output & $stack.peek
  for stack in p2stacks:
    p2output = p2output & $stack.peek
  echo p1output
  echo p2output
  
let input = splitLines((strip(readAll(system.stdin), leading=false)))
p1p2 input
