FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:410.0.0-slim

ARG entrypoint
RUN apt-get install kubectl watch vim jq fzf -y && \
    echo "deb http://deb.debian.org/debian testing non-free contrib main" >>/etc/apt/sources.list && apt update && apt install kubectx
RUN (   set -x; cd "$(mktemp -d)" &&   OS="$(uname | tr '[:upper:]' '[:lower:]')" &&   ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&   KREW="krew-${OS}_${ARCH}" &&   curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&   tar zxvf "${KREW}.tar.gz" &&   ./"${KREW}" install krew; ) && \
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH" && kubectl krew install mtail && \
    ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime


COPY scripts/${entrypoint}.sh /usr/local/bin/entrypoint.sh
COPY scripts/.bashrc /root/.bashrc
COPY scripts/sd-gs scripts/sd-hk scripts/sn /usr/bin/
RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
