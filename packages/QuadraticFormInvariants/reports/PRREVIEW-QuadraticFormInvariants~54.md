# Review of QuadraticFormInvariants (pull request #617 at 911db42)

**Verdict:** needs changes

This is an incremental re-review. Since `110ca68` the folder changed by 27 README lines in three places:

- the LocalFieldsRamification supplier sentence (README 338–344);
- the ClassFieldTheory supplier sentence (345–354);
- the universe parenthetical of Milestone 2 (1783–1788).

`Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged. The repairs of the previous R03 and R04 are correct. The rewritten LocalFieldsRamification sentence, which no finding asked for, is also correct, with the counts computed below. Two P3 findings remain, the previous R01 and R02. Both concern the pull request as a whole, and nothing in this folder's text has to change for them.

## R01 (P3) — The gate still fails on files outside the folders this review may count as the pull request's own

**Location.** The pull request as a whole, not this folder.

**Claim.** The gate fails, and while it fails the folder cannot be accepted. This brief names `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/IntegralLattices/` as the pull request's own folders. Five changed files belong to neither. The gate lists four of them. `git diff --stat origin/main...HEAD` also lists `Completed/LocalGaloisGroups/Suggested.lean`, a 12-line change from the consumer repair that the gate's list omits.

**Witness.** My gate run at `911db42` reports `outside-folder=8 … FAIL`, with every other count `0`. The eight are `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`, `Completed/LocalGaloisGroups/README.md` and the four named sibling files.

**Repair.** The description should name `Completed/LocalFieldsRamification`, the pull request's subject, and `Completed/LocalGaloisGroups`, ClassFieldTheory's consumer repair, as its own folders.

Moving those edits to another pull request would break this folder. Its rewritten sentence at README 338–344 cites LocalFieldsRamification's *Exact supplier contracts* items and its *Names imported by other roadmaps* subsection, and both exist only in this pull request's revision of that roadmap. On main, that README has "Scope and exported contract" and "The build, in layers" instead.

This folder does not change.

## R02 (P3) — No merge order is stated against the four other open pull requests that change this folder

**Location.** The pull request description. Its only merge-order sentence is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Four other open pull requests change this folder's README and `Suggested.lean`, and their heads conflict with this one. Nothing says which merges first, so whichever merges second silently rewrites the other's version of the folder.

**Witness.** The overlap index of 2026-11-09T18:08 lists #1187, #1215, #1411 and #1797. Each conflicts with #617 in `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`.

**Repair.** Add one sentence to the description, for example: "#617 merges first; #1187, #1215, #1411 and #1797 rebase their `QuadraticFormInvariants` changes onto it." The opposite order also works if this pull request rebases instead. The README does not change.

## Previous findings

- R01 — not repaired: the gate still reports `outside-folder=8 … FAIL`, four of the files outside the named folders (`Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`, `Completed/LocalGaloisGroups/README.md`). The description is unchanged. Restated as R01.
- R02 — not repaired: the description's only merge-order sentence still names #1410 alone. #1187, #1215, #1411 and #1797 still conflict in this folder. Restated as R02.
- R03 — repaired: README 349–354 now reads "re-exports `muNRep`, `kummerCupPairing` (Tau Ceti's for `n ≠ 0`, and `0` at `n = 0`), `finiteHilbertInvariantAt` and `hilbertProductFormula` … the Kummer class, the local symbol and the invariant on `Br(K)` are Tau Ceti names only there".
- R04 — repaired: README 1784–1786 now reads "the universe of the formations, class formations and arithmetic layers of TauCetiRoadmap.ClassFieldTheory (its §2.1 *Formations*, which exempts the generic statements of its Layer 0 and the comparison of valuations of its Layer 5)".

## Verified sound

### Gate and dependency check

My run of `gate … --base origin/main` at `911db42` reports every count `0` except `outside-folder=8` (R01). The worker's run at this head adds `build=0` for `QuadraticFormInvariants.Suggested` and `GlobalQuadraticForms.Suggested`.

The dependency check prints:

```text
depcheck: 236 roadmaps, 2273 edges, 0 problem(s)
```

It has no UPWARD, CYCLE or `moved:` line. Every supplier this folder cites is on main: ClassFieldTheory under `TauCetiRoadmap/`, LocalFieldsRamification under `Completed/`, ProfiniteCohomology under `TauCetiRoadmap/`.

### Elaboration and signatures

`lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output, so there is no `sorry` warning. The file has no `set_option` and no `lemma`.

