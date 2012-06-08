for TESTCASE in `find rdb2rdf-tests -name directGraph.ttl | sed "s/^.*\/\(D...\).*\/directGraph.ttl/\1/"`
do
    ./dm-test.sh $TESTCASE
done
