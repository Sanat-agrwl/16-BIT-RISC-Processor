library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity czregister is
    port(
        wr : in std_logic ;
        czrin: in std_logic_vector(1 downto 0);
        czrout:out std_logic_vector(1 downto 0)
    );
end entity;

architecture czr of czregister is
	signal cz : std_logic_vector(1 downto 0);
    begin
    process(czrin)
        begin
            if(wr = '1') then 
                cz <= czrin;
				
            end if ;
    end process;
	 czrout <= cz;
end czr;