
hot <- function(season, temp){
  if (season == "Summer"){
    if (temp > 60 && temp < 100){ 
      print("TRUE")}
  }
  if (season != "Summer"){
    if (temp > 60 && temp < 90){
      print("TRUE")
    }
  }
  else{
    print("FALSE")
  }
}

hot("summer", 150)


