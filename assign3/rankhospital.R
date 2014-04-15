outcomes = c( 'heart attack', 'heart failure', 'pneumonia' )
outcomeIndexes = c( 11, 17, 23 )

rankhospital <- function( state, outcome, num='best' ) {
	outcomeIndex <- outcomeIndexes[ outcomes == outcome ]
	if( length( outcomeIndex ) != 1 ) {
		stop( 'invalid outcome' )
	}
	measures <- read.csv( 'outcome-of-care-measures.csv', header=TRUE, colClasses='character' )
	measures <- measures[ measures$State == state, ]
	if( length( measures$State ) <= 0 ) {
		stop( 'invalid state' )
	}
	measures[[ outcomeIndex ]] <- as.numeric( measures[[ outcomeIndex ]] )
	measures <- measures[ ! is.na( measures[[ outcomeIndex ]] ), ]
	if( ! is.numeric( num ) ) {
		num <- ifelse( num == 'best', 1, ifelse( num == 'worst', nrow( measures ), num ) )
	}
	if( ! is.numeric( num ) ) {
		stop( 'invalid num' )
	}
	if( num <= nrow( measures ) ) {
		sortedOutcomes <- order( measures[ outcomeIndex ], measures$Hospital.Name )
		measures[ sortedOutcomes, ]$Hospital.Name[ num ]
	} else {
		NA
	}
}
