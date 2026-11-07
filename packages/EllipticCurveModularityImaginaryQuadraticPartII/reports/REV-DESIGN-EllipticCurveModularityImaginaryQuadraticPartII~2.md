<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7660#issuecomment-6713891997 -->
Review (claude) of 1b7c268

Verdict: needs_changes

1. **F01** (P3) §5.1 third Check asserts condition (ii) at places whose residue field is `𝔽₅`

   Location: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` lines
   815–818, "With `[F⁺:ℚ] = 8` and five-adic local degrees `(1, 1, 6)` of `F⁺`, condition (ii) holds
   at the two places of degree one … with degrees `(1, 1, 1, 1, 1, 1, 1, 1)` the complementary sum is
   `6 > 4` everywhere."

   Claim: a mixed instance of condition (ii) (holding at some five-adic places, failing at another) and
   an instance where (ii) holds everywhere.

   Witness: condition (ii) as defined at line 792–794 (and CN23 line 4246) also requires "the residue
   field of `v̄` is larger than `𝔽₅`". A place of `F⁺` of local degree one over `ℚ₅` has residue field
   `𝔽₅`, so (ii) fails at both degree-one places of `(1, 1, 6)` and at every place of `(1⁸)`; the
   README's own fourth Check (line 819) says so. Minimal admissible degrees: each five-adic place has
   local degree `≥ 2`, and `deg v̄ + deg v̄' < d/2` forces `d ≥ 10` (computed: `d = 9` admits no
   partition; `(2, 2, 2, 2, 2)` at `d = 10` gives complementary sum `6 > 5`).

   Repair: replace the Check by "With `[F⁺:ℚ] = 10` and unramified five-adic places of `F⁺` of residue
   degrees `(2, 2, 6)`, condition (ii) holds at the two places of degree two (complementary sum
   `6 > 5`) and fails at the place of degree six (complementary sum `2 < 5`), so the datum is not
   prepared; with residue degrees `(2, 2, 2, 2, 2)` the complementary sum is `6 > 5` everywhere." Update
   the matching `plan.json` test of 5.1. Tested: `10 − 2 − 2 = 6 > 5`, `10 − 6 − 2 = 2 < 5`,
   `10 − 2 − 2 = 6 > 5`, residue fields `𝔽₂₅` and `𝔽_{5⁶}`.

2. **F02** (P3) Checks of §§4.3, 5.2, 5.4 evaluate the formulas at `d = 1`, excluded by the hypotheses

   Location: README line 764 "For `d = 1`, `t = 1`, `r = 3` the count is `g = 0`"; line 843 "For `d = 1`,
   `S₅` one place of local degree `2` and `R = ∅`, `dim R^loc_χ = 1 + 3 + 2 = 6`"; line 904 "With `d = 1`
   the deficit is one, matching `l₀ = 1` for `PGL₂` over an imaginary quadratic field."

   Claim: numerical instances of the presentation count, the local base dimension and the patching
   deficit.

   Witness: §4.3 assumes `μ₅ ⊂ F`, so `[F:ℚ] ≥ 4` and `d ≥ 2`; §§5.2 and 5.4 assume a protected prepared
   datum, whose condition (ii) forces `d ≥ 10` (R01) and whose condition (i) forces `5` split in an
   imaginary quadratic subfield, so `S₅` has at least ten places; an imaginary quadratic `F` with one
   five-adic place of degree two satisfies neither. The formulas themselves are correct
   (`g = r − 3d − 1 + t`, `dim R^loc = 1 + 3t + 2d`, deficit `d`), but the Checks test them on
   non-instances of the definitions they illustrate.

   Repair: §4.3 first Check: "For `F = ℚ(ζ₅)` (`d = 2`, one place above five, `R = ∅`, so `t = 1`) and
   `r = 6`, `g = 6 − 6 − 1 + 1 = 0`, agreeing with CrystallineLocalGlobalCompatibilityCM §9.3's count
   `q − 3[F⁺:ℚ] − 1 + |S|` at `q = 6`, `[F⁺:ℚ] = 2`, `|S| = 1`." §5.2 third Check: "For `d = 10` with ten
   five-adic places of `F` of local degree two and `R = ∅`, `t = 10` and
   `dim R^loc_χ = 1 + 30 + 20 = 51`: the protected places add nothing to the local base." §5.4 third
   Check: "With `d = 10` the deficit is ten, matching `l₀ = 10` for `PGL₂` over a CM field of degree
   twenty." Update the three `plan.json` tests. Tested on `d = 10`, `t = 10`, `r = 21` (the least `r`
   allowed, since `dim H_∅ ≥ 3d + 1 − t = 21`): `g = 21 − 30 − 1 + 10 = 0`,
   `dim R^loc = 1 + 30 + 20 = 51`, `dim R_∞ = 51 = 21 + 40 − 10`, `dim S_∞ = 1 + 39 + 21 = 61 = 21 + 40`,
   deficit `10 = d`.

Two findings, both P3 (Checks), no P1 or P2. Each asks for a repair, so the verdict is needs
changes: a fix round applies the two Check repairs before the package stage. Nothing else is
asked; the declared supplier gap `acc-torsion-inertial-comparison`
(AutomorphicGaloisRepresentationsPartII AG2.5) is a stated contract, not a finding. Files reviewed:
`packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` (1249 lines),
`design/plan.json` (8 layers, 28 targets, 90 tests, 1 gap), `sources.toml` (8 entries).

## Repairs of round 1, finding by finding

- **F01 (gap slug absent from the README) — repaired.** README line 264: "What
  AutomorphicGaloisRepresentationsPartII must provide (gap:acc-torsion-inertial-comparison): a
  statement in its Layer AG2.5 of ACC Theorem 3.1.1". §5.3 `*Needs:*` (line 865) and the Layer 5
  Dependencies (line 917) name the slug; `plan.json` `gaps[0].slug` and 5.3's prerequisites carry
  the same slug. The completed setting was compared with ACC23 lines 2309–2355: `S = S^c`, the
  conditions on primes outside `S`, `R` prime to `p` with residue characteristics split in an
  imaginary quadratic subfield, `Iw_{v,1} ⊆ K_v ⊆ Iw_v` on `R`, hyperspecial on `R^c ∖ R`, the
  representation of `G_{F,T}` with `T = S − (R^c − R)`, conclusions (1) and (2) with `σ ∈ W_{F_v}`:
  all as the README states.
