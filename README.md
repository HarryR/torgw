Multiple rotating Tor proxy
===========================

__Goal__ : Use lots of different Tor proxies for multi-threaded requests and concurrency...

__How it works__ : runit manages many instances of Tor. HAproxy is used to distribute requests in a round-robin fashion.


```
                        <-> Tor proxy 1
Client <---->  HAproxy  <-> Tor proxy 2
                        <-> Tor proxy n
```


Usage : 
-------

A `Makefile` is provided to manage the Docker container's lifecycle. Be wary, `make clean` will not be friendly to other Docker containers running on the same machine, it will aggressively purges unused containers and images.

    make
    make run
    make stop


Credits :
---------

Other implementations :

* https://github.com/mfasanya/docker-tor-rotator (Ubuntu base)
* https://github.com/vdaubry/tor-privoxy (uses Ruby, not Docker-ized)
* https://github.com/srounet/docker-tor  (Ubuntu base, uses Ruby)
* https://github.com/Negashev/docker-haproxy-tor (Alpine base, uses Ruby)

Early inspiration : 

* http://blog.databigbang.com/running-your-own-anonymous-rotating-proxies/
* https://github.com/mattes/rotating-proxy

