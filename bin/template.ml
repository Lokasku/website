open Website.Article
(* open Website.Collection *)
open Dream_html
open HTML

let get_style tag =
  let base =
    "inline font-mono text-gray-500 border rounded-lg px-1.5 py-0.5 mr-1"
  in
  match List.find_opt (fun (x, _) -> x = tag) common_tags with
  | Some (_, (background, border)) ->
      Printf.sprintf "%s %s %s" base border background
  | None -> base

let search request =
  form
    [ class_ "mb-6"; method_ `POST; action "/" ]
    [
      csrf_tag request;
      input
        [
          class_ "w-full border rounded-lg px-2 py-1";
          name "search";
          placeholder "Search";
          type_ "text";
        ];
    ]

let art_list arts =
  div []
    (List.rev (List.mapi
       (fun i article ->
         div []
           [
             p
               [ class_ "inline" ]
               [
                 a
                   [
                     class_
                       "font-semibold text-2xl text-gray-800 mr-2 break-words";
                     href "/article/%d" i;
                   ]
                   [ txt "%s" article.title ];
                 span [ class_ "text-gray-400" ] [ txt " — %s" article.date ];
               ];
             div
               [ class_ "mt-3" ]
               (List.map
                  (fun tag ->
                    p [ class_ "%s" (get_style tag) ] [ txt "%s" tag ])
                  (Array.to_list article.tags));
             hr [ class_ "my-5" ];
           ])
      arts))

let art_view article =
  div []
    [
      p
        [ class_ "inline" ]
        [
          a
            [ class_ "font-bold text-3xl text-gray-800 mr-2" ]
            [ txt "%s" article.title ];
          span [ class_ "text-gray-400" ] [ txt " — %s" article.date ];
        ];
      div
        [ class_ "mt-3" ]
        (List.map
           (fun tag -> p [ class_ "%s" (get_style tag) ] [ txt "%s" tag ])
           (Array.to_list article.tags));
      div [ class_ "content mt-7" ] [ article.content ];
    ]

let layout content req =
  html
    [ lang "en" ]
    [
      head []
        [
          title [] "Lokasku";
          meta [ charset "utf-8" ];
          link [ rel "stylesheet"; href "/static/output.css" ];
        ];
      body
        [ class_ "flex justify-center items-center" ]
        [ div [ class_ "h-screen w-2/5 mt-11" ] [ search req; content ] ];
    ]
