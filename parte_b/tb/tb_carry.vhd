library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity tb_carry is end;
architecture sim of tb_carry is
 signal clk: std_logic := '0';
 signal rst: std_logic := '1';
 signal A: std_logic_vector(3 downto 0) := "1111";
 signal B: std_logic_vector(3 downto 0) := "0011";
 signal LED: std_logic_vector(9 downto 0);
 signal alimentacion: std_logic;
 signal fin: boolean := false;
 signal carry: std_logic;
 signal resultado: std_logic_vector(3 downto 0);
begin
 dut: entity work.top_B generic map(MAX=>4) port map(clk,rst,A,B,LED,alimentacion);
 carry <= LED(4);
 resultado <= LED(3 downto 0);
 process begin
  while not fin loop clk<='0'; wait for 5 ns; clk<='1'; wait for 5 ns; end loop;
  wait;
 end process;
 process
  variable estado: natural;
  variable esperado: natural;
 begin
  wait until falling_edge(clk); wait until falling_edge(clk); rst<='0';
  for i in 1 to 37 loop
   wait until rising_edge(clk); wait for 1 ps;
   estado:=((i-1)/4) mod 4;
   case estado is
    when 0 => esperado:=3;
    when 1 => esperado:=15;
    when 2 => esperado:=12;
    when others => esperado:=18;
   end case;
   assert to_integer(unsigned(LED(9 downto 8)))=estado severity failure;
   assert to_integer(unsigned(LED(4 downto 0)))=esperado report "Operacion incorrecta" severity failure;
   if estado=3 then
    assert carry='1' and resultado="0010" report "Carry incorrecto" severity failure;
   else assert carry='0' report "Carry logico no nulo" severity failure;
   end if;
  end loop;
  wait until falling_edge(clk); rst<='1';
  wait until rising_edge(clk); wait for 1 ps;
  assert LED(9 downto 8)="00" and carry='0' severity failure;
  wait for 20 ns;
  report "Prueba visible carry: A=15 B=3 ADD=18, carry=1, resultado=2: correcta" severity note;
  fin<=true; wait;
 end process;
end;
