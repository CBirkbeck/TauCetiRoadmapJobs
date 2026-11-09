# Review of QuadraticFormInvariants (pull request #1215 at 12aa8f1)

**Verdict:** needs changes

Six findings: one P2 (blocking) and five P3. Everything else checked out: the mathematics of all ten layers recomputes correctly, every sampled locator in a readable source matches, the build is clean and the dependency check passes. The details are under "Verified sound".

## R01 (P2) — 6E Milestone 2 cites a "Brauer form" that is vacuous over a nonarchimedean local field

- **Location.** `TauCetiRoadmap/QuadraticFormInvariants/README.md` lines 1735–1736: "`(a,b)_K = hilbertSign (localSymbol (a) (b))`, which is `TauCeti.hilbertSymbol_eq_cohomological`, and in Brauer form `TauCeti.hilbertSymbol_eq_hilbertSign_kummerBrauerClass`."
- **Claim.** In 6E, `K` is a nonarchimedean local field. The README presents the second declaration as the Brauer-group form of the sign identity for that `K`. But that declaration assumes an injective additive map `f : ClassFieldTheory.Br F →+ ZMod 2`, and no such map exists when `F` is a nonarchimedean local field. So the cited "Brauer form" is vacuous in the milestone's own setting.
- **Witness.** `TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:213` assumes `hf : Function.Injective f`. `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:200` gives `invMap : Br K ≃+ AddCircle (1 : ℚ)`. Since ℚ/ℤ is divisible, every such `f` sends `x = invMap.symm (1/2) ≠ 0` to `2·f(y) = 0`.
- **Repair.** Delete "and in Brauer form `TauCeti.hilbertSymbol_eq_hilbertSign_kummerBrauerClass`". The Brauer-side statement that does hold over `K` is already cited three lines earlier: `TauCeti.BrauerGroup.invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff`, the local invariant of `[(a,b)]` is `1/2` exactly when `(a,b)_K = −1`. If the Kummer-Brauer form is kept, add the clause "where `Br F` embeds in `ZMod 2`, as for `ℝ` and finite fields". Tested at `K = ℚ_2`, `(a,b) = (−1,−1)`. The deleted form has no admissible `f`, because it would kill `[ℍ_{ℚ_2}] = invMap.symm (1/2)`. The kept invariant-map form gives `invMap [(−1,−1)] = 1/2` together with `(−1,−1)_2 = −1` (Serre's exponent `ε(−1)ε(−1) = 1`), so it holds.

## R02 (P3) — `Suggested.lean` restates five theorems the pin already proves

- **Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` lines 51–57, 94–105, 160–164, 177–188 and 194–204 (the five `example`s). Also `README.md` lines 23–26 and 389–391, which describe them.
- **Claim.** Each headline `example` is closed by a single term naming a pinned Tau Ceti theorem whose type is the example's own statement. The one-tactic probe therefore closes all five. A target the pin already proves is cited and dropped, not restated. These are not proved `example`s that test a kept definition: none of them mentions `hilbertSymbol` or `localHasse`.
- **Witness.** Line 57 is `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae a b`, line 105 `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq Q hQ hR` and line 164 `TauCeti.cup_kummerClass_eq_zero_iff a b`. `#check @` of all five Tau Ceti theorems prints exactly the example statements.
- **Repair.**
  1. Delete the five `example`s from `Suggested.lean`.
  2. In the module docstring, list the five headlines with the Tau Ceti declaration that proves each at the pin. Say that they are therefore not restated, so the file is not read as missing statable headlines.
  3. Drop the imports that only the examples use (`SplittingCriterion`, `CupNorm`, `Evens.Kummer.Value`, `QuadraticExtension`, `Classification`).
  4. Keep `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse` and its private helper, because `Completed/OrthogonalSpinGroups/Suggested.lean:84–86` checks them.
  5. Reword README lines 23–26 and 389–391 to match.

  Tested on the Layer 2 headline: after the deletion, the docstring names `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`, and the README's Layer 2 milestone (line 743) already cites it.

## R03 (P3) — Supplier drift: `brauerGroupEquivBr` is attributed to ClassFieldTheory Layer 5

- **Location.** `README.md` lines 1759–1761: "TauCetiRoadmap.ClassFieldTheory Layer 5 for the local invariant `TauCeti.ClassFieldTheory.invMap`, its comparison `TauCeti.ClassFieldTheory.brauerGroupEquivBr` with Brauer classes, and the local symbol."
- **Claim.** ClassFieldTheory does not state this comparison. Tau Ceti builds it from this roadmap's own Layer 7B comparison.
- **Witness.** `brauerGroupEquivBr` and "central simple" occur nowhere in `TauCetiRoadmap/ClassFieldTheory/README.md`, at this head or on main. `TauCeti/NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Basic.lean:55` defines it as `(brauerExplicitH2Equiv F).trans (unitsRepH2Equiv F)`.
- **Repair.**
  1. In 6E Milestone 2's *Needs:*, cite ClassFieldTheory Layer 5 only for `Br F`, `invMap` and the local symbol.
  2. Describe `TauCeti.ClassFieldTheory.brauerGroupEquivBr` as Layer 7B's `TauCeti.brauerExplicitH2Equiv` moved onto Class Field Theory's carrier `Br F`, and add it to 7B item 3's list.

  Checked against ClassFieldTheory Layer 5 at this head (line 1073), which states `Br F = H²(G_F, (Fˢ)ˣ)` and `invMap` but no comparison with central simple algebras.

## R04 (P3) — Open pull requests that conflict here, with no stated order

- **Location.** The pull request description. It names no other pull request.
- **Claim.** Four open pull requests change this roadmap, and their heads conflict with this head in this folder. One must be rebased on the other before either merges, and nothing says which.
- **Witness.** In `roadmaps list`, #617, #1187, #1411 and #1797 all include QuadraticFormInvariants. All four conflict with this head in `Suggested.lean`; #617, #1411 and #1797 also conflict in `README.md`. #1797 rewrites this `Suggested.lean` with sixteen aliases.
- **Repair.** State in the description which way each pair is rebased. For example: #1797 is rebased onto this pull request, since this head drops the aliases #1797 keeps (or #1797 is closed); #617, #1187 and #1411 are rebased after this one merges. Do not restate their changes here.

## R05 (P3) — A change outside the roadmap folders this pull request is reviewed as owning

- **Location.** `Completed/LocalGaloisGroups/Suggested.lean` (62 insertions, 50 deletions). This file is not in QuadraticFormInvariants, ClassFieldTheory or GlobalQuadraticForms.
- **Claim.** The change repoints that file at renamed ClassFieldTheory names, so it is a consumer update forced by the ClassFieldTheory revision. The brief does not name that folder as the pull request's own.
- **Witness.** `git diff --stat origin/main...HEAD` lists the file. In it, `ClassFieldTheory.artinMap K x` becomes `TauCeti.ClassFieldTheory.artinMap K x` (line 248), and an import of `…CohomologicalDimension.Strict` is added.
- **Repair.** Name `Completed/LocalGaloisGroups` in the pull request description as a consumer update required by the ClassFieldTheory renaming, or move it into its own pull request ordered with this one. Nothing in this folder changes.

## R06 (P3) — 6C item 13's dependency on Layer 7C is missing from its *Needs:* line and from Layer 6's Dependencies

- **Location.** `README.md` lines 1643–1646 (6C *Needs:*) and lines 1804–1810 (Layer 6 Dependencies). Compare line 1627: "The comparison runs through Layer 7C's cup-norm theorem".
- **Claim.** Item 13 uses Layer 7C. Meanwhile Layer 7's Dependencies (line 2197) list "Layer 6C for the local identification only". Unless the edge is recorded item by item, the layer-level edges 6 → 7 → 6 close a coarse cycle. The README records such an edge only for 6E's second milestone.
- **Witness.** The 6C *Needs:* line lists 6A, 6B, Layers 0, 2 and 3, `legendreSym` and ClassFieldTheory Layers 5 and 14, but not Layer 7C. Line 1809 says "with 6E's second milestone after Layer 7B" and is silent on 6C item 13.
- **Repair.** Add "Layer 7C's cup-norm theorem, for item 13" to the 6C *Needs:* line. Add "and 6C's item 13 after Layer 7C" to Layer 6's Dependencies, matching "How to read the build" (lines 381–382), which already says so. Tested: after the change every Layer 6 → Layer 7 edge is item-level (6C item 13, 6E Milestone 2), and Layer 7 → Layer 6 uses only 6A and 6C items 1–12, so there is no cycle.

## Verified sound

**Gate and build.**
- The worker's gate passes every check (`build=0`, `statement-hygiene=0`, `outside-folder=0`, `stray-files=0`).
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no warnings; the file has no `sorry`.
- A scratch file with `#check @` for `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse` and the five Tau Ceti headline theorems elaborates. Each type equals its README statement, including the hypotheses in README lines 2598–2600, and no section binder was lost.
- There is no `set_option`, `lemma`, `#eval` or sorried data, and there is a single `import Mathlib`.

**Dependency check (output):** `depcheck: 236 roadmaps, 2277 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. The roadmap is on main and its suppliers are all on main: ClassFieldTheory, ProfiniteCohomology, RepresentationTheory.SemisimpleAlgebras and Completed/LocalFieldsRamification.

**Names.**
- 696 distinct dotted backticked names in the README were indexed against the pinned Mathlib and Tau Ceti sources, including `public` declarations. All resolve exactly, with no namespace fallback, except for ten roadmap-prefixed names.
- Those ten resolve in sibling `Suggested.lean` files:
  - `Completed/LocalFieldsRamification/Suggested.lean:708, 720, 857, 870`;
  - `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:431, 3868, 5145, 5332, 5537, 5846`.
- Mathlib's `Algebra.GrothendieckAddGroup` is `to_additive` of `GrothendieckGroup.lean:36`.

**Library declarations opened at the pin (24):**
- `TauCeti/NumberTheory/ClassFieldTheory/Brauer/LocalH2Bound.lean:70`: `index_normGroup_of_isCyclic`, stated for `K L : Type` with cyclic Galois; Herbrand quotient, no reciprocity.
- `TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.lean:86, 130, 147`.
- `TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:157, 191, 213`.
- `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Basic.lean:151` (`Br`).
- `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:200` (`invMap`).
- `TauCeti/NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Basic.lean:55`.
- `TauCeti/NumberTheory/LocalField/Quaternion/Invariant.lean:60–92`: `K : Type`, which confirms the README's universe-0 remark.
- `TauCeti/NumberTheory/LocalField/Quaternion/Subgroup.lean:38, 114`: `Type*`.
- `TauCeti/Algebra/Quaternion/CentralSimple.lean:69, 81, 151, 198`.
- `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.lean:570, 657`.
- `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Hasse/Basic.lean:205, 241, 253`.
- `TauCeti/Algebra/Quaternion/BrauerClass.lean:380`.
- `TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic.lean:214`.
- Mathlib `Algebra/BrauerGroup/`: only `Defs.lean`, with no group instance and no Hilbert symbol. This matches README lines 283–285.

**Cross-roadmap citations resolved (all at this head; ClassFieldTheory also on main):**
- ClassFieldTheory Layers 5 and 14: head lines 1051 and 2155; main lines 920 and 1872. Head line 1640 confirms that Layer 5 supplies `index_normGroup_of_isCyclic`.
- ProfiniteCohomology Layers 0–4, 8–10, 12 and 13 (lines 583–2163). Corestriction is in Layer 10 and the Evens norm in Layer 13.
- SemisimpleAlgebras Layers 4–6 (lines 249, 274, 293).
- LocalFieldsRamification Layers 0–2 (lines 72, 281, 576). The "closed wrapper" claims are true: lines 720, 857 and 870 have proofs and line 708 is `sorry`.
- `Completed/OrthogonalSpinGroups/Suggested.lean:84–86` imports exactly the three names kept here.
- `roadmaps grep` over all open heads finds no other Lean user of this namespace, so the names this pull request drops break no consumer.

**Ownership against open pull requests** was checked against the sibling checkouts:
- QuadraticFormInvariantsPartII owns only this roadmap's exclusions and imports Layers 1, 4, 7A, 7B and 9, as README line 2706 says.
- ClassFieldTheory at this head disowns local quadratic-form invariants (lines 210–225), so the direction is ClassFieldTheory → this roadmap.
- `overlaps.md` reports no dropped or revision-only ids.

**Sampled locators verified in readable sources:**
- EKM:
  - §98.C, p. 388 (`ekm2008` line 20352);
  - §98.E, p. 389 (line 20422);
  - Example 98.10, p. 390 (line 20446);
  - Fact 98.13 (1)–(4), pp. 390–391 (lines 20478–20534);
  - Example 14.1, Lemma 14.2 (both summands even, trivial discriminant) and Theorem 14.3, pp. 63–64 (lines 3432–3447);
  - Example 99.1 (3)–(4), p. 394 (lines 20800–20821);
  - Example 99.5, p. 395 (line 20851, `(a) ∪ (b) = (a,b)`);
  - Example 99.7, p. 395 (line 20901);
  - §10 p. 55 and the Arf invariant in §13, p. 62 (lines 39 and 3381).
- Kahn: Lemme II.2.1 (`kahn1984` line 763, p. 241) matches the two-case formula word for word, including `Tr a ≠ 0`; Prop. II.3.5 (line 1044, p. 249) is Théorème 2 for a quadratic extension and rank one.
- Serre CMH: §1.2 names `w₂` the Witt invariant (`serre1984cmh` line 54); Théorème 1 with `(2)(d_E)` (line 147); Théorème 1′ (line 561, p. 668) with the remark that `d_E` and not `d(Q_{E,α})` enters (line 562); the second proof (line 582).
- Kozlowski Thm 1.1 (`kozlowski1984` line 34, p. 309).
- Evens's norm map (`evens1963` lines 9–12).

**Adversarial pass (values computed on each side):**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Four-fold criterion (L2 headline) | `ℚ_2`: `(2,5)`, `(5,5)`; any `K`: `a = 1` | `(2,5)_2`: Serre exponent `α·ω(5) = 1`, so `−1` and all five fail. `5 = 5² − 5·2² = 25 − 20`, so all hold. `b = ((b+1)/2)² − ((b−1)/2)²` | holds |
| Local classification (6D headline) | `ℝ`: `⟨1⁴⟩` vs `⟨(−1)⁴⟩`; `ℚ_2`: `⟨1,1⟩` vs `⟨−1,−1⟩`; rank 0 | `ℝ`: both `(4,[1],+1)` (six factors `(−1,−1)`), not isometric, so the local hypothesis is needed (present). `ℚ_2`: `(2,[1],+1)` vs `(2,[1],−1)`, separated. Rank 0: both sides true | holds |
| Cup-norm (7C headline) | `ℚ_2 (2,5)`; `ℝ (−1,−1)`; `a = 1` | `(2)∪(5) ≠ 0` and `5 ≠ x²−2y²`; `(−1)∪(−1) ≠ 0` and `−1 ≠ x²+y²`; `(1) = 0` and `b = x² − y²` solvable | holds |
| Evens value (L9 headline) | `ℚ_2`, `d=−1`, `a=1+2i`; `a=c ∈ K`; `a=√d` | `Tr 2`, `N 5`: `(2)∪(5)+(2)∪(−1) = (2)∪(5) ≠ 0`. `a = c`: formula `= (c)∪(c)+(d)∪(c) = N(res y)`. `Tr = 0`: `(2)∪(d)` (Kahn) | holds |
| Relative SW, degree 2 (L9 headline) | `a=1`; `Tr a=0`; `Tr a≠0` | `N^Ev((1)) = (2)∪(−1) = 0` and `cor = 0`, so both sides equal `w₂(Tr⟨1⟩)`. `Tr a = 0`: LHS `w₂⟨1,−1⟩=0`, RHS `2·(2)∪(d)=0`. Otherwise both sides `(Tr a)∪(−dN a)` | holds |
| `hasseInvariant_eq_localHasse` | ranks 0, 1; `![−1,−1]` over `ℚ_2` and `ℚ_3` | rank ≤ 1: `ε(1)=1=` empty product. `ℚ_2`: `ε[ℍ]=−1=(−1,−1)_2`. `ℚ_3`: split, `+1 = +1` | holds |
| `localHasse` (def) vs O'Meara `∏_{i≤j}` | `ℚ_2`: `![−1,2]`, `![−1]` | `s=(−1,2)=+1` (`2=1²+1²`); O'Meara gives `(−1)(+1)(+1)=−1 = s·(−2,−1)` with `(−2,−1)_2=−1`. `![−1]`: `s=1`, O'Meara `−1` | wrong model excluded |
| Quaternion algebras central simple | `ℍ[K,a,b,c]`; two-parameter case | `(2i−b)² = b²+4a`, so the symbol is `(b²+4a, c)`. Two-parameter hypothesis `b·4a ≠ 0` for units | holds |
| Symbol in `Br(K)` / binary invariance | `⟨2,−1⟩ ≅ ⟨1,−2⟩` | `⟨2,−1⟩` represents `2−1=1`, normal form `⟨1,−2⟩`, so `[(2,−1)] = [(1,−2)] = 1`. Consistent with `(2,−1)_2 = +1` | holds |
| Hasse invariant formulas | `s(λq)`; `⟨a⟩⊥⟨b⟩`; rank 0 | `∏(λaᵢ,λaⱼ) = s·(λ,λ)^{C(n,2)}·(λ,d)^{n−1}` with `(λ,λ)=(λ,−1)`. `⟨a⟩⊥⟨b⟩`: `(a,b) = 1·1·(a,b)`. ℕ-truncated `rank−1 = 0` in rank 0 is harmless because `d=[1]` | holds |
| Classification, dim ≤ 3 | `ℝ` dims 2, 3, 4 | dim 3 signatures `3,1,−1,−3` give `(d,s) = (1,1),(−1,1),(1,ℍ),(−1,ℍ)`, all distinct. Dim 4 `⟨±1⁴⟩` collide, so the bound is needed | holds |
| Clifford invariant (Lam V.3.20) | `⟨1ⁿ⟩`, `n=1..8`; `⟨−1,−1,−1⟩`; `I²`, `m=1..6` | `C(n+1,4) = 0,0,1,5,15,35,70,126` gives `1,1,ℍ,ℍ,ℍ,ℍ,1,1`, matching `ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ`. `C₀ ≅ ℍ`, formula `ℍ·ℍ·ℍ = ℍ` (`1` without the first factor). Parity of `C(2m+1,4)` = parity of `m(m−1)/2`: `0,1,1,0,0,1` | holds |
| `I²` homomorphism, additivity | `ℝ`: `⟨1⁴⟩⊥⟨1³⟩`; `⟨1,1⟩⊥⟨1⟩` | `d±⟨1⁴⟩ = (−1)^6 = 1`: `c(⟨1⁷⟩) = 1 = ℍ·ℍ`. Neither summand in `I²`: `c(⟨1³⟩) = ℍ ≠ 1·1` | hypothesis needed and present |
| Base change and remaining API | rank ≤ 1 | `c(⟨1⟩) = 1` (list above) and `s = 1` (empty product) | holds |
| The symbol (6C) | any field; `ℚ`, `a = −1` | `−a = 0² − a·1²`. `(a,a) = (a,−1)` via `−1 = X²−aY² ⟺ a = (aY)² − aX²`. Over `ℚ`: `3`, `7` and `21` are not sums of two squares, so the indicator is not multiplicative | holds; warning correct |
| Classical construction, index 2 | `ℚ_2(i)` | norms are the classes `[1],[2],[5],[10]` (`1, 1+1, 1+4, 1+9`): 4 of 8, index 2 | holds |
| 6B defects | `ℚ_2`: `1, 5, −1, −5, 5/4`; `ℚ_2(√2)`, `d=1` | `δ = ⊤, 2, 1, 1, 0` (`5/4 − (1/2)² = 1`); `𝔡(−5) = 2ℤ_2 ≠ 8ℤ_2`. Index of `U(K,4)(𝒪ˣ)²` is `8/2 = 4` | holds |
| 6C Gram matrix and closed formulas | basis `{−1,2,5}`; `ε, ω` on `1,3,5,7` | rows `(1,0,0),(0,0,1),(0,1,0)`, det `≡ 1`. `ε = 0,1,0,1`, `ω = 0,1,1,0` | holds |
| Realization exceptions | `ℚ_2` | `⟨−1,−1⟩` realizes `(2,[1],−1)`; `⟨a,−a⟩` forces `s=+1` when `d=[−1]`; rank 1 forces `s=+1` | holds |
| Milestone 1 | `Q(ℚ_2)` | `{1,[ℍ]}`, `ε[ℍ] = −1 = (−1,−1)_2`; `#Q = 2` | holds |
| Milestone 2 | `ℚ_2`, `(−1,−1)` | `invMap = 1/2` and `(−1,−1)_2 = −1` agree. Brauer form: no injective `f : ℚ/ℤ → ZMod 2` | **R01** |
| Compatibility with the cup | `ℝ` | `ι[ℍ] = (−1)∪(−1) ≠ 0` (EKM 99.5) | holds |
| Wrong Evens candidate (L9 warning) | `ℚ_2`, `d=−1`, `t=2` | `(2)∪(5) + (−1)∪(−1)`: both summands nonzero in a group of order 2, so `0`, while the value is `(2)∪(5) ≠ 0` | excluded |
| Kahn basis | `a = 1+2i` | `⟨Tr a, d·Tr a/N a⟩ = ⟨2, −2/5⟩`; discriminant `−4/5 ≡ −5 = d·N a` | holds |
| Clifford comparison, n = 3 (L8) | `ℝ ⟨−1,−1,−1⟩` | `A_3 = B_3 = 1`, `w₂ = (−1)∪(−1)`, `ι(c) = 3·(−1)∪(−1) = ι[ℍ]` | holds |
| Discriminant checks (L3) | `⟨1,−1⟩`, `⟨1,1⟩` | `d = [−1],[1]`; `d± = [1],[−1]` (sign `(−1)^1`) | holds |
| 6C item 13 / 7C dependencies | layer edges | item 13 uses 7C while 7 lists 6C | **R06** |

## Not verifiable

These texts are settled `uncertified` in the manifest (paywalled, cited by locator) and none is in the sources cache. I looked in the cache listing above and did not request them again.

- Lam 2005: III.2.7, III.2.11, V.3.4, V.3.16, V.3.18, V.3.20, V.3.21, pp. 119–120 (the Wall caution).
- Serre, *A Course in Arithmetic*: III.1.1–1.2, Thms 1–2 with the corollary, IV Thms 5–7, Prop. 6.
- Serre, *Local Fields*: Ch. X, XIV §2, Props. 4–5.
- O'Meara 1963: 63:1, 63:2, 63:11–13, 63:17–23.
- Gille–Szamuely: 1.1.9, 1.5.2, 4.4, 4.7.
- Scharlau: Ch. 2 §5.
- Delzant 1962.
- Milnor 1970 §4.

The sampled targets that rely partly on these are "The Hasse invariant", "Classification in dimension at most three", "The Clifford invariant", "The quaternion symbol in `Br(K)`", "The `I²` homomorphism" (step 3), "The classical construction" (index theorem), "Milestone 1" (63:17–18) and "Milestone 2" (XIV §2). Their mathematical content was recomputed in the table above.

Guillot is cited without a locator, so the version difference between the cached arXiv v1 and Ann. Inst. Fourier 60 does not matter.

## Source issues

- none
