--
-- Copyright (C) 2021 Kiran Dsouza. All rights reserved.
-- 


library IEEE;
use ieee.std_logic_1164.all;

entity led is
port (inv : in std_logic_vector(3 downto 0); 
		dp : in std_logic;
		outv : out std_logic_vector(7 downto 0));  -- outv(6)<=g…outv(0)<=a
end entity led;



architecture arch of led is
begin
  process (inv)
  begin
    case inv is
      when "0000" => Outv(6 downto 0) <= "1000000";
		when "0001" => Outv(6 downto 0) <= "1111001"; 
      when "0010" => Outv(6 downto 0)<="0100100"; 
      when "0011" => Outv(6 downto 0)<="0110000"; 
      when "0100" => Outv(6 downto 0)<="0011001"; 
      when "0101" => Outv(6 downto 0)<="0010010"; 
      when "0110" => Outv(6 downto 0)<="0000010"; 
      when "0111" => Outv(6 downto 0)<="1111000"; 
      when "1000" => Outv(6 downto 0)<="0000000"; 
      when "1001" => Outv(6 downto 0)<="0010000"; 
      when "1010" => Outv(6 downto 0)<="0001000"; 
      when "1011" => Outv(6 downto 0)<="0000011";
      when "1100" => Outv(6 downto 0)<="1000110"; 
      when "1101" => Outv(6 downto 0)<="0100001"; 
      when "1110" => Outv(6 downto 0)<="0000110"; 
      when others => Outv(6 downto 0)<="0001110"; 
    end case;
  end process;
  Outv(7)<=dp;
end arch;
