Cyclone PCB Factory v0.9.7
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

Cyclone PCB Factory v0.9.7 [added video summary]  by carlosgs , published Feb 11, 2013

![Image](img/Cyclone_built_v0.9.7_display_large.jpg)

Description
--------
<br />
Video summary: <a href="http://www.youtube.com/watch?v=fKW3fwy1h0k" target="_blank" rel="nofollow">youtube.com/watch?v=fKW3fwy1h0k</a> <br />
--  <br />
<br />
More info in <a href="http://reprap.org/wiki/Cyclone_PCB_Factory" target="_blank" rel="nofollow">reprap.org/wiki/Cyclone_PCB_Factory</a> <br />
==  <br />
<br />
Download (Git): **Now all the files are hosted in GitHub:** <a href="https://github.com/carlosgs/Cyclone-PCB-Factory" target="_blank" rel="nofollow">github.com/carlosgs/Cyclone-PCB-Factory</a> <br />
-  <br />
Cyclone (Circuit Cloner) is a design for a CNC mill intended for PCB manufacturing.  <br />
--  <br />
It is a work in progress, looking forward to your suggestions and improvements.  <br />
<br />
Special thanks:  <br />
--  <br />
- Z axis concepts by **Quim Borras** and the spindle motor holder by **Misan** were really useful!! Also, **Diego Viejo**'s machine was of great inspiration for the Z axis (https://plus.google.com/u/0/photos/113930344830086538817/albums/5868944432651911713?authkey=CLDJgdehlN773gE) **Thank you all!!**  <br />
- This design woudn't have been possible without the encouragement of the **Panda CNC community** (https://plus.google.com/u/0/communities/102402711800402614517)  <br />
- Also, thanks to **Obijuan** (http://iearobotics.com) for naming the machine Cyclone :)

Instructions
--------
Work in progress, please refer to the pictures.  <br />
<br />
News:  <br />
--  <br />
* First Z probing results are promising, read: <a href="https://plus.google.com/u/0/113437723819360223498/posts/9VCHqqnirj6" target="_blank" rel="nofollow">plus.google.com/u/0/113437723819360223498/posts/9VCHqqnirj6</a>  and <a href="https://plus.google.com/u/0/113437723819360223498/posts/89W2cv1fgQW" target="_blank" rel="nofollow">plus.google.com/u/0/113437723819360223498/posts/89W2cv1fgQW</a> <br />
* Added the python probing script (v0.1) and Octave/Matlab visualizer  <br />
<br />
Videos:  <br />
--  <br />
- v0.9.5 Probing a PCB <a href="http://www.youtube.com/watch?v=m5zXL8k5T9E" target="_blank" rel="nofollow">youtube.com/watch?v=m5zXL8k5T9E</a> <br />
- v0.9.5 Milling MDF <a href="http://www.youtube.com/watch?v=2QpxjheEjEc" target="_blank" rel="nofollow">youtube.com/watch?v=2QpxjheEjEc</a> and <a href="http://www.youtube.com/watch?v=zjav0hBtmYA" target="_blank" rel="nofollow">youtube.com/watch?v=zjav0hBtmYA</a> <br />
- v0.8 Drawing test: <a href="http://www.youtube.com/watch?v=Y-HSdE89JOM" target="_blank" rel="nofollow">youtube.com/watch?v=Y-HSdE89JOM</a> <br />
- v0.7.5 XY axis test: <a href="http://www.youtube.com/watch?v=9umlq4oHG64" target="_blank" rel="nofollow">youtube.com/watch?v=9umlq4oHG64</a> <br />
- v0.7.5 High speed XY test: <a href="http://www.youtube.com/watch?v=H3uYCXryj60" target="_blank" rel="nofollow">youtube.com/watch?v=H3uYCXryj60</a> <br />
<br />
Bill of materials:  <br />
--  <br />
<a href="https://docs.google.com/spreadsheet/ccc?key=0AsQp8IK25R4IdGk3LTdOWmpFR0Nrc0RhaVJaUC1CMUE" target="_blank" rel="nofollow">docs.google.com/spreadsheet/ccc?key=0AsQp8IK25R4IdGk3LTdOWmpFR0Nrc0RhaV JaUC1CMUE</a> <br />
<br />
Notes:  <br />
--  <br />
- Using a thick wood piece as the main base.  <br />
- As shown in one of the pictures, a cheap dremel-like drill has nice bearings and is a good option as the main tool. **Finally it will be using a proper spindle** (check the BOM for the reference).  <br />
- Desired working range of &gt;=100mm for the X axis and &gt;=160mm for the Y axis.  <br />
- Parts are designed to be printable with the small volume of a Printrbot Jr  <br />
- Bed leveling will be done with probing and an appropriate software.  <br />
<br />
To-Do list:  <br />
--  <br />
- [99% DONE] Design parts for the X axis (this includes Z axis too, **will be using a proper spindle instead of a hand-drill**)  <br />
- [DONE] Design parts for the Y axis  <br />
- [DONE] Create template for the screws in the wood base  <br />
- Software, testing, milling a PCB (till then, it can't be v1.0 :P)...  <br />
<br />
Software  <br />
--  <br />
Here is a compilation of links that I find interesting for the software controller:  <br />
<br />
- <a href="http://www.re-innovation.co.uk/web12/index.php/en/blog-75/181-making-pcbs-with-a-cnc-machine" target="_blank" rel="nofollow">re-innovation.co.uk/web12/index.php/en/blog-75/181-making-pcbs-with-a-cnc-machine</a> <br />
- <a href="http://phk.freebsd.dk/CncPcb/" target="_blank" rel="nofollow">phk.freebsd.dk/CncPcb/</a> <br />
- <a href="http://wiki.linuxcnc.org/cgi-bin/wiki.pl?Touch_Probe" target="_blank" rel="nofollow">wiki.linuxcnc.org/cgi-bin/wiki.pl?Touch_Probe</a> <br />
- <a href="http://things.onshoulders.org/software/PcbSubtraction.php" target="_blank" rel="nofollow">things.onshoulders.org/software/PcbSubtraction.php</a> <br />
- <a href="http://www.cnczone.com/forums/pcb_milling/82628-cheap_simple_height-probing-5.html" target="_blank" rel="nofollow">cnczone.com/forums/pcb_milling/82628-cheap_simple_height-probing-5.html</a> <br />
- <a href="http://drillcity.stores.yahoo.net/" target="_blank" rel="nofollow">drillcity.stores.yahoo.net/</a> <br />
- <a href="http://www.drewtronics.net/" target="_blank" rel="nofollow">drewtronics.net/</a> <br />
<br />
- **Examples of the PCB probing method**  <br />
 - onshouldersTv: Open Source Circuit Boards at Home <a href="http://www.youtube.com/watch?v=L-5SRtwx3kY" target="_blank" rel="nofollow">youtube.com/watch?v=L-5SRtwx3kY</a> <br />
 - PCB routing using the Probe method <a href="http://www.youtube.com/watch?v=fwgT9sCL8fs" target="_blank" rel="nofollow">youtube.com/watch?v=fwgT9sCL8fs</a> <br />
- <a href="http://pcbgcode.org/" target="_blank" rel="nofollow">pcbgcode.org/</a> <br />
- <a href="http://sourceforge.net/apps/mediawiki/pcb2gcode/index.php?title=Main_Page" target="_blank" rel="nofollow">sourceforge.net/apps/mediawiki/pcb2gcode/index.php?title=Main_Page</a> <br />
- Very interesting toguether with cam.py: <a href="http://code.google.com/p/pygerber2gcode/" target="_blank" rel="nofollow">code.google.com/p/pygerber2gcode/</a> <br />
- <a href="http://replicat.org/generators" target="_blank" rel="nofollow">replicat.org/generators</a> <br />
- For arranging panels: <a href="http://ruggedcircuits.com/gerbmerge/" target="_blank" rel="nofollow">ruggedcircuits.com/gerbmerge/</a> <br />
<br />
License: CC-BY-SA  <br />
--  <br />
You are more than welcome to suggest/modify/redistribute :-)  <br />
<br />
Credit for the ideas used  <br />
--  <br />
The origin of Cyclone took place while I was inside the __Panda CNC__ community (https://plus.google.com/u/0/communities/102402711800402614517). This is from December 2012 to mid-February 2013.  <br />
Here is the credit for the ideas that were used:  <br />
<br />
* __Lets design a 3D-printable CNC for PCB milling, it will be named Panda:__ Guillermo Welch (mid-December, via Google Talk)  <br />
* __X carriage rod distribution:__ Csar Augusto Fernndez Cano claims Cyclone's X axis is a derivate of his concept: <a href="https://plus.google.com/u/0/111421387442355054591/posts/QrfYtEuZBaj" target="_blank" rel="nofollow">plus.google.com/u/0/111421387442355054591/posts/QrfYtEuZBaj</a> <br />
* __100x160mm workspace:__ David Martin <a href="https://dl.dropboxusercontent.com/u/16122275/PandaCNC_credit/workplace_size.png" target="_blank" rel="nofollow">dl.dropboxusercontent.com/u/16122275/PandaCNC_credit/workplace_size.png</a> <br />
* __Using gears to drive the X-Y axes:__ Guillermo Welch <a href="https://plus.google.com/u/0/101232926728463427403/posts/QjZGNcWcgGg" target="_blank" rel="nofollow">plus.google.com/u/0/101232926728463427403/posts/QjZGNcWcgGg</a> <br />
* __Regarding the woodbase:__ Guillermo Welch always contemplated the possibility of attaching the machine (optionally) to a woodbase. I decided to use the base as a main structural part instead. See <a href="https://dl.dropboxusercontent.com/u/16122275/PandaCNC_credit/woodbase.png" target="_blank" rel="nofollow">dl.dropboxusercontent.com/u/16122275/PandaCNC_credit/woodbase.png</a> (screenshot from <a href="https://plus.google.com/u/0/113437723819360223498/posts/8LDCSSVWqCS" target="_blank" rel="nofollow">plus.google.com/u/0/113437723819360223498/posts/8LDCSSVWqCS</a>)  <br />
* __List of CNC endmill types:__ David Martin <a href="https://dl.dropboxusercontent.com/u/16122275/PandaCNC_credit/cnc_endmill_types.png" target="_blank" rel="nofollow">dl.dropboxusercontent.com/u/16122275/PandaCNC_credit/cnc_endmill_types.png</a> <br />
<br />
Please note I have taken screenshots of the post that are on the closed G+ Panda community (https://plus.google.com/u/0/communities/116318709564872967169). You can register and see by yourself.  <br />
<br />
**All other development present on Cyclone has nothing to do with Panda and is not related to the Panda project.**

Files
--------
[![Image](img/Cyclone_preview_tinycard.jpg)](Cyclone.stl)
 [ Cyclone.stl](Cyclone.stl)  



Pictures
--------
![Image](img/Cyclone_display_large.jpg)
![Image](img/Cyclone_render_v0.9.7_display_large.jpg)
![Image](img/2013-05-30_16.23.08_display_large.jpg)
![Image](img/2013-05-23_23.07.37_display_large.jpg)
![Image](img/2013-05-20_14.41.25_display_large.jpg)
![Image](img/2013-05-20_15.50.43_display_large.jpg)
![Image](img/2013-05-20_12.23.34_display_large.jpg)
![Image](img/2013-05-20_16.03.48_display_large.jpg)
![Image](img/2013-05-19_19.53.28_display_large.jpg)
![Image](img/Screenshot_from_2013-05-19_202104_display_large.jpg)
![Image](img/2013-05-19_19.52.21_display_large.jpg)
![Image](img/2013-05-19_19.48.32_display_large.jpg)
![Image](img/2013-05-19_19.52.13_display_large.jpg)
![Image](img/2013-05-23_23.25.12_display_large.jpg)
![Image](img/2013-05-20_14.43.52_display_large.jpg)
![Image](img/CycloneFirstDrawing_display_large.jpg)
![Image](img/2013-04-07_14.44.55-1_display_large.jpg)
![Image](img/2013-04-07_14.49.43-1_display_large.jpg)
![Image](img/2013-04-07_14.41.35_display_large.jpg)
![Image](img/2013-03-29_20.04.51_display_large.jpg)
![Image](img/2013-03-29_14.21.58_display_large.jpg)
![Image](img/2013-03-29_13.46.37_display_large.jpg)
![Image](img/2013-03-29_20.07.27_display_large.jpg)
![Image](img/2013-03-28_22.44.51_display_large.jpg)
![Image](img/2013-02-10_20.46.51_display_large.jpg)
![Image](img/2013-02-09_23.29.32_display_large.jpg)
![Image](img/2013-02-10_14.20.56_display_large.jpg)
![Image](img/2013-02-10_20.47.46_display_large.jpg)
![Image](img/2013-02-10_23.05.56_display_large.jpg)
![Image](img/pcb_CNC_display_large.jpg)
![Image](img/drill_display_large.jpg)
![Image](img/2013-03-28_17.19.18_display_large.jpg)
![Image](img/2013-03-28_17.24.39_display_large.jpg)
![Image](img/2013-03-28_17.51.47_display_large.jpg)
![Image](img/2013-03-28_18.03.34_display_large.jpg)
![Image](img/2013-03-28_22.46.10_display_large.jpg)
![Image](img/2013-03-29_20.05.10_display_large.jpg)


Tags
--------
CNC , Cyclone , Mill , PCB , plastic_valley , printable , tool , UAM  

  

License
--------
Cyclone PCB Factory v0.9.7 [added video summary] by carlosgs is licensed under the Creative Commons - Attribution - Share Alike license.  



By: Carlos Garcia Saura (carlosgs)
--------
<http://carlosgs.es/>