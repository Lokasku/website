open Website.Article
open Website.Collection
open Dream_html
open HTML

let art_list =
  div []
    (List.mapi
       (fun i article ->
         div
           [ class_ "mx-7 my-5" ]
           [
             p
               [ class_ "inline" ]
               [
                 a
                   [
                     class_ "font-semibold text-xl text-gray-800";
                     href "/article/%d" i;
                   ]
                   [ txt "%s" article.title ];
                 span [ class_ "text-gray-500" ] [ txt " — %s" article.date ];
               ];
             div [class_ "mt-0.5"]
               (List.map
                  (fun tag ->
                    p
                      [ class_ "inline font-mono text-violet-500" ]
                      [ txt "(%s) " tag ])
                  (Array.to_list article.tags));
                  hr [class_ "my-5"]
           ])
       all_article)

let art_view article =
  div
    [ class_ "mx-7 my-5" ]
    [
      p
        [ class_ "inline" ]
        [
          a
            [ class_ "font-semibold text-xl text-gray-800" ]
            [ txt "%s" article.title ];
          span [ class_ "text-gray-500" ] [ txt " — %s" article.date ];
        ];
      div [class_ "mt-0.5"]
        (List.map
           (fun tag ->
             p [ class_ "inline font-mono text-violet-500" ] [ txt "(%s) " tag ])
           (Array.to_list article.tags));
      hr [class_ "my-4"];
      article.content
    ]

let layout content =
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
        [
          div
            [ class_ "h-screen border-l border-r border-gray-300 w-1/3" ]
            [ content ];
        ];
    ]
