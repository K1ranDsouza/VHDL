--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- Generic Adder (default width 4 bits)
--

library ieee;
Use ieee.std_logic_1164.all;
USE ieee.std_logic_arith.ALL;
use ieee.numeric_std.all;

entity adder is
Generic (N:integer :=4);
port ( Cin: in std_logic;
A: In Std_logic_vector(N-1 downto 0);
B: In Std_logic_vector(N-1 downto 0);
S: Out Std_logic_vector(N-1 downto 0); 
Cout: out std_logic
);
end adder;


architecture adder_structure of adder is
	signal T: Std_logic_vector(N downto 0);

		component fulladd
			port( A, B, Cin : in STD_LOGIC;
			S, C : out STD_LOGIC );
	end component;

begin
Cir1: for i in 0 to N-1 generate
stage0: fulladd 
port map (A=>A(i), B=>B(i), Cin=>T(i), S=>S(i), 
C=>T(i+1));
End generate;
T(0)<=Cin;
Cout<=T(N);
end adder_structure;
