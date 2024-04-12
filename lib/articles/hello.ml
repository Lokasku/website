let my_first_article : Article.article =
  {
    title = "My First Article";
    date = "2022-01-01";
    content =
      (let open Dream_html in
       let open HTML in
       p [] [ txt "hello" ]);
    tags = [| "tag1"; "tag2" |];
  }
