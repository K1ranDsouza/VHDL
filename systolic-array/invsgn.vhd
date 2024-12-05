--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 12/8/21
-- 
-- invsgn component - invert sign by computing two's complement
--


LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 




entity invsgn is 
	generic (WIDTH : in natural := 8);
   port (din :  in std_logic_Vector(WIDTH-1 downto 0);
			dout : out std_logic_vector(WIDTH-1 downto 0)); 
end invsgn;




architecture a1_invsgn of invsgn is

  -- adder for two's complement
  component addX
    generic (
      WIDTH : in natural := 8);
    port (A : in std_logic_vector(WIDTH-1 downto 0);
          B : in std_logic_vector(WIDTH-1 downto 0);
          Cin : in std_logic;
          S : out std_logic_vector(WIDTH-1 downto 0);
          Cout : out std_logic);
  end component;      
  
  
	-- temp/internal signals
	signal Z : std_logic_vector(WIDTH-1 downto 0);  -- zero-vector input to adder
	signal V : std_logic_vector(WIDTH-1 downto 0);  -- one's complement of din
	signal tmp : std_logic; -- unused carry out from adder
	

	
begin
	
	-- create a zero-vector as input to adder
   gen0 : for i in WIDTH-1 downto 0 generate
	   Z(i) <= '0';
		V(i) <= din(i) xor '1';
	end generate;

   invsgn_add:  addX
					generic map(WIDTH => WIDTH)
					port map(V, Z, '1', dout, tmp);

end a1_invsgn;
