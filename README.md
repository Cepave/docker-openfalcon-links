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

+ New falcon-links package

    Replace file **falcon-links.tar.gz** in the volume */package*.
  
For example, **config.py** in /tmp/config and **falcon-links.tar.gz** in /tmp/pack,

```
$sudo docker run -dti --name links -v /tmp/pack:/package -v /tmp/config/config.py:/config/config.py -p 5090:5090 openfalcon-links
```
