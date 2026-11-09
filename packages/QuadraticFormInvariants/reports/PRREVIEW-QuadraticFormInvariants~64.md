# Review of QuadraticFormInvariants (pull request #617 at b560d38)

**Verdict:** needs changes

This is an incremental re-review of the 21 lines this folder changed since `21535d1` (commit `435dc8a`). Two passages of `TauCetiRoadmap/QuadraticFormInvariants/README.md` changed:

- the ClassFieldTheory bullet of *Exact supplier contracts* (355–370);
- the *Needs:* line of 6E's Milestone 2 (1807–1812).

`Suggested.lean` is unchanged. The new bridge sentence is correct at the pin. The rewritten *Needs:* line still leaves out two inputs (R03). The two pull-request-level findings of the previous review are still open (R01, R02). R02 now has a sharper witness: three other open heads still carry the line this round rewrote.

## R01 (P3) — The gate still fails on files outside the folders named as the pull request's own

**Location.** The pull request as a whole, not this folder.

**Claim.** The gate fails, so the folder cannot be accepted. The brief names `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/IntegralLattices/` as the pull request's own folders. Five changed files belong to neither:

- `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md` and `Suggested.lean`;
- `Completed/LocalGaloisGroups/README.md`;
- `Completed/LocalGaloisGroups/Suggested.lean`, a 12-line change that `git diff --stat origin/main...HEAD` lists and the gate's list omits.

**Witness.** The worker's gate at `b560d38` ends `outside-folder=4 … FAIL`. My run of `gate … --base origin/main` ends `outside-folder=8 … FAIL`: the same four files plus four files of the two named sibling folders. Every other count is `0`.

**Repair.** In the description, name `Completed/LocalFieldsRamification` (the pull request's subject) and `Completed/LocalGaloisGroups` (ClassFieldTheory's consumer repair) as the pull request's own folders.

Do not move those edits to another pull request. README 325–344 cites LocalFieldsRamification's *Exact supplier contracts* and *Names imported by other roadmaps*, and both exist only in this pull request's revision. This folder does not change.

## R02 (P3) — No merge order is stated against the four other open pull requests that change this folder

**Location.** The pull request description. Its only merge-order sentence is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** #1187, #1215, #1411 and #1797 change this folder. Their heads conflict with this one in `README.md` and `Suggested.lean` (#1187 in `Suggested.lean` only). Nothing says which pull request merges first.

This round makes the gap concrete. The Milestone 2 *Needs:* line rewritten here still has its old wording at three of those heads. Whichever of them merges after this pull request will put back the credit to ClassFieldTheory Layer 5 that this round removed, unless it rebases.

**Witness.** The old phrase "`TauCeti.ClassFieldTheory.brauerGroupEquivBr` with Brauer classes, and the local symbol" is still at:

- #1215, README 1761;
- #1411, README 1805;
- #1797, README 1700.

The overlap index of 2026-11-09T21:49 lists all four conflicts.

**Repair.** Add one sentence to the description, for example: "#617 merges first; #1187, #1215, #1411 and #1797 rebase their `QuadraticFormInvariants` changes onto it and take its Milestone 2 *Needs:* line." The README does not change.

