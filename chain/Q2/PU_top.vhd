--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
use ieee.numeric_std.all;

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
use ieee.numeric_std.all;


entity PU_top is
  port (
    B,C: in std_logic_vector(3 downto 0);
    A: out std_logic_vector(3 downto 0));
end PU_top;




architecture arch of PU_top is 
  component PU
    port (B: in std_logic;
          C: in std_logic_vector(3 downto 0);
          T: out std_logic_vector(3 downto 0));
  end component;
  component AU
    port (
      T1,T2,T3,T4: in std_logic_vector(3 downto 0);
      D: out std_logic_vector(3 downto 0));
  end component;
  signal T1, T2, T3, T4: std_logic_vector(3 downto 0);
  signal CU2, CU3, CU4: std_logic_vector(3 downto 0);
begin
  -- Moved index 0 CU terms out of generate loop. We use xor for '+' operator.
  -- If matrix size increase, we will use another generate
  -- loop for the index 0 terms.
  CU2(0)<=C(3) xor C(2);
  CU3(0)<=C(2) xor C(1);
  CU4(0)<=C(1) xor C(0);
  -- Use a generate loop for remaining CU terms
  -- From looking at the block diagram, we see 
  -- that terms are shifted one place across the PU's.
  -- If matrix size increases, we will increase the generate
  -- loop index.
  cir: for i in 0 to 2 generate
    CU2(i+1)<=C(i);
    CU3(i+1)<=CU2(i);
    CU4(i+1)<=CU3(i);
  end generate;
  unit1: PU
    port map(B=>B(0), C=>C, T=>T1);
  unit2: PU
    port map(B=>B(1), C=>CU2, T=>T2);
  unit3: PU
    port map(B=>B(2), C=>CU3, T=>T3);
  unit4: PU
    port map(B=>B(3), C=>CU4, T=>T4);
  unit5: AU
    port map(T1=>T1, T2=>T2, T3=>T3, T4=>T4, D=>A);
end arch;
