# Review of SchemeAndStackFoundationsPartII (pull request #2272 at 8f486a0)

**Verdict:** needs changes

## R01 (P2) — Specify the missing classical group comparison

**Location:** `TauCetiRoadmap/SchemeAndStackFoundationsPartII/README.md:108`: “connect the native affine Hopf-algebra group-point functors and finite locally free Cartier duality with the smooth affine commutative group-scheme category.”
**Claim:** `gap:classical-affine-group-adapter` specifies no map, equivalence or compatibility that would discharge it. Point transport and smoothness transport already exist; finite locally free groups need not be smooth.
**Witness:** At the pin, `TauCeti/AlgebraicGeometry/AffineGroupScheme/Points.lean:36` gives the natural scheme/Hopf point isomorphism, and `TauCeti/AlgebraicGeometry/AffineGroupScheme/Smooth.lean:99` transports smoothness. Over 𝔽_p, μ_p is finite locally free but nonsmooth; 𝔾_m is smooth.
**Repair:** Replace “connect” by the precise residual comparison required by the Bégueri construction, with source, target and naturality laws, in both this contract and `packages/SchemeAndStackFoundationsPartII/design/plan.json`. Cite `TauCeti.AffineGroupSchemeCat.algebraPointsFunctorIsoCoordinatePointsFunctor` and `TauCeti.smoothAffineGroupSchemeProperty_inverseImage` for the existing transport. State the comparison in the ambient affine commutative group category, retaining finite local freeness for G and smoothness for H,Q; this includes μ_p→𝔾_m in characteristic p without making μ_p smooth.

## R02 (P3) — Cite the construction of the semiperfect cover

**Location:** `TauCetiRoadmap/SchemeAndStackFoundationsPartII/README.md:470`: “PerfectoidQuotientsPartII §Q7.1 (the semiperfect ind-fppf cover)”.
**Claim:** Q7.1 defines ind-fppf maps and their API; it does not construct the stated semiperfect cover.
**Witness:** Pull request #2259, `TauCetiRoadmap/PerfectoidQuotientsPartII/README.md:946` defines ind-fppf; its root-adjoining construction occurs at line 1559, in Q9.6. In characteristic p its p-Zariskization is the identity.
**Repair:** Replace the citation by “PerfectoidQuotientsPartII §§Q7.1–Q7.3 (ind-fppf maps and stability), §Q9.6 proof route (the compatible-root cover, specialized to characteristic p)”; make the same addition in the supplier contract and Layer 3 Dependencies. For one adjoined p-th root, A[T]/(T^p−a) is free of rank p; the filtered root construction is faithfully flat and semiperfect.

## Verified sound

