<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/979#issuecomment-6375239959 -->
Red team round 1 pass a (codex) of 627bb70

Verdict: needs_changes

1. **F01** (P2) The Tamagawa gap duplicates an earlier supplier

   **Location:** packages/BorelRegulators/README.md:96, “What AdelicAlgebraicGroups must provide (gap:classical-tamagawa-proof)”; packages/BorelRegulators/design/plan.json, gaps entry classical-tamagawa-proof.

   **Claim:** The norm-one Tamagawa theorem must be supplied as a new AdelicAlgebraicGroups extension.

   **Witness:** TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1958 states τ(S)=1 for every simply connected semisimple number-field group, including inner forms. merge-order/ORDER.txt:166 precedes BorelRegulators at :224. Taking S=SL₁(D) gives exactly the requested theorem.

   Re-raised: MERGE-ORDER in packages/BorelRegulators/reports/FIX-PKG-BorelRegulators~2.md. This finding is confined to the redundant contract, not the previously requested order and external-roadmap edits. The current order already puts the owner first; removing this duplicate gap and citing that owner are package-local repairs. The earlier reason that order/external-file edits are unauthorized does not prevent this repair.

   **Exact repair text:** Replace the classical-tamagawa-proof paragraph with a supplier subsection: “From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison: §6.2 supplies τ(S)=1 for every simply connected semisimple group over a number field, including inner forms, with the Tamagawa normalization of AdelicAlgebraicGroups §2.4. Apply it to the SL₁(D) carrier using gap:inner-type-a-structure.” Replace every use of gap:classical-tamagawa-proof and every claim that its numerical theorem comes from the AdelicAlgebraicGroups extension by this citation, and remove only that entry from the plan’s gaps list. Keep the other AdelicAlgebraicGroups measure and structure contracts.

   **Repair test:** For the degree-two indefinite division algebra D=(−1,3)/ℚ, the existing theorem gives τ(SL₁(D))=1; for a degree-three division algebra it also gives 1. Neither splitness nor an infinite-place restriction is introduced. The dependency check on the review-only candidate is recorded below.

## Verified sound

Scope read: all 793 README lines, all 80 Suggested.lean lines, the repository rules, the design gaps, source manifest and settled repair report. Counts: **3 Lean declarations; 26 numbered mathematical targets; 110 Check bullets; 46 distinct source locators in five accessible works; 16 existing-supplier citation groups resolved; 12 declared gaps matched; four of five downstream citation groups located.** The fifth downstream group is listed under Not verifiable. The supplied 27 sibling folders, main/Completed roadmaps and board packages were searched by mathematical object; the roadmap search service was also used for ownership and current-head resolution. A citation group means one named roadmap with its cited sections, not each repeated occurrence of its name.

No mathematical counterexample to a package target was found. This is conditional on the declared supplier contracts: it does not certify their future implementations. R01 concerns one contract's duplication, not the truth of its theorem. Each target has a source locator; every definition has at least three Checks. The 110 bullets include controls on parity, normalization, omitted primes, rank zero and wrong models; their computations are recorded below.

**Lean signatures and headline audit.** The namespace is TauCetiRoadmap.BorelRegulators. There are no section-variable blocks, definitions, instances, opaque data, admitted examples or placeholder predicates. All binders are explicit. I compared all three supplied elaborated signatures with the source and README; no binder or coercion mismatch was found. No Lean command was run in this review.

| Declaration and location in packages/BorelRegulators/Suggested.lean | Section and complete context | Instances and computed values | Result/change |
|---|---|---|---|
| period_eq_index, line 46 | §3.1; F : Type u, Field F, NumberField F; A : CSA.{u,u} F. CSA supplies centrality, simplicity and finite dimension; the index uses A's underlying algebra. | F=ℚ, A=ℚ or M₂(ℚ): order=1, index=1, dimensions 1 or 4. Two local invariants 1/2: order=index=2, dimension 4. Invariants ±1/3: order=index=3, dimension 9. | True in tested cases; noncommutative input included. No change. |
| exists_divisionAlgebra_split_at_infinity, line 55 | §3.2; same F; a : ℕ, 1≤a. Existential D : Type u, DivisionRing D, Algebra F D, IsCentral F D, FiniteDimensional F D. Each real/complex embedding determines its own scalar structure. | a=1: D=F, finrank=1=1², scalar extension M₁. a=2: invariants at 2,3 equal 1/2, infinity 0; finrank=4=2². a=3: ±1/3, dimension 9=3². a=0 would demand 0-dimensional division algebra and is excluded. | No section binder disappears; the existential algebra instances remain attached to D. Same-universe realization is possible for every finite-dimensional F-algebra. No change. |
| exists_pos_rat_dedekindZeta_of_isTotallyReal, line 72 | §5.1; F : Type u, Field F, NumberField F, IsTotallyReal F; n : ℕ, 2≤n, Even n. Positive q : ℚ; equality in ℂ. | (F,n,q)=(ℚ,2,1/6),(ℚ,4,1/90),(ℚ(√5),2,2/75). Both sides respectively π²/6, π⁴/90, 2π⁴/75. n=0,1 excluded; ℚ(i) is not totally real. | Positive convergent zeta values, correct coercions and exponent. No change. |