## R03 (P3) — The rewritten Milestone 2 *Needs:* line still omits item 6 and the `μ₂`-invariant input

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/README.md` 1807–1809: "Layer 7B's comparisons `Additive (BrauerGroup K) ≃+ H²_cont(G_K, Kˢˣ)` (item 3) and `Br(K)[2] ≅ H²(G_K, μ₂)` (item 4); TauCetiRoadmap.ClassFieldTheory Layer 5 for the local invariant … and for the local symbol".

**Claim.** The omission predates this round. The line has now been rewritten to number the Layer 7B items it uses, so it reads as a complete list, and two inputs that it covers are missing:

- **Item 6.** The cup-compatibility paragraph (1798–1802), which this line covers, uses Layer 7B's `ι [(a,b)] = (a) ∪ (b)`. That is item 6 (`TauCeti.brauer2EquivH2_quaternionClass`), not item 3 or item 4.
- **The `μ₂` invariant.** Milestone 2's third clause, that `h2MuEquivZMod` sends the class to `1`, uses ClassFieldTheory Layer 5's `h2MuEquivZMod`, reached through Tau Ceti's `TauCeti.ClassFieldTheory.h2MuToBr`, and not through item 4's `ι`. Item 4 lands in a different carrier.

**Witness.** Two pinned signatures:

- `TauCeti.brauer2EquivH2` (`TauCeti/Algebra/CrossedProduct/TwoTorsion.lean`:152) lands in `continuousCohomology 2 (trivialF2 (AbsoluteGaloisGroup K))`.
- `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one` (`TauCeti/NumberTheory/LocalField/Quaternion/Invariant.lean`:92) takes `y : continuousCohomology 2 (muNRep 2 K)` with the hypothesis `h2MuToBr 2 K y = brauerGroupEquivBr K […]`.

**Repair.** Replace 1807–1812 with:

> *Needs:* Milestone 1; Layer 7B's comparison `Additive (BrauerGroup K) ≃+ H²_cont(G_K, Kˢˣ)` (item 3), and, for the compatibility with the cup product, its `ι : Br(K)[2] ≃ H²(G_K, μ₂)` (item 4) and `ι [(a,b)] = (a) ∪ (b)` (item 6); TauCetiRoadmap.ClassFieldTheory Layer 5 for the local invariant `TauCeti.ClassFieldTheory.invMap` on its carrier `TauCeti.ClassFieldTheory.Br K = H²(G_K, (Kˢ)ˣ)`, for the normalized invariant `TauCeti.ClassFieldTheory.h2MuEquivZMod` on `H²(G_K, μ₂)` with coefficients `TauCeti.ClassFieldTheory.muNRep 2 K`, read in that carrier through Tau Ceti's `TauCeti.ClassFieldTheory.h2MuToBr` and not through `ι`, and for the local symbol; and Tau Ceti's bridge `TauCeti.ClassFieldTheory.brauerGroupEquivBr` from Brauer classes to that carrier, which is item 3's `TauCeti.brauerExplicitH2Equiv` followed by the change of model `TauCeti.ClassFieldTheory.unitsRepH2Equiv` and is not a target of ClassFieldTheory.

This also writes the cohomological carrier as `TauCeti.ClassFieldTheory.Br K`. The current line has `Br(K)[2]` (Mathlib's `BrauerGroup K`) and `Br F` (the cohomological group) in one sentence, and a reader can take them for the same group.

**Test of the repair.** I checked the repaired line against the four Tau Ceti theorems that Milestone 2 and the cup paragraph cite. Every input of each is listed:

| Theorem | Inputs |
|---|---|
| `quaternionSubgroup_eq_twoTorsion` (through `natCard_twoTorsion`) | `invMap`, the bridge |
| `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` | `invMap`, the bridge |
| `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one` | `h2MuEquivZMod`, `h2MuToBr`, the bridge |
| `brauer2EquivH2_quaternionClass` | items 4 and 6 |

All seven names elaborate at the pin (probe below).

## Previous findings

- R01 — not repaired: the worker's gate at `b560d38` still reports `outside-folder=4 … FAIL` for `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/README.md`. The description is unchanged. Restated as R01.
- R02 — not repaired: the description's only merge-order sentence still names #1410 alone, and #1187, #1215, #1411 and #1797 still conflict in this folder. Restated as R02.

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** My run of `gate … --base origin/main` at `b560d38` has every count `0` except `outside-folder=8` (R01). The worker's run has `build=0` for `QuadraticFormInvariants.Suggested` and `GlobalQuadraticForms.Suggested`.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2277 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output. `Suggested.lean` is byte-identical to `21535d1`.
- **Signature probe.** A scratch copy has `#check @` for all 7 declarations and for 14 Tau Ceti names in the changed passages. It also has the `example` `brauerGroupEquivBr = fun F => (brauerExplicitH2Equiv F).trans (unitsRepH2Equiv F) := rfl`. It elaborates with no error. The 7 types match `signatures.md` and the README; no section binder is lost.

