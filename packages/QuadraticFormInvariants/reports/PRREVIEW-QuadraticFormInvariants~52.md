# Review of QuadraticFormInvariants (pull request #617 at 110ca68)

**Verdict:** needs changes

This is an incremental re-review: the folder changed by 0 lines since `2670a4e`, the head the previous review read. The pins (`lake-manifest.json`, `lean-toolchain`) are unchanged since then. Since that head the pull request has changed only the sibling folders `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/IntegralLattices/`. This README cites ClassFieldTheory as a supplier, so each passage citing it was checked against the revised text. Two of those passages are now wrong: they describe what ClassFieldTheory's `Suggested.lean` re-exports and what its Conventions say about universes, and the revision changed both (R03, R04). Of the previous three findings, the sources manifest is repaired. The gate failure and the missing merge order are not repaired (R01, R02). All four findings are P3; none touches the mathematics.

## R01 (P3) — The gate still fails on files outside the folders this review can count as the pull request's own

**Location.** The pull request as a whole, not this folder.

**Claim.** The gate fails, so the folder cannot be accepted, and nothing inside `TauCetiRoadmap/QuadraticFormInvariants/` can fix it. This brief names `ClassFieldTheory` and `IntegralLattices` as the pull request's own folders. The four files below belong to neither.

**Witness.** The worker's gate at `110ca68`: `outside-folder=4 … FAIL`, every other count `0`, `build=0`. The four files are `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/README.md`. My run lists the same four, plus the four named sibling files.

**Repair.** As before: the description names `Completed/LocalFieldsRamification` (the pull request's subject) and `Completed/LocalGaloisGroups` (ClassFieldTheory's consumer repair) as its own folders. Alternatively, those edits move to a pull request that merges first and is named in this one's merge-order paragraph. This folder does not change. Its Layer 6 citations of Local Fields Ramification (*Exact supplier contracts*, *Finite extensions*) are correct against this pull request's version of that roadmap and break if those edits are dropped.

## R02 (P3) — No merge order is stated against the four other open pull requests that change this folder

**Location.** The pull request description. Its only merge-order sentence: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Four other open pull requests change both files of this folder and conflict with this head. Nothing says which merges first, so whichever merges second silently rewrites the other's version of the folder.

**Witness.** `scratch/overlaps.md` (index of 2026-11-09): #1187, #1215, #1411 and #1797 each conflict with #617 in `QuadraticFormInvariants/README.md` and `Suggested.lean`. `roadmaps list` still shows all four open and changing `QuadraticFormInvariants`. The #1215 checkout differs from this head in 542 README lines and 264 Lean lines.

**Repair.** Add one sentence to the description, for example: "#617 merges first; #1187, #1215, #1411 and #1797 rebase their `QuadraticFormInvariants` changes onto it." The opposite order also works, with this pull request rebasing. The README does not change.

## R03 (P3) — The ClassFieldTheory supplier contract says that roadmap re-exports the local symbol and local duality, which its revision retired

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/README.md` 341–345: "the coefficient object `μ_n`, the Kummer class, the Kummer-cup pairing, the local symbol and local Tate duality (Layer 5), and Hilbert reciprocity (Layer 14). … That roadmap's `Suggested.lean` re-exports their objects under its own names (its README, §6 …)".

**Claim.** The ClassFieldTheory revision in this pull request (`d8192ae`) deleted the re-exports `localSymbol` and `tateDualityPairing`, along with `finite_H`, `tateDualityPairing_perfect_mixed` and the other duality wrappers, from its `Suggested.lean` and from the cited table. At this head, ClassFieldTheory re-exports only three of the six objects listed: `muNRep`, `kummerCupPairing` and `hilbertProductFormula`. The Kummer class was already a Tau Ceti name only.

**Witness.** `TauCetiRoadmap/ClassFieldTheory/README.md` 1164–1171: the table has no `localSymbol` or `tateDualityPairing`, and 1175–1180 says those are "the Tau Ceti declaration of the same short name". At `2670a4e` the table row "degree two, the local symbol and duality" (1152) listed both.

**Repair.** Replace the sentence with: "That roadmap's `Suggested.lean` re-exports `muNRep`, `kummerCupPairing` and `hilbertProductFormula` under its own names (its README, §6 *Downstream consumers*, table *Names imported from `Suggested.lean`*); the Kummer class, the local symbol and the duality pairing are Tau Ceti names only." The rest of the bullet stays as it is: this roadmap already consumes only the Tau Ceti declarations, and each one exists at the pin (see Verified sound).

## R04 (P3) — Milestone 2 cites ClassFieldTheory's Conventions for a universe claim that the revision withdrew

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/README.md` 1774–1776: "for a local field `K : Type` in universe `0`, the universe of the whole development of TauCetiRoadmap.ClassFieldTheory (its Conventions)".

