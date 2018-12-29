module Components.App where

import Prelude

import Components.Toggle (toggle)
import Components.FileLister (dirListingComponent)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R
import Effect (Effect)
import Effect.Unsafe (unsafePerformEffect)
import Effect.Exception (try)
import Data.Either (either)
import Node.FS.Sync as S


component :: Component Unit
component = createComponent "App"

currentDir :: Effect (Array String)
currentDir = either (const []) (\x -> x) <$> try (S.readdir ".")

currentDirStrs :: Array String
currentDirStrs = unsafePerformEffect currentDir

app :: JSX
app = unit # makeStateless component \_ ->
  R.div_
    [ R.h1_ [ R.text "Hello world" ]
    , toggle { initialValue: true }
    , toggle { initialValue: false }
    , dirListingComponent { names: currentDirStrs }
    ]