### The new bridge sentence (README 359–370)

Each claim, checked at the pinned Tau Ceti `2fd255d`:

- **The type.** `TauCeti.ClassFieldTheory.brauerGroupEquivBr` is at `NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Basic.lean`:55. It elaborates to `(F : Type u_1) → [Field F] → Additive (BrauerGroup F) ≃+ Br F`, as stated.
- **The composite.** Its body is `(brauerExplicitH2Equiv F).trans (unitsRepH2Equiv F)`, and `brauerGroupEquivBr_apply` (:60) is `rfl`.
- **The types compose.** `brauerExplicitH2Equiv` (`Algebra/CrossedProduct/Comparison.lean`:193) goes from `Additive (BrauerGroup K)` to `H2 (AbsoluteGaloisGroup K) (UnitsCoeff K)`. `unitsRepH2Equiv` (`Brauer/Basic.lean`:158) goes from that group to `Br F`.
- **"Change of model" is accurate.** `unitsRepH2Equiv` pulls back along `absoluteGaloisGroupRestrictEquiv` and the coefficient dictionary, then applies the degree-two explicit/canonical comparison.
- **The carrier.** `Br F := continuousCohomology 2 (unitsRep F)` (`Brauer/Basic.lean`:151) is `H²(G_F, (Fˢ)ˣ)`.
- **"Layer 7B item 3's `brauerExplicitH2Equiv`".** Item 3 (README 2100–2102) names `TauCeti.brauerExplicitH2Equiv` as the explicit-cocycle form of `TauCeti.brauerCohomologyEquiv` (`Comparison.lean`:274).
- **"The carrier of that roadmap's Layer 5".** ClassFieldTheory README 462 at this head states `Br F = H²(G_F, (Fˢ)ˣ)` and `invMap : Br F ≃ ℚ/ℤ`. Its §3 row 5 (266) lists `unitsRep`, `Br` and `invMap`.
- **"No part of that roadmap's layers".** `brauerGroupEquivBr`, `unitsRepH2Equiv` and `brauerExplicitH2Equiv` occur 0 times in ClassFieldTheory's README and `Suggested.lean`, both on main (`3090489`) and at this head.
- **The shortened file list (361–362).** All 8 consumed declarations lie in the 5 locations named:
  - `muNRep` and `kummerClass` in `MuNRep.lean` (:137, :283);
  - `kummerCupPairing` and `localSymbol` in `Local/Symbol.lean` (:207, :320);
  - `invMap` in `Brauer/Invariant.lean` (:200);
  - `h2MuEquivZMod` in `Brauer/RootsOfUnity.lean` (:89);
  - `finiteHilbertInvariantAt` in `Global/Hilbert/Invariant.lean` (:93);
  - `hilbertProductFormula` in `Global/Hilbert/Reciprocity.lean` (:65).

  `Brauer/CentralSimple/Basic.lean` held none of the eight, so moving it to the bridge sentence is right.
- **Ownership.** `roadmaps grep 'brauerGroupEquivBr|unitsRepH2Equiv|h2MuToBr'` over main and the 458 open heads finds only citations of these names as Tau Ceti declarations: here, #1215, #1411, #1797, K2SymbolsBrauer, K2SymbolsBrauerPartII and QuaternionArithmetic. No roadmap states any of them as a target.

### The rewritten Milestone 2 *Needs:* line, apart from R03

