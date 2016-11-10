# Horizon

Using a static receiver over a long period of time, the sky will be "painted" by orbiting satellites. A [GRID](https://radionavlab.ae.utexas.edu/) receiver was used to observe the sky continuously for 42 days, then the resulting data files were processed to produce this panoramic image.

###### Full Version [Here](https://github.com/cullenself/horizon/blob/master/images/horizon.png)
![Visualization of Sky Covered by Satellites](https://github.com/cullenself/horizon/blob/master/images/horizon_small.png)

The image shows several interesting features. Most importantly, the outline of several buildings can be seen on the bottom of the image, which correspond to buildings surrounding the receiver's antenna.
Additionally, there is a hole in satellite coverage around the northern portion of the sky (the far left and right edges of the panorama). This is because no satellites are in polar orbits that would place them at low look angles when they are directly north of the antenna (i.e. no satellites set over the north pole).
One cool detail illustrated by the skyplot is the much brighter streaks produced by satellites in either shared orbits, or repeat ground track orbits.

## Usage
The `master.m` MATLAB script that runs the entire processing operation. It is set up to take advantage of parallel processing. Several key parameters are
* `daz` and `del` - the resolution of the image
* `directory` - where the data files are stored
* `picfile` - where to store the image

The `process.m` function relies on the observation data (azimuth and elevations) being provided in the format specified by the GRID standard ([txinfo](http://radionavlab.ae.utexas.edu/datastore/satNavCourse/txinfodef.txt)). This can be extended to accept any form of azimuth-elevation data.

The `skyview.m`  function that processes a list of azimuth and elevations into a grid of pixels.

## Further Work
* Include more data
* Mark satellites as tracked or untracked
* Produce a function that maps azimuth to suggested elevation cutoff
* Study how length of observation affects resolution of image

##### Acknowledgements
*Dr. Todd Humphreys, U.T. Austin*
