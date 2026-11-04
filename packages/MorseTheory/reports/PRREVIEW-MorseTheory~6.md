# Review of MorseTheory (pull request #1682 at ca82e38)

**Verdict:** needs changes

:robot: AI review: eight findings, five blocking (one P1, four P2). Gate passes. All three files reviewed in full; no PR edits.

All eleven findings of the supplied review at 929db4f were checked first. No supplied repair report settles one as “not actionable in this package”.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01 atlas/binders | Suggested:74 “∃ cs : ChartedSpace”; :40 “include hfd hbd ht2 hsm hsc”. | Repaired: actual existential, all five hypotheses. |
| R02 supplier drift | README:82 “belong to Layers 1–2”; :972 “Use DifferentialGeometry §12.2's `mgradient`”. | Repaired; separate headline omission R05. |
| R03 headlines | Suggested:110,124,136 states exhaustion, inequalities, sphere recognition. | Partly repaired; R04–R05 remain. |
| R04 sphere hypothesis | README:855 “M admitting a Morse function”; Suggested:138 “hf : TauCeti.IsMorse I f”. | Repaired. |
| R05 Part II | README:1012 “Palais–Smale compactness without properness”. | Not repaired; R03. |
| R06 imports | Suggested:1 “import Mathlib”; PalaisSmaleTargets:2 “import Mathlib.Analysis.Calculus.Gradient.Basic”. | Partly repaired; R06. |
| R07 links | README:374,861 relative DifferentialGeometry/ComplexKahlerGeometry links. | Repaired; resolved on main. |
| R08 process references | README:943 “RiemannianGeometry R3 and HomotopySpheres §4B”. | Repaired; Mark reference still unreadable. |
| R09 padding | Five previously named declarations absent. | Repaired; retained admissions survive probes. |
| R10 locators | README:738 “Theorem 1.1, p. 2”; :1072 “Definition 1.6”. | Partly repaired; R07. |
| R11 shape | Supplier contracts, 15 Needs lines, six Examples/Dependencies pairs. | Mostly repaired; R06/R08. |

## R01 (P1) — Arbitrary open restriction is not continuous in the strong topology

**Location:** `TauCetiRoadmap/MorseTheory/README.md:638`: “The topology API proves restriction continuity”. The topology is defined at lines 624–629 using locally finite compact charts and separately positive tolerances.

**Claim:** Restricting smooth functions to an open submanifold is continuous for that strong topology, without an additional condition on the inclusion or on the target topology.

**Witness:** Restrict ℝ to (0,1). The target neighborhood |g(x)|<x excludes δψ for every δ>0 when ψ=1 near 0. Yet δψ tends strongly to 0 on ℝ for a fixed compactly supported smooth ψ.

Local finiteness leaves finitely many source bounds on supp ψ, all O(δ). On (0,1), use a locally finite compact cover with tolerances below each member’s minimum x; x=δ/2 violates the resulting strong C⁰ neighborhood.

**Exact repair:** Restrict into compact-core Cᵏ seminorm topology; for strong-to-strong open restriction require a proper inclusion (here clopen), or precise ambient-local-finiteness conditions. Preserve general Morse approximation. Add the endpoint negative control: on [a,b]⊂(0,1), δ<a passes the value bound; on (0,1), no δ>0 passes.

## R02 (P2) — Complementary indices require a nondegenerate Hessian

**Location:** `TauCetiRoadmap/MorseTheory/README.md:190–197`: “under the hypothesis df_x=0” followed by “complementary index under f↦−f”. No nondegeneracy hypothesis is attached to that index claim.

**Claim:** The indices at a critical point complement to dim M. Smoothness and criticality alone do not imply this.

**Witness:** For f=0 on ℝ, Hess f=0, λ(f)=λ(−f)=0, while dim M=1. The pinned `TauCeti.manifoldMorseIndex_neg_add_manifoldMorseIndex_eq_finrank` requires `.Nondegenerate` (`TauCeti/Geometry/Manifold/Morse/Index.lean:140`).

**Exact repair:** Require nondegenerate critical Hessian and cite the pinned theorem (or line 154). Alternatively include nullity: λ(f)+λ(−f)+dim ker Hess=dim M. Add f=0 on ℝ: 0+0+1=1; x² gives 0+1+0=1. The explicitly Morse-scoped §4.3 formula needs no change.

