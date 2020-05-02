architecture rtl of collision is

begin

process (x_dir, y_dir, x_pos, y_pos, bat) is
begin
	if (x_dir = '1' and x_pos(8) = '1') then
		if ((y_dir = '0' and y_pos(1) = '1' and bat(1) = '1') or (y_pos(7) = '1' and y_dir = '1' and bat(7) = '1')) then
			change <= '1';
		elsif ((y_dir = '1' and (((y_pos(6 downto 0) & "00") and bat) /= "000000000")) or
			(y_dir = '0' and ((("00" & y_pos(8 downto 2)) and bat) /= "000000000"))) then
			change <= '1';
		else
			change <= '0';
		end if;
	elsif (x_dir = '0' and x_pos(11) = '1') then
		if ((y_dir = '1' and (((y_pos(7 downto 0) & '0') and bat) /= "000000000")) or
			(y_dir = '0' and ((('0' & y_pos(8 downto 1)) and bat) /= "000000000"))) then
			change <= '1';
		else
			change <= '0';
		end if;
	else
		change <= '0';
	end if;
end process;

end architecture rtl;
