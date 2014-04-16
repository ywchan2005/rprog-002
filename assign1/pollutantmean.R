pollutantmean <- function( directory, pollutant, id=1:332 ) {
	sums <- c()
	lengths <- c()
	classes=c( 'NULL', 'numeric', 'numeric', 'NULL' )
	j <- 1
	for( i in id ) {
		filename <- sprintf( '%s/%03d.csv', directory, i );
		data <- read.csv( filename, header=TRUE, colClasses=classes )
		d <- data[[ pollutant ]];
		d <- d[ ! is.na( d ) ];
		sums[ j ] <- sum( d )
		lengths[ j ] <- length( d )
		j <- j + 1
	}
	sum( sums ) / sum( lengths )
}
