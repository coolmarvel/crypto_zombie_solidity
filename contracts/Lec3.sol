// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * 1 ether = 10^9 gwei = 10^18 wei
 * 0.000000000000000001 ether = 1 wei
 * 0.01 ether = 10^16 gwei
 */
contract Lec3 {
    uint256 public value = 1 ether;
    uint256 public value2 = 1 wei;
    uint256 public value3 = 1 gwei;
}
