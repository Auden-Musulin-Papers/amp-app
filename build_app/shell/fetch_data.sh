# bin/bash

rm dev04_1.zip
rm -rf ./data
wget https://github.com/Auden-Musulin-Papers/amp-data/archive/refs/heads/dev04_1.zip
unzip dev04_1
mv amp-data-dev04_1/data ./data
rm -rf amp-data-dev04_1
rm dev04_1.zip

rm -rf ./data/tmp

# rm dev.zip
# rm -rf ./data
# wget https://github.com/Auden-Musulin-Papers/amp-data/archive/refs/heads/dev.zip
# unzip dev
# mv amp-data-dev/data ./data
# rm -rf amp-data-dev
# rm dev.zip

# rm -rf ./data/tmp
