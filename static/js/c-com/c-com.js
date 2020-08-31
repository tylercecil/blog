/**
 * c-com.js
 * Takes divs with class 'tree', reads its body as a bracket-marked tree,
 * and renders that tree in d3. The tree will allow nodes to be selected,
 * and will mark all other nodes which are c-commanded by that node.
 *
 * No validation is performed --- this requires that all data is formatted
 * correctly.
 *
 * You may notice I don't know how to write JS. This is true. I did my best...
 */

chomTree.selectAll('div.tree').each(function(p, j) { cComTree(chomTree.select(this)); });

function cComTree(div) {
  treeSrc = div.text();
  div.text('');

  try {
    const ast = chomTree.parse(treeSrc);
    const root = chomTree.render(ast, div);

    function resetCommand() {
      for (const node of root.descendants()) {
        node.selected = false;
        node.commanded = false;
        node.hover = false;
      }
    }

    function click(d) {
      resetCommand();
      d.selected = true;

      for (const node of ccom(d)) {
        node.commanded = true;
      }

      updateTree();
    }

    function hoverOn(d) {
      d.hover = true;
      updateTree();
    }

    function hoverOff(d) {
      d.hover = false;
      updateTree();
    }

    function updateTree() {
      div.selectAll('g.node')
        .data(root.descendants())
        .classed('selected', d => d.selected)
        .classed('commanded', d => d.commanded)
        .classed('hover', d => d.hover);
    }

    resetCommand();

    div.selectAll('g.node')
      .data(root.descendants())
      .on('click', click)
      .on('mouseover', hoverOn)
      .on('mouseout', hoverOff);

    updateTree();
  } catch(err) {
    console.log(`treeSrc = "${treeSrc}"`)
    throw(err);
  }
}

// Return a list with all nodes which n1 c-commands
function ccom(n1) {
  // Get the first branching parent of n1
  var branching_parent= n1.parent;
  while(branching_parent != null && branching_parent.children.length <= 1) {
    branching_parent = branching_parent.parent;
  }

  if(branching_parent == null) {
    return [];
  }

  // Start with the set of all nodes dominated by branching_parent.
  var nodes = branching_parent.descendants();

  // Filter out nodes dominated by n1
  var n1_doms = new Set(n1.descendants());
  nodes = nodes.filter(n => !n1_doms.has(n));

  // Filter out nodes which dominate n1
  nodes = nodes.filter( function(n) {
    var n_doms = new Set(n.descendants());
    return ! n_doms.has(n1);
  });

  return nodes;
}
