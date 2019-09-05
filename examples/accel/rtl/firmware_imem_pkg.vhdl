library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.ffaccel_imem_mau.all;

package ffaccel_imem_image is

  type std_logic_imem_matrix is array (natural range <>) of std_logic_vector(IMEMMAUWIDTH-1 downto 0);

  constant imem_array : std_logic_imem_matrix := (
"0000000001001010000000000011111111000101010",
"0000101110001010110000000000000001011001010",
"0000101100000000000000100110000000001000100",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000000000100000001000000000000011011001011",
"0000000000010000100101111111111111111111111",
"0000000000000000101101111111111111111111111",
"0000000001010000110101111111111111111111111",
"0000000000011001110000100000000001110110011",
"0000101100001001000000000000000000011001101",
"0010100011011010100101111111111111111111111",
"0010100010000111100101111111111111111111111",
"0000000000001001100000000000000001101010000",
"0101111111111111111101111111111111111111111",
"0000111010000100111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110110001010000000001111110000000100001",
"0101111111111111111101111111111111111111111",
"0000101100000000111000100110000000000110001",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000111111110100001",
"0101111111111111111101111111111111111111111",
"0000101100000001001000100110000000001010000",
"0000000000010100010101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000000100001001011",
"0001000000001001100001000000000001101010000",
"0101111111111111111101111111111111111111111",
"0001111010000100111101111111111111111111111",
"0000000000100100010000100000000010011010000",
"0000001110000100000000100000000001111010000",
"0000101100001001000101111111111111111111111",
"0000101100000110000001000000101011001001011",
"0010000000110100010010100000000010011010000",
"0101111111111111111101111111111111111111111",
"0000101010000001000010100110000000001001000",
"0101111111111111111001000000111001011001011",
"0001000010000100000001100000000001111010000",
"0101111111111111111101111111111111111111111",
"0001101100000001001001100110000000000110000",
"0000100001101010000101111111111111111111111",
"0000100010010100010101111111111111111111111",
"0000100000010001101101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111010000000000010111001011",
"0010000000000100010010100000000010001010000",
"0010100001110110011010000000000000011001110",
"0010101100001001000010000000000000011001101",
"0000000010000100000000100000000001111010000",
"0000100001010001001101111111111111111111111",
"0000101100000001010000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000010100001001011",
"0001000100000100000001100000000001111010000",
"0010100010100110000101111111111111111111111",
"0001101100000001010001100110000000000110000",
"0101111111111111111101111111111111111111111",
"0000101010000111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000100000000001010100010",
"0101111111111111111101111111111111111111111",
"0000101100001010000000000000000000010101011",
"0101111111111111111101111111111111111111111",
"0000101100001001000000100110000000001010000",
"0000000000010100001001000000101000101001011",
"0101111111111111111101111111111111111111111",
"0000101100000001001101111111111111111111111",
"0001000000000100010001100000000010011010000",
"0000000100000100000000100000000001111010000",
"0101111111111111111101111111111111111111111",
"0000101100000001010000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000011001011001011",
"0001000110000100000001100000000001111010000",
"0010100010100110000101111111111111111111111",
"0001101100000001010001100110000000000110000",
"0101111111111111111101111111111111111111111",
"0000101010000111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000100000000001010100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0010100001000001101010000000000010011001011",
"0101111111111111111101111111111111111111111",
"0001000110000100000001100000000001111010000",
"0010000000000100010010100000000010001010000",
"0000101100000001010000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000011110101001011",
"0001001000000100000001100000000001111010000",
"0010100010100110000101111111111111111111111",
"0001101100000001010001100110000000000110000",
"0101111111111111111101111111111111111111111",
"0000101010000111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000100000000001010100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0010100001000001101010000000000010011001011",
"0101111111111111111101111111111111111111111",
"0001001000000100000001100000000001111010000",
"0010000000000100010010100000000010001010000",
"0000101100000001010000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000100011111001011",
"0001001010000100000001100000000001111010000",
"0010100010100110000101111111111111111111111",
"0001101100000001010001100110000000000110000",
"0101111111111111111101111111111111111111111",
"0000101010000111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000100000000001010100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0010100001000001101010000000000010011001011",
"0101111111111111111101111111111111111111111",
"0001001010000100000001100000000001111010000",
"0010000000000100010010100000000010001010000",
"0000101100000001010000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0010100010100110000001000000101001001001011",
"0001000000000100010001100000000010011010000",
"0101111111111111111101111111111111111111111",
"0001101100001001000010100100000000000111000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0010100001000001101010000000000010011001011",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0010000000000100010010100000000010001010000",
"0000000000000100010000100000000010011010000",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000001101111001011",
"0001000010000100000001100000000001111010000",
"0001100001010001001101111111111111111111111",
"0001101100000001010001100110000000000110000",
"0101111111111111111000000001011011101001011",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000000011000100000000100000000001111010000",
"0000000100000100000000100000000001111010000",
"0000101100000110000000100000000001111010000",
"0000101100000110000000000000001000000100000",
"0000100001111010000101111111111111111111111",
"0000101010000001001000100110000000000110000",
"0101111111111111111000000000001010000100000",
"0000100010011010000000100100000000000100110",
"0000101100000110000000100100000000000001101",
"0000000101000100000000100000000001111010000",
"0000000000100100010000100000000011011010000",
"0000101010000001100000100110000000000110000",
"0000101010000111000000100110000000001001000",
"0000000010000100000000100100000000001010000",
"0000101010001010000000110010000000000100110",
"0000101100000111000000100000000011001010000",
"0000110000000001010000000000000001000100000",
"0101111111111111111101111111111111111111111",
"0000111000000001001000100110000000000111000",
"0000110000000001011001000001010110101001011",
"0101111111111111111101111111111111111111111",
"0000110000000001100101111111111111111111111",
"0001000000000100010001100000000010011010000",
"0000100001001010000101111111111111111111111",
"0000100011010100010101111111111111111111111",
"0000100000010001101101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111010000000000010111001011",
"0010000000000100010010100000000010001010000",
"0010100001110110011010000000000000011001110",
"0010101100001001000010000000000000011001101",
"0000000000000100010000100000000010011010000",
"0000100001000001101101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000000010111001011",
"0001000000000100010001100000000010001010000",
"0001100001110110011001000000000000011001110",
"0001101100001001000001000000000000011001101",
"0000011111110100000000100000000010011010000",
"0000100010100111000101111111111111111111111",
"0000101100000001001000100000000011000111000",
"0000101100001010000000000000000000000100010",
"0000110000001010000101111111111111111111111",
"0000110000000100000000100110000000001001000",
"0000000001000100000000100000000010101010000",
"0000101100001010100000100000000011001010000",
"0000101100000001010000000000000001000100000",
"0000100010110111100000100000000010111010000",
"0000101100000001100000000000000001000100000",
"0101111111111111111010000000110101001001011",
"0000101100000001011101111111111111111111111",
"0010011111110100000010100000000010011010000",
"0010100010100111000101111111111111111111111",
"0101111111111111111000000001011011101001011",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000111110111001011",
"0001000100000100000001100000000001111010000",
"0010100010010110000101111111111111111111111",
"0001101100000001001001100110000000000110000",
"0101111111111111111101111111111111111111111",
"0000101010000001001101111111111111111111111",
"0000100010010111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0001100010010111000001000000111101001001011",
"0101111111111111111101111111111111111111111",
"0010000100000100000010100000000001111010000",
"0001110000001010000001000000000000000100010",
"0000101100000001001000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000001000100011001011",
"0001000110000100000001100000000001111010000",
"0010100010010110000101111111111111111111111",
"0001101100000001001001100110000000000110000",
"0101111111111111111101111111111111111111111",
"0000101010000001001101111111111111111111111",
"0000100010010111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0001100010010111000001000001000010101001011",
"0101111111111111111101111111111111111111111",
"0010000110000100000010100000000001111010000",
"0001110000001010000001000000000000000100010",
"0000101100000001001000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000001001001111001011",
"0001001000000100000001100000000001111010000",
"0010100010010110000101111111111111111111111",
"0001101100000001001001100110000000000110000",
"0101111111111111111101111111111111111111111",
"0000101010000001001101111111111111111111111",
"0000100010010111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0001100010010111000001000001001000001001011",
"0101111111111111111101111111111111111111111",
"0010001000000100000010100000000001111010000",
"0001110000001010000001000000000000000100010",
"0000101100000001001000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000001001111111001011",
"0001001010000100000001100000000001111010000",
"0001100001000001101010100000000010010110000",
"0001101100000001001001100110000000000110000",
"0101111111111111111101111111111111111111111",
"0000101010000001001101111111111111111111111",
"0000100010010111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0001100010010111000001000001001101101001011",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0001110000001010000001000000000000000100010",
"0000001010000100000000100000000001111010000",
"0000100001000001101101111111111111111111111",
"0000101100000001001000100110000000000110000",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000000010111001011",
"0001000000000100010001100000000010001010000",
"0001100001110110011001000000000000011001110",
"0001101100001001000001000000000000011001101",
"0000100010010110000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000101010000001001101111111111111111111111",
"0000100010010111000101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000110000001010000000000000000000000100010",
"0101111111111111111101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0001100010010111000001000001010100001001011",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0001110000001010000001000000000000000100010",
"0101111111111111111000000001011011101001011",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000100001000001101101111111111111111111111",
"0000101100001001000101111111111111111111111",
"0101111111111111111001000000000010111001011",
"0001000000000100010001100000000010001010000",
"0001100001110110011001000000000000011001110",
"0001101100001001000001000000000000011001101",
"0000100010100111000000100000000010101010000",
"0000100011000111000000000000000001000100000",
"0000100010011010000000011111111111110100000",
"0000110000001010000000100110000000000001010",
"0000110000000100110000100110000000000001001",
"0000101100001010000000100000000001010100010",
"0000000001000100000000100000000011001010000",
"0000101100001001000000100000000010111010000",
"0000111000001010100000100000000010110111100",
"0000101100000001100000000000000001000100000",
"0101111111111111111010000001011000101001011",
"0000101100000001011101111111111111111111111",
"0010100010100111000010100000000010101010000",
"0010000001000100000010100000000011000111000",
"0000100001000001101000000000000010011001011",
"0101111111111111111101111111111111111111111",
"0101111111111111111101111111111111111111111",
"0000000000000100010000100000000010001010000");

end ffaccel_imem_image;