## R03 (P2) — The nonproper extension still belongs in MorseTheoryPartII

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1012–1057`: “Palais–Smale compactness without properness”; also `PalaisSmaleTargets.lean`.

**Claim:** A new compactness condition, noncompact-band deformation, completeness argument and nonproper convergence theory are added inside the existing roadmap.

**Witness:** Main's `TauCetiRoadmap/MorseTheory/README.md:649–680` ends with compact-trapped/proper convergence. For f(x,y)=x, the band [0,1]×ℝ is noncompact but PS holds since ‖grad f‖=1; the new theorem applies beyond that base contract.

**Exact repair:** Move §6.2 and its acceptance statements to MorseTheoryPartII, documenting the base M2/M6 boundary and consuming those sections. Retain f(x,y)=x as a noncompact-band Check: normalized flow (x−t,y) has speed 1. Keep base-roadmap corrections here.

## R04 (P2) — State the native CW-model headline

**Location:** `TauCetiRoadmap/MorseTheory/Suggested.lean:14–15`: “The full relative handle/CW comparison with coherent parameter families lacks its constructed handle attachment and comparison carriers”; compare README:577–583.

**Claim:** Missing parameter-family machinery justifies omitting the CW theorem. It does not: the basic headline, one index-j cell per critical point for a proper bounded-below Morse function, is already statable.

**Witness:** `Mathlib/Topology/CWComplex/Classical/Basic.lean:99,135` supplies cells and CW structures; `Mathlib/Topology/Homotopy/Equiv.lean:43` supplies equivalences. A scratch theorem quantifying X, its topology, Hausdorffness, CW structure and cell/critical-point equivalences elaborated with only sorry warnings.

The conclusion is a native `HomotopyEquiv M X` plus equivalences of index-j critical points with `Topology.RelCWComplex.cell (Set.univ : Set X) j`; no stand-in carrier.

**Exact repair:** Add this headline with standing assumptions, IsMorse, IsProperMap and bounded-below range; reserve the docstring limitation for relative/family carriers. Tests: x² on ℝ has one 0-cell; discrete ℕ with f(n)=n has countably many 0-cells; empty M has none. All fit the elaborated signature.

## R05 (P2) — Gradient convergence is also statable at the pins

**Location:** `TauCetiRoadmap/MorseTheory/Suggested.lean:18–20`: “The intrinsic variable-metric gradient convergence statement lacks the smooth manifold gradient/flow interface”; README:981–995 and `PalaisSmaleTargets.lean:47–54`.

**Claim:** Missing future gradient/flow proofs prevent stating the convergence headlines. Their actual carriers already exist.

**Witness:** `Riemannian.Tensor.rieszDual` exists at `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74`; `IsMIntegralCurveOn` is at `Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean:65`. A compact-trapped convergence signature using these directly elaborated successfully after the targeted Riesz module build.

The probe uses a smooth Riemannian bundle and the field `fun x ↦ -Riemannian.Tensor.rieszDual x (mfderiv I 𝓘(ℝ) f x)`. DifferentialGeometry's main Suggested.lean:3148–3151 defines this gradient. Compact trapping yields a critical limit. The flat nonproper theorem already exists in the extra file but not the designated acceptance module.

**Exact repair:** State intrinsic compact-trapped convergence using native Riesz gradient and smooth metric, with exponential decay in its distance. Move nonproper convergence to Part II's acceptance module. For f=x² and metric 4dx², the field is −x/2 and γ=x₀e^(−t/2)→0; Euclidean −2x is a different specialization, not a replacement.

## R06 (P3) — Repair the extra Lean file's form and name correspondence

**Location:** `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:1–10`: three `Mathlib.*` imports and “Suggested forms, not an exhaustive checklist”; line 8 still identifies its section as “M6.1”.

**Claim:** Both listed Lean files satisfy the acceptance-file form. The main file does; this extra file has no `import Mathlib`, lacks the required headline/missing-carrier docstring, and refers to the wrong section number. Its five declaration names are not enumerated in the README.

**Witness:** Lines 2–4 import Mathlib submodules, whereas the section is README §6.2. The README links the file at line 1067 but contains none of `Satisfies`, `of_isProperMap`, `finite_criticalValueBand`, `exists_gradient_lowerBound`, `exists_forwardTrajectory_converges`.

**Exact repair:** In the Part II acceptance file, use one `import Mathlib`, used Tau Ceti modules, the required module/layer docstrings and names matching prose targets. All four theorem signatures elaborate; this fixes organization/form, not hypotheses. The passing gate did not catch the extra-file violation.

## R07 (P3) — Finish the claim-level source locators and source records

**Location:** `TauCetiRoadmap/MorseTheory/README.md:234–239`, :624–671 and :950. Representative locators are “Theorem 5.3” and “Chapter 15”; several approximation statements have no external locator.

**Claim:** The references support all claims at their stated generality. Theorem 5.3 is the ordinary Morse normal form, not a stated critical-branch persistence theorem. The full strong noncompact/relative approximation theorem has no exact locator. “Chapter 15” leaves distinct local, attachment, orientation and spectral-sequence assertions unresolved.

**Witness:** `cohen-iga-norbury` line 1322 is the Morse lemma (pp.36–37); line 908 is compact finite-Cʳ density (p.23). Lines 4986,5091,5142 locate the separate Bott results. The folder has no sources.toml.

**Exact repair:** Give each theorem an exact locator and distinguish independently owned extensions. Use Milnor Theorem 3.1 p.12 for compact-band deformation, Theorem 3.5 p.20 for CW exhaustion, Corollary 6.7 p.36 for existence, and locate full strong/relative approximation separately. Cite Bott Theorems 15.1,15.4,15.6–15.7 pp.143,146–148 with the corrections below. Record the five works under stable keys/provenance, marking unread homework appropriately. Tests: noncompact ambient bands, infinitely many critical 0-cells, shrinking tolerances, Möbius twisted Thom group ℤ/2.

## R08 (P3) — Give the small auxiliary definitions their own discriminating Checks

**Location:** `TauCetiRoadmap/MorseTheory/README.md:443–445` (“For `sublevelInclusion`, prove identity … composition … compatibility”) and :806–817 (the finite minimum c(M)).

**Claim:** Every defined object has at least three discriminating Checks. The §2.2 list tests retraction, vector fields and one empty-band identity; it does not test inclusion's composition or the closed endpoint. The minimum's explicit Check only compares two witnesses on S¹.

**Witness:** `sublevelInclusion` has a real body at Suggested.lean:89; c(M) minimizes all smooth finite-critical functions at README:809–812. The associated lists at README:451–455 and :843–848 do not separately supply the required controls for these definitions.

**Exact repair:** Add README Checks: inclusion for x² at levels 1→4→9 keeps x=1; a=b is identity; the endpoint x=1 belongs at level 1 (unlike an open sublevel). For c(M): ∅↦0, point↦1, S¹↦2 for both two- and four-critical witnesses. Connect these to the minimum. Use prose API bullets for compact seminorms/minimum; no Lean padding.

## Verified sound

164 calculations cover the fifteen sampled sections, nineteen Lean declarations, headlines and findings; these are tests, not proofs.

**Build/signatures/form.** Head ca82e388ff51bdd3903ce8b43c188d3aec813e43; Mathlib pin 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; context main fa41b3747f56d4e77bd69e7099c1be4f2e4959ba. Outside-folder diff empty; worktree clean. No algorithm, sorry'd data, set_option, copied passage or suspicious instruction found.

Supplied gate output:

```text
gate MorseTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Prescribed direct Suggested.lean elaboration: exit 0, ten sorry warnings only. Combined scratch audit: all nineteen `#check @name` signatures compared with README; fourteen sorry warnings only. The three flagged definitions intentionally omit geometric binders (README:32–35); theorems retain them. PS Satisfies retains completeness required by gradient, drops finite dimension, and its four theorems retain finite dimension. No lost-binder defect remains.

