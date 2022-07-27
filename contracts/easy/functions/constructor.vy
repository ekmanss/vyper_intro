# __init__ is a special function that is executed only once
# when the contract is deployed.
# It is commonly used to initialize state variables.


# @version ^0.3.3

owner: public(address)
name: public(String[10])
createdAt: public(uint256)
expiresAt: public(uint256)


@external
def __init__(name: String[10], duration: uint256):
    # set owner to caller
    self.owner = msg.sender
    # set name from input
    self.name = name
    self.createdAt = block.timestamp
    self.expiresAt = block.timestamp + duration
