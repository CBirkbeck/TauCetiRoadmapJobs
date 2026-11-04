# Repair report: ClassicalAdicEtaleCohomologyPartII

## F01 (P2) — applied

Layer 6 and its acceptance-file bullet → the HodgeTateAndCanonicalSubgroups §7.6 ownership contract. Deleted every claim that this package supplies or consumes those estimates, valuation-properness, and reduced power-bounded base change. Preserved the other layer identifiers. Evidence: that supplier's §7.6 explicitly owns SW Theorem 10.5.1 and proof; SW line 3295 begins the theorem.

## F02 (P2) — applied

The five scheme arguments printed as ℤ → Z in §§7.2 and 7.7. Coefficients remain ℤ/n. For two geometric points, H⁰(Z,ℤ/n)=(ℤ/n)², agreeing with the existing Check. BH line 672 supplies the scheme-to-rigid comparison; §7.7 follows by proper base change.

## F03 (P2) — applied

One open for every proper map → the maximal smooth open S_f for each map, in both the README and the plan's gap. Section 7.4 now takes a finite intersection and includes point-inclusion negative controls. BH line 567 gives exactly this quantifier order. The supplier's generic-smoothness non-goal remains a maintainer issue recorded below.

## F04 (P2) — applied differently

The model gap → four theorem contracts; the duality gap → upper shriek, amplitude and canonical reflexivity contracts. Compactifications → AdicCoefficientsAndComparisons L2. Updated every affected Needs line. Added algebraic closedness for reduced-model cofinality (Z line 1125) and smooth generic fibre for canonical reflexivity (Z line 755), omitted from the proposed abbreviated repairs. FQ line 760 certifies finite quotients.

## F05 (P2) — applied

Geometric proper-hyperdescent gap → connective-totalization-truncation only. Positive residue characteristic uses DiamondEtaleCohomology §§C0.1, C0.23, C2.10; invertible exponents use ClassicalAdicEtaleCohomology §8.4 proper base change and its descent consequence. Added common-cutoff and bounded-below conditions, and computed truncation Checks at i=0,1. The residual statement is the step at BH line 780, not a geometric supplier obligation.

## F06 (P2) — applied

Toric comparison on arbitrary affinoids → smooth toric charts after proper smooth hyperdescent, before and after field extension. Restricted integral-toric-field-extension in both files; updated §7.5's route, Needs and nodal-curve Check. Section 0.4 now explicitly imports general nearby coherence without claiming singular toric coordinates. BH line 1113 is the unjustified singular-chart step this route replaces.

## F07 (P3) — applied

Smooth-family local constancy: parent §9.5 → §10.5. Field-fibre trace: parent §§8.4,9.5 → §§9.5,9.7. AC “Lemmas 5.5.6–5.5.7” → Lemma 5.5.6 and Theorem 5.5.7 (AC line 5537 and AC line 5569). Verified the parent sections at its open head.

## F08 (P3) — applied

Replaced garbled substitutions in §§1.4,1.6,4.7,7.3–7.5 with grammatical references to the precise contracts. Deleted the self-supplying sentence in §4.7. References to valuation properness disappeared with §§6.3–6.4; generic smoothness now names only proper-generic-smoothness. The revised §7.3 distinguishes algebraization from extension of branched covers.

## F09 (P3) — applied

Duplicate and blanket Needs → individual inputs actually used. Audited §§0.3,1.1,1.5,5.3–5.7,7.2,7.4–7.6, including the additional repeated §11.1 in §7.2. Removed inherited nearby/scalar-extension bundles where no such contract is needed; §0.4 retains general nearby coherence, and §7.5 retains smooth toric field extension. No targets were added.

## F10 (P3) — applied

Image ideals as displayed codomains → whole-ring codomains with labelled differentials in §3.4, §5.8 and Layer 5 Examples. Multiplication by a≠0 on O_C has kernel 0 and cokernel O_C/a; multiplication by p on ℤ_p has kernel 0 and cokernel ℤ/p. The surjective maps onto their image ideals instead have cokernel 0.

## F11 (P3) — applied

Missing completion rings/module structures → missing character-defined integral projection trace in the acceptance docstring and its closing explanation. At the pins, AdicCompletion already has a commutative ring instance and completed-base module instance in Mathlib/RingTheory/AdicCompletion/Algebra.lean, lines 97 and 324. The trace-dependent headline still requires the character decomposition, not a weakened abstract isomorphism.

## F12 (P3) — applied

