library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity shift is
	port(fbus,flbus,frbus:in std_logic;
	A:in std_logic_vector(7 downto 0);
	w:out std_logic_vector(7 downto 0);
	Cf:out std_logic);
end entity;

architecture one_shift of shift is
	begin
	process(fbus,flbus,frbus)
		begin
		if(fbus='1') then
			if(flbus='1') then
				w<=A(6 downto 0)&A(7);
				Cf<=A(7);
			elsif(frbus='1') then
				w<=A(0)&A(7 downto 1);
				Cf<=A(0);
			else
				w<=A;
				Cf<='0';
		end if;
		else
		w<="ZZZZZZZZ";
		Cf<='0';
	end if;
	end process;
end architecture;
			