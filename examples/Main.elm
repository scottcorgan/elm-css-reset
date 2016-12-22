module Examples.Main exposing (..)

import Html exposing (..)
import Html.Template
import Html.CssHelpers
import Css.File
import Css.Reset


main : Program Never {} b
main =
    Html.beginnerProgram
        { model = {}
        , update = (\_ _ -> {})
        , view = view
        }


compiledCss : String
compiledCss =
    Css.Reset.css
        |> Css.File.compile
        |> .css


view : a -> Html.Html b
view model =
    div []
        [ Html.CssHelpers.style compiledCss
        , Html.Template.view
        ]
