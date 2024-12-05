--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 11/8/21
--
-- Full Adder
--

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 


entity fa is 
  port (A: in std_logic; 
        B: in std_logic;
        Cin: in std_logic;        
        S: out std_logic;
        C: out std_logic                
        ); 
end fa; 

architecture fa_1 of fa is
  signal T1 :  std_logic;
begin

  T1 <= A xor B;
  S  <= T1 xor Cin;
  C <= (A and B) or (T1 and Cin);
  
end architecture fa_1;
