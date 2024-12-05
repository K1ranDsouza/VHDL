--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 11/14/21
-- 
-- 50-bit adder using adder component with generic width
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 


entity add50 is
  port (A : in std_logic_vector(49 downto 0);
        B : in std_logic_vector(49 downto 0);
        Cin : in std_logic;
        S : out std_logic_vector(49 downto 0);
        Cout : out std_logic);
end entity add50;

architecture add50_A of add50 is

  component addX
    generic (
      WIDTH : in natural := 8);
    port (A : in std_logic_vector(WIDTH-1 downto 0);
          B : in std_logic_vector(WIDTH-1 downto 0);
          Cin : in std_logic;
          S : out std_logic_vector(WIDTH-1 downto 0);
          Cout : out std_logic);
  end component;      

begin

  fa50: addX
  generic map (WIDTH => 50)
  port map (A,B,Cin, S, Cout);
  
end architecture add50_A;
