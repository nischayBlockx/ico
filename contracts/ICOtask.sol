pragma solidity ^0.8.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}


pragma solidity ^0.8.0;


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}



pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

    AggregatorV3Interface internal priceFeed;

  
    constructor() public {
        priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    }

    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
}


pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract ICOtask is ERC20,PriceConsumerV3{
    
    using SafeMath for uint256;
    using SafeMath for int;
     
     
    uint256 public constant TOTAL_TOKEN_SUPPLY=100000000;
    uint256 public constant TOTAL_PRESALE_SUPPLY=30000000;
    uint256 public constant TOTAL_SEEDSALE_SUPPLY=50000000;
    uint256 public constant TOTAL_DYNAMICSALE_SUPPLY=20000000;

    uint256 public PRESALE_TOKEN_BALANCE = 30000000;   
    uint256 public SEEDSALE_TOKEN_BALANCE = 50000000;
    uint256 public DYNAMICSALE_TOKEN_BALANCE = 50000000;
 
    mapping (address => uint256) public Presale_Balancemapping;
    mapping(address => uint256) public Seedsale_Balancemapping;
    mapping (address => uint256) public Dynamicsale_Balancemapping;
    
    address[] public Presale_Members;
    address[] public Seedsale_Members;
    address[] public Dynamicsale_Members;

    uint256 public totalTokenSold;
    uint256 public tokenBalance;
    address public owner;
    
    constructor() ERC20("Tokyo_Token", "TKN") {
        owner = msg.sender;
        _mint(address(this),TOTAL_TOKEN_SUPPLY);
        tokenBalance = balanceOf(address(this)); 
    }
     
    modifier onlyOwner() {
        require(owner == msg.sender,"Not Owner");
        _;
    }
    
    function transferToken(address _from, address _to, uint256 _amount) public onlyOwner{
        require(_from!=address(0) && _to!=address(0));
        _transfer(_from, _to, _amount);
        tokenBalance = tokenBalance.sub(_amount);
    }
    
    
    
    function buyTokens(uint256 amountInEth , address receiver) public {
        
        uint256 amountInUsd = amountInEth.mul(getUsdPrice());
        initialBatchTransfer(receiver,amountInUsd);
    }
    
    function getUsdPrice() public view returns (uint256 usdPrice) {
        
        usdPrice= uint (getLatestPrice()).div(100000000);
        return usdPrice;
    }
        
    function initialBatchTransfer(address _addr, uint256 _amounts) public 
    {
        uint256 presale=_amounts.mul(1).div(100);
        uint256 seedsale=_amounts.mul(2).div(100);
        
       
        if(totalTokenSold <= TOTAL_PRESALE_SUPPLY) {
            
            if(presale <= PRESALE_TOKEN_BALANCE)
            {
                Presale_Members.push(_addr);                                                    
                Presale_Balancemapping[_addr] = Presale_Balancemapping[_addr].add(_amounts);
                uint256 tokensupply= _amounts.mul(1).div(100);
                PRESALE_TOKEN_BALANCE=PRESALE_TOKEN_BALANCE.sub(tokensupply);
                totalTokenSold=totalTokenSold.add(tokensupply);
                transferToken(address(this),_addr,tokensupply);

            }
            else {

                uint256 passtokens = presale.sub(PRESALE_TOKEN_BALANCE);
                totalTokenSold=totalTokenSold.add(PRESALE_TOKEN_BALANCE);
                PRESALE_TOKEN_BALANCE=PRESALE_TOKEN_BALANCE.sub(PRESALE_TOKEN_BALANCE);

            }


        } else if(totalTokenSold <= TOTAL_SEEDSALE_SUPPLY) {
            
            if(seedsale <= SEEDSALE_TOKEN_BALANCE)
            {
                Seedsale_Members.push(_addr);                                                   
                Seedsale_Balancemapping[_addr] = Seedsale_Balancemapping[_addr].add(_amounts);
                uint256 tokensupply= _amounts.mul(2).div(100);
                SEEDSALE_TOKEN_BALANCE=SEEDSALE_TOKEN_BALANCE.sub(tokensupply);
                totalTokenSold=totalTokenSold.add(tokensupply);
                transferToken(address(this),_addr,tokensupply);
            }
            else{
                uint256 passtokens = seedsale.sub(SEEDSALE_TOKEN_BALANCE);
                totalTokenSold=totalTokenSold.add(SEEDSALE_TOKEN_BALANCE);
                SEEDSALE_TOKEN_BALANCE=SEEDSALE_TOKEN_BALANCE.sub(SEEDSALE_TOKEN_BALANCE);
            }                                                    
                          
        } else 
        {
                
                Dynamicsale_Members.push(_addr);                                                   
                Dynamicsale_Balancemapping[_addr] = Dynamicsale_Balancemapping[_addr].add(_amounts);
                uint256 tokensupply= _amounts.mul(2).div(100);
                totalTokenSold=totalTokenSold.add(tokensupply);
                transferToken(address(this),_addr,tokensupply);
               
                
        }
        
    }
    
    
}