- **F02 (Milne Remark 1.6 is the converse) — repaired.** README lines 306–310 now give the
  two-line argument "`φ ∘ σισ⁻¹ = conj ∘ φ = φ ∘ ι` (`NumberField.IsCMField.isConj_complexConj`) and
  `σισ⁻¹ = ι` because `φ` is injective (MilneCM, Proposition 1.4(b) and the uniqueness of complex
  conjugation noted after it, p. 10, lines 273–290)". Checked: MilneCM lines 273–290 state
  Proposition 1.4(b) and "exactly one complex conjugation"; `isConj_complexConj` is at
  `Mathlib/NumberTheory/NumberField/CMField.lean` line 148 with the statement
  `IsConj φ (complexConj K)` for every `φ : K →+* ℂ`. The composition identity was recomputed:
  `φ∘σ` is an embedding, so `conj∘(φ∘σ) = (φ∘σ)∘ι`, hence `φ∘σ∘ι∘σ⁻¹ = conj∘φ = φ∘ι`. The
  `plan.json` 1.1 locator, the References entry and the MilneCM manifest locator agree.
- **F03 (order-three Check over `𝔽₅`) — repaired.** README lines 597–602: `M = [[0, −1],[1, −1]]`,
  `Φ = [[4, 1],[0, 1]]`, `M³ = 1`, `ΦMΦ⁻¹ = [[4, 1],[4, 0]] = M⁻¹ = M¹¹`, characteristic polynomial
  `X² + X + 1`, with the note that the diagonal model needs `𝔽₂₅`. Recomputed (script in the scratch
  directory): `M² = [[4,1],[4,0]] = M⁻¹`, `M³ = 1`, `M¹¹ = M²`, `Φ² = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]]`,
  `det Φ = 4`, `tr M = 4` so `X² − 4X + 1 = X² + X + 1`; `⟨M, Φ⟩` has order 6; the only cube root of
  unity in `𝔽₅ˣ` (order 4) is `1`.
- **F04 (residual value of `z` in §3.4) — repaired, differently from the suggested text, correctly.**
  README lines 621–623: "Residually this basis is `(e₁, e₂)`, in which `ρ̄(τ) = U`, so `z` lifts the
  upper-right entry `z̄` of `ρ̄(φ)` in that basis … `z − [z̄] ∈ 𝔪_A`, with `[z̄] ∈ O` the Teichmüller
  lift". Checked: `N̄ = U − 1 = E₁₂`, `N̄e₂ = e₁`, so the residual basis is `(e₁, e₂)`; the review's
  `(Ue₂, e₂) = (e₁ + e₂, e₂)` was indeed a slip (in it `U` becomes `[[2,1],[−1,0]]`). The added
  fourth Check (`𝔽₂₅`, `ρ̄(φ) = 1 + ζE₁₂`, `ζ ∉ 𝔽₅`) is consistent: `ρ̄(φ)` commutes with
  `U = U¹¹`, and `ζ + x ≠ 0` for `x ∈ 𝔽₅`. The bijectivity of the parametrisation was rechecked:
  `w = 0` and `α = q_vδ` are forced by `ρ(φ)E₁₂ρ(φ)⁻¹ = q_vE₁₂`, `δ` is the unique Hensel root of
  `δ² = ψ(φ)/q_v` lifting `δ̄` (`p` odd), and the basis change `[[b, 0],[−a, 1]]` has unit
  determinant `b`.
- **F05 (non-headline declarations planned for `Suggested.lean`) — repaired.** README lines 74–83:
  "`Suggested.lean` states no theorem, and its module docstring says why", naming Theorems 2.5,
  6.2 and 8.1 and the missing carriers. No backticked name of this roadmap's own remains: every
  backticked identifier in the README is a Mathlib name, a Tau Ceti name, a supplier's name or
  notation; the resolver reports no Lean name found nowhere. `plan.json` keeps Lean-style `name`
  fields (`sl2AdjointRep`, `isCMField_of_intermediate_cyclotomic`, …) as catalogue names only;
  no roadmap on main, at an open head or on the board cites them.

Adversarial pass on the changed passages: see the rows "1.1 centrality", "3.3 Check (F03)",
"3.4 residual `z`", "gap text" and "5.3 inertial polynomial" in the table below.

## Verified sound

**Principles.** The roadmap develops the general lifting theorem (Theorem 6.2, arbitrary
representation over any CM field at `p = 5` with a protected place), not an elliptic-only
shortcut. The parent EllipticCurveModularityImaginaryQuadratic is imported by section and
declaration name (62 backticked names and 26 sections resolved at its head, below) and never
re-planned; Theorems 2.2–2.4 apply the parent's §§8.3–8.6 over a CM base. Supply is one-directional
(gate below). No copied passage: every cited passage of the sampled targets was compared with the
README wording. No computational algorithm. No `set_option`, no sorry'd data: the design plans no
Lean declaration.

**Dependency check**, run as instructed on the current README:

```
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2384 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier named in `*Needs:*` lines and the supplier contracts
precedes EllipticCurveModularityImaginaryQuadratic in `merge-order/ORDER.txt`, or is on main
(EllipticCurves, ClassFieldTheory, SchemeAndStackFoundations, Chebotarev);
ModularityAndLanglandsExtensions and BianchiModularForms are named only as consumers.

**Citation resolver.** Three "found nowhere" leads (`LeHung26, §4.4` line 340, `OpenAI26, §9.4`
line 449, `CaptainSude26, §4` line 798): manifest ids followed by a section sign, i.e. source
locators, not roadmap citations. False positives, as in round 1. Lean names found nowhere: none.

**Pins.** `lake-manifest.json` of the content checkout: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`,
equal to `plan.json` `baseline` and the README's supplier contracts.

