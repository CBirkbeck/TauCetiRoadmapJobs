## H01 (CBirkbeck) — applied

Ramified self-pair positivity is now a local target in `TauCetiRoadmap/CongruenceSpectralGap/README.md:403`, replacing the unsupported supplier contract with the supercuspidal and square-integrable pair calculations, logarithmic sum of squares, exponentiation, b(1)=1 and positive-residue deduction. The formula was verified against rs96 line 3181, line 3254, line 3302 and line 3339; the Steinberg check gives 1+p⁻¹ and the ramified rank-one check retains (1−T)⁻¹.

## H02 (CBirkbeck) — applied

The local character and epsilon calculations now belong to `TauCetiRoadmap/CongruenceSpectralGap/README.md:416`: unramified transport includes ramified representations, while analytic principal-series epsilon multiplicativity and the rank-one Tate/Gauss factors produce τ(χ)^(m²)q^(−m²s). The m=2 multipliers are 1,a/b,b/a,1 with product one; AL.4's conditional ramified parameter comparison is not used (lrs95, Lemma 2.1, pp.392–394, remains uncertified as settled).

## H03 (CBirkbeck) — applied

The requested principal-level comparison is now the explicit local target §0.5a in `TauCetiRoadmap/CongruenceSpectralGap/README.md:257`: quotient integration, the positive Haar factor, onto L² completion, finite-action equivariance, dense-core Casimir comparison and equality of closed domains. AdelicAlgebraicGroups §§2.2 and 5.2 retain ownership of quotient integration and component geometry, and AutomorphicFormsOnReductiveGroups §§3.1 and 4.5 retain the smooth comparison and level-one Maass equivalence; the additional Hilbert/operator adapter is owned here.

## H04 (CBirkbeck) — applied

Principal-level cusp compactness is now proved in the local plan §0.5b, `TauCetiRoadmap/CongruenceSpectralGap/README.md:277`, using every cusp width, the tail bound (w/(2πR))² and local Rellich compactness. The widths 1 and 3 give constants 1/(4π²R²) and 9/(4π²R²), while frequency zero has positive mass and zero horizontal energy, so compactness cannot be inferred backwards from Γ₀(N)-invariants.

## H05 (CBirkbeck) — applied differently

The global additive-character sheaf is now owned and constructed here in `TauCetiRoadmap/CongruenceSpectralGap/README.md:646`, replacing the unsupported DeligneWeightsAndPurity contract: character descent from 1−Frobenius fixes the zero fibre, rank, extension-field geometric trace, phase addition and finite-order weight zero (katz-gkm line 2266, line 2279, line 2288 and line 2300). The trace at 1 over 𝔽₉ is ζ² when ψ(1)=ζ over 𝔽₃, while the inverse convention gives the wrong trace already over 𝔽₃; ArithmeticGaloisRepresentations §3.7 still supplies the local Swan calculation.

## H06 (CBirkbeck) — applied differently

The assertion that the rigid roadmap already consumes this scalar API has been replaced by a mathematical comparison in `TauCetiRoadmap/CongruenceSpectralGap/README.md:888`; the earlier ownership here is retained because PadicDifferentialEquationsAndRigidCohomology is later in the merge order, and no dependency on it is introduced. Synchronization remains unresolved outside the permitted edits: at head 5ea2fe1 its RD.6.95 and RD.6.97 still own `RD6.kloostermanSum` and `RD6.kloostermanSum_bound`, so the worker must coordinate replacing those scalar targets by the shared wrapper/comparison while leaving the rigid realization there.

## H07 (CBirkbeck) — applied

The raw definition changes from complex coefficients to arbitrary `[CommRing K]` in `TauCetiRoadmap/CongruenceSpectralGap/Suggested.lean:42`, with matching prose at `TauCetiRoadmap/CongruenceSpectralGap/README.md:616`; the norm estimate remains specialized to ℂ. Section 4.2a at line 634 adds the inverse product-fibre/eliminated-variable bijections and sqrt(|F|)^n=|F|^(n/2), including n=0, coefficient reduction ℤ→ℤ/2ℤ and the zero ring.

## H08 (CBirkbeck) — applied differently