Tried closing `rfl`, `simp`, `infer_instance` on each admission in a scratch copy: all fourteen remain. Definition/library inspection found no single-lemma proof of a retained headline; no padding finding. CW and intrinsic compact-gradient scratch headlines both elaborate with only sorry warnings after the targeted Riesz-module build. No Lean process remains.

**Headline inventory.** Normalized manifold Morse chart; finiteness in compact subsets; regular scalar level with embedding/tangent kernel; compact-band strong deformation; handle/cell attachment and coherent chart comparison; proper Morse CW exhaustion; strong smooth/relative Morse approximation; proper bounded-below Morse existence; strong polynomial inequalities; arbitrary-function LS categorical cover; sphere recognition; Morse–Bott normal form/negative-bundle attachments/filtered inequalities; compact-trapped gradient convergence and exponential decay; PS critical-band compactness/deformation and nonproper convergence. The main file states ten theorems covering the first local/topological/counting heads and the two LS deformation bridges. It explains genuine missing strong-topology and Bott/family carriers. R04–R05 correct the false/missing explanations for the ordinary CW and convergence heads; the PS statements belong to the new extension's acceptance module.

**Adversarial calculations.** C/B denote critical/Betti polynomials; fields are nonzero. “Retain” concerns the tested instance. Negative controls distinguish false conclusions from failed premises.

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
| 16 | complementary index | f=0 on ℝ; x² | 0+0≠1; 0+1=1 | R02; add nondegeneracy or nullity. |
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
| 41 | sublevelInclusion identity | f=x², a=b=1 | x=1 maps to 1, as does id | R08 asks to record this explicitly. |
| 42 | sublevelInclusion composition | levels 1≤4≤9, x=1 | direct 1↦1; composite 1↦1↦1 | Retain; add README Check. |
| 43 | closed endpoint in inclusion | f=x²,a=1,x=1 | 1≤1 true; 1<1 false | Closed/open wrong model distinguished; R08. |
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
| 74 | §2.4 finite CW headline | S² height | c₀=c₂=1,c₁=0; CW cells 1,0,1 | R04: state it in Lean. |
| 75 | proper noncompact CW headline | ℝ,x² | one critical 0-cell, CW point, H₀=ℤ and higher homology 0 | No compact ambient premise; R04. |
| 76 | infinite CW exhaustion | discrete ℕ,f(n)=n | stage below k+1/2 has k+1 points/cells; union has ℵ₀ 0-cells | Infinite case must not use finite Nat.card. |
| 77 | empty initial sublevel | x² lower bound0, a₀=−1 | M_(−1)=∅; start CW has 0 cells | Retain. |
| 78 | strict tower compatibility | discrete example | inclusion i↦i; φ_(k+1)\|{0,…,k}=φ_k=id | Correct use of actual commuting maps. |
| 79 | compact finite-stage factorization | compact subset of discrete ℕ | compact⇒finite; N=max points gives containment in stage N | Properness supplies this on sublevels. |
| 80 | relative band/opposite function | circle between regular heights | each boundary circle-point set has two points; λ(−f)=1−λ(f) at Morse extrema | Relative attachments require regular endpoints; R02 condition retained. |
| 81 | §3.1 strong topology at point | M=point | all derivatives of order≥1 vanish; condition reduces to \|g−f\|<ε | Ordinary topology on ℝ. |
| 82 | compact-chart strong topology | S¹, finite cover | finitely many tolerances have minimum ε>0; each derivative through k bounded by ε | Compact Cᵏ comparison; retain. |
| 83 | noncompact fine versus compact-open | ℝ, tolerance e^(−x²), constant δ≠0 | at large x, e^(−x²)<\|δ\|; on [−1,1], \|δ\|<e⁻¹ can pass | Strong distinction correct. |
| 84 | restriction continuity | ℝ→(0,1), δψ=δ near0 | source seminorms O(δ)→0; at x=δ/2, target error δ>x | False; R01. |
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
| 115 | minimum c(M)/witness independence | ∅; point; S¹ with 2- and4-critical witnesses | minima0,1,2; both circle witnesses yield2 | R08: make all three explicit minimum Checks. |
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
| 136 | compact-trapped gradient convergence | f=x²,γ=x₀e⁻²ᵗ | limit0, gradient at0=0, K=[−\|x₀\|,\|x₀\|] | True native-carrier headline omitted, R05. |
| 137 | omega-limit argument | same trajectory | omega={0}, connected and critical; #omega=1 | Finite critical set plus connectedness excludes two limits. |
| 138 | compact trapping versus mere completeness | f=x on complete ℝ | γ=x₀−t, no compact trap and no critical point | Completeness alone does not give convergence. |
| 139 | variable metric | f=x²,g=4dx² | grad=x/2, γ=x₀e⁻ᵗ⁄², norm_g grad=\|x\| | Metric dependence retained; R05. |
| 140 | dissipation and tail | Euclidean x² | E=x₀²e⁻⁴ᵗ, E'=−4E=−‖grad‖²; tail=\|x₀\|e⁻²ᵗ=√E | Constants and half-rate consistent. |
| 141 | local gradient inequality/distance | f=x² at0 | \|f\|=x²=(1/4)‖grad‖²; ‖grad‖=2dist(x,0) | Positive λ=4 works in native λ\|E\|≤‖grad‖² convention. |
| 142 | saddle convergence | f=−u²+v², u=0 | E=v²≥0, v=v₀e⁻²ᵗ; elsewhere E may be negative | No local-minimum hypothesis used. |
| 143 | equilibrium/division by energy | γ=0 for x² | E=0, length0, distance0 | Treat separately; do not divide by√E. |
| 144 | non-Morse rate | f=x⁴,γ=(x₀⁻²+8t)^−1/2 | decay t^−1/2, Hess0=0 | Exponential conclusion needs nondegeneracy. |
| 145 | PS Satisfies positive example | x² on ℝ | ‖grad x_n‖=2\|x_n\|→0⇒x_n→0 | Definition identifies desired compactness. |
| 146 | PS nonproper example | f(x,y)=x | gradient norm1 cannot tend0; band [0,1]×ℝ noncompact | PS holds vacuously, properness fails; R03 test. |
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

