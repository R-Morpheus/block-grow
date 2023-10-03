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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Portfolio")));
bytes32 constant PortfolioTableId = _tableId;

struct PortfolioData {
  bytes32 entityPortfolio;
  bytes32 selectedToken;
  bytes32[] list;
}

library Portfolio {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](3);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.BYTES32;
    _schema[2] = SchemaType.BYTES32_ARRAY;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](3);
    _fieldNames[0] = "entityPortfolio";
    _fieldNames[1] = "selectedToken";
    _fieldNames[2] = "list";
    return ("Portfolio", _fieldNames);
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

  /** Get entityPortfolio */
  function getEntityPortfolio(bytes32 entity) internal view returns (bytes32 entityPortfolio) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get entityPortfolio (using the specified store) */
  function getEntityPortfolio(IStore _store, bytes32 entity) internal view returns (bytes32 entityPortfolio) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (Bytes.slice32(_blob, 0));
  }

  /** Set entityPortfolio */
  function setEntityPortfolio(bytes32 entity, bytes32 entityPortfolio) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((entityPortfolio)));
  }

  /** Set entityPortfolio (using the specified store) */
  function setEntityPortfolio(IStore _store, bytes32 entity, bytes32 entityPortfolio) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((entityPortfolio)));
  }

  /** Get selectedToken */
  function getSelectedToken(bytes32 entity) internal view returns (bytes32 selectedToken) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get selectedToken (using the specified store) */
  function getSelectedToken(IStore _store, bytes32 entity) internal view returns (bytes32 selectedToken) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (Bytes.slice32(_blob, 0));
  }

  /** Set selectedToken */
  function setSelectedToken(bytes32 entity, bytes32 selectedToken) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((selectedToken)));
  }

  /** Set selectedToken (using the specified store) */
  function setSelectedToken(IStore _store, bytes32 entity, bytes32 selectedToken) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((selectedToken)));
  }

  /** Get list */
  function getList(bytes32 entity) internal view returns (bytes32[] memory list) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Get list (using the specified store) */
  function getList(IStore _store, bytes32 entity) internal view returns (bytes32[] memory list) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /** Set list */
  function setList(bytes32 entity, bytes32[] memory list) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setField(_tableId, _keyTuple, 2, EncodeArray.encode((list)));
  }

  /** Set list (using the specified store) */
  function setList(IStore _store, bytes32 entity, bytes32[] memory list) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    _store.setField(_tableId, _keyTuple, 2, EncodeArray.encode((list)));
  }

  /** Get the length of list */
  function lengthList(bytes32 entity) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 32;
  }

  /** Get the length of list (using the specified store) */
  function lengthList(IStore _store, bytes32 entity) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 32;
  }

  /** Get an item of list (unchecked, returns invalid data if index overflows) */
  function getItemList(bytes32 entity, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get an item of list (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemList(IStore _store, bytes32 entity, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 32, (_index + 1) * 32);
    return (Bytes.slice32(_blob, 0));
  }

  /** Push an element to list */
  function pushList(bytes32 entity, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.pushToField(_tableId, _keyTuple, 2, abi.encodePacked((_element)));
  }

  /** Push an element to list (using the specified store) */
  function pushList(IStore _store, bytes32 entity, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    _store.pushToField(_tableId, _keyTuple, 2, abi.encodePacked((_element)));
  }

  /** Pop an element from list */
  function popList(bytes32 entity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.popFromField(_tableId, _keyTuple, 2, 32);
  }

  /** Pop an element from list (using the specified store) */
  function popList(IStore _store, bytes32 entity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    _store.popFromField(_tableId, _keyTuple, 2, 32);
  }

  /** Update an element of list at `_index` */
  function updateList(bytes32 entity, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.updateInField(_tableId, _keyTuple, 2, _index * 32, abi.encodePacked((_element)));
  }

  /** Update an element of list (using the specified store) at `_index` */
  function updateList(IStore _store, bytes32 entity, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    _store.updateInField(_tableId, _keyTuple, 2, _index * 32, abi.encodePacked((_element)));
  }

  /** Get the full data */
  function get(bytes32 entity) internal view returns (PortfolioData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 entity) internal view returns (PortfolioData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 entity, bytes32 entityPortfolio, bytes32 selectedToken, bytes32[] memory list) internal {
    bytes memory _data = encode(entityPortfolio, selectedToken, list);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 entity,
    bytes32 entityPortfolio,
    bytes32 selectedToken,
    bytes32[] memory list
  ) internal {
    bytes memory _data = encode(entityPortfolio, selectedToken, list);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 entity, PortfolioData memory _table) internal {
    set(entity, _table.entityPortfolio, _table.selectedToken, _table.list);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 entity, PortfolioData memory _table) internal {
    set(_store, entity, _table.entityPortfolio, _table.selectedToken, _table.list);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (PortfolioData memory _table) {
    // 64 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 64));

    _table.entityPortfolio = (Bytes.slice32(_blob, 0));

    _table.selectedToken = (Bytes.slice32(_blob, 32));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 64) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 96;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.list = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    bytes32 entityPortfolio,
    bytes32 selectedToken,
    bytes32[] memory list
  ) internal pure returns (bytes memory) {
    uint40[] memory _counters = new uint40[](1);
    _counters[0] = uint40(list.length * 32);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(entityPortfolio, selectedToken, _encodedLengths.unwrap(), EncodeArray.encode((list)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 entity) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 entity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 entity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = entity;

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
