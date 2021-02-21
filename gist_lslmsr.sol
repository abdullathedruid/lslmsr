// Sources flattened with hardhat v2.0.8 https://hardhat.org

// File @openzeppelin/contracts/token/ERC20/IERC20.sol@v3.3.0

pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


// File @openzeppelin/contracts/introspection/IERC165.sol@v3.3.0

pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


// File @openzeppelin/contracts/token/ERC1155/IERC1155.sol@v3.3.0


pragma solidity >=0.6.2 <0.8.0;

/**
 * @dev Required interface of an ERC1155 compliant contract, as defined in the
 * https://eips.ethereum.org/EIPS/eip-1155[EIP].
 *
 * _Available since v3.1._
 */
interface IERC1155 is IERC165 {
    /**
     * @dev Emitted when `value` tokens of token type `id` are transferred from `from` to `to` by `operator`.
     */
    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);

    /**
     * @dev Equivalent to multiple {TransferSingle} events, where `operator`, `from` and `to` are the same for all
     * transfers.
     */
    event TransferBatch(address indexed operator, address indexed from, address indexed to, uint256[] ids, uint256[] values);

    /**
     * @dev Emitted when `account` grants or revokes permission to `operator` to transfer their tokens, according to
     * `approved`.
     */
    event ApprovalForAll(address indexed account, address indexed operator, bool approved);

    /**
     * @dev Emitted when the URI for token type `id` changes to `value`, if it is a non-programmatic URI.
     *
     * If an {URI} event was emitted for `id`, the standard
     * https://eips.ethereum.org/EIPS/eip-1155#metadata-extensions[guarantees] that `value` will equal the value
     * returned by {IERC1155MetadataURI-uri}.
     */
    event URI(string value, uint256 indexed id);

    /**
     * @dev Returns the amount of tokens of token type `id` owned by `account`.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function balanceOf(address account, uint256 id) external view returns (uint256);

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {balanceOf}.
     *
     * Requirements:
     *
     * - `accounts` and `ids` must have the same length.
     */
    function balanceOfBatch(address[] calldata accounts, uint256[] calldata ids) external view returns (uint256[] memory);

    /**
     * @dev Grants or revokes permission to `operator` to transfer the caller's tokens, according to `approved`,
     *
     * Emits an {ApprovalForAll} event.
     *
     * Requirements:
     *
     * - `operator` cannot be the caller.
     */
    function setApprovalForAll(address operator, bool approved) external;

    /**
     * @dev Returns true if `operator` is approved to transfer ``account``'s tokens.
     *
     * See {setApprovalForAll}.
     */
    function isApprovedForAll(address account, address operator) external view returns (bool);

    /**
     * @dev Transfers `amount` tokens of token type `id` from `from` to `to`.
     *
     * Emits a {TransferSingle} event.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - If the caller is not `from`, it must be have been approved to spend ``from``'s tokens via {setApprovalForAll}.
     * - `from` must have a balance of tokens of type `id` of at least `amount`.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155Received} and return the
     * acceptance magic value.
     */
    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes calldata data) external;

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {safeTransferFrom}.
     *
     * Emits a {TransferBatch} event.
     *
     * Requirements:
     *
     * - `ids` and `amounts` must have the same length.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155BatchReceived} and return the
     * acceptance magic value.
     */
    function safeBatchTransferFrom(address from, address to, uint256[] calldata ids, uint256[] calldata amounts, bytes calldata data) external;
}


// File @openzeppelin/contracts/token/ERC1155/IERC1155MetadataURI.sol@v3.3.0

pragma solidity >=0.6.2 <0.8.0;

/**
 * @dev Interface of the optional ERC1155MetadataExtension interface, as defined
 * in the https://eips.ethereum.org/EIPS/eip-1155#metadata-extensions[EIP].
 *
 * _Available since v3.1._
 */
interface IERC1155MetadataURI is IERC1155 {
    /**
     * @dev Returns the URI for token type `id`.
     *
     * If the `\{id\}` substring is present in the URI, it must be replaced by
     * clients with the actual token type ID.
     */
    function uri(uint256 id) external view returns (string memory);
}


// File @openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol@v3.3.0

pragma solidity >=0.6.0 <0.8.0;

/**
 * _Available since v3.1._
 */
interface IERC1155Receiver is IERC165 {

    /**
        @dev Handles the receipt of a single ERC1155 token type. This function is
        called at the end of a `safeTransferFrom` after the balance has been updated.
        To accept the transfer, this must return
        `bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"))`
        (i.e. 0xf23a6e61, or its own function selector).
        @param operator The address which initiated the transfer (i.e. msg.sender)
        @param from The address which previously owned the token
        @param id The ID of the token being transferred
        @param value The amount of tokens being transferred
        @param data Additional data with no specified format
        @return `bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"))` if transfer is allowed
    */
    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    )
        external
        returns(bytes4);

    /**
        @dev Handles the receipt of a multiple ERC1155 token types. This function
        is called at the end of a `safeBatchTransferFrom` after the balances have
        been updated. To accept the transfer(s), this must return
        `bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"))`
        (i.e. 0xbc197c81, or its own function selector).
        @param operator The address which initiated the batch transfer (i.e. msg.sender)
        @param from The address which previously owned the token
        @param ids An array containing ids of each token being transferred (order and length must match values array)
        @param values An array containing amounts of each token being transferred (order and length must match ids array)
        @param data Additional data with no specified format
        @return `bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"))` if transfer is allowed
    */
    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    )
        external
        returns(bytes4);
}


// File @openzeppelin/contracts/GSN/Context.sol@v3.3.0

pragma solidity >=0.6.0 <0.8.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


// File @openzeppelin/contracts/introspection/ERC165.sol@v3.3.0


pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts may inherit from this and call {_registerInterface} to declare
 * their support of an interface.
 */
abstract contract ERC165 is IERC165 {
    /*
     * bytes4(keccak256('supportsInterface(bytes4)')) == 0x01ffc9a7
     */
    bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;

    /**
     * @dev Mapping of interface ids to whether or not it's supported.
     */
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor () internal {
        // Derived contracts need only register support for their own interfaces,
        // we register support for ERC165 itself here
        _registerInterface(_INTERFACE_ID_ERC165);
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     *
     * Time complexity O(1), guaranteed to always use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) public view override returns (bool) {
        return _supportedInterfaces[interfaceId];
    }

    /**
     * @dev Registers the contract as an implementer of the interface defined by
     * `interfaceId`. Support of the actual ERC165 interface is automatic and
     * registering its interface id is not required.
     *
     * See {IERC165-supportsInterface}.
     *
     * Requirements:
     *
     * - `interfaceId` cannot be the ERC165 invalid interface (`0xffffffff`).
     */
    function _registerInterface(bytes4 interfaceId) internal virtual {
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }
}


// File @openzeppelin/contracts/math/SafeMath.sol@v3.3.0



pragma solidity >=0.6.0 <0.8.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
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
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
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
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
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
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
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
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
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
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
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
        require(b != 0, errorMessage);
        return a % b;
    }
}


// File @openzeppelin/contracts/utils/Address.sol@v3.3.0



pragma solidity >=0.6.2 <0.8.0;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


// File @openzeppelin/contracts/token/ERC1155/ERC1155.sol@v3.3.0



pragma solidity >=0.6.0 <0.8.0;







/**
 *
 * @dev Implementation of the basic standard multi-token.
 * See https://eips.ethereum.org/EIPS/eip-1155
 * Originally based on code by Enjin: https://github.com/enjin/erc-1155
 *
 * _Available since v3.1._
 */
