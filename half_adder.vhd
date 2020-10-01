library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
port(
	a: in std_logic;
    b: in std_logic;
    s: out std_logic;
    co: out std_logic);
end half_adder;

architecture rtl of half_adder is
begin
	process (a, b) is
    begin
    	s <= a xor b;
        co <= a and b;
    end process;
end rtl;