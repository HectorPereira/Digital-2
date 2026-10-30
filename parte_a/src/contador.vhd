library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Contador binario ascendente de N bits, con reset sincrono.
-- Incrementa exclusivamente cuando en = '1'.
entity contador is
    generic (
        N : positive := 10
    );
    port (
        clk : in  std_logic;
        rst : in  std_logic;
        en  : in  std_logic;
        q   : out std_logic_vector(N - 1 downto 0)
    );
end entity contador;

architecture rtl of contador is
    signal cuenta : unsigned(N - 1 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                cuenta <= (others => '0');
            elsif en = '1' then
                cuenta <= cuenta + 1;
            end if;
        end if;
    end process;

    q <= std_logic_vector(cuenta);
end architecture rtl;
