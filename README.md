# libuvc-theta-sample

## Scope

This is a forof the orginal from [ricoapi](https://github.com/ricohapi/libuvc-theta-sample) it is only modified to be able to build with cmake since this is for some projectes and easier to be clear on depencies and re-use.

## How to build

### Prerequisites

#### libuvc-theta

Just follow the build instructions on [libuvc-theta](https://github.com/ricohapi/libuvc-theta). If the make install is performed in the default path this should build right away. If not then the include path and library location of libuvc need to be adjusted. This is here not ideal yet - it would be cleaner to provide here a cmake module to find libuvc-theta. It is on the todo list...

#### Gstreamer

On debian it is probably for the basics:

``` bash
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
```

In addtion depending on the platform the h264 decoder could be in the *ugly plugins* or *libav*

To verify is on the todo - maybe best to check with building in a docker container

### Build instructions

``` bash
git clone https://github.com/kruegerrobotics/libuvc-theta-sample.git
cd libuvc-theta-sample
mkdir build
cd build
cmake ../
make
```

## Build products - executables

### gst/gst_viewer

Decode and display sample using gstreamer. You may need gstreamer1.0 develpment packages to build and run.

### gst/gst_loopback

Feed decoded video to the v4l2loopback device so that v4l2-based application can use THETA video without modification.

CAUTION: gst_loopback may not run on all platforms, as decoder to v4l2loopback pipeline configuration is platform dependent,
