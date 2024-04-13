open Dream_html
open HTML

let article : Article.article =
  {
    title = "My Third Article";
    date = "2022-01-01";
    tags = [| "tag1"; "tag2" |];
    content = p [] [ txt "hello" ];
  }
