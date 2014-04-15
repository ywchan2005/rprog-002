library( datasets )
data( iris )
mean( iris$Sepal.Length[ iris$Species == 'virginica' ], na.rm=TRUE )

tapply( iris$Sepal.Length, iris$Species, mean )