**Claim.** The revision of ClassFieldTheory's Conventions in this pull request withdrew "the whole development is at universe `0`". Its §2.1 now restricts universe `0` to formations, class formations and the arithmetic layers. It also says the generic Layer 0 statements and the Layer 5 valuation comparison hold in any universe. The citation now attributes to that roadmap a statement it no longer makes. The universe claim about Milestone 2's own three declarations is still correct.

**Witness.** `TauCetiRoadmap/ClassFieldTheory/README.md` 123–126 at this head (at `2670a4e`, line 123 read "the whole development is at universe `0`"). Its `Suggested.lean` 77 has `{k G : Type u}`, and 216 has `valuativeExtension_of_finite (K : Type*)`.

**Repair.** Replace "the universe of the whole development of TauCetiRoadmap.ClassFieldTheory (its Conventions)" with "the universe of the class formations and arithmetic layers of TauCetiRoadmap.ClassFieldTheory (its §2.1)". Checked against the instance that refutes the current wording: `invMap` is in that roadmap's Layer 5, an arithmetic layer, and Tau Ceti's `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.lean`:98 binds `(K : Type)`. Layer 0 and `valuativeExtension_of_finite`, which the current wording wrongly covers, are excluded.

## Previous findings

- R01 — not repaired: the gate still reports `outside-folder=4 … FAIL` on `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/README.md`; the description is unchanged. Restated as R01.
- R02 — not repaired: the description's only merge-order sentence is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410"; #1187, #1215, #1411, #1797 still conflict. Restated as R02.
- R03 — repaired: `packages/QuadraticFormInvariants/sources.toml` now records `lam2005` (DOI `10.1090/gsm/067`), `gilleszamuely2017` (DOI `10.1017/9781316661277`) and `delzant1962` (C. R. 255, 1366–1368), each `uncertified` with the README's locators.

## Verified sound

**Gate and dependencies.** My gate run (`gate … --base origin/main`) gives every count `0` except `outside-folder=8`. That is the four files of R01 plus the four ClassFieldTheory and IntegralLattices files, which this brief names as the pull request's own. The worker's run adds `build=0` for `QuadraticFormInvariants.Suggested` and `GlobalQuadraticForms.Suggested`. The dependency check prints `depcheck: 236 roadmaps, 2271 edges, 0 problem(s)`, with no UPWARD and no CYCLE line.

**Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output: no `sorry` warning, no `set_option`, no `lemma`. The imports are `import Mathlib` followed by 11 `TauCeti.*` modules.

**Signatures.** I ran one scratch file importing the module, with `#check @` for the 7 declarations and the 2 exported constants. The elaborated types match `scratch/signatures.md` and the README:
- `discr` takes `[Invertible 2]` and lands in `Kˣ ⧸ Subgroup.square Kˣ`.
- `hilbertSymbol`, `localHasse` and `hilbertSymbol_neg_self` hold over every field.
- `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` carry `ValuativeRel`, `TopologicalSpace`, `IsNonarchimedeanLocalField` and `Invertible 2`.
- `hasseInvariant_eq_localHasse` is the 6E statement on diagonal tuples.
- `RegularFormClass` and `formClass` are Tau Ceti's constants.

No section binder is lost, and no file in the folder changed.

