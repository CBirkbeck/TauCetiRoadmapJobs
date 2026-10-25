<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/957#issuecomment-6392712904 -->
Review (codex) of 4e34392

Verdict: accepted
Conditional on the announced gaps: `form-rayleigh-core`, `all-level-spectral-realization`, `principal-level-classical-constituents`, `all-prime-self-pair-positivity`, `self-pair-local-character-transport`, `finite-rs-polynomial-strips`, `additive-character-sheaf-weight`

1. **F01** (P3) Complete the Fuchsian locator for the level-one area

   **Location:** `packages/CongruenceSpectralGap/README.md:62`, also the citation and Needs at lines 145 and 147: “Layer 2 supplies measurable domains, covolume independence and the level-one area.”

   **Claim:** The supplier attribution makes the explicit level-one specialization part of FuchsianOrbifolds Layer 2.

   **Witness:** `TauCetiRoadmap/FuchsianOrbifolds/README.md:237` gives general polygon/covolume theory; line 303 gives the orbifold area formula; line 349 supplies the level-one modular signature. The latter two locators are missing.

   **Exact repair:** Keep Layer 2 for covolumes, but attribute the level-one area to FuchsianOrbifolds Layer 4, item 5, specialized using Layer 6, item 1. Add these locators to the supplier contract and §0.1 citation/Needs. This is a correction of the locator, not a missing supplier contract or a new target.

   **Repair test:** The supplied signature has genus 0, one cusp and elliptic orders 2 and 3. Its area is `2π(−2+1+(1−1/2)+(1−1/3))=π/3`. The effective index-six level-two cover then has area `6π/3=2π`. Both existing Checks are preserved.

One nonblocking P3 locator correction; no P1 or P2 findings. Acceptance is conditional on the seven declared supplier contracts listed below. The four author files were reviewed without modification. No source was fetched or manifest entry changed.

## Verified sound

### Previous findings, checked individually

All seven previous findings are repaired. None was marked not actionable, and none is re-raised. The repaired passages were read and tested again; the earlier review's numerical rows were used only as additional evidence, not as certification of changed passages.

| Previous finding | Repaired passage and location | Status and verification |
|---|---|---|
| F01: missing statable end theorem | `Suggested.lean:71`: `theorem congruence_eigenvalue_bound`; README:161: “Maximal domain: an L² class f lies in the operator domain iff…” | Repaired. All six named hypotheses and the real eigenvalue binder are present in the elaborated signature. The maximal-domain argument supplies the actual operator-domain bridge. Constants give the excluded eigenvalue 0; `E(z,3/2)` gives the excluded unbounded eigenvalue −3/4. |
| F02: two owners for the all-level operator | README:76: “the contract below asks only for the operator-independent adelic decomposition at principal level” | Repaired. The gap names the adelic Casimir, not this package's quotient Friedrichs operator. §0.6 supplies the transport. Keeping all central characters is necessary: at N=5 there are four determinant components, not just the single trivial-character sector. |
| F03: vague classical comparison | README:84: “an isometry, for the normalized quotient measures” and “equivariant for GL₂(ℤ̂)/K(N)” | Repaired. Source, target, component index, measures, Casimir and cusp restriction are specified. AFRG §§3.1 and 4.5 are cited, and the gap asks for their missing principal-level extension. |
| F04: duplicated Gamma/strip ownership | README:106: “Layer 3, items 1–3, supplies Phragmén–Lindelöf for the pole-cleared continued uncompleted function” | Repaired. The Gamma gap is removed. The remaining gap asks for the automorphic record instance, not a second Stirling or convexity theorem. `AnalyticLFunctionData` is supplied by LFunctions Layer 0, not claimed as a pinned declaration. |
| F05: false rank-zero Check | README:596: “Rank k=0 is excluded because the norm bound fails there, although the identity persists” | Repaired. At q=7, r=1 the identity is `2=3(1+0)−1=2`, while the bound is `2≤1`, false. |
| F06: nondiscriminating kernel Checks | README:416: `F₁(φ_c,x)=F₁(φ,x/c)`; README:439: `βF₁(φ∘inv,x)−φ(1/x)` | Repaired. Dilation rejects ordinary measure, the linear G test rejects `β+s`, the x=1/5 test rejects omission of `1/s`, and x=2 rejects an unreflected Mellin argument. |
| F07: supplier/slug drift | README:96: “Hecke, eigensystem and Rankin–Selberg data”; README:70: “UO-A01–UO-A03”; README:172: “PDE Lane A, item 1”; README:369: both `gap:` prefixes | Repaired. These targets exist in the specified suppliers; SA-E14 is no longer cited as the unbounded functional calculus. The plan's revised gap section also matches. R01 is a separate locator correction. |

### Coverage and principles

Read all 28 numbered target sections, their API bullets, all 98 Checks, the conventions, examples, supplier contracts, sources manifest, metadata and Lean file. The nine ordinary definition families and the additional sheaf construction each have an API and at least three discriminating Checks after the repairs. The zero-vector Checks are supplemented by tests rejecting zero, sign-reversed, real-mean, unreflected or incorrectly normalized alternatives.

The package is an extension of AutomorphicSpectralTheory with an explicit boundary, not a re-plan of its decomposition or Γ₀(N) operator. The generic form theorem, spectral calculus, adjoint lift, character orthogonality and Gamma estimates remain at their earlier owners. The sole restriction to an unramified prime selects the twisting conductor; the original L-function retains every ramified local factor. The all-field Kloosterman theorem includes characteristic two and ranks divisible by the characteristic.

No computational algorithm, copied source passage, sorry'd data, `set_option`, `lemma`, admitted example, surrogate automorphic carrier or empty predicate occurs in the acceptance file. It has one `import Mathlib`, one real-bodied necessary definition, three headline theorems and 81 lines. Metadata assigns `math.NT`. All five works have single manifest keys. No suspicious instruction in external text was acted on.

