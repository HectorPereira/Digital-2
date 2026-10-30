library ieee;
use ieee.std_logic_1164.all;

-- Genera un pulso de habilitacion de un ciclo cada MAX flancos.
-- Todos los bloques mantienen el reloj principal.
entity divisor is
    generic (
        MAX : positive := 100_000_000
    );
    port (
        clk : in  std_logic;
        rst : in  std_logic;
        en  : out std_logic
    );
end entity divisor;

architecture rtl of divisor is
    signal cuenta : natural range 0 to MAX - 1 := 0;
    signal en_i   : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                cuenta <= 0;
                en_i   <= '0';
            elsif cuenta = MAX - 1 then
                cuenta <= 0;
                en_i   <= '1';
            else
                cuenta <= cuenta + 1;
                en_i   <= '0';
            end if;
        end if;
    end process;

    en <= en_i;
end architecture rtl;
