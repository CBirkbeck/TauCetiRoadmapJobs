<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12984#issuecomment-6857130086 -->
Red team round 1 pass a (codex) of 5df5bbf

Verdict: needs_changes

1. **F01** (P2) The unfiltered V-filtration axioms admit the constant filtration

   Location: `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:457`, “Construct its unique increasing rational filtration”; API at line 462, “The coherence, eigenvalue and shift conditions characterize `V`.”

   Claim: exhaustivity, discrete indexing, coherent `V₀D` pieces, the two shift inclusions and nilpotence characterize the filtration before imposing conditions involving `F`.

   Witness: on `M = O_{A¹}`, set `U_α = O` for every rational `α`. All listed conditions hold, but every `gr^U_α = 0`; the intended `gr^V_0 = ℂ` is nonzero.

   Exact repair text: “Require, already for the unfiltered filtration, that multiplication by `x : V_α M → V_{α−1} M` be an isomorphism for `α < 1`. The characterization includes this condition, independently of the subsequent strict `F`-specializability conditions.” Cite ESY Definition 2.2.2(1c), ESY line 1029, translated at `z = 1`, and Sai88 Definition 3.1.1 with its full shift condition. Add the negative-control Check: “The constant filtration `U_α O = O` has zero graded pieces but is excluded because `x : O → O` is not onto at the origin. For the genuine filtration, `V_0 O = O`, `V_{−1} O = xO`, and `x : O → xO` is an isomorphism.” This excludes the counterexample without imposing any additional hypothesis on `M`.

2. **F02** (P3) The punctured-curve Check fails for an empty puncture set

   Location: `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:424`, “For a rank-one variation with nontrivial finite monodromy at every puncture … `H⁰ = H² = 0`”.

   Claim: nontrivial local monodromy at every removed point forces the zeroth and second groups to vanish.

   Witness: take `C° = C = P¹` and `L = ℚ`. There are no punctures, so the monodromy condition is vacuous, but `H⁰ = ℚ` and `H² = ℚ(−1)`.

   Exact repair text: “For a connected curve with a nonempty puncture set and a rank-one variation having nontrivial finite monodromy at every puncture, `j_* L = j_! L` and `H⁰ = H² = 0`. With no punctures, the constant variation on `P¹` instead has `H⁰ = ℚ` and `H² = ℚ(−1)`.” The latter explicitly retains the boundary case that refutes the original.

3. **F03** (P2) The Künneth blow-up criterion compares the wrong orders

   Location: `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:1179`, “where the pole orders of `f` and `g` have opposite signs”.

   Claim: the indicated centres produce a non-degenerate compactification of the sum.

   Witness: take `f = 1/x`, `g = 1/y` at the crossing of their pole divisors. Pole-order pairs are `(1,0)` and `(0,1)`, never opposite in sign. CY lines 345–362 instead compare the differences of orders.

   Exact repair text: “On each intermediate model let `a_D` and `b_D` be the pole multiplicities of the pulled-back `f` and `g` along a boundary component `D`. Resolve crossings `D₁ ∩ D₂` for which `(a_D₁ − b_D₁)(a_D₂ − b_D₂) < 0`, following the termination argument in CY §3.1, pp. 8–9.” Add: “For `f = 1/x` and `g = 1/y`, the differences are `1` and `−1`, so the crossing is blown up. On `y = xu`, the sum becomes `(u+1)/(xu)`; its zero divisor meets the exceptional pole transversally at `u = −1`.” Before that blow-up three divisors `x=0`, `y=0`, `x+y=0` meet on a surface, so the original product model is not non-degenerate.

4. **F04** (P3) Two deep targets are missing from the unstatable-headline inventory

   Location: `packages/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean:22`, “Headline theorems not statable at the pins”; compare `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:1136` and `:1169`.

   Claim: the module docstring accounts for the headline results that the file cannot yet state.

   Witness: §12.5's graded acyclicity/regular-sequence theorem supplies §12.6; §12.8 proves the constant Gauss–Manin boundary correction. Neither appears in the docstring's list, which ends with §§12.3, 12.7 and 12.9.

   Exact repair text: append these bullets to that list:

   - “Kouchnirenko's graded acyclicity and regular-sequence theorem (Layer 12, target 12.5). Missing: the Newton-filtered cone algebra, its associated graded ring and the associated graded Koszul complex.”
   - “The constant boundary correction for a convenient Newton-nondegenerate Laurent Gauss–Manin system (Layer 12, target 12.8). Missing: mixed Hodge-module direct images of the torus map, their compact-to-ordinary comparison cone and the exponential projector.”

   Verification: these additions name the actual claims, rather than inserting substitutes. For §12.5, `φ=x+x⁻¹` gives graded ring `C[x,y]/(xy)` and quotient `C[x]/(x²)`; the existing Laurent quotient is a different construction. For §12.8, `φ=x+x⁻¹` gives zero boundary cone because the map is finite; its full statement requires the absent direct-image carriers. No additional Lean declaration is requested.

## Verified sound

Read all 1,232 README lines and all 154 Lean lines: 64 bold target paragraphs, the additional unbolded §1.1 target, 13 Lean declarations (12 definitions/abbreviations and one theorem), and 216 README Check bullets. The tables below record computed instances for all 65 target paragraphs and all 13 Lean declarations, including the failures; these finite tests do not certify unexamined instances. Eighteen named roadmap supplier contracts were checked against main/completed text or the supplied current heads. Seven declared gap slugs agree between the README and `design/plan.json`; none is reported merely because its supplier has not implemented it.

The Lean file is an acceptance test for the concentration and normalized-volume theorem. Its 12 native-carrier definitions are used transitively by that theorem. There is no padding theorem, sorry'd data, lost section binder, additional import, `lemma`, or `set_option`. The supplied elaborated signatures agree with the README, including both `hfull` and `hnd`, the degree-zero boundary convention and the scalar instances. No Lean build or fresh elaboration was run.

