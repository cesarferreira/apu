# apu
 [![Build Status](https://travis-ci.org/cesarferreira/apu.svg?branch=master)](https://travis-ci.org/cesarferreira/apu) [![Gem Version](https://badge.fury.io/rb/apu.svg)](http://badge.fury.io/rb/apu)
 
**A**ndroid a**p**plication **u**tils

> A set of useful tools for android developers

<p align="center">
<img src="https://raw.githubusercontent.com/cesarferreira/apu/master/extras/apu.gif" width="100%" />
</p>


## Quick sample
Regarding the android project on: `~/Downloads/hello-world`
```shell
apu --path ~/Downloads/hello-world --install     # build and install on your device
apu --path ~/Downloads/hello-world --run         # build, install and run on your device
apu --path ~/Downloads/hello-world --uninstall   # uninstall the app
```

## Usage

```shell
$ apu -h                                                                                                                      
Usage: apu PATH [OPTIONS]

Options
    -k, --package                    Retrieves package name (eg. com.example.app)
    -u, --uninstall                  Uninstalls the apk from your device
    -i, --install                    Installs the apk on your device
    -a, --android-home               Checks if the ANDROID_HOME variable is defined
    -l, --launcher                   Get the launcher activity path
    -p, --path PATH                  Custom path to android project
    -r, --run                        Run the build on the device
    -c, --clear                      Clear app data
```

## Installation

    $ gem install apu

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cesarferreira/apu.
