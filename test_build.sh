#!/bin/sh

# First do a full build
gradle build >> /dev/null

echo "Doing build with unchanged resources (output in build1.txt)"
gradle --info test > build1.txt

cat build1.txt | grep "up-to-date"

# Now modify one of the resource files a bit
echo "added text" >> src/main/resources/resource_test

echo "\nRebuilding after modifying one resource file (output in build2.txt)"
gradle --info test > build2.txt

cat build2.txt | grep "up-to-date"


# reset to what it was
echo "hello world" > src/main/resources/resource_test
