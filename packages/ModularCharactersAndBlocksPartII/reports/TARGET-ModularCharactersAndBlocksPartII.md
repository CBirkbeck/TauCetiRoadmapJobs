# Triage report: TARGET-ModularCharactersAndBlocksPartII

**Verdict: part-ii.** Name `ModularCharactersAndBlocksPartII`, base `ModularCharactersAndBlocks`
(#1775). The brief is `packages/ModularCharactersAndBlocksPartII/target.md`; the manifest is
`packages/ModularCharactersAndBlocksPartII/sources.toml`.

## What was searched

- **The base.** `ModularCharactersAndBlocks/README.md` and `Suggested.lean` at #1775 (head
  4e678ad), read in full. The base owns Layers 0–8: modular systems, Brauer characters,
  decomposition and Cartan matrices, blocks over `K`, `O`, `k`, the partition `Irr(G,b)`,
  the principal block, generalized decomposition numbers, the Brauer projection, defect groups
  (with the defect-class characterisation of Martínez in §6.2), Brauer pairs, the three main
  theorems, normal `p`- and `p'`-subgroups and block covering (§8.2), and the kernel theorem.
  It has no heights, no `Irr_0`, no theorem on heights, no Fong–Reynolds correspondence, no
  structure theorem for blocks with normal defect group, and no character correspondence for a
  group action; its scope statement excludes "conjectures about blocks". Its `Suggested.lean`
  records that the ordinary block partition is not statable at the pins, which the brief lists
  as a risk for Part II's acceptance test.
- **Suppliers named by the target.** LocalFiniteGroupTheory at #1634 (L1 Schur–Zassenhaus
  conjugacy and Hall subgroups; L3 coprime action, Glauberman's lemma, fixed points modulo
  normal subgroups, all with a solvability hypothesis that `S` solvable satisfies; it excludes
  character theory by its in-scope rule). `RepresentationTheory/InductionRestriction` and
  `RepresentationTheory/CharacterTheory` on main (Clifford theory with the native
  `TauCeti.inertia` and `FDRep.cliffordCorrespondence`; degree divisibility, Galois action,
  splitting fields). Neither plans Gallagher's canonical extension or any coprime character
  correspondence.
- **Neighbours.** GlaubermanZStar (#1778), OddOrderTheorem (#1777),
  FiniteGroupExtensionSplitting (#1774), CFSGStatement, CFSGBasicProperties,
  FiniteGroupInvariants (#1708), McKaySkewGroup (#223): read their scope sections or grepped
  them. None owns heights, the height zero conjecture, the Alperin–McKay conjecture or the
  Glauberman correspondence; FiniteGroupInvariants' "Malle" is Malle's conjecture on field
  counts, McKaySkewGroup is the McKay correspondence for finite subgroups of `SL₂`.
- **All roadmaps.** `roadmaps grep` (open heads and main) for the Glauberman correspondence,
  Glauberman–Isaacs, height zero, `Irr_0`, character height, defect of a character, coprime
  action on characters, Hartley–Turull, Kessar, Malle, Schaeffer Fry, Navarro, McKay conjecture,
  Alperin–McKay, Gallagher, canonical extension and Itô's theorem. Every hit was either a
  different meaning of "height" (`p`-divisible groups, Weil heights, root heights, Hodge
  heights), the Duffin–Schaeffer conjecture, or the coprime-action section of
  LocalFiniteGroupTheory. Nothing owns the target.
- **The board.** The open targets and designs listed in the brief are in analysis, geometry,
  number theory and logic; none shares an object with this target. The packages index names
  four imported packages, none in group theory. The merge order contains
  ModularCharactersAndBlocks (position 88), FiniteGroupInvariants and GlaubermanZStar, and
  not LocalFiniteGroupTheory.
- **The libraries.** The pinned Tau Ceti has characters (`TauCeti.irreducibleCharacters`,
  `characterPairing`, `finrank_dvd_card`), Clifford theory including
  `FDRep.clifford_restrict_inertia_eq_top_of_coprime`, semidirect products and Gaschütz; no
  Glauberman material (no file mentions it) and no blocks beyond the base's inputs. Mathlib has
  `SchurZassenhaus.lean` (existence), `MulDistribMulAction`, `FixedPoints.subgroup` and
  `padicValNat`.

## What was found

- The target is a continuation of the base in its own direction: every one of its objects
  (`Irr(G,b)`, defect groups, the Brauer correspondent, blocks of defect zero) is defined by
  the base, and the target adds the degree arithmetic inside a block and the character
  correspondence for coprime actions. So the verdict is `part-ii`, not `design`, and there is
  nothing to merge into.
- The two Annals papers the issue cites by volume were identified: 192(1) no. 4 is Geck,
  "Green functions and Glauberman degree-divisibility" (arXiv 1904.04586); 201(2) no. 2 is
  Ruhstorfer, "The Alperin–McKay and Brauer's height zero conjecture for the prime 2"
  (arXiv 2204.06373).
- Open texts cover the whole of the proved scope: Glauberman's 1968 paper (Canadian Journal of
  Mathematics archive on Cambridge Core, served without login; Theorems 2–5 and Corollaries 7–9
  give the canonical extension, the cyclic, `p`-group and solvable cases, chain independence,
  equivariance and the degree bound), Reynolds 1963 (Nagoya Mathematical Journal archive on
  Cambridge Core; Theorems 8–9 give the heights of a block with normal defect group and the
  height zero statement for it), and the Martínez course notes already cached for the base
  (heights, Theorem 3.4 on heights with its proof, Fong–Reynolds and heights, Theorem 9.8). The
  Hartley–Turull paper is on GDZ as an image scan; the service's OCR text was used for
  Theorem A, Definition 3.1 and Proposition 3.2 only.
- The paywalled books and the 1973 Isaacs paper are recorded as `uncertified` by locator, as
  the issue itself asks. Wolf 1978 (Project Euclid refused the PDF) is dropped: it is outside
  the scope.
- **Generality.** The filed cases of the height zero conjecture (defect zero, `p`-groups,
  abelian groups) are instances of Reynolds' theorem for blocks with normal defect group,
  which the open sources prove in full; the brief makes Reynolds' theorem the target and the
  filed cases its Checks. The canonical extension is stated under coprimality alone. The
  correspondence is kept at `S` solvable, which is the generality of every source that proves
  it; the odd-order Isaacs correspondence is named and left out.
- **Cited theorems.** Kessar–Malle, Malle–Navarro–Schaeffer Fry–Tiep, Ruhstorfer and Geck rest
  on the classification and on Lusztig's theory. The brief asks the design to state the
  conjectures as predicates and the results as cited theorems in the README, and not to place
  undischargeable `sorry`s in `Suggested.lean`.

## Why the verdict

Same objects, same suppliers, same direction as the base, starting exactly where the base
stops (its Layer 8), with nothing on the board or in the libraries owning any part of the
target. The suggested name is free (no roadmap, pull request or package carries it apart from
the package folder created for this job).

## Files written

- `packages/ModularCharactersAndBlocksPartII/target.md`
- `packages/ModularCharactersAndBlocksPartII/sources.toml` (10 certified, 5 uncertified)
- this report

No missing-references file remains: every needed text was read or is settled as uncertified.
Nothing suspicious was found in any fetched text.