- **The two labelled items.** Item 3's heading at 2100 is verbatim `Additive (BrauerGroup K) ≃+ H²_cont(G_K, Kˢˣ)`. Item 4's at 2115 is `ι : Br(K)[2] ≃ H²(G_K, μ₂)`.
- **The bridge clause.** It repeats the supplier sentence, which is verified above.
- **The build order.** Layer 7B's items 3–6 precede 6E's second milestone, as 1804–1805, the build paragraph (408–410) and 6E's *Dependencies* (1861) say. The rewrite adds no new edge. ClassFieldTheory Layer 5 is on main and earlier.

### Sibling revisions since `21535d1`

**ClassFieldTheory `a208c66`.** It rewrites Layer 0's Nakayama–Rim paragraph and its examples (312–352) and step 5 of the conductor–discriminant formula in Layer 13 (1047–1171). It does not touch §2.1, Layer 5, Layer 14, §3 or §6, and `Suggested.lean` is unchanged.

- This README cites only §2.1, Layer 5 and Layer 14 (98–104, 345–370, 1581, 1696, 1789, 1808, 1863, 2224, 2253).
- The layers are renumbered nowhere: Layer 5 is now at 451 and Layer 14 at 1234.
- §2.1 (123–126) still exempts Layer 0's generic statements and Layer 5's comparison of valuations.
- At the pin, `NakayamaRim.lean`:75 and `PrimaryComponent.lean`:62 still read `variable {k G : Type u}`, and ClassFieldTheory `Suggested.lean`:159 still has `valuativeExtension_of_finite (K : Type*)`.
- So Milestone 2's universe parenthetical (1787–1796) still holds.

**IntegralLattices `b560d38`.** It edits its native-milestone lists (56–64, 518–533), the Layer B banner, the 4A heading and row, the OrthogonalTamagawaAndLatticeMass consumer bullet, and its `Suggested.lean` docstring. Its use of this roadmap is unchanged:

- scope 68;
- the §*From Tau Ceti* rows 515–516 (`hilbertSymbol_productFormula`, `localHasse`, `hilbertSymbol_eq_cohomological`);
- 3G, 5B and 6A.

So README 1684, the consumer bullet at 2765 and `Suggested.lean`:40 stay true.

### Overlaps and citation leads

