// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * SPDX list : https://spdx.org/licenses/
 * SPDX-License-Identifier 목적
 * 1. 라이센스를 명시해줌으로써 스마트컨트랙트에 대한 신뢰감을 높일 수 있음
 * 2. 스마트컨트랙트 소스코드가 워낙 오픈되어 있으니, 저작권과 같은 관련된 문제를 해소
 *
 * 주석
 * 1. 블록단위 : 보통 블록단위의 주석은 스마트컨트랙트, 함수등 많은 양의 설명
 * 2. 행단위 : 행단위는 변수 바로 옆에 쓰여서, 짤막한 설명
 */

contract Lec31 {
    /**
     * add 함수는 9를 리턴
     */

    function add() public pure returns (uint256) {
        return 4 + 5; // 4 + 5 = 9 리턴
    }
}
