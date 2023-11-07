# Docker

- Downloading a Docker image

        docker pull satijalab/seurat

- Checking Docker's disk usage:

        docker system df
        docker system df -v

- Pruning **everything**:

        docker system prune -a

- [How to clean up /var/lib/docker/vfs directory](https://stackoverflow.com/questions/44901297/how-to-clean-up-var-lib-docker-vfs-directory)

        rm - r vfs/dir/*

- Attaching a data folder

        docker run --name container-alias -it -v folder/path/from/host:path/for/the/volume/within/the/container docker-image-to-be-run
        docker run --name bioinfo -it -v /.../.../.../:/... heetlioglu/bioinfo:v2

- If `error 503: service unavailable when using apt-get update behind proxy` ([ref1](https://askubuntu.com/questions/26528/error-503-service-unavailable-when-using-apt-get-update-behind-proxy), [ref2](https://dmfrsecurity.com/2018/12/10/changing-apts-user-agent-string/)):

        # run within your container
        echo 'Acquire { http::User-Agent "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36"; };' >> /etc/apt/apt.conf


## Push

After pulling an image, running and modifying a contanier:

- Get the ID of the container of interest:

        docker ps -a

- Commit the changes, a new image is generated with this command, the `dockerhub-username/dockerhub-repo:tag` naming convention is required when pushing to `dockerhub`"

        docker commit ID-obtained-from-the-previous-command dockerhub-username/dockerhub-repo:tag

- Push

        docker push dockerhub-username/dockerhub-repo:tag