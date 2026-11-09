# Review of IntegralLattices (pull request #1797 at ea37f0f)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `f925965`. The folder `TauCetiRoadmap/IntegralLattices/` is byte-identical to the head the previous review read; the two commits since then touch only AlgebraicTopology and QuadraticFormInvariants. So every finding of the previous review stands, and the situation it described is unchanged: the branch forked from main at `eaf17b1`, before main replaced this folder in `47fc6a3` (the rewrite of pull request #1239), and the pull request's one hunk here (the Layer 3G Hilbert-reciprocity `example`, `Suggested.lean:742–754`) edits the old copy, which main no longer has. `git merge-tree --write-tree origin/main HEAD` still reports a content conflict in `TauCetiRoadmap/IntegralLattices/Suggested.lean` (main is now `a169c04`; its last content commit on this folder is still `47fc6a3`).

One repair cures R01–R05 and R09–R13: merge `origin/main` into the branch and resolve this folder to main's files. Re-tested this round on a scratch copy: with main's `README.md` and `Suggested.lean` in place the gate reports 0 on every IntegralLattices check (only `outside-folder=53`, the pull request's own other folders), and the dependency check reports 0 problems. R06–R08 are in main's text and survive that repair; they are unchanged on main since the previous review.

## R01 (P1) — The folder is stale against main and the branch conflicts in `Suggested.lean`

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean:742–754` (head), the only hunk this pull request makes in the folder: "QFI exports Hilbert reciprocity for its local norm-equation/quaternion symbol, read in the completions at the finite places and in `ℝ` at the real place."
- **Claim.** The hunk edits a file main has replaced. Main's `Suggested.lean` (873 lines) has no Layer 3G example and imports only `Mathlib` and `TauCeti.*` modules, so it needs no consumer repair for the QuadraticFormInvariants rewrite.
- **Witness.** `git merge-base --is-ancestor 47fc6a3 HEAD` is false; `git merge-tree --write-tree origin/main HEAD` reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/IntegralLattices/Suggested.lean"; `git diff --stat origin/main HEAD -- TauCetiRoadmap/IntegralLattices` is 2289 insertions and 2431 deletions across README and Suggested.
- **Repair.** Merge `origin/main` into the branch and take main's version of both files (`git checkout origin/main -- TauCetiRoadmap/IntegralLattices/README.md TauCetiRoadmap/IntegralLattices/Suggested.lean`). The pull request then changes nothing in this folder. Tested on a scratch copy this round: gate `prnum=0 sorry-data=0 sorry-examples=0 residue=0 imports=0 statement-hygiene=0 depcheck=0`; main's file elaborates at the pins with 31 `sorry` warnings (previous round) and its QuadraticFormInvariants citations resolve at this head (see Verified sound).

## R02 (P1) — Gate `depcheck`: an upward edge and a cycle with OrthogonalTamagawaAndLatticeMass

- **Location.** `README.md:1763` (head): "It is `OrthogonalTamagawaAndLatticeMass`'s first obligation"; `README.md:2270` (head): the table row "The local density at 2 (7D, not owned here)" naming that roadmap.
- **Claim.** The dependency check reads these as supply edges to a roadmap later in the merge order (position 149 today) that consumes this one.
- **Witness.** `UPWARD: IntegralLattices (on main) -> OrthogonalTamagawaAndLatticeMass (#149) at README lines [1763, 2270]`, `CYCLE among: IntegralLattices, OrthogonalTamagawaAndLatticeMass`, `depcheck: 239 roadmaps, 2342 edges, 2 problem(s)`. Main's README: `depcheck: 239 roadmaps, 2345 edges, 0 problem(s)`.
- **Repair.** R01.

## R03 (P1) — B2 (seeded) cites a supplier theorem that exists nowhere

- **Location.** `README.md:1061` (head; also the table row at 477): "the supplier theorem `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two` to place it in `NumberFieldOrder.invertibleProperFractionalIdeals`".
- **Claim.** The name exists at no pin, on main, or at any open head; the citation resolver lists it as found nowhere.
- **Witness.** The pinned theorem is `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` (`TauCeti/NumberTheory/NumberField/Global/Orders/Quadratic/Basic.lean:143`). Main's README cites it correctly (line 1119).
- **Repair.** R01.

## R04 (P1) — B7 (seeded): false fibre base in the split branch, and an undetermined real measure

- **Location.** `README.md:1185–1186` (head): "A canonical Haar measure on `T_L(ℚ_p)` and on `T_L(ℝ)`, normalized so that `T_L(ℤ_p)` has volume 1"; and the split bullet "fibred as above over the finite split class set of B5".
- **Claim.** The normalisation fixes nothing at `ℝ` (`|dθ|` gives the circle volume `2π`, `dθ/2π` gives `1`, both allowed). The fibre base is not B5's class set.
- **Witness.** At `Δ = 25` the base `T(ℚ)\T(𝔸_f)/T(ℤ̂) = (ℤ/5)ˣ/{±1}` has order 2, while B5 counts `φ(5) = 4` proper classes (`5xy + cy²`, `c = 1,…,4`).
- **Repair.** R01. Main's B7 (main README 1310–1340) fixes `|dθ|` and `dt/|t|`, and identifies the base as `((ℤ/mℤ)ˣ)²`, with `Δ = 25` as the separating test.

## R05 (P2) — Gate `sorry-data`: twelve definitions with `sorry` bodies, three duplicating pinned Tau Ceti

- **Location.** `Suggested.lean` (head) lines 133, 137, 141, 145, 188, 212, 244, 248, 293, 340, 698, 1231; for example line 212: `noncomputable def expCircle (x : AddCircle (1 : ℚ)) : ℂ := sorry`.
- **Claim.** Sorry'd data is forbidden, and three of these restate native definitions.
- **Witness.** `TauCeti.expCircle` (`TauCeti/Analysis/SpecialFunctions/Complex/Circle/Basic.lean:60`), `TauCeti.FiniteQuadraticModule.gaussSign` (`TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean:514`), `localizationToCompletion` (`TauCeti/NumberTheory/IntegralLattice/Localization/Basic.lean:154`).
- **Repair.** R01. Main's file has `sorry-data=0`.

## R06 (P3) — Seven headlines in main's `Suggested.lean` are already proved at the pinned Tau Ceti

- **Location.** Main `Suggested.lean`: 111 `vanDerBlij`, 211 `nonempty_isometry_iff_gaussSign_eq`, 228 `milgram`, 271 `IntegralLattice.IsPosDef.volume_ball_mul_prod_sqrt_successiveMinimum_le`, 570 `exists_isEven_isUnimodular_isPosDef_iff`, 577 `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight`, 688 `natCard_isometry_typeE₈RootLattice`; main README 656, 2189–2190, 323–324 present them as targets. (Not at this head: it applies once R01 brings main's copy in.)
- **Claim.** Each is a sorried restatement of a library theorem, so padding.
- **Witness.** At the pin `2fd255d9`: `vanDerBlij` (`LinearAlgebra/IntegralLattice/Characteristic/VanDerBlij.lean:141`); `FiniteQuadraticModule.nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq` (`FiniteBilinearModule/Comparison.lean:175`); `gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg` (`IntegralLattice/Milgram.lean:313`); `exists_isEven_isUnimodular_isPosDef_iff` (`PosDef/EvenUnimodular.lean:163`); `IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven` (`PosDef/SmallRankUnimodular.lean:407`); `card_isometry_typeE₈RootLattice` (`LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.lean:272`); `IsPosDef.prod_successiveMinimum_mul_pi_pow_le` (`PosDef/Minkowski.lean:219`). All re-opened this round at the same lines. The previous review closed each of the seven by a direct derivation in a scratch copy.
- **Repair.** Delete the seven declarations from `Suggested.lean` and name them in the module docstring as proved in Tau Ceti; add the seven files to §*From Tau Ceti*; rewrite 1H (its 1.11.3 half), 1I, 1L, 2F, 6B, the `E₈` clause of 6C and 6G as native, keeping their Checks; reword "Two invariants with different names" (main README 318–325) and "Two things that look like duplication" (206–212). The other native lattice-form statements the previous review listed (6C rank ≤ 9, the non-isometry half of 6D, 6H, 2G) are either cited or kept with one clause saying how they differ.

## R07 (P3) — "The single lattice carrier" (seeded) displays a structure that is not the pinned `TauCeti.IntegralLattice`

- **Location.** `README.md:277–283` (head) and main `README.md:222–229`: a structure with fields `[isLattice : carrier.IsLattice ℚ]` and `integral : ∀ x ∈ carrier, ∀ y ∈ carrier, form x y ∈ (1 : Submodule ℤ ℚ)`.
- **Claim.** The pinned structure has an explicit `isLattice` field, `isSymm`, and `le_dual : carrier ≤ form.dualSubmodule carrier`; it has no `integral` field.
- **Witness.** `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63–73`, re-read this round.
- **Repair.** Replace the code block with the pinned field list and file. The content is equivalent: for `ℤe` with `B(e,e) = 2` both hold; for `ℤe` with `B(e,e) = 1/2` the dual is `2ℤe ⊉ ℤe` and `1/2 ∉ ℤ`, so both fail.

## R08 (P3) — 3E's Allcock–Gal–Mark locator names the wrong theorem

- **Location.** Main `README.md:857`: "Allcock–Gal–Mark (Theorem 5.1 there, which proves the canonical symbol a complete invariant)". The head's 874 carries no theorem number.
- **Claim.** Theorem 5.1 classifies unimodular `ℤ₂`-lattices; the canonical form as a complete invariant is Corollary 6.4, via the sign-walk equivalence Theorem 6.2.
- **Witness.** `allcock-gal-mark2016` line 686 (Theorem 5.1, unimodular lattices), line 849 (Theorem 6.2, equivalence of 2-adic symbols), lines 917–918 (Corollary 6.4, canonical form).
- **Repair.** Cite "Theorem 6.2, p. 20, and Corollary 6.4, p. 21 (Theorem 5.1, p. 16, for the unimodular constituents)".

## R09 (P3) — Gate `imports`: the old file imports seven roadmap modules

- **Location.** `Suggested.lean:5–11` (head): `import Completed.IntegralLattices.Suggested` through `import Completed.OrthogonalSpinGroups.Suggested`, including `TauCetiRoadmap.QuadraticFormInvariants.Suggested`.
- **Witness.** Gate rule `imports` (`imports=1`). Main's file imports `Mathlib` and twenty `TauCeti.*` modules only.
- **Repair.** R01.

## R10 (P3) — Gate `sorry-examples`: 27 admitted examples

- **Location.** `Suggested.lean` (head) lines 445–1320; for example line 466, `example : (CartanMatrix.E 8).det = 1 :=` followed by `sorry`.
- **Witness.** Gate rule `sorry-examples` (`sorry-examples=27`); main's file has none.
- **Repair.** R01.

## R11 (P3) — Gate `prnum`: pull-request numbers in the README

- **Location.** `README.md:7` (head): "already merged in upstream PR #200"; also line 273, and `#246`/`#255` at lines 40, 41, 89, 117, 119.
- **Witness.** Gate rule `prnum` (`prnum=2`); main's README has no `#NNN`.
- **Repair.** R01.

## R12 (P3) — Gate `residue`

- **Location.** `README.md:169` (head): "Nothing here is a stand-in for it"; also line 478, and the process word "reviewed" at lines 6, 89, 272, 312, 352, 365 among others.
- **Witness.** Gate rule `residue` (`residue=2`); main's README passes it.
- **Repair.** R01.

## R13 (P3) — Gate `statement-hygiene`

- **Location.** `Suggested.lean:1289` (head): `gal_binaryRingClassField_equiv_pic` concludes `Nonempty (… ≃ₐ[K] …)`.
- **Witness.** Gate rule `statement-hygiene` (`statement-hygiene=1`); main's file has no such theorem.
- **Repair.** R01.

## Previous findings

- R01 — not repaired: `Suggested.lean:742–754` is unchanged; `git merge-tree` against today's `origin/main` (`a169c04`) still conflicts in this file; `47fc6a3` is still not an ancestor of the head.
- R02 — not repaired: `README.md:1763` "It is `OrthogonalTamagawaAndLatticeMass`'s first obligation" and the table row at 2270 are unchanged; depcheck still reports the UPWARD edge and the CYCLE.
- R03 — not repaired: `README.md:1061` still cites `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`.
- R04 — not repaired: `README.md:1185–1186` still normalises only `T_L(ℤ_p)` to volume 1 and fibres over "the finite split class set of B5".
- R05 — not repaired: the twelve sorried definitions at the same lines (133 … 1231); gate `sorry-data=12`.
- R06 — not repaired: main's `Suggested.lean` is unchanged since `47fc6a3`; the seven natives are at the same pin lines (re-opened this round).
- R07 — not repaired: head 277–283 and main 222–229 still display the `integral` field; the pin at `Basic.lean:63–73` has `le_dual`.
- R08 — not repaired: main `README.md:857` still says "Theorem 5.1 there, which proves the canonical symbol a complete invariant".
- R09 — not repaired: `Suggested.lean:5–11` still imports the seven roadmap modules; gate `imports=1`.
- R10 — not repaired: 27 admitted examples; gate `sorry-examples=27`.
- R11 — not repaired: `README.md:7` "already merged in upstream PR #200"; gate `prnum=2`.
- R12 — not repaired: `README.md:169` "Nothing here is a stand-in for it"; gate `residue=2`.
- R13 — not repaired: `Suggested.lean:1289` still concludes `Nonempty (… ≃ₐ[K] …)`; gate `statement-hygiene=1`.

## Verified sound

**Change set.** `git diff origin/main...HEAD -- TauCetiRoadmap/IntegralLattices` is the one 20-line hunk at `Suggested.lean:742–754` (commit `f925965`); the two commits since `f925965` (`9864ff4a`, `ea37f0f7`) touch only `TauCetiRoadmap/QuadraticFormInvariants/README.md`, `TauCetiRoadmap/AlgebraicTopology/README.md` and `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`. `git diff --stat origin/main...HEAD` outside the six folders the brief names is empty.

**Gate (my run, with `--build`).** `prnum=2 sorry-data=12 sorry-examples=27 residue=2 imports=1 statement-hygiene=1 depcheck=2 build=0 outside-folder=53 FAIL`, the worker's figures plus the expected outside-folder count of this multi-folder pull request. On a scratch copy with main's README and Suggested in the folder: every IntegralLattices check 0.

**Elaboration.** `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean` at this head: exit 0, 69 warnings, all `declaration uses sorry`, nothing else. The changed 3G example (the only hunk) elaborates against this head's `QuadraticFormInvariants.hilbertSymbol_productFormula`.

**Dependency check.**

```text
head:  UPWARD: IntegralLattices (on main) -> OrthogonalTamagawaAndLatticeMass (#149) at README lines [1763, 2270]
       CYCLE among: IntegralLattices, OrthogonalTamagawaAndLatticeMass
       depcheck: 239 roadmaps, 2342 edges, 2 problem(s)
main:  depcheck: 239 roadmaps, 2345 edges, 0 problem(s)
```

**Cross-roadmap citations re-resolved at this head.** QuadraticFormInvariants changed again since the previous review (`9864ff4a`), so main IntegralLattices' citations of it were re-resolved: `hilbertSymbol_productFormula` (`TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:195`), `hilbertSymbol_eq_cohomological` (206), `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` (249), and "6D. The classification and its corollaries" (QFI README 1583, with the classification name at 1590). These cover main IntegralLattices README 114, 453, 476, 898, 914, 1027–1028, 2229, 2305 and 2319. The head's own hunk uses `QuadraticFormInvariants.hilbertSymbol`, `hilbertSymbol_productFormula`, `TauCeti.unitAtRealPlace` and `unitAtFinitePlace`, all of which elaborate. Main's last commit on this folder is still `47fc6a3` (content checkout at `f490cd2`), so the previous review's reading of main's copy stands.

**Library declarations re-opened at the pin (`2fd255d9`).** `IntegralLattice` (`LinearAlgebra/IntegralLattice/Basic.lean:63–73`, fields `carrier`, `form`, `isLattice`, `isSymm`, `le_dual`); the seven natives of R06 at the lines quoted there; `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` (R03) as in the previous review.

**Overlaps.** The overlap report lists #1187 (a Tau Ceti pin bump) and #1411 (ClassFieldTheory, conflicting with this pull request in `QuadraticFormInvariants/Suggested.lean`, not in this folder) as touching this roadmap; no id this README cites is dropped by an open head; this pull request drops no id others cite. Ownership against the closest open roadmaps (ThetaSeries, OrthogonalSpinGroups, LatticePackingsAndPerfectForms, OrthogonalTamagawaAndLatticeMass, GeometryOfNumbers) was checked by the previous review and nothing here changed.

**Adversarial pass.** Rows for untouched statements are carried from the previous report (r9); the rows marked "this round" were computed now, by hand in exact arithmetic, for the seeded targets r9 did not tabulate. All are in the stale head copy; the same paragraphs on main (279–390, 1165–1420) were not re-derived.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 3G example (head 742–754, the only hunk) | `(a,b) = (−1,−1)`, `(2,3)` | `(−1,−1)₂ = −1`, odd `p`: `1`, real `−1`, product `1`; `(2,3)₂ = −1`, `(2,3)₃ = −1`, real `1`, product `1` | true, elaborates; absent on main (R01) (r9) |
| Gauss-sum invariant ("Two invariants") | `⟨2⟩`, `⟨−2⟩`, `A₂`, `D₄`; wrong factor `πi` | signs `1, 7, 2, 4`; with `πi`: `|1+e^{πi/4}| ≈ 1.848 ≠ √2` | convention right; 1H/1I attribution refuted (R06) (r9) |
| Milgram 1I | `A₂`, `D₄`, `E₈`, `U` | signatures `2, 4, 0, 0` = signs | true; native (R06) (r9) |
| van der Blij 1L | `⟨1⟩`, `I₁,₁`, `E₈`, `⟨2⟩` | `w² ≡ 1 = σ`; `0 = σ`; `0 ≡ 8`; `⟨2⟩` not unimodular, `2 ≢ 1` | true; native (R06) (r9) |
| Nikulin 1.11.3, 1H | `u⁽²⁾(2)` vs `v⁽²⁾(2)`; `q₁⁽²⁾(4)` vs `q₅⁽²⁾(4)` | Gauss sums `2` vs `−2`; `2e(1/8)` vs `2e(5/8)`, same `b` | true; native (R06) (r9) |
| Minkowski 2F | `⟨a⟩`, `ℤ²`, `E₈`, rank 0 | `πa ≤ πa`; `π² ≤ 16`; `256π⁸ ≈ 2.43·10⁶ ≤ 3.77·10⁷`; `1 ≤ 1` | equivalent to native (R06) (r9) |
| 6B, 6G | `n = 0, 4, 8`; orbit chain | `D₄` det `4`; `240·126·23040 = 696729600` | native (R06) (r9) |
| B1 (seeded) | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]` | `4B²−4AC = −12, 4, 8, −92` → `(c,Δ) = (2,−3),(2,1),(1,8),(2,−23)` | pass (r9) |
| B2 (seeded) | `Δ = 12`, `−4`, `−23` | `𝔞_f = 𝒪₁₂`; narrow class of `3x²−y²` nontrivial; `h = 1`; `h = 3` | mathematics pass; name fails (R03) (r9) |
| B7 (seeded) | `Δ = 25`; `Δ = −3`; `U` | base `4` vs actual `2`; `S¹` volume `2π` or `1` both allowed | head fails (R04) (r9) |
| Single carrier (seeded) | `A₁`; `ℤe`, `B = 1/2` | `le_dual` ⇔ `2 ∈ ℤ`; `2ℤe ⊉ ℤe` ⇔ `½ ∉ ℤ` | equivalent; display wrong (R07) (r9) |
| Signature and degeneracy (seeded) | `Ã₁` Gram `[[2,−2],[−2,2]]` | eigenvalues `4, 0`: `(1,1,0)` | pass (r9) |
| Positive definite, not definite (seeded) | `E₈(−1)`; `x²+y²−3z²`; `Ã₁ ⊕ ⟨−1⟩` | `NegDef`; `(2,0,1)`; indefinite and degenerate | pass (r9) |
| Genus symbols (seeded) | `⟨1⟩,⟨3⟩,⟨5⟩,⟨7⟩`; AGM | `(3∣2) = (5∣2) = −1`, `(7∣2) = 1`; oddities `1,3,5,7` | pass; 3E locator R08 (r9) |
| Mass (seeded) | rank 0, 1, `ℤ²`, `E₈` | `1`; `1/2`; `1/8`; `1/696729600` | pass (r9) |
| Owned there / here, bridge, two things (seeded) | Theta Series on main | Layer 2 bridge; 6C positive definite Milgram | pass; 1I attribution R06 (r9) |
| Form twists, dilations, sums (seeded, this round) | `L = ℤe`, `B(e,e) = 1`, `a = 2`; `a • carrier` | `dual_{2B}(ℤe) = {v : 2v ∈ ℤ}e = ½ℤe = 2⁻¹ · dual_B(ℤe)` ✓; `2ℤe` has Gram `4`, `L(2)` has Gram `2`, so the two notions differ | pass |
| Discriminant forms (seeded, this round) | `A₂`; polar of `q_L` | `A_{A₂} = ℤ/3`, generator `(2e₁+e₂)/3`, `B = 2/3`, `q = 1/3`; `q(x+y) − q(x) − q(y) = B(x,y)` | pass |
| Scale, norm ideal, level (seeded, this round) | `A₂`; `⟨1⟩`; `E₈`; inclusion `2𝔰 ⊆ 𝔫` | `3·G⁻¹ = !![2,1;1,2]`: level `3 = ord(q)`; `⟨1⟩`: level `2`; `E₈`: level `1`; `2B(x,y) = B(x+y,x+y) − B(x,x) − B(y,y) ∈ 𝔫` | pass |
| Nikulin's notation (seeded, this round) | `q_θ⁽²⁾(2)`, `θ ∈ {1,3,5,7}`; `Λ_{K3}` | full-norm values `1/2, 3/2, 1/2, 3/2` mod 2, so `(2) ≇ (10)` give one form, `det` ratio `5 ∉ (ℤ₂ˣ)²`; `U³ ⊕ E₈(−1)²` has rank `22`, signature `(3,19)` | pass |
| B3 (seeded, this round) | `Δ = −23`; `Δ = 4`; `Δ = −4` | `Pic 𝒪₋₂₃` cyclic of order 3 = `{(1,1,6),(2,±1,3)}`, squares = all, one genus; `A₄ = ℚ×ℚ`, `(1,0)` nonzero nonunit, no `NumberFieldOrder`; `h(−4) = 1`, `Gal(H/ℚ(i))` trivial | pass |
| B5 (seeded, this round) | `Δ = −23`; `Δ = −3` | reduced `|b| ≤ a ≤ c`: `(1,1,6),(2,1,3),(2,−1,3)` and no others (`a ≤ √(23/3) < 3`); `(1,1,1)` only | pass |
| B8 (seeded, this round) | `A₂`; genus of `!![4,1;1,6]` | `w = 6`, `h⁺ = 1`, `|O| = 12`, `m = 1/12 = 1/(2·6)`; `w = 2`, `h⁺ = 3`, `a = 1`, `h = 2`, `|O(!![2,1;1,12])| = 4` (the reflection `(x,y) ↦ (x+y,−y)` fixes `x²+xy+6y²`), `|O(!![4,1;1,6])| = 2`, `m = 1/4 + 1/2 = 3/4 = h⁺/(2w) ≠ h/(2w) = 1/2` | pass |

**Headline theorems.** Unchanged from the previous review: main's docstring (lines 36–50) lists 1H, 1L, 1I, 2F, 2G, 4B, 4E, 4F, 5A, 5B/5G/5J, 6A, 6B, 6C, 6D, 6H, 6E, 6G, 7C, 7E and 9B, each stated; the unstatable ones are named at lines 62–70; R06 lists those already proved at the pin. The head's own file is the old copy and is replaced by R01.

**Remarks (no change requested).** The seeded conventions and Layer B paragraphs of the head copy checked above are mathematically consistent in the old copy too; they are superseded by main's text under R01.

## Not verifiable

- Cox, *Primes of the form x² + ny²*, Theorem 7.7, p. 137 (B2/B3): no open copy; the statement checked is the standard one.
- Cohen, *A Course in Computational Algebraic Number Theory*, §5.2 (B2): no open copy.
- Conway–Sloane, *SPLAG*, Chapter 15 §7 (genus symbols, 3E, 3G): no open copy; the canonical form is checked only through `allcock-gal-mark2016`.
- `conway-sloane-mass1988` (Mass, B8, 7H): waived in the manifest.
- Nikulin (Izv. 1979) Theorem 1.9.1 (Nikulin's notation): paywalled; checked only through the `θ ∈ {1,3,5,7}` computation above.
- O'Meara, Milnor–Husemoller, Serre, Cassels: books; cited at seeded targets only through statements checked mathematically.

## Source issues

- none
