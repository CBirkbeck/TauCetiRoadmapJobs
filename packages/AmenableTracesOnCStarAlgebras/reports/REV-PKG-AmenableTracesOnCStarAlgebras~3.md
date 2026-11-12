<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6798632645 -->
Review (claude) of 2ab917c

Verdict: needs_changes

1. **F01** (P3) a pinned Tau Ceti theorem is rebuilt in §7.1 and missing from the contract

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md` lines 1787–1788 (§7.1): "for unital
   `A ≅ C(Ω)` (`gelfandStarTransform`), a state is a regular Borel probability measure `μ`
   (`RealRMK.rieszMeasure`)"; the *Needs:* line 1794–1795; Layer 7 Dependencies, lines 1898–1900;
   `### From Tau Ceti`, lines 250–315.

   **Claim.** The contract lists what the pinned Tau Ceti supplies, and a step the pin proves is cited,
   not re-derived.

   **Witness.** Pinned Tau Ceti, `TauCeti/Analysis/CStarAlgebra/CharacterSpaceMeasure.lean` line 134,
   `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`: a functional nonnegative on every
   `star a * a` is `a ↦ ∫ ω a ∂μ` for a finite inner regular `μ`. Its proof is the Gelfand transform
   plus `RealRMK.rieszMeasure`.

   **Repair.**

   1. Add to `### From Tau Ceti`: "`LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`
      (`TauCeti/Analysis/CStarAlgebra/CharacterSpaceMeasure.lean`): on a unital commutative
      C*-algebra, a linear functional that is nonnegative on every `a*a` is `a ↦ ∫ ω(a) dμ(ω)` for a
      finite inner regular measure `μ` on the character space; for a state `μ` has total mass
      `τ(1) = 1`. Nothing is asserted for nonunital algebras or about uniqueness of `μ`."
   2. §7.1, lines 1787–1788: "for unital `A`, a state is `a ↦ ∫ ω(a) dμ(ω)` for a probability measure
      `μ` on the character space `Ω` (Tau Ceti
      `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`; `A ≅ C(Ω)` by
      `gelfandStarTransform`), which is a weak-star limit of …" (the rest unchanged).
   3. §7.1 *Needs:* and Layer 7 Dependencies: replace "Mathlib `gelfandStarTransform`,
      `RealRMK.rieszMeasure`, `PartitionOfUnity`" by "Tau Ceti
      `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`; Mathlib `gelfandStarTransform`,
      `PartitionOfUnity`". The Mathlib contract bullet and Layer 1 keep `RealRMK.rieszMeasure`, which
      the Check of §1.1 on `C(X)` uses.

   Tested on the instances of §7.1: for `A = C[0,1]` with Lebesgue `τ` the character space is `[0,1]`
   and `μ` is Lebesgue measure, of mass `1`; for `A = ℂ ⊕ ℂ`, `τ = (1/3, 2/3)`, `μ` has masses `1/3`
   and `2/3` at the two characters. No statement, Check or Lean declaration changes.

One finding, P3 (no P1, no P2). The three findings of the previous review are repaired. No false
or vacuous statement, no unowned prerequisite, no upward supply, no padding and no missing headline
was found; `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` elaborates at the pins with
`sorry` as its only warning. The finding is a pinned Tau Ceti theorem that §7.1 rebuilds from its
Mathlib ingredients instead of citing. No maintainer notes were left; the plan declares no supplier
gaps.

## Previous findings, one by one

- **F01 (P3), Kirchberg attributions without a reference — repaired.** §4.4 now reads "brown2006,
  Theorem 3.1.6, line 804, where it is credited to Kirchberg, with footnote 2, line 819"; §6.2
  reads "lines 1283 and 1291; line 1282 credits the face property of `AT(A)` to Kirchberg".
  brown2006 lines 804, 819–821 and 1282–1283 say this. The same pattern elsewhere was repaired
  too: §4.2 "whose footnote 3, line 822, credits its main idea to Connes (connes1976)" (line
  822–823 agrees), §2.4 "line 658 credits its proof to Ozawa" (line 657–658 agrees), §5.2
  "condition (6), credited to Ozawa at line 971" (lines 970–972 agree). No sentence names a work
  outside the References.
