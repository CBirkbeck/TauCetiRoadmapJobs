# Review of AdicSpacesPartIII (pull request #1807 at b566a4c)

**Verdict:** needs changes

## R01 (P3) — The AdicSpacesPartII supplier table cites as planned Part II names declarations that the pinned Tau Ceti has

**Location:** `TauCetiRoadmap/AdicSpacesPartIII/README.md` rows at lines 255, 561, 562, 568, 571, 572, 576, 577, 578, 601, 603 and 641, e.g. line 577: "`TauCetiRoadmap.AdicSpacesPartII.Huber.spectralSeminorm` … (planned supplier interface: none of these Part II names is a declaration of `TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`)".

**Claim:** These objects are not planned: they are declarations of Tau Ceti at the pin, under `TauCeti.` names. The contract must cite the pinned name and file; the `TauCetiRoadmap.AdicSpacesPartII.` names exist nowhere.

**Witness:** Pin: `TauCeti/RingTheory/Huber/TateGauge/Spectral/Seminorm.lean:72` `TauCeti.Huber.spectralSeminorm`; `TateGauge/NormDatum.lean:63` `TateNormDatum`; `TensorProduct/Pair.lean:281` `Pair.completedTensor.existsUnique_lift`; `AlgebraicGeometry/Blowup/Submodule/Basic.lean:110` `submoduleBlowup`.

**Repair:** Move these names to a `From Tau Ceti` row each, with the file, and keep under AdicSpacesPartII only the names the pin lacks:
- 576: `TauCeti.Huber.TateNormDatum`, `TauCeti.Huber.tateNorm` (`TauCeti/RingTheory/Huber/TateGauge/NormDatum.lean`).
- 577: `TauCeti.Huber.spectralSeminorm`, `spectralSeminorm_eq_of_ringOfDefinition`, `spectralSeminorm_rpow`, `spectralSeminorm_lt_one_iff`, `spectralSeminorm_eq_zero_iff`, `spectralSeminorm_one` (`TauCeti/RingTheory/Huber/TateGauge/Spectral/Seminorm.lean`).
- 578: `TauCeti.Huber.SpectralTop`, `SpectralTop.isUniformAddGroup`, `SpectralTop.isTopologicalRing`, `SpectralTop.hasBasis_nhds_zero`, `SpectralTop.powerBoundedSubring_eq`, and `SpectralTop.isTopologicallyNilpotent_toSpectralTop_iff` in place of `isTopologicallyNilpotent_iff` (`TauCeti/RingTheory/Huber/TateGauge/Spectral/Topology.lean`).
- 561, 571, 572: `TauCeti.Huber.tensorTopology`, `TauCeti.Huber.hasBasis_tensorTopology` (`TauCeti/RingTheory/Huber/TensorProduct/Topology.lean`); `TauCeti.Huber.Pair.completedTensor.plus_eq`, `.lift`, `.lift_comp_inl`, `.lift_comp_inr`, `.existsUnique_lift`, `.hom_ext` (`TauCeti/RingTheory/Huber/TensorProduct/Pair.lean`).
- 255, 568: `TauCeti.AlgebraicGeometry.submoduleBlowup`, `.toSpec`, `.fromSpec_toSpec`, `.fromSpec_preimage_basicOpen`, `.basicOpenIsoSpec` (`TauCeti/AlgebraicGeometry/Blowup/Submodule/Basic.lean`).
- 601: `TauCeti.Huber.Pair.finiteAlgebra`, `finiteAlgebra.algebraHom_toRingHom`, `finiteAlgebra.homEquiv_apply` (`TauCeti/RingTheory/Huber/ModuleTopology/Pair.lean`).
- 603: `TauCeti.Huber.ContinuousKaehlerDifferential`, `ContinuousKaehlerDifferential.D` (`TauCeti/RingTheory/Huber/Kaehler/Basic.lean`).
- 641: `TauCeti.Huber.BanachModule.CompletedTensor.finiteProjectiveEquiv_tmul` (the file the row already names).
- 562: cite `TauCeti.Huber.IsNoetherianType.completion` (`TauCeti/RingTheory/Huber/Completion/Noetherian.lean`), which is stated on the class R2–R3 use, and drop `IsNoetherianType.completion` from the bridging sentence of row 563.

