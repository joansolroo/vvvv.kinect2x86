# vvvv.kinect2x86
VVVV nodes required to use kinect2 on vvvv.32bits

# How to use it
In order to be able to access the kinect2 textures from vvvv.32bits it is necesary to stream them through shared memory.

1. Run the server on vvvv.64 bits<br/>
Open **_root_server (x64).v4p**, and keep it open

2. Run the client on vvvv.32 bits<br/>
2.1. In order to be able to run two versions of vvvv, it is necesary to use the parameter **/allowmultiple**, like this:
    "<vvvv.version>\vvvv.exe /allowmultiple"
This can be done either:

  a. using command prompt 
  
  b. creating a shortcut (you can also change the icon for the alternative one in order to differenciate 32 and 64 versions).

![Image of how to setup the shortcut](https://github.com/joansolroo/vvvv.kinect2x86/blob/master/Documentation/vvvv_allowmultiple.png)
<br/>
2.2. Use the kinect clientclient
Open **_example_client (x86).v4p**
