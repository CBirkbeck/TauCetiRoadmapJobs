# Review of ClassFieldTheory (pull request #1411 at 46e4ab9)

**Verdict:** needs changes

This is a full review: the folder changed by 391 lines since `cded4a2`. Of the previous review's five findings, four are repaired. The fifth, the gate's `outside-folder` failure, is unchanged and is restated here as R01. The full pass found three new defects, all P3: an overstated claim about what Layer 5's open target supplies, one library misattribution, and one undefined symbol. The gate still fails, so the folder cannot be accepted.

## R01 (P3) — The gate still fails `outside-folder` on `Completed/LocalGaloisGroups/Suggested.lean`

This is the previous review's R02, still failing.

**Location:** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`, the two changed lines.
- Line 326 is now `⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩`.
- Line 485 is now `⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`.

**Claim:**
- The pull request edits a completed roadmap's certificate outside the folders this review counts as the pull request's own.
- The edit is forced and correct. Main's `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` were `sorry`'d `Nonempty` theorems; here they are Tau Ceti's canonical equivalences. Restoring the `Nonempty` forms would break README line 571.
- No edit inside `TauCetiRoadmap/ClassFieldTheory/` clears the check.

**Witness:**
- My gate run: `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=3 source-material=0 FAIL`.
- The three files it lists are this one and the pull request's own `TauCetiRoadmap/IntegralLattices/Suggested.lean` and `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`.
- The worker's run reports `outside-folder=1`, this file alone.

**Repair:** Keep the two lines; nothing in this folder can clear the check. A maintainer has to approve the `Completed/LocalGaloisGroups` change as a certificate update forced by a supplier, or the worker has to record that folder as one of this pull request's own. Then the gate passes on this file.

## R02 (P3) — Layer 5 overstates what `algebraMap_vle_algebraMap_iff_of_finite_padic` supplies: Tau Ceti's local duality does not assume it

**Location:**
- `README.md:1101–1103`: "Tau Ceti states local duality, the Euler characteristic and the cyclotomic normalization for `F` whose valuation extends that of `ℚ_p` (`ValuativeExtension ℚ_[p] F`…)".
- `Suggested.lean:508–510`, the same statement: "the compatibility `ValuativeExtension ℚ_[p] F` that Tau Ceti's local duality, Euler characteristic and cyclotomic normalization assume".

**Claim:**
- At the pin, only the Euler characteristic and the cyclotomic normalization take `ValuativeExtension ℚ_[p] F`:
  - the Euler characteristic through `[FinitePadicExtension F p]`, whose third field is `ValuativeExtension` (`LocalField/AbsoluteRamificationIndex.lean:64–71`);
  - the cyclotomic normalization through `localCyclotomicCharacter_artinMap_unit`.
- Perfect local duality and `finite_H` need only `CharZero F`.
- The README's own *How to read the build* (lines 561–563) already says this: only `eulerCharacteristic_finrank_fp` and `cyclotomicCharacter_artinMap` take the hypothesis from the open target. The sampled paragraph and the docstring contradict it.

**Witness:**
- Tau Ceti `Local/Duality/Perfect.lean:280`: `tateDualityPairing_perfect_mixed (F) [Field F] [CharZero F] [ValuativeRel F] … [IsNonarchimedeanLocalField F]`, with no `ℚ_p`-algebra and no `ValuativeExtension`.
- This file's closed alias (`Suggested.lean:539–551`) supplies only `CharZero F`.

**Repair:**
- In `README.md:1101–1103`, write: "Tau Ceti states the Euler characteristic, through `FinitePadicExtension`, and the cyclotomic normalization for `F` whose valuation extends that of `ℚ_p` (`ValuativeExtension ℚ_[p] F`). Its local duality and `finite_H` need only `CharZero F`."
- In `Suggested.lean:509`, delete "local duality, ".
- Tested: the corrected sentence matches the three pinned signatures. In this file, only the two named aliases mention the open target.

## R03 (P3) — The principal ideal theorem's *Needs* line attributes `MonoidHom.transfer_commutator_eq_one` to Mathlib; it is Tau Ceti's

**Location:** `README.md:2164–2165`: "(`Formation/PrincipalIdeal.lean`, through Mathlib's `MonoidHom.transfer_commutator_eq_one`)".

**Claim:** Mathlib at the pin has no declaration of that name. The theorem, Furtwängler's group-theoretic principal ideal theorem, is Tau Ceti's. Tau Ceti's `PrincipalIdeal.lean` imports it from Tau Ceti.

**Witness:**
- Tau Ceti `GroupTheory/Transfer/Commutator.lean:303`: `theorem MonoidHom.transfer_commutator_eq_one … : ϕ.transfer = 1`.
- `PrincipalIdeal.lean:9` reads `import TauCeti.GroupTheory.Transfer.Commutator`.
- `grep -rl transfer_commutator_eq_one` over the pinned Mathlib returns 0 files.

**Repair:** Replace "through Mathlib's `MonoidHom.transfer_commutator_eq_one`" with "through Tau Ceti's `MonoidHom.transfer_commutator_eq_one` (`GroupTheory/Transfer/Commutator.lean`)". Tested: `#check @MonoidHom.transfer_commutator_eq_one` elaborates with `import TauCeti.GroupTheory.Transfer.Commutator`.

