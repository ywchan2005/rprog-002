data <- read.csv( 'hw1_data.csv', header=TRUE );
m <- data[[ 'Month' ]]
t <- data[[ 'Temp' ]]
mean( t[ m==6 ], na.rm=TRUE )
