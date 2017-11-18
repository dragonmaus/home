#!/usr/bin/sed -f

/^+++/ s/^/[1m/
/^---/ s/^/[1m/

/^+/ s/^/[32m/
/^-/ s/^/[31m/
/^@/ s/^/[36m/

/^Binary files .* are identical$/ s/^/[1m/
/^Files .* are identical$/ s/^/[1m/

/^\\/ s/^/[35m/

/^diff / s/^/[1m/

t end
s/^[^	 ]/[1m&/
: end

s/ \{1,\}$/[1;30m&/

: loop
s/ \( *\)$/+\1/
t loop

s/$/[m/