## R04 (P3) — The Kummer-layer degree `p^{|S|+r}` in Layer 12 uses an undefined `r`

**Location:** `README.md:2080–2082`: "for a finite set `S` of primes containing those above `p` and generating the class group, the Kummer layer `kummerLayer p` of the `S`-units, cutting out `K(U(S)^{1/p})`, abelian of degree `p^{|S|+r}`".

**Claim:**
- `r` is defined nowhere in the README.
- The formula is right only when `r = r₁ + r₂` is the number of archimedean places and `S` consists of finite primes, which is Tau Ceti's convention (`GlobalExistence/Kummer.lean`: "`S` a finite set of finite places").
- The cited source, Milne VII Lemma 9.3 (p. 224), puts the infinite primes into `S` and gets `p^{|S|}`.
- Reading `r` as the number of real places, a common use of the letter, gives a wrong degree.

**Witness:** Take `K = ℚ(ζ_3)`, `p = 3`, `S = {(1 − ζ_3)}`.
- Then `U(S) = μ_6 × (1 − ζ_3)^ℤ` and `#U(S)/U(S)³ = 3 · 3 = 9`.
- With `r = r₁ + r₂ = 1`, `3^{|S|+r} = 9`, which is correct.
- With `r = r₁ = 0`, the formula gives `3`.

**Repair:** After `p^{|S|+r}`, add: ", where `r = r₁ + r₂` is the number of archimedean places of `K` (Milne VII, Lemma 9.3, p. 224, counts them in `S`)". Tested: at `ℚ(ζ_3)`, `3^{1+1} = 9 = #U(S)/U(S)³`.

## Previous findings

