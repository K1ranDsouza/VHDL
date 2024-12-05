--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 12/3/21
-- CSR entity with size 512 using a generic CSR component.
-- The b-vector is shifted in one bit at a time.
-- Set ctr1 to 0 when shifting b-vector in.


LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 

entity csr512 is 
  port (	clk : in std_logic;
			b: in std_logic; 
			ctr1 : in std_logic;
			en1 : in std_logic;
			clr1: in std_logic;
			cout : out std_logic
        ); 
end csr512; 



architecture a1_csr512 of csr512 is

	component csrX is 

	generic (WIDTH : in natural := 8);
		 
	port (	clk : in std_logic;
				b: in std_logic; 
				ctr1 : in std_logic;
				en1 : in std_logic;
				clr1: in std_logic;
				cout : out std_logic
			  ); 
	end component; 


begin
   -- instantiate generic CSR component with width 512
	csrX512: csrX 	generic map (WIDTH => 512)
						port map(clk, b, ctr1, en1, clr1, cout);
						
end architecture a1_csr512;


