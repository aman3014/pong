library ieee;
use ieee.std_logic_1164.all;

entity name is
port (port1 : in std_logic_vector(8 downto 0);
      clock : in std_logic;
      port2 : out std_logic);
end entity name;

architecture archi of name is

signal s_current, s_next : std_logic;
constant c_init : std_logic : '1';
constant c_one : std_logic_vector : "101010101010";
constant c_two : std_logic_vector(7 downto 0) : (7 => '1', others => '0');

component anotherEntity is
-- the port mappings
end component;

begin

s_next <= port1(0) = '1' and '1' = '1' or s_current /= '0';

fsm : process(reset, clock)
begin
	if (reset = '1') then
		s_current <= c_init;
	elsif (rising_edge(clock)) then
		s_current <= s_next;
	end if;
end process fsm;

end architecture archi;