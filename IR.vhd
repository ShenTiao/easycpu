library ieee;
use ieee.std_logic_1164.all;
entity IR is
port(input:in std_logic_vector(7 downto 0);
	clock,ld:in std_logic;
	output_a,output_b:out std_logic_vector(3 downto 0);
	R:out std_logic_vector(7 downto 0));
end IR;
architecture one of IR is
begin
	process(clock,input,ld)
begin
	if (clock'event and clock='0' and ld='1') then
		output_a<=input(7 downto 4);
		output_b<=input(3 downto 0);
		R<=input;
	end if;
end process;

end one;