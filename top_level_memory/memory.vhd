library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity memory is
    port(
        address        : in std_logic_vector(7 downto 0);
        data_in        : in std_logic_vector(7 downto 0);
        clk            : in std_logic;
        reset          : in std_logic;
        rw             : in std_logic;
        data_out       : out std_logic_vector(7 downto 0);
        in_port_00     : in std_logic_vector(7 downto 0);
        in_port_01     : in std_logic_vector(7 downto 0);
        in_port_02     : in std_logic_vector(7 downto 0);
        in_port_03     : in std_logic_vector(7 downto 0);
        in_port_04     : in std_logic_vector(7 downto 0);
        in_port_05     : in std_logic_vector(7 downto 0);
        in_port_06     : in std_logic_vector(7 downto 0);
        in_port_07     : in std_logic_vector(7 downto 0);
        in_port_08     : in std_logic_vector(7 downto 0);
        in_port_09     : in std_logic_vector(7 downto 0);
        in_port_10     : in std_logic_vector(7 downto 0);
        in_port_11     : in std_logic_vector(7 downto 0);
        in_port_12     : in std_logic_vector(7 downto 0);
        in_port_13     : in std_logic_vector(7 downto 0);
        in_port_14     : in std_logic_vector(7 downto 0);
        in_port_15     : in std_logic_vector(7 downto 0);
        port_out_00    : out std_logic_vector(7 downto 0);
        port_out_01    : out std_logic_vector(7 downto 0);
        port_out_02    : out std_logic_vector(7 downto 0);
        port_out_03    : out std_logic_vector(7 downto 0);
        port_out_04    : out std_logic_vector(7 downto 0);
        port_out_05    : out std_logic_vector(7 downto 0);
        port_out_06    : out std_logic_vector(7 downto 0);
        port_out_07    : out std_logic_vector(7 downto 0);
        port_out_08    : out std_logic_vector(7 downto 0);
        port_out_09    : out std_logic_vector(7 downto 0);
        port_out_10    : out std_logic_vector(7 downto 0);
        port_out_11    : out std_logic_vector(7 downto 0);
        port_out_12    : out std_logic_vector(7 downto 0);
        port_out_13    : out std_logic_vector(7 downto 0);
        port_out_14    : out std_logic_vector(7 downto 0);
        port_out_15    : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of memory is

    -- Signals for internal use
    signal data_out_mux: std_logic_vector(7 downto 0);
    signal address_p, address_d: std_logic_vector(7 downto 0);
    signal rom_out,ram_out:std_logic_vector(7 downto 0);  
    signal output_port_addr: std_logic_vector(7 downto 0);
   -- signal data_in_d, data_in_o: std_logic_vector(7 downto 0);
   -- signal rw_d, rw_o: std_logic;
    --signal mux_out_signal: std_logic_vector(7 downto 0);
  -- signal port_out_00_o, port_out_01_o: std_logic_vector(7 downto 0);

    -- Program memory component declaration
    component program_memory
        port(
            clk      : in std_logic;
            address  : in std_logic_vector(7 downto 0);
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Data memory component declaration
    component data_memory
        port(
            clk      : in std_logic;
            rw       : in std_logic;
            address  : in std_logic_vector(7 downto 0);
            data_in  : in std_logic_vector(7 downto 0);
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Output port component declaration
    component output_port
        port(
            address      : in std_logic_vector(7 downto 0);
            data_in      : in std_logic_vector(7 downto 0);
            clk          : in std_logic;
            reset        : in std_logic;
            wr           : in std_logic;
            port_out_00  : out std_logic_vector(7 downto 0);
            port_out_01  : out std_logic_vector(7 downto 0);
            port_out_02  : out std_logic_vector(7 downto 0);
            port_out_03  : out std_logic_vector(7 downto 0);
            port_out_04  : out std_logic_vector(7 downto 0);
            port_out_05  : out std_logic_vector(7 downto 0);
            port_out_06  : out std_logic_vector(7 downto 0);
            port_out_07  : out std_logic_vector(7 downto 0);
            port_out_08  : out std_logic_vector(7 downto 0);
            port_out_09  : out std_logic_vector(7 downto 0);
            port_out_10  : out std_logic_vector(7 downto 0);
            port_out_11  : out std_logic_vector(7 downto 0);
            port_out_12  : out std_logic_vector(7 downto 0);
            port_out_13  : out std_logic_vector(7 downto 0);
            port_out_14  : out std_logic_vector(7 downto 0);
            port_out_15  : out std_logic_vector(7 downto 0)
        );
    end component;

     

begin
     address_d <= address(7 downto 0) when ((to_integer(unsigned(address)) >= 128) and
                            (to_integer(unsigned(address)) <= 223)) else
                           "00000000";
 
       address_p <= address(7 downto 0) when ((to_integer(unsigned(address)) >= 0) and
                            (to_integer(unsigned(address)) <= 127))  else  
                                 "00000000";
      output_port_addr <= address(7 downto 0) when ((to_integer(unsigned(address)) >= 224) and
                           (to_integer(unsigned(address)) <= 239))  else  
                                "00000000";  

    

    -- Data memory instantiation
    data_mem: data_memory
        port map(
            clk      => clk,
            rw       => rw,
            address  => address_d,
            data_in  => data_in,
            data_out => ram_out
        );

    -- Program memory instantiation
    prog_mem: program_memory
        port map(
            clk      => clk,
            address  => address_p,
            data_out => rom_out
        );

    -- Output port instantiation
    out_port: output_port
        port map(
            address      => output_port_addr,
            data_in      => data_in,
            clk          => clk,
            reset        => reset,
            wr           => rw,
            port_out_00  => port_out_00,
            port_out_01  => port_out_01,
            port_out_02  => port_out_02,
            port_out_03  => port_out_03,
            port_out_04  => port_out_04,
            port_out_05  => port_out_05,
            port_out_06  => port_out_06,
            port_out_07  => port_out_07,
            port_out_08  => port_out_08,
            port_out_09  => port_out_09,
            port_out_10  => port_out_10,
            port_out_11  => port_out_11,
            port_out_12  => port_out_12,
            port_out_13  => port_out_13,
            port_out_14  => port_out_14,
            port_out_15  => port_out_15
        );

   --- Multiplexer Output  
      data_out_mux <= rom_out when ((to_integer(unsigned(address)) >= 0) and
                            (to_integer(unsigned(address)) <= 127))  else

           ram_out  when ((to_integer(unsigned(address)) >= 128) and
                            (to_integer(unsigned(address)) <= 223))  else

           in_port_00   when (address=x"F0")           else
           in_port_01   when (address=x"F1")           else
           in_port_02   when (address=x"F2")           else
           in_port_03   when (address=x"F3")           else
           in_port_04   when (address=x"F4")           else
           in_port_05   when (address=x"F5")           else
           in_port_06   when (address=x"F6")           else
           in_port_07   when (address=x"F7")           else
           in_port_08   when (address=x"F8")           else
           in_port_09   when (address=x"F9")           else
           in_port_10   when (address=x"FA")           else
           in_port_11   when (address=x"FB")           else
           in_port_12   when (address=x"FC")           else
           in_port_13   when (address=x"FD")           else
           in_port_14   when (address=x"FE")           else
           in_port_15   when (address=x"FF")  
           else x"00";
     
 --Data output logic
    process(clk, reset)
    begin
        if reset = '0' then
            data_out <= (others => '0');
        elsif rising_edge(clk) then
        data_out <= data_out_mux;
        end if;
    end process;

end architecture;

