#!/bin/sh

cat << END
# This is a shell archive.  Save it in a file, remove anything before
# this line, and then unpack it by entering "sh file".  Note, it may
# create directories; files and directories will be owned by you and
# have default permissions.
#
# This archive contains:
#
END

for f do
  echo "#	$f"
done

echo "#"

mkdirs() (
  d=`dirname "$1"`
  test x"$d" = x. && exit
  test x"$d" = x/ && exit
  echo "mkdir -p $d"
)

for f do
  echo "echo x - $f"
  mkdirs "$f"
  echo "sed 's/^X//' >$f << 'END-of-$f'"
  sed 's/^/X/' <"$f"
  echo "END-of-$f"
done

echo "exit"
echo
