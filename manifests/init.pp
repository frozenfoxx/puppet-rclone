# @summary Installs rclone
#
# rclone is a cloud synchronization tool
#
# @example
#   include rclone
class rclone (
  $remotes = $rclone::params::remotes
) inherits rclone::params {
  contain rclone::dirs
  contain rclone::install
  contain rclone::config

  Class['rclone::dirs']
  -> Class['rclone::install']
  -> Class['rclone::config']
}