- **F02 (P3), Lean section titles — repaired.** `Suggested.lean` line 62: "## Layer 1: tracial
  states, their GNS data and the matrix trace"; line 380: "## Layer 7: examples:
  finite-dimensional, commutative, AF and group algebras"; both equal the README headings up to
  the case of the first word, as for Layers 3–6 and 8.
- **F03 (P3), stage label in the manifest — repaired.** `sources.toml`, `brown2006`,
  `version_note`: "arXiv v2 numbering and cached line numbers; the published Memoir … was not
  compared". A search of the four files for stage and process words finds none.

## Verified sound

**Elaboration.** `lake env lean` on `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` from
the content checkout: exit 0; 21 warnings, all "declaration uses `sorry`", one per theorem; no
other message. Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`, the commits the README names. No `TauCeti.*` module
needed building.

**Padding probe, every theorem.** On a scratch copy each of the 21 `sorry` proofs was replaced by
`first | rfl | (simp; done) | infer_instance | trivial | tauto | (exact?; done) | (aesop; done) |
fail`: 21 of 21 fail to close. None restates a definition, mirrors a Check or treats a boundary
case. The 4 instances and 19 definitions have real bodies. No sorried data, `set_option`, `lemma`,
`#eval`, `#print`, `#synth` or `#check`; header `module`, `import Mathlib`, three `TauCeti.*`
modules, each used (`IsKMSState`, `VonNeumannAlgebra.adjoin`, `TauCeti.Amenable`).

**Signatures.** `#check @name` for all 44 declarations in one scratch file: exit 0; each type
compared with its README statement. `IsFaithfulTrace`, `IsHypertrace`, `IsFoelnerTrace` drop
`[StarOrderedRing A]` and `IsAF` both order classes; their bodies do not use them. No theorem loses
a hypothesis (the Følner equivalence keeps both separability instances, `hπ`, `hess`; the group
theorem keeps `[DecidableEq Γ]`; `subalgebra_isAF_simple` keeps `[Nontrivial A]`). All 44 names
occur backticked in the README; the resolver lists no name found nowhere.

**Headlines (README Summary) against `Suggested.lean`.** Stated: Connes–Kirchberg (hypertrace,
extension, tensor forms); Følner sufficiency and equivalence; tracial von Neumann form; uniform
amenable ⇔ injective `π_τ(A)''`; nuclear case; exact case; the two face theorems; unitization;
normalized restriction; extension from ideals; commutative and AF algebras; the group theorem;
quasidiagonal algebra ⇒ quasidiagonal trace; faithful quasidiagonal trace ⇒ quasidiagonal;
Rosenberg; subalgebras of simple unital AF algebras. Named not statable in the docstring, with the
missing carrier: bimodule form (`π_τᵒᵖ`), the vector-trace clause (`τ''`), minimal tensor products.
None absent, none through a stand-in.

**Sources: the 15 sampled targets, read at the cited lines.** brown2006: 558–564 (Lemma 2.8, §1.7)
and 827 (density of normal states); 514–555 (Lemma 2.7 and its proof with the Choi–Effros step at
525 and the inequality at 530, §2.1); 993–999 (§2.5); 807, 953–958, 1078–1080, 1426–1428, 589–592
(§3.1); 1201, 1218–1221, 1225–1261, 1613–1616 (§3.3); 1317–1320 (§3.5); 817–850 with footnote 3 at
822 (§4.2); 851–894 (§4.3); 804–821 (§4.4); 897–914, 945–948, 429–431 (§4.5); 1035–1036 (§4.6);
971–992, 993–1015, 1038–1048, 1575–1576, 1608–1612 (§5.2); 1269–1294 (§6.2, with Lemma 3.5.2 at
1274); 1469–1490 (§6.5); 1952–1964, 1969–1972 (§8.2). tikuisis-white-winter2017: 359–364, 376–380,
418–431, 456–464, 471–472. schafhauser2020: 69–70, 75–77, 78–84. Every locator carries the cited
statement with the cited number; where the README is more general than the source (no unit or
separability; brown2006 line 357 fixes both) it says so and gives its own route, checked below.

