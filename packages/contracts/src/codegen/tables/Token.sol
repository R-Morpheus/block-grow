// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Token")));
bytes32 constant TokenTableId = _tableId;

struct TokenData {
  uint256 factor;
  string name;
}

library Token {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.UINT256;
    _schema[1] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](2);
    _fieldNames[0] = "factor";
    _fieldNames[1] = "name";
    return ("Token", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get factor */
  function getFactor(bytes32 owner, bytes32 token) internal view returns (uint256 factor) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Get factor (using the specified store) */
  function getFactor(IStore _store, bytes32 owner, bytes32 token) internal view returns (uint256 factor) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (uint256(Bytes.slice32(_blob, 0)));
  }

  /** Set factor */
  function setFactor(bytes32 owner, bytes32 token, uint256 factor) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((factor)));
  }

  /** Set factor (using the specified store) */
  function setFactor(IStore _store, bytes32 owner, bytes32 token, uint256 factor) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((factor)));
  }

  /** Get name */
  function getName(bytes32 owner, bytes32 token) internal view returns (string memory name) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /** Get name (using the specified store) */
  function getName(IStore _store, bytes32 owner, bytes32 token) internal view returns (string memory name) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /** Set name */
  function setName(bytes32 owner, bytes32 token, string memory name) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    StoreSwitch.setField(_tableId, _keyTuple, 1, bytes((name)));
  }

  /** Set name (using the specified store) */
  function setName(IStore _store, bytes32 owner, bytes32 token, string memory name) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    _store.setField(_tableId, _keyTuple, 1, bytes((name)));
  }

  /** Get the length of name */
  function lengthName(bytes32 owner, bytes32 token) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of name (using the specified store) */
  function lengthName(IStore _store, bytes32 owner, bytes32 token) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of name (unchecked, returns invalid data if index overflows) */
  function getItemName(bytes32 owner, bytes32 token, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of name (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemName(
    IStore _store,
    bytes32 owner,
    bytes32 token,
    uint256 _index
  ) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to name */
  function pushName(bytes32 owner, bytes32 token, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    StoreSwitch.pushToField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /** Push a slice to name (using the specified store) */
  function pushName(IStore _store, bytes32 owner, bytes32 token, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    _store.pushToField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /** Pop a slice from name */
  function popName(bytes32 owner, bytes32 token) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    StoreSwitch.popFromField(_tableId, _keyTuple, 1, 1);
  }

  /** Pop a slice from name (using the specified store) */
  function popName(IStore _store, bytes32 owner, bytes32 token) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    _store.popFromField(_tableId, _keyTuple, 1, 1);
  }

  /** Update a slice of name at `_index` */
  function updateName(bytes32 owner, bytes32 token, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    StoreSwitch.updateInField(_tableId, _keyTuple, 1, _index * 1, bytes((_slice)));
  }

  /** Update a slice of name (using the specified store) at `_index` */
  function updateName(IStore _store, bytes32 owner, bytes32 token, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    _store.updateInField(_tableId, _keyTuple, 1, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(bytes32 owner, bytes32 token) internal view returns (TokenData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 owner, bytes32 token) internal view returns (TokenData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 owner, bytes32 token, uint256 factor, string memory name) internal {
    bytes memory _data = encode(factor, name);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 owner, bytes32 token, uint256 factor, string memory name) internal {
    bytes memory _data = encode(factor, name);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 owner, bytes32 token, TokenData memory _table) internal {
    set(owner, token, _table.factor, _table.name);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 owner, bytes32 token, TokenData memory _table) internal {
    set(_store, owner, token, _table.factor, _table.name);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (TokenData memory _table) {
    // 32 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 32));

    _table.factor = (uint256(Bytes.slice32(_blob, 0)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 32) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 64;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.name = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(uint256 factor, string memory name) internal pure returns (bytes memory) {
    uint40[] memory _counters = new uint40[](1);
    _counters[0] = uint40(bytes(name).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(factor, _encodedLengths.unwrap(), bytes((name)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 owner, bytes32 token) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 owner, bytes32 token) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 owner, bytes32 token) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = owner;
    _keyTuple[1] = token;

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
