# Review of QuadraticFormInvariants (pull request #617 at 21535d1)

**Verdict:** needs changes

This is an incremental re-review. Since `911db42` this folder has changed by 0 lines, and so have `lake-manifest.json` and `lean-toolchain`. The two new commits change only sibling folders:

- `adfe4b1`: ClassFieldTheory, README and `Suggested.lean`;
- `21535d1`: IntegralLattices, README.

I checked every passage of this README that cites either roadmap against its new head. None became wrong. The two P3 findings of the previous review are still open, and both concern the pull request as a whole. Nothing in this folder needs to change for either.

## R01 (P3) — The gate still fails on files outside the folders this review may count as the pull request's own

**Location.** The pull request as a whole, not this folder.

**Claim.** The gate fails, and the folder cannot be accepted while it does. This brief names `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/IntegralLattices/` as the pull request's own folders. Five changed files belong to neither:

- four that the gate lists;
- `Completed/LocalGaloisGroups/Suggested.lean`, a 12-line change that `git diff --stat origin/main...HEAD` shows and the gate's list omits.

**Witness.** My gate run at `21535d1` reports `outside-folder=8 … FAIL`, with every other count `0`. Four of the eight are files of the named sibling folders. The other four are `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/README.md`.

**Repair.** Have the description name `Completed/LocalFieldsRamification` (the pull request's subject) and `Completed/LocalGaloisGroups` (ClassFieldTheory's consumer repair) as its own folders.

Do not move these edits to another pull request. README 325–344 cites LocalFieldsRamification's *Exact supplier contracts* (its README 136 at this head) and its *Names imported by other roadmaps* (591). Both exist only in this pull request's revision. On main, that README has *Scope and exported contract* (30) and *The build, in layers* (70) instead.

This folder does not change.

## R02 (P3) — No merge order is stated against the four other open pull requests that change this folder

**Location.** The pull request description. Its only merge-order sentence is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Four other open pull requests change this folder's README and `Suggested.lean`, and their heads conflict with this one. Nothing states which merges first, so whichever merges second silently overwrites the other's version of the folder.

**Witness.** The overlap index of 2026-11-09T19:43 lists #1187, #1215, #1411 and #1797. Each conflicts with #617 in `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`.

**Repair.** Add one sentence to the description. For example: "#617 merges first; #1187, #1215, #1411 and #1797 rebase their `QuadraticFormInvariants` changes onto it." The reverse order also works if this pull request rebases instead. The README does not change.

## Previous findings

- R01 — not repaired: the gate at `21535d1` still reports `outside-folder=8 … FAIL`. Four of the eight files lie outside the named folders: `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/README.md`. The description is unchanged. Restated as R01.
- R02 — not repaired: the description's only merge-order sentence still names #1410 alone. #1187, #1215, #1411 and #1797 still conflict in this folder. Restated as R02.

## Verified sound

### Gate and dependency check

My run of `gate … --base origin/main` at `21535d1` reports every count `0` except `outside-folder=8` (R01). The worker's run at this head also has `build=0` for `QuadraticFormInvariants.Suggested` and `GlobalQuadraticForms.Suggested`.

The dependency check prints:

```text
depcheck: 236 roadmaps, 2274 edges, 0 problem(s)
```

It has no UPWARD, CYCLE or `moved:` line. Every supplier this folder cites is on main (`3090489`):

- `TauCetiRoadmap/ClassFieldTheory`;
- `TauCetiRoadmap/ProfiniteCohomology`;
- `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras`;
- `Completed/LocalFieldsRamification`.

### Elaboration and signatures

`lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output, so there is no `sorry` warning. The file has no `set_option` and no `lemma`.

I elaborated one scratch file with `#check @` for all 7 declarations. Each type matches the worker's signature list and the README:

- `discr` takes `[Invertible 2]`.
- `hilbertSymbol`, `localHasse` and `hilbertSymbol_neg_self` hold over every field.
- `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` carry `ValuativeRel`, `TopologicalSpace`, `IsNonarchimedeanLocalField` and `Invertible 2`.

