library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Laboratorio 2, Parte A: ALU monolitica y puramente combinacional.
-- SW = opcode(4 bits) & B(4 bits) & A(4 bits).
entity alu is
    Port (
        SW        : in  STD_LOGIC_VECTOR(11 downto 0);
        Result    : out STD_LOGIC_VECTOR(3 downto 0);
        Carry     : out STD_LOGIC;
        Zero      : out STD_LOGIC;
        AR_3V3_EN : out STD_LOGIC
    );
end alu;

architecture Behavioral of alu is
    signal A, B   : unsigned(3 downto 0);
    signal opcode : STD_LOGIC_VECTOR(3 downto 0);
begin
    A      <= unsigned(SW(3 downto 0));
    B      <= unsigned(SW(7 downto 4));
    opcode <= SW(11 downto 8);

    -- Habilitacion activa en bajo de los 3,3 V del shield (pin L13).
    AR_3V3_EN <= '0';

    process(A, B, opcode)
        variable r   : unsigned(3 downto 0);
        variable ext : unsigned(4 downto 0);
        variable c   : STD_LOGIC;
    begin
        -- Valores por defecto: ninguna salida conserva un valor anterior.
        r   := (others => '0');
        ext := (others => '0');
        c   := '0';

        case opcode is
            when "0000" =>                 -- A + B
                -- Un bit extra para guardar el acarreo.
                ext := ('0' & A) + ('0' & B);
                r := ext(3 downto 0);
                c := ext(4);

            when "0001" =>                 -- A - B
                r := A - B;                -- Resultado modulo 16.
                if A < B then
                    c := '1';              -- Carry representa prestamo.
                end if;

            when "0010" =>                 -- AND bit a bit
                r := A and B;

            when "0011" =>                 -- OR bit a bit
                r := A or B;

            when "0100" =>                 -- XOR bit a bit
                r := A xor B;

            when "0101" =>                 -- NOT A
                r := not A;

            when "0110" =>                 -- A << 1, relleno con cero
                r := A(2 downto 0) & '0';
                c := A(3);                 -- Bit descartado.

            when "0111" =>                 -- A >> 1, relleno con cero
                r := '0' & A(3 downto 1);
                c := A(0);                 -- Bit descartado.

            when "1000" =>                 -- A + 1
                ext := ('0' & A) + 1;
                r := ext(3 downto 0);
                c := ext(4);

            when "1001" =>                 -- A - 1
                r := A - 1;
                if A = 0 then
                    c := '1';
                end if;

            when "1010" =>                 -- B + 1
                ext := ('0' & B) + 1;
                r := ext(3 downto 0);
                c := ext(4);

            when "1011" =>                 -- B - 1
                r := B - 1;
                if B = 0 then
                    c := '1';
                end if;

            when "1100" =>                 -- Complemento a dos de A
                r := (not A) + 1;
                if A /= 0 then
                    c := '1';              -- Prestamo de 0 - A.
                end if;

            when "1101" =>                 -- Complemento a dos de B
                r := (not B) + 1;
                if B /= 0 then
                    c := '1';              -- Prestamo de 0 - B.
                end if;

            when "1110" =>                 -- A = B
                if A = B then
                    r := "0001";
                end if;

            when "1111" =>                 -- A > B, sin signo
                if A > B then
                    r := "0001";
                end if;

            when others =>
                r := "0000";
        end case;

        Result <= STD_LOGIC_VECTOR(r);
        Carry  <= c;
        -- Se usa la variable r, ya actualizada, no el puerto Result.
        if r = 0 then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
end Behavioral;