**Supplier declarations at the pin.** These are the Tau Ceti declarations that the ClassFieldTheory contract (README 346–352, 1764–1767) names. All exist at the pin:
- `TauCeti.ClassFieldTheory.muNRep`: `MuNRep.lean`:137.
- `kummerClass (hn : IsUnit (n : F))`: `MuNRep.lean`:283.
- `kummerCupPairing`: `Local/Symbol.lean`:207.
- `localSymbol`: `Local/Symbol.lean`:320.
- `tateDualityPairing`: `Local/Duality/Basic.lean`:385.
- `invMap : Br K ≃+ AddCircle 1`: `Brauer/Invariant.lean`:200.
- `brauerGroupEquivBr`: `Brauer/CentralSimple/Basic.lean`:55.
- `h2MuEquivZMod`: `Brauer/RootsOfUnity.lean`:89.
- `finiteHilbertInvariantAt`: `Global/Hilbert/Invariant.lean`:93.
- `hilbertProductFormula`: `Global/Hilbert/Reciprocity.lean`:65.
- `TauCeti.ClassFieldTheory.localSymbol_eq_zero_iff_mem_normGroup` (README 2166): `Local/CyclicClass.lean`:293.
- `TauCeti.index_normGroup_of_isCyclic` (README 1561): `Brauer/LocalH2Bound.lean`:70.
- `quaternionSubgroup_eq_twoTorsion` (67), `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` (79) and `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one` (92) are in `TauCeti/NumberTheory/LocalField/Quaternion/Invariant.lean` under `variable (K : Type)` (60), as Milestone 2 says.

**Cross-roadmap citations resolved against this head.** I diffed the ClassFieldTheory revision (`d8192ae`, 214 README and 207 Lean lines) against every passage of this README that cites it: 98–103, 341–356, 1564–1569, 1662–1670, 1683–1684, 1764–1794, 1845, 2166, 2199–2206 and 2235.
- ClassFieldTheory's Layer 5 (424) and Layer 14 (1003) headings are unchanged.
- Its §6 *Downstream consumers* (1125) and the table *Names imported from `Suggested.lean`* (1151) exist.
- Its §6 entry for this roadmap (1135–1136) reads "Layers 5 and 14, through Tau Ceti's declarations".
- Its boundary paragraph (81–85) states the same direction `ClassFieldTheory → QuadraticFormInvariants`.

