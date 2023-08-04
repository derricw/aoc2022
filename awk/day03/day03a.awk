function halfString(s, pair,   arr) {
  split(s, arr, "")
  for (i=1; i<=length(arr)/2; i++) {
    pair[1] = pair[1] arr[i]
  }
  for (i=length(arr)/2+1; i<=length(arr); i++) {
    pair[2] = pair[2] arr[i]
  }
}

function findCommon(s1, s2,    arr1, arr2, set) {
  split(s1, arr1, "")
  for (i=1; i<=length(arr1); i++) {
    set[arr1[i]] = 1
  }
  split(s2, arr2, "")
  for (char in arr2) {
    if (arr2[char] in set) {
      return arr2[char]
    }
  }
}

BEGIN {
  split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", alphabet, "")
  for (i=1; i<=length(alphabet); i++) {
    priority[alphabet[i]] = i
    #print alphabet[i], priority[alphabet[i]]
  }
}
{
  halfString($0, pair)
  common = findCommon(pair[1], pair[2])
  delete pair
  sum += priority[common]
}

END { print sum }
