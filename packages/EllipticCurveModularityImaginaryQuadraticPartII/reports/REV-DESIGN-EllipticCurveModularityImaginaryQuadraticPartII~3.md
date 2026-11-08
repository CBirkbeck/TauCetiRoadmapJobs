<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7660#issuecomment-6715768758 -->
Review (claude) of 8c844f8

Verdict: needs_changes

1. **F01** (P2) §6.2 assumes that failure of clause (4) forces `ζ₅ ∈ F`, which holds only for `𝔽₅`-coefficients

   Location: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` lines
   979–981, "Suppose (4) fails. Then `ζ₅ ∈ F`: for `ζ₅ ∉ F` the determinant `ε̄₅⁻¹` has order two or
   four on `G_F`, and the argument of CN23 Lemma 6.1.4, which uses only the determinant, gives (4)";
   first Check, lines 993–996, "the projective images of `G_F` and `G_{F(ζ₅)}` are both `PSL₂(𝔽₅)`";
   `design/plan.json` line 1038, test `lifting_det_order_two`.

   Claim: for every `ρ̄ : G_F → GL₂(k̄)` with `det ρ̄ = ε̄₅⁻¹` and `ζ₅ ∉ F`, clause (4) of CN23
   Theorem 5.2 holds; hence the protected alternative of Theorem 6.2 is only ever invoked with
   `ζ₅ ∈ F`, where `ρ̄(G_F)` is conjugate to `SL₂(𝔽₅)` and §§6.1, 5.4 apply.

   Witness: CN23 Lemma 6.1.4 (line 4562) is stated for `r_{E,5}`, with values in `GL₂(𝔽₅)`; its
   order-two case uses that `2g ∈ SL₂(𝔽₅)` when `det g = −1`, i.e. the coefficients. Over
   `k = 𝔽₂₅` take `μ` with `μ² = 2`, `h = diag(1, 2)` and `Γ̃ = ⟨SL₂(𝔽₅), μh⟩ ⊂ GL₂(𝔽₂₅)`, of order
   240: `det(μh) = μ²·det h = 2·2 = 4 = −1`, so `det Γ̃ = {±1}` and the order-two case applies;
   `tr(μh) = 3μ ∉ 𝔽₅`, so `Γ̃` is not conjugate into `GL₂(𝔽₅)`; its projective image is
   `PGL₂(𝔽₅)` (order 120, since `det h = 2` is a non-square), while the projective image of the
   index-two subgroup `SL₂(𝔽₅)` is `PSL₂(𝔽₅)` (order 60). For `ρ̄` with image `Γ̃`, `ker det = G_{F(ζ₅)}`
   and `[F(ζ₅):F] = 2`: the projective kernel `G` has index 120 in `G_F`, the projective kernel `H`
   of `G_{F(ζ₅)}` has index `2·60 = 120`, so `H = G` and the projective field contains `F(ζ₅)`:
   (4) fails with `ζ₅ ∉ F`. Such a `ρ̄` is decomposed generic and absolutely irreducible on
   `G_{F(ζ₅)}`, so no hypothesis of Theorem 6.2 excludes it; the route then has neither the parent's
   §5.2 (clause (4) fails) nor §§6.1, 5.4 (image not `SL₂(𝔽₅)`, `ζ₅ ∉ F`). The normalizer argument:
   the projective image of `G_F` normalizes `PSL₂(𝔽₅)` in `PGL₂(k̄)`, whose normalizer is `PGL₂(𝔽₅)`,
   so it is `PSL₂(𝔽₅)` or `PGL₂(𝔽₅)`; an element `λh` of `ρ̄(G_F)` (`h ∈ GL₂(𝔽₅)`, `λ ∈ k̄ˣ`) lies
   projectively in `PSL₂(𝔽₅)` iff `λ ∈ 𝔽₅ˣ`, and `λ ∈ 𝔽₂₅ ∖ 𝔽₅` with `λ² ∈ 𝔽₅` a non-square is
   consistent with `det = −1`. The order-four case of CN's lemma does hold for any `k`
   (`[G_F:H] = 240 > 120 ≥ [G_F:G]`).

   Repair (tested on the instance above). (1) State the protected alternative of Theorem 6.2 with
   `ζ₅ ∈ F`: "Suppose either that clause (4) holds, or that `ζ₅ ∈ F` and there is a nonempty finite
   set `P` …". (2) Replace lines 979–981 by: "If (4) holds this is the parent's §5.2
   `potentiallySemistableCM`. Otherwise `ζ₅ ∈ F` by hypothesis; the determinant is trivial, …" and
   delete the sentence "for `ζ₅ ∉ F` … which uses only the determinant, gives (4)". (3) Replace the
   first Check by: "If `ζ₅ ∉ F`, `det ρ̄ = ε̄₅⁻¹` has order two and `ρ̄` takes values in `GL₂(𝔽₅)` (as
   the mod-5 representation of an elliptic curve does), an element of determinant `−1` times `2` has
   determinant `(−1)·4 = 1`, so the projective images of `G_F` and `G_{F(ζ₅)}` are both `PSL₂(𝔽₅)` and
   (4) holds (CN23, Lemma 6.1.4); for `k = 𝔽₂₅`, `μ² = 2`, `h = diag(1, 2)`, the group
   `⟨SL₂(𝔽₅), μh⟩` has determinants `{±1}`, projective image `PGL₂(𝔽₅)` and projective field containing
   `F(ζ₅)`, so (4) fails although `ζ₅ ∉ F`: the hypothesis `ζ₅ ∈ F` of the protected alternative is
   not a consequence of the failure of (4)." (4) Update `plan.json` 6.2's `statement` and the test
   `lifting_det_order_two` to the same text. §7.5 applies Theorem 6.2 over `L ⊇ K ∋ ζ₅` (line 1144)
   and §8.1 only through §7.5, and the Downstream paragraph (line 1224) already restricts to "a field
   containing `ζ₅`", so no other target changes. Computed: `2·2 = 4 ≡ −1 (mod 5)`, `3μ ∉ 𝔽₅`,
   `|PGL₂(𝔽₅)| = 120 = 2·60`, `|Γ̃| = 240`, `(μh)² = 2h² ∈ SL₂(𝔽₅)` (`det = 16 = 1`).

One finding, P2, in a passage no repair touched (§6.2, a sampled target): the reduction of the
protected lifting theorem to Caraiani–Newton's clause (4) is proved only for mod-5 representations
with coefficients in `𝔽₅`, while the theorem admits any coefficient field. Both round-2 findings are
repaired, and the repaired Checks were recomputed. Files reviewed:
`packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` (1260 lines),
`design/plan.json` (8 layers, 28 targets, 90 tests, 1 gap), `sources.toml` (8 entries).

## Repairs of round 2, finding by finding

- **F01 (§5.1 third Check at residue field `𝔽₅`) — repaired, differently from the suggested text,
  correctly.** README lines 817–826: "Condition (i) at five and `μ₅ ⊂ F` make every five-adic place
  `v̄` of `F⁺` split in `F` with `F⁺_v̄ = F_v ⊇ ℚ₅(ζ₅)`, so its ramification index is divisible by four
  … every five-adic local degree of `F⁺` is a multiple of four and at least eight. With `[F⁺:ℚ] = 40`
  … `(2, 2, 6)` … `24 > 20` … `8 < 20` … No smaller `[F⁺:ℚ]` …". Recomputed: `5` splits in an
  imaginary quadratic `E ⊂ F` (CN23 line 4237–4239), complex conjugation of `F` restricts to that of
  `E`, so `v ≠ v^c` for every `v | 5` and `F⁺_v̄ = F_v`; `e(ℚ₅(ζ₅)/ℚ₅) = 4` divides `e(v̄)`; `f(v̄) ≥ 2`
  (CN23 line 4246); degrees `(8, 8, 24)`: complements `24, 24, 8` against `20`; `(8⁵)`: `24 > 20`;
  enumeration of all multisets of multiples of `4`, each `≥ 8`, summing to `32, 36, 40`: only `(8⁵)`
  at `40` satisfies (ii) everywhere (script `calc/adv.py`). The review's suggested `(2, 2, 6)` at
  `d = 10` was indeed not an instance (unramified places contradict `4 | e`). `plan.json` test
  `datum_degree_condition` carries the same values.
- **F02 (Checks at `d = 1`) — repaired.** §4.3 first Check (lines 764–767): `F = ℚ(ζ₅)`, `d = 2`,
  `t = 1`, `r = 6`, `g = 6 − 6 − 1 + 1 = 0`, compared with CrystallineLocalGlobalCompatibilityCM §9.3's
  `q − 3[F⁺:ℚ] − 1 + |S|` (present at its head, line 1654 ff.: "`g=q−3[F⁺:Q]−1+|S|`"). §5.2 third Check
  (lines 851–853): `d = 40`, ten five-adic places of local degree eight, `R = ∅`, `t = 10`,
  `1 + 10·(3 + 8) = 111 = 1 + 30 + 80`. §5.4 third Check (lines 913–915): deficit `40 = l₀` (CLGC §9.10
  "`q₀=l₀=D`" at line 1774 ff.), `r = 111`, `dim R_∞ = 111 + 40 − 40 = 111`, `dim S_∞ = 151`.
  Recomputed `g = 111 − 120 − 1 + 10 = 0`. The three `plan.json` tests (`presentation_cyclotomic_five`,
  `problem_local_dim`, `lifting_deficit`) match. The renamed test name is cited nowhere.

Adversarial pass on the changed passages and the same pattern elsewhere: rows "5.1 degrees",
"4.3 count", "5.2 local base", "5.4 deficit" below; every other numerical Check of Layers 4–8 was
re-read for instances excluded by its own hypotheses (the `ℚ(ζ₅)` Checks of §§6.1, 7.5, 8.1 are
non-examples by design; §6.2's second Check is imaginary quadratic with (4) holding). None found.

## Verified sound

**Principles.** General library, not a route-specific shortcut (Theorem 6.2 is stated for an
arbitrary representation, Theorem 2.5 for every CM field without `ζ₅`). The parent
EllipticCurveModularityImaginaryQuadratic is imported by section and declaration (41 backticked
names and 26 sections resolved at its head, below), never re-planned; Theorems 2.2–2.4 apply its
§§8.3–8.6 over a CM base. Supply one-directional (gate below). No copied passage in the sampled
targets (each compared with the source wording at the locator). No computational algorithm. The
design plans no Lean declaration, so no `set_option` and no sorry'd data.

**Dependency check**, run as instructed:

```
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2407 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every roadmap named in a `*Needs:*` line, a Dependencies paragraph or
the supplier contracts precedes EllipticCurveModularityImaginaryQuadratic in `merge-order/ORDER.txt`
or is on main (EllipticCurves, ClassFieldTheory, SchemeAndStackFoundations, Chebotarev);
ModularityAndLanglandsExtensions and BianchiModularForms appear only as consumers.

