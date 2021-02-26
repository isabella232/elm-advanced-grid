module Grid.Icons exposing (checkIcon, drawClickableDarkSvg, drawClickableLightSvg, drawDarkSvg, drawLightSvg, filterIcon, informationIcon, width)

import Color exposing (Color)
import Grid.Colors exposing (darkGreyRgb, lightGreyRgb)
import Html.Styled exposing (Html)
import Svg.Styled exposing (fromUnstyled)
import TypedSvg exposing (g, path, svg)
import TypedSvg.Attributes exposing (fill, viewBox)
import TypedSvg.Attributes.InPx as InPx
import TypedSvg.Events exposing (onClick)
import TypedSvg.Types exposing (Paint(..))


drawDarkSvg : Float -> Float -> String -> Html.Styled.Html msg
drawDarkSvg viewBoxSize contentSize svgPath =
    drawSvg darkGreyRgb viewBoxSize contentSize svgPath


drawLightSvg : Float -> Float -> String -> Html.Styled.Html msg
drawLightSvg viewBoxSize contentSize svgPath =
    drawSvg lightGreyRgb viewBoxSize contentSize svgPath


drawSvg : Color.Color -> Float -> Float -> String -> Html.Styled.Html msg
drawSvg color viewBoxSize contentSize svgPath =
    svg
        [ viewBox 0 0 viewBoxSize viewBoxSize
        , InPx.width contentSize
        , InPx.height contentSize
        ]
        [ g []
            [ path
                [ TypedSvg.Attributes.d svgPath
                , fill <| Paint color
                ]
                []
            ]
        ]
        |> fromUnstyled


drawClickableDarkSvg : Float -> Float -> String -> msg -> Html.Styled.Html msg
drawClickableDarkSvg viewBoxSize contentSize svgPath message =
    drawClickableSvg (Color.rgb 0.2 0.2 0.2) viewBoxSize contentSize svgPath message


drawClickableLightSvg : Float -> Float -> String -> msg -> Html.Styled.Html msg
drawClickableLightSvg viewBoxSize contentSize svgPath message =
    drawClickableSvg (Color.rgb 0.6 0.6 0.6) viewBoxSize contentSize svgPath message


drawClickableSvg : Color.Color -> Float -> Float -> String -> msg -> Html.Styled.Html msg
drawClickableSvg color viewBoxSize contentSize svgPath message =
    svg
        [ viewBox 0 0 viewBoxSize viewBoxSize
        , InPx.width contentSize
        , InPx.height contentSize
        , onClick message
        ]
        [ g []
            [ path
                [ TypedSvg.Attributes.d svgPath
                , fill <| Paint color
                ]
                []
            ]
        ]
        |> fromUnstyled


filterIcon : String
filterIcon =
    "M 0 0 L 15 0 L 9 6 L 9 12 L 6 12 L 6 6 Z"


checkIcon : String
checkIcon =
    "M 0 5 L 6 10 L 12 0 L14 0 L 6 14 L 0 7 Z"


width : Float
width =
    15


informationIcon : String
informationIcon =
    """M100.942,0.001C44.9,0.304-0.297,45.98,0.006,102.031
    c0.293,56.051,45.998,101.238,102.02,100.945c56.081-0.303,101.248-45.978,100.945-102.02
    C202.659,44.886,157.013-0.292,100.942,0.001z M101.948,186.436c-46.916,0.234-85.108-37.576-85.372-84.492
    c-0.244-46.907,37.537-85.157,84.453-85.411c46.926-0.254,85.167,37.596,85.421,84.483
    C186.695,147.951,148.855,186.182,101.948,186.436z M116.984,145.899l-0.42-75.865l-39.149,0.254l0.078,16.6l10.63-0.059
    l0.313,59.237l-11.275,0.039l0.088,15.857l49.134-0.264l-0.098-15.847L116.984,145.899z M102.065,58.837
    c9.575-0.039,15.349-6.448,15.3-14.323c-0.254-8.07-5.882-14.225-15.095-14.186c-9.184,0.059-15.173,6.292-15.134,14.362
    C87.185,52.555,93.028,58.906,102.065,58.837z"""