**Adversarial table** (sampled targets, headlines, repaired passages, the finding).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.7 norming sets | `ℂ ⊕ ℂ`, `𝒮 = {pr₁, pr₂}`; `𝒮 = {pr₁}`; shift `b + t1` | `sup = max(|s|, |t|) = ‖a‖`; at `(0,1)`: `0 ≠ 1`; `ω(b) + t ≤ ‖b + t1‖ = sup σ(b) + t` contradicts separation | holds; unit used for the shift |
| §2.1 unitalization | `φ = id/2`; `φ(1) = diag(1, 1/100)`; `diag(a₁, 0)` | `‖ψ − φ‖₂ = ‖x‖₂/2 ≤ 2‖x‖2^{-1/2}`; `φ(1) − φ(1)² = diag(0, 0.0099)`, roots `t₀ = 2δ/(1 + √(1 − 4δ)) ≤ 2δ ≤ 1/4`, `Q = e₁₁`; `hψh = pφp = φ`, `ψ(1) = p + (1 − p)` | bounds hold |
| §2.1 c.p.c. Schwarz | `id/2`; `2·id` at `a = 1` | `a*a/4 ≤ a*a/2`; `4 > 2` | contraction needed |
| §2.2 one-term estimate | `φ(x) = x₁₁`, `(e₁₂, e₂₁)` and reversed | `1 ≤ ‖b‖d₂(φ, e₂₁)^{1/2} = 1`; `0 ≤ 0`; `T(ab) = T(a)φ(b) + (1 − VV*)^{1/2}π(a)(1 − VV*)^{1/2}T(b)` | sharp |
| §2.4 Ozawa | rank one; `diag(1/3, 2/3)`, `T = e₁₂` | `1 − c² ≤ 2^{3/2}(1 − c²)^{1/4}`; `min`: `1/3 ≤ 1/3`, `max`: `2/3 > 1/3`; defect `≤ 2‖[h^{1/2}, u]‖_HS` | bound holds |
| §2.5 bidual | `c₀`, `δ_1`; `x_1 + lim_U` | value `1` on tails `1_{[m,∞)} → 0` weak-star, norm `2` | normality pins `φ**` |
| §3.1 definitions | `φ_m = τ(·)1_m/m` on `M_2`, `(e₁₂, e₂₁)` | `Tr_m = 1/2`, norm defect `1/(2m)`, unnormalized HS `1/(2m^{1/2})`, `tr_m φ_m(1) = 1/m` | normalization needed |
| `isAmenableTrace_unitization_iff` | `A = ℂ`, `φ = (1 − δ)·id`; functional difference | `(tr∘φ̃ − τ̃)(a + λ1) = (tr∘φ − τ)(a)`; norm `δ` on `A`, `2δ` at `(1, −1/2)` of norm `1/2` | factor `2` attained; true for unital `A` too |
| §3.3 convexity, closure | block sum; `C*(Γ)` residually finite | `‖x ⊕ y‖₂² = θ‖x‖₂² + (1 − θ)‖y‖₂²`; weak-star limit of finite-dimensional traces not in `UAT` | `UAT` only norm closed |
| §3.5 tensor products | `e₁₁ ⊗ e₁₁`; defect split; `C*_r(F₂) ⊗ M_2` | trace `1/4`, 2-norm `1/2`; `(φ(aa′) − φ(a)φ(a′)) ⊗ ψ(bb′) + φ(a)φ(a′) ⊗ (ψ(bb′) − ψ(b)ψ(b′))`; pullback is `τ_{F₂}` | holds; needs `‖φ ⊗ ψ‖ = ‖φ‖‖ψ‖` for all bounded functionals (C5.2 has it) |
| §4.2 | `M_n`; `ℂ²`, `h = diag(1/3, 2/3)`; weak limit | identity map; `(a, b) ↦ diag(a, b, b)`; `Tr((uhu* − h)T) = Tr(h(u*Tu − T)) → 0` | route sound, no separability |
| §4.3–§4.4, three Lean forms | `M_n`; `ℂ ⊕ ℂ`, `pr₁`; `H = 0` | `μ_τ(e₁₂ ⊗ e₂₁ᵒᵖ) = 1/n ≤ 1`; `Φ(T) = T₁₁`, `μ_τ = ac`; injective unital `π` into `B(0)` forces `A = 0`, no state | no vacuous case passes |
| §4.5 `IsFoelnerTrace`, both theorems | `C(𝕋)`, `P_n`; `ℂ²`, `τ = (1/3, 2/3)`; `P = VV*` | `1 + 1 = 2 < εn`; rank one `2|ξ₁|²|ξ₂|² = 4/9`, rank two trace `1/2`; `Σ‖(1 − P)π(a)eᵢ‖² = n·d₂(φ_P, a)` | converse needs `hess`; agrees with V13b's `8|α|²|β|²` for `u = 2e₁₁ − 1` |
| §4.6 `isAmenableTrace_iff_isInjective` | `M_n`; `L(F₂)`; `H = 0` | identity, norm `1`; both sides false; `M = 0`, no state | holds |
| §5.1 commuting-range lemma | `β = id`, `y_kl = e_lk`; `Σ_m w_m*w_m` | `2·1` against norm `1`; `= β(1) ≤ 1` | commutation needed |
| §5.2 `isUniformAmenableTrace_iff_isInjective` | `C*(F₂)` regular trace; `C[0,1]`, `f = t`; nonunital | amenable, `L(F₂)` not injective; defect `1/(12n²)`; `d₂(φ**, x) ≤ 2d₂(a) + 2(τ**(y*y) + 4‖x‖²‖tr∘φ − τ‖)`; `‖1̂ − ê‖² ≤ 1 − τ(e)` | holds, unital or not |
| §5.4 `isAmenableTrace_tfae_of_isNuclearMap` | `C*_r(F₂)`; `C*(F₂)`; nonunital `β̃(x, λ) = β(x) + λ(1 − β(1))` | all four fail; amenable with non-injective `M_τ`; `β̃α̃(a + λ1) = βα(a) + λ1` | target `M_τ` and exactness needed |
| §6.2 faces | `C*_r(F₂) ⊕ ℂ`; `sτ₁ ≤ γ` | `AT = {χ∘pr₂}`; `M_{τ_i} ≅ M_γP`, `P ∈ M_γ'` | iff holds |
| §6.3 `isAmenableTrace_of_normalized_comp` | `M_3 → M_4`; `c = 1/2`; `a + λ1` | `c = 3/4`, `tr_3`; value `3/2`; `τ(ιa) + λ = c(γ(a) + λ) + (1 − c)λ` | `hγ` pins `c` |
| §6.5 `isAmenableTrace_of_comp_ideal` | `M_2 ⊕ 0`; `q : C*(F₂) → C*_r(F₂)`; route | `γ = tr_2∘pr₁`; false without `hι`; `‖ψ((1 − e)x)‖₂² ≤ tr ψ(x*(1 − e)²x) ≈ γ((1 − e)xx*(1 − e)) ≤ ‖x‖²(1 − τ(e))` | holds |
| §7.1, R01 | `C[0,1]`; `ℂ ⊕ ℂ` | Riemann sum `(n + 1)/(2n) → 1/2`; `μ` of mass `1` on the character space | holds; pin already has the measure |
| §7.3 group theorem | `ℤ`; `S₃`; `F₂`; `λ_gM_fλ_g*δ_x` | `M_{δ_1}`; `Tr(λ_e) = 6`; all fail; `f(g⁻¹x)δ_x` | matches `TauCeti.Mean.IsLeftInvariant`; `of_lpTop` needs only left invariance of `μ` |
| §8.1, §8.4 | degenerate `π`, `ξ ∈ π(1)H`; `F₂` | `Pπ(1)P` near a nonzero projection; no trace, not quasidiagonal | unit needed |
| §8.2 states | `ℂ²`; `C(𝕋)`, `δ_1`; block sums | `diag(t, 1 − t)`; first coordinate of `φ_n`; `Σθ_jσ_j∘φ_{i_j} = (⊕θ_jσ_j)∘(⊕φ_{i_j})` | holds; traces cannot replace states |
| §8.3, §8.5 | Toeplitz; `M_3 ⊆ CAR`; `B` trivial | traces not faithful; `c = 3/4`; excluded by `[Nontrivial A]` and `hι` | hold |

