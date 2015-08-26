#!/bin/bash

MARKER=`date +'%Y_%m_%d_%H_%M_%S'`
PROJDIR=/Users/tck/projects
SRCDIR=$PROJDIR/jdk7u
BINDIR=$SRCDIR/build/macosx-x86_64/j2sdk-image
#BINDIR=/Users/tck/Library/Java/JavaVirtualMachines/jdk1.7.0.jdk/Contents/Home

mkdir -p $PROJDIR/work/$MARKER
$BINDIR/bin/java -jar \
    $PROJDIR/jtreg/lib/jtreg.jar \
    -jdk:$BINDIR \
    -r:$PROJDIR/work/$MARKER/JTreport \
    -w:$PROJDIR/work/$MARKER/JTwork \
    -v:summary \
    -a \
    -ovm \
    -ignore:quiet \
    -exclude:$SRCDIR/jdk/test/ProblemList.txt \
    -exclude:$PROJDIR/exclude/error.txt \
    -exclude:$PROJDIR/exclude/failed.txt \
    $SRCDIR/langtools/test \
    $SRCDIR/jdk/test \
    $SRCDIR/hotspot/test \
    | tee $PROJDIR/work/$MARKER/jdk7-test-macosx.log


