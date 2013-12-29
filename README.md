# docker-geminabox

A docker container with a simple geminabox server listening on port 9292 (behind WEBRick)

## Usage

To run the container, do the following:

```
docker run -d -p 9292:9292 lheinlen/geminabox
```

### Additional configuration

The gem data is stored in a volume at /opt/geminabox/data.  You may wish to map it to a location on the host to make persisting the data between container upgrades simple.

```
docker run -d -p 9292:9292 -v /var/lib/geminabox-data:/opt/geminabox/data:rw lheinlen/geminabox
```

By default, support for legacy indexes is disabled.  This can be enabled by setting the environment variable BUILD_LEGACY to true.

```
docker run -d -p 9292:9292 -e RUBYGEMS_PROXY=true lheinlen/geminabox
```

You can also enable geminabox's ability to proxy rubygems.org with the RUBYGEMS_PROXY environment variable.