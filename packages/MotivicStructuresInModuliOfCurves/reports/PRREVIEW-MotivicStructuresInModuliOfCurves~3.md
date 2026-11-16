# Review of MotivicStructuresInModuliOfCurves (pull request #2437 at 2a11c50)

**Verdict:** needs changes

## R01 (P3) — §9.5 *Needs* omits WeilConjectures WC.1, which its new API bullet and route use

**Location:** `TauCetiRoadmap/MotivicStructuresInModuliOfCurves/README.md:1406`, §9.5: "*Needs:* §§8.3, 8.6, 8.9–8.11, 8.13, 9.1, 9.4; WeilConjectures, WC.5 and WC.6; …". The new bullet at `README.md:1411` reads "`stableMass k g n` is the finite groupoid mass (WeilConjectures, WC.1)".

**Claim:** The edited *Needs* line does not list WC.1. The section's own new API bullet cites it, and the route applies WC.5 "with the stack trace … inputs", which the contracts assign to WC.1.

**Witness:** WeilConjectures (open head), README line 448: "### 1.7 Finite groupoid mass" sits in Layer WC.1. The WeilConjectures contract (`README.md` "From WeilConjectures") places the compact-support trace formula in WC.1, not in WC.5 or WC.6.

**Repair:** In `README.md:1406`, replace "WeilConjectures, WC.5 and WC.6" with "WeilConjectures, WC.1 (finite groupoid mass and the stack compact-support trace formula), WC.5 and WC.6".

## Previous findings

- R01 — repaired: §2.6 *Needs* reads "EtaleCohomologyFoundations §F.7 (the blow-up decomposition of `ℓ`-adic cohomology along a smooth centre); MotivesAndAlgebraicCycles §§2.6–2.7". Layer 2 Dependencies list §F.7, and `README.md:122` adds its contract.
- R02 — repaired: §9.5 now has two API bullets for `IsStableOfGenus` and `stableMass` and three new Checks: the three-pointed versus two-pointed `ℙ¹`, the nodal cubic, `stableMass 𝔽_q 0 4 = q + 1`, and `stableMass 𝔽_q 1 1 = q + 1` against `2q + O(1)` classes.
- R03 — repaired: "a component whose normalization is rational with at most two special points (the preimages of nodes, a node of the component itself giving two, and the markings), or is a smooth genus-one curve without markings".
- R04 — repaired: `Fr_{g,n}` replaces `X_{g,n}` in §6.3 (`README.md:907`, `:918`) and in gap:equivariant-grr (`:76`). No `X_{g,n}` remains, and `X`, `X_n` still name the splitting stratum.

## Verified sound

| Target | Instances tried | Values computed (roadmap ↔ source/library) | Result | Change |
| --- | --- | --- | --- | --- |
| §2.6 Keel, cohomological route via §F.7 | `M̄_{0,5} = Bl₃(ℙ¹ × ℙ¹)`, `c = 2`; `c = 1` | §F.7: `b₂ = 2 + 3 = 5`, `b_odd = 0`, `χ = 7`; `c = 1` adds nothing (§F.7 third Check) | holds | none |
| EtaleCohomologyFoundations contract | hypotheses against §F.7 (main, line 2056) | smooth separated finite type `X/k`, any `k`; smooth `Z` of pure codimension `c ≥ 1`; rational `ℓ`-adic, `ℓ ≠ char k`; built from exceptional Gysin maps: all match | holds | none |
| Betti transfer, MotivesAndAlgebraicCycles §2.7 | `k ⊂ ℂ`, Galois action forgotten | comparison respects cup products and correspondences (open head, line 436); pullback and Gysin maps are correspondences, so equal ranks give a `ℚ`-isomorphism | holds | none |
| §6.3 framed presentation (sampled) | `g = 7`, `E = (3,3,4)` | `h⁰(E) = 4 + 4 + 5 = 13 = g + 6`, `G = SL₂ × GL₁₃`; clp lines 561–581, pp. 13–14; canning-larson-genus-seven lines 257–268, pp. 6–7 | holds | none |
| gap:equivariant-grr, renamed | occurrences | `Fr_{g,n}` three times at line 76, matching lines 907 and 918; `grep X_{g,n}` finds 0 | holds | none |
| `IsStableOfGenus`: API and first Check | `ℙ¹` marked `0,1,∞`; `ℙ¹` marked `0,∞`; nodal cubic; two-`ℙ¹` cycle | `H⁰(O(−1)) = 0` and `h¹ = 0`: holds; `z∂_z ≠ 0`: fails; `D(x) = x`, `D(y) = −y`, `D(xy) = 0`: fails; `z∂_z` extended by zero: fails | holds | none |
| §9.5 stability dichotomy | unstable components with `2g_v − 2 + n_v ≤ 0` | `(0, ≤2)` falls under the first clause; `(1, 0)` has no node preimages, so a connected curve is a smooth genus-one curve; the field descends: `D(xy) = xy·(h₁ + h₂) = 0` | complete | none |
| `stableMass` Check, `(0,4)` | `q = 2`, general `q` | `(q − 2) + 3 = q + 1`; at `q = 2`, `0 + 3 = 3`; §1.6 gives `#M̄_{0,4} = q + 1` | holds | none |
| `stableMass` Check, `(1,1)` | `q = 2`, general `q` | each `j` has mass 1 (a sum over forms); nodal `½ + ½ = 1`; total `q + 1 = 3`; classes `5 + 2 = 7 = 2q + 3`, as in §1.1's third Check | holds | none |
| `stableMass` API, degenerate pairs | `(0,2)`, `(1,0)` | no stable curve, so the `finsum` is empty and equals `0`; the probe `simp [stableMass]` leaves the `finsum` goal open | holds | none |
| Headline `stableMass_genus_four` | `n = 0..3` at `q = 2`, `q = 1` | palindromic, degrees 9–12; `7965`, `47517`, `388191`, `3955127`; coefficient sums `200`, `882`, `5214`, `37945` | holds | R01 |

