architecture rtl of movement is

signal s_next, s_current : std_logic_vector(WIDTH - 1 downto 0);

begin

s_next <= s_current(WIDTH - 2 downto 0) & '0' when dir = '1' and s_current(WIDTH - 1) = '0' and enable = '1' else
	  '0' & s_current(WIDTH - 1 downto 1) when dir = '0' and s_current(0) = '0' and enable = '1' else
	  s_current;

pos <= s_current;

fsm : process (clock, reset) is
begin
	if (reset = '1') then
		s_current <= INIT;
	elsif (rising_edge(clock)) then 
		s_current <= s_next;
	end if;
end process fsm;

end architecture rtl;
