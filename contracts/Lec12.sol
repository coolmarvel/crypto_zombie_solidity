// SPDX-License-Identifier:GPL-30
pragma solidity >=0.8.0 <0.9.0;

contract Father {
    uint256 public fatherMoney = 100;

    function getFatherName() public pure returns (string memory) {
        return "Lee Min Sang";
    }

    function getMoney() public view virtual returns (uint256) {
        return fatherMoney;
    }
}

contract Mother {
    uint256 public motherMoney = 500;

    function getMotherName() public pure returns (string memory) {
        return "Cho Min Ho";
    }

    function getMoney() public view virtual returns (uint256) {
        return motherMoney;
    }
}

contract Son is Father, Mother {
    function getMoney() public view override(Father, Mother) returns (uint256) {
        return fatherMoney + motherMoney;
    }
}
