library IEEE;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		a: in std_logic;
	    b: in std_logic;
	    cin: in std_logic;
	    s: out std_logic;
    	co: out std_logic);
end full_adder;

architecture rtl of full_adder is
	component half_adder
		port(a, b : in std_logic;
    			s, co : out std_logic);
	end component;

	signal co1, co2, psum : std_logic;

begin
		process(co1, co2) is
 		   	begin
 		       	co <= co1 or co2;
	    end process;
	    add0: half_adder port map (a, b, psum, co1);
		add1: half_adder port map (psum, cin, s, co2);
end rtl;