-------------------------------------------------------------------------------
--
-- Abstract syntax tree of the 'Fun' language.
--
-------------------------------------------------------------------------------

module Fun.Ast
  ( Name
  , Expr(..)
  , BinOp(..)
  ) where


-- | An identifier.
type Name = String


-- | Expressions.
data Expr =
    IntLit      Integer
  | BoolLit     Bool
  | Var         Name
  | Fn          Name  Expr
  | App         Expr  Expr
  | Let         Name  Expr  Expr
  | IfThenElse  Expr  Expr  Expr
  | Op          BinOp Expr  Expr
  deriving (Eq, Ord)


-- | Builtin binary operations.
data BinOp =
  -- Arithmetic operations '+', '-', '*', '/'
    OpAdd | OpSub | OpMul | OpDiv
  -- Relational operations '==', '!=', '<', '>', '<=', '>='
  | OpEQ | OpNEQ | OpLT | OpGT | OpLTE | OpGTE
  deriving (Eq, Ord)
