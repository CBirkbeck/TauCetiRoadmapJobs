# Review of MorseTheory (pull request #1682 at fc36307)

**Verdict:** needs changes

:robot: Independent AI review. Four findings, two blocking (P2). The supplied gate passes. All three requested files were reviewed; the pull request was not changed.

The eight findings from the review at ca82e38 were checked first. No supplied repair report marks any of them “not actionable in this package”.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01 strong restriction | README:684–685: “into its compact-core C^k seminorm topology”; strong restriction requires “proper, equivalently clopen”. | Repaired. The endpoint counterexample is now an explicit Check at :700. |
| R02 complementary index | README:198–201: “at a nondegenerate critical point” and “without nondegeneracy do not imply that identity”. | Repaired; the constant-function negative control is at :216. |
| R03 Part II boundary | README:1096: “Palais–Smale compactness without properness”. | Not repaired; R01 below. |
| R04 CW headline | Suggested:108: “theorem exists_morseCWModel”. | Repaired. Native CW cells and their index-labelled equivalences are present. |
| R05 intrinsic convergence | Suggested:200: “theorem exists_compactTrapped_gradient_limit”; :215 uses “Manifold.riemannianEDist”. | Repaired for compact trapping, including intrinsic exponential decay. R02 below concerns the separate Palais–Smale headline. |
| R06 extra Lean form | PalaisSmaleTargets:2–4 still imports Mathlib submodules; :8 still says “M6.1”. | Not repaired; R03 below. |
| R07 locators/records | README:242–250 separates persistence from the Morse lemma; :688 names Hirsch; :989–1022 separates Bott assertions and extensions. | Partly repaired. Claim attribution improved; missing source records and incomplete page locators remain, R04. |
| R08 definition Checks | README:493–495 tests inclusion; :901–903 computes the minimum on empty/point/circle. | Repaired. Compact seminorms also have API bullets and three numerical controls at :252–267. |

## R01 (P2) — Put the nonproper extension in MorseTheoryPartII

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1096`: “Palais–Smale compactness without properness”; also `PalaisSmaleTargets.lean`.

**Claim:** The existing roadmap is extended with a sequential compactness condition, noncompact-band deformation, complete-manifold continuation and Palais–Smale convergence.

**Witness:** Main's `TauCetiRoadmap/MorseTheory/README.md:649` limits M6 to compact trapping/proper sublevels. For f(x,y)=x, PS holds since ‖grad f‖=1, but f⁻¹[0,1]=[0,1]×ℝ is noncompact.

**Repair:** Move §6.2 and its acceptance statements to MorseTheoryPartII. State where base M2/M6 stop and consume them by section. Retain the corrections to existing targets here. Preserve the projection Check: normalized flow (x−t,y), speed 1, retracts the noncompact strip onto its lower face. This is repairable by separating the extension; rejection of the existing roadmap is unnecessary.

## R02 (P2) — State the Palais–Smale headline at the promised manifold generality

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1151`: “native finite-dimensional real inner-product-space specialization”; `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:47`, `exists_forwardTrajectory_converges`.

**Claim:** §6.2 promises global forward existence and exponential convergence on complete smooth Riemannian manifolds. The extra file tests only a fixed inner-product vector space and only convergence; Suggested.lean neither states the PS headline nor names a missing carrier for it.

**Witness:** On the round circle, f(θ)=cos θ has θ(t)=2 arctan(eᵗ) from θ₀=π/2, tending to π with distance 2 arctan(e⁻ᵗ)≤2e⁻ᵗ. The circle is not the vector-space carrier E.

**Repair:** In Part II's Suggested.lean, define the sequential PS predicate using the native tangent-fiber Riesz gradient and state global existence/convergence with intrinsic exponential decay. Use a smooth Riemannian bundle, compatible complete extended metric, Morse f, bounded-below range and the PS hypothesis. Keep the manifold and metric hypotheses in the elaborated theorem.

A scratch signature with precisely these native carriers elaborated with one sorry warning: `Bundle.RiemannianBundle`, `IsContMDiffRiemannianBundle`, `IsRiemannianManifold`, `CompleteSpace`, `IsMIntegralCurveOn` and `Manifold.riemannianEDist`. Its only new definition is the real sequential predicate. Thus no missing-carrier explanation justifies the specialization. The repaired statement includes the circle computation above and the zero-dimensional constant curve.

## R03 (P3) — Fix the extra Lean file's imports, docstring and name correspondence

**Location:** `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:2`: “import Mathlib.Analysis.Calculus.Gradient.Basic”; :7–9 still uses the old suggested-forms description and section “M6.1”.

**Claim:** The Lean form applies to this file too. It lacks the single `import Mathlib`, the required target-signatures module description and layer heading, and its five declaration names are absent from the README.

**Witness:** Lines 2–4 import three Mathlib submodules. The associated README section is §6.2, and contains none of `Satisfies`, `of_isProperMap`, `finite_criticalValueBand`, `exists_gradient_lowerBound`, `exists_forwardTrajectory_converges`.

**Repair:** When moving the extension, use one `import Mathlib` followed by used Tau Ceti modules, the prescribed module/layer descriptions, and matching names in the README. The combined scratch file elaborated all five signatures after import normalization; the four admissions remained nontrivial under the one-tactic probes. The supplied passing gate does not establish this extra file's form.

## R04 (P3) — Finish source records and page locators

**Location:** `TauCetiRoadmap/MorseTheory/README.md:688`: “Hirsch, Chapter 6, Theorem 1.2”; :598: “Milnor, Lemma 3.6”; references at :1194–1212.

**Claim:** The six cited works have no `TauCetiRoadmap/MorseTheory/sources.toml` records. Several theorem-level references still omit printed pages, despite the improved attribution of persistence and Bott extensions.

**Witness:** The folder has no sources.toml. `milnor-morse line 3623` locates Lemma 3.6 on printed pp.20–21; the README gives no page. Hirsch's theorem and topology citations also give no page.

**Repair:** Add one provenance/status record per work using the stable keys listed below; add verified printed-page locators to each cited theorem. Preserve Hirsch's uncertified status unless a legal text is supplied, and describe Mark's unavailable homework honestly. Do not rename settled source keys. The compact-band/CW test cases remain x² on ℝ and the discrete proper exhaustion; changing reference metadata must not narrow those statements.

## Verified sound

The review covers all fifteen seeded sections, the twelve admissions and four definitions in Suggested.lean, and the four admissions and one definition in PalaisSmaleTargets.lean. The calculations below are adversarial examples, not proofs of the general theorems. No false mathematical claim was found in the retained base-roadmap statements.

**Build and signatures.** Head fc3630716b63f19e19abfb8a68efe1ec6dda86bf; Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; context main fa41b3747f56d4e77bd69e7099c1be4f2e4959ba. Outside-folder diff is empty and the worktree stayed clean. No algorithm, sorry'd data, set_option, copied source passage or suspicious embedded instruction was found in the reviewed files.

Supplied gate at this head:

```text
gate MorseTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Direct Suggested.lean elaboration exited 0 with twelve sorry warnings only. A combined scratch audit printed `#check @name` for all twenty-one declarations and compared their signatures with the README. The three flagged raw definitions intentionally omit geometric binders, as README:32–35 specifies; every base theorem retains finite dimension, boundarylessness, Hausdorffness, smooth manifold structure and second countability. PS `Satisfies` retains completeness needed by the native gradient, while its four theorems retain finite dimension. No lost-binder finding.

