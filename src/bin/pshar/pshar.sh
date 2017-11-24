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

for f do
  echo "echo x - $f"
  echo "(sed 's/^X//' | pass insert -m $f) << 'END-of-$f'"
  sed 's/^/X/' <"$f"
  echo "END-of-$f"
done

echo "exit"
echo
