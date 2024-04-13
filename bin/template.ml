open Website.Article
open Website.Articles
open Dream_html
open HTML

let arts =
  div [] (List.mapi (fun i article ->
    div [class_ "m-3"]
      [
        p [class_ "inline"]
          [ 
            a [class_ "font-semibold text-xl text-gray-800"; href "https://lokasku.dev/"] [ txt "%s" article.title ];
            span [class_ "text-gray-500"] [ txt " — %s" article.date ];
          ];
        div [] (List.map (fun tag -> p [class_ "inline font-mono text-violet-500"] [ txt "(%s) " tag]) (Array.to_list article.tags));
      ]
  ) articles)

let format_article article =
  div [class_ "m-3"]
    [
      p [class_ "inline"]
        [
          a [class_ "font-semibold text-xl text-gray-800"; href "#"] [ txt "%s" article.title ];
          span [class_ "text-gray-500"] [ txt " — %s" article.date ];
        ];
      div [] (List.map (fun tag -> p [class_ "inline font-mono text-violet-500"] [ txt "(%s) " tag]) (Array.to_list article.tags));
      article.content;
    ]

let home content =
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
            [ class_ "h-screen border-l border-r border-gray-300 w-1/3" ]
            [
              content;
            ];
        ];
    ]