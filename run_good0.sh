set -x

for f in *; do
    name1="05b7a0696a5112fbced5"
    name2="0d4211f386d0172c4af4"
    if [ $f == $name1 ] || [ $f == $name2 ]; then
        echo "skip"
        continue
    fi
    echo "filename is $f"
    bin="`pwd`/$f"
    dir=`mktemp -d`
    (cd $dir && timeout -s KILL 3 $bin)
    rm -rf $dir
done
