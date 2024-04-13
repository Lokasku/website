open Website.Articles
open Dream_html
open HTML

let count = ref 0

let counter inner_handler request =
  count := !count + 1;
  inner_handler request

let () =
  Dream.run (* ~interface:"0.0.0.0" *) ~port:2048
  @@ Dream.logger @@ counter
  @@ Dream.router
       [
         Dream.get "/" (fun _ -> Dream_html.respond (Template.home Template.arts));
         Dream.get "/article/:id" (fun req ->
          try
            let index = int_of_string (Dream.param req "id") in
            let article = List.nth articles index in
            Dream_html.respond (Template.home (Template.format_article article))
          with
          | Failure _ -> Dream_html.respond (p [] [ txt "Error: Article not found" ]));
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