The headline inventory is: §1.3 analytic leading term; §§2.1–2.3 normalized Borel class, actual regulator and real isomorphism/functoriality; §§3.1–3.2 global period–index and division-algebra existence; §§3.4–3.6 normalized arithmetic volumes; §§4.3–4.6 compact/arithmetic periods and fibre cancellation; §§5.1–5.5 primitive determinant, integral homotopy conversion, regulator lattice, zeta covolume and order/localization transport; §§6.1–6.3 actual Deligne target, factor-two comparison and Adams weights.

The three statable numerical/algebraic headlines are present. The other headlines are individually covered by the module docstring's missing-carrier explanations: actual higher Quillen groups, continuous Borel classes, arithmetic and compact-dual cohomology/comparison maps, stable SU/SO integral homotopy, adelic quotient measures, or geometric Deligne realization. Native quotient/exterior-power APIs alone do not supply these carriers. No replacement theorem about arbitrary scalars or unconstructed maps is used. The totally real numerical theorem is not padding: its quantification over all totally real number fields and all even n≥2 is not the pinned ζ(2) or ζ(4) evaluation. None of the three theorems reduces to one pinned lemma or one definition.

**Target ledger.** N=[F:ℚ], d=dₙ, Δ=|disc F|. All higher-regulator targets use number fields and n≥2; §6.1's point quotient permits n>0. “No change” records the result of these tests, not a completed formal proof. Definitions, conventions and auxiliary identities within a target are expanded in the Check ledger immediately below.