**Library declarations opened at the pins.** Mathlib: `tendsto_nhds_opNorm` and
`ofReal_opNorm_eq_map_one` (`Analysis/CStarAlgebra/PositiveLinearFunctional.lean`:48, 74),
`exists_norm_apply_le` (`PositiveLinearMap.lean`:63), `exists_sum_four_unitary`
(`Unitary/Span.lean`:87), `Unitization.instPartialOrder`, `inr_le_inr_iff`
(`ContinuousFunctionalCalculus/Order.lean`:90, 109), `starLift` (`Algebra/Algebra/Unitization.lean`:805),
`gnsNonUnitalStarAlgHom`, `gnsStarAlgHom` (`GelfandNaimarkSegal.lean`:196, 246),
`map_cstarMatrix_nonneg`, `instCompletelyPositiveMapClass` (`CompletelyPositiveMap.lean`:133, 153),
`CStarMatrix.ofMatrix` (`CStarMatrix.lean`:55), `TensorProduct.mapL`
(`InnerProductSpace/TensorProduct.lean`:603), `Subtype.starOrderedRing` (`Range.lean`:285),
`StarSubalgebra.isClosed_topologicalClosure` (`Topology/Algebra/StarSubalgebra.lean`:83),
`Set.isClosed_centralizer` (`Topology/Algebra/Group/Basic.lean`:34), `centralizer_centralizer`
(`VonNeumannAlgebra/Basic.lean`:121), `geometric_hahn_banach_closed_point` (`Separation.lean`:230),
`increasingApproximateUnit`, `IsIncreasingApproximateUnit` (`ApproximateUnit.lean`:320, 143),
`gelfandStarTransform` (`GelfandDuality.lean`:190), `rieszMeasure` (`RieszMarkovKakutani/Real.lean`:66),
`frobenius_norm_def` (`Analysis/Matrix/Normed.lean`:578), `lp.single` (`lpSpace.lean`:1007). Tau
Ceti: `trivial` (`Action/Basic.lean`:145), `Hom` (`Action/Hom.lean`:36), `isKMSState_zero_iff`,
`IsKMSState.comp`, `comp_of_surjective`, `isKMSState_comp_iff_of_surjective`, `restrict`
(`KMS/Basic.lean`:237, 321, 330, 337, 349), `isKMSState_trivial_iff` (`KMS/Dense.lean`:144),
`of_tendsto`, `kmsStates`, `closure_kmsStates_inter_subset`, `convex_kmsStates`,
`isClosed_kmsStates`, `isCompact_kmsStates` (`KMS/StateSpace.lean`:51, 61, 106, 119, 138, 148), the
separating-vector theorem (`KMS/Separating.lean`:114), `toGNS`, `denseRange_toGNS`, `gnsVector`,
`norm_gnsVector` (`GNS.lean`:54, 62, 72, 110), `subset_adjoin` (`Adjoin.lean`:59), the density
theorem (`Density.lean`:155), `traceRadical`, its `IsTwoSided` instance, `traceRadical_ne_top`
(`Radical.lean`:45, 58, 87), the Frobenius inner product (`Frobenius.lean`:57, 106), trace duality
(`Duality.lean`:31, 52), `Amenable.of_lpTop` (`Linfty.lean`:159, for any left-invariant `μ`),
`not_amenable_freeGroup` (`FreeGroup.lean`:40, `[Nontrivial α]`). Duplication by object: no
amenable or quasidiagonal trace, hypertrace, nuclear map, AF predicate or normalized matrix trace
exists at either pin.