Three main-branch style examples were read: `TauCetiRoadmap/FuchsianOrbifolds/README.md`, `TauCetiRoadmap/DifferentialGeometry/README.md`, and `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md`. The package has the requested Summary, ownership, conventions, supplier contracts, ordered layers, Examples/Dependencies, consumers and references.

### Seeded source sample

The five fully readable sampled targets and the readable portions of two mixed-source targets were checked at the actual text. Eight sampled targets cite only settled-uncertified lrs95. Their mathematics was checked independently; their source numbering was not certified. All other lrs95 locators share that limitation. No new missing-reference request is needed.

| Sampled target | Locator actually inspected | Result |
|---|---|---|
| 0.2 Positive orbifold Laplacian | teschl line 2914, Theorem 2.12 p.70; line 2960, Theorem 2.13 pp.71–72; bms02 line 151, §2.1 p.4; line 179, Theorem 2.3 p.5; line 196, Assumption B p.5; line 245, Corollary 2.10 p.7 | Generic closed-form representation and complete-metric essential self-adjointness support the stated specialization. With D=d and V=0, the symbol is injective, the induced metric is the given metric, and the local regularity assumption holds. Finite-group descent is explicitly proved here. |
| 0.3 Mean-zero Hilbert subspace | teschl line 5008 and line 5044, §4.3/Theorem 4.10 pp.118–119 | Orthogonal restriction and the variational comparison are supported. The complex integral kernel and its continuity are the package's elementary finite-measure specialization, not a purported theorem about orbifolds in Teschl. |
| 0.7 Rayleigh and clipped spectrum comparison | teschl line 5015 and line 5044, Theorem 4.10 pp.118–119; line 5053, form-domain observation | The inserted essential threshold and replacement by the form domain agree with the source. Finiteness of the small spectrum comes from the separately declared automorphic contract. |
| 2.2 Archimedean trivial zero | lrs95, Theorem 1.2 discussion pp.389–390 and proof p.395 | Uncertified text. Independently checked the diagonal Gamma pole at 2/5 and meromorphic order cancellation. |
| 3.2 Dual Mellin kernel | lrs95, (3.7), Lemma 3.1 p.396 | Uncertified text. Inversion, the reflected support and the `G(w)=w` witness were recomputed. |
| 3.3 Mellin cutoff estimates | lrs95, Lemma 3.1 p.396 | Uncertified text. Rightmost pole `σ+β₀−1`, collision order, rapid decay and integrability exponents checked. |
| 4.2 Even nonprincipal orthogonality | lrs95, (3.11)–(3.12) p.397 | Uncertified text. Exact values at q=3,5,7 and the principal subtraction independently verified. |
| 4.2a Raw hyper-Kloosterman sums | katz-gkm line 1845 and line 1871, §4.0 pp.47–48 | Correct raw unit-product fibre and extension character via field trace. Rank zero is explicitly the package's empty-product convention. |
| 4.2b Sheaves and Deligne estimate | katz-gkm line 1892 and line 1902, Theorem 4.1.1 pp.48–49; line 2266, §4.3 p.59; line 2392, line 2412 and line 2424, Theorem 5.1 pp.63–64 | Rank k, weight k−1, geometric Frobenius, sign, tame/wild conditions, concentration, convolution rank and Swan formulas all match. Setting every bᵢ=1 imposes no condition on p dividing k. |
| 4.3 Gauss-power average | lrs95, (3.18)–(3.20) p.398 | Uncertified text. Expanded finite sums agree at q=3,5,7, including the excluded rank-zero case. |
| 4.4 Prime-twist average asymptotic | lrs95, Proposition 3.1 p.395, proof pp.397–399 | Uncertified text. Both errors balance at `Y=Q^((d+1)/2)`; prime summation gives coefficient 3/4. |
| 4.5 Twisted nonvanishing | lrs95, Proposition 3.1 and proof of Theorem 1.2 p.395 | Uncertified text. Strict thresholds 3/5 and 4/5 and the complex finite-sum argument are correct. |
| 5.2 Exceptional arithmetic | lrs95, §1 pp.389–390 | Uncertified text. Exact rational calculation and the negative-r counterexample checked. |
| 5.3 Congruence gap | lrs95, Theorem 1.1 p.387 and reduction pp.389–390; bms02 line 245, Corollary 2.10 p.7 | LRS text uncertified. The newly added maximal-domain input is supported; the classical Lean signature and reduction from GL₃ were checked. |
| 5.5 Curvature rescaling | teschl line 5044 and line 5053, Theorem 4.10 p.119; lrs95 §1 pp.387–390 | Teschl supports the variational comparison, not the metric scaling itself. The latter is explicitly a coordinate calculation using DifferentialGeometry. LRS text uncertified. |

Also read gj78 line 528 (Definition 3.1.3, p.485), line 538 (Proposition 3.2, pp.485–486), line 721 (§3.7, p.491), line 2151 (Theorem 9.3, p.534) and line 2384 (Remark 9.9, p.541). The adjoint normalization, archimedean parameter comparison and self-twist branch support Layer 1. The package imports the stronger all-place lift from its roadmap owner rather than claiming that the old paper alone supplies every modern local comparison.

### Computed adversarial pass

