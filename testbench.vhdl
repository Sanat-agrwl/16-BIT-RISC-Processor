LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end entity testbench;

architecture bhv of testbench is
component pipeline_main is
Port (
    clk:in std_logic;
    Instruction:out std_logic_vector(19 downto 0)
    );
end component pipeline_main;

signal clk_40: std_logic := '1';
signal instr : std_logic_vector(19 downto 0); 
constant clk_period : time := 40000 ps;
begin
	
	dut_instance: pipeline_main port map( clk_40, instr);
	process

	begin
	LOOP
		clk_40 <= '0';
		wait for 20000 ps;
	  clk_40 <='1';
	  wait for 20000 ps;
	  if(NOW > 800000 ps) then wait; end if;
	  end loop;
   end process;	

end bhv;
	

