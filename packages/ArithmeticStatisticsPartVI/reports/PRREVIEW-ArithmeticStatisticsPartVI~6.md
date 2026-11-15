# Review of ArithmeticStatisticsPartVI (pull request #1176 at 26c32bd)

**Verdict:** needs changes

The roadmap folder is unchanged since the last review and has no finding. The three findings below are all in the pull request's description; none needs a change to the folder.

## R01 (P3) — The description omits the open supplier ArithmeticStatisticsPartV

**Location:** pull request description, dependencies paragraph: "The open pull requests that must merge first are in the merge order below. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** ArithmeticStatisticsPartV is an open prerequisite of this roadmap, and neither the prose nor the `depends-on` and `merge-order` blocks names it.

**Witness:** `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md:71`: "From ArithmeticStatisticsPartV require [cubic fields totally ramified at large primes are sparse]"; also the *Needs:* lines at 755 and 773, and line 2495. PartV is open (#1175), not on main.

**Repair:** Add to that paragraph: "ArithmeticStatisticsPartV (#1175) is also an open supplier (README §4.8, sparsity of cubic fields totally ramified at large primes) and merges first; ArithmeticStatisticsPartI (#1171) and PartIII (#1174) are direct suppliers too." Regenerating the `depends-on` and `merge-order` blocks, so that they list #1171, #1174 and #1175, does the same.

## R02 (P3) — "Parts VII–VIII take these means as input" is false for Part VIII

**Location:** pull request description, summary block, *Why Tau Ceti wants it*: "Parts VII–VIII take these means as input, and the supporting targets add elliptic p-parity and Skinner's converse".

**Claim:** Only Part VII consumes this roadmap's targets; Part VIII cites none.

**Witness:** ArithmeticStatisticsPartVIII README at its open head `e4005e8`, line 1985 (Dependencies): "Parts I, IV, V and VII, linked at each use"; links to PartVI's README: 0 (PartI 102, PartIV 21, PartV 17, PartVII 16). PartVII's README line 70 links §§4.10 and 4.12 here.

**Repair:** Replace with: "Part VII takes these means as input (and Part VIII through Part VII), and the supporting targets add …".

## R03 (P3) — "Local lemmas cover every prime, 2 and 3 included" overstates §4.3

**Location:** pull request description, summary block, *Approach and generality*: "Local lemmas cover every prime, 2 and 3 included; Cartan decompositions, doubling indices, Haar charts and the Bhargava–Gross–Wang pencil count are imported, not rebuilt."

**Claim:** The two solubility lemmas of §4.3 are stated for odd p only; what covers every prime is the weights, the masses and the Kummer indices.

**Witness:** `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md:387`: "p odd. For p ≥ 5 the proof is uniform; p = 3 is a finite verification; p = 2 is excluded"; line 405: "Let p be an odd prime and f ∈ `V_{Z_p}`".

**Repair:** Replace the clause with: "The local weights, mass formulas and Kummer indices are computed at every prime, 2 and 3 included; the two solubility lemmas of §4.3 are stated for odd p, as the mass formula needs no more;".

## Previous findings

- none: the review of `26c32bd` had no finding (its one bullet recorded an earlier finding as repaired; the passage it quotes, README lines 15 and 45, is unchanged).

## Verified sound

Incremental re-review of 0 changed lines since `26c32bd`: the folder's three files are identical to the head the previous review read, and the pull request changes nothing outside the folder. This round read the title and description against the head.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description: "ordered by max(4\|A\|³, 27B²)"; README Conventions `27H_E=4H_IJ` | (A,B)=(−1,0); (0,1) | (I,J)=(3,0): H_E=4, H_IJ=27, 108=108. (I,J)=(0,−27): H_E=27, H_IJ=729/4, 729=729 | agrees | none |
| Description: "average two-Selmer size three" (README §4.10, Layer 4 opening) | local Kummer factors and Tamagawa number | p=2 factor 2, real factor 1/2, product 1; τ(PGL₂)=2; 1+2·1=3 | agrees | none |
| Description: "in any congruence family"; `average_twoSelmer_congruence` | F=univ at X=5; F=∅ | univ: sublevel {(−1,0),(1,0)}, discriminants 4 and −4, `ncard`=2, N=1 works. ∅: nonemptiness clause fails, so no 0/0 average with limit 0≠3 | agrees | none |
| Description: open suppliers "are in the merge order below" | every roadmap name in the README, against main `276e711` and the 473 open heads | 16 open suppliers named in the README; the blocks list 15 (#1171, #1174 in the chain only); #1175 PartV in neither | contradicted | R01 |
| Description: "Parts VII–VIII take these means as input" | PartVII and PartVIII READMEs at their heads | PartVII links to this README: ≥3 (line 70, 884). PartVIII links: 0 | contradicted for VIII | R02 |
| Description: "Local lemmas cover every prime, 2 and 3 included" | §4.2 translates, §4.3 solubility, §4.5 mass, §4.6 index | lines 311, 539, 579: "every prime"; lines 387, 405: "p odd", "p = 2 is excluded" | overstated | R03 |
| Description: "bad, ramified and nonordinary primes need no exclusion" | README line 2435–2437 | "no ordinary, good-p, squarefree-conductor or p∤Disc(M₀) restriction"; includes p∣N_E, p ramified in M₀, nonordinary p | agrees | none |

The rows for the untouched statements stand as in the previous review, of `26c32bd`.

- Title: equals the README's `# Roadmap:` subtitle, "Selmer averages and arithmetic applications".
- Description sentences checked against the head: 14; contradicted: 3 (R01–R03). The description states correctly that the pull request adds the roadmap (not on main; 2876 insertions, 0 deletions, 3 files) and that the Lean imports no roadmap (`import Mathlib` and one `TauCeti.*` module).
- "Imported, not rebuilt": Cartan decomposition and PGL₂ indices (ReductiveGroupsPartII RG2.4.4, on main), doubling ratios (HeightsRationalPointsAndObstructions §1.17), Haar image formula (ReductiveGroupsPartII RG2.0, on main), pencil count (HeightsRationalPointsAndObstructions §3.18b): each is a supplier citation at README lines 14–16, 45, 51.
- Cross-roadmap citations resolved this round: PartV's heading "Cubic fields totally ramified at large primes are sparse" exists at its head `2a99ce1` (line 318); the resolver reports no citation or Lean name found nowhere.
- Dependency check: `depcheck: 245 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD or CYCLE line. ArithmeticStatisticsPartV is line 56 of the merge order, this roadmap line 146.
- Gate, rerun at this head: every counter 0, `OK`; the worker's gate, with the targeted build, passed (`build=0`).
- Elaboration of `TauCetiRoadmap/ArithmeticStatisticsPartVI/Suggested.lean`: ten warnings, each `declaration uses 'sorry'` (lines 138, 146, 155, 167, 178, 192, 202, 214, 261, 270); no error, no other warning.
- Remark, untouched text: README line 2499, "The later arithmetic-statistics parts use the exact targets supplied here", holds for Part VII only at the open heads (see R02).

Overlap check: read ArithmeticStatisticsPartI, PartII, PartIII, PartV, PartVII (and PartVIII's dependencies); nothing shared: each scope paragraph assigns Layers 0–3 and 5 to those parts and Layer 4, the Selmer means, to this one, and no `Suggested.lean` at an open head or on main declares one of this file's names.

Source independence: changed passages only: 0 passages compared, because the folder did not change; largest share Reference 1 (Bhargava–Shankar, binary quartic forms), 68 of 173 locators; contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The seeded sample's fifteen sections are unchanged text; their source locators were not read again this round and stand as in the earlier reviews.
- The five sources the previous review lists as uncertified (References 121, 122, 123, 125, 127) were not reopened.
- The description past any cut in the quoted text was not checked.

## Source issues

- none (no source was opened this round; the eleven entries of the previous review stand).

## For the human reviewers

- **Not tested.** No earlier report of this folder carries a `Source independence:` line, and this round compared changed passages only (none): the README's arrangement against Reference 1 (68 of 173 locators) has no recorded comparison.
