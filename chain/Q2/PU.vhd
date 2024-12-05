LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
use ieee.numeric_std.all;


entity PU is
  port (B: in std_logic;
        C: in std_logic_vector(3 downto 0);
        T: out std_logic_vector(3 downto 0));
end PU;


architecture arch of PU is 
begin
  Cir: for i in 0 to 3 generate
    T(i)<=B AND C(i);
  end generate;
end arch;


