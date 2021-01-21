FROM gcr.io/google.com/cloudsdktool/cloud-sdk
 
ARG USER_NAME=jenkins
ARG GROUP_NAME=jenkins
 
ARG UID
ARG GID
ARG HOME_DIR
 
RUN groupadd --force --gid ${GID} ${GROUP_NAME} && \
    useradd --no-create-home --no-user-group --uid=${UID} --gid ${GID} --home-dir ${HOME_DIR} ${USER_NAME}
 
RUN apt-get update
 
USER ${UID}:${GID}
