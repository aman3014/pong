library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bat is
port(button_up   : in std_logic;
     button_down : in std_logic;
     enable      : in std_logic;
     reset       : in std_logic;
     clock       : in std_logic;
     bat_current : out std_logic_vector(8 downto 0);
     bat_next    : out std_logic_vector(8 downto 0));
end entity bat;