| Target (README line) | Context / instances | Computed comparison or distinguishing values | Result/change |
|---|---|---|---|
| §1.1 (164), fixed embedding space, coordinate lattice, norm and measure | ℚ, ℚ(i), ℚ(√5); n=2,3 | Dimensions (0,1),(1,1),(0,2); pair coordinates (t,−t) or (t,t); Tate coordinate 1 versus ambient −4π²; empty lattice mass 1. | No change. |
| §1.2 (188), restriction and full trace | Quadratic extensions; identity; two quadratic steps | TR=2·id; identity TR=id; tower scalar 2·2=4=[E:F]; imaginary even trace t−t=0. | No averaging or selected-embedding trace. No change. |
| §1.3 (208), continued leading germ | ℚ, n=2,3,4; excluded n=1 | Orders 0,1,0; ratios to π^(d−Nn)ζ(n) are −1/2,−1/4,3/4. At n=1 actual order 0 differs from proposed d₁=1. | n≥2 is essential and present. |
| §2.1 (239), Chern-normalized class and stabilization | n=2,3; identity block | Evaluations −4π²,−8π³i; dividing by (2πi)^n gives 1. Stabilization adds chₙ(1)=0. | ch₃ versus c₃ distinguished by 2. No change. |
| §2.2 (259), actual integral/rational regulator | Zero, torsion, nonzero rational K₅(ℚ) class | r(0)=0; m·r(x)=0 implies r(x)=0; specified localization inverse gives t, a doubled inverse gives 2t≠t. | Construction fixes the map. No change. |
| §2.3 (279), real isomorphism, torsion kernel, transfer | Three field signatures; quadratic extension | Dimensions 0=0,1=1,2=2 as appropriate; TR(t)=2t; zero target corresponds to K⊗ℝ=0 and torsion K. | Finite generation and actual localization supplied. No change. |
| §3.1 (309), period=index and invariant denominators | Split class; ±1/3; two halves; index 8 | Empty lcm=1; two halves sum to 0 in ℚ/ℤ; ±1/3 give 3; degree 8 gives dimension 64. Singleton 1/3 is forbidden by the sum. | Poonen's variable-local-extension argument, not a fixed unramified prescription. No change. |
| §3.2 (329), every positive division degree | a=1,2,3; Hamilton algebra | Dimensions 1,4,9; infinite invariants 0 for constructed algebras, 1/2 for Hamilton. | Hamilton is a negative control for splitting, not for existence. No change. |
| §3.3 (350), rational gauge measure | Scaling 2; ℚ(i), h=3; h=0; zero form | Product multipliers 2·1/2=1, 4^(−3/2)·2³=1; zero form gives 0 instead of positive mass. | Nonzero gauge, complex factor and discriminant retained. |
| §3.4 (372), norm-one Tamagawa mass | Degrees 2,3; norm-one torus | Masses 1,1, dimensions 3,8; torus dimension 1 and geometric character rank 1 versus semisimple character rank 0. | Mathematical statement sound in tests; supplier repair R01. |
| §3.5 (391), all finite masses and Euler product | q=2; exceptional gauge; q=1; index 3 | 6/8=3/4; 168/256=21/32; exceptional correction 4b/3; scaled gauge correction 1/2; q=1 factor 0 excluded; subgroup mass divided by 3. | No good-prime omission. No change. |
| §3.6 (413), compact quotient and exact mass identity | Level index 3; definite quaternion; split M₂(ℚ) | (3v)(m/3)=vm=1; definite case has compact infinity; split algebra has noncompact arithmetic quotient. | Division, a≥2 and infinite splitting do different work. No change. |
| §4.1 (444), cohomological indecomposables and determinant adapters | Λ(x₃,x₅), k[u₂], k; scalar basis change 2 | H⁸ dimension 1 but Q⁸=0; Q²(k[u₂]) dimension 1, Q⁴=0; det(0)=k, generator 1; determinant multiplier 2. | Generic quotient remains supplier-owned. No change. |
| §4.2 (465), invariant-form maps | Degrees 0,1,2,3,5; finite stabilizer | Scalars 1,i,−1,−i,i; product i·(−1)=−i. For C₂ over 𝔽₂, H^q has dimension 1 for q>0; point H^q=0. | Actual torsion-free characteristic-zero quotient required and stated. |
| §4.3 (487), compact period determinant | ℚ,n=2,3; ℚ(i),n=2 | Classes π²ℚ₊,π³ℚ₊,π⁴ℚ₊/8; normalized degree-three pairing absolute ratio 4. | All compact determinants nonzero. No change. |
| §4.4 (506), compact cycles and lower ideal | (N,j,a)=(1,1,17),(1,2,37),(2,1,33) | Dimensions 3,8,6; block pads 13,28,29; restriction factors 2,9,4; lower-generator repetition x₃²=0. | Corrects source errors listed below; no package defect. |
| §4.5 (528), full arithmetic periods | j=0,1,2; ℚ,n=2 | Cumulative products 1,ζ(2),ζ(2)ζ(3); quotients ζ(2),ζ(3); full primitive rank N=1 while base d=0. | Induction denominators positive. No change. |
| §4.6 (547), exact primitive sequences and common fibre | ℚ,n=2,3; ℚ(i); lift changes | (d,N,N−d)=(0,1,1),(1,1,0),(1,2,1); unipotent determinant 1 versus rescaled fibre 2. | Identity on the fibre is part of the supplied comparison. No change. |
| §5.1 (578), primitive determinant including rank zero | ℚ n=2,3,4,5; ℚ(√5),n=2 | Phase exponents −2,2,−4,4; all i^E rational units. Empty determinant 1 versus zeta factors 1/6,1/90,2/75; ratios 6,90,75/2. | Rank-zero rationality retained as a headline. No change. |
| §5.2 (599), Cartan and integral lattice conversion | Real n=3,5; imaginary quadratic; zero rank | Quotient/Cartan indices (1,2),(2,1); composite 2 in both; covolumes 4π,2π,2π,1. | Real-place extra factor belongs precisely to n≡3 mod4. |
| §5.3 (620), integral image lattice | tℤ, 2tℤ; zero; ℤ+√2ℤ; tℚ | Covolumes abs(t),2abs(t),1; irrational rank-two subgroup and tℚ have nonzero sequences tending to 0. | Real isomorphism plus finite generation excludes wrong nondiscrete models. |
| §5.4 (642), zeta covolume, rational-basis change | ℚ,n=2,3; ℚ(i),n=2,3; column operations | Leading scalar −12 at ℚ,n=2; positive scalar 6. Exponents −2,−3,−5; swap determinant −1 and absolute factor 1; doubling column factor 2. | Signed and positive rational classes separated. No change. |
| §5.5 (664), finite-S equality and order commensurability | S=∅ or including 2; K₁ boundary; common indices 2,3 | Higher integral images equal, ratio 1; K₁ unit ranks 0 versus 1; commensurable covolume ratio 3/2. | Higher-degree bound and order gap retained. |
| §6.1 (703), point quotient and real descent | n=1,2,3, excluded 0; z=1+i | P(z)=1,i,1; complements i,1,i lie in ℝ(n); n=0 totalized P₀(1)=1≠0 on ℝ(0). | Positive weight and simultaneous conjugation essential. |
| §6.2 (726), independent regulator comparison | Ranks 0,1,2; nonzero rank-one class | r_Bo(t)=2r_Be(t); determinant factors 1,2,4; if r_Bo(x)=t≠0 then r_Be(x)=t/2, not 0. | Independent class and normalization required by contract. No change. |
| §6.3 (747), Adams scalar and determinant | a=2,n=3,d=1,2; d=0; a=1 | Scalars 8; determinants 8,64; empty determinant 1; identity scalar 1. | Native operation supplier hypotheses hold for number fields/number rings. No change. |