contract ERC1155 is Context, ERC165, IERC1155, IERC1155MetadataURI {
    using SafeMath for uint256;
    using Address for address;

    // Mapping from token ID to account balances
    mapping (uint256 => mapping(address => uint256)) private _balances;

    // Mapping from account to operator approvals
    mapping (address => mapping(address => bool)) private _operatorApprovals;

    // Used as the URI for all token types by relying on ID substitution, e.g. https://token-cdn-domain/{id}.json
    string private _uri;

    /*
     *     bytes4(keccak256('balanceOf(address,uint256)')) == 0x00fdd58e
     *     bytes4(keccak256('balanceOfBatch(address[],uint256[])')) == 0x4e1273f4
     *     bytes4(keccak256('setApprovalForAll(address,bool)')) == 0xa22cb465
     *     bytes4(keccak256('isApprovedForAll(address,address)')) == 0xe985e9c5
     *     bytes4(keccak256('safeTransferFrom(address,address,uint256,uint256,bytes)')) == 0xf242432a
     *     bytes4(keccak256('safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)')) == 0x2eb2c2d6
     *
     *     => 0x00fdd58e ^ 0x4e1273f4 ^ 0xa22cb465 ^
     *        0xe985e9c5 ^ 0xf242432a ^ 0x2eb2c2d6 == 0xd9b67a26
     */
    bytes4 private constant _INTERFACE_ID_ERC1155 = 0xd9b67a26;

    /*
     *     bytes4(keccak256('uri(uint256)')) == 0x0e89341c
     */
    bytes4 private constant _INTERFACE_ID_ERC1155_METADATA_URI = 0x0e89341c;

    /**
     * @dev See {_setURI}.
     */
    constructor (string memory uri_) public {
        _setURI(uri_);

        // register the supported interfaces to conform to ERC1155 via ERC165
        _registerInterface(_INTERFACE_ID_ERC1155);

        // register the supported interfaces to conform to ERC1155MetadataURI via ERC165
        _registerInterface(_INTERFACE_ID_ERC1155_METADATA_URI);
    }

    /**
     * @dev See {IERC1155MetadataURI-uri}.
     *
     * This implementation returns the same URI for *all* token types. It relies
     * on the token type ID substitution mechanism
     * https://eips.ethereum.org/EIPS/eip-1155#metadata[defined in the EIP].
     *
     * Clients calling this function must replace the `\{id\}` substring with the
     * actual token type ID.
     */
    function uri(uint256) external view override returns (string memory) {
        return _uri;
    }

    /**
     * @dev See {IERC1155-balanceOf}.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function balanceOf(address account, uint256 id) public view override returns (uint256) {
        require(account != address(0), "ERC1155: balance query for the zero address");
        return _balances[id][account];
    }

    /**
     * @dev See {IERC1155-balanceOfBatch}.
     *
     * Requirements:
     *
     * - `accounts` and `ids` must have the same length.
     */
    function balanceOfBatch(
        address[] memory accounts,
        uint256[] memory ids
    )
        public
        view
        override
        returns (uint256[] memory)
    {
        require(accounts.length == ids.length, "ERC1155: accounts and ids length mismatch");

        uint256[] memory batchBalances = new uint256[](accounts.length);

        for (uint256 i = 0; i < accounts.length; ++i) {
            require(accounts[i] != address(0), "ERC1155: batch balance query for the zero address");
            batchBalances[i] = _balances[ids[i]][accounts[i]];
        }

        return batchBalances;
    }

    /**
     * @dev See {IERC1155-setApprovalForAll}.
     */
    function setApprovalForAll(address operator, bool approved) public virtual override {
        require(_msgSender() != operator, "ERC1155: setting approval status for self");

        _operatorApprovals[_msgSender()][operator] = approved;
        emit ApprovalForAll(_msgSender(), operator, approved);
    }

    /**
     * @dev See {IERC1155-isApprovedForAll}.
     */
    function isApprovedForAll(address account, address operator) public view override returns (bool) {
        return _operatorApprovals[account][operator];
    }

    /**
     * @dev See {IERC1155-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    )
        public
        virtual
        override
    {
        require(to != address(0), "ERC1155: transfer to the zero address");
        require(
            from == _msgSender() || isApprovedForAll(from, _msgSender()),
            "ERC1155: caller is not owner nor approved"
        );

        address operator = _msgSender();

        _beforeTokenTransfer(operator, from, to, _asSingletonArray(id), _asSingletonArray(amount), data);

        _balances[id][from] = _balances[id][from].sub(amount, "ERC1155: insufficient balance for transfer");
        _balances[id][to] = _balances[id][to].add(amount);

        emit TransferSingle(operator, from, to, id, amount);

        _doSafeTransferAcceptanceCheck(operator, from, to, id, amount, data);
    }

    /**
     * @dev See {IERC1155-safeBatchTransferFrom}.
     */
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    )
        public
        virtual
        override
    {
        require(ids.length == amounts.length, "ERC1155: ids and amounts length mismatch");
        require(to != address(0), "ERC1155: transfer to the zero address");
        require(
            from == _msgSender() || isApprovedForAll(from, _msgSender()),
            "ERC1155: transfer caller is not owner nor approved"
        );

        address operator = _msgSender();

        _beforeTokenTransfer(operator, from, to, ids, amounts, data);

        for (uint256 i = 0; i < ids.length; ++i) {
            uint256 id = ids[i];
            uint256 amount = amounts[i];

            _balances[id][from] = _balances[id][from].sub(
                amount,
                "ERC1155: insufficient balance for transfer"
            );
            _balances[id][to] = _balances[id][to].add(amount);
        }

        emit TransferBatch(operator, from, to, ids, amounts);

        _doSafeBatchTransferAcceptanceCheck(operator, from, to, ids, amounts, data);
    }

    /**
     * @dev Sets a new URI for all token types, by relying on the token type ID
     * substitution mechanism
     * https://eips.ethereum.org/EIPS/eip-1155#metadata[defined in the EIP].
     *
     * By this mechanism, any occurrence of the `\{id\}` substring in either the
     * URI or any of the amounts in the JSON file at said URI will be replaced by
     * clients with the token type ID.
     *
     * For example, the `https://token-cdn-domain/\{id\}.json` URI would be
     * interpreted by clients as
     * `https://token-cdn-domain/000000000000000000000000000000000000000000000000000000000004cce0.json`
     * for token type ID 0x4cce0.
     *
     * See {uri}.
     *
     * Because these URIs cannot be meaningfully represented by the {URI} event,
     * this function emits no events.
     */
    function _setURI(string memory newuri) internal virtual {
        _uri = newuri;
    }

    /**
     * @dev Creates `amount` tokens of token type `id`, and assigns them to `account`.
     *
     * Emits a {TransferSingle} event.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155Received} and return the
     * acceptance magic value.
     */
    function _mint(address account, uint256 id, uint256 amount, bytes memory data) internal virtual {
        require(account != address(0), "ERC1155: mint to the zero address");

        address operator = _msgSender();

        _beforeTokenTransfer(operator, address(0), account, _asSingletonArray(id), _asSingletonArray(amount), data);

        _balances[id][account] = _balances[id][account].add(amount);
        emit TransferSingle(operator, address(0), account, id, amount);

        _doSafeTransferAcceptanceCheck(operator, address(0), account, id, amount, data);
    }

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {_mint}.
     *
     * Requirements:
     *
     * - `ids` and `amounts` must have the same length.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155BatchReceived} and return the
     * acceptance magic value.
     */
    function _mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) internal virtual {
        require(to != address(0), "ERC1155: mint to the zero address");
        require(ids.length == amounts.length, "ERC1155: ids and amounts length mismatch");

        address operator = _msgSender();

        _beforeTokenTransfer(operator, address(0), to, ids, amounts, data);

        for (uint i = 0; i < ids.length; i++) {
            _balances[ids[i]][to] = amounts[i].add(_balances[ids[i]][to]);
        }

        emit TransferBatch(operator, address(0), to, ids, amounts);

        _doSafeBatchTransferAcceptanceCheck(operator, address(0), to, ids, amounts, data);
    }

    /**
     * @dev Destroys `amount` tokens of token type `id` from `account`
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens of token type `id`.
     */
    function _burn(address account, uint256 id, uint256 amount) internal virtual {
        require(account != address(0), "ERC1155: burn from the zero address");

        address operator = _msgSender();

        _beforeTokenTransfer(operator, account, address(0), _asSingletonArray(id), _asSingletonArray(amount), "");

        _balances[id][account] = _balances[id][account].sub(
            amount,
            "ERC1155: burn amount exceeds balance"
        );

        emit TransferSingle(operator, account, address(0), id, amount);
    }

    /**
     * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {_burn}.
     *
     * Requirements:
     *
     * - `ids` and `amounts` must have the same length.
     */
    function _burnBatch(address account, uint256[] memory ids, uint256[] memory amounts) internal virtual {
        require(account != address(0), "ERC1155: burn from the zero address");
        require(ids.length == amounts.length, "ERC1155: ids and amounts length mismatch");

        address operator = _msgSender();

        _beforeTokenTransfer(operator, account, address(0), ids, amounts, "");

        for (uint i = 0; i < ids.length; i++) {
            _balances[ids[i]][account] = _balances[ids[i]][account].sub(
                amounts[i],
                "ERC1155: burn amount exceeds balance"
            );
        }

        emit TransferBatch(operator, account, address(0), ids, amounts);
    }

    /**
     * @dev Hook that is called before any token transfer. This includes minting
     * and burning, as well as batched variants.
     *
     * The same hook is called on both single and batched variants. For single
     * transfers, the length of the `id` and `amount` arrays will be 1.
     *
     * Calling conditions (for each `id` and `amount` pair):
     *
     * - When `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * of token type `id` will be  transferred to `to`.
     * - When `from` is zero, `amount` tokens of token type `id` will be minted
     * for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens of token type `id`
     * will be burned.
     * - `from` and `to` are never both zero.
     * - `ids` and `amounts` have the same, non-zero length.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    )
        internal virtual
    { }

    function _doSafeTransferAcceptanceCheck(
        address operator,
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    )
        private
    {
        if (to.isContract()) {
            try IERC1155Receiver(to).onERC1155Received(operator, from, id, amount, data) returns (bytes4 response) {
                if (response != IERC1155Receiver(to).onERC1155Received.selector) {
                    revert("ERC1155: ERC1155Receiver rejected tokens");
                }
            } catch Error(string memory reason) {
                revert(reason);
            } catch {
                revert("ERC1155: transfer to non ERC1155Receiver implementer");
            }
        }
    }

    function _doSafeBatchTransferAcceptanceCheck(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    )
        private
    {
        if (to.isContract()) {
            try IERC1155Receiver(to).onERC1155BatchReceived(operator, from, ids, amounts, data) returns (bytes4 response) {
                if (response != IERC1155Receiver(to).onERC1155BatchReceived.selector) {
                    revert("ERC1155: ERC1155Receiver rejected tokens");
                }
            } catch Error(string memory reason) {
                revert(reason);
            } catch {
                revert("ERC1155: transfer to non ERC1155Receiver implementer");
            }
        }
    }

    function _asSingletonArray(uint256 element) private pure returns (uint256[] memory) {
        uint256[] memory array = new uint256[](1);
        array[0] = element;

        return array;
    }
}


// File contracts/CTHelpers.sol


pragma solidity ^0.6.0;

library CTHelpers {
    /// @dev Constructs a condition ID from an oracle, a question ID, and the outcome slot count for the question.
    /// @param oracle The account assigned to report the result for the prepared condition.
    /// @param questionId An identifier for the question to be answered by the oracle.
    /// @param outcomeSlotCount The number of outcome slots which should be used for this condition. Must not exceed 256.
    function getConditionId(address oracle, bytes32 questionId, uint outcomeSlotCount) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(oracle, questionId, outcomeSlotCount));
    }

    uint constant P = 21888242871839275222246405745257275088696311157297823662689037894645226208583;
    uint constant B = 3;

    function sqrt(uint x) private pure returns (uint y) {
        uint p = P;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            // add chain generated via https://crypto.stackexchange.com/q/27179/71252
            // and transformed to the following program:

            // x=1; y=x+x; z=y+y; z=z+z; y=y+z; x=x+y; y=y+x; z=y+y; t=z+z; t=z+t; t=t+t;
            // t=t+t; z=z+t; x=x+z; z=x+x; z=z+z; y=y+z; z=y+y; z=z+z; z=z+z; z=y+z; x=x+z;
            // z=x+x; z=z+z; z=z+z; z=x+z; y=y+z; x=x+y; z=x+x; z=z+z; y=y+z; z=y+y; t=z+z;
            // t=t+t; t=t+t; z=z+t; x=x+z; y=y+x; z=y+y; z=z+z; z=z+z; x=x+z; z=x+x; z=z+z;
            // z=x+z; z=z+z; z=z+z; z=x+z; y=y+z; z=y+y; t=z+z; t=t+t; t=z+t; t=y+t; t=t+t;
            // t=t+t; t=t+t; t=t+t; z=z+t; x=x+z; z=x+x; z=x+z; y=y+z; z=y+y; z=y+z; z=z+z;
            // t=z+z; t=z+t; w=t+t; w=w+w; w=w+w; w=w+w; w=w+w; t=t+w; z=z+t; x=x+z; y=y+x;
            // z=y+y; x=x+z; y=y+x; x=x+y; y=y+x; x=x+y; z=x+x; z=x+z; z=z+z; y=y+z; z=y+y;
            // z=z+z; x=x+z; y=y+x; z=y+y; z=y+z; x=x+z; y=y+x; x=x+y; y=y+x; z=y+y; z=z+z;
            // z=y+z; x=x+z; z=x+x; z=x+z; y=y+z; x=x+y; y=y+x; x=x+y; y=y+x; z=y+y; z=y+z;
            // z=z+z; x=x+z; y=y+x; z=y+y; z=y+z; z=z+z; x=x+z; z=x+x; t=z+z; t=t+t; t=z+t;
            // t=x+t; t=t+t; t=t+t; t=t+t; t=t+t; z=z+t; y=y+z; x=x+y; y=y+x; x=x+y; z=x+x;
            // z=x+z; z=z+z; z=z+z; z=z+z; z=x+z; y=y+z; z=y+y; z=y+z; z=z+z; x=x+z; z=x+x;
            // z=x+z; y=y+z; x=x+y; z=x+x; z=z+z; y=y+z; x=x+y; z=x+x; y=y+z; x=x+y; y=y+x;
            // z=y+y; z=y+z; x=x+z; y=y+x; z=y+y; z=y+z; z=z+z; z=z+z; x=x+z; z=x+x; z=z+z;
            // z=z+z; z=x+z; y=y+z; x=x+y; z=x+x; t=x+z; t=t+t; t=t+t; z=z+t; y=y+z; z=y+y;
            // x=x+z; y=y+x; x=x+y; y=y+x; x=x+y; y=y+x; z=y+y; t=y+z; z=y+t; z=z+z; z=z+z;
            // z=t+z; x=x+z; y=y+x; x=x+y; y=y+x; x=x+y; z=x+x; z=x+z; y=y+z; x=x+y; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x; x=x+x;
            // x=x+x; x=x+x; x=x+x; x=x+x; res=y+x
            // res == (P + 1) // 4

            y := mulmod(x, x, p)
            {
                let z := mulmod(y, y, p)
                z := mulmod(z, z, p)
                y := mulmod(y, z, p)
                x := mulmod(x, y, p)
                y := mulmod(y, x, p)
                z := mulmod(y, y, p)
                {
                    let t := mulmod(z, z, p)
                    t := mulmod(z, t, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    z := mulmod(z, t, p)
                    x := mulmod(x, z, p)
                    z := mulmod(x, x, p)
                    z := mulmod(z, z, p)
                    y := mulmod(y, z, p)
                    z := mulmod(y, y, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(y, z, p)
                    x := mulmod(x, z, p)
                    z := mulmod(x, x, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(x, z, p)
                    y := mulmod(y, z, p)
                    x := mulmod(x, y, p)
                    z := mulmod(x, x, p)
                    z := mulmod(z, z, p)
                    y := mulmod(y, z, p)
                    z := mulmod(y, y, p)
                    t := mulmod(z, z, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    z := mulmod(z, t, p)
                    x := mulmod(x, z, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    x := mulmod(x, z, p)
                    z := mulmod(x, x, p)
                    z := mulmod(z, z, p)
                    z := mulmod(x, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(x, z, p)
                    y := mulmod(y, z, p)
                    z := mulmod(y, y, p)
                    t := mulmod(z, z, p)
                    t := mulmod(t, t, p)
                    t := mulmod(z, t, p)
                    t := mulmod(y, t, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    z := mulmod(z, t, p)
                    x := mulmod(x, z, p)
                    z := mulmod(x, x, p)
                    z := mulmod(x, z, p)
                    y := mulmod(y, z, p)
                    z := mulmod(y, y, p)
                    z := mulmod(y, z, p)
                    z := mulmod(z, z, p)
                    t := mulmod(z, z, p)
                    t := mulmod(z, t, p)
                    {
                        let w := mulmod(t, t, p)
                        w := mulmod(w, w, p)
                        w := mulmod(w, w, p)
                        w := mulmod(w, w, p)
                        w := mulmod(w, w, p)
                        t := mulmod(t, w, p)
                    }
                    z := mulmod(z, t, p)
                    x := mulmod(x, z, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    x := mulmod(x, z, p)
                    y := mulmod(y, x, p)
                    x := mulmod(x, y, p)
                    y := mulmod(y, x, p)
                    x := mulmod(x, y, p)
                    z := mulmod(x, x, p)
                    z := mulmod(x, z, p)
                    z := mulmod(z, z, p)
                    y := mulmod(y, z, p)
                    z := mulmod(y, y, p)
                    z := mulmod(z, z, p)
                    x := mulmod(x, z, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    z := mulmod(y, z, p)
                    x := mulmod(x, z, p)
                    y := mulmod(y, x, p)
                    x := mulmod(x, y, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    z := mulmod(z, z, p)
                    z := mulmod(y, z, p)
                    x := mulmod(x, z, p)
                    z := mulmod(x, x, p)
                    z := mulmod(x, z, p)
                    y := mulmod(y, z, p)
                    x := mulmod(x, y, p)
                    y := mulmod(y, x, p)
                    x := mulmod(x, y, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    z := mulmod(y, z, p)
                    z := mulmod(z, z, p)
                    x := mulmod(x, z, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    z := mulmod(y, z, p)
                    z := mulmod(z, z, p)
                    x := mulmod(x, z, p)
                    z := mulmod(x, x, p)
                    t := mulmod(z, z, p)
                    t := mulmod(t, t, p)
                    t := mulmod(z, t, p)
                    t := mulmod(x, t, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    z := mulmod(z, t, p)
                    y := mulmod(y, z, p)
                    x := mulmod(x, y, p)
                    y := mulmod(y, x, p)
                    x := mulmod(x, y, p)
                    z := mulmod(x, x, p)
                    z := mulmod(x, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(x, z, p)
                    y := mulmod(y, z, p)
                    z := mulmod(y, y, p)
                    z := mulmod(y, z, p)
                    z := mulmod(z, z, p)
                    x := mulmod(x, z, p)
                    z := mulmod(x, x, p)
                    z := mulmod(x, z, p)
                    y := mulmod(y, z, p)
                    x := mulmod(x, y, p)
                    z := mulmod(x, x, p)
                    z := mulmod(z, z, p)
                    y := mulmod(y, z, p)
                    x := mulmod(x, y, p)
                    z := mulmod(x, x, p)
                    y := mulmod(y, z, p)
                    x := mulmod(x, y, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    z := mulmod(y, z, p)
                    x := mulmod(x, z, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    z := mulmod(y, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    x := mulmod(x, z, p)
                    z := mulmod(x, x, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(x, z, p)
                    y := mulmod(y, z, p)
                    x := mulmod(x, y, p)
                    z := mulmod(x, x, p)
                    t := mulmod(x, z, p)
                    t := mulmod(t, t, p)
                    t := mulmod(t, t, p)
                    z := mulmod(z, t, p)
                    y := mulmod(y, z, p)
                    z := mulmod(y, y, p)
                    x := mulmod(x, z, p)
                    y := mulmod(y, x, p)
                    x := mulmod(x, y, p)
                    y := mulmod(y, x, p)
                    x := mulmod(x, y, p)
                    y := mulmod(y, x, p)
                    z := mulmod(y, y, p)
                    t := mulmod(y, z, p)
                    z := mulmod(y, t, p)
                    z := mulmod(z, z, p)
                    z := mulmod(z, z, p)
                    z := mulmod(t, z, p)
                }
                x := mulmod(x, z, p)
                y := mulmod(y, x, p)
                x := mulmod(x, y, p)
                y := mulmod(y, x, p)
                x := mulmod(x, y, p)
                z := mulmod(x, x, p)
                z := mulmod(x, z, p)
                y := mulmod(y, z, p)
            }
            x := mulmod(x, y, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            x := mulmod(x, x, p)
            y := mulmod(y, x, p)
        }
    }

    /// @dev Constructs an outcome collection ID from a parent collection and an outcome collection.
    /// @param parentCollectionId Collection ID of the parent outcome collection, or bytes32(0) if there's no parent.
    /// @param conditionId Condition ID of the outcome collection to combine with the parent outcome collection.
    /// @param indexSet Index set of the outcome collection to combine with the parent outcome collection.
    function getCollectionId(bytes32 parentCollectionId, bytes32 conditionId, uint indexSet) internal view returns (bytes32) {
        uint x1 = uint(keccak256(abi.encodePacked(conditionId, indexSet)));
        bool odd = x1 >> 255 != 0;
        uint y1;
        uint yy;
        do {
            x1 = addmod(x1, 1, P);
            yy = addmod(mulmod(x1, mulmod(x1, x1, P), P), B, P);
            y1 = sqrt(yy);
        } while(mulmod(y1, y1, P) != yy);
        if(odd && y1 % 2 == 0 || !odd && y1 % 2 == 1)
            y1 = P - y1;

        uint x2 = uint(parentCollectionId);
        if(x2 != 0) {
            odd = x2 >> 254 != 0;
            x2 = (x2 << 2) >> 2;
            yy = addmod(mulmod(x2, mulmod(x2, x2, P), P), B, P);
            uint y2 = sqrt(yy);
            if(odd && y2 % 2 == 0 || !odd && y2 % 2 == 1)
                y2 = P - y2;
            require(mulmod(y2, y2, P) == yy, "invalid parent collection ID");

            (bool success, bytes memory ret) = address(6).staticcall(abi.encode(x1, y1, x2, y2));
            require(success, "ecadd failed");
            (x1, y1) = abi.decode(ret, (uint, uint));
        }

        if(y1 % 2 == 1)
            x1 ^= 1 << 254;

        return bytes32(x1);
    }

    /// @dev Constructs a position ID from a collateral token and an outcome collection. These IDs are used as the ERC-1155 ID for this contract.
    /// @param collateralToken Collateral token which backs the position.
    /// @param collectionId ID of the outcome collection associated with this position.
    function getPositionId(IERC20 collateralToken, bytes32 collectionId) internal pure returns (uint) {
        return uint(keccak256(abi.encodePacked(collateralToken, collectionId)));
    }
}


// File contracts/ConditionalTokens.sol


pragma solidity ^0.6.1;



// Mainnet (ID: 1) canonical address: 0xC59b0e4De5F1248C1140964E0fF287B192407E0C
// Rinkeby (ID: 4) canonical address: 0x36bede640D19981A82090519bC1626249984c908

contract ConditionalTokens is ERC1155 {

    /// @dev Emitted upon the successful preparation of a condition.
    /// @param conditionId The condition's ID. This ID may be derived from the other three parameters via ``keccak256(abi.encodePacked(oracle, questionId, outcomeSlotCount))``.
    /// @param oracle The account assigned to report the result for the prepared condition.
    /// @param questionId An identifier for the question to be answered by the oracle.
    /// @param outcomeSlotCount The number of outcome slots which should be used for this condition. Must not exceed 256.
    event ConditionPreparation(
        bytes32 indexed conditionId,
        address indexed oracle,
        bytes32 indexed questionId,
        uint outcomeSlotCount
    );

    event ConditionResolution(
        bytes32 indexed conditionId,
        address indexed oracle,
        bytes32 indexed questionId,
        uint outcomeSlotCount,
        uint[] payoutNumerators
    );

    /// @dev Emitted when a position is successfully split.
    event PositionSplit(
        address indexed stakeholder,
        IERC20 collateralToken,
        bytes32 indexed parentCollectionId,
        bytes32 indexed conditionId,
        uint[] partition,
        uint amount
    );
    /// @dev Emitted when positions are successfully merged.
    event PositionsMerge(
        address indexed stakeholder,
        IERC20 collateralToken,
        bytes32 indexed parentCollectionId,
        bytes32 indexed conditionId,
        uint[] partition,
        uint amount
    );
    event PayoutRedemption(
        address indexed redeemer,
        IERC20 indexed collateralToken,
        bytes32 indexed parentCollectionId,
        bytes32 conditionId,
        uint[] indexSets,
        uint payout
    );


    /// Mapping key is an condition ID. Value represents numerators of the payout vector associated with the condition. This array is initialized with a length equal to the outcome slot count. E.g. Condition with 3 outcomes [A, B, C] and two of those correct [0.5, 0.5, 0]. In Ethereum there are no decimal values, so here, 0.5 is represented by fractions like 1/2 == 0.5. That's why we need numerator and denominator values. Payout numerators are also used as a check of initialization. If the numerators array is empty (has length zero), the condition was not created/prepared. See getOutcomeSlotCount.
    mapping(bytes32 => uint[]) public payoutNumerators;
    /// Denominator is also used for checking if the condition has been resolved. If the denominator is non-zero, then the condition has been resolved.
    mapping(bytes32 => uint) public payoutDenominator;

    constructor() public ERC1155('') {}

    /// @dev This function prepares a condition by initializing a payout vector associated with the condition.
    /// @param oracle The account assigned to report the result for the prepared condition.
    /// @param questionId An identifier for the question to be answered by the oracle.
    /// @param outcomeSlotCount The number of outcome slots which should be used for this condition. Must not exceed 256.
    function prepareCondition(address oracle, bytes32 questionId, uint outcomeSlotCount) external {
        // Limit of 256 because we use a partition array that is a number of 256 bits.
        require(outcomeSlotCount <= 256, "too many outcome slots");
        require(outcomeSlotCount > 1, "there should be more than one outcome slot");
        bytes32 conditionId = CTHelpers.getConditionId(oracle, questionId, outcomeSlotCount);
        require(payoutNumerators[conditionId].length == 0, "condition already prepared");
        payoutNumerators[conditionId] = new uint[](outcomeSlotCount);
        emit ConditionPreparation(conditionId, oracle, questionId, outcomeSlotCount);
    }

    /// @dev Called by the oracle for reporting results of conditions. Will set the payout vector for the condition with the ID ``keccak256(abi.encodePacked(oracle, questionId, outcomeSlotCount))``, where oracle is the message sender, questionId is one of the parameters of this function, and outcomeSlotCount is the length of the payouts parameter, which contains the payoutNumerators for each outcome slot of the condition.
    /// @param questionId The question ID the oracle is answering for
    /// @param payouts The oracle's answer
    function reportPayouts(bytes32 questionId, uint[] calldata payouts) external {
        uint outcomeSlotCount = payouts.length;
        require(outcomeSlotCount > 1, "there should be more than one outcome slot");
        // IMPORTANT, the oracle is enforced to be the sender because it's part of the hash.
        bytes32 conditionId = CTHelpers.getConditionId(msg.sender, questionId, outcomeSlotCount);
        require(payoutNumerators[conditionId].length == outcomeSlotCount, "condition not prepared or found");
        require(payoutDenominator[conditionId] == 0, "payout denominator already set");

        uint den = 0;
        for (uint i = 0; i < outcomeSlotCount; i++) {
            uint num = payouts[i];
            den = den.add(num);

            require(payoutNumerators[conditionId][i] == 0, "payout numerator already set");
            payoutNumerators[conditionId][i] = num;
        }
        require(den > 0, "payout is all zeroes");
        payoutDenominator[conditionId] = den;
        emit ConditionResolution(conditionId, msg.sender, questionId, outcomeSlotCount, payoutNumerators[conditionId]);
    }

    /// @dev This function splits a position. If splitting from the collateral, this contract will attempt to transfer `amount` collateral from the message sender to itself. Otherwise, this contract will burn `amount` stake held by the message sender in the position being split worth of EIP 1155 tokens. Regardless, if successful, `amount` stake will be minted in the split target positions. If any of the transfers, mints, or burns fail, the transaction will revert. The transaction will also revert if the given partition is trivial, invalid, or refers to more slots than the condition is prepared with.
    /// @param collateralToken The address of the positions' backing collateral token.
    /// @param parentCollectionId The ID of the outcome collections common to the position being split and the split target positions. May be null, in which only the collateral is shared.
    /// @param conditionId The ID of the condition to split on.
    /// @param partition An array of disjoint index sets representing a nontrivial partition of the outcome slots of the given condition. E.g. A|B and C but not A|B and B|C (is not disjoint). Each element's a number which, together with the condition, represents the outcome collection. E.g. 0b110 is A|B, 0b010 is B, etc.
    /// @param amount The amount of collateral or stake to split.
    function splitPosition(
        IERC20 collateralToken,
        bytes32 parentCollectionId,
        bytes32 conditionId,
        uint[] calldata partition,
        uint amount
    ) external {
        require(partition.length > 1, "got empty or singleton partition");
        uint outcomeSlotCount = payoutNumerators[conditionId].length;
        require(outcomeSlotCount > 0, "condition not prepared yet");

        // For a condition with 4 outcomes fullIndexSet's 0b1111; for 5 it's 0b11111...
        uint fullIndexSet = (1 << outcomeSlotCount) - 1;
        // freeIndexSet starts as the full collection
        uint freeIndexSet = fullIndexSet;
        // This loop checks that all condition sets are disjoint (the same outcome is not part of more than 1 set)
        uint[] memory positionIds = new uint[](partition.length);
        uint[] memory amounts = new uint[](partition.length);
        for (uint i = 0; i < partition.length; i++) {
            uint indexSet = partition[i];
            require(indexSet > 0 && indexSet < fullIndexSet, "got invalid index set");
            require((indexSet & freeIndexSet) == indexSet, "partition not disjoint");
            freeIndexSet ^= indexSet;
            positionIds[i] = CTHelpers.getPositionId(collateralToken, CTHelpers.getCollectionId(parentCollectionId, conditionId, indexSet));
            amounts[i] = amount;
        }

        if (freeIndexSet == 0) {
            // Partitioning the full set of outcomes for the condition in this branch
            if (parentCollectionId == bytes32(0)) {
                require(collateralToken.transferFrom(msg.sender, address(this), amount), "could not receive collateral tokens");
            } else {
                _burn(
                    msg.sender,
                    CTHelpers.getPositionId(collateralToken, parentCollectionId),
                    amount
                );
            }
        } else {
            // Partitioning a subset of outcomes for the condition in this branch.
            // For example, for a condition with three outcomes A, B, and C, this branch
            // allows the splitting of a position $:(A|C) to positions $:(A) and $:(C).
            _burn(
                msg.sender,
                CTHelpers.getPositionId(collateralToken,
                    CTHelpers.getCollectionId(parentCollectionId, conditionId, fullIndexSet ^ freeIndexSet)),
                amount
            );
        }

        _mintBatch(
            msg.sender,
            // position ID is the ERC 1155 token ID
            positionIds,
            amounts,
            ""
        );
        emit PositionSplit(msg.sender, collateralToken, parentCollectionId, conditionId, partition, amount);
    }

    function mergePositions(
        IERC20 collateralToken,
        bytes32 parentCollectionId,
        bytes32 conditionId,
        uint[] calldata partition,
        uint amount
    ) external {
        require(partition.length > 1, "got empty or singleton partition");
        uint outcomeSlotCount = payoutNumerators[conditionId].length;
        require(outcomeSlotCount > 0, "condition not prepared yet");

        uint fullIndexSet = (1 << outcomeSlotCount) - 1;
        uint freeIndexSet = fullIndexSet;
        uint[] memory positionIds = new uint[](partition.length);
        uint[] memory amounts = new uint[](partition.length);
        for (uint i = 0; i < partition.length; i++) {
            uint indexSet = partition[i];
            require(indexSet > 0 && indexSet < fullIndexSet, "got invalid index set");
            require((indexSet & freeIndexSet) == indexSet, "partition not disjoint");
            freeIndexSet ^= indexSet;
            positionIds[i] = CTHelpers.getPositionId(collateralToken, CTHelpers.getCollectionId(parentCollectionId, conditionId, indexSet));
            amounts[i] = amount;
        }
        _burnBatch(
            msg.sender,
            positionIds,
            amounts
        );

        if (freeIndexSet == 0) {
            if (parentCollectionId == bytes32(0)) {
                require(collateralToken.transfer(msg.sender, amount), "could not send collateral tokens");
            } else {
                _mint(
                    msg.sender,
                    CTHelpers.getPositionId(collateralToken, parentCollectionId),
                    amount,
                    ""
                );
            }
        } else {
            _mint(
                msg.sender,
                CTHelpers.getPositionId(collateralToken,
                    CTHelpers.getCollectionId(parentCollectionId, conditionId, fullIndexSet ^ freeIndexSet)),
                amount,
                ""
            );
        }

        emit PositionsMerge(msg.sender, collateralToken, parentCollectionId, conditionId, partition, amount);
    }

    function redeemPositions(IERC20 collateralToken, bytes32 parentCollectionId, bytes32 conditionId, uint[] calldata indexSets) external {
        uint den = payoutDenominator[conditionId];
        require(den > 0, "result for condition not received yet");
        uint outcomeSlotCount = payoutNumerators[conditionId].length;
        require(outcomeSlotCount > 0, "condition not prepared yet");

        uint totalPayout = 0;

        uint fullIndexSet = (1 << outcomeSlotCount) - 1;
        for (uint i = 0; i < indexSets.length; i++) {
            uint indexSet = indexSets[i];
            require(indexSet > 0 && indexSet < fullIndexSet, "got invalid index set");
            uint positionId = CTHelpers.getPositionId(collateralToken,
                CTHelpers.getCollectionId(parentCollectionId, conditionId, indexSet));

            uint payoutNumerator = 0;
            for (uint j = 0; j < outcomeSlotCount; j++) {
                if (indexSet & (1 << j) != 0) {
                    payoutNumerator = payoutNumerator.add(payoutNumerators[conditionId][j]);
                }
            }

            uint payoutStake = balanceOf(msg.sender, positionId);
            if (payoutStake > 0) {
                totalPayout = totalPayout.add(payoutStake.mul(payoutNumerator).div(den));
                _burn(msg.sender, positionId, payoutStake);
            }
        }

        if (totalPayout > 0) {
            if (parentCollectionId == bytes32(0)) {
                require(collateralToken.transfer(msg.sender, totalPayout), "could not transfer payout to message sender");
            } else {
                _mint(msg.sender, CTHelpers.getPositionId(collateralToken, parentCollectionId), totalPayout, "");
            }
        }
        emit PayoutRedemption(msg.sender, collateralToken, parentCollectionId, conditionId, indexSets, totalPayout);
    }

    /// @dev Gets the outcome slot count of a condition.
    /// @param conditionId ID of the condition.
    /// @return Number of outcome slots associated with a condition, or zero if condition has not been prepared yet.
    function getOutcomeSlotCount(bytes32 conditionId) external view returns (uint) {
        return payoutNumerators[conditionId].length;
    }

    /// @dev Constructs a condition ID from an oracle, a question ID, and the outcome slot count for the question.
    /// @param oracle The account assigned to report the result for the prepared condition.
    /// @param questionId An identifier for the question to be answered by the oracle.
    /// @param outcomeSlotCount The number of outcome slots which should be used for this condition. Must not exceed 256.
    function getConditionId(address oracle, bytes32 questionId, uint outcomeSlotCount) external pure returns (bytes32) {
        return CTHelpers.getConditionId(oracle, questionId, outcomeSlotCount);
    }

    /// @dev Constructs an outcome collection ID from a parent collection and an outcome collection.
    /// @param parentCollectionId Collection ID of the parent outcome collection, or bytes32(0) if there's no parent.
    /// @param conditionId Condition ID of the outcome collection to combine with the parent outcome collection.
    /// @param indexSet Index set of the outcome collection to combine with the parent outcome collection.
    function getCollectionId(bytes32 parentCollectionId, bytes32 conditionId, uint indexSet) external view returns (bytes32) {
        return CTHelpers.getCollectionId(parentCollectionId, conditionId, indexSet);
    }

    /// @dev Constructs a position ID from a collateral token and an outcome collection. These IDs are used as the ERC-1155 ID for this contract.
    /// @param collateralToken Collateral token which backs the position.
    /// @param collectionId ID of the outcome collection associated with this position.
    function getPositionId(IERC20 collateralToken, bytes32 collectionId) external pure returns (uint) {
        return CTHelpers.getPositionId(collateralToken, collectionId);
    }
}


// File @openzeppelin/contracts/token/ERC20/ERC20.sol@v3.3.0



pragma solidity >=0.6.0 <0.8.0;



/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     *
     * To select a different value for {decimals}, use {_setupDecimals}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory name_, string memory symbol_) public {
        _name = name_;
        _symbol = symbol_;
        _decimals = 18;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is
     * called.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Sets {decimals} to a value other than the default one of 18.
     *
     * WARNING: This function should only be called from the constructor. Most
     * applications that interact with token contracts will not expect
     * {decimals} to ever change, and may work incorrectly if it does.
     */
    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual { }
}