Section 5.7 now identifies its integral trace, on smooth proper formal models, with the geometric-fibre specialization of the parent's §9.7 IntegralSmoothProperTrace. It states explicitly that the variant here requires no such model. Added parent §§9.5,9.7 to Needs. Both constructions take the same coefficient-compatible finite traces (Z line 3964).

## F13 (P3) — applied

Affinoid-local stratifications as the definition → one global locally finite stratification in §7.1. Section 7.3 now states the equivalence with the affinoid-local finite-stratification criterion as a consequence of locality. Evidence: BH line 600 defines the global condition; BH line 647 proves étale locality; BH line 611 explains why global closures cannot be presumed.

## Check outcomes

- Prescribed Lean elaboration of packages/ClassicalAdicEtaleCohomologyPartII/Suggested.lean with lake env lean, from the content checkout: **exit 0, no diagnostics**. There are no TauCeti imports, so no targeted module build was needed. No Lean process remains running.
- Mechanical declaration/binder audit: **zero declarations**, hence zero elaborated types requiring a #check @name comparison. There are no names to lose section binders, no sorry data and no padding declarations. No scratch theorem was substituted for a missing headline. The acceptance file lists sixteen remaining headlines and their obstacles; the root-algebra explanation was corrected under F11.
- Dependency command, with the prescribed configuration, name, order and movable flag: **exit 0**, exact output:

```text
depcheck: 45 roadmaps, 466 edges, 0 problem(s)
```

- No UPWARD, CYCLE or moved line was emitted. No merge-order edit was made.
- Citation resolver: **exit 0; cross-roadmap citations found nowhere: None; Lean names found nowhere: None**. Its warning that it cannot check external Lake packages was covered by direct inspection of the actual pinned trees, rather than treating that warning as a missing declaration.
- Pinned libraries: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as recorded by the content lake-manifest.json. Directly opened the quoted definitions of LinearMap.IsPerfPair, Representation.invariants, Scheme.smallEtaleTopology, the two p-group fixed-vector declarations, TauCeti.AdicSpace and the AdicCompletion instances. The first pairing definition requires both adjoints bijective, without finite generation; invariants impose no finiteness of G. The adic-space carrier is the sheafy locally affinoid full subcategory, without a rigid étale site. Searches of both pinned trees found no rigid étale/pro-étale site, formal-scheme, perfectoid-space or almost-module carrier supporting an additional headline signature.
- Scope of plan changes: parsing the before/after JSON and removing top-level gaps gives **identical objects**. The thirteen remaining gap records agree with the thirteen README contracts in supplier, slug and mathematical needs; the README uses ASCII code notation and prose for the flagged formulas. Metadata is unchanged.
- Supplied notation failure, **tex=4 → tex=0**: enclosed the connective category and truncated-simplex notation in ASCII code spans; expressed the toric completed-tensor source in prose; enclosed the integral trace symbol in §5.7 in an ASCII code span. These are the four scanner hits, across README lines 100, 114 and 1048. Mathematical hypotheses, maps and Checks are unchanged. The gate's scanners return **tex=0; latex=0; both hit lists empty**, exit 0. Only README.md and this report changed in this notation repair; Suggested.lean, metadata, sources and the plan were preserved.
- Prescribed Lean elaboration and dependency check were rerun after the notation repair; their outcomes are the exit-0 results above.
- git diff --check: **exit 0, no output**.

## Supplier and source verification

Read the shape and relevant contracts of the main-branch SchemeAndStackFoundations, EnhancedDerivedSheaves and AdicSpacesPartIII roadmaps before editing. The main checkout was ae2562cd6d39ddeac99ac18bdf78e6e46a068586. Main-branch inputs were used there, not from pull requests revising them. New-roadmap suppliers absent from main were read through roadmaps show at their indexed open heads; AdicSpacesPartIIPartII was read as packages/AdicSpacesPartIIPartII/design/README.md.

Cross-citation checks covered PerfectoidSpaces P0/P3/P5/P6; AdicSpacesPartII R0–R1 and R0.19–R0.20; AdicSpacesPartIII F0.6–F0.8, R2.2–R2.8 and R3.1–R3.8; SchemeAndStackFoundations §§0.6,0.8–0.9,0.21,2.18–2.21; DerivedModuleAlgebra §§0.2–0.17,1.T.1,1.1–1.8,1.E.1,S.1; DerivedDeRhamCohomology §1.22; EnhancedDerivedSheaves §§0.1–0.4,E1.1–E1.5,E2:towers.1; AInfCohomology AI.0:integral.1,AI.1,AI.3,AI.4.1,AI.6; PadicHodgeTheory §§2.1,2.4,2.7,7.2; ArithmeticGaloisDuality D7 and R02.1–R02.2; DiamondsAndVStacks D1; DiamondEtaleCohomology C0/C1/C2; EtaleCohomologyFoundations G/F/§§0.5–0.11; RigidAnalyticGeometry §§1.1–1.2; ResolutionOfSingularitiesCharacteristicZero §§7.5,7.8; and the parent's cited §§1.1–1.4,7.1,8.2,8.4,9.5,9.7,10.5,11.1. Gap contracts explicitly distinguish the extra valuation, quasi-excellent and geometric conclusions from those suppliers' existing statements.

