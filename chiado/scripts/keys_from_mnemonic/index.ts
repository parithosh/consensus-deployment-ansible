import {
  deriveKeyFromMaster,
  deriveKeyFromMnemonic,
  eth2ValidatorPaths,
} from "@chainsafe/bls-keygen";
import { Keystore } from "@chainsafe/bls-keystore";
import bls from "@chainsafe/bls";
import fs from "fs";
import path from "path";
import { randomBytes } from "crypto";

const { out_dir, mnemonic, index_start, password } = process.env;

const mnemonicCount = 1000;
const batchSize = 10;
const padCount = 5; // network has less than 100,000 vals

if (out_dir === undefined) throw Error("no out_dir");
if (mnemonic === undefined) throw Error("no mnemonic");
if (index_start === undefined) throw Error("no index_start");
const indexStartNum = parseInt(index_start);
if (isNaN(indexStartNum)) throw Error("bad index_start");

const masterSK = deriveKeyFromMnemonic(mnemonic);

for (let minIndex = 0; minIndex < mnemonicCount; minIndex += batchSize) {
  const passwordBatch = password ?? randomBytes(16).toString("hex");
  const dirname = [fI(minIndex), fI(minIndex + batchSize)].join("_");

  const dirpath = path.join(out_dir, dirname);
  fs.mkdirSync(dirpath, { recursive: true });

  fs.writeFileSync(path.join(dirpath, "password.txt"), passwordBatch);

  for (let i = 0; i < batchSize; i++) {
    const index = minIndex + i;
    const keyPath = eth2ValidatorPaths(index).signing;
    const privKey = deriveKeyFromMaster(masterSK, keyPath);
    const publicKey = bls.SecretKey.fromBytes(privKey).toPublicKey().toBytes();

    const keystore = await Keystore.create(
      passwordBatch,
      privKey,
      publicKey,
      keyPath
    );

    const filename = `keystore-${fI(index)}.json`;
    fs.writeFileSync(path.join(dirpath, filename), keystore.stringify());

    console.log(filename, Buffer.from(publicKey).toString("hex"));
  }
}

/** Format index */
function fI(n: number): string {
  return String(indexStartNum + n).padStart(padCount, "0");
}