| Statement | Instances tried | Left / input value | Right / output value | Result | Change |
|---|---|---|---|---|---|
| Conventions: henselian pairs | ℤ,(p); ℤ_p,(p) | Jac(ℤ)=0; p≠0 | p∈Jac(ℤ_p); simple roots lift | First excluded, second included | — |
| Conventions: covariant Dieudonné fibre | 𝔽_p; ℤ/p and μ_p | ℤ/p: V−1=0; μ_p: V−1=−1 | ℤ/p: H⁰=H¹=𝔽_p; μ_p: H⁰=H¹=0 | Signs distinguish the groups | — |
| Conventions: animated degrees | A=k⊕k[1], G=𝔾_a | π₀A=k; π₁A=k | H⁰=k; H⁻¹=k | Negative cohomology retained | — |
| Conventions: support fibre | I=(1); I=0 | U=Spec A; U=∅ | Fib(id)=0; Fib(RΓ→0)=RΓ | Support direction agrees | — |
| §1.1; CS24 line 2974 | ℤ_p,(p); k⊕k[1],0 | Completion=ℤ_p; completion=A | Henselian pair; π₁=k allowed | Both satisfy hypotheses | — |
| §1.2; CS24 line 2982 | ℤ_p, μ_p, p odd | H²=Br(ℤ_p)[p]=0; H¹=ℤ/p | H²(𝔽_p)=0; H¹(𝔽_p)=0 | H² agrees; H¹ differs | — |
| §1.3; CS24 line 3000 | ℤ_p,p,μ_p, p odd; a=1 | H¹=ℤ/p; a=1 forces A=0 | lim H¹=ℤ/p; zero complex | Bounded comparison passes | — |
| §1.4; CS24 line 3081 | ℤ[[t]], t; identity hypercover | RΓ(ℤ[[t]],G) | Tot(constant RΓ)=RΓ(ℤ[[t]],G) | Parameter need not lie in base ℤ | — |
| §1.4 split descent | ℤ_p→ℤ_p×ℤ_p | Čech degree j: RΓ(ℤ_p,G)^(2^(j+1)) | Contracted totalization=RΓ(ℤ_p,G) | Split cover descends | — |
| §1.5 headline; CS24 line 3138 | Empty tuple; ℤ_p,p,μ_p, p odd | RΓ(A,G); H¹(ℤ_p)=ℤ/p | Constant limit=RΓ(A,G); limit H¹=ℤ/p | Continuity passes | — |
| §1.5 derived quotient distinction | A=ℤ/p²; quotient by p | π₀=𝔽_p; π₁=ker(p)=𝔽_p | Ordinary quotient: π₀=𝔽_p; π₁=0 | Ordinary termwise replacement fails | — |
| §1.6; CS24 line 3162 | ℤ_p,p,μ_p, p odd | H¹=ℤ/p; lim¹ μ_p(ℤ/p^n)=0 | H¹(𝔽_p)=0; lim H¹=ℤ/p | Surjection and Milnor sequence agree | — |
| §1.7; CS24 line 3181 | 𝔽_p{t}→𝔽_p[[t]], μ_p | H¹ countable; H²=0 | H¹ has continuum many classes; H²=0 | Degree-one continuity fails | — |
| §1.7 distinct unit classes | u_h=1+t·h(t^p) | u_h/u_g∈𝔽_p[[t^p]] implies h=g | Distinct h give distinct p-power classes | Uncountability witness passes | — |
| §2.0 pointsAddFunctor | α_p over 𝔽₃[ε]/ε² | Points=𝔽₃ε; ε+ε=2ε | Convolution=2ε; multiplication would give 0 | Additive law distinguished | — |
| §2.0 pointsAddFunctor | μ_p over ℤ/p²; constant ℤ/2 over ℚ×ℚ | μ_p=1+pℤ/p²; idempotents=4 | Cardinality p; sum e+f−2ef | Nonreduced and disconnected tests pass | — |
| §2.0 functoriality | α_p; ε↦0; identity; composites | ε maps to 0; identity sends ε to ε | Postcomposition gives 0; identity and composites agree | Map direction and group law agree | — |
| §2.0 coefficientSheaf | α_p over 𝔽_p[t]/t^p; reduced algebra | Sections=(t), dimension p−1 | Reduced algebra: sections=0 | Reduced-site substitute excluded | — |
| §2.0 coefficient exactness | μ_(p²)→μ_p over 𝔽_p[t]/t^p | Coordinate algebra free rank p; sheaf cokernel=0 | Point map zero; target 1+(t) nontrivial | Sheaf and point exactness distinguished | — |
| §2.0 flatCohomology; CS24 line 2279 | α_p over 𝔽_p[t] | H¹_fppf=𝔽_p[t]/𝔽_p[t]^p; [t]≠0 | Étale points of α_p=0; resulting H¹=0 | Fppf coefficient carrier necessary | — |
| §2.0 flatCohomology | μ_p over ℤ_p, p=2,3 | p=2: classes −1,5; p=3: class 4 | H¹=(ℤ/2)²; H¹=ℤ/3 | Small-prime bounds pass | — |
| §2.0 zero coefficients and zero algebra | G=0; A=0; n=0,1,2 | Zero coefficient; empty representable after sheafification | Extⁿ=0 in both cases | No empty-scheme junk value | — |
| §2.0 nonunital criterion; BC22 line 214, SP line 1369 | B′=0; pℤ_p; ℤ | 0: y=0,T=1; pℤ_p: henselian ideal | ℤ: 2(1+y)=1 has no integer solution | Positive and negative models separated | — |
| §2.0 quasi-inverse is insufficient | B′=3ℤ_(3) | Quasi-inverses exist; discriminant of T(T−1)−3 is 13 | 13 is not a rational square; no root | Polynomial clause necessary | — |
| §2.0 unitization API | B′=0; B′=pℤ_p | Unitization of 0=ℤ, kernel 0; kernel for pℤ_p=pℤ_p | Henselian ideals 0 and pℤ_p | Intrinsic and ambient criteria agree | — |
| §2.1; BC22 line 253 | A=ℤ_(p)^h, F(C)=C; constant {0,1} | A embeds in ℤ_p; residue 1 | Lift 1 exists on both sides; constant map=id | Injectivity and both lifting directions pass | — |
| §2.2 headline; CS24 line 3190 | (ℤ_(p)^h,p), μ_p, p odd | H¹=ℤ/p; H²=0 | Residue H¹=0; H²=0 | Surjective ≥1; bijective ≥2 | — |
| §2.2 infinitesimal coefficients | (𝔽_p[[t]],t), α_p | H¹=𝔽_p[[t]]/𝔽_p[[t]]^p; [t]≠0 | Residue H¹=0; both H²=0 | No degree-one injectivity | — |
| §2.3 headline; CS24 line 3209 | 𝔽_p{t}; discrete B; topology from henselian ideal I | H²(μ_p)=0; completion B; completion A/I | H² completed=0; identity; henselian comparison | Separated completion matches hypotheses | — |
| §2.3 negative topology test | Indiscrete ℚ; B′=ℚ | (1−1)(1+y)=0≠1; Br(ℚ)[2]≠0 | Completion=0; H²(0,μ₂)=0 | Nonunital henselian hypothesis excludes failure | — |
| §2.3 quasi-inverse negative control | ℤ_(3), topology defined by 3ℤ_(3) | Brauer class with invariants 1/3 at 2, −1/3 at 5 | Completion 𝔽₃: H²(μ₃)=0 | Nonhenselian example excluded | — |
| §2.4; CS24 line 3217 | 𝔽_p{t}[1/t]→𝔽_p((t)), μ_p | H²=ℤ/p; H¹ countable | H²=ℤ/p; H¹ uncountable | Bound ≥2 necessary | — |
| §2.5; CS24 line 3223 | ℤ_(p)^h→ℤ_p, I=(p); I=0 | Generic H²(μ_p)=ℤ/p; U for I=0 is empty | Completed generic H²=ℤ/p; H*(∅)=0 | Punctured comparison passes | — |
| §2.6; CS24 line 3239 | Same DVR map, U=D(p); R→R; I=0 | H²=ℤ/p; quotient maps=id | H²=ℤ/p; I=0 forces R≃R′ | No added flatness needed | — |
| §3.1; CS24 line 3261 | M=A; M=0; A=𝔽_p,I=0,M=A[1] | Ranks 1 and 0; π₁(A[1])=𝔽_p | First two discrete; third reduction not flat | Nondiscrete wrong model excluded | — |
| §3.2 headline; CS24 line 3288 | I=(1); empty tuple; split cover | Supported complex 0; full RΓ; Čech powers | Totalizations 0; RΓ; RΓ | Support and completeness clauses separated | — |
| §3.2 perfection step | A=𝔽_p[t^(1/p^∞)], A′=A×𝔽_p, t↦1 | Second summand has (t−1)-torsion; A→A′ nonflat | Derived/t second summand=0; reduction map=id | Adic faithful flatness survives perfection | — |
| §3.2 cover citation; R02 | One root T^p=a; characteristic p | A[T]/(T^p−a): basis 1,T,…,T^(p−1) | Rank p; filtered root extension semiperfect | Construction matches Q9.6 | Correct locator |
| gap:classical-affine-group-adapter; R01 | G=μ_p and H=𝔾_m over 𝔽_p | μ_p: dimension 0, tangent dimension 1 | 𝔾_m: dimension 1, tangent dimension 1 | Only H smooth; ambient category required | Specify comparison |
| gap:finite-group-ext | X=0; X=μ_n over algebraically closed k | Ext¹(0,𝔾_m)=0; Cartier dual of μ_n=ℤ/n | Local extension-class sheaf=0 | Sheaf vanishing, not global Ext vanishing | — |
| gap:henselian-stack-lifting | X=B𝔾_m over ℤ_p | Pic(ℤ_p)=0 | Pic(𝔽_p)=0 | Unique residue torsor lifts | — |
| gap:henselian-torsor-cohomology | Q=𝔾_m; G=μ_p over ℤ_p, p odd | H¹(Q)=0; H¹(G)=ℤ/p; H²(G)=0 | Residue: 0,0,0 | Smooth bijection; finite-flat surjection | — |
| gap:cauchy-algebraization | Discrete B; topology from henselian ideal I | Completion=B; completion=A/I | F(B)=F(B); F(A)≃F(A/I) | Separation and non-first-countable formulation compatible | — |
| gap:punctured-h2-injectivity | ℤ_(p)^h→ℤ_p, U=D(p), μ_p | H²=ℤ/p | H²=ℤ/p, invariant preserved | Injectivity test passes | — |
| gap:complete-torsor-effectivity | C=ℤ_p, G=μ_p, p odd | lim¹ G(C/p^n)=0; H¹(C,G)=ℤ/p | lim H¹(C/p^n,G)=ℤ/p | Exact sequence 0→0→ℤ/p→ℤ/p→0 | — |
| gap:flat-group-cotangent-amplitude | 𝔾_m; μ_p over 𝔽_p | 𝔾_m: C=k[0]; μ_p: C=[k→⁰k] | Amplitudes [0,0]; [−1,0] | Smooth versus nonsmooth distinguished | — |
| gap:henselized-formal-fibres | ℤ_(p)^h→ℤ_p | Closed fibre 𝔽_p; generic fibre ℚ_p over Frac(ℤ_(p)^h) | Closed fibre field; generic extension separable in characteristic 0 | Geometric regularity test passes | — |
| gap:begueri-resolution | G=μ_p over 𝔽_p | G*=ℤ/p; H=(𝔾_m)^p; dim H=p | Kernel μ_p; Q smooth, dimension p | Smooth resolution admits nonsmooth kernel | — |
| gap:animated-flat-cohomology | A=𝔽_p[ε]/ε²; G=α_p | G(A)=𝔽_pε | H⁰_fppf(A,G)=𝔽_pε | Infinitesimal points retained | — |
| gap:cohomology-deformation | k[ε]/ε²→k; G=𝔾_m | Kernel of units=1+kε≃k | C_G=k; obstruction term=k[1] | Fibre shift yields kernel k | — |
| gap:flat-animated-modules | A=k⊕k[1]; M=A and M=k | A: π₀=k,π₁=k; k: π₀=k,π₁=0 | Required π₁=k⊗k=k | A flat; discrete k not flat over A | — |
| gap:animated-henselization | I=0; (A,I)=(ℤ,(p)) | Henselization at 0=A; ℤ not p-henselian | π₀=ℤ^h_(p); π_i=0 for i>0 | Identity and nonidentity cases separated | — |
| gap:tower-accuracy | A_n=A; G arbitrary allowed | All τ≤n maps=id | Rlim constant RΓ=RΓ(A,G) | Accuracy prevents arbitrary towers | — |
| gap:split-etale-refinements | R algebraically closed field k; J=0,k | Finite étale algebras k^m, m>0; quotient 0 | Projection gives section; zero-ring section unique | Faithfulness and zero quotient included | — |
| gap:completed-pi0-defect | A=ℤ/p², a=p | π₀ derived completion=ℤ/p² | lim π₀/a^n=ℤ/p²; lim¹ π₁=0 | Kernel 0, hence square zero | — |
| gap:adic-flat-module-limits | C=ℤ, J=(p), M_n=ℤ/p^n | lim M_n=ℤ_p; ℤ_p/p^n=ℤ/p^n | Tor_i(ℤ/p^n,ℤ_p)=0 for i>0 | Completion and adic flatness agree | — |
| gap:complete-module-hyperdescent | Split cover A→A×A; complete M | Completed Čech modules M^(2^(j+1)) | Contracted totalization=M | Completed tensor descent passes | — |
| gap:koszul-geometric-support | T=k[t], b=t, N=T; b=1,0 | [T→T[1/t]]; [T→T]; [T→0] | H¹=T[1/t]/T; 0; T | Geometric supports have correct shifts | — |

