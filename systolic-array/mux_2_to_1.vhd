--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 12/3/21
-- mux_2_to_1 (from lecture, modified from 8-bit to 1-bit)


LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 

entity mux_2_to_1 is
port (cin_0, cin_1: in std_logic;
		s : in std_logic;
		cout : out std_logic
		);
end mux_2_to_1;


architecture mux_2_to_1_arch of mux_2_to_1 is
begin
	cout <= cin_0 when (s = '0') else cin_1;
end mux_2_to_1_arch;
