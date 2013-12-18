import os
import os.path
import sys

cd = "." if len(sys.argv) == 1 else sys.argv[1]
cd = os.path.abspath(cd)

while True:
  if os.path.exists(os.path.join(cd, ".devtk")):
    print(cd)
    sys.exit(0)
  npath = os.path.abspath(os.path.join(cd, ".."))
  if npath == cd:
    sys.exit(1)
  cd = npath
