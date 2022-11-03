// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * indexed : 블록들안에 출력된 이벤트들을 필터링하여 우리가 원하는 이벤트만을 가지고 올 수 있음
 */
contract Lec14 {
    event numberTracker(uint256 num, string str);
    event numberTracker2(uint256 indexed num, string str);

    uint256 num = 0;

    function pushEvent(string memory _str) public {
        emit numberTracker(num, _str);
        emit numberTracker2(num, _str);
        num++;
    }
}
