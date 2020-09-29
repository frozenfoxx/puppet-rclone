# @summary configure rclone
#
# Configure rclone remotes.
#
# @example
#   include rclone::config
class rclone::config {
  $remotes = $rclone::remotes

  # Set variables based on OS family
  case $facts['os']['family'] {
    'Debian': {
      $gid = 0
      $uid = 0
    }
    default: {
      $gid = 0
      $uid = 0
    }
  }

  # Ensure the rclone configuration exists
  file { 'rclone.conf':
    ensure  => file,
    path    => '/root/.config/rclone/rclone.conf',
    owner   => $uid,
    group   => $gid,
    mode    => '0640',
    content => template('rclone/rclone.conf.erb'),
    require => File['/root/.config/rclone']
  }
}