For every one of the sixteen admitted theorems, a scratch copy tried closing the entire goal with `rfl`, `simp`, and `infer_instance` separately before falling back to sorry. All sixteen still required sorry. Inspection of the pinned theorem signatures found no single-library-lemma proof of these retained headlines. There is no padding finding. The additional manifold PS probe in R02 also elaborated. No Lean process was left running.

**Headline inventory.** Normalized manifold Morse charts; finiteness of critical points on compact subsets; regular scalar levels and tangent kernels; compact-band deformation; relative handles/cells and coherent chart comparisons; proper Morse CW exhaustion; strong and relative Morse approximation; proper bounded-below Morse existence; strong polynomial inequalities; arbitrary-function LS cover/bound and its two ambient deformation bridges; two-critical-point sphere recognition; Morse–Bott normal form, negative-bundle attachment and filtered inequalities; compact-trapped intrinsic gradient convergence and exponential decay; PS critical-band compactness/deformation and global convergence. Suggested.lean now states the native base CW and convergence heads. Its docstring identifies the genuinely missing strong topology, relative/family attachment and Bott filtered-complex carriers. The extension's statable manifold headline is the remaining omission, R02.

**Adversarial calculations: 173 rows.** Each row records the tested instance and computed values. C/B mean critical/Betti polynomials. Fields are nonzero; negative homology degrees mean zero. The previous examples were recomputed against this head, including unchanged sections; repaired outcomes are updated below.

| # | Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- | --- |
| 1 | §1.1 boundaryless model homeomorphism | self-model ℝ²; half-line | range=id(ℝ²)=ℝ²; half-line range=[0,∞)≠ℝ | Boundarylessness excludes the second; retain. |
| 2 | §1.1 preferred/extended charts and inverse | c=id, I=id; y=2x | I∘c=x; inverse(y)=y/2 and forward(inverse(y))=y | Retain domains and actual inverse. |
| 3 | §1.1 source/target derivative transport | f(x)=x, y=2x | derivative in x is 1, in y is 1/2; chain product (1/2)·2=1 | Transport rather than naked equality; retain. |
| 4 | §1.1 maximal-atlas correspondence | charts x and 2x | transitions 2x and x/2 have inverse derivatives 2 and 1/2 | Both smooth directions; retain. |
| 5 | §1.1 immersion complement transport | ℝ→ℝ², v↦(0,v) | image=span(e₂), complementary span(e₁); rechart target by diag(2,3) gives image span(e₂) | Same complement transported; retain. |
| 6 | §1.1 critical/index transport | f=−x², y=2x | Hessians −2 and −1/2; critical sets {0}, indices 1=1 | Derivatives change, index does not. |
| 7 | §1.1 scalar zero/level homeomorphism | f=x, c=3 | f−3=0 iff x=3; both subtypes have one point | Retain exact subtype map. |
| 8 | criticalPoints real body | x²; x; constant | derivative zero sets {0}; ∅; all of M | Wrong universal/empty locus excluded. |
| 9 | critical-set closedness | x² on ℝ; constant on S¹ | zero sets {0} and S¹, both closed | Smoothness makes derivative continuous; retain. |
| 10 | criticalCount real body | −x²+y²; point; ∅ | counts c₁=1, other c_j=0; point c₀=1; empty all 0 | Extended-count convention consistent. |
| 11 | infinite critical counts | constant on S¹ | Hessian 0, index 0, c₀=∞; Nat.card of the infinite carrier would be 0 | ENat is essential; retain. |
| 12 | index bound/out-of-range j | −x²+y², j=3 | index 1≤2; c₃=0 | No natural subtraction used to invent cells. |
| 13 | critical Hessian normalization | −x²+y² | d²f=diag(−2,2); quadratic evaluation −2u²+2v² | No factor 1/2 in Hessian. |
| 14 | symmetry and congruence | x²; x=y/2 | Hessian 2; (1/2)·2·(1/2)=1/2 | Congruence, not componentwise equality. |
| 15 | connection independence only at criticality | f=x, connection Γ=c; f=x² at 0 | Hess f=−c for the first; Hess f(0)=2−c·0=2 for the second | Criticality necessary. |
| 16 | complementary index | f=0 on ℝ; x² | 0+0≠1; 0+1=1 | Constant-function counterexample excluded by nondegeneracy; x² satisfies 0+1=1. Repaired. |
| 17 | direct sum index | −x² plus y² | 1+0=1, equal to index diag(−2,2) | Native product law applies. |
| 18 | restrictions and positivity | diag(−2,2) on e₁/e₂ | restricted values −2u² and 2v²; indices 1 and 0 | Neither restriction inherits the full form's inertia. |
| 19 | normalized Morse chart headline | f=2x², ψ=√2x | 2x²=(√2x)²; Hess f=4, normalized Hessian 2 | Division by √2 after Hessian isometry is consistent. |
| 20 | chart critical zero set and local extrema | ±x²; −u²+v² | gradient zero only at 0; values ±r²; saddle values −r²,+r² | Minimum/maximum depend on index; retain. |
| 21 | finite_criticalPoints_inter | x² on [−1,1]; constant on S¹ | 1 critical point; ∞ for constant but Morse premise false | Compactness plus closedness and isolation, not isolation alone. |
| 22 | compactness versus isolated subsets | {1/n:n≥1}⊂[0,1] | infinitely many isolated members; closure adds 0 | README's use of a closed critical locus avoids this error. |
| 23 | C² critical-branch persistence | f_t=x²+tx | x_t=−t/2, Hessian 2, critical value −t²/4 | Smooth branch and constant index 0. |
| 24 | failure across birth-death | f_t=x³−tx | t<0:0 zeros; t=0:Hess=0; t>0:±√(t/3), Hess=±6√(t/3) | Persistence cannot cross degeneracy. |
| 25 | compact Cᵏ seminorms | h=δx² on [−1,1], k=2 | sup values δ, derivative 2δ, second derivative 2δ | Order-0-only control is insufficient; retain all orders. |
| 26 | seminorm restriction/intersection | h=δx²; smaller core [−1/2,1/2] | zeroth norm δ→δ/4; intersection ε₁,ε₂ gives min(ε₁,ε₂) | Retain compact-core laws. |
| 27 | fixed-chart seminorm equivalence | x=y/2, h=x² | first derivative norm scales by 1/2, second by 1/4 before core adjustments | Finite constants compare compact charts. |
| 28 | §2.1 regular-level headline | f(x,y)=x, c=0 | level={(0,y)}, Df=(1,0), range Di=span(e₂)=ker Df | Embedded atlas and tangent kernel agree. |
| 29 | zero/nonzero level in dimension 0 | point with f=0 | c=0: zero map 0→ℝ not onto; c=1: level empty, model dimension 0−1=0 | Empty regular levels are allowed; attained ones excluded. |
| 30 | regularity negative control | f=x²,c=0 in dimension 1 | level tangent dimension 0 but ker Df=ℝ | Kernel conclusion fails without regularity. |
| 31 | Fredholm index supplied to section-zero | D:ℝ²→ℝ, D(x,y)=x | ker dimension 1, cokernel dimension 0, index 1=2−1 | Integer/natural index agree at regular zeros. |
| 32 | preferred kernel chart | projection π(x,y)=(0,y), K(0,y)=y | chart at (0,y₀) sends (0,y)↦y−y₀; inverse sends v↦(0,y₀+v) | Same π and K required. |
| 33 | implicit coordinate and zero slice | f=x+x² near 0 on ℝ² | Φ(x,y)=(x+x²,y), derivative=id at 0; Φ⁻¹(0,y)=(0,y) locally | Local restriction excludes the second zero x=−1. |
| 34 | changed complements | π_a(x,y)=(0,y−ax) for D(x,y)=x | on ker D both π_a(0,y)=(0,y); L_a⁻¹(0,y)=(0,y) | Common kernel slice; retain. |
| 35 | sublevel/band inward coordinate | f=x, band [a,b] | lower t=x−a≥0, upper t=b−x≥0; sublevel t=a−x≥0 | Signs correct. |
| 36 | interior chart at critical points | x² at 0 in {x²<1} | df(0)=0, translated coordinate b+y>b−r>0 | Interior charts need no regularity of df. |
| 37 | boundary tail reindexing | dimension 2=n+1, n=1 | Fin(2−1)=Fin1; β₁ maps one Euclidean coordinate to same one-entry function | Explicit β and Fin.cast remove type mismatch. |
| 38 | boundary/level identification | x on [a,b] | boundary two points maps to level a⊔level b; zero normal coordinate at each | Correct carrier/dimension. |
| 39 | boundary orientation | [a,b] oriented by dx | outward vectors −∂x,+∂x give signs −1,+1; integral of d x is b−a | Outward-first convention agrees. |
| 40 | dimension-0 band | discrete f with no values in [a,b] | band ∅; lower and upper sublevels equal | No fictitious negative-dimensional boundary. |
| 41 | sublevelInclusion identity | f=x², a=b=1 | x=1 maps to 1, as does id | Explicit identity Check now at README:493; correct. |
| 42 | sublevelInclusion composition | levels 1≤4≤9, x=1 | direct 1↦1; composite 1↦1↦1 | Explicit composition Check now at README:494; correct. |
| 43 | closed endpoint in inclusion | f=x²,a=1,x=1 | 1≤1 true; 1<1 false | Explicit endpoint Check now at README:495; correct. |
| 44 | compact-band strong deformation | x², 0<a<b | x≥√a goes to √a, x≤−√a to −√a; inside remains x | Retraction/inclusion composite fixed on M_a. |
| 45 | normalized field and hitting time | x² on band [a,b], a>0 | X=−1/(2x); d(x²)/dt=−1; hit time x²−a | Denominator ≥4a>0; retain. |
| 46 | regular-band product | x², 0<a<b | two level points ×[a,b] gives two closed intervals, f value=t | Product assertion has both components. |
| 47 | sublevel homeomorphism | x², 0<a<b | x↦√(a/b)x maps [−√b,√b] onto [−√a,√a] | Distinct from the noninjective retraction. |
| 48 | local/global minimum disc | x²; (x²−1)² | one interval near 0; double well small sublevel has two intervals | Unique-global-minimum premise matters. |
| 49 | adapted pseudo-gradient definition | −u²+v² | X=(2u,−2v), df(X)=−4(u²+v²)<0 off 0 | Wrong field (−2u,−2v) gives +4u² on v=0. |
| 50 | adapted flow/composition/inverse | same quadratic | Φ_t=(e²ᵗu,e⁻²ᵗv); Φ_sΦ_t=Φ_(s+t), Φ_−tΦ_t=id | Retain while inside chart. |
| 51 | adapted energy identity | same quadratic | d f(Φ_t)/dt=−4(e⁴ᵗu²+e⁻⁴ᵗv²) | Integrates to f(Φ_T)−f(Φ_0); retain. |
| 52 | compact completeness versus escaping field | S¹ smooth field; X=x² on ℝ | compact field has bounded coordinate continuation; x'=x² gives x=x₀/(1−x₀t), finite blowup | Completeness not inferred from smoothness alone. |
| 53 | pseudo-gradient rescaling | f=x, X=−2 | df(X)=−2; rescale by 1/2 gives −1 | Positive rescaling preserves descent, changes hitting time. |
| 54 | index-0/full-index handle | x² and −x² in ℝ | λ=0 adds point up to homotopy; λ=1 has D¹ boundary S⁰ of two points | Empty-sphere/whole-dimension cases retained. |
| 55 | simultaneous critical points | two disjoint copies of x² | two minima at value 0 give two 0-cells, H₀ rank 2 | One cell per point, not per value. |
| 56 | handle-to-cell comparison relative base | interval attached to point at both ends | adjunction S¹, H₁=ℤ; base point maps identically | Relative condition rules out an unrelated equivalence. |
| 57 | §2.3 admissible shrinking | negative disk radius √ε, 0<ε'≤ε | √ε'≤√ε; levels c−ε'≥c−ε | Smaller chart fits, retraction direction goes to lower value. |
| 58 | double-well attaching maps | ε=1/2, s=1 | α₊=√(1−1/√2)≈0.541196; α₋≈−0.541196; f=1/2 at both | Different lower components; reflection needed. |
| 59 | reflected RP² attachment | normalized top chart | boundary winds +2 around the stated core; first-coordinate reflection gives −2 | Unequal π₁ classes, same reflected adjunction pair. |
| 60 | Milnor comparison seam | radius r=1/2 | inner h(2rθ)=hθ identified with α₀(hθ); outer H(θ,1)=α₀(hθ) | Seam agrees. |
| 61 | Milnor comparison outer boundary | r=1 | outer H(θ,0)=α₁θ, same as source attaching identification | Descends to the pushout. |
| 62 | strict attachment equality | h=−id on D¹, α₁=α₀h | id on base and h on disk glue; h²=id | Homeomorphism rel base, not labelled-map homotopy. |
| 63 | quadratic transition deformation | Lorentz boost A=[[cosh s,sinh s],[sinh s,cosh s]] | Q(A(x,0))=−x²; A_uu²=cosh²s≥1 | Negative block invertible; P≥I. |
| 64 | positive-component contraction | same boost, factor (1−t) | Q=−cosh²s x²+(1−t)²sinh²s x²≤−x² | Boundary never rises above small lower level. |
| 65 | polar contraction | A_uu=hP, one-dimensional P=cosh s | Q(hP^(1−t)x,0)=−P^(2−2t)x²≤−x², endpoint −x² | Retain positive powers with P≥1. |
| 66 | nonlinear scaling at s=0 | T preserving Q, DT(0)=A | T(sx)/s→Ax; Q(T(sx)/s)=Q(x) for s>0 and at limit | Compact local domain control required as stated. |
| 67 | annulus two-stage seams | β(δ)=0, β(√ε)=1 | inner: R₀=id; outer first stage fixes M_(c−ε), second uses R₁ into M_(c−ε) | Both stages are maps of pairs. |
| 68 | comparison independence with pair homotopy | Φ₀E_H≃Φ₁, Ψ₀Φ₀≃id | E_H≃Ψ₀Φ₁ for every admissible K | Independence comes from the pair comparison, not arbitrary boundary H. |
| 69 | triple charts and orthogonal path | λ=1, chart signs +,−,+ | h₀₁=−1,h₁₂=−1,h₀₂=1; product 1 | Correct component; no claim polar factors multiply strictly in general. |
| 70 | orientation law | λ=0,1,2; reflection | λ0 determinant1/empty boundary; λ1 swaps ±1; λ2 degree −1 | Correct exceptional low indices. |
| 71 | metric-only chart comparison | same φ and ε, metrics g,4g | χ and α unchanged, h=id; speeds differ by factor 1/4 | Attaching maps are metric-independent here. |
| 72 | unequal ε comparison | ε₀=1/4≤ε₁=1/2 | b:M_(c−1/4)→M_(c−1/2); radius 1/2 expands by flow to 1/√2 | Direction and common smaller chart match. |
| 73 | parameter uniformity/restriction | fixed Q=−x²+y², boost charts A_s, s∈[0,1] | ‖A_s‖,‖A_s⁻¹‖≤e; choose δ<√ε/e for every s | Restriction to endpoints preserves these charts and bounds. |
| 74 | §2.4 finite CW headline | S² height | c₀=c₂=1,c₁=0; CW cells 1,0,1 | Now stated in Suggested:108; cell counts agree. |
| 75 | proper noncompact CW headline | ℝ,x² | one critical 0-cell, CW point, H₀=ℤ and higher homology 0 | Suggested:108 includes this noncompact proper case. |
| 76 | infinite CW exhaustion | discrete ℕ,f(n)=n | stage below k+1/2 has k+1 points/cells; union has ℵ₀ 0-cells | Infinite case must not use finite Nat.card. |
| 77 | empty initial sublevel | x² lower bound0, a₀=−1 | M_(−1)=∅; start CW has 0 cells | Retain. |
| 78 | strict tower compatibility | discrete example | inclusion i↦i; φ_(k+1)\|{0,…,k}=φ_k=id | Correct use of actual commuting maps. |
| 79 | compact finite-stage factorization | compact subset of discrete ℕ | compact⇒finite; N=max points gives containment in stage N | Properness supplies this on sublevels. |
| 80 | relative band/opposite function | circle between regular heights | each boundary circle-point set has two points; λ(−f)=1−λ(f) at Morse extrema | Relative attachments require regular endpoints; complementary index has the Morse premise. |
| 81 | §3.1 strong topology at point | M=point | all derivatives of order≥1 vanish; condition reduces to \|g−f\|<ε | Ordinary topology on ℝ. |
| 82 | compact-chart strong topology | S¹, finite cover | finitely many tolerances have minimum ε>0; each derivative through k bounded by ε | Compact Cᵏ comparison; retain. |
| 83 | noncompact fine versus compact-open | ℝ, tolerance e^(−x²), constant δ≠0 | at large x, e^(−x²)<\|δ\|; on [−1,1], \|δ\|<e⁻¹ can pass | Strong distinction correct. |
| 84 | restriction continuity | ℝ→(0,1), δψ=δ near0 | source seminorms O(δ)→0; at x=δ/2, target error δ>x | Now a negative Check at README:700; only compact-core or proper/clopen strong restriction asserted. |
| 85 | local linear Morse perturbation | x³−tx | t>0 roots ±√(t/3), second derivatives nonzero; t<0 no roots | Morse nearby; t=0 degenerate. |
| 86 | summable perturbation control | bounds ε·2^(−r−1) | total ≤ε; tail after N ≤ε·2^(−N) | Provides convergence and persistence margins, not a Baire assertion. |
| 87 | §3.2 bounded perturbation preserves exhaustion | f=x², \|g−f\|<1 | g≥−1; g≤b⇒x²<b+1 | Sublevel stays in compact interval; retain continuity. |
| 88 | Morse exhaustion headline | ℝ; point; ∅ | x² proper/lower0; point constant0 proper; empty range bounded below by0 | Includes all degenerate dimensions. |
| 89 | discrete exhaustion/negative control | ℕ with f(n)=n; constant0 | finite sublevels vs f⁻¹{0}=ℕ noncompact | Properness distinguished. |
| 90 | relative approximation | f=x² near closed set {0}; perturbation supported outside [−1,1] | f and all derivatives unchanged near0; Hessian stays2 | Neighborhood fixing, not merely pointwise fixing. |
| 91 | lack of uniform perturbation control | x² plus −x² | resulting0 has entire ℝ as sublevel at0 | Uniform bound cannot be omitted. |
| 92 | bettiNumber actual carrier | point,∅,S¹ over k | b=(1,0,…),(0,0,…),(1,1,0,…) | Native homology finrank, not arbitrary supplied numbers. |
| 93 | homotopy invariance/finite dimensionality | ℝ≃ₕpoint; finite r points | b₀=1=1; b₀=r, higher0 | Finrank natural values justified in compact theorem. |
| 94 | strong polynomial headline | S² | C=1+t², B=1+t², Q=0; both sides1+t² | Retain. |
| 95 | coefficient dependence | RP², k=ℚ then 𝔽₂ | ℚ:1+(1+t)t=1+t+t²; 𝔽₂:B=C,Q=0 | Both equal C; no orientability premise needed. |
| 96 | zero-dimensional/empty polynomial | r points and ∅ | C=B=r,Q=0; r=0 gives0=0 | No junk-cardinality issue. |
| 97 | coefficient of Q | RP² cellular ∂₂=2 over ℚ | rank ∂₂=1, Q₁=1; ∂₁=0,Q₀=0 | Correct adjacent-boundary indexing. |
| 98 | weak/Euler do not imply strong | c=(2,0,0,2),b=(1,0,0,1) | weak holds, Euler0=0; first alternating sums −2<−1 | Negative Check is correct. |
| 99 | strong implies weak and Euler | c_j=b_j+q_j+q_(j−1) | c_j−b_j≥0; evaluating t=−1 gives C(−1)=B(−1) | Add adjacent alternating inequalities, not subtract. |
| 100 | relative strong identity | (D²,S¹) | relative C=B=t²,Q=0 | Relative coefficients and degree shift agree. |
| 101 | subgroups/top homology freeness | 2ℤ⊂ℤ; ⊕ₙ2ℤ⊂⊕ₙℤ | bases {2} and {2e_n}; both free, including infinite rank | Finite-rank pinned PID result alone is insufficient. |
| 102 | top cohomology warning | RP² cellular chains | H₂(−;ℤ)=0 free, H²(−;ℤ)=ℤ/2 | Correct refusal to infer top cohomology torsion-freeness. |
| 103 | cohomology above CW dimension | wedge of countably many circles,d=1 | H₁=⊕ℕℤ free, Ext(H₁,ℤ)=0, H²=0 | Infinite-rank freeness is relevant. |
| 104 | LS headline empty/point | ∅; point | categorical opens0/count0; opens1/count1 | Empty cover does not need a nullhomotopy into ∅. |
| 105 | LS arbitrary-function bound | S¹ height; constant | category2≤critical count2; category2≤∞ | Counts points; no Morse assumption on bound. |
| 106 | LS torus and cup length | T², cosθ+cosφ | critical count4, unnormalized category3, cup length2 | 4≥3=2+1. |
| 107 | disconnected LS sum | two disjoint circles | category2+2=4; two heights have2+2=4 critical points | A categorical open cannot bridge clopen components. |
| 108 | compact Fermat scope | compact boundaryless S¹; [0,1] with f=t | circle has min/max zeros; interval df=1, count0 | Boundary example violates missing boundaryless premise. |
| 109 | degenerate-level deformation headline | f=x⁴ locally at minimum, U=(−r,r) | for 0<ε<r⁴, {x⁴≤ε}⊂U; {x⁴<−ε}=∅ | Must use U disjunct; Hessian0 rules out Morse lemma. |
| 110 | no critical points at selected c | S¹ height, c=0, U=∅ | middle band avoids ±1; endpoint must have f<−ε | First disjunct, no artificial critical neighborhood. |
| 111 | annulus energy-drop estimate | x⁴, r≤x≤2r | gradient≥4r³, crossing length≥r; drop from2r to r is15r⁴≥4r⁴ | Positive crossing cost justifies trapping. |
| 112 | open-sublevel ambient deformation headline | S¹ height, a=−1/4,b=1/4,δ=1/4 | no critical values in [−1/2,1/2]; cutoff flow takes middle band below−1/4 | Strict target achievable with buffer. |
| 113 | categorical pullback | g≃id, categorical U | inclusion of g⁻¹U homotopic to g then to constant in M | Endpoint pullback uses reverse homotopy if needed. |
| 114 | several critical points at one value | torus cosθ+cosφ | values −2,0,2 with multiplicities1,2,1 | Cover may grow by2 at0, not1. |
| 115 | minimum c(M)/witness independence | ∅; point; S¹ with 2- and4-critical witnesses | minima0,1,2; both circle witnesses yield2 | All three minimum Checks now explicit at README:901–903. |
| 116 | extended minimum versus finite minimum | S¹ finite and infinite counts | inf{2,4,…,∞}=2 | Infinite locus contributes∞, not0. |
| 117 | sphere recognition headline | S² height; h−h³/3 | first Hessians nonzero and count2; second count2 but Hessians0 | Morse two-handle theorem excludes second, not its true topological conclusion. |
| 118 | zero-dimensional sphere exclusion | one point | count1≠2 and dim0 fails positive-dimension premise | No mistaken S⁰ conclusion. |
| 119 | torus critical polynomial | T^m sum of cosines | each factor counts1+t; product (1+t)^m, T² gives1+2t+t² | Binomial count matches indices. |
| 120 | CP^n function representative independence | z↦az,a≠0 | numerator and denominator scale by \|a\|²>0; quotient unchanged | z=0 excluded; no 0/0. |
| 121 | CP^n critical indices/real dimension | CP¹, then coordinate point e_j | values0,1 and indices0,2; generally j negative complex directions give2j, real dim2n | Supplier realification factor2 consistent. |
| 122 | critical-count parity/Euler | S²; T² | totals2≡Euler2 mod2; 4≡Euler0 mod2 | Sphere counts even. |
| 123 | odd-dimensional Euler via −f | S¹ height | c=(1,1), reversed counts=(1,1); χ=1−1=0 | Complementary index uses Morse premise. |
| 124 | RP² perfection obstruction | three coordinate weights | counts(1,1,1); rational b=(1,0,0), mod2 b=(1,1,1) | Rational perfection impossible, mod2 possible. |
| 125 | nontrivial π₁ with b₁(ℚ)=0 | RP² | π₁=ℤ/2, at least one1-cell; b₁(ℚ)=0 | A perfect rational Morse complex would have no1-cells, contradiction. |
| 126 | Morse–Bott definition | y² versus y⁴ on ℝ² | kernels span(e₁) versus ℝ²; tangent critical line span(e₁) | First qualifies, second fails. |
| 127 | zero normal bundle | constant on compact M | C=M, normal rank0, negative rank0; contribution B(M) | Morse–Bott does not imply isolated critical points. |
| 128 | spectral splitting/rank constancy | matrices diag(−1,2), diag(−t,2) | ranks(1,1); at t=0 kernel appears and negative rank may change | Constancy only within nondegenerate family. |
| 129 | metric independence of negative-bundle class | Q=diag(−1,1), metric diag(4,1) | associated operators diag(−1,1),diag(−1/4,1); negative dimension1 both | Inertia unchanged; actual subspaces may change for nondiagonal metrics. |
| 130 | smooth square roots/inverses | positive scalar a=4, then a→0 | √a=2, a⁻¹ᐟ²=1/2, product1; inverse undefined at0 | Positive/invertible hypothesis needed. |
| 131 | parametric normal form | f(b,y)=(1+b²)y² | coordinate v=√(1+b²)y gives f=v²; y=0 fixed | Varying reference forms need the owned extension. |
| 132 | negative disc Thom shift | point base,rankλ | H_j(D^λ,S^(λ−1))=ℤ at j=λ and0 otherwise | Shift H_(j−λ)(point); recovers ordinary Morse. |
| 133 | orientation local system | negative Möbius line over S¹ | sign coinvariants ℤ/(a=−a)=ℤ/2; constant-system H₀=ℤ | README's wrong-coefficient control is correct. |
| 134 | Bott filtered sequence and inequalities | ordinary RP² viewed as Bott | E¹ chains(ℤ,ℤ,ℤ), d₁ on2-cell is2; rational B=1,Q=t | Critical-component page is E¹ in supplier convention; see source issue. |
| 135 | Bott constant specialization | f=0 on compact connected M | one filtration contribution B(M); no nonzero differential, Q=0 | Correct degenerate normal-rank case. |
| 136 | compact-trapped gradient convergence | f=x²,γ=x₀e⁻²ᵗ | limit0, gradient at0=0, K=[−\|x₀\|,\|x₀\|] | Native manifold headline now in Suggested:200. |
| 137 | omega-limit argument | same trajectory | omega={0}, connected and critical; #omega=1 | Finite critical set plus connectedness excludes two limits. |
| 138 | compact trapping versus mere completeness | f=x on complete ℝ | γ=x₀−t, no compact trap and no critical point | Completeness alone does not give convergence. |
| 139 | variable metric | f=x²,g=4dx² | grad=x/2, γ=x₀e⁻ᵗ⁄², norm_g grad=\|x\| | Native metric dependence now retained in Suggested:200. |
| 140 | dissipation and tail | Euclidean x² | E=x₀²e⁻⁴ᵗ, E'=−4E=−‖grad‖²; tail=\|x₀\|e⁻²ᵗ=√E | Constants and half-rate consistent. |
| 141 | local gradient inequality/distance | f=x² at0 | \|f\|=x²=(1/4)‖grad‖²; ‖grad‖=2dist(x,0) | Positive λ=4 works in native λ\|E\|≤‖grad‖² convention. |
| 142 | saddle convergence | f=−u²+v², u=0 | E=v²≥0, v=v₀e⁻²ᵗ; elsewhere E may be negative | No local-minimum hypothesis used. |
| 143 | equilibrium/division by energy | γ=0 for x² | E=0, length0, distance0 | Treat separately; do not divide by√E. |
| 144 | non-Morse rate | f=x⁴,γ=(x₀⁻²+8t)^−1/2 | decay t^−1/2, Hess0=0 | Exponential conclusion needs nondegeneracy. |
| 145 | PS Satisfies positive example | x² on ℝ | ‖grad x_n‖=2\|x_n\|→0⇒x_n→0 | Definition identifies desired compactness. |
| 146 | PS nonproper example | f(x,y)=x | gradient norm1 cannot tend0; band [0,1]×ℝ noncompact | PS holds vacuously, properness fails; Part II boundary R01. |
| 147 | PS negative example | e^−x,x_n=n | values=e^−n→0, gradient norms=e^−n→0; no convergent subsequence | Fails PS. |
| 148 | PS band/global equivalence | bounded \|f(x_n)\|≤C | sequence lies in [−C,C]; conversely each fixed[a,b] gives bound max(\|a\|,\|b\|) | Quantifiers correct. |
| 149 | metric comparison in PS | g→4g | grad_4g=(1/4)grad_g, norm_4g=(1/2)norm_g | Uniform equivalence preserves limit0. |
| 150 | nonuniform metric negative control | f=e^−x, g=dx² then g'=e^−2x dx² | x_n=n has bounded values e^−n; gradient norms e^−n versus1 | Euclidean PS fails; g'-PS holds vacuously. Completeness is not needed to define PS. |
| 151 | of_isProperMap | x² | bounded values≤C⇒\|x\|≤√C; compact interval gives convergent subsequence | Properness sufficient independently of gradient regularity. |
| 152 | compact critical value band | x²,[0,1]; constant on ℝ | critical set{0} compact; constant gives entireℝ and fails PS | Continuity and PS used. |
| 153 | finite_criticalValueBand | x²,[0,1]; x⁴ | first critical count1; second also1 but nondegeneracy premise false | The theorem gives sufficient hypotheses, not an iff. |
| 154 | exists_gradient_lowerBound | x²,[1,4]; projection | gradients between2 and4, chooseη=2; projection chooseη=1 | η independent of point. |
| 155 | reversed/empty band | a>b | band∅, critical count0, η=1 satisfies universal bound | Honest vacuity, not a missing a≤b hypothesis. |
| 156 | PS endpoint buffers | x², regular value1 | critical values{0}; chooseδ=1/2, enlarged band avoids0 | Accumulating critical values at a regular endpoint would violate PS. |
| 157 | noncompact normalized deformation | f=x on ℝ², a=0,b=1 | X=(−1,0), speed1; time x takes(x,y) to(0,y) for0≤x≤1 | Noncompact band allowed under completeness+PS. |
| 158 | finite-time length/lifetime | gradient dissipation on[s,t] | length²≤(t−s)(f(γ(s))−f(γ(t)))≤(t−s)(f(γ(0))−L) | Tails Cauchy as s,t→finite T; completeness supplies endpoint. |
| 159 | forward existence without PS | f=e^−x | γ=log(e^x₀+t), γ'=1/(e^x₀+t)=e^−γ, lifetime∞ | Global existence true, convergence false. |
| 160 | normalized exponential escape | same f | X=eˣ, e^−γ=e^−x₀−t; blowup time e^−x₀ | Constant energy-drop rate does not ensure lifetime. |
| 161 | exists_forwardTrajectory_converges | x² | γ=x₀e⁻²ᵗ, p=0, grad p=0 | All PS/Morse/lower-bound hypotheses hold. |
| 162 | PS critical subsequence to trapping | local λE≤‖grad‖² | remaining length≤2√E/√λ; for x², λ=4 gives√E=\|x\| | Entry distance plus this bound smaller than chart radius prevents exit. |
| 163 | PS minimum attainment | nonempty ℝ,x²; projection | min0 attained at0; projection unbounded below | Lower-bound hypothesis cannot be dropped. |
| 164 | zero-dimensional PS theorem | E=0,f constantc | unique sequence converges; γ constant; critical band size1 if a≤c≤b, otherwise0 | CompleteSpace/finite dimension and all conclusions consistent. |
| 165 | repaired compact-core restriction | δψ=δ near 0, core [a,b]⊂(0,1) | δ<a passes error<x on core; at x=δ/2 error δ>x fails on full open interval | Repaired distinction, no loss of general approximation. |
| 166 | proper/clopen strong restriction | ℝ⊔ℝ→first component, perturbations (δψ,0) | on restricted support derivatives ≤C_kδ; discarded component contributes 0 | Local finiteness survives the closed inclusion. |
| 167 | native CW statement, empty/zero dimension | ∅; r discrete points | all cell counts 0; respectively r cells in degree 0 and 0 above | Native cell equivalences match extended critical counts. |
| 168 | intrinsic exponential conclusion | f=x², metric 4dx² | distance to 0=2\|x₀\|e^(−t/2)≤(2\|x₀\|+1)e^(−t/2) | Choose C=2\|x₀\|+1,c=1/2,T=0; includes equilibrium x₀=0. |
| 169 | extended intrinsic distance | two disjoint copies of ℝ with f=x² | cross-component distance ∞; trajectory and its limit in one component have distance \|x₀\|e^(−2t) | No connectedness assumption needed in compact-trapped theorem. |
| 170 | full PS manifold headline | round S¹, f=cosθ, θ₀=π/2 | θ(t)=2 arctan(eᵗ), f decreases 0→−1, distance to π=2 arctan(e⁻ᵗ)≤2e⁻ᵗ | R02: genuine manifold case absent from vector-space specialization. |
| 171 | variable-metric PS gradient | ℝ,g=(1+x²)dx²,f=x²,x=1 | negative gradient −2x/(1+x²)=−1; norm √2; flat values −2 and 2 | Proper f gives PS; native metric statement includes this model. |
| 172 | sequential versus source's set Condition C | f=0 on ℝ, sequence x_n=n | every nonempty S contains a critical point; values and gradient norms all 0, but no convergent subsequence | Source equivalence false; roadmap uses the correct sequential condition. |
| 173 | completeness in PS forward existence | (0,1),f=x, Euclidean metric | gradient norm 1 gives PS vacuously; f≥0; γ=x₀−t exits at t=x₀ | R02 repair must retain compatible metric completeness. |