**Source verification: 15 sections, four readable works.** The sources service fetched `cohen-iga-norbury` from [Stanford](https://math.stanford.edu/~ralph/morsecourse/biglectures.pdf), `milnor-morse` from an [institutional course copy](https://math.stanford.edu/~ralph/math215b/Milnor.pdf), `weber-conley` from [the author](https://www.math.stonybrook.edu/~joa/PUBLICATIONS/conblock.pdf), and `morgan-condition-c` from [the author](https://www.math.columbia.edu/~jmorgan/Condition_C.pdf). Locators below use service line numbers and printed pages. An initial Milnor book-review match was discarded. No PR source/manifest edits.

| Seeded target | Source locator and verified scope | Outcome |
| --- | --- | --- |
| 1.1 Model transport | Native Boundaryless/chart APIs below; ComplexManifolds milestone 1. | Actual atlas bridge; no textbook theorem claimed verbatim. |
| 1.2 Hessians/counts | cohen-iga-norbury lines 903–910, §4.2 p.23; lines 1423–1429, Corollary 5.4 p.38; native Index. | Hessian comparison/isolation supported; complement needs R02. |
| 1.3 Normal forms/persistence | cohen-iga-norbury lines 1322–1415, Theorem 5.3 pp.36–37, Corollary 5.4 p.38. | Ordinary normal form verified; parameter persistence needs its separate IFT argument/locator, R07. |
| 2.1 Levels/boundary faces | Native Section/Boundary APIs below; morgan-condition-c lines 185–188, regular-point argument p.6. | Surjective derivative and actual charts; source coordinate typo not copied. |
| 2.2 Deformation/fields | milnor-morse lines 2225–2277, Theorem 3.1 p.12; cohen-iga-norbury lines 1202–1309, Theorem 5.1/Corollary 5.2 pp.33–35. | Milnor has compact band, no critical points, matching scope; Cohen assumes compact M. |
| 2.3 Handles/comparison | cohen-iga-norbury lines 1438–1517, Theorem 5.6 pp.38–40; milnor-morse lines 3456–3515,3623–3649, Lemmas 3.6–3.7 pp.20–23. | Attachment and homotopic attaching-map/base comparison supported. Coherent parameter families are a further owned extension. |
| 2.4 CW exhaustion | milnor-morse lines 3565–3592, Theorem 3.5 p.20; cohen-iga-norbury lines 1519–1548, Theorem 5.7/Corollary 5.8 pp.40–41. | Compact sublevels allow noncompact M. Strict towers use AlgebraicTopology §4.5; R04. |
| 3.1 Strong approximation | cohen-iga-norbury lines 908–910, Corollary 4.4 p.23. | Compact finite-Cʳ density only; not full noncompact strong topology or arbitrary-open restriction, R01/R07. |
| 3.2 Exhaustion/relative approximation | milnor-morse lines 6203–6270, Theorem 6.6/Corollary 6.7 p.36. | Proper Morse existence through closed embedding/squared distance. Relative strong fixing lacks exact locator, R07. |
| 4.1 Strong inequalities | cohen-iga-norbury lines 1569–1599, Corollary 5.11 p.42. | Real-coefficient chain-rank proof extends to every field. RP² tests characteristic 2. |
| 4.2 LS | weber-conley lines 39–106, Theorem 1.1/proof pp.2–3. | Closed M, C² f, critical points, unnormalized ambient category; no Morse premise. |
| 4.3 Sphere/projective | cohen-iga-norbury lines 1610–1643, Applications 5.12–5.13 pp.42–43. | Morse two-point hypothesis gives homeomorphism; CP lower even-index bounds. |
| 5.1 Bott | cohen-iga-norbury lines 4946–5009, Theorem 15.1 pp.142–143; 5091–5096, Theorem 15.4 p.146; 5142–5183, Theorems 15.6–15.7 pp.147–148. | Local normal/compact attachment verified. Twisted coefficients use CharacteristicClasses C2; correct local domain and classical E¹ convention. |
| 6.1 Compact trapping | cohen-iga-norbury lines 1022–1098, Theorem 4.6 pp.27–29; native Convergence/ExponentialConvergence. | Source has compact M; trapped extension uses maximal-flow/local estimates. R05. |
| 6.2 PS | morgan-condition-c lines 194–258, Definition 1.6/Remark 1.7/Proposition 1.8 pp.6–7. | Complete connected Riemannian Hilbert M, C^(k+2), k≥1, PS, finite critical-free band. Smooth finite-dimensional specialization valid; R03. |

**Pinned-library audit:** 24 groups of definitions/hypotheses opened. Paths are relative to the pinned library roots.

| Pinned file and line | Declaration/object and boundary of what it supplies |
| --- | --- |
| `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:588,597` | `ModelWithCorners.Boundaryless`, `toHomeomorph`: surjective model range and real homeomorphism; does not impose Hausdorffness/second countability on M. |
| `Mathlib/Geometry/Manifold/LocalDiffeomorph.lean:81` | `PartialDiffeomorph`: actual partial equivalence, open domains and smooth maps both ways. |
| `Mathlib/Topology/CWComplex/Classical/Basic.lean:99,135` | `RelCWComplex`, `CWComplex`, indexed cells and attaching data. Hausdorffness must be supplied separately; enough to state R04. |
| `Mathlib/Topology/Homotopy/Equiv.lean:43` | `ContinuousMap.HomotopyEquiv`: two continuous maps and inverse homotopies, not an uninterpreted equivalence relation. |
| `Mathlib/Topology/Homotopy/Contractible.lean:26` | `ContinuousMap.Nullhomotopic`: a target point and homotopy to its constant map. No inhabited empty target is manufactured by the empty-cover case. |
| `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | `singularHomologyFunctor`: genuine categorical singular homology with the chosen coefficients; finite-dimensionality is a further theorem. |
| `Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean:65` | `IsMIntegralCurveOn`: manifold derivative of the curve equals the given vector field on the set; suitable for a forward half-line trajectory. |
| `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:67`; `Mathlib/Topology/VectorBundle/Riemannian.lean:420,441` | Smooth Riemannian-bundle condition versus bundle inner-product/norm instances. The latter alone does not assert smoothness. |
| `TauCeti/Geometry/Manifold/Morse/Basic.lean:59,178,197` | `IsManifoldNondegenerateCriticalPoint` is preferred-coordinate based and carries no automatic boundary/smoothness premise; `IsMorse` includes smoothness and nondegeneracy. |
| `TauCeti/Geometry/Manifold/Morse/Index.lean:105,111,140,154` | Index bound, model transport and complementary-index theorem. The complement theorem has a nondegenerate-Hessian premise, R02. |
| `TauCeti/Geometry/Manifold/Morse/Prod.lean:144,156` | Product/sum index laws with coordinate differentiability hypotheses. |
| `TauCeti/Geometry/Manifold/MFDeriv/Chart.lean:149` | `MDifferentiableAt.mvfderiv_eq_fderiv_comp_extChartAt_symm`, under boundarylessness; justifies the critical-point bridge. |
| `TauCeti/Analysis/Calculus/Morse/Index.lean:76,114,236` | Second-derivative quadratic form, critical composition congruence and signed weighted squares. The Hessian's quadratic evaluation has no hidden one-half. |
| `TauCeti/Analysis/Calculus/Morse/NormalForm.lean:217,362` | Symmetric-family congruence relative to a fixed reference form; `exists_morse_chart` uses one-half the Hessian quadratic form. The manifold/unit-sign chart is the retained bridge. |
| `TauCeti/Analysis/Normed/Algebra/SquareRoot.lean:78` | `sqrtNearOne` is an actual local inverse of squaring near 1 in a complete real Banach algebra, not a global positive-square-root theorem. |
| `TauCeti/Geometry/Manifold/VectorBundle/Section/Chart.lean:106,123,136,152,174` | `sectionZeroChartAt` and source/apply/target/inverse laws, on the chosen kernel coordinates and neighborhoods. |
| `TauCeti/Geometry/Manifold/VectorBundle/Section/Manifold.lean:50–80,154` | Section-zero manifold theorem carries strict derivative, Fredholm, surjectivity, index, kernel-model and smoothness data. It does not give an arbitrary scalar level without specialization. |
| `TauCeti/Geometry/Manifold/VectorBundle/Section/SmoothZero.lean:63` | Existential smooth zero-locus charted/manifold structure with its explicit linearization hypotheses. |
| `TauCeti/Geometry/Manifold/Boundary/Charts.lean:220,231,241,252,263` | Boundary atlas/source/target/application/inverse are concrete coordinate-hyperplane constructions. Generic boundary gluing is left to GeometricTopology. |
| `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:125,141` | Finite singular-homology and Euler comparison for the specified finite CW/coefficient conditions; not arbitrary-rank integral top-homology freeness. |
| `TauCeti/Analysis/Calculus/Morse/Convergence.lean:272` | Compact-trapped vector-space gradient convergence, including continuous gradient and finite critical locus in K. |
| `TauCeti/Analysis/Calculus/Morse/ExponentialConvergence.lean:239,262` | Energy and distance decay after convergence to a nondegenerate critical point; not existence of intrinsic manifold convergence by itself. |
| `TauCeti/Analysis/Calculus/Morse/Linearization.lean:380` | Local positive-constant inequality λ·absolute energy ≤ squared gradient norm. |
| `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean:74,85,96` | `rieszDual` has a real body and the inner-product evaluation law; supplies the variable-metric gradient in R05. |

Object searches also found the finite-rank PID submodule freeness results in `Mathlib/LinearAlgebra/FreeModule/PID.lean:270`; they do not cover the countably infinite free-chain target. The base MorseTheory already owns that arbitrary-rank step. No new duplicate fully qualified declaration name was found in the indexed readable roadmap files.

**Ownership/supply:** read main ComplexManifolds, CharacteristicClasses and AlgebraicTopology for shape. Used indexed `roadmaps grep`/`roadmaps resolve` and object searches of main, supplied open heads and readable packages. No additional package owner or unresolved roadmap reference; pins checked separately above. Existing-roadmap revisions were not dependencies. Fourteen resolved groups:

| Roadmap and location | Contract/direction checked |
| --- | --- |
| DifferentialGeometry, `TauCetiRoadmap/DifferentialGeometry/README.md:371–400,507–510,884,910–923`; `Suggested.lean:3148–3160` | Flows/maximal extension, boundary, Sard, metric/gradient/Hessian; actual Riesz gradient specialization. Supplier, not a duplicate flow theory here. |
| AlgebraicTopology, `TauCetiRoadmap/AlgebraicTopology/README.md:624–739,789–810,1023–1127` | §4.5 relative attachments and strict CW tower comparison; the supplement after §6.2: unnormalized LS categorical cover/cup bound. Generic CW and LS carriers stay there. |
| GeometricTopology, `TauCetiRoadmap/GeometricTopology/README.md:195–222` | Generic collars, boundary gluings and tubular neighborhoods; Morse-adapted scalar bands/fields remain here. |
| CharacteristicClasses, `TauCetiRoadmap/CharacteristicClasses/README.md:550–635` | C2 disk/sphere bundles and Thom comparison including orientation local coefficients; no duplicated bundle carrier. |
| ComplexManifolds, `TauCetiRoadmap/ComplexManifolds/README.md:172–193` | Milestone 1 realification and smooth-model/atlas transport. |
| ComplexKahlerGeometry, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1407–1465` | K7.1 realified projective charts of real dimension 2n; K7.2 independent CW/cup calculation. Avoids deriving CP homology from the very Morse bound being proved. |
| DGFloer, `TauCetiRoadmap/DGFloer/README.md:612–635` | Layer 1.3 abstract filtered complexes and convergence, classical E¹ versus native reindexed page. It is independent of its later trajectory applications. |
| HeegaardFloer, `TauCetiRoadmap/HeegaardFloer/README.md:203–214,1380–1425` | Lane M consumes MorseTheory for Morse homology; §2.3 compact finite-Cᵏ Banach genericity differs from this roadmap's global strong smooth approximation. No trajectory-complex dependency introduced here. |
| RiemannianGeometry, `TauCetiRoadmap/RiemannianGeometry/README.md:160–175` | R3 broken-geodesic/path and round-sphere Bott applications consume abstract MorseTheory M2/M5. Consumer, not an upward supplier. |
| AffineMorseLefschetz, `TauCetiRoadmap/AffineMorseLefschetz/README.md:189–203` | Uses M3 fine approximation and M4 CW/top-homology bounds. Its affine/complex application is distinct. |
| SymplecticGeometry, `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:73–103` | T2 consumes the abstract Morse–Bott attachment theory. |
| HomotopySpheres, supplied open head, `TauCetiRoadmap/HomotopySpheres/README.md:1466–1480` | §4B Bott-chain application consumes RiemannianGeometry and MorseTheory M5. No reversed edge. |
| MorseNovikov, supplied open head, `TauCetiRoadmap/MorseNovikov/README.md:130–145` | Imports ordinary MorseTheory M1–M4/M6 and owns closed-one-form/Novikov extensions. |
| VariationalMethods, supplied open head, `TauCetiRoadmap/VariationalMethods/README.md:1–65` | Direct methods/spectral variational scope does not supply the PS compactness extension asserted here. Its existence does not authorize re-planning base MorseTheory. |

Main already owns ordinary manifold/compact-band/Bott theory. Retained chart and metric bridges fill existing targets; PS/nonproper theory crosses the Part II boundary, R03. No declared supplier gaps.

Required dependency check (`--movable`, supplied main/order):

```text
depcheck: 204 roadmaps, 1546 edges, 0 problem(s)
```

No UPWARD/CYCLE. Read all 15 Needs lines, contracts and layer Dependencies; consumer mentions are not supply edges.

## Not verifiable

- `mark-math240`: Thomas Mark, Math 240 Riemannian Geometry, Spring 2001, Homework 10 p.3 and Homework 11. The sources service's bibliographic lookup and a web search for author, course, year and homework did not locate a matching legal text. Recorded once in the scratch missing-reference request. No mathematical claim was certified from this inaccessible homework; the other sources/native results independently support the compact convergence calculations.
- The exact full noncompact strong/relative approximation locator is absent. The readable compact density statement is not certification of that stronger result; see R07. The restriction-continuity counterexample does not depend on an unavailable text.
- The full coherent family comparison and global varying-form normal-bundle construction are roadmap extensions. Their local examples, supplier inputs and source lemmas were checked, but the cited ordinary Morse lemma alone does not certify the complete extensions. No claim of completed formal proofs is made.

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