No section binder is lost, and nothing changed since the previous probe.

### ClassFieldTheory's revision `adfe4b1`, against every passage here that cites it

**The six retired re-exports.** The revision removes six names from ClassFieldTheory's `Suggested.lean`: `TateCohomology.projective_ker_of_isZero_res`, `TateCohomology.primaryComponent_tateCohomology_eq_bot`, `tateDual`, `muNRepToTateDual`, `normResidue` and `artinMap_norm`. None of them occurs in this README or in `Suggested.lean`.

**The supplier sentence (README 345–366).** Each claim, checked against that roadmap's head:

- **The four re-exports still exist.** `muNRep` is at 77, `kummerCupPairing` at 132, `finiteHilbertInvariantAt` at 369 and `hilbertProductFormula` at 385. `kummerCupPairing` is still `zeroTopPairing` at `n = 0` and Tau Ceti's otherwise.
- **The Tau Ceti-only names.** `TauCeti.ClassFieldTheory.kummerClass` occurs only in the docstring at 94. `localSymbol` and `invMap` do not occur in that `Suggested.lean` at all; the docstring that used to name `localSymbol` was deleted together with `muNRepToTateDual`. So "Tau Ceti names only there" holds.
- **`h2MuEquivZMod_mixed` (104–109)** still requires `[Module.Finite ℚ_[p] F]` and `hn : n ≠ 0`, as the sentence says.
- **The cited subsection still exists.** *Names imported from `Suggested.lean`* is at README 1336. Its table lists `muNRep`, `kummerCupPairing` and `hilbertProductFormula`, and its paragraph names `finiteHilbertInvariantAt` among the three invariants in the type of `hilbertProductFormula`.
- **Layer 14 (1183–1192)** still says that roadmap re-exports the invariants and `hilbertProductFormula`.

**Layer 5 and the *Needs* lines that cite it.** ClassFieldTheory's §3 table row 5 (266) still lists `invMap`, `h2MuEquivZMod`, `kummerClass`, `kummerCupPairing`, `localSymbol`, `localSymbol_eq_zero_iff_mem_normGroup` and `TauCeti.index_normGroup_of_isCyclic`. That covers this README's citations of ClassFieldTheory Layer 5 or Layers 5 and 14 at:

- 98–104, 1577, 1692, 1803–1805, 1856, 2177, 2217 and 2246.

The layer numbering is unchanged: Layer 5 is at 432 and Layer 14 at 1183.

**Milestone 2's universe parenthetical (README 1783–1788).** ClassFieldTheory §2.1 (123–126) is untouched by the revision. It still exempts the generic Layer 0 statements and the Layer 5 comparison of valuations. Its `Suggested.lean` no longer re-states the Layer 0 theorems, so I checked the claim at the pinned Tau Ceti `2fd255d` instead:

- `NakayamaRim.lean`:75 has `variable {k G : Type u}`;
- `PrimaryComponent.lean`:62 has `variable {k G : Type u}`;
- `valuativeExtension_of_finite (K : Type*)` is still at ClassFieldTheory `Suggested.lean`:159.

The parenthetical stays correct.

**The two direction statements.** The boundary paragraph (81–85) still reads `ClassFieldTheory → QuadraticFormInvariants`. The §6 entry for this roadmap (1315) still reads "Layers 5 and 14, through Tau Ceti's declarations".

### IntegralLattices' revision `21535d1`

The revision adds a scope paragraph (55–63), rewrites the native-milestone paragraph (517–526) and edits the OrthogonalTamagawaAndLatticeMass consumer bullet. It does not change how that roadmap consumes this one:

- the §*From Tau Ceti* rows 514–515 still name `TauCeti.hilbertSymbol_productFormula` and `localHasse`, for 3G, 5B and 6A;
- the scope sentence at 66–68 still names this roadmap's local classification and Hilbert symbol.

So this README's item 14 (1676–1682), its consumer bullet (2758–2760) and `Suggested.lean`:40 remain true.

### LocalFieldsRamification