// File contracts/FakeDai.sol


pragma solidity ^0.6.0;

contract FakeDai is ERC20 {
    constructor() public ERC20('Test Dai', 'DAI') {}

    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }
}


// File @openzeppelin/contracts/access/Ownable.sol@v3.3.0



pragma solidity >=0.6.0 <0.8.0;

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
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

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


// File @openzeppelin/contracts/token/ERC20/SafeERC20.sol@v3.3.0



pragma solidity >=0.6.0 <0.8.0;



/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


// File contracts/ABDKMath64x64.sol

// SPDX-License-Identifier: BSD-4-Clause
/*
 * ABDK Math 64.64 Smart Contract Library.  Copyright © 2019 by ABDK Consulting.
 * Author: Mikhail Vladimirov <mikhail.vladimirov@gmail.com>
 */
pragma solidity ^0.5.0 || ^0.6.0 || ^0.7.0;

/**
 * Smart contract library of mathematical functions operating with signed
 * 64.64-bit fixed point numbers.  Signed 64.64-bit fixed point number is
 * basically a simple fraction whose numerator is signed 128-bit integer and
 * denominator is 2^64.  As long as denominator is always the same, there is no
 * need to store it, thus in Solidity signed 64.64-bit fixed point numbers are
 * represented by int128 type holding only the numerator.
 */