The headline inventory is: regular Riemann–Hilbert (§1.5); Zucker's curve theorem (§3.4); pure strict-support, projective image and mixed abelianness (§§4.4–4.7); Hodge operations and weights (§§5.1–5.3); exponential projector/tensor/weights/fibre (§§6.2–6.5); Deligne degeneration and bifiltered strictness (§§7.4–7.6); classicality of `tg` (§§10.1–10.2); Fourier costalks, Hodge numbers and monodromy weights (§§11.2–11.6); logarithmic comparison, Newton graded acyclicity, concentration/volume, Newton–Hodge comparison, constant boundary and filtered Künneth/duality (§§12.3, 12.5–12.9). The supplied pin has the carriers for §12.6 as written. The module docstring identifies missing geometric/filtered carriers for most other families; its omissions of §§12.5 and 12.8 are R04. No further headline was identified that is statable using only a few simple native definitions.

Native checks include `Mathlib/Algebra/MonoidAlgebra/Module.lean:73` (`coeffLinearEquiv`), `Mathlib/LinearAlgebra/Finsupp/LSum.lean:96`, `Mathlib/LinearAlgebra/Finsupp/Defs.lean:87`, `Mathlib/Analysis/Convex/Exposed.lean:55`, `Mathlib/Algebra/Module/ZLattice/Covolume.lean:318` and `Mathlib/Analysis/Convex/Measure.lean:38`. In particular, exposedness permits the empty face and the zero functional; the Lean predicate separately removes the empty face and every face containing zero. The covolume limit has boundedness, measurability and null-frontier hypotheses, all met by the lattice polytope. The quotient is by the sum of linear ranges, not by an ideal. The pinned Hodge carrier imposes no finite-dimensionality by itself; the README explicitly adds it. `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:88` supplies strictness for sums of Deligne pieces, including the stated point case of `W∩F`.

### Supplier and ownership audit

