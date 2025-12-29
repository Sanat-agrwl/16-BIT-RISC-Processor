library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all; 
library ieee;
use ieee.numeric_std.all; 

--        ----------------------------------Instruction memory ----------------------
entity Instruction_Mem is 
  port (ins_init: in std_logic; 
        pc_in : in std_logic_vector(15 downto 0);   -- mem_add   
        mem_io  : out std_logic_vector(15 downto 0));  
end entity; 
architecture Behav of Instruction_mem is 
	type RAM is array(0 to ((1024)-1)) of std_logic_vector(15 downto 0);
	signal storage: RAM;
	begin
	process(ins_init,pc_in,storage) 
		begin 
			
			if (ins_init = '1') then
			 	
				storage(0) <= "0011010000000001";	--load 1 in r2
				storage(1) <= "0011011000000010";   -- load 2 inr3
			   storage(2) <= "0001001010011000";	-- ADA R1 = R2 + R3 =3
				storage(3) <= "0111011000110000";  -- sm memory(2)
				storage(4) <= "0000010011101100"; -- ADI R2 = R3 + 24
				storage(5) <= "0101010001000001"; -- SW R2 = 24 , mem_add = r1(0) + imm6(1), now storage(1) = 4;
				storage(6) <= "1100011001000010"; -- jal pc = pc + 2*imm9
				storage(7) <= "1000010000000100"; -- beq 				
				storage(8) <= "1000010000000100"; -- beq 
				storage(9) <="0000000001010010"; -- Adi  
				
			end if;
	   end process;	
			mem_io <= storage(to_integer(unsigned(pc_in)));

		
	
end Behav;
	