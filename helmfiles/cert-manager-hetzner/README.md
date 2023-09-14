# Cert-Manager Hetzner Edition
This helmfile project deploys a fully functional cert-manager to your cluster that can create valid Let's Encrypt certificates without the cluster being accessible from the internet using the DNS01 challenge.
# Prerequisites
- DNS zone on Hetzner DNS
- API key for Hetzner DNS (it is not the same as Hetzner Cloud API key!)

# How-To install
- Run `helmfile sync` (`helmfile apply` does not work for first execution, after that it should be used for updates)