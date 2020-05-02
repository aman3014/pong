architecture rtl of score is

constant zero : std_logic_vector := "11111100";
constant one : std_logic_vector := "01100000";
constant two : std_logic_vector := "11011010";
constant three : std_logic_vector := "11110010";
constant four : std_logic_vector := "01100110";
constant five : std_logic_vector := "10110110";
constant six : std_logic_vector := "10111110";
constant seven : std_logic_vector := "11100000";
constant eight : std_logic_vector := "11111110";
constant nine : std_logic_vector := "11110110";

signal s_overCurrent, s_overNext : std_logic;
signal s_userCurrent, s_userNext : std_logic_vector(7 downto 0);
signal s_sysCurrent, s_sysNext : std_logic_vector(7 downto 0);

begin

tr_logic : process(enable, s_overCurrent, x_pos, s_userCurrent, s_sysCurrent)
begin
	if (enable = '1' and s_overCurrent = '0') then
		if (x_pos(0) = '1') then
			c1 : case s_userCurrent is
				when zero => s_userNext <= one; s_overNext <= s_overCurrent;
				when one => s_userNext <= two; s_overNext <= s_overCurrent;
				when two => s_userNext <= three; s_overNext <= s_overCurrent;
				when three => s_userNext <= four; s_overNext <= s_overCurrent;
				when four => s_userNext <= five; s_overNext <= s_overCurrent;
				when five => s_userNext <= six; s_overNext <= s_overCurrent;
				when six => s_userNext <= seven; s_overNext <= s_overCurrent;
				when seven => s_userNext <= eight; s_overNext <= s_overCurrent;
				when eight => s_userNext <= nine; s_overNext <= '1';
				when others =>	s_userNext <= s_userCurrent; s_overNext <= s_overCurrent;
			end case c1;
			s_sysNext <= s_sysCurrent;
		elsif (x_pos(11) = '1') then
			c2 : case s_sysCurrent is
				when zero => s_sysNext <= one; s_overNext <= s_overCurrent;
				when one => s_sysNext <= two; s_overNext <= s_overCurrent;
				when two => s_sysNext <= three; s_overNext <= s_overCurrent;
				when three => s_sysNext <= four; s_overNext <= s_overCurrent;
				when four => s_sysNext <= five; s_overNext <= s_overCurrent;
				when five => s_sysNext <= six; s_overNext <= s_overCurrent;
				when six => s_sysNext <= seven; s_overNext <= s_overCurrent;
				when seven => s_sysNext <= eight; s_overNext <= s_overCurrent;
				when eight => s_sysNext <= nine; s_overNext <= '1';
				when others => s_sysNext <= s_sysCurrent;
			end case c2;
			s_userNext <= s_userCurrent;
		else 
			s_overNext <= s_overCurrent;
			s_userNext <= s_userCurrent;
			s_sysNext <= s_sysCurrent;
		end if;
	else
		s_overNext <= s_overCurrent;
		s_userNext <= s_userCurrent;
		s_sysNext <= s_sysCurrent;
	end if;
end process tr_logic;

user <= s_userCurrent;
sys <= s_sysCurrent;
over <= s_overCurrent;

fsm : process(reset, clock) is
begin
	if (reset = '1') then
		s_userCurrent <= zero;
		s_sysCurrent <= zero;
		s_overCurrent <= '0';
	elsif (rising_edge(clock)) then
		s_userCurrent <= s_userNext;
		s_sysCurrent <= s_sysNext;
		s_overCurrent <= s_overNext;
	end if;
end process fsm;

end architecture rtl;