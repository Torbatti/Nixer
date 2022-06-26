import tables, strutils, os

# var fhs = Table[char, File]()

for line in lines("my.txt"):
  echo line
  # if line.isEmptyOrWhitespace(): continue # skip empty
  # let first = line[0]
  # if not fhs.contains(first):
  #   fhs[first] = open(getAppDir() / $first, fmWrite)
  # fhs[first].writeLine(line)

# for fh in fhs.values:
#   fh.close()