rcov_notifier
-------------

Get RCov report notifications via Growl

Usage
-----
1. Get the gem
		[sudo] gem install rcov_notifier

2. Add the following to the `~/.autotest` file
		require 'rcov_notifier'

Customization
-------------
1. Modify the coverage reports directory. Add the following to the `~/.autotest` file
	RCovNotifier.coverage_dir = "foo"
	RCovNotifier.threshold_percent = 95

Note on Patches/Pull Requests
-----------------------------
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2010 Chinmay Garde. See LICENSE for details.
