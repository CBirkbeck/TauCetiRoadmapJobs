# Mathematical repair report

Findings F01–F05 below belong to review a; the final F02 belongs to review b. The shared Schur finding (a/F04, b/F01) is settled once. All six distinct findings hold; none requires a supplier gap or a merge-order change. Sound changes from the saved attempt are retained.

## F01 (P2) — applied

Independent ring extraction proofs → comparisons with PadicMeasuresIwasawaAlgebras §2.9 and transport of its laws. Added `qSeriesDecimation_eq_powerSeriesCartier` and `qSeriesShiftedExtraction_eq_powerSeriesCartier` for every natural shift. Kept semirings, integral eta estimates and the Laurent comparison. The supplier’s `cartier_expand_mul` requires a<t; the new a=t=1 Check witnesses this boundary. Evidence: `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` §2.9.

## F02 (P2) — applied

Unspecified incomplete-gamma foundation → pinned Tau Ceti contracts and `maassFourierKernel_eq_incompleteGamma` for k<1, w<0. Subtracting the lower integral from the complete Euler integral proves the comparison. Kept every real weight, the contour branch and ODE targets; added the shape-zero negative control. Evidence: BruinierFunke2003 line 404; pinned `lowerIncompleteGamma_eq_integral`, `hasDerivAt_lowerIncompleteGamma`, `tendsto_lowerIncompleteGamma_atTop`.

## F03 (P3) — applied

Admitted `laplacianZeroModes` → a proof from the real imaginary-coordinate linear map and the derivative of its square. Added the second Laplacian example, including Δ₀(y²)(i)=−2≠0, using only this proved theorem. Updated the README Check. Evidence: BruinierFunke2003 line 375; the zero operator fails the new example.

## F04 (P3) — applied

The proof’s lowercase d_n → D_n, settling a/F04 and b/F01 together. Warnaar2001 line 37 defines e_n and d_n with largest part at most n−2; Warnaar2001 line 48 gives d₂=1. The roadmap has D_n=e_(n+1), E_n=d_(n+2), so D₂=1+Q. The identities, recurrences and boundary Checks are unchanged.

## F05 (P3) — applied

Admitted `oddThetaPair` → a proof evaluating native summands 0 and −1, splitting exponential sums and using `Complex.exp_neg_pi_mul_I`. The full two-term equality and unrestricted complex parameters remain unchanged. Evidence: Zwegers2002 line 336; `jacobiTheta₂_term` in `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`.

## F02 (P3) — applied

Eight elementary admissions → proofs of `qPochhammerFin_zero`, `qPochhammerFin_succ`, `qPochhammerFin_map`, `qPochhammer_concat`, `partitionSeries_coeff`, `partitionResidueCounts_sum`, `qSeriesDecimation_comp`, `qSeriesDecimation_add_smul`. Finite-product rewrites, `Nat.Partition.coeff_genFun`, fiberwise cardinality and power-series extensionality suffice. Every signature and README law is retained; the semiring binders and `[NeZero t]` survive elaboration.

## Verification outcomes

- Required `lake env lean` elaboration of the complete `packages/QSeriesPartitionsAndMockModularForms/Suggested.lean`, launched from the pinned content checkout: **exit 0**. All 29 examples and the eight elementary proofs elaborate under default settings. The complete output consists of 40 warnings that roadmap theorem targets use `sorry`; there are no errors, linter warnings or deprecation warnings.
- The previous attempt failed on the unavailable compiled Tau Ceti conjugation import. Pinned Mathlib already supplies `Nat.Partition.conjugate` in `Mathlib/Combinatorics/Enumerative/Partition/YoungDiagram.lean:76`. The rank-sign statement now uses this native transpose, with matching ownership and Needs lines in the README. The file needs only `import Mathlib`; no dependency build or checkout modification was needed.
- A complete scratch copy with explicit `#check @...` inspections: **exit 0**. Inspected `partitionRank_conjugate`, `laplacianZeroModes`, `oddThetaPair`, `qSeriesDecimation_pullout`, `baileyLemma_transform`, `partitionResidueCounts_sum` and `qPochhammerFin_map`. All necessary coefficient, modulus and unit-domain binders remain explicit. There is no ambient variable block.
- Required dependency check: **exit 0**, exact output:

