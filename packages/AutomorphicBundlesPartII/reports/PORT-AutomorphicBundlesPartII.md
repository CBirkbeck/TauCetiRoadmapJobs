# PORT-AutomorphicBundlesPartII

Branch `roadmap/automorphic-bundles-part-ii`, created from main `c9a16a0`; head commit `6787f016`
(`AutomorphicBundlesPartII: roadmap (README, Suggested.lean, metadata)`), one commit, touching only
`TauCetiRoadmap/AutomorphicBundlesPartII/{README.md,Suggested.lean,metadata.toml}`.

This is a rerun of the port. The earlier run had committed the same three files (as `0360eb36`,
on the same base) and left its report unsubmitted; the branch was deleted and recreated from the
base, the folder restored from that commit, and every check below was run again against the
current index of open pull requests (454, index of 2026-11-05T10:42:34Z): build, `#check`
signature probe, citation resolver, dependency direction, duplication sweep, push gate.

## Build

    lake build TauCetiRoadmap.AutomorphicBundlesPartII.Suggested
    ⚠ [8988/8988] Built TauCetiRoadmap.AutomorphicBundlesPartII.Suggested (10s)
    warning: TauCetiRoadmap/AutomorphicBundlesPartII/Suggested.lean:73:8: declaration uses `sorry`
    Build completed successfully (8988 jobs).

Warning count: 1 (the `sorry` on `finiteCoefficientSerreDuality`). No other warning or notice; the
file carries the `module` / `public import` / `@[expose] public section` header.

## Gate

    gate AutomorphicBundlesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Run with `--base origin/main` on the committed head.

Dependency direction (`gate --depcheck … --movable --content …`):

    depcheck: 235 roadmaps, 2180 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Every supplier is either on main (AlgebraicVectorBundles,
SchemeAndStackFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves, ReductiveGroups) or earlier
in the merge order (AutomorphicBundlesPartII is line 244 of 378).

Citation resolver (`roadmaps resolve` on the ported README, against main `c9a16a0` and the 454
open heads): no cross-roadmap citation and no Lean name found nowhere. Every cited section label
was additionally checked by hand against the supplier heads dumped with `roadmaps show` (see
"Supplier checks" below).

## Draft pull request body

AutomorphicBundlesPartII extends AutomorphicBundles, whose endpoint is the automorphic coefficient
bundle with its canonical and subcanonical extensions and the degree-zero Hecke operators on its
sections, to the higher coherent cohomology of Siegel and Hilbert–Siegel threefolds. It builds the
integral theory from the ground up: finite-coefficient coherent homology and Serre duality over a
discrete valuation ring quotient, equivariant Čech models and finite perfect group-ring complexes for
finite étale Galois covers with their derived deck descent, cohomological correspondences with
upper-shriek coefficient arrows, their composition, base change and transpose, a solid six-operation
enhancement with completion and compact-support filtrations, and Hecke operators in every degree
with their arithmetic normalization, integral divisibility and geometric generators. On that base it
proves the Lan–Suh small-weight vanishing theorems in their three Siegel ranges and their mod-p
singular-weight consequences, the Ekedahl–Oort Cousin computation that detects the integral
hyperspecial Hecke relations, and non-Eisenstein and congruence localizations of the resulting
perfect complexes. It then compares canonical and interior coherent cohomology with automorphic
forms (Su's canonical-extension comparison and Harris's cusp/interior comparison), restricts the
tempered image to the Siegel chambers, and derives the boundary vanishing theorems (all degrees over
ℚ, degree zero over a totally real field), the multiplicity-counted cuspidal decompositions of
localized degree-zero and degree-one cohomology, and the conditional dimension equality
h¹ = l₀·h⁰. These are the inputs that modularity lifting for non-regular symplectic representations
and higher Hida theory consume. `Suggested.lean` states the finite-coefficient Serre duality
headline against the pinned scheme-module cohomology, exterior power, relative differentials and
internal Hom; the module docstring lists the thirteen other headlines and the carriers each lacks at
the pins.

