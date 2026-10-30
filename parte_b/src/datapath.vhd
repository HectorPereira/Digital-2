library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity datapath is
 port(A,B: in std_logic_vector(3 downto 0);
      op: in std_logic_vector(1 downto 0);
      resultado: out std_logic_vector(4 downto 0));
end;
architecture rtl of datapath is begin
 process(all) begin
  case op is
   when "00" => resultado <= '0' & (A and B);
   when "01" => resultado <= '0' & (A or B);
   when "10" => resultado <= '0' & (A xor B);
   when "11" => resultado <= std_logic_vector(resize(unsigned(A),5)+resize(unsigned(B),5));
   when others => resultado <= (others=>'0');
  end case;
 end process;
end;
