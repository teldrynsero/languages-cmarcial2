let rec perfectSquare x =
  if int_of_float(x) == int_of_float(sqrt(x)) * int_of_float(sqrt(x))
  then true
  else false ;;