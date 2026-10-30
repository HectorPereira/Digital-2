library ieee;
use ieee.std_logic_1164.all;

-- Parte A: contador de 10 bits que avanza una vez por segundo.
-- clk: reloj de 100 MHz de la FPGA (pin H4).
-- rst: dip-switch activo en alto.
-- LED(0): bit menos significativo del contador.
entity top_A is
    port (
        clk        : in  std_logic;
        rst        : in  std_logic;
        LED        : out std_logic_vector(9 downto 0);
        AR_3V3_EN  : out std_logic
    );
end entity top_A;

architecture structural of top_A is
    signal en_1hz : std_logic;
begin
    -- Habilitacion de la alimentacion de 3,3 V del shield UTEC.
    AR_3V3_EN <= '0';

    U_DIV : entity work.divisor(rtl)
        generic map (
            MAX => 100_000_000
        )
        port map (
            clk => clk,
            rst => rst,
            en  => en_1hz
        );

    U_CNT : entity work.contador(rtl)
        generic map (
            N => 10
        )
        port map (
            clk => clk,
            rst => rst,
            en  => en_1hz,
            q   => LED
        );
end architecture structural;
