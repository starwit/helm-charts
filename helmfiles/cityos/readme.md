# Cityos installations

This helmfile deploys a cityos environment environments. For installation details, see [here](../readme.md).

# Environment Variables

| Key        | Required | Default   | Description                                                               |
|------------|:--------:|-----------|---------------------------------------------------------------------------|
| `HOSTNAME` |    ✅     | localhost | Set this to your machine name so that the applications can work correctly |

To simplify the handling of environment variables, you can create a new .env file with the
command `cp .env.template .env` and executing the `applyHelmfile.sh` script.

Only this script will apply the variables set in `.env`!

# Test Installation

* go to http://localhost/cityos-auth and login with admin/yourpassword
* create new user in the citydashboard realm
* go to http://localhost/cityos/ and login with created user