import fs from "fs";
import { execSync } from "child_process";

// Usage
// node list.mjs QmSXhXJY6XxzpUYCZBgPbQ7EVDkH5t1ZXSuQ1UjPB8iCZD

/** No ipfs/ prefix: just `QmSXhXJY6XxzpUYCZBgPbQ7EVDkH5t1ZXSuQ1UjPB8iCZD` */
const dir_cid = process.argv[2];

// {
//   "Data": { "/": { "bytes": "CAE" } },
//   "Links": [
//     {
//       "Hash": { "/": "QmWWjLt7roLJkfkoRsDGBcsDyNXC5gZahF6zmkvEPYQhGP" },
//       "Name": "69000_69010",
//       "Tsize": 9358
//     },
const listStr = execSync(
  `curl -X POST https://ipfs.infura.io:5001/api/v0/dag/get?arg=${dir_cid}`,
  { encoding: "utf8" }
);

const list = JSON.parse(listStr);
const rows = list.Links.map((item) =>
  [item.Name, "https://ipfs.io/ipfs/" + item.Hash["/"]].join(",")
);
const csv = rows.join("\n");

fs.writeFileSync(`${dir_cid}.csv`, csv);
