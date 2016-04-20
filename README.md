# docker-openfalcon-links

## Build

Enter the following command in the repo directory.

```
$sudo docker build --force-rm=true -t openfalcon-links .
```

## Run

### Basic Run

Use default configuration, and falcon-links package.

```
$sudo docker run -dti --name links -p 5090:5090 openfalcon-links
```

### Advanced Run

+ Self-defined configuration

    Replace file **config.py** in the volume */config*.  
    For more detail about **config.py**, see [Links](http://book.open-falcon.com/zh/install/links.html).

For example, **config.py** in /tmp/config,

```
$sudo docker run -dti --name links -v /tmp/config/config.py:/config/config.py -p 5090:5090 openfalcon-links
```
