--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 9/30/21
--
-- Entity DC  (5-bit register, based on 1 bit register from earlier)
--

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.std_logic_arith.ALL; 
entity DC is 
  port (clk: in std_logic; 
        clr, en: in std_logic; 
        d: in std_logic_vector(4 downto 0); 
        e: out std_logic_vector(4 downto 0)); 
end DC;

 
architecture arch of DC is 
begin 
  process(clk, clr, en) 
  begin 
    if (clr='1') then 
      e<="00000"; 
    else 
      if (clk'event and clk='1' and en='1' ) then 
        e<= d; 
      end if; 
      
    end if; 
  end process;
end arch;
