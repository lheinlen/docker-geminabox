# docker-geminabox

A docker container with a simple Gem in a Box server listening on port 9292 (behind WEBRick)

## Usage

To run the container, execute the following command:

```
docker run -d -p 9292:9292 lheinlen/geminabox
```

### Additional configuration

The gem data is stored in a volume at /opt/geminabox/data.  You may wish to map it to a location on the host to simplify persisting the data between container upgrades.

```
docker run -d -p 9292:9292 -v /var/lib/geminabox-data:/opt/geminabox/data:rw lheinlen/geminabox
```

By default, support for legacy indexes is disabled.  This can be enabled by setting the environment variable BUILD_LEGACY to true.

```
docker run -d -p 9292:9292 -e BUILD_LEGACY=true lheinlen/geminabox
```

You can also enable Gem in a Box's ability to proxy rubygems.org with the RUBYGEMS_PROXY environment variable.

```
docker run -d -p 9292:9292 -e RUBYGEMS_PROXY=true lheinlen/geminabox
```

## Building

In general, the simplest way to acquire the image is to pull it from the docker index:

```
docker pull lheinlen/docker-geminabox
```

If you wish to build the image yourself, you can execute the following command:

```
docker build github.com/lheinlen/docker-geminabox
```

