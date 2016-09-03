module Css.Normalize exposing (css, snippets)

{-| This library is mostly a direct port of [normalize.css](https://github.com/necolas/normalize.css).
Compile it with your elm-css code to have easier cross-browser styling experience.

# Normalizing CSS Stylesheet
@docs css

# Css Snippets
@docs snippets

-}


import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)


{-| A [Stylesheet](https://github.com/rtfeldman/elm-css/blob/master/Tutorial.md) to rest values to make them more consistent across most browsers. You can
include this stylesheet in your elm-css compilation file.

    port module Stylesheets exposing (..)

    import String

    import Css exposing (..)
    import Css.File exposing (..)
    import Html exposing (div)
    import Html.App as Html

    import Css.Reset
    import My.Styles

    port files : CssFileStructure -> Cmd msg


    styles : List Css.Stylesheet
    styles =
        [ Css.Reset.css
        , My.Styles.css
        ]


    cssFiles : CssFileStructure
    cssFiles =
        toFileStructure [ ("dist/styles.css", compileMany styles) ]

    {- Helper function to compile many stylesheets -}
    compileMany : List Css.Stylesheet -> { warnings: List String, css: String }
    compileMany styles =
        let
            results =
                List.map Css.compile styles
        in
            { warnings = List.concatMap .warnings results
            , css = String.join "\n\n" (List.map .css results)
            }


    main : Program Never
    main =
        Html.program
            { init = ( (), files cssFiles )
            , view = \_ -> (div [] [])
            , update = \_ _ -> ( (), Cmd.none )
            , subscriptions = \_ -> Sub.none
            }
-}
css : Stylesheet
css =
    (Css.stylesheet << namespace "") snippets


{-| The snippets used to generate the normalizing stylesheet. Use this if you want to append
these to your own style sheet. This is useful if you prefer to use inline styles over
generator a stylesheet with the [elm-css preprocessor](https://www.npmjs.com/package/elm-css)

    module MyModule exposing (..)

    import Css exposing (..)
    import Css.Elements exposing (..)
    import Css.Namespace exposing (namespace)
    import Css.Reset

    css : Css.Stylesheet
    css =
        (Css.stylesheet << namespace "my-styles") <|
            List.append
                Css.Reset.snippets
                [ everything
                    [ boxSizing borderBox ]
                ]
-}
snippets : List Snippet
snippets =
    [
    ]
