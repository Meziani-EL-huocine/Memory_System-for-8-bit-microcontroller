library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;


entity program_memory_tb is
     
end entity;

architecture test of program_memory_tb is


-- Clock period definition
constant clk_period : time := 10 ns;
--component declaration

component program_memory
   port(   clk: in std_logic;
           address:  in std_logic_vector(7 downto 0);
           data_out: out std_logic_vector(7 downto 0));
end component;

--internal signals for testing

signal clk_tb : std_logic;
signal address_tb, data_out_tb : std_logic_vector(7 downto 0);
 
begin

-- component instantaion
DUT: program_memory port map(clk=>clk_tb,
                             address=>address_tb,
                             data_out=>data_out_tb);

-- Clock process definitions
    clk_process :PROCESS
    BEGIN
        clk_tb <= '0';
        WAIT FOR clk_period/2;
        clk_tb <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

-- stimilus process
stim:process
  begin 
     for i in 0 to 30 loop
        address_tb <= std_logic_vector(to_unsigned(i,8));
        wait for clk_period ;
     end loop;
  end process;

end architecture;
