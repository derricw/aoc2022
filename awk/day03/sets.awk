# add characters in string to a set
function str2set(str, set,    arr) {
  split(str, arr, "")
  for (i in arr) {
    set[arr[i]] = 1
  }
}

# union of 2 sets
function union(set1, set2, ret) {
  delete ret
  for (item in set1) {
    if (item in set2) {
        ret[item] = 1
      }
  }
}

