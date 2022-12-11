import system
import std/[strutils, tables, sugar, math, sets, sequtils]

const alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
const priority = collect(initTable):
  for i, c in alphabet: {c: i+1}

# convert a rucksack string to HashSet[char]
proc getItemTypes(contents: string): HashSet[char] =
  var itemTypes = collect(initHashSet):
    for c in contents: {c}
  return itemTypes # cannot simply `return collect():`


proc p1(rucksacks: openArray[string]) =
  var priorities: seq[int]
  for sack in rucksacks:
    let center: int = len(sack) div 2
    let c1 = sack[0 ..< center] # < makes it exclusive
    let c2 = sack[center .. ^1] # < ^1 is same as -1 in python
    var contents = getItemTypes(c1)
    for c in c2:
      if contains(contents, c):
        priorities.add priority[c]
        break
  echo sum priorities


proc p2(rucksacks: openArray[string]) =
  var priorities: seq[int]
  let groups = @rucksacks.distribute(len(rucksacks) div 3) # @ converts openArray -> seq
  for group in groups:
    let iTypes = map(group, getItemTypes)
    var common = iTypes[0] * iTypes[1] * iTypes[2]
    priorities.add priority[common.pop]
  echo sum priorities


let input = splitLines(strip(readAll(system.stdin)))
p1 input
p2 input
