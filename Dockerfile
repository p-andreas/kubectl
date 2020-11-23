FROM bash:5
RUN apk --no-cache add curl dumb-init openssl gettext \        
    && wget https://storage.googleapis.com/kubernetes-release/release/$(wget -qO- https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
    && chmod a+x /usr/local/bin/kubectl \
    && apk --no-cache del curl openssl
RUN which dumb-init
ENTRYPOINT ["dumb-init","--","/usr/local/bin/docker-entrypoint.sh"]
CMD ["bash"]
  
