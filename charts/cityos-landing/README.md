# Landing Helm chart

## Quickstart

1. Create image pull secret in Kubernetes with name `regcred` \
   An example can be
   found [here](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/).
2. Edit values.yaml file. Frontend specific values can be found below
3. Install the helm chart

## Values

| Name                      | Description                                  | Defaults                                          |
|---------------------------|----------------------------------------------|---------------------------------------------------|
| `landing.loginUrl`        | Defines the redirect URL of the login Button | `http://localhost/cityos-app/`                    |