Suppliers that are still pull requests (cited by name and section, never by number):
AutomorphicBundles, DeformationAndDerivedPatchingAlgebra, ShimuraCompactifications,
ComplexComparisonPartII, SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants,
AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory,
EndoscopicTransferAndUnitaryTraceComparison, ArithmeticGaloisRepresentations,
WeightsInEtaleCohomology, ModularCurvesPartII, HilbertModularVarietiesAndShimuraCurves,
CrystallineCohomology, VStackSheavesAndLisseCategories, AlgebraicModuliForArithmeticGeometry.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test rule: one headline
(`finiteCoefficientSerreDuality`), the two simple definitions it needs (`dvrCoefficientRing`, an
abbreviation of `O ⧸ (ϖ^n)`, and `integerCoherentCohomology`, base-linear scheme-module cohomology
extended by zero to negative degrees), no API lemmas, no examples, no sorry'd data, no
`set_option`, imports `Mathlib` plus four existing `TauCeti.*` modules. The file is unchanged from
the package. The docstring names the thirteen headlines that are not statable and the missing
carrier of each; none of them is statable at the pins (no scheme finite-étale torsor with
descended coefficient, no coherent upper shriek, no solid sheaves on schemes, no Shimura tower, no
toroidal PEL model, no automorphic occurrence space exists in Tau Ceti at the pin).

Signature check: a scratch file with `#check @` for all three declarations was elaborated once
(`lake env lean`, exit 0) on this run and its output is identical to the earlier run's. All binders
of the README statement are present in the elaborated type: `[IsDomain O]
[IsDiscreteValuationRing O]`, `Irreducible ϖ`, `X.Over (Spec (O/ϖ^n))`, `SmoothOfRelativeDimension
d`, `IsProper`, `IsLocallyFree F`, `IsFinitePresentation F`, `i : ℤ`. Nothing changed.

## README edits

- **Source line locators.** 96 tokens of the form `CG20 line 955`, `P20 lines 829–842`,
  `BCGP21 line 1831, parity hypothesis at line 1833`, `(LanSuh line 1803)`, `(CG20 line 2176 and
  CG20 line 2184)` were removed; the theorem/page locators next to them are kept, and the four
  bare line-only citations were replaced by the theorem and page they point to (CG20 proof of
  Theorem 5.1, pp. 22–24; CG20 proof of Theorem 7.11, pp. 54–55; BCGP21 Lemma 2.9.1 "with its
  parity hypothesis"; Sch15 Corollary V.1.7, manuscript p. 83). No README on main carries
  extraction line locators. Line numbers of Tau Ceti source files (`Base.lean` lines 45, 57, 110,
  127 and the like) are library locators and are kept, as on main.
- **Gap tags.** The ten `(gap:slug)` tags were rendered as named contracts, as at the
  SheafConvolutionOnAbelianVarieties head. Slug → contract name:
  `boundary-spin-satake` → the boundary spin Satake contract (SmoothRepresentationsOfLocalGroups
  SR.4.5); `classical-weight-one-realization` → the classical weight-one realization contract
  (WeightsInEtaleCohomology R34.6); `coefficient-linear-coherent-comparison` → the
  coefficient-linear coherent comparison contract (SchemeAndStackFoundations §2.18);
  `coefficient-logarithmic-splitting` → the coefficient logarithmic splitting contract
  (CrystallineCohomology CR.5.4); `gaga-duality-trace` → the GAGA duality trace contract
  (ComplexComparisonPartII C1.9, C3.3); `integral-dual-weyl-lattices` → the integral dual-Weyl
  lattice contract (ReductiveGroups §10B); `integral-small-weight-dual-bgg` → the integral
  small-weight dual BGG contract (AutomorphicBundles 9.2–9.3); `nonparallel-hilbert-realization`
  → the non-parallel Hilbert realization contract (HilbertModularVarietiesAndShimuraCurves
  R18.3.29); `su-parabolic-regularization` → the Su parabolic regularization contract
  (AutomorphicSpectralTheory §5.2); `uniform-global-gsp4-separation` → the uniform global GSp₄
  separation contract (AutomorphicFormsOnReductiveGroups §6.6). The review's `conditional_gaps`
  lists nine slugs; the tenth, `uniform-global-gsp4-separation`, is in the package README but not
  in that list.
- **AutomorphicBundles labels.** The letter labels B0–B5 and B3.BGG were replaced by that
  roadmap's layer numbers using the dictionary it prints before its supplier contracts (B0 =
  Layer 0, B1 = Layer 1, B2 = Layer 3, B3 = Layer 5, B3.BGG = Layer 9, B4 = Layer 11, B5 =
  Layer 12; B0–B5 = Layers 0–12, B0–B4 = Layers 0–11, B1–B3 = Layers 1–5). The supplier
  contract now lists the consumed layers by title.
