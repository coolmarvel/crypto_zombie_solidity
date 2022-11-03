// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * event : 블록체인 네트워크의 블록에 특정값을 기록하는 것
 */
contract Lec13 {
    event info(string name, uint256 money); // event에서는 parameter로 string type을 쓸 때 memory 못 씀

    function sendMoney() public {
        emit info("LeeSeongHyun", 1000);
    }
}
