# Frontend Helm chart

## Quickstart

1. Create image pull secret in Kubernetes with name `regcred` \
   An example can be
   found [here](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/).
2. Edit values.yaml file. Frontend specific values can be found below
3. Install the helm chart

## Values

| Name                      | Description                            | Defaults                                          |
|---------------------------|----------------------------------------|---------------------------------------------------|
| `frontend.api.baseurl`    | Defines the base-url of the API server | `http://localhost:8081/citydashboard/`            |
| `frontend.auth.authority` | Defines the OIDC base url              | `http://localhost:8080/auth/realms/citydashboard` |
| `frontend.auth.clientId`  | Defines the client ID for oAuth2       | `citydashboard`                                   |
