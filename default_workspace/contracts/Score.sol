// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Score {

    bool public isTeacher; // 0: T ,1: S

    mapping(uint256 => uint8) public studentScore;

    modifier onlyTeacher(){
        require(isTeacher,"you are not teacher");
        _;
    }

    function queryIden(bool _iden) external{
        isTeacher = _iden;
    }

    function addScore(uint256 _studentNum,uint8 _score) external onlyTeacher{
        uint8 addedScore = studentScore[_studentNum] += _score;
        require(addedScore <= 100, "Score cannot exceed 100");
    }

    //修改
    function updateScore(uint256 _studentNum,uint8 _score) external onlyTeacher{
        require(_score <= 100,"max score is 100");
        studentScore[_studentNum] = _score;
    }

    //删除
    function removeScore(uint256 _studentNum) external {
        delete studentScore[_studentNum];
    }

    //查询
    function queryScore(uint256 _studentNum) external view returns(uint8){
        return studentScore[_studentNum];
    }
}

interface IScore{

    function isTeacher() external view returns(bool);
    function queryScore(uint256 _studentNum) external view returns(uint256);

    function queryIden(bool _iden) external;

    function addScore(uint256 _studentNum,uint8 _score) external;
    function updateScore(uint256 _studentNum,uint8 _score) external;
}

contract Teacher {

    bool public _iden;

    constructor(){
        _iden = true;
    }

     function updateScore(address _scoreAdd) external{
         IScore(_scoreAdd).queryIden(_iden);
     }

    function checkTeacher(address _scoreAdd) external view returns(bool){
        return IScore(_scoreAdd).isTeacher();
    }
    function queryScore(address _scoreAdd,uint256 _studentNum) external view returns(uint256){
       return IScore(_scoreAdd).queryScore(_studentNum);
    }

    function teacherAdd(address _scoreAdd, uint256 _studentNum,uint8 _score) external{
        IScore(_scoreAdd).addScore(_studentNum,_score);
    }

    function teacherUpdate(address _scoreAdd, uint256 _studentNum,uint8 _score) external{
        IScore(_scoreAdd).updateScore(_studentNum,_score);
    }
}

