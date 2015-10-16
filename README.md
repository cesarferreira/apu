# apk-utils
<!-- [![Build Status](https://travis-ci.org/cesarferreira/apk-utils.svg?branch=master)](https://travis-ci.org/cesarferreira/apk-utils) [![Gem Version](https://badge.fury.io/rb/apk-utils.svg)](http://badge.fury.io/rb/apk-utils) [![Android Arsenal](https://img.shields.io/badge/Android%20Arsenal-apk-utils-green.svg?style=flat)](https://android-arsenal.com/details/1/2361)

**Try** any **android library** on your **smartphone** **directly** from the **command line**

> A dry run is a testing process where the effects of a possible failure are intentionally mitigated. For example, an aerospace company may conduct a "dry run" test of a jet's new pilot ejection seat while the jet is parked on the ground, rather than while it is in flight.

<p align="center">
<img src="https://raw.githubusercontent.com/cesarferreira/apk-utils/master/extras/usage.gif" width="100%" />
</p> -->

Builds and runs the `~/Downloads/hello-world` project to your device
```shell
apk-utils -p ~/Downloads/hello-world --install --run
```


## Usage
```shell
apk-utils -r # runs the app on a connected device
apk-utils -k # Retrieves package name (eg. com.example.app)
apk-utils -u # Uninstalls the apk from your device
apk-utils -i # Installs the apk on your device
apk-utils -a # Checks if the ANDROID_HOME variable is defined
apk-utils -l # Get the launcher activity path
apk-utils -p # Custom path to android project
apk-utils -r # Run the build on the device

```
## Usage

```shell
$ apk-utils -h                                                                                                                      
Usage: apk-utils PATH [OPTIONS]

Options
    -k, --package                    Retrieves package name (eg. com.example.app)
    -u, --uninstall                  Uninstalls the apk from your device
    -i, --install                    Installs the apk on your device
    -a, --android-home               Checks if the ANDROID_HOME variable is defined
    -l, --launcher                   Get the launcher activity path
    -p, --path PATH                  Custom path to android project
    -r, --run FLAVOUR                Run the build on the device
    -c, --clear                      Clear app data
    -h, --help                       Displays help
    -v, --version                    Displays version
```

## Installation

    $ gem install apk-utils

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cesarferreira/apk-utils.
