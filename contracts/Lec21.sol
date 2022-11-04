// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec21 {
    /**
     *
     * Case 1 : if - else
     * if (if가 발동 되는 조건) { if 내용 }
     *
     * Case 2 : if - else if - else
     * if (if가 발동되는 조건) { if 내용 } else if (else if가 발동 되는 조건) { else if 내용 } else { else 내용 }
     *
     */

    string private outcome = "";

    function isIt5(uint256 _num) public returns (string memory) {
        if (_num == 5) {
            outcome = "Yes, it is 5";
            return outcome;
        }
    }

    function isIt5or3or1(uint256 _num) public returns (string memory) {
        if (_num == 5) {
            outcome = "Yes, it is 5";
            return outcome;
        } else if (_num == 3) {
            outcome = "Yes, it is 3";
            return outcome;
        } else if (_num == 1) {
            outcome = "Yes, it is 1";
            return outcome;
        } else {
            return "No, it is not 5, 3 or 1";
        }
    }
}
