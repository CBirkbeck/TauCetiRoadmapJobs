# Review of ScatteringDiagrams (pull request #1134 at 6406dab)

**Verdict:** accepted

Incremental re-review of the 48 lines changed since 335b422 (25 in `TauCetiRoadmap/ScatteringDiagrams/README.md`, 23 in `TauCetiRoadmap/ScatteringDiagrams/Suggested.lean`), of everything that cites them, of the gate and of the elaboration. The pull request still changes nothing outside the folder (`git diff --stat origin/main...HEAD` outside it: empty). The one blocking finding of the previous review (the gate's `module` advisory) is repaired and the gate now passes; the new Minkowski–Weyl statement elaborates, is not one-tactic padding and matches the README. No blocking finding remains. One P3 is carried forward (layer closings).

## R01 (P3) — README layers still end without `### Examples` and `### Dependencies`

**Location.** `README.md`, every `## Layer k` (lines 140, 564, 888, 1040, 1255, 1501, 1912 and Layer 7); the `*Targets.*` lists (first at line 156). Carried from the previous review's R03, whose Lean half is repaired.

**Claim.** Each layer ends with `### Examples` and `### Dependencies`, as the house shape asks.

**Witness.** `grep -n '^### Examples\|^### Dependencies' README.md` returns nothing at this head; the layers' examples live in `**Checks.**` bullets and the dependencies in per-section `*Needs:*` lines. Nothing mathematical depends on it, and the gate's shape scanners pass (`empty-sections=0 layer-ids=0 target-ids=0`).

**Repair.** Close each layer with `### Examples` (its worked examples and Checks) and `### Dependencies` (the layer's suppliers, from the `*Needs:*` lines). The author's to take or leave.

## Previous findings

- R01 — repaired: `Suggested.lean` line 1 is `module`; the worker's gate at 6406dab records `build=0 … OK`, and my rerun prints `OK`.
- R02 — repaired: the CPS and N23 page ranges at lines 1909–1910 are gone, as are the BLM/GHKK/N23 ranges at lines 2185, 2215–2217, 2302–2305 and 2362–2364; the theorem numbers stay and each was re-found in the caches (below).
- R03 — partly repaired: `Suggested.lean` lines 35, 96 and 106 now carry `/-! ## Layer k: <title> -/` headers in README order; no layer of the README ends with `### Examples`/`### Dependencies` (R01 above, P3).
- R04 — repaired: `PointedCone.fg_iff_dualFG` (`Suggested.lean` lines 98–104) states Minkowski–Weyl over `ℝ`; the README names it at lines 78, 131 and 606–607 and the docstring at lines 12–13 and 20–21.

## Verified sound

**Gate and tooling.** Worker's gate at 6406dab: every scanner 0 and `build=0 OK`. My rerun of `gate … --base origin/main`: all scanners 0, `OK`. Dependency check: `depcheck: 205 roadmaps, 1658 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line (the merge order lists ScatteringDiagrams at line 374 of 374). `lake env lean` on `Suggested.lean`: exit 0 with exactly five `declaration uses sorry` warnings (lines 58, 67, 85, 101, 160) and nothing else. Signature check: a scratch copy with `#check @PointedCone.fg_iff_dualFG` elaborated once; the elaborated type `∀ {V} [AddCommGroup V] [Module ℝ V] [FiniteDimensional ℝ V] (C : PointedCone ℝ V), Submodule.FG C ↔ PointedCone.DualFG LinearMap.id C` keeps every binder (the worker's `signatures.md` agrees: 14 declarations, 0 leads); the other 13 signatures are unchanged from 335b422 and were compared with the README last round. One-tactic probe on the same scratch copy: `simp` reports `simp made no progress` and `exact?` cannot close the goal, so the new theorem is not padding; the four older sorried theorems were probed last round.

**Pinned declarations opened (Mathlib f6090c70).** `Mathlib/Geometry/Convex/Cone/DualFinite.lean`: `PointedCone.DualFG` (line 45, `∃ s : Finset M, dual p s = C` for a pairing `p : M →ₗ[R] N →ₗ[R] R` and `C : PointedCone R N`), `DualFG.id` (65, the identity pairing on `Module.Dual`, the same convention the roadmap uses), `DualFG.dual_of_fg` (82), `DualFG.dual_dual_flip` (96); the header (line 21) states Minkowski–Weyl without proving it, and `DualFG` occurs in no other file at the pin (grep), so `C.FG ↔ C.DualFG LinearMap.id` is a theorem this roadmap owns, not a duplicate. `Mathlib/Geometry/Convex/Cone/Dual.lean` line 50: `dual p s = {y | ∀ x ∈ s, 0 ≤ p x y}`, so with `p = LinearMap.id` on `Module.Dual ℝ V` the right-hand side of the new theorem says `C` is cut out by finitely many linear forms, which is the README's sentence at lines 599–601. Both pins (the worktree's and main's `lake-manifest.json`) are Mathlib f6090c70 and Tau Ceti 358314d4, so the statement is checked at the one pin that matters.

**Changed README passages.** Convention 4 (lines 76–78) and *How to read the build* (lines 126–137) now list `PointedCone.fg_iff_dualFG` with the four headlines, and §1.1 (lines 599–607) says which half of rational Minkowski–Weyl the Lean states ("the first equivalence, over `ℝ`"); the rational half (generators and functionals rational for a lattice-rational cone) stays a README target, which the Lean statement neither claims nor contradicts. The README's `V` is a finite-dimensional real normed space (lines 53, 568), matching `[FiniteDimensional ℝ V]`. The citation lines whose page ranges were dropped keep their theorem numbers, each re-found in the caches: CPS 5a3b26d3 Proposition 3.2 line 467, Proposition 4.4 line 615, Definition 4.6 line 644, Lemmas 4.7 and 4.9 lines 657, 750; N23 6a898364 Definition 7.2 line 4484, Proposition 7.6 line 4574, Lemmas 7.7 and 7.8 lines 4581, 4638, §7 at 4416, §1 at 111, Theorem 5.2 line 2609, §5.2 line 2631, Proposition 5.4 line 2638; BLM db3c9ae1 Definition 2.1 line 314, Definitions 3.14, 3.17 lines 1054, 1072, Definitions 5.1, 5.3, 5.4, 5.9 lines 1221, 1236, 1243, 1324, Lemma 5.13 line 1348, Corollary 5.14 line 1369, Theorem 5.17 line 1424, Remark 5.20 line 1462, Example 5.21 line 1467, Lemmas 5.23, 5.27, 5.31–5.33 lines 1503, 1574, 1632, 1640, 1647, Propositions 5.28, 5.34 lines 1591, 1665, §5.5 line 1570, §8.1 line 2186 (Definition 8.1 at 2198), §9.2 line 2950 with Step 3 at 3030, Definition 9.3 line 2833, Theorem 9.5 line 2844, Corollary 9.8 line 2919, Theorem 9.9 line 2960; GHKK 141730d2 Theorem 1.13 line 816, Appendix C line 4723, C.3 line 5169; RUP 72d39f24 Definitions 4.1 and 4.5 lines 854, 959. The seeded sample's targets in the changed passages (§7.1, §7.3, §7.4) changed only by these page deletions; their statements were verified last round and are untouched.

**Cross-roadmap citations.** Unchanged since 335b422 (AnalyticToricGeometry on main under `Completed/`, RepresentationTheory/LieGroups and LieHighestWeight on main); the worker's resolver finds no cross-roadmap citation missing. Its two Lean leads (`FocusFocus.modelTheta_mul`, `PointedCone.fg_iff_dualFG`) are this roadmap's own declarations, both present in `Suggested.lean` (lines 160, 101). Ownership of Minkowski–Weyl: "Minkowski–Weyl" and `DualFG` occur in no roadmap on main and in none of the open pull requests whose files the brief provides (grep last round, index of 2026-11-03), so this roadmap is the owner; ownership against open pull requests whose files the brief does not provide was not checked.

**Adversarial table.** Rows for untouched statements carry forward from the previous report (r5 at 335b422), whose values stand; the new row has values computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `PointedCone.fg_iff_dualFG` (new) | `V = 0`; `C = ⊥`, `C = ⊤`, a line `ℝv`, a half-space `{φ ≥ 0}`, the circular cone `{z ≥ √(x²+y²)}` in `ℝ³`; `V` infinite-dimensional (excluded) | `V = 0`: `C = {0}` is `span ∅` and `dual ∅ = ⊤ = {0}`, both sides true; `⊥` in `ℝⁿ`: generated by `∅`, cut out by `±e_i^*` (`2n` forms); `⊤`: generated by `±e_i`, `dual ∅`; `ℝv`: generators `v, −v`, forms `±ψ_j` for a basis `ψ_j` of `v^⊥` (lineality allowed on both sides); half-space: generated by `±` a basis of `ker φ` plus one `u` with `φ(u) = 1`, `dual {φ}`; circular cone: not FG (infinitely many extreme rays) and not DualFG (not a finite intersection of half-spaces), so the iff holds with both sides false; infinite-dimensional `V`: `{0}` is FG but no finite set of forms cuts it out, so `[FiniteDimensional ℝ V]` is needed and is present | true as stated; pairing `LinearMap.id` on `Module.Dual ℝ V` gives `dual s = {y | ∀ φ ∈ s, 0 ≤ φ y}` (Dual.lean 50) | none |
| §0.1 cutoff-modulus Check | as r5 | as r5 (`δ′(T(j,1)) = 1`, `δ(j,1) = j`) | no modulus | none |
| §0.4 `comap_freeAugmentation_pow_ι` | as r5 (`c = 0, 1`) | as r5 (`(U⁺)^{c+1}` = degree `≥ c+1`, `lcs 0 = ⊤`, `lcs 1 = ⊕_{d≥2}`) | matches line 58 | none |
| §0.4 `exists_bch_exp_mul_exp` | as r5 (`c = 0`) | as r5 (`U_0 = ℚ`, all exponentials `1`; genuine finite series) | no junk value | none |
| §0.4 BCH to degree 3 and Heisenberg Checks | as r5 | as r5 (`X+Y+½[X,Y]+(1/12)(…)`; `X+Y+Z/2`) | true | none |
| §0.4 `exists_pbwSymmetrizationEquiv` | as r5 (`d = 0, 1, 2`) | as r5 (`β(1) = 1`, `β(ι x) = ι x`, `½(xy+yx)`); Tau Ceti's `pbwAssociatedGradedEquiv` needs `Module.Free` | README = Lean | none |
| §0.6 inner-action Check | as r5 | as r5 (`ι(x)` nilpotent in `U/I^{k+1}U`) | hypothesis met | none |
| §3.2 incoming convention and Checks | as r5 | as r5 (MAN Def 2.2, LMY Def 1.3 agree; `ρ(0,1)=0`) | agree | none |
| §3.3 two-wall Check | as r5 | as r5 (`μ = e₁* − e₂*`, `𝔡₃ = −ℝ_{≥0}(1,1)`) | as claimed | none |
| Convention 3 against sources | as r5 | as r5 (`θ^{−sgn⟨ν,γ′⟩}` in MAN, BRI) | equal | none |
| §4.3 `Ψ_q` Check | as r5 (`r = 1, 2`) | as r5 (`z^p+z^{p+n}`; `z^{2p}+(q+q⁻¹)z^{2p+n}+z^{2p+2n}`) | as claimed | none |
| §5.4 *facetDescent* route | as r5 | as r5 (generic `s`, constant sheaf restricts injectively) | unique extension | none |
| §5.5 `δ_ext` | as r5 | as r5 (`δ(n)+c ≥ 1`) | positive | none |
| §6.3 `modelTheta_mul` and Check | as r5 (`(n,m) = (−1,1), (−2,1), (−2,2), (1,1), (0,0)`; `k = 0`) | as r5 (`XY = t(1+W)`, `X²Y² = t²(1+W)²`, `r` even and `≥ 0`) | formula holds | none |
| §7.1 ray-factor Check | as r5 | as r5 (`[u]f_u = −1`) | as claimed | none |
| §7.2 pentagon Check, degree `(1,1)` | as r5 | as r5 (`½X₁₂` both sides) | equal | none |
| §7.3 diagonal wall function and one-bending criterion | as r5 | as r5 (`1+ac·u+(2bd+bc²+a²d)u²+5abcd·u³`; `[u³]f² = 14abcd+2abc³+2a³cd`; BLM Cor 5.14(2)) | README values | none |
| Headlines | BCH comap and existence, PBW symmetrization, model product, Minkowski–Weyl | stated at lines 58, 67, 85, 160, 101 on pinned carriers; the unstatable ones named in the docstring (lines 23–30) with the carrier each lacks | present | none |

## Not verifiable

- ZIE (Ziegler, Chapter 1) and SCH (Schrijver, Chapter 8), cited at README lines 629–631 for Minkowski–Weyl: no legal copy is available to the sources service (fetch log of earlier rounds); the statement is a standard textbook fact and was checked directly (table above), not against these texts.
- N23 §5.5 as a section heading was not re-found in the cache by its number (the §§5.2–5.5 range is cited as a block; §5.2 at line 2631, Proposition 5.4 at 2638 and Theorem 5.2 at 2609 were).
- Ownership against open pull requests whose files the brief does not provide was not checked.

## Source issues

- none (the BLM Remark 5.20 misprint is recorded in the previous review).
