type tag = string

type article = {
  title : string;
  date : string;
  content : Dream_html.node;
  tags : tag array;
}
