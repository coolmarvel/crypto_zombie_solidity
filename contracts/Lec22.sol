// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec22 {
    /**
     * for (초기값; 값이 얼만큼 forLoop를 돌아야 하는지; forLoop 한번 돌때마다 초기값의 변화;) { forLoop 내용 }
     */

    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = [
        "South Korea",
        "North Korea",
        "USA",
        "China",
        "Japan"
    ];

    function forLoopEvents() public {
        for (uint i = 0; i < countryList.length; i++) {
            emit CountryIndexName(i, countryList[i]);
        }
    }

    /**
     * 초기값
     *
     * while (값이 얼만큼 whileLoop를 돌아야 하는지) { whileLoop 내용; whileLoop 한번 돌때마다 초기값의 변화; }
     */

    function whileLoopEvents() public {
        uint256 i = 0;

        while (i < countryList.length) {
            emit CountryIndexName(i, countryList[i]);
            i++;
        }
    }

    /**
     * 초기값
     *
     * do { doWhileLoop 내용 } while (값이 얼만큼 do-while loop를 돌아야 하는지)
     */

    function doWhileLoopEvents() public {
        uint256 i = 0;

        do {
            emit CountryIndexName(i, countryList[i]);
            i++;
        } while (i < countryList.length);
    }
}
