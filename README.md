Docker Container contents

    PhantomJS and CasperJS

Usage

    docker run -ti casperjs phantomjs --version
    docker run -ti casperjs casperjs --version

Linking tests

    With this image, you can link your test suite into the container:
        docker run -ti -v /home/user/mytestsuite:/opt/mytestsuite casperjs casperjs test /opt/mytestsuite
	
	Any arguments can be provided to casperjs as well:
	    docker run -ti -v /home/user/mytestsuite:/opt/mytestsuite casperjs casperjs test /opt/mytestsuite --verbose
	    
	Or you can provide a test runner script with your tests (this is how we use this docker container):
	    
	    Inside test:
	        #!/usr/bin/env sh

            casperjs                                                                \
                --pre=common/buildUp.js                                             \
                --post=common/tearDown.js                                           \
                --includes=common/underscore.js,common/nomadize.js,common/helpers.js,common/constants.js,common/scenario.js \
                --log-level=debug                                                   \
                --ignore-ssl=yes                                                    \
                --ignore-ssl-errors=yes                                             \
                --ssl-protocol=any                                                  \
            test $@
        
        Running the container:
            docker run -ti -v /home/user/mytestsuite:/opt/mytestsuite ./opt/mytestsuite/test /opt/mytestsuite/testsuite --verbose
