module Components.FileLister where

import Prelude

import Data.Maybe (Maybe(..), fromMaybe)
import React.Basic (Component, JSX, StateUpdate(..), capture_, createComponent, make)
import React.Basic.DOM as R

type Props =
  { names :: Array String
  }

data Action
  = Toggle

component :: Component Props
component = createComponent "App"

dirListingComponent :: Props -> JSX
dirListingComponent = make component { initialState, render }
  where
    initialState = Nothing

    render self =
      R.table
        { children: map (\nm -> R.tr_ [ R.td_ [ R.text nm]]) self.props.names
        }
