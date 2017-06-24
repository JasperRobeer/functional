{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}

-------------------------------------------------------------------------------
--
-- Pretty printing using Text.PrettyPrint library, and a custom class.
--
-------------------------------------------------------------------------------

module PrettyPrint
  ( Printable(..)
  , module Text.PrettyPrint
  , maybeParens
  ) where

import Text.PrettyPrint
import Text.PrettyPrint.HughesPJ (maybeParens)


-- | Pretty printing class. Minimal complete definition is either 'pp' or 'ppr'.
class Printable p where
  pp :: p -> Doc
  pp = ppr 0

  ppr :: Int -> p -> Doc
  ppr _ = pp


instance Printable Bool where pp = text . show
instance Printable Char where pp = char
instance Printable String where pp = text
instance Printable Int where pp = int
instance Printable Integer where pp = integer
instance Printable Float where pp = float
instance Printable Double where pp = double
instance Printable Rational where pp = rational
