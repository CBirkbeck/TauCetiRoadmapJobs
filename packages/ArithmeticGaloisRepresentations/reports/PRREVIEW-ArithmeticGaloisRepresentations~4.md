# Review of ArithmeticGaloisRepresentations (pull request #856 at 53b7d06)

**Verdict:** needs changes

This is a full re-review of the repaired head. Status of the previous review's findings, checked passage by passage:

| Previous | Status at 53b7d06 |
| --- | --- |
| R01 (perfect-residue ramification unsupplied) | Repaired by ownership: §3.0 now states the theory here (`README.md:2491`). The new section duplicates an earlier supplier; see R01 below. |
| R02 (unit-filtration reciprocity unsupplied) | Repaired by ownership: §3.2 now states it (`README.md:2660`). Same duplication; see R01 below. |
| R03 (six Weil–Deligne contracts absent) | Repaired: at the SmoothRepresentationsOfLocalGroups head the anchors `wd-linear-substrate` … `wd-frobenius-semisimplification` are at its `README.md:4409–4556` and `classical-llc-normalization` at `:4585`. |
| R04 (LFunctions is a later supplier) | Not repaired; the dependency check still reports it. See R02 below. |
| R05 (kernel-field Check needs open kernel) | Repaired: `README.md:1623–1627` now requires an open kernel and records the dense-kernel negative control. |
| R06 (second owner of the Hecke functional equation) | Not repaired: `README.md:2248` still restates the Layer 5 interface. See R03 below. |
| R07 (locators) | Repaired: §1.2 and §7.7 carry their own proofs (`:800–808`, `:4840–4848`), §1.12 names Clifford, Gaschütz and Mackey (`:1370–1377`), §4.3 cites Dickson pp. 272–279 and the proof of Newton–Thorne Lemma 5.7 (`:3013`, `:3050–3052`). |
| R08 (sixteen raw anchors) | Not repaired: the gate still reports `residue=16`. See R04 below. |
| R09 (Lean/README name sync) | Repaired: `pGenerated`, `symPowerImage`, `projectiveTopology` are named at `:4988`, `:5077`, `:4754`; *PolarizedRep* and *ResidualImage.GSp4.IsEnormous* are italic; the module is titled "target signatures" with layer comments. |

## R01 (P2) — §3.0 and the unit-filtration target re-plan what PadicPeriodRings already plans

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2491` ("### 3.0 Ramification over perfect residue fields") through `:2574`, and `:2660` ("**Unit-filtration reciprocity.**") through `:2690`; the ownership bullets at `:63–74` and the supplier contracts at `:381–393`, `:403–409`.

**Claim:** This roadmap owns the extension of lower/upper numbering, the different, Herbrand functions, Herbrand's theorem, the absolute upper filtration and the completed maximal-unramified comparison to complete discretely valued fields with arbitrary perfect residue field, and unit-filtration reciprocity at every depth for nonarchimedean local fields.

**Witness:** PadicPeriodRings, an earlier supplier (merge order position 9; this roadmap is 32), already plans both at its open head: §0.3 "General perfect-residue ramification — generalResidueRamification" (its `README.md:73–81`: no finiteness and no characteristic assumption, lower numbering on `TauCeti.IsLocalRing.ramificationGroupReal`, the different formula, Herbrand function and theorem, transitivity, the absolute upper filtration as an inverse limit with closedness, inertia and quotient compatibility, the `K̂^un` equivalence identifying `I_K` with `G_{K̂^un}` and preserving the filtrations and the different, and agreement with the pinned local-field API), and §1.3 "Unit-filtration reciprocity — unitFiltrationReciprocity" (its `README.md:125–129`: `U_F^n` onto `Gal(L/F)^n` for every `n ≥ 0`, the absolute form through `artinMap_restrict`, the same Serre V/XV route). PadicPeriodRings lists ArithmeticGaloisRepresentations among its consumers (its `README.md:10`). Two further open pull requests by the same author (the LocalFieldsRamification Layers 3a/4a amendment, number 1410, and the ClassFieldTheory Layer 7 amendment, number 1411) build the same objects, and the pull-request description still says this roadmap merges after them: four owners for one object.

**Repair:** Delete from §3.0 everything PadicPeriodRings §0.3 states (lower numbering and its structure, Hilbert's formula, Herbrand function, `H_s = G_s ∩ H`, Herbrand's theorem, the tower identity, the absolute upper filtration, the completed maximal-unramified comparison) and delete the unit-filtration reciprocity target of §3.2; add PadicPeriodRings §0.3 and §1.3 to the supplier contracts with their stated generality and repoint every *Needs:* line that names §3.0 or *Unit-filtration reciprocity* (`:2591`, `:2641`, `:2706`, `:2719`, `:2812`, `:2837`). Keep as this roadmap's own only what §0.3 does not state, each saying in one clause how it extends §0.3: the Hasse–Arf theorem for abelian extensions over every perfect residue field (PadicPeriodRings' §2 *senUpperBreaks* proves it only for `ℤ_p`-extensions of `p`-adic fields, and its §1.3 cites the local-field Hasse–Arf), `G_K^{0+} = P_K`, and the finite-separable transition functions `ψ_{L/K}` with the intersection and integral formulas. Settle the two amendment pull requests so that one owner remains, and update the Lean module docstring (`Suggested.lean:25–29`). Test on the repaired text: the `F̄_p((t))` Artin–Schreier Check (`e = p`, `d = 2(p − 1)`, `ψ(u) = pu − p + 1`) instantiates through §0.3 because that section imposes no finiteness on `k`, and the `ℚ₂(√2)` Check (`U²` onto, `U³` trivial, conductor 3) instantiates through §1.3 because it covers every nonarchimedean local field.

## R02 (P2) — LFunctions is still a later supplier and the roadmap cannot be moved past it

Re-raised: R04 of the previous review (it was never marked not actionable).

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:548`, `:553–562`, `:600`, `:635–638`, `:2213–2233`, `:2248–2260`, `:2299–2312`, `:2468`.