I put `#check @` for the 7 declarations in one scratch file that imports the module. The elaborated types are identical to the worker's signature list and agree with the README:

- `discr` takes `[Invertible 2]`.
- `hilbertSymbol`, `localHasse` and `hilbertSymbol_neg_self` hold over every field.
- `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` carry `ValuativeRel`, `TopologicalSpace`, `IsNonarchimedeanLocalField` and `Invertible 2`.

No section binder is lost. The same probe gave the pinned types of `TauCeti.card_squareClasses` (`4 * Nat.card 𝓀[K] ^ natCastValuation K 2 h2`) and `TauCeti.card_squareClasses_of_isUnit` (`= 4`). The Tau Ceti names the probe could not see, because this module does not import them, I located by file at the pin (see *Supplier declarations at the pin* below).

### The rewritten LocalFieldsRamification sentence (README 338–344)

The bullet consumes 14 Tau Ceti declarations. Against LocalFieldsRamification at this head (README 591–644, `Suggested.lean`), they split as follows.

- **Ten are re-exported in that roadmap's namespace**, each with its `Suggested.lean` line:
  - `normalizedValuation` (115), `ramificationIndex` (183), `inertiaDegree` (187), `natCastValuation` (223), `absoluteRamificationIndex` (241);
  - `unitFiltration` (257), `UnitFiltrationGraded` (288), `teichmuller` (292);
  - `normGroup` (389), `mem_normGroup_iff_dvd_normalizedValuation` (404).

  These are the "valuation, ramification, unit-filtration, Teichmüller and norm-group names". The last one takes `e(L/K) = 1` instead of `IsUnramified`, which that README's packaging paragraph (631–644) records.
- **Two are Tau Ceti names only:** `TauCeti.algebraicExtensionValuativeRel` and `TauCeti.finiteExtension_isNonarchimedeanLocalField`. Neither occurs in that `Suggested.lean`. Its `finiteIntermediateField_*` names are different Tau Ceti declarations.
- **Two appear through specializations:**
  - `card_squareClasses_dyadic` (343) is closed by `TauCeti.card_squareClasses` (`PowerSubgroup/Basic.lean`:390) at `v_K(2) = e`.
  - `card_squareClasses_of_isUnit` (337) is Tau Ceti's theorem of that name (`:382`). Its statement is the case `v_K(2) = 0` of `:390`, since `4·q⁰ = 4`.
  - `map_norm_unitFiltration_zero` (395) is `TauCeti.map_normUnits_unitFiltration K L 0` (`Norm/Unramified/Basic.lean`:126) under `e(L/K) = 1`.

10 + 2 + 2 = 14, so the partition is exact. The cited items *Finite extensions*, *Valuations and `e`, `f`*, *Units*, *Power classes* and *Unramified extensions* (LocalFieldsRamification README 156–197) contain all 14 names.

### The repaired ClassFieldTheory sentence (README 345–354)

Checked against ClassFieldTheory's `Suggested.lean` and README at `911db42`, which includes its revision `e919c36` made after this folder's repair.

**The re-exports.**
- `muNRep` is at 116.
- `kummerCupPairing` (171–174) is `zeroTopPairing` when `n = 0` and Tau Ceti's otherwise, as the parenthetical says.
- `finiteHilbertInvariantAt` is at 446 and `hilbertProductFormula` at 462.
- ClassFieldTheory's Layer 14 (1088–1097) says that roadmap re-exports the invariants and the formula. Its subsection *Names imported from `Suggested.lean`* (1241) names `finiteHilbertInvariantAt` at 1252.

