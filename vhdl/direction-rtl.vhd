architecture rtl of direction is
  
signal s_next, s_current : std_logic;

begin

s_next <= '1' when s_current = '0' and change = '1' and enable = '1' else
	  '0' when s_current = '1' and change = '1' and enable = '1' else
	  s_current;

dir <= s_current;

fsm : process(clock, reset) is
begin
	if (reset = '1') then
		s_current <= '1';
	elsif (rising_edge(clock)) then
		s_current <= s_next;
	end if;
end process fsm;

end architecture rtl;