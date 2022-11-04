// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec23 {
    /**
     * continue : 다음 반복문으로 이동
     * break : 반복문을 끝냄
     */

    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = [
        "South Korea",
        "North Korea",
        "USA",
        "China",
        "Japan"
    ];

    function useCountinue() public {
        for (uint i = 0; i < countryList.length; i++) {
            if (i % 2 == 1) {
                // odds
                continue;
            }

            emit CountryIndexName(i, countryList[i]);
        }
    }

    function useBreak() public {
        for (uint i = 0; i < countryList.length; i++) {
            if (i == 2 || i == 4) {
                break;
            }

            emit CountryIndexName(i, countryList[i]);
        }
    }
}
