open Dream_html
open HTML

let article : Article.article =
  {
    title = "Lambda Calculus";
    date = "2024-04-14";
    tags = [| "cs"; "mathematics"; "pl"; "fp"; "lc"; "nix" |];
    content =
      div []
        [
          p []
            [
              txt
                "The lambda calculus is a formal system in mathematical logic \
                 for expressing computation based on function abstraction and \
                 application using variable binding and substitution. It is \
                 a universal model of computation that can be used to simulate \
                 any Turing machine. It was introduced by the mathematician \
                 Alonzo Church in the 1930s as part of his research into the \
                 foundations of mathematics.";
            ];
          p []
            [
              txt
                "The lambda calculus consists of a single transformation rule, \
                 called beta reduction, which allows for the application of \
                 functions to arguments. It is based on the concept of \
                 functions as first-class citizens, meaning that functions can \
                 be passed as arguments to other functions and returned as \
                 results from functions. This makes the lambda calculus a \
                 powerful and expressive system for defining and manipulating \
                 functions.";
            ];
          p []
            [
              txt
                "The lambda calculus has had a profound influence on the \
                 development of computer science and programming languages. \
                 It is the theoretical foundation for functional programming, \
                 a programming paradigm that treats computation as the \
                 evaluation of mathematical functions and avoids changing-\
                 state and mutable data. Functional programming languages, \
                 such as Haskell, Lisp, and ML, are based on the principles \
                 of the lambda calculus and provide powerful tools for \
                 expressing complex computations in a concise and elegant \
                 manner.";
            ];
        ];
  }
