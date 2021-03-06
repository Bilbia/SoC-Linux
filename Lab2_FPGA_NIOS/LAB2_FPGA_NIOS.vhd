library IEEE;
use IEEE.std_logic_1164.all;

entity LAB2_FPGA_NIOS is
    port (
        -- Gloabals
        fpga_clk_50        : in  std_logic;             -- clock.clk

        -- I/Os
        fpga_led_pio       : out std_logic_vector(5 downto 0);
		  SW    : in std_logic_vector(9 downto 0);
		  stepmotor_pio      : out std_logic_vector(3 downto 0)
  );
end entity LAB2_FPGA_NIOS;

architecture rtl of LAB2_FPGA_NIOS is


component niosLab2 is
  port (
		buttons_export   : in  std_logic_vector(9 downto 0) := (others => 'X'); -- export
		clk_clk          : in  std_logic                    := 'X';             -- clk
		leds_export      : out std_logic_vector(5 downto 0);                    -- export
		reset_reset_n    : in  std_logic                    := 'X';             -- reset_n
		stepmotor_export : out std_logic_vector(3 downto 0)                     -- export
  );
end component niosLab2;

begin

u0 : component niosLab2
  port map (
		buttons_export   => SW,   --   buttons.export
		clk_clk          => fpga_clk_50,          --       clk.clk
		leds_export      => fpga_led_pio,      --      leds.export
		reset_reset_n    => '1',    --     reset.reset_n
		stepmotor_export => stepmotor_pio  -- stepmotor.export
  );


end rtl;