# REANA + Slurm tests

This repository contain examples of workflows that can be run both in Kubernetes or Slurm backends.
The main purpose is to compare the integration of REANA and Slurm, in comparison to Kubernetes
(which is battle-tested, as it is the default computational backend).

## 🔧 Operations

### Local run
To run the workflows locally using Yadage, do:
```sh
make yadage-run
```

### Remote run
To run the workflows remotely using REANA, do:
```sh
# For a Kubernetes run:
export REANA_SERVER_URL=...
export REANA_ACCESS_TOKEN=...
make reana-run-kuber

# For a Slurm run:
export REANA_SERVER_URL=...
export REANA_ACCESS_TOKEN=...
make reana-run-slurm
```


## 🐛 Current bugs 

- [REANA 0.7.X Slurm - multistep-stage workflows][reana-slurm-multistep-bug]


[reana-slurm-multistep-bug]: https://github.com/reanahub/reana-job-controller/issues/311
