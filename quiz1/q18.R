data <- read.csv( 'hw1_data.csv', header=TRUE );
z <- data[[ 'Ozone' ]]
t <- data[[ 'Temp' ]]
s <- data[[ 'Solar.R' ]]
mean( s[ z>31 & t>90 ], na.rm=TRUE )
