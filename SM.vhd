library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity SM is
	port(clk,EN:in std_logic;
			z:out std_logic);
end entity;

architecture one of SM is
	signal SM:std_logic:='0';--内部SM
begin
	process(clk,EN)
	begin
		if(clk'event and clk='0') then --负边沿
			if(EN='1') then
				z<=not SM;
				SM<=not SM;--内部取反
			else Z<=SM;--SM不变
			end if;
		end if;
	end process;
end architecture;