library ABDKMath {
  /*
   * Minimum value signed 64.64-bit fixed point number may have.
   */
  int128 private constant MIN_64x64 = -0x80000000000000000000000000000000;

  /*
   * Maximum value signed 64.64-bit fixed point number may have.
   */
  int128 private constant MAX_64x64 = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

  /**
   * Convert signed 256-bit integer number into signed 64.64-bit fixed point
   * number.  Revert on overflow.
   *
   * @param x signed 256-bit integer number
   * @return signed 64.64-bit fixed point number
   */
  function fromInt (int256 x) internal pure returns (int128) {
    require (x >= -0x8000000000000000 && x <= 0x7FFFFFFFFFFFFFFF);
    return int128 (x << 64);
  }

  /**
   * Convert signed 64.64 fixed point number into signed 64-bit integer number
   * rounding down.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64-bit integer number
   */
  function toInt (int128 x) internal pure returns (int64) {
    return int64 (x >> 64);
  }

  /**
   * Convert unsigned 256-bit integer number into signed 64.64-bit fixed point
   * number.  Revert on overflow.
   *
   * @param x unsigned 256-bit integer number
   * @return signed 64.64-bit fixed point number
   */
  function fromUInt (uint256 x) internal pure returns (int128) {
    require (x <= 0x7FFFFFFFFFFFFFFF);
    return int128 (x << 64);
  }

  /**
   * Convert signed 64.64 fixed point number into unsigned 64-bit integer
   * number rounding down.  Revert on underflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return unsigned 64-bit integer number
   */
  function toUInt (int128 x) internal pure returns (uint64) {
    require (x >= 0);
    return uint64 (x >> 64);
  }

  /**
   * Convert signed 128.128 fixed point number into signed 64.64-bit fixed point
   * number rounding down.  Revert on overflow.
   *
   * @param x signed 128.128-bin fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function from128x128 (int256 x) internal pure returns (int128) {
    int256 result = x >> 64;
    require (result >= MIN_64x64 && result <= MAX_64x64);
    return int128 (result);
  }

  /**
   * Convert signed 64.64 fixed point number into signed 128.128 fixed point
   * number.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 128.128 fixed point number
   */
  function to128x128 (int128 x) internal pure returns (int256) {
    return int256 (x) << 64;
  }

  /**
   * Calculate x + y.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function add (int128 x, int128 y) internal pure returns (int128) {
    int256 result = int256(x) + y;
    require (result >= MIN_64x64 && result <= MAX_64x64);
    return int128 (result);
  }

  /**
   * Calculate x - y.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function sub (int128 x, int128 y) internal pure returns (int128) {
    int256 result = int256(x) - y;
    require (result >= MIN_64x64 && result <= MAX_64x64);
    return int128 (result);
  }

  /**
   * Calculate x * y rounding down.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function mul (int128 x, int128 y) internal pure returns (int128) {
    int256 result = int256(x) * y >> 64;
    require (result >= MIN_64x64 && result <= MAX_64x64);
    return int128 (result);
  }

  /**
   * Calculate x * y rounding towards zero, where x is signed 64.64 fixed point
   * number and y is signed 256-bit integer number.  Revert on overflow.
   *
   * @param x signed 64.64 fixed point number
   * @param y signed 256-bit integer number
   * @return signed 256-bit integer number
   */
  function muli (int128 x, int256 y) internal pure returns (int256) {
    if (x == MIN_64x64) {
      require (y >= -0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF &&
        y <= 0x1000000000000000000000000000000000000000000000000);
      return -y << 63;
    } else {
      bool negativeResult = false;
      if (x < 0) {
        x = -x;
        negativeResult = true;
      }
      if (y < 0) {
        y = -y; // We rely on overflow behavior here
        negativeResult = !negativeResult;
      }
      uint256 absoluteResult = mulu (x, uint256 (y));
      if (negativeResult) {
        require (absoluteResult <=
          0x8000000000000000000000000000000000000000000000000000000000000000);
        return -int256 (absoluteResult); // We rely on overflow behavior here
      } else {
        require (absoluteResult <=
          0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
        return int256 (absoluteResult);
      }
    }
  }

  /**
   * Calculate x * y rounding down, where x is signed 64.64 fixed point number
   * and y is unsigned 256-bit integer number.  Revert on overflow.
   *
   * @param x signed 64.64 fixed point number
   * @param y unsigned 256-bit integer number
   * @return unsigned 256-bit integer number
   */
  function mulu (int128 x, uint256 y) internal pure returns (uint256) {
    if (y == 0) return 0;

    require (x >= 0);

    uint256 lo = (uint256 (x) * (y & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)) >> 64;
    uint256 hi = uint256 (x) * (y >> 128);

    require (hi <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    hi <<= 64;

    require (hi <=
      0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF - lo);
    return hi + lo;
  }

  /**
   * Calculate x / y rounding towards zero.  Revert on overflow or when y is
   * zero.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function div (int128 x, int128 y) internal pure returns (int128) {
    require (y != 0);
    int256 result = (int256 (x) << 64) / y;
    require (result >= MIN_64x64 && result <= MAX_64x64);
    return int128 (result);
  }

  /**
   * Calculate x / y rounding towards zero, where x and y are signed 256-bit
   * integer numbers.  Revert on overflow or when y is zero.
   *
   * @param x signed 256-bit integer number
   * @param y signed 256-bit integer number
   * @return signed 64.64-bit fixed point number
   */
  function divi (int256 x, int256 y) internal pure returns (int128) {
    require (y != 0);

    bool negativeResult = false;
    if (x < 0) {
      x = -x; // We rely on overflow behavior here
      negativeResult = true;
    }
    if (y < 0) {
      y = -y; // We rely on overflow behavior here
      negativeResult = !negativeResult;
    }
    uint128 absoluteResult = divuu (uint256 (x), uint256 (y));
    if (negativeResult) {
      require (absoluteResult <= 0x80000000000000000000000000000000);
      return -int128 (absoluteResult); // We rely on overflow behavior here
    } else {
      require (absoluteResult <= 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
      return int128 (absoluteResult); // We rely on overflow behavior here
    }
  }

  /**
   * Calculate x / y rounding towards zero, where x and y are unsigned 256-bit
   * integer numbers.  Revert on overflow or when y is zero.
   *
   * @param x unsigned 256-bit integer number
   * @param y unsigned 256-bit integer number
   * @return signed 64.64-bit fixed point number
   */
  function divu (uint256 x, uint256 y) internal pure returns (int128) {
    require (y != 0);
    uint128 result = divuu (x, y);
    require (result <= uint128 (MAX_64x64));
    return int128 (result);
  }

  /**
   * Calculate -x.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function neg (int128 x) internal pure returns (int128) {
    require (x != MIN_64x64);
    return -x;
  }

  /**
   * Calculate |x|.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function abs (int128 x) internal pure returns (int128) {
    require (x != MIN_64x64);
    return x < 0 ? -x : x;
  }

  /**
   * Calculate 1 / x rounding towards zero.  Revert on overflow or when x is
   * zero.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function inv (int128 x) internal pure returns (int128) {
    require (x != 0);
    int256 result = int256 (0x100000000000000000000000000000000) / x;
    require (result >= MIN_64x64 && result <= MAX_64x64);
    return int128 (result);
  }

  /**
   * Calculate arithmetics average of x and y, i.e. (x + y) / 2 rounding down.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function avg (int128 x, int128 y) internal pure returns (int128) {
    return int128 ((int256 (x) + int256 (y)) >> 1);
  }

  /**
   * Calculate geometric average of x and y, i.e. sqrt (x * y) rounding down.
   * Revert on overflow or in case x * y is negative.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function gavg (int128 x, int128 y) internal pure returns (int128) {
    int256 m = int256 (x) * int256 (y);
    require (m >= 0);
    require (m <
        0x4000000000000000000000000000000000000000000000000000000000000000);
    return int128 (sqrtu (uint256 (m)));
  }

  /**
   * Calculate x^y assuming 0^0 is 1, where x is signed 64.64 fixed point number
   * and y is unsigned 256-bit integer number.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y uint256 value
   * @return signed 64.64-bit fixed point number
   */
  function pow (int128 x, uint256 y) internal pure returns (int128) {
    uint256 absoluteResult;
    bool negativeResult = false;
    if (x >= 0) {
      absoluteResult = powu (uint256 (x) << 63, y);
    } else {
      // We rely on overflow behavior here
      absoluteResult = powu (uint256 (uint128 (-x)) << 63, y);
      negativeResult = y & 1 > 0;
    }

    absoluteResult >>= 63;

    if (negativeResult) {
      require (absoluteResult <= 0x80000000000000000000000000000000);
      return -int128 (absoluteResult); // We rely on overflow behavior here
    } else {
      require (absoluteResult <= 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
      return int128 (absoluteResult); // We rely on overflow behavior here
    }
  }

  /**
   * Calculate sqrt (x) rounding down.  Revert if x < 0.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function sqrt (int128 x) internal pure returns (int128) {
    require (x >= 0);
    return int128 (sqrtu (uint256 (x) << 64));
  }

  /**
   * Calculate binary logarithm of x.  Revert if x <= 0.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function log_2 (int128 x) internal pure returns (int128) {
    require (x > 0);

    int256 msb = 0;
    int256 xc = x;
    if (xc >= 0x10000000000000000) { xc >>= 64; msb += 64; }
    if (xc >= 0x100000000) { xc >>= 32; msb += 32; }
    if (xc >= 0x10000) { xc >>= 16; msb += 16; }
    if (xc >= 0x100) { xc >>= 8; msb += 8; }
    if (xc >= 0x10) { xc >>= 4; msb += 4; }
    if (xc >= 0x4) { xc >>= 2; msb += 2; }
    if (xc >= 0x2) msb += 1;  // No need to shift xc anymore

    int256 result = msb - 64 << 64;
    uint256 ux = uint256 (x) << uint256 (127 - msb);
    for (int256 bit = 0x8000000000000000; bit > 0; bit >>= 1) {
      ux *= ux;
      uint256 b = ux >> 255;
      ux >>= 127 + b;
      result += bit * int256 (b);
    }

    return int128 (result);
  }

  /**
   * Calculate natural logarithm of x.  Revert if x <= 0.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function ln (int128 x) internal pure returns (int128) {
    require (x > 0);

    return int128 (
        uint256 (log_2 (x)) * 0xB17217F7D1CF79ABC9E3B39803F2F6AF >> 128);
  }

  /**
   * Calculate binary exponent of x.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function exp_2 (int128 x) internal pure returns (int128) {
    require (x < 0x400000000000000000); // Overflow

    if (x < -0x400000000000000000) return 0; // Underflow

    uint256 result = 0x80000000000000000000000000000000;

    if (x & 0x8000000000000000 > 0)
      result = result * 0x16A09E667F3BCC908B2FB1366EA957D3E >> 128;
    if (x & 0x4000000000000000 > 0)
      result = result * 0x1306FE0A31B7152DE8D5A46305C85EDEC >> 128;
    if (x & 0x2000000000000000 > 0)
      result = result * 0x1172B83C7D517ADCDF7C8C50EB14A791F >> 128;
    if (x & 0x1000000000000000 > 0)
      result = result * 0x10B5586CF9890F6298B92B71842A98363 >> 128;
    if (x & 0x800000000000000 > 0)
      result = result * 0x1059B0D31585743AE7C548EB68CA417FD >> 128;
    if (x & 0x400000000000000 > 0)
      result = result * 0x102C9A3E778060EE6F7CACA4F7A29BDE8 >> 128;
    if (x & 0x200000000000000 > 0)
      result = result * 0x10163DA9FB33356D84A66AE336DCDFA3F >> 128;
    if (x & 0x100000000000000 > 0)
      result = result * 0x100B1AFA5ABCBED6129AB13EC11DC9543 >> 128;
    if (x & 0x80000000000000 > 0)
      result = result * 0x10058C86DA1C09EA1FF19D294CF2F679B >> 128;
    if (x & 0x40000000000000 > 0)
      result = result * 0x1002C605E2E8CEC506D21BFC89A23A00F >> 128;
    if (x & 0x20000000000000 > 0)
      result = result * 0x100162F3904051FA128BCA9C55C31E5DF >> 128;
    if (x & 0x10000000000000 > 0)
      result = result * 0x1000B175EFFDC76BA38E31671CA939725 >> 128;
    if (x & 0x8000000000000 > 0)
      result = result * 0x100058BA01FB9F96D6CACD4B180917C3D >> 128;
    if (x & 0x4000000000000 > 0)
      result = result * 0x10002C5CC37DA9491D0985C348C68E7B3 >> 128;
    if (x & 0x2000000000000 > 0)
      result = result * 0x1000162E525EE054754457D5995292026 >> 128;
    if (x & 0x1000000000000 > 0)
      result = result * 0x10000B17255775C040618BF4A4ADE83FC >> 128;
    if (x & 0x800000000000 > 0)
      result = result * 0x1000058B91B5BC9AE2EED81E9B7D4CFAB >> 128;
    if (x & 0x400000000000 > 0)
      result = result * 0x100002C5C89D5EC6CA4D7C8ACC017B7C9 >> 128;
    if (x & 0x200000000000 > 0)
      result = result * 0x10000162E43F4F831060E02D839A9D16D >> 128;
    if (x & 0x100000000000 > 0)
      result = result * 0x100000B1721BCFC99D9F890EA06911763 >> 128;
    if (x & 0x80000000000 > 0)
      result = result * 0x10000058B90CF1E6D97F9CA14DBCC1628 >> 128;
    if (x & 0x40000000000 > 0)
      result = result * 0x1000002C5C863B73F016468F6BAC5CA2B >> 128;
    if (x & 0x20000000000 > 0)
      result = result * 0x100000162E430E5A18F6119E3C02282A5 >> 128;
    if (x & 0x10000000000 > 0)
      result = result * 0x1000000B1721835514B86E6D96EFD1BFE >> 128;
    if (x & 0x8000000000 > 0)
      result = result * 0x100000058B90C0B48C6BE5DF846C5B2EF >> 128;
    if (x & 0x4000000000 > 0)
      result = result * 0x10000002C5C8601CC6B9E94213C72737A >> 128;
    if (x & 0x2000000000 > 0)
      result = result * 0x1000000162E42FFF037DF38AA2B219F06 >> 128;
    if (x & 0x1000000000 > 0)
      result = result * 0x10000000B17217FBA9C739AA5819F44F9 >> 128;
    if (x & 0x800000000 > 0)
      result = result * 0x1000000058B90BFCDEE5ACD3C1CEDC823 >> 128;
    if (x & 0x400000000 > 0)
      result = result * 0x100000002C5C85FE31F35A6A30DA1BE50 >> 128;
    if (x & 0x200000000 > 0)
      result = result * 0x10000000162E42FF0999CE3541B9FFFCF >> 128;
    if (x & 0x100000000 > 0)
      result = result * 0x100000000B17217F80F4EF5AADDA45554 >> 128;
    if (x & 0x80000000 > 0)
      result = result * 0x10000000058B90BFBF8479BD5A81B51AD >> 128;
    if (x & 0x40000000 > 0)
      result = result * 0x1000000002C5C85FDF84BD62AE30A74CC >> 128;
    if (x & 0x20000000 > 0)
      result = result * 0x100000000162E42FEFB2FED257559BDAA >> 128;
    if (x & 0x10000000 > 0)
      result = result * 0x1000000000B17217F7D5A7716BBA4A9AE >> 128;
    if (x & 0x8000000 > 0)
      result = result * 0x100000000058B90BFBE9DDBAC5E109CCE >> 128;
    if (x & 0x4000000 > 0)
      result = result * 0x10000000002C5C85FDF4B15DE6F17EB0D >> 128;
    if (x & 0x2000000 > 0)
      result = result * 0x1000000000162E42FEFA494F1478FDE05 >> 128;
    if (x & 0x1000000 > 0)
      result = result * 0x10000000000B17217F7D20CF927C8E94C >> 128;
    if (x & 0x800000 > 0)
      result = result * 0x1000000000058B90BFBE8F71CB4E4B33D >> 128;
    if (x & 0x400000 > 0)
      result = result * 0x100000000002C5C85FDF477B662B26945 >> 128;
    if (x & 0x200000 > 0)
      result = result * 0x10000000000162E42FEFA3AE53369388C >> 128;
    if (x & 0x100000 > 0)
      result = result * 0x100000000000B17217F7D1D351A389D40 >> 128;
    if (x & 0x80000 > 0)
      result = result * 0x10000000000058B90BFBE8E8B2D3D4EDE >> 128;
    if (x & 0x40000 > 0)
      result = result * 0x1000000000002C5C85FDF4741BEA6E77E >> 128;
    if (x & 0x20000 > 0)
      result = result * 0x100000000000162E42FEFA39FE95583C2 >> 128;
    if (x & 0x10000 > 0)
      result = result * 0x1000000000000B17217F7D1CFB72B45E1 >> 128;
    if (x & 0x8000 > 0)
      result = result * 0x100000000000058B90BFBE8E7CC35C3F0 >> 128;
    if (x & 0x4000 > 0)
      result = result * 0x10000000000002C5C85FDF473E242EA38 >> 128;
    if (x & 0x2000 > 0)
      result = result * 0x1000000000000162E42FEFA39F02B772C >> 128;
    if (x & 0x1000 > 0)
      result = result * 0x10000000000000B17217F7D1CF7D83C1A >> 128;
    if (x & 0x800 > 0)
      result = result * 0x1000000000000058B90BFBE8E7BDCBE2E >> 128;
    if (x & 0x400 > 0)
      result = result * 0x100000000000002C5C85FDF473DEA871F >> 128;
    if (x & 0x200 > 0)
      result = result * 0x10000000000000162E42FEFA39EF44D91 >> 128;
    if (x & 0x100 > 0)
      result = result * 0x100000000000000B17217F7D1CF79E949 >> 128;
    if (x & 0x80 > 0)
      result = result * 0x10000000000000058B90BFBE8E7BCE544 >> 128;
    if (x & 0x40 > 0)
      result = result * 0x1000000000000002C5C85FDF473DE6ECA >> 128;
    if (x & 0x20 > 0)
      result = result * 0x100000000000000162E42FEFA39EF366F >> 128;
    if (x & 0x10 > 0)
      result = result * 0x1000000000000000B17217F7D1CF79AFA >> 128;
    if (x & 0x8 > 0)
      result = result * 0x100000000000000058B90BFBE8E7BCD6D >> 128;
    if (x & 0x4 > 0)
      result = result * 0x10000000000000002C5C85FDF473DE6B2 >> 128;
    if (x & 0x2 > 0)
      result = result * 0x1000000000000000162E42FEFA39EF358 >> 128;
    if (x & 0x1 > 0)
      result = result * 0x10000000000000000B17217F7D1CF79AB >> 128;

    result >>= uint256 (63 - (x >> 64));
    require (result <= uint256 (MAX_64x64));

    return int128 (result);
  }

  /**
   * Calculate natural exponent of x.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */
  function exp (int128 x) internal pure returns (int128) {
    require (x < 0x400000000000000000); // Overflow

    if (x < -0x400000000000000000) return 0; // Underflow

    return exp_2 (
        int128 (int256 (x) * 0x171547652B82FE1777D0FFDA0D23A7D12 >> 128));
  }

  /**
   * Calculate x / y rounding towards zero, where x and y are unsigned 256-bit
   * integer numbers.  Revert on overflow or when y is zero.
   *
   * @param x unsigned 256-bit integer number
   * @param y unsigned 256-bit integer number
   * @return unsigned 64.64-bit fixed point number
   */
  function divuu (uint256 x, uint256 y) private pure returns (uint128) {
    require (y != 0);

    uint256 result;

    if (x <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
      result = (x << 64) / y;
    else {
      uint256 msb = 192;
      uint256 xc = x >> 192;
      if (xc >= 0x100000000) { xc >>= 32; msb += 32; }
      if (xc >= 0x10000) { xc >>= 16; msb += 16; }
      if (xc >= 0x100) { xc >>= 8; msb += 8; }
      if (xc >= 0x10) { xc >>= 4; msb += 4; }
      if (xc >= 0x4) { xc >>= 2; msb += 2; }
      if (xc >= 0x2) msb += 1;  // No need to shift xc anymore

      result = (x << 255 - msb) / ((y - 1 >> msb - 191) + 1);
      require (result <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);

      uint256 hi = result * (y >> 128);
      uint256 lo = result * (y & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);

      uint256 xh = x >> 192;
      uint256 xl = x << 64;

      if (xl < lo) xh -= 1;
      xl -= lo; // We rely on overflow behavior here
      lo = hi << 128;
      if (xl < lo) xh -= 1;
      xl -= lo; // We rely on overflow behavior here

      assert (xh == hi >> 128);

      result += xl / y;
    }

    require (result <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    return uint128 (result);
  }

  /**
   * Calculate x^y assuming 0^0 is 1, where x is unsigned 129.127 fixed point
   * number and y is unsigned 256-bit integer number.  Revert on overflow.
   *
   * @param x unsigned 129.127-bit fixed point number
   * @param y uint256 value
   * @return unsigned 129.127-bit fixed point number
   */
  function powu (uint256 x, uint256 y) private pure returns (uint256) {
    if (y == 0) return 0x80000000000000000000000000000000;
    else if (x == 0) return 0;
    else {
      int256 msb = 0;
      uint256 xc = x;
      if (xc >= 0x100000000000000000000000000000000) { xc >>= 128; msb += 128; }
      if (xc >= 0x10000000000000000) { xc >>= 64; msb += 64; }
      if (xc >= 0x100000000) { xc >>= 32; msb += 32; }
      if (xc >= 0x10000) { xc >>= 16; msb += 16; }
      if (xc >= 0x100) { xc >>= 8; msb += 8; }
      if (xc >= 0x10) { xc >>= 4; msb += 4; }
      if (xc >= 0x4) { xc >>= 2; msb += 2; }
      if (xc >= 0x2) msb += 1;  // No need to shift xc anymore

      int256 xe = msb - 127;
      if (xe > 0) x >>= uint256 (xe);
      else x <<= uint256 (-xe);

      uint256 result = 0x80000000000000000000000000000000;
      int256 re = 0;

      while (y > 0) {
        if (y & 1 > 0) {
          result = result * x;
          y -= 1;
          re += xe;
          if (result >=
            0x8000000000000000000000000000000000000000000000000000000000000000) {
            result >>= 128;
            re += 1;
          } else result >>= 127;
          if (re < -127) return 0; // Underflow
          require (re < 128); // Overflow
        } else {
          x = x * x;
          y >>= 1;
          xe <<= 1;
          if (x >=
            0x8000000000000000000000000000000000000000000000000000000000000000) {
            x >>= 128;
            xe += 1;
          } else x >>= 127;
          if (xe < -127) return 0; // Underflow
          require (xe < 128); // Overflow
        }
      }

      if (re > 0) result <<= uint256 (re);
      else if (re < 0) result >>= uint256 (-re);

      return result;
    }
  }

  /**
   * Calculate sqrt (x) rounding down, where x is unsigned 256-bit integer
   * number.
   *
   * @param x unsigned 256-bit integer number
   * @return unsigned 128-bit integer number
   */
  function sqrtu (uint256 x) private pure returns (uint128) {
    if (x == 0) return 0;
    else {
      uint256 xx = x;
      uint256 r = 1;
      if (xx >= 0x100000000000000000000000000000000) { xx >>= 128; r <<= 64; }
      if (xx >= 0x10000000000000000) { xx >>= 64; r <<= 32; }
      if (xx >= 0x100000000) { xx >>= 32; r <<= 16; }
      if (xx >= 0x10000) { xx >>= 16; r <<= 8; }
      if (xx >= 0x100) { xx >>= 8; r <<= 4; }
      if (xx >= 0x10) { xx >>= 4; r <<= 2; }
      if (xx >= 0x8) { r <<= 1; }
      r = (r + x / r) >> 1;
      r = (r + x / r) >> 1;
      r = (r + x / r) >> 1;
      r = (r + x / r) >> 1;
      r = (r + x / r) >> 1;
      r = (r + x / r) >> 1;
      r = (r + x / r) >> 1; // Seven iterations should be enough
      uint256 r1 = x / r;
      return uint128 (r < r1 ? r : r1);
    }
  }
}


// File contracts/LsLMSR.sol

pragma solidity ^0.6.0;

/// @title An implementation for liquidity-sensitive LMSR market maker in Solidity
/// @author Abdulla Al-Kamil
/// @dev Feel free to make any adjustments to the code








contract LsLMSR is IERC1155Receiver, Ownable{

  /**
   * Please note: the contract utilitises the ABDKMath library to allow for
   * mathematical functions such as logarithms and exponents. As such, all the
   * state variables are stored as int128(signed 64.64 bit fixed point number).
   */

  using SafeERC20 for IERC20;

  uint public numOutcomes;
  int128[] private q;
  int128 private b;
  int128 private alpha;
  int128 private current_cost;
  int128 private total_shares;

  bytes32 public condition;
  ConditionalTokens private CT;
  address public token;

  bool private init;

  /**
   * @notice Constructor function for the market maker
   * @param _ct The address for the deployed conditional tokens contract
   * @param _token Which ERC-20 token will be used to purchase and redeem
      outcome tokens for this condition
   */
  constructor(
    address _ct,
    address _token
  ) public {
    CT = ConditionalTokens(_ct);
    token = _token;
  }

  /**
   * @notice Set up some of the variables for the market maker
   * @param _oracle The address for the EOA/contract which will act as the
      oracle for this condition
   * @param _questionId The question ID (needs to be unique)
   * @param _numOutcomes The number of different outcomes available
   * _subsidyToken Which ERC-20 token will be used to purchase and redeem
      outcome tokens for this condition
   * @param _subsidy How much initial funding is used to seed the market maker.
   * @param _overround How much 'profit' does the AMM claim? Note that this is
   * represented in bips. Therefore inputting 300 represents 0.30%
   */
  function setup(
    address _oracle,
    bytes32 _questionId,
    uint _numOutcomes,
    uint _subsidy,
    uint _overround
  ) public onlyOwner() {
    require(init == false,'Already init');
    require(_overround > 0,'Cannot have 0 overround');
    CT.prepareCondition(_oracle, _questionId, _numOutcomes);
    condition = CT.getConditionId(_oracle, _questionId, _numOutcomes);

    IERC20(token).safeTransferFrom(msg.sender, address(this), _subsidy);

    numOutcomes = _numOutcomes;
    int128 n = ABDKMath.fromUInt(_numOutcomes);
    int128 initial_subsidy = getTokenEth(token, _subsidy);

    int128 overround = ABDKMath.divu(_overround, 10000); //TODO: if the overround is too low, then the exp overflows
    alpha = ABDKMath.div(overround, ABDKMath.mul(n,ABDKMath.ln(n)));
    b = ABDKMath.mul(ABDKMath.mul(initial_subsidy, n), alpha);

    for(uint i=0; i<_numOutcomes; i++) {
      q.push(initial_subsidy);
    }

    init = true;

    total_shares = ABDKMath.mul(initial_subsidy, n);
    current_cost = cost();
  }

  /**
   * @notice This function is used to buy outcome tokens.
   * @param _outcome The outcome(s) which a user is buying tokens for.
      Note: This is the integer representation for the bit array.
   * @param _amount This is the number of outcome tokens purchased
   * @return _price The cost to purchase _amount number of tokens
   */
  function buy(
    uint256 _outcome,
    int128 _amount
  ) public onlyAfterInit() returns (int128 _price){
    int128 sum_total;
    require(_outcome > 0);
    require(CT.payoutDenominator(condition) == 0, 'Market already resolved');

    for(uint j=0; j<numOutcomes; j++) {
      if((_outcome & (1<<j)) != 0) {
        q[j] = ABDKMath.add(q[j], _amount);
        total_shares = ABDKMath.add(total_shares, _amount);
      }
    }

    b = ABDKMath.mul(total_shares, alpha);

    for(uint i=0; i< numOutcomes; i++) {
      sum_total = ABDKMath.add(sum_total,
        ABDKMath.exp(
          ABDKMath.div(q[i], b)
          ));
    }

    int128 new_cost = ABDKMath.mul(b,ABDKMath.ln(sum_total));
    _price = ABDKMath.sub(new_cost,current_cost);
    current_cost = new_cost;

    uint token_cost = getTokenWei(token, _price);
    uint n_outcome_tokens = getTokenWei(token, _amount);
    uint pos = CT.getPositionId(IERC20(token),
      CT.getCollectionId(bytes32(0), condition, _outcome));

    require(IERC20(token).transferFrom(msg.sender, address(this), token_cost),
      'Error transferring tokens');

    if(CT.balanceOf(address(this), pos) < n_outcome_tokens) {
      IERC20(token).approve(address(CT), getTokenWei(token, _amount));
      CT.splitPosition(IERC20(token), bytes32(0), condition,
        getPositionAndDustPositions(_outcome), n_outcome_tokens);
      }
    CT.safeTransferFrom(address(this), msg.sender,
      pos, n_outcome_tokens, '');
  }

  function withdraw() public onlyAfterInit() onlyOwner() {
    require(CT.payoutDenominator(condition) != 0, 'Market needs to be resolved');
    uint[] memory dust = new uint256[](numOutcomes);
    uint p = 0;
    for (uint i=0; i<numOutcomes; i++) {
      dust[i] = 1<<i;
    }
    CT.redeemPositions(IERC20(token), bytes32(0), condition, dust);
    IERC20(token).safeTransfer(msg.sender, IERC20(token).balanceOf(address(this)));
  }

  function getOnes(uint n) internal pure returns (uint count) {
    while(n!=0) {
      n = n&(n-1);
      count++;
    }
  }

  function getPositionAndDustPositions(
    uint _outcome
  ) public view returns (uint256[] memory){
    uint index = (1<<numOutcomes)-1;
    uint inv = _outcome^index;
    uint[] memory partx = new uint256[](getOnes(inv)+1);
    uint n = 1;
    partx[0] = _outcome;
    for(uint i=0; i<numOutcomes; i++) {
      if((inv & 1<<i) != 0) {
        partx[n] = 1<<i;
        n++;
      }
    }
    return partx;
  }

  /**
   * @notice View function returning the cost function.
   *  This function returns the cost for this inventory state. It will be able
      to tell you the total amount of collateral spent within the market maker.
      For example, if a pool was seeded with 100 DAI and then a further 20 DAI
      has been spent, this function will return 120 DAI.
   */
  function cost() public view onlyAfterInit() returns (int128) {
    int128 sum_total;
    for(uint i=0; i< numOutcomes; i++) {
      sum_total = ABDKMath.add(sum_total, ABDKMath.exp(ABDKMath.div(q[i], b)));
    }
    return ABDKMath.mul(b, ABDKMath.ln(sum_total));
  }

  /**
   *  This function will tell you the cost (similar to above) after a proposed
      transaction.
   */
  function cost_after_buy(
    uint256 _outcome,
    int128 _amount
  ) public view returns (int128) {
    int128 sum_total;
    int128[] memory newq = new int128[](q.length);
    int128 TB = total_shares;

    for(uint j=0; j< numOutcomes; j++) {
      if((_outcome & (1<<j)) != 0) {
        newq[j] = ABDKMath.add(q[j], _amount);
        TB = ABDKMath.add(TB, _amount);
      } else {
        newq[j] = q[j];
      }
    }

    int128 _b = ABDKMath.mul(TB, alpha);

    for(uint i=0; i< numOutcomes; i++) {
      sum_total = ABDKMath.add(sum_total,
        ABDKMath.exp(
          ABDKMath.div(newq[i], _b)
          ));
    }

    return ABDKMath.mul(_b, ABDKMath.ln(sum_total));
  }

  /**
   *  This function tells you how much it will cost to make a particular trade.
      It does this by calculating the difference between the current cost and
      the cost after the transaction.
   */
  function price(
    uint256 _outcome,
    int128 _amount
  ) public view returns (int128) {
    return cost_after_buy(_outcome, _amount) - current_cost;
  }

  function getTokenWei(
    address _token,
    int128 _amount
  ) public view returns (uint) {
    uint d = ERC20(_token).decimals();
    return ABDKMath.mulu(_amount, 10 ** d);
  }

  function getTokenEth(
    address _token,
    uint _amount
  ) public view returns (int128) {
    uint d = ERC20(_token).decimals();
    return ABDKMath.divu(_amount, 10 ** d);
  }

  function onERC1155Received(
    address operator,
    address from,
    uint256 id,
    uint256 value,
    bytes calldata data
  ) external override returns(bytes4) {
    return this.onERC1155Received.selector;
  }

  function onERC1155BatchReceived(
    address operator,
    address from,
    uint256[] calldata ids,
    uint256[] calldata values,
    bytes calldata data
  ) external override returns(bytes4) {
    return this.onERC1155BatchReceived.selector;
  }

   function supportsInterface(
     bytes4 interfaceId
  ) external override view returns (bool) {}

    modifier onlyAfterInit {
      require(init == true);
      _;
    }

}