Other defect classes were tested where the carriers permit them. A number field has N≥1 and characteristic zero, so zero rings, nonreduced bases, equal-characteristic DVRs, inseparable number-field extensions and empty embedding sets are not admissible substitutions. The generic splitting-degree contract intentionally allows inseparable finite extensions: restricting L^d as a D-module gives d²k=d[L:K], and d>0 gives d∣[L:K] without separability. Nilpotent thickenings are not full orders in a field. Arbitrary groups such as S₃ are not substitutes for the specified reductive or arithmetic group carriers. The quaternion input supplies a genuinely noncommutative algebra; C₂ in characteristic 2 tests the quotient-cohomology boundary. The unit ideal contributes the positive first term 1 to ζ_F(n), ruling out a zero positive-integer zeta denominator.

**Check ledger.** Locations below are lines of packages/BorelRegulators/README.md. Each row records a Check bullet, with its actual value; “=” means the tested formula agrees, and “excluded” means the stated hypothesis rejects the negative control. No Check repair was required.

| Line | Instance / computation | Result |
|---|---|---|
| 31 | n=2 pair (t,−t), real coordinate 0; n=3 pair (t,t), (2πi)²=−4π² with divided coordinate 1 | = |
| 32 | i·(−1)=−i=i³; i⁵=i; ℚ,n=3: i²=−1 | = |
| 33 | tℤ → abs(t); 2tℤ → 2abs(t); dimension 0 → 1 | = |
| 34 | 2·1/2=1; complex multiplier 2²=4; 4^(−3/2)·8=1 | = |
| 178 | ℚ: t=−t ⇒ t=0 at n=2; unrestricted t at n=3; dimensions 0,1 | = |
| 179 | ℚ(i): one independent coordinate in (t,−t) and (t,t), dimensions 1,1 | = |
| 180 | (2πi)^(n−1)/(2πi)^(n−1)=1; n=3 numerator −4π² | = |
| 181 | Totally real, even: all coordinates 0; empty product measure 1 | = |
| 182 | Ambient/coordinate norms (2π,1) at n=2 and (4π²,1) at n=3 | = |
| 200 | T(t,−t)=0; selected-coordinate trace would give t | =; wrong model distinguished |
| 201 | R(t)=(t,t), T(R(t))=2t; averaged trace t | =; wrong model distinguished |
| 202 | Real quadratic trace a+b; identity trace t | = |
| 220 | (−1/12)/(1/6)=−1/2 | = |
| 221 | ζ(−2)=0; first coefficient −ζ(3)/(4π²)≠0 | = |
| 222 | (1/120)/(1/90)=3/4 | = |
| 223 | ℚ at n=1: order 0 versus d₁=1 | excluded |
| 251 | (2πi)²=−4π²; Tate coordinate 1 | = |
| 252 | (2πi)³=−8π³i; Tate coordinate 1; primitive c₃=2ch₃ | = |
| 253 | Positive-degree ch of added trivial block 0; old value +0 | = |
| 271 | r(0)=0; m r(x)=0 with m>0 in a real vector space forces r(x)=0 | = |
| 272 | Actual localization inverse yields t; doubled inverse yields 2t≠t for t≠0 | = |
| 273 | Imaginary quadratic conjugation gives (t,−t) and (t,t) | = |
| 291 | ℚ rational source/target dimensions (0,0) at n=2 and (1,1) at n=3 | = |
| 292 | ℚ(i) dimensions (1,1) both weights; real quadratic n=3 dimensions (2,2) | = |
| 293 | Odd TR scalar 2; even imaginary trace t−t=0 | = |
| 320 | Empty lcm 1; M_a(F) degree a, dimension a² for a≥1; a=0 ring zero | =; a=0 excluded |
| 321 | 1/2+1/2=0 in ℚ/ℤ; denominator lcm 2; dimension 4 | = |
| 322 | 1/3−1/3=0, lcm 3, dimension 9; singleton sum 1/3≠0 | =; singleton excluded |
| 323 | 8²=64; fixed unramified dyadic degree-eight prescription has Wang obstruction | =; fixed prescription not asserted |
| 341 | a=1: dimension 1 and local invariant 0, M₁ after extension; a=0 dimension 0 impossible | =; a=0 excluded |
| 342 | Invariants at 2,3,∞ equal 1/2,1/2,0; degree 2, dimension 4 | = |
| 343 | Finite invariants ±1/3 and all infinite invariants 0; degree 3, dimension 9 | = |
| 344 | Hamilton invariant at ∞ is 1/2≠0, dimension 4 | excluded by splitting |
| 363 | ω↦2ω: real factor 2, 2-adic factor 1/2; product 1 | = |
| 364 | Δ=4,h=3: 1/8·8=1 | = |
| 365 | h=0: masses 1 for ω=1; for ω=2, 2·1/2=1 | = |
| 366 | ω=0 produces mass 0 instead of positive mass | excluded |
| 382 | (−1,3) local symbols at 2,3,∞ are −1,−1,+1; dimension of norm-one group 3; τ=1 | = |
| 383 | a=3: h=9−1=8, τ=1 | = |
| 384 | Gauge-rescaled adelic multiplier 2·1/2=1 | = |
| 385 | Norm-one torus: dimension 1, geometric character rank 1; SL₁(D) degree 2: dimension 3, character rank 0 | excluded torus |
| 403 | #SL₂(𝔽₂)=6; 6/8=3/4=1−1/4 | = |
| 404 | #SL₃(𝔽₂)=168; 168/256=21/32=(3/4)(7/8) | = |
| 405 | Exceptional correction b/(3/4)=4b/3 | = |
| 406 | Scaled split mass (1/2)(3/4)=3/8; correction (3/8)/(3/4)=1/2 | = |
| 407 | q=1 gives 1−1=0 and totalized inverse 0; finite residue field q≥2 | excluded |
| 425 | Level index 3: (3vol)(m_f/3)=vol·m_f=1 | = |
| 426 | Hamilton real norm-one group compact, unlike SL₂(ℝ) | excluded by infinite splitting |
| 427 | M₂(ℚ) is not division; SL₂(ℝ)/SL₂(ℤ) noncompact | excluded from compactness claim |
| 428 | Δ=5,h=3: unscaled/Borel volume ratio 5^(3/2) | = |
| 456 | Λ(x₃,x₅): H⁸ basis x₃x₅, dimension 1; indecomposable quotient kills it, dimension 0 | = |
| 457 | Λ(x₃): Q³ dimension 1; x₃²=0 gives Q⁶=0 | = |
| 458 | A=k: augmentation ideal 0, Q=0, ∧⁰0=k with generator 1 | = |
| 459 | k[u₂]: Q² dimension 1, u₂²≠0 in A but Q⁴=0 | = |
| 478 | i⁰=1, comparison sends 1 to 1, zero map sends it to 0 | = |
| 479 | i¹i²=i(−1)=−i=i³ | = |
| 480 | i⁵=i versus i³=−i, unequal in ℂ | = |
| 481 | H^q(C₂,𝔽₂) dimension 1 for q>0; H^q(point,𝔽₂) dimension 0 | excluded quotient replacement |
| 498 | abs((2πi)²)/π²=4 | = |
| 499 | N=1,n=3: π^(Nn)=π³ | = |
| 500 | Δ=4,n=2: 4^(−3/2)=1/8, π^(Nn)=π⁴, both nonzero | = |
| 518 | N=1,j=1: j²+2j=3, restriction 2¹=2, product ζ(2) | = |
| 519 | N=1,j=2: dimension 8, restriction 3²=9, product ζ(2)ζ(3) | = |
| 520 | N=2,j=1: dimension 6, restriction 2²=4 | = |
| 521 | a=17,b=4: identity block size 13; det L_g=Nrd(g)²=1; 4∤17 rules out unital algebra module | = |
| 522 | x₃∧x₃=0; x₃∧(x₃x₅)=0; x₃x₅ itself nonzero | = |
| 539 | Cumulative periods 1 and ζ_F(2), quotient ζ_F(2) | = |
| 540 | ζ_F(2)ζ_F(3)/ζ_F(2)=ζ_F(3); ζ_F(2)>0 | = |
| 541 | ℚ,n=2: base rank 0, full primitive rank 1 | = |
| 559 | (d,N,N−d)=(0,1,1); after fibre cancellation empty determinant 1 | = |
| 560 | (d,N,N−d)=(1,1,0); fibre determinant 1 | = |
| 561 | ℚ(i): (d,N,N−d)=(1,2,1) for either parity | = |
| 562 | det [[1,2],[0,1]]=1; fibre rescaling diag(1,2) has determinant 2 | = |
| 590 | Empty comparison 1; normalized ζ(2)=1/6; ratio 6 | = |
| 591 | n=3,N=d=1: raw exponent −3, E=2, phase −1; Tate conversion adds exponent 1 | = |
| 592 | ℚ(i): E=0 both weights; factors 2ζ_F(2)/π⁴ and 2ζ_F(3)/π⁶ | = |
| 593 | χ₅ generalized B₂=4/5; L(2,χ₅)=4π²/(25√5); normalized ζ=2/75; reciprocal 75/2 | = |
| 611 | d=0: (2π)^0·1=1 | = |
| 612 | π₅: quotient/Cartan indices 1,2; composite 2; lattice factor 2π·2=4π | = |
| 613 | π₉: indices 2,1; composite 2; lattice factor 2π. C(I)=I; g=diag(i,−i), h=quarter-turn: ggᵗ=(gh)(gh)ᵗ=−I | = |
| 614 | Imaginary quadratic: d=1,r₁=0, ε=1; covolume 2π in both weights | = |
| 633 | Zero free group, zero target, empty determinant 1, covolume 1 | = |
| 634 | tℤ,2tℤ,(t/2)ℤ have covolumes abs(t),2abs(t),abs(t)/2 and first inclusion index 2 | = |
| 635 | (1−√2)^k=p_k+q_k√2≠0 tends to 0; source rank 2, target dimension 1 | nondiscrete wrong model |
| 636 | t/m≠0 tends to 0 in tℚ; for m>1 generally t/m∉tℤ | nondiscrete wrong model |
| 655 | 1/(−1/12)=−12; 1/(1/6)=6 | = |
| 656 | ℚ,n=3: d−Nn=1−3=−2, raw exponent −3 | = |
| 657 | ℚ(i): sqrt Δ=2, exponents 1−4=−3 and 1−6=−5 | = |
| 658 | Column swap determinant multiplier −1, absolute multiplier 1; doubling column multiplier 2 | = |
| 675 | Empty S: identity transport, image equality and ratio 1 | = |
| 676 | S containing 2: rank dₙ remains dₙ at n=2,3; odd localization surjectivity preserves integral image | = |
| 677 | Units of ℤ rank 0; units of ℤ[1/2] rank 1 | K₁ excluded |
| 678 | covol(L₁)=c/2, covol(L₂)=c/3; ratio 3/2 | = |
| 690 | (−1/12)/(−1/2)=1/6; 6·1/6=1 | = |
| 691 | (1/120)/(3/4)=1/90; 90·1/90=1 | = |
| 692 | Totally real even n=2k: d=0, exponent −2kN; N=2 gives −4k; positive factors have nonzero reciprocal | = |
| 693 | ℚ(i), even n: d=r₂=1, determinant has one row, not zero rows | = |
| 716 | n=2: P₁(1)=0, P₁(i)=i, quotient kernel real axis | = |
| 717 | n=3: P₂(1)=1, P₂(i)=0, quotient kernel imaginary axis | = |
| 718 | 1+i maps to i or 1; differences 1 or i belong to ℝ(2) or ℝ(3) | = |
| 719 | n=1: P₀(1+i)=1; n=0 totalized same projection sends real 1 to 1≠0 | n=0 excluded |
| 720 | ℚ fixed quotient dimensions at n=2,3 are 0,1 | = |
| 738 | Rank 0: both determinant maps send 1 to 1; 2⁰=1 | = |
| 739 | Rank 1: determinant ratio 2¹=2 | = |
| 740 | Real quadratic odd weight: rank 2, determinant ratio 2²=4 | = |
| 741 | Nonzero Borel coordinate t forces Beilinson coordinate t/2; zero map would give 0≠t | = |
| 758 | a=2,n=3,d=1: 2³=8, determinant 8 | = |
| 759 | a=2,n=3,d=2: scalar 8, determinant 8²=64 | = |
| 760 | d=0: 2^(2·0)=1, not 4 | = |
| 761 | a=1: 1^n=1, determinant 1; a=0 outside statement | = |

