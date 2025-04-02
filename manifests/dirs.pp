# @summary Directories for rclone
#
# Create all directories for rclone
#
# @example
#   include rclone::dirs
class rclone::dirs {
  $rclone_dirs = $facts['os']['family'] ? {
    'Darwin' => [
      '/var/root/.config',
      '/var/root/.config/rclone',
    ],
    default => [
      '/root/.config',
      '/root/.config/rclone'
    ],
  }

  # Set variables based on OS family
  case $facts['os']['family'] {
    'Darwin': {
      $gid = 0
      $uid = 0
    }
    'Debian': {
      $gid = 0
      $uid = 0
    }
    default: {
      $gid = 0
      $uid = 0
    }
  }

  # Ensure the config directory tree exists
  file { $rclone_dirs:
    ensure => directory,
    owner  => $uid,
    group  => $gid,
    mode   => '0755'
  }
}
