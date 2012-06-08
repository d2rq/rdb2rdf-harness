for TESTCASE in `find rdb2rdf-tests -name create.sql | sed "s/^.*\/\(D...\).*\/create.sql/\1/"`
do
    ./r2rml-test.sh $TESTCASE
done
