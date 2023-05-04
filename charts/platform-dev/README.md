# Platform / Umbrella chart for dev deployments
How to set up:
- Run `helm dependency build`
- Create a values file with the overrides you need (e.g. `my-values.yaml`)
- Run `helm install release-name . -f my-values.yaml`