--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 3-bit multiplier
--

library ieee;
use ieee.std_logic_1164.all;



entity MUL is
	port (
	x: In Std_logic_vector(2 downto 0);
	y: In Std_logic_vector(2 downto 0);
	p: Out Std_logic_vector(5 downto 0));
end MUL;



architecture arch of MUL is
	component adder
		port (Cin: in std_logic;
		A: In std_logic_vector(2 downto 0);
		B: In std_logic_vector(2 downto 0);
		S: Out std_logic_vector(2 downto 0);
		Cout: out std_logic));

	end component;


	signal D,E,F,M : std_logic_vector(2 downto 0);

begin
	Cir1: for i in 1 to 2 generate
		D(i-1)<=x(i) AND y(0);
	end generate;

	Cir2: for i in 0 to 2 generate
		E(i)<=x(i) AND y(1);
		F(i)<=x(i) AND y(2);
	end generate;
	
	p(0)<=x(0) AND y(0);

	unit1: adder
				port map(A=>E, B(2)=>’0’,B(1 downto 0)=>D, Cin=>’0’,S(0)=>P(1),S(2 downto 1)=>T(1 downto 0), Cout=>T(2));

	unit2: adder
		port map(A=>F, B=>T, Cin=>’0’,S(0)=>p(2),S(2 downto 1)=>p(4 downto 3), Cout=>p(5));

end architecture;