The 105 rows name statements and API claims and records calculated values. Numerical finite-field values are independently enumerated finite sums, rounded only for display; exact small values and symbolic identities were also derived. These checks test the statements and conventions; they do not claim to prove the unfinished deep theorems. In the result column, “excluded” means the displayed false conclusion is prevented by a stated hypothesis. Unless R01 is named, no change is required.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Congruence convention and effective action | N=1,2; central −I; N=0 | Effective indices 1,6; areas π/3,2π; −I acts as identity; N=0 fails `N≠0` | Pass |
| Positive Laplacian convention | 1, y², yˢ | Δ1=0; Δy²=−2y²; Δyˢ=s(1−s)yˢ; s=1/2+it gives 1/4+t² | Pass; sign reversed model rejected |
| Complex energy convention | u and iu; u and 2iu | q[iu]=q[u]; q[2iu]=4q[u]; squared norms multiply by 1 and 4 respectively | Pass |
| Complex mean convention | constants 1,i on mass M>0 | Integrals M,iM, both nonzero; real-part mean would return 0 for i | Pass |
| Gamma/parameter convention | μ={1/5,−1/5} | Self-pair shifts {2/5,0,0,−2/5}; β₀=2/5∈[0,1) | Pass |
| Conductors and root number | m=2,f=4,q=5 | d=4, fqᵈ=2500; norm `2·25/50=1`; treating τπ as unit gives 1/2 | Pass |
| Positive Gauss convention | q=3; principal character | e(1/3)=−1/2+i√3/2; sum of all additive values=0; τ(1)=−1 | Pass |
| Mellin convention | inversion; reciprocal support | ds=i dt cancels i, leaving 1/(2π); [1,2] maps to [1/2,1]; transform parameter s maps to −s | Pass |
| Totalized Gamma versus germ | s=0 | Point value Γℝ(0)=0; punctured limit sΓℝ(s)=2; pole order −1 | Pass |
| 0.1 quotient measure definition | level-one effective domain | Pushforward mass equals upstairs domain area π/3; double counting the kernel gives 2π/3 | Pass; locator R01 |
| 0.1 fundamental-domain independence API | F and γF | Integrals of invariant 1 over either domain both π/3; overlapping double domain gives 2π/3 and is inadmissible | Pass |
| 0.1 finite positive mass API | Γ(1),Γ(2), zero measure | π/3 and 2π lie in (0,∞); zero measure has mass 0 | Pass |
| 0.1 proof independence API | two witnesses Γ(6)≤Γ(2), Γ(2)≤Γ(2) | Same quotient and area 2π for both witnesses, not π/3 | Pass |
| 0.2 operator definition, adjoint and nonnegativity | compact bump b; ib; opposite sign | Re⟨b,Δb⟩=∫‖∇b‖²>0; ib has the same value; opposite sign gives its negative | Pass |
| 0.2 dense domain API | cusp truncations of 1, width w | Missing squared norm ≤w/R→0; energy `(w/R)∫₁²|χ′|²→0` | Pass |
| 0.2 kernel iff API | 0,1,i; nonconstant bump b | Δ0=Δ1=Δi=0; b has positive energy, hence Δb≠0 | Both directions consistent |
| 0.2 strict pairing Check | spectral vector at λ=2, norm 1 | Δu≠0 and Re⟨u,Δu⟩=2>0; zero operator gives 0 | Pass |
| 0.2 maximal domain | 1; compact bump; unbounded Eisenstein at s=3/2 | Distributional images 0 and smooth compact L²; Eisenstein leading squared cusp integral is ∫y dy=∞ | Pass; L² domain retained |
| 0.2 torsion-free cover route | Γ(3), Γ(6) | For γ=I+3A, determinant 1 gives tr A=−3det A; trace −1 would require tr A=−1, impossible; −I≢I mod3 | Pass |
| 0.2 invariant descent | finite deck group D | Averaging idempotent: `(|D|⁻¹Σg)²=|D|⁻¹Σg`; on invariant 1 its value is 1 | Pass; no division by zero |
| 0.3 mean-zero definition and membership iff | constants; b−M⁻¹∫b | Integral of 1=M, of i=iM; integral of centered b=`∫b−M⁻¹(∫b)M=0` | Pass |
| 0.3 integral continuity and closedness | constant u=1; sequence with L² error 1/n | Cauchy–Schwarz is `M≤√M√M=M`; mean errors ≤√M/n→0 | Pass |
| 0.3 domain invariance API | constants and a positive eigenvector | ⟨1,Δu⟩=⟨Δ1,u⟩=0; for λ≠0, λ∫u=0 implies ∫u=0 | Pass |
| 0.3 nonzero subspace Check | nonconstant compact bump b | Centering gives integral 0; if its norm were 0, b would equal its constant mean a.e., contrary to the chosen bump | Pass; excludes zero submodule |
| 0.4 Rayleigh definition and nonempty set | centered free-chart bump v≠0 | Denominator ‖v‖²>0; numerator q[v]>0; quotient is a finite positive real | Pass |
| 0.4 nonnegativity API | model A=diag(0,2), constants first coordinate | Allowed normalized vector (0,1) has quotient 2≥0; excluded constant has quotient 0 | Pass |
| 0.4 upper threshold API | spectrum {0}∪[1/4,∞) | Unit vectors supported spectrally in [1/4,1/4+ε] have quotients in that interval; infimum=1/4 | Pass |
| 0.4 member bound and attained-bottom Check | eigenvalue 21/100 with all quotients ≥21/100 | Eigenvector quotient=21/100; infimum both ≥ and ≤21/100 | Pass |
| 0.4 final-gap Check | keeping/removing constant zero | Clipped positive spectrum starts ≥21/100; retaining 0 instead gives infimum 0 | Pass; final theorem is used only as a Check |
| 0.5 clipped-bottom definition/API | S=∅,{21/100},{1/3} | Infima 1/4,21/100,1/4 respectively | Pass |
| 0.5 bounded-below member comparison | S={1/3}; r=1/3 | `1/4≤1/3`; for unbounded S the hypothesis fails | Pass |
| 0.5 lower comparison API | c=1/5,S={21/100} | c≤1/4 and c≤21/100; conclusion `1/5≤21/100` | Pass |
| 0.6 residual projection | Γ(1),Γ(2) | `(3/π)(π/3)=1`; `(1/(2π))(2π)=1`; positive residual value 1/5 contradicts residual=constants | Pass |
| 0.6 channels and finite-group descent | Γ(2),Γ₀(2),Γ(1) | Three cusp channels; order-two subgroup fixes one cusp and swaps two, giving 2 orbits; S₃ gives 1 orbit | Pass |
| 0.6 continuous normalization | t=0,1 | Spectral values 1/4 and 5/4; no sign or factor-two discrepancy with Δyˢ | Pass |
| 0.7 clipping equality | S=∅,{21/100}; isolated threshold 1/4 | Both Rayleigh/spectral bottoms are 1/4 or21/100; 1/4 is excluded from the open small set but retained as threshold | Pass |
| 0.7 removal of constants | S with/without 0 | Inserting 0 makes infimum 0; actual S excludes it and has infimum ≥21/100 | Pass |
| 1.1 exceptional dictionary | r=1/5, both parities; r=0,1/2 | λ=21/100 for both parities; endpoints give1/4 and0, outside the exceptional interval | Pass |
| 1.1 principal-level invariants | S₃ regular representation; order-two subgroup | Dimensions 6,3,1 for whole space, subgroup invariants, full invariants; Casimir scalar λ remains λ | Pass |
| 1.2 inducing character's real shift | σ=0,1 | Absolute central exponent2σ=0,2; unitary central character excludes2 | Pass |
| 1.2 tempered induction | split unitary characters; complex unitary character | Character moduli1,1; induced Weil image bounded; real exponents±1/5 would have moduli e^(±1/5) at norm e | Pass |
| 1.3 adjoint parameters | r=1/5; common sign | Ratios have exponents2/5,0,−2/5; sgn/sgn=1 | Pass |
| 1.3 determinant twist | diagonal roots2,3; scalar twist u | Ad roots2/3,1,3/2 with product1; raw Sym² roots4,6,9 with product216; scalar u cancels in ratios | Pass |
| 2.1 local twist at q | m=2,q=5 | Local polynomial1 gives factor1; degree4 gives conductor625 and Gauss power4 | Pass |
| 2.1 ramified coefficient transport | rank-one ramified character paired with inverse; p≠q | Self-pair factor `(1−p⁻ˢ)⁻¹`; b(pᵃ)=1 becomes χ(p)ᵃ, not0 | Pass |
| 2.1 evenness restriction | even versus odd real twist | Even leaves Γℝ(s−μ) unchanged; odd changes it to Γℝ(s−μ+1), shifting the candidate pole by−1 | Pass |
| 2.1 positivity/partial sums | b(1)=1; model b(n)=1 | Sum to x=⌊x⌋, and ⌊x⌋/x→1; coefficient at1 remains1 | Pass; actual automorphic instance is declared gap |
| 2.1 entire twist route | q=3 and q=5 | At3 no even nonprincipal character; at5 the quadratic twist is ramified while πq is unramified, excluding a norm self-twist | Pass |
| 2.2 forced zero | μ={±1/5}, β₀=2/5 | Gamma orders atβ₀ sum to−1; entire product order≥0 forces finite-function order≥1 and value0 | Pass |
| 2.2 rightmost pole and zero boundary | β₀=2/5; β₀=0 | All pole real parts≤2/5; β₀=0 fails the positive hypothesis and needs no contradiction | Pass |
| 3.1 tail definition and exact inverse | normalized positive-support φ; Re s=2 | Inner integral `∫₀ʸx^(s−1)dx=yˢ/s`; both Mellin transforms are `mellin(φ,s)/s` | Pass |
| 3.1 below-support API | support[1,2], x=1/2 | Tail=∫φdy/y=1; ordinary unit-mass indicator instead gives log2 | Pass |
| 3.1 above-support API | support[1,2], x=3 | Tail0; a head-integral model gives1 | Pass |
| 3.1 dilation Check | c=2, support[1,2], x=1 | Both tails equal1; ordinary dy change contributes factor2 | Pass |
| 3.2 definition and zero-ratio API | G=0 | Integrand0, inverse integral0, F₂=0 | Pass |
| 3.2 unit-ratio comparison | normalized support[3,4], x=2 | Reflected tail0=F₂; unreflected tail1 | Pass |
| 3.2 orientation Check | G(w)=w, x=3/10, a=φ(10/3)≠0 | Correct value `βT−a`, wrong value `βT+a`, difference2a≠0 | Pass |
| 3.2 divisor Check | G=1, support[3,4], x=1/5 | F₂=1; omitting1/s givesφ(5)=0 | Pass |
| 3.3 rightmost pole/rapid decay | (σ,β₀)=(1/2,2/5),(9/10,2/5) | Rightmost possible real parts−1/10,+3/10; neither reaches line2; right shifts give x⁻ᴮ | Pass |
| 3.3 repeated pole/near-zero bound | σ+β₀=1,d=4 | Collision order≤5 gives log-degree≤4; `t⁴e^(−εt)→0` for t=−logx | Pass |
| 3.3 dual integrability | σ=1/2,β₀=2/5,ε′=1/10 | Powers x⁻¹ᐟ² and x⁻¹ᐟ²; each integral over(0,1) equals2 | Pass |
| 3.4 functional equation contour/sign | s↦−s | Original left-line integral changes sign; subtraction of it gives a plus dual term; residue at0 is k(0)Lχ(β)=Lχ(β) | Pass |
| 3.4 conductor and n exponents | Y=2,4; β=1/2 | Dual argument doubles; both n powers n⁻¹ᐟ², with χ versus χ̄ retained | Pass |
| 3.4 normalization and convergence | zero cutoff; nonzero compact cutoff | Zero cutoff has residue0, notLχ(β); normalized cutoff residue coefficient1; large-n kernels beat every polynomial | Pass |
| 4.1 finite-average definition | L=1; (Q,fπ)=(0,1),(1,1),(2,1),(3,1),(3,5),(3,0) | S=0,0,0,1,0,0 respectively | Pass |
| 4.1 equality/zero APIs | families equal on selected q=5 character; all values0 | Same selected value z gives S=z in either family; selected value0 gives S=0 | Pass |
| 4.2 orthogonality | q=3; q=5,a=0,±1,±2 | Empty sum0; values0,1,−1 match branches0,(q−3)/2,−1 | Pass |
| 4.2 principal subtraction | q=5,n=1 | Coefficient2−1=1; subtracting only outside±1 gives2 | Pass |
| 4.2a empty product | k=0,F₃,r=1,2 | Fibre sums1,0 | Pass |
| 4.2a singleton API | k=1,F₃,r=1,2 | Values−1/2±i√3/2=ψ(r), norms1 | Pass |
| 4.2a field-isomorphism API | F₄=F₂[α]/(α²+α+1), Frobenius α↔α+1 | Trace character fixed; rank-two sums atα,α+1 both−1 | Pass |
| 4.2a character scaling API | F₇,k=2,a=2,r=1 | Scaled sum−2.69202147=Kl₂(4); inverse scaling predicts Kl₂(2)=−2.35689587 | Pass |
| 4.2a trivial-character counting | F₅,k=3 | Sixteen tuples; `(5−1)²=16`; false nontrivial bound would give15 | Excluded by ψ≠1 |
| 4.2a small characteristic | F₂,k=1,2,3 | −1,1,−1=(−1)ᵏ, including p dividing rank | Pass |
| 4.2b concentration/rank convolution | rank k,Swan1 convolved with rank1,Swan1 | New rank k·1+1·1=k+1; Swan1·1=1; weight1+(k−1)+0=k | Pass |
| 4.2b trace sign | F₃,k=2,r=1,−1 | Raw−1,2; sheaf traces1,−2; norms1,2≤2√3 | Pass |
| 4.2b extension API | F₂→F₄,k=2,r=1 | Base trace−1, determinant2; squared-Frobenius trace1−4=−3; extended raw sum3 | Pass |
| 4.2b weight/bound | F₄,k=2,r=1,α,α+1 | Raw3,−1,−1; rank2 weight1 gives RHS2·2=4 | Pass |
| `hyperKloosterman_bound` | F₅,k=2,all units; k=0; ψ=1,k=3 | Norms0.381966,3.236068,1.236068,2.618034≤4.472136; excluded cases1>0 and16>15 | Pass |
| 4.3 exact Gauss identity | q=3,k=1,2,r=1 | `−1−(−1)=0`; `(−1+2)−1=0`; character sums both0 | Pass |
| 4.3 exact identity and norm bound | q=5,k=2,r=1,2 | LHS5,−5; RHS2(0.381966+2.618034)−1=5 and2(−3.236068+1.236068)−1=−5; norms≤8√5+1 | Pass |
| 4.3 conjugate orientation | q=7,k=1,r=2 | Correct average−0.335125604=`6cos(4π/7)+1`; replacing χ̄(r) byχ(r) gives−4.40581321 | Pass |
| 4.3 rank-zero Check | q=7,k=0,r=1 | Identity2=3(1+0)−1=2; bound2≤1 is false | Excluded; repaired F05 |
| `gauss_power_even_average_bound` | q=7,k=2,r=1,2 | Norms8.47650081,5.41119002≤12√7+1=32.7490157 | Pass |
| 4.4 error balance | d=4,σ=9/10 | Y=Q^(5/2); QY^(1−σ)=Q^(5/4); Q^((d+3)/2)Y⁻σ=Q^(5/4) | Pass |
| 4.4 boundary and near-zero terms | d=9,σ=4/5 or9/10 | Error base exponents2 or3/2; dual near-zero powers integrate iffσ>0 andβ₀+ε′<1 | Pass |
| 4.4 main term | dyadic weighted primes | Half of leading integral `(4−1)Q²/(2logQ)` is `3Q²/(4logQ)` | Pass |
| 4.4 divisor-count split | n=1 versus n=2 | n−1=0 has every prime divisor; n=2 has n−1=1,n+1=3 and divisor counts1+2=3 | Pass; zero separated |
| 4.5 nonvanishing threshold | m=2,3 | Thresholds3/5,4/5; at equality error exponent2, while strict inequality permits exponent2−δ | Pass |
| 4.5 complex finite-sum argument | terms1+i,−1; terms i,0 | Sums i,i≠0; each has a nonzero term, second has a zero term | Pass; no positivity/universal nonvanishing |
| 5.1 parameter contradiction | m=2,3 | β₀≤3/5,4/5 yields max Reμ≤3/10,2/5; symmetry gives the absolute values | Pass |
| 5.1 equality boundary | m=3,β₀=4/5 | Lies outside strict nonvanishing region; permits equality2/5 | Pass |
| 5.2 exceptional arithmetic | r=0,1/5,3/10,−1 | λ=1/4,21/100,4/25,−3/4; last two excluded by upper bound and sign respectively | Pass |
| 5.3 spectral gap assembly | small eigenvalue at bound; empty small set | Both small-value lower bound and threshold are≥21/100; min(21/100,1/4)=21/100; empty gives1/4 | Pass |
| `congruence_eigenvalue_bound` constant control | Γ=SL₂(ℤ),u=1 | Equation forcesλ=0<21/100; only nonconstancy fails | Excluded |
| Same theorem, boundedness control | Γ=SL₂(ℤ),E(z,3/2) | Eigenvalue(3/2)(−1/2)=−3/4; leading cusp growth y^(3/2) is unbounded | Excluded |
| Same theorem, maximal-domain route | bounded invariant C² eigenfunction | `‖u‖₂²≤C²M<∞`; distributional imageλu also L²; λ∫u=0; λ≠0 gives mean0 | Pass |
| Same theorem, sign and zero class | y^(1/2+it); continuous nonconstant u | Differential eigenvalue1/4+t²; a nonzero value has a positive-measure open neighbourhood, so its L² class is nonzero | Pass |
| 5.4 form/operator inequality | 0; equality vector of norm1; 2iu | Both sides0; both21/100; both4·21/100=21/25 | Pass |
| 5.4 mean-zero necessity | u=1,massM>0 | Energy0<(21/100)M | Excluded |
| 5.4 core transfer | vₙ−M⁻¹∫vₙ | Mean exactly0; subtracting a constant changes energy by0; norms and energies tend to those of u | Pass |
| 5.5 metric/operator scaling | κ=1,4 | Volume factors1,1/4; inverse metric/operator factors1,4; energy products1,1 | Pass |
| 5.5 Rayleigh scaling | norm²1,energy21/100,κ=4 | New quotient `(21/100)/(1/4)=21/25`; threshold4/4=1 | Pass |
| 5.5 curvature and positivity | κ=4,0,−1 | Curvature−4; κ=0 has no inverse metric; κ=−1 gives negative definite metric | Excluded endpoints |
| Final numerical example | level-one area and consumer scalar | `84/400−75/400=9/400`; `(21/100)(π/3)/(8π)=7/800` | Pass; no extra geometric theorem inferred |