The rows for untouched statements stand as in the previous review, of `4143737`.

- **Source locators checked against the text:** 5, all in the sampled §6.3: clp §5.2 (lines 561–581, pp. 13–14); canning-larson-genus-seven Remark 2.3 (lines 257–268, pp. 6–7) and §§3–4 (lines 350, 628). No other sampled target falls in the changed passages.
- **Cross-roadmap citations resolved:** 6.
  - EtaleCohomologyFoundations §§F.6 and F.7, on main (README lines 1985 and 2056).
  - MotivesAndAlgebraicCycles §§2.6–2.7, at its open head (lines 418 and 436).
  - StableReductionPartII §0.4, at head `771fcf1` (line 340), the stable fibre groupoid over every scheme.
  - WeilConjectures WC.1 §1.7, at its open head (line 448).
- **Libraries:** the pinned Tau Ceti has only the graph-level `DualGraph.IsStable` (`DualGraph/Basic.lean:402`, `StableMaps/DualGraph/Basic.lean:105`). It has no stability predicate on curves and no groupoid mass, so the definitions of §9.5 duplicate nothing.
- **Gate:** every check is 0, `OK`. The worker's run also reports `build=0`. The dependency check prints `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean` on Suggested.lean exits 0; its only message is the `sorry` warning at 91:8. The file is unchanged since `4143737`. `#check @` on the three declarations gives exactly the types in signatures.md, with no binder lost.
- **Pull request text:** the title and description, read against this head, contradict nothing. The added supplier, EtaleCohomologyFoundations, is on main, which the description covers with "Roadmaps on main are cited by name".

Overlap check: the closest-roadmap lists are unchanged from the previous review: VirtualFundamentalClassPartII, StableReductionPartII, AlgebraicGromovWittenTheory, WeilConjectures and CanonicalModelsAndGonality (open), and StableReduction, EquivariantIntersectionTheory and AnalyticStableMaps (main). The owners are as recorded then. The change adds one shared object, the `ℓ`-adic blow-up decomposition; its owner is EtaleCohomologyFoundations §F.7 (main), which this roadmap cites and does not restate.

Source independence: changed passages only. I compared 7 passages with 2 sources side by side (clp, canning-larson-genus-seven): the §9.5 dichotomy, its two API bullets, its three new Checks, and the EtaleCohomologyFoundations contract. A 7-word-run scan of the 19 added lines covered every cached text. The longest shared runs are 8 words, all stock phrases ("of stable n-pointed curves of genus four over"). No layer is added, removed or reordered, so the comparison of contents of `4143737` stands: largest share clp, about 110 of 260 locators; independent.

## Not verifiable

- none in the changed passages. The three items of the previous review (harer, mukai, clp Figure 2) concern untouched targets.

## Source issues

- none

## For the human reviewers

- none
