--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 8-bit adder using full-adder component and individual bits intead of vectors
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 


entity add8 is
  port (A0, A1, A2, A3, A4, A5, A6, A7 : in std_logic;
        B0, B1, B2, B3, B4, B5, B6, B7 : in std_logic;  
        Cin : in std_logic;
        S0, S1, S2, S3, S4, S5, S6, S7 : out std_logic;          
        Cout : out std_logic);
end entity add8;

architecture add8_A of add8 is
  signal T0, T1, T2, T3, T4, T5, T6 : std_logic;  

  component fa
      port (A: in std_logic; 
        B: in std_logic;
        Cin: in std_logic;        
        S: out std_logic;
        C: out std_logic                
        ); 

  end component;      

begin

  FA0: fa port map (A0, B0, Cin, S0, T0);
  FA1: fa port map (A1, B1, T0, S1, T1);
  FA2: fa port map (A2, B2, T1, S2, T2);
  FA3: fa port map (A3, B3, T2, S3, T3);  
  FA4: fa port map (A4, B4, T3, S4, T4);
  FA5: fa port map (A5, B5, T4, S5, T5);
  FA6: fa port map (A6, B6, T5, S6, T6);
  FA7: fa port map (A7, B7, T6, S7, Cout);     
  
end architecture add8_A;
