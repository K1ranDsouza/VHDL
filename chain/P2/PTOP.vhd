--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 10/28/21
--
-- Entity PTOP  : chains together 99 PUNIT blocks 
--

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 

entity PTOP is 
  port (clk: in std_logic; 
        clr, en: in std_logic; 
        a: in std_logic_vector(4 downto 0); 
		  b: in std_logic_vector(99 downto 0);  -- 99 bits wide, unlike rest
        c: in std_logic_vector(4 downto 0); 
        d: out std_logic_vector(4 downto 0);   
		  e: out std_logic_vector(4 downto 0));  
end PTOP;

 
architecture arch of PTOP is 

   -- need array of vectors for intermediate signals
   type ptop_array is array(0 to 99) of std_logic_vector(4 downto 0);

   -- we instantiate PUNIT in a chain
	component PUNIT
		 port (clk: in std_logic; 
        clr, en: in std_logic; 
		  b: in std_logic;
        a: in std_logic_vector(4 downto 0); 
        c: in std_logic_vector(4 downto 0); 
        t: out std_logic_vector(4 downto 0);
		  u: out std_logic_vector(4 downto 0));
	end component;
	
   -- intermediate signals for PUNIT outputs and inputs
   signal xa : ptop_array; -- DC input
   signal xc : ptop_array;  -- DC input
	signal xt : ptop_array;  -- DC output
	signal xu : ptop_array;  -- DC output
	
	
begin 
 
  -- create 99 PUNIT blocks 
  blk: for i in 0 to 99 generate
	  XPUNIT: PUNIT port map(clk,clr,en,B(i),xa(i),xc(i),xt(i),xu(i));
  end generate;
  
  -- connect the inputs
  xa(0) <= a;  -- xa(0) is 5 bits, matching a
  xc(0) <= c;  -- xc(0) is 5 bits, matching c

  -- chain together the PUNIT blocks
  cmb: for i in 0 to 98 generate
     xa(i+1) <= xu(i);    -- connect u output of DC block to a input of next DC block
	  xc(i+1) <= xt(i);    -- connect t output of DC block to c input of next DC block
  end generate;
  
  -- connect the outputs
  d <= xu(99);
  e <= xt(99);
  
end arch;
