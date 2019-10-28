pragma solidity ^0.5.6;
import "./Ownable.sol";
import "./SafeMath.sol";

contract klaytn2048 is Ownable{
    // 1 KLAY
    uint256 public oneKlay = 1000000000000000000;
    using SafeMath for uint256;
    event BuyProps(address indexed user, string props, uint256 count);

    mapping(string=> uint256) propsPrice;

    function initPropsPrice() internal{
        propsPrice["Brush"] = oneKlay;
        propsPrice["Hammer"] = oneKlay;
        propsPrice["Switch"] = oneKlay;
        propsPrice["Continue"] = oneKlay;
    }
    
    constructor() public{
        initPropsPrice();
    }
    // Set props price
    function setPropsPrice(string calldata _props, uint256 _price) external onlyOwner returns (bool)  {
        require(_price > 0 && bytes(_props).length > 0, "Invalid message");
        propsPrice[_props] = _price;
        return true;
    }
    // Get props price
    function getPropsPrice(string calldata _props) external view returns(uint256)  {
        return propsPrice[_props];
    }

    function withdraw() external onlyOwner {
        address payable  _owner = owner();
        _owner.transfer(address(this).balance);
    }

    function buyProps(string calldata _props, uint256 _count) external payable {
        uint256 targetVal = _count.mul(propsPrice[_props]);
        require(msg.value >= targetVal, "Invalid message");
        emit BuyProps(msg.sender, _props, _count);
    }
}