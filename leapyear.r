year <- function(x){
  if(x %% 4 == 0){
    if (x %% 400 == 0||x %% 100 != 0){
    print("Leap year")
        }
    } else{
  print("Not a leap year")
  } 
} 
year(2010)
