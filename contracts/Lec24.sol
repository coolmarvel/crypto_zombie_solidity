// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec24 {
    event CountryIndexName(uint256 _index, string _name);
    string[] private countryList = [
        "South Korea",
        "North Korea",
        "USA",
        "China",
        "Japan"
    ];

    // Taiwan
    function linearSearch(string memory _search)
        public
        view
        returns (uint256, string memory)
    {
        for (uint i = 0; i < countryList.length; i++) {
            if (keccak256(bytes(countryList[i])) == keccak256(bytes(_search))) {
                // solidity 내에서는 string을 직접 비교가 불가능
                // string => bytes => keccak256 해시화 => 비교
                return (i, countryList[i]);
            }
        }

        return (0, "nothing");
    }
}
