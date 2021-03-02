library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity PC is
	port(ld,inc,clk:in std_logic;
			a:in std_logic_vector(7 downto 0);
			c:out std_logic_vector(7 downto 0));
end entity;

architecture one of PC is
	signal address:std_logic_vector(7 downto 0):="00000000";--内部地址
begin
	process(clk)
	begin
		if(clk'event and clk='0') then
			if(inc='1' and ld='0') then
				address<=address+"00000001";
			elsif(inc='0' and ld='1') then
				address<=a;
			end if;
		end if;
	end process;
	c<=address;
end architecture;