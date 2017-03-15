#Push to prod info
Eval `aws ecr get-login --region eu-west-1`

#if you want to pull down the latest docker image 
Docker pull 361709907648.dkr.ecr.eu-west-1.amazonaws.com/sakurait_web:latest

#pull down the repo and build the docker image
git clone https://github.com/sakurait/sakiweb.git
docker build -t sakurait_web:latest .

#tag the image to suite ECR naming
docker tag sakurait_web:latest 361709907648.dkr.ecr.eu-west-1.amazonaws.com/sakurait_web:latest

#Push to AWS repoi
docker push 361709907648.dkr.ecr.eu-west-1.amazonaws.com/sakurait_web:latest

#Next log into AWS and stop all the tasks (will do a minor outage), they will relaunch automatically

https://eu-west-1.console.aws.amazon.com/ecs/home?region=eu-west-1#/clusters/sakurait/tasks


