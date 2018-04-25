{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import System.Environment (getEnv)

main = do
  port <- read <$> getEnv "PORT"
  scotty port routes


routes :: ScottyM ()
routes = do
  get "/mail" $ do
    text "test"
  post "/mail" $ do
    text "fgkfgk"