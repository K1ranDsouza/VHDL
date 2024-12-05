--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
use ieee.numeric_std.all;

entity AU is
  port (
    T1,T2,T3,T4: in std_logic_vector(3 downto 0);
    D: out std_logic_vector(3 downto 0));
end AU;

architecture arch of AU is 
begin
  D<=(T1 XOR T2) XOR (T3 XOR T4);
end arch;
