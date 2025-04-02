# @summary install rclone
#
# Download and install rclone
#
# @example
#   include rclone::install
class rclone::install {
  # Set variables based on OS family
  case $facts['os']['family'] {
    'Darwin': {
      $rclone_url = 'https://downloads.rclone.org/rclone-current-osx-amd64.zip'
    }
    'Debian': {
      $rclone_url = 'https://downloads.rclone.org/rclone-current-linux-amd64.zip'
    }
    default: {
      $rclone_url = 'https://downloads.rclone.org/rclone-current-linux-amd64.zip'
    }
  }

  # Pull and extract the archive for rclone
  archive { 'rclone.zip':
    ensure          => present,
    path            => '/tmp/rclone.zip',
    source          => $rclone_url,
    extract         => true,
    extract_path    => '/tmp',
    extract_command => 'unzip %s -d /tmp && mv /tmp/rclone*/rclone /usr/local/bin/ && rm -rf /tmp/rclone*',
    cleanup         => true,
    creates         => '/usr/local/bin/rclone'
  }
}
