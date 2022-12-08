import system
import std/[strutils, tables, sugar, math]

# X: rock Y: paper Z: scissors
const p1lut = {
  "A X": 3 + 1,
  "A Y": 6 + 2,
  "A Z": 0 + 3,
  "B X": 0 + 1,
  "B Y": 3 + 2,
  "B Z": 6 + 3,
  "C X": 6 + 1,
  "C Y": 0 + 2,
  "C Z": 3 + 3,
}.toTable

# X: lose Y: draw Z: win
const p2lut = {
  "A X": 0 + 3,
  "A Y": 3 + 1,
  "A Z": 6 + 2,
  "B X": 0 + 1,
  "B Y": 3 + 2,
  "B Z": 6 + 3,
  "C X": 0 + 2,
  "C Y": 3 + 3,
  "C Z": 6 + 1,
}.toTable


proc p1(rounds: openArray[string]) =
  let scores = collect:
    for rnd in rounds: p1lut[rnd]
  echo sum scores

proc p2(rounds: openArray[string]) =
  let scores = collect:
    for rnd in rounds: p2lut[rnd]
  echo sum scores


let input = splitLines(strip(readAll(system.stdin)))
p1 input
p2 input
