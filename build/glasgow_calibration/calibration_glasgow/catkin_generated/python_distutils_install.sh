#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/kentuen/ros_ws/src/glasgow_calibration/calibration_glasgow"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/kentuen/ros_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/kentuen/ros_ws/install/lib/python2.7/dist-packages:/home/kentuen/ros_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/kentuen/ros_ws/build" \
    "/usr/bin/python2" \
    "/home/kentuen/ros_ws/src/glasgow_calibration/calibration_glasgow/setup.py" \
     \
    build --build-base "/home/kentuen/ros_ws/build/glasgow_calibration/calibration_glasgow" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/kentuen/ros_ws/install" --install-scripts="/home/kentuen/ros_ws/install/bin"
