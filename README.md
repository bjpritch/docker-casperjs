Docker Container contents

    PhantomJS and CasperJS

Usage

    docker run -ti casperjs phantomjs --version
    docker run -ti casperjs casperjs --version

Linking tests

    With this image, you can link your test suite into the container:
        docker run -ti -v /home/user/mytestsuite:/opt/mytestsuite casperjs casperjs test /opt/mytestsuite
	Any arguments can be provided
