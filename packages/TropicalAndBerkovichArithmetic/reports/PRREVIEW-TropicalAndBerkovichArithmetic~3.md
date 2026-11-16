# Review of TropicalAndBerkovichArithmetic (pull request #1494 at 0390796)

**Verdict:** accepted

Incremental re-review of the 15 lines changed since `e9a0ac4`, and of the pull request's title and description. No finding.

## Previous findings

- R01 — repaired: “ClassicalAdicEtaleCohomology §3.1 (the Hausdorff strict analytic spaces, the Berkovich realization u of taut locally finite-type adic spaces and its inverse s₀, the maximal Hausdorff quotient identification, …)” at `README.md:132`; no backticked `StrictAnalyticSpace` remains.

## Verified sound

| Statement (changed or cited by a change) | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `README.md:39` pins | `lake-manifest.json` and the two package checkouts | Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…` in the README, the manifest and both checkouts | Equal; — |
| `README.md:78` path of `TauCeti.IsConvexPolyhedron` | The file at the pin | `TauCeti/Analysis/Convex/Polyhedron/Basic.lean:32` documents it; the old `Polyhedron.lean` is now a directory | Path right; — |
| Supplier contracts, lines 41–78, after the pin move | All 6 cited file paths, all 36 backticked library names | 6 of 6 files exist; 36 of 36 names occur at the pins | No citation stale; — |
| `README.md:132`, ClassicalAdicEtaleCohomology §3.1 | Each prose item at that roadmap's open head | §3.1 defines Hausdorff strict analytic spaces and lists: realization of taut rigid spaces, its inverse, maximal Hausdorff quotient, boundary, properness, quasi-étale and quasi-smooth comparison | Items present; — |
| Provenance, `riemann_roch_for_graphs` against §3.5 | One vertex, no edge, D=0; two parallel edges, D=0 and D=P | Point: g=0, K=−2, 0−(−1)=0−0+1. Banana: g=1, K=0; D=0: 0−0=0−1+1; D=P: 0−(−1)=1−1+1 | Same formula as §3.5 and its Check (g=1: r=deg D−1); — |
| Provenance, `q_reduced_unique` and `exists_q_reduced_representative` | Hypotheses read at the cited commit | Uniqueness has no connectedness hypothesis (`Basic.lean:1264`); existence takes `graphConnected` (`Basic.lean:1560`) | “at most one … exactly one on a connected graph” right; — |
| Provenance, `CFGraph` against §3.1 | Structure fields at `Basic.lean:45–53` | Finite nonempty `V`, `edges : Multiset (V × V)`, `loopless`; `CFDiv G := G.V → ℤ`; no length field. §3.1 allows loops and uses Mathlib `Graph` | Described as it is; carriers differ as stated; — |
| Provenance, `exists_graph_of_genus_and_gonality` | g=0, g=1, g=3 | g=0: k≤1, no k≥2, empty. g=1: k=2 (cycle). g=3: k∈{2,3} | Range `2 ≤ k ≤ ⌊(g+3)/2⌋` as in `Highlights.lean:1946`; — |
| Provenance, remaining names | Each declaration at the cited commit | `orientation_superstable_bijection` (`Orientation.lean:1204`; surjectivity through burn lists, 1119–1126), `divisor_reverse_orientation` (945), `clifford_theorem` and `gonality_leq_genus_add_one` (`RiemannRoch.lean:131, 237`), `treewidth_le_gonality`, `brill_noether_existence_through_five`, `gonality_drops_under_regular_subdivision` (`Highlights.lean`) | All exist with the stated content; — |
| Provenance, cross-references into Layer 3 | §§3.1, 3.3, 3.4, 3.5, 3.8–3.11, 3.9 | §3.5 proves the finite-graph theorem first by reduced divisors and burning order; §3.4 has the finite-model exact sequence; §3.9 tests on residue-curve points | Section numbers and contents agree; — |

The rows for the statements the change leaves untouched stand as in the previous review, of `e9a0ac4`. `Suggested.lean` is unchanged since then.

- Gate at this head (worker's record): every check 0, `build=0 OK`. Dependency check, run here: `depcheck: 248 roadmaps, 2375 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration with `lake env lean` of `Suggested.lean` at the new pins: six `sorry` warnings, nothing else. The nine elaborated signatures in the worker's listing show no dropped binder.
- No file changed outside the roadmap folder (the diff against `origin/main` outside it is empty).
- LeanPool read at commit `f8b9b72`: `lean-toolchain` is v4.35.0; both projects' file headers say Apache 2.0 with the authors the README names; 10 declarations opened.
- The new section is the secondary provenance section the repository's `README.md` (Writing a roadmap) asks for; it names no supplier, and nothing in `Suggested.lean` shares a name with LeanPool.
- Pull request text against the head: the summary block, the prose paragraph and the validation line agree with this head; the change adds no layer, removes no heading or declaration, and adds or drops no supplier.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no second copy on main.
- Design gaps: unchanged since `e9a0ac4`; the change touches none of their sections.

Overlap check: read ArithmeticDynamics, ArakelovGeometryAndAbelianHeightsPartII, ColemanIntegrationPartII, ClassicalAdicEtaleCohomology and AdicSpacesPartV as listed (none by results is listed); the change moves no object between owners; nothing shared.

Source independence: changed passages only; 3 passages (the two provenance paragraphs and the reworded §3.1 supplier parenthesis) compared with 2 texts (the LeanPool docstrings at the cited commit, ClassicalAdicEtaleCohomology §3.1), none shared, longest common run three words; largest share bpr-structure, 25 of the README's linked citations; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- berkovich-spectral (waived), fresnel-matignon, huber-1994 and huber-1996 (uncertified): as in the previous review; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- §§2.1–2.9 keep locators running through bpr-structure Definition 3.1 to Proposition 3.9 in the source's order (`README.md:1070–1213`). The arrangement was not compared again in this incremental round.
- berkovich-spectral is cited by locator under a waiver and three sources are uncertified (`README.md` References); their texts were not read in any round.
- `README.md:2531–2533` gives both LeanPool projects as Apache-2.0. `LeanPool/BrillNoetherGraphs.lean:568–574` also carries text of an article under CC BY 4.0 that the Apache licence does not cover. The roadmap reuses nothing from either.
