library( datasets )
data( mtcars )
names( mtcars )
apply( mtcars, 2, mean )
lapply( mtcars, mean )
tapply( mtcars$mpg, mtcars$cyl, mean )
