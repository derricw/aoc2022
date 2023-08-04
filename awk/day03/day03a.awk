# cut a string in half
function halfString(s, pair,   arr) {
  split(s, arr, "")
  for (i=1; i<=length(arr)/2; i++) {
    pair[1] = pair[1] arr[i]
  }
  for (i=length(arr)/2+1; i<=length(arr); i++) {
    pair[2] = pair[2] arr[i]
  }
}

# find the first common character in 2 strings
function findCommon(s1, s2,    arr1, arr2, set) {
  split(s1, arr1, "")
  for (i in arr1) {
    set[arr1[i]] = 1
  }
  split(s2, arr2, "")
  for (i in arr2) {
    if (arr2[i] in set) {
      return arr2[i]
    }
  }
}

BEGIN {
  split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", alphabet, "")
  for (i in alphabet) {
    priority[alphabet[i]] = i
  }
}
{
  halfString($0, pair)
  common = findCommon(pair[1], pair[2])
  delete pair
  sum += priority[common]
}
END { print sum }