Ownership searches used roadmaps grep over main and the indexed open heads and object searches of board packages. Broad truncated searches were followed by narrow searches. HodgeTateAndCanonicalSubgroups §7.6 owns the relative theorem and proof; AdicCoefficientsAndComparisons L2 owns the compactification statements; DiamondEtaleCohomology C0.23/C2.10 owns the positive-residue geometric descent. EnhancedDerivedSheaves' hypercover and bounded-totalization statements do not state the residual i+1 truncation assertion. No competing owner was found for the package's Faltings traces, product-polystable duality or Zariski-constructible proper base change. AInfCohomology AI.6 supplies the single-block cyclotomic chart and comparison, distinct from the product-block, arbitrary-nonzero-parameter duality here. No declaration in the acceptance file duplicates another roadmap name.

All eight existing source keys were retained. FQ was added once through the sources service, legally fetched from arXiv:2102.02762v2, and recorded with its service provenance. Read FQ line 756 (quasiprojective residue fibre supplies invariant affine neighborhoods), FQ line 760 (admissible finite quotient) and FQ line 1349 (generic-fibre quotient comparison). The gaps no longer extrapolate a general quotient theorem from its use inside Z's proof. H remains settled as uncertified, cited by its published locator; it was not requested again. No source is pending.

## Adversarial mathematics pass

Each numbered target has a row below, testing its definition, stated identities and associated Checks together. Separate rows cover conventions and changed supplier contracts. The values are mathematical computations, not claims that Lean elaboration proves the statements. Λ denotes a nonzero finite coefficient ring unless the row explicitly uses n=1.