The generality checks also exclude the zero ring by `Field`, zero/nonunit r by `Units`, q=1 by primality, and rank zero only from the bound, not from the sum definition. There is no DVR, inseparable-extension or nonreduced-scheme assertion being silently generalized from a finite-field computation. The sheaf base and multiplication map are smooth finite-type schemes; the coefficients retain ℓ≠p. No Rayleigh quotient divides by the norm of zero, and every conductor and metric denominator is positive. No hypothesis contains a headline conclusion.

### Pinned libraries and elaboration

Checked the actual manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the content main revision is `b41e47bc34e30def0db01d84cc92062ed72c6e68`. The following 30 consumed declarations were opened at those pins. Paths in this table are library-repository-relative.

| File and line | Declarations and checked content |
|---|---|
| `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163`, :181 | `CongruenceSubgroup.IsCongruenceSubgroup` is `∃ N ≠ 0, Gamma N ≤ Γ`; `.finiteIndex` derives finite index. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:349`; `Mathlib/Algebra/Group/Action/End.lean:184` | `MulAction.orbitRel.Quotient` is the orbit quotient; `MulAction.toPermHom` is the action homomorphism. Neither adds an effective-action or measure theorem automatically. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:44` | `UpperHalfPlane.volume_def` uses density y⁻². |
| `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630` | `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`: countable group, invariant measure, measurable constant action and two actual fundamental domains. |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89` | `MeasureTheory.Lp` has carrier `eLpNorm f p μ < ∞` inside measurable a.e. classes; the measure is a parameter. |
| `Mathlib/LinearAlgebra/LinearPMap.lean:41` | `LinearPMap` has a submodule domain and map on it. It does not contain density, closedness or self-adjointness. |
| `Mathlib/Analysis/MellinTransform.lean:90`, :95, :153 | `mellin`, `mellinInv`, `mellin_comp_inv`; exponent s−1, prefactor1/(2π), reciprocal substitution−s. |
| `Mathlib/Analysis/MellinInversion.lean:92` | `mellinInv_mellin_eq` requires x>0, Mellin convergence, vertical integrability and continuity at x, with complete coefficient space. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`, :75, :104 | `Complex.Gammaℝ`, `Gammaℝ_eq_zero_iff`, `Gammaℝ_residue_zero`; zero totalization at even nonpositive integers and punctured residue2. |
| `Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean:68` | `DirichletCharacter.sum_characters_eq`, with nonzero modulus, domain and enough roots of unity. |
| `Mathlib/NumberTheory/GaussSum.lean:72` | `gaussSum` is `∑ a, χ a * ψ a`, with no normalization. |
| `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83`, :95 | `ZMod.stdAddChar`, `ZMod.isPrimitive_stdAddChar`; positive exponential convention. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:426`, :521 | `Complex.Gamma_ne_zero` away from the nonpositive integers; `Complex.differentiable_one_div_Gamma` on all ℂ. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138` | `InnerProductSpace.instLaplacian`: second derivative contracted with the canonical real inner-product tensor; on basis1,i, Δ(x²+y²)=4. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:282` | `UpperHalfPlane.SLAction` is the induced Möbius action, valid for ℤ via its real algebra. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean:181` | `UpperHalfPlane.riemannianVolume_eq_volume`. |
| `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:76`, :82 | `IsSelfAdjoint.isFormalAdjoint`, `LinearPMap.IsFormalAdjoint.im_inner_self_apply`; actual-domain pairing, with completeness for the adjoint bridge. |
| `TauCeti/Analysis/PDE/EnergyForm/Sobolev.lean:372`, :600 | `TauCeti.PDE.energyFormH1`, `energyFormH1L0`; real Euclidean forms, the latter with coefficient bounds. They are not quotient complex energies. |
| `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301` | `TauCeti.LSeries.wienerIkehara`; nonnegative coefficients, actual Dirichlet agreement, continuous pole-subtracted boundary; inclusive `Icc 1 floor(x)`. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:46` | `TauCeti.primeCount_univ_isEquivalent_div_log`; number-field prime-ideal counting, specialized to ℚ with norm identification. |

Object searches also opened `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:63`: `Scheme.ellAdicSheaf` is the pro-étale coefficient sheaf of continuous ℤℓ-valued functions, not the rational constructible direct-image/lisse-sheaf package needed here. `TauCeti/RepresentationTheory/CharacterTable/GL2/Cuspidal/Irreducible.lean:334` constructs `GL2Cuspidal` for a finite field, not an adelic cuspidal representation. Neither makes an omitted automorphic/sheaf headline statable. Searches found no pinned hyper-Kloosterman construction, Rankin–Selberg automorphic carrier or arbitrary-congruence Friedrichs realization.

Ran the prescribed `lake env lean` command on the original `Suggested.lean` from the content checkout: exit 0, exactly three `declaration uses sorry` warnings, at lines44,55,71. No TauCeti import or targeted build was necessary.

On one scratch copy, appended `#check @` for all four declarations and probed every sorried theorem with `simp`, `rfl`, `infer_instance` and `exact le_of_eq rfl`, using `fail_if_success` and requiring each tactic to close the goal. All 12 closing attempts failed; the copy elaborated with only the three expected sorry warnings. Reading the definitions and the library search likewise found no single existing result proving these general headlines. No padding was found.

