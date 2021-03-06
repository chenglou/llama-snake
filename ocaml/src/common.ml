module List = ListLabels
let rec range a b =
  if a > b
    then []
    else a :: range (succ a) b

module Option = struct
  let map t ~f =
    match t with
    | Some x -> Some (f x)
    | None -> None
  let bind t ~f =
    match t with
    | Some x -> f x
    | None -> None
  let return x =
    Some x
  module Monad_infix = struct
    let ( >>= ) m f = bind m f
    let ( >|= ) m f = map m f
  end
end
