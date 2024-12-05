--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 
-- 10/5S/21
--
-- 3-bit counter that counts up and down.
-- Uses explicit labels and case statement so that the counting sequence can
-- be changed to be fully flexible and does not have to go from 0 to 7 in order. 
--
-- Compiles cleanly with Quartus Prime.
--


LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;

-- Counter that counts up or down between 0 and 7. If up is 1, it counts up,
-- otherwise it counts down. It wraps around from 0 to 7 and from 7 to 0.
entity updncounter is
  port (
    clk   : in std_logic;   
    re    : in std_logic;
    up    : in std_logic;
    CNT   : out std_logic_vector(2 downto 0));
end entity updncounter;


architecture a1 of updncounter is

  -- 8 states of 3-bit counter
  type state_type is (c0,c1,c2,c3,c4,c5,c6,c7);

  -- present state for counter
  signal current_s : state_type;
  signal next_s : state_type;

  
begin

  state_memory: process(clk, re)
  begin
    if (re='0') then
      current_s <= c0;
    elsif (clk'event and clk='1') then
      current_s <= next_s;
    end if;
  end process;


  output_logic: process(current_s)
  begin
    case(current_s) is
      when c0 => CNT <= "000";
      when c1 => CNT <= "001";
      when c2 => CNT <= "010";
      when c3 => CNT <= "011";
      when c4 => CNT <= "100";
      when c5 => CNT <= "101";
      when c6 => CNT <= "110";
      when c7 => CNT <= "111";
      when others => CNT <= "000";
    end case;
  end process;

  
  next_state_logic: process(current_s,up)
  begin
    case(current_s) is
      when c0 => if (up='1') then
                   next_s <= c1;
                 else
                   next_s <= c7;
                 end if;       
      when c1 => if (up='1') then
                   next_s <= c2;
                 else
                   next_s <= c0;
                 end if;
      when c2 => if (up='1') then
                   next_s <= c3;
                 else
                   next_s <= c1;
                 end if;
                 next_s <= c3;
      when c3 => if (up='1') then
                   next_s <= c4;
                 else
                   next_s <= c2;
                 end if;
      when c4 =>  if (up='1') then
                    next_s <= c5;
                  else
                    next_s <= c3;
                  end if;
      when c5 => if (up='1') then
                   next_s <= c6;
                 else
                   next_s <= c4;
                 end if;
      when c6 => if (up='1') then
                   next_s <= c7;
                 else
                   next_s <= c5;
                 end if;
      when c7 => if (up='1') then
                   next_s <= c0;
                 else
                   next_s <= c6;
                 end if;
      when others => next_s <= c0;
    end case;
  end process;
  
end architecture a1;
