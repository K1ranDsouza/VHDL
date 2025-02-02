--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 11/18/21
--
-- Full adder to use in multiplier
--

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fulladd is
  port( A, B, Cin : in STD_LOGIC;
        S, C : out STD_LOGIC );
end fulladd;

architecture BHV of fulladd is
begin
  S<= (A XOR B) XOR Cin;
  C <= (A AND B) or ((A XOR B) AND Cin); 
end BHV;
