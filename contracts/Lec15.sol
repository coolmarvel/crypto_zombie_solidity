// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Father {
    event fatherName(string name);

    function who() public virtual {
        emit fatherName("LeeMinSang");
    }
}

contract Mother {
    event motherName(string name);

    function who() public virtual {
        emit motherName("ChoMinHo");
    }
}

contract Son is Father {
    event sonName(string name);

    function who() public override {
        super.who();

        emit sonName("LeeSeongHyun");
    }
}