| Statement | Instances tried | Computed values on the stated maps/groups and controls | Result; change |
| --- | --- | --- | --- |
| Almost and residue conventions | O_C/p, O_C/𝔪_C; π²=p at p=2,3 | p·1=0 but ε·1≠0 when 0<v(ε)<v(p); (O_C/𝔪_C)ᵃ=0; π≠0 modulo p and π²=0, whereas π=0 modulo 𝔪_C | Distinguishes almost zero and the two reductions; retained |
| Shifts and cohomological indices | d=0,1; i=2d+1 | Λ[−2] has H²=Λ and H⁻²=0; Λ[2] has H⁻²=Λ; complementary index at i=2d+1 is −1 and both groups vanish | Correct trace shift and integer subtraction; retained |
| Twists and dlog normalization | Torus and ℙ¹ | jΦ⁻¹Sch(dlog T)=dlog T; rescaling Φ by a gives a⁻¹dlog T; twisted point-class trace=1 | Excludes scalar ambiguity; retained |
| Signs and orientation | Two coordinates; p=2,3 | Swapping wedges multiplies by det(swap)=−1; −1=1 modulo 2 and −1=2 modulo 3 | Integral sign survives before reduction; retained |
| Finite trace normalization | Two points; p=2,3 | Tr(1,0)=1; Tr(1,1)=2, equal to 0 modulo 2 and 2 modulo 3 | Sum, without division by degree; retained |
| Group action and universe conventions | S₃; zero coefficients; empty source | (gh)⁻¹=h⁻¹g⁻¹; for g=(12),h=(23), gh≠hg; n=1 and empty-source cohomology both give zero | Inversion gives right actions; zero cases admitted; one adequate cutoff required |
| §0.1 Almost coherent formal sheaves and API | Spf O_C; residue module; infinite completed direct sum | Unit has one generator; residue module has honest H⁰=k and almost H⁰=0; infinitely many εe_j remain independent modulo p for ε∉pO_C | Excludes all-complete-modules category; retained |
| §0.2 Affine comparison, Hom and proper pushforward | F=G=unit; identity; G unbounded below | RHom(O_C,O_C)=O_C[0]; identity sends 1 to 1; unbounded-below G has H⁻ʲ=O_C for every j>0 and is outside the positive bound | Correct order D⁻ against D⁺; retained |
| §0.3 Almost proper duality and smooth formula | Identity, smooth curve, split two points | Both internal-Hom sides at identity are O_Cᵃ/p; curve f!unit=Ω¹[1] has H⁻¹=Ω¹; split counit sends (1,0) to 1 | Comparison lies on target; precise upper-shriek and compactification inputs |
| §0.4 Nearby complexes, reduction and amplitude | Point; smooth d=2 torus; square-zero thickening | Point A=O_Cᵃ[0], K=O_Cᵃ/p[0]; torus torsion-free ranks 1,2,1; Cε is p-divisible and disappears from completed integral coefficients modulo p | General coherence imported; no singular toric chart claimed |
| §0.5 Generic fibre and comparisons | Unit; p-torsion module; identity proper map | O_C[1/p]=C; (O_C/p)[1/p]=0; identity comparison is 1↦1 | Generic fibre differs from reduction; retained |
| §1.1 Formal dualizing complex and bottom sheaf | Point, two-dimensional smooth chart, embedded residue point | Amplitudes [0,0] and [−2,0]; smooth bottom=dT₁∧dT₂ in degree −2; in completed ℤ_p[pT,T²,T³], x=pT is nonzero modulo p with x²=xT²=xT³=0 | Does not replace complex by bottom sheaf; upper shriek and amplitude separated |
| §1.2 Completion and étale comparison | Identity; U=2T at odd p; n=1 | Generator maps to itself under identity; dU=2dT; reduction of completed dualizing complex is the finite-level complex | Retained; exact upper-shriek input |
| §1.3 Gluing kernel | U=X, U=∅, point | Compatible pairs in C⊕O_C are (a,a); (1,0) has difference 1 and is excluded; empty-open result=C rather than O_C | Kernel excludes unrestricted sum; retained |
| §1.4 Canonical Hartogs and reflexivity | Whole open; empty open at a point; uv=ϖ | Whole-open recovery sends s↦(s,s); empty-open recovery would give C≠O_C; nodal residue has two components, so a dense open meets both | Density and reducedness retained; refined algebraization/reflexivity contracts distinguished |
| §1.5 Formal bottom traces | Identity; split r=2; degree p | Identity value=1; split value at (1,0)=1; Tr(1)=p integrally and 0 modulo p | Underived bottom trace remains unnormalized; duplicate Needs removed |
| §1.6 Generic canonical identification | Point; torus; U=T⁻¹ | s(1)=1; s(dlog T) is the canonical generator; dlog U=−dlog T on both sides | Fixed-model comparison needs refined algebraization; cofinality used in §1.7 |
| §1.7 Rigid coherent trace | Identity; split two-cover; S=Tʳ, r=p | Tr(id)=id; Tr(1,0)=1; pullback dlog S=r dlog T and Tr(dlog T)=dlog S, hence Tr(f*α)=rα | Cofinal reduced models used over algebraically closed C |
| §2.1 Scalar-power-torsion quotient | O_C⊕O_C/p²; torsion-free module; p=2 | Quotient=O_C; torsion-free module unchanged; 2x²=0 in torsion-free quotient forces x²=0 | Retained; power torsion not one-step quotient |
| §2.2 BMS maps | Point; smooth torus; degree n=1 | Point differential source=0; torus image=aR̃¹, with cokernel R̃¹/a; multiplying Φ by a changes its image to a²R̃¹ | Intrinsic cotangent normalization retained |
| §2.3 Smooth Hodge–Tate inverse | d=0,1; coordinate character | Ψ⁰(1)=1; ranks for d=1 are 1,1,0; Ψ′(character)=dlog T, while extra division gives a⁻¹dlog T | Correct Tate/Breuil–Kisin scaling retained |
| §2.4 Nice models | Smooth affine; uv=ϖ; t²=ϖ | Smooth residue is polynomial; nodal residue uv=0 is reduced; t is a nonzero square-zero residue class in the last model | Nice/non-nice examples separated; no existence gap needed for definition |
| §2.5 Rational normalization and finite trace | Torus; S=Tʳ; point | jΦ⁻¹Sch(dlog T)=dlog T; Tr(dlog T)=dlog S; degree-zero comparison sends 1 to 1 | No residual scalar; unused contract bundle removed |
| §2.6 Integral and mod-p Faltings traces | Point; smooth curve; singular residue model | Point trace=1; curve ω•₀(−1)[−2]=Ω¹₀(−1)[−1] has target H¹=Ω¹₀(−1); bottom inclusion starts H⁻ᵈ(ω•)[d] | Preserves both shifts and full singular dualizing complex |
| §2.7 Pseudo-finiteness | Identity; proper nice blowup; positive-dimensional generic fibre | Identity nearby amplitude [0,d]; blowup generic degree=1 with possible exceptional fibre dimension 1; positive-dimensional generic fibre has dimension >0 and fails finiteness | Generic finiteness and amplitude kept distinct |
| §2.8 Finite pro-étale trace | Degree 1; split degree p; composite r,s | Unit values 1 and p; modulo p the latter is 0 but single-component trace=1; iterated unit-vector sum=1 for both r-by-s and rs covers | Integral/reduced trace compatibility retained |
| §2.9 Trace compatibility | Identity; split two-cover; split p-cover | Both composites send 1 to 1 at identity, (x,y) to x+y, and total unit to p integrally/0 modulo p | Same normalization on every side |
| §3.1 Product-polystable charts | One node, unit parameter, zero parameter | Node dimension=1; unit block is a torus of dimension n_i; for uv=0 the derivatives at origin are 0,0 | Nonzero parameters essential; unit parameters included |
| §3.2 Root towers and finiteness | n_i=0; one-torus; nodal first stage at p=2,3 | Constant tower has Γ=1; one-torus Γ=ℤ_p(1); closed-node lengths 3 and 5 versus generic ranks 2 and 3 | Finite over chart does not imply chart-flatness |
| §3.3 Character decomposition and multiplication | uv=p; integral coset; unit parameter | V_uV_v=pV₀≠V₀; normalized (1,0)+(0,1) removes common minimum 1; integral coset contains both 1 and T; unit factor gives an isomorphism | Parameter factors retained |
| §3.4 Character cohomology | Trivial character; order pᵐ character; Γ=1 | Zero differential gives H⁰=H¹=O_C; multiplication by ζ−1≠0 gives H⁰=0,H¹=O_C/(ζ−1); Γ=1 gives H⁰ only | Differential labels corrected; image ideal no longer codomain |
| §3.5 Décalage | Trivial torus; differential a; torsion-free line | Torus free ranks 1,1; Lη_a removes H¹=O_C/a from the a-complex; O_C/O_C[a]=O_C whereas O_C/a is torsion | Torsion brackets distinguished from reduction |
| §3.6 Projection trace | m=0; torus fractional and integral weights | tr₀=id; tr_m(T^(1/pᵐ))=0 for m>0; tr_m(T)=T; tr_m(1)=1, unlike inseparable algebra trace=0 | Real character projection required; retained |
| §3.7 Root-algebra derived duality | m=0; characteristic-two node; torus p=2,m=1 | r maps to multiplication by r and evaluation at 1 gives r; Hom(A/(v),A)=(u), Hom(A/(u),A)=(v); torus pairing diag(1,T) has determinant T∈A× | Derived duality survives non-flat node; missing-carrier explanation corrected |
| §3.8 Oriented continuous trace | d=0,1,2 | d=0 trace=id; d=1 top generator maps to 1; swapping d=2 generators gives determinant −1 | Tate orientation restores intrinsic pairing |
| §3.9 Almost continuous-cochain duality | d=0; trivial one-generator coefficients; nonopposite characters | d=0 adjoint b↦b; degrees 0 and 1 multiply to top generator with coefficient 1; nonintegral character sum has projection trace 0 | Completed sum-to-product only almost; retained |
| §3.10 Polystable local duality | Point; curve; two-torus | Point adjoint=1; curve integral and reduced targets both ω₀(−1)[−1] after reduction; two-torus paired degrees 0↔2,1↔1 | Local d shift distinct from global 2d shift |
| §4.1 Faltings pairing | Point; smooth curve; field line | Multiplication adjoint on unit=1; smooth curve target has nonzero degree 1; field-line ordinary adjoints both multiply by 1 | Derived perfection does not assert projectivity |
| §4.2 Rig-isomorphism descent | Identity; admissible nice blowup; point | Identity adjoint unchanged; generic blowup degree=1 while exceptional residue fibre can have dimension 1; point trace=1 | Derived pushforward retained, without special-fibre averaging |
| §4.3 Good quotients | G=1; split G-torsor; nontrivial generic stabilizer | Identity fibre size=1; split fibre size=|G| even at |G|=p; a fixed generic point has orbit size 1<|G| | Finite formal quotient contract distinct from generic freeness |
| §4.4 Equivariant almost derived operations | C_p over O_C/p; regular S₃-module; C₃ over F₂ | Trivial C_p H¹=O_Cᵃ/p≠0; induced S₃ module has one invariant sum and one coinvariant generator; 3⁻¹=1 in F₂ and higher cohomology=0 | Derived operations needed in wild characteristic |
| §4.5 Equivariant pushforward and Hom | G=1,C_p,S₃ | Identity comparisons=1; C_p H¹=O_C/p persists; for noncommuting g,h, inverse of gh is h⁻¹g⁻¹ | Inversion and finite-cohomological-dimension conditions retained |
| §4.6 Good-quotient descent | Split C_p torsor; S₃ | Invariants are diagonal M and coinvariants M; total unit trace=p=0 modulo p but component trace=1; S₃ invariant sum has six terms and component coinvariant trace=1 | Not a norm theorem for arbitrary modules |
| §4.7 Local almost duality | Point; uv=ϖ; t²=ϖ | Point adjoint=1; nodal residue has two reduced branches; t²=ϖ has nilpotent residue t≠0 and fails niceness | Uniformization contract names geometric input precisely |
| §5.1 Global almost trace | Point; two points at p=2; curve | Point trace=1; two-point (1,1) trace=0 modulo 2 and (1,0) trace=1; curve target has nonzero H², not H⁻² | Model cofinality explicit; no relative-layer input |
| §5.2 Global almost duality | Point; ℙ¹; two points | Point adjoint=1; ℙ¹ paired ranks 1 in degrees 0 and 2; two-point matrix diag(1,1) has determinant 1 although total unit trace may be 0 | Almost finite freeness precedes degreewise perfection |
| §5.3 Detection and top trace | Zero/identity F_p-map; two points | Zero map has kernel/cokernel dimension 1 and almost scalar extensions O_Cᵃ/p≠0; identity has both zero; two-point trace has kernel dimension 1 | Connected top-trace isomorphism scoped; parent locator repaired |
| §5.4 Mod-p Poincaré duality | ℙ¹; two points; i=2d+1; characteristic p | Mixed-characteristic ℙ¹ H⁰=F_p,H²(1)=F_p with pairing 1; two-point determinant=1; out-of-range paired groups=0; characteristic-p ℙ¹ has H²(F_p)=0 but H⁰=F_p | Mixed-characteristic and twist hypotheses essential |
| §5.5 Finite-local-system duality | Rank 0,r at a point; C₂ Jordan block over F₂ | Rank 0 gives 0↔0; rank r evaluation matrix=I_r; Jordan block has fixed line e₁ and trivial quotient, while degree-2 trace=0 | Sylow intermediate splitting uses odd degree; parent inputs narrowed |
| §5.6 Finite p-power derived duality | n=1,2; ℙ¹ | Λ_n⊗ᴸ_{Λ_n}F_p=F_p[0]; (ℤ/p²)⊗ᴸ_{ℤ_p}F_p has F_p in degrees −1,0; ℙ¹ top twisted trace=1 in degree 2 | Correct coefficient ring and shift retained |
| §5.7 Integral/rational traces | Point; ℙ¹; ℤ_p/p | Every finite projection sends 1 to 1; both integral and rational point-class traces=1; (ℤ_p/p)[1/p]=0 | On a smooth proper formal model, both constructions have identical finite projections, hence identical inverse-limit traces |
| §5.8 Integral derived duality | ℙ¹; [ℤ_p →p ℤ_p]; point | ℙ¹ pairs degrees 0 and 2; two-term H⁰=0,H¹=ℤ/p with Hom(ℤ/p,ℤ_p)=0, Ext¹=ℤ/p; point reduction pairing=1 | Whole-ring differential codomain corrected; derived Ext retained |
| §5.9 Rational duality | ℙ¹; torsion module; two points | ℙ¹ degree pairing matrix (1); torsion localizes to 0; two-point matrix diag(1,1) has rank 2, whereas product-of-sums matrix has rank 1 | Inverting p yields degreewise perfection over a field |
| §7.1 Constructible categories | Constant sheaf; point skyscraper; disjoint union indexed by j | Constant has one stratum; skyscraper has point/complement strata; Λ in degree −j has one finite bound per component and no global lower bound | Definition now uses one global locally finite stratification |
| §7.2 Affinoid algebraization | Structural identity Spec A; closed point; rank-r constant point sheaf | Structural identity is proper and gives equivalence; point sheaf has stalk Λ at that point and 0 elsewhere on both sides; rank-r H⁰=(ℤ/n)ʳ | Scheme argument Z corrected, including nonproper direct-image comparison |
| §7.3 Locality and generators | Point; finite point inclusion; C₂ Jordan block over F₂ | Constant finite module is one generator; skyscraper stalks Λ,0; Jordan filtration has two trivial rank-one quotients | Global condition equivalent to affinoid-local criterion by locality, not by presumed closure gluing |
| §7.4 Constructible proper pushforward | Identity; point inclusion; nodal curve; two point inclusions | Identity returns F; closed immersion has R⁰ skyscraper and Rⁱ=0 for i>0; nodal normalization dimension 1 and point terms dimension 0; S_a∩S_b=Y∖{a,b}, whereas intersection over all a contains no classical point | Per-map generic smoothness; explicit existing hyperdescent suppliers |
| §7.5 Field-extension invariance | Point; ℙ¹; rational split nodal curve; exponent p² | Point map 1↦1; ℙ¹ ranks 1,0,1 unchanged; split nodal ranks 1,1,1 unchanged, with top twist −1; point module ℤ/p² remains cyclic of order p² | Singular case reduced by smooth proper hyperdescent; toric input smooth only |
| §7.6 All-torsion proper base change | Identity g; ℙ¹ at n=p²; n=1; empty source | Identity exchange=id; ℙ¹ H⁰=Λ,H²=Λ(−1) on both sides; zero coefficients and empty source each give 0→0 | Derived range and constructibility retained; no circular use in §7.5 |
| §7.7 Constant cohomology sheaf | Z=point/two points; Z=point,Y=ℙ¹ | Degree-zero sheaves Λ,Λ²; positive direct images from a point=0; H²(point×ℙ¹,Λ)=Λ(−1) nevertheless | Corrected Z argument; sheaf statement does not assert constant product cohomology |
| reduced-model-cofinality contract | Reduced point over C; ramified point L=ℚ_p(π), π²=p; nonreduced point | Spf O_C has residue k reduced; O_L/p=𝔽_p[t]/(t²) has t≠0,t²=0; reduced-special-fibre model would equal O_L by Z line 4253, so cannot exist; C[ε]/ε² is not reduced | Algebraically closed base and reduced generic space explicit; ramified negative control added to §1.7 |
| refined-formal-algebraization contract | Point; smooth disc; product of two smooth coordinates | Algebraizations O_K, O_K[T], O_K[T₁,T₂] complete to O_K, O_K⟨T⟩, O_K⟨T₁,T₂⟩; generic and special dimensions are 0,1,2 respectively | Preserves smooth generic fibre and pure dimension; separate gap |
| finite-formal-quotients contract | G=1; split C_p and S₃ torsors | Invariant rings of A^G are diagonal A; quotient fibres have p and 6 elements; trace units are p and 6, not assumed invertible | Finite quotient exists independently of wild trace divisibility; FQ line 760 and FQ line 1349 |
| polystable-uniformization-zigzag contract | Smooth torus; node uv=ϖ; trivial group | Torus and node already polystable, so identity zigzag and G=1 suffice; nodal generic equation has no point with both partial derivatives zero, whereas uv=0 does | Smooth generic hypothesis and reduced residue models retained; no extra geometric target here |
| proper-generic-smoothness contract | Identity disc; point inclusions at a,b; all classical points | S_id=Y; S_a=Y∖{a}; S_a∩S_b=Y∖{a,b}; no single nonempty Zariski open excludes every classical point | Per-map quantification; uses finite intersection in §7.4 |
| valuation-upper-shriek contract | Identity; affine smooth curve; split two points | f!unit at identity=unit; smooth curve=Ω¹[1], with H⁻¹=Ω¹; split proper counit (1,0)↦1 | General universally coherent base, including valuation quotients; compactifications imported separately |
| valuation-duality-amplitude contract | Point; smooth dimensions 1,2; reduction modulo pⁿ | Point amplitude [0,0]; smooth units shifted by 1,2 have only H⁻¹ and H⁻² respectively; after reduction the same degree carries Ωᵈ/pⁿ | Negative interval [−d,0] and relative Tor amplitude explicit |
| valuation-canonical-reflexivity contract | Smooth disc; uv=ϖ; t²=ϖ | Smooth canonical line has double dual itself and generator dT; nodal hypersurface has rank-one invertible canonical sheaf; t²=ϖ has nilpotent residue t and is outside reduced-fibre hypotheses | Includes smooth generic fibre from Z line 755; does not infer reflexivity from smoothness alone |
| connective-totalization-truncation contract | Normalized cochains Λ →id Λ; 0→Λ →id Λ; zero object | First H⁰=ker(id)=0 while degree-zero-only gives Λ; second H¹=ker(id)=0 while stopping at degree 1 gives Λ; zero totalization=0 | Degree i+1 required at i=0,1; gap is algebraic only |
| integral-toric-field-extension contract | Point; smooth one-torus; nodal singular affinoid | At point map is O_C⊗̂O_C O_C′≅O_C′; torus trivial character cochain differential=0 and nontrivial character differential=ζ−1 before/after extension; node has two tangent directions but dimension 1 | Compatible Koszul map on smooth charts; node not permitted as an étale toric chart |
| finite-branched-covers contract | Empty branch locus; T↦Tʳ over punctured disc; disconnected split cover | Empty branch locus gives the same finite étale covers; away from T=0 derivative rTʳ⁻¹ is invertible in characteristic zero and degree=r, while at 0 it vanishes for r>1; split degree-two fibre has two points | Existing gap retained, not represented as a supplied theorem |
| general-nearby-coherence contract | Point; smooth two-torus; square-zero model | Point almost amplitude [0,0]; two-torus degrees 0,1,2 have ranks 1,2,1; nilpotent coefficient Cε/pCε=0 | Existing gap retained; singular/general theorem not replaced by smooth charts |
| quasi-excellent-direct-images contract | Identity; finite two-point map; open immersion of punctured affine line | Identity preserves F; finite two-point pushforward has rank 2 and no higher images; punctured-line constant sheaf has boundary stalk H⁰=Λ,H¹=Λ(−1) in characteristic zero | Nonproper direct images remain part of the explicit existing gap |
| Compactification input reused in §§0.3,1.1 | Proper identity; affine line over field; duplicate compactifications | Identity compactification is itself; A¹⊂ℙ¹ supplies an object; identical compactifications have identity strict refinement with inverse image of interior=A¹ | Nonemptiness and strict common refinements come from existing L2 targets |
| Formal/integral trace overlap of §5.7 | Point, ℙ¹, two points with smooth proper formal models | At every level traces are respectively 1,1,(x,y)↦x+y; inverse-limit traces therefore have the same values in ℤ_p; rationalization preserves 1 | Extends parent's trace while requiring no model for this package's general statement |
| Layer Examples and Worked examples | T↦Tᵖ; node; elliptic curve; big-site point | Coherent trace of dlog T=dlog S and trace after pullback=p; node root-stage length at p=2 is 3, not 2; elliptic H¹ symplectic matrix has entries 0,1,−1,0 and determinant 1 even modulo 2; big-site R² from point=0 while product H² with ℙ¹=Λ(−1) | Recomputed sign, trace, non-flatness and sheaf/product distinctions across their uses |

