img="nvcr.io/nvidia/pytorch:19.06-py3" 


docker run --gpus all  --privileged=true   --workdir /git --name "biobert"  -e DISPLAY --ipc=host -d --rm  -p 6601:4452  \
-v /raid/git/biobert-pytorch:/git/biobert-pytorch \
 -v /raid/git/datasets:/git/datasets \
 $img sleep infinity

docker exec -it biobert /bin/bash

#docker images  |grep "pytorch"  |grep "21."

#docker stop  biobert