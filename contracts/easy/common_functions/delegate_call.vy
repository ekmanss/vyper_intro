"""
When contract A delegates call to contract B, B's code will be executed inside contract A. This will update state variables and Ether balance inside contract A and not B.

Delegate call is commonly used to create an upgradable contract.

Here is the contract that we will delegate call to.

# @version ^0.3.3

## State variables must be declared in the same order
## as contract making the call
#x: public(uint256)
#y: public(uint256)
#
#
#@external
#def updateX(x: uint256):
#    # when this function is called with delegate call
#    # this will update self.x inside the calling contract
#    self.x = x + 1
#
#
#@external
#def updateY(y: uint256):
#    self.y = y * y

"""


# @version ^0.3.3


x: public(uint256)
y: public(uint256)


@external
def updateX(to: address, x: uint256):
    raw_call(
        to,
        concat(
            method_id("updateX(uint256)"),
            convert(x, bytes32)
        ),
        is_delegate_call=True
    )


@external
def updateY(to: address, y: uint256):
    raw_call(
        to,
        concat(
            method_id("updateY(uint256)"),
            convert(y, bytes32)
        ),
        is_delegate_call=True
    )
