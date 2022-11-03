// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * storage : 대부분의 변수, 함수들이 저장되며, 영속적으로 저장되어 가스 비용 비쌈
 * memory : function의 parameter, return, referenece type이 주로 저장됨
 * 그러나, storage 처럼 영속적이지 않고, 함수내에서만 유효하기에 storage보다 가스 비용이 저렴
 * colldata : 주로 external function 의 parameter에서 사용
 * stack : EVM(Ethereum Virtual Machine)에서 stack data를 관리할 때 쓰는 영역 1024MB 제한
 * 컨트랙트를 상속받은 자식 컨트랙트도 접근 가능
 */
contract Lec7 {
    function getString(string memory _str) public pure returns (string memory) {
        // string은 referenceType으로 봄. memory 키워드 필수
        return _str;
    }
}