## R02 (P3) — `Huber.IsTateRing.isOpenMap` does not exist at the pin

**Location:** README lines 9195, 9286, 9462 and 9472: "the open mapping theorem `Huber.IsTateRing.isOpenMap` and `IsTateRing.isOpenMap_linearCombination`".

**Claim:** No declaration of that name is in the pinned Tau Ceti. The previous repair corrected only the Dependencies list (line 12184).

**Witness:** `TauCeti/RingTheory/Huber/OpenMapping.lean:109` is `LinearMap.isOpenMap_of_isTateRing` (namespace `LinearMap`, lines 92–137); `:162` is `TauCeti.Huber.IsTateRing.isOpenMap_linearCombination`. Nothing else there is named `isOpenMap`.

**Repair:** At the four lines write `_root_.LinearMap.isOpenMap_of_isTateRing` in place of `Huber.IsTateRing.isOpenMap`.

## R03 (P3) — Three Checks still carry backticked Lean-style labels

**Location:** README line 1873: "The Check `thickeningSystem_two_stage` computes this for `p = 2`"; line 5463: "The Check `LocallyQuasiFinite_infiniteFibre` instantiates this"; line 9934: "Check `finiteProjective_descent_quadratic_two` asserts étaleness".

**Claim:** The previous review's R06 is repaired at the lines it listed and not at these three: a Check never names a Lean declaration, and none of the three is in `Suggested.lean`.

**Witness:** `grep -c "thickeningSystem_two_stage\|LocallyQuasiFinite_infiniteFibre\|finiteProjective_descent_quadratic_two" TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` gives 0.

**Repair:** Write the three labels in italics: *thickeningSystem_two_stage*, *LocallyQuasiFinite_infiniteFibre*, *finiteProjective_descent_quadratic_two*.

## R04 (P3) — The docstring of `GlueingSquare` misstates the setting of KL15 Definition 2.7.3

**Location:** `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` lines 260–261: "(KL15, §2.7, Definition 2.7.3, stated there for complete Tate rings, with its condition (c) …".

**Claim:** KL15 states the definition for Banach rings and says that a topologically nilpotent unit is not needed. The Tate hypothesis is this roadmap's choice of carrier, not the source's.

**Witness:** KL15 (arXiv:1301.0792v5) p. 56, Definition 2.7.3: the square is one of Banach rings, with a parenthesis saying that topologically nilpotent units need not be assumed for the definition.

