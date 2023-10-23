// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IReceiver} from "./IMessaging.sol";

abstract contract Receiver is IReceiver {
    error WrongCaller(address sender);

    address public tusimaMessaging;

    constructor(address _tusimaMessaging) {
        tusimaMessaging = _tusimaMessaging;
    }

    function handleMsg(uint32 sourceChainId, address sourceAddr, bytes memory message)
        external
        override
        returns (bytes4)
    {
        if (msg.sender != tusimaMessaging) {
            revert WrongCaller(msg.sender);
        }
        handleMsgImpl(sourceChainId, sourceAddr, message);
        return IReceiver.handleMsg.selector;
    }

    function handleMsgImpl(uint32 sourceChainId, address sourceAddr, bytes memory message)
        internal
        virtual;
}
