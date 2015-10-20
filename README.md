# apu
 [![Build Status](https://travis-ci.org/cesarferreira/apu.svg?branch=master)](https://travis-ci.org/cesarferreira/apu) [![Gem Version](https://badge.fury.io/rb/apu.svg)](http://badge.fury.io/rb/apu)

**A**ndroid a**p**plication **u**tils

> A set of useful tools for android developers

<p align="center">
<img src="https://raw.githubusercontent.com/cesarferreira/apu/master/extras/apu.gif" width="100%" />
</p>


## Quick sample
Let's: `cd ~/hello-world`
```shell
$ apu --install     # build and install on your device
$ apu --open        # runs on your device
$ apu --uninstall   # uninstall the app


# They can all be combined:
$ apu -p ~/hello-world -i -o # builds, installs and opens on your device  
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
    -o, --open                       Open the build on the device
    -r, --release                    Create release version and opens the folder
    -c, --clear                      Clear app data
    -h, --help                       Displays help
    -v, --version                    Displays version
```

## Installation

    $ gem install apu

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cesarferreira/apu.
