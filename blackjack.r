
black <- function(x, y){
  
  if (x<=21){
    a <- 21 -x
  }
  if (y<=21){
    b <- 21-y   
  }
  if (x>y){
    print(x) 
  }
  if(y>x){
    print(y)
  }
  else{
    print(0)
  }
}
  black(10,15)