| Supplier contract checked | Witness and boundary computation |
|---|---|
| SpringerResolutionAndCharacteristicCycles §§8.2–8.5, 9.1–9.2, 9.4–9.7 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:855` and `:964`; δ has `x∂δ=−δ`, identity transfer shift 0. Good filtrations and regularity remain with this owner; the two stronger stability/specializability contracts are declared gaps. |
| ComplexComparisonPartII §§C-1.1, C5.1, C5.6, C6.0–C6.1 | `TauCetiRoadmap/ComplexComparisonPartII/README.md`, those headings: residue a gives monodromy `exp(−2πia)`; the rank-one Q stalk is dimension 1 but infinite cardinality, hence outside the finite-stalk dictionary. Arbitrary-ring compact supports are separately supplied. |
| FormalConnectionsOpers §F2.2 | `TauCetiRoadmap/FormalConnectionsOpers/README.md:707`; PBW on A¹ gives C[x,ξ] with ξ in order 1 and `[∂,x]=1`. |
| PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a–RD.6.53 | Those current headings give formal slopes and curve index over characteristic zero. On G_m with E^x, `χ=0−1=−1`, hence H¹ rank 1 after H⁰=0. No p-adic-only hypothesis is imported. |
| ShimuraData §§3.1–3.3; ShimuraVarieties §§3.5b.1–3.5b.2 | Pure rational variations/polarizations and nilpotent limits are imported. The Tate elliptic witness gives `Q(α,−log(T)α)=1` and the inverse period-lift monodromy gives the same 1. The quasi-unipotent rational operator has a stable lattice by its integral cyclotomic characteristic polynomial. |
| LefschetzPencilsAndVanishingCycles §§1.3–1.5, 1.7, 3.4 | Monodromy centres, primitive decomposition, relative uniqueness, normalized variation and pencils exist at these headings. A size-two block has graded ranks 1 at c−1,c+1; upper and lower primitive representatives are identified by N. Relative existence is not assumed for arbitrary mixed data. |
| ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2, 6.2 | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:791`, `:801`, `:893`; unit ideal gives no blow-up, zero ideal on a component is excluded; A¹ compactifies to P¹ with one boundary point. |
| EtaleCohomologyFoundations §§G.1–G.2 | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57`, `:105`; G_m→A¹ compactifies relatively in A¹, not P¹. Proper is not silently replaced by projective. |
| StratifiedSpacesAndTameTopology §§7.2–7.3; AlgebraicTopologyPartII §§16.1a–16.1e | Current heads separate finite C^k and Nash/smooth strata and supply controlled lifts. Rotation gives `dρ=0`; dilation gives `2ρ`. Algebraic-map stratification is added here, not copied from the definable carrier. |
| EnhancedDerivedSheaves §§0.1–0.4, E1.4 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, `:441`, `:455`, `:492`, `:580`; point-site tensor is derived module tensor; over Z the tensor of Z/2 with itself has degrees −1,0. The target's Q/C coefficient field avoids this unbounded-Tor problem. |
| SchemeAndStackFoundations §§0.17, 2.2, 2.6, 2.18, 2.20, 3.3, 4.11, 4.17, 5.5; AlgebraicCurves Layers 9,12 | Current main headings supply the stated coherent, curve, normal and blow-up carriers. Smooth complex curves satisfy the separably generated/rational-place hypotheses. On P¹ the exceptional negative twist −1 has zero H⁰,H¹, whereas −2 has H¹=C. |
| SchemeKTheoryOperations §5.7 | Its current contract gives the exceptional projective bundle and negative-twist vanishing for Koszul-regular centres. Here c=2,μ=1,G=O, so `Rp_*O_E(−1)=0`; the normal bundle has degree −1, not +1. |
| AnalyticToricGeometry Layer 0; AnalyticToricGeometryPartII §§0.1–0.3 | `Completed/AnalyticToricGeometry/README.md:186` and `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:117`, `:143`, `:166`. For P¹ and divisor d∞, weights are integers 0≤m≤d, giving d+1 sections when d≥0 and none for d=−1. Normal fan/refinement and rounded vanishing remain explicit gaps. |
| GroebnerGeometry §G2 | `TauCetiRoadmap/GroebnerGeometry/README.md:103`; saturation/normalization is supplied, Cohen–Macaulayness is the separate declared gap. For S={0},N,Z,N² the dimensions/depths are respectively 0,1,1,2. |

Ownership was searched by object in main, completed roadmaps, board packages and indexed open heads using `roadmaps grep`, followed by reads of the nearest scopes. HodgeStructures owns the linear core and is consumed through Tau Ceti. EtaleDualityAndPerverseSheaves §§3.5–3.6 uses finite/adic coefficients and their stable-lattice analytic essential image, not the unrestricted rational/complex Betti category here. SheafConvolutionOnAbelianVarieties owns convolution on abelian varieties and Fourier–Mellin/Fourier–Mukai, not additive Fourier–Laplace on A¹. MappingClassGroupsAndCanonicalRepresentations's additional variations are real/complex coefficient extensions, distinguished from the rational Hodge-module inputs here. No duplicate fully qualified Lean declaration was found. KloostermanMomentsAndPotentialAutomorphy consumes the general theory rather than owning it; the former-numbering map at README:152 resolves its lettered citations, including the moved formal differential-module/index supplier. The overlap record reports no second copy or dropped id requiring a repair.

The requested read-only dependency check returned:

```text
depcheck: 223 roadmaps, 1985 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` listed nine changed files, all inside `packages/MixedHodgeModulesAndIrregularHodgeTheory/`; no external package edit was found. The seven declared supplier gaps were checked for matching names and hypotheses, and retained as contracts, not defects.

### Statement-by-statement mathematical audit

Each row records actual values, not a proof of the general theorem. `Q` denotes the rational Tate line of weight zero; `K = j_! Q_{G_m}[1]`; `I` denotes the classical embedding. Unless a row says otherwise, the result is agreement on the recorded instances and no requested change. Characteristic two, inseparable maps, zero coefficient rings, non-separated spaces and arbitrary infinite-rank coefficients are excluded by the stated complex-variety and finite-dimensional rational/complex hypotheses; they are not silently added to the signatures.

| README target | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 1.1, line 189: map stratifications | `xy`: fibre at 1 is `C×`, at 0 is two axes; `G_m→A¹`: fibres are point/empty, with relative completion `A¹`; rotation gives `dρ=−2xy+2xy=0`, dilation gives `2ρ`. | Stratification and properness distinctions hold. |
| 1.2, line 200: constructible operations | Point, coefficients Q/C: tensor unit acts as identity and dual of a rank-r vector space has rank r; open/closed decomposition of A¹ has stalk triangle `0→Q→Q` at 0 and `Q→Q→0` off 0. Empty support gives `RΓ_∅=0`. | Agrees; no analytic-map generalization. |
| 1.3, line 218: perversity | On a smooth curve, `Q[1]` has stalk in degree −1 and costalk `Q[−1]` in degree 1; a point object has both in degree 0. On a reduced plane node `Q_D[1]` is perverse, despite the two branches. | Both inequalities have the stated signs; finite-dimensional stalks matter. |
| 1.4, line 235: cycles and normalized variation | Smooth constant: `ψ=Q, φ=0`; punctual constant: `ψ=0, φ=Q`. For `T=1+J`, `J²=0`, `log(T)=J`, so `var can=J/(2πi)`. If `var Nφ=0` but `Nφ≠0`, the series correction is still zero. | Both directions of the topological-variation criterion hold; nilpotent division is a polynomial with constant term 1. |
| 1.5, line 255: regular RH | `O_{A¹}` gives `C[1]`, `D/Dx` gives `C_0`; exponential `E^x` has analytically trivial flat bundle but algebraic twisted cohomology 0, while O has H⁰=C. | Boundary regularity excludes the false irregular equivalence. |
| 2.1, line 277: exponential twists | `f=0` gives d; `f=x` gives `p′+p`, with kernel/cokernel 0 on C[x]; `E^x⊗E^{−x}` gives d, and at infinity `d(1/x)/dx=−x⁻²`. | Tensor, dual and sign agree. |
| 2.2, line 295: Fourier transform | `FT(O)=δ₀`, `FT(δ_a)=E^{at}`; applying twice sends `δ_a→δ_{−a}`. Transported commutator `[τ,−∂τ]=1`. | Kernel sign and inversion agree, including a=0. |
| 2.3, line 312: convolution | `δ_a⋆δ_b=δ_{a+b}` and Fourier side `E^{at}⊗E^{bt}=E^{(a+b)t}`. `O⋆O` has O in degree −1; `δ₀⊗ᴸ_Oδ₀` likewise has the degree −1 Tor contribution. | Derived tensor and convolution shifts agree. |
| 2.4, line 329: localized Fourier | Input punctual `δ_a` with a≠0 gives `E^{at}`: slope 0 at 0 and 1 at infinity. Input O on G_m, extended by `j_+`, gives a localized rank-one regular output: slope 0. Zero input gives rank 0. | Claimed slope set includes all three cases. |
| 2.5, line 347: Fourier duality | `D FT δ_a=E^{−at}`; `r_+ FT Dδ_a=E^{−at}`. Without r the value would be `E^{at}` for a≠0. | Involution necessary. |
| 3.1, line 369: VMHS | Constant Q: `(weight,F⁰,F¹)=(0,C,0)`; Q(1): `(−2,F⁻¹,F⁰)=(−2,C,0)`. For the moving line `(1,t)`, derivative `(0,1)` is not in that line, so it cannot define flat W. | Fibre, twist, flatness and infinite-cardinality stalk controls agree. |
| 3.2, line 387: limiting MHS | Constant: N=0, weight w unchanged. Rank-one T=−1: `Ψ₁=0, dim Ψ_{−1}=1`. Tate elliptic block: `log T α=−β`; primitive pairings with `−log T` and `log T` are +1 and −1 respectively; limiting graded ranks at weights 0,2 are 1,1. | Full eigenvalue space and polarization sign agree. |
| 3.3, line 398: admissibility | Kummer weights −2,0: `NW₀⊂W₋₂`, so M=W. Weights −1,0 with `Ne=a≠0`: forced `M₋₂=0`, but `NM₀≠0`. Moving extension at infinity has graded F⁰ dimensions `(1,0)` instead of `(0,1)`; split extension gives `(0,1)`. | Both independent failure controls work; boundary tests essential. |
| 3.4, line 418: L² theorem | Constant on punctured P¹ gives H⁰=Q, H¹=0, H²=Q(−1); ordinary G_m instead has H¹=Q(−1). On genus g compact curve H¹ rank 2g, weight 1. Empty puncture set on P¹ satisfies the third Check's premise but has ranks 1,0,1. | The theorem survives these cases; repair the Check by R02. |
| 4.1, line 440: Rees and compatibility | Identity with source filtration starting 1 and target 0 gives Rees cokernel C[z]/(z), while filtered cokernel is 0; equal starting steps give both 0. Constant right module on curve starts at −1; closed-point left direct image starts at +1. | Strictness iff torsion-freeness and both shifts agree. |
| 4.2, line 457: V filtration | O: `gr₀=C, gr₁=0`; δ: `gr₀=0, gr₁=C`. Residue block `Ae₁=e₀`: `N e₁=−e₀=−x∂e₁`; topological variation on `x⁻¹e₁` is `−2πi e₁−2π²e₀`. Constant Uα=O has all graded pieces 0 but satisfies the listed unfiltered axioms. | Sign controls pass; characterization fails, R01. |
| 4.3, line 477: pure Hodge modules | Constants on A¹ have weight 1 and dual weight −1; point Q(m) has weight −2m. Tate elliptic primitive ψ and φ pairings both evaluate to +1 under the stated minus normalization, versus −1 with the other sign. | Dimension shift and specialization polarization agree. |
| 4.4, line 496: strict support | Constant on G_m: middle extension is Q_A¹[1], whereas `j_*` has quotient δ₀Q(−1). Rank-one T=−1 has ker/coker(T−1)=0, hence all three extensions agree. Mixed Kummer has nonzero extension class and does not split. | Pure and mixed scopes distinguished. |
| 4.5, line 506: projective image | P¹→pt: degrees −1,+1 give Q,Q(−1), weights 0,2. Blow-up A²: degree-zero image has two summands of weight 2. Open G_m→A¹ instead has weights 1,2. | Purity formula w+j and projectivity control agree. |
| 4.6, line 516: mixed Hodge modules | Point Q(−1): sole weight 2, F¹=C. Nonsplit Tate extension has two weight pieces −2,0 and Ext class in C/(2πiQ). The weights −1,0 counterexample has forced M₋₂=0 but nonzero NM₀. | Admissibility excludes the bad extension; zero object allowed. |
| 4.7, line 533: abelianness/strictness | `δ₀Q→K`: image=W₀K, quotient Q_A¹[1]; nonsplit point extension has `W₋₂∩F⁻¹=C`. Endomorphisms of Q(0) are Q, not C. | Rationality and intersection strictness controls agree. |
| 5.1, line 555: operations | Identity on pt gives identity; dual Q_A¹[1] has weight −1. On d-fold, diagonal tensor of two Q[d] is Q[2d]=pQ[d], not pQ. | Tensor and dual shifts agree. |
| 5.2, line 572: weights | G_m: H¹ ordinary Q(−1), weight 2≥1; H¹ compact Q, weight 0≤1. Dual Q(−1) has weight −2. Q[−1] has bound ≤−1 and dual Q[1] bound ≥1. | Both inequalities and reversal under duality agree. |
| 5.3, line 584: Hodge cycles | Smooth weight-m variation on a curve has module weight m+1 and ψ weight m; punctual V has ψ=0, φ=V. T=−1 has full nearby rank 1 but unipotent nearby rank 0. | Centres w−1 and w distinguished. |
| 5.4, line 601: costalk | Constant on A¹: costalk Q(−1)[−1] versus stalk Q[1]. Punctual V: costalk V in degree 0. Size-two unipotent block: coker N has dimension 1. | Costalk degree and twist agree. |
| 5.5, line 611: divisor localization | Smooth point in A¹ yields `0→δQ→j_!pQ→pQ→0`. Node in A² has local-support stalk ranks 2 in degree 0 and 1 in degree 1, versus rank 1 only in degree 0 for the false smooth-divisor formula. | General first sequence and smooth-only purity agree. |
| 5.6, line 621: rigidity | Constant pQ gives V=Q; Kummer local monodromy has rank(T−1)=1 and is excluded. Moving trivial-local-system extension has split class 0 at x=0 and nonsplit class i at x=i, and fails admissibility at infinity. | The admissibility hypothesis excludes the nonconstant example. |
| 6.1, line 644: EMHS | `RΓ(0)=0`, `RΓ(pQ_A¹)=Q[1]`, `RΓ(δQ)=Q`, `RΓ(K)=0` because Q→Q is identity. | Includes K and excludes both constant/punctual Q; not an ambient Serre subcategory. |
| 6.2, line 660: projector | `ΠδQ=K`, `ΠpQ=0`, `ΠK=K`; on each of these Π²=Π, and the unit δQ→K is not an isomorphism in MHM. | Reflector differs from intermediate extension. |
| 6.3, line 677: tensor | `K⊗_E K=K`; zero factor gives 0; `Πδ_a⊗_EΠδ_b=Πδ_{a+b}`, yielding K when a+b=0. | Unit and addition agree. |
| 6.4, line 694: exponential weight | K has ambient weight ranks `(0:1,1:1)` and exponential sole weight 0; `ΠδQ(1)` has sole exponential weight −2. | W^E differs from ambient W. |
| 6.5, line 711: fibre | `ω(pQ)=0`, `ωδ_aV=V_C`, `dim ωK=1`. For f=θ, derivative+1 on C[θ] has zero kernel/cokernel; point δ has one-dimensional cokernel. | Faithfulness is only on EMHS, not all MHM. |
| 6.6, line 728: Fourier localization | `FT δ₀=O`, localization gives O(*0)=FTK; `FT O=δ₀`, localization gives 0. Localizing δ₀ in the input instead would give 0 rather than K. | Coordinate of localization correct. |
| 7.1, line 750: Deligne filtration | δQ(−1) gives F¹=C and F^(1+ε)=0; pQ gives all fibre steps 0; d(e^(1/x))/dx=−x⁻²e^(1/x). | Ceiling and exponential sign agree. |
| 7.2, line 767: Laplace specialization | `z∂θ+τ=−zx²∂x+τ`; setting τ=z gives z(∂θ+1), while τ=1 would give z∂θ+1. For δQ, λ=0 gives C and λ=1/2 gives 0. | Specialization and endpoint agree. |
| 7.3, line 777: twistor objects | At a=1/2,b=1/4, growth lattice exponent ceil(b−a)=0 versus canonical ceil(b)=1; at a=0 both equal ceil(b). Trivial harmonic line on P¹ gives twistor weights −1,+1 in shifted degrees −1,+1 versus Hodge weights 0,2. | Deligne type and weight normalization discriminate. |
| 7.4, line 794: pure strictness | δQ: filtered cohomology maps are C→C or 0→C; constant pQ on P¹ after exponential localization gives 0→0. On A¹ the termwise differential sends 1 to dθ≠0 despite zero cohomology. | Strictness concerns hypercohomology, not zero differential. |
| 7.5, line 804: mixed degeneration | Extension `0→δQ→K→pQ→0` gives fibre sequence `0→C→C→0`; each nonzero map is the identity at F⁰, and F¹ is 0 throughout. | Weight dévissage and nonzero termwise differential are consistent. |
| 7.6, line 814: bifiltered strictness | δQ→K gives identity on a line with W⁰ and F⁰; pQ→j_*pQ gives 0→C, with image and induced W∩F image both 0. | Simultaneous strictness matches the pinned point theorem. |
| 8.1, line 836: classical embedding | `I(Q)=K`, `φ₁K=Q`; `Πδ_aQ` for a≠0 has nonzero fibre of dimension 1 but φ₁ at origin=0. | Inverse on classical subcategory only. |
| 8.2, line 853: filtration agreement | Q(−1): λ=1 gives C, λ=3/2 gives 0; Q: λ=0 gives C, λ=1/2 gives 0. Nonsplit Q(1)–Q extension has dimensions F⁻¹=2,F⁰=1. | `F^ceil(λ)` and weights agree. |
| 9.1, line 875: pair cohomology | Point f=0: only degree 0, I(V); A¹,f=t: all groups 0; A¹,f=0: ordinary degree 0 I(Q), compact degree 2 I(Q(−1)). | Shift r−d agrees, including d=0. |
| 9.2, line 892: de Rham realization | Punctual coefficient on d-fold contributes in unshifted degree d; G_m,x has H¹=C; A¹,x has H⁰=H¹=0. | Perverse-to-unshifted normalization agrees. |
| 9.3, line 902: Künneth/duality | G_m,x compact H¹ has jump 0 and G_m,−x ordinary H¹ jump 1, pairing into Q(−1). Same-sign product lands in H²_c(G_m,2x)=0. A¹,x product with A¹,0 has all groups 0. | Minus sign necessary; degree and twist correct. |
| 9.4, line 912: middle weight criterion | G_m,x: weights compact 0, ordinary 2, middle 0-object, both gr¹=0; A¹,x²: all central compact/ordinary/middle groups rank 1 and pure weight 1, comparison iso. | Both sides of iff agree on vanishing and nonvanishing cases. |
| 9.5, line 922: divisor sequences | A¹,x, D={0}: compact H¹(G_m,x)=Q; ordinary H¹(G_m,x)=Q(−1). Node `xy=0` retains support ranks 2,1 from 5.5 rather than a single smooth-divisor term. | Localization signs and singular restriction agree. |
| 9.6, line 932: torus sum | k=0: comparison Q→Q identity. k=1: ordinary Q(−1), compact Q, comparison 0. k=2: ordinary Q(−2), compact Q, both dimension 1; `2! vol(simplex)=2·1/2=1`. | Boundary case prevents identically-zero comparison. |
| 10.1, line 952: tg classicality | V=pt,g=0 gives ordinary degree 0 Q, compact degree 2 Q(−1); V=pt,g=1 with constant coefficient gives all groups 0. g=x² has zero support the same point as g=x, despite its doubled scheme structure. | Claims are topological on the zero support; coefficient-localized variants must be distinguished. |
| 10.2, line 962: zero locus | g=x: ordinary/compact degree 2 Q(−1). g=0 on pt: ordinary degree 0 Q, compact degree 2 Q(−1). g=xy on A²: support H²=Q(−1)²,H³=Q(−2). | Degrees, reduction and singular support agree. |
| 11.1, line 984: Fourier cohomology | δ₀V gives H⁰=V; pQ gives H¹=Q(−1); δ_a with a≠0 gives 0 in all degrees because ∂+a on C[t] is bijective. | Pair-degree j+1 is correct. |
| 11.2, line 1000: costalk theorem | Constant gives Q(−1) in degree 1; δ₀V gives V in degree 0; K gives Q in degree 0 and Q(−1) in degree 1, matching H⁰,H¹ of O(*0). | Both costalk degrees match. |
| 11.3, line 1010: Fourier Hodge numbers | Smooth pQ (w=1): H¹ jump 1, weight 2=w+1. Rank-two unipotent block: coker N rank 1, not generic rank 2. Punctual δ₀V violates the hypothesis and has H⁰=V. | Smoothness/punctual-section distinctions correct. |
| 11.4, line 1020: constant correction | M=δQ(w=0): M′=pQ of weight 1=w+1. T=−1 middle extension has RΓ=0 and M′=0. Constant weight-1 correction Fourier H¹ has weight 2. | Weight shift and zero correction agree. |
| 11.5, line 1030: stationary phase | O: output φ₀FT has rank 1=input ψ∞ rank 1. δ_a: both 0. `D/D(τ∂τ)²`: FT relation `(t∂t+1)²`; input `N=τ∂τ` maps to output `−(t∂t+1)`, both rank-one nilpotents. | Nonzero nilpotent example fixes sign; φ₀M would be wrong. |
| 11.6, line 1041: weights at infinity | δQ(w=0): ψ∞ΠM=Q weight 0, M″=pQ ambient weight 1. For blocks of lengths 1,3, primitive indices are k=0,2 and the correction weights are w+2,w+4. | Centres w and primitive +2 shift agree. |
| 12.1, line 1063: logarithmic complex | Point f=0: F⁰=C,F^(1/2)=0. x² on P¹: q=1,λ=1/2 gives floor(2(1−1/2))=1; x gives floor(1/2)=0. G_m,x compact twist removes {0}, not the pole {∞}. | Multiplicities and truncation agree. |
| 12.2, line 1080: blow-up comparison | z/x: chart z=xz′ gives z′, chart x=zx′ gives 1/x′; exceptional multiplicity 0. On P¹, O(−1) has (h⁰,h¹)=(0,0), O(−2)=(0,1), O(1)=(2,0); E²=−1. | Centre dimension and exceptional sign agree. |
| 12.3, line 1091: model independence | A¹,x gives zero at every step. G_m,x ordinary jump 1, compact jump 0. A¹,x² has H¹ rank 1 at λ=1/2 and zero above 1/2 on either model. | Rational rather than just integer filtration comparison agrees. |
| 12.4a, line 1103: Euler/Koszul definitions | n=1,φ=x: `D x^m=m x^m+x^(m+1)`, cokernel dimension 1. φ=0,n=2: cohomology dimensions 1,2,1. n=2,φ=0,ω=xy: actual d²=xy−xy=0, all-plus d²=2xy≠0. | Real definitions preserve grading and square zero; degree-zero boundaries=0. |
| 12.4b, line 1118: Newton definitions | x: Δ=[0,1],h(m)=m on m≥0; a=0,1 section dimensions 1,2. x+x⁻¹: Δ=[−1,1],h(m)=abs(m). (x+y)²: face Euler pair vanishes at (1,−1). n=0: Δ={0}, volume 1; at a=−1 monomial span=0 versus H⁰(O)=C, excluded. | Full dimension, face nonemptiness and a≥0 distinguish boundary cases. |
| 12.5, line 1136: graded acyclicity | x²: quotient C[x]/x², Hilbert polynomial `1+t^(1/2)`, dimension 2=volume. x+x⁻¹: graded ring C[x,y]/xy, quotient by x−y=C[x]/x², dimension 2. Degenerate (x+y)² gives common factor x+y and nonzero H¹. Empty variable set gives C in degree 0. | Cone algebra is correctly distinguished from its graded ring. |
| 12.6, line 1149: concentration/volume | n=0: sole H⁰=C, finrank 1=0!·1. n=1,x: H¹ dimension 1=1!·1. x+x⁻¹: dimension 2=1!·2. n=2,x+y: dimension 1=2!·(1/2). n=2,x: H¹=H²=C, but affine span has dimension 1<2, so excluded. | Headline agrees with Lean; no padding. |
| 12.7, line 1159: Newton/Hodge | G_m,x: top constant monomial has h=0 and jump λ=1; G_m,x²: basis 1,x gives jumps 1 and 1/2. Both Newton and logarithmic calculations give these values. | Convenience is unnecessary and spanning monomials are not claimed independent. |
| 12.8, line 1169: constant boundary | x+x⁻¹ on G_m: finite degree-2 map is proper, cone 0, central rank 2 pure weight 1. x on G_m: compact/ordinary weights 0,2 and comparison 0, but 0 lies on boundary of [0,1], so convenience fails. Two-variable convenient example has positive-dimensional affine fibre, hence is not proper. | Convenience separates the cases; properness is not asserted. |
| 12.9, line 1179: filtered Künneth/duality | G_m,x twice: ordinary jumps 1+1=2, compact 0+0=0. For the one-dimensional pairing, ann(F⁰_c)=0=F^(>1)_ordinary and ann(F^(1/2)_c)=C=F^(>1/2)_ordinary. For 1/x+1/y the two pole differences are +1,−1 but all pole orders are ≥0. | The theorem's filtration endpoints agree; repair proof route by R03. |

### Lean declaration and context audit

All names below lie in `TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory`, Layer 12, README §12.4 except the theorem in §12.6. There is no `variable` or `include` block, no universe parameter or local instance omitted by declaration elaboration. Scalar, additive-group, module and finite-index instances are the native instances on C, Z, `Fin n`, the monoid algebra and its submodule quotients. The supplied elaborated signatures were compared with the file; no new Lean process was run.

| Declaration / line | Complete parameter context | Positive and negative/boundary values | Result |
|---|---|---|---|
| LaurentRing / 66 | `(n : Nat)` | n=0 gives C; n=1 contains x and x⁻¹ with product 1; ordinary C[x] would omit x⁻¹. | Needed carrier, real body. |
| eulerDerivation / 70 | `{n : Nat} (i : Fin n)` | θ(x²)=2x², θ(x⁻¹)=−x⁻¹, θ(1)=0; n=0 has no i. | Coefficient map has correct sign, not ordinary derivative. |
| twistedEuler / 78 | `{n : Nat} (φ : LaurentRing n) (i : Fin n)` | φ=x: D1=x, Dx⁻¹=−x⁻¹+1; φ=0 gives θ, not θ+1. | Multiplication term correct. |
| twistedDifferential / 86 | `{n : Nat} (φ : LaurentRing n)` | n=2: (dω)₀₁=D₀ω₁−D₁ω₀; n=0 gives zero; d²(xy)=xy−xy=0. | Sign exponent and erasure correct. |
| forms / 94 | `(n q : Nat)` | n=2: allowed coordinates number 1,2,1 at q=0,1,2; q=3 gives zero; n=0,q=0 gives C. | Intersection of forbidden-coordinate kernels is the intended subspace. |
| cocycles / 98 | `{n : Nat} (φ : LaurentRing n) (q : Nat)` | n=1,φ=0,q=0 gives C·1; φ=x,q=0 gives 0; q>n gives 0. | Intersects grading and kernel. |
| coboundaries / 104 | `{n : Nat} (φ : LaurentRing n) (q : Nat)` | q=0 has no p+1=0, supremum=0; q=1 uses p=0; q>n gives 0. | No natural-subtraction junk at degree 0. |
| topCohomology / 111 | `{n : Nat} (φ : LaurentRing n)` | n=0: supremum over empty Fin 0=0, quotient C; n=1,φ=x: quotient dimension 1; φ=0: also 1, but lower cohomology nonzero. | Top quotient, not quotient by an ideal. |
| latticePoint / 115 | `{n : Nat} (m : Fin n → Int)` | (−1,2) maps to (−1,2) in R²; empty tuple maps to sole point. | Native casts preserve negatives. |
| newtonPolytope / 118 | `{n : Nat} (φ : LaurentRing n)` | φ=0 gives {0}; φ=x gives [0,1]; φ=x+x⁻¹ gives [−1,1]. | Includes origin even absent from support. |
| faceEulerEval / 124 | `{n : Nat} (φ : LaurentRing n) (σ : Set (Fin n → Real)) (j : Fin n) (z : Fin n → Complex)` | φ=x⁻¹,σ={−1},z=2 gives −1/2; empty face gives 0; at z=0 negative powers totalize to 0, but the subsequent predicate excludes z=0. | Evaluation on torus correct; totalized boundary is not used. |
| IsNewtonNondegenerate / 134 | `{n : Nat} (φ : LaurentRing n)` | φ=x: face derivative z≠0; (x+y)²: derivatives both 0 at (1,−1), false. φ=0: true vacuously, but n≥1 fails hfull. Empty face excluded; whole face contains origin. | Quantifiers and exposed-face convention correct. |
| twistedDeRham_concentration_finrank / 146 | `{n : Nat} (φ : LaurentRing n) (hfull : affineSpan R (newtonPolytope φ)=top) (hnd : IsNewtonNondegenerate φ)` | n=0: concentration outside 0 is 0≤0, finite C, 1=1; n=1,x: H⁰=0 and dimension 1=1; n=2,x+y: top dimension 1=2·1/2; constant in n=1 fails hfull and would give 1≠0 in the volume formula. | One substantive headline, both hypotheses present in elaborated type. |

### Source verification and independence

Verified 63 locator groups in 14 legally cached works, enumerated here; a group can include adjacent numbered statements. This count excludes the settled unavailable works and does not certify every reference hidden inside a cited proof.

| Source | Groups | Verified locators and extraction anchors |
|---|---:|---|
| Kash84 | 1 | §6 Main Theorem: Kash84 line 1146; the analytic equivalence is converted to the stated algebraic regular form by the explicit algebraization route. |
| Kash86 | 3 | §1.6 at Kash86 line 78; §§1.8–1.9 at line 89; Proposition 1.10.1 and its proper-modification argument at line 135. |
| Sai88 | 4 | Definition 3.1.1/Lemma 3.1.2 at Sai88 lines 1762,1773; Definition 5.1.6 at line 3352; Definition 5.2.10 at line 3740; Theorem 5.3.1 at line 4017. |
| Sai90 | 4 | Introduction/Theorem 0.1–Proposition 0.3 at Sai90 lines 67–104; Theorem 3.21 at line 2769; Theorem 3.27 and the algebraic remark at lines 3080,3128; Remark 4.6(1) at line 3656. |
| FSY | 21 | Proposition 2.4; Proposition 2.21 at FSY line 695; §4.3.1 at line 1474; §§A.1,A.2; Lemma A.2; Example A.3 at line 2872; §A.3; Proposition A.10 at line 2949; Lemma A.12; Proposition A.13 at line 2972; (A.14) at line 2981; Example A.15; Definition A.18; Proposition A.19 at line 3024; Example A.22; Theorem A.24 at line 3090; Example A.27; Notation A.29; Theorem A.30 at line 3241; Corollary A.31. The whole appendix was read. |
| KS | 3 | §4.2 at KS line 963; §4.3/Definition 8 at line 1124; §4.4/Definition 11 and Propositions 2–3 at line 1205. |
| ESY | 5 | Theorem 1.2.2 at ESY line 289; Proposition 1.7.4 at line 884; Definitions 2.2.1–2.2.2 at lines 1002–1033; Proposition 3.1.2 at line 1172; Theorem 3.3.1 and Lemma 3.3.3 at lines 1269–1298. |
| Sab10 | 2 | Theorem 6.1 at Sab10 line 1360; Proposition 6.10 and proof at line 1554. Its negative exponential is changed by the stated coordinate involution. |
| Sab05 | 5 | §1.3.c at Sab05 line 992; Lemma 2.2.2 at line 2009; Theorem 5.0.1 at line 5061; §§5.2.c–5.2.e at lines 5345–5419; Theorem 6.1.1 at line 6405. |
| MT | 2 | Proposition A.3 at MT line 2062; Lemma A.4 at line 2108, with its Fourier sign and monodromy correspondence. |
| Yu | 7 | Theorem 2.2 at Yu line 711; Theorem 4.1 at line 1397; Corollary 4.2 at line 1414; Proposition 4.3 at line 1423; Proposition 4.4 at line 1533; Lemma 4.5 at line 1549; Theorem 4.6 at line 1663. |
| AS | 3 | (4.3) at AS line 442; Theorem 4.13 at line 569; Theorem 5.1 at line 583, specialized with r=a=0. |
| DL | 1 | §§3.3–3.7 and §3.9(c), DL lines 251–339: boundary local acyclicity; the characteristic-zero constant-local-system step is supplied separately in the README. |
| CY | 2 | Theorem 1 at CY line 56; §§3.1–3.2 at lines 333–425, including the signed differences corrected by R03. |

For wording, 62 distinct passage positions were compared with their source text, giving 94 passage/source comparisons across the 14 works. The comparisons include the five additional convention/API-or-Check/proof/docstring passages at README:46, :688, :1130, :1179 and Suggested.lean:138. A normalized alphabetic-word comparison found a maximum common run of seven words; inspection of these matches and the proof-route phrasing found no copied nonmathematical sentence, translated passage, table, figure or example list. Common mathematical names, hypotheses and formulas were not treated as copied expression. The numeric match ledger is retained in the scratch notes; no source extraction was copied into the package or report.

The largest source is FSY: 40 of 165 source-prefixed citation/locator occurrences before the bibliography, counting a source-prefix occurrence once rather than each theorem in a range. Its contents are at FSY lines 14–51. The apparent correspondences are `Layer 2 ↔ A.1`, `Layers 4–5 ↔ A.2`, `Layers 6–7 ↔ A.3`, `Layer 8 ↔ A.4`, `Layer 9 ↔ A.5`, `Layer 10 ↔ A.6`, `Layer 11 ↔ A.7`. They are not a one-to-one replication with identical scope: the independent Betti and variation layers precede Saito's construction; the Rees/twistor engine is split out; Layer 11 adds MT's stationary phase and monodromy-weight machinery; Layer 12 builds AS/Yu/CY's logarithmic and Newton endpoints. The retained classical→pair→tg→Fourier order is forced by §§9.1,10.1,11.1's explicit Needs lines. No source-arrangement finding is raised.

## Not verifiable

- Zucker is waived; Dimca, Schmid, SZ, Verdier, Kash76 and Kou are settled uncertified citations. Their exact text, including Zucker's analytic-domain assertions and Kou's face-algebra exact sequence, was not recertified. No replacement text is requested.
- Some mathematical formulas in the OCR of Sai88, Sai90, Kash84 and DL lose symbols. The listed readable statements and independent sign computations were checked; unreadable glyphs were not classified as source errors. Published-versus-preprint numbering beyond the manifest's explicit version notes was not independently compared.
- No new elaboration was run because this is a read-only pass with Lean builds prohibited. The supplied 13 elaborated signatures were used; no declaration was edited, so there is no changed signature to re-elaborate.
- The full internal proof of every cited analytic theorem was not reproduced. The source-verification table identifies the actual checked locator groups; settled inaccessible proofs remain conditional on their citations.

## Source issues

- **Misprint** in FSY at §A.2, p. 61, FSY line 2800: the source says left-to-right conversion uses `F_{p−d}`; it should be `F_{p+d}`, giving the constant right module its first step at `−d`; affects a stated result.
- **Misprint** in FSY at §A.2, p. 62, FSY line 2832: the source says the dual constant perverse Hodge module has twist `−d`; it should be twist `d`, of weight `−d`; affects a stated result.
- **Misprint** in FSY at Example A.3, p. 63, FSY line 2876: the source says divisor restriction is perverse in degree zero; it should be `i^*pQ_U=pQ_D[1]`, with perverse cohomology in degree `−1`; affects a stated result.
- **Misprint** in FSY at Example A.27, p. 71, FSY line 3222: the source says the composite direct-image functor is zero; it should be direct image along the constant-zero function, which is generally nonzero; affects the proof.
- **Misprint** in FSY at Theorem A.30, p. 71, FSY line 3241: the source says the costalk inclusion is into the output t-line; it should be the inclusion into the input τ-line on which M lives; affects a stated result.
- **Misprint** in FSY at Proposition 2.21, proof footnote, p. 17, FSY lines 736–739: the source says boundary direct images are constant for every fan cone; it should restrict this assertion to nonzero boundary cones, excluding the zero cone's original torus map; affects the proof.
- **Error** in Yu at §4(a), p. 26, Yu lines 1377–1378: the source says convenience makes the Laurent-polynomial map proper; it should assert exhaustiveness only; `x+x⁻¹+y+y⁻¹` has a positive-dimensional affine zero fibre; affects a stated result.
- **Misprint** in AS at §4, p. 68, AS lines 422–424: the source says the degree-l filtration bound is `k/e−l`; it should be `k/e+l` so the twisted differential preserves the filtration, as also recorded at Yu line 1443; affects the proof.
- **Misprint** in MT at Lemma A.4, proof, p. 39, MT line 2116: the source says the Fourier module is the degree-zero direct image by p; it should use the output projection q introduced two lines earlier; affects the proof.

Source independence: 62 distinct passage positions, 94 passage/source comparisons with 14 sources; no nonmathematical copying found; largest share FSY, 40 of 165 source-prefixed locator occurrences; FSY contents compared: dependency-driven, with independently scoped layers.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5df5bbfd4cf36d11d5bded0138e4ffae68231b5b", "job": "RT-MixedHodgeModulesAndIrregularHodgeTheory~1a", "model": "gpt-6-astra", "worker": "chris-8"} -->
