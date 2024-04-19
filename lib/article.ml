type tag = string

type article = {
  title : string;
  date : string;
  content : Dream_html.node;
  tags : tag array;
}

let common_tags =
  [
    ("nix", ("bg-cyan-100/50", "border-sky-200/50"));
    ("math", ("bg-violet-200/40", "border-violet-300/25"));
  ]