**Claim:** LFunctions Layers 0, 5 and 6 supply the Hecke continuation, completions and functional equations consumed by §2.7.

**Witness:** The prescribed dependency check on this head prints

```text
not movable: ArithmeticGaloisRepresentations consumes LFunctions (#268) and is consumed by EllipticLegendreCharacterInterfaces (#73), which comes first: moving ArithmeticGaloisRepresentations after LFunctions would put a supplier after a consumer, a cycle through ArithmeticGaloisRepresentations
UPWARD: ArithmeticGaloisRepresentations (#31) -> LFunctions (#268) at README lines [548, 2232, 2260, 2310, 2458]
depcheck: 201 roadmaps, 1325 edges, 1 problem(s)
```

**Repair:** Break the edge by moving ownership, not the order: keep the finite Gauss-sum definitions, the standard-test-function evaluations and the root-number product formula (arithmetic, no continuation needed) here, and move the targets that consume LFunctions' continuation and functional equation (the Hecke zeta-integral comparison at `:2211`, the finite-order Hecke functional equation at `:2248`, the LFunctions-dependent identifications at `:2299–2312`, and the Artin functional-equation half of Globalisation at `:2358–2364`) to the downstream owner that already states the Hecke equation (AutomorphicLFunctionsAndLocalFactors AL.1) or to a Part II; delete LFunctions from the supplier contracts and the Layer 2 dependencies. Rerun the check: it must print no UPWARD line. The odd character modulo 4 keeps conductor 4, one real gamma shift and root number 1 in the finite-sum formula, which needs no continuation.

## R03 (P2) — The finite-order Hecke functional equation still has a second owner

Re-raised: R06 of the previous review.

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2248`: "Restate LFunctions Layer 5's primitive interface as *finiteOrderHeckeFunctionalEquation*".

**Claim:** A named target of this roadmap carries the primitive completion, continuation and `Λ(χ,s) = W(χ)Λ(χ⁻¹,1−s)`.

**Witness:** The target describes itself as a restatement; LFunctions' open head already states the primitive conductor, parity-dependent gamma shift, Gauss-sum root number, continuation and functional equation of finite-order Hecke characters (its `README.md:863` and the Layer 5 interface the target names).

**Repair:** Delete the target and cite the single supplier interface from the consumers (`:2312`, `:2359`, `:2370`), consistent with the resolution of R02. The trivial character keeps its two poles and the odd character modulo 4 its root number 1 on the supplier's statement.

## R04 (P3) — Sixteen raw anchors fail the text gate

Re-raised: R08 of the previous review.

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:945`, `:1162`, `:1456`, `:1489`, `:1511`, `:2062`, `:2149`, `:2210`, `:2246`, `:2270`, `:3727`, `:3763`, `:3823`, `:3980`, `:4005`, `:4036` (`<a id="…"></a>` lines).

**Witness:** The worker's gate on this head: `residue=16 … FAIL`; every other text counter is zero.

**Repair:** Replace each anchor by a Markdown heading for the named target and retarget the links in §§2.7, 6.1, 6.3 and Downstream consumers to the heading slugs. Rerun the gate; it must report `residue=0`.

## R05 (P3) — Four locators do not support the claims attached to them

**Location and claims:**

- `README.md:1092–1094`, §1.7 "Semisimplicity over a perfect field … fails for imperfect `k` (NT, §1.2, p. 7)". Witness: `nt26` lines 295–327 are the notation paragraph (Frobenius, coefficient fields, residual representation); it states nothing about semisimplicity under scalar extension. Repair: cite a text that proves it (Bourbaki, *Algèbre* VIII §13, or Curtis–Reiner §7) and keep the imperfect-field counterexample as a Check.
- `README.md:2716–2718`, §3.2 "Characters … `Sw(χ) = u(χ)`, `a(χ) = 1 + u(χ)` (Serre 1970, §2.1, p. 7)". Witness: `serre1970` lines 178–198 only record that for finite image the exponent equals Artin's conductor; the character formula is Serre 1961 (33), `serre1961` line 1327, printed p. 138. Repair: cite Serre 1961 n° 3.7 (33) or *Local Fields* VI §2.
- `README.md:2804–2807`, §3.4 "for `L/K` finite tame of ramification index `e` the positive breaks are multiplied by `e` … (same locator); and extension of the coefficient field preserves `Sw` and `a` (same page)". Witness: `serre1970` lines 185–188 (Remarque 1) cover unramified base change only. Repair: cite §3.0's tame transition `ψ_{L/K}(u) = eu` for the scaling and the break-decomposition target for coefficient extension.
- `README.md:3644–3646`, §5.13 "Milne, *Algebraic Geometry*, 2024, Chapter 11, Theorem 11.53, Corollary 11.54, Example 11.55 … pp. 37–38". Witness: the author's AG.pdf, version 6.10 of 11 November 2024, has no item 11.53; its Chapter 11 numbering ends near 11.45 (`milneag` line 9226). Repair: name the file and version that contains the cited theorem, or cite the Weil bound in Hartshorne V Ex. 1.10 / Milne's *Lectures on Étale Cohomology* with its number.

## R06 (P3) — The README describes `ResidualImage.IsAdequate` by the trace condition, the Lean declares the spanning form

