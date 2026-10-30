library ieee;
use ieee.std_logic_1164.all;
entity fsm is
 port(clk, rst, en: in std_logic; op: out std_logic_vector(1 downto 0));
end;
architecture rtl of fsm is
 type estado_t is (S_AND, S_OR, S_XOR, S_ADD);
 signal estado, siguiente: estado_t := S_AND;
begin
 process(clk) begin
  if rising_edge(clk) then
   if rst='1' then estado <= S_AND;
   elsif en='1' then estado <= siguiente;
   end if;
  end if;
 end process;
 process(all) begin
  case estado is
   when S_AND => siguiente <= S_OR;
   when S_OR => siguiente <= S_XOR;
   when S_XOR => siguiente <= S_ADD;
   when S_ADD => siguiente <= S_AND;
  end case;
 end process;
 process(all) begin
  case estado is
   when S_AND => op <= "00";
   when S_OR => op <= "01";
   when S_XOR => op <= "10";
   when S_ADD => op <= "11";
  end case;
 end process;
end;
