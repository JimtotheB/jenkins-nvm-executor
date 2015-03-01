FROM jenkins
COPY plugins.txt /plugins.txt
RUN plugins.sh /plugins.txt
USER root
RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  libssl-dev
ENV jenkins_ref_dir /usr/share/jenkins/ref
ADD https://raw.githubusercontent.com/creationix/nvm/v0.23.3/nvm.sh /usr/local/nvm/
RUN chown root:staff /usr/local/nvm/nvm.sh && chmod a+r /usr/local/nvm/nvm.sh
RUN echo '. /usr/local/nvm/nvm.sh' >> $jenkins_ref_dir/.profile
RUN NVM_DIR=/usr/local/nvm && . /usr/local/nvm/nvm.sh && \
  nvm install v0.10 && \
  nvm install v0.11 && \
  nvm install v0.12
RUN chown jenkins $jenkins_ref_dir/.profile
USER jenkins

