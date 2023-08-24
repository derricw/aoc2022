BEGIN { FS="-|," }
($3 <= $2 && $1 <= $4) { c++ }
END { print c }
