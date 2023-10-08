// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


interface IERC20 {
    
    function totalSupply() external view returns (uint256);

   
    function balanceOf(address account) external view returns (uint256);

   
    function transfer(address recipient, uint256 amount) external returns (bool);

    
    function allowance(address owner, address spender) external view returns (uint256);

    
    function approve(address spender, uint256 amount) external returns (bool);

   
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    
    event Transfer(address indexed from, address indexed to, uint256 value);

   
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Degen is IERC20 {
    uint public totalSupply;
    mapping (address => uint) balances;
    mapping (address => mapping (address => uint)) allowances;
    address moderator;

    string public  name ="Degen";
    string public  symbol = "DGN";

function balanceOf(address account) external view returns (uint256){
    return balances[account];
}
    
function transfer(address recipient, uint256 amount) external returns (bool){
    require(balances[msg.sender] >= amount, "insufficient kbcoins");
    balances[msg.sender] -= amount;
    balances[recipient] += amount;
    emit Transfer(msg.sender, recipient, amount);
    return true;
}

function allowance(address owner, address spender) external view returns (uint256){
    return allowances[owner][spender];
}

function approve(address spender, uint256 amount) external returns (bool){
    allowances[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
}

function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){
    require(allowances[sender][msg.sender] >= amount,"you don't have permission to spend this amount");
    require(balances[sender] >= amount,"addresse doesn't have sufficient tokens");
    allowances[sender][msg.sender] -= amount;
    balances[sender] -= amount;
    balances[recipient] += amount;
    emit Transfer(sender, recipient, amount);
    return true;
}



constructor(){
    moderator = msg.sender;
}

modifier onlyModerator(){
    require(msg.sender == moderator, "you are not the moderator");
    _;
}

function mint(address recipient, uint amount) public onlyModerator {
    balances[recipient] += amount;
    totalSupply += amount;

    emit Transfer(address(0), recipient, amount);
}

function burn(uint amount) public {
    require(balances[msg.sender] >= amount,"your balance is not sufficient");
    balances[msg.sender] -= amount;
    totalSupply -= amount;

    emit Transfer(msg.sender, address(0), amount);

}


mapping (address => bool) public ownsAxe;
mapping (address => bool) public ownsHammer;

function buyAxeOfThor() public {
    require(balances[msg.sender] >= 250, "only the greatest of men can set their eyes on the axe of Thor");
    require(ownsAxe[msg.sender] == false, "how dare you mortal, to wield two axes of Thor");
    totalSupply -= balances[msg.sender];
    balances[msg.sender] = 0;
    ownsAxe[msg.sender] = true;
}

function buyHammerOfThor() public {
    require(balances[msg.sender] >= 85, "the weight of the hammer will crush your puny budget");
    require(ownsHammer[msg.sender] == false, "nice try mortal, you dare not handle two hammers");
    balances[msg.sender] -= 85;
    totalSupply -= 85;
    ownsHammer[msg.sender] = true;
}
    
}