**Library declarations opened at the pins** (file:line): `NumberField.IsCMField`
`Mathlib/NumberTheory/NumberField/CMField.lean`:70 (totally complex and quadratic over
`maximalRealSubfield`, as the README says); `IsCMField.complexConj` :142;
`IsCMField.isConj_complexConj` :148; `IsCMField.ofCMExtension` :510 (hypotheses `[IsTotallyReal F]
[Algebra.IsIntegral ℚ K] [IsTotallyComplex K] [IsQuadraticExtension F K]`, all available in the
§1.1 route for `E/E^ι`); `IsCMField.of_isAbelianGalois` :542; `IsCyclotomicExtension.Rat.isCMField`
:564 (needs `∃ n ∈ S, 2 < n`; the README's "CM or `ℚ`" covers the complement); the file also has
`of_forall_isConj` :519 for `[IsGalois ℚ K]`, which the README does not need (intermediate fields are
not Galois over `ℚ`); no statement on subfields or composita of CM fields, so Theorem 1.1 is not a
duplicate. `NumberField.isTotallyComplex_of_algebra`
`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`:229.
`LieAlgebra.SpecialLinear.sl` `Mathlib/Algebra/Lie/Classical.lean`:92 (a `LieSubalgebra`, no group
action; Mathlib's only `MulAction` of `SpecialLinearGroup` on matrices is on
`FixedDetMatrix` by left multiplication, `Mathlib/LinearAlgebra/Matrix/FixedDetMatrices.lean`:55,
not conjugation). `Rep.ofDistribMulAction` `Mathlib/RepresentationTheory/Rep/Basic.lean`:362;
`groupCohomology.map` `…/GroupCohomology/Functoriality.lean`:141 (`f : G →* H`, `φ : res f A ⟶ B`,
`Hⁿ(H, A) ⟶ Hⁿ(G, B)`); `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` `…/FiniteCyclic.lean`:114;
`Matrix.SL2.commutator_eq_top` `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`:804 (needs
`a ≠ 0`, `a² ≠ 1`, so `#k ≥ 4`; `𝔽₅` qualifies). Tau Ceti:
`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`
`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean`:98 (statement
`#H¹ = #H⁰ · #H² · p^(finrank ℚ_p F · v_p(#A))` for a finite smooth discrete `ZMod n`-module, as the
README says); `TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed`
`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean`:280 (perfect pairing between
`Hⁱ(tateDual A)` and `Hʲ(A)`, `i + j = 2`, finite smooth discrete). Tau Ceti's
`NumberTheory/NumberField/ComplexConjugation/*.lean` (declarations listed) has
`complexConjugationAt` and its restriction to normal intermediate fields, nothing on CM-ness of
intermediate fields.

**Cross-roadmap citations resolved** at the heads of the 2026-11-07 index (line numbers in the
cited README):
- EllipticCurveModularityImaginaryQuadratic #1048: §0.2 (535) `fixed_pairing_twist` 560,
  `fixed_pairing_twist_rational` 586; §0.3 (671) `solvable_preparation` 653,
  `hilbert_local_selection` 652 (it takes "nonempty open subsets `Ω_w ⊂ Y_ρ̄(L_w)` at all the
  finitely many selected places", as §7.4 uses), `seed_modular` 697, `switch_five` 778 ("Let F be
  imaginary CM", i.e. any CM field, `det = ε̄₅`, decomposed generic, partition of `v | 5`, avoidance
  field: exactly §7.4's input), `modular_elliptic_all_coefficients` 676 and its components
  738–741, `auxiliary_local_types` 790; §1.1 861 `switchParameterOpen` 865; §1.3 958 `cyclicCover`
  960; §2.1 1014 `boundary_regular_model` 1022; §2.2 1040 `compactTypeModel` 1042,
  `compact_type_jacobian` 1048; §2.3 1084 `nodalModel` 1086; §4.1 1259 `characterSystem` 1262,
  `character_system_properties` 1266; §4.2 1308 `auxiliaryEllipticCurve` 1320,
  `cubic_character_elliptic` 1321, `trivial_character_twist` 1315; §4.4 1386
  `prime_switch_congruences` 1389; §5.1 1436 `nonCM_elliptic_large_residual_primes`,
  `cyclotomic_switch_field` 1519 (proves `ζ₅ ∉ F` for imaginary quadratic `K` by ramification, as
  the Scope paragraph says); §5.2 1537 `potentiallySemistableCM` (any CM `L`, with the `ℓ = 5`
  projective-field clause); §5.3 1599 `cm_modularity` 1601 ("for any CM number field `L` with
  `ζ₅ ∉ L` … for some `ℓ ∈ {3,5}` its mod-`ℓ` representation is decomposed generic and absolutely
  irreducible on `G_{L(ζ_ℓ)}`": exactly Theorem 2.1(b)'s use with `L = K`, `ℓ = 5`); §6.1 1643,
  §6.3 1702, §6.5 1760, §6.6 1803; §7.1 1855 `switchCoefficient` 1866, `character_regular_word`
  1871; §7.2 1904; §7.4 1981 `simultaneous_specialization` 1987 (arbitrary number field `k`,
  prescribed nonempty opens at a finite set of places containing those above `3p`, conclusions
  (1)–(3) as Theorems 2.1 and 7.5 use them); §8.1 2088 both names; §8.3 2141; §8.4 2188; §8.5 2227
  `complexInfinityParameter` 2250, `elliptic_full_local_comparison` 2231; §8.6 2285
  `cm_elliptic_realization` 2289; `imaginary_quadratic_modularity` 12; Downstream consumers and
  boundaries 2352 (places other CM fields outside its scope and records `K₆₀` exactly as the Scope
  paragraph says, lines 2386–2396).
- CrystallineLocalGlobalCompatibilityCM #1182: §7.5 1447; §§8.1–8.7 1489 ff.; §9.1 1616 (data
  (1)–(15), with "either `ζ_p ∈ F` with `S = S_p ∪ R`, or two auxiliary places"); §9.3 1654 (keeps
  the `p = 5` projective-field exclusion; its Check "For `[F⁺:ℚ]=1`, `|S|=1`, `q=3` … `g=0`" is the
  formula §4.3's first Check compares with); §9.4 1676 (`Iw_{v,1}` at `S − (S_p ∪ R)`, which the
  protected datum does not use); §9.5 1702; §9.6 1722; §9.7 1738 (consumes
  `AutomorphicGaloisRepresentationsPartII:AG2.5`); §9.8 1746; §9.9 1766; §9.10 1774; §9.11 1794;
  §9.12 1810 (carries clause (4)).
- AutomorphicGaloisRepresentationsPartII #1006: AG2.0 641 (`AlgHeckeChar.galoisChar` 752); AG2.5
  1819 (its targets state Varma's and Caraiani's characteristic-zero comparisons; the word
  "torsion" occurs only in trace-formula remarks; no statement of ACC Theorem 3.1.1); AG2.7 3409
  with `IsDecomposedGenericPrime` 3507 (`p ≠ ℓ`, completely split, unramified and ACC-generic at
  every `v | p`), `decomposedGenericPrime_local` 3508, `IsDecomposedGeneric` 3529; its Check "`F = ℚ`,
  `k = 𝔽₃`, `r = 1 ⊕ 1`, `p = 2` is a witness" agrees with Theorem 1.2's second Check.
- PotentialAutomorphyInfrastructure #1081: §2.1 790 `genericity_normal_closure_restriction`; §2.3 820
  `soluble_base_change_and_descent` (parts (1) base change with `r_ι(π)|G_E` irreducible and (2)
  descent, `E/F` soluble, both imaginary CM or totally real; second Check is the non-cuspidal CM
  case Theorem 2.1 cites); §2.5 842 `auxiliary_cm_extension_prescriptions` (every place of `S` split
  completely, CM refinement); its supplier table line 211 cites AG2.5 for ACC Theorem 3.1.1, as the
  gap text says.
- GlobalGaloisDeformations #920: §3.4 440, §3.6 (relative tangent space, framed terms at `T`), §3.7,
  §5.1 1081 (level-`N` datum: `Nv ≡ 1 mod pᴺ`, distinct eigenvalues, dual condition zero), §5.5,
  §5.6 (detecting class per nonzero class plus a padding class, exactly `q` primes outside `B`).
- LocalGaloisDeformationRings #923: §1.10 1430; §2.3 1692 (`ker((ρ(σ)−I)^j)` free direct summands
  of the residual ranks); §2.5, §2.6, §2.8; §2.15; §2.16 (`dim L − h⁰ = 1`, with the `p = 5`,
  `q = 11` example); §2.21 (regular unipotent residual inertia: unipotent lifts are minimal); §3.14
  2434; §§4.14–4.15 2665; §6.6 2979.
- ArithmeticGaloisRepresentations #856: Layer 1 712; §4.3 3108; §6.3 4103 (Tate curve: `κ = v(q)t_ℓ`
  on inertia, `WD ≅ Sp(2)`, `E_q[ℓⁿ]` unramified iff `ℓⁿ | v(q)`); §7.7 4991 (Sylow injectivity;
  `H¹(SL₂(F), ad⁰) = 0` for odd `#F ≠ 5`; `H¹(SL₂(𝔽₅), ad⁰)` one-dimensional; coefficient change).