- **Scope and ownership.** Added that SchemeAndStackFoundations §2.20's `cm_serre_duality` is
  Serre duality over a field (so §1.6 over O/ϖⁿ is not a restatement and specializes to it), and
  that IgusaVarietiesAndTorsionConcentration §§2.12–2.13 owns the G-zip Ekedahl–Oort
  stratification, Hasse sections and partial-minimal affineness for its unitary PEL datum, while
  §5.0 here is the type-C Hilbert–Siegel case (see the duplication sweep).
- **Downstream consumers.** The package named OverconvergentAutomorphicForms as a downstream
  consumer; that roadmap is earlier in the merge order (line 241) and does not cite this one, so
  the claim is replaced by the actual consumer GSp4NonregularModularityLifting (which consumes
  Layers 1–8) and the generic "higher Hida theory and p-adic families" phrase; "the downstream
  OverconvergentAutomorphicForms roadmap" in Scope became "OverconvergentAutomorphicForms".
- Minor: "The simple acceptance-file abbreviation" → "The abbreviation `dvrCoefficientRing` of
  `Suggested.lean`"; "(uncertified)" dropped from the GK19 reference (process vocabulary); a
  double blank line before the §5.3 *Needs* line removed.

`metadata.toml` is the package's `topic = "math.NT"`, the same form as the folders on main
(compared with `TauCetiRoadmap/EtaleMassFormula/metadata.toml`).

## Supplier checks

Every pinned declaration named in the README exists at this worktree's pins (re-grepped on this
run): Tau Ceti `Scheme.Modules.Cohomology` (`Cohomology/Basic.lean` 61), `cohomologyFunctor` (66),
`cohomologyZeroEquiv` (80), `cohomologyZeroEquiv_naturality` (86), `cohomologyBaseModule`
(`Module/Base.lean` 45), `cohomologyMapBaseLinear` (57), `cohomologyZeroBaseLinearEquiv` (110),
its `_naturality` (127), `cohomologyδBaseLinear` (`LongExactSequence.lean` 242),
`SheafOfModules.exteriorPower` (`ExteriorPower/Basic.lean` 60), `Scheme.relativeDifferentials`
(`Differentials/Basic.lean` 85), `Scheme.Modules.instMonoidalClosed` (`TensorProduct.lean` 66),
`SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero` (`WeilDivisor/Scheme/SerreDuality.lean`
113); Mathlib `CochainComplex.isKProjective_of_projective`
(`HomotopyCategory/KProjective.lean` 113) and `CochainComplex.IsKProjective.Qh_map_bijective`
(`DerivedCategory/KProjective.lean` 43). The four `TauCeti.*` modules imported by `Suggested.lean`
exist at the pin.

Section labels checked against supplier heads: SchemeAndStackFoundations §§0.18, 1.1, 2.6–2.8,
2.18–2.21, 2.23, 4.8–4.10 and `upperShriek_lci` (§2.19); DerivedModuleAlgebra §§0.2–0.3, 1.1.1,
1.3–1.5, 1.E.0–1.E.1, 1.M.1–1.M.2, S.1; EnhancedDerivedSheaves §§0.1–0.3, E1.3, E1.9
(`perfect_proper_pushforward`), E2:towers, E3.2–E3.3, E5:abstract; AlgebraicVectorBundles
L0A–L0C; ReductiveGroups 9A and 10B (fourth-level headings inside Layers 9 and 10);
AutomorphicBundles 5.10 (`integralLeviCoefficient`), 9.2–9.3 (`siegelDualBGGComplex`,
`siegelBGGGradedComparison`), 12.11 (`ClassicalHecke.operator`); DeformationAndDerivedPatchingAlgebra
§§7.1–7.10; ShimuraCompactifications 4.3–4.10, 6.1–6.11, 6.16–6.17, 7.3–7.17, 7.19–7.31, 7.21,
7.29; ComplexComparisonPartII C1.9, C2.1–C2.2, C3.3; SmoothRepresentationsOfLocalGroups SR.0–SR.4,
SR.4.1, SR.4.5; IntegralHeckeAndGaloisDeterminants §§2.2–2.3, 3a.1–3a.2, 3b.1–3b.2;
AutomorphicFormsOnReductiveGroups §§1.1–1.3, 4.1–4.2, 5.5 (`clozelPurity`), 6.1–6.7;
AutomorphicSpectralTheory §§4.1–4.5, 4.10, 5.1–5.8, 5.7a; EndoscopicTransferAndUnitaryTraceComparison
§11.1 (`GSp4ClassificationInputs`); ArithmeticGaloisRepresentations §§1.1–1.12, 2.2, Layer 5
(5.1–5.3); WeightsInEtaleCohomology R34.5–R34.6 (its Layers 5–6); ModularCurvesPartII
§§14.1–14.4a; HilbertModularVarietiesAndShimuraCurves R18.3.29 with its Normalization paragraph;
CrystallineCohomology CR.5.1–CR.5.4, CR.DDR.6.11–6.14; VStackSheavesAndLisseCategories VS2.1–VS2.2;
AlgebraicModuliForArithmeticGeometry §7.5 (`fundamental_class_boundary` sits inside §7.5, whose
heading is "Valuations, boundary duality and K/O"; the README's description of that section as the
fundamental-class contract is correct).