**The Tau Ceti-only names.**
- `TauCeti.ClassFieldTheory.kummerClass` occurs only in the docstring at 133.
- The local symbol occurs only in the docstring at 197.
- `invMap` does not occur in that `Suggested.lean` at all.

**The invariant on `H²(G_K, μ_n)`.**
- `h2MuEquivZMod_mixed` (143–148) needs `[Module.Finite ℚ_[p] F]` and `hn : n ≠ 0`, as stated.
- `h2FpEquivZMod_of_mu` (153) has domain `H²(G_F, T)` for a given `μ_p ≅ T`. It is Tau Ceti's transport `h2EquivZModOfMuNRepIso` (`Brauer/RootsOfUnity.lean`:156), so "appears only as `h2MuEquivZMod_mixed`" is correct for the invariant on `H²(G_K, μ_n)` itself.
- `infiniteHilbertInvariantAt` (452) is also re-exported. This roadmap consumes only the finite invariant (README 360), so the list of consumed objects is complete.

**What the repair dropped and what it still cites.**
- Dropping "local Tate duality" leaves no dangling use: `duality` occurs nowhere in this README.
- Layer 5 is "local coefficients, the Brauer group, the local invariant, and duality" (428), and its §3 table row 5 (262) lists `invMap`, `h2MuEquivZMod`, `kummerClass`, `kummerCupPairing`, `localSymbol` and `TauCeti.index_normGroup_of_isCyclic`. The last one also covers this README's untouched 6C *Needs* at 1577.

### The repaired Milestone 2 parenthetical (README 1783–1788)

ClassFieldTheory §2.1 *Formations* (120–126) at this head says three things:
- formations, class formations and the arithmetic layers are at universe `0`;
- the generic Layer 0 statements hold in any universe shared by ring and group;
- the Layer 5 comparison of valuations holds in any universes.

Its `Suggested.lean` agrees: `projective_ker_of_isZero_res {k G : Type u}` (78) and `valuativeExtension_of_finite (K : Type*)` (218).

The Tau Ceti binders match the milestone's claims:
- `Brauer/Invariant.lean`:98 has `variable (K : Type)`, which covers `invMap` at 200.
- `LocalField/Quaternion/Invariant.lean`:60 has `variable (K : Type)`, which covers the three milestone declarations at 67, 79 and 92.
- `TauCeti.hilbertSymbol_eq_cohomological` (`FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean`:191) binds `{F : Type u}`, as the next sentence of the milestone says.

### Supplier declarations at the pin

Tau Ceti `2fd255d`, under `TauCeti/NumberTheory/` unless stated:

| Declaration | File:line |
|---|---|
| `muNRep` | `ClassFieldTheory/MuNRep.lean`:137 |
| `kummerClass` | `ClassFieldTheory/MuNRep.lean`:283 |
| `kummerCupPairing` | `ClassFieldTheory/Local/Symbol.lean`:207 |
| `localSymbol` | `ClassFieldTheory/Local/Symbol.lean`:320 |
| `invMap` | `ClassFieldTheory/Brauer/Invariant.lean`:200 |
| `brauerGroupEquivBr` | `ClassFieldTheory/Brauer/CentralSimple/Basic.lean`:55 |
| `h2MuEquivZMod` | `ClassFieldTheory/Brauer/RootsOfUnity.lean`:89 |
| `finiteHilbertInvariantAt` | `ClassFieldTheory/Global/Hilbert/Invariant.lean`:93 |
| `hilbertProductFormula` | `ClassFieldTheory/Global/Hilbert/Reciprocity.lean`:65 |
| `algebraicExtensionValuativeRel` | `LocalField/AlgebraicExtension/Basic.lean`:130 |
| `finiteExtension_isNonarchimedeanLocalField` | `LocalField/FiniteExtension/Basic.lean`:54 |
| `card_squareClasses_of_isUnit`, `card_squareClasses` | `LocalField/PowerSubgroup/Basic.lean`:382, :390 |
| `map_normUnits_unitFiltration` | `LocalField/Norm/Unramified/Basic.lean`:126 |

### Sibling revisions since `110ca68`

