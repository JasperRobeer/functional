-------------------------------------------------------------------------------
--
-- Pretty printing of the abstract syntax tree of the 'Fun' language.
--
-------------------------------------------------------------------------------

module Fun.PrettyPrint
  ( Printable(..)
  ) where

import PrettyPrint
import Fun.Ast


instance Printable Expr where
  ppr _ (IntLit i)           = pp i
  ppr _ (BoolLit b)          = pp b
  ppr _ (Var n)              = text n
  ppr d (Fn f e)             = text "fn" <+> text f <+> text "=>" <+> ppr d e
  ppr d (App e1 e2)          = maybeParens (d>0) $ ppr (d+1) e1 <+> ppr (d+1) e2
  ppr d (Let n e1 e2)        = text "let" <+> text n <+> text "=" <+> ppr d e1
                                                     <+> text "in" <+> ppr d e2
  ppr d (IfThenElse c e1 e2) = text "if" <+> ppr d c <+> text "then" <+> ppr d e1
                                                     <+> text "else" <+> ppr d e2
  ppr d (Op op e1 e2)        = ppr d e1 <+> pp op <+> ppr d e2


instance Printable BinOp where
  pp OpAdd = text "+"
  pp OpSub = text "-"
  pp OpMul = text "*"
  pp OpDiv = text "/"
  pp OpEQ  = text "=="
  pp OpNEQ = text "!="
  pp OpLT  = text "<"
  pp OpGT  = text ">"
  pp OpLTE = text "<="
  pp OpGTE = text ">="
