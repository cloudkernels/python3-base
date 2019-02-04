python3.5-base
==============

This is a repo to automate the build of python3.5 on rumprun. It uses
the [cloudkernels rumprun base build](https://github.com/cloudkernels/debian-rumprun-build) in order
to build the python3 package from [rumprun-packages](https://github.com/cloudkernels/rumprun-packages).
It compiles and bakes python3 for the `spt` and `hvt` solo5 tenders.

### How to

In order to get the python3 unikernels you can run the following:

```
docker build -t python-base .
//wait for the build to finish
docker run --rm -ti -v /build/:/build /bin/bash -c "cp /tmp/rumprun-packages/python3/python.{spt,hvt} /build"
```

This first command will build the docker image and the second will copy the python3
baked binaries to the `/build` directory of the host machine
