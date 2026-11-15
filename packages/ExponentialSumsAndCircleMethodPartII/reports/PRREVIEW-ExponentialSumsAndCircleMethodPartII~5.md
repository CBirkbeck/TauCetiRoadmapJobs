# Review of ExponentialSumsAndCircleMethodPartII (pull request #2138 at 7a34caf)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 7a34caf; this round reads the pull request's title and description against the head. No findings; the gate passes.

## Previous findings

- none: the previous report, of 7a34caf, raised no finding (its R01 and R02 bullets recorded repairs of an earlier report, and both passages are unchanged at this head: `README.md` lines 47 and 838).

## Verified sound

| Statement (as the description cites it) | Instances | Values computed | Result |
|---|---|---|---|
| Summary block: irreducible of dimension d(n−k) when k≥3, d≥k−1, ⌊d/(k−1)⌋(n/2ᵏ−k+1)>k−1 (README §10.8, `mapping_geometrically_irreducible`) | (k,n,d)=(3,40,2); (3,17,34); (3,17,32) | δ=3, t=1, tδ=3>2, D=74. δ=1/8, t=17, tδ=17/8>2. t=16, tδ=2, not >2. | Matches §10.8 and the Lean `hrange` |
| Same: the description omits n>2ᵏ(k−1), which §10.8 and `hn` state | general | d≥k−1 gives t≥1; tδ>k−1>0 gives δ>0, i.e. n/2ᵏ>k−1 | Implied; the description is not weaker |
| "characteristic zero or greater than k" | Lean `hchar` | `ringChar K = 0 ∨ k < ringChar K`; §10.8 says "characteristic zero or >k" | Matches |
| "uniform polar count" (README §8.9, `minor_arc_polar_count`) | k=3, d=2, m=2 | L=6; Hankel 4×3, rank 3>2 possible; 2m=4≤6; bound 2ⁿQ^(4n−n)=2ⁿQ^(3n) against trivial Q^(4n) | Nontrivial; matches §8.9 |
| "cubic Fermat hypersurface in ℂ⁴⁰ (README §11.12)" | ζ³=−1, d=2, n=40, k=3 | f₀(1,ζ,0,…)=1+ζ³=0; μ=2⁴⁰ spheres S³⁹; n=40≥5 gives π₂=π₃=0; (3,40,2) lies in the §10.8 range | Matches §11.12, `fermatLeadingVector`, `compactOpen_germ_obstruction` |
| "§6.5 identifies the Zariski closure … with O_(N₁)×Sp_(N₂) by Goursat's lemma and a dimension count" | (k,n)=(4,3) | N₁=3·28/4=21, N₂=3·8/4=6; dims 210 and 21; N₁−N₂=15≠1 | Matches README line 836 |
| "these roadmaps, all earlier than this roadmap in the merge order" | nine open suppliers | Merge-order lines 54, 57, 70, 71, 74, 109, 152, 163, 231; this roadmap at 402 | True |
| "The other roadmaps the README names (…) are on main" | five names | Each of SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicTopology, DGFloer, ClassicalArithmeticCompletion has a folder on main (1a19c9f); the README names 14 roadmaps, 9+5 | True; none left out |
| Naming paragraph: no roadmap that this one continues exists | main, merge order, board index, 475 open heads | No `ExponentialSumsAndCircleMethod` folder or entry; nearest names are CircleMethodThreePrimes and Equidistribution, different subjects | True |

The rows for statements untouched since then stand as in the previous review, of `7a34caf`.

- Pull request text: every sentence of the title, the summary block and the prose was read against the head (9 paragraphs); none is contradicted. The change is an added roadmap (1968 insertions, 0 deletions, 0 headings or declarations removed), which the text states; the nine suppliers and the supplier by another author are named.
- Description's validation line: confirmed at this head (build succeeds, `sorry` the only warning; `readme-ids-missing=0`, `set_option=0`, `sorry-data=0`, `depcheck=0`, `outside-folder=0`).
- Gate re-run (`gate … --base origin/main`): every scanner 0, `OK`; the worker's record has `build=0`.
- Dependency check (`--movable --pr 2138`): `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly three warnings, all `declaration uses sorry` (lines 115, 141, 217). `#check @` of the three theorems, `Hco` and `polarCount` on a scratch copy: all binders present, nothing changed.
- Citations: the worker's resolver lists none found nowhere; `overlaps.md` lists no dropped id, no second copy, no other pull request changing this folder.
- Overlap check: read AlgebraicTopologyPartII, DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves (and searched all open heads and main for Hankel arcs, the geometric circle method and prescribed-germ spaces); nothing shared. DeligneWeightsAndPurity and PadicDifferentialEquationsAndRigidCohomology cite the Hankel criterion of ClassicalArithmeticCompletion §6.44, from which README line 15 distinguishes §4.4.
- Source independence: changed passages only; 0 passages compared with 0 sources, because the folder is unchanged since 7a34caf; largest share BS20, 187 of 206 source-key occurrences; contents not compared again (no layer added, removed or reordered).
- Remark (no change asked): the description's sentence that red-team passes "follow on this draft" is a statement about process that the head neither confirms nor contradicts.

## Not verifiable

- `LEE13` is waived and was not read; the text citing it is untouched.
- The seeded sample of 15 targets falls in no changed passage (the folder is unchanged), so no source locator was re-read this round.

## Source issues

- **Misprint** in BS20 at proof of Lemma 4.3, p. 924 (BS20 line 1435): the source lists the exceptional coincidences as (N₁,N₂)=(2,3) or (4,5), with N₁ the orthogonal rank; it should say (3,2) or (5,4), from 𝔰𝔬₃≅𝔰𝔭₂ and 𝔰𝔬₅≅𝔰𝔭₄; affects nothing.

## For the human reviewers

- **Scope (naming).** The folder, namespace and merge-order entry say "Part II", and no Part I exists on main, on the board or among the open pull requests; the description says so and leaves the rename to a maintainer.
- **Scope.** The headline `compactOpen_germ_obstruction` (README §11.12) is marked "Original to this roadmap" and refutes a reading of BS20 Lemma 7.2; README line 11 says Layers 11–12 and §13.2 contain original examples. No refereed source states it.
- **Scope.** README §§9.5 and 10.8 keep only a conservative range and treat BS20 Proposition 2.6 (the sharp minor-arc bound) as an unproved hypothesis, so the irreducibility headline is weaker than BS20 Corollary 1.4 as printed.