The elaborated types match the README: finite fields in arbitrary universes and an explicit nontrivial additive character; real exponent `(k−1)/2`; odd prime q, positive rank, unit r and even nonprincipal characters; and, for the eigenfunction theorem, congruence, C² regularity on the upper half-plane, actual Möbius invariance, boundedness, nonconstancy, real λ and the signed Laplacian equation. There are no section variables and no lost binders. No signature was changed.

### Headline inventory

| README headline | Acceptance-file disposition |
|---|---|
| §4.2b general numerical Deligne bound | Stated as `hyperKloosterman_bound`; `hyperKloosterman` is its necessary simple native definition. |
| §4.3 Gauss-power average bound | Stated as `gauss_power_even_average_bound`. |
| §5.3 congruence gap | Stated as `congruence_eigenvalue_bound` on native carriers. The equivalence with the small-spectrum bound is justified through §0.6 and boundedness of cusp forms. |
| §§0.7,5.3–5.5 spectral clipping, Rayleigh-infimum gap, form inequality, scaling | Named in the docstring as lacking the canonical quotient closed form/operator. No bare scalar substitute is used. |
| §§1.1–1.3 exceptional dictionary and spherical adjoint; §5.1 parameter bound | Named in the docstring as lacking native automorphic representations, occurrence spaces, parameters and lifts. |
| §§2.2,3.3–3.4,4.4–4.5 forced zero, two-kernel identity/estimates, first moment and nonvanishing | Named in the docstring as lacking canonical Rankin–Selberg and gamma-parameter families. |
| §4.2b Kloosterman sheaf realization and purity | Named in the docstring as lacking rational adic direct-image and lisse-sheaf carriers. |

