module View exposing (view)

import Html exposing (Html, div, text, figure, h1, h3, ul, li, img, button, i)
import Html.Attributes exposing (class, classList, src)
import Html.Events exposing (onClick)
import Model exposing (Model)
import Types exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ div [ class "notification" ]
            [ h1 [ class "title is-size-1-desktop is-size-3-tablet is-size-5-mobile has-text-centered" ]
                [ text "Elm Brunch Bulma Starter" ]
            ]
        , div [ class "columns is-centered columns__margin--reset" ]
            [ div [ class "column is-half-tablet is-two-fifths-widescreen is-one-third-fullhd" ]
                [ div [ class "columns" ]
                    [ div [ class "column" ]
                        [ div [ class "content version--width" ]
                            [ ul []
                                [ li [] [ text "elm: \"~0.18.0\"" ]
                                , li [] [ text "bulma: \"^0.7.1\"" ]
                                , li [] [ text "bulma-extensions: \"^2.2.2\"" ]
                                , li [] [ text "fontawesome-free: \"^5.3.1\"" ]
                                , li [] [ text "sass-brunch: \"^2.10.4\"" ]
                                ]
                            ]
                        ]
                    ]
                , div [ class "columns" ]
                    [ div [ class "column" ]
                        [ div [ class "has-text-centered" ]
                            [ button
                                [ class "button btn--width"
                                , classList
                                    [ ( "is-primary", not model.isTextDisplayed )
                                    , ( "is-danger", model.isTextDisplayed )
                                    ]
                                , onClick (ShowText model.isTextDisplayed)
                                ]
                                [ i [ class "fas fa-heart" ] [] ]
                            ]
                        ]
                    ]
                ]
            , div [ class "column is-half-tablet is-two-fifths-widescreen is-one-third-fullhd" ]
                [ figure [ class "image is-2by1" ]
                    [ img [ src "images/300x150.png" ] []
                    ]
                ]
            ]
        , if model.isTextDisplayed then
            div [ class "columns" ]
                [ div [ class "column is-half is-offset-one-quarter" ]
                    [ h3 [ class "has-text-weight-semibold is-size-1-desktop is-size-2-tablet is-size-4-mobile has-text-centered has-text-primary" ]
                        [ text model.text ]
                    ]
                ]
          else
            text ""
        ]
