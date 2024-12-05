--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 12/8/21
-- 
-- systolic array of pe units


LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 




entity toppe is
   -- N is the number of N and also the number of columns in the systolic array
	-- WIDTH is the wordsize of the array elements and the result
	generic(WIDTH	: natural  :=	8; N : natural := 4);


	port
	(
		-- Input ports
		clk   : in std_logic;
		clr   : in std_logic;
		en    : in std_logic;
		din1	: in std_logic_vector((N*WIDTH)-1 downto 0);
		din2  : in std_logic_vector((N*WIDTH)-1 downto 0);
		
		-- Output ports
		dout2	: out std_logic_vector((N*WIDTH)-1 downto 0);
		);
end toppe;





architecture a1_pe of pe is

	component pe is
		generic(WIDTH	: natural  :=	8);


		port
		(
			-- Input ports
			clk   : in std_logic;
			clr   : in std_logic;
			en    : in std_logic;
			din1	: in std_logic_vector(N*WIDTH-1 downto 0);
			din2  : in std_logic_vector(N*WIDTH-1 downto 0);
			b     : in std_logic(N-1 downto 0);
			
			-- Output ports
			dout1	: out std_logic_vector(WIDTH-1 downto 0);
			dout2 : out std_logic_vector(WIDTH-1 downto 0)
			);
	end component;

	
	-- internal signals to wire up the systolic array
	signal din1_int : std_logic_vector(WIDTH*N*N-1 downto 0);
	signal din2_int : std_logic_vector(WIDTH*N*N-1 downto 0);
	signal dout1_int : std_logic_vector(WIDTH*N*N-1 downto 0);
	signal dout2_int : std_logic_vector(WIDTH*N*N-1 downto 0);
	
	-- convenience function for vector indexing, returns start position
	-- for word at row i and column j in internals signal vectors
	function idxhi(i : integer := 0, j : integer := 0) return integer
	begin
		return WIDTH*N*i + WIDTH*(j+1)-1;
	end function;

	-- convenience function for vector indexing, returns end position
	-- for word at row i and column j in internal signal vectors
	function idxlo(i : integer := 0, j : integer := 0) return integer
	begin
		return WIDTH*N*i + WIDTH*j;
	end function;
	

begin

	-- generate elements of the systolic array
	row: for i in 0 TO N-1 generate
		col: for j in 0 to N-1 generate
			rc_pe: pe 	generic map (WIDTH => WIDTH)
							port map (clk, clr, en,
										 din1_int(idxhi(i,j) downto idxlo(i,j)),
										 din2_int(idxhi(i,j) downto idxlo(i,j)),
										 b(j),
										 dout1_int(idxhi(i,j) downto idxlo(i,j)),
										 dout2_int(idxhi(i,j) downto idxlo(i,j));
	end generate;
	
	
	
	-- wire up din1_int/din2_int for first column of the systolic array
	-- to the corresponding din1/din2 inputs
	c0: for i in 0 to N-1 generate
		din1_int(idxhi(i,0) downto idxlo(i,0)) <= din1((i+1)*WORDSIZE-1 downto i*WORDSIZE);
		din2_int(idxhi(i,0) downto idxlo(i,0)) <= din2((i+1)*WORDSIZE-1 downto i*WORDSIZE);
	end generate;
	
	-- wire up the first row other than the first column
	r0: for j in 1 to N-1 generate
			din1_int(idxhi(0,j) downto idxlo(0,j)) <= din1_int(idxhi(N-1,j-1) downto idxlo(N-1,j-1));
			din2_int(idxhi(0,j) downto idxlo(0,j)) <= din2_int(idxhi(0,j-1) downto din2_int(idxlo(0,j-1));
	end generate;
	
						;
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
