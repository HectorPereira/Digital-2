library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lab1_tb is
end lab1_tb;

architecture Behavioral of lab1_tb is

    -- Orden de los bits: entrada = ABC, salida = XYZ.
    signal entrada_tb : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal salida_tb  : STD_LOGIC_VECTOR(2 downto 0);
    signal AR_3V3_EN_tb : STD_LOGIC;

    type tabla_t is array (0 to 7) of STD_LOGIC_VECTOR(2 downto 0);
    constant SALIDAS_ESPERADAS : tabla_t := (
        "100",  -- ABC = 000
        "011",  -- ABC = 001
        "001",  -- ABC = 010
        "110",  -- ABC = 011
        "010",  -- ABC = 100
        "111",  -- ABC = 101
        "000",  -- ABC = 110
        "101"   -- ABC = 111
    );

begin

    -- Instancia del circuito que queremos comprobar.
    uut : entity work.top
        port map (
            A => entrada_tb(2),
            B => entrada_tb(1),
            C => entrada_tb(0),
            X => salida_tb(2),
            Y => salida_tb(1),
            Z => salida_tb(0),
            AR_3V3_EN => AR_3V3_EN_tb
        );

    estimulos : process
    begin
        -- Recorre 000, 001, 010, 011, 100, 101, 110 y 111.
        for i in 0 to 7 loop
            entrada_tb <= STD_LOGIC_VECTOR(to_unsigned(i, 3));

            -- Deja que el circuito actualice sus salidas.
            wait for 10 ns;

            assert salida_tb = SALIDAS_ESPERADAS(i)
                report "ERROR en la combinacion " & integer'image(i) &
                       " de la tabla (0=000, ..., 7=111)."
                severity failure;
        end loop;

        report "OK: las 8 combinaciones coinciden con la tabla."
            severity note;

        -- Evita que el proceso vuelva a empezar.
        wait;
    end process;

end Behavioral;
