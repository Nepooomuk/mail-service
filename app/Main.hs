{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Web.Scotty
import System.Environment (getEnv)
import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

data Email = Email { mailID :: Integer, sender :: String, recipient :: String, msg :: String } deriving (Show, Generic)
instance ToJSON Email
instance FromJSON Email

markusMail :: Email
markusMail = Email { mailID = 1, sender = "robin.mai@obi.de", recipient = "walli@obi.de", msg = "n1 wetter vong somne her"}

muttiMail :: Email
muttiMail = Email { mailID = 2, sender = "robin.mai@obi.de", recipient = "mutti@obi.de", msg = "hallo mutti" }

allMails :: [Email]
allMails =  [markusMail, muttiMail]

---- server
main = do
  port <- read <$> getEnv "PORT"
  scotty port routes


routes :: ScottyM ()
routes = do
  get "/mail/:mailID" $ do
    mailID <- param "mailID"
    text ("test" <> mailID <> "!")
  get "/mail" $ do
    json allMails
  post "/mail" $ do
    text "fgkfgk"