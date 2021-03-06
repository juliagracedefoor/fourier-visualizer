module Arrow where

import           Graphics.Gloss
import           Data.Complex

type Arrow = Complex Float

vectorize :: Arrow -> Vector
vectorize a = (realPart a, imagPart a)

-- Rotate an arrow according to its frequency in cycles per second
updateArrow :: Arrow -> Integer -> Float -> Arrow
updateArrow arrow frequency t =
  cis (2 * pi * fromInteger frequency * t) * arrow

-- Create a path through a list of arrows arranged tip to tail
arrange :: [Arrow] -> Path
arrange = map vectorize . scanl (+) (0 :+ 0)

endpoint :: [Arrow] -> Point
endpoint = last . arrange
