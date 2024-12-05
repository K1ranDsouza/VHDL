--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- Failed attempt at a large mux, ignore.

LIBRARY ieee;               
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

entity muxNew is
generic (N:INTEGER:=256; LOG2N:INTEGER :=8);
PORT(
	A:in std_logic_vector(8*N-1 downto 0);
	sel:in std_logic_vector(log2n-1 downto 0);
	B:out std_logic_vector(7 downto 0)
);
end muxNew;

architecture arch of muxNew is
begin


gx: for i in 0 to n generate
  

--process(all)
--begin
--gx: for i in 0 to n generate
--   if i = sel then
--	   B <= A(8*i+7 downto 8*i);
--	end if;
--end generate gx;
--end process;

end arch;


