yumrepo {
  'spacewalk':
    baseurl  => 'http://yum.spacewalkproject.org/2.0/RHEL/6/$basearch/',
    enabled  => 1,
    gpgcheck => 0,
    gpgkey   => 'http://yum.spacewalkproject.org/RPM-GPG-KEY-spacewalk-2012';
  'epel6':
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    enabled    => 1,
    gpgcheck   => 0,
    gpgkey     => 'https://fedoraproject.org/static/A4D647E9.txt';
}

Package {
  require => [ Yumrepo['spacewalk'], Yumrepo['epel6'] ],
}

package {
  'rubygems':
    ensure => present;
  'ruby-devel':
    ensure => present;
  'rhnpush':
    ensure  => present;
  'fpm':
    ensure   => present,
    require  => [ Package['ruby-devel'], Package['rubygems'] ],
    provider => 'gem';
}
