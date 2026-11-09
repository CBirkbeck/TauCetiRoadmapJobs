# Review of ClassFieldTheory (pull request #617 at 435dc8a)

**Verdict:** needs changes

This is a full review: the folder changed by 362 lines since 911db42.

Three of the five previous findings are repaired:
- R01, the conductor–discriminant step 4;
- R04, the six padding declarations;
- R05, the principal-ideal-theorem *Needs:* line.

R02 (the gate's `outside-folder`) and R03 (no stated order against #1215 and #1411) are not repaired. They are carried as R03 and R04 below.

The full pass found two new findings:
- a P2: Layer 0 states the Nakayama–Rim kernel theorem without its ring hypotheses;
- a P3: conductor–discriminant step 5 uses a modulus `𝔪₀` without showing that it exists, and names none of its glue.

## R01 (P2) — Layer 0 states the Nakayama–Rim kernel theorem as if it held over every coefficient ring

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md` lines 316–320. Line 317 has "every prime is a unit or generates a maximal ideal". Lines 318–319 have "the kernel of a surjection from a projective module onto a cohomologically trivial one is projective, with no finiteness hypothesis".

**Claim.**
- The sentence lists four statements, separated by semicolons. The ring hypothesis is attached only to the second.
  - The first statement (projective implies cohomologically trivial) holds over every `k`. So does the fourth (a projective resolution of length one gives cohomological triviality).
  - The third, the kernel statement, sits between them with no hypothesis and reads as unconditional. It is false in that generality.
- Tau Ceti's `Rep.projective_ker_of_isZero_res` carries the same hypotheses as the lattice form:
  - `[IsDomain k] [IsPrincipalIdealRing k] [CharZero k]` (`TauCeti/RepresentationTheory/Homological/TateCohomology/NakayamaRim.lean` lines 75–76);
  - `hk` (line 118).
- The clause "every prime is a unit or generates a maximal ideal" holds for every prime element of any principal ideal domain, so as written it constrains nothing. Tau Ceti's `hk` is about prime **numbers** `p : ℕ`. For example, `ℤ[i]` fails it at `2`: `2` is not a unit and `(2) = (1 + i)²` is not maximal.

**Witness.** `G` trivial, `k = ℚ[x, y]`, `A = k/(x, y)`, `P = k`. Every module is cohomologically trivial, yet the kernel `(x, y)` is not projective: localized at `(x, y)` it needs two generators but has rank one.

**Repair.** Replace lines 316–320 with:

> a projective `k[G]`-module is cohomologically trivial, and so is a representation with a projective resolution of length one, over every `k`; and, for `k` a principal ideal domain of characteristic zero in which every prime number is a unit or generates a maximal ideal (such as `ℤ`, `ℤ_p` or a field of characteristic zero), a cohomologically trivial representation free over `k` is projective, and the kernel of every surjection from a projective `k[G]`-module onto a cohomologically trivial representation is projective, with no finiteness hypothesis.

Test:
- At `k = ℚ[x, y]`, which is not a principal ideal domain, the rewritten sentence asserts nothing.
- At `k = ℤ` it is exactly `Rep.projective_ker_of_isZero_res`, which is how `LocalGaloisGroups` consumes it (§6).

## R02 (P3) — Conductor–discriminant step 5: `𝔪₀` is used as a modulus without showing that it exists, and the glue is unnamed

**Location.** README lines 1034–1052. Step 5 says "the modulus `𝔪₀` is admissible, where `𝔪₀` has, at each finite place `v'`, the conductor exponent of `M_{u'}/K_{v'}`". It ends "Hence the idele is an idele norm …, and `isAdmissibleModulus_iff_abelianConductor_dvd` gives `abelianConductor K M ∣ 𝔪₀`". The *Needs:* line is at 1055–1099.

**Claim.**
1. A Tau Ceti `Modulus` has a nonzero ideal of `𝓞 K` as its finite part. So `𝔪₀` exists only if `c(M_{u'}/K_{v'}) = 0` for all but finitely many `v'`. The route never says why. The fact does follow from the first half of step 5, applied at every finite place.
2. Three passages have no named input:
   - from "the congruence idele is an idele norm" to `IsAdmissibleModulus K M 𝔪₀`, which is stated on the ray subgroup of idele classes;
   - from `abelianConductor K M ∣ 𝔪₀` to the inequality of exponents at `v`;
   - from the exponents prescribed for `𝔪₀` back to `𝔪₀.exponent`.

**Witness.** `Modulus.finitePart_ne_bot` is at `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean` line 102. `IsAdmissibleModulus` (`Global/AdmissibleModulus/Basic.lean` line 161) bounds `raySubgroup 𝔪` in `C_K`, while `mem_range_ideleNormMap_iff` (`Ideles/Norm/Range.lean` line 115) is about ideles.

**Repair.**
1. Before "A congruence idele of `𝔪₀`", insert:

   > By the first inequality at every finite place `v'`, `c(M_{u'}/K_{v'})` is at most the exponent of `v'` in `abelianConductor K M`. So the family `v' ↦ v'^{c(M_{u'}/K_{v'})}` has finite support (`Ideal.hasFiniteMulSupport_asIdeal_pow_of_le_count`, with `I` the finite part of the conductor). Its finite product is a nonzero ideal, the finite part of `𝔪₀`, whose exponent at `v'` is `c(M_{u'}/K_{v'})` (`Ideal.count_finprod_asIdeal_pow`, `TauCeti/RingTheory/DedekindDomain/Factorization.lean` lines 157, 168; `TauCeti.GlobalNumberFields.Modulus.exponent_def`).
2. After "Hence the idele is an idele norm", insert:

   > so its class lies in the idele-class norm group (`TauCeti.GlobalNumberFields.ideleClassNormMap_mk`), and the ray subgroup of `𝔪₀` lies there (`TauCeti.GlobalNumberFields.mem_raySubgroup_iff`)
3. End the step with:

   > `TauCeti.GlobalNumberFields.Modulus.exponent_mono` reads the divisibility at `v`.
4. Add the five names to the *Needs:* line.

Test, for `M = ℚ(√-5)` over `ℚ`:
- the local exponents are `c(2) = 2`, since `ℚ₂(√-5) = ℚ₂(√3)` has discriminant exponent `2`, and `c(5) = 1`, since `ℚ₅(√-5)/ℚ₅` is tamely ramified;
- every other local exponent is `0`;
- these are at most the exponents of the conductor `20·∞`, so `𝔪₀ = 20·∞ = abelianConductor ℚ M`, with exponent `1` at `5` on both sides.

## R03 (P3) — The push gate still fails on files outside the pull request's declared folders

Carries the previous R02.

**Location.** The command `git diff --stat origin/main...HEAD` lists files outside `TauCetiRoadmap/{ClassFieldTheory, IntegralLattices, QuadraticFormInvariants}`:
- `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`;
- `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.

**Claim.**
- The gate reads `outside-folder … FAIL`, and every other check reads `0`.
- The pull request's title, "fix(LocalFieldsRamification): …", makes that roadmap its subject. The brief names only the three `TauCetiRoadmap/` folders as its own.
- Part of the `Completed/LocalGaloisGroups/Suggested.lean` edit is forced by this folder:
  - `h2MuEquivZMod_mixed` now returns an equivalence instead of `Nonempty`;
  - `h2FpEquivZMod_of_mu` takes `e : μ_p ≅ T` as data;

  so lines 324–326 and 485 of that file change.

**Witness.** gate.md: "outside-folder (4) – Completed/LocalFieldsRamification/COMPLETION.md, …/README.md, …/Suggested.lean, Completed/LocalGaloisGroups/README.md". My re-run lists the same four plus the five files of the two sibling folders.

**Repair.** A human decides whether the `Completed/` edits belong to this pull request:
- if they do, the brief lists those folders and the gate passes;
- if not, they move to a separate pull request that merges together with this one.

Nothing in this folder changes.

## R04 (P3) — The merge order against #1215 and #1411 is still not stated

Carries the previous R03.

**Location.** The pull request's description. Its only merge-order sentence is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Two open pull requests change this folder. Both conflict with this head, and both state shared targets differently.
- #1215, at head `f0ebef6`:
  - states `cyclotomicCharacter_artinMap` (its `Suggested.lean` line 82) as an open target;
  - adds `count_relDiscr_eq_finsum_abelianConductor_exponent` (157) and `abelianConductor_eq_lcm` (171).
- #1411, at head `49a703c`:
  - states `algebraMap_vle_algebraMap_iff_of_finite_padic` (402) in place of `valuativeExtension_of_finite`;
  - restates `isPrincipal_map_hilbertClassField` (688) and `relDiscr_eq_finprod_abelianConductor` (698).

**Witness.** overlaps.md: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`", and the same for #1411. Both heads were read with `roadmaps show ClassFieldTheory --pr`.

**Repair.** In the merge-order paragraph, say which of #617, #1215 and #1411 merges first for this folder. Each later one rebases and keeps one statement of each shared target. Test: the description names both pull requests and the order.

## Previous findings

- **R01 (P2), conductor–discriminant step 4: repaired.** Lines 1003–1029 now prove the identification `M_u ≅ F_χ`. The proof runs through four facts:
  - the canonical map `completionAlgHom` is `K_v`-linear, by `completionAlgHom_comp` and `algebraMap_eq_completionAlgHom`;
  - its image is fixed by the image of `D ∩ ker χ`, by `continuous_decompositionHom`, `decompositionHom_algebraMap` and density;
  - both fields have degree `[D : D ∩ ker χ]`, by `finrank_adicCompletion_fixedField`, `IntermediateField.finrank_fixedField_eq_card` and `card_stabilizer_eq_finrank_adicCompletion`;
  - the conductor is transported by `AlgEquiv.normGroup_eq` and `conductorExponent_le_iff`.

  Steps 2–3 name `decompositionEquiv` and `isAbelianGalois_adicCompletion`. Every name is at the pin (list below). The requested `ℚ(i, √5)` Check is at lines 1110–1120, and its values are recomputed in the table.
- **R02 (P3), gate: not repaired.** Carried as R03.
- **R03 (P3), merge order: not repaired.** The description is unchanged. Carried as R04.
- **R04 (P3), six padding declarations: repaired.**
  - `Suggested.lean` no longer declares the two `TateCohomology` theorems, `tateDual`, `muNRepToTateDual`, `normResidue` or `artinMap_norm`.
  - "Earlier identifiers, old → new" maps all six at lines 1422–1434.
  - The README's own mentions are qualified at lines 325–326, 538, 550, 628, 653, 657 and 690.
  - Lines 1345–1348 leave only the three Hilbert invariants as type-only names.
- **R05 (P3), principal-ideal-theorem *Needs:*: repaired.** Lines 924–961 now list the four declarations with their files:
  - `LayerRestriction.groundInclusion_apply_coe`, at `Formation/Restriction.lean:411`;
  - `ideleCoeffOfIntermediateField_coe`, at `Global/Coefficients.lean:574`;
  - `ideleExtension_comp`, at `Ideles/Extension.lean:77`;
  - `Ideal.ramificationIdx'_eq_ramificationIdx`, at Mathlib `RingTheory/RamificationInertia/Ramification.lean:253`.

## Verified sound

**Gate, dependency check, elaboration.**
- Gate re-run with `--base origin/main`: `set_option=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 … outside-folder=9 … FAIL`. The nine files are R03's five plus four files of `IntegralLattices` and `QuadraticFormInvariants`, which the brief names as the pull request's own. The worker's targeted build reports `build=0`.
- Dependency check, with `--movable`: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  - The roadmaps this README names as owners or suppliers are on main: `GlobalNumberFields`, `LocalFieldsRamification`, `NumberFieldArithmetic`, `ProfiniteCohomology`, `QuadraticFormInvariants` and `GlobalQuadraticForms`.
  - `LocalFieldsRamificationPartII` §4.1 (board README line 995) is named only as the owner of excluded material.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives three `declaration uses 'sorry'` warnings, at lines 159, 349 and 358, and nothing else.

**Signatures (`#check @`, scratch copy).** I checked all 34 public declarations. Every elaborated type matches its README statement, and no section binder is lost:
- `valuativeExtension_of_finite` binds `K : Type u_1` and `F : Type u_2`, with `[Module.Finite K F]`;
- `isPrincipal_map_hilbertClassField` binds `K` and `I` only;
- `relDiscr_eq_finprod_abelianConductor` carries `[IsAbelianGalois K L]`, the predicate `IsCyclic Gal(↥M/K)` and the exponent `(finrank K ↥M).totient`;
- `cyclotomicCharacter_artinMap` has no `ValuativeExtension` binder.

I changed nothing in the folder.

**Padding probe.** I replaced each `sorry` with `first | infer_instance | rfl | simp | exact?`. `exact?` fails on all three open targets.
- Every other declaration is a consumer name. Code uses outside comments in `Completed/LocalGaloisGroups/Suggested.lean`:
  - `GalRep` 2, `H` 2, `muNRep` 8, `muNRepEquivZMod` 3, `muNRep_ρ_eq_self` 2;
  - `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `kummerCupPairing`, `kummerCupPairing_bil`, `absoluteGaloisGroupExtend` and `scd_p_absoluteGaloisGroup_eq_two` 1 each;
  - `artinMap` 5;
  - the three cyclotomic theorems 1 each.
- Code uses in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`:
  - `principalIdele`, `ideleNormMap`, `ideleClassNorm`, `card_ideleClassNormQuotient`, `cyclicHasseNorm`, `IsLocalNormEverywhere` and `hilbertProductFormula` 1 each;
  - `IsFiniteLocalNorm` and `IsInfiniteLocalNorm` 2 each;
  - `isGlobalNorm_iff_isLocalNormEverywhere` 3.
- The Hilbert invariants occur in the type of `hilbertProductFormula`.
- The two Euler-characteristic theorems are the stated consequences of the open target (§1 item 1).

**Every route declaration opened at the pin.**
- Step 4: `Completion.lean:64, 74, 84, 154`; `DecompositionGroup.lean:238, 274, 334, 358, 393, 422`; `Norm/Equiv.lean:43`; `Conductor/Basic.lean:113`; `UpperNumbering.lean:130`.
- Steps 1–3: `Discriminant/Conductor.lean:58`; `Discriminant/Valuation.lean:52`. Mathlib: `FiniteAbelian/Duality.lean:107, 133`; `Galois/Basic.lean:220`.
- Step 5: `Semilocal/Norm/Units.lean:59, 69, 127, 179`; `Norm/Units.lean:147`; `Ideles/Congruence.lean:285`; `Norm/Range.lean:115`; `AdmissibleModulus/Basic.lean:161, 200, 208`; `Ramification.lean:116`.
- R02's glue: `Factorization.lean:157, 168`; `Ray/Subgroup.lean:75`; `Norm/Relative.lean:200`; `Modulus.lean:195, 243`.
- Valuation comparison: `NormalizedValuation.lean:114`; `Henselian.lean:41`; Mathlib `LocalField/Basic.lean:142` (`Finite 𝓀[K]`).
- Layer 13 Checks: `RayClassField.lean:148, 157, 218, 241, 362`; `RingClass/Quotient.lean:144`; `RayClass/Basic.lean:200`; `Modulus.lean:462`.

The claim that "one `simp` call closes" `ringClassField (maximalNumberFieldOrder K) = hilbertClassField K` elaborated in a scratch file with the listed unfoldings.

**Seeded sample.**
- *Definitions on Tau Ceti's carriers*:
  - `MuNRep.lean:189, 300, 358, 371, 409`, `Brauer/RootsOfUnity.lean:89, 103, 156` and `Local/Symbol.lean:207, 257`;
  - each of the four definitions has three Checks, recomputed below;
  - `kummerEquiv_mixed` needs no local-field instance, and the other three carry `IsNonarchimedeanLocalField F`.
- *The local symbol and the Hilbert pairing*: `Local/Symbol.lean:320, 327` (`localSymbol P tr x y = tr (P.cup 1 1 x y)`) and `Duality/RootsOfUnity.lean:61, 72, 120`.
- *Open target, the comparison of valuations*:
  - milne-ant line 5295, PDF page 122, printed p. 120: Proposition 7.31, with the standing hypothesis "A is a complete discrete valuation ring" at line 5289.
  - This is the route's use, with the polynomial `X^{ℓ^k} − u^{q−1}`, monic with simple root `1` modulo the maximal ideal.
  - Tau Ceti's `HenselianLocalRing 𝒪[K]` instance supplies the same step.
- *Restriction to a finite Galois extension*: `Galois/Restriction.lean:73, 80`, `AbsoluteGaloisGroup/Basic.lean:340` and `Local/ArtinMap.lean:132`.
- *The cyclotomic normalization*:
  - milne-cft line 10059: Example 8.2, PDF page 230, printed p. 221, continued on p. 222 (line 10084);
  - line 10072 gives `[p^s]` at `p ≠ l`, and line 10075 gives `[u⁻¹]` at `l`;
  - `localCyclotomicCharacter_artinMap_unit` (`ExplicitCyclotomicSymbol/ArtinMap.lean:311`) assumes `[ValuativeExtension ℚ_[p] F]`, which the open target discharges.
- *Open targets* (Layer 13):
  - V Theorem 3.17 is at line 7252, printed p. 161, and the reduction (a)/(b) at lines 7303–7322, pp. 162–163;
  - V Theorem 3.27 is at line 7423 and Remark 3.28 at line 7436, both printed p. 165;
  - the theorem is stated with `f₀`, the finite part, as the README says.
- *Other locators*:
  - milne-cft II 3.11 at line 3911 (p. 84) and 3.12 at 3988 (p. 85); III Lemmas 2.3–2.6 at 4716–4751 (pp. 104–105); V §1 at 6769 (p. 152); V 3.6 at 7051 (p. 158) and 3.9 at 7092 (p. 159); VII §4 at 9566 (p. 210), §5 at 9664 (p. 212), 8.1 at 10042 (p. 221) and 9.1–9.5 at 10189–10287; VIII 4.2 at 10937 (p. 241);
  - milne-adt I Corollary 2.3 at line 1138 (p. 28) and Theorem 2.8 at line 1227 (p. 31);
  - kopp-lagarias Theorems 1.1–1.3 at lines 128, 160 and 174 (pp. 3–4);
  - jahnke-koenigsmann Theorem 2.1 at line 113.
- The README flags no locator as unverified.

**Duplication and ownership.**
- None of the three open targets is at the pins.
  - The `ValuativeExtension` producers are the worked examples over `ℚ_2` and `ℚ_3`, the completion instances, and `ValuativeExtension.of_continuous_algebraMap` (`ContinuousRingHom.lean:175`). The last assumes continuity, which the target drops, so it is a special case, not a duplicate.
  - `algebraicExtensionValuation_isEquiv` (`AlgebraicExtension/Basic.lean:254`) assumes the compatibility.
  - No Tau Ceti theorem gives the ideal form of the principal ideal theorem, relates `relDiscr` to `abelianConductor`, or equates the local and global conductor exponents.
- `roadmaps grep` over main and 459 open heads, for the principal ideal theorem, the conductor–discriminant formula and the valuation comparison:
  - ArithmeticGaloisRepresentations §3.5 (#856) states the local Artin-representation form;
  - AnalyticNumberTheoryPartI §2.2a (main, line 1324) states the Artin-representation form and cites this roadmap's Layer 13 (line 1336);
  - #1215 and #1411 are R04.
- Cross-roadmap citations resolved:
  - GlobalNumberFields Layers 2, 4, 6, 7, 8 and 11, at `Completed/GlobalNumberFields/README.md` lines 279, 418, 439, 459, 476 and 571.
  - The consumers: ClassicalArithmeticCompletion line 13; SchemeAndStackFoundations Layers 5 and 10; ImaginaryQuadraticClassNumber Layers 10–13; ZerosOfLFunctions line 72; ReductiveGroupsPartII line 380; OrthogonalSpinGroups line 946; AnalyticNumberTheoryPartI lines 1336, 1429 and 1747; IntegralLattices (head) lines 149 and 514; QuadraticFormInvariants (head) lines 98 and 345.
  - EndoscopicTransferAndUnitaryTraceComparison (#999) line 90 cites "Layer 0, item 4", which line 1375 maps old → new.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `valuativeExtension_of_finite` | `ℚ₂(i)/ℚ₂` | `w(2) = 2`, `v(2) = 1`; `2 <ᵥ 1` holds on both sides; `1 ≤ᵥ 2` on neither | holds; normalized valuations differ, as stated | none |
| same, units step | `ℚ₂`, `u = −3`, `ℓ = 3`, `q = 2` | `f = X^{3^k} + 3`: `f(1) = 4 ≡ 0`, `f′(1) = 3^k` a unit ⇒ root ⇒ `3^k ∣ w(−3)` for every `k` ⇒ `w(−3) = 0` | holds | none |
| same, `ℓ = p` | `ℚ₂`, `u = 3`, `X² − 3` | `f′(1) = 2` is not a unit; `3 ≢ 1 mod 8`, so not a square | the route needs `ℓ ≠ p`, as stated | none |
| same, equal characteristic | `𝔽_p((t))`, `t ↦ t^p` | degree `p`; `w(t^p) = p > 0`; Hensel applies for `ℓ ≠ p` | holds without separability or continuity | none |
| same, uniformizer step | `ϖ = (1 + ϖ) − 1` | `w(1 + ϖ) = 0 = w(1)` ⇒ `w(ϖ) ≥ 0`; `w(ϖ) = 0` ⇒ `αⁿ` or `c₀` dominates ⇒ `w ≡ 0` on `Fˣ` | contradicts nontriviality; the step closes | none |
| `eulerCharacteristic_mixed` | `ℚ_p, ℤ/p` (`p` odd); `ℚ₂, ℤ/2`; `ℚ_p, ℤ/ℓ` with `ℓ ∤ p(p−1)` | `p² = p·1·p`; `8 = 2·2·2`; `ℓ = ℓ·1·1` | equal | none |
| same, nontrivial action | `ℚ₂`, `A = ℤ/3` with Frobenius acting by `−1`, so `A ≅ μ₃` | `#H⁰ = 1`, `#H² = 3`; `#H¹ = #ℚ₂ˣ/ℚ₂ˣ³ = 3 = 1·3·2⁰` | equal | none |
| `eulerCharacteristic_finrank_fp` | `ℚ₂, 𝔽₂`; `ℚ₃, 𝔽₃` | `3 = 1 + 1 + 1`; `μ₃ ⊄ ℚ₃`, and `ℚ₃ˣ/ℚ₃ˣ³ ≅ (ℤ/3)²` ⇒ `2 = 1 + 0 + 1` | equal | none |
| `cyclotomicCharacter_artinMap` | `ℚ₂`, `u = −3` on `μ₁₆`; `ℚ₂(i)`, `u = i` | `13⁻¹ ≡ 5 mod 16` (`13·5 = 65`), not `13`; `N(i) = i·(−i) = 1` | arithmetic convention; holds | none |
| `kummerEquiv_mixed` | `ℚ₂, n = 2`; the class of `−7`; `ℚ₃, n = 2, 1` | 8 classes, generated by `−1, 2, 5`; `−7 = 1 − 8` is a square; 4 classes; 1 class | agrees | none |
| `h2MuEquivZMod_mixed` | `ℚ₂, n = 1, 2, 3`; `ℚ₇, n = 3` | orders `1, 2, 3`; invariant `1/3 ↦ 1`; the other equivalence `↦ 2` | the invariant fixes the map | none |
| `h2FpEquivZMod_of_mu` | `T = 0`; `p = 3` with `e ∘ inv` | `#μ₃ = 3 ≠ 1` ⇒ no `e`; `H²(inv) = −1 ≠ 1` in `ℤ/3` ⇒ negated | `e` is data | none |
| `kummerCupPairing` | `n = 2`, `ζ = −1`; `ℚ₇`, `ζ` versus `ζ²` | `(−1, −1) ↦ −1` (`1·1 = 1`), while the zero pairing gives `1`; `(ζ²)² = ζ` ⇒ `(ζ, ζ) ↦ ζ²` | the root is data | none |
| local symbol | `ℚ₂`, `(−1, −1)` and `(5, −1)`; `muNRepToTateDual (−1)` | `(−1, −1)₂ = −1 ↦ 1`; `5 = 1² + 2² ↦ 0`; `−1 ↦ id`, `1 ↦ trivial` | agrees with the Hilbert symbol | none |
| restriction along `iota` | splitting field of `X³ − 2` | `σ` fixes `∛2` ⇒ `s` fixes `∛2`; along `iota ∘ τ`, `τ⁻¹sτ` fixes only `τ⁻¹(∛2) ≠ ∛2` | the embedding is data | none |
| `isPrincipal_map_hilbertClassField` | `ℚ(√−5)`, `H = ℚ(√−5, i)`; `K = ℚ`; `I = ⊥` | `𝔭₂² = (2)` and `(1 + i)² = (2i)` ⇒ `(1 + i)`; `𝔭₂𝔭₃ = (1 + √−5)`; `ℤ` is a principal ideal domain; `⊥` is principal | holds | none |
| same, step 5 | `ℚ(i)/ℚ` at `2`; `𝔭₂` in `H/K` | order `1 ↦ e = 2`, and `(1 + i)² = (2)`; `e(𝔓/𝔭₂) = 1`, `f = 2`, `N_{H/ℚ}(1 + i) = 4` | `e` is needed, as stated | none |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(ζ₅)`; `ℚ(ζ₈)`; `L = K` | `1·5·5² = 125 = 5³`; `1·4·8·8 = 256 = 2⁸` (`ℚ(ζ₈)` is not cyclic, so excluded); `⊤ = ⊤^{φ(1)}` | equal | none |
| same, step 1 | `ℚ(ζ₁₅)` at `5` | `e = 4`, `f = 2`, `g = 1`; `f·d = 2·3 = 6`; the discriminant is `15⁸/(3⁴·5²) = 3⁴·5⁶`; 6 of 8 characters are ramified at `5` | equal; omitting `f` gives `3` | none |
| same, steps 2–4 | `ℚ(i, √5)` at `5`; `M = ℚ(√−5)` | `g·δ = 2·1`; exponents `0, 0, 1, 1` ⇒ `2`; `D` alone gives `1`; `𝔡 = 1·4·5·20 = 400`; `D ∩ ker χ = 1`; `√−5 ↦ i√5` with `i ∈ ℚ₅` | step 4 closes | none |
| same, step 5 (R02) | `M = ℚ(√−5)/ℚ` | `c(2) = 2` (`ℚ₂(√3)`), `c(5) = 1`, `0` elsewhere; all `≤` the exponents of `20·∞` ⇒ `𝔪₀ = 20·∞ = abelianConductor` | holds once `𝔪₀` is built | R02 |
| Layer 0, kernel statement (R01) | `G = 1`, `k = ℚ[x, y]`, `A = k/(x, y)`; `k = ℤ` | the kernel `(x, y)` needs 2 generators locally but has rank 1, so it is not projective; at `ℤ` it is Tau Ceti's theorem | false as written | R01 |
| Layer 0 examples | `C₂` acting on `ℂˣ`; trivial `ℤ/2` | `Ĥ⁰ = ℝˣ/ℝ_{>0}` has order 2, so `u = [−1]`; `Ĥ⁻¹(C₂, ℤ) = 0 ≠ ℤ/2 = Ĥ¹(C₂, ℤ/2)` | as stated | none |
| §2.3 and Layer 2 | `[U : V] = 4`, `[U : U′] = 2`, `[V : V′] = 3`; unramified degree 6 | `2·(1/4) = 1/2`; `inv(cor u′) = 1/2 = 2·(1/4)`; `inv(inf u) = 1/4 = 3·(1/12)`; `2/6 = 1/3`, of order 3 | as stated | none |
| Layer 10 lift obstruction | `ℚ(√13, √17)` | `(17/13) = (4/13) = 1`; `(13/17) = 1`; `ℚ₂(√13) = ℚ₂(√5)` and `√17 ∈ ℚ₂` ⇒ every `|D_v| ≤ 2`; `H²(G, C_L) ≅ ℤ/4` | as stated | none |
| Layer 12, `D₄` | two `D₄` fields over one biquadratic field | `|D₄ ×_{V₄} D₄| = 16`; the unique alternating form on `𝔽₂²` ⇒ `G′ = ⟨(z, z)⟩`; `|G^ab| = 8 > 4` | as stated | none |
| Layer 13, Hilbert splitting | `ℚ(√−5)`; `ℚ(√3)` | `29 = 3² + 5·2²` gives two primes; no generator `±√3(2 + √3)^k` is totally positive, since `2 − √3 > 0` | as stated | none |
| Layer 13, orders | `ℤ[√−3]` (`f = 2`); `ℤ[2i]` | `h = (2/3)(1 + 1/2) = 1`; `h = (2/2)·1 = 1` | `Pic` is trivial | none |
| Layer 13, ring class field | maximal order | the one `simp` call elaborated | as stated | none |
| Layer 14 | `(3, 7)`; `(−1, −1)` over `ℚ` | `0, 1, 0, 1` at `∞, 2, 3, 7` (`(3/7) = −1`), sum `0`; `1` at `2` and `∞` | the sums vanish | none |
| §5.3 and §5.6 | `ℚ₂(ζ₅)`; `C₄ ⊃ ⟨g²⟩`; `V₄ ⊃ C₂` | `Art(8) = Frob³` sends `ζ` to `ζ⁸ = ζ³`; `V(g) = g²`; in `V₄`, `V(g) = g² = 1` | as stated | none |

## Not verifiable

- Cited by locator only, as the manifest settles them:
  - Artin–Tate, *Class Field Theory* (waived);
  - Serre, *Local Fields*; Neukirch, *Algebraic Number Theory*; NSW, *Cohomology of Number Fields*; Engler–Prestel, *Valued Fields* (uncertified).
- These §8 background citations have no manifest entry, and I did not read them: Serre, *Galois Cohomology* II §5; Brown, *Cohomology of Groups* VI §8; Rim 1959; Lang, *Algebra* III 7.1; Cox §§7 and 9; Weil 1951; Tate, Corvallis; Tate 1952; Nakayama 1957.
- I did not elaborate `Completed/LocalGaloisGroups/Suggested.lean`. It imports `TauCetiRoadmap.ProfiniteCohomology.Suggested`, which has no object file here, and the brief allows building only `TauCeti.*` modules. Its uses of this file's names were checked textually.

## Source issues

- none
