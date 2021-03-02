library ieee;
use ieee.std_logic_1164.all;

entity controller is
	port(MOVA,MOVB,MOVC,ADD,SUB,OR0,NOT0,SHR,SHL,JMP,JZ,JC,IN0,OUT0,NOF,HALT,Cf,Zf:in std_logic:='0';
	SM:in std_logic:='1';
	IR:in std_logic_vector(7 downto 0):="00000000";
	RAA,RWBA:out std_logic_vector(1 downto 0);
	ALUS:out std_logic_vector(3 downto 0);
	WE,ALUM,FBUS,FRBUS,FLBUS,LDPC,INPC,XL,DL,LDIR,CFEN,ZFEN,INEN,OUTEN:out std_logic;
	MADD:out std_logic_vector(1 downto 0);
	SMEN:out std_logic:='1');
end controller;

architecture one of controller is
begin
process(MOVA,MOVB,MOVC,ADD,SUB,OR0,NOT0,SHR,SHL,JMP,JZ,JC,IN0,OUT0,NOF,HALT,Cf,Zf,IR,SM)
	begin
	RAA<=IR(1 downto 0);
	RWBA<=IR(3 downto 2);
	WE<=not(SM and(MOVA or MOVC or ADD or SUB or OR0 or NOT0 or SHR or SHL or IN0));
	ALUS<=IR(7 downto 4);
	ALUM<=ADD or SUB or OR0 or not0;
	FBUS<=(MOVA or MOVB or ADD or SUB or OR0 or NOT0 or OUT0 or SHR or SHL) and SM;
	FRBUS<=SHR and SM;
	FLBUS<=SHL and SM;
	LDPC<=(JZ and Zf) or (JC and Cf) or JMP;                                                             
	INPC<=(JZ and (NOT Zf)) or (JC and (not Cf)) or (not SM) or NOF;
	if SM='0' then
		MADD<="00";
	elsif(SM='1' AND MOVC='1') then
		MADD<="01";
	elsif(SM='1' AND MOVB='1') then
		MADD<="10";
	else MADD<="00";
	end if;
	XL<=MOVB;--读RAM 
	DL<=MOVC or JMP or(Zf and JZ) or (Cf and JC) or (not SM);
	LDIR<=not SM;
	CFEN<=ADD or SUB or OR0 or SHR or SHL or NOT0;
	ZFEN<=ADD or SUB or OR0 or NOT0;
	INEN<=IN0;
	OUTEN<=OUT0;
	SMEN<=not HALT;
	end process;
end one;
	
	