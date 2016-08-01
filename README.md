# docker-openfalcon-links

## Build

Enter the following command in the repo directory.

```
$ docker build -t openfalcon-links -f docker/ubuntu/Dockerfile .
```

## Run

### Basic Run

Use default configuration, and falcon-links package.

```
$ docker run -d --name links -p 5090:5090 openfalcon-links
```

### Advanced Run

+ Self-defined configuration

    Replace file **config.py** and **gunicorn.conf** in the volume */config*.  
    For more details about **config.py** and **gunicorn.conf**, see [Links](http://book.open-falcon.com/zh/install/links.html).

For example, **config.py** and **gunicorn.conf** in /tmp/config,

```
$ docker run -d --name links -v /tmp/config/config.py:/config/config.py -v /tmp/config/gunicorn.conf:/config/gunicorn.conf -p 5090:5090 openfalcon-links
```