**Repair:** Write "stated there for Banach rings, with no topologically nilpotent unit assumed; here the rings are uniform rings and the theorems assume complete Hausdorff Tate rings, with its condition (c) …".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| *completed-tensor-product-adic* | `ℤ_p⟦S⟧ ⊗̂ ℤ_p⟦T⟧`; EGA-I line 7808 | `pℤ_p⟦S⟧ ≠ (p,S)`: not adic; EGA p. 194: product need not be locally noetherian | holds | none |
| *formal-closed-immersion-criterion* | `S ↦ 0` on `ℤ_p⟦S,T⟧`; `ℤ_p → ℤ_p⟦T⟧` | `(p,S,T)ℤ_p⟦T⟧ = (p,T)`, adic, surjective; `(p)` not an ideal of definition, map not surjective | holds | none |
| *completion-detects-near-closed* | `Spec ℤ`, `V(p)`, `u = ℓ`; `F = ℤ/ℓ` | `û` iso on `ℤ_p`, `u` iso on `D(ℓ)`; `ℤ/ℓ ⊗ ℤ_p = 0`, sections vanish on `D(ℓ)` | holds | none |
| *coherent-as-inverse-system* | `(ℤ/p^{min(n+1,k)})`; `B⟦T⟧`, `J_n = (X_iT^i)_{i≤n}` | `F_n ⊗ ℤ/p^{m+1} = F_m`, limit `ℤ/p^k`; `J_n` needs `n+1` generators, no finitely generated Fitting ideal | holds | none |
| *pow-quotient-formal-module-comparison* | `J = 0`; `J = A`; `Spec A`, `M~` | identity quotient; `F → 0`; `(M/J^{n+1}M)~` | holds | none |
| *lrs-morphism-gluing* | cover `{X}`; `X = ∅` | `f = f_1`; unique map from `∅` | holds | none |
| *coherent-formal-module-properties* | `𝒥 = 0` | sections topology discrete | holds | none |
| *quasi-finite-formal-model* | `O_K⟨ζ,ξ⟩/(ζξ−ϖ) → Spf O_K⟨ζ⟩` | fibre over `ζ = 0` is `A¹_k`; chart `ζ` of the blow-up of `(ζ,ϖ)` is `X`: open immersion | holds | none |
| *henselian-quasi-finite-finite-part* | `Spec A ⊔ Spec A[1/t]`, `A = k⟦t⟧`; infinite `⊔ Spec A` | `X_fin = Spec A`, `X_miss = Spec k((t))`; closed fibre infinite, no finite part | holds | none |
| *ideal-of-coefficients* | `Spf(A/ϖ) → Spf A`, `𝒥 = 0` | `𝒥` open, `𝒞 = 0` not open: flatness of `h` needed | holds | none |
| *devissage-flatness-criterion* | `O_K⟨ζ,ξ⟩/(ζξ−ϖ)` at `(ζ,ξ)`; `ζ` a unit | `ζ·ξ = 0` in `k[ζ,ξ]/(ζξ)`: not flat; `ξ = ϖ/ζ`: open immersion, flat | holds | none |
| *hasse-domain-transition-maps* | `ε' = 1/4`, `ε = 1/2`; rank-2 point | `u = p^{1/4}u'`, `Tu = p^{1/2}`; strict inequality at the rank-one generization passes to `x`: interior is `⋃ X(ε')` | holds | none |
| *adic-local-flatness-criterion* | `I = 0`; `I = A`; general | trivial; `M = 0`; kernel of `a ⊗ M → M` lies in `⋂ Iⁿ(a ⊗ M) = 0` | holds | none |
| *glueing-square*, `GlueingSquare` | `R₁ = R`, `R₂ = R₁₂ = 0`; diagonal `R → R × R` | exact, dense, primes lift; `(1,0)` not in the image | holds | R04 (docstring) |
| *coherent-ideal-closed-subspace* | `(T)`, `(T²)` on the disc; `I = 𝒪`, `0` | `Spa K`, `Spa K[T]/(T²)`, same support; `∅`, `X` | holds | none |
| *uniform-iff-power-bound*, `isUniform_tfae` | `ℚ_p[ε]`, sum norm; `ℂ`; `A = 0`; `ℚ_p` with `|·|'` | `ε` fails (a), (b), (c); all hold with `c = 1`; all hold; `|p|'|p⁻¹|' = 1 + log p` | holds | none |
| *proper-cohomology-adic-completion* | Rees-ring route | `a^{k₁}` kills every `Q_k`; `Q_{k+s} → Q_k` sends `a'ˢx` to `aˢx = 0` | holds | none |
| `IsCompleteRankOneBase`, `IsAdmissibleAlgebra` | `(ℤ_p, p)`; `ϖ = 0`; `A = 0` | fields hold; `ne_zero` fails; tfp with unit kernel, no torsion, flat | discriminating | none |
| `iff_of_surjective`, `…_of_flat`, `isAdmissibleAlgebra_iff_flat` | `O⟨ξ⟩ → O`; `O⟨T⟩/(ϖT)`; `a ≠ 0` | kernel `(ξ)`; `T` is `ϖ`-torsion, no claim; `ϖⁿ ∈ aO`, torsion is `ϖ`-torsion | holds | none |
| `finitePresentation_of_fg`, `isAdicComplete`, `completedAway_flat` | `J = (ϖ)`; `O⟨T⟩`; `f = 0, 1` | `J ≅ O`; complete; `0` and `A` | holds | none |
| `ringKrullDim_genericFibre_le`/`_eq` | `O⟨T⟩/(ϖT)`; `O⟨S,T⟩/(ST−ϖ)`; `O/ϖ` | `0 ≤ 1`; `1 = 1`; `⊥ ≤ 0` | holds | none |
| `isReduced_isPureDimensional_genericFibre` | `O⟨T⟩`; `A/𝔪A = 0` | `k[T]`, `K⟨T⟩` reduced of pure dimension 1; `A = 0`, both spectra empty | holds | none |
| `exists_unique_frobeniusLift_of_etale` | `A = R = ℤ_p`; `pA = 0` | lift `id`; absolute Frobenius only | holds | none |
| `laurent_exact_of_finite` | `f = 1`; `f = 0` | `0 → M → M² → M → 0`; `B₂ = B₁₂ = 0`, `M ≅ M` | holds | none |
| `projective_sections`, `of_simpleLaurent`, `finite_sections_of_simpleLaurent` | `R₂ = R₁₂ = 0`; `f = 1` | sections `= M₁`; `0 → R → R² → R → 0`, sections `≅ M₁` | holds | none |
| `denseBanach_inverseSystem_exact` | `V_n = 0`; constant `V`, `t = id` | trivial; `x₀ = 0`, `x_{n+1} = x_n − y_n` | holds | none |
| `projectiveTrace_eq_categoricalTrace`, `Algebra.projectiveTrace`, `…Form` | `R²`, `diag(a,d)`; `k[x]/x²` | `a + d`; Gram `[[2,0],[0,0]]`, not bijective | holds | none |
| `projectiveTrace_eq_sum_geometricPoints`, `projectiveTrace_trans` | `ℚ×ℚ(i)`, `(1,i)`; `k ⊂ k×k ⊂ k×k[x]/x²` | `1 + i − i = 1`, `3 = 3`; `Tr_{C/k}(1) = 3 = Tr_{B/k}(1,2)` | holds | none |
| `etale_iff_projectiveTraceForm_bijective` | `ℚ(√2)`; `ℤ[i]/ℤ`; `B = 0` | Gram `diag(2,4)`; discriminant `−4`; both sides true | holds | none |
| `GelfandSpectrum.compactSpace_nonempty`, `smoothingFun_eq_sSup` | `A = 0`; `ℚ_p`, `x = p`; `ℚ_p[ε]`, `ε` | empty, `sSup ∅ = 0`; one point, `1/p = 1/p`; `0 = 0` | holds | none |