## Maintainer consequences

- Layer identifiers 0–5 and 7 are preserved; Layer 6 has no targets in this package. Its theorem and proof are imported from HodgeTateAndCanonicalSubgroups §7.6. No Lean declaration was renamed or deleted, because none existed. No downstream declaration-name migration is required.
- Removed gaps: valuation-models, valuation-coherent-duality, valuation-properness and proper-hyperdescent. Replacement gaps are reduced-model-cofinality, refined-formal-algebraization, finite-formal-quotients, polystable-uniformization-zigzag, valuation-upper-shriek, valuation-duality-amplitude, valuation-canonical-reflexivity and connective-totalization-truncation. The other five slugs remain, with proper-generic-smoothness and integral-toric-field-extension corrected. The README and top-level plan gaps are synchronized; other design data were left untouched as required.
- Supplier gaps are requests, not assertions that the suppliers already state their contents. AdicSpacesPartIIPartII explicitly lists generic smoothness and generic flatness as non-goals in its design introduction. Whether that supplier accepts proper-generic-smoothness is **not actionable in this package**; the existing named supplier gap records the mathematical requirement for a maintainer decision. No supplier scope or merge-order file was edited.
- Finite-presentation compactification is consumed from AdicCoefficientsAndComparisons L2; there is no duplicate compactification gap. Geometric descent is consumed from the earlier diamond and classical-cohomology suppliers. The residual totalization gap is independent of the arbitrary-base theorem this package proves.
- The general field-extension headline still includes singular proper spaces and extensions of positive transcendence dimension. Only the local toric proof input is restricted to smooth charts, after proper descent. The added nodal example has the required degree-one cohomology and is not discarded.
- The source issue in BH line 1113 affects its proof, not the field-extension theorem; the supplied smooth hypercover route repairs that step. H Proposition 2.18 remains an uncertified locator, with the mathematical constant-sheaf assertion derived from §7.6. A fresh independent review is still required; this report records repairs and checks, not acceptance.