No supplier declaration is restated in the Lean file, and no README target restates a supplier
target, so no replacement deletion was needed.

## Duplication sweep

By object, with `roadmaps grep` over main and the 454 open pull requests (index of
2026-11-05T10:42:34Z) for: Lan–Suh, BCGP21 Theorem 3.10.1, Harris–Zucker, formally
(sub)canonical, Ekedahl–Oort / EO strata, cohomological correspondence, Matlis, Artinian
Gorenstein, Su's comparison, non-Eisenstein boundary vanishing, higher Hida, K-projective,
finite-coefficient duality, Calegari–Geraghty, singular weight, Siegel threefold, solid six
operations. No pull request numbered above 1822 appears in any result, so no roadmap new since
the earlier run touches these objects.

- Finite-coefficient Serre duality over O/ϖⁿ: no owner. SchemeAndStackFoundations §2.20
  (`cm_serre_duality`) is over a field; PotentialAutomorphyInfrastructure's
  `degree_reflection_duality` and EtaleDualityAndPerverseSheavesPartII §§0.1–0.2 are Betti/étale
  dualities. Kept, with the Scope sentence above.
- Ekedahl–Oort strata and affineness of partial minimal strata: IgusaVarietiesAndTorsionConcentration
  §§2.12–2.13 (earlier in the order, line 174) for its unitary datum, assuming type (A) or (C) at
  p unramified "here the quasi-split unitary datum". §5.0 is the Res_(F/ℚ)GSp₄ case with the
  codimension filtration, Cohen–Macaulay thickenings and boundary regularity BCGP21 needs; kept as
  a variant and recorded in Scope. It is not cited as a supplier because its Layer 0 datum is
  unitary.
- Formally canonical coefficients: ShimuraCompactifications 7.21 and AutomorphicBundles own the
  definition; §5.1 here only verifies it on further models (already so in the package).
- Solid six operations on schemes: VStackSheavesAndLisseCategories VS2.1–VS2.2 owns the
  analytic-ring interface and is cited; AnalyticStacks §3.4 states the solid six-functor formalism
  on schemes and §6.6 solid Serre duality, and its consumer list says "AutomorphicBundlesPartII …
  consumes 3.4 … and 6.6". AnalyticStacks is at merge-order line 313, after this roadmap (244), so
  it cannot be cited; §3.0a stays owned here. Flag for the maintainer: AnalyticStacks lists an
  earlier roadmap as its consumer.
- Lan–Suh vanishing, CG20 Theorem 5.1, BCGP21 Theorem 3.10.1, Harris–Zucker nerve, Su's
  comparison: no other roadmap states them. GSp4NonregularModularityLifting (later, line 267)
  cites this roadmap's Layers 1–8 for them rather than restating.
- Non-Eisenstein boundary vanishing: the other hits (ModularSymbolsPadicLFunctions §-level
  boundary-symbol remarks, CompletedCohomologyAndLocalGlobalCompatibility §1.4, and the Betti
  localisations in the modularity roadmaps) concern modular symbols or Betti cohomology of
  GL₂-type, not the coherent Siegel boundary of Layer 8.
- Cohomological correspondences: EtaleDualityAndPerverseSheaves, GlobalShtukasAndFunctionFieldLanglands
  and AlgebraicModularFormsAndSerreWeightsPartII use the étale or Betti notion; the coherent
  upper-shriek correspondence of §3.1 has no other owner.

Nothing was removed. Ownership against open pull requests was checked through the `roadmaps grep`
index and the sibling checkouts named in the brief; pull requests not in that index were not
checked.

## Adversarial mathematics pass

