--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- Generic width adder, using full-adder component
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 


entity addX is
  -- For Lab 4, we'll set the WIDTH to 50 when we instantiate this
  -- generic adder component
  generic (
    WIDTH : in natural := 8);

  port (A : in std_logic_vector(WIDTH-1 downto 0);
        B : in std_logic_vector(WIDTH-1 downto 0);
        Cin : in std_logic;
        S : out std_logic_vector(WIDTH-1 downto 0);
        Cout : out std_logic);
end entity addX;

architecture addX_A of addX is
  signal T : std_logic_vector(WIDTH-2 downto 0);    

  component fa
      port (A: in std_logic; 
        B: in std_logic;
        Cin: in std_logic;        
        S: out std_logic;
        C: out std_logic                
        ); 

  end component;      

begin

  -- low order add takes carry in
  faLo: fa port map (A(0), B(0), Cin, S(0), T(0));
  -- high order add generates carry out
  faHi: fa port map (A(WIDTH-1), B(WIDTH-1), T(WIDTH-2), S(WIDTH-1), Cout);            

  -- intermediate add propagates the carry bit
  genX: for i in 1 to WIDTH-2 generate
    faX: fa port map(A(i),B(i),T(i-1),S(i),T(i));
  end generate genX;
  
end architecture addX_A;

