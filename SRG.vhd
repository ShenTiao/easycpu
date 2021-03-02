library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SRG is               
	port(WE,clk:in std_logic;
			RA,WA:in std_logic_vector(1 downto 0);
			I:in std_logic_vector(7 downto 0);
			S,D:out std_logic_vector(7 downto 0);
			aa,bb,cc:out std_logic_vector(7 downto 0));
end entity;

architecture one of SRG is
	signal A,B,C:std_logic_vector(7 downto 0):="00000000";
begin
	process(clk,WE,RA,WA)
	begin
	if(WE='0' and falling_edge(clk)) then
		if(WA="00") then A<=I;
			elsif(WA="01") then B<=I;
				else C<=I;
		end if;
	end if;
	end process;
	with RA select
	S<=A when "00",
	 B when "01",
	 C when others;
	with WA select
	D<=A when "00",
	 B when "01",
	 C when others;
	 
	aa<=A;
	bb<=B;
	cc<=C;
end architecture;
