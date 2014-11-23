# dokuwiki

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with dokuwiki](#setup)
    * [What dokuwiki affects](#what-dokuwiki-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dokuwiki](#beginning-with-dokuwiki)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs and configures dokuwiki (https://www.dokuwiki.org/dokuwiki).

## Module Description

The dokuwiki module sets up dokuwiki including package installation, configuration
of both the application and apache.

Under gentoo-based systems it makes use of the `webapp_config` tool.

## Setup

### What dokuwiki affects

* dokiwiki package.
* dokuwiki configuration file.
* apache vhost configuration.

### Setup Requirements

This module assumes apache is already configured and that it can just drop a vhost
definition file into an apache configuration directory.

### Beginning with dokuwiki

```
include '::dokuwiki'
```

## Usage

All options and configuration can be done through interacting with the parameters
on the main dokuwiki class. These are documented below

### dokuwiki class

```
class {
    '::dokuwiki':
        
}
```

## Reference

### Classes

* dokuwiki: Main class for installation,
* dokuwiki::config: Main class for dokuwiki configuration/management.
* dokuwiki::install: Handles package installation.
* dokuwiki::params: Different configuration data for different systems.

### Parameters

## Limitations

This module has been built on and tested against puppet 3.7 and higher.

This module has been tested on:
* Sabayon 2014.12

### Module dependencies

To be able to install multiple instances of dokuwiki on a single host
this module makes use of the `webapp_config` tool on Gentoo-based systems.
It makes use of the `optiz0r-webapp_config` module to manage this, and
you will need to arrange to have a copy of this available on your puppet
master using `r10k`, `librarian-puppet`.

Note, this module is not currently available on the module forge, and can
instead be retrieved from https://github.com/optiz0r/puppet-webapp-config.

## Development

This module is opensource and contributions are welcome. Please feel free
to submit a pull request with any enhancements.

## Authors

* Ben Roberts <me@benroberts.net>

