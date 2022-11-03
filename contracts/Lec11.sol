// SPDX-License-Identifier:GPL-30
pragma solidity >=0.8.0 <0.9.0;

contract Father {
    string public familyName = "Lee";
    string public givenName = "MinSang";
    uint256 public money = 100;

    constructor(string memory _givenName) {
        givenName = _givenName;
    }

    function getFamilyName() public view returns (string memory) {
        return familyName;
    }

    function getGivenName() public view returns (string memory) {
        return givenName;
    }

    function getMoney() public view virtual returns (uint256) {
        // 상속받은 자식 컨트랙트에서 override를 하려면 부모 컨트랙트에서 virtual을 써야 함
        return money;
    }
}

contract Son is Father("SeongHyun") {
    uint256 public earning = 0;

    function work() public {
        earning += 100;
    }

    function getMoney() public view override returns (uint256) {
        return money + earning;
    }
}
