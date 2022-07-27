"""

Vyper contracts can deploy new contracts using the function create_forwarder_to.

create_forwarder_to is also known as "minimal proxy contract". How it works, we won't explain it here.

Here we will focus on how to use it to deploy new contracts.

How to use create_forwarder_to
Deploy ContractToDeploy. This is the "master copy." All deployed contracts will execute code from this master copy.
Call deploy() passing the address of the master copy and any other arguments needed to setup the new contract
Here is ContractToDeploy

# @version ^0.3.3


#owner: public(address)
#
#
## __init__ is not called when deployed from create_forwarder_to
#@external
#def __init__():
#  self.owner = msg.sender
#
#
## call once after create_forwarder_to
#@external
#def setup(owner: address):
#  assert self.owner == ZERO_ADDRESS, "owner != zero address"
#  self.owner = owner
#
#
## DANGER: never have selfdestruct in original contract used by create_forwarder_to
#@external
#def kill():
#  selfdestruct(msg.sender)

"""


# @version ^0.3.3


interface ContractToDeploy:
    def setup(owner: address): nonpayable


event Log:
    addr: address


@external
def deploy(_masterCopy: address, owner: address):
    addr: address = create_forwarder_to(_masterCopy)
    ContractToDeploy(addr).setup(owner)
    log Log(addr)


@external
def deployTest(_masterCopy: address):
    addr: address = create_forwarder_to(_masterCopy)
    ContractToDeploy(addr).setup(self)
    log Log(addr)
