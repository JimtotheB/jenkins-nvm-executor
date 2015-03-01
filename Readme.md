## Jenkins image with NVM

Simple jenkins image with Node Version Manager support built in.

### Install and Use.

```shell
docker run -d -p 8080:8080 -v /home/user/jenkins:/var/jenkins_home paperelectron/jenkins-nvm-executor
```

Where \<port> in  `-p <port>:8080>` refers to the port exposed to the outside world.

Where \<path> in `-v <path>:/var/jenkins_home` refers to the absolute path where you would like to persist data.  This allows you to upgrade plugins and configure the jenkins server without losing data between restarts.

### Additional plugins.

This builds on the official Jenkins docker image. Additional plugins currently are.

* EnvInject v1.90

### Executing builds

Select new item, Freestyle project.

On the configuration page, select Build > Add build step > Execute shell

Start your build steps with

```shell
#!/usr/bin/env bash -l
nvm use x.x.x
npm install 
npm test / run whatever
```
