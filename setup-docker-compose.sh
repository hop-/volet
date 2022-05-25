#/bin/bash

echo Clone repos
echo TODO

target_dir=$(readlink -f ..)

echo Setup docker-compose.yml
src_yml=$(readlink -f ./docker-compose.yml)
target_yml=${target_dir}/docker-compose.yml
test -e $target_yml && echo $target_yml exists || ln -s $src_yml $target_yml 

src_env='./.env.dist'
target_env=${target_dir}/.env
test -e $target_env && echo $target_env exists || cp $src_env $target_env

echo Setup repos
repo_list=$(readlink -f ./repo.list)
pushd ..
for r in $(cat $repo_list); do
  git clone $r
done
popd