**Supplier, ownership and pin ledger.** Citation resolution was followed by reading the actual cited material, not accepted from the resolver alone. The existing groups checked were GeneralAlgebraicKTheory §§2.5,3.2,3.12,7.7–7.8; StableHomotopyKTheory §§2.3–2.5,3.37,4.14; ArithmeticKTheory §§3.2–3.4 at the supplied head; ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–0.9, ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3; AdelicAlgebraicGroups §§1.4,2.2–2.5,3.4,4.2; SemisimpleAlgebras Layer 6; ClassFieldTheory Layers 5,10; ArithmeticGaloisDuality R02.4.5b–R02.4.6; LFunctions Layer 3; IntegralIwasawaTheory §6.0; CharacteristicClasses C5a.2–C5a.5 and C6 items 2–3; TopologicalKTheory T4,T7 item 1; DifferentialGeometry Layers 5–6,8; SchemeKTheoryOperations §6.8; AlgebraicTopology Stage 5 item 5. MotivicEtaleKTheory's requested extensions were treated as declared gaps, not as existing theorems.

Specific ownership boundaries and countermodels checked:

- ClassFieldTheory supplies cohomological local/global Brauer invariants, and TauCeti/Algebra/CrossedProduct/Comparison.lean:267 supplies the native Brauer comparison. Neither is a second ownership claim on the number-field period–index deduction. SemisimpleAlgebras Layer 6 supplies finite splitting fields and division representatives, not divisibility of every finite splitting degree. TauCeti/Algebra/CentralSimple/Index.lean:196 supplies index dividing algebra degree, a different statement.
- CharacteristicClasses C5a.2 is an invariant-polynomial quotient, not all connected graded algebras. The example k[u₂], with Q⁴=0 while u₂²≠0, tests the general extension needed here. Its C6 rational character does not by itself prove integral Hurewicz calibration. The real Bott maps have c(a)=2u², c(b)=u⁴ and r(u²)=a, fixing the two real-place index cases.
- ArithmeticKTheory's actual localization and ranks are imported. For finite S and odd degree ≥3 the integral localization map is surjective, giving equal regulator images; a rational equivalence alone would only give commensurability. The nonmaximal-order integral assertion has its separate gap.
- DifferentialGeometry's de Rham theorem requires Hausdorff, σ-compact finite-dimensional manifolds; the torsion-free arithmetic quotients used here satisfy these hypotheses. The C₂/𝔽₂ example does not fall under that comparison. SchemeKTheoryOperations §6.8 requires regular Noetherian finite-dimensional schemes with ample family; number fields and their number rings satisfy these conditions.
- Polylogarithms' supplied head explicitly attributes its totally real even-weight numerical consequence to BorelRegulators. It owns its symbol constructions and row normalizations; multiplying each of d rows by λπ^(n−1) changes the exponent by (n−1)d, giving −2+2=0 for ℚ,n=3 and zero change when d=0. HabiroNahmSeries §1.5 consumes that descended embedding regulator and quantifies vanishing over every embedding. Neither provides an input to the Borel proof.
- No fully qualified name among the three Suggested.lean declarations collided with a declaration in a searched roadmap. The pinned Tate Hodge lattice is not this embedding lattice: TauCeti/Geometry/Hodge/Tate/Basic.lean uses an abstract integer lattice with its complexification, whereas §1.1 imposes simultaneous embedding conjugation and the analytic (2πi)^(n−1) coordinates.

