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

contract Son is Father, Mother {
    // Mother가 두번째(최신)로 상속 받기 때문에 Mother의 who() 가 반환됨
    function who() public override(Father, Mother) {
        super.who();
    }
}
