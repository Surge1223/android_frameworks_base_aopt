TEST_DIR=tests/plurals
TEST_OUT_DIR=out/plurals_test

rm -rf $TEST_OUT_DIR
mkdir -p $TEST_OUT_DIR
mkdir -p $TEST_OUT_DIR/java

aopt package -f -v -x -m -z --app-overlay -J ../../core/java/ -M  ../../core/res/AndroidManifest.xml -S  ../../core/res/res/ -I ./hi.apk -P defs.xml

aopt package -v -x -m -z --app-overlay   -J $TEST_OUT_DIR/java -M $TEST_DIR/AndroidManifest.xml \
             -I   ../../../../out/target/common/obj/APPS/framework-res_intermediates/package-export.apk \
             -P $TEST_OUT_DIR/public_resources.xml \
             -S $TEST_DIR/res \
	     -F ./hi.apk

echo
echo "==================== FILES CREATED ==================== "
find $TEST_OUT_DIR -type f