All twelve plan slugs occur under the correct README supplier, with matching needs and contextual hypotheses. Eleven contracts remain genuine stated extensions after R01: stable-finite-range; integral-chern-calibration; cyclic-local-degrees; inner-type-a-structure; adelic-rational-masses; order-finite-generation; universal-deligne; infinitesimal-classifying-comparison; graded-indecomposable-api; multiplicative-serre-comparison; splitting-degree-index. None has supplier `none`. In particular, the local-mass contract includes all compact opens and ramified places, and the cyclic-extension contract retains the obstruction to fixed prescriptions. Their absence from today's suppliers was not counted as a defect.

The native names in the Mathlib and Tau Ceti contracts were checked at the stated pins. Relevant distinctions are: CSA includes centrality, simplicity and finite dimension; BrauerGroup is a quotient and gets the same-universe group law from the imported Tau Ceti module; IsSplittingField allows a zero matrix size for arbitrary algebras but that cannot split the nontrivial central simple inputs here; index is positive and independent of presentation; Submodule.mkQ has no topology; IsZLattice requires the separate discrete-subtype instance as well as spanning. The covolume determinant formula is for coordinate space and is transported using the stated measure. Mathlib's Dedekind zeta is the convergent ideal-count series; Tau Ceti's holomorphic remainder only extends to Re(s)>1−1/N and does not already supply the global functional equation. The native special ζ(2),ζ(4) identities check the rational rank-zero examples but do not prove the general headline.

