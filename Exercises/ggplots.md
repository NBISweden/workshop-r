---
layout: default
title:  'ggplots maps in R'
---
# ggplots in R
<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#orgheadline1">1. Introduction</a></li>
<li><a href="#orgheadline2">2. Execise</a></li>
</ul>
</div>
</div>


# Introduction<a id="orgheadline1"></a>

Even though plotting capabilities of R base are really impressive compared to 
other programming languages, there are other packages available to help you generate
awesome graphics. Two of the more popular packages besides the base
package are **lattice** and **ggplot2**. According to many users, these are superior to
the base plot library, especially when it comes to exploratory data analysis --
without too much work, they generate trellis graphics, e.g. graphs that display a
variable or the relationship between variables, conditioned on one or
more other variables. Over the last years ggplot2 has become the
standard plotting library for many R users, especially as it keeps
evolving and new features are added continuously. In addition to being more
convient for certain types of plots, many feel that the default
colors, axis types etc. look better on ggplot2 compared to the base R
and lattice libraries.

# Exercise<a id="orgheadline2"></a>

This exercise will not consist of particular tasks for you to solve.
Instead, the code blocks below will read in data and generate map
plots. Make sure that you can run the code and generate the plot. Once
you have a working code go over the code line by line and try to
obtain a fairly detailed understanding of what is going on. Read the
help for some of the functions and try to replot things with altered arguments (e.g. colors or point shapes).

Before you start you should download the following files to your
working directory:  
[Bolaget.csv](../files/Bolaget.csv)  
[coop_Uppsala.kml](../files/coop_Uppsala.kml)  
[ica_Uppsala.kml](../files/ica_Uppsala.kml)  

If you cannot load the library install it either via the menu of
RStudio or by typing `install.packages("ggmap")` in R.

```R
# Load the libraries necessary for working with maps
# Install them if missing
library(ggmap)
library(maptools)
library(sp)
library(rgdal)
library(deldir)
    
# Download the map of Uppsala from Stamen Maps
google.map <- get_map(c(17.63,59.84), zoom=12, maptype = 'toner')
    
# Load the list of System Bolaget shops
data <- read.table("Bolaget.csv", header=T, sep=";", quote="")
    
# Narrow down the list to Uppsala only
data <- data[data$Address4 == "UPPSALA",]
		
# The description in the file says the provided coords are in the RT90 datum.
# The map uses WGS84 thus we need a conversion from RT90 to WGS84:
latlonRT90 <- data[,c('RT90x', 'RT90y')]
colnames(latlonRT90) <- c('x','y')

# EPSG codes for RT90 and WGS84 are 3021 and 4326, respectively. 
# Here, we do the actual conversion
tmp <- data.frame(coords.x = latlonRT90$y, coords.y = latlonRT90$x)
coordinates(tmp)=~coords.x+coords.y
proj4string(tmp)=CRS("+init=epsg:3021") 
coords <- spTransform(tmp, CRS("+init=epsg:4326"))
		
# Create the data frame for ggplot2
coords <- data.frame(lat=coords@coords[,1], lon=coords@coords[,2])

# Do the Voronoi tesseleation
voronoi <- deldir(coords)

# Plot the map, shops density, shops as points and the tesselation lines.
map <- ggmap(google.map)
map +
stat_density2d(data = coords, 
	           aes(x = lat, y = lon,
			   fill = ..level..,
			   alpha = ..level..), 
			   size = 0.01, bins = 50, 
			   geom = "polygon") + 
			   scale_fill_gradient(low = "green", high = "olivedrab", guide = FALSE) + 
			   scale_alpha(range = c(0, 0.1), guide = FALSE) +
			   geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), 
			                size = .6, linetype=2, data = voronoi$dirsgs, color= "olivedrab") +
							geom_point(aes(x=lat, y=lon), data=coords, color='olivedrab')
```  
    
```R	
# ICA & Coop
ica.kml <- getKMLcoordinates(kmlfile="ica_Uppsala.kml", ignoreAltitude=T)
tmp <- unlist(ica.kml)
ica.coords <- data.frame(lat=tmp[1:length(tmp) %% 2 == 0], lon=tmp[1:length(tmp) %% 2 == 1], type='ica')
coop.kml <- getKMLcoordinates(kmlfile="coop_Uppsala.kml", ignoreAltitude=T)
tmp <- unlist(coop.kml)
coop.coords <- data.frame(lat=tmp[1:length(tmp) %% 2 == 0], lon=tmp[1:length(tmp) %% 2 == 1], type='coop')
coords <- rbind(ica.coords, coop.coords)
google.map <- get_map(c(17.63,59.84), zoom=12)
voronoi <- deldir(coords)

map <- ggmap(google.map)
	         map +
			 scale_fill_gradient(low = "green", high = "olivedrab", guide = FALSE) + 
			 scale_alpha(range = c(0, 0.1), guide = FALSE) + 
			 geom_segment(aes(x = y1, y = x1, xend = y2, yend = x2), 
			 size = .4, linetype=1, data = voronoi$dirsgs, color= "olivedrab") + 
			 geom_point(aes(x=lon, y=lat, col=type), data=coords)
```