- **Overlap index (21:49).** No ids dropped, none defined only by an open revision, none this pull request drops.
- **Citation lead.** `ProfiniteCohomology.f2Pairing` (README 383) is declared on main at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`:5332, as the previous report found. The line is unchanged.

### Seeded sample

Two seeded targets are covered by the changed *Needs:* line: "Milestone 2" and "Compatibility with the cup product". Both statements are unchanged and carry no source locator: they cite Tau Ceti theorems, which I opened at the pin (`LocalField/Quaternion/Invariant.lean`:67, :79, :92; `CrossedProduct/CupProduct.lean`:362). Their values are recomputed in the table below.

The other 11 targets are at unchanged text. Their source checks carry over from `PRREVIEW-QuadraticFormInvariants~58` and the reports it cites.

### Adversarial table

Rows A1–A9 are computed this round for the changed passages and for the sibling revisions. The remaining rows cover untouched statements and are carried from `PRREVIEW-QuadraticFormInvariants~58`, which carried them from `~54`. In the carried rows, `(x,y)` is the Hilbert symbol over `ℚ_2` unless stated, and `ν` is the nonzero element of `H²(G_ℚ₂, 𝔽₂)`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| A1 bridge type and composite (363–367) | `#check @`; `rfl` at `F : Type` | `Additive (BrauerGroup F) ≃+ Br F`; body `(brauerExplicitH2Equiv F).trans (unitsRepH2Equiv F)`; codomain of the first factor = domain of the second = `H2 (AbsoluteGaloisGroup F) (UnitsCoeff F)` | holds |
| A2 "carrier of ClassFieldTheory Layer 5", "no part of its layers" | ClassFieldTheory README and `Suggested.lean` at head and on main | `Br F = H²(G_F, (Fˢ)ˣ)` at 462; mentions of the three bridge names: 0, 0, 0 at head, 0 on main | holds |
| A3 file list (361–362) | the 8 consumed declarations | 8 of 8 in the 5 named locations; 0 of 8 in `Brauer/CentralSimple/Basic.lean` | holds |
| A4 Milestone 2 *Needs:* item labels | item headings 2100, 2115 | item 3 = `Additive (BrauerGroup K) ≃+ H²_cont(G_K, Kˢˣ)`, naming `brauerExplicitH2Equiv`; item 4 = `ι : Br(K)[2] ≃ H²(G_K, μ₂)` | holds |
| A5 Milestone 2 *Needs:* completeness | inputs of the 4 cited Tau Ceti theorems | `quaternionSubgroup_eq_twoTorsion`: invMap and bridge, listed. `…quaternionClass_eq_half_iff`: listed. `h2MuEquivZMod_eq_one_iff…`: `h2MuEquivZMod`, `h2MuToBr` not listed; carrier `muNRep 2 K` ≠ `ι`'s `trivialF2 (AbsoluteGaloisGroup K)`. `brauer2EquivH2_quaternionClass`: item 6 not listed | fails → R03 |
| A6 Milestone 2 values over `ℚ_2` | `[(−1,−1)]`, `[(2,5)]`, `[(5,5)]`, `[(1,b)]` | `(−1,−1) = −1` ⇒ inv `1/2`, `h2MuEquivZMod` `1`; `(2,5) = −1` ⇒ `1/2`; `5 = 5² − 5·2²` ⇒ `(5,5) = +1` ⇒ `0`; `1` a square ⇒ split ⇒ `0 ↔ (1,b) = +1` | holds |
| A7 cup compatibility (1798–1802) | `(2)∪(5)`, `(5)∪(5)`, `Q(K) = Br(K)[2]` | `ε ι⁻¹((2)∪(5)) = ε[D] = −1 = (2,5)`; `(5)∪(5) = 0 ↦ ε(1) = +1 = (5,5)`; `#Q(K) = 2 = #Br(K)[2]` | holds |
| A8 Milestone 2 universe parenthetical against ClassFieldTheory `a208c66` | §2.1 at head; binders at the pin | §2.1 not in the diff (hunks at 312, 339, 1047, 1077, 1131, 1163); `{k G : Type u}` at `NakayamaRim.lean`:75 and `PrimaryComponent.lean`:62; `K : Type*` at `Suggested.lean`:159 | holds |
| A9 IntegralLattices `b560d38` consumption | rows 515–516; 3G, 5B, 6A rows 1174, 2455, 2678 | `hilbertSymbol_productFormula` named at 515, 1174, 2455 and 2678; `localHasse` at 516 and 2455; scope 68 unchanged | holds |
| ClassFieldTheory supplier sentence, untouched part (345–358), carried | four re-exports; Tau Ceti-only names | re-exports 4 of 4; `kummerCupPairing` at `n = 0` the zero pairing; `localSymbol`, `invMap` absent from that `Suggested.lean` | holds |
| LocalFieldsRamification sentence (325–344), carried | the 14 consumed declarations | 10 re-exported, 2 Tau Ceti-only, 2 through specializations; `ℚ_2`: `4·2¹ = 8`; `ℚ_3`: `4·3⁰ = 4` | holds |
| H1 four-fold criterion (`Suggested` 57), carried | `(2,5)`, `(5,5)`; `a` a square | `x² − 2y²` with `x` a unit is `1, 7 mod 8`, never `5`; `5 = 5² − 5·2²`; `b = ((b+1)/2)² − c²((b−1)/(2c))²` | holds |
| H2 local classification (`Suggested` 129), carried | `⟨1,1⟩` vs `⟨5,5⟩`; `⟨1,1⟩` vs `⟨−1,−1⟩`; `ℝ` | `d = [1],[1]`, `s = +1 = (5,5)`, isometric via `5 = 1² + 2²`; `+1` vs `−1`; over `ℝ`, `⟨1⁴⟩`, `⟨−1⁴⟩` share `(4,[1],+1)`, excluded by the local-field instance | holds |
| H3 cup-norm (`Suggested` 176), carried | `(2,5)`, `(5,5)`; `(−1,−1)` over `ℝ` | `(2)∪(5) ≠ 0` iff `5 ≠ x² − 2y²`; `(5)∪(5) = 0`; `(−1)∪(−1) ≠ 0` iff `−1 ≠ x² + y²` | holds |
| H4 Evens value (`Suggested` 187), carried | `d = −1`, `a = 1 + 2i`; `a = 1`; `a = c ∈ K` | `Tr = 2`, `N = 5`: `ν + 0`; `a = 1`: `(2)∪(−1) = 0`; `a = c`: `(c)∪(c) + (c)∪(d) = N(res c)` | holds |
| H5 relative formula (`Suggested` 206), carried | `Tr a = 0`; degree 1 | `w₂⟨1,−1⟩ = 0 = (2)∪(d) + (2)∪(d) + (d)∪(N a)` | holds |
| `ℚ_2(√5)` table, carried | square classes; `Tr`, `N`, `w₁`, `N^Ev`, `w₂` | order `8`; norms `1, −1, −5, 5`; `N^Ev` column `0, ν, ν, ν, ν, ν, ν, 0`; `w₂` both sides `ν, 0, 0, 0, 0, 0, 0, ν` | holds |
| Layer 8 table, carried | `a ∈ {±1, ±5, ±2, ±10}` | `(a,−1) = −1` for `−1, −5, −2, −10`; `w₂⟨2,5⟩ = ν`; `w₂⟨1,−1⟩ = 0` vs `∏_{i≤j} = ν` | holds |
| `discr` (`Suggested` 78), carried | rank 0; `⟨1,−1⟩`; `⟨1⟩`, `⟨4⟩` over `ℚ` | `[1]`; `[−1]`; both `[1]` | holds |
| `localHasse` (`Suggested` 100), carried | `![−1]`, `![−1,2]`, `![−1,−1]` | `+1`; `(−1,2) = +1`; `−1` over `ℚ_2`, `ℝ`; `+1` over `ℚ_3` | holds |
| `hasseInvariant_eq_localHasse` (`Suggested` 146), carried | `n = 0, 1`; `![−1,−1]` | `ε(1) = 1`; `ε[D] = −1 = (−1,−1)` | holds |
| S1 central simple, carried | `ℍ[K,a,0,b]`; `a = 0` | `4ab ≠ 0`; `a = 0` excluded by `a : Kˣ` | holds |
| S2 symbol in `Br(K)`, carried | `⟨2,−1⟩ ≅ ⟨1,−2⟩`; `(−1,3)`, `(−1,7)`, `(−1,21)` over `ℚ` | `β = 1`; `−1, −1, −1`: not bilinear field by field | holds |
| S3 Hasse invariant, carried | `⟨a⟩ ⊥ ⟨b⟩`; scaling | `[(a,b)]`; `(λ,−1)^{C(n,2)}(λ,d)^{n−1}s` | holds |
| S4 dimension ≤ 3, carried | `ℝ`: `⟨1,1⟩` vs `⟨−1,−1⟩`; dimension 4 | `1` vs `[ℍ]`; `⟨1⁴⟩`, `⟨−1⁴⟩` share `d`, `s` | holds |
| S5 Clifford invariant, carried | `⟨1ⁿ⟩` over `ℝ`, `n = 1..8` | `C(n+1,4) = 0,0,1,5,15,35,70,126` gives `1,1,ℍ,ℍ,ℍ,ℍ,1,1` | holds |
| S6 `I²` homomorphism, carried | `⟨1⁴⟩ ⊥ ⟨1³⟩`; `⟨1,1⟩ ⊥ ⟨1⟩` | `1 = [ℍ][ℍ]`; `[ℍ]` vs `1·1` | holds |
| S7 base change, carried | hyperbolic plane; rank 0, 1 | `[(1,−1)] = 1`; empty products | holds |
| S8 the symbol, carried | `(1,b)`; `𝔽₂(t)`; `(−1,3)` over `ℚ_2`, `ℚ_5`, `ℚ` | `+1`; `(t,1) = +1`, `(1,t) = −1`; `−1, +1, −1` | holds |
| S9 classical construction, carried | split `a`; index theorem | `K × K` norm surjective; index `2` | holds |
| S10 Milestone 1, carried | `ℚ_2` | `ε[D] = −1 = localHasse ![−1,−1]` | holds |
| 6A, 6B, 6C, 6D, carried | counts; defects; basis `{−1,2,5}`; realization | `8, 16, 16`; `δ = ∞, 2, 1, 1, 0`; Gram det `1`; `⟨−1,−1⟩` realizes `(2,[1],−1)` | holds |
| Layer 9 corollaries and `SD₁₆` control, carried | `1 + 2i`, `d = −1`; `t = 2` | `(2)∪(5)`; `ν + ν = 0 ≠ ν` | holds |