**Cross-roadmap citations resolved on main.** CStarAlgebras C2.1 (544), C2.8 (763), C4.1 (986),
C4.2 (1021), C5.1 (1112), C5.2 (1143: product functionals for arbitrary bounded functionals, with
`M_n ⊗ A ≅ M_n(A)` and `C(X) ⊗min C(Y) ≅ C(X × Y)`), C5.4 (1203), C6.1 (1272), C6.2 (1297), C6.5
(1414), C7.1 (1455: exact iff a faithful representation is nuclear, independent of the
representation, with unitization variants), C8.1 (1587), C8.2 (1617), C8.3 (1645), C8.4 (1676),
C9.1 (1711), C9.7 (1900). VonNeumannAlgebras V13a (4635), V13b (4692; hypertraces and the Følner
criterion at 4827–4841, the `ℂ²` Check at 4863–4868). CStarClassification §2.1 (351), §3.4 (587),
§3.5 (616). OperatorAlgebraDynamics D2 (1466), D2.FreeGroups (1781). FactorRigidity §2.2 (217).
BanachSpaceTheory B1 (54). The restated predicates equal their suppliers' word for word
(`IsAF`, `IsInjective`, `IsNormalFunctional`, `IsQuasidiagonalSet`, `IsQuasidiagonal`;
`IsNuclearMap` is C6.1's `IsNuclearContraction` on a bare map) in a different namespace, so no
fully qualified name is shared.

**Ownership and overlap.** `roadmaps grep` over main and the open heads for amenable and
quasidiagonal traces, hypertraces, Rosenberg's theorem, AF embeddings and faithful amenable traces:
the only hits are VonNeumannAlgebras V13b (von Neumann hypertraces, deferred to in the Scope),
Subfactors and FactorRigidity (consumers of V13b) and a Check of CStarClassification that quotes
Rosenberg's theorem without proving it. This roadmap is the owner of the C*-algebraic notions. The
overlap listing: no open pull request changes this roadmap, no cited id is dropped, none is defined
only by a revision. The board's package index lists no package in operator algebras. No notion had
to move from a later roadmap.

**Dependency check.** Output: `depcheck: 210 roadmaps, 1925 edges, 0 problem(s)`. No UPWARD, CYCLE
or `moved:` line.

**Shape.** Eight layers named by their mathematics, each ending with Examples and Dependencies and
each depending on all earlier ones, so the order is forced; every definition has its API and at
least three Checks; every theorem a locator; no LaTeX delimiters, pull-request numbers, anchors,
machine paths or process words in README or Lean.

**Remarks needing no change.** README line 1596 joins two sentences on one long source line and
lines 1959–1960 are broken short; both render correctly. The extension of `π_τ` from an ideal in
§1.3 is proved inline; Tau Ceti's `NonUnitalStarAlgHom.multiplierExtension`
(`TauCeti/Analysis/CStarAlgebra/Representation/Nondegenerate.lean`:204) is an alternative route but
does not replace it, the pin having no map from `A` to the multipliers of an ideal.

## Not verifiable

- `connes1976`, `brown-ozawa2008`, `paulsen2002`, `pedersen2018`: waived; cited as background by
  locator, texts not read.
- `kirchberg1993`: paywalled, `uncertified`; its Theorem 7.5 and Proposition 7.1 are known only
  through brown2006 lines 1910–1913.
- The numbering of the published Memoir of brown2006 against arXiv v2: not compared; the README
  cites the arXiv numbering.
- Packages under review on other board branches were not opened; the index lists none on this
  subject.

## Source issues

- **Misprint** in brown2006 at proof of Proposition 3.5.3, printed page 29: the source says the projections lie in the double commutant of the GNS image and writes the representation of the wrong trace; it should be the commutant, as in Lemma 3.5.2, and the representation of the combined trace; affects nothing.
- **Gap** in brown2006 at proof of Lemma 3.1.4, printed page 17: the source takes, for each eigenvector, as many vectors of an orthonormal basis of the same Hilbert space as its multiplicity numerator, which fails on a small space; it should tensor with an auxiliary space of dimension at least the common denominator; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ab917cd822f8247413cc2e9928f57c50c112d65", "job": "REV-PKG-AmenableTracesOnCStarAlgebras~3", "model": "fable", "worker": "chris-l"} -->
