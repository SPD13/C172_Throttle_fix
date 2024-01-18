# C172_Throttle_fix
A Script to fix the Throttle and Mixture problem with Airfoillabs Cessna 172 and custome build quadrants

​
If you are having issues with you custom build throttles and mixture quadrants when using the Airfoillabs Cessna 172, the attached LUA script will fix the problem.

# Source of the problem

Airfoillabs is using custom DataRefs to update throttles (C172/cockpit/ped/throttle) and overrides the standard one (sim/cockpit2/engine/actuators/throttle_ratio)

# Fix

I wrote a LUA script to read the throttle value before it is updated and override the custom data ref with the value

# How to install

You need the FlyWithLua plugin (https://forums.x-plane.org/index.php?/files/file/38445-flywithlua-ng-next-generation-edition-for-x-plane-11-win-lin-mac/), put the attached script in the "Scripts" folder

# How to use

It should work automatically 😄

If you want details on the values, you can change the value of the "DEBUG" variable to "true" to show a debug window

# To be tested

I tested it successfully on my Macbook Pro M1 with a custom quadrant using SimVimX

The script is updating only if the vendor of the Aircraft is "Airfoillabs", I only own the Cessna 172 Digital. I don't know if it works on other airplanes.