**Source locator ledger.** Counts split a numbered section range into its individual sections; multiple parts of one theorem count as one locator. The cached legal texts and, where OCR omitted formulas, the cached scan pages were read. No source passage is reproduced here.

| Source | Distinct locators verified | Evidence and scope |
|---|---:|---|
| borel1977 | 17 | §§1.3–1.6; Lemma 2.2; Proposition 2.4; §§3.3–3.5; Proposition 4.3; §§5.2–5.5; Theorem 6.2; Remark 6.3; §6.4. borel1977 line 122–236, line 289–402, line 440–551, line 567–615. Scan formulas on printed pp.617,628–630,632 checked directly. The source parameter m is n−1, and its matrix size is this roadmap's a. |
| borel1974 | 3 | Theorem 7.5, §11.4, Proposition 12.2: borel1974 line 934, line 1246, line 1377. Stable arithmetic cohomology/ranks support the named arithmetic supplier, not a new regulator normalization. |
| burgos2002 | 21 | Propositions 8.9,8.10,8.14; Theorems 8.12,8.15; Corollary 9.8; Theorem 9.9; Definition 9.10; Theorem 9.12; Lemma 9.18; Definition 9.19; Remark 9.20; Proposition 9.22; Corollary 9.23; Definition 9.24; Examples 10.4–10.5; Remark 10.6; Definitions 10.7–10.8; Theorem 10.9. burgos2002 line 2865–2992, line 3080–3290, line 3450–3775, line 3940–4248. Includes the independent universal class and the factor-two proof, not just its theorem statement. |
| poonen2017 | 4 | Definitions 1.5.15–1.5.16; Proposition 1.5.17; Theorem 1.5.36. poonen2017 line 1213–1229, line 1396–1446. The global cyclic splitting construction allows changing local extensions; no fixed unramified degree-eight prescription is inferred. |
| deligne_goncharov2005 | 1 | Published §1.6, equations (1.6.1)–(1.6.10) and Adams consequence: deligne_goncharov2005 line 276–440. The published pp.7–9 locator is used, not the differently numbered preprint. |

