--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 11/18/21
--
-- 3-bit multiplier
--

library ieee;
use ieee.std_logic_1164.all;

entity MUL is
	port (
	x: in Std_logic_vector(2 downto 0);
	y: in Std_logic_vector(2 downto 0);
	p: out Std_logic_vector(5 downto 0));
end MUL;



architecture arch of MUL is
	component adder
		generic (N:integer := 4);
		port (Cin: in std_logic;
		A: in std_logic_vector(2 downto 0);
		B: in std_logic_vector(2 downto 0);
		S: out std_logic_vector(2 downto 0);
		Cout: out std_logic);
	end component;


	signal D : std_logic_vector(1 downto 0);
	
	signal E,F,T : std_logic_vector(2 downto 0);

	signal B1,B2,S1,S2 : std_logic_vector(2 downto 0);
	
	
begin
	Cir1: for i in 1 to 2 generate
		D(i-1)<=x(i) AND y(0);
	end generate;

	Cir2: for i in 0 to 2 generate
		E(i)<=x(i) AND y(1);
		F(i)<=x(i) AND y(2);
	end generate;
	
	p(0)<=x(0) AND y(0);

	B1(2) <= '0';
	B1(1) <= D(1);
	B1(0) <= D(0);
	
	p(1) <= S1(0);
	T(1) <= S1(2);
	T(0) <= S1(1);
	
	unit1: adder
	generic map(N => 3)
	port map(Cin => '0', A => E, B => B1, S => S1, Cout => T(2));

	p(2) <= S2(0);
	p(3) <= S2(1);
	p(4) <= S2(2);
	
	unit2: adder
	generic map(N => 3)
	port map(Cin => '0', A => F, B => T, S => S2, Cout=>p(5));

end architecture;