**Source verification: all 15 seeded sections.** Six works were sought through the sources service; four were readable. Stable keys and legal texts: `cohen-iga-norbury`, [Stanford author copy](https://math.stanford.edu/~ralph/morsecourse/biglectures.pdf); `milnor-morse`, [Edinburgh institutional copy](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnmors.pdf); `weber-conley`, [author copy](https://www.math.stonybrook.edu/~joa/PUBLICATIONS/conblock.pdf); `morgan-condition-c`, [author copy](https://www.math.columbia.edu/~jmorgan/Condition_C.pdf). The other keys are `hirsch-differential-topology` and `mark-math240`, discussed below. An initial Milnor book-review match was discarded. Printed-page locators and service line numbers follow; no source or manifest was edited in the PR.

| Seeded target | Source locator and scope checked | Result |
| --- | --- | --- |
| 1.1 Model transport | Native Boundaryless/model APIs below; ComplexManifolds Milestone 1 | Actual chart and atlas transport; the preferred-chart scalar bridge is the retained specialization. |
| 1.2 Critical Hessians and counts | cohen-iga-norbury line 830, §4.1; line 1423, Corollary 5.4 p.38; native Index theorems | Hessian/isolation supported; the complementary-index premise is now correct. |
| 1.3 Normal forms and persistence | cohen-iga-norbury line 1322, Theorem 5.3 pp.36–37; line 1423, Corollary 5.4 p.38; pinned ImplicitContDiff:90 | Normal form verified. Smooth parameter persistence now uses its own IFT route; continuous C² persistence is separately owned, not attributed to the ordinary Morse lemma. |
| 2.1 Scalar levels and regular boundary faces | Native Section/Boundary APIs; morgan-condition-c line 185, regular-point argument p.6 | Surjective derivative and actual kernel charts; source coordinate misprint not copied. |
| 2.2 Deformation and adapted fields | milnor-morse line 2225, Theorem 3.1 p.12; cohen-iga-norbury line 1202, Theorem 5.1/Corollary 5.2 pp.33–35 | Compact critical-free band is sufficient. Cohen's regular-interval theorem uses a compact manifold with boundary. |
| 2.3 Handles and change of chart | cohen-iga-norbury line 1438, Theorem 5.6 pp.38–40; milnor-morse line 3623, Lemma 3.6 pp.20–21 | Single attachment and homotopic attaching-map comparison supported. Coherent parameter families are a further owned construction with explicit route. |
| 2.4 CW exhaustion | milnor-morse line 3565, Theorem 3.5 p.20; cohen-iga-norbury line 1519, Theorem 5.7 pp.40–41 | Compact sublevels allow noncompact M. Properness plus bounded-below range ensures those compact sublevels. Native headline now present. |
| 3.1 Strong smooth approximation | Hirsch, Chapter 6 Theorem 1.2 and Chapter 2 §1, uncertified; pinned local perturbation Generic:207 | Hirsch text inaccessible; no certification of its exact numbering/pages. Local finite-dimensional perturbation verified at the pin; it alone is not the full strong approximation theorem. |
| 3.2 Exhaustions and relative approximation | milnor-morse line 6228, Corollary 6.7 p.36; Hirsch as above | Proper bounded-below Morse existence via closed embedding and squared distance supported. Relative fixing is an owned cutoff/iteration extension, not claimed directly from Milnor. |
| 4.1 Strong inequalities | cohen-iga-norbury line 1569, Corollary 5.11 p.42 | Finite chain-rank argument c_k=d_(k+1)+b_k+d_k works over any field, although source uses reals. RP² tests characteristic 2. |
| 4.2 Arbitrary-function LS inequality | weber-conley line 39, Theorem 1.1 p.2, proof pp.2–3 | Closed M, C² function, critical points and unnormalized ambient category; no nondegeneracy premise. Empty convention handled separately. |
| 4.3 Sphere and projective applications | cohen-iga-norbury line 1610, Applications 5.12–5.13 pp.42–43 | Two Morse critical points give sphere homeomorphism; CP even-index bounds use independent homology. Explicit quotient function comes from the projective supplier. |
| 5.1 Critical normal bundles and attachments | cohen-iga-norbury line 4986, Theorem 15.1 p.143; line 5091, Theorem 15.4 p.146; line 5142, Theorems 15.6–15.7 pp.147–148 | Local normal form and compact attachment; varying forms and twisted coefficients use owned extension/CharacteristicClasses C2. Roadmap corrects the domain and classical E¹ convention. |
| 6.1 Compact trapping | cohen-iga-norbury line 1022, Theorem 4.6 pp.27–29; native convergence/exponential estimates | Source assumes compact ambient M. Compact trapping and intrinsic exponential extension have separately identified inputs and native signatures. |
| 6.2 Palais–Smale without properness | morgan-condition-c line 194, Definition 1.6/Remark 1.7/Proposition 1.8 pp.6–7 | Proposition uses complete connected Riemannian Hilbert M, C^(k+2), k≥1, and a critical-free finite band. Smooth finite-dimensional componentwise specialization valid; source set/sequential equivalence needs correction below. The exponential conclusion is a further target. |

**Pinned-library audit:** 29 groups opened at the pins. Paths below are relative to library roots; the adversarial table records the mathematical boundary tests.

| Pinned file and line | Declarations/objects inspected |
| --- | --- |
| `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:588,597` | `ModelWithCorners.Boundaryless`, `toHomeomorph`; no separation/countability on M. |
| `Mathlib/Geometry/Manifold/LocalDiffeomorph.lean:81` | `PartialDiffeomorph`, open domains, smooth inverse. |
| `Mathlib/Topology/CWComplex/Classical/Basic.lean:99,135` | `RelCWComplex`, `CWComplex`, cells; Hausdorffness separate. |
| `Mathlib/Topology/Homotopy/Equiv.lean:43` | `ContinuousMap.HomotopyEquiv`, inverse homotopies. |
| `Mathlib/Topology/Homotopy/Contractible.lean:26` | `ContinuousMap.Nullhomotopic`, target point. |
| `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | `singularHomologyFunctor`; finite dimension separate. |
| `Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean:65` | `IsMIntegralCurveOn`, derivative equation. |
| `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:67`; `Mathlib/Topology/VectorBundle/Riemannian.lean:420,441` | Smooth bundle condition versus inner-product/norm instances. |
| `TauCeti/Geometry/Manifold/Morse/Basic.lean:59,178,197` | `IsManifoldNondegenerateCriticalPoint`; `IsMorse` includes smoothness. |
| `TauCeti/Geometry/Manifold/Morse/Index.lean:105,111,140,154` | Index bounds, transport, complement with nondegenerate Hessian. |
| `TauCeti/Geometry/Manifold/Morse/Prod.lean:144,156` | Product/sum index, coordinate differentiability. |
| `TauCeti/Geometry/Manifold/MFDeriv/Chart.lean:149` | `MDifferentiableAt.mvfderiv_eq_fderiv_comp_extChartAt_symm`, boundaryless. |
| `TauCeti/Analysis/Calculus/Morse/Index.lean:76,114,236` | Hessian quadratic form, congruence, signed squares; no half factor. |
| `TauCeti/Analysis/Calculus/Morse/NormalForm.lean:217,362` | Fixed-reference congruence; `exists_morse_chart` uses half-Hessian. |
| `TauCeti/Analysis/Normed/Algebra/SquareRoot.lean:78` | `sqrtNearOne`, local inverse near 1, complete real Banach algebra. |
| `TauCeti/Geometry/Manifold/VectorBundle/Section/Chart.lean:106,123,136,152,174` | `sectionZeroChartAt` source/target/apply/inverse on chosen kernel coordinates. |
| `TauCeti/Geometry/Manifold/VectorBundle/Section/Manifold.lean:50–80,154` | Strict derivative, Fredholm, surjectivity, index, kernel model, smoothness. |
| `TauCeti/Geometry/Manifold/VectorBundle/Section/SmoothZero.lean:63` | Smooth zero-locus structure with linearization hypotheses. |
| `TauCeti/Geometry/Manifold/Boundary/Charts.lean:220,231,241,252,263` | Boundary atlas/source/target/apply/inverse. |
| `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:125,141` | Finite CW singular homology/Euler comparison. |
| `TauCeti/Analysis/Calculus/Morse/Convergence.lean:272` | Vector-space convergence: compact trap, continuous gradient, finite critical locus. |
| `TauCeti/Analysis/Calculus/Morse/ExponentialConvergence.lean:239,262` | Energy/distance decay after nondegenerate convergence. |
| `TauCeti/Analysis/Calculus/Morse/Linearization.lean:380` | Positive λ with λ·absolute energy ≤ squared gradient norm. |
| `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74,85,96` | `rieszDual`, body and inner-product law. |
| `Mathlib/Geometry/Manifold/Riemannian/PathELength.lean:207`; `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:79` | `Manifold.riemannianEDist`, `IsRiemannianManifold`; completeness separate. |
| `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:90` | `ContDiffAt.contDiffAt_implicitFunction`, invertible derivative. |
| `TauCeti/Analysis/Calculus/Morse/Generic.lean:179,197,207` | Local finite-dimensional C² linear perturbation, not global strong approximation. |
| `TauCeti/Analysis/Calculus/ImplicitFunctionTheorem.lean:79,86` | `implicitCoordEquiv`, selected kernel complement. |
| `TauCeti/Geometry/Manifold/VectorBundle/Section/Linearization.lean:271` | Trivial-section linearization equals manifold derivative. |

Object searches also found the finite-rank PID submodule freeness results in `Mathlib/LinearAlgebra/FreeModule/PID.lean:270`; they do not cover the countably infinite free-chain target. The base MorseTheory already owns that arbitrary-rank step. No new duplicate fully qualified declaration name was found in the indexed readable roadmap files.

**Ownership/supply:** Read main AffineMorseLefschetz, ComplexManifolds and CharacteristicClasses for shape. Indexed `roadmaps grep`/`roadmaps resolve` and object searches covered main, supplied open heads and readable packages. No additional owner or unresolved citation; existing-roadmap revisions were not dependencies. Fourteen resolved groups (paths relative to `TauCetiRoadmap/`):

| Roadmap location | Contract/direction |
| --- | --- |
| `DifferentialGeometry/README.md:371–400,507–510,884,910–923`; `Suggested.lean:3148–3160` | Supplier: flows, boundary, Sard, metric/gradient/Hessian and Riesz gradient. |
| `AlgebraicTopology/README.md:624–745,789–810,1080–1158` | Supplier: §4.5 attachments/CW towers; post-§6.2 LS cover/cup bound. |
| `GeometricTopology/README.md:195–222` | Supplier: collars, boundary gluing, tubular neighborhoods. |
| `CharacteristicClasses/README.md:550–646` | Supplier: C2 disk/sphere bundles and twisted Thom comparison. |
| `ComplexManifolds/README.md:172–193` | Supplier: Milestone 1 realification/model/atlas transport. |
| `ComplexKahlerGeometry/README.md:1407–1465` | Supplier: K7.1 projective charts (real dimension 2n); K7.2 independent homology. |
| `DGFloer/README.md:612–647` | Supplier: Layer 1.3 filtered complexes; classical E¹ versus reindexed page. |
| `HeegaardFloer/README.md:203–214,1380–1425` | Lane M consumer; §2.3 compact finite-Cᵏ genericity has different scope. |
| `RiemannianGeometry/README.md:160–175` | R3 consumer of M2/M5 for path/Bott applications. |
| `AffineMorseLefschetz/README.md:189–203` | Consumer of M3 approximation and M4 CW/top homology. |
| `SymplecticGeometry/ConvexityToric/README.md:73–103` | T2 consumer of Morse–Bott attachment. |
| `HomotopySpheres/README.md:1466–1480`, supplied open head | §4B consumer of RiemannianGeometry and M5. |
| `MorseNovikov/README.md:130–145`, supplied open head | Consumer of M1–M4/M6; owns closed-one-form/Novikov extensions. |
| `VariationalMethods/README.md:1–65`, supplied open head | Direct/spectral variational scope does not supply this PS extension. |

Main already owns ordinary manifold/compact-band/Bott theory. Retained chart and metric bridges fill existing targets; PS/nonproper theory crosses the Part II boundary, R01. No declared supplier gaps.

Required dependency check (`--movable`, supplied main/order):

```text
depcheck: 204 roadmaps, 1556 edges, 0 problem(s)
```

No UPWARD/CYCLE. Read all 15 Needs lines, contracts and layer Dependencies; consumer mentions are not supply edges.

## Not verifiable

- `hirsch-differential-topology`: Morris Hirsch, Differential Topology, [publisher DOI](https://doi.org/10.1007/978-1-4684-9449-5), Chapter 6 Theorem 1.2 and Chapter 2 §1. The sources service resolved only paywalled publisher material and returned uncertified. Legal-source searches did not produce readable text. Its exact statement/pages and the full strong/relative approximation attribution are not certified. This settled status is not a new missing-reference request.
- `mark-math240`: Thomas Mark, Math 240 Riemannian Geometry, Spring 2001, Homework 10 p.3 and Homework 11. Sources-service bibliographic lookup and author/course/year/homework searches found no matching legal text. Recorded once in the scratch missing-reference request. No assertion was certified from that homework; other sources and pinned estimates independently support the compact-convergence checks.
- The coherent family comparison, continuous C² persistence and varying-form normal-bundle construction are owned extensions. Their formulas, inputs and explicit examples were checked; the ordinary source theorems do not by themselves certify these full extensions. This review does not assert that their general proofs have been formalized.

## Source issues

- **Gap** in cohen-iga-norbury at Corollary 4.4, printed p.23: the source says genericity of vector fields gives density of Morse functions; it should justify perturbations within gradients, for example using local linear function perturbations; affects the proof.
- **Gap** in cohen-iga-norbury at Theorem 4.6 proof, printed p.28: the source says bounded energy and negative derivative imply derivative tends to zero; it should also use uniform continuity supplied by the smooth compact flow; affects the proof.
- **Misprint** in cohen-iga-norbury at Definition 4.7, printed p.29: the source says the height-parametrized trajectory takes values in ℝ; it should take values in M; affects nothing.
- **Error** in cohen-iga-norbury at Exercise 5.3, printed p.38: the source says every critical level of a compact Morse function is not a manifold; it should exclude this assertion, since a sphere-height minimum level is a point; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorem 5.6, printed p.38: the source says the attached closed disk lies in the interior while its boundary lies on the lower face; it should place the disk interior inside M and its boundary on the face; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorem 5.6 proof, printed p.38: the source says the radius-δ coordinate ball satisfies sum of squares at most δ; it should use δ² and sum over the coordinate dimension; affects the proof.
- **Misprint** in cohen-iga-norbury at Theorem 5.6 proof, printed p.39: the source says the first retraction targets the positive-ε level together with the descending disk; it should target the negative-ε level together with that disk; affects the proof.
- **Misprint** in cohen-iga-norbury at Theorem 5.6 proof, printed p.39: the source says the local deformation is on the interval [ε,ε]; it should use [−ε,ε]; affects the proof.
- **Misprint** in cohen-iga-norbury at Theorem 5.6 proof, printed p.40: the source says the final exterior motion follows positive gradient to the lower level; it should follow negative gradient; affects the proof.
- **Misprint** in cohen-iga-norbury at Corollary 5.11 proof, printed p.42: the source says the alternating summands are c_i and b_i; it should use c_k and b_k under summation over k; affects the proof.
- **Misprint** in cohen-iga-norbury at Corollary 5.11 discussion, printed p.42: the source says to subtract neighboring strong inequalities to obtain weak inequalities; it should add them, cancelling their opposite alternating terms; affects the proof.
- **Misprint** in cohen-iga-norbury at Application 5.13 proof, printed p.43: the source says the lower disk is the inverse image of [t₁,a]; it should use [t₀,a], where t₀ is the minimum; affects the proof.
- **Error** in cohen-iga-norbury at Theorem 15.1, printed p.143: the source says the quadratic normal-form domain contains whole normal Euclidean fibers; it should be a neighborhood of the zero section, since a bounded height cannot have unbounded quadratic values; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorems 15.6–15.7, printed pp.147–148: the source says relative filtration homology is E² and the Morse specialization collapses there; it should identify classical E¹, take its differential, then collapse at E² in the skeletal case; affects a stated result.
- **Misprint** in morgan-condition-c at regular-point coordinate argument, printed p.6: the source says the last coordinate of ψ(v) is the fixed value f(x); it should be f(v), giving the stated invertible derivative; affects the proof.
- **Misprint** in morgan-condition-c at Definition 1.6, printed p.6: the source says a critical value lies in the closure of a subset of M; it should say a critical point; affects a stated result.
- **Misprint** in morgan-condition-c at Proposition 1.8, printed p.6: the source says f composed with the band-to-product diffeomorphism is projection; it should say f equals second projection composed with that diffeomorphism; affects a stated result.
- **Misprint** in morgan-condition-c at Proposition 1.8 proof, printed p.7: the source says the enlarged upper endpoint b′ is less than b; it should be greater than b; affects the proof.
- **Misprint** in morgan-condition-c at Proposition 1.9, printed p.8: the source says the finite upper endpoint b is less than negative infinity; it should be less than positive infinity; affects a stated result.

- **Misprint** in cohen-iga-norbury at Theorem 5.1 proof, printed p.34: the source says the backward displacement equals the forward integral of velocity; it should negate the two displayed integrals before the absolute-value estimate; affects the proof.
- **Error** in morgan-condition-c at Remark 1.7, printed p.6: the source says its set condition is equivalent to sequential Palais–Smale compactness; it should use the sequential condition, since f=0 on ℝ satisfies the set condition but the sequence n escapes; affects a stated result.
