data <- read.csv( 'hw1_data.csv', header=TRUE );
z <- data[[ 'Ozone' ]]
mean( z, na.rm=TRUE )