**Citation resolver.** Three leads (`LeHung26, §4.4` line 340, `OpenAI26, §9.4` line 449,
`CaptainSude26, §4` line 800): manifest ids followed by a section sign, source locators rather than
roadmap citations, as in rounds 1 and 2. Lean names found nowhere: none. **Overlaps**
(`scratch/overlaps.md`): no open pull request changes this roadmap, no cited id is dropped, none is
defined only by an open revision. Ownership by object over main and the 476 open heads
(`roadmaps grep`, index of 2026-11-08): "protected place", "unipotent-inertia",
"Steinberg-protected", `H¹(SL₂(𝔽₅), ad⁰)`, "CaptainSude" match nothing; "width-three" only a
Tate-chart remark in AlgebraicModularFormsAndSerreWeights; "Theorem 3.1.1" of ACC matches only
other papers' theorems and PotentialAutomorphyInfrastructure's consumer row (line 210), so the gap
is owned nowhere; "intermediate field … CM" matches nothing on this object. The board index lists
AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory: unrelated.

**Pins.** `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to `plan.json` `baseline` and the README.
Declarations opened at the pins (file:line): `NumberField.IsCMField`
`Mathlib/NumberTheory/NumberField/CMField.lean`:70, `complexConj` :142, `isConj_complexConj` :148,
`ofCMExtension` :510, `of_isAbelianGalois` :542, `IsCyclotomicExtension.Rat.isCMField` (listed :43,
declared :564); `IsCyclotomicExtension` `Mathlib/NumberTheory/Cyclotomic/Basic.lean`:74;
`NumberField.isTotallyComplex_of_algebra` `…/InfinitePlace/TotallyRealComplex.lean`:229;
`LieAlgebra.SpecialLinear.sl` `Mathlib/Algebra/Lie/Classical.lean`:92; `Rep.ofDistribMulAction`
`Mathlib/RepresentationTheory/Rep/Basic.lean`:362; `groupCohomology.map`
`…/GroupCohomology/Functoriality.lean` (file present; `map` declared there);
`Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` `…/FiniteCyclic.lean`:114;
`Matrix.SL2.commutator_eq_top` `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`:804;
`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`
`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean`:98;
`TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed`
`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean` (declared; module header :34).
Tau Ceti at the pin has no automorphic representation, Weil–Deligne or local-Langlands carrier
(grep over `TauCeti/` for `AutomorphicRep`, `WeilDeligne`: none), so the README's "`Suggested.lean`
states no theorem" paragraph (lines 74–83) is correct for Theorems 2.5, 6.2, 8.1.

**Cross-roadmap citations resolved at the heads of the 2026-11-08 index** (line in the cited
README):
- EllipticCurveModularityImaginaryQuadratic: §0.2 535, §0.3 671, §1.1 861, §1.3 958, §2.1 1014,
  §2.2 1040, §2.3 1084, §4.1 1259, §4.2 1308, §4.4 1386, §5.1 1436, §5.2 1537, §5.3 1599, §6.1 1643,
  §6.3 1702, §6.5 1760, §6.6 1803, §7.1 1855, §7.2 1904, §7.4 1981, §8.1 2088, §8.3 2141, §8.4 2188,
  §8.5 2227, §8.6 2285, Downstream consumers and boundaries 2352 (`ℚ(ζ₁₅+ζ₁₅⁻¹, i)` at 2392–2394).
  All 41 backticked names resolve (`fixed_pairing_twist` 560, `fixed_pairing_twist_rational` 586,
  `solvable_preparation` 653, `hilbert_local_selection` 652, `seed_modular` 697, `switch_five` 778
  ("Let F be imaginary CM … `L∩Favoid=F` … non-CM modular elliptic curve"; "retain its Tate places
  above 2 and 3"), `modular_elliptic_all_coefficients` 676 and its four components 738–741,
  `auxiliary_local_types` 790, `switchParameterOpen` 865, `cyclicCover` 960, `boundary_regular_model`
  1022, `compactTypeModel` 1042, `compact_type_jacobian` 1048, `nodalModel` 1086, `characterSystem`
  1262, `character_system_properties` 1266, `cubic_character_elliptic` 1321, `auxiliaryEllipticCurve`
  1320, `trivial_character_twist` 1315, `prime_switch_congruences` 1389,
  `nonCM_elliptic_large_residual_primes` 47, `cyclotomic_switch_field` 1519, `potentiallySemistableCM`
  339, `cm_modularity` 1601, `finite_torsion_locally_constant` 1647, `local_reduction_constancy` 1705,
  `local_type_opens` 1763, `character_local_types` 1805, `switchCoefficient` 1866,
  `character_regular_word` 1871, `simultaneous_specialization` 1987, `character_automorphy_change_prime`
  2090, `character_automorphic_local_type` 2099, `complexInfinityParameter` 2250,
  `elliptic_full_local_comparison` 2231, `cm_elliptic_realization` 2289, `imaginary_quadratic_modularity`
  12). §1.3 line 960 constructs the cover as the normalization in `k(B_t)[Y]/(Y^m − f)` with `f(O) = 1`
  (line 956), so `(O, 1)` is a rational point, as §7.1(a) uses; §2.1 line 1018 has `R_* = a/(2n)` with
  `[n]R_* = a/2`.
- CrystallineLocalGlobalCompatibilityCM: §7.5 1447, §8.1–8.7 1489–1588, §9.1 1616 (clauses (5)–(15),
  including "(10) `ζ_p ∈ F` if `S = S_p ∪ R`"), §9.3 1654 (the count and the `p = 5` projective-field
  exclusion), §9.4 1676, §9.5 1702, §9.6 1722, §9.7 1738, §9.8 1746, §9.9 1766, §9.10 1774
  (`q₀ = l₀ = D`), §9.11 1794, §9.12 1810.
- AutomorphicGaloisRepresentationsPartII: AG2.0 641 (`AlgHeckeChar.galoisChar` 752), AG2.5 1819
  (characteristic-zero comparisons; no Theorem 3.1.1, no torsion inertial statement in 1819–3409),
  AG2.7 3409 (`IsDecomposedGenericPrime` 3507, `decomposedGenericPrime_local` 3508,
  `IsDecomposedGeneric` 3529).
- PotentialAutomorphyInfrastructure: §2.1 790 (`genericity_normal_closure_restriction`), §2.3 820
  (`soluble_base_change_and_descent`, parts (1) and (2), `E` and `F` imaginary CM or totally real),
  §2.5 842 (`auxiliary_cm_extension_prescriptions`); supplier row 210 cites AG2.5 for ACC Theorem 3.1.1.
- GlobalGaloisDeformations §3.4 440, §3.6 495, §3.7 566, §5.1 1081, §5.5 1245, §5.6 1282.
  LocalGaloisDeformationRings §1.10 1430, §2.3 1692, §2.5 1723, §2.6 1754, §2.8 1803, §2.15 1916,
  §2.16 1935, §2.21 2027, §3.14 2434, §4.14 2665, §4.15 2692, §6.6 2979.
  DeformationAndDerivedPatchingAlgebra §8.1–8.5 1584–1673. ArithmeticGaloisDuality R02.2 (layer
  table 28), R02.4.2 3119. ArithmeticGaloisRepresentations Layer 1 712, §4.3 3108, §6.3 4103, §7.7
  4991 (Sylow injectivity at 4996; "`H¹(SL₂(F_5), ad⁰)` is one-dimensional" at 5026).
  FaltingsFinitenessAndIsogenyTheorems R28.6.2 2688, R28.6.3 2716.
  NeronModelsAndSemistableAbelianVarieties §3.1 1454 (`toric_zero`: toric rank zero iff good
  reduction), §3.12 1901, §5.1 3024. GL2ModularityLifting §1.7 419
  (`cht_soluble_prescribed_completions`, arbitrary number field). GL2AutomorphicRepresentationsAndTransfer
  R16.3.2 955, R17.4.16 2675. AbelianSchemesAndArithmeticModuli Layer A6 2804.
  PotentialModularityAndCompatibleSystems §2.12–2.16 764–816. AutomorphicGaloisRepresentations §3.13
  2242. ModularityAndLanglandsExtensions §2.29 1272, §2.30 1293. EllipticCurves (main) Layer 4 794
  (`j(q) = 1/q + 744 + ⋯`, `v(Δ) = v(q)` at 899), Layer 5 1155 (twists). ClassFieldTheory (main)
  Layer 5 921 (local coefficients, Brauer group, duality), Layer 11 1684 (global Artin reciprocity).
  SchemeAndStackFoundations (main) §4.13 5644, §4.18 6110. Chebotarev (main) Layer 10 411.
  BianchiModularForms cites the parent's `imaginary_quadratic_modularity` (294, 2030), nothing of
  this roadmap.

**Sources: the seeded sample, read at the locators in the cached texts.**
- 1.1: MilneCM Proposition 1.4 (lines 273–287), the "exactly one complex conjugation" note
  (289–290) and Corollary 1.5 (292–295), all on printed p. 10 (page marker at line 265). The README's
  route (centrality of `ι`, totally real fixed field, `ofCMExtension`) is its own; the source supports
  the two facts cited. LeHung26 Lemma 5.1 (line 357) is the descent along abelian extensions of CM
  fields through intermediate fields, the use named.
- 1.2: LeHung26 lines 318–321: decomposed genericity "over `K` for `A_t[5]`, and over `F` for the
  pairs", absolute irreducibility on `G_D ⊂ G_{F(ζ_ℓ)}`. The README's (a), (b) are the descent
  implicit there, proved in full (recomputed below).
- 2.4: OpenAI26 §9.4 lines 1200–1215 (pp. 27–28; markers at 1161, 1206): endomorphisms over `KM`,
  induction if `M ⊄ K`, isobaric sum if `M = K`, trivial central character. LeHung26 lines 364–366;
  CaptainSude26 lines 676–683 ("the two infinity characters are distinct").
- 3.1: CaptainSude26 Lemma 3.1 line 187 (`e, f, h`), 191 (`D(e) = e`, `D(h) = h − 2e`,
  `D(f) = f + h − e`).
- 3.2: CaptainSude26 Lemma 3.3 lines 231–241 (index 24, Sylow injectivity,
  `H¹(⟨U⟩, M) = ker N/(D−1)M = k[f]`); the source states injectivity, the README's bijectivity adds
  AGR §7.7's one-dimensionality, recomputed below.
- 3.4: CaptainSude26 Lemma 3.1 lines 184–220 (`N² = 0`, unit upper-right entry, basis `(Ne₂, e₂)`,
  `ρ(φ) = [[q d, z],[0, d]]`, `d² = ψ(φ)/q`, unique square root, parameters `a, u, z`, kernel a
  rank-one summand over nonreduced algebras). The source assumes `μ₅ ⊂ F_v` and `ρ̄(φ) = 1`; the
  README's generalisation to any `q_v` and any protected `ρ̄` was re-derived (table).
- 3.5: CaptainSude26 Lemmas 3.1–3.2 lines 187–226 (`H¹ = k[(f,0)] ⊕ k[(0,e)]`, `L_v = k[(0,e)]`,
  self-annihilation via the alternating pairing). The README's (a)–(b) at general `q_v` recomputed.
- 4.1: CaptainSude26 Lemma 3.3 lines 227–241 (perfectness, `L ∩ C_N = F`, inflation, Sylow
  restriction, injectivity of inflation to inertia).
- 4.2: CaptainSude26 Lemma 3.4 lines 242–263 (`g = diag(2,3)`, diagonal-line coinvariants,
  Chebotarev, degree one, splitting in every imaginary quadratic subfield, full tangent space and
  zero dual condition at Taylor–Wiles primes); AKT23 Lemma A.5 lines 3979–3986 (the `p = 5`
  projective-field hypothesis §4.2 removes).
- 5.3: CaptainSude26 Lemma 4.1 lines 291–300 and proof 306–408 (`S_aux`, `R_aux = R ∪ P ∪ Q`,
  unramifiedness at `P^c` from Theorem 3.1.1, torus polynomial `(X−1)²` at full Iwahori level with
  trivial character, 335–338, descent coefficient by coefficient, 339–341); CN23 Propositions
  5.6.2–5.6.3 lines 4334–4390 (both invoke ACC Theorem 3.1.1, 4352 and 4388–4389; `N` depending only
  on `[F:ℚ]`); ACC23 §3.1 lines 2309–2345 and Theorem 3.1.1 lines 2346–2355, matching the gap text
  clause by clause (`S = S^c`, the condition outside `S`, `R` prime to `p` with imaginary quadratic
  splitting, `Iw_{v,1} ⊆ K_v ⊆ Iw_v`, hyperspecial on `R^c − R`, `T = S − (R^c − R)`, `N` depending on
  `n` and `[F:ℚ]`, `I_R^N = 0`, conclusions (1)–(2) with `σ ∈ W_{F_v}`).
- 5.4: CaptainSude26 Theorem 4.2 lines 410–415 and proof 416–498 (`T = S ∖ P`, relative dual Selmer
  group with `L_v^⊥` at `P ∪ Q`, `g = r − 3d − 1 + t`, `4t − 1` frame variables, `dim R^loc = 1 + 3t + 2d`,
  `dim R_∞ = r + 4t − d`, `dim S_∞ = r + 4t`, `χ_v² ≠ 1` since `q_v ≡ 1 mod 5`, matching components at
  five, no protected component labels); CN23 Proposition 5.6.1 lines 4261–4268 and data (1)–(15)
  lines 4226–4260 (clause (14): `q_v ≡ 1 mod p` for `v ∈ R` by determinants).
- 6.1: CN23 end of the proof of Theorem 5.2 lines 4433–4509 (the set `V`, the solvable CM `F₀` with
  Iwahori invariants, unipotent ramification with `q_w ≡ 1`, residue fields larger than `𝔽_p` and the
  degree inequality, the three imaginary quadratic composita, `S = S_p ∪ R` when `ζ_p ∈ F`);
  CaptainSude26 Proposition 5.2 proof lines 543–603 (preliminary base change over `K⁺`, trivial
  prescriptions above `q` and below `V`, CHT Lemma 4.1.2, the degree-eight multiquadratic, ACC §6.5.12
  helpers, `P` the places above `v` with conjugates good and outside `S`).
- 6.2: CN23 Theorem 5.2 lines 3849–3872 ((1)–(5) as restated, including (5)(b)–(c)); Lemma 6.1.4
  lines 4562–4572 (stated for `r_{E,5}`; order-two and order-four cases); CaptainSude26 §4 lines
  264–289 and Theorem 4.2. The generalisation of the lemma beyond `𝔽₅`-coefficients is R01.
- 7.1: CaptainSude26 Lemma 5.1 lines 503–532 (`R₀` of order `6p`, étale elliptic cover with class of
  order 3, three nodes of thickness one, the involution fixing one node and acting by `−1` on both
  branches, `xy = s` to `uv = s²`, cycle of three rational components, `I₃`, `f(O) = 1`, `R₀` not
  2-torsion so `x` étale, `q_{A_t} = c s³ h(s)`).
- 7.4: CaptainSude26 Proposition 5.2 lines 538–556 and 596–603 (avoid field, finitely many opens,
  trivial prescriptions above `q`); CN23 Proposition 6.1.5 lines 4574–4598 (`ρ̄` with `det = ε̄₅`
  decomposed generic, partition `S₅^st ⊔ S₅^ord ⊔ S₅^ss`, `F^avoid`, conclusions (1)–(5)); CHT08
  Lemma 4.1.2 line 5723, printed p. 116 (marker at 5683), the soluble extension with prescribed
  completions linearly disjoint from `D`.
- Also read: ACC23 §6.5.12 lines 7158–7170; CaptainSude26 Proposition 2.3 lines 120–125, Proposition
  6.2 lines 634–670, Theorem 1.1 proof 671–683; LeHung26 §4.5 lines 333–339, §4.6 342–351, Remark 4.2
  352–355; CN23 Theorem 6.1 4513–4517, Lemma 6.1.3 4545–4560 (printed p. 88, marker at 4536).
  Printed pages checked against the markers: CaptainSude26 Lemma 3.1 p. 4, Lemma 4.1 p. 6,
  Theorem 4.2 p. 9, Lemma 5.1 p. 10, Proposition 5.2 p. 11, Corollary 5.3 p. 12, Proposition 6.2
  p. 13; CN23 Theorem 5.2 pp. 73–74, Lemmas 6.1.3–6.1.4 p. 88, Proposition 6.1.5 pp. 88–89; ACC23
  §3.1 pp. 57–58. All eight manifest entries are in the cache; every work the README cites has one
  key; no entry is wrong; no `needs-references.toml` was needed.

**Adversarial pass.** Values by hand or by `calc/adv.py` in the scratch directory (matrix
arithmetic mod `p`, cocycle spaces by consistency along a breadth-first enumeration of `SL₂(𝔽_q)`
on generators `U`, `Uᵀ`, degree enumeration for §5.1).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 5.1 degrees (F01 text) | `(8,8,24)`, `(8⁵)` at `d = 40`; all admissible multisets at `d = 32, 36, 40, 44` | `e(ℚ₅(ζ₅)) = 4`; complements `24, 24, 8` vs `20`; `(8⁵)`: `24 > 20`; `d = 32, 36`: no multiset satisfies (ii); `d = 40`: only `(8⁵)`; `d = 44`: `(8⁴,12)`, `(8,12³)` | Check correct, minimum `40` | — |
| 5.1 split at five | `5` split in `E ⊂ F`; `v \| 5` | `v \| 𝔭 ⇒ v^c \| 𝔭̄ ≠ 𝔭`, so `v ≠ v^c`, `F⁺_v̄ = F_v` | every five-adic `v̄` splits | — |
| 4.3 count (F02 text) | `(d,t,r) = (2,1,6)`, `(2,3,10)` | `g = 0`, `R_∞ = 8`, `S_∞ = 10`; `g = 6`, `14`, `20`, `22`; deficit `2` both | agrees with CLGC §9.3 and `l₀ = D` | — |
| 5.2 local base (F02 text) | `d = 40`, `t = 10`, ten places of degree `8` | `1 + 10·11 = 111 = 1 + 30 + 80`; `Σ[F_v:ℚ₅] = 80 = [F:ℚ]` | correct | — |
| 5.4 deficit (F02 text) | `d = 40`, `t = 10`, `r = 111` | `g = 111 − 120 − 1 + 10 = 0`; `R_∞ = 111`; `S_∞ = 151`; deficit `40`; complex places `40` | correct | — |
| 1.1 intermediate fields | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `S = {1,2}`; `ℚ(√5)`; `ℚ(√−3)`, `S = {4}` | `{1,9,13,17}`, orders `(1,2,4,4)`, cyclic; `9 ≡ 4 = 2² mod 5` fixes `ℚ(i,√5)`; `L = K`; `ℚ(√5)` real, `⊉ K`; `ℚ(ζ₁₂)` abelian | Checks correct; `ofCMExtension` hypotheses in scope | — |
| 1.1 centrality of `ι` | `φ∘σ` an embedding | `conj∘(φ∘σ) = (φ∘σ)∘ι`, `conj∘φ = φ∘ι` ⇒ `φ∘σισ⁻¹ = φ∘ι`, `φ` injective | `σισ⁻¹ = ι`; `E^ι` totally real, `[E:E^ι] = 2` | — |
| 1.2 descent | `K = F = ℚ`; `1⊕1` mod 3, `q = 2`; over `ℚ(ζ₃)` | `F_w = K_v = ℚ_q`, equal decomposition groups, `q_v = q_w`; ratio `1 ≠ 2`; split primes `≡ 1 mod 3`, ratio `1 = q` | (a),(b) hold; converse fails as the Check says | — |
| 2.4 CM branch | `y² = x³−x`, `y² = x³+1` over `ℚ(ζ₈)`; `y² = x³−x` over `ℚ(√−3)` | `i ∈ ℚ(ζ₈)`: sum; `√−3 ∉ ℚ(i,√2)`, `KM = ℚ(ζ₂₄)`: induction; `i ∉ ℚ(√−3)`: induction from `ℚ(ζ₁₂)`; `θ^σ ≠ θ` (σ swaps the embeddings of `M`) | correct; `KM` CM by Milne Cor. 1.5 | — |
| 3.1 `ad⁰` | `U`, `−1`, `diag(2,3)`, left multiplication, `p = 2` | `D` columns `(1,0,0)`, `(−2,1,0)`, `(−1,1,1)`; `(D−1)²f = −2e ≠ 0`, `(D−1)³ = 0`, `D⁵ = 1`; `Ad(diag(2,3)) = diag(4,1,4)`; `Uf = f + E₁₁`, trace `1`; Gram `[[0,0,1],[0,2,0],[1,0,0]]`, det `−2`; `M^G = ke ∩ kf = 0` | conjugation action pinned; odd `p` for self-duality and invariants | — |
| 3.2 restriction | `SL₂(𝔽_q)`, `q = 3, 5, 7` | `q=5`: order `120`, `dim Z¹ = 4`, `B¹ = 3`, `H¹ = 1`; norm `0`, `rank(D−1) = 2`, `H¹(⟨U⟩) = 1`. `q=7`: order `336`, `H¹ = 0`, `H¹(⟨U⟩) = 1`. `q=3`: order `24`, `H¹ = 0`, norm `(D−1)²` of rank `1`, `H¹(⟨U⟩) = 0` | bijective at `5`, injective not surjective at `7`, zero at `3` | — |
| 3.3 normal form | `ρ̄(φ) = [[a,b],[c,d]]`, `U^q` | `ρ̄(φ)E₁₂ = [[0,a],[0,c]]`, `qE₁₂ρ̄(φ) = q[[c,d],[0,0]]` ⇒ `c = 0`, `a = qd`; `φ ↦ φτ^x` adds `x` to `b` | API bullet 2 holds at every `q_v` | — |
| 3.4 (i)⇔(ii)⇔(iii) | `N² = tr(N)N − det N`; `b` unit; `σ = τ^x` | `N² = 0` ⇒ `tr(N)b = 0` ⇒ `tr N = det N = 0`; `det(1+N) = 1 + tr N + det N`; `(1+N)^x = 1 + xN`; `ker N = im N` rank-one summand | equivalences hold | — |
| 3.4 smoothness | basis `(Ne₂, e₂)`, `ρ(φ) = [[α,z],[w,δ]]` | `w = 0`, `α = qδ`; `qδ² = ψ(φ)`; `q` a unit for every `q_v`; Hensel unique (`p` odd); `det[[b,0],[−a,1]] = b`; coordinates `a`, `b − 1`, `z − [z̄]` | `O[[x₁,x₂,x₃]]` at every `q_v` | — |
| 3.4 Checks | `(1+εf)U`, `(1+εh)U`; `𝔽₂₅`, `ζ ∉ 𝔽₅`; `q = 11`, `diag(11,1)` | traces `2 + ε`, `2`; `det = 1`, `N² = 0`; `ζ + x ≠ 0`; `11·12² = 1584 = 12²·11` | Checks correct | — |
| 3.5 (a)–(d) | `q = 11, 7, 19` | `Ad(ρ̄(φ))e = qe`, on `e(1)`: `q²`; `(h⁰, h⁰(M(1))) = (1,1), (0,0), (0,1)`; `dim L_v = 3 − (3 − h⁰)`; `#H¹_ur(N) = #N^I/(φ−1) = #H⁰(N)`; `#H¹ = #H⁰(M)#H⁰(M(1))`; `Σ_{i<11}D^i = 1`; `dim Z¹ = 4`, `B¹ = 2`, `H¹ = 2`; `⟨f, e⟩ = 1` | (a),(b) at every `q`; (c),(d) need `μ_p` | — |
| 4.1 exceptional classes | `Gal(LC_N/F) = SL₂(𝔽₅) × A`; order-two inertia; `SL₂(𝔽₇)` | `Hom(A, M^G) = 0` so `H¹(G×A, M) = H¹(G, M)`; `I_v ↠ ⟨U'⟩`; inflation injective; `H¹(C₂, M) = 0`; `H¹(SL₂(𝔽₇), ad⁰) = 0` | protection necessary and sufficient; `M(1) ≅ M` needs `μ₅ ⊂ F`, in scope | — |
| 4.2 Taylor–Wiles primes | `diag(2,3)`; framed `P`; `H_∅ = 0` | `2·3 = 6 ≡ 1`; `rank(Ad g − 1) = 2`, coinvariants `kh`; `κ(gσ) = κ(g) + κ(σ)` for `g ∈ G_{LC_N}`; `κ₀\|G_{F_w}` inflated from `H¹(⟨g⟩, M) = 0` so `κ₀ ∈ H_Q` for every `Q` when `P ⊆ T` | detection needs `P` unframed | — |
| 4.3 presentation | `d = 2, t = 1, r = 6`; `d = 2, t = 3, r = 10` | `g = 0`, `g = 6`; `3 + 4 = 7` above five, `3` away, `1 + 7 + 6 = 14` | consistent with CLGC §9.3 | — |
| 5.3 inertial polynomial | full `Iw_v`, trivial character; `Iw_{v,1}`; `S_aux`, `R_aux` | unit torus operators act as `1`: `P_{v,σ} = (X−1)²`, `σ ∈ I_v`; at `Iw_{v,1}` they act through `k_vˣ`; `S_aux ∖ (R_aux^c ∖ R_aux) = S ∪ Q`; `P^c`, `R^c ∖ R`, `Q^c ∖ Q` hyperspecial | route sound modulo the declared gap | — |
| 5.4 prepared lifting | `ζ₅^{±1}` inertia; `d = 40` | fails (i) of §3.4; `q_v ≡ 1 mod 5` at `R` from `det ρ̄ = 1` there, so `χ_v² ≠ 1` exists; deficit `d = l₀` | consistent | — |
| 6.1 preparation | `v = v^c`; index-five ramification; `ℚ(ζ₅)` | `v = v^c` contradicts unramified at `v^c`; `U⁵ = 1`; only quadratic subfield `ℚ(√5)` | hypotheses at `v^c` and the composita necessary | — |
| 6.2 reduction to (4) | `ζ₅ ∉ F`, det order 2, coefficients `𝔽₅`; coefficients `𝔽₂₅`, `μ² = 2`, `h = diag(1,2)`; det order 4; `ζ₅ ∈ F` | `𝔽₅`: `2g ∈ SL₂(𝔽₅)`, projective image `PSL₂(𝔽₅)`, (4) holds. `𝔽₂₅`: `det(μh) = 4 = −1`, `tr = 3μ ∉ 𝔽₅`, projective image `PGL₂(𝔽₅)`, `[G_F:G] = 120 = [G_F:H]`, (4) fails. Order 4: `240 > 120`. `ζ₅ ∈ F`: image `⊆ SL₂(𝔽₅)` onto `PSL₂(𝔽₅)`, equals it | "(4) fails ⇒ `ζ₅ ∈ F`" false for `k ⊋ 𝔽₅` | R01 |
| 7.1 degeneration | involution on 3 nodes; genus; thickness; `p = 101` | fixed points `1` or `3`; two rational curves meeting in `3` points: `p_a = 2 ≠ 1`; `2Q = c₀` on the coset `P₀ + jT'`: `2j ≡ l − i`, one solution; `uv = s²` resolved: `1 + 1 + 1 = 3 = 2 + 1`; `2n = 606 ≠ 2` | (a)–(d) consistent; `I₃` | — |
| 7.4 retained switch | `Σ = ∅`; `Σ` above `2`; split completely | reduces to `switch_five`; conflicts with the Tate condition; `L_{w'} = F_w` so `Y_ρ̄(L_{w'}) = Y_ρ̄(F_w)` | correct; `hilbert_local_selection` admits finitely many opens | — |
| 7.5 protected seed | transvections; `det` over `ℚ(ζ₅)`; CM | `⟨[[1,3],[0,1]], [[1,0],[3,1]]⟩` of order `120`; `ε̄₅` trivial on `G_K`; `SL₂(𝔽₅)` perfect, no abelian subgroup of index `≤ 2`; Theorem 6.2 applied over `L ∋ ζ₅` | unaffected by R01 | — |
| 8.1 headline | `ℚ(ζ₅)`, `K₆₀`, imaginary quadratic, `ℚ(i,√5)` | fixer of `K₆₀` is `{1, 29}`, `29 ≡ 4 mod 5`, `≡ 2 mod 3`; `K₆₀(ζ₅) = ℚ(ζ₆₀)`; `Gal(ℚ(i,√5)/ℚ) = (ℤ/2)²` vs `C₄` | consistent with 2.5 and 7.5 | — |
| Conventions: Frobenius | `U` over `𝔽₅`, `q = 11, 7` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ ≡ 3`, `U³ = [[1,3],[0,1]]` | pinned | — |

**Context and generality.** Every theorem of the sample names its field hypotheses; Layer 3 is
stated for odd `p` (and `p ≥ 5` where the norm computation needs it), Layers 4–6 at `p = 5` with the
reason computed (`H¹(SL₂(𝔽_q), ad⁰) ≠ 0` only at `q = 5` among `3, 5, 7`). Steps taken from inside
proofs (CaptainSude26 Lemma 3.1 at general `q_v`, the dual-Selmer counting of §3.5(b), the
determinant argument of CN Lemma 6.1.4) were re-derived at the generality restated here; the third
is where R01 arises.

**Gap.** `acc-torsion-inertial-comparison`: supplier AutomorphicGaloisRepresentationsPartII AG2.5
(earlier in the merge order), one-sentence `needs`, hypotheses spelled out against ACC23 §3.1
(checked clause by clause above), needed exactly by 5.3, provided by none of Mathlib, Tau Ceti,
AG2.5 at its head, any roadmap on main or at an open head. Same slug in `plan.json` (`gaps[0]`,
`neededBy: ["5.3"]`, 5.3's prerequisites) and in the README (lines 264, 874, 929). Precise, minimal,
declared.

**Shape and policy.** Summary; Scope and ownership; Conventions with computed witnesses; Exact
supplier contracts; How to read the build; eight layers each ending with Examples and Dependencies;
Downstream consumers; References. Four definitions (3.1, 3.3, 5.1, 5.2) with API lists and 4, 4, 4,
3 Checks; twenty-four theorems with hypotheses, locator and three or four Checks; `*Needs:*` lines
item by item. `plan.json`: 28 targets, 90 tests; 3.5 and 8.1 carry one test more than the README's
Checks, both covered by the README's merged first Check of 3.5 and the Layer 8 Examples. No
pull-request number, date, round label, machine path, LaTeX delimiter, "optional" or "deferred", no
`lemma` keyword outside source locators (grep). Elaboration: not available (this lane does not
elaborate); the design plans no Lean declaration, so there is no `#check` comparison to run and no
padding probe. Headline theorems: Theorems 2.5, 6.2, 8.1, none statable at the pins (carriers above),
all three to be named in the module docstring as the README's Lean paragraph says.

**Manifest.** Eight entries, all `certified`, SHA-256 equal to the cache files; `cited_for` lists
match the citing sections; one key per work.

## Not verifiable

- The global patching argument of CaptainSude26 Theorem 4.2 and its support propagation through
  CN23 §5.4 are unrefereed; the dimension counts, the dual Selmer formula, the Taylor–Wiles
  detection, the Hecke-side identities and the field conditions were checked against CN23 §5.6 and
  ACC23 §3.1, the patching argument itself was not re-proved.
- Whether a Galois representation with image `⟨SL₂(𝔽₅), μh⟩ ⊂ GL₂(𝔽₂₅)` and `det = ε̄₅⁻¹` exists over
  some CM field was not settled (R01 needs only that no hypothesis of Theorem 6.2 excludes it).

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8c844f824ace48ffd6647c6b31238fd277b370a8", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~3", "model": "fable", "worker": "chris-x10"} -->
