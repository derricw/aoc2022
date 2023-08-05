@include "sets.awk"

BEGIN {
  split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", alphabet, "")
  for (i in alphabet) {
    priority[alphabet[i]] = i
  }
  idx = 1
}
{
  group[idx] = $1
  idx++
  if (length(group) == 3) {
    str2set(group[1], set1); str2set(group[2], set2); str2set(group[3], set3)
    union(set1, set2, set1set2)
    union(set1set2, set3, u)
    for (item in u) {
      sum+=priority[item]
    }
    idx = 1
    delete group; delete set1; delete set2; delete set3;  # have to clear these
  }
}
END { print sum }
