library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
	port(M:in std_logic;
	sn:in std_logic_vector(3 downto 0);
	S:in std_logic_vector(7 downto 0);--R2
	D:in std_logic_vector(7 downto 0);--R1
	T:out std_logic_vector(7 downto 0);
	Cf,Zf:out std_logic);
end entity;
	
architecture one_alu of ALU is
	signal temp,a,b:std_logic_vector(8 downto 0):="000000000";
	begin 
		a<='0'&S;                                                              
		b<='0'&D;
	process(S,D,sn,M,a,b)
	begin
		if(M='1') then
			if(sn="1001") then--S+D
			T<=S+D;
			temp<=a+b;
			Cf<=temp(8);
				if(temp="000000000")--S D为0
				then Zf<='1';
				else Zf<='0';
				end if;
				
			elsif(sn="0110") then--D-S
			T<=D-S;
			temp<=b-a;
			Cf<=temp(8);
				if(temp="000000000")
				then Zf<='1';
				else Zf<='0';
				end if;
				
			elsif(sn="1011") then--D or S
			T<=S or D;
			Cf<='0';
			Zf<='0';
			
			elsif(sn="0101") then--not D
			T<=not D;
			Cf<='0';
			Zf<='0';
			
			else--out and shift
			T<=D;
			Cf<='0';
			Zf<='0';
			end if;
			
		else                    
			if(sn="1010")	then
			T<=D;
			else T<=S;            
			end if;
			Cf<='0';
			Zf<='0';
		end if;
		end process;
end architecture;
			
			