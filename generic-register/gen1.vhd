--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 9/30/21
--
-- Generic Register
--

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 


entity genreg is
	
	port (
		clk 	: in std_logic;
		A     : in std_logic_vector (1 to m);
		B		: std_logic;
		C     : in std_logic_vector (1 to m);	
		D,E	: out std_logic_vector (1 to m));
		
end entity genreg;




architecture a1 of genreg is

  -- hold value of combinational expression feeding DFF
  signal T : std_logic_vector(1 to m);
    
  component DFF
	port (clk:  in std_logic;
			D:    in std_logic;
			Q:    out std_logic);
  end component;      
  
begin

  g1 : for i in 1 to m generate
   -- first DFF fed by A
	dffx : DFF port map (clk, A(i), D(i));
	
	-- second DFF fed by combinational logic on A,B,C
	cmby : T(k) <= C(i) OR (B AND A(i));
	dffy : DFF port map (clk, T(i), E(i);
	
  end generate;
 
end architecture a1;
