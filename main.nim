import strutils
import math

proc getAB[T](arr:var seq[T]): (T,T) =
  let
    a = arr.pop()
    b = arr.pop()
  return (b,a)

var
  stack:seq[float] = @[];
while true:
  stdout.write ": "
  let r = readLine(stdin)

  case r
  of "+":
    let
      t = stack.getAB()
    stack.add(t[0]+t[1])
  of "-":
    let
      t = stack.getAB()
    stack.add(t[0]-t[1])
  of "*":
    let
      t = stack.getAB()
    stack.add(t[0]*t[1])
  of "/":
    let
      t = stack.getAB()
    stack.add(t[0]/t[1])
  of "^":
    let
      t = stack.getAB()
    stack.add(t[0].pow t[1])
  of "p":
    echo stack[^1]
  of ".exit":
    echo "bye ;)"
    break
  else:
    try:
      stack.add(r.parseFloat())
    except:
      echo "invalid input\r\n(to exit press ctrl+C or type .exit)"