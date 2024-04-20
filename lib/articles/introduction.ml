open Dream_html
open HTML

let article : Article.article =
  {
    title = "Introduction";
    date = "2024-04-14";
    tags = [| "math"; "ml" |];
    content =
      p []
        [
          txt
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \
             eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut \
             enim ad minim veniam, quis nostrud exercitation ullamco laboris \
             nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in \
             reprehenderit in voluptate velit esse cillum dolore eu fugiat \
             nulla pariatur. Excepteur sint occaecat cupidatat non proident, \
             sunt in culpa qui officia deserunt mollit anim id est laborum.";
        ];
  }
