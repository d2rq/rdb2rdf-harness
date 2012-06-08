== RDB2RDF Test Harness ==
This is a pile of 

=== Prerequisites ===
* Unix environment (tested only on OS X)
* Jena's `rdfcopy` and `rdfcompare` command line tools on the path
* ARQ's `sparql` command line tool on the path
* Mercurial (to download the RDB2RDF test suite)

=== Preparation ===

Download the test suite:

    cd rdb2rdf-harness
    hg clone https://dvcs.w3.org/hg/rdb2rdf-tests

Edit `run-dm.sh` to suit the Direct Mapping implementation under test. It is invoked like this, where `database.sql` is the location of a SQL file containing the input database, and `output.nt` is the filename where your tool has to drop the output in N-Triples format:

    run-dm.sh database.sql output.nt

Edit `run-dm.sh` to suit the Direct Mapping implementation under test. It is invoked like this, where `database.sql` is the location of a SQL file containing the input database, `mapping.ttl` is the location of an R2RML mapping file, and `output.nt` is the filename where your tool has to drop the output in N-Quads format:

    run-r2rml.sh database.sql mapping.ttl output.nq

=== Running individual tests ===

    ./dm-test.sh D001
    ./r2rml-test.sh D001

The R2RML tester will run all tests in the `D001` directory. It currently cannot run just an individual test.

=== Running all tests ===

    ./all-dm-tests.sh
    ./all-r2rml-tests.sh