- 15 seeded targets verified against CS24 §§5.6–5.7 (printed pp.71–81), BC22 §§2.1.1, 2.1.3 (pp.5–7), and SP 09XI; §3.1 additionally checked at CS24 line 3261.
- 8 cached source works read; 20 gap slugs match README and plan; hypotheses, pages and proof inputs checked, with the contract defect in R01.
- 6 elaborated declaration types compared with README using a fresh `#check @name` probe: 0 lost binders; 4 definitions have real bodies and at least 3 Checks each.
- 2 sorried theorems probed with `simp`, `rfl`, `infer_instance`: 0 closed; pinned near-matches do not prove either headline.
- 31 supplier-table declarations and additional pinned transport APIs opened, including `HenselianRing` (`Mathlib/RingTheory/Henselian.lean:81`), `cohomologyPresheafFunctor` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:70`), and the 2 transport declarations in R01; the cohomology adapter changes the coefficient universe.
- 10 roadmap suppliers read at main or supplied open heads; 4 resolver leads resolve to roadmap targets; no dropped IDs, conflicting heads, second copy or duplicated Lean names found.
- Gate: every scanner and targeted build passed; direct Lean elaboration exited 0 with exactly 2 `sorry` warnings; outside-folder diff and worktree status were empty.
- 4 end headlines: §1.5 continuity, §2.2 henselian invariance, §2.3 algebraization, §3.2 supported descent; 2 stated in Lean, 2 explicitly unstated with missing animated/support carriers; PR title and prose agree with the addition.

Dependency-check output: `depcheck: 222 roadmaps, 1972 edges, 0 problem(s)`.

Overlap check: read PurityForFlatCohomology, ArcTopologyAndDescent, PrismaticCohomologyPartIII, PrismaticCohomology, PerfectoidQuotientsPartII, EnhancedDerivedSheaves, SchemeAndStackFoundations; owners respectively: general flat cohomology/supports/excision, arc hyperdescent, perfect-base comparison/prime continuity, prisms, ind-fppf/root covers, animation/towers/totalizations, ordinary schemes/sites/torsors. This roadmap owns complete continuity, general henselian invariance, topological algebraization and adic supported descent. Its universe-lifted abelian Ext adapter specializes existing carriers. Also read AdicEtaleGeometry A1.0.4–A1.0.5: its finite-étale approximation differs from arbitrary finite-flat high-degree cohomology.

Source independence: 27 passages compared with 8 sources, no copied expression or reused tables found; largest share CS24, 43 of 68 locator-bearing source-key clusters before References (excluding 2 nonlocator mentions). Contents compared at CS24 lines 18–41: its §5.6 is split between Layers 1–2, with BC22 and native coefficient definitions inserted; §5.7 supplies Layer 3. Dependencies §1.2→§1.3→§1.4→§1.5, §1.6→§2.2→§2.3, and §§1.5,3.1→§3.2 force the retained mathematical order; no chapter-by-chapter plan found.

## Not verifiable

- none

## Source issues

- **Misprint** in CS24 at Example 5.6.7, printed p.75, line 3166: the source says the comparison is introduced only for degrees at least two before including degree-one surjectivity; it should be introduced for degrees at least one; affects nothing.
- **Misprint** in CS24 at proof of Theorem 5.7.2, printed p.79, line 3336: the source says the three required comparisons are (5.7.2.1), (5.7.2.2), (5.7.2.2); it should be (5.7.2.1), (5.7.2.2), (5.7.2.3); affects nothing.
- **Misprint** in BG80 at proof of Proposition 2.2.1, printed p.26, line 774: the source says the kernel inclusion for an unnormalized cocycle sends a to (1,a); it should send a to (1,a/c(1,1)); for the constant cocycle 2, the identity is (1,1/2); affects the proof.

## For the human reviewers

- none