**Location:** `README.md:4939–4944` ("`ResidualImage.IsAdequate` (`H¹(H, k) = 0`, `H⁰(H, ad⁰) = H¹(H, ad⁰) = 0`, and the trace condition)") against `Suggested.lean:367–372` (`Submodule.span k {X | ∃ h ∈ H, (minpoly k h).Separable ∧ X = h} = ⊤`).

**Claim:** The backticked name denotes the trace-condition predicate "in the proposed interface any subgroup".

**Witness:** The two forms agree only for finite `H` (the README's own equivalence at `:4949–4951` uses `e_{g,α}` as a polynomial in `g^{p^N}`); for `H = ⟨t⟩ ⊂ GL₁(F_p(t))` the spanning condition holds (`t` is semisimple and spans `M₁`) while the README's predicate is tested through `H¹(H,k) ≠ 0`, so the clause that differs is the generality statement, not the finite theorems.

**Repair:** Say at `:4939` that the Lean declaration carries the semisimple-spanning form (the docstring already does), equivalent to the trace form for finite `H`, and likewise that `ResidualImage.IsEnormous` encodes "no `p`-power quotient" as `H¹(H,k) = 0` (equivalent for every group: `Hom(H,k) = 0` iff `H^{ab}/p = 0`).

## Verified sound

**Gate and build.** The worker's gate on this head: `residue=16`, `depcheck=1`, every other counter zero (`build=0`, `sorry-data=0`, `set_option=0`, `imports=0`, `outside-folder=0`, `stray-files=0`, `dirty=0`). Independently, `lake env lean` on `Suggested.lean` from the pinned checkout: exit 0 in 7 s, exactly 20 `declaration uses sorry` warnings, no other diagnostic. The file has 471 lines, one `import Mathlib`, five `TauCeti.*` modules whose object files exist at the pin, no `set_option`, no sorry'd data, no admitted example. No file outside the folder changed (`git diff --stat origin/main...HEAD` excluding the folder is empty).

**Signatures.** A scratch copy with `#check @name` for all 33 declarations elaborated (exit 0, the same 20 warnings). Every printed type keeps the binders its README statement needs: `CompactSpace`/`T2Space` on the descent theorems, `FiniteDimensional` and `IsModuleTopology` on the continuous carriers, `IsSemisimpleRepresentation` after base change in the recognition theorem, `IsNonarchimedeanLocalField` with `ℓ.Coprime (ringChar 𝓀[K])` in the monodromy theorem, `IsAdicComplete`/`Finite (ResidueField R)` plus the adic-neighbourhood hypothesis in Carayol, `IsCompact` on the Frattini theorem, `HasMultiplicativeReduction 𝒪[K]` (which extends `IsMinimal`) with `p ≠ ringChar 𝓀[K]` on the multiplicative criterion, `Finite H`/`Finite k`/`Nonempty n` on the image theorems, and the quotient topology passed explicitly to the projective lift. No binder was lost; the signatures are unchanged from the previous head apart from reordering.

**Padding probe.** A scratch copy with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | exact?`: all 20 theorems fail (18 `exact?` failures, 2 heartbeat timeouts at `realizable_of_charpoly_mem` and `conj_into_of_trace_mem_of_distinct_eigenvalues`, which are not closures). No declaration restates a definition, mirrors a Check or computes a value; the five kept definitions (`matrixRep`, `adZeroRep`, `IsAdequate`, `IsEnormous`, `pGenerated`, `symPowerImage`, `projectiveTopology`, `traceField`, `imageAlgebra`, `IsComplexConjugation`, `toIntegralClosure`, `IsArithFrobAtIntegralPrime`, `frobeniusSet`) have real bodies on native carriers and are each used by a headline.

**Headline inventory.** The README's end theorems and the file: coefficient-field descent, integral descent, Brauer–Nesbitt, Grothendieck monodromy, odd absolute irreducibility, Dickson, Frobenius recognition, image-algebra central simplicity, the splitting criterion, finite-field realisation, distinct-eigenvalue descent, Carayol, Frattini openness, multiplicative residual unramifiedness, the adequacy criterion, tensor adequacy, rank-two enormous/adequate equivalence, enormous `SL_n`-containing and symmetric-power images, and projective lifting are stated. The docstring names the families not statable at the pins (full Weil–Deligne adapter, purity and local constants; perfect-residue conductors; abelian Tate adapters; function-field recognition; reductive integral models; polarised and Taylor–Wiles conditions) and says which carrier each lacks. No statable headline is absent and none is forced through a stand-in.

**Dependency check.** Output on this head is quoted in R02 (one problem). The six UPWARD lines of the previous round against roadmaps on main no longer appear (201 roadmaps, 1325 edges).

**Ownership.** Searched by object (`roadmaps grep`, main, the board's packages and the open heads listed in the brief) for the ramification theory over perfect residue fields, unit-filtration reciprocity, Weil–Deligne parameters, Hecke functional equations, joint continuity, determinants of projective modules, Tate modules, Clifford theory, projective lifting and the image conditions. Findings: PadicPeriodRings §0.3/§1.3 and the two amendment pull requests (R01); LFunctions Layer 5 (R03). The six Weil–Deligne targets of SmoothRepresentationsOfLocalGroups exist at that roadmap's open head. No other open head declares a fully qualified name of this file's namespace. Ownership against open pull requests whose files the brief does not give was not checked.

**Cross-roadmap citations resolved** (on main unless an open head is named): ClassFieldTheory `normResidue`, `artinMap_norm`, `artinMap_restrict`, `mem_inertiaSubgroup_of_mk_eq_artinMap`, `characterConductorExp`, `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`, `localWeilArtinEquiv`, `kroneckerWeber`, `sumLocalInv_eq_zero`, `eq_zero_of_localInv_eq_zero`, `isOpenEmbedding_inertiaToWeil`, `unramifiedCoordinate_weilDegree`, `weilDegree_weilTransfer` (all present; `map_unitFiltration` absent, consistent with the roadmap's text); LocalFieldsRamification scope "nonarchimedean local fields … unit filtrations" (`README.md:3`, `:20`, Layer 1 `unitFiltration` at `:269`, Layer 2 `IsUnramified` at `:561`); AlgebraicCurves Layers 6–8 ramification groups (`:812–820`, `:1272`); AdicSpacesPartIII R3.8 `projectiveTrace` (`:106`, `:340–349`); PivotalSpherical `leftTrace`/`rightTrace` (`:61`); EtaleCohomologyFoundations §F.0.A1 (`:284`), §F.0.2 (`:203`), §F.3a (`:776`), §F.4.0 (`:850`); PadicMeasuresIwasawaAlgebras §5.1 `projectiveDeterminant` (`:3172`, `:3196`); SchemeAndStackFoundations §0.14 `henselian_finiteEtale_equivalence` (`:1068`, `:1080`) and §5.11 (`:7273`); NumberFieldArithmetic §§5.9, 5.10, 6.3 (`:1687`, `:1714`, `:1798`); ProfiniteCohomology Layer 13 monomial homomorphism `G → Uˡ ⋊ 𝔖_l` (`:2349`); RepresentationTheory/LieHighestWeight Clebsch–Gordan (`:348`); ModularCurves 1C/1D (`:486`, `:563`); RestrictedPowerSeries §2.4 Strassmann (`:364–366`); CFSGStatement L1–L3 (`:489`, `:537`, `:626`) and CFSGBasicProperties T1–T2 (`:180`); Chebotarev `hasDirichletDensity_frobeniusPrimeSet`; ReductiveGroupsPartII `gl-building-lattice-chains`, `ReducedBuilding`, `bruhat-tits-fixed-point-theorem`, `building-field-extension-embedding`, `reductive-model`, `Building.exists_fixedPoint_of_bounded`, `Building.gl1_translation` (all present on main). At open heads: PadicLocalLanglandsForGL2Qp §0.3 `fundamentalCharacter`; AdelicAlgebraicGroups AA.2.4 `convergence-factors`; AbelianSchemesAndArithmeticModuli A1.6, A3.5, A4.1 `AbelianTate`, A6.12; IntegralHeckeAndGaloisDeterminants *Inner conjugacy of local matrix algebras*, *Classical Ribet lattice*, §0.6, §1.7; SmoothRepresentationsOfLocalGroups SR.5.2 anchors as above.

**Pinned declarations opened** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`; the pull request's Tau Ceti pin lags main's `358314d`, which changes nothing below): `TauCeti.IsLocalRing.ramificationGroup` (`RingTheory/LocalRing/RamificationGroup.lean:114`, indexed by `ℤ`), `ramificationGroupReal` (`:680`), `lowerIndex` (`:347`); `TauCeti.multiplicity_differentIdeal_tower` (`RingTheory/DedekindDomain/Different/Tower.lean:60`, the tower formula with ramification index); `IsKrasner.krasner` (`Analysis/Normed/Field/Krasner.lean:63`); `InfiniteGalois.mem_bot_iff_fixed` (`FieldTheory/Galois/Infinite.lean:110`); `Rep.mackeyDecomposition` (`RepresentationTheory/Induction/Mackey/Decomposition.lean:42`); `TensorProduct.finsuppScalarRight`; `Representation.finrank_intertwiningMap_baseChange` (`RepresentationTheory/BaseChange.lean:498`, `[Finite G]`); `Representation.isSemisimpleRepresentation_comp_subtype` (`Induction/Clifford/Basic.lean`); `TauCeti.exteriorPower.equivBaseChange`, `equivBaseChange_symm_tmul_ιMulti`, `equivBaseChange_map` (`LinearAlgebra/ExteriorPower/BaseChange.lean:68`, `:95`, `:103`); `WeierstrassCurve.HasMultiplicativeReduction` (`AlgebraicGeometry/EllipticCurve/Reduction.lean:345`, extends `IsMinimal`); `IsArithFrobeniusLift.coe_localCyclotomicCharacter` (`Unramified/Inertia/Cyclotomic.lean:61`); `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'` (`PSL/PSL2.lean:120`); `frattini` (`GroupTheory/Frattini.lean:24`, abstract, not open subgroups); `Representation.isOpen_ker_of_finite` and `exists_finiteDimensional_normal_fixingSubgroup_le` (`GaloisLattice/FiniteQuotient.lean:55`, `:99`); `torsionGaloisAction`, `weilPairing_torsionGaloisAction`, `nonempty_basis_torsionBy`; `valueGroupWithZeroIsoInt` (`NumberTheory/LocalField/Basic.lean:116`); `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`; `GroupExtension.continuous_factorSet`; `TauCeti.IsMinuscule`; `Matrix.card_GL_field`; `MeasureTheory.Subgroup.index_mul_measure`; `Rep.indCoindIso`; `IsCyclotomicExtension.Rat.galEquivZMod`; `Matrix.SL2.commutator_eq_top`; `AlgEquiv.mapIntegralClosure`; `AddSubgroup.inertia`; `ValuationSubring.decompositionSubgroup`; `Multiquadratic.galoisGroupEquiv`; `Subgroup.tensorInducedRepresentation`; `haarProb`; `ProfiniteGrp.ProfiniteCompletion.lift`; `Module.rankAtStalk_eq_finrank_tensorProduct`; `PadicTateTwist`; `exists_isArithFrobeniusLift`; `Ideal.isUnramifiedAt_iff_inertia_eq_bot`; `NumberField.Chebotarev.frobeniusPrimeSet`; `Algebra.IsQuadraticExtension.quadraticCharacter`; `exists_quadraticTwist_hasSplitMultiplicativeReduction`.

