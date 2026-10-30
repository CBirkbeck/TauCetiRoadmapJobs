# Review of PadicFamilies (pull request #1019 at ed1464b)

**Verdict:** needs changes

## R01 (P2) — Import the relative Robba and cohomology machinery

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:2604`, “the relative Robba functor and its base change … Herr/Iwasawa identification”.

**Claim:** These are additional constructions owned here, with only the general Selmer carriers supplied elsewhere.

**Witness:** `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:721` supplies the affinoid realization/base change; §3.6 gives Galois comparison; §5.4 (line 1866) gives analytic Iwasawa comparison. Merge-order positions: supplier 27, PadicFamilies 153.

**Repair:** Add the exact contracts from that roadmap §§1.1–1.2, 3.6, 4.5 and 5.4; consume them in §4.9. Keep the Coleman cohomology summand, its specified characters, noble-neighbourhood triangulation, Eichler–Shimura vector and regulator application here. Delete the second generic functor/comparison construction. The distinction is visible for the trivial rank-two representation over A=K⟨t⟩: the supplied realization is already R_A², including after A→A/(t); it is not a new Coleman-family theorem. Use derived coefficient change where required, rather than asserting ordinary cohomology base change without its hypotheses.

## R02 (P2) — Use the existing weighted preparation interface

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:1382`, “construct the weighted relative Tate algebra … prove `spectralBlock_weierstrass`”. The ownership claim also occurs at line 68.

**Claim:** Weighted relative series and their preparation are additional theory developed here.

**Witness:** On main, `TauCetiRoadmap/RestrictedPowerSeries/README.md:454`–§4.3 supplies weighted division/preparation; §§6.2 and 6.4 supply carrier comparisons and identify AdicSpacesPartII §R0.3 as the completed-tensor owner.

**Repair:** Name these suppliers and use their actual distinguishedness hypotheses. Retain here the spectral application: shrinking/rescaling a residue-disc chart so those hypotheses hold and identifying the resulting polynomial with the selected spectral block. Do not plan another weighted carrier or preparation theorem. For the README's Q₅ example 1−5T, the existing theorem gives distinguished degree zero and unit inverse Σ(5T)ⁿ; for T−a with |a|≤r it gives degree one. Both advertised checks are already instances of the shared interface.

## R03 (P3) — Remove the reference anchors rejected by the gate

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:2987` and the other 22 reference-anchor lines through 3075; for example `<a id="ref-kt"></a>`.

**Claim:** The submitted folder passes the roadmap's textual form requirements.

**Witness:** The head's gate reports `residue=23`, all other counters zero, and `FAIL`; its residue rule explicitly forbids `<a id=` tags.

**Repair:** Replace the raw HTML anchors with ordinary reference headings and update the in-document links to their generated heading anchors. Re-run the gate. For the KT example, a heading `### KT` and link `#kt` retain navigation without the forbidden tag. This is a policy failure, not a mathematical one.

## R04 (P3) — Make proposed API bullets prose, not undeclared Lean names

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:201` and throughout the API lists; for example `ordinaryProjector` and `universalHecke` (line 749).

**Claim:** The README presents these as named declarations, although its opening says they are future interfaces.

**Witness:** `TauCetiRoadmap/PadicFamilies/Suggested.lean` declares exactly three definitions and three theorems. Neither example name is declared; the README has 307 bullets beginning with a backticked name.

**Repair:** Express the unimplemented API facts as prose, retaining backticked declaration names only for the six actual declarations or identified supplier/library declarations. Do not add API padding to Suggested.lean. For example, replace the universalHecke bullet by a prose instruction to form the inverse-limit algebra. This preserves the target while removing the false declaration correspondence.

## R05 (P3) — Correct the ACC reference link

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:3057`, the link labelled “Potential automorphy over CM fields (2023 author copy)”.

**Claim:** The linked article is the cited Allen et al. paper, pages 897–1113.

