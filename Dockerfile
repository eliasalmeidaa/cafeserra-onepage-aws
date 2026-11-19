# IaaS - imagem da one-page Cooperativa CaféSerra (Case 2)
FROM nginx:1.27-alpine
ARG VERSION=local
LABEL org.opencontainers.image.title="cafeserra-onepage" \
      org.opencontainers.image.description="One-page Cooperativa CaféSerra - LAB11 Projeto Cloud" \
      org.opencontainers.image.source="https://github.com/eliasalmeidaa/cafeserra-onepage-aws"
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/index.html
RUN echo "$VERSION" > /usr/share/nginx/html/version.txt
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://localhost/ >/dev/null || exit 1
