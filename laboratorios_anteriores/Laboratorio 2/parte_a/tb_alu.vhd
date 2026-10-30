library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_alu is
end tb_alu;

architecture Simulation of tb_alu is
    signal SW_tb        : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
    signal Result_tb    : STD_LOGIC_VECTOR(3 downto 0);
    signal Carry_tb     : STD_LOGIC;
    signal Zero_tb      : STD_LOGIC;
    signal AR_3V3_EN_tb : STD_LOGIC;

    -- Referencia para AND, OR y XOR basada en bits de enteros,
    -- sin reutilizar la implementacion unsigned del circuito.
    function logical_reference(av, bv, op : natural) return natural is
        variable abit, bbit : natural;
        variable result_value : natural := 0;
        variable set_bit : boolean;
    begin
        for bit_index in 0 to 3 loop
            abit := (av / (2 ** bit_index)) mod 2;
            bbit := (bv / (2 ** bit_index)) mod 2;
            case op is
                when 2 => set_bit := (abit = 1) and (bbit = 1);
                when 3 => set_bit := (abit = 1) or (bbit = 1);
                when 4 => set_bit := (abit /= bbit);
                when others => set_bit := false;
            end case;
            if set_bit then
                result_value := result_value + (2 ** bit_index);
            end if;
        end loop;
        return result_value;
    end function;

    function describe_case(op, av, bv : natural) return string is
    begin
        return "opcode=" & integer'image(op) &
               " A=" & integer'image(av) & " B=" & integer'image(bv);
    end function;
begin
    uut : entity work.alu
        port map (
            SW        => SW_tb,
            Result    => Result_tb,
            Carry     => Carry_tb,
            Zero      => Zero_tb,
            AR_3V3_EN => AR_3V3_EN_tb
        );

    stimulus : process
        variable expected_r : natural range 0 to 15;
        variable expected_c, expected_z : STD_LOGIC;
        variable total_cases : natural := 0;
    begin
        -- 16 opcodes x 16 valores A x 16 valores B = 4096 casos.
        for op in 0 to 15 loop
            for av in 0 to 15 loop
                for bv in 0 to 15 loop
                    SW_tb <= STD_LOGIC_VECTOR(to_unsigned(op * 256 + bv * 16 + av, 12));
                    expected_r := 0;
                    expected_c := '0';

                    -- Modelo de referencia con aritmetica entera.
                    case op is
                        when 0 =>
                            expected_r := (av + bv) mod 16;
                            if av + bv >= 16 then expected_c := '1'; end if;
                        when 1 =>
                            expected_r := (av - bv) mod 16;
                            if av < bv then expected_c := '1'; end if;
                        when 2 | 3 | 4 =>
                            expected_r := logical_reference(av, bv, op);
                        when 5 =>
                            expected_r := 15 - av;
                        when 6 =>
                            expected_r := (av * 2) mod 16;
                            if av >= 8 then expected_c := '1'; end if;
                        when 7 =>
                            expected_r := av / 2;
                            if av mod 2 = 1 then expected_c := '1'; end if;
                        when 8 =>
                            expected_r := (av + 1) mod 16;
                            if av = 15 then expected_c := '1'; end if;
                        when 9 =>
                            expected_r := (av - 1) mod 16;
                            if av = 0 then expected_c := '1'; end if;
                        when 10 =>
                            expected_r := (bv + 1) mod 16;
                            if bv = 15 then expected_c := '1'; end if;
                        when 11 =>
                            expected_r := (bv - 1) mod 16;
                            if bv = 0 then expected_c := '1'; end if;
                        when 12 =>
                            expected_r := (16 - av) mod 16;
                            if av /= 0 then expected_c := '1'; end if;
                        when 13 =>
                            expected_r := (16 - bv) mod 16;
                            if bv /= 0 then expected_c := '1'; end if;
                        when 14 =>
                            if av = bv then expected_r := 1; end if;
                        when 15 =>
                            if av > bv then expected_r := 1; end if;
                        when others => null;
                    end case;

                    if expected_r = 0 then
                        expected_z := '1';
                    else
                        expected_z := '0';
                    end if;

                    -- Tiempo de estimulo, no retardo modelado del hardware.
                    wait for 10 ns;

                    assert Result_tb = STD_LOGIC_VECTOR(to_unsigned(expected_r, 4))
                        report "ERROR Result: " & describe_case(op, av, bv) &
                               " esperado=" & integer'image(expected_r) &
                               " obtenido=" & integer'image(to_integer(unsigned(Result_tb)))
                        severity failure;
                    assert Carry_tb = expected_c
                        report "ERROR Carry: " & describe_case(op, av, bv) &
                               " esperado=" & STD_LOGIC'image(expected_c) &
                               " obtenido=" & STD_LOGIC'image(Carry_tb)
                        severity failure;
                    assert Zero_tb = expected_z
                        report "ERROR Zero: " & describe_case(op, av, bv)
                        severity failure;
                    assert AR_3V3_EN_tb = '0'
                        report "ERROR AR_3V3_EN: debe permanecer en cero."
                        severity failure;
                    total_cases := total_cases + 1;
                end loop;
            end loop;
            report "OK opcode " & integer'image(op) & ": 256 combinaciones."
                severity note;
        end loop;

        report "PASS: " & integer'image(total_cases) &
               " casos verificados (Result, Carry, Zero y AR_3V3_EN)."
            severity note;
        wait;
    end process;
end Simulation;
