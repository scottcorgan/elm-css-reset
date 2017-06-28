module Examples.Main exposing (..)

import Css
import Css.Reset
import Html exposing (..)
import Html.CssHelpers
import Html.Template


main : Program Never {} b
main =
    Html.beginnerProgram
        { model = {}
        , update = \_ _ -> {}
        , view = view
        }


compiledCss : String
compiledCss =
    Css.Reset.css
        |> List.singleton
        |> Css.compile
        |> .css


view : a -> Html.Html b
view model =
    div []
        [ Html.CssHelpers.style compiledCss
        , Html.Template.view
        ]
