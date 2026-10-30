library ieee;
use ieee.std_logic_1164.all;
entity top_B is
 generic(MAX: positive := 100_000_000);
 port(clk,rst: in std_logic; A,B: in std_logic_vector(3 downto 0);
      LED: out std_logic_vector(9 downto 0); AR_3V3_EN: out std_logic);
end;
architecture structural of top_B is
 signal en: std_logic;
 signal op: std_logic_vector(1 downto 0);
 signal resultado: std_logic_vector(4 downto 0);
begin
 AR_3V3_EN <= '0';
 u_div: entity work.divisor generic map(MAX=>MAX) port map(clk,rst,en);
 u_fsm: entity work.fsm port map(clk,rst,en,op);
 u_dp: entity work.datapath port map(A,B,op,resultado);
 LED(9 downto 8) <= op;
 LED(7 downto 5) <= "000";
 LED(4 downto 0) <= resultado;
end;
