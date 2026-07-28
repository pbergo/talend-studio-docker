docker stop talend-desktop
docker rm talend-desktop
docker build -t talend-studio .

docker run -d  --name talend-desktop   -p 6080:6080   --shm-size=2g   talend-studio