**Witness:** [The linked publisher page](https://annals.math.princeton.edu/2023/197-3/p03) gives Browning–Le Boudec–Sawin, *The Hasse principle for random Fano hypersurfaces*, pages 1115–1203. The Allen et al. author PDF instead begins at page 897.

**Repair:** Link the [Allen et al. author copy](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf), or the correct publisher article, retaining the version whose pagination is cited. Opening that author copy gives *Potential automorphy over CM fields*, pages 897–1113; it repairs the concrete mismatch.

## R06 (P3) — Extend the quaternionic Hecke locator to page 34

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:2725`, “§3.2, pp. 32–33”.

**Claim:** That locator supports the quaternionic Hecke image, its ordinary projection and its identification with the cuspidal algebra.

**Witness:** sw line 1025 starts printed page 34; sw lines 1034–1037 define the quaternionic algebra and identify its ordinary image with T₂. The cited pages end before this identification.

**Repair:** Cite §3.2, pp. 32–34, with page 34 specifically for the quaternionic identification. The constant/norm-factor subspace is killed by the projector at sw lines 1032–1033, so the repaired locator also supports the negative-control example.

## Verified sound

The unchanged head was reviewed; there is no outside-folder diff. The folder has its README, Suggested.lean and metadata. No sorry-valued data, option overrides, forbidden imports, admitted examples or executable algorithm targets were found. The small matrix and coefficient calculations are mathematical checks. The ownership defects above are repairable subdivisions, not evidence that the entire roadmap must be rejected as a replacement of an existing roadmap.

The supplied targeted-build gate has `build=0`. Independently, `lake env lean` on the unchanged Suggested.lean succeeds with exactly three sorry warnings. A scratch copy containing `#check @...` for **all six declarations** also elaborates. The local-ring, finite-residue-field, completeness, finite-projective and interval hypotheses needed by the three theorems survive. CompleteFlatComplex needs no derived-category instance; HasFiniteProjectiveModel needs no local-ring structure. Those dropped section binders are harmless. No reviewed signature was changed. Replacing each of the **three** sorry proofs by the single tactic `simp` leaves three unsolved goals; reading the definitions and pinned Fitting API does not identify a one-lemma proof of these complete/infinite-rank/derived assertions. No padding finding is supported.

**Headline coverage.** The README's ordinary projector (§0a.22), perfect ordinary splitting (§0a.17), and independence (§0a.25) are the three Lean theorems. Its other headlines are coefficient-tower gluing; Katz/ordinary control; period-line freeness and two-variable interpolation; the general eigenvariety and global symbol eigencurve; classicality and critical-eigensymbol multiplicity, local families and secondary functions; modular zeta reciprocity, family reciprocity and Euler-system divisibility; Coleman-family triangulation/regulation; and totally real ordinary control and period comparisons. The docstring names the missing tower, analytic-space, symbol-family, Galois/cohomology and Hilbert-lattice carriers. Searches at the pins found no native Hida/Igusa tower, relative Robba realization or eigenvariety carrier making those missing family headlines directly statable. Classical Newform alone does not do so. The six kept declarations have distinct fully qualified names in the searched roadmap corpus.

**Dependency check (rerun):**

```text
depcheck: 208 roadmaps, 1481 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not detect unlisted owners such as R01. The complete gate remains failed solely by R03; no acceptance is being inferred from the passing Lean build.

**Pinned declarations opened (ten named declarations in nine rows).** Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

| Declaration / file | Evidence and limit |
|---|---|
| `IsAdicComplete`, `Mathlib/RingTheory/AdicCompletion/Basic.lean:56` | Extends both separatedness and precompleteness; a fraction field is not separated for the DVR's maximal-adic filtration. |
| `LinearMap.eventually_isCompl_ker_pow_range_pow`, `Mathlib/RingTheory/Artinian/Module.lean:308`; `isCompl_iSup_ker_pow_iInf_range_pow`, line 317 | Artinian and Noetherian hypotheses give Fitting decomposition; they do not give factorial convergence over C. |
| `Ideal.finite_quotient_pow`, `Mathlib/RingTheory/Ideal/Quotient/Index.lean:101` | Requires a finitely generated ideal and finite quotient. Noetherian maximal ideals meet the first requirement. |
| `IsLocalRing.finite_quotient_iff`, `Mathlib/RingTheory/LocalRing/Quotient.lean:130` | Retains Noetherian and finite-residue assumptions. |
| `nonempty_sections_of_finite_cofiltered_system`, `Mathlib/CategoryTheory/CofilteredSystem.lean:79` | Finite nonempty fibres over an arbitrary small cofiltered category; no countability requirement. |
| `CharacterModule`, `Mathlib/Algebra/Module/CharacterModule.lean:43` | Algebraic additive characters into AddCircle; it does not itself impose continuity. |
| `FractionRing`, `Mathlib/RingTheory/Localization/FractionRing.lean:729` | Localization at non-zero-divisors, allowing the total quotient ring of a reduced ring with several components. |
| `HeckeRing.GL2.Newform`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | Extends EigenformAwayFromLevel with newness and a₁=1; all bad-index eigenproperties are not bundled. |
| `HeckeRing.GL2.heckeUNat`, `TauCeti/NumberTheory/ModularForms/HeckeSlash/BadPrime/Basic.lean:54` | Alias of the native T operator with prime and level-divisibility inputs; normalization comparison at line 65. |

**Resolved supplier boundaries (14 grouped rows).** The citation resolver found no missing roadmap name. I read the supplier declarations rather than treating its 35 missing-name leads as verdicts. The future Eigenvariety/FiniteQuotientSystem names are covered by R04; `HeckeImage.finite_local_factors` belongs to a supplier, not the pins. The principal contracts resolved by object were:

| Supplier and location | Contract used / ownership decision |
|---|---|
| `IntegralIwasawaTheory/README.md:1090`, §9.0 | Shared full/cuspidal towers and control, for p≥5. The inverse-diamond coordinate must be transported; the p=3 cuspidal extension is additional. |
| `IntegralHeckeAndGaloisDeterminants`, §§0.6, 2.2–2.3, 4.2 | Projective determinant, finite local factors, finite commutative factorial idempotent and determinant interpolation. The noncommutative-action adapter uses R[t]. |
| `DerivedModuleAlgebra`, §§1.T.1, 1.1, 1.E.0–1.E.1 on main | Tower cohomology and perfect-system effectivity; compatible maps are part of the input. |
| `DeformationAndDerivedPatchingAlgebra/README.md:1383`, §7.3; line 1417, §7.5; line 1492, §7.8 | Minimal finite/complete-flat models and completion of derived Hom. No second minimal-model theory is needed here. |
| `ModularSymbolsPadicLFunctions/README.md:1869`, §3.0, and Layers 0–2 | Cuspidal local Banach-complex/critical suite and single-weight symbols. The global descent and Eisenstein extension are distinguishable additional targets. |
| `LocallyAnalyticDistributions`, Layer 4 | Uses the shared CompactOperators Fredholm/Riesz contracts, with the family/cochain adapters. A closed kernel alone is not a proof of (Pr). |
| `ModularCurvesPartII`, §§3–5, 7, 13–17 | Level curves, Hodge/local systems, boundary and Tate-module interfaces. A semistable ℓ≠p filtration is not the family's p-local ordinary line. |
| `SerreWeightAndLevelOptimisation`, §2.13, §§3.1, 3.5–3.7, Layer 4 | Tame descent and weight operations; the ordered ordinary witness is explicitly an additional target here. Primary Diamond verification remains limited below. |
| `SelmerIwasawaCohomology`, §§2.21–2.24, 3.8–3.15, 4.9–4.12 | Local-condition cones, control, restricted-ramification comparison, and Bloch–Kato conditions; not the geometric zeta reciprocity itself. |
| `NoncommutativeAndEquivariantIwasawa/README.md:2287`, §F.5 | Both Hilbert lattices, all-cusp versus standard-component distinctions, constant obstruction, tame U operators and all-degree control. §5.10's geometric comparison is additional. |
| `QuaternionicModularForms/README.md:267`, §0.3; `HilbertModularVarietiesAndShimuraCurves`, R18.3 and H1–H5 | Unquotiented finite class set versus central quotient; level geometry, weights and Jacquet–Langlands. Their carriers are not interchangeable without the stated comparison. |
| `GL2AutomorphicRepresentationsAndTransfer`, R16.6.3/R16.6.5; `AlgebraicModularFormsAndSerreWeights`, R15.5A.1–A.2; `WeightsInEtaleCohomology`, R34.6 | Algebraic weights, multiplicity, classical realization and purity, retaining coefficient and Frobenius conventions. |
| `DirichletPadicLFunctions`, §1.6, §§5.4–5.9; `PadicMeasuresIwasawaAlgebras`, §§1, 3, 4.6, 5.1–5.2 | Shared analytic Eisenstein/measure, determinant and compact-tower inputs; no arbitrary fraction-field map from angular pushforward. |
| `RestrictedPowerSeries`, §§4.1–4.3, 6.2, 6.4; `PhiGammaModulesAndIwasawaCohomology`, §§1.1–1.2, 3.6, 4.5, 5.4 | Earlier owners missing from the target's claimed construction boundary: R01–R02. |

Ownership searches used `roadmaps grep/show`, main, the board's available package text and the supplied open-work index, by the objects rather than the proposed Lean names. In particular, HilbertModularForms leaves Hida/overconvergent families to their family owners; the later OverconvergentAutomorphicForms and PadicExtensionFamilies work does not justify an upward supply. The raw annihilator congruence module differs from IKM's higher-codimension Ext construction, including at depth zero. No existing PadicFamilies folder on main was found to be replanned.

**Seeded source sample.** Fifteen requested targets were inspected. The following table states which portions were verified in the actual text and which remain limited; an accessible older version is not certification of a later version's corrected theorem.

| Target | Text and locator checked | Result |
|---|---|---|
| 0.4 | hida lines 489–520, (1.14)–(1.16), pp.243–244 | Integral inverse limit, finite-level freeness, continuity and level independence supported. The source explicitly excludes the analogous rational continuity claim. |
| 0.7 | hida lines 704–750, §3, p.250 | Weight polynomial, component character and weight ranges supported. The inverse-diamond shift is a separate explicit supplier adapter. |
| 0.10 | hida lines 1079–1097, Cor.4.2, pp.258–259 | Finite Λ-module and coefficient extension supported, including p=5. |
| 1.8a | epw lines 1178–1187, Prop.3.2.3, pp.25–26 | EPW's use of the chosen ordinary witness, including the unramified Selmer case, is visible. Diamond Theorem 6.4 itself was unavailable. |
| 1.9 | epw lines 846–960, Thm.2.6.1, Prop.2.6.2, Def.2.6.3, Prop.2.7.2, pp.18–20 | Reduced localization, finite flatness, contravariant surjection and branch comparison supported. Source fixes the trace field; residual identifications over enlarged fields must be read after scalar extension. |
| 2.1 | bellaïche09 lines 855 onward, §§3.1.1–3.1.4, pp.22–24 | Older coefficient modules and action inspected. Later Lemma 3.3 and the corrected tensor-dual action are not source-certified here. The action's explicit numerical check is below. |
| 2.2 | bellaïche09 §3.2, pp.24–26 | Older family-symbol construction inspected. Nice-chart hypotheses and the later weight-zero negative E₂ exception need the unavailable 2011 text. |
| 2.6 | bellaïche09 §3.4, pp.31–33; buzzard §5, construction and links | Local gluing and finite-slope interpretation supported. The all-weight chart/descent extension is stated as its own §2.2 target, not inferred from an arbitrary closed kernel. |
| 3.5 | bellaïche09 lines 793–831, Thm.2.16, pp.20–21 | Decency and the positive-slope Eisenstein restriction retained. |
| 3.8 | bellaïche09 lines 1386–1422, Prop.4.6/Thm.4.7/Cor.4.8, pp.35–36 | Local algebra, ramification length, free rank-one generalized space and one-dimensional socle supported. |
| 4.0 | kato lines 2650–2669, Prop.8.7; 2797–2819, Thms.9.5–9.7; 4046–4095, Thms.12.4–12.5 | Conductor factors, critical ranges, extra M≥2 case, rational/integral distinction and exceptional local H² term checked. OCR limits on smaller formulas remain below. |
| 4.2 | ochiai lines 149–160, properties 4–5, p.116 | Both rank-one terms and the unramified α submodule before the universal twist supported. It is not an unramified F⁻ assertion in the same convention. |
| 4.7 | ochiai lines 267–290, Thm.B/Remark1.3, pp.119–120; ochiai03 Thm.3.13 | Normality, height-one lengths, factorial/Gauss/Euler factors supported; the stronger 2003 hypotheses are separately named in the README. |
| 5.3 | sw lines 960–1037, §3.2, pp.32–34 | Construction supported, but the supplied locator omits its final page: R06. |
| 5.10 | dkv lines 513–574, §3.1, pp.846–847; ddp lines 1204–1251, Def.3.1/Prop.3.2, manuscript pp.30–31; deligne-ribet lines 1383–1442, §5 | Weight k−1, finite character, ideal coefficients and cusp differential normalization checked. DDP's manuscript uses almost-all weights and fractional Eisenstein families; the stronger integral all-weight contracts are explicitly owned by F.5, not proved by this citation alone. Published DDP pagination not independently certified. |

**Computed adversarial pass.** Each numbered target appears below, with separate rows for the three subtargets of 0a.0 and 4.0. Values are explicit finite, local or coefficient-model tests; they are not claimed as full proofs of the arithmetic existence theorems. “Retain” means the stated hypothesis/convention survives that test. Models used for a theorem about modular objects are identified as models, not asserted to be realized by an unspecified modular form. The table also covers the supporting definitions, all three Lean headlines, the sampled targets, and each mathematical target touched by a finding.

| Statement | Instance | Computed left / constructed value | Right / competing value | Result; change |
|---|---|---|---|---|
| 0a.0.1 minimal models | R=ℤ₃, disks with differential 1 or 3 | Differential 1: H=0, minimal model 0; differential 3 reduces to 0 | Mod-3 cohomology dimensions respectively (0,0) and (1,1) | Retain minimality and derived reduction. |
| 0a.0.2 complete-flat | Restricted sequences (3ⁱ)ᵢ over ℤ₃; constant sequence (1)ᵢ | Mod 3ⁿ the first has n nonzero coordinates; the second infinitely many | Completion of the direct sum contains the first, excludes the second | Retain restricted-product description. ℚ₃/3ⁿℚ₃=0 excludes ℚ₃ by separatedness. |
| 0a.0.3 compatible models | Rₙ=ℤ/3ⁿ, stalk Rₙ with compatible multiplication by 3 | Inverse limit stalk ℤ₃, map ×3 | Reduction of ×3 at every n is the specified map | Retain compatibility of maps, not just isomorphism classes. |
| 0a.1 finite iterates | 0↦1↦2↦2; a 2-cycle and a 3-cycle | First map f⁶=f²⁴ is constant 2; cycles f⁶=f²⁴=id | Next factorial powers have the same values; empty set has one map | Retain eventual, not immediate, stabilization. |
| 0a.2 finite projector | M=𝔽₅², U=diag(2,0) | U⁴=diag(1,0); U²⁴=diag(1,0) | Projector e=diag(1,0), e²=e; U itself is not idempotent | Retain factorial exponent. |
| 0a.3 Fitting projection | Same U | Stable image=𝔽₅e₁, stable kernel=𝔽₅e₂ | Intersection dimension 0, sum dimension 2; e=(1,0) | Retain identification with supplied Fitting decomposition. |
| 0a.4 inverse/nilpotence | Same U | On image, U⁻¹=3; 2·3=1 in 𝔽₅ | On kernel U=0, nilpotence index 1 | Retain two different restrictions. |
| 0a.5 uniqueness | Same U; candidate projector 0 | Candidate kernel=M contains e₁ with Uⁿe₁=2ⁿe₁≠0 | Actual kernel=𝔽₅e₂ has U=0 | Wrong projector rejected; retain uniqueness hypotheses. |
| 0a.6 naturality | π₁:𝔽₅²→𝔽₅, source diag(2,0), target ×2 | π₁e(x,y)=x | e′π₁(x,y)=x; π₂ has ordinary target 0 | Retain intertwining. |
| 0a.7 exactness | Split sequence 𝔽₅e₁→𝔽₅²→𝔽₅e₂ with same U | Ordinary dimensions 1→1→0 | Image dimension 1=kernel dimension 1 | Retain finite-module exactness. |
| 0a.8 quotients | Quotient the same M by e₁ or e₂ | Ordinary quotient dimensions 0 or 1 | Quotient of ordinary part dimensions 0 or 1, respectively | Retain both cases. |
| 0a.9 localization | 𝔽₅[X]-module with X=diag(2,0) | Inverting X kills e₂ and retains e₁ | Ordinary part dimension 1; localizing zero module gives 0 | Retain X-localization, not scalar-field localization. |
| 0a.10 finite systems | M=ℤ₃², quotients mod 3ⁿ | Cardinality 3²ⁿ; transition kernels cardinality 9 | Inverse limit ℤ₃² with intersection 3ⁿM=0 | Retain finite quotients and separating filtration. |
| 0a.11 profinite limit | M=ℤ₃, U=3 | v₃(Uⁿ!)=n!→∞, e=0 | Every finite Uⁿ!≠0 | Retain limit rather than eventual equality. |
| 0a.12 profinite decomposition | ℤ₃², U=diag(1,3) | e=diag(1,0), ordinary rank 1 | Complement rank 1 with v₃(Uⁿx)≥n | Retain topological nilpotence. |
| 0a.13 profinite naturality | ×3 on previous example | (×3)e(x,y)=(3x,0) | e(×3)(x,y)=(3x,0) | Retain continuous intertwiner. |
| 0a.14 complete local coefficients | 𝔽₂[[t]], U=diag(1,t); ramified O with 3=uπ² | e=diag(1,0); v_t(tⁿ!)=n! | In O, v_π(3)=2, not 1 | Retain maximal-ideal filtration; no ℤₚ-only uniformizer formula. |
| 0a.15 inverse-limit exactness | Split sequence ℤ₃→ℤ₃²→ℤ₃ with U=1 | At each quotient ordinary sequence is unchanged | Limit kernel and image both ℤ₃e₁; cokernel 0 | Retain compatible surjections/compactness. |
| 0a.16 complexes | C=(R²→R²), d=diag(0,1), U=diag(1,0) | eC=(R→R), differential 0 | H⁰(eC)=H¹(eC)=R=eH⁰(C)=eH¹(C) | Retain degreewise commuting differential. |
| 0a.17 perfect splitting (Lean) | C=ℤ₃²[0], U=((1,1),(0,3)) | Uⁿ has upper-right (3ⁿ−1)/2; e=((1,−1/2),(0,0)) | e²=e, eU=Ue=e; summand ℤ₃[0] in same interval | Retain non-diagonal test and interval. Identity disk instead gives zero homotopy object. |
| 0a.18 coefficient tower | Rₙ=ℤ/3ⁿ, U=diag(1,3) | All eₙ=diag(1,0) | Reductions eₙ₊₁↦eₙ; limit ordinary rank 1 | Retain compatibility, including nilpotent finite quotients. |
| 0a.19 local finiteness definition | I=0, M=𝔽₂[X], U=×X versus U=id | Orbit of 1 under ×X spans {1,X,X²,…}, infinite dimension | Under id it spans {1}, dimension 1 | Definition distinguishes non-example; I=R would be vacuous but is not the proper maximal ideal used later. |
| 0a.20 closure properties | Direct sum basis eᵢ over ℤₚ; T eᵢ=pⁱ⁺¹eᵢ₊₁; submodule generated by pⁱ⁽ⁱ⁺¹⁾/²eᵢ | Ambient T mod p=0 | On the submodule's own generators, T is the unilateral shift, orbit dimension infinite mod p | Retain explicit local-finiteness/filtration condition on kernels; do not infer it for arbitrary submodules. |
| 0a.21 detection mod m | Previous shift; U=diag(1,3) over ℤ₃ | Ambient reduction T=0 is locally finite; diag reduction=(1,0) | Its powers lift to diagonal orbit in a 2-generator module | Retain completeness and intrinsic quotient in the criterion. |
| 0a.22 locally finite projector (Lean) | Completed direct sum over ℤ₃, Ueᵢ=3ⁱeᵢ | Uⁿ!e₀=e₀; for i>0, valuation in coordinate i is i·n! | Limit e keeps coordinate 0 only; e²=e; U bijective there | Retain infinite-rank theorem and pointwise limit. |
| 0a.23 LF exactness | Split sequence for diag(1,3) | Ordinary sequence ℤ₃→ℤ₃→0 | Image=kernel=ℤ₃, cokernel 0 | Retain kernel hypothesis detected by 0a.20's negative control. |
| 0a.24 LF complexes | Identity disk R→R, U=id | Termwise ordinary projector=id | Hⁱ=0 in every degree; derived object 0 | Retain derived, not termwise-rank, interpretation. |
| 0a.25 derived independence (Lean) | C₀=R[0], C₁=C₀⊕(R→¹R), U₀=U₁=id | e₀=e₁=id; comparison projection has H⁰=id_R | Disk cohomology 0; both derived ordinary factors R[0], rank 1 | Retain derived isomorphism and equivariance; strict complexes have different ranks. |
| 0a.26 semilocal | R=𝔽₃[[t]]×𝔽₅[[s]], U=(1,s) | e=(1,0) | Component ordinary ranks (1,0), not one constant global rank | Retain projective componentwise formulation. |
| 0.1 Katz q-expansion | Constants 1 and 0 | q⁰ coefficients 1 and 0; positive coefficients both 0 | Full expansions differ, positive parts coincide | Retain constant and component coordinates. |
| 0.2 divided congruences | f=Δ, g=E₄Δ, p=5 | g−f=240qΔ+…; (g−f)/5 has integral coefficients | Separately dividing the weight-12 component −f gives a₁=−1/5 | Retain divided-congruence lattice, not naïve integral weight projections. |
| 0.3 Hecke normalization | f=q+2q⁵ | U₅f=2q; V₅q=q⁵ | U₅V₅q=q, whereas V₅U₅q=0 | Retain operator direction and weight action. |
| 0.4 universal Hecke (sample) | Zero cusp module at level 5, weight 2 | Hecke image in End(0) is the zero ring | On a normalized rank-one eigenline, the scalar identity acts as 1 | Retain cusp/full distinction and no nonzero-rank presumption. Inverse limits must use integral continuity. |
| 0.5 ordinary idempotent | Δ at p=11; its characteristic polynomial at p=2 | τ(11)=534612≡1 mod 11; p=2 Newton slopes 3,8 for X²+24X+2048 | First has a unit root; both p=2 roots have positive slope | Projector retains ordinary refinement, kills both latter slope pieces. |
| 0.6 duality | Constant 1 and normalized Δ | a₁(1)=0, a₁(Δ)=1 | Constants need separate control; divided weight extraction above yields −1/5 | Retain actual integral duality/lattice rather than coefficientwise weight splitting. |
| 0.7 Λ/weights (sample) | p=5, u=6, weights 0,2,5 | P₀=X; P₂=X−35; P₅=X−7775 | v₅(35)=1, v₅(7775)=2; P₂≠P₀ although congruent mod 5 | Retain weight coordinate and congruence depth. |
| 0.8 Jochnowitz | p=5, E₄ | E₄≡1 mod 5 since 240≡0 | Weight 4 form and weight 0 function have same reduced expansion | Retain weight-component quotient; do not separate these by the raw expansion. |
| 0.9 bounded ordinary weights | p=5, weights 3 through 6 | Residues mod 4 are 3,0,1,2, each once | Weight 10 has residue 2, represented by 6 | Retain bounded representatives; no claim every form itself has bounded weight. |
| 0.10 finite Λ-module (sample) | Finite free coefficient model Λʳ, r=0,1,2 | Mod (5,X) dimensions 0,1,2 | Finite generating sets have sizes 0,1,2 | Finiteness permits zero and varying ranks; source, not this model, proves the arithmetic theorem. |
| 0.11 ordinary control | Rank-one model Λ/P₂ at p=5 | Λ/(X−35)=ℤ₅ | Inverse-diamond adapter 6²/(1+35)=1 | Retain specialization ideal and coordinate transport. |
| 0.12 Eisenstein family | a₁-normalized weight-4 series G₄, p=5 | G₄−125V₅G₄ has a₁=a₅=1, constant −31/60 | Constant has v₅=−1 while positive coefficients are integral | Retain fractional/full lattice distinction. |
| 0.13 specialization | p=5, component character exponent 0; k=4,6 | ω⁻⁴=1, ω⁻⁶=ω² | Same component does not mean same classical nebentype | Retain Teichmüller twist. |
| 0.14 q-expansion duality | Cuspidal series with all aₙ=0 | Series=0; a₁(Tₙf)=aₙ(f)=0 | For normalized Δ, a₁(T₁Δ)=1 | Retain all positive coefficients and cuspidal condition. |
| 0.15 components | Algebra model Λ×Λ | Primitive quotients both Λ, idempotents (1,0),(0,1) | Their product 0 and sum 1 | Retain distinct branches despite isomorphic abstract quotients. |
| 0.16 compact completeness | M=∏ᵢℤ₃ versus ℚ₃ | M/3ⁿM=∏ᵢℤ/3ⁿ and inverse limit M | ℚ₃/3ⁿℚ₃=0, inverse limit 0≠ℚ₃ | Retain compactness/separatedness, not arbitrary p-adic coefficients. |
| 0.17 odd-prime cuspidal control | Involution diag(1,−1), p=3 versus 2 | (1±ι)/2 give diag(1,0),diag(0,1) over ℤ₃ | 1/2∉ℤ₂; formula unavailable integrally there | Retain odd-prime condition of this target. |
| 1.1 symbol tower | Rank-one inverse-system model with identity traces | Compatible element (1,1,…) exists | With traces ×p, (1,1,…) is not compatible (p≠1) | Retain trace, not an unmarked inverse system. |
| 1.2 symbol control | Model M=Λ², arithmetic P | M/PM=O², rank 2 | Two sign lines each rank 1 after splitting | Retain finite character and conductor in actual control. |
| 1.3 period-line freeness | Λ=O[[X]], ideal I=(π,X) | Generic rank 1; dim_k I/mI=2 | A free rank-one module has fibre dimension 1 | Retain the Gorenstein/multiplicity inputs; generic rank alone fails. |
| 1.4 trivializations | θ:L→O with θ(e)=1, θ′=2θ over ℤ₅ | θ′(e)=2; θ′⁻¹(1)=e/2 | Original basis e | Retain inverse transformation for basis versus scalar value. |
| 1.5 two variables | Cyclotomic Dirac measure δ₆ | j-th moment=6ʲ; j=0,1 gives 1,6 | A scalar constant measure-value assignment would give 1,1 | Retain independent cyclotomic variable. |
| 1.6 specialization | Constant weight-family δ₆ | Specialize then moment at j=2:36 | Moment then weight-specialize:36 | Retain commuting specialization with chosen period. |
| 1.7 congruence module | A=O×_(O/π²)O, augmentation first factor | Ann(kernel) maps to (π²); raw module O/π² | Length 2; for dual numbers raw module O, not torsion | Retain generic-separability hypothesis where finite length is used. Depth-zero raw and Ext definitions differ. |
| 1.8 congruence ideal | Same fibre product, and A=O×O | Ideals (π²), O respectively | Quotient lengths 2,0 respectively | Retain annihilator construction; no universal positive congruence length. |
| 1.8a ordered witness (sample) | Local split characters with values 1 and −1 at p=3 | Two residual values 1,2 in 𝔽₃ | Swapping changes chosen ordinary character, trace remains 0 | Retain ordering and p-distinguishedness; arithmetic existence relies on unavailable primary theorem. |
| 1.9 residual algebra (sample) | Σ=∅; enlarging Σ⊂Σ′ | N_∅=N(ρ̄); retained branch has same old tame conductor | Ring map T_Σ′→T_Σ, hence Spec(T_Σ)→Spec(T_Σ′) | Retain reduced localization and correct variance; source arrow misprint below. |
| 1.10 branch congruences | Fibre-product branch model at height-one DVR | Ψ=O/π², length 2 | Valuation of congruence ideal (π²) is 2 | Retain localization and branch augmentation. |
| 1.11 period change | θ′=2θ over ℤ₅ | Scalar L-value multiplied by 2 | Associated basis divided by 2; tensor-valued class unchanged | Retain opposite transformation rules. |
| 1.12 branch L-functions | Cyclotomic group-like element [ℓ], j=0,1; trivial tame diamond | Evaluation of [ℓ] gives 1,ℓ | Tame diamond gives 1,1 | Retain separate tame/cyclotomic factors; replacing one with the other fails j=1. |
| 2a.1 spectral hypersurface | φ=0; φ=5; Jordan block at 1 | Fredholm series 1; 1−5T; (1−T)² | Spectra empty; T=1/5; double point at 1 | Retain reciprocal and nilpotents. |
| 2a.2 weighted preparation | 1−5T on unit disc over ℚ₅; T−a with norm(a)≤r | First is unit, inverse Σ5ⁿTⁿ, distinguished degree 0 | Second has distinguished degree 1 | Tests pass; import shared construction/preparation (R02). |
| 2a.3 constant degree | Graph 1−aT with a a unit; 1−uT allowing u=0 | First fibre length 1 everywhere | Second fibre lengths 1 off u=0, 0 at u=0 | Retain constant fibre-rank condition for finiteness. |
| 2a.4 Newton blocks | P=(1−T)(1−5T) over ℚ₅ | Root norms 1,5; degree in unit disc 1 | Degree in radius-5 disc 2; radius<1 degree 0 | Retain radii and multiplicities. |
| 2a.5 strict neighborhood | P=1−uT, d=1 | At norm(u)=1 root norm=1 | At u=5 root norm=5, outside unit disc | Retain n=0 Newton inequality and nonvanishing leading coefficient; corrected source steps matter. |
| 2a.6 admissible cover | Previous two-root P, or P=1 | Two finite slope blocks cover roots 1 and 1/5 | P=1 has no roots and empty cover | Retain empty and multiple-block cases. |
| 2a.7 full factor | Jordan block at 1 | P=(1−T)²; whole factor has coprime complement 1 | Choosing one copy leaves complement 1−T and resultant 0 | Retain entire generalized block, not one eigenvector. |
| 2a.8 Hecke image | A² with diagonal operator diag(1,2), characteristic 0 | Hecke image A×A has rank 2 | End_A(A²) has rank 4 | Retain image algebra rather than full endomorphism ring. |
| 2a.9 gluing | Identical rank-one unit-eigenvalue chart on triple overlap | All transition maps id; composition id∘id=id | Spectral coordinate remains a⁻¹ on all charts | Retain actual overlap identifications. |
| 2a.10 flat base change | N=A², A=K⟨u⟩, t acts by ((0,u),(0,0)) | Algebra A[t]/t² has rank 2; fibre at u=0 still length 2 | Image on specialized N is K, kernel (t)≠0 | Retain flatness for equality; arbitrary closed specialization only gives nilpotent kernel. |
| 2a.11 links | Finite-rank scalar U=a, α=id, reverse link c=U | αc=cα=U | Both determinants 1−aT | Retain links, not an arbitrary map between Banach modules. |
| 2a.12 eigenvariety | Rank-one module, controlling unit a; zero module | D is graph T=a⁻¹, map to base degree 1 | Zero module gives empty D, degree 0 | Retain construction without nonempty hypothesis. |
| 2a.13 eigenpackets | Eigenvalue 5 | Spectral coordinate 1/5; Tφ=1 | Wrong coordinate 5 gives Tφ=25 | Retain reciprocal convention. |
| 2a.14 dimension | Base K⟨u⟩ and finite faithful torsion-free algebra A×A | Both components dimension 1 | A/(u) dimension 0, not torsion-free | Retain torsion-freeness and nonzero components. |
| 2a.15 spectral complex | Identity disk K→K with scalar U=a≠0 | Degreewise determinant (1−aT)² | Alternating quotient 1; Hⁱ=0 | Retain representative-dependent product. |
| 2a.16 intrinsic support | Same disk; K²[0] with U=id | Disk support empty; second annihilator ideal (1−T) | Second determinant (1−T)² has doubled structure | Retain annihilator support, distinct from degreewise determinant. |
| 2a.17 eigenmodule | B=K[t]/t² acting regularly on itself | Generalized eigenspace dimension 2; t≠0 | Residue fibre B⊗_B K has dimension 1 | Retain generalized space rather than residue fibre. |
| 2.1 distributions (sample) | p=3, δ₁, weight character z↦z, γ=((1,0),(3,1)), test function 1 | Correct right action evaluates (3·1+1)·1=4 | Substituting the wrong tensor-dual action yields 7/4 | Numerical action check retained; later-version locator remains uncertified. |
| 2.2 symbols (sample) | Closed-kernel model multiplication by u on K⟨u⟩; weight-0 negative E₂ window | Kernel before specialization 0; after u=0 kernel K | Exceptional cokernel dimension 1 if slope window includes 1, otherwise 0 | Retain chart/complex construction and explicit exception; not arbitrary kernel base change. |
| 2.3 finite slopes | U=diag(1,5) | Slopes 0,1; rank ≤0 is 1, rank ≤1 is 2 | Treating endpoint as strict gives rank 1 at bound 1 | Retain stated slope inequality. |
| 2.4 local eigencurve | Hecke action by a 2×2 Jordan block | Local Hecke algebra K[t]/t², length 2 | Reduced algebra K, length 1 | Retain nilpotent local charts. |
| 2.5 specialization | Model in 2a.10 at u=0 | Source K[t]/t²→K, kernel (t), square zero | Spectrum of both has one point but rings are unequal | Retain nilpotent-kernel, not isomorphism, conclusion. |
| 2.6 C± (sample) | Local ramification model u=t²; exceptional negative weight-zero quotient | Chart degree 2 over weight; one point over u=0 of length 2 | Exceptional slope-1 quotient has dimension 1, omitted by naïve all-weight surjectivity | Retain global gluing with corrected §2.2 descent. |
| 2.7 eigensymbol sheaf | B=K⟨t⟩ over A=K⟨u⟩, u=t², M=B | Rank_B M=1, rank_A M=2 | Fibre over u=0 is K[t]/t², dimension 2 | Retain the two different rank notions. |
| 2.7a cuspidal comparison | Split model full=M⊕boundary; localize where boundary vanishes | Full localized module=M | Cuspidal localized module=M; boundary quotient 0 | Retain cuspidal/non-Eisenstein localization. |
| 2.8 classicality | Weight k+2=2, k=0 | Unit eigenvalue slope 0<1 | Eigenvalue p has slope 1, not <1 | Retain strict bound; no conclusion at endpoint. |
| 2.9 étale freeness | u=t versus u=t² at 0 | Ramification indices 1,2; fibre lengths 1,2 | Differentials 1,0 | Retain étale hypothesis and distinction from generalized rank-one statement. |
| 2.10 global comparison | Two distinct refinements α,β | Trace α+β and determinant αβ unchanged under swap | Up eigenvalues α and β differ | Retain refined eigensystem, not merely common Galois pseudotrace. |
| 3.0 preferred Eisenstein | E₂(χ,χ), χ quadratic mod 3, p=5 | Roots −1,−5; cyclotomic-ratio finite extension H¹_f(ℚ,ℚ₅(1))=0 | Claimed one-dimensional extension requires noncyclotomic ratio | Stated exclusion survives; zero extension has same traces but is split. |
| 3.1 critical distinctions | Local algebra model e=1 versus e=2 | Generalized dimensions 1,2; ordinary eigenspace dimension 1 in both | For e=2 its generator t maps to 0 mod t | Retain distinct criticality notions; slope alone does not measure this algebra. |
| 3.2 equivalent criticality | u=t² at 0 | Differential du=2t dt=0; e=2; fibre length 2 | For u=t: differential 1, e=1, length 1 | Retain decent-point hypotheses linking these algebraic indicators to symbols. |
| 3.3 critical slope | Weight-4 E₄ at p=5 | Roots 1,125; valuations 0,3; sum 3=k+1 | Nonunit root has critical slope 3 | Retain distinction from cuspidal purity inputs; this example is Eisenstein. |
| 3.4 decency | Same E₄, roots 1,125 | Discriminant (1−125)²=15376≠0 | Distinct-root condition holds but cuspidality does not | Retain all conditions of each branch of decency, not only distinct roots. |
| 3.4a infinitesimal periods | A=K[ε]/ε², character value 1+ε | Nontrivial infinitesimal value; (1+ε)⁻¹=1−ε | Only closed-point value 1 in either case | Retain Artinian deformation data, not just reduced points. |
| 3.5 smoothness (sample) | Local model K[[t]], weight u=t² | Local ring regular of dimension 1 | Weight differential 0, ramification index 2 | Smooth eigencurve need not be étale over weight; retain distinction. |
| 3.6 θ sequence | k=0, derivative on functions 1,z | θ(1)=0, θ(z)=1 | Constants form kernel; degree-1 term survives | Retain derivative order k+1 and slope shift 1 here. |
| 3.7 rank-one family symbols | M=B=K[[t]], A=K[[u]], u=t³ | Rank_B M=1, rank_A M=3 | Weight fibre dimension 3 | Retain rank-one over eigencurve, not weight algebra. |
| 3.8 generalized eigenspace (sample) | e=1,2 in K[t]/tᵉ | Dimensions 1,2; socle spans 1,t respectively | Socle dimension always 1 | Retain ramification length and generalized/ordinary distinction. |
| 3.9 critical symbol | e=2, socle generated by t | Image of socle in quotient mod t is 0 | e=1 socle generator 1 has image 1 | Retain vanishing exactly in ramified local model under theorem hypotheses. |
| 3.10 Mellin normalization | δ₁ and zero distribution | Mellin(δ₁)(χ)=χ(1)=1 | Mellin(0)(χ)=0 | Zero map excluded; changing period by 2 scales scalar function by 2. |
| 3.11 θ-critical vanishing | (k+1)-st derivative on zʲ | For 0≤j≤k:0 | For j=k+1:(k+1)!≠0 in characteristic 0 | Retain precise critical range and coefficient characteristic. |
| 3.12 infinitely many zeros | Analytic model log(1+T) on open unit disc | At T=ζₚⁿ−1 value 0, for infinitely many n | At T=p, log(1+p)≠0 (odd p) | Infinite zeros compatible with nonzero analytic function on open disc; zero-function case distinguished. |
| 3.13 local two variables | Scalar model L(t,s)=1+t+s | At t=t₀:1+t₀+s | Replacing basis by twice the trivialization gives 2+2t₀+2s | Retain family restriction and period ambiguity. |
| 3.14 secondary functions | L(t)=a₀+a₁t+a₂t² | L⁽ⁱ⁾(0)/i!=aᵢ for i=0,1,2 | Unit change (1+ct)L has first two coefficients a₀,a₁+ca₀ | Retain factorial normalization and invariant flag, not invariant individual coefficients. |
| 4.0.1 zeta classes (sample) | c=5, k=2,r=1, ℓ=3, scalar test Aℓ=2,Bℓ=1 | Divisor orders 24 at 0, −1 at nonzero 5-torsion; good factor 2/3 | Constant unit divisor 0; bad factor 1/3; repeated-p factor 1 | Retain normalized unit and all three norm cases. For c=1 the prescribed unit is 1 and symbol 0. |
| 4.0.2 reciprocity (sample) | Same weight/r and operator scalar model at p=3 | Factors for p dividing M, N only, neither:1,1/3,2/3 | Swapping ordered units negates cup product and period side | Retain both p-powers p⁻¹ and ordered signs. |
| 4.0.3 bounds (sample) | Height-one DVR, z=π³; exceptional local H² length 1 | Length(H¹/Oz)=3; RHS bound 3+1=4 | Omitting local term gives 3; z=0 gives nontorsion quotient | Retain nonzero z and exceptional correction; (p) disappears upon inverting p. |
| 4.1 big representation | Good-prime matrix with trace 2, determinant 3 | det(1−FX)=1−2X+3X² | Inverse matrix gives 1−(2/3)X+(1/3)X² | Retain arithmetic/geometric and dual-twist transport. |
| 4.2 ordinary line (sample) | Rank-two lattice O²; line Oe₁ versus πOe₁ | First quotient O, free rank 1 | Second quotient O⊕O/π, not saturated | Retain saturation and actual unramified subcharacter before twisting, not an untwisted quotient assertion. |
| 4.3 local Selmer condition | Linear model H¹=A², map to quotient H¹=A is π₂ | Kernel=Ae₁, rank 1 | Unrestricted local H¹ has rank 2 | Retain kernel condition and ordinary/Bloch–Kato comparison hypotheses. |
| 4.4 determinant/complex | [O→π³ O] in degrees 1,2 | H¹=0, H²=O/π³, length 3 | Inverse determinant section has divisor 3; π³=0 replacement not generically acyclic | Retain degree and inverse-determinant convention. |
| 4.5 family zeta/Euler action | Group C₂, σ its swap matrix, polynomial 1−aσ+bσ² | Operator=(1+b)I−aσ | At a=1,b=0 it is ((1,−1),(−1,1)), not scalar | Retain field-action Frobenius separately from coefficient action. |
| 4.6 big logarithm | Rank-one coefficient model α=1 versus 2 over ℤ₅ | 1−α=0 versus −1 | Exceptional factor vanishes in first, is a unit in second | Retain actual exceptional factors and chosen ordinary character. |
| 4.7 reciprocity (sample) | Height-one model class π³; j=1 trivial twist, aₚ=2 | Quotient length 3=valuation π³; Euler factor 1−1/2=1/2 | Zero class has infinite-length quotient; aₚ=1 makes factor 0 | Retain torsion/nonzero hypotheses and Euler factors. Arithmetic equality is source-certified, not proved by this model. |
| 4.8 family divisibility | v_P(Pτ)=2, number of generators k=3 | Defect valuation k·v_P(Pτ)=6 | Bound with length n becomes n+6, not n | Retain fixed unipotent factor at every height-one prime. |
| 4.9 Coleman regulator | α=p; α=1; trivial rank-two representation over A | Norm(α)=p⁻¹, norm(α⁻¹)=p; α−1=0 in second case; realization R_A² | Inverse parameter fails norm≤1; α=1 fails regularity | Retain restrictions; import general realization/cohomology comparison (R01). |
| 5.1 weight algebra | G=ℤ₃, H=3ℤ₃ | [G:H]=3; group algebra free over H with basis 1,g,g² | Rank is 3, not 1; torsion-character factors are separate | Retain finite-index and torsion-component bookkeeping. |
| 5.2 quaternionic projector | Constant/norm-factor U₃-eigenvalue 3; ordinary eigenvalue 1 | 3ⁿ!→0; 1ⁿ!=1 | Projector values 0 and 1 | Retain killing nonordinary norm-factor part. |
| 5.3 Hecke algebra (sample) | Direct sum of those two eigenspaces | Ordinary image acts on one dimension; constants killed | On zero ordinary space the image is zero ring | Retain full-to-cuspidal identification; extend source locator (R06). |
| 5.4 level stability | Contracting contribution multiplied by 3ᵃ mod 3ᵐ | For a≥m it is 0 | Unit ordinary eigenline stays rank 1 at every a | Retain ordinary stability, not full-space level stability. |
| 5.5 duality | Discrete ℚ₃/ℤ₃, or ℤ/9 | Pontryagin duals ℤ₃ and ℤ/9 respectively | First is compact infinite, second cardinality 9 | Retain continuous dual and trace/restriction reversal. |
| 5.6 freeness | Regular actions of S₃ and C₃; torsion-character summands | Permutation module O[G] has rank 1 over O[G] in both cases | Ranks over O are 6 and 3 respectively; different character summands can have ranks 0,1 | Retain coefficient algebra and stabilizer assumptions. |
| 5.7 finiteness | Λ=O[[T]], I=(π,T) | Torsion-free generic rank 1; fibre dimension 2 | Free rank-one fibre dimension 1 | Retain finiteness theorem without inferring freeness merely from torsion-freeness. |
| 5.8 control | Sym¹ model, U=diag(1,5) | Ordinary line first coordinate, rank 1; second coordinate 5ⁿ | Mod 5ᵐ second vanishes for n≥m, not identically over O | Retain integral contraction in control. |
| 5.9 dense arithmetic points | Torsion weights ζₚⁿ−1 in a reduced disc; nonreduced thickening ε²=0 | Infinitely many distinct characters; all send ε to 0 | ε≠0 in thickening | Retain reducedness when deducing function equality from points. |
| 5.9a Hilbert expansions | Cusp differential scaled by 2, weight 5; two components | Expansion multiplied by 2⁻⁵=1/32 | Wrong covariant scaling gives 32; form (0,f) is invisible on first component | Retain differential direction and one cusp per component. |
| 5.10 Λ-adic Hilbert forms (sample) | Given p=5, weight-5 Eisenstein example; C=Λ/(T) | Standard constant (1+625)/3=626/3, valuation 0; other cusp (1−1/5)/3=4/15, valuation −1 | Both positive-coefficient ordinary and standard-integral conditions hold, all-cusp integrality fails; C[T]=O≠0 | Retain both lattices and Tor term. ν₁(T)=6⁰−1=0; k−1 shift verified. |
| 5.11 expansion extensionality | Two-component form (0,f), f with a₁=1 | All-component coefficient list includes 1 | First-component list only is 0 | Retain every component/ideal and standard constants; no principal-only test. |
| 5.12 reducedness | Algebra models Λ×Λ and Λ[ε]/ε² | First has nilradical 0 | Second has ε≠0, ε²=0, invisible at every field-valued point | Retain minimal-level/semisimplicity inputs, not density alone. |
| 5.13 total fractions | T=Λ×Λ, Λ domain | Q(T)=Frac(Λ)×Frac(Λ) | (1,0) is a zero divisor and cannot be inverted; (1,1) can | Retain non-zero-divisor localization and components. |
| 5.14 totally real periods | Faithful modules T and T³; noninvertible ideal (π,T) | Generic ranks 1,3,1 respectively; last fibre dimension 2 | Only first is automatically a free rank-one period model | Retain multiplicity/local-freeness/ordinary control inputs, not faithfulness alone. |

There are **130 computed rows covering all 126 numbered targets**, with 0a.0 and 4.0 each expanded into three subtargets. These are falsification tests, not proofs. In particular, a finite free algebra model tests a proposed module-theoretic implication; it does not establish that an arithmetic Hecke algebra has that model. The three headline statements additionally received elaborated-signature and one-tactic checks. All eight layers have Examples and Dependencies endings. Definition targets carry API/check lists; the systematic declaration-name mismatch is R04. The numerical tests above found no additional false identity requiring a P1 finding.

## Not verifiable

The source service was used for fetching; no paywall was bypassed and no source was copied into the repository. Unavailable texts do not suspend this review. The following limitations remain, separately from the six actionable findings:

- **Bellaïche, later 2011 version**, §§3.1.2–3.1.4, Lemmas 3.3 and 3.5, and the subsequent family-symbol corrections: the cited Brandeis URL, its HTTP variant and the alternate Brandeis author host failed certificate/network access. The accessible arXiv v1 is 44 pages, not this 51-page text; a later-version arXiv lookup did not resolve. Consequently the later analytic-radius argument, corrected tensor distribution action and weight-zero negative E₂ exception are not certified against that edition. They were checked algebraically where possible, and against the older text only as indicated in the sample table. The missing-version request is attached to the same work key, bellaïche09.
- **Diamond, The refined conjecture of Serre (1995), Theorems 1.1 and 6.4**, used in §1.8a: title searches through the service did not return a legal text. epw lines 1178–1187 exhibit the cited application and epw lines 2349–2351 fix the bibliography, but do not replace reading Diamond's theorem and proof. In particular the ordered ordinary minimal-conductor strengthening is not independently source-certified here.
- **Pollack, On the p-adic L-function of a modular form at a supersingular prime**, the zero-growth input to §3.12: the cited BU author URL and HTTP variant failed certificate verification; an institutional OpenBU candidate timed out. The local-logarithm test above does not prove the modular L-function growth theorem.
- **Hida's primary control/freeness sources:** the 1986 Inventiones paper (*Galois representations into GL₂(ℤₚ[[X]]) attached to ordinary cusp forms*, Theorem 3.1), the 1988 American Journal paper (*Modules of congruence of Hecke algebras and L-functions associated with cusp forms*, Theorem 1.9), the 1988 Annals paper on totally real Hecke algebras, and the 1989 nearly ordinary paper (Corollary 2.5). The service found no open text for the first, JSTOR landing pages without an authorized open PDF for the next two, and a Project Euclid landing page without a PDF for the last. Hida's accessible 1986 Annales ENS paper, EPW's applications and SW's quoted control theorem were read; they do not certify every primary-source hypothesis and proof of the p=3 extension or totally real period result.
- **Wiles (1995), Theorem 2.1**, used for period freeness: the service title lookup yielded no legal text. EPW's exposition was read, but the primary theorem was not independently certified.
- **Hida (1985), Proposition 6.2, and BGR**: service results were `uncertified` because only paywalled publication references resolved. They are retained as locator-only citations, not fresh missing-text requests. Hida's use of the former at printed p.262 and Buzzard's uses of BGR are visible in the accessible sources.
- **DDP publication pagination**: the accessible author manuscript contains Definition 3.1 and Proposition 3.2 at manuscript pp.30–31 (ddp lines 1204–1251); the README's printed pp.471–472 were not independently opened. Its almost-all-weight definition alone does not prove the stronger all-weight integral F.5 supplier contract.
- **OCR limitations in Kato and SW**: the numerical Euler factors and local correction were checked against readable formulas and the parallel Ochiai statement. Not every small superscript in Kato's long reciprocity proof is reliably legible in the extraction; this report does not certify every intermediate formula there. No apparent OCR spelling or symbol corruption is registered as a source error.

The missing-text file consolidates duplicate attempts under one key per work, omits works subsequently fetched successfully, and retains the unresolved versions. No absent text is being used as evidence that the roadmap's mathematical statement is false. No human waiver was inferred.

## Source issues

- **Misprint** in epw at §2.6, after Definition 2.6.3, manuscript p.19 (epw lines 887–895): the source says the surjection goes from T_Σ to T_Σ′ when Σ⊂Σ′; it should be T_Σ′→T_Σ, agreeing with the preceding paragraph and the stated closed immersion; affects nothing.
- **Misprint** in buzzard at Lemma 4.5 proof, manuscript pp.29–30 (buzzard lines 1020, 1030, 1038): the source says the high-coefficient logarithmic bounds use the radius t itself; it should be log(t), as in the preceding Newton inequalities; affects the proof.
- **Misprint** in buzzard at Lemma 4.5 proof, manuscript p.30 (buzzard lines 1031–1032): the source says X is disjoint from W and X together with V covers B; it should be V∩W=∅ and X∪W=B; affects the proof.
- **Gap** in buzzard at Lemma 4.5 proof, manuscript p.29 (buzzard line 1018): the source says only indices 0<n<d impose the lower-degree Newton bounds on X; it should be 0≤n<d, retaining the constant coefficient's lower bound for the leading coefficient; affects the proof.
- **Gap** in buzzard at Lemma 4.5 proof, manuscript p.30 (buzzard lines 1026–1030): the source says each reversed ratio inequality defines an affinoid subdomain of B; it should be restricted to the Laurent domain where the denominator is bounded away from zero; affects the proof.
- **Gap** in buzzard at §5, manuscript p.34 (buzzard lines 1196–1201): the source says divisibility by Q allows immediate application of Theorem 3.3; it should be supplemented by coprimality of Q and its complement, using that the selected block is open and closed; affects the proof.

The roadmap already supplies the corrected Newton conditions and strict-neighbourhood witness, and retains full coprime spectral blocks. These source issues therefore do not generate additional roadmap findings. No published correction was verified.
