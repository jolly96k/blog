#! /usr/bin/bash
SCRIPT_DIRNAME=$(cd $(dirname ${0}); pwd)
PARENT_DIRNAME=$(cd $(dirname ${0}); cd ../; pwd)

cd ${PARENT_DIRNAME}
docker run --rm -it \
           -v ${PARENT_DIRNAME}/volume/hugo/data:/home/penguin/hugo_ws \
           hugo \
           bash