Apart from R03 and R04, every citation still holds. In the IntegralLattices revision (`110ca68`), the passages that cite this roadmap (60, 128, 506–507, 1010–1012, 1159) consume the Tau Ceti names `TauCeti.hilbertSymbol_productFormula` and `hilbertSymbol`, in agreement with 6C item 14. `ProfiniteCohomology.f2Pairing`, the lead in `scratch/citations.md`, is declared at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`:5332 on main. `scratch/overlaps.md` lists no dropped ids, and no ids defined only by an open revision.

**Seeded sample.** None of the 13 seeded targets is in a changed passage. Two depend on the changed ClassFieldTheory text: "Milestone 2" (universe parenthetical, R04) and "The symbol"/"Compatibility with the cup product" (`TauCeti.ClassFieldTheory.localSymbol`, which exists at the pin). The previous review's checks of all 13 carry over unchanged.

**Remark, no change requested.** The repaired manifest's `lam2005` entry gives `cited_for = ["Layers 0–5", "Layer 8", "Layer 9"]`, and the README also cites Lam five times in Conventions. This does not affect any locator's status.

**Adversarial table.** The rows of the previous report are carried forward, because the folder is unchanged (each cites `PRREVIEW-QuadraticFormInvariants~48`). Two rows are new, for the passages that R03 and R04 touch. `(x,y)` is the Hilbert symbol over `ℚ_2` unless stated, and `ν` is the nonzero element of `H²(G_ℚ₂, 𝔽₂)`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| NEW: Milestone 2 universe parenthetical (1774–1776; R04) | the three milestone declarations; ClassFieldTheory Layer 0 and Layer 5 comparison | `quaternionSubgroup_eq_twoTorsion`, `invMap_…_eq_half_iff`, `h2MuEquivZMod_eq_one_iff_…` bind `K : Type`. ClassFieldTheory `projective_ker_of_isZero_res {k G : Type u}`, `valuativeExtension_of_finite (K : Type*)`. Its §2.1 restricts universe `0` to the arithmetic layers | milestone claim holds; "whole development" refuted (R04) |
| NEW: ClassFieldTheory re-export sentence (341–345; R03) | the six listed objects against ClassFieldTheory `Suggested.lean` | at `110ca68`: `muNRep` 115, `kummerCupPairing` 170, `hilbertProductFormula` 460 present. `kummerClass`, `localSymbol`, `tateDualityPairing` absent (the latter two present at `2670a4e`, 256 and 282) | 3 of 6; refuted (R03) |
| H1 four-fold criterion (`Suggested` 57), carried from ~48 | `(2,5)`, `(5,5)`; `a` a square | `x² − 2y²` with `x` a unit is `1, 7 mod 8`, never `5`: all five fail. `5 = 5² − 5·2²`: all hold. `b = ((b+1)/2)² − c²((b−1)/(2c))²` | holds |
| H2 local classification (`Suggested` 129), carried | `⟨1,1⟩` vs `⟨5,5⟩`; `⟨1,1⟩` vs `⟨−1,−1⟩`; `ℝ` control | `d = [1],[1]`, `s = +1 = (5,5)`, isometric via `5 = 1² + 2²`. `s = +1` vs `(−1,−1) = −1`. Over `ℝ`, `⟨1⁴⟩`, `⟨−1⁴⟩` share `(4,[1],+1)`, excluded by the local instance | holds |
| H3 cup-norm (`Suggested` 176), carried | `(2,5)`, `(5,5)`; `(−1,−1)` over `ℝ` | `(2)∪(5) ≠ 0` iff `5 ≠ x² − 2y²`. `(5)∪(5) = 0`. `(−1)∪(−1) ≠ 0` iff `−1 ≠ x² + y²` | holds |
| H4 Evens value (`Suggested` 187), carried | `d = −1`, `a = 1 + 2i`; `a = 1`; `a = c ∈ K` | `Tr = 2`, `N = 5`: `ν + 0`. `a = 1`: `(2)∪(−1) = 0`. `a = c`: `(c)∪(c) + (c)∪(d) = N(res c)` | holds |
| H5 relative formula (`Suggested` 206), carried | `Tr a = 0`; degree 1 | `w₂⟨1,−1⟩ = 0 = (2)∪(d) + (2)∪(d) + (d)∪(N a)`; `(d·N a) = (d) + (N a)` | holds |
| `ℚ_2(√5)` table, square classes, carried | `𝒪[L]ˣ/(𝒪[L]ˣ)²` | order `8`. Norms `1, −1, −5, 5`, four distinct unit classes of `ℚ_2`. `−1 ∉ L²` | holds |
| `ℚ_2(√5)` table, `Tr`, `N`, `w₁`, carried | eight rows | `Tr ω = 1`, `Tr √5ω = 5`, `N(√5ω) = 5`. `w₁`: `(5),(5),(−5),(−5),(−1),(−1),0,0` | holds |
| `ℚ_2(√5)` table, `N^Ev`, carried | eight rows | `(2,−5) = −1`, `(−2,−5) = +1`, `(−5,−1) = −1`. Rows `0, ν, ν, ν, ν, ν, ν, 0` | holds |
| `ℚ_2(√5)` table, `w₂` both sides, carried | eight rows | RHS `ν, 0, 0, 0, 0, 0, 0, ν`. LHS `⟨2,10⟩ = ν`, `⟨−2,−10⟩ = 0`, …, `⟨−5,−5⟩ = ν`. Agree | holds |
| `ℚ_2(√5)` separation claim, carried | each row | dropping either term shifts the RHS by `ν ≠ 0` | holds |
| Layer 8 table, carried | `a ∈ {±1, ±5, ±2, ±10}` | `(a,−1) = −1` for `−1, −5, −2, −10`, `+1` for `1, 5, 2, 10`. `w₂⟨2,5⟩ = ν`. `w₂⟨1,−1⟩ = 0` vs `∏_{i≤j} = ν` | holds |
| `discr` (`Suggested` 78), carried | rank 0; `⟨1,−1⟩`; `⟨1,1⟩`; `⟨1⟩`, `⟨4⟩` over `ℚ` | `[1]`; `[−1]`; `[1]`; both `[1]` | holds |
| `localHasse` (`Suggested` 100), carried | `![−1]`, `![−1,2]`, `![−1,−1]` over `ℚ_2`, `ℝ`, `ℚ_3` | `+1`; `(−1,2) = +1`; `−1`; `−1`; `+1` | holds |
| `hasseInvariant_eq_localHasse` (`Suggested` 146), carried | `n = 0, 1`; `![−1,−1]` | `ε(1) = 1`; `ε[D] = −1 = (−1,−1)` | holds |
| S1 central simple, carried | `ℍ[K,a,0,b]`; `a = 0` | `c·(0² + 4a) = 4ab ≠ 0`; `a = 0` excluded by `a : Kˣ` | holds |
| S2 symbol in `Br(K)`, carried | `⟨2,−1⟩ ≅ ⟨1,−2⟩`; `(−1,3),(−1,7),(−1,21)` over `ℚ` | `β([2],[−1]) = 1`; `−1, −1, −1`, not bilinear field-wise | holds |
| S3 Hasse invariant, carried | `⟨a⟩ ⊥ ⟨b⟩`; scaling | `[(a,b)]`; `(λ,−1)^{C(n,2)}(λ,d)^{n−1}s` | holds |
| S4 dimension ≤ 3, carried | `ℝ`: `⟨1,1⟩` vs `⟨−1,−1⟩`; dimension 4 | `s = 1` vs `[ℍ]`; `⟨1⁴⟩`, `⟨−1⁴⟩` share `d, s` | holds |
| S5 Clifford invariant, carried | `⟨1ⁿ⟩` over `ℝ`, `n = 1..8` | `C(n+1,4) = 0,0,1,5,15,35,70,126` gives `1,1,ℍ,ℍ,ℍ,ℍ,1,1` | holds |
| S6 `I²` homomorphism, carried | `ℝ`: `⟨1⁴⟩ ⊥ ⟨1³⟩`; `⟨1,1⟩ ⊥ ⟨1⟩` | `1 = [ℍ][ℍ]`; `[ℍ]` vs `1·1` | holds |
| S7 base change, carried | hyperbolic plane; rank 0, 1 | `[(1,−1)] = 1`; empty products | holds |
| S8 the symbol, carried | `(1,b)`; `𝔽₂(t)`; `(−1,3)` over `ℚ_2, ℚ_5, ℚ` | `+1`; `(t,1) = +1`, `(1,t) = −1`; `−1, +1, −1` | holds |
| S9 classical construction, carried | split `a`; index theorem | `K × K` surjective norm; `index = finrank = 2` | holds |
| S10, S11 Milestones 1, 2, carried | `ℚ_2` | `ε[D] = −1 = localHasse ![−1,−1]`; `inv = 1/2 ⟺ (2,5) = −1`, true | holds |
| S12 cup compatibility, carried | `(2)∪(5)`, `(5)∪(5)` | `≠ 0 ⟺ −1`; `= 0 ⟺ 5 = 5² − 5·2²` | holds |
| 6A counts, carried | `ℚ_2`; `ℚ_2(√5)`; `ℚ_2(√2)` | `8`; `16`; `16` | holds |
| 6B defects, carried | `1, 5, −1, −5, 5/4` | `δ = ∞, 2, 1, 1, 0`; `𝔡(−5) = 2ℤ_2` | holds |
| 6B ramified control, carried | `ℚ_2(π)`, `π² = 2`, `a = 5` | `(π + ½)² − 5/4 = 1 + π` | holds |
| 6C table, carried | basis `{−1, 2, 5}` | Gram determinant `1` over `𝔽₂` | holds |
| 6D realization, carried | `(2,[1],−1)`; `(2,[−1],−1)` | `⟨−1,−1⟩`; `(a,−a) = +1` forces the exception | holds |
| Layer 9 Evens corollaries, carried | `1 + 2i`, `d = −1`; `√d` | `(2)∪(5)`; `(2)∪(d)` | holds |
| Layer 9 `SD₁₆` control, carried | `d = −1`, `t = 2` | `ν + ν = 0 ≠ ν` | holds |

**Headlines and padding.** These are unchanged since the previous review. The five headlines are stated as `example`s closed by their Tau Ceti theorems, and the docstring says none is unstatable. The three one-term aliases are kept because GlobalQuadraticForms' Lean file uses them, and the worker's targeted build of that module passed at this head.

## Not verifiable

- Lam, *Introduction to Quadratic Forms over Fields* (2005), and Gille–Szamuely, *Central Simple Algebras and Galois Cohomology* (2017): paywalled, now recorded as `uncertified` and cited by locator. The mathematics behind their locators was recomputed in the table.
- Delzant 1962: `uncertified` (no legal open copy reachable). `kahn1984` lines 726–729 restate the definition taken from it.
- Serre, *A Course in Arithmetic*; Serre, *Local Fields*; O'Meara; Scharlau; Milnor 1970: settled as `uncertified` and cited by locator.

## Source issues

- none
