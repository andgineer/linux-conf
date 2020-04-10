docker build . --tag=ubuntu
docker run -it --name=ubuntu --privileged --network=host -v "C:\Users\Andrei_Sorokin2\projects":/projects ubuntu
# service docker start