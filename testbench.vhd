library IEEE;
use ieee.std_logic_1164.all;

entity testbench_4b is
end testbench_4b;

architecture tb of testbench_4b is 

component adder_4bit is
port(
	a: in std_logic_vector(3 downto 0);
	b: in std_logic_vector(3 downto 0);
	c0: in std_logic;
	s: out std_logic_vector(3 downto 0);
	c4: out std_logic;
	overflow: out std_logic);
 end component;
 
 signal a_in, b_in, s_out : std_logic_vector(3 downto 0);
 signal c0_in, c4_out, overflow_out : std_logic;
 
 begin
 	DUT: adder_4bit port map(a_in, b_in, c0_in, s_out, c4_out, overflow_out);
    
    process begin
    	--unused carryin
        c0_in <= '0';
        
        --2 positive w/ overflow
        a_in <= "0101";
        b_in <= "0100";
        
        wait for 1 ns;
        assert(s_out="1001" and overflow_out='1') report "Fail 0101+0100" severity error;
   
       	--2 positive w/o overflow
        a_in <= "0101";
        b_in <= "0010";
        
        wait for 1 ns;
        assert(s_out="0111" and overflow_out='0') report "Fail 0101+0010" severity error;
        
        --1 positive 1 negative
        a_in <= "1101";
        b_in <= "0101";
        
        wait for 1 ns;
        assert(s_out="0010" and overflow_out='0') report "Fail 1101+0101" severity error;

       	--2 negative w/ overflow
        a_in <= "1101";
        b_in <= "1000";
        
        wait for 1 ns;
        assert(s_out="0101" and overflow_out='1') report "Fail 1101+1000" severity error;
        
       	--2 negative w/o overflow
        a_in <= "1110";
        b_in <= "1111";
        
        wait for 1 ns;
        assert(s_out="1101" and overflow_out='0') report "Fail 1110+1111" severity error;
        
        --clear inputs
        a_in <= "0000";
        b_in <= "0000";
        c0_in <= '0';
        
        assert false report "Test done." severity note;
        wait;
	end process;
end tb;

        
        