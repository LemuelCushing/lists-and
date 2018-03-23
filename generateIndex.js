const fs = require('fs');
const dirTree = require('directory-tree');

let treeMarkdown = "";

const tree = dirTree('./lists/', {exclude:/node_modules/, extensions:/\.md/}, (item, PATH)=>
  treeMarkdown += "* ["+item.name+"]("+item.path+")"+"\n"
);

fs.writeFile('index.md', treeMarkdown, function (err) {
  if (err) throw err;
  console.log('Saved!');
});
