# apk-utils
<!-- [![Build Status](https://travis-ci.org/cesarferreira/apk-utils.svg?branch=master)](https://travis-ci.org/cesarferreira/apk-utils) [![Gem Version](https://badge.fury.io/rb/apk-utils.svg)](http://badge.fury.io/rb/apk-utils) [![Android Arsenal](https://img.shields.io/badge/Android%20Arsenal-apk-utils-green.svg?style=flat)](https://android-arsenal.com/details/1/2361)

**Try** any **android library** on your **smartphone** **directly** from the **command line**

> A dry run is a testing process where the effects of a possible failure are intentionally mitigated. For example, an aerospace company may conduct a "dry run" test of a jet's new pilot ejection seat while the jet is parked on the ground, rather than while it is in flight.

<p align="center">
<img src="https://raw.githubusercontent.com/cesarferreira/apk-utils/master/extras/usage.gif" width="100%" />
</p> -->


## Usage
```shell
apk-tools -r
```

Wait a few seconds... and `voilà`! The app is opened on your phone :smiley:

## Installation

    $ gem install apk-utils


**Requirements `(if you haven't already)`:**

> $ANDROID_HOME defined on the environment variables [(how-to)](http://stackoverflow.com/questions/5526470/trying-to-add-adb-to-path-variable-osx)


> Android SDK in your $PATH [(how-to)](http://stackoverflow.com/questions/19986214/setting-android-home-enviromental-variable-on-mac-os-x)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cesarferreira/apk-utils.

To install gem as local you can use this:
```shell
# In the project folder:
rake install
# Next in the any gemset or place:
gem install --local path_to_apk-utils/pkg/apk-utils-<builded_version>.gem
```