The dependency contract at `TauCetiRoadmap/CongruenceSpectralGap/README.md:74` now records VariationalMethods V2.3 and UnboundedOperators UO-A01–UO-A03 before UO-D06, with SelfAdjointSpectralTheory's graph, resolvent and SA-E01 inputs; V5.1 is a consumer of that prefix. The description's dependency accounting needs the same correction, but pull-request text is outside the permitted edits; this was verified against UnboundedOperators head 5e40c73 UO-D06 and VariationalMethods head 515847c V2.3/V5.1.

## H09 (CBirkbeck) — applied

The rational-adic Swan route at `TauCetiRoadmap/CongruenceSpectralGap/README.md:674` now includes normal excellent-trait pullbacks and étale-local lattices, reduction preserving wild breaks, rational realization and descent of the strict-local comparisons and proper direct images. The nodal-curve negative control has conductor zero but ℓ·ℓᵃO_E=ℓᵃ⁺¹O_E≠ℓᵃO_E, excluding a global-lattice assumption without narrowing the theorem (EtaleCohomologyFoundations F.2.3 and F.4.5–F.4.6; laumon-swan line 413, line 423 and line 432).

### Ownership and citation audit

The nine points split review finding 1 into H01–H02, finding 2 into H03–H04, finding 3 into H05, finding 4 into H06–H07, finding 5 into H08 and finding 6 into H09. There were no mathematical questions or suspicious instructions to answer separately.

Main was verified at 7922565e8b5d3420ff251821a1b3b042fabe96c8. The supplier heads were verified as AutomorphicLFunctionsAndLocalFactors 5d22a23, AutomorphicSpectralTheory c5cfb92, AutomorphicFormsOnReductiveGroups c00e220 and DeligneWeightsAndPurity 6c2402d, in addition to the heads cited above. The named 50 sibling roadmap checkouts, the board packages and the open-roadmap/main object search were inspected for the relevant constructions; the final citation resolution reports no unresolved roadmap citations or Lean names. Generic factors, spectral decomposition, component geometry, finite étale descent and local conductors remain with their existing owners. Local positivity, epsilon transport, quotient Hilbert/operator comparison, cusp compactness and the global additive-character specialization fill the demonstrated gaps here. The later FiniteFieldsAndCharacterSums design has an additive-character-sheaf target, so this needed construction moves earlier to this roadmap rather than making it a supplier. H06 records the scalar ownership move still needing synchronization; no fully qualified declaration of another roadmap was redeclared.

The checked library revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the content manifest. The native `LinearPMap` at `Mathlib/LinearAlgebra/LinearPMap.lean:41` has `domain : Submodule R E` and a semilinear map on that domain, without density or self-adjointness; `MeasureTheory.Lp` at `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89` is an almost-everywhere function subspace and supplies no quotient operator. The congruence predicate at `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163` is `∃ N ≠ 0, Gamma N ≤ Γ`; this excludes N=0 without imposing a separate positive-level structure. Pinned AddChar/Gauss APIs were checked at `Mathlib/NumberTheory/GaussSum.lean:72` and `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83`, Mellin inversion and all its hypotheses at `Mathlib/Analysis/MellinInversion.lean:92`, and the nonnegative-coefficient boundary hypotheses at `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`. Object searches found algebraic Casimir and Artin–Schreier field theory, without the native automorphic/adic carriers required by the newly explicit targets.

A single scratch module elaborated `#check @name` for every declaration in Suggested.lean: `hyperKloosterman`, `hyperKloosterman_bound`, `gauss_power_even_average_bound` and `congruence_eigenvalue_bound`. All four full signatures agree with the README; no standing hypotheses disappeared. The sole type change is the explicit coefficient carrier K and `[CommRing K]` on the raw definition. The prime, positive-rank, nontrivial-character, congruence, C², invariance, boundedness, nonconstancy and eigenfunction hypotheses all remain in the elaborated types. The new deep targets whose carriers are unavailable are identified in the module docstring rather than encoded by replacement predicates.

### Source bookkeeping outside the edit scope

The new rs96 text was read legally from the institutional manuscript, including a service OCR cross-check of its formulae; lrs95 remains settled as uncertified and was not requested again. The complete new manifest entry is below for inclusion in `packages/CongruenceSpectralGap/sources.toml`, which the two-file edit restriction leaves read-only; the existing source manifest has no rs96 entry yet. This is source registration still required of the worker, not an unavailable mathematical reference.

```toml
[[source]]
id = "rs96"
authors = "Zeev Rudnick and Peter Sarnak"
title = "Zeros of principal L-functions and random matrix theory"
year = 1996
locator_scheme = "section"
locator = "Appendix section 5.2, equations (5.4)–(5.14), Lemma 5.1, manuscript pp.52–55"
cited_for = ["2.0 all-ramified positivity"]
url = "https://empslocal.ex.ac.uk/people/staff/mrwatkin/zeta/rudnick-sarnak.pdf"
fetched_from = "https://empslocal.ex.ac.uk/people/staff/mrwatkin/zeta/rudnick-sarnak.pdf"
fetched_at = "2026-10-25T16:26:33Z"
sha256 = "393cd6ad3a61036070ed7b86113de5dd1bb033b47eec8998fb9597bb091c13c7"
licence_class = "institutional"
status = "certified"
accessed = "2026-10-25"
```

### Validation

Committed as 4aa2ff2a, `CongruenceSpectralGap: review repairs (local ownership, principal levels, generic coefficients and lattice descent)`. Only `TauCetiRoadmap/CongruenceSpectralGap/README.md` and `TauCetiRoadmap/CongruenceSpectralGap/Suggested.lean` changed; the worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.CongruenceSpectralGap.Suggested` exited 0, with the three expected theorem-`sorry` warnings at Suggested.lean lines 51, 62 and 78:

```text
Build completed successfully (8976 jobs).
```

The final gate exited 0:

```text
gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required movable dependency check exited 0, with no UPWARD or CYCLE line:

```text
depcheck: 52 roadmaps, 592 edges, 0 problem(s)
```

## Adversarial mathematics record

