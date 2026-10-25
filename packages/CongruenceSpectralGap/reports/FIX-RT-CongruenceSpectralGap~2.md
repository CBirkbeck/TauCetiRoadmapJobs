# CongruenceSpectralGap repair report

The two reviews have seven finding identifiers. The shared min–max defect is repaired once and accounted for under both identifiers; the conductor findings share one revision of §4.2b. Review text was treated as claims to verify. No suspicious instructions were found.

## F01 (P3) — applied

Review r2a: Teschl §4.4 → §4.3 in Conventions, §§0.3, 0.4, 0.7, 5.4, 5.5, References and the existing manifest entry. Theorem 4.10 and printed p.119 remain. Evidence: teschl line 4991 begins §4.3; line 5044 states the theorem; line 5053 gives the form-domain observation; line 5060 begins §4.4. Line 5043 is a running header.

## F02 (P1) — applied

Review r2a: Rank/lissity-only route → the finite-coefficient Kummer descent and inertia-equivariant specialization argument. Added LefschetzPencilsAndVanishingCycles §§0.5–0.8 to ownership, supplier contracts, §4.2b Needs and Layer 4 dependencies. The Swan criterion now concludes universal local acyclicity for separated smooth families, with properness for direct-image lissity. Added the wild rank-two negative control. Evidence: katz-gkm line 2516 through line 2665; laumon-swan line 396 through line 425.

## F01 (P3) — applied

Review r2b: Same locator defect and single repair as r2a F01; every occurrence, including the manifest, is covered there. Reading from teschl line 4991 reaches the theorem and form-domain statement at line 5044 and line 5053 before the next section at line 5060. No mathematical target or Lean signature changed.

## F02 (P3) — applied differently

Review r2b: Restricted curves/families → perfect-field curves with residue-degree weights and excellent-base separated smooth families, retaining properness for direct images. “Connected” in the suggested repair needs “geometrically connected”: P¹ over 𝔽_q² viewed over 𝔽_q has geometric Euler characteristic 4. Added degree-two, characteristic-zero, mixed-characteristic and nonproper Checks. Evidence: katz-gkm line 1117 and line 1352; laumon-swan line 391 through line 437.

## F03 (P3) — applied

Review r2b: Unnamed rigid consumer → PadicDifferentialEquationsAndRigidCohomology RD.6.95–RD.6.97, with the exact eliminated-variable equality and bound conversion in Downstream consumers. At n=1 over 𝔽₃, z=1, both sums are −1 and both bounds are 2√3. Its scalar declarations overlap this earlier owner; modifying that consumer is outside the permitted files, as recorded below.

## F04 (P3) — applied differently

Review r2b: Generic Part-II-leading title → congruence-gap-leading title retaining the required Part II designation. Scope and Downstream consumers distinguish the Schwartz multiplier roadmap AutomorphicSpectralTheoryPartII. Its design introduction and ownership table confirm the separate direction and consumption of this gap. The suggested removal of “Part II” conflicts with the brief’s binding extension convention; no scope or merge-order change was made.

## F05 (P3) — applied

Review r2b: §0.4’s assertion of the final gap → a computation in its existing model diag(0,21/100,1/4). The unrestricted Rayleigh infimum is 0 on the constant line; restriction to the last two coordinates gives 21/100. The definition still has three discriminating Checks, without a forward use of Layer 5. Nothing was added to Suggested.lean.

## Validation outcomes

- Required elaboration of `packages/CongruenceSpectralGap/Suggested.lean`, from the pinned content checkout: **exit 0**. Its complete diagnostics were the expected `declaration uses sorry` warnings at 46:8, 57:8 and 73:8. There are no TauCeti imports in the file, so no object-file build was needed.
- A single scratch file containing the unchanged acceptance module followed by `#check @name` for all four declarations elaborated: **exit 0**, with the same three warnings. Every elaborated binder was compared with the README. No binders were lost, and no Lean changes were needed. In particular the field/Fintype instances, positive rank, nontrivial character, odd prime and unit argument, and all congruence/regularity/invariance/boundedness/nonconstancy/eigenvalue hypotheses remain present.
- Required dependency check, with `--movable`: **exit 0**, output:

```text
depcheck: 48 roadmaps, 548 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. LefschetzPencilsAndVanishingCycles is earlier than CongruenceSpectralGap (positions 65 and 107).

- Citation resolution against main `7bd35ba` and the indexed open heads: **exit 0**, no unresolved cross-roadmap citations and no unresolved roadmap Lean names. The resolver explicitly did not inspect pinned library names; these were checked directly in the pinned sources below.
- `git diff --check`: **exit 0**, no output. Both TOML files parsed; all six source keys are unique; all seven supplier-gap slugs match; acceptance names and import policy agree; no machine paths occur in the deliverables.
- Report-heading gate failure: moved review labels from heading prefixes into the explanations. The worker’s parser recognizes all seven finding sections, and its review-coverage check reports no problems. No new source was required: all five readable manifest works were available, and `lrs95` remains settled uncertified, cited by locator alone. No missing-reference request was added.

## Acceptance signatures and headline inventory

| Declaration or headline | Native carrier and complete context | Outcome |
|---|---|---|
| `hyperKloosterman` | Arbitrary universe, field F, Fintype F, natural rank k, AddChar F ℂ, unit r; real finite-sum body | Unchanged; every binder retained |
| `hyperKloosterman_bound` | Same carriers; 1≤k and ψ≠1; real exponent ((k:ℝ)−1)/2 | Unchanged; a deep numerical headline |
| `gauss_power_even_average_bound` | Prime q, explicit NeZero q, q>2, k≥1, unit r; actual even nonprincipal Dirichlet characters and native Gauss sums | Unchanged; a deep finite-character headline |
| `congruence_eigenvalue_bound` | Actual congruence subgroup, C² function on Im>0, Γ-invariance, boundedness, nonconstancy, real eigenvalue and positive hyperbolic equation | Unchanged; the quotient eigenfunction headline |
| §§0.6–0.7 and 5.3–5.5, operator/form statements | Missing canonical quotient closed energy domain and Friedrichs operator | Correctly named as not statable in the module docstring |
| §§1.1–1.3 and 5.1, automorphic dictionary, adjoint and parameter bound | Missing native automorphic representation, occurrence and archimedean-parameter/lift carriers | Correctly named as not statable |
| §§2.1–2.2, 3.3–3.4 and 4.4–4.5, twisted analytic headlines | Missing canonical automorphic Rankin–Selberg functions and gamma families | Correctly named as not statable |
| §4.2b, curve formula, Swan criterion and sheaf realization | Missing native rational-adic sheaf, direct-image and local-conductor carriers | Correctly named as not statable; broadening the README does not make these carriers available |

None of the three kept theorem declarations is a one-tactic pinned-library consequence. There is no added API declaration, boundary theorem, stand-in predicate, sorry’d data or computational example. All four own Lean names still appear in the README; no own name was added, renamed or deleted.

## Source and supplier verification

The changed source claims were read directly: teschl line 4991 through line 5060; laumon-swan line 391 through line 437; katz-gkm line 1117 through line 1155, line 1352 through line 1359, and line 2392 through line 2665. The Kummer comparison is a descent spectral sequence (katz-gkm line 2528), so its degree is not silently assumed invertible in the coefficient ring. The specialization arrows run from special to generic cohomology (katz-gkm line 2619), with F₀ as a tensor factor at the remaining vanishing-cycle stalk (katz-gkm line 2626). The general convolution theorem supplies the rank and Swan formulas separately (katz-gkm line 2412 and line 2416).

The unchanged certified source locators were also compared with their text: gj78 line 528, line 538, line 721, line 2151 and line 2384; teschl line 2914 and line 2960; bms02 line 151, line 196 and line 245; katz-gkm line 1845, line 1871, line 1892, line 1902, line 2266 and line 2812. No assertion about the unread content of `lrs95` was inferred from its locators.

Cross-roadmap contracts were checked against main where present and through `roadmaps show` at the indexed head otherwise. FuchsianOrbifolds, EtaleCohomologyFoundations and DifferentialGeometry supplied the main-branch shape and relevant geometry examples.

| Supplier | Verified section or target and consumption |
|---|---|
| FuchsianOrbifolds | Layers 0–3; Layer 6 item 1, effective action, quotient charts, Gauss–Bonnet and modular signature |
| DifferentialGeometry; PDE | Layer 12; Lane A item 1 and Lane E item 20, metric/volume/Green and local weak regularity |
| OperatorTheory/SelfAdjointSpectralTheory | SA-C domain/adjoint interfaces and SA-E01–SA-E13 spectral measures, reductions and form bounds, in its nested main-branch folder |
| UnboundedOperators | UO-A01–UO-A03 and UO-D06; the additional Rayleigh-core contract remains an explicit gap |
| AutomorphicSpectralTheory | §§0.6–0.7, 1.16–1.16a, 4.3–4.4, 4.6, 4.8, 4.14a and 7.1a; Γ₀(N) domain comparison and operator-independent decomposition are distinguished |
| AutomorphicFormsOnReductiveGroups | §§2.5–2.7, 3.1, 3.4–3.5 and 4.5; `classicalEquiv`, `MaassCuspForm` and `maassClassicalEquiv`; principal-level extension remains a gap |
| ArithmeticLocallySymmetricSpaces | ALS.F.6(iii) bounded/rapidly decreasing cusp forms and (iv) discrete cuspidal occurrences |
| GlobalNumberFields | Layers 6, 9–10; unique `HeckeCharacter.shift`, `unitaryPart` and infinity types |
| GL2AutomorphicRepresentationsAndTransfer | R17.4.13 and its stated prerequisites, local adjoint compatibility and self-twist branch |
| AutomorphicLFunctionsAndLocalFactors | AL.1 canonical archimedean factors; AL.3 Whittaker factorization, local products, local/global functional equations, pole criterion, boundary nonvanishing, `LDatum`, `IsNicePinned`, `rsDatum` |
| LFunctions | Layer 0; record and all four predicates. The five initial resolver leads are planned declarations here, not pinned-library claims; `Suggested.lean` declares them at lines 77, 122, 128, 134 and 140 |
| ZerosOfLFunctions | Layer 1 items 2–5 and Layer 3 items 1–3; the finite function’s polynomial strip bound is distinct from a completed-function bound |
| DeligneWeightsAndPurity | §7.12 and DWP.10 weight/trace inputs; Artin–Schreier sheaf construction remains an explicit gap |
| EtaleCohomologyFoundations | F.0–F.6 and F.10.1–F.10.2b, finite/adic cohomology, base change, duality, realization and traces; its Scope explicitly assigns nearby cycles elsewhere |
| ArithmeticGaloisRepresentations | §§3.1 and 3.7, perfect-residue-field breaks, Swan additivity/coefficient change and Artin–Schreier break calculations |
| InverseGaloisAndArithmeticFundamentalGroups | “Euler characteristic of ℓ-torsion local systems on affine curves”, the finite-coefficient input; its narrower hypotheses are not mistaken for the entire generalized target |
| LefschetzPencilsAndVanishingCycles | §§0.5–0.8, specialization triangle/sequence, inertia equivariance, coefficient change and rational realization; no supplier gap is necessary |
| ArithmeticDirichletSeries; AnalyticNumberTheoryPartI | Layer 6 Abel summation; §3.26 uniform divisor subpower bound |

The seven existing gap slugs and needs agree between README and `design/plan.json`. No gap or other part of the plan was changed. The broadened curve and Swan targets remain this package’s existing targets; the new nearby-cycle input imports its existing owner rather than reconstructing it.

Pinned Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` agree with the content manifest. The following file-relative line locators were inspected, including their hypotheses:

