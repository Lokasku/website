open Website.Article
open Website.Articles

let count = ref 0

let counter inner_handler request =
  count := !count + 1;
  inner_handler request

let arts articles =
  let open Dream_html in
  let open HTML in
  div [] (List.map (fun article ->
    div []
      [
        p [] [ txt "Title: %s" article.title ];
        p [] [ txt "Date: %s" article.date ];
        article.content;
      ]
  ) articles)

let home =
  let open Dream_html in
  let open HTML in
  html
    [ lang "en" ]
    [
      head []
        [
          title [] "Lokasku";
          meta [ charset "utf-8" ];
          link [ rel "stylesheet"; href "static/output.css" ];
        ];
      body
        [ class_ "flex justify-center items-center" ]
        [
          div
            [ class_ "h-screen border-l border-r border-gray-800 w-1/3" ]
            [
              arts articles;
            ];
        ];
    ]

let () =
  Dream.run ~interface:"0.0.0.0" ~port:2048
  @@ Dream.logger @@ counter
  @@ Dream.router
       [
         Dream.get "/" (fun _ -> Dream_html.respond home);
         Dream.get "/article/:id" (fun req -> Dream.html (Dream.param req "id"));
         Dream.get "/static/:file" (fun req ->
             let file = Dream.param req "file" in
             let content =
               if String.ends_with ~suffix:".css" file then
                 let css_content =
                   let file_path = "static/" ^ file in
                   let open_in_channel = open_in_bin file_path in
                   let content =
                     really_input_string open_in_channel
                       (in_channel_length open_in_channel)
                   in
                   close_in open_in_channel;
                   content
                 in
                 Dream.respond
                   ~headers:[ ("Content-Type", "text/css") ]
                   css_content
               else Dream.not_found req
             in
             content);
       ]