- ArithmeticGaloisDuality #858: R02.2 (layer table line 28, Hochschild–Serre and
  inflation–restriction), R02.4.2 3119. FaltingsFinitenessAndIsogenyTheorems #1004: R28.6.2 2688,
  R28.6.3 2716. NeronModelsAndSemistableAbelianVarieties #852: §3.1 1454, §3.12 1901 (`N ≥ 3`
  invertible, trivial inertia on `A[N]` gives semistability), §5.1 3024. GL2ModularityLifting
  #1071: §1.7 419 `cht_soluble_prescribed_completions` (arbitrary number field, prescriptions at
  finite and archimedean places). GL2AutomorphicRepresentationsAndTransfer #931: R16.3.2 918,
  R17.4.16 2246 (cuspidal iff `θ ≠ θ^σ`). AbelianSchemesAndArithmeticModuli #849: Layer A6 2804.
  PotentialModularityAndCompatibleSystems #1075: §§2.12–2.16 764 ff.
  DeformationAndDerivedPatchingAlgebra #1034: §§8.1–8.5 1584 ff. AutomorphicGaloisRepresentations
  #1007: §3.13 1666. ModularityAndLanglandsExtensions #1180: §2.29 1272, §2.30. EllipticCurves
  (main): Layer 4 794, Layer 5 1155. ClassFieldTheory (main): Layer 5 921, Layer 11 1684.
  SchemeAndStackFoundations (main): §4.13 5644, §4.18. Chebotarev (main): Layer 10 411.
  BianchiModularForms #1719 cites the parent's `imaginary_quadratic_modularity` (294), nothing of
  this roadmap.

