set -x

for f in *; do
    echo "filename is $f"
    bin="`pwd`/$f"
    dir=`mktemp -d`
    (cd $dir && timeout -s KILL 3 $bin)
    rm -rf $dir
done
