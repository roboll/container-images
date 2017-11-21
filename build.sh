#! /bin/bash

namespace="roboll"
revision="$(git rev-parse --short HEAD)"

for image in *; do
    [[ -d "${image}" ]] && {
        echo "building ${image}"
        docker build -t "${namespace}/${image}:${revision}" "./${image}"

        echo "pushing ${namespace}/${image}:${revision}"
        docker push "${namespace}/${image}:${revision}"

        echo "tagging ${namespace}/${image}:${revision} as latest"
        docker tag "${namespace}/${image}:${revision}" "${namespace}/${image}:latest"
        docker push "${namespace}/${image}:latest"
    }
done
