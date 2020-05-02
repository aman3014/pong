library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
port(button   : in std_logic;
     enable   : in std_logic;
     reset    : in std_logic;
     clock    : in std_logic;
     button_o : out std_logic);
end entity debouncer;