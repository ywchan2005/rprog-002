library( datasets )
data( iris )
names( iris )
apply( iris[ , 1:4 ],  1, mean )
apply( iris, 1, mean )
apply( iris[ , 1:4 ], 2, mean )
