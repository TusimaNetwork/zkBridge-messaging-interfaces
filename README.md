# zkBridge Messaging - Interfaces 

![Tusima zkBridge](https://ucarecdn.com/f4e08f06-c238-47f8-b98a-97629c199377/bridgelogo.png)

[![Tests](https://github.com/TusimaNetwork/zkBridge-messaging-interfaces/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/TusimaNetwork/zkBridge-messaging-interfaces/actions/workflows/test.yml)
[![Twitter Follow](https://img.shields.io/twitter/follow/TusimaNetwork?style=social)](https://twitter.com/TusimaNetwork)
[![Discord](https://img.shields.io/discord/965918503070728203?logo=Discord&logoColor=5865F2&label=discord&color=3ae600
)](https://discord.com/invite/tusimanetwork)

This repo is the interface repo of the zkBridge Messaging component and mainly contains three files: [IMessaging.sol](./src/interfaces/IMessaging.sol), [Receiver.sol](./src/interfaces/Receiver.sol) and [ReceiverUpgradeable.sol](./src/interfaces/ReceiverUpgradeable.sol). Developers can easily implement cross-chain communication by introducing interface files.

More detailed information about Tusima zkBridge please refer to [here](https://tusima.gitbook.io/zkbridge/).

More detailed information about Tusima zkBridge Messaging component please refer to [here](https://tusima.gitbook.io/zkbridge/build-with-messaging/overview).



## IMessaging
`IMessaging.sol` is an Solidity interface file, you can find it [here](./src/interfaces/IMessaging.sol).

This file includes two interfaces, `ISender` and `IReceiver`, corresponding to Sending and Receiving functionalities, respectively.

You can implement the message receiving function yourself using the `IReceiver` interface. However, you must ensure the following:

* Verify that `msg.sender` originates from Tusima's `Messaging` contract.
* Return the function selector at the end of the function, i.e., `return IReceiver.handleMsg.selector`.


## Receiver

We also provide a simpler usage method, that is `Receiver.sol`, an abstract contract. By implementing the interfaces defined in this abstract contract, you won't need to verify the source of `msg.sender` or return the function selector. You can solely concentrate on the message processing logic. You can find its code [here](./src/interfaces/Receiver.sol).

## ReceiverUpgradeable

If you wish to make your contract upgradeable, we also offer `ReceiverUpgradeable.sol`, and its code is [here](./src/interfaces/ReceiverUpgradeable.sol).