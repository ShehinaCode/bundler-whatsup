bundle-whatsup
==============
[![Build Status](https://travis-ci.org/ShehinaCode/bundler-whatsup.svg?branch=master)](https://travis-ci.org/ShehinaCode/bundler-whatsup)
# Goal of the project
The idea is to have bundle whatsup command (currently, bundler will translate that to separate bundle-whatsup executable, if it is installed as a separate gem), which can for all, or for specified dependencies from your bundle, report "what have been changed in versions you've missed".

# Installation
* First, add gem `bundler-whatsup` to your `Gemfile`:
```
plugin 'bundler-whatsup', :github => 'ShehinaCode/bundler-whatsup'
```

* Then install bundle from the root of your project (where `Gemfile` is located):
```
bundle install
```

* Fine! Now you can run `bundler-whatsup` as follows (from the root of your project where `Gemfile` is placed:)
```
bundle whatsup
```
