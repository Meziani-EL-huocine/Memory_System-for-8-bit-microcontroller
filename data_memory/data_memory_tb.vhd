library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity data_memory_tb is 
    
end entity;

architecture test of data_memory_tb is 

-- Clock period definition
constant clk_period : time := 10 ns;

--component declaration 
component data_memory port ( clk: in std_logic;
                             rw:  in std_logic;
                             address, data_in: in std_logic_vector(7 downto 0);
                             data_out: out std_logic_vector(7 downto 0));
end component;

--declaring signals for test
signal clk_tb, rw_tb: std_logic;
signal address_tb, data_in_tb:  std_logic_vector(7 downto 0);
signal data_out_tb:  std_logic_vector(7 downto 0);

begin
--component instantiation
DUT: data_memory port map(clk=>clk_tb, rw=>rw_tb,
                           address=>address_tb, data_in=>data_in_tb,
                           data_out=>data_out_tb);

--clk generation 
clk_gen: process
  begin 
     clk_tb<= '0';
     wait for clk_period/2;
     clk_tb<= '1';
     wait for clk_period/2;
  end process;

--stimuls process
stim: process
  begin 
    
   
   for i in 128 to 140 loop
     rw_tb<='0';
     wait for clk_period;
     data_in_tb <= std_logic_vector(to_unsigned(i,8));
     address_tb <= std_logic_vector(to_unsigned(i,8));
     wait for clk_period;
     rw_tb<='1';
     address_tb <= std_logic_vector(to_unsigned(i,8));  
     wait for clk_period;
   end loop;
   wait;
end process;



end architecture;
