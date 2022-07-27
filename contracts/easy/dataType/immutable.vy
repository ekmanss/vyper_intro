"""
Immutable variables are like constants except value are assigned when the contract is deployed.

When to use immutable variables?
You have a variable that needs to be set when the contract is deployed, for example like setting contract owner to msg.sender
and this variable will never change after deployment
Why declare variables as immutable?
Like constants, immutable variables save run time gas

"""

# @version ^0.3.3

OWNER: immutable(address)
MY_IMMUTABLE: immutable(uint256)

@external
def __init__(_val: uint256):
    OWNER = msg.sender
    MY_IMMUTABLE = _val


@external
@pure
def getMyImmutable() -> uint256:
    return MY_IMMUTABLE