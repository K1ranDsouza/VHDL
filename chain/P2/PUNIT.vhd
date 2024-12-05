--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
--
-- Entity DC  (5-bit register, based on 1 bit register from earlier)
--

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 

entity PUNIT is 
  port (clk: in std_logic; 
        clr, en: in std_logic; 
		  b: in std_logic;
        a: in std_logic_vector(4 downto 0); 
        c: in std_logic_vector(4 downto 0); 
        t: out std_logic_vector(4 downto 0);    -- output of XOR
		  u: out std_logic_vector(4 downto 0));   -- output of DC 
end PUNIT;

 
architecture arch of PUNIT is 

   -- we instantiate DC unit
	component DC
		port (clk: in std_logic; 
        clr, en: in std_logic; 
        d: in std_logic_vector(4 downto 0); 
        e: out std_logic_vector(4 downto 0));
	end component;
	
   -- intermediate signal that is output of AND and input to XOR
   signal s : std_logic_vector(4 downto 0);

	
begin 
  
  cmb: for i in t'length-1 downto 0 generate
     s(i) <= b AND a(i);
	  t(i) <= s(i) XOR c(i);
  end generate;
 
  DC1: DC port map (clk, clr, en, a, u);
 
end arch;
