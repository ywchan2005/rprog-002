outcomes = c( 'heart attack', 'heart failure', 'pneumonia' )
outcomeIndexes = c( 11, 17, 23 )

rankall <- function( outcome, num='best' ) {
	outcomeIndex <- outcomeIndexes[ outcomes == outcome ]
	if( length( outcomeIndex ) != 1 ) {
		stop( 'invalid outcome' )
	}
	measures <- read.csv( 'outcome-of-care-measures.csv', header=TRUE, colClasses='character' )
	measures[[ outcomeIndex ]] <- as.numeric( measures[[ outcomeIndex ]] )
	measures <- measures[ ! is.na( measures[[ outcomeIndex ]] ), ]
	hospitals <- c()
	states <- c()
	j <- 1
	for( state in unique( measures$State ) ) {
		t <- measures[ measures$State == state, ]
		n <- num
		if( ! is.numeric( num ) ) {
			n <- ifelse( num == 'best', 1, ifelse( num == 'worst', nrow( t ), num ) )
		}
		if( ! is.numeric( n ) ) {
			stop( 'invalid num' )
		}
		if( n <= nrow( t ) ) {
			sortedOutcomes <- order( t[ outcomeIndex ], t$Hospital.Name )
			hospitals[ j ] <- t[ sortedOutcomes, ]$Hospital.Name[ n ]
		} else {
			hospitals[ j ] <- NA
		}
		states[ j ] <- state
		j <- j + 1
	}
	a <- data.frame( hospital=hospitals, state=states )
	a[ order( a$state ), ]
}