### Headlines and padding

`Suggested.lean` is unchanged, so the previous verdict stands:

- the five headlines are stated as `example`s closed by their Tau Ceti theorems;
- the docstring names no unstatable headline;
- the three one-term aliases stay because GlobalQuadraticForms' Lean file uses them, and the worker's targeted build of that module passed at this head.

### Library declarations opened at the pin (22)

**`NumberTheory/ClassFieldTheory/`:**

- `brauerGroupEquivBr` and `brauerGroupEquivBr_apply` (`Brauer/CentralSimple/Basic.lean`:55, :60);
- `Br` and `unitsRepH2Equiv` (`Brauer/Basic.lean`:151, :158);
- `invMap` (`Brauer/Invariant.lean`:200);
- `h2MuToBr` (`Brauer/Torsion.lean`:67);
- `h2MuEquivZMod` (`Brauer/RootsOfUnity.lean`:89);
- `natCard_twoTorsion` and `invMap_brauerGroupEquivBr_eq_half_iff` (`Brauer/CentralSimple/Invariant.lean`:65, :72);
- `muNRep` and `kummerClass` (`MuNRep.lean`:137, :283);
- `kummerCupPairing` and `localSymbol` (`Local/Symbol.lean`:207, :320);
- `finiteHilbertInvariantAt` (`Global/Hilbert/Invariant.lean`:93);
- `hilbertProductFormula` (`Global/Hilbert/Reciprocity.lean`:65).

**`Algebra/CrossedProduct/`:**

- `brauerExplicitH2Equiv` and `brauerCohomologyEquiv` (`Comparison.lean`:193, :274);
- `brauer2EquivH2` (`TwoTorsion.lean`:152);
- `brauer2EquivH2_quaternionClass` (`CupProduct.lean`:362).

**`NumberTheory/LocalField/Quaternion/Invariant.lean`:** `quaternionSubgroup_eq_twoTorsion`, `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` and `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one` (:67, :79, :92).

## Not verifiable

These sources are all settled, and none was needed this round, because no passage with a source locator changed.

- Lam, *Introduction to Quadratic Forms over Fields* (2005), and Gille–Szamuely, *Central Simple Algebras and Galois Cohomology* (2017): paywalled, recorded as `uncertified` and cited by locator.
- Delzant 1962: recorded as `uncertified`, with no legal open copy reachable.
- Serre, *A Course in Arithmetic*; Serre, *Local Fields*; O'Meara (1955, 1963); Scharlau; Milnor 1970: settled as `uncertified`.

## Source issues

- none