- Previous review at 4722dba: R01 repaired (lines 2991–2996 and 3185–3190 are citations of §4.10; line 3551 cites `chow_lemma`); R02 repaired at lines 461, 8849–8852, 12232; R03 repaired (`isUniform_tfae` has no `[IsTateRing A]`); R04 repaired (the three declarations are gone); R05 repaired (docstring lines 46–50); R06 partly (this review's R03); R07 repaired (lines 4, 11, 5577, 7055–7068); R08 repaired (row 563; superseded by R01 for `completion`).
- Gate at this head (worker): every counter 0, including `lake build`. Dependency check rerun: `depcheck: 206 roadmaps, 1909 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of a scratch copy with `#check @` for every declaration: 22 `sorry` warnings, no error, no other warning; each elaborated type compared with its README statement, no binder lost that a statement needs.
- Source locators checked against the text: 31. EGA-I lines 2451, 2571, 3824, 5109, 7458, 7808, 7937, 7951, 7960, 7966, 8124, 8186, 8204, 8212, 8220, 8230, 8409 (printed page = file page + 1); EGA-III-1 lines 5434, 5612, 5646, 5678, 5708 (+ 3); Kiehl-E lines 290–298 (p. 197); KL15 Def. 1.3.7, Cor. 2.3.5, Def. 2.7.3, Prop. 2.7.5; BHW §2.1, p. 7; Conrad-MR Thm 4.1.1(1), p. 26, and Lem. A.1.4, proof of Thm A.1.2, p. 38; EGA IV₄ 18.5.11(c), pp. 130–131.
- Library declarations opened at the pin: 19, among them `RingTheory/Huber/OpenMapping.lean:109, 130, 162`, `Spa/RationalSubset/Refinement.lean:151, 184`, `NoetherianType/Basic.lean:38`, `Completion/Noetherian.lean:195`, `TateGauge/NormDatum.lean:63, 147`, `TateGauge/Spectral/Seminorm.lean:72`, `Spectral/Topology.lean:97, 404`, `TensorProduct/Pair.lean:161, 281, 300`, `Blowup/Submodule/Basic.lean:110`, `ModuleTopology/Pair.lean:75`, `Kaehler/Basic.lean:93`, `Etale/Discriminant.lean:66, 122`, `LaurentCover/Basic.lean:577` (ring-level, strongly noetherian Tate: weaker than `laurent_exact_of_finite`).
- Cross-roadmap citations resolved: SchemeAndStackFoundations §§0.23a, 0.29, 2.6, 4.7–4.10, 4.12, 4.17 and `Formal.grothendieck_existence`, `grothendieck_existence_fullyFaithful`, `algebraize_hom`, `quotMap`, `levelIncl`, `levelMap`, `AdicThickeningSystem`, `Scheme.CoherentFormalModule` (main); RigidAnalyticGeometry §§1.3, 2.3, 6.2, 6.3, Layers 3–4 and its map of §§7.1–8.4 to R3.2–R3.7 (this head); AdicSpacesPartII `IsNoetherianType.completion`, `IsNoetherianType.isStablySheafy`, `isNoetherianType_iff` (main).
- Pull request text: the AdicSpacesPartIII paragraph agrees with the head (66 named declarations on main, 32 at the head, 34 dropped, none added; no roadmap import).
- Overlap check: read RigidAnalyticGeometry (this head), SchemeAndStackFoundations, AdicSpacesPartII, AdicSpacesPartIV and AdicEtaleGeometry (main); ClassicalAdicEtaleCohomology and PerfectoidTowers were searched through the open heads only. Kiehl's theorems, proper mapping and proper GAGA: Part III (RigidAnalyticGeometry maps its §§7.1–7.5, 8.4 here). Formal functions and existence for proper schemes: SchemeAndStackFoundations §§4.9–4.10. Formal schemes and generic fibres: Part III (AdicSpacesPartIV, AdicEtaleGeometry cite it). Gel'fand spectrum: Part III R3.9 (DiamondsAndVStacks cites it). No declaration of `Suggested.lean` has a name declared in another roadmap.

## Not verifiable

- BL II (manifest: uncertified): Cor. 5.3, p. 426, Rem. 2.2, and §3, Prop. 3.5, pp. 413–414, cited by *quasi-finite-formal-model*, *ideal-of-coefficients* and *devissage-flatness-criterion*, were not read.
- BL I, Lem. 1.6, pp. 295–296 (*adic-local-flatness-criterion*), and RG, Cor. 2.3, p. 13 (*devissage-flatness-criterion*): the sources service resolves both only to the paywalled Springer pages; the statement of *adic-local-flatness-criterion* was checked by proof instead.
- Huber96 §1.4, (1.4.1), p. 60 (*coherent-ideal-closed-subspace*): not freely available.

## Source issues

- none
