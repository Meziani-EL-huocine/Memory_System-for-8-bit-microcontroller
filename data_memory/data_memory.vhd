library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity data_memory is 
    port( clk: in std_logic;
          rw:  in std_logic;
          address, data_in: in std_logic_vector(7 downto 0);
          data_out: out std_logic_vector(7 downto 0));
end entity;


architecture behavior of data_memory is 

signal EN: std_logic;

--creating of a new type to modelize the data memory
type r_w_memory is array(128 to 223) of std_logic_vector(7 downto 0);

--daclaring of program memory
signal program_memory: r_w_memory;

begin 
--enabling pocess
enable: process(address)
begin
  if(to_integer(unsigned(address))>=128 and to_integer(unsigned(address))<=223) then
      EN<='1';
  else 
      EN<='0';
  end if;
end process;

--memory process
memory: process(clk)
begin 
 if(clk'event and clk='1') then 
   if(EN='1' and rw='1') then 
        program_memory(to_integer(unsigned(address))) <= data_in;
   elsif (En='1' and rw='0') then 
        data_out <= program_memory(to_integer(unsigned(address)));
   end if;
 end if;
end process;



end architecture;