# vvvv.kinect2x86
VVVV nodes required to use kinect2 on vvvv.32bits

# How to use it
In order to be able to access the kinect2 textures from vvvv.32bits it is necesary to stream them through shared memory.

1. Run the server on vvvv.64 bits
1.1. Open **_root_server (x64).v4p**
1.2. Keep it open

2. Run the client on vvvv.32 bits
2.1. In order to be able to run two versions of vvvv, it is necesary to use the parameter **/allowmultiple**, like this:
    "<vvvv.location>\vvvv.exe /allowmultiple"
Either running it:
  a. using command line 
  b. creating an shortcut 

![Image of how to setup the shortcut](https://github.com/joansolroo/vvvv.kinect2x86/blob/master/Documentation/vvvv_allowmultiple.png)

2.2. Use the client
2.2. Open **_example_client (x86).v4p**
