library ieee;
use ieee.std_logic_1164.all;

entity adder_4bit is
port(
	a: in std_logic_vector(3 downto 0);
	b: in std_logic_vector(3 downto 0);
	c0: in std_logic;
	s: out std_logic_vector(3 downto 0);
	c4: out std_logic;
	overflow: out std_logic);
 end adder_4bit;
 
 architecture rtl of adder_4bit is
 	component full_adder
    	port(a, b, cin : in std_logic;
        		s, co : out std_logic);
    end component;
 
 	signal c : std_logic_vector(3 downto 0);
    signal sigs3, sigc4 : std_logic;
    
    begin
    	process(sigc4, sigc3) is 
        begin
        	overflow <= (a(3) xor b(3)) xor (sigs(3) xor sigc4);
            s(3) <= sigs3;
            c4 <= sigc4;
        end process;
        add0: full_adder port map (a(0), b(0), c0, s(0), c(1));
        add1: full_adder port map (a(1), b(1), c(1), s(1), c(2));
        add2: full_adder port map (a(2), b(2), c(2), s(2), c(3));
        add3: full_adder port map (a(3), b(3), c(3), sigs3, sigs4);
 end rtl;