# meta-grinn-genioboard

Yocto meta layer for GRINN Genioboard platform.

## Build Genioboard demo image

```
~$ mkdir genioboard-yocto; cd genioboard-yocto
~$ export PROJ_ROOT=`pwd`
~$ repo init -u https://github.com/grinn-pub/grinn-manifest.git -b main -m genioboard.xml
~$ repo sync
~$ export TEMPLATECONF=$PROJ_ROOT/src/meta-grinn-genioboard/conf/
~$ source src/poky/oe-init-build-env
~$ bitbake rity-demo-image
```

If all succeeded, your image is located in:

```
$BUILD_DIR/tmp/deploy/images/<machine>
```

