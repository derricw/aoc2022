BEGIN { arraylen=0; sum=0 }
NF!=0 { sum+=$1 }
NF==0 { sums[arraylen]=sum; arraylen++; sum=0 }
END { 
  if (sum>0) 
    sums[arraylen]=sum

  asort(sums)
  for (i=length(sums); i>length(sums)-3; i--)
    calories += sums[i]
  print calories
}
