--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 12/8/21
-- 
-- pe unit


LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 

entity pe is
	generic(WIDTH	: natural  :=	8);


	port
	(
		-- Input ports
		clk   : in std_logic;
		clr   : in std_logic;
		en    : in std_logic;
		din1	: in std_logic_vector(WIDTH-1 downto 0);
		din2  : in std_logic_vector(WIDTH-1 downto 0);
		ctr   : in std_logic;
		
		-- Output ports
		dout1	: out std_logic_vector(WIDTH-1 downto 0);
		dout2 : out std_logic_vector(WIDTH-1 downto 0)
		);
end pe;





architecture a1_pe of pe is

  component addX
    generic (
      WIDTH : in natural := 8);
    port (A : in std_logic_vector(WIDTH-1 downto 0);
          B : in std_logic_vector(WIDTH-1 downto 0);
          Cin : in std_logic;
          S : out std_logic_vector(WIDTH-1 downto 0);
          Cout : out std_logic);
  end component;      
  
  component regX is
  generic (WIDTH : natural := 8);
  port (clk: in std_logic;
        clr, en: in std_logic;
        d: in std_logic_vector(WIDTH-1 downto 0);
        e: out std_logic_vector(WIDTH-1 downto 0)
        );
  end component;

  
	-- temp signals
	signal add_in : std_logic_vector(WIDTH-1 downto 0);
	signal add_out : std_logic_vector(WIDTH-1 downto 0);
	signal tmp : std_logic; -- unused carry out from adder
	
begin

   pe_add:  addX
					generic map(WIDTH => WIDTH)
					port map(din2, add_in, '0', add_out, tmp);
					
	pe_reg1:  regX
					generic map(WIDTH => WIDTH)
					port map(clk, clr, en, din1, dout1);
					

	pe_reg2:  regX
					generic map(WIDTH => WIDTH)
					port map(clk, clr, en, add_out, dout2);
					
					
   gen1: for i in WIDTH-1 downto 0 generate
	   add_in(i) <= din1(i) and ctr;
	end generate gen1;


end a1_pe;