It is unchanged since `911db42`. The two sections cited at README 325–344 exist at this head (136 and 591), so the previous review's partition of the 14 consumed Tau Ceti names (10 + 2 + 2) still holds.

### Overlaps and citation leads

The overlap index (2026-11-09T19:43) shows no dropped ids, no ids defined only by an open revision, and no ids this pull request drops. The lead `ProfiniteCohomology.f2Pairing` (README 379) is declared on main (`3090489`) at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`:5332.

### Seeded sample

None of the 13 seeded targets falls in a changed passage, because the folder did not change. Two of them cite ClassFieldTheory:

- "Milestone 2" (§2.1 and Layer 5);
- "Compatibility with the cup product" (Layer 5, through Milestone 2).

I re-checked both against ClassFieldTheory's new head (above). Their locators into sources are unchanged, and the source checks of the earlier reports carry over.

### Adversarial table

The rows for untouched statements are carried from `PRREVIEW-QuadraticFormInvariants~54`, which carried them from `~52` and `~48`. No statement of this folder changed, so there is no row for a changed statement. The first three rows recompute the cross-roadmap sentences against the changed suppliers at this head. In the carried rows, `(x,y)` is the Hilbert symbol over `ℚ_2` unless stated, and `ν` is the nonzero element of `H²(G_ℚ₂, 𝔽₂)`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| RE-CHECK: ClassFieldTheory supplier sentence (345–366) against `adfe4b1` | the four re-exports; three Tau Ceti-only names; the six retired names | Re-exports at 77, 132, 369, 385 (4 of 4 present). `kummerCupPairing` at `n = 0`: the zero pairing. `kummerClass` only in the 94 docstring; `localSymbol` and `invMap` absent. Retired names cited here: 0 of 6 | holds |
| RE-CHECK: Milestone 2 universe parenthetical (1783–1788) | ClassFieldTheory §2.1 at head; the Layer 0 binders at the pin | §2.1 text unchanged (123–126). `{k G : Type u}` at `NakayamaRim.lean`:75 and `PrimaryComponent.lean`:62. `K : Type*` at `Suggested.lean`:159 | holds |
| RE-CHECK: Layer 5 and Layer 14 *Needs* lines (1577, 1692, 1803, 1856, 2177, 2217, 2246) | ClassFieldTheory §3 row 5 (266); Layer 14 (1183) | 7 of 7 cited names in row 5. Layer numbers 5 and 14 unchanged | holds |
| LocalFieldsRamification sentence (338–344), carried from ~54 | the 14 consumed declarations | 10 re-exported, 2 Tau Ceti-only, 2 through specializations. `ℚ_2`: `4·2¹ = 8`. `ℚ_3`: `4·3⁰ = 4` | holds |
| H1 four-fold criterion (`Suggested` 57), carried | `(2,5)`, `(5,5)`; `a` a square | `x² − 2y²` with `x` a unit is `1, 7 mod 8`, never `5`: all five conditions fail. `5 = 5² − 5·2²`: all hold. `b = ((b+1)/2)² − c²((b−1)/(2c))²` | holds |
| H2 local classification (`Suggested` 129), carried | `⟨1,1⟩` vs `⟨5,5⟩`; `⟨1,1⟩` vs `⟨−1,−1⟩`; `ℝ` control | `d = [1],[1]`, `s = +1 = (5,5)`, isometric via `5 = 1² + 2²`. `s = +1` vs `(−1,−1) = −1`. Over `ℝ`, `⟨1⁴⟩` and `⟨−1⁴⟩` share `(4,[1],+1)`; the local-field instance excludes `ℝ` | holds |
| H3 cup-norm (`Suggested` 176), carried | `(2,5)`, `(5,5)`; `(−1,−1)` over `ℝ` | `(2)∪(5) ≠ 0` iff `5 ≠ x² − 2y²`. `(5)∪(5) = 0`. `(−1)∪(−1) ≠ 0` iff `−1 ≠ x² + y²` | holds |
| H4 Evens value (`Suggested` 187), carried | `d = −1`, `a = 1 + 2i`; `a = 1`; `a = c ∈ K` | `Tr = 2`, `N = 5`: `ν + 0`. `a = 1`: `(2)∪(−1) = 0`. `a = c`: `(c)∪(c) + (c)∪(d) = N(res c)` | holds |
| H5 relative formula (`Suggested` 206), carried | `Tr a = 0`; degree 1 | `w₂⟨1,−1⟩ = 0 = (2)∪(d) + (2)∪(d) + (d)∪(N a)`; `(d·N a) = (d) + (N a)` | holds |
| `ℚ_2(√5)` table, square classes, carried | `𝒪[L]ˣ/(𝒪[L]ˣ)²` | order `8`. Norms `1, −1, −5, 5`: four distinct unit classes of `ℚ_2`. `−1 ∉ L²` | holds |
| `ℚ_2(√5)` table, `Tr`, `N`, `w₁`, carried | eight rows | `Tr ω = 1`, `Tr √5ω = 5`, `N(√5ω) = 5`. `w₁` column: `(5),(5),(−5),(−5),(−1),(−1),0,0` | holds |
| `ℚ_2(√5)` table, `N^Ev`, carried | eight rows | `(2,−5) = −1`, `(−2,−5) = +1`, `(−5,−1) = −1`. Column: `0, ν, ν, ν, ν, ν, ν, 0` | holds |
| `ℚ_2(√5)` table, `w₂` both sides, carried | eight rows | RHS `ν, 0, 0, 0, 0, 0, 0, ν`. LHS `⟨2,10⟩ = ν`, `⟨−2,−10⟩ = 0`, …, `⟨−5,−5⟩ = ν`. The two sides agree | holds |
| `ℚ_2(√5)` separation claim, carried | each row | dropping either term shifts the RHS by `ν ≠ 0` | holds |
| Layer 8 table, carried | `a ∈ {±1, ±5, ±2, ±10}` | `(a,−1) = −1` for `−1, −5, −2, −10`; `+1` for `1, 5, 2, 10`. `w₂⟨2,5⟩ = ν`. `w₂⟨1,−1⟩ = 0` vs `∏_{i≤j} = ν` | holds |
| `discr` (`Suggested` 78), carried | rank 0; `⟨1,−1⟩`; `⟨1,1⟩`; `⟨1⟩` and `⟨4⟩` over `ℚ` | `[1]`; `[−1]`; `[1]`; both `[1]` | holds |
| `localHasse` (`Suggested` 100), carried | `![−1]`, `![−1,2]`, `![−1,−1]` over `ℚ_2`, `ℝ`, `ℚ_3` | `+1`; `(−1,2) = +1`; `−1`; `−1`; `+1` | holds |
| `hasseInvariant_eq_localHasse` (`Suggested` 146), carried | `n = 0, 1`; `![−1,−1]` | `ε(1) = 1`; `ε[D] = −1 = (−1,−1)` | holds |
| S1 central simple, carried | `ℍ[K,a,0,b]`; `a = 0` | `c·(0² + 4a) = 4ab ≠ 0`; `a = 0` is excluded by `a : Kˣ` | holds |
| S2 symbol in `Br(K)`, carried | `⟨2,−1⟩ ≅ ⟨1,−2⟩`; `(−1,3)`, `(−1,7)`, `(−1,21)` over `ℚ` | `β([2],[−1]) = 1`; `−1, −1, −1`, so the symbol is not bilinear field by field | holds |
| S3 Hasse invariant, carried | `⟨a⟩ ⊥ ⟨b⟩`; scaling | `[(a,b)]`; `(λ,−1)^{C(n,2)}(λ,d)^{n−1}s` | holds |
| S4 dimension ≤ 3, carried | `ℝ`: `⟨1,1⟩` vs `⟨−1,−1⟩`; dimension 4 | `s = 1` vs `[ℍ]`; `⟨1⁴⟩` and `⟨−1⁴⟩` share `d` and `s` | holds |
| S5 Clifford invariant, carried | `⟨1ⁿ⟩` over `ℝ`, `n = 1..8` | `C(n+1,4) = 0,0,1,5,15,35,70,126` gives `1,1,ℍ,ℍ,ℍ,ℍ,1,1` | holds |
| S6 `I²` homomorphism, carried | `ℝ`: `⟨1⁴⟩ ⊥ ⟨1³⟩`; `⟨1,1⟩ ⊥ ⟨1⟩` | `1 = [ℍ][ℍ]`; `[ℍ]` vs `1·1` | holds |
| S7 base change, carried | hyperbolic plane; rank 0, 1 | `[(1,−1)] = 1`; empty products | holds |
| S8 the symbol, carried | `(1,b)`; `𝔽₂(t)`; `(−1,3)` over `ℚ_2`, `ℚ_5`, `ℚ` | `+1`; `(t,1) = +1`, `(1,t) = −1`; `−1, +1, −1` | holds |
| S9 classical construction, carried | split `a`; index theorem | `K × K` has surjective norm; `index = finrank = 2` | holds |
| S10, S11 Milestones 1, 2, carried | `ℚ_2` | `ε[D] = −1 = localHasse ![−1,−1]`; `inv = 1/2 ⟺ (2,5) = −1`, which is true | holds |
| S12 cup compatibility, carried | `(2)∪(5)`, `(5)∪(5)` | `≠ 0 ⟺ −1`; `= 0 ⟺ 5 = 5² − 5·2²` | holds |
| 6A counts, carried | `ℚ_2`; `ℚ_2(√5)`; `ℚ_2(√2)` | `8`; `16`; `16` | holds |
| 6B defects, carried | `1, 5, −1, −5, 5/4` | `δ = ∞, 2, 1, 1, 0`; `𝔡(−5) = 2ℤ_2` | holds |
| 6B ramified control, carried | `ℚ_2(π)`, `π² = 2`, `a = 5` | `(π + ½)² − 5/4 = 1 + π` | holds |
| 6C table, carried | basis `{−1, 2, 5}` | Gram determinant `1` over `𝔽₂` | holds |
| 6D realization, carried | `(2,[1],−1)`; `(2,[−1],−1)` | `⟨−1,−1⟩`; `(a,−a) = +1` forces the exception | holds |
| Layer 9 Evens corollaries, carried | `1 + 2i`, `d = −1`; `√d` | `(2)∪(5)`; `(2)∪(d)` | holds |
| Layer 9 `SD₁₆` control, carried | `d = −1`, `t = 2` | `ν + ν = 0 ≠ ν` | holds |

### Headlines and padding

`Suggested.lean` is unchanged, so the previous verdict stands:

- The five headlines are stated as `example`s closed by their Tau Ceti theorems.
- The docstring names no unstatable headline.
- The three one-term aliases stay because GlobalQuadraticForms' Lean file uses them. The worker's targeted build of that module passed at this head.

### Remark on untouched text

This needs no change and is not a finding. README 1803–1805 credits `TauCeti.ClassFieldTheory.brauerGroupEquivBr` to "ClassFieldTheory Layer 5", but that roadmap's README has never named it (0 mentions on main, at `911db42` and at this head). It is a Tau Ceti declaration (`ClassFieldTheory/Brauer/CentralSimple/Basic.lean`:55 at the pin), and the supplier sentence at 359–362 already names it as one.

## Not verifiable

- Lam, *Introduction to Quadratic Forms over Fields* (2005), and Gille–Szamuely, *Central Simple Algebras and Galois Cohomology* (2017): paywalled. Both are recorded as `uncertified` and cited by locator; the table recomputes the mathematics behind their locators.
- Delzant 1962: recorded as `uncertified`, with no legal open copy reachable. `kahn1984` lines 726–729 restate the definition taken from it.
- Serre, *A Course in Arithmetic*; Serre, *Local Fields*; O'Meara; Scharlau; Milnor 1970: settled as `uncertified` and cited by locator.

No passage was changed, so none of these was needed in this round.

## Source issues

- none
