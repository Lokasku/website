open Website.Article

let current_year () =
  let time = Unix.time () in
  let tm = Unix.localtime time in
  tm.Unix.tm_year + 1900

let get_style tag =
  let base = "rounded-lg border px-1.5 text-gray-500 mr-0.5" in
  match List.find_opt (fun (x, _) -> x = tag) common_tags with
  | Some (_, (background, border, text_color)) ->
      Printf.sprintf "%s %s %s %s" base border background text_color
  | None -> base