Each row records a statement or a connected identity and its explicit witnesses; the numerical models test normalizations and necessary hypotheses, rather than proving the general theorem. Analytic statements with infinite limiting parameters are tested at their boundary exponents, and sheaf statements at their ranks, conductors and traces. Only the local repairs are new targets; the other rows audit their compatibility with the retained roadmap.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Congruence/effective-action convention | N=1,2,0 | Effective areas π/3, 2π; N=0 has no nonzero-level witness | Central kernel cannot double the measure | Retained |
| Positive differential expression | 1, y², y^(1/2) | Δ1=0; Δy²=−2y²; Δy^(1/2)=(1/4)y^(1/2) | Div-grad has opposite sign | Retained in bridge witness |
| Complex energy convention | u, iu, 2iu | q[iu]=q[u]; q[2iu]=4q[u], norms squared scale by 1,4 | Hermitian convention consistent | Retained |
| Constant orthogonality convention | 1, i | Integrals A, iA with A>0, neither 0 | Whole complex constant line excluded | Retained |
| Gamma parameters | r=1/5 | Self-pair shifts 2/5,0,0,−2/5; adjoint shifts 2/5,0,−2/5 | Distinguishes standard and pair ranks | Retained |
| Conductors and epsilon normalization | f=4, d=4, s=1/2 | abs(τπ)=2; normalized factor norm 2q²/(2q²)=1 | A unit τπ would instead give 1/2 | Retained |
| Positive additive character | q=3 | ψ(1)=−1/2+i√3/2; inverse gives −1/2−i√3/2; τ(1)=−1 | Sign fixed independently of even projection | Retained/AS witness |
| Multiplicative cutoff normalization | Indicator of [1,2] | ∫φdy=1, ∫φdy/y=log 2≠1 | Ordinary unit mass is insufficient | Retained |
| §0.1 quotient measure definition/independence | Level 1 and level 2 | π/3 and 6(π/3)=2π; zero measure gives 0 | Positive covolume and effective index required | Retained |
| §0.2 nonnegative operator and kernel iff | Constant 1; mean-zero eigenvector at 21/100 | Δ1=0, q[1]=0; Δu=(21/100)u, q[u]=21/100 for norm 1 | Both kernel directions compatible | Retained |
| §0.2 maximal domain and invariants | Constant; torsion-free cover; identity deck group | Constant expression 0∈L²; identity average u↦u; projection squared P²=P | Domain equality not a choice of boundary condition | Retained |
| §0.3 integral kernel/closed complement | 1,i, bump v minus mean | ∫1=A, ∫i=iA, ∫(v−A⁻¹∫v)=0 | Zero map would incorrectly include constants | Retained |
| §0.3 reducing operator and projections | diag(0,21/100,1/4), P=diag(0,1,1) | PΔ=ΔP=diag(0,21/100,1/4) | Actual domain/invariance compatible | Retained |
| §0.4 nonempty Rayleigh set and lower bound | Model u=e₂ and 2ie₂ | Quotients (21/100)/1=(21/25)/4=21/100≥0 | Norm square essential | Retained |
| §0.4 operator/form/spectral infima | Same model; include e₁ versus remove e₁ | All three reduced infima 21/100; unreduced infimum 0 | Constant complement essential | Local spectral-truncation proof |
| §0.4 truncation domain/core | Model u=e₂+e₃, R=21/100 then R=1 | Truncated u=e₂ then u; discarded form-norm squared 5/4 then 0 | Operator vectors converge in form norm | Added route |
| §0.5 clipped-bottom definition | S empty, {21/100}, {1/3} | inf({1/4}∪S)=1/4,21/100,1/4 | Empty/above-threshold sets distinguished | Retained |
| §0.5 upper/lower comparison | S={21/100}, c=1/5 | 1/5≤21/100≤1/4 | Both comparison directions valid | Retained |
| §0.5a component measures/isometry | N=1, c₁=4, function 1 | Source norm²=4π/3; image 2 has norm²=4π/3; bare restriction gives π/3 | Haar factor cannot be omitted | Added |
| §0.5a onto completion/finite action | N=3, components 1,2; determinant 2 | (u,0)↦(0,u), each norm²=norm²(u); missing component has lost dimension 1 | Full component sum required | Added |
| §0.5a Casimir closure/eigenfunction comparison | Local 1,y²; eigenvalue λ | Casimir and differential operator give 0,−2y²; scalar isometry gives λsqrt(c)u on both sides | Scaling leaves eigenvalue unchanged | Added |
| §0.5b cusp tail bound | Widths 1,3; Fourier n=1 | Squared frequencies 4π²,4π²/9; tail constants 1/(4π²R²),9/(4π²R²) | Principal widths retained | Added |
| §0.5b compactness and bounded spectral counts | Nonzero mode; zero mode; Γ(2) | Frequencies ±1 contribute confining (2π/w)²; n=0 gives 0 with positive tail; cusp count 3 | Constant term must vanish at every cusp | Added |
| §0.6 residual/constants and continuous threshold | Levels 1,2; t=0,1 | Constant projections (3/π)(π/3)=1, (1/(2π))(2π)=1; continuous values 1/4,5/4 | One versus three channels retained | Local bridge/compactness inputs |
| §0.6 finite-invariant descent | S₃ regular representation, C₂ subgroup, full S₃ | Dimensions 6,3,1 | Nonabelian intermediate invariants differ | Retained |
| §0.7 Rayleigh/clipping equality | No small eigenvalue; one at 21/100; only threshold | Both infima 1/4,21/100,1/4 | Zero excluded from small set | Retained |
| §1.1 exceptional dictionary/parity | r=0,1/5,1/2; ε=0,1 | λ=1/4,21/100,0; both parities give 21/100 | Strict endpoints and SO(2) distinction valid | Bridge reference repaired |
| §1.2 unitary monomial temperance | Split characters abs(.)^(it); real shift σ=1,0 | Real exponents 0,0; central absolute exponents 2,0 | Nonzero real complementary exponents excluded | Retained |
| §1.3 adjoint/self-twist branch | r=1/5, common sign ε=1 | Character ratios yield 2/5,0,−2/5; common sign cancels to +1 | O(3)-spherical adjoint valid for both GL₂ parities | Retained |
| §2.0 supercuspidal self-pair factor | e=1,2 | (1−T)⁻¹ has first coefficients 1,1,1; (1−T²)⁻¹ has 1,0,1 | Nonnegative does not mean strictly positive | Added |
| §2.0 square-integrable block factor | St(2), p=2 | Product ((1−T)(1−T/2))⁻¹ has coefficients 1,3/2,7/4 | Ramified shorter-block shift essential | Added |
| §2.0 logarithmic sum of squares | St(2), p=2, a=1,2 | (1/a)Σₕp^(ah) abs(p^(−a))² gives 3/2,5/8; log of product gives 3/2,5/8 | Shift and 1/a correct | Added |
| §2.0 exponentiation positivity/constant coefficient | (1−T)⁻¹ | log coefficients 1,1/2; exponential coefficients 1,1,1/2+1/2=1 | No missing b(1) normalization | Added |
| §2.0 positivity at ramified rank one | Ramified unitary θ paired with θ⁻¹ | Factor coefficients 1,1,1; deleting factor gives 1,0,0 | All primes required | Added |
| §2.0 positive residue | ζ self-pair rank-one model, real s→1+ | (s−1)ζ(s)→1>0; a nonnegative series cannot have negative real limit | Simple nonzero pole plus positivity gives residue>0 | Added |
| §2.0 unramified L/epsilon transport | η(p)=−1, factor (1−T)⁻¹, a=2 | New coefficients 1,−1,1; epsilon multiplier (−1)²=1 | Ramified factor retained and twisted | Added |
| §2.0 epsilon multiplicativity and cancellation | m=2, roots a,b≠0 | (1)(a/b)(b/a)(1)=1; τ⁴q^(−4s); norm at 1/2=q²/q²=1 | Rank-squared exponent fixed | Added |
| §2.1 full twisted equation | m=2; q good, other p ramified | d=4, conductor fq⁴; at p coefficient multiplier χ(p)^a | Twisting restriction never deletes other local factors | Local derivation |
| §2.1 entire analytic-data/strip adapter | Norm twist; ramified conductor-q twist | Norm twist ramification at q=0; primitive χ has conductor exponent 1 there; normalized root norm 1 | Pole case excluded by local ramification | Local adapter |
| §2.1 Wiener–Ikehara boundary | μ=±1/5, Re(s)=1 | Smallest gamma argument real part 1−2/5=3/5>0; b(1)=1 | Gamma poles cannot introduce boundary singularities | Positivity input repaired |
| §2.2 forced gamma zero | β₀=2/5 and β₀=0 | At 2/5 diagonal argument 0 has pole order 1; completion order≥0 forces finite L order≥1; at 0 strict hypothesis fails | Germs rather than total values used | Retained |
| §2.2 totalized gamma convention | s=0 | Γℝ(0)=0 but punctured sΓℝ(s)→2 | Pointwise zero cannot replace pole order −1 | Retained |
| §3.1 tail definition and Mellin division | Normalized support [1,2], x=1/2,3; σ=2 | Tail values 1,0; inner ∫₀ʸx^(s−1)dx=y^s/s, s=2 gives y²/2 | Multiplicative inversion normalization consistent | Retained |
| §3.1 dilation and low/high support laws | c=2; x=1,6 | F₁(φ(. /2),1)=F₁(φ,1/2)=1; F₁(...,6)=0 | No factor c appears | Retained |
| §3.2 dual definition and zero ratio | G=0,1; reflected support [1/4,1/3] | G=0 gives 0; G=1 at x=1/5,2 gives 1,0 | Reflection is essential | Retained |
| §3.2 β−s convention | G(w)=w, β=1; choose φ(1/x)=v | Both sides F₁−v; opposite sign gives F₁+v, difference 2v | Sign fixed by nonzero v | Retained |
| §3.3 pole/log estimates | σ+β₀=1, d=4 | Pole order≤5 yields log degree≤4; x^ε log⁴x→0 | Logs allowed by x^(−ε) slack | Retained |
| §3.3 dual integrability | σ=1/2, β₀=2/5, ε′=1/10 | Two exponents −1/2,−1/2, integrals both 2 | Strict ε′<3/5 prevents divergence | Retained |
| §3.4 exact two-kernel normalization | β=1/2; Y=2,4 | Both n powers n^(−1/2); dual argument doubles when Y doubles | Conductor and Y orientation consistent | Adapter reference repaired |
| §3.4 normalization excludes zero cutoff | φ=0 | Mellin mass 0, both sums 0; required mass 1 fails | No false identity with zero cutoff | Retained |
| §4.1 finite prime-twist sum | L=1, fπ=1, Q=0,1,2,3 | S=0,0,0,1; with fπ=5,Q=3, S=0 | Empty families and bad conductor excluded correctly | Retained |
| §4.1 congruence of families and vanishing | Selected values 0; same family twice | Sum 0=0; difference sum 0 | These elementary laws remain prose only | Retained |
| §4.2 even nonprincipal projection | q=3,5, a=0,±1,±2 | q3 values all 0; q5 gives 0,1,−1 | Principal subtraction at ±1 retained | Retained |
| §4.2a coefficient-generic product-fibre definition | k=0,1; F₂, F₃ | Rank 0 values 1_K,0_K; rank1 ψ(r); F₂ ranks1,2 give −1,+1 | Total rank0 separated from bound | Generic K |
| §4.2a coefficient change | F₃,k=2, trivial character; ℤ→ℤ/2; zero ring | Integer tuple count 2↦0 mod2; zero-ring sums 0=1 | No nontriviality needed for raw sum | Added |
| §4.2a field/character scaling | F₃,k=2,a=2 | a²=1, hence r unchanged; direct sums remain −1 at 1 and 2 at −1 | Product argument scales by a^k | Retained generically |
| §4.2a trivial-character count | F₅,k=3 | Count 4²=16; nontrivial estimate would give 3·5=15 | ψ≠1 essential for estimate | Retained |
| §4.2a eliminated-variable bijection | n=0,1; F₃,r=1,−1 | n0 both ψ(r); n1 both −1,2; appended coordinate r/product restores product r | Both composites inverse, no zero division | Added |
| §4.2a real-power comparison | q=3,n=0,1,2 | sqrt(3)^n=1,√3,3=q^(n/2) | q≥2 makes all real powers legitimate | Added |
| §4.2b global additive-character construction | F₃,x=0,1, inverse character | Traces 1,ζ versus inverse ζ² at 1 | Zero unit and geometric sign fixed | Added local owner |
| §4.2b extension-field trace comparison | F₉/F₃,x=1 | Tr(1)=2; trace ζ² on both descriptions, not ζ | Extension trace retained | Added |
| §4.2b tensor/addition/coherence | F₃ phases1,1; zero phase | ζζ=ζ²=ψ(2); 1ζ=ζ | Addition and unit determine comparisons | Added |
| §4.2b weight-zero/dual/local breaks | F₂ nontrivial ψ and ψ²; trivial ψ | Norms1; Sw∞(ψ)=1, Sw∞(ψ²)=0; trivial trace1, Sw0 | Trivial character not assigned break1 | Added |
| §4.2b curve Euler–Poincaré proper/open | Constant rank r on P¹,Gₘ | χ_c=2r and r(2−2)=0 | Boundary term essential | Retained |
| §4.2b tame and wild curve terms | Kummer on Gₘ; Lψ(x),Lψ(x²),p odd | χ_c=0; 1−1=0 and 1−2=−1 | Euler characteristic does not imply concentration | Retained |
| §4.2b residue-degree weighting | F₃, quadratic point x²+1, simple poles | Closed-point weight2·1=2; two geometric points1+1=2; χ_c=−2 | Unweighted closed-point sum gives wrong −1 | Retained |
| §4.2b geometric connectedness/char0 | P¹ over Fq² viewed over Fq; Gₘ char0 | χ=4 versus formula2 if geom connectedness dropped; char0 Gₘ gives0 | Standing hypotheses necessary | Retained |
| §4.2b conductor definition/ULA | Constant rank1, boundary one section or empty | a=1 or0; P¹ cohomology ranks1,0,1; A¹ ranks0,0,1 | Rank term and proper conclusion consistent | Retained |
| §4.2b local-lattice trait reduction | Nodal multiplier ℓ; its normal trait pullbacks | ℓ·ℓᵃO_E=ℓᵃ⁺¹O_E≠ℓᵃO_E; fibre conductor0=0 | No global lattice on original U required | Added route/negative control |
| §4.2b finite reduction of wild breaks | AS break1 over p=2 with odd ℓ; trivial line | Sw1→1 after reduction; trivial Sw0→0 | Prime-to-ℓ wild image preserves multiplicities | Explicit local reduction |
| §4.2b ULA conductor failure | Lψ(tx), generic t then0 | a=2 then1; Hc² dimensions0 then1 | Constant-conductor hypothesis cannot be dropped | Retained |
| §4.2b collision rank correction | D:x²=t, odd characteristic | Sw sum0 both fibres, #points2→1, a2→1, dimHc¹1→0 | Swan sum alone insufficient at collisions | Retained |
| §4.2b properness | Empty family at t0, A¹ at t≠0 | a=0 both; R²f! ranks0,1 | ULA alone does not give nonproper direct-image lissity | Retained |
| §4.2b convolution definition/concentration | Rank1,rank1 and rank2,rank1 | Fibre Swans1,1 and2,1; χ=−2,−3; ranks2,3 | Hc⁰=Hc²=0 gives degree1 only | Retained |
| §4.2b general convolution rank/Swan | Kl₂,Kl₃ | Rank=2·1+3·1=5 versus product6; output Swan1·1=1 | Rank product is wrong | Retained |
| §4.2b family Swan constancy | Kl₁⊗Lψ(t/x); Kl₂⊗Lψ(t/x) | Swan sums2,3; conductor sums4,7=3k+1 | Constant on t≠0, including p2 | Retained with local lattice proof |
| §4.2b convolution zero-boundary descent | p=2, coefficient ℓ3; p3, coefficient ℓ2 | Finite p-group unipotent image in charℓ has order1 | No invertibility of tame Kummer degree presumed | Retained |
| §4.2b trace/purity/extension realization | k=1,2; F₃,r=1,−1 | k1 sign+1; k2 raw−1,2 and sheaf+1,−2; eigenvalue weights0,1 | Degree sign never inserted into raw sum | AS source repaired |
| §4.2b all-field numerical bound | F₂,k1,2; F₃,k2 | 1≤1; 1≤2√2; 1,2≤2√3 | p dividing rank and p2 admitted | Retained |
| §4.2b excluded rank0/trivial character | F₂,k0; F₅,k3,ψ1 | 1>0;16>15 | Both positive-rank and nontriviality binders necessary | Retained |
| §4.3 Gauss-power exact identity | q3,k1,2,r1 | k1 RHS−1−(−1)=0; k2 RHS(−1+2)−1=0; LHS empty0 | Correction sign fixed | Retained |
| §4.3 norm estimate/headline | q5,k2,r1,2 | LHS5,5≤8√5+1 | Conjugation and ±r fibres consistent | Retained |
| §4.3 rank0 negative control | q7,k0,r1 | Identity2=3(1+0)−1; proposed bound1<2 | Rank condition is retained in Lean | Retained |
| §4.4 prime moment error exponents | m2,σ9/10; m3,σ4/5,9/10 | 5/4,2,3/2 | Boundary error2 cannot be absorbed | Retained |
| §4.4 dyadic main constant | Interval Q,2Q | Half integral of t has coefficient (1/2)(4−1)/2=3/4 | Main coefficient fixed | Retained |
| §4.4 off-diagonal divisor counting | n=1,2 | n−1=0 has every prime divisor; n=2 gives τ1+τ3=1+2=3 | Separate n1 before divisor bound | Retained |
| §4.5 nonvanishing region | m2,3; β boundary and9/10 | Boundaries3/5,4/5; exponent at boundary2, at m3 β9/10 gives3/2 | Strictness necessary | Retained |
| §4.5 complex extraction | Terms1+i,−1 | Sum i≠0 | Existence needs no positivity of twisted values | Retained |
| §5.1 LRS parameter bound | m2,3; extremal β₀ | Bounds3/10,2/5; β₀ thresholds3/5,4/5 | Weak endpoint follows from strict contradiction | Retained |
| §5.2 exceptional arithmetic | r=0,1/5,3/10,−1 | λ=1/4,21/100,4/25,−3/4; last two violate needed hypotheses/sign | r≥0 and 2r≤2/5 retained | Retained |
| §5.3 clipped congruence headline | Empty small spectrum; extremal r1/5 | λ′=1/4≥21/100; λ=21/100 | Threshold convention consistent | Retained |
| §5.3 eigenfunction signature | u=1; Eisenstein E(z,3/2) | λ=0 fails nonconstancy; λ=−3/4 fails boundedness | Neither necessary hypothesis dropped | Full signature checked |
| §5.3 mean-zero/nonzero passage | λ≠0 eigenfunction; λ0 case | λ∫u=0 implies integral0; λ0 implies constant | Both branches lead to valid use of spectral theorem | Retained |
| §5.4 form/operator Rayleigh inequality | u0; unit extremal u;2iu; constant1 | 0=0;21/100=21/100;21/25=21/25; constant0<(21/100)A | No division at zero; mean-zero required | Local truncation input |
| §5.5 curvature/measure/operator scaling | κ1,4,0,−1 | Measures A,A/4; Δ,4Δ; thresholds1/4,1; κ0,−1 not positive metrics | Positivity restriction essential | Retained |
| §5.5 normalized Rayleigh scaling | norm²1,energy21/100 then κ4 | New norm²1/4, energy21/100, quotient21/25 | Scaling measure alone would fail operator identity | Retained |
| Worked examples/numerical comparisons | Selberg/LRS/threshold; consumer arithmetic | 3/16=75/400<84/400=21/100<100/400; improvement9/400; (21/100)(π/3)/(8π)=7/800 | No conformal-area conclusion asserted | Retained |
