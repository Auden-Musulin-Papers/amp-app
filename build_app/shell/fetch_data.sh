# bin/bash

rm main.zip
rm -rf ./data
wget https://github.com/Auden-Musulin-Papers/amp-data/archive/refs/heads/main.zip
unzip main
mv amp-data-main/data ./data
rm -rf amp-data-main
rm main.zip

rm -rf ./data/tmp

# rm dev.zip
# rm -rf ./data
# wget https://github.com/Auden-Musulin-Papers/amp-data/archive/refs/heads/dev.zip
# unzip dev
# mv amp-data-dev/data ./data
# rm -rf amp-data-dev
# rm dev.zip

# rm -rf ./data/tmp