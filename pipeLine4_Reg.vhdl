library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pipeline4 is port(
           
  data63_9  : in std_logic_vector(54 downto 0);            -- ins(15-9) + pc + dataA1 + dataA2
  data8_0 : in std_logic_vector(8 downto 0);               -- these 9 bits are shifted and usd in LM
  data79_64 : in std_logic_vector(15 downto 0);            -- alu output
  data81_80 : in std_logic_vector(1 downto 0);             -- cz of alu1
  data84_82 : in std_logic_vector(2 downto 0);             -- 3 bits used only in LM 
  wr : in std_logic;
  data_out : out std_logic_vector(84 downto 0);
  clk : in std_logic
);
            end entity;

architecture Struct of pipeline4 is 
        signal data : std_logic_vector(84 downto 0) := (others=>'0');
        begin
          process(data63_9,data8_0,data79_64,data81_80,data84_82,clk,wr)
          begin
           
            if(rising_edge(clk) and wr = '1') then
            data(63 downto 9) <= data63_9;
            data(8 downto 0) <= data8_0;
            data(79 downto 64) <= data79_64;
            data(81 downto 80) <= data81_80;
            data(84 downto 82) <= data84_82;
            end if;
          end process;
          process(data)
          begin
                   
          
            data_out <= data;
          end process;
end architecture;