**Dependency and policy checks.** The required original-package dependency command completed successfully:

```text
depcheck: 28 roadmaps, 244 edges, 0 problem(s)
```

The review-only candidate replacing the Tamagawa gap with EndoscopicTransferAndUnitaryTraceComparison §6.2 also completed successfully:

```text
depcheck: 28 roadmaps, 245 edges, 0 problem(s)
```

Neither output contains UPWARD, CYCLE or moved. This verifies the proposed citation's direction without modifying the package or merge order. Internal proof order was followed through §§3.1→3.2→3.6→4.4→4.5→4.6→5.1→5.4 and the independent universal realization in §6.2; no new circular proof dependency was identified.

The original diff has seven changed files, all under packages/BorelRegulators. Suggested.lean has one `import Mathlib` and two existing, used TauCeti imports, three documented theorems with sorry, no `lemma`, `set_option`, sorry'd data or admitted example. README and Lean use the same three own declaration names. No computational algorithm or pull-request number was found in the mathematical README/docstrings. Source access statuses are recorded as source certification information. No package source, manifest, design or order file was edited during this review.

## Not verifiable

- No independent Lean execution was authorized. The supplied expanded signatures were compared, and the declaration/import bodies were read at the pins; this review does not claim to have rerun elaboration.
- weil1961, §3.3, Theorem 3.3.1 remains waived; its proof text was not read. The use of that theorem by Borel at borel1977 line 227 was verified. beilinson1985, §§1–2 remains uncertified/paywalled; no claim about its unread proof is made. Neither settled source was requested again.
- PeriodsAndSpecialValues PS.3.2a could not be located in the available main/Completed trees or obtained with the supplied roadmap reader. Its downstream target and ownership could not be verified; no missing supplier finding is inferred from this downstream-only assertion.
- The supplied heads of ColemanIntegration and HeightsRationalPointsAndObstructions still retain the ownership statements described in packages/BorelRegulators/reports/FIX-PKG-BorelRegulators~2.md. Polylogarithms still has its external §7.1 pointer, and ArithmeticKTheoryPartII's external R.3 symplectic request is outside this package's scope. Those external repair/placement matters remain settled under MERGE-ORDER; they are not new findings. R01 reopens only the independently repairable redundant gap, for the reason stated there.
- The dependency tool establishes the package's declared direction, not future correctness of supplier implementations or resolution of those settled external ownership edits. Ownership was searched in the supplied sibling checkouts and the available indexed main/open roadmap material; no claim is made about unavailable unpublished work.

## Source issues

- **Misprint** in borel1977 at Theorem 5.5 proof, printed pp.629–630 (borel1977 line 518 and line 532): the source says the restricted-scalar cycle and top form have dimension j²+2j; it should be [k:ℚ](j²+2j); affects the proof.
- **Gap** in borel1977 at Theorem 5.5 proof, printed p.630 (borel1977 line 525): the source says the regular representation embeds D into matrices of the chosen arbitrary odd size; it should be the regular algebra representation in dimension (j+1)² followed by the group map g↦diag(L_g,I); affects the proof.
- **Error** in borel1977 at Theorem 5.5 proof, printed p.630 (borel1977 line 549): the source says the j-generator wedge restricts with factor j+1; it should be (j+1)^j because every primitive factor acquires j+1; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "627bb705c5ec9a4cc2436d3198d3f53993570950", "job": "RT-BorelRegulators~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
