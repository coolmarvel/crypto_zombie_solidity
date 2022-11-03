// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * dataType
 * boolean, bytes, address, uint
 *
 * referenceType
 * string, arrays, struct
 *
 * mappingType
 */

contract Lec2 {
    // boolean : true/false
    bool public b = false;

    // ! || == != &&
    bool public b1 = !false; // true
    bool public b2 = false || true; // true
    bool public b3 = false == true; // false
    bool public b4 = false != false; // false
    bool public b5 = false && true; // false

    // bytes 1~32
    bytes4 public bt = 0x12345678;
    bytes public bt2 = "STRING";

    // address
    address public addr = 0xadc565Bb88aA72aa14b98Cb6196f216900614b3c;

    // int(음수 포함) vs uint (음수 미포함)

    // int8 : -2^7 ~ (2^7)-1
    int8 public it = -4;
    // uint8 : 0 ~ 2^8-1
    uint8 public uit = 123;

    // uint256 : 0 ~ 2^256-1
    uint256 public it3 = 123;
}
