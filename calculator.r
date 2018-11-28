
calculator<- function(x,y,z=FALSE){
  if (z==TRUE){
    print(x+y)
  } 
  if (z==FALSE){
    print(x*y)
  }
  if(x==0){
    for (i in 1:10){
    print(y)
    }
  }
  if(y==0){
    for (i in 1:10){
    print(x)
    }
  }
}
calculator(5,10)
