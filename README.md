# Vocstack

Vocdoni stack deployment on docker and k8s

# Local compose

To deploy a local development environment, first you need to add the following to `/etc/hosts`:

```
127.0.0.1 vocstack.local
```

Once ready, you can run `run_local_vocstack.sh` to checkout, build and deploy all components from master branch.

If you want to use a diferent branch for a specific component, you can do like following (before running any script):

```
git submodule set-branch --branch release-0.5 -- external/go-dvote
```

## k8s

To-Do