- **R01 (F. K. Schmidt's theorem unowned): repaired, by a different route.**
  - `README.md:1111–1125` now proves the comparison from Hensel's lemma and discreteness: "(i) … Hensel's lemma for `Xⁿ − x` at `1` … (iii) `p = 1 + (p − 1)` …".
  - It names Schmidt's theorem only as background.
  - The new *Needs* line at `README.md:1127–1132` lists only pinned declarations, all checked below.
  - I checked each step (adversarial table, first row). The route uses no input that nothing owns.
- **R02 (`outside-folder`): not repaired.** It cannot be repaired in this folder; this report's R01.
- **R03 (Layer 0 item 4): repaired.**
  - `README.md:641` reads "4. **The Tate–Nakayama theorem**", and item 5 is now the primary-component statement.
  - On main, Layer 0's item 4 (main `README.md:656–669`) is the one item that contains Tate–Nakayama, so #999's citation "ClassFieldTheory §2.4 and Layer 0 item 4 give the Tate–Nakayama theorem" still resolves.
- **R04 (Layer 13 *Needs*): repaired.**
  - `README.md:2162–2174` and `2194–2212` give *Needs* lines naming every input, and say which two steps each target proves itself.
  - The Milne locators V 3.17/3.19 and V 3.27/3.28 are added.
  - One attribution in the new text is wrong (this report's R03).
- **R05 (catalogue of names): repaired.**
  - The catalogue is gone from `Suggested.lean` (the diff removes 54 lines at 153–206).
  - The README now writes these names fully qualified (for example `TauCeti.unramifiedCoordinate_mk` and `TauCeti.ClassFieldTheory.kummerCupPairing_bil_comm`) or in prose ("the Artin map of a layer whose top and ground subgroups agree is zero").
  - The gate reports `readme-ids-missing=0`, and all 28 qualified names resolve (below).

## Verified sound

**Gate** (my run on 46e4ab9): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=3 source-material=0 FAIL`. The failure is R01; the worker's run also reports `build=0`.

**Dependency check** (`--movable`):

```text
depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every roadmap supplier is on main: ProfiniteCohomology, RepresentationTheory/ModularInduction, and the completed LocalFieldsRamification, GlobalNumberFields, NumberFieldArithmetic and ProfiniteProPGroups.

**Elaboration and signatures:**
- `lake env lean` on `Suggested.lean` exits 0. The only warnings are six `sorry`s, at lines 511, 687, 700, 749, 896 and 906.
- I compared the elaborated types of all 72 declarations (the worker's `#check @` transcript) with the README statements.
  - The two flagged as losing binders are `restrictAbsolute` and `absoluteGaloisGroupExtend`. They are Galois-theoretic maps and correctly drop the local-field binders.
  - The open targets carry exactly the README's hypotheses: `ValuativeExtension K L`, `Module.Finite`, `IsAbelianGalois`, `NumberField`.
- A second scratch file ran `#check @` on 47 names the repairs touched. There were 0 errors besides one deliberately wrong control name.
- Every declaration has a docstring. There are no `lemma`, `set_option`, `#eval` or `True` placeholders.

**Padding probe:** on scratch copies of the file, `first | rfl | simp | infer_instance | decide | norm_num | aesop` leaves all six open targets unsolved. `exact?` fails on five and hits the heartbeat limit on `sup_norm_unitFiltration_eq_of_upper_eq_top`.

**Aliases, considered and not raised as padding:** the closed aliases are re-exports that four Lean files on main import by name: `Completed/LocalGaloisGroups`, `GlobalQuadraticForms`, `QuadraticFormInvariants` and `IntegralLattices`. Each name they use exists here.

**Headline theorems:**
- The open headline theorems at the pin are the six `sorry` targets, all stated.
- The other items of *Scope and ownership* are proved in Tau Ceti at the pin, and the docstring inventory names each one.

**Seeded sample** (statement, number, page, hypotheses):

| Target | Checked against | Result |
|---|---|---|
| "Implemented in Tau Ceti", Layer 1 | the nine named files exist under `Formation/` (`Basic`, `Restriction`, `Refinement`, `Corestriction`, `Conjugation`, `GroundNorm`, `GaloisMaps`, `AbelianLayer`, `Tate/`); `NormalLayer` `Basic.lean:235`, `subgroupLayer` `Restriction.lean:551`, `IsAbelianClassFieldLayer` `AbelianLayer.lean:80`, `maximalAbelianLayer` `:130`, `cohomologyInfl_trans` `Refinement.lean:352`, and 40 more names | sound |
| "Implemented in Tau Ceti", Layer 2 | `ClassFormation.lean`: `natCard_H2:125`, `existsUnique_inv_eq:131`, `fundamentalClass:138`, `fundamentalClass_generates:155`, `fundamentalClass_restrict:215`, `inv_cor:256`, `fundamentalClass_cor:267`, `h1_subgroupLayer:280`, `card_H2_subgroupLayer:285`, `fundamentalClass_restrict_generates:291` | sound |
| Exit criteria, Layers 0, 1, 2 | `tateIso` `Tate/Theorem.lean:168`, `nakayamaNegTwo` and `artinEquiv` `ArtinMap.lean:126, 139`, `cupClass` `Tate/Cup.lean:36`; `TateH`/`TrivialTateH` `Basic.lean:517, 523`, `NormQuotient:654`, `cohomologyRes` `Restriction.lean:374`, `cohomologyCor` `Corestriction.lean:94`; the three Layer 2 hypotheses above | met at the pin |
| Exit criteria, Layers 5, 7, 8, 12, 13 | the open items of Layers 5, 7 and 13 are exactly the six `sorry`s. Layer 8: `localClassFieldCorrespondence`, `…PrimeToResidueCharacteristic`, `injective_artinMap`. Layer 12: `globalClassFieldCorrespondence`, `globalAbelianGaloisEquiv`, `globalClassField_index`. All are found under `TauCeti/NumberTheory/ClassFieldTheory/` | sound |
| The Tate dual | `tateDual` = `ofDiscreteModule … (InternalHom G_F A.V μ_n)` (`Local/Duality/Basic.lean:97`); `tateDualEquiv:107`, `tateDualEquiv_ρ_apply:144`, `isSmoothDiscrete_tateDual:159`, `tateDual_ρ_eq_self_iff:170`, `tateEvaluationPairing_bil:235`, `tateDualMap:296`, `tateDualMap_exact:363`, `tateDualityPairing_tateDualMap:452`; `muNRepToTateDual`, `bijective_muNRepToTateDual`, `tateDualityPairing_muNRepToTateDual` (`RootsOfUnity.lean:61, 72, 120`); `InternalHom.evalPairing` (`Topology/Algebra/GroupAction/InternalHom/Basic.lean:350`) | sound |
| Smoothness | `IsSmoothDiscrete` has the two fields "discrete" and "open point stabilizers" (`SmoothDiscrete/Basic.lean:259–264`); Mathlib's `ContRepresentation` is `G →* V →L[R] V` (`RepresentationTheory/Continuous/Basic.lean:55`), so it gives no joint continuity, as the README says; `isSmoothDiscrete_muNRep` `MuNRep.lean:176`, `isSmoothDiscrete_trivialFp` `TrivialFp.lean:129` | sound |
| The `p`-adic valuation on a finite extension of `ℚ_p` | proof route below; `jahnke-koenigsmann` line 113 is Theorem 2.1, on p. 3 (page marker at line 96), Schmidt's theorem exactly as described; pinned inputs `hensels_lemma` (`Padics/Hensel.lean:460`), `ValuativeRel ℚ_[p] := .ofValuation mulValuation` (`Padics/ValuativeRel.lean:34`), `IsNonarchimedeanLocalField … extends … ValuativeRel.IsNontrivial K` (`LocalField/Basic.lean:46–50`), `valueGroupWithZeroIsoInt` (`:117`), `Algebra.IsAlgebraic.of_finite` (`Algebraic/Integral.lean:108`) | route sound; first sentence R02 |
| The cyclotomic normalization | `localCyclotomicCharacter_artinMap_padic_uniformizer` `Local/Cyclotomic.lean:364`; `…_padic` and `…_unit` `ExplicitCyclotomicSymbol/ArtinMap.lean:294, 311`, the latter with `[FiniteDimensional ℚ_[p] F] [ValuativeExtension ℚ_[p] F]` and `hu`; `milne-cft` line 10059, VII Example 8.2, p. 221 (page marker at line 10030) | sound |
| Conductors | `conductorExponent`, `conductorIdeal`, `characterConductorExp` (`Conductor/Basic.lean:89, 94, 184`); `conductorExponent_eq_zero_iff:160`; `exists_unitFiltration_le_ker` for `Kˣ →ₜ* ℂˣ` (`:176`); `conductorExponent_le_iff_upperRamificationGroup_eq_bot` and `conductorExponent_fixedField_ker` (`Conductor/UpperNumbering.lean:121, 130`), the latter stating `c(L^{ker χ}/K) = f(χ)` | sound |
| Global Herbrand quotients and fixed points | `milne-cft` Prop 2.7 (line 9379, p. 206), Prop 3.1 (line 9470, p. 208), Lemmas 4.1–4.2 (lines 9574, 9583, p. 210), Thm 4.3 (line 9603, p. 211); the hypotheses (cyclic `G`, `S` containing the archimedean and ramified places, `S` generating `Cl`) match | sound |
| The conductor–discriminant formula | `milne-cft` V Thm 3.27 (line 7423) and Remark 3.28 (line 7436), p. 165 (page marker at line 7404): `disc(L/K) = ∏_χ f₀(χ)`, `f(χ) = f(L^{ker χ}/K)`, finite abelian `L/K` of number fields, which is exactly the Lean form; `relDiscr_def` (`DedekindDomain/Discriminant/Basic.lean:39`) | sound |

The README flags no locator as unverified.

Other locators checked in `milne-cft`:
- V Thm 3.17 (line 7252, p. 161) and Thm 3.19 (line 7323, p. 163);
- I Prop 4.4 and the definition after it (lines 2410–2419, p. 46);
- VII Lemmas 9.1–9.4 and Thm 9.5 (lines 10189–10287, pp. 223–226; Lemma 9.3 at line 10218, p. 224).

**Proof route of `algebraMap_vle_algebraMap_iff_of_finite_padic`, checked step by step:**
1. **Hensel.** `|f(1)| = |1 − x|_p ≤ 1/p < 1 = |f′(1)|² = |n|²` for `f = Xⁿ − x`.
2. **Infinite cyclic value group.** An integer divisible by infinitely many `n` is `0`.
3. **Units.** `y^(p−1) ∈ 1 + pℤ_p`, and `ℤ` is torsion-free.
4. **`u(p) ≤ 1`.** `u(p) ≤ max(u(1), u(p−1)) = 1`.
5. **Algebraicity.** If `w(z) > 1`, the leading term of the minimal polynomial dominates. If `w(z) < 1`, the nonzero constant term dominates. Either way the sum cannot vanish.
6. **Conclusion.** `u(a) = u(p)^{v_p(a)}` with `u(p) < 1`. Equality at `a = 0` holds on both sides.

No continuity of `ℚ_p → F` is used. The comparison is not already at the pins: Tau Ceti's `ValuativeExtension.of_continuous_algebraMap` (`ValuativeRel/ContinuousRingHom.lean:174`) needs continuity.

**Adversarial table** (values computed for this head):

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `algebraMap_vle_algebraMap_iff_of_finite_padic` | `ℚ_2(i)`, `a = 2`, `b = 1`; `ℚ_p(√p)`; `a = 0`; trivial relation on `F`; 3-adic extension to `ℚ_5`; Hensel at `p = 2`, `n = 3`, `x = 5` | normalized `v_F(2) = 2` against `v_2(2) = 1`, both relations `2 <ᵥ 1`; `v_F(p) = 2 > 0`, both `p <ᵥ 1`; `0 ≤ᵥ b` on both sides; trivial `F`: `1 ≤ᵥ p` holds in `F` but `|1| = 1 > 1/p` in `ℚ_p`, excluded by `IsNontrivial`; `u(6) = u(3) < 1` although `6 = 1 + 5` is an `n`-th power for every `5 ∤ n`, excluded by `valueGroupWithZeroIsoInt`; `|1 − 5|_2 = 1/4 < 1 = |3|_2²` | sound |
| `map_unitFiltration_normResidue` | `ℚ_p(ζ_p)`, `n = 0, 1`; `ℚ_2(√2)`, `n = 2, 3`; `𝔽_p((t))`, `y^p − y = t⁻¹`, `n = 1, 2`; `K = L`; unramified, `n = 0` | image of order `p − 1 = #G^0`, then `1 = G^1`; `(5,2)_2 = (−1)^{(25−1)/8} = −1`, so the image is `G = G^2`, and `1 + 8ℤ_2 = ℤ_2ˣ²` consists of norms, so `1 = G^3`; `G` then `1`, with break 1; `1 = 1`; units are norms, so `1 = G_0` | sound |
| proof sketch of unit-filtration reciprocity | `H = G^n`, `M = L^H`, `s = ψ_{M/K}(n)` | `H_{ψ_{L/K}(n)} = H`, and `φ_{L/M}∘ψ_{L/K} = ψ_{M/K}` gives `H^s = H`; `(G/H)^n = G^nH/H = 1`; `s ∈ ℤ` by Hasse–Arf (in *Needs*); upper groups of `L/K` and `L/L_0` agree for `u ≥ 0`, since `φ` agrees on `[0, ∞)` | sound |
| `closure_map_artinMap_unitFiltration` | `n = 0` at an unramified quotient; `ℚ_2`, `n = 0` against `n = 1` | both images trivial; `U^0 = U^1` over `𝔽_2` and `G_0/G_1 ↪ 𝔽_2ˣ = 1`, so the two images agree | sound |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` | `K = L`; tame, `r = 0`; `ℚ_2(√2)`, `r = 2, 3`; unramified quadratic | `N(U^0) = U^0`; tautology; `N(1+√2) = −1 ∉ 1 + 4ℤ_2` and `ℤ_2ˣ/U^2 = {±1}`, so equality; `G^3 = 1 ≠ G`, hypothesis false; `G^0 = 1 ≠ G`, hypothesis false | sound |
| `localAbsoluteUpperRamificationGroup` | `u = −1`; `u ∈ (−1, 0]` against the floor model; lower model at `ℚ_2(ζ_8) ⊃ ℚ_2(√2)`, depth 3 | `G_K`; trivial at the degree-`f` unramified level, where the floor model gives `ℤ/f`; `G_3 = {1,5}` and `σ_5(√2) = ζ_8⁵ + ζ_8³ = −√2`, but `Gal(ℚ_2(√2)/ℚ_2)_3 = 1`, so the lower model does not project | sound |
| `conductorExponent_eq_sInf_upperRamificationGroup` (closed) | unramified; `ℚ_5(ζ_5)`; `ℚ_2(√2)`; `ℚ_2(ζ_8)`; Artin–Schreier, break 1 | `0`; `1`; `1 + 2 = 3`; `1 + 2 = 3`, upper jumps `1, 2`; `2` | sound |
| `isPrincipal_map_hilbertClassField` | `ℚ(√−5)`, `I = (2, 1+√−5)`; `K = ℚ`; `I = ⊥` | `I² = (2)`, `H = K(i)`, `−i(1+i)² = −i·2i = 2`, so `I𝒪_H = (1+i)`; every ideal of `ℤ` is principal; `⊥` | sound |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(i)`; `ℚ(ζ_5)`; `ℚ(i,√5)`; `K = L` | `(4) = 1·4`; `5³ = 1·5·5·5`; `(−4)(5)(−20) = 400 = 1·4·5·20`; `(1) = (1)` | sound |
| conductor–discriminant *Needs* | characters of `D` extending to `G` | `#ker(Ĝ → D̂) = #(G/D) = g` (`CommGroup.card_domRestrictHom_ker`, `Duality.lean:133`), so `v_𝔭(∏ f(χ)) = g · Σ_{ψ ∈ D̂} f(ψ) = g · d_𝔭` | sound |
| `cyclicHasseNorm` | `ℚ(i)/ℚ`, `x = 3` and `x = 5`; `L = K`; `ℚ(√13,√17)`, `x = 25` | 3 is not a sum of two squares, and `v_3(3) = 1` is odd with 3 inert: both sides false; `5 = N(2+i)`: both sides true; both sides true; that extension is not cyclic, so `IsCyclic` excludes it | sound |
| `hilbertProductFormula` | `(−1,−1)`, `(5,5)`, `(3,7)` over `ℚ` | `1 + 1 = 0`; all invariants `0` (`ε(5) = 2`, `(−1/5) = 1`); `(3,7)_2 = −1` since `ε(3)ε(7) = 3` is odd, `(3/7) = −1`, `(7/3) = 1`, so `1 + 1 = 0` | sound |
| `card_ideleClassNormQuotient` | `ℚ(i)/ℚ`; `L = K` | `2 = 2`; `1 = 1` | sound |
| `scd_p_absoluteGaloisGroup_eq_two` | `ℓ = p` and `ℓ ≠ p`; `𝔽_p((t))` | `2`, `2`; there `cd_p = 1`, excluded by `[Algebra ℚ_[p] K]` | sound |
| `eulerCharacteristic_finrank_fp` | `ℚ_2`, `𝔽_2`; `ℚ_p` (`p` odd), `𝔽_p`; `ℚ_3(ζ_3)`, `𝔽_3` | `3 = 1+1+1`; `2 = 1+0+1`; `dim F^×/F^×³ = 2+1+1 = 4 = 1+1+2·1` | sound |
| `tateDualityPairing_perfect_mixed`, `finite_H` | `μ_3` over `ℚ_2`; the zero pairing | `H⁰ = 0`, `H⁰(M′) = 3`, `H²(M) = 3`, `H²(M′) = 1`, `H¹ = 3 = #ℚ_2ˣ/(ℚ_2ˣ)³`; excluded, since the pairing is the named evaluation pairing; the Tau Ceti signature takes `CharZero F` only (R02) | sound; R02 |
| `cyclotomicCharacter_artinMap` | `ℚ_2`, `u = −1`; `u = −3` on `μ_16`; `F = ℚ_2(i)`, `u = i` | `i ↦ −i`, `χ = −1 = u⁻¹`; `(−3)⁻¹ ≡ 5 mod 16`, against `13` without the inverse; `N(i) = 1` and `Art_F(i)` restricted to `ℚ_2^ab` is `Art(1)`, so `χ = 1` | sound |
| Layer 12 Kummer degree | `ℚ(ζ_3)`, `p = 3`, `S = {(1−ζ_3)}` | `#U(S)/U(S)³ = 9 = 3^{1+(r₁+r₂)}`; `3^{1+r₁} = 3` | R04 |
| Layer 13 principal ideal *Needs* | `C_4 ⊃ ⟨g²⟩`; Klein four, `H` of order 2 | transfer `g ↦ g²`, onto `H`; transfer `x ↦ x² = 1`, while the quotient map is nontrivial | sound; attribution R03 |
| Layers 2 and 3 examples | unramified degree 6, `E` of degree 2; `C₂` acting on `ℂˣ` | `2·(1/6) = 1/3`, of order `3 = [L:E]`; `cor` gives `1/2 = 3·(1/6)`; `H¹ = 0` and `#ℝˣ/ℝ_{>0} = 2 = #Ĥ⁻²(C₂,ℤ)` | sound |
| Layer 5 symbol and duality Checks | `ℚ_7`, `n = 3`; `ℚ_2`, `M = ℤ/3` with Frobenius `−1`; `ℚ_p` and `ℚ_2` with trivial `ℤ/p` | `7 ≡ 1 mod 3`, invariant `1/3`; `#H¹ = 1·3·1 = 3 = #ℚ_2ˣ/(ℚ_2ˣ)³`; `p² = p·1·p` and `8 = 2·2·2` | sound |
| Layer 6 Frobenius test | `ℚ_2(ζ_5)`; `K = ℚ_2`, `ζ = −1` | `2` has order 4 mod 5, so the extension is unramified of degree 4, `ζ_5 ↦ ζ_5²`, and geometric gives `ζ_5³` (`2⁻¹ ≡ 3`); the excluded formula gives `(−1)² = 1 ≠ −1` | sound |
| Layer 7 filtered-norm Checks | `ℚ_2(√2)`, `ψ(3)`; `ℚ_2(∛2, ζ_3)` | `φ(u) = 2 + (u−2)/2` for `u ≥ 2`, so `ψ(3) = 4`; `e = 3`, `f = 2`, `φ(u) = u/3`, so `ψ(1) = 3` and `G^1 = G_3 = 1` | sound |
| Layer 10 lifting obstruction | `ℚ(√13,√17)`; `ℚ(√2,√3)` | `(17/13) = (4/13) = 1`, `13 ≡ 5 mod 8` (2 inert), `17 ≡ 1 mod 8` (2 split), lcm `2 < 4`; `2, 3, 6 ∉ ℚ_2ˣ²`, local degree `4` | sound |
| Layer 11 Artin symbols | `ℚ(√5)`, `ℓ = 11, 7`; `ℚ(ζ_5)`, `ℓ = 2, 11` | `11 ≡ 1 mod 5` gives `1`, `7 ≡ 2` gives `τ`; `ζ ↦ ζ²` of order 4, `ζ^{11} = ζ` | sound |
| Layer 13 Checks | `ℚ(√3)`; `ℚ(ζ_7+ζ_7⁻¹)` | `N(2+√3) = 1`, `h = 1`, `h⁺ = 2`; `(3!/3³)·√49 = 14/9 < 2` | sound |
| Layer 8 examples | `ℚ_2`, `U^1⟨2⟩`; `ℚ_p(ζ_p)` | `U^0 = U^1`, so the subgroup is all of `Kˣ`, conductor `0`; `N(1−ζ_p) = Φ_p(1) = p`, index `p − 1`, conductor `1` | sound |

**Library declarations opened at the pin:**
- Tau Ceti:
  - `FinitePadicExtension` (`AbsoluteRamificationIndex.lean:64–71`);
  - `tateDualityPairing_perfect_mixed` (`Duality/Perfect.lean:280`);
  - `eulerCharacteristic_mixed`/`_finrank_fp` (`EulerCharacteristic/Theorem.lean:98, 110`, section variable `[FinitePadicExtension F p]` at line 40);
  - `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`);
  - `RamificationIndexDomain` (`RamificationGroup.lean:86`);
  - `CompactSpace (Field.absoluteGaloisGroup K)` (`AbsoluteGaloisGroup/Basic.lean:374`);
  - `AlgHom.valuativeExtension` (`AlgebraicExtension/Basic.lean:314`);
  - `globalNormSubgroup_kummerLayer_sUnits` (`GlobalExistence/Kummer.lean`);
  - `hilbertClassArtinEquiv`, `gal_hilbertClassField_equiv_classGroup`, `fieldRange_le_hilbertClassField_iff` (`RayClassField.lean:262, 293, 362`);
  - `groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`PrincipalIdeal.lean:67`);
  - `discriminantIdeal` (`LocalField/Discriminant/Basic.lean:93`);
  - `finsum_artinConductorExponent_eq_discriminantExponent` (`Discriminant/Conductor.lean:58`);
  - `isAdmissibleModulus_iff_abelianConductor_dvd` (`AdmissibleModulus/Basic.lean:200`);
  - `IsAdmissibleModulus.conductorExponent_le_exponent` (`AdmissibleModulus/Ramification.lean:116`);
  - `globalArtinMap_local`, `globalArtinMap_ideal` (`LocalArtin/Compatibility.lean:179`, `Frobenius.lean:170`).
- The 28 names the README now writes fully qualified, each by file and line, among them:
  - `TauCeti.unramifiedCoordinate_mk` (`Unramified/Coordinate.lean:88`);
  - `TauCeti.ClassFieldTheory.kummerClass_mul` (`MuNRep.lean:313`);
  - `localArtinMap_quadratic_eq_nontrivial_iff_not_norm` (`Local/Quadratic.lean:57`);
  - `artinMap_congr` (`Local/ArtinMap.lean:397`);
  - `unramifiedCoordinate_weilDegree` (`WeilGroup/Basic.lean:271`).
- Mathlib:
  - `MonoidHom.domRestrict_surjective` and `CommGroup.card_domRestrictHom_ker` (`GroupTheory/FiniteAbelian/Duality.lean:107, 133`);
  - `IsGalois.normalBasis`/`_apply` (`Galois/NormalBasis.lean:121, 128`);
  - `InfiniteGalois.restrictNormalHom_continuous` (`Galois/Profinite.lean:148`);
  - `AlgEquiv.restrictNormalHom_surjective` (`Normal/Basic.lean:233`);
  - every other name the README attributes to Mathlib except R03's.

**Cross-roadmap citations resolved:**
- On main:
  - ProfiniteCohomology Layers 1, 4, 5, 10, 11, 12, including the three `citations.md` leads `cd_p_le_of_isClosed` and `cd_p_le_scd_p` (ProfiniteCohomology `README.md:234, 1839, 1861`) and `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` (`:1876`);
  - ProfiniteProPGroups `cd_p_eq_of_isProPSylow` and `cd_p_le_iff_elementaryAbelian_of_isProP` (`README.md:94, 1266`);
  - RepresentationTheory/ModularInduction Layers 0, 1, 3, 4.
- At open heads:
  - #1410 `8917bb8`, lines 123–131: Layer 7 owns the local-field absolute upper filtration, and §4a.1 proves agreement with it.
  - #1474 `b6f153b`, lines 1119–1122 and 1255–1277: consumes `map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration`.
  - #940 `32476ef`, lines 33 and 119.
  - #1252, "ClassFieldTheory §4 Layer 9": its names (`WeilGroup`, `weilTransfer`, `index_range_weilTransfer`, `weilDegree`, `surjective_weilDegree`) are all in Layer 9.
  - #999 line 209: resolves (previous R03).
  - #1692 line 26 and #1484 lines 44 and 240: §2.5/§2.6, mapped by README lines 192–197.
- One citation does not resolve, and the cause is #1306's: its "ClassFieldTheory §§8–11" (IntegralIwasawaTheory `README.md:134`) names sections that do not exist on main either. This pull request does not drop them.

**Overlaps:**
- #617 and #1215 revise this roadmap and conflict with this head. The description states the rebase rule.
- #1215 declares the same `localAbsoluteUpperRamificationGroup`, in its revision of this same file. That is a rebase matter, not a second owner.
- #1187's LocalFieldsRamification and LocalGaloisGroups consume `normResidue` from here and own neither unit-filtration reciprocity nor the absolute filtration.
- No open roadmap states the `ℚ_p` valuation comparison, apart from #617's revision of this file.
- Ownership was checked against the listed sibling heads and with `roadmaps grep`.

**Remark, owned by the IntegralLattices review:** `git merge-tree` against main still reports a conflict in `TauCetiRoadmap/IntegralLattices/Suggested.lean`. This folder merges cleanly.

## Not verifiable

None of these texts is held in the sources cache; the manifest records the status of each one in it.

- `serre-local-fields` (uncertified): XV §2, Theorem 2 and Corollary 3 to Theorem 1; V §§3, 6; VI §3; IX §§3–5; IV §4. Checked here by computation only (table above).
- `neukirch-ant` (uncertified): VII §11.
- `nsw` (uncertified): (3.3.4), (7.1.8), (7.2.5), (7.2.6), and (7.3.1)–(7.3.4).
- `artin-tate` (waived): XIII §4, XIV §§1–6, XV.
- Not in the manifest or the cache:
  - Tate 1952 and Nakayama 1957;
  - Rim 1959, Brown VI §8 and Lang III 7.1;
  - Cox §7 and Theorem 9.18;
  - Tate's Corvallis article and Weil 1951;
  - Serre's *Galois Cohomology* and *A Course in Arithmetic* III;
  - Cassels–Fröhlich.

## Source issues

- none