**Seeded source sample.** Printed pages are those of the version opened; `<id> line N` refers to the service's extraction.

| Target | Source passages read and outcome |
| --- | --- |
| 1.5 Descent from `ℚ̄_ℓ` | `bhkt` lines 749–755 (proof of Thm 4.8, arXiv v2 p. 17): Baire exhaustion by `Ĝ(E)`, finite index, enlarge `E`; lines 756–765: Larsen's lemma and hyperspecial conjugacy; Def 4.9 at lines 771–776. Supports §1.5 and §1.11. CG 2020 Prop 6.8 is at `cg2020` line 1374 (arXiv marker 29); the published p. 839 could not be compared. |
| 1.7 Semisimplification | `ddt` lines 2022–2029 (p. 54): residual semisimplification independent of the lattice by Prop 2.6(b). `ds` lines 601–624 (printed p. 523): 6.12 and Lemme 6.13. NT26 p. 7 is notation: R05. |
| 2.1 Decomposition groups | Stacks tag 0307, `stacks0307` line 3724 (integral closure commutes with localization). Deligne 1973 3.12 could not be obtained (below). |
| 2.7 Local constants | Deligne 1973 and Tate's two articles could not be obtained; the Gauss-sum values were recomputed (table below). |
| 3.2 Artin conductor | `milnecft` lines 1361–1378 (printed p. 24, I 1.11: the unit filtration maps to the upper-numbering filtration, "see 4.3") and lines 2405–2407 (printed p. 46, Prop 4.3: `U^(i)/U^(n) → G_i`), both as cited. `serre1961` line 1302 (Thm 2, printed p. 138), line 1311 ((31), p. 138), lines 1343–1359 (Remarque 2°, p. 139: reduction of Hasse–Arf to algebraically closed residue field by the completed unramified construction), line 1224 (Cor. 1 to Prop. 8, p. 136), line 942 (n° 3.1 Prop. 4 and Remarque, p. 128). Serre 1970 p. 7: R05. |
| 3.4 Functoriality | `ulmer` lines 114–122 ((4.1), pp. 3–4), 185–192 (§5, p. 4: finite wild image, pro-`ℓ` kernel), 215–245 (§6, p. 5: `a(ρ) = ε(ρ) + δ(ρ^ss)`, wild part unchanged by reduction), 333–354 (§10 Prop. 1, p. 8: `a(ρ ⊗ χ) = deg(ρ) a(χ)` for `χ` more deeply ramified). Brumer–Kramer could not be obtained. |
| 4.2 Borel and Cartan | Serre 1972 is paywalled; the structural Checks were recomputed (table). |
| 4.3 Sylow and `PSL₂` | `nt26` lines 1911–1923 (proof of Lemma 5.7, printed p. 41): intersection trivial, quadratic or equal; unique conjugacy class; automorphisms generated by `PGL₂` and Frobenius. Dickson could not be obtained. |
| 4.4 Dickson | `ddt` lines 3021–3030 (Thm 2.47, p. 81) as cited; lines 3033–3056 (Lemma 2.48, p. 82: `#F ≠ 5`, odd characteristic). `acc` lines 7871–7894 (Lemma 7.1.6, arXiv v2; Annals numbering is one higher at Def 6.2.28/Lemma 6.2.29/Rem 6.2.30 → 6.2.29–6.2.31). |
| 5.7 Finite fields and trace fields | `ds` lines 616–624 (Lemme 6.13, p. 523). `blggt` lines 3963–3995 (Lemma A.1.5, arXiv v4 p. 85: characteristic zero, semisimple, traces in `M`, one element with distinct `M`-rational roots) and lines 3296–3301 (proof of Lemma 5.3.1, p. 71: compactness gives the integral model). Exactly the Lean hypotheses. |
| 5.13 Function fields | `kisinzhou` lines 2395–2410 (proof of Prop 5.3.5, arXiv v2 p. 54): `det(1 − Frob_x t)` at closed points of a dense open determines the semisimplification. Milne AG 11.53: R05. |
| 6.4 Coefficients and images | `milneav` lines 2185–2188 (Prop 10.23: `V_ℓ A` free over `K ⊗ ℚ_ℓ` of rank `2 dim A/f`); `ribet1992` lines 161–176 (§3, pp. 4–5: `V_λ`, `det ρ_λ = χ_ℓ` for totally real `E`). Masser–Zannier could not be obtained. |
| 7.2 Adjoint and Schur | `cht` lines 467–475 (Lemma 2.1.8, p. 13: centraliser `R^×` for noetherian complete local `R`; the README's Nakayama generalisation needs only locality and finite generation), lines 282–288 (§2.1 p. 7: `g_n^{𝒢_n} = 0` over `ℤ[1/2]`). `bcg` lines 253–262 (proof of Thm 2.1, arXiv p. 5–6): trace duality and the one-dimensional constituents. |
| 7.8 Clebsch–Gordan mod `p` | `cht` lines 2693–2713 (proof of Lemma 2.5.2, p. 56): `ad Sym^{n−1} ≅ 1 ⊕ Sym² ⊕ … ⊕ Sym^{2n−2}` for `l > 2n − 1`, one-dimensional `t`-eigenspaces. Jantzen II.2.16 could not be obtained. |
| 7.10 Enormous images | `acc` lines 5988–6023 (Def 6.2.28, Lemma 6.2.29, Rem 6.2.30, arXiv v2 pp. 148–149): any algebraic `k/F_p`, conditions (1)–(3) with regular semisimple `h` and `W^h ≠ 0`, dependence on the `PGL_n` image, `p ∣ n` excluded, invariance under algebraic extension, equivalence with Khare–Thorne when eigenvalues lie in `k`. `gn` lines 671–714 (§3.2, p. 15): Def 3.2.1, Rem 3.2.2, Lemma 3.2.3 (`n = 2`), Lemma 3.2.4 (`n > 2`, uses `p > n`), Lemma 3.2.5 (`p > 2n + 1`, correcting CHT's `2n − 1`). `kt` lines 983–988 (Def 4.10, p. 22). `nt23` lines 937–956 and 1059–1064 (Def 2.23, Rem 2.24, Lemmas 2.25 and 2.28, pp. 20–23). `cht` lines 2723–2741 (Cor 2.5.4, p. 57) and 2784–2788 (Lemma 2.5.6, p. 58). `ghtt` lines 502–510 (Theorem 9, printed pp. 71–72): `d` is the largest irreducible `Γ⁰`-submodule over `F̄_l`, `l ≥ 2(d + 1)`, as in the Lean. `thorne2012` lines 265–289 (Def 2.3 and Lemma 2.4, p. 7). `acc` lines 7852–7862 (Lemma 7.1.4). `cg2020` lines 694–724 (Ex 4.11 and Assumption 4.1, pp. 10, 14–15). |

**Computed adversarial pass.** Matrices act on columns; `Φ` is arithmetic Frobenius; "retained" means the instance agrees with the statement, not that the universal statement is proved.

| Statement | Instances and values | Result |
| --- | --- | --- |
| 3.0 Hilbert's formula | `ℚ₂(ζ₈)`: `G₀=G₁` order 4, `G₂=G₃` order 2, `G₄=1`: `3+3+1+1=8`; `v₂(disc ℚ(ζ₈)) = 8` | Retained |
| 3.0 Hasse–Arf and `ψ` | `ℚ₂(ζ₈)`: jumps 1, 3; `φ(1)=1`, `φ(3)=2`; `ψ(u)=4u−5` for `u≥2`; eventual formula `eu−d+e−1 = 4u−8+3` | Retained; §3.1 Check agrees |
| 3.0 `ℚ₃(ζ₉)` | `G₀` order 6, `G₁=G₂` order 3, `G₃=1`: `d=5+2+2=9`, `v₃(disc)=9`; `φ(2)=1`; `ψ(u)=6u−4` for `u≥1`; `6u−9+5=6u−4` | Retained |
| 3.0 Artin–Schreier over `F̄_p((t))` | `y^p−y=t⁻¹`: `G₀=G₁` order `p`, `G₂=1`; `d=2(p−1)`; `ψ(u)=pu−p+1`; `pu−2p+2+p−1` | Retained; only instantiable through a perfect-residue contract (R01) |
| 3.0 imperfect residue control | `F_p(s)((t))`, `y^p−y=st^{−p}`: `z=ty` gives `z^p−t^{p−1}z=s`, residue extension `F_p(s^{1/p})`, `e=1`, `G=G₀` of order `p ≠ e` | Perfectness necessary; retained |
| 3.0 transition functions | tame `L/K`, `t>0`: `P_K ⊆ G_L` so `[G_K:G_K^tG_L]=ef`, `ψ=eu`; Artin–Schreier: index 1 on `[0,1]`, `p` beyond, `ψ(2)=p+1`; `G_L^{p+1} ⊊ G_L^2` witnessed by a break-2 character of `k((t′))` (p odd) | Retained |
| 3.0 completed comparison | unramified `L/K`: `L′=K′`, `d=0`, `ψ=id`, residue degree `[L:K] → 1`; upper groups for `u<0` differ (`G` vs `G₀`), hence the restriction `u ≥ 0` | Retained |
| 3.1 weighted Swan sum | `χ₈` on `ℚ₂(ζ₈)`: `G₂ = Gal(/ℚ₂(i)) = {1,5}`, `χ₈(5)=−1`: `1 + 1/2 + 1/2 = 2`; unweighted 3; on `ℚ₂(√2)` itself: 2 | Independent of `L`; retained |
| 3.1 tame over infinite residue field | `K=Frac W(F̄_p)`, `K(ζ_p)/K` totally ramified of degree `p−1`: `Sw=0` | Retained |
| 3.2 depth-two reciprocity | `(5,2)₂ = (−1)^{(25−1)/8} = −1`, `5 ∈ U²`: `U²` onto `Gal(ℚ₂(√2)/ℚ₂)`; `U³ ↦ 1`; conductor 3 | Retained; duplicates PadicPeriodRings §1.3 (R01) |
| 3.2 depth zero | image of `U_K` has index `f` (`K^×/(U_K N L^×) ≅ ℤ/f`), order `e`, inside `G₀` | Retained |
| 3.2 `⌈u⌉` | jumps integral, so `G^u = G^n` on `(n−1,n]`, `⌈0⌉=0` | Retained |
| 3.2 Artin conductor | `a(χ₋₄)=2`, `a(χ₈)=3`, `i=0` term alone 1; `Sp(2)`: `a=1`; lattice `O e₁ ⊕ ℓO e₂`: matrix `[[1,ℓtv],[0,1]] ≡ 1`, `a=0` | Retained |
| 3.3 WD conductor | `Sp(2)⊗χ`, `χ` tame: `V^I=0`, `(ker N)^I=0`: `a=2`; with `ker N`: `2+0−1=1`; `Sp(n)⊗χ` ramified: `n·sw(χ)+n = n a(χ)`; unramified: `n−1` | Formula uses `(ker N)^{r(I)}`; retained |
| 3.4 superadditivity | `(1 a;0 1)` of inertia: `a=1`; semisimplification `a=0`; tame `χ`: `a(χ)=1`, `a(χ⊗χ⁻¹)=0` | Retained |
| 3.7 Artin–Schreier | `F₂((t))`, `t⁻¹`: break 1, conductor 2, different `(2−1)(1+1)=2`; `F₃((t))`, `t⁻²`: break 2, conductor 3, different `2·3=6`; `t^{−p}`: `β=α−t⁻¹` gives `t⁻¹`, break 1 | Retained; Serre 1961 Lemme 4 pp. 144–145 agrees |
| 3.7 small conductors | `ℚ₂(√3)=ℚ₂(√(−1·−3))`: disc 12, exponent 2; `ℚ₂(√±2),(√±6)`: 3; cubic ramified over `ℚ₃`: `U⁰/U¹` has order 2, `U¹/U²≅F₃`, `U²` in the cube image: conductor exactly 2 | Retained |
| 4.1 oddness | `χ₋₃⊕χ₋₄` over `F₅`: `ρ(c)=−1`, `det=1`: not odd; char 2 criterion: `ρ(c)≠1`, `(ρ(c)−1)²=0`, unique rational fixed line | Lean hypothesis `hodd` discriminates; `c²=1` from `ι∘c² = ι` |
| 4.2 Cartans | `q=2`: split Cartan trivial, normaliser `GL₂(F₂)` of index 6; `GL₂(F_q)` has `q+1` Sylow `p`-subgroups | Retained |
| 4.3 `A₅` occurrence | `|PGL₂(F₇)|=7·48=336`, `336/60` not integral; `|PGL₂(F₁₁)|=1320=22·60` | Retained |
| 4.4 minimal indices | `PSL₂(F_q)` for `q=2,3,5,7,9,11`: `S₃`, `A₄`, `A₅`, order 168 with `S₄`, `A₆`, order 660 with `A₅`: indices 2,3,5,7,6,11 | Retained |
| 4.4 Lean dichotomy | dihedral with `p ∣ n` would contain a `p`-element fixing a unique point, so the group fixes a point and fails `hG`; `p=2`, `n=2`: elementary abelian unipotent fixes a point | `p ∤ n` consistent with absolute irreducibility |
| 4.6 bad dihedral `p=3`, `F=ℚ(√2,√3)` | `ℚ₃(√2)=ℚ₃(i)` unramified, so `F′=F(i)` splits at `v`; `√3` uniformiser, `X⁸−√3` Eisenstein; `ζ₈=(1+i)/√2 ∈ F′`; `crc=r⁻¹`; `z` of order 8 in `F₉^×`: `r⁴ ↦ −1` scalar, projective inertia order 4; `det ρ̄(c)=−1` | Retained |
| 4.7 persistence | `PSL₂(F₂₅)` minimal index 26 > 10; `A₄ ⊂ A₅` index 5 < 10 | `a ≥ 2` necessary; retained |
| 5.3 recognition (Lean) | `frobeniusSet Pl` meets every coset `gU` by Chebotarev on `Pl` of density 1, hence dense; charpolys continuous into `E[X]` under `ContinuousSMul`; rank 0 both zero | Retained |
| 5.4 trace identity | `g=diag(2,3)`, `h=1`: `6(1/2+1/3)−10+5=0`; with `T(gh⁻¹)`: `30−10+5=25` | Inverse placement pinned |
| 5.5 image algebra (Lean) | a `K`-basis `b₁..b_{n²}` from `ρ(Γ)` has Gram matrix `(tr b_ib_j)` invertible with entries in `k(ρ)`, so every `b ∈ ρ(Γ)` is a `k(ρ)`-combination: `dim = n²`; `Q₈`: `ℍ`, `s=2` | Retained |
| 5.7 finite fields (Lean) | `F₄` eigenvalues `ω,ω²`: `X²+X+1 ∈ F₂[X]`, companion matrix of order 3 | Retained; DS 6.13 |
| 5.10 Carayol with traces only (Lean) | residual Burnside + Nakayama: `ρ(Γ)` spans `M_d(R)`; `tr(ρ′(x)ρ′(y)) = tr ρ′(xy) = tr ρ(xy)`, perfect trace form gives `ρ(x)=0 ⇒ ρ′(x)=0`; inner automorphism; `R` Hausdorff since `⋂𝔪^m=0` | Trace hypothesis suffices without `d!`; retained |
| 5.10 Hausdorffness | compact totally disconnected group: `closure{1}` is an indiscrete normal subgroup, hence `{1}`, so `T2` follows | No missing binder |
| 6.1 Tate module | `y²=x³+1/F₅`: points `x=0,2,4` give 2,2,1 affine + ∞ = 6, `a₅=0`, `X²+5`; `det=5`, geometric `5⁻¹=3 mod 7`; supersingular (`5≡2 mod 3`): `E[5](F̄₅)=0` | Retained |
| 6.3 Tate curve factor | `H¹ = V^∨`: `0→ℚ_ℓ→V^∨→ℚ_ℓ(−1)→0`, invariants the trivial line, `L=1−T`; `q=p^ℓ`: `E_q[ℓ]` unramified, `V_ℓ` ramified; `q=p`: ramified | Retained |
| 6.3 Lean criterion | `v(j)<0` so `j≠0` and `∃m` is always satisfiable; `p ∣ m` iff `p ∣ v_K(j)` whatever the sign convention; nonsplit case through `δ_W` trivial on inertia | Retained |
| 6.3 splitting character | `ℚ₂`, `T²+T+1`: discriminant `−3` a unit, `ℚ₂(ζ₃)` unramified | Retained |
| 6.4a Frattini (Lean) | `n=0`: no coatom, infimum `⊤`, open; finite `P`: discrete; `∏ C_ℓ`: `Φ=1` not open | Hypotheses retained |
| 2.4 monodromy (Lean) | `χ_ℓ(I_K)=1` for `ℓ≠p` so `ρ(w)Nρ(w)⁻¹=N` on `J` is consistent with `ρ(w)=exp(tN)`; uniqueness from `exp(ℓ^mN)=exp(ℓ^mN′)` and `log`; rank 1: `χ(σ)^q=χ(σ)` on `ℤ_ℓ(1)` forces finite inertia image, `N=0` | Retained |
| 7.4 balance bound | trivial plane in characteristic 3: `tr ρ(c)=2=−1` but `(a,b)=(2,0)` | `ℓ>n+1` sharp; retained |
| 7.7 `SL₂` cohomology | DDT 2.48: `#F≠5`, odd characteristic; `#F=3`: centraliser of `SL₂(F₃)` on `ad⁰` is scalar with `2a=0 ⇒ a=0`, so `H⁰=0` | Retained |
| 7.7 scalar extension proof | `M′=⊕_b Me_b`; coordinates of cocycles; `M^G=0` gives finitely many `g_i` with `⋂ker(g_i−1)=0`, so primitives vanish outside finitely many `b`; finite `G`: `C^n(G,M′)=C^n(G,M)⊗k′` | Proof correct as written |
| 7.9 GHTT bound (Lean) | `d` over `F̄_l` as in Theorem 9; `p≥2(d+1)`; `H⁺` generated by `p`-elements | Hypotheses match the source |
| 7.10 `GL_n` criterion (Lean) | GN 3.2.4 needs `p>n` (its proof, line 705) and `k` containing eigenvalues (standing hypothesis, line 672); ACC+ Lemma 6.2.29 gives invariance under algebraic extension, so the Lean's `[Finite k]` without the eigenvalue assumption is covered | Retained |
| 7.10 enormous (1) as `H¹(H,k)=0` | `Hom(H,k)=0 ⟺ H^{ab}/pH^{ab}=0 ⟺` no quotient of order `p ⟺` no nontrivial `p`-group quotient; `⟨t⟩≅ℤ`: `Hom(ℤ,k)=k≠0` | Equivalent for every group |
| 7.11 big image | `p=3` scalar `λ=±1` has `ν=1`, (H1) fails; `p≥5`, `2`: `ν=4≠1` | Retained |
| 7.12 unitary exceptions | `PSU₂(F₄)≅S₃`, `PSU₂(F₉)≅A₄` not simple; `PSU₃(F₄)` order 72 not simple | Retained |
| 1.2 Hom base change proof | `M⊗E′=⊕_b Me_b` as `Γ`-modules; `Hom_E(V,W)⊗E′≅Hom_{E′}(V_{E′},W_{E′})` for `V` finite-dimensional; invariants commute | Proof correct for any monoid |
| 1.12 relative Maschke | `[Γ:H]⁻¹Σ_{Γ/H} gpg⁻¹` is a `Γ`-projection onto `W`; induction uses `Res_N Ind_H^Γ U = ⊕_{Γ/H} {}^g Res_N U` since `N ⊆ H` is normal | Proof correct |

**Repair status of the sixteen anchors, the dependency edge and the restated target** is recorded above; no other passage of the change set introduces a new mathematical statement beyond §3.0, the §3.2 target, the three proofs checked here and the open-kernel Check.

## Not verifiable

The following could not be read through a legal route this round and are listed in the scratch missing-reference inventory: Dickson 1901 (the archive.org mirror hosts are in no licence class; a public-domain copy needs the operator's confirmation), Deligne 1973 (Springer DOI prefix is paywalled; the IAS author-page URL tried returns 404), Brumer–Kramer 1994 (the Numdam item URLs tried return 404), Serre 1972 (Invent. Math., paywalled), Clozel–Thorne III and Masser–Zannier (Project Euclid pages without a PDF link). Uncertified by locator alone (paywalled): Serre *Local Fields*, Serre 1987, Khare–Wintenberger I–II, Tate *Number theoretic background* and *Local constants*, Jantzen, Isaacs, Steinberg, Neukirch, Kudla, Silverman, Mumford, Gan–Takeda, Cline–Parshall–Scott, Serre 1965 *Zeta and L functions*, Ribet 1976. ACC+ was read in arXiv v2, whose numbering is one below the Annals numbering the README uses; the Annals pages were not compared. CG 2020 Prop 6.8's proof and Thm 6.13's proof were located in arXiv v1 (markers 29 and 32) but the published pages 839 and 842–843 were not compared. Qian's Lemma 2.6 string was not found in the arXiv v1 extraction. Milne's AG notes version 6.10 do not contain the cited 11.53 (R05). The Milne AV course notes' Remark 7.3 sits at extraction marker 40 for the cited p. 34; the offset is consistent with the front matter but was not confirmed.

## Source issues

- **Misprint** in nt26 at the proof of Lemma 5.7, printed p. 41: the source says `PSL₂(F_{t^a})` is the unique normal subgroup of `PGL₂(F_{t^a})`; it should be the unique proper nontrivial normal subgroup; affects nothing.
- **Error** in cht at Corollary 2.5.4, printed p. 57: the source says `l > 2n − 1` suffices for the symmetric-power subgroup to be big; it should be `l > 2n + 1` (Gee–Newton, Lemma 3.2.5, and the `SL₂(F₅)` cohomology exception); affects a stated result.
- **Gap** in gn at Lemma 3.2.4, printed p. 15: the source's statement omits `p > n`, which its proof uses as an assumption; it should carry `p > n` in the statement; affects a stated result.