The pass was computed on the ported text; the README's mathematics is unchanged from the package,
so the witnesses below are those of the text as committed.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `finiteCoefficientSerreDuality`, duality direction | A=O/ϖⁿ self-injective; G = Hom(F,ω) | RHom_A(RΓ(X,G),A) ≃ RΓ(X,G^∨⊗ω)[d] with G^∨⊗ω = F; Hom_A(H^i(G),A) ≃ H^{d−i}(F) | correct direction and shift | none |
| same, degrees outside [0,d] | i = −1, i = d+1 | LHS Dual(0)=0, RHS H^{d+1}=0 (dim X = d over Artinian base); i=d+1: Dual(H^{d+1})=0, RHS H^{−1}=0 | both sides 0 | none |
| same, n = 0 | O=ℤ₃, n=0 | A = ℤ₃/(1) = 0, Spec A = ∅, X = ∅, both modules trivial | vacuous, true | none (README says so) |
| same, O=ℤ₃, ϖ=3, n=2, X=Spec A, d=0, F=O, i=0 | — | Hom(ℤ/9,ℤ/9)=ℤ/9 ≃ H⁰ = ℤ/9 | true | none |
| same, non-locally-free F | B=k[ε,δ]/(ε,δ)², F=k | Hom_B(k,B)=socle, dim 2; its B-dual dim 4; dim F = 1 | hypothesis needed | none (already a Check) |
| `integerCoherentCohomology` at negative degree | Spec Aₙ, F=O, i=−1,0,1 | 0, Aₙ, 0; `Int.toNat` alone would give Aₙ at −1 | definition correct | none |
| §1.1 dual frame | g=1, ψ₁=4, c=3; ψ₁=2 | ψ₂=3/4; 3/2; wrong model c·u: 9/4, ψ₁ψ₂=9≠3 | law pins the inverse | none |
| §1.2 left translation | m = permutation (123) ∈ GL₃, f = m₂₁, m′ = 1 | correct law f(m)=1; wrong law f(m⁻¹)=(132)₂₁=0 | identity law fails for wrong model | none |
| §1.3 weights and scalars | (1,0),(0,0),(1,1),(2,2); (5,2), x=2 | ranks 2,1,1,1; 2⁷=128, ν(2I₄)=4, 4⁻³·128=2; ν³: 8192 | consistent with §4.1 and §6.7 | none |
| §1.4 derived reduction | O→O, differential ϖ; ℙ¹_O, O(−2); k[ε] | H⁰=0,H¹=k; after ⊗^L k: k,k; RΓ=O[−1]; Tor_j^{k[ε]}(k,k)=k ∀j | flatness needed | none |
| §1.5 Matlis / different | O=ℤ_p[ϖ], ϖ²=p, p odd; 𝔽₅, δ=2, λ(1)=1 | different (2ϖ); (δλ)(1)=λ(3)=3, (δλ)(2)=6≡1; wrong: λ(4)=4 | inverse action pinned | none |
| §2.2 free over 𝔽₂[C₂] | 𝔽₂×𝔽₂ | basis (1,0); trace (1,0)↦(1,1)=1 though |C₂|=0 | no averaging | none |
| §2.5 edge sequence | R=𝔽₂[t]/(t²), C=[R→R] with t | H₁=H₀=k; C⊗k zero differential; Tor₂(k,k)=k→H₁⊗k=k iso; H₁⊗k→H₁(C⊗k) is 0 (t↦0) | Tor₂ term needed | none |
| §3.3 composition order | ℚ[x], x↦x+1 then x↦2x | 2x+1 vs 2x+2 | order detected | none |
| §3.6 Tor-independence | O=ℤ₃, k=𝔽₃ | k⊗^L_O k has k in degrees −1,0 | finiteness insufficient | none |
| §3.9 transpose | σ 3-cycle, sum pairing; blow-up of ℙ²; i:pt→𝔸¹; split double cover | σᵗe₁=e₃; b!O=O(E), coker O_E(−1) acyclic, trace=id, 1=1; i!O=k[−1], D_XF=O[1], both arrows id; scalar 2=2, averaged trace 1 fails | conventions pinned | none |
| §3.10 contraction | k[t], p₂:t↦t², Z=V(t) | supports {0}={0}; ideals (t)⊄(t²) | set-theoretic definition needed | none |
| §3.11/3.12 completion vs local cohomology | k[x], I=(x),(0),(1) | k[[x]] in degree 0 vs H¹=k[x,x⁻¹]/k[x]∋x⁻¹; identity, 0 | filtrations distinct | none |
| §4.1 normalization | (4,2); (5,2), x=2; ℓ=2 | a+b−6=0; 128/64=2; factors 1/8, 1/64 | consistent with §1.3 | none |
| §4.2 division | O/ϖ, k>0; Ext¹_O(O/ϖ,O)=O/ϖ | 3^kU=0 for U=0,id; ϖ acts by 0 on Ext¹ | sheaf-level only | none |
| §4.3 spin polynomial | similitudes of β; q=2,(1,3,2); q=1,(1,4,4) | x²,x,x²; X⁴−3X³+14X²−24X+64; (X−1)⁴ | formula verified | none |
| §4.4 invariants | k=𝔽₂, C₂ | H¹(C₂,𝔽₂)=𝔽₂; invariants ⟨1+σ⟩, augmentation 2=0 | no integral exactness | none |
| §5.3 Lan–Suh weights | p=7, μ=0, t=2 and t=1; substitution formulas at (4,2),(3,1),(6,1),(7,1),(4,4),(8,4) | (4,2),(5,3),(5,5); (3,1),(4,2),(4,4); α+β = a−b−2 (lengths 1,2) and a−b (length 3); 3<4 at (6,1), 4 fails at (7,1) | ranges match §§5.4–5.6 | none |
| §5.8 singular range | p=5 | 4≤a≤5; 3≤a≤3, ω(3,0) | tags distinct | none |
| §5.16 congruence localization | T=O[t]/(t(t−ϖ)); T=O×O | both characters reduce to (ϖ,t): ℂ²; (ϖ)×O selects ℂ×0 | definition pinned | none |
| §6.2/6.3 relative pairs | sl₂, trivial coefficient; central factor 2 | H²(sl₂,so₂)=ℂ vs parabolic degree-2 = 0; V_o correction 1/2, product 1 | not interchangeable | none |
| §7.0 spin orbit | (4,2); (5,2); (3,2;0) | {3/2,3/2,−3/2,−3/2} sum 0; {3/2,3/2,−5/2,−5/2} sum −2; (−2,−3;5), balanced (2,0;−5), dual (0,−2;5), orbit sum 10 | formula and signs agree | none |
| §7.0 rational case analysis | a=2,3,4 | entries 3/2 and 5/2−a differ by 1,2,3 | cases (c),(d) only at a=2 | none |
| §8.4 Satake factorization | q=2, α=1, β=2, u=4, D=2, T₀=1 | (X²−3X+2)(X²−12X+32)=X⁴−15X³+70X²−120X+64; T₁=15, T₂=30, uD=8=q³T₀ | agrees with §4.3 polynomial | none |
| §8.7 algebraicity | (a,2) | orbit −3/2 = (0,0,1−a,1−a) integral | Clozel convention satisfied | none |
| §8.8 gaps | R_sep=3, R_gap=5: (8,4),(12,6),(8,2),(10,6); z=2 | pairings 5,7,9,2 / 7,11,15,4 / 7,7,7,0 / k−l=4≤5; |2|²=4, |ν|⁻¹=1/4 | thresholds consistent | none |
| §8.9 and worked example | two real places, l_v=2 both / one | h¹=2h⁰ / h¹=h⁰; l₀=0 ⇒ h¹=0 | consistent | none |
| Scope: OverconvergentAutomorphicForms "downstream" | merge order | OAF at line 241 < 244, no citation of this roadmap | claim false | reworded; real consumer named |

No statement was found false; the computed witnesses agree with the package's Checks and with each
other across §§1.3, 4.1, 6.7 and 7.0 (the same (5,2), x=2 scalar 2 and the same (4,2) orbit).

## Unresolved

- GSp4NonregularModularityLifting (later in the order, line 267) carries two "What
  AutomorphicBundlesPartII must provide" contracts (a normalized integral p-action contract and a
  selected rank-inequality contract). They ask for targets beyond the accepted package and were not
  added; they are that roadmap's requests for the maintainer to weigh.
- AnalyticStacks (later in the order, line 313) lists this roadmap as a consumer of its §3.4 and
  §6.6; the direction is impossible in the merge order, and §3.0a remains this roadmap's own.
- The ten supplier contracts ("What X must provide") remain conditional inputs owned by the named
  suppliers, as the review accepted them.


Pull request: #1823 (roadmap/automorphic-bundles-part-ii at 6787f01)
