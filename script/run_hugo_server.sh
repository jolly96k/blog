#! /usr/bin/bash
SCRIPT_DIRNAME=$(cd $(dirname ${0}); pwd)
PARENT_DIRNAME=$(cd $(dirname ${0}); cd ../; pwd)

cd ${PARENT_DIRNAME}

export HUGO_PROJECT_NAME="hugo-blog"
export HOST_PORT="61313"

docker run --rm -it \
           -p ${HOST_PORT}:1313 \
           -v ${PARENT_DIRNAME}/volume/hugo/data:/home/penguin/hugo_ws \
           -e HUGO_PROJECT_NAME \
           hugo \
           bash -c '
               cd ~/hugo_ws/${HUGO_PROJECT_NAME}
               hugo server -vD --bind "0.0.0.0"
           '