library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pipeline2 is port(
  data_in : in std_logic_vector(31 downto 0);
  wr : in std_logic;
  data_out : out std_logic_vector(31 downto 0);
  clk : in std_logic
);
      end entity;

architecture Struct of pipeline2 is 
        signal data : std_logic_vector(31 downto 0) := (others=>'0');
        begin
          process(data_in,clk,wr)
          begin
            
            if(rising_edge(clk) and wr = '1') then
              data <= data_in;
            end if;
          end process;
          
--          

            data_out <= data;
--        
        end architecture;