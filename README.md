# rclone

[Rclone](https://rclone.org/) is a powerful cloud synchronization tool. This module installs and configures it.

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [Beginning with rclone](#beginning-with-rclone)
3. [Usage](#usage)
4. [Development](#development)

## Description

This module makes an installation of the package Rclone. It's useful for dealing with Cloud providers in the same way you would use rsync to deal with file system providers.

## Setup

### Beginning with rclone

Include this module and it will handle all steps for installation and configuration for the `root` or equivalent user on your system.

```
include rclone
```

## Usage

Add a section to your hieradata configuration to set up various remotes.

**hiera file**:

```
rclone::remotes:
  'my-remote':
    type: 'http'
    url: 'https://[URL to clone from]'
```

Then include this module:

**puppet code**:

```
include rclone
```

## Limitations

This module has only been tested on Debian-based systems though rclone is multiplatform. It also does not have a way built-in to work with environment variables such as when handling Docker container-based launches. It will likely work on macOS though would need additional handling to make it more native.

## Development

* Fork it
* Create a topic branch
* Improve/fix
* Push new topic branch
* Submit a PR
