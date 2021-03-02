library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity p8_3_1mux is
port(S:in std_logic_vector(1 downto 0);
	in0,in1,in2:in std_logic_vector(7 downto 0);
	Y:out std_logic_vector(7 downto 0));
end p8_3_1mux;

architecture one of p8_3_1mux is
begin
	Y<=in0 when S="00" else
		in1 when S="01" else
		in2 when S="10";
end one;
	