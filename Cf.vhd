library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Cf is
	port(
	X,EN,clk:in std_logic;
	Cf:out std_logic);
end entity;

architecture bhv of Cf is
begin
process(CLK,EN)
begin
	if(CLK'event and CLK='0' and EN='1') then Cf<=X;
	end if;
end process;
end architecture;