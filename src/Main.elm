import Html.App exposing (beginnerProgram)
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)

-- MAIN
main =
    beginnerProgram { view = view, model = model, update = update }




-- MODEL
type alias Model =
    { isPlaying : Bool
    , columnLength : Int
    , groupLength : Int
    }

model : Model
model = { isPlaying = False
        , columnLength = 32
        , groupLength = 4
        }




-- UPDATE
type Msg = Play | Pause

update : Msg -> Model -> Model
update msg model =
    case msg of
        Play ->
            { model | isPlaying = True }
        Pause ->
            { model | isPlaying = False }



-- VIEW
view : Model -> Html a
view model =
    div [ appContainerStyle ]
        [ div [ numberContainerStyle ] ( numberColumn model.columnLength )
        , div [] ( groupColumn model.groupLength )
        ]

appContainerStyle : Html.Attribute style
appContainerStyle =
    style [ ("backgroundColor", "#19191B")
          , ("color", "#fff")
          , ("height", "100%")
          , ("padding", "1rem")
          , ("fontFamily", "Menlo")
          , ("-webkit-user-select", "none")
          ]

numberContainerStyle : Html.Attribute style
numberContainerStyle =
    style [ ("width", "1.25rem")
          , ("padding", "1rem")
          , ("borderRight", "1px #333 solid")
          , ("float", "left")
          ]

numberColumn : Int -> List (Html a)
numberColumn columnLength =
    List.map ( \n -> addZero n ) [ 1..columnLength ]
        |> List.map ( \n -> div [ style [ ("lineHeight", "1.5rem") ] ] [ text n ] )

addZero : Int -> String
addZero number =
    if number < 10 then
        "0" ++ (toString number)
    else
        (toString number)

groupColumnStyle : Html.Attribute style
groupColumnStyle =
    style [ ("float", "left")
          , ("width", "9rem")
          ]

groupColumn : Int -> List (Html a)
groupColumn groupLength =
    List.map ( \n -> div [ groupColumnStyle ] [ text (toString n) ] ) [ 1..groupLength ]