**Overlaps and ownership.** `scratch/overlaps.md`: no open pull request changes this roadmap, no
cited id is dropped by an open pull request, none is defined only by an open revision. Ownership by
object over main and all 472 open heads (`roadmaps grep`): "protected place", "unipotent-inertia",
"Steinberg-protected", `H¹(SL₂(𝔽₅), ad⁰)` and "CaptainSude" match nothing; "width-three" matches
only a Tate-chart remark in AlgebraicModularFormsAndSerreWeights; "intermediate field … CM" matches
nothing on this object; "Theorem 3.1.1" of ACC is owned nowhere (the hits are other papers' theorems
and PotentialAutomorphyInfrastructure's consumer row), so the gap is correctly a gap. The board
index lists three packages (AnalyticNumberTheory, LawrenceVenkateshMethod,
LogicAndDefinabilityInNumberTheory), none related.

**Sources: the seeded sample, read at the locators in the cached texts.**
- 1.1: MilneCM lines 273–295 (Proposition 1.4 (a)–(c) with proof, the "exactly one complex
  conjugation" note at 289–290, Corollary 1.5 at 292–293: a finite composite of CM subfields and
  the Galois closure of a CM field are CM); LeHung26 Lemma 5.1 line 357 (descent along abelian
  extensions of CM fields) and OpenAI26 lines 1185–1186 (intermediate fields are CM), the use the
  README names.
- 1.2: LeHung26 lines 308–321 ("All conjugates": Chebotarev over `D ⊇ K^nor(μ_{15p})`, "This is
  decomposed genericity: over `K` for `A_t[5]`, and over `F` for the pairs"; absolute irreducibility
  on `G_D ⊂ G_{F(ζ_ℓ)}`). The README's (a) is the descent step implicit there, proved here in full.
- 2.1: LeHung26 §4.5(1) line 336, §4.6 lines 342–343 ("By [14, Theorem 6.1], `A_t` is modular over
  `K`, hence over `F` by solvable base change, cuspidally since `A_t` is non-CM"), Remark 4.2 lines
  352–355 (`K₆₀`, "We do not claim `ζ₅ ∉ F`"); CN23 Theorem 6.1 lines 4513–4517 (CM `F` with
  `ζ₅ ∉ F`, condition (2) at five).
- 2.4: OpenAI26 §9.4 lines 1200–1215 (endomorphisms over `KM`; induction if `M ⊄ K`, isobaric sum if
  `M = K`; trivial central character); LeHung26 lines 364–366; CaptainSude26 lines 676–683
  ("the two infinity characters are distinct, so the character is not invariant").
- 3.1: CaptainSude26 Lemma 3.1 line 187 (`e, f, h`) and line 191 (`D(e) = e`, `D(h) = h − 2e`,
  `D(f) = f + h − e`).
- 3.3: CaptainSude26 lines 177–183 (the local form with `μ₅ ⊂ F_v`, `ρ̄(τ) = U`, `ρ̄(φ) = 1`,
  `φτφ⁻¹ = τ^{q_v}`) and 533–536 (split Tate curve: inertia nontrivial unipotent iff `5 ∤ v(Δ)`). The
  README's definition drops `μ₅ ⊂ F_v` and `ρ̄(φ) = 1`; the generalised statements of §§3.3–3.5 were
  recomputed below at every `q_v`.
- 4.2: CaptainSude26 Lemma 3.4 lines 242–263 (`g = diag(2,3)`, coinvariants the diagonal line,
  Chebotarev, degree-one primes, splitting in imaginary quadratic subfields, zero dual condition at
  Taylor–Wiles primes); AKT23 Lemma A.5 lines 3979–3986 (the `p = 5` projective-field hypothesis
  that §4.2 replaces).
- 4.3: CaptainSude26 lines 416–444 (`T = S ∖ P`, the relative dual Selmer group with `L_v^⊥` at
  `P ∪ Q`, `g = r − 3d − 1 + t` at 439, "a protected place has both dimensions equal to 1",
  generator surjection without local smoothness at `P`).
- 5.2: CaptainSude26 lines 285–289 (rings at `S₅^cr`, `S₅^st`, `R`, `P`); CN23 line 4361 (`𝒮_{χ,Q}`).
- 5.3: CaptainSude26 Lemma 4.1 lines 291–300; CN23 Propositions 5.6.2–5.6.3 lines 4334–4390 (both
  invoke ACC Theorem 3.1.1, at 4352 and 4388); ACC23 §3.1 lines 2309–2345 and Theorem 3.1.1 lines
  2346–2355.
- 5.4: CaptainSude26 Theorem 4.2 lines 410–415 (hypotheses 1–3) and proof lines 476–498
  (`dim R^loc = 1 + 3t + 2d`, `dim R_∞ = r + 4t − d`, `dim S_∞ = r + 4t`, matching components at
  five, no protected-place component labels); CN23 Proposition 5.6.1 lines 4261–4265 and the data
  (1)–(15) at 4226–4260 ((14) notes `q_v ≡ 1 mod p` on `R` follows from triviality, which
  justifies §5.4's "possible since `q_v ≡ 1 mod 5` at `R`").
- 6.2: CN23 Theorem 5.2 lines 3849–3872 (conditions (1)–(5) as restated), Lemma 6.1.4 lines
  4562–4572 (determinant of order 2 or 4; a subgroup of `SL₂(𝔽₅)` onto `PSL₂(𝔽₅)` is all of it);
  CaptainSude26 §4 lines 264–289 and Theorem 4.2.
- 7.4: CaptainSude26 Proposition 5.2 lines 538–556 (preparation over `K⁺`, trivial prescriptions
  above `q` and below `V`, ACC §6.5.12 witnesses) and 600–603; CN23 Proposition 6.1.5 lines
  4574–4595; CHT08 Lemma 4.1.2 line 5723, on printed page 116 (page marker at line 5683), with the
  statement the README attributes to it.
- 7.5: CaptainSude26 Proposition 2.3(3)–(4) lines 120–125 (`A_t[5]` decomposed generic over `K`,
  image `SL₂(𝔽₅)` when `μ₅ ⊂ K`; finitely many further local opens), Corollary 5.3 lines 604–609.
- 8.1: CaptainSude26 Theorem 1.1 lines 26–30 and its proof lines 671–683 (`K' = K(μ₅)`, Proposition
  6.2, solvable descent, CN Lemma 6.1.3 for the local parameters); LeHung26 Remark 1.3.1 line 125.
- Also read: ACC23 line 7163 (§6.5.12 imaginary quadratic fields `E_a, E_b, E_c`) and Proposition
  6.5.13 line 7066; LeHung26 Theorem 1.1 line 86, §4.3 lines 292–299; OpenAI26 Proposition 9.3 line
  1131 and Lemma 9.4 lines 1163–1184 (page 27 marker at 1161). All eight manifest entries are in
  the cache with the recorded SHA-256; no entry is wrong; every work the README cites is in the
  manifest; no `needs-references.toml` was needed.

**Adversarial pass.** Values computed by hand or by the script `calc/adv.py` in the scratch
directory (matrix arithmetic over `𝔽₅`, cocycle spaces by consistency along a breadth-first
enumeration of `SL₂(𝔽_q)` on generators `U`, `Uᵀ`, unit groups mod 20 and 60).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Convention: arithmetic Frobenius `φτφ⁻¹ = τ^q` | `U` over `𝔽₅`, `q = 11, 7` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ ≡ 3`, `U³ = [[1,3],[0,1]]` | pinned as stated | — |
| Convention: `Ad(U)` on `(e,h,f)` | `p = 3, 5, 7` | columns `(1,0,0)`, `(−2,1,0)`, `(−1,1,1)` at each `p`; `(D−1)²f = −2e`, `(D−1)³ = 0`, `D^p = 1` | correct | — |
| 1.1 centrality of `ι` (F02 text) | `φ∘σ` an embedding | `conj∘(φ∘σ) = (φ∘σ)∘ι` and `conj∘φ = φ∘ι` give `φ∘σ∘ι∘σ⁻¹ = φ∘ι`; `φ` injective | `σισ⁻¹ = ι` | — |
| 1.1 intermediate fields | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `S = {1,2}`; `ℚ(√5)`; `ℚ(√−3)`, `S = {4}` | `Gal = {1,9,13,17}`, orders `(1,2,4,4)`, cyclic; `{a : a mod 5 square} = {1,9}` fixes `ℚ(i,√5)`; `L = K`; `ℚ(√5)` totally real (not `⊇ K`); `ℚ(ζ₁₂)` abelian | true for `E ⊇ K`; Checks correct | — |
| 1.1 `E^ι` totally real, `[E:E^ι] = 2` | `E = ℚ(i,√5)` | `ι` restricts nontrivially (E totally complex); fixed field `ℚ(√5)`, index 2; `ofCMExtension` hypotheses present | holds | — |
| 1.2 descent of genericity | `K = F = ℚ`; `1⊕1` mod 3 over `ℚ` vs `ℚ(ζ₃)` | ratio `1 ≠ 2 = q` at `q = 2` (ACC's ratio `≠ q_v` only, as AG2.7); over `ℚ(ζ₃)` split primes `≡ 1 mod 3`, ratio `1 = q` | (a),(b) hold; converse fails; `F_w = K_v = ℚ_q` gives equal decomposition groups | — |
| 1.3 `K₆₀` | `(ℤ/60)ˣ` | fixer `{1, 29}`; `29 ≡ 4 mod 5`, `≡ 2 mod 3`; degree `16/2 = 8`; `K₆₀(ζ₃)` fixer `{1}` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` | — |
| 2.1 seed before base change | `K₆₀`; imaginary quadratic `K`; CM `A_t` | `cm_modularity` needs `ζ₅ ∉ L`: applies at `L = K₆₀`, not at `F ∋ ζ₅`; duality preserves both residual properties (Conventions); PAI §2.3(1) needs `r_ι(π)|G_F` irreducible: non-CM gives it | hypotheses exactly the parent's §5.3 and PAI §2.3(1) | — |
| 2.4 CM branch | `ℚ(ζ₈)` with `y² = x³−x`, `y² = x³+1`; `y² = x³−x` over `ℚ(√−3)` | `ζ₈² = i ∈ ℚ(ζ₈)`: sum; `ℚ(ζ₈) = ℚ(i,√2) ∌ √−3`, `KM = ℚ(ζ₂₄)`: induction; `ℚ(√−3) ∌ i`: induction from `ℚ(ζ₁₂)`; `θ^σ = θ' ≠ θ` by infinity types | correct; `KM` is CM (Milne Cor. 1.5) | — |
| 2.5 endpoint | imaginary quadratic; `ℚ(ζ₅)`; `K₆₀` | reduces to `imaginary_quadratic_modularity`; excluded; included with `ζ₅ ∈ K₆₀(μ₃ₚ)` | correct | — |
| 3.1 `ad⁰` | `U`, `−1`, `diag(2,3)`, left multiplication, char 2 | `Ad(diag(2,3)) = diag(4,1,4)`; `Uf = f + E₁₁` trace 1; Gram `[[0,0,1],[0,2,0],[1,0,0]]` det `−2`; `M^G = 0` at `p = 3,5,7` (`dim B¹ = 3`) | conjugation, not left multiplication; odd `p` for self-duality | — |
| 3.2 restriction bijective | `SL₂(𝔽_q)`, `q = 3, 5, 7` | `q=5`: order 120, `dim Z¹ = 4`, `dim B¹ = 3`, `dim H¹ = 1`; norm `Σ_{i<5}D^i = 0`, `H¹(⟨U⟩) = M/(ke⊕kh)` dim 1; `f`-coordinate of `c(U)` is `(0,1,0,0)` on a `Z¹` basis and `0` on `B¹`. `q=7`: order 336, `dim H¹ = 0`, norm `0`, `H¹(⟨U⟩)` dim 1. `q=3`: order 24, `dim H¹ = 0`, norm `= (D−1)²` of rank 1, `H¹(⟨U⟩) = 0` | bijective at 5, injective not surjective at 7, zero at 3 | — |
| 3.3 protected: API | `ρ̄(φ) = [[a,b],[c,d]]`, `U^q` | `ρ̄(φ)E₁₂ = [[0,a],[0,c]]`, `qE₁₂ρ̄(φ) = q[[c,d],[0,0]]` ⇒ `c = 0`, `a = qd`; `q ≡ 1`: `a(1+bE₁₂)`, `φ ↦ φτ^x` adds `x ∈ 𝔽_p` to `b` | normal form only for `q ≡ 1`, scalar only for `b ∈ 𝔽_p` | — |
| 3.3 Checks | Tate `v(q) = 1, 3, 15`; F03 pair; index-5 base change | inertia `[[1,v(q)],[0,1]]`, trivial iff `5 | v(q)`; `M³ = 1`, `ΦMΦ⁻¹ = M² = M⁻¹ = M¹¹`, charpoly `X²+X+1`, `⟨M,Φ⟩` of order 6; `U⁵ = 1` | definition discriminates | — |
| 3.4 residual `z` (F04 text) | basis `(Ne₂, e₂)`; `𝔽₂₅`, `ζ ∉ 𝔽₅` | `N̄e₂ = e₁`; `ρ(φ) = [[qδ, z],[0,δ]]` forced (`w = 0`, `α = qδ`); `δ² = ψ(φ)/q`, Hensel unique for odd `p`; `ζ + x ≠ 0` for `x ∈ 𝔽₅`; `det[[b,0],[−a,1]] = b` unit | three coordinates `a`, `b−1`, `z−[z̄]`; `O[[x₁,x₂,x₃]]` | — |
| 3.4 (i)⇔(ii)⇔(iii) | `N² = tr(N)N − det(N)`; `b` unit; LGDR §2.3 | `N² = 0` ⇒ `tr(N)b = 0` ⇒ `tr N = 0 = det N`; `det(1+N) = 1 + tr N + det N`; `ker N` rank-1 summand and `ker N²` everything ⇔ `N² = 0` | equivalences hold | — |
| 3.4 Steinberg relation | `q = 11`, `ρ(φ) = diag(11,1)` | `11·12² = 1584 = 12²·11` | holds | — |
| 3.5 (a)–(d) | `q = 11, 31` (`≡ 1`), `7` (`≡ 2`), `19` (`≡ −1`) | `M^I = ke`; `φ` scales `e` by `q`, `e(1)` by `q²`: `h⁰(M), h⁰(M(1)) = (1,1), (1,1), (0,0), (0,1)`; `dim L_v = 3 − (3 − h⁰) = h⁰`; `#H¹_ur(N) = #N^I/(φ−1) = #H⁰(N)`; `#H¹(M) = #H⁰(M)#H⁰(M(1))`; `q = 19`: `L_v = 0`, `L_v^⊥ = H¹(M(1)) = H¹_ur(M(1))` of dim 1 | (a),(b) at every `q`; (c),(d) need `μ_p`; cocycle count `(D−1)c(φ) = 0` since `Σ_{i<q}D^i = q + C(q,2)X + C(q,3)X² = 1` for `5 | q−1` | — |
| 4.1 exceptional classes | `Gal(LC_N/F) = SL₂(𝔽₅) × A`; order-2 inertia; `SL₂(𝔽₇)` | `H¹(G×A, M) = H¹(G, M)` since `Hom(A, M^G) = 0`; `I_v ↠ ⟨U'⟩` order 5 Sylow; inflation `H¹(ρ̄(I_v), M) → H¹(I_v, M)` injective; `H¹(C₂, 𝔽₅) = 0`; `H¹(SL₂(𝔽₇), ad⁰) = 0` | "protected" necessary and sufficient | — |
| 4.2 Taylor–Wiles primes | `diag(2,3)`; framing `P`; `H_∅ = 0`; `g ≥ 0` | `2·3 = 6 ≡ 1`; coinvariants `kh`, dim 1; `κ(gσ) = κ(g) + κ(σ)` for `g ∈ G_{LC_N}` with `κ(G_{LC_N})` spanning `M`; at `w ∈ Q`: `h⁰ = 1`, `h² = 1`, `h¹ = 2 = dim L_w`, `L_w^⊥ = 0`; inflated class is a coboundary on `⟨g⟩` of order prime to 5; Wiles' formula at `Q = ∅` gives `dim H_∅ ≥ 3d + 1 − t`, so `r ≥ dim H_∅` forces `g = r − 3d − 1 + t ≥ 0` | detection needs `P` unframed; `r ≥ dim H_∅` suffices | — |
| 4.3 presentation | `d=2,t=1,r=6`; `d=2,t=3,r=10`; `d=1` | `g = 6 − 6 − 1 + 1 = 0`; `dim R^loc_T = 1 + 9 + 4 = 14`, `g = 6`, `20 = r + 4t − d`, `22 = r + 4t`; `d = 1` incompatible with `μ₅ ⊂ F` | formula consistent with CLGC §9.3; first Check on a non-instance | R02 |
| 5.1 prepared datum | degrees `(1,1,6)`, `(1⁸)` at `d = 8`; `(2,2,6)`, `(2⁵)` at `d = 10`; `P = ∅`; `v^c ∈ R` | `(1,1,6)`: sums `6 > 4`, `6 > 4`, `1 < 4` but residue fields `𝔽₅` at the degree-one places; `(2,2,6)`: `6 > 5`, `6 > 5`, `2 < 5` with residue fields `𝔽₂₅`; `(2⁵)`: `6 > 5`; minimal `d = 10`; clause (15) fails for image `SL₂(𝔽₅)` with `ζ₅ ∈ F`; `P^c ∩ S = ∅` violated | definition discriminates; third Check false | R01 |
| 5.2 problems | `Q = ∅`; `χ = 1`; `d = 10`, `t = 10`, `R = ∅` | `dim R^loc_χ = 1 + 30 + 20 = 51`; LGDR §2.5 is for trivial residual data | consistent; `d = 1` Check on a non-instance | R02 |
| 5.3 inertial polynomial (gap text) | full Iwahori, trivial character; `Iw_{v,1}`; `S^c`-stability | unit torus operators act as `1`: `P_{v,σ} = (X−1)²` for `σ ∈ I_v`; at `Iw_{v,1}` they act through `k_vˣ`; ACC needs `S = S^c`: take `S ∪ S^c`, `R_ACC = R ∪ P`, then `P^c ⊆ R_ACC^c ∖ R_ACC` is hyperspecial and the representation is of `G_{F,T}` with `P^c ∉ T` | route sound modulo the declared gap; `W_{F_v}` in the gap, `I_v` used | — |
| 5.4 prepared lifting | `ζ₅^{±1}` inertia; components; `d = 10` | not a point (fails (i)); deficit `r + 4t − (r + 4t − d) = d = l₀`; at `R`, `det ρ̄ = ε̄₅⁻¹` trivial gives `q_v ≡ 1 mod 5` so `χ_v² ≠ 1` exists | consistent; `d = 1` Check on a non-instance | R02 |
| 6.1 preparation | index-5 ramification at `P`; `v = v^c`; `F = ℚ(ζ₅)` | `U⁵ = 1`; `v = v^c` means `v̄` inert or ramified in `F/F⁺`, contradicting "unramified at `v^c`"; `ℚ(ζ₅)` has only `ℚ(√5)` | hypothesis at `v^c` necessary | — |
| 6.2 lifting | `ζ₅ ∉ F`, `det` of order 2 or 4; `ζ₅ ∈ F`; imaginary quadratic `F` | `2² = 4 = −1`, `det(2g) = 4·(−1) = 1`; order 2: `[G:H] = [F(ζ₅):F] = 2`; order 4: `4 > 2 = [PGL₂:PSL₂]`; `ζ₅ ∈ F`: preimage of `PSL₂(𝔽₅)` in `SL₂(k̄)` is `SL₂(𝔽₅)`, perfect, no index-2 subgroup; `[ℚ(ζ₅):ℚ] = 4` | (4) fails iff `ζ₅ ∈ F` and image `SL₂(𝔽₅)`; argument uses only the determinant | — |
| 7.3 Tate places | `v(q) = 3, 15`; non-split | inertia `[[1,3],[0,1]]` resp. trivial; residual Frobenius `[[1,b],[0,1]]` killed by `φ ↦ φτ^x`, `x ≡ −b/v(q)` (needs `q_v ≡ 1`, i.e. `μ₅ ⊂ K_v`, as stated); non-split: diagonal `−1`, twist of Steinberg has Iwahori vectors | correct | — |
| 7.4 retained switch | `Σ = ∅`; `Σ` above 2; quadratic completion | reduces to `switch_five`; conflicts with the Tate condition at 2; `L_{w'} = F_w` iff trivial prescription at `w̄`, then `Y_ρ̄(L_{w'}) = Y_ρ̄(F_w)` | correct; `hilbert_local_selection` admits finitely many opens | — |
| 7.5 protected seed | transvections mod 5; `det` over `ℚ(ζ₅)`; CM; opens | `⟨[[1,3],[0,1]],[[1,0],[3,1]]⟩` has order 120, a single transvection order 5; `det = ε̄₅` trivial on `G_K`; `SL₂(𝔽₅)` perfect of order 120 excludes an abelian subgroup of index `≤ 2`; split-multiplicative-with-`5 ∤ v(Δ)` and good-reduction loci are open in `Y_ρ̄(K_w)` (semistable since `ρ̄` unramified at `w ∤ 5`, NMSAV §3.12) and contain `A_t`'s point | image `SL₂(𝔽₅)`, non-CM; Theorem 6.2's hypotheses met over `L` | — |
| 8.1 headline | `ℚ(ζ₅)`, `K₆₀`, imaginary quadratic, `ℚ(i,√5)` | `Gal(ℚ(i,√5)/ℚ) = (ℤ/2)²` vs cyclic of order 4; `K₆₀(ζ₅)` fixer `{1,29} ∩ {a ≡ 1 mod 5} = {1}`, so `= ℚ(ζ₆₀)`; both branches agree by strong multiplicity one; the `t` of §7.5 is a switch parameter in the Conventions' sense (finite set of places containing those above `3p`) | consistent with Theorems 2.1–2.5 and 7.5 | — |

**Context and generality.** Every theorem names its field hypotheses (CM, `μ₅ ⊂ F` where used,
`ζ₅ ∉ K` in 2.1 and 2.5); Layer 3 is stated for odd `p`, Layers 4–6 at `p = 5` with the reason
(`H¹(SL₂(𝔽_p), ad⁰) ≠ 0` only at 5, computed above for `p = 3, 5, 7`). No statement is quantified
over arbitrary data without a tie to the construction. No hypothesis contains its conclusion. Steps
taken from inside proofs (CaptainSude26 Lemma 3.1 at general `q_v`, the counting in §3.5(b), the
determinant argument of CN Lemma 6.1.4 for a general `ρ̄`) were re-derived at the generality
restated here. The generalisation of the protected place to `q_v ≢ 1 mod 5` was checked through
§3.4 (smooth of relative dimension 3 at every `q_v`), §3.5(a) (`dim L_v − h⁰ = 0`), §4.1 (uses only
protection) and §5.3 (ACC's hypotheses at `R ∪ P` need only Iwahori level and the imaginary
quadratic splitting of §5.1(i)).

**Shape.** Summary; Scope and ownership (where the parent stops, owned here, imported, outside,
Lean, status of the sources); Conventions with pinned witnesses; Exact supplier contracts (Mathlib,
Tau Ceti, parent, CrystallineLocalGlobalCompatibilityCM, other roadmaps, Supplier obligations with
the gap in the package form); How to read the build; eight layers each ending with Examples and
Dependencies; Downstream consumers; References. Four definitions (3.1, 3.3, 5.1, 5.2) with API lists
of 5, 3, 4, 4 bullets and 4, 4, 4, 3 Checks; twenty-four theorems with hypotheses, a locator and three
or four Checks each; every `*Needs:*` line item by item. `plan.json` has 28 targets and 90 tests; its
3.5 and 8.1 carry one more test than the README's Checks, both covered by the README's merged first
Check of 3.5 and the Layer 8 Examples. No process residue, no pull-request numbers, no LaTeX
delimiters, no "optional" or "deferred", no `lemma` keyword (the word occurs only in source
locators), no machine path. Elaboration: not available (this lane does not elaborate); the design
plans no Lean declaration, so there is no `#check` comparison to run.

**Gap.** `acc-torsion-inertial-comparison`: supplier AutomorphicGaloisRepresentationsPartII AG2.5
(earlier in the merge order), `needs` a single sentence, the hypotheses spelled out in the README
against ACC23 §3.1 (checked line by line above), needed exactly by 5.3, not provided by Mathlib, Tau
Ceti, AG2.5 at its head or any roadmap on main or at an open head. Precise, minimal, declared with
the same slug in `plan.json` and the README.

**Manifest.** Eight entries, all `certified`, SHA-256 matching the cache, legal sources (Hexagon,
author's GitHub release, openai/math repository, arXiv, Numdam, author's page); every work the README
cites has exactly one key; `cited_for` lists match the sections that cite each work.

## Not verifiable

- The global patching argument of CaptainSude26 (Theorem 4.2) and its reliance on CN23's support
  propagation (§5.4) are unrefereed. I checked the dimension counts, the dual Selmer formula, the
  Taylor–Wiles detection and the field conditions against CN23 §5.6 and ACC23 §3.1; I did not
  re-prove the patching argument itself.
- The `I₃` geometry of §7.1 (not in this round's sample) was reviewed in round 1 with computed
  values and not re-derived here.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1b7c2680a205226d6f98e39bb9cb2334a1a4eb93", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~2", "model": "fable", "worker": "chris-x17"} -->
