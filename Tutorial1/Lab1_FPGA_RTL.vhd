library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Lab1_FPGA_RTL is
    port (
        -- Globals
        fpga_clk_50   : in  std_logic;        

        -- I/Os
        fpga_led_pio  : out std_logic_vector(5 downto 0);
		  fpga_button_pio : in std_logic_vector(3 downto 0);
		  SW : in std_logic_vector(9 downto 0)
  );
end entity Lab1_FPGA_RTL;

architecture rtl of Lab1_FPGA_RTL is

-- signal
signal blink : std_logic := '0';

begin

  process(fpga_clk_50) 
      variable counter : integer range 0 to 25000000 := 0;
      begin
        if (rising_edge(fpga_clk_50)) then
                  if (counter < 1e5* to_integer(unsigned(SW))) then
                      counter := counter + 1;
                  else
                      blink <= not blink;
                      counter := 0;
                  end if;
        end if;
  end process;

  fpga_led_pio(0) <= not fpga_button_pio(0);
  fpga_led_pio(1) <= not fpga_button_pio(1);
  fpga_led_pio(2) <= not fpga_button_pio(2);
  fpga_led_pio(3) <= not fpga_button_pio(3);
  fpga_led_pio(4) <= blink;
  fpga_led_pio(5) <= blink;

end rtl;
