class test {
	file {'testfile':
		path    => '/tmp/testfile',
			ensure  => present,
			mode    => 0640,
			source => "puppet:///modules/test/testfile",
	}
}