| Pinned file | Declarations and lines |
|---|---|
| `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | `IsCongruenceSubgroup` 163, `IsCongruenceSubgroup.finiteIndex` 181; a nonzero level is required |
| `Mathlib/Algebra/Group/Action/End.lean`; `Mathlib/GroupTheory/GroupAction/Defs.lean` | `MulAction.toPermHom` 184; orbit relation and its quotient notation |
| `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean` | `UpperHalfPlane.volume_def` 44 |
| `Mathlib/MeasureTheory/Group/FundamentalDomain.lean` | `IsFundamentalDomain.quotientMeasure_eq` 630; actual domains, countability, measurable action and invariant measure |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`; `Mathlib/LinearAlgebra/LinearPMap.lean` | `Lp` 89, `LinearPMap` 41; neither constructs the quotient measure or self-adjoint operator |
| `Mathlib/Analysis/MellinTransform.lean`; `Mathlib/Analysis/MellinInversion.lean` | `mellin` 90, `mellinInv` 95, `mellin_comp_inv` 153; `mellinInv_mellin_eq` 92 with positivity, convergence, vertical integrability and continuity |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean`; `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean` | gamma-zero/residue declarations 75,104; nonvanishing 426 and entire reciprocal 521 |
| `Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean`; `Mathlib/NumberTheory/GaussSum.lean` | `sum_characters_eq` 68, `gaussSum` 72; orthogonality’s nonzero modulus, domain and roots-of-unity hypotheses were read |
| `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean` | `stdAddChar` 83 and its positive-exponential/primitive declarations |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean`; `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` | native real second-derivative trace and `UpperHalfPlane.SLAction` 282 |
| `TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean` | `UpperHalfPlane.riemannianVolume_eq_volume` 181 |
| `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean` | `IsSelfAdjoint.isFormalAdjoint` 76, `IsFormalAdjoint.im_inner_self_apply` 82; completeness remains explicit |
| `TauCeti/Analysis/PDE/EnergyForm/Sobolev.lean` | `energyFormH1` 372, `energyFormH1L0` 600; real local energies, not quotient operators |
| `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean` | `wienerIkehara` 301; full nonnegative coefficients and pole-subtracted boundary continuity |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean` | `primeCount_univ_isEquivalent_div_log` 46, with a number field |

Searches by object in both pinned trees found no native Kloosterman sum/sheaf, Maass/automorphic occurrence carrier, Swan conductor or quotient Friedrichs realization that duplicates a kept acceptance declaration. A Poincaré/Friedrichs inequality is not a Friedrichs operator construction.

## Adversarial mathematics pass

Each row tests the named statement or identity, including the revised text. Values below are calculations, not proofs of the deep headlines. Operator models test definitions and normalizations; they do not assert existence of an equality eigenfunction on a congruence quotient. Write A=diag(0,21/100,1/4), e₀ for its constant line and V>0 for quotient area.

| Statement | Instances tried | Computed values on each side | Result | Change |
|---|---|---|---|---|
| Congruence/effective-action convention | Γ(1), Γ(2), Γ(3) | Effective indices 1,6,12; areas π/3,2π,4π; central kernels 2,2,1 | Consistent | None |
| Nonzero level convention | N=0,1,2 | Γ(0)={I}, not a nonzero-level witness; Γ(1)=SL₂(ℤ); Γ(2) has effective index 6 | Excludes infinite-area identity subgroup | None |
| Laplacian sign | 1, y², yˢ | 0, −2y², s(1−s)yˢ; s=1/2+it gives 1/4+t² | Consistent | None |
| Complex energy convention | e₁, ie₁, 2ie₁ | q=21/100,21/100,21/25; squared norms 1,1,4 | Consistent | None |
| Complex mean convention | 1,i,b−V⁻¹∫b | Means V,iV,0 | Both constant directions excluded | None |
| Parameter sign/symmetry | r=1/5 | GL₂ ±1/5; adjoint 2/5,0,−2/5; λ=21/100; adjoint β₀=4/5 | Consistent | None |
| Epsilon normalization | f=4,d=4,q>2 | Numerator norm 2q²; denominator (4q⁴)^(1/2)=2q²; ratio 1 | Unit normalization correct | None |
| Fourier convention | q=3 | ψ(1)=−1/2+i√3/2; 1+ψ(1)+ψ(2)=0; τ(1)=−1 | Positive sign fixed | None |
| Mellin convention | ds=i dt; inversion | (2πi)⁻¹ds=(2π)⁻¹dt; [1,2] reflects to [1/2,1]; s changes to −s | Consistent | None |
| §0.1 quotient measure | Domain F, translate γF, doubled overlapping domain | First two pushforwards have mass V; double has mass 2V | Actual fundamental domains required | None |
| §0.1 area formula | g=0,c=1, elliptic orders 2,3 | 2π(−2+1+1/2+2/3)=π/3; index 6 gives 2π | Consistent | None |
| §0.2 energy closure | u=e₁, −A | q[e₁]=21/100; wrong negative operator gives −21/100 | Nonnegative sign discriminated | None |
| §0.2 self-adjointness/density | A on ℂ³ | A*=A; full domain has dimension 3=dim ℂ³ | Model satisfies claims | None |
| §0.2 kernel iff constants | z=(a,b,c) | Az=(0,21b/100,c/4)=0 iff b=c=0; zero operator has kernel dimension 3 | Both directions tested | None |
| §0.2 maximal-domain identification | Bounded eigenfunction with bound C | ‖u‖²≤C²V; ‖Δu‖²=λ²‖u‖²≤λ²C²V | Distributional right side is L² | None |
| §0.2 Γ₀(N) comparison | N=1,2; local y² | −I belongs to both groups; both actions send y² to −2y² | Effective kernel/domain convention agrees | None |
| §0.2 torsion-free cover | N=1,2,3 | N′=3,6,9; −I not congruent to I at those levels | Required cover avoids torsion | None |
| §0.2 finite descent | S₃ regular representation; C₃ regular representation | Transposition invariants dim 3 of 6; full S₃ invariants dim 1; full C₃ invariants dim 1 of 3; averages square to themselves | Nonabelian and cyclic tests | None |
| §0.2 cusp cutoff | Width w; heights R,2R | Missing mass ≤w/R,w/(2R); energy wJ/R,wJ/(2R), J=∫₁² abs(χ′)² | Both tend to 0 | None |
| §0.3 orthogonal complement/closed mean | z=(a,b,c) | ⟨e₀,z⟩=a; kernel a=0; projection z↦(a,0,0) | Closed codimension-one model | None |
| §0.3 reduction/domain invariance | A and constant projection P | PA=AP=0; Az has first coordinate 0 | Consistent | None |
| §0.3 nontriviality | e₁ and bump minus average | e₁ has norm 1 and mean 0; b−average has integral 0 and positive norm if b nonconstant | Zero subspace rejected | None |
| §0.4 Rayleigh definition | e₁,2ie₁,e₂ | 21/100, (21/25)/4=21/100,1/4; wrong first-power denominator gives 21/50 | Squared norm required | None |
| §0.4 nonempty/lower bound/core equality | A on H⁰=span(e₁,e₂) | Rayleigh set lies in [21/100,1/4]; both operator/form infima 21/100≥0 | Consistent | None |
| §0.4 minimizing-eigenvector API | e₁, lower bound 21/100 | Eigenvector quotient 21/100; all weighted averages ≥21/100; infimum equals 21/100 | Both inequalities tested | None |
| §0.4 replacement Check | A on all ℂ³ and H⁰ | Infimum 0 on e₀; restricted infimum 21/100 | Discriminating local computation | Replaced final-theorem assertion |
| §0.5 clipped bottom | ∅,{21/100},{1/3} | inf{1/4}=1/4; inf{1/4,21/100}=21/100; inf{1/4,1/3}=1/4 | Empty and both sides of threshold tested | None |
| §0.5 comparison APIs | c=1/5, S={21/100}; unbounded S={−n} | 1/5≤21/100≤1/4; second set unbounded below, so bounded-below upper comparison inapplicable | Conditional infimum hypotheses retained | None |
| §0.6 spectral description | Levels 1,2; hypothetical residual 1/5 | Cusp channels 1,3; (3/π)(π/3)=1; (1/(2π))(2π)=1; 1/5≠0 violates constants-only residual | Distinguishes levels and residual/cusp terms | None |
| §0.6 continuous spectrum | t=0,1 | 1/4+t²=1/4,5/4 | Threshold and sign agree | None |
| §0.7 Rayleigh/clipping | S=∅,{21/100}; eigenvalue 1/4 only | Bottoms 1/4,21/100,1/4; a threshold eigenvalue is outside (0,1/4) | No nonexistent least eigenvector selected | None |
| §1.1 exceptional dictionary | r=0,1/5,1/2; both common parities | λ=1/4,21/100,0; only middle is exceptional; either parity gives 21/100 | Strict endpoints/parity retained | None |
| §1.1 intermediate invariants | Γ(3) itself; S₃ regular model | Identity cover fixes eigenvalue; full and order-two invariants have dimensions 1 and 3 | No Γ₀(N) substitution | None |
| §1.2 real norm shift | σ=0,1 | Absolute central exponents 2σ=0,2; modulus at norm 2 is 1,4 | Unitarity excludes σ=1 | None |
| §1.2 monomial temperance | Real exponents it₁,it₂; imaginary quadratic unitary type | Real parts 0,0; unitary Weil eigenvalues have modulus 1; complementary exponents ±1/5 have nonzero real parts | Self-twist branch cannot be exceptional | None |
| §1.3 adjoint computation | diag(a,b), a,b≠0; a=2,b=3 | Ratios 2/3,1,3/2; determinant 1; raw Sym² gives 4,6,9 | Determinant removal essential | None |
| §1.3 common parity/twist | sgn times both inputs; scalar θ | (sgn)²=1 in ratios; θ²/θ²=1 | Adjoint independent of common twist | None |
| §2.1 twisted local factors | m=2 at twist prime q | d=4; local L=1; conductor q⁴ rather than q²; epsilon norm q² | Consistent | None |
| §2.1 ramified places retained | Local inverse rank-one characters away from q | Tensor is trivial; local factor (1−p⁻ˢ)⁻¹ remains; nth coefficient multiplied by χ(p)^n | No good-prime truncation | None |
| §2.1 parity | Even and odd χ | χ(−1)=1 leaves shifts; χ(−1)=−1 changes real sign and gamma shifts | Unchanged A requires evenness | None |
| §2.1 self-pair boundary | μ=±1/5, Re s≥1 | Shifts 2/5,0,0,−2/5; gamma arguments have real parts ≥3/5; pole at 1 removed by c/(s−1) | Boundary continuity route valid | None |
| §2.1 dual gamma product | Pairs (j,k) swapped under duality | Shifts −conj μ_j−μ_k permute −μ_j−conj μ_k; both products equal A(s) | Functional-equation ratio consistent | None |
| §2.1 pole/self-twist exclusion | Standard determinant norm twist t | Central exponent changes by imt; equality for all positive norms forces mt=0 and t=0; at q twisted conductor positive versus 0 | Entire twisted completion justified | None |
| §2.2 forced zero | r=1/5; β₀=0 | A has rightmost real pole 2/5 in rank-two example; β₀=0 fails strict hypothesis | Correct real point | None |
| §2.2 meromorphic/total values | Γℝ at 0 | Total value 0; punctured sΓℝ(s)→2; meromorphic order −1 | Avoids 0/0 reasoning | None |
| §3.1 cutoff definition/inversion | Normalized φ supported in [1,2] | Tail at 1/2 is 1, at 3 is 0; Mellin tail transform k(s)/s; missing 1/s would give φ(1/2)=0 | Tail versus point value separated | None |
| §3.1 scaling | φ_c(y)=φ(y/c), c=2 | Substitute y=2t: dy/y=dt/t; F₁(φ_c,x)=F₁(φ,x/2); ordinary dy would multiply by 2 | Scale fixed | None |
| §3.1 support APIs | x below a or above b | Full multiplicative mass 1 or empty support contribution 0 | Endpoints agree up to measure-zero points | None |
| §3.2 dual definition | G=0,1; normalized φ in [3,4] | Values 0; for G=1, F₂(1/5)=1 and F₂(2)=0, while unreflected tail at 2 is 1 | Reflection and denominator tested | None |
| §3.2 gamma-ratio argument | G(w)=w; reflected cutoff h(x)=φ(1/x) | F₂=βF₁(h,x)−h(x); replacing β−s by β+s gives +h(x); difference 2h(x) | Orientation fixed | None |
| §3.2 dropped denominator | G=1,x=1/5, φ in [3,4] | Tail 1 versus φ(5)=0 without 1/s | Distinguishes wrong kernel | None |
| §3.3 gamma growth | d factors, s=σ+it | Both A(s),A(1−s) have exponential factor exp(−πd abs(t)/4); ratio factor 1 | Polynomial strip route uses cancellation | None |
| §3.3 poles/collision | σ+β₀=1,d=4 | Rightmost pole real part 0; product with 1/s has order ≤5; log degree ≤4; x^ε abs(log x)^4→0 | ε-loss covers repeated poles | None |
| §3.3 dual integrability | σ=1/2,β₀=2/5,ε′=1/10 | Powers −1/2,−1/2; both integrals ∫₀¹x^(−1/2)dx=2 | Integrable margin explicit | None |
| §3.4 two-kernel identity | β=1/2; Y=2,4 | n powers −1/2 on both sums; dual arguments 2n/(fq^d),4n/(fq^d) | Conductor/Y placement consistent | None |
| §3.4 contour normalization | k(0)=1; zero cutoff | Residue Lχ(β); zero cutoff instead gives residue 0 and right side 0 | Zero cutoff excluded | None |
| §4.1 average definition | Q=0,1,2,3; L=1,fπ=1 | Counts 0,0,0,1 respectively; only q=5 contributes at Q=3 | Empty/low-prime cases computed | None |
| §4.1 conductor/extensionality API | Q=3,fπ=5 or 0; zero selected values | Counts 0,0; sum of zero selected values 0 | Exclusion and finite extensionality agree | None |
| §4.2 even orthogonality | q=3; q=5 at 0,±1,±2 | All 0 for q=3; values 0,1,−1 for q=5 | All three branches verified | None |
| §4.2 smoothed identity | n=1,q=5 | ((q−1)/2)−1=2−1=1; omitting principal subtraction at ±1 gives 2 | Main coefficient fixed | None |
| §4.2a raw sum/empty product | k=0 over 𝔽₃; k=1 over 𝔽₂ | Values 1 at r=1,0 at r=2; rank-one value −1=ψ(1) | Total definition correct | None |
| §4.2a rank/character guards | 𝔽₅,trivial ψ,k=3; 𝔽₂,k=0 | 16>15; 1>0 | Both bound hypotheses necessary | None |
| §4.2a all-characteristic values | 𝔽₂,k=1,2; 𝔽₃,k=2,r=±1 | −1,1; −1,2 | Raw sum has no trace sign | None |
| §4.2a scalar change | 𝔽₃,a=−1,k=2 | a^k=1; rank-two arguments/values unchanged at −1,2 | Character scaling agrees | None |
| §4.2a field transport/extension | 𝔽₄ trace character | k=1: 1,−1,−1; k=2: 3,−1,−1; k=3: 5,−3,−3; Frobenius permutes last two arguments | Non-prime field covered | None |
| §4.2b curve formula, constants | Rank r on Gₘ,P¹; r=0 | r(2−2)=0; 2r; both 0 for r=0 | Proper and zero-sheaf cases | Broadened target |
| §4.2b curve formula, tame Kummer | Nontrivial Kummer and constant on Gₘ | Both χ_c=0; Kummer H_c dimensions 0,0,0; constant dimensions 0,1,1 | Euler characteristic does not imply concentration | None |
| §4.2b Artin–Schreier Euler characteristic | Lψ(x^a), a=1,2 with p∤a | Swan∞=1,2; χ_c=0,−1; H_c¹=0,1 | Wild contribution required | None |
| §4.2b residue-degree weight | 𝔽₃, P¹ minus x²+1=0, phase 1/(x²+1) | One degree-2 point, Swan 1: 2·1=2; χ_c=0−2=−2. Over closure: two simple poles give 1+1=2 | Missing degrees would give −1 | Added Check |
| §4.2b characteristic-zero curve | Constant rank-one Gₘ | Swan sum 0; χ_c=2−2=0 | Wider field setting valid | Added Check |
| §4.2b geometric connectedness | P¹/𝔽_q² viewed over 𝔽_q | Two geometric components; H_c⁰,H_c² dimensions 2,2; χ_c=4, not 2 | Suggested connected-only repair insufficient | Added hypothesis/Check |
| §4.2b Swan function and proper corollary | P¹×Spec ℤ[1/ℓ], D=∞, rank one | Swan sum 0 on char 0 and every allowed char p fibre; a_L=1; H_c² rank 1, others 0 | Mixed characteristic included | Broadened target/Check |
| §4.2b empty boundary | Constant P¹ family; zero sheaf | a_L=0; ranks H⁰,H¹,H²=1,0,1; zero sheaf gives 0,0,0 | Degenerate inputs valid | None |
| §4.2b varying wild conductor | Lψ(tx), t≠0 then 0 | a_L=2 then 1; H_c² rank 0 then 1 | Local constancy necessary | None |
| §4.2b constant Swan on multiplication | Kl_k(x)⊗Lψ(t/x), k=1,2,t≠0 | Boundary Swans (1,1),(2,1); sums 2,3; a_L=2+2=4,3+4=7 | Lissity on all Gₘ | None |
| §4.2b finite flat collision | D:x²=t in odd characteristic | Generic/special points 2,1; Swans 0,0; a_L=2,1; H_c¹=1,0 | Nilpotent special boundary counted by points, not length | None |
| §4.2b nonproper family | A¹_x×(A¹_t∖{0})→A¹_t, D empty | a_L=0 everywhere; R²f₍!₎ rank 1 off 0, rank 0 at 0 | ULA survives; direct-image lissity fails | Added properness Check |
| §4.2b lissity versus tameness | Kl₂ and Lψ(1/t)⊕1, p=2,3 | Ranks 2,2; Sw₀=0,1 | Rank/lissity alone insufficient | Added negative control |
| §4.2b Kummer descent at finite level | p=2,ℓ=3,N=3 | N prime to p but N=0 in 𝔽₃; averaging by 1/N undefined; torsor degree 3 still finite étale | Spectral sequence required | Added route |
| §4.2b ULA localization and specialization direction | F=G=Lψ after killing tame inertia | Possible vanishing-cycle support only (∞,0); special H_c¹,H_c² dimensions 1,0; generic dimensions 2,0; remaining term dim 1; exact ranks 0→1→2→1→0 | Special-to-generic sequence supplies inertia filtration | Added route |
| §4.2b unipotent wild inertia | p=2,ℓ=3 or p=3,ℓ=2; N²=0 | (I+N)²=I+2N over 𝔽₃; (I+N)³=I+N over 𝔽₂; required p-order forces N=0 | Wild unipotent action trivial | Added route |
| §4.2b coefficient passage | Finite wild group order p^a, ℓ≠p | Averaging idempotent denominator p^a is a unit mod ℓ; invariant ranks and break multiplicities before/after reduction agree | Swan preserved in stable-lattice reductions | Expanded route |
| §4.2b convolution concentration/rank | Kl₁*Kl₁,Kl₂*Kl₁,Kl₂*Kl₃ | Fibre Swans (1,1),(2,1),(2,3); χ_c=−2,−3,−5; ranks 2,3,5; H_c⁰=H_c²=0 | Rank product 6 in last case rejected | None |
| §4.2b output Swan/Künneth | Same three inputs | H_c¹ output dimensions 1·1=1; Sw∞=1; k→k+1 rank and weight k−1→k | Tameness now supplied before formula used | Added missing input |
| §4.2b zero-rank convolution | F=0, G totally wild | Fibre 0; rank 0·SwG+rankG·0=0; Sw∞=0·SwG=0 | Zero object consistent | None |
| §4.2b sheaf trace sign | k=1; k=2 over 𝔽₃ and 𝔽₂ | Sign +1; at 𝔽₃ arguments ±1 raw −1,2 versus trace 1,−2; at 𝔽₂ raw 1 versus trace −1 | Geometric-Frobenius degree sign fixed | None |
| `hyperKloosterman_bound` | 𝔽₂ k=1,2; 𝔽₄ k=1,2,3 | Norms 1≤1,1≤2√2; maxima 1≤1,3≤4,5≤12 | Positive ranks and p dividing rank included | None |
| §4.3 Gauss identity | q=3,k=1,2,r=1 | 0=−1−(−1); 0=(−1+2)−1 | Principal correction sign correct | None |
| `gauss_power_even_average_bound` | q=5,k=2,r=1,2 | Character terms +5,−5; norms 5≤8√5+1 | Actual headline objects tested | None |
| §4.3 excluded rank zero | q=7,k=0,r=1 | Identity 2=3(1+0)−1; proposed bound gives 1<2 | Positive-rank guard necessary | None |
| §4.4 moment error exponents | d=4,σ=9/10; d=9,σ=4/5,9/10 | 5/4,2,3/2 | Strict nonvanishing boundary agrees | None |
| §4.4 balanced cutoff | Y=Q^((d+1)/2) | Primal exponent 1+(d+1)(1−σ)/2; dual exponent 1+(d+1)/2−σ(d+1)/2, equal | Balance and powers correct | None |
| §4.4 main term/divisor separation | Dyadic primes; n=1 | (1/2)((4−1)/2)=3/4; n−1=0 divisible by every prime | Main term separated before divisor estimate | None |
| §4.5 nonvanishing | m=2,3; complex terms 1+i,−1 | Boundaries 3/5,4/5; exponent 2 at equality; sum i≠0 | No positivity claim needed | None |
| §5.1 parameter bound | m=2,3 | 1/2−1/5=3/10; 1/2−1/10=2/5; contradiction needs β₀>3/5 or 4/5 | Weak endpoint retained | None |
| §5.2 quadratic deduction | r=0,1/5,3/10,−1 | λ=1/4,21/100,4/25,−3/4; last two fail upper or lower r hypothesis | Both bounds on r needed | None |
| §5.3 gap | Clipped S=∅ or {21/100} | 1/4≥21/100; 21/100≥21/100; 84/400−75/400=9/400 | Empty spectrum/equality included | None |
| `congruence_eigenvalue_bound`, nonconstant guard | u=1 at level 1 | −y²Δ1=0=0·1; λ=0<21/100 | Nonconstancy excludes counterexample | None |
| Same, bounded guard | E(z,3/2) | λ=(3/2)(−1/2)=−3/4; leading growth y^(3/2) unbounded | Boundedness excludes counterexample | None |
| Same, congruence guard | Identity subgroup, u=e^(iz) | abs(u)=e^(−y)≤1, Euclidean Δu=0, λ=0; infinite-index subgroup lacks congruence witness | Actual group hypothesis needed | None |
| §5.4 form inequality | u=0,e₁,2ie₁,1 | 0=0; 21/100=21/100; 21/25=21/25; constant gives 0<(21/100)V | Mean-zero and norm-square conventions fixed | None |
| §5.5 metric scaling | κ=1,4 | μ factor 1,1/4; Δ factor 1,4; energy fixed; thresholds 1/4,1; gaps 21/100,21/25 | Consistent | None |
| §5.5 denominator/positivity | κ=0,−1 | Inverse metric scaling undefined at 0; negative tensor has negative squared lengths at −1 | Excluded by κ>0 | None |
| Worked geometric arithmetic | Curvature −1, level-one area | (21/100)(π/3)/(8π)=7/800; scaling g/4 gives (21/100)/(1/4)=21/25 | No conformal-area theorem inferred | None |
| Rigid consumer sum/bound identification | p=2,3,5,7; n=0,1,2,3; all units | 52 exact cyclotomic coefficient equalities; n=1,p=3,z=1 gives −1=−1; (n+1)√q^n=(n+1)q^(n/2) | Own definition matches downstream formula at k=n+1 | Named consumer |

The finite-sum calculations used exact coefficient vectors modulo 1+ζ+⋯+ζ^(p−1), with a direct 𝔽₄ trace-character calculation as well. No test code or source text was added to the package. The new Checks agree with each other: geometric degree weights split into individual boundary points, ULA has no properness requirement, and its direct-image consequence does.

## Maintainer consequences and ownership

Ownership was searched by object through `roadmaps grep` across main and indexed open heads, the board packages, and the supplied sibling checkouts. The searches included raw Kloosterman sums, numerical bounds, Swan constancy, curve Euler–Poincaré formulas and nearby/vanishing cycles. Generic nearby cycles remain with LefschetzPencilsAndVanishingCycles. The generalized curve/conductor targets already belonged to §4.2b; their extension has no earlier owner in the searched roadmaps. The finite-coefficient formula and local ramification theory remain imported.

- `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/Suggested.lean` declares its own `RD6.kloostermanSum` and `RD6.kloostermanSum_bound` (lines 101 and 109 of the displayed head). At complex coefficients these are this package’s objects with the last variable eliminated. Its sum also allows arbitrary commutative coefficient rings; that extra generality should be coordinated with the earlier scalar owner rather than lost in a downstream deletion. The later roadmap is at position 139; it must import the complex sum/bound. This package cannot edit it.
- `packages/KloostermanSheavesAndBesselIsocrystals/design/README.md` assigns the scalar sum/sheaf to KloostermanMomentsAndPotentialAutomorphy; `packages/KloostermanMomentsAndPotentialAutomorphy/design/README.md` KM.0/raw-sum plans it again. These later consumers must route the scalar sum and the all-rank sheaf realization to CongruenceSpectralGap; their moment, differential and rigid extensions stay downstream. No reverse dependency or supplier gap was introduced for a consumer.
- `packages/AutomorphicSpectralTheoryPartII/design/README.md` has the separate Schwartz multiplier direction. This repair distinguishes that roadmap without renaming either folder or changing either scope. Any global Part-II numbering decision remains outside this package.
- No externally cited declaration names changed. The seven existing supplier gaps remain. The already recorded coordination of AutomorphicSpectralTheory §7.1a was not re-raised by either review and was not reopened.

The allowed edits are README and source locators plus this report; Suggested.lean, metadata and the entire design plan remain unchanged. No commit, push or external write was made. Independent review remains the next acceptance step.