ClassFieldTheory changed 164 README and 14 Lean lines; IntegralLattices changed 140 README lines. I diffed both against every passage here that cites them:

- ClassFieldTheory's §6 entry for this roadmap (1220) still reads "Layers 5 and 14, through Tau Ceti's declarations".
- Its boundary paragraph (81–85) keeps the direction `ClassFieldTheory → QuadraticFormInvariants`.
- Its Lean-file change only touches a docstring and the `valuativeExtension_of_finite` route.
- IntegralLattices' new *Needs* line cites Tau Ceti's `localHasse` and `hilbertSymbol_productFormula`, not a section of this roadmap.

### Overlaps and citation leads

The overlap index shows no dropped ids and no ids defined only by an open revision. The lead `ProfiniteCohomology.f2Pairing` (README 379) is declared on main at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`:5332.

### Seeded sample

Of the 13 seeded targets, only "Milestone 2" falls in a changed hunk, and its universe parenthetical is checked above. Its mathematical content and locators are unchanged. The checks of all 13 in the previous reports carry over.

### Adversarial table

The rows for untouched statements are carried from `PRREVIEW-QuadraticFormInvariants~52`, which carried them from `~48`. The three new rows are computed at this head. `(x,y)` is the Hilbert symbol over `ℚ_2` unless stated, and `ν` is the nonzero element of `H²(G_ℚ₂, 𝔽₂)`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| NEW: LocalFieldsRamification sentence (338–344) | the 14 consumed declarations against that roadmap's names | 10 re-exported, 2 Tau Ceti-only, 2 through specializations, total 14. Dyadic count over `ℚ_2`: `4·2¹ = 8`. Non-dyadic over `ℚ_3`: `4·3⁰ = 4`. Norm map at `i = 0` with `e = 1` | holds |
| NEW: ClassFieldTheory sentence (345–354) | the seven listed objects against ClassFieldTheory `Suggested.lean` at `911db42` | 4 re-exported (116, 171, 446, 462). `kummerCupPairing` at `n = 0` is the zero pairing. 3 Tau Ceti-only (`kummerClass`, local symbol, `invMap`: docstrings or absent). `h2MuEquivZMod_mixed` at `n ≠ 0`; `h2FpEquivZMod_of_mu` lives on `H²(T)` | holds |
| NEW: Milestone 2 universe parenthetical (1783–1788) | milestone declarations; ClassFieldTheory's two exemptions | `K : Type` at Tau Ceti `Quaternion/Invariant.lean`:60 and `Brauer/Invariant.lean`:98. `{F : Type u}` at `MuTwo/LocalSymbol.lean`:191. Exempt: `{k G : Type u}` (78), `K : Type*` (218) | holds |
| H1 four-fold criterion (`Suggested` 57), carried | `(2,5)`, `(5,5)`; `a` a square | `x² − 2y²` with `x` a unit is `1, 7 mod 8`, never `5`: all five fail. `5 = 5² − 5·2²`: all hold. `b = ((b+1)/2)² − c²((b−1)/(2c))²` | holds |
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

### Headlines and padding

`Suggested.lean` is unchanged, so the previous verdict stands. The five headlines are stated as `example`s closed by their Tau Ceti theorems, and the docstring names no unstatable headline. The three one-term aliases stay because GlobalQuadraticForms' Lean file uses them, and the worker's targeted build of that module passed at this head.

## Not verifiable

- Lam, *Introduction to Quadratic Forms over Fields* (2005), and Gille–Szamuely, *Central Simple Algebras and Galois Cohomology* (2017): both paywalled, recorded as `uncertified` and cited by locator. The mathematics behind their locators is recomputed in the table.
- Delzant 1962: `uncertified`, no legal open copy reachable. `kahn1984` lines 726–729 restate the definition taken from it.
- Serre, *A Course in Arithmetic*; Serre, *Local Fields*; O'Meara; Scharlau; Milnor 1970: settled as `uncertified` and cited by locator.

None of these is touched by the changed passages, which cite only roadmaps and Tau Ceti.

## Source issues

- none
