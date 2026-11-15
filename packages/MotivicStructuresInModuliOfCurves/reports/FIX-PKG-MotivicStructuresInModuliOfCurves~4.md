# FIX-PKG-MotivicStructuresInModuliOfCurves~4

This round repairs the five findings of `REV-PKG-MotivicStructuresInModuliOfCurves~3` on `packages/MotivicStructuresInModuliOfCurves`. Two files changed: `README.md` and `sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged; no gap was added or removed.

## F01 (P1) — applied

Verified. In clp-h11 lines 234–238 a divisor `D_B` exists only when `|B^c| ≥ 2`. At `n = 11` a ten-element `B` would leave the unstable `M̄_{0,2}`, so the sum of Corollary 2.5 (clp-h11 line 317) is empty and the map is `ℚ² → 0`. The source's genus-two proof (clp-h11 lines 545–577) uses Corollary 2.5 only on factors with at least twelve flags. When both sides have at least two markings, it splits the opposite factor instead.

Changed:
- §4.7: unbounded injectivity → injectivity for `n ≥ 12`, with the `n = 11` failure stated and `|B^c| ≥ 2` required. New Check at `n = 11, 12`.
- §10.8: one sentence → the three separating cases, with the ordering checked. New Check at `(2, 12)`.
- Corrections: new entry for CLP-H11 Corollary 2.5.

Same pattern elsewhere: none. The other uses of §4.7's injectivity are the §10.8 loop case, at `n + 2 ≥ 14` flags, and the case `|A^c| ≤ 1`, at `≥ 12` flags. §§4.8, 10.9 and 11.3 use only the basis or the boundary rule.

## F02 (P2) — applied differently

Changed:
- §4.6, third Check (the old "not reached by forgetful pullback") → a fourth Check confined to formal tensors. It states that the functional is not shown to descend through `G`, and that the STE contains products `[D_{A,B}]·c` that the formal calculation ignores.
- §4.6 statement: `T^k_n = 0` "for `k ≤ 23`" → "for odd `k` or `k ≤ 23`".
- Scope and Corrections: the obstruction claim is gone. The containment for even `k ≥ 24` is now stated as unproved and not a target.

Agreed with the review: the old Check did not prove non-containment. I found a second gap. The STE generated at `(23, 24)` contains all of `H²²(M̄_{2,23})`: apply §4.6 at `k = 22`, where `T²²_{23} = 0`, `H²⁰(M̄_{2,22}) = RH` by §4.3 and `H²⁰(M̄_{1,m}) = RH` by §3.3. So it also contains `[D_{A,B}]·c = ξ_*(ξ^*c)`, whose `H¹¹⊗H¹¹` components the functional never saw. And `ker G` modulo two-edge images is `Gr^W_{24}H^{23}(M_{2,23})`.

Not applied: restoring CLP's three-family statement for even `k ≥ 24` as a target, with "`T^k_n` ⊂ STE" as an intermediate target. Evidence:
- No proof exists. CLP asserts the containment without argument (clp lines 435–437), and the review says it has not proved it either.
- Its truth depends on the two unknowns above, which no cited source computes.
- A target must be a true statement with a route. This one has neither, and nothing in the roadmap consumes it: the applications use `k = 11, 13, 15`, where `T = 0`.
- The README's targets are the printed lemma in every degree where a proof is known (odd `k`, `k ≤ 23`), and the version with `T^k_n` added for all `k`.

Whether to carry an unproved printed lemma as a target is a scope decision for a human (see "For the maintainer").

## F03 (P3) — applied

Verified: bfp lines 1643–1645 give *Compositio Math.* 140 no. 3 (2004), 647–666, DOI `10.1112/S0010437X03000253`. The README reference already says so.

Changed in `sources.toml`, entry `arsie-vistoli`: venue "Multiple-Valued Logic …, 2002" → "Compositio Mathematica 140 (2004), no. 3, 647–666". Added `doi`. The `version_note` now says the arXiv v2 numbering is the one cited (Corollary 4.7, arsie-vistoli line 503). Key, arXiv id and provenance are unchanged.

## F04 (P3) — applied

Changed: §4.6 now has an API list for `T^k_n` (six prose bullets):
- the image of the Gysin maps `(H^a ⊗ H^b)(−1) → H^k`, which raise degree by two with one twist, so `T^k_n` is a sub-Hodge structure that is Galois-stable;
- `S_n`-stability;
- the Koszul sign under exchanging the factors;
- vanishing for odd `k`, for `k ≤ 23` and for `n ≤ 19`;
- containment in any STE that has the needed odd genus-one classes.

Checks: the `T²³`, `T²⁴_1` and `T²⁴_{21}` boundary values and the even-factor non-example, alongside the requalified Check of F02. No Lean declaration.

## F05 (P2) — applied differently

Verified: CanonicalModelsAndGonality §5.4 plans Brill–Noether existence and `gon_{k̄} ≤ ⌊(g+3)/2⌋`. SchemeAndStackFoundations §3.2 contains only Riemann–Hurwitz and degree bounds. So §6.1's route relied on an input no supplier provided.

Changed:
- §6.1 Needs and route: they now cite CanonicalModelsAndGonality §5.4 at `g = 7`, carried to curves by AlgebraicCurves Layer 12 (12B–12C, on main).
- New supplier contracts for both, a Scope bullet, and the Layer 6 Dependencies.
- New Check: `ρ(7,1,5) = 1`, `ρ(7,1,4) = −1`.

Not applied: moving ownership of Brill–Noether here. The brief says to cite an existing owner. It also lets this package consume another author's open pull request that adds a new roadmap folder, which is what CanonicalModelsAndGonality is. The dependency check accepts the edge.

## Checks

- **Elaboration.** `lake env lean packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout, exited 0 with no output. The file is unchanged: `import Mathlib` only, no `TauCeti.*` import, no declarations. The mechanical `#check @name` comparison has nothing to check: there are zero declarations, so no binder or signature changed.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`. There was no UPWARD, CYCLE or `moved:` line. Before the F05 edit it was `245 roadmaps, 2241 edges, 0 problem(s)`.
- **`roadmaps resolve`.** "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **Gate failures.** None were listed in the brief.
- **Sources.** Nothing was fetched. Every locator was read in the cached texts: clp-h11 lines 230–317 and 495–577; clp lines 433–440 and 114–115; bfp lines 1643–1645; arsie-vistoli line 503. `needs-references.toml` was not created.
- **Ownership.** The only object whose ownership was in question is Brill–Noether existence with the gonality bound. Its owner is CanonicalModelsAndGonality §5.4, found with `roadmaps grep` across main, the 475 open heads and `packages/`. Main's AlgebraicCurves places Brill–Noether in its scope exclusions. CanonicalModelsAndGonality does not cite this roadmap, so there is no cycle. This round introduced no new carrier.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result / change |
| --- | --- | --- | --- |
| §4.7 injectivity | `n = 11, 12, 13` | ranks `2·C(10,10) = 2`, `2·C(11,10) = 22`, `2·C(12,10) = 132`; `\|B^c\| = 1, 2, 3`; stable `D_B`: none, `C(12,2) = 66`, `C(13,3) = 286`; at `n = 11` the map is `ℚ² → 0` | Bound `n ≥ 12` added; Check added. |
| §4.7 boundary rule | `n = 12`, `B^c = {x,y}` | `\|A∩B\| = 9` gives 0; `= 10` gives `pr₁^*ω_{ε(A)}` | Unchanged; existence condition `\|B^c\| ≥ 2` made explicit. |
| §10.8 loop case | `n = 12` | `H¹¹(M̄_{1,14})` rank `2·C(13,10) = 572`; §4.7 applies (`14 ≥ 12`) | Holds. |
| §10.8 `\|A^c\| ≤ 1` | `n = 12`: `\|A\| = 12, 11` | factors `M̄_{1,13}` (rank 132), `M̄_{1,12}` (22); other contraction: genus-two vertex if `p ∈ B`, else separating with sides `10` and `n − 10 = 2` | Holds; ordered before `\|A^c\| ≥ 2`. |
| §10.8 `\|A^c\| ≥ 2` | `(2,12)`, `\|A\| = 10`; `(2,20)`, `\|A\| = \|A^c\| = 10` | vertices of `Φ_A`: `M̄_{1,11}`, `M̄_{1,2}`, `M̄_{0,3}`; `β` on `ℚ²` is `±id`; at `(2,20)` the map `ℚ²⊕ℚ² → ℚ²⊕ℚ²` is `±id`; other contraction has a genus-two vertex (`H¹¹ = 0`) | Holds without §4.7 injectivity. |
| §4.6 `T^k_n` vanishing | `k = 23`; `k = 24` with `n = 1, 19, 21` | odd `k`: `a + b = 21` cannot be two odd numbers `≥ 11`; `k = 24`: `(11,11)` only; flags `n + 2 = 3, 21, 23` against `22` needed | `T = 0` for odd `k`, `k ≤ 23` and `n ≤ 19`; for odd `n` the first open case is `(21, 24)`. |
| §4.6 formal functional | `n = 23`, `\|A′\| = 10` | `φ(π_x^*[A′,α⊗β]) = (−1)^{11}εε + (−1)^{10}εε = 0`; `φ[A, ω⊗ω_C] = (−1)^{10}·1·1 = 1`; exchange: `(−1)^{23−\|A\|} = −(−1)^{\|A\|}` matches the Koszul `−1` | True on `V` only; no cohomological claim. |
| §4.6 `H²²(M̄_{2,23})` in the `k = 24` STE | `(n, k) = (23, 22)` | `T²²_{23} = 0` (`22 − 2 = 20 < 22`); `H²⁰(M̄_{2,22}) = RH` (§4.3, `r = 10`); `H²⁰(M̄_{1,m}) = RH` (§3.3) | Holds; gives `[D]·c` in the STE. |
| §4.6 Koszul sign | `a = b = 11` | swap on `H¹¹ ⊗ H¹¹`: `(−1)^{11·11} = −1` | API bullet. |
| §6.1 Brill–Noether | `g = 7`, `d = 5, 4`; hyperelliptic | `ρ(7,1,5) = 7 − 2·3 = 1`; `ρ(7,1,4) = 7 − 2·4 = −1`; `⌊10/2⌋ = 5`, `⌊9/2⌋ = 4`; hyperelliptic gonality `2 ≤ 5` | Supplier cited; Check added. |
| F03 venue | bfp line 1644, README reference | Compositio 140(3), 647–666, DOI `10.1112/S0010437X03000253` in both | Manifest corrected. |

## For the maintainer

- **New supplier.** This package now consumes CanonicalModelsAndGonality §5.4. That is an open pull request by another author (#1726) that adds the roadmap folder; it is not yet in `ORDER.txt`. It must merge before this package, and the merge-order paragraph should name it.
- **New citation on main.** AlgebraicCurves Layer 12 (12B–12C) is now cited. It is on main, so it imposes no ordering.
- **F02 is re-raised.** The remaining disagreement is whether to state CLP Lemma 3.2's unproved form for even `k ≥ 24` as a target. That is a scope decision, not mathematics this package can settle. Neither the source nor the review supplies a proof, and the README records the containment as unproved.
- **No sections renumbered.** No other roadmap cites the changed sections (§§4.6, 4.7, 6.1, 10.8). §4.6's Check list now has five items; the Corrections entry points to its fourth.
- No `Suggested.lean` name changed.