```text
depcheck: 7 roadmaps, 45 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- `git diff --check`: **exit 0**. All 76 named Lean declarations occur in the README. The file has 16 real-bodied definitions, 60 theorems and 29 proved examples, no admitted examples or data, and no forbidden options. The source manifest parses with 19 records. All three supplier-gap slugs match the README; `design/plan.json`, `metadata.toml` and `sources.toml` are unchanged.

## Adversarial mathematics pass

This table records boundary substitutions and interface checks by statement family, including the unchanged theorem and API families. These tests do not prove the admitted general theorems.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 finite products, §1.5 concatenation/inversion and scalar transport | n,m=0,1,2; q=0,1; unit a,q; zero ring | P₂=1−a−aq+a²q; nonempty zero-base value 1−a; inverse-base n=2 has factor a²q; empty product 1=0 in the zero ring | Four elementary laws proved |
| §1.2 integer products | n=0,−1; a=3,q=2; a=q=2 over ℚ | Values 1,−2; the latter reciprocal factor is forbidden | None |
| §1.3 regular quotients and step law | j=0,−1; (a,b,q)=(3,1,2),(3,2,2) | Values 1,−1,0; continuation permits the stopped negative tail without assigning an individual pole a value | None |
| §1.4 formal products, units, coefficient stability and scalar change | Degrees 0,1,2; a=0,1; 𝔽₂; zero ring; N=d | Tail has constant 1; full product at a=1 vanishes; tail over 𝔽₂ starts 1+X+X²; later factors cannot change degree d | Existing coefficient proof scripts repaired |
| §1.6 analytic prefix limits and tail comparison | q=0; a=q⁻¹ at prefix length 1 | Values 1−a; zero tail prevents division even though the product identity remains meaningful | None |
| §§2.1–2.3 normalized phi/psi, shifts, convergence and inversion | Empty lists; A=[1]; B=[1]; q=0,2; A=[−1/2] or [1/2]; negative tail A=[],B=[0] | First phi coefficient −1/(1−q); denominator guard necessary; radius 4 versus terminating 1−z/2; negative terms start −q/z and ratio −q²/z | None |
| §2.4 binomial, Euler and formal identities | q=0; a=0; q=1/2 through z²; large base a=0 | Rational zero-base binomial; entire Euler 1+z; inverse Euler coefficients 1,2,8/3; large-base a=0 does not require a⁻¹ | None |
| §2.5 1ψ1 and coefficient recurrence | j=0,−1; a=2,q=z=1/2,b=0 or q; a=b | Terms 1,−2/3,0; a=b has empty annulus; hpos and hneg exclude actual denominator zeros | None |
| §§2.6–2.7 Bailey relation, finite transform, summations and limits | Zero pair; unit pair; n=0,1; a=q=0; δ₁ at a=1,q=1/2; ρ₁=aq≠0 | β₀=α₀; δ₁ relation requires 8/3 instead of 1; zero-base transform preserves the unit pair; transformed denominator guard excludes ρ₁=aq | None |
| §3.1 Gaussian polynomials | (n,k)=(0,0),(0,−1),(2,1),(3,1); Q=1,−1; 𝔽₂ | Boundary values 1,0; G(2,1)=1+Q; quotient-free definition permits roots of unity | None |
| §3.2 finite Schur sums and recurrences | n=0,1,2; source d₂ | D₀=D₁=E₀=E₁=1; D₂=1+Q, E₂=1+Q²; d₂=1 | Shared notation repair |
| §3.3 gap/residue predicates, both Rogers–Ramanujan counting and product identities | Empty partition; (4),(3,1),(2,2); q=0; coefficients through degree 4 | Singleton/boundary gap admitted; repeated part rejected; residue and gap predicates differ; both analytic constant values 1 | Both gap example scripts repaired |
| §3.4 quintuple product and theta addition | n=0,±1; z=1; z=0 excluded | Constant 1+z; first terms 1+z−q(z³+z⁻²); at z=1 begin 2−2q−2q² | None |
| §3.5 partition adapters and coefficient transport | n=0,1,2,4; semiring coefficients | Counts 1,1,2,5; coefficient extraction is exactly the native weighted specialization | Coefficient law proved |
| §§4.1–4.3 rank, crank, vector partitions and generating functions | ∅,(1),(3,2,1,1),(3,3),(2,2,2); vector size 1 | Empty values zero; singleton crank −1; strict-filter witness −1; conjugate ranks 1 and −1; vector coefficient z+z⁻¹−1 | None |
| §4.4 residue fibers, finite filter and scalar domains | t=1,2; n=1; constant-zero statistic | Partition total recovered; rank class 0, crank class 1; zero statistic misses class 1; division by t is confined to its invertible coefficient domain | Fiber sum proved; modulo-two proof script repaired |
| §§4.4a–4.5 dissections and equidistribution | Sizes 1,4,5,6; theta-addition q=0 | Nonzero size-one vector coefficient; each base crank class has size 1; rank class 1 modulo 11 at size 6 contains (6),(3,3) | None |
| §4.6 offsets, uniqueness and reduction | M=0,1,2,3,5,7,11,13,25,65,343 | Zero/bad moduli rejected; δ(1)=0, δ(65)=19 reduces to 6 modulo 13; δ(343)=243 | None |
| §4.7 extraction, composition, linearity, pullout and both Cartier comparisons | t=0,1,2; X,X²; a=0,1,t; ℕ,ℤ and fields | U₂X=0, U₂X²=X; U₀(1) has every coefficient 1; unrestricted power-series shifts differ from Laurent preservation and residue pullout | Ring owner/comparisons added; semiring laws proved; dependent-if proof repaired |
| §§4.8–4.9 eta recurrences, modular equations, integral modules and congruences | ℓ=5,7,11; r=1,2; first modular-equation corrections | Offsets (4,24),(5,47),(6,116); leading L₁ for 11 is 11X; five/seven equations cancel their stated first correction terms; first seven-step does not put Ω₇(B⁻¹)/7 in O₇ | None |
| §§5.1–5.2 theta/eta normalizations and cocycles | Native theta indices 0,−1; z=0; T; S at τ=i; central root i | Odd pair has difference sign and factor i; eta S-factor at i is 1, with multiplier exp(−πi/4); central eta multiplier −i | Finite theta proof supplied |
| §5.3 E, β, Wirtinger and xi | x=t=0; constants; y,τ,log y,iy | E(0)=0, β(0)=1, E′(0)=2; ∂bar y=i/2, ∂bar τ=0; ξ₀y=1, ξ₁log y=1, ξ₀(iy)=−i | None |
| §§5.4–5.7 Mordell, R, μ and completion laws | z=±1/2,τ=i; ν=±1/2,u=0; u-shift 1; residue u=0; S-defects | h(±1/2;i)=1; R pair is even; μ residue has minus sign; h/(2i)+(i/2)h=0 | None |
| §§6.1–6.3 unary characteristics, periods and torsion laws | (a,b)=(0,0),(1/6,0); a=1/2 endpoint; order-two torsion; β-shift 1 | Zero odd unary sum; leading coefficient 1/6 at q^(1/72); endpoint crossing needs extra term; order-two arguments are pole-free; unit shift negates H | None |
| §§7.1–7.3 cone data, ordered kernels, convergence and boundary limits | Hyperbolic plane; equal cones; opposite component; rank-one A=[−2]; dependent rays | Kernel 2 at (1/2,1/2), zero at mixed signs or equal cones; opposite datum rejected; boundary Q⁺=0 is outside the two-negative-vector positivity theorem | None |
| §§7.4–7.5 characteristic transforms and correction factorization | Hyperbolic determinant −1; odd diagonal A; c=1,2 in rank one | S-prefactor τ; odd half-diagonal shift retained; c=2 has two cosets and scale 8; correction sign is negative | None |
| §8.1 modular carriers and cusp restrictions | Trivial representation, weight 0; odd integral weight; incompatible center; Γ₀(2) cusp S | Constant 1 is holomorphic, not cuspidal; central obstruction retained; arbitrary subgroup representation is not evaluated at S | None |
| §§8.2–8.3 operators, covariance, factorizations and harmonic spaces | Constants; y,y²; k=0,1,1/2; log y | Δ₀y=0, Δ₀y²=−2y²; Δ₁log y=0; unitary shift 3/16; polynomial growth alone does not imply harmonicity | Nonzero Laplacian example proved |
| §8.4 scalar kernel, ODE, basis, asymptotics and gamma comparison | k=0,1; w<0,w>0; w=0 excluded | H₀=e^w; Γ(1)−γ(1,−2w)=e^(2w); at k=1 the supplied shape-zero lower function cannot supply the positive tail integral | Pinned comparison and parameter boundary added |
| §8.4a general parabolic Fourier theory | M=1,i,2; 2×2 unipotent Jordan block; β=0; k=1 | Frequencies 0,1/4,−i log 2/(2π); holomorphic Jordan vector (τ,1); height-one zero primitive log y at k=1 | None |
| §§8.5–8.6 Weil Fourier/xi, growth and exact sequences | Rank-zero lattice; L=⟨2⟩; constant mode; conj(q⁻¹); compatible/incompatible center | Exponents ℤ+1/4 and central phase −i; ξ₀conj(q⁻¹)=4πq⁻¹; exact sequences retain conjugation and k≠1 | None |
| §8.7 mock objects, maps, shadows and Eichler primitives | Correction 0; multiply by i; g₀=1,k=0,1 | Shadows conjugate scalars; corrections y versus y−1 differ by 1; log y gives shadow 1; moving endpoint gives ∂bar F⁻=(i/2)y^(−k)conj(g) | None |
| §§9.1–9.2 theta coordinates and Jacobi data | m=1,l=0,1; m=0; zero/constant elliptic functions | Leading theta terms 1 and q^(1/4); zero index excluded; nonzero constant fails positive-index ellipticity | None |
| §9.3 real-analytic residues and affine covariance | (1+v+conj v)v⁻²; conj(v)v⁻¹; v⁻¹; 1 | Residues 1,0,1,0; antiholomorphic degree must remain zero | None |
| §§9.4–9.5 completed polar kernel and decomposition | λ=0 pole; l=0,m at u=0; φ=θ_m,j; double pole | Residue −1/(2πi); R_m,0=1, R_m,m=0; coefficient delta; double pole uses first derivative | None |
| §§10.1–10.1a third-order series and bilateral bridges | q=0; f through q³; omega indices 0,−1; z=−1 | f=1+q−2q²+3q³; paired omega term (1+q)/(1−q); f bridge has factor 2; punctured-disc hypotheses retained | None |
| §10.2 third-order completion and related functions | Leading omega components; first correction; S₃²; φ,ψ constants | T exchanges omega components with ζ₃; first correction −2C has shadow +2√6g; related projections give constants 1,0 | None |
| §§10.3–10.4 thirteen unilateral functions, Hecke identities and cone models | q=0 and first coefficients; source’s ψ₁ convention; A₁ starting index | Constants as stated; A₁ starts q; φ₁ starts q; 1+2ψ₀ starts 1+2q; cone norms negative | None |
| §§10.5–10.8 fifth/seventh corrections, shadows and matrices | Opposite fifth corrections; half-argument T exchange; seventh leading exponents and cone vectors | Corrections cancel in fifth sum; seventh exponents −1/168,47/168,143/168 with last phase −25/168; seventh cone norms −21/2 and pairing −28 | None |
| §§11.2–11.3 root and residue completions | α=1/2,1/3,0; t=1,2; multiply filter by i | Even root recovers f completion; cubic separate poles need cancellation; trivial root weight −1/2; residue deviations zero at t=1 and opposite at t=2; shadow filter conjugates phases | None |

## Maintainer notes

The saved proof-only repairs to `formalFirstCoefficients`, `formalModTwo`, both `IsGapTwo` examples, `filterTwo` and `decimationNotMultiplicative` are retained. Their statements and definitions are unchanged, and full elaboration verifies the repaired scripts.

The listed warning repairs remove unused tactic steps and an unused simp argument, replace `if_pos` with `ite_eq_left`, and use sequential tactics in the logarithm xi example. The positivity hypothesis of `laplacianZeroModes` remains explicit, with its unused binder spelled `_hτ`. No mathematical statement changed in this warning repair.

No public name was deleted or renamed. The representative `partitionRank_conjugate` signature replaces `TauCeti.conjugate p` with `Nat.Partition.conjugate p`; consumers of that signature should use Mathlib’s native conjugation. Both represent Young-diagram transposition. The README imports the native conjugation and involution rather than requiring a second implementation.

The two ring-comparison names and `maassFourierKernel_eq_incompleteGamma` are README targets. Their supplier Cartier operator and all-weight contour kernel have no added ad hoc Lean carriers. The additional ring supplier is on main; no ownership moved to a later roadmap. The six supplied sibling roadmaps have no matching numerical-extraction or incomplete-gamma target; their Cartier references concern different objects.

All cited works remain represented in `sources.toml`; no additional source is needed. Existing waived and uncertified records remain settled. Detailed valuation-module inclusions and the remaining analytic identities remain theorem targets: boundary calculations and elaboration of admitted theorems do not prove them. A fresh independent review is still required. No commit, merge-order edit or external write was made.
