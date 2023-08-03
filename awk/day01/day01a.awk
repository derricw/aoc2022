BEGIN { arraylen=0; sum=0; max=0 }
NF!=0 { sum+=$1 }
NF==0 { max=max<sum?sum:max; sum=0; }
END {
if (sum>0) 
  max=max<sum?sum:max
print max 
}
