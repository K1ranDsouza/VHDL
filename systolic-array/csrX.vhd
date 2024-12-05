--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 12/3/21
-- CSR block for Generic width (default 8).
-- The b-vector is shifted in one bit at a time.
-- Set ctr1 to 0 when shifting b-vector in.

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 



entity csrX is 

 generic (WIDTH : in natural := 8);
	 
  port (	clk : in std_logic;
			b: in std_logic; 
			ctr1 : in std_logic;
			en1 : in std_logic;
			clr1: in std_logic;
			cout : out std_logic
        ); 
end csrX; 



architecture a1_csrX of csrX is


  component mux_2_to_1
	port (cin_0, cin_1: in std_logic;
		s : in std_logic;
		cout : out std_logic
		);
  end component;      


	component reg_aclr_en_1bit is
	port (clk: in std_logic;
        clr, en: in std_logic;
        d: in std_logic;
        e: out std_logic
        );
	end component;
	
	-- intermediate signals
	signal d : std_logic_vector(0 to WIDTH);

begin

with SEL select
   B <= 
gx: for in A(7 downto 0) when "00",
        A(15 downto 8) when "01",
--A(23 downto 16) when "10",
--A(31 downto 24) when "11",
--(others=>'0') when others;
--end 4

  -- chain of 1-bit registers
  genX: for i in 0 to WIDTH-1 generate
    reX: reg_aclr_en_1bit port map(clk,clr1,en1,d(i),d(i+1));
  end generate genX;

  -- mux to drive first register in chain
  mux1: mux_2_to_1 port map (d(WIDTH), b, ctr1, d(0));

  -- output of register chain is csrX entity output
  cout <= d(WIDTH);
  
end architecture a1_csrX;


