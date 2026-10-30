library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Testbench autoverificable con MAX pequeno y N=3.
-- N=3 permite probar el desborde (7 -> 0) en poco tiempo.
entity tb_parte_A is
end entity tb_parte_A;

architecture sim of tb_parte_A is
    constant T_CLK : time := 10 ns;
    constant MAX_TB : positive := 4;
    constant N_TB   : positive := 3;
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal en  : std_logic;
    signal q   : std_logic_vector(N_TB - 1 downto 0);
    signal fin : boolean := false;
begin
    U_DIV : entity work.divisor(rtl)
        generic map (MAX => MAX_TB)
        port map (clk => clk, rst => rst, en => en);

    U_CNT : entity work.contador(rtl)
        generic map (N => N_TB)
        port map (clk => clk, rst => rst, en => en, q => q);

    reloj : process
    begin
        while not fin loop
            clk <= '0'; wait for T_CLK / 2;
            clk <= '1'; wait for T_CLK / 2;
        end loop;
        wait;
    end process;

    estimulos : process
        variable ciclos_desde_pulso : natural := 0;
        variable esperado_q : natural := 0;
        variable en_previo : std_logic := '0';
        variable en_esperado : std_logic;
    begin
        -- Dos flancos con reset activo.
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        wait for 1 ps;
        assert en = '0' and unsigned(q) = 0
            report "Fallo de reset inicial" severity error;
        rst <= '0';

        -- Verifica 36 ciclos, suficientes para 9 incrementos y desborde.
        for i in 1 to 36 loop
            wait until rising_edge(clk);
            -- El contador consume en_previo, no el nuevo en de este flanco.
            if en_previo = '1' then
                esperado_q := (esperado_q + 1) mod (2 ** N_TB);
            end if;
            ciclos_desde_pulso := ciclos_desde_pulso + 1;
            if ciclos_desde_pulso = MAX_TB then
                en_esperado := '1';
                ciclos_desde_pulso := 0;
            else
                en_esperado := '0';
            end if;
            wait for 1 ps; -- permite asentar las actualizaciones de senales
            assert en = en_esperado
                report "Pulso en incorrecto en ciclo " & integer'image(i)
                severity error;
            assert to_integer(unsigned(q)) = esperado_q
                report "Contador incorrecto en ciclo " & integer'image(i)
                severity error;
            en_previo := en;
        end loop;

        -- Verifica reset cuando el contador ya tiene un valor no nulo.
        wait until falling_edge(clk);
        rst <= '1';
        wait until rising_edge(clk);
        wait for 1 ps;
        assert en = '0' and unsigned(q) = 0
            report "Fallo de reset durante la cuenta" severity error;

        report "Parte A: todas las comprobaciones finalizaron correctamente"
            severity note;
        fin <= true;
        wait;
    end process;
end architecture sim;
