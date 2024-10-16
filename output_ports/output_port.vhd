library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity output_port is
  port(  address,data_in: in std_logic_vector(7 downto 0);
         clk, reset, wr: in std_logic;
         port_out_00: out std_logic_vector(7 downto 0);
         port_out_01: out std_logic_vector(7 downto 0);
         port_out_02: out std_logic_vector(7 downto 0);
         port_out_03: out std_logic_vector(7 downto 0);
         port_out_04: out std_logic_vector(7 downto 0);
         port_out_05: out std_logic_vector(7 downto 0);
         port_out_06: out std_logic_vector(7 downto 0);
         port_out_07: out std_logic_vector(7 downto 0);
         port_out_08: out std_logic_vector(7 downto 0);
         port_out_09: out std_logic_vector(7 downto 0);
         port_out_10: out std_logic_vector(7 downto 0);
         port_out_11: out std_logic_vector(7 downto 0);
         port_out_12: out std_logic_vector(7 downto 0);
         port_out_13: out std_logic_vector(7 downto 0);
         port_out_14: out std_logic_vector(7 downto 0);
         port_out_15: out std_logic_vector(7 downto 0));
end entity;

architecture behavior of output_port is 

begin

-- port_out_00 description : ADDRESS x"E0"
p00:process(clk,reset)
begin
  if(reset='0') then 
     port_out_00 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E0" and wr='1') then 
        port_out_00 <= data_in;
     end if;
  end if;
end process;

-- port_out_01 description : ADDRESS x"E1"
p01:process(clk,reset)
begin
  if(reset='0') then 
     port_out_01 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E1" and wr='1') then 
        port_out_01 <= data_in;
     end if;
  end if;
end process;

-- port_out_02 description : ADDRESS x"E2"
p02:process(clk,reset)
begin
  if(reset='0') then 
     port_out_02 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E2" and wr='1') then 
        port_out_02 <= data_in;
     end if;
  end if;
end process;

-- port_out_03 description : ADDRESS x"E3"
p03:process(clk,reset)
begin
  if(reset='0') then 
     port_out_03 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E3" and wr='1') then 
        port_out_03 <= data_in;
     end if;
  end if;
end process;

-- port_out_04 description : ADDRESS x"E4"
p04:process(clk,reset)
begin
  if(reset='0') then 
     port_out_04 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E4" and wr='1') then 
        port_out_04 <= data_in;
     end if;
  end if;
end process;

-- port_out_05 description : ADDRESS x"E5"
p05:process(clk,reset)
begin
  if(reset='0') then 
     port_out_05 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E5" and wr='1') then 
        port_out_05 <= data_in;
     end if;
  end if;
end process;

-- port_out_06 description : ADDRESS x"E6"
p06:process(clk,reset)
begin
  if(reset='0') then 
     port_out_06 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E6" and wr='1') then 
        port_out_06 <= data_in;
     end if;
  end if;
end process;

-- port_out_07 description : ADDRESS x"E7"
p07:process(clk,reset)
begin
  if(reset='0') then 
     port_out_07 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E7" and wr='1') then 
        port_out_07 <= data_in;
     end if;
  end if;
end process;

-- port_out_08 description : ADDRESS x"E8"
p08:process(clk,reset)
begin
  if(reset='0') then 
     port_out_08 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E8" and wr='1') then 
        port_out_08 <= data_in;
     end if;
  end if;
end process;

-- port_out_09 description : ADDRESS x"E9"
p09:process(clk,reset)
begin
  if(reset='0') then 
     port_out_09 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"E9" and wr='1') then 
        port_out_09 <= data_in;
     end if;
  end if;
end process;

-- port_out_10 description : ADDRESS x"EA"
p10:process(clk,reset)
begin
  if(reset='0') then 
     port_out_10 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"EA" and wr='1') then 
        port_out_10 <= data_in;
     end if;
  end if;
end process;

-- port_out_11 description : ADDRESS x"EB"
p11:process(clk,reset)
begin
  if(reset='0') then 
     port_out_11 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"EB" and wr='1') then 
        port_out_11 <= data_in;
     end if;
  end if;
end process;

-- port_out_12 description : ADDRESS x"EC"
p12:process(clk,reset)
begin
  if(reset='0') then 
     port_out_12 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"EC" and wr='1') then 
        port_out_12 <= data_in;
     end if;
  end if;
end process;

-- port_out_13 description : ADDRESS x"ED"
p13:process(clk,reset)
begin
  if(reset='0') then 
     port_out_13 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"ED" and wr='1') then 
        port_out_13 <= data_in;
     end if;
  end if;
end process;

-- port_out_14 description : ADDRESS x"EE"
p14:process(clk,reset)
begin
  if(reset='0') then 
     port_out_14 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"EE" and wr='1') then 
        port_out_14 <= data_in;
     end if;
  end if;
end process;

-- port_out_15 description : ADDRESS x"EF"
p15:process(clk,reset)
begin
  if(reset='0') then 
     port_out_15 <= x"00";
  elsif(clk'event and clk='1') then 
     if(address=x"EF" and wr='1') then 
        port_out_15 <= data_in;
     end if;
  end if;
end process;

end architecture;
                                           
