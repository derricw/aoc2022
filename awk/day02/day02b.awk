BEGIN {
  score["A X"] = 0 + 3
  score["A Y"] = 3 + 1
  score["A Z"] = 6 + 2
  score["B X"] = 0 + 1
  score["B Y"] = 3 + 2
  score["B Z"] = 6 + 3
  score["C X"] = 0 + 2
  score["C Y"] = 3 + 3
  score["C Z"] = 6 + 1
}
{ total_score+=score[$0] }
END { print total_score }
