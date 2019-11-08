#!/bin/bash
apt-get update
apt-get install -y nginx

cat > kubernetes.default.svc.cluster.local <<EOF
server {
    listen      80;
    server_name kubernetes.default.svc.cluster.local;

    location /healthz {
        proxy_pass                      https://127.0.0.1:6443/healthz;
        proxy_ssl_trusted_certificate   /var/lib/kubernetes/ca.pem;
    }
}
EOF

mv kubernetes.default.svc.cluster.local \
    /etc/nginx/sites-available/kubernetes.default.svc.cluster.local

ln -s /etc/nginx/sites-available/kubernetes.default.svc.cluster.local /etc/nginx/sites-enabled/

systemctl restart nginx

systemctl enable nginx