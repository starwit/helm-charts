# Infra on starwit-infra-01
This helmfile deployment is used to maintain the state on starwit-infra-01, which is supposed to host the following components:
- ChartMuseum
- Docker Registry
- Keycloak
- ...

## Network setup
The K3s cluster on starwit-infra-01 is only reachable through our Tailnet, only ICMP and SSH are reachable over the internet.

## TLS setup
As we need valid TLS certificates (i.e. through cert-manager and Let's Encrypt), we utilize the following setup:
- Cluster runs cert-manager with cert-manager-webhook-hetzner
- `*.internal.starwit-infra.de` points at the Tailscale IP of `starwit-infra-01`
- Certificate challenges from Let's Encrypt are solved using the DNS challenge via the aforementioned cert-manager webhook

## Chartmuseum
Hosted on `helm.internal.starwit-infra.de`. \