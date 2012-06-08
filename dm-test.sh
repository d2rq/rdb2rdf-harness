TESTDIR=`find rdb2rdf-tests -name "$1-*" | sed "s/^.*\/\(D.*\)/\1/"`
if [ "$TESTDIR" == "" ]
then
    echo "No test case '$1' found!"
    exit 1
fi
echo === ./dm-test.sh $1 ===
EXPECTED=output/dm-$1-expected.nt
ACTUAL=output/dm-$1-actual.nt
rdfcopy rdb2rdf-tests/$TESTDIR/directGraph.ttl TURTLE N-TRIPLE | sort > $EXPECTED
./run-dm.sh rdb2rdf-tests/$TESTDIR/create.sql $ACTUAL
if [ "$?" == "0" ]
then
    echo ------------
    rdfcompare $EXPECTED $ACTUAL N-TRIPLE N-TRIPLE > /dev/null
    if [ "$?" == "0" ]
    then
        echo PASS!
    else
        echo "FAIL! diff follows."
        sort $ACTUAL > $ACTUAL-sorted
        mv $ACTUAL-sorted $ACTUAL
        diff $EXPECTED $ACTUAL
    fi
fi
