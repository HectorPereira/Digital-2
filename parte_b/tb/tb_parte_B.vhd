library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity tb_parte_B is end;
architecture sim of tb_parte_B is
 signal clk: std_logic := '0';
 signal rst: std_logic := '1';
 signal A: std_logic_vector(3 downto 0) := "0101";
 signal B: std_logic_vector(3 downto 0) := "0011";
 signal LED: std_logic_vector(9 downto 0);
 signal alimentacion: std_logic;
 signal fin: boolean := false;
begin
 dut: entity work.top_B generic map(MAX=>4) port map(clk,rst,A,B,LED,alimentacion);
 process begin
  while not fin loop clk<='0'; wait for 5 ns; clk<='1'; wait for 5 ns; end loop;
  wait;
 end process;
 process
  variable fase: natural := 0;
  variable operacion: natural := 0;
  procedure comprobar_datos(codigo: natural) is
   variable x,y: unsigned(3 downto 0);
   variable valor: unsigned(4 downto 0);
  begin
   -- Todos los pares de operandos para la operacion actual.
   for i in 0 to 15 loop
    for j in 0 to 15 loop
     A<=std_logic_vector(to_unsigned(i,4)); B<=std_logic_vector(to_unsigned(j,4));
     wait for 1 ps;
     x:=to_unsigned(i,4); y:=to_unsigned(j,4);
     case codigo is
      when 0 => valor:='0' & (x and y);
      when 1 => valor:='0' & (x or y);
      when 2 => valor:='0' & (x xor y);
      when others => valor:=to_unsigned(i+j,5);
     end case;
     assert LED(4 downto 0)=std_logic_vector(valor) report "Resultado incorrecto" severity failure;
     assert to_integer(unsigned(LED(9 downto 8)))=codigo report "op depende de los operandos" severity failure;
    end loop;
   end loop;
   A<="0101"; B<="0011"; wait for 1 ps;
  end procedure;
 begin
  wait until falling_edge(clk); wait until falling_edge(clk);
  wait for 1 ps;
  assert LED(9 downto 8)="00" report "Reset inicial incorrecto" severity failure;
  comprobar_datos(0);
  rst<='0';
  -- Tres ciclos completos y permanencia entre habilitaciones.
  for ciclo in 1 to 53 loop
   wait until rising_edge(clk);
   if fase=4 then operacion:=(operacion+1) mod 4; end if;
   fase:=(fase mod 4)+1;
   wait for 1 ps;
   assert to_integer(unsigned(LED(9 downto 8)))=operacion report "Secuencia incorrecta" severity failure;
   assert LED(7 downto 5)="000" and alimentacion='0' report "Salidas auxiliares incorrectas" severity failure;
   if ciclo<=17 and (ciclo mod 4)=1 then comprobar_datos(operacion); end if;
  end loop;
  -- Ciclo 53: OR, reset desde un estado distinto de AND.
  assert LED(9 downto 8)="01" report "Precondicion reset incorrecta" severity failure;
  wait until falling_edge(clk); rst<='1'; wait for 1 ps;
  assert LED(9 downto 8)="01" report "Reset no sincrono" severity failure;
  wait until rising_edge(clk); wait for 1 ps;
  assert LED(9 downto 8)="00" report "Reset no retorna a AND" severity failure;
  wait until falling_edge(clk); rst<='0';
  for i in 1 to 5 loop
   wait until rising_edge(clk); wait for 1 ps;
   if i<5 then assert LED(9 downto 8)="00" severity failure;
   else assert LED(9 downto 8)="01" report "No reinicia temporizacion" severity failure;
   end if;
  end loop;
  report "Parte B: secuencia, retencion, reset y todos los pares por operacion correctos" severity note;
  fin<=true; wait;
 end process;
end;
