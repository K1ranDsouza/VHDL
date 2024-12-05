--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 12/3/21
-- CSR block


LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 


entity csr is 
  port (	b: in std_logic_Vector(9 downto 0); 
			ctr1 : std_logic;
			en1 : std_logic;
			clr1: std_logic
        ); 
end csr; 

architecture a1_csr of csr is


  component mux_2_to_1
	port (cin_0, cin_1: in std_logic;
		s : in std_logic;
		cout : out std_logic
		);
  end component;      


	entity reg_aclr_en_1bit is
	port (clk: in std_logic;
        clr, en: in std_logic;
        d: in std_logic;
        e: out std_logic
        );
	end entity;



begin

	

  
end architecture a1_csr;


