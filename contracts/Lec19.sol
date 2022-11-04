// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec19 {
    /**
     * map과 array를 쓰면서 주의해야할 점
     * 변수의 값을 reference로 저장하는게 아니라 그 당시 값만 capture해서 들고 옴
     */
    uint256 private num = 89;
    mapping(uint256 => uint256) private numMap;
    uint256[] private numArray;

    function changeNum(uint256 _num) public {
        num = _num;
    }

    function showNum() public view returns (uint256) {
        return num;
    }

    function numMapAdd() public {
        numMap[0] = num;
    }

    function showNumMap() public view returns (uint256) {
        return numMap[0];
    }

    function updateNumMap() public {
        numMap[0] = num;
    }

    function numArrayAdd() public {
        numArray.push(num);
    }

    function showNumArray() public view returns (uint256) {
        return numArray[0];
    }

    function updateNumArray() public {
        numArray[0] = num;
    }
}
