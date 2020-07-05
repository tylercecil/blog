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
const nodeSize = 18;
const heightMultiplier = 45;
const margin = {v: 20, h: 20};

initTree(d3.select('#tree'));

function initTree(div) {
  const treeString = div.text()
  const root = d3.hierarchy(parseTree(treeString));
  div.text('')

  const width  = Math.round(Number(div.style('width').slice(0, -2)));
  const height = (root.height + 1) * heightMultiplier;

  const treeLayout = d3.cluster()
    .size([width - 2 * margin.h, height - 2 * margin.v]);
  treeLayout(root);

  const svg = div.append('svg')
    .attr('width', width)
    .attr('height', height)
    .append('g')
    .attr('transform', 'translate(' + margin.h + ',' + margin.v + ')');
  svg.append('g')
    .classed('links', true);
  svg.append('g')
    .classed('nodes', true);

  updateTree(root, svg);
}


function updateTree(root, svg) {
  // Nodes
  svg.select('g.nodes')
    .selectAll('circle.node')
    .data(root.descendants())
    .join(
      enter => enter.append('circle')
        .classed('node', true)
        .attr('cx', function(d) {return d.x;})
        .attr('cy', function(d) {return d.y;})
        .attr('r', nodeSize)
        .on('click', click),
      update => update
        .classed('selected', d => d.selected)
        .classed('commanded', d => d.commanded)
    );

  svg.select('g.nodes')
    .selectAll('text.node')
    .data(root.descendants())
    .join(
      enter => enter.append('text')
        .text(d => d.data.name)
        .attr('x', d => d.x)
        .attr('y', d => d.y)
        .attr('dominant-baseline', 'middle')
        .attr('text-anchor', 'middle')
        .attr('fill', 'black')
        .on('click', click),
      update => update
        .classed('selected', d => d.selected)
        .classed('commanded', d => d.commanded)
    );

  // Links
  svg.select('g.links')
    .selectAll('line.link')
    .data(root.links())
    .enter()
    .append('line')
    .classed('link', true)
    .attr('x1', function(d) {return d.source.x;})
    .attr('y1', function(d) {return d.source.y;})
    .attr('x2', function(d) {return d.target.x;})
    .attr('y2', function(d) {return d.target.y;});

  function reset_nodes(root) {
    for (const node of root.descendants()) {
      node.selected = false;
      node.commanded = false;
      node.hover = false;
    }
  }

  function click(d) {
    reset_nodes(root);
    d.selected = true;

    for (const node of ccom(d)) {
      node.commanded = true;
    }

    updateTree(root, svg);
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

function parseTree(s) {
  const tokes = s.split(/\s*(\[|\])\s*/).filter(toke => toke != "")
  const root = {'children' : []}
  const nodes = [root]

  tokes.forEach(function(toke) {
    if (toke == '[') {
      var newNode = {'name': null, 'children' : []};
      nodes[nodes.length - 1].children.push(newNode);
      nodes.push(newNode);
    }
    else if (toke == ']') {
      nodes.pop();
    }
    else {
      nodes[nodes.length - 1].name = toke;
    }
  });

  return root.children[0];
}
