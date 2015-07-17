regex

[]:
be[as]ut -> beaut, besut
be[a-z]ut -> beaut, bebut, becut, ...
be[au|s]t -> beaut, best
be[^a]t  -> bebt, bect, ...

^:
'^The' -> The moon ...
'last$' -> ... at last 

. * + ?:
b..t -> best
b*t -> t, bt, bbt, bbbt
b.*b -> bb, bab, bacb, bbbbb, bdexdeb,
'be\+d' -> bed, beed, beeed, ....

{}:
'be\{2,5\}' -> bee, beee, beeee, beeee
'bee\{2\}d' -> beed
'bee\{2,\}d' -> beed, beeed, beeeed, ....