### Supplier resolution, gaps and direction

Every Needs line and supplier citation was resolved anew. The open-roadmap service was consulted, rather than treating prior review statements as evidence of present contents. Main copies were used for existing roadmaps, not their open progress/revision branches. The resolver found no missing cross-roadmap citation; its pinned-name lead `LFunctions.AnalyticLFunctionData` was resolved manually to the open new LFunctions roadmap, Layer 0, lines322–336. It is a future supplier carrier inside a declared gap, not an absent Lean import.

| Supplier copy | Opened locations and actual supplied object |
|---|---|
| FuchsianOrbifolds, main | `TauCetiRoadmap/FuchsianOrbifolds/README.md:193`, :215, :235, :263; effective action, charts, covolume and cusps. The level-one specialization additionally needs :303 and :349, as R01 records. |
| DifferentialGeometry, main | `TauCetiRoadmap/DifferentialGeometry/README.md:910`, Layer12 items1–5; metric, gradient, div-grad Laplacian, volume and Green. |
| PDE, main | `TauCetiRoadmap/PDE/README.md:227`, LaneA item1; :327, LaneE item20. The latter starts with a weak H¹ solution; §0.2 explicitly supplies the preceding local regularity step. |
| SelfAdjointSpectralTheory, main | `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md`, PartC and :1201–1232, SA-E01–SA-E13; PVM, actual-domain reduction and form bounds. |
| UnboundedOperators, head 5e40c73 | `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:23`, UO-A01–A03; :172, UO-D06. Noncompact form representation, domains, form identity and calculus exist as targets; the exact Rayleigh-core export remains declared. |
| AutomorphicSpectralTheory, head c5cfb92 | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:191`, :208, :1285, :1313, :2352, :2363, :2395, :2417, :2522; §§0.6–0.7,1.16–1.16a,4.3–4.4,4.6,4.8,4.14a. The scalar Γ₀(N) operator and general adelic decomposition have distinct ownership. |
| AutomorphicFormsOnReductiveGroups, head c00e220 | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:418`, :434, :459, :496, :551, :568, :679; §§2.5–2.7,3.1,3.4–3.5,4.5. The Maass carrier includes all congruence subgroups; the displayed adelization is level one. |
| ArithmeticLocallySymmetricSpaces, open new head | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:898`, ALS.F.6; cusp forms, rapid decay and discrete constituent decomposition. Its boundedness equivalence is applied to cusp forms, not all automorphic forms. |
| GlobalNumberFields, main | `TauCetiRoadmap/GlobalNumberFields/README.md:433`, :502, :525; Layers6,9,10. The real norm exponent and unitary part, and complex infinity types, match the induction argument. |
| GL2AutomorphicRepresentationsAndTransfer, open new head | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2144`, R17.4.13; local adjoint, all-place compatibility, self-twist branch and cuspidality criterion. |
| AutomorphicLFunctionsAndLocalFactors, head 5d22a23 | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1337`, :2044, :2071, :2082, :2141, :2239, :2250, :2263, :2338, :2358, :2370; all named local/global factors, genericity, poles, niceness and data sections. The record alone carries no analytic claim. |
| ZerosOfLFunctions, head cce2e04; LFunctions, head affb2d0 | `TauCetiRoadmap/ZerosOfLFunctions/README.md:475`, :506, :515, :672, :710; Gamma asymptotics and continued finite-function strip bound. `TauCetiRoadmap/LFunctions/README.md:322` supplies the record and separate predicates. |
| DeligneWeightsAndPurity, open new head | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2618`, §7.12; :3595, DWP.10. Pure-image compact/ordinary comparison has the right weight direction; the additive-character sheaf remains the stated gap. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:175`, :457, :567, :676, F.4 adic realization, :1179, :1200, :907, :940, :1108; F.0–F.6,F.10.1–F.10.2b, with finite-type/coefficient conditions and geometric Frobenius. |
| ArithmeticDirichletSeries, main; AnalyticNumberTheoryPartI, head 4ba2e21 | `Completed/ArithmeticDirichletSeries/README.md`, Layer6; `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:2947`, §3.26. Inclusive Abel summation and the positive-integer divisor bound supply exactly the two moment estimates. |

The seven gap sentences in README match the `design/plan.json` top-level gaps exactly, including supplier and section. No gap has supplier `none`. Each specifies one missing comparison or family with the properties its consumers use; none asks this package to reconstruct the supplier's general theory.

| Gap slug | Minimal missing export and consistency test |
|---|---|
| form-rayleigh-core | Operator-domain form core and the three Rayleigh infima on a nonzero reducing complement. For `diag(0,2)` and constants removed, all three infima are2; the zero complement is excluded. UO-D06 does not already state this full export. |
| all-level-spectral-realization | Principal-level adelic Casimir decomposition including the finite cusp spectrum and continuous multiplicities. N=1 gives one component/channel; N=2 gives one component and three channels. No quotient Friedrichs construction is requested. |
| principal-level-classical-constituents | Isometric all-level extension of the existing classical comparison, with components, finite-group action and operator/cusp compatibilities. N=5 gives four components; restricting determinant characters to the identity component gives constants. |
| all-prime-self-pair-positivity | Positivity and boundary hypotheses for the full finite self-pair needed by Wiener–Ikehara. Ramified rank-one self-pair factor `(1−p⁻ˢ)⁻¹` retains coefficient1, so deleting bad factors would change the requested object. |
| self-pair-local-character-transport | Exact all-place character transport plus the primitive unramified-prime formula. m=2 gives Gauss power4 and conductor exponent4; away from q the coefficient multiplier is χ(p)ᵃ. |
| finite-rs-polynomial-strips | Bridge from `rsDatum` to the existing LFunctions record satisfying ZerosOfLFunctions' hypotheses. The completion acquires conductor factor `(fqᵈ)^(s/2)` in that record; its unit root number has norm1. The clearing polynomial is1 because the polar divisor is empty. |
| additive-character-sheaf-weight | Artin–Schreier sheaf with specified geometric trace, weight and phase-addition law. Over F₂, the value at1 is−1; over F₄ the trace of1 is0 and the value is1. These distinguish the trace-extension convention. |

The prescribed dependency check returned, verbatim:

    depcheck: 48 roadmaps, 535 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. Relevant merge-order positions are AFRG80, DWP95, AL96, AS98, ANT-I99 and this package107. Main roadmaps and the permitted open new-folder suppliers supply the other inputs.

### Duplication and ownership by object

Ran `roadmaps list`, object-oriented `roadmaps grep` searches and `roadmaps show` at the indexed heads, plus searches of the pinned libraries and local board packages. Search objects included Kloosterman sums/sheaves, quotient Friedrichs operators, essential self-adjointness, Rayleigh infima, the 21/100 bound, Mellin cutoffs, prime twists, Gamma quotients, Stirling and Phragmén–Lindelöf. The supplied board index was read first. Its five package READMEs and fifteen design READMEs were obtained at their listed heads; the latter heads have a `design` directory rather than a root package README. None introduces a competing owner for the constructions reviewed here.

- The quotient measure is an adapter to the effective orbit space, not a replacement for the existing invariant measure/covolume. The mean-zero restriction and clipping are specific to the quotient operator. The scalar Γ₀(N) operator remains at AS§1.16a, with an explicit agreement theorem here.
- The LFunctions record, ZerosOfLFunctions growth theory, AL local/global factors and GL₂ adjoint lift are imported. The two cutoff kernels and the even prime-twist moment are new specializations. EffectiveClassNumbers' Dirichlet/elliptic approximate equations have different carriers and do not own this all-rank self-pair identity.
- AS§1.16 already has the two-variable classical sum `S(m,n;c)` over composite integer moduli. The all-rank all-finite-field product-fibre object here is a different generalization; at k=2 over F₃ it specializes to `S(1,r;3)=−1,2` for r=1,2, consistent with the earlier convention.
- The scalar all-rank Kloosterman object moves earlier to this package. PadicDifferentialEquationsAndRigidCohomology RD.6.95/RD.6.97 is at merge position139; KloostermanMomentsAndPotentialAutomorphy and KloostermanSheavesAndBesselIsocrystals are at256 and257. Their rigid/moment/Bessel constructions remain downstream; they should consume this scalar/sheaf normalization. No upward Needs citation was added. Their declarations use different namespaces, so none duplicates one of this acceptance file's four fully qualified names.
- `packages/AutomorphicSpectralTheoryPartII/design/README.md:39` explicitly assigns the congruence gap to CongruenceSpectralGap. Its Schwartz-multiplier extension is not a second plan for this end theorem.

## Not verifiable

- **lrs95 source text:** all theorem, equation and page locators remain uncertified. The manifest and brief settle this work as paywalled; it was not requested again. This affects source-text certification of the LRS-dependent rows, not the independently computed checks above.
- **The two reported lrs95 misprints:** the normalization before (3.6) and subtraction in (3.12) cannot be confirmed against the unavailable text. The proposed corrected formulas give respectively Mellin mass1 and the q=5,n=1 coefficient1, but that does not establish what the source printed. They are not newly registered as source issues here.
- The seven declared supplier exports are contracts for future work, not existing proved library declarations. Acceptance is conditional on exactly those seven gaps; their absence today is not counted as a finding.

## Source issues

- **Misprint** in teschl at Theorem 2.13, formula (2.60), printed p.72: the source says the defining pairing uses the unshifted form while the resulting operator subtracts the positive shift; it should be the shifted form-domain inner product, or the action should omit that subtraction; affects the proof.
- **Gap** in teschl at §4.3, inequality (4.31), printed p.118: the source says choosing the next eigenvector establishes a lower bound for an infimum; it should be a spectral lower bound on the entire orthogonal complement; affects the proof.

For the first issue, teschl line 2964–2974 with q=0 and γ=0 would give A=−I from the displayed formula instead of0; using the shifted pairing gives0. For the second, teschl line 5036–5040 provides one value Eₙ and therefore an upper bound on the infimum, not the asserted lower bound. The package states the correct representation and uses spectral restriction, so neither source defect is copied into its targets.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4e34392efa92413ea8f5127af7f7bf044b4843cc", "job": "REV-PKG-CongruenceSpectralGap~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
