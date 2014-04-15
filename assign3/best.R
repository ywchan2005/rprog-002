outcomes = c( 'heart attack', 'heart failure', 'pneumonia' )
outcomeIndexes = c( 11, 17, 23 )

best <- function( state, outcome ) {
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
	sortedOutcomes <- order( measures[ outcomeIndex ], measures$Hospital.Name )
	measures[ sortedOutcomes, ]$Hospital.Name[ 1 ];
}
