#!/bin/zsh

cur_path=$(
   cd "$(dirname "$0")"
   pwd
)
echo "current script path is $cur_path/build.sh"

for cid in $(docker ps -a | grep -n 'nginx-demo*' | awk '{print $1}'); do
  echo "stopping ${cid#*:}  ......"
  docker stop ${cid#*:} && docker rm ${cid#*:}
done

for img in $(docker images -f "dangling=true" -q); do
  docker rmi $img
done

sub_version=17
version="1.$sub_version"

docker build -t "nginx-demo:$version"  .
echo "please execute this command:"
echo "docker stop nginx-demo && docker rm -f nginx-demo && docker run -d -p 9999:9999 --name nginx-demo nginx-demo:$version "
echo ""

# 自动修改版本号
((new_sub_version=$sub_version+1))
echo "next version: 1.${new_sub_version}"
sed -i "" "s/sub_version=${sub_version}/sub_version=${new_sub_version}/g" $cur_path/build.sh


