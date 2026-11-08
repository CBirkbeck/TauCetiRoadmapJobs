# Review of IntegralLattices (pull request #1797 at f925965)

**Verdict:** needs changes

This pull request changes one declaration in this folder: the Layer 3G Hilbert-reciprocity `example` at `TauCetiRoadmap/IntegralLattices/Suggested.lean:742–754`, rewritten for the new `QuadraticFormInvariants.hilbertSymbol_productFormula`. The commit that makes the change is "QuadraticFormInvariants: review repairs with consumers kept building". The pull request description does not mention IntegralLattices.

The branch forked from main at `eaf17b1`. That is before main merged the IntegralLattices rewrite as `47fc6a3` (pull request #1239), which replaced both `README.md` and `Suggested.lean`. So the folder at this head is the old copy. Every gate failure below is in that old copy, and main's copy has none of them. Rows R01–R05 and R09–R13 are cured by one repair: bring the branch up to date and keep main's file. R06–R08 are in main's text and survive that repair.

## R01 (P1) — The folder is stale against main and the branch conflicts in `Suggested.lean`

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean:742–754` (head), the only hunk this pull request makes in the folder: "QFI exports Hilbert reciprocity for its local norm-equation/quaternion symbol, read in the completions at the finite places and in `ℝ` at the real place."
- **Claim.** The hunk edits a file that main has since replaced. Main's `Suggested.lean` has no Layer 3G example. It imports only `Mathlib` and `TauCeti.*` (lines 3–23), so it does not need this consumer repair.
- **Witness.** `git merge-tree --write-tree origin/main HEAD` reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/IntegralLattices/Suggested.lean". `git merge-base --is-ancestor 47fc6a3 HEAD` is false.
- **Repair.** Merge `origin/main` into the branch and resolve the file to main's version (`git checkout origin/main -- TauCetiRoadmap/IntegralLattices/Suggested.lean`). The pull request then changes nothing in this folder.
- **Tested on a scratch clone.** After that resolution:
  - the folder is byte-identical to main;
  - `gate … IntegralLattices --base origin/main` reports 0 on every IntegralLattices check (only `outside-folder=53`, the pull request's own other folders);
  - main's file elaborates at the pins with 31 `declaration uses sorry` warnings and no error;
  - its one QuadraticFormInvariants citation, `hilbertSymbol_productFormula` (main README 476, 898, 1027, 2229), resolves at this head's `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:195` with the classical-symbol meaning the row states.

## R02 (P1) — Gate `depcheck`: an upward edge and a cycle with OrthogonalTamagawaAndLatticeMass

- **Location.** `README.md:1763` (head): "It is `OrthogonalTamagawaAndLatticeMass`'s first obligation". `README.md:2270` (head): "both belong to `OrthogonalTamagawaAndLatticeMass`".
- **Claim.** The dependency check reads these lines as supply edges to a roadmap that is later in the merge order (position 147) and consumes this one.
- **Witness.** `UPWARD: IntegralLattices (on main) -> OrthogonalTamagawaAndLatticeMass (#147) at README lines [1763, 2270]` and `CYCLE among: IntegralLattices, OrthogonalTamagawaAndLatticeMass` (`depcheck: 239 roadmaps, 2372 edges, 2 problem(s)`).
- **Note.** Both lines read as deferrals, so the edge may be a false positive. But the old copy also carries OTM's milestone 7H, with its formula, inside its own Layer 7 (`README.md:1904`).
- **Repair.** R01. On main's README the same check reports `depcheck: 239 roadmaps, 2375 edges, 0 problem(s)`.

## R03 (P1) — B2 (seeded) cites a supplier theorem that exists nowhere

- **Location.** `README.md:1061` (head; also the table row at 477): "the supplier theorem `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two` to place it in `NumberFieldOrder.invertibleProperFractionalIdeals`".
- **Claim.** The name does not exist at the pinned Tau Ceti, on main, or at any open head (the citation resolver also lists it as found nowhere).
- **Witness.** The pinned theorem is `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` (`TauCeti/NumberTheory/NumberField/Global/Orders/Quadratic/Basic.lean:143`). Main's README cites it correctly at line 1119.
- **Repair.** R01. Main's B2 also replaces the head's vague "Theorem 7.7 and its narrow analogue" with Cox Theorem 7.7, p. 137 and Cohen §5.2 (main README 1149–1154).

## R04 (P1) — B7 (seeded): false base in the split branch, and an undetermined real measure

- **Location.** `README.md:1185–1186` (head): "A canonical Haar measure on `T_L(ℚ_p)` and on `T_L(ℝ)`, normalized so that `T_L(ℤ_p)` has volume 1". Also the split bullet: "fibred as above over the finite split class set of B5".
- **Claim.**
  - The normalization fixes nothing at `ℝ`. With `|dθ|` the circle has volume `2π`, with `dθ/2π` it has volume 1, and both satisfy the condition.
  - The fibre base is not B5's class set.
- **Witness.** At `Δ = 25` the base `T(ℚ)\T(𝔸_f)/T(ℤ̂) = (ℤ/5)ˣ/{±1}` has order 2, while B5 counts `φ(5) = 4` proper classes (`5xy + cy²`, `c = 1,…,4`).
- **Repair.** R01. Main's B7 (main README 1310–1340) fixes `|dθ|` (total `2π`) and `dt/|t|`, and identifies the base as `((ℤ/mℤ)ˣ)²`, with `Δ = 25` as the separating test.

## R05 (P2) — Gate `sorry-data`: twelve definitions with `sorry` bodies, three of them duplicating pinned Tau Ceti

- **Location.** `Suggested.lean` (head), lines 133, 137, 141, 145, 188, 212, 244, 248, 293, 340, 698 and 1231. For example, line 212: `noncomputable def expCircle (x : AddCircle (1 : ℚ)) : ℂ := sorry`.
- **Claim.** Sorry'd data is forbidden. Three of these restate native definitions, and with `open TauCeti` in scope that makes `expCircle` ambiguous.
- **Witness.** The native definitions:
  - `TauCeti.expCircle` (`TauCeti/Analysis/SpecialFunctions/Complex/Circle/Basic.lean:60`);
  - `TauCeti.FiniteQuadraticModule.gaussSign` (`TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean:514`);
  - `localizationToCompletion` (`TauCeti/NumberTheory/IntegralLattice/Localization/Basic.lean:154`).
- **Repair.** R01. Main's file has no sorry'd `def`, `abbrev`, `instance` or `opaque` (gate `sorry-data=0`).

## R06 (P3) — Seven headlines in main's `Suggested.lean` are completed targets, already proved at the pinned Tau Ceti

- **Location.** Main `Suggested.lean`: 111 `vanDerBlij`, 211 `nonempty_isometry_iff_gaussSign_eq`, 228 `milgram`, 271 `IntegralLattice.IsPosDef.volume_ball_mul_prod_sqrt_successiveMinimum_le`, 570 `exists_isEven_isUnimodular_isPosDef_iff`, 577 `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight` and 688 `natCard_isometry_typeE₈RootLattice`. Main README still presents these as targets: 656 says "The target is **van der Blij's theorem**", 2189–2190 says "This milestone is owned here", and 323–324 says "milestone 1H proves it … milestone 1I proves it".
- **Claim.** Each is proved at the pin. Main's own generated `STATUS.md` records Layers 1 (apart from 1G) and 2, and 6B, 6C and 6G, as done. As stated, these are padding: sorried restatements of library theorems.
- **Witness.** In a scratch copy with the native modules imported:
  - 1L closes by `rw [← integralNorm_apply]; exact TauCeti.IntegralLattice.vanDerBlij L hU hw` (`Characteristic/VanDerBlij.lean:141`);
  - 1H by one `rw` with `FiniteQuadraticModule.nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq` (`FiniteBilinearModule/Comparison.lean:175`), and the roadmap's `h₂` is then unused;
  - 1I by `rw [gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg]; push_cast; rfl` (`IntegralLattice/Milgram.lean:313`);
  - 6B by `exact TauCeti.IntegralLattice.exists_isEven_isUnimodular_isPosDef_iff n` (`PosDef/EvenUnimodular.lean:163`, same name, same statement);
  - 6C (`E₈`) by `IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven` (`PosDef/SmallRankUnimodular.lean:407`) with `finrank_carrier`;
  - 6G by `exact card_isometry_typeE₈RootLattice` (`RootLattice/TypeE/WeylGroup.lean:272`);
  - 2F is the square root of `IsPosDef.prod_successiveMinimum_mul_pi_pow_le` (`PosDef/Minkowski.lean:219`). In rank ≥ 1 it is derived in 15 lines through `EuclideanSpace.volume_ball`.

  The file then elaborates with 25 `sorry` warnings instead of 31. (Plain `exact?` does not find these, because main's file does not import those modules.)
- **Repair.**
  - Delete the seven declarations from `Suggested.lean`, and say in the module docstring (lines 36–50) that these headlines are proved in Tau Ceti, naming each declaration.
  - In §*From Tau Ceti*, add the rows `Milgram.lean`, `Characteristic/VanDerBlij.lean`, `FiniteBilinearModule/Comparison.lean`, `PosDef/Minkowski.lean`, `PosDef/EvenUnimodular.lean`, `PosDef/SmallRankUnimodular.lean` and `RootLattice/TypeE/WeylGroup.lean`, with the names above.
  - Rewrite 1H (its 1.11.3 half), 1I, 1L, 2F, 6B, the `E₈` clause of 6C, and 6G as native, keeping their Checks. 1H keeps Proposition 1.11.2.
  - Reword "Two invariants with different names" (main README 318–325) and "Two things that look like duplication" (206–212), which assign Milgram to 1I.
  - These are also native, in lattice form: the other two 6C statements (`IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine`, `PosDef/SmallRankUnimodular.lean:378`), the non-isometry half of 6D (`isEmpty_isometry_e8PowLattice_checkerboardPlusLattice`, `NumberTheory/IntegralLattice/EvenUnimodularGenus.lean:82`), 6H (`Cancellation.lean:311` and `:344`) and 2G (`PosDef/Classes.lean:52`). Either cite them, or keep the Gram-matrix forms and say in one clause how they differ.

## R07 (P3) — "The single lattice carrier" (seeded) displays a structure that is not the pinned `TauCeti.IntegralLattice`

- **Location.** `README.md:277–283` (head) and main `README.md:222–229`, which say the carrier is "Tau Ceti's embedded carrier `TauCeti.IntegralLattice`" and display a structure with fields `[isLattice : carrier.IsLattice ℚ]` and `integral : ∀ x ∈ carrier, ∀ y ∈ carrier, form x y ∈ (1 : Submodule ℤ ℚ)`.
- **Claim.** The pinned structure has an explicit `isLattice` field and the field `le_dual : carrier ≤ form.dualSubmodule carrier`. It has no `integral` field, and `V` is a section variable.
- **Witness.** `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63–73`.
- **Repair.** Replace the code block with the pinned field list and file. The mathematics is unchanged, because `le_dual` is equivalent to integrality on the carrier. For `A₁` (`ℤe`, `B(e,e) = 2`) both hold. For `ℤe` with `B(e,e) = 1/2` both fail: the dual is `2ℤe`, and `1/2 ∉ ℤ`.

## R08 (P3) — 3E's Allcock–Gal–Mark locator names the wrong theorem

- **Location.** Main `README.md:857`: "Allcock–Gal–Mark (Theorem 5.1 there, which proves the canonical symbol a complete invariant)". The head's 874 has no theorem number.
- **Claim.** AGM Theorem 5.1 classifies unimodular `ℤ₂`-lattices by dimension, type, sign and oddity.
- **Witness.** `allcock-gal-mark2016` line 686 (arXiv:1511.04614v3, p. 16). The sign-walk equivalence is Theorem 6.2 (line 849, p. 20), and the canonical form as a complete invariant is Corollary 6.4 (lines 917–918, p. 21).
- **Repair.** Cite "Theorem 6.2, p. 20, and Corollary 6.4, p. 21 (Theorem 5.1, p. 16, for the unimodular constituents)". Record the work in the roadmap's `sources.toml`; I fetched it only into a scratch manifest.

## R09 (P3) — Gate `imports`: the old file imports seven roadmap modules

- **Location.** `Suggested.lean:5–11` (head), from `import Completed.IntegralLattices.Suggested` through `import Completed.OrthogonalSpinGroups.Suggested`, including `TauCetiRoadmap.QuadraticFormInvariants.Suggested`.
- **Claim.** Only `import Mathlib` and individual `TauCeti.*` modules are allowed. This import is also the reason the hunk of R01 was needed at all.
- **Witness.** Gate rule `imports`. Main's file imports `public import Mathlib` and twenty `TauCeti.*` modules.
- **Repair.** R01.

## R10 (P3) — Gate `sorry-examples`: 27 admitted examples

- **Location.** `Suggested.lean` (head), lines 445–1320. For example, line 466: `example : (CartanMatrix.E 8).det = 1 :=` followed by `sorry`.
- **Witness.** Gate rule `sorry-examples`; main's file has none.
- **Repair.** R01.

## R11 (P3) — Gate `prnum`: pull-request numbers in the README

- **Location.** `README.md` (head) line 7: "already merged in upstream PR #200". Also line 273. The gate does not catch "#246 `RestrictedProducts`" and "#255 `OrthogonalSpinGroups`" at lines 40, 41, 89, 117 and 119.
- **Witness.** Gate rule `prnum`. Main's README has no `#NNN`.
- **Repair.** R01.

## R12 (P3) — Gate `residue`

- **Location.** `README.md:169` (head): "Nothing here is a stand-in for it". Also `README.md:478`. The old copy also uses the process word "reviewed" (lines 6, 89, 272, 312, 352 and 365, among others).
- **Witness.** Gate rule `residue`; main's README passes it.
- **Repair.** R01.

## R13 (P3) — Gate `statement-hygiene`

- **Location.** `Suggested.lean:1289` (head): `gal_binaryRingClassField_equiv_pic` concludes `Nonempty (… ≃ₐ[K] …)`.
- **Witness.** The gate's rule. Main's file has no such theorem (gate `statement-hygiene=0`).
- **Repair.** R01.

## Previous findings

The previous AI review, r8, reviewed pull request #1239 at `2a9d69b` and raised no finding, so there is nothing to check finding by finding. The content it accepted is on main as `47fc6a3`. Main's `README.md` and `Suggested.lean` are byte-identical to `2a9d69b`; only the generated `PROGRESS.md` and `STATUS.md` differ. That content is absent from this head (R01).

## Verified sound

**Gate and build.**

- My gate on this head gives the worker's figures: `prnum=2 sorry-data=12 sorry-examples=27 residue=2 imports=1 statement-hygiene=1 depcheck=2`. It adds `outside-folder=53`, which counts this pull request's own AlgebraicTopology, GeometricTopology, QuadraticFormInvariants, ReductiveGroups and LieHighestWeight files, as a hand-run gate does on a multi-folder pull request. The worker's run has `build=0`.
- `git diff --stat origin/main...HEAD` outside the six named folders is empty.
- `lake env lean` on the head's `Suggested.lean` exits 0 with 69 `sorry` warnings and nothing else.

**Dependency check.**

```text
head:     UPWARD: IntegralLattices (on main) -> OrthogonalTamagawaAndLatticeMass (#147) at README lines [1763, 2270]
          CYCLE among: IntegralLattices, OrthogonalTamagawaAndLatticeMass
          depcheck: 239 roadmaps, 2372 edges, 2 problem(s)
resolved: depcheck: 239 roadmaps, 2375 edges, 0 problem(s)
```

**Resolved state (R01's repair) and main's file.**

- Main's file elaborates at the pins with 31 warnings, all `sorry`, at lines 111 to 860.
- I ran `#check @name` on all 64 declarations; all elaborate. The headline types agree with the README: `vanDerBlij`, `milgram`, `nonempty_isometry_iff_gaussSign_eq`, 2F, 6B, 6C, 6E and 6G as quoted in R06 and R08. No `def` lost a needed binder.
- One-tactic probe (`first | rfl | infer_instance | decide | simp`): 0 of 31 close.
- The direct derivations in R06 close 7.

**Library declarations opened at the pins.**

Mathlib:

- `QuadraticMap.associated` (`LinearAlgebra/QuadraticForm/Basic.lean:960`) under `[Invertible (2 : Module.End R N)]` (953);
- `QuadraticForm.toMatrix` (1208) and `discr` (1270) under `[Invertible (2 : R)]` (1159);
- `QuadraticForm.baseChange` (`TensorProduct.lean:128`, hypothesis at 40);
- `QuadraticForm.sigPos`/`sigNeg` (`Signature.lean:65, 98`, over a linearly ordered commutative ring, so over `ℚ`).

Tau Ceti:

- `IntegralLattice` (`Basic.lean:63`), `finrank_carrier` (126), `integralNorm` (`Norm.lean:105`, apply lemma 109);
- `expCircle` (Circle/Basic 60);
- `gaussSign` (GaussSum 514);
- `localizationToCompletion` (Localization/Basic 154);
- `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` (Orders/Quadratic/Basic 143);
- `hilbertSymbol` (`NumberTheory/HilbertSymbol/Basic.lean:47`);
- `hilbertSymbol_productFormula` (`QuadraticForm/Global/ProductFormula.lean:67`);
- `hilbertSymbol_eq_cohomological` (`GaloisCohomology/MuTwo/LocalSymbol.lean:191`);
- `ClassFieldTheory.hilbertProductFormula` (`Global/Hilbert/Reciprocity.lean:65`);
- `equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` (`LocalField/QuadraticForm/Classification.lean:190`);
- `unitNormSplittingIsometry` (`Orthogonal/UnitNorm.lean:125`);
- the twelve native theorems of R06.

**Cross-roadmap citations resolved.**

- Theta Series on main: its Layer 2 is the bridge (its README 484), and its 6C proves positive definite Milgram by theta asymptotics (143–144, 769). This is as "The bridge is theirs" and "Two things…" say. Its `Suggested.lean` imports no roadmap module, so the old copy's "Theta Series imports this file" (head 200–212) is stale; main dropped the sentence.
- QuadraticFormInvariants at this head:
  - `hilbertSymbol_productFormula` (Suggested 195);
  - `hilbertSymbol_eq_cohomological` (203);
  - 6D "The classification and its corollaries" (README 1552), with `equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` (1559).

  These are all of main IntegralLattices' citations of QFI (main README 51, 114, 476, 898, 1027, 1794, 2229, 2305), so the QFI rewrite in this pull request breaks none of them.
- Class Field Theory on main: `hilbertProductFormula` is a frozen public name (its README 606).

**Ownership and overlaps.**

- LatticePackingsAndPerfectForms (open head, pull request #1723) consumes IntegralLattices §§2E–2G and 6G (its README 247–250, 324) and owns none of them.
- SuccessiveMinima (main) owns real minima and defers the integral minima of 2F here (its README 112–116, 122). It already names the native `IsPosDef.prod_successiveMinimum_mul_pi_pow_le`, which supports R06.
- OrthogonalTamagawaAndLatticeMass is a consumer (r8 checked this; unchanged).
- The overlap tool lists pull request #1187 as changing this roadmap. No id this README cites is dropped by an open head, and this pull request drops no id that others cite.

**Adversarial pass.** All values were computed by hand, in exact arithmetic.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| The pull request's 3G example (head 742–754) | `(a,b) = (−1,−1)`, `(2,3)` | `(−1,−1)₂ = −1`, odd `p`: `1`, real: `−1`, product `1`. `(2,3)₂ = (−1)^{(9−1)/8} = −1`, `(2,3)₃ = (2∣3) = −1`, real `1`, product `1` | true, builds; absent on main (R01) |
| Gauss-sum invariant (seeded "Two invariants") | `⟨2⟩`, `⟨−2⟩`, `A₂`, `D₄`; wrong factor `πi` | `1+i = √2·e(1/8)` → `1`; `1−i` → `7`; `1+2e(1/3) = i√3 = √3·e(2/8)` → `2`; `1−3 = −2 = 2·e(4/8)` → `4`. With `πi`: `|1+e^{πi/4}| = √(2+√2) ≈ 1.848 ≠ √2 ≈ 1.414` | convention right; attribution to 1H/1I refuted (R06) |
| Milgram 1I (headline) | `A₂`, `D₄`, `E₈`, `U` | signatures `2, 4, 8≡0, 0` against signs `2, 4, 0, 0`; equal to the native statement up to `push_cast` and symmetry | true; native (R06) |
| van der Blij 1L (headline) | `⟨1⟩`; `I₁,₁`; `E₈`; `⟨2⟩` | `w² ∈ {1,9,25} ≡ 1 = σ`; `(1,1)`: `1−1 = 0 = σ`; `w = 0`: `0 ≡ 8`; `⟨2⟩` is not unimodular, `β(1,1) = 2 ≢ 1`, so the hypothesis is needed | true; native (R06) |
| Nikulin 1.11.3, 1H (headline) | `u⁽²⁾(2)` vs `v⁽²⁾(2)`; `q₁⁽²⁾(4)` vs `q₅⁽²⁾(4)` | Gauss sums `2` vs `−2`, signs `0` vs `4`; `2e(1/8)` vs `2e(5/8)`, signs `1` vs `5`, with the same bilinear form (`b(1,1) = 1/4`), so not isometric | true; `h₂` unused; native (R06) |
| Minkowski 2F (headline) | `⟨a⟩`; `ℤ²`; `E₈`; rank 0 | `2√a ≤ 2√a` ⇔ `πa ≤ 4Γ(3/2)²a = πa`; `π ≤ 4` ⇔ `π² ≤ 16`; `16π⁴/24 ≈ 64.94 ≤ 256` ⇔ `256π⁸ ≈ 2.43·10⁶ ≤ 4⁸·24² ≈ 3.77·10⁷`; `1 ≤ 1` | equivalent to the native form by squaring (R06) |
| 6B (headline) | `n = 0, 4, 8` | zero lattice ✓; `D₄` has det `4`, not unimodular; `E₈` ✓; identical to the native statement | native (R06) |
| 6G (headline) | orbit chain; `SO` | `240·126·23040 = 696729600`; `SO(E₈)` would give `348364800` | native (R06) |
| B1 (seeded) | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]`; sublattice `⟨2e₁,e₂⟩ ≤ ℤ²` | `4B²−4AC`: `−12, 4, 8, −92` give `(c,Δ) = (2,−3), (2,1), (1,8), (2,−23)`; `x²+y² ↦ 4x²+y²`, content `1`, `det = 4 = 2²·1` | pass (identical on main) |
| B2 (seeded) | `Δ = 12`: `(1,0,−3)`, `(−1,0,3)`, `(3,0,−1)`; `Δ = −4`, `−23` | `𝔞_f = 𝔞_{f'} = 𝒪₁₂`; `3x²−y² ↦ (3,√3) = √3·𝒪`, `N(√3) = −3`, every unit has norm `+1` (`x²−3y² = −1` is impossible mod 3), so the narrow class is nontrivial; `h(−4) = 1`; `h(−23) = 3`: `(1,1,6)`, `(2,±1,3)` | mathematics pass; supplier name fails (R03) |
| B7 (seeded) | `Δ = 25`; `Δ = −3`; `U` | old base `4` vs actual `2`; `T(ℝ) = S¹` with volume `2π` or `1`, both allowed by the head; main: `|dθ|`, `2π`, `w = 6` | head fails (R04); main pass |
| Single carrier (seeded) | `A₁`; `ℤe` with `B = 1/2` | `le_dual`: `½ℤe ⊇ ℤe` ⇔ `2 ∈ ℤ`; `2ℤe ⊉ ℤe` ⇔ `½ ∉ ℤ` | content equivalent; display wrong (R07) |
| Associated form over `ℤ` (seeded) | `R = N = ℤ` | `2` is not a unit in `ℤ`, so no `Invertible 2` instance; hypotheses at Mathlib `Basic.lean:953, 1159`, `TensorProduct.lean:40` | pass |
| Signature and degeneracy (seeded) | affine `Ã₁` Gram `[[2,−2],[−2,2]]` | eigenvalues `4, 0`: `(t₊,t₀,t₋) = (1,1,0)`, sum `2` = rank | pass |
| Definiteness (seeded) | `E₈(−1)`; `x²+y²−3z²`; `Ã₁ ⊕ ⟨−1⟩` | `NegDef` ⇔ `PosDef(E₈)`; `(2,0,1)`; `(1,1,1)` is indefinite but degenerate, as the paragraph warns | pass |
| Genus symbols (seeded) and 3G Checks | `⟨1⟩, ⟨3⟩, ⟨5⟩, ⟨7⟩`; AGM | `(3∣2) = (5∣2) = −1`, `(7∣2) = +1`; `1+0 = 1`, `1+2 = 3`, `1+4 = 5` equal the oddities; type, sign and oddity as AGM lines 58–71; SPLAG's canonical form corrected at AGM lines 919–924 | pass; 3E locator R08 |
| Character of `ℚ/ℤ` (seeded) | `1/4`, `1/2` | `i`, `−1`; native `TauCeti.expCircle` | main pass; head duplicate (R05) |
| Theta conventions (seeded) | `E₈`; `A₂` | `(−i)⁴τ⁴ = τ⁴`, weight 4; `(det)^{−1/2} = 1/√3 = |A_L|^{−1/2}` | pass |
| Mass (seeded) | rank 0, rank 1, `ℤ²`, `E₈` | `1`; `1/2` (`O = {±1}`); `1/8`; `1/696729600` | pass (source waived) |
| Owned there / bridge / two things (seeded) | Theta Series on main | Layer 2 bridge and positive definite Milgram (6C) confirmed; the claim that 1I is this roadmap's is refuted at the pin | R06 |

**Headline theorems.** Main's docstring (lines 36–50) lists 1H, 1L, 1I, 2F, 2G, 4B, 4E, 4F, 5A, 5B/5G/5J, 6A, 6B, 6C, 6D, 6H, 6E, 6G, 7C, 7E and 9B. Each is stated. The unstatable ones (genus symbols, among others) are named at lines 62–70. R06 lists those already proved at the pin.

## Not verifiable

- Cox, *Primes of the form x² + ny²* (Wiley), Theorem 7.7, p. 137 (B2): no open copy. The statement matches the standard result.
- Cohen, *A Course in Computational Algebraic Number Theory*, §5.2 (B2): Springer, no open copy.
- Conway–Sloane, *SPLAG*, Chapter 15 §7 (genus symbols, 3E, 3G): Springer, no open copy. Its train-based canonical form is reported false by AGM p. 21; I did not read SPLAG itself.
- `conway-sloane-mass1988` (Mass, 7H): waived in the manifest.
- Nikulin (Izv. 1979), O'Meara, Milnor–Husemoller, Serre's *Course* and Cassels: books or paywalled. They are cited at seeded or touched targets only through statements I checked mathematically.

## Source issues

- none
