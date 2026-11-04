# Review of GlobalShtukasAndFunctionFieldLanglands (pull request #1490 at 95c8832)

**Verdict:** needs changes

## R01 (P2) — Import the shared local correspondence instead of constructing it again

**Location:** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:2158`, also lines 23, 139 and 2162. The operative phrase is “its proof uses the global function-field correspondence of AL.3 independently of the supplied classical correspondence theorem.”

**Claim:** Section 7.11 plans existence, injectivity, surjectivity and extension through segments for a second local GL_r correspondence. Calling this an independent realization does not remove the duplicated theorem. The same README acknowledges that the supplier's rec is over every nonarchimedean local field. The comparison of coefficients, reciprocity conventions, monodromy and the global excursion construction is new work; existence of the shared correspondence is supplied work.

**Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:7` sets the nonarchimedean-local-field scope; lines 4585–4628 assign classical rec, duality and coefficient transport to *classical-llc-normalization*. Specialize F to F₃((t)): both plans construct rec for the same group.

**Repair:** Import rec from that named supplier target. Define the geometric-normalization correspondence by coefficient transport and full duality, and retain the identification with excursion parameters, the segment adapter and the all-place comparison. Delete the independent existence/injectivity/surjectivity and rank-induction plan for rec. If a specific pair-factor property is absent from the supplier, state that precise additional contract rather than reconstructing its whole bijection. The repaired adapter passes the README's rank-one test: χ(ϖ)=2 gives D(arithmetic Frobenius)=1/2, D∨(arithmetic Frobenius)=2, and rec(D∨)(ϖ)=2. For the special rank-two block it retains rank N=1, while the trivial representation has rank N=0.

This is repairable within the scope; it is not a rejection of the global-shtuka roadmap.

## R02 (P2) — Reconcile the four declared gaps with the ownership now stated in the README

**Location:** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:29`, lines 458, 1056 and 2067; `packages/GlobalShtukasAndFunctionFieldLanglands/design/plan.json:4`, 10, 16 and 22.

**Claim:** All four gaps remain active in the design's `gaps` list, but none of their slugs occurs under the README's exact supplier contracts. More substantially, the final README explicitly plans three of the requested objects itself, and the fourth requests the shared correspondence already owned by SmoothRepresentationsOfLocalGroups. These are now redundant ownership contracts, not missing proofs which a reviewer should demand from an acknowledged supplier gap.

**Witness:** The plan requests ordinary-centre restriction, elliptic chains and the SL_r volume from three suppliers. README §§7.6, 2.7 and 0.13 explicitly construct those same objects locally; §7.11 and its supplier both own rec.

**Repair:** Reconcile the package gap registry with this ownership move: retire `classical-centre-restriction`, `elliptic-sheaf-carrier` and `function-field-sl-volume` as external requests, recording §§7.6, 2.7 and 0.13 as their owners. Resolve `equal-characteristic-glr-correspondence` by R01; retain only any genuinely missing, precisely delimited supplier property, with the identical slug and needs sentence in the plan and README supplier subsection. This requires a package-contract update, not an edit to a supplier or a proof of an already declared gap.

The object comparison is concrete: both volume contracts give 1/16 for SL₂ over F₃(t) with maximal compacts of volume one; both elliptic-chain contracts require period 4 at rank 2 and a degree-2 pole; both centre contracts must exclude the function with coefficients λʲ on ϖʲ, whose reductions have supports {0,…,s−1}. No second owner is needed for any of these objects. The old reports' inability to obtain supplier mathematics is not being re-raised: the present defect is the subsequent mismatch between the local ownership and the still-active gap requests.

## R03 (P3) — Update the supplier locators to the current targets

**Location:** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:119`, 127 and the corresponding `Needs` citations, including lines 808, 1700, 1710, 1761, 1771, 1814, 1824, 1862, 2079 and 2113.

**Claim:** The LanglandsParameterStacks labels are stale. In particular the reference to §LP1.11 for Weil–Deligne parameters no longer identifies that target. `GlobalFunctionField.classFormation`, `dmStack_etaleCohomology` and `equalCharacteristicSchubertModels` are also no longer declaration names in their cited suppliers. The mathematical inputs do exist under the named prose targets, so this is a locator defect rather than an unowned prerequisite.

**Witness:** `TauCetiRoadmap/LanglandsParameterStacks/README.md:427` is §1.11, cotangent complexes; line 456 is §1.13, Weil–Deligne parameters. `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2244` states the class formation in prose, without the claimed identifier.

**Repair:** Replace LP0.1 by §0.1; LP1.11 by §1.13; LP2e.9–14 by §§2.9–2.14; and LP2c.1–4 by §§3.2–3.5, preserving the individual target names and matching each use rather than only changing the contract paragraph. Cite ArithmeticGaloisDuality §R02.3.2, *The class formation of a global function field*, without the nonexistent backticked name. Likewise replace the backticked labels at lines 111 and 155 by DeligneWeightsAndPurity §8.24, its coefficient-descent paragraph (supplier line 2876), and GeometricSatakeAndFusion §0.29 (supplier line 801). The replacement §3.3 explicitly includes arbitrary groups, disconnected reductive groups and characteristic ℓ; §3.4 is the relatively discrete Weil-continuity target. Thus the repairs preserve the modular and nonsplit cases, not just the characteristic-zero connected example. For the class-formation witness, invariants 1/2 and 1/2 sum to 0 in Q/Z under the supplied theorem.

## Verified sound

The review covered all **92 numbered target subsections**, their APIs, Checks, conventions and dependencies, the **15 seeded source targets**, the two reviewed files, the supplied gate, the package's four gap records, and ownership searches in main, the supplied open checkouts and board packages. The substantive mathematical tests below are instances and negative controls, not proofs of the general theorems. No false roadmap equality was found by these tests. The findings concern ownership/contracts and citations.

### Gate, dependency direction and Lean form

The head matched `95c883288d1eba5541cee62c1ca6e3eb09d8f898`. The outside-folder diff was empty and the worktree was clean. The worker's gate at that head reports every counter zero and `OK`, including `build`, `depcheck`, `stray-files`, `outside-folder`, `imports`, `sorry-data` and `set_option`. No gate failure is being omitted.

The independently run dependency command produced:

```text
depcheck: 204 roadmaps, 1496 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Each `Needs` line was considered together with the supplier contracts; scope-only downstream mentions were not treated as imports. The local arrows run from bundle/Hecke geometry through cohomology and descent to excursions, then to comparisons. In particular §7.7 does not assume §7.6's stronger uniform support theorem, and §5.13 is not used as a theorem by another target.

Direct elaboration with `lake env lean` on `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean` exited **0**, with **zero warnings**. The file has exactly one `import Mathlib`, one module docstring, the prescribed namespace, and **zero declarations**. Consequently the family of `#check @name` probes and the one-tactic padding probes is empty; no disappearing section binder or padded theorem is present. There is no sorry'd data, `set_option`, surrogate proposition or arbitrary operator used to stand in for a geometric headline.

The README has the prescribed opening, scope, conventions, exact contracts, eight layers, examples/dependencies for each layer, consumers and references. Every subsection introducing a definition has an API and at least three Checks. The observed rank, coefficient and universe restrictions exclude rank-zero elliptic chains, q=1, zero-exponent torsion rings and arbitrary-sized disjoint unions. The modular branches retain ℓ=2 when ℓ≠p. The split-only results are named as such and the nonsplit branches are separately planned; “good place” refers to the unramified locus and is not a substitute for the ramified local comparison.

### Computed adversarial table

Here “pass” means the displayed computation agrees with the assertion on that instance. A negative control records the value of the plausible wrong interpretation. `O` in bundle rows denotes the structure sheaf; `O_E` in coefficient rows denotes the valuation ring. Rows concerning cohomology use either the specified geometric example or the elementary fibre/action model explicitly identified in the row.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
|---|---|---|---|
| Conventions: reciprocity | Rank-one χ(ϖ)=2, ℓ=5; degree 2 | Geometric/arithmetic values 2 and 1/2; their squares 4 and 1/4 | Pass; none |
| Conventions: signs and square roots | GL₂ minuscule, q=3; q=9, degree 2 | IC trace −1/√3, sign-corrected +1/√3; at q=9, √q_v=9 | Pass; none |
| Conventions: excluded coefficient cases | p=3, ℓ=2; s=0 versus s=1 | 3 mod 2=1 is a unit; O_E/λ⁰=0 versus O_E/λ≠0; q=1 gives q−1=0 | Exclusions needed and present |
| 0.1 Bundle stack | G_m on P¹/F₃; dilatation at one rational point | Unlevelled automorphism order 2; fibre-trivialized automorphism order 1 | Pass; generic torsor descent retained |
| 0.2 Deformations | G_m, g=0; PGL₂ with one Iwahori point | h⁰=1,h¹=h²=0, stack dimension −1=−χ; flagged dimension −3+1=−2 | Pass |
| 0.3 Full level | N=2v, G_m, κ_v=F₃ | Units of F₃[ε]/ε²: 2·3=6; reduced level has 2 | Pass; nilpotents matter |
| 0.4 Fractional twists | Rank 2, a rational flag; rank 1 | Two half twists equal O(x): degree change 2=2·1; rank-one period 1 | Pass |
| 0.5 HN data and Euler form | O,O(1) on P¹; torsion and zero | χ(O,O(1))=1+1=2; reverse 1−1=0; positive torsion slope ∞, zero has no HN factors | Pass |
| 0.6 Bounded loci | G_m embedded by t↦diag(t,t⁻¹), bound 1 | Degrees −1,0,1 have max(d,−d)≤1; d=2 gives 2>1. Adjoint bound alone sees all d as 0 | Pass; faithful bound essential |
| 0.7 Adelic groupoids | Line bundle over F₃; disconnected C₂ control | Adelic stabilizer and bundle automorphisms both have order 2; H¹(F₃,C₂) has 2 classes, unlike connected Lang case | Pass; connected fibres retained |
| 0.8 Shifted HN | O(1)⊕O(−1), T=(1,−1); T=(3,2,0) | 1−1=0≤0; second block (4−2−0)/2=1, wrong prefix gives −1/2 | Pass |
| 0.9 Parabolic instability | Opposite flags on O² at 0,∞ | D=∅ and D={0,∞} both give instability 0; singletons give 1 | Pass; uniqueness only for positive minimum |
| 0.10 Central lattices | GL₂ degree lattice 2Z; anisotropic norm-one torus | Z/2Z has 2 classes; norm-one torus has rational split-central rank 0, geometric degree lattice rank 1 | Pass; rational/geometric degrees distinguished |
| 0.11 Orbit masses | Line bundle over F₃ | Orbit mass 1/2 times kernel value 2 equals 1; constant-function integral remains 1/2 | Pass |
| 0.12 Nonsplit descent | Norm-one torus; GL(O⊕O(1)) on P¹ | d=−d forces d=0; h⁰(Lie(𝒢)(−1))=1 versus split O⁴ value 0 | Pass; outer splitting does not trivialize inner form |
| 0.13 Mass and volume headlines | P¹/F₃, rank 2; P¹/F₂, torsion degree 2 | 1/48+Σ_{m≥1}1/(4·3^(2m+1))=1/32; SL₂ volume 2/32=1/16; Tamagawa 16/16=1. Torsion mass 2+3+1/3=16/3, not 9/2 | Mathematics passes; R02 ownership |
| 0.14 Cusp interface | G_m, P¹/F₃, N={0,∞}; no level | Ray group order (2·2)/2=2, hence cusp dimension 2; empty-level dimension 1 | Pass |
| 0.15 Picard/Lang fibre | P¹/F₃ | Pic(F₃)=Z, Pic⁰(F₃)=0; each stack object has mass 1/2 | Pass; degree-zero kernel alone is wrong |
| 1.1 BD Grassmannian | G_m, dual numbers; collision weights 1,−1 | 1+ε/t is invertible in Laurent series, not in power series, hence a nontrivial infinitesimal coset; collision weight 1−1=0 | Pass; reduced lattice alone loses the first point |
| 1.2 Schubert bounds | GL₂ coweights (2,0),(1,1); zero bound | Dimensions 2 and 0, dominance gap (1,−1); bound 0 is a point | Pass |
| 1.3 Hecke chains | Empty chain; G_m positions 2,−1 | Empty composite is identity; composite position 2+(−1)=1 | Pass |
| 1.4 Stack coefficients | BC₂; BG_m over F₃ | Rational trivial H⁰=E, sign H⁰=0; BG_m trace Σ_{i≥1}3⁻ⁱ=1/2=1/#F₃× | Pass; rational and torsion theories separated |
| 1.5 Fusion/convolution | Two standard GL₂ minuscule modifications | Zero fibre P¹ has dimension 1; fixed-fibre codimension 2 gives 2·1=2; collision adds base codimension 1, giving 2<3 | Pass; semismall versus small distinguished |
| 1.6 Iwahori local chart | ab=t at t=0 | Total chart A² has dimension/tangent dimension 2; special nodal curve has dimension 1, tangent dimension 2 | Pass; special fibre not declared smooth |
| 1.7 Satake category | GL₂ standard; G=1 arithmetic lines | Tensor dimension 4=3+1; Frobenius +1 and −1 have same geometric line but distinct descent | Pass |
| 1.8 Satake normalization | Odd-dimensional P¹ support | Shift trace sign −1; extra odd-odd sign squares to (+1); normalized function +q⁻¹/² | Pass |
| 1.9 Geometric Satake headline | G_m weights 1 and −1; GL₂ | Convolution weight 0, tensor character z·z⁻¹=1; antipode identity gives 1, wrong identity antipode gives z². Standard cohomology dimension 2 | Pass on these instances |
| 1.10 Central Satake action | Projective action over F₅, h=diag(1,2), and the two shears of the README | h sends [1:1] to [1:2]; h⁻¹ gives [1:3]; scalar 3 fixes the point; noncommuting transformations give [1:1] versus [3:2] | Pass; centrality is used |
| 1.11 Nonsplit/arithmetic Satake | Split SL₂, cycl(γ)=3; C₂ torus action | Source's conjugation-only map gives u(1/3) versus u(3) on a product; README's right translation gives u(1)c_γ⁻¹ on both sides. Char-2 lift equations require coefficient 1=0 | Pass with README correction; source erratum below |
| 1.12 Spherical Satake | Norm-one unramified torus; z=2 | X_*(T)^F=0, so spherical algebra E; individual local characters distinguish 2 from 1/2 although global orbit sum is 5/2 | Pass |
| 1.13 Determinants/opposition | Two lines; GL₂ P¹ | Swapping determinant factors gives −1, equal to +1 only in characteristic 2; opposition signs on IH⁰,IH² are +1,−1 | Pass |
| 1.14 Integral Satake headline | Residue module k over a DVR; torus weights ±1 | Tor₁(k,k)=k and ordinary tensor k⊗k=k; derived tensor has degrees −1,0, its degree-zero perverse tensor is k; weights add to 0 | Pass; no flatness silently inferred |
| 2.1 Global shtukas | GL₂ opposite degree-one modifications; one positive G_m leg | Degree path d,d+1,d closes; one positive leg would require d+1=d and is empty | Pass |
| 2.2 Finite-type truncations | Central μ_p; two SL₂ standard factors; modified HN control | uᵖ=1 need not imply u=1; (−1,1) acts as −1 on tensor of the two standards; modified slope 1/4 differs from source slope 0 | Pass; no smooth-centre or naive direct-sum shortcut |
| 2.3 Smooth local models | G=1; G_m, one level jet and zero modification | Relative dimensions 0 and 1=1·dim G_m; quotient by the one-dimensional jet group lowers target stack dimension by 1 | Pass |
| 2.4 Fractional-infinity shtukas | Rank 1, P¹/F₃, no legs | Rational Picard groupoid has one BC₂ in each degree; quotient by the full Picard groupoid removes scalar arrows, quotient by degree classes alone leaves BC₂ | Pass |
| 2.5 Compact-cohomology headline | Zero-leg GL₂ on P¹; collision fibre P¹ | HN bounds m=0,1,2 give H⁰ dimensions 1,2,3; collision has H⁰ and H² each dimension 1 | Pass; neither full finiteness nor collision smoothness inferred |
| 2.6 Inner forms | Rank 2, two invariant-1/2 poles | 1/2+1/2=0 in Q/Z; a lone invariant 1/2 does not sum to 0 | Pass; R03 fixes supplier name |
| 2.7 Elliptic comparison headline | Rank 2, degree-2 pole, g=0 | Period 4 degree-one quotients gives degree 4, equal to twist by rank-2 O(∞); period 2 gives wrong degree 2. Marked degree 2(−1)+1=−1 | Mathematics passes; R02 ownership |
| 2.8 Horocycles | r=2 path N,N+1,N | Endpoint change 0; two modifications give the stated rank 2 affine contribution; a one-step path has change ±1 | Pass |
| 2.9 Partial Frobenius | Closed point of degree 2; two legs | One Frobenius exchanges residue embeddings, its square fixes them; product of individual degree vectors (1,0),(0,1) is (1,1) | Pass |
| 2.10 Coalescence | G_m weights 1,−1; empty/unit insertion | Diagonal restriction character z·z⁻¹=1, weight 0; inserted unit has dimension 1 | Pass |
| 2.11 Hecke correspondences | Torus translations 2,3, identity | Composition shifts by 5; inverse of shift 2 is −2; identity shifts by 0 | Pass |
| 3.1 Creation/annihilation | V of dimension 2; scalar-rescaled coevaluation | Closed loop value 2; zigzag is I₂; multiplying coevaluation by 3 gives loop 6, excluded by the duality normalization | Pass |
| 3.2 Integral Hecke finiteness | E=Q₅, operators 5⁻¹ and 2 | Powers of 5⁻¹ have valuations −n, impossible in one finite O_E-module; 2ⁿ lies in O_E and spans a stable lattice | Pass; rational dimension 1 alone insufficient |
| 3.3 Horocycle direct images | r=2, rank-one affine fibre | Compact shift contributes 2 degrees and one Tate twist; combining fibre [−2](−1) with source [4](2) gives [2](1) | Pass |
| 3.4 Ind-perverse quotient | Constructible E²; ⊕_{n≥0}E | E² becomes zero modulo constructibles; the infinite direct sum is not a constructible object and is not killed for that reason | Pass |
| 3.5 Cuspidal cohomology | Torus; GL₂ delta at trivial bundle | Empty family of proper-parabolic kernels gives all H; GL₂ constant term of that delta is positive, so delta is excluded | Pass |
| 3.6 Frobenius Hecke operator | Degree-2 place, q=3 | Required power Frob²; q_v=9 and normalized standard coefficient +1/3, with IC coefficient −1/3 | Pass |
| 3.7 Eichler–Shimura headline | F=diag(2,3); rank 1; characteristic 2 | F²−5F+6I=diag(0,0); rank-one F=2 gives 2−2=0; 2!=0 in char 2 so division by factorial cannot prove the integral claim | Pass; integral alternating route retained |
| 3.8 No-leg cusp identification | G_m ray group of order 2 versus ordinary Picard quotient | Both levelled descriptions have dimension 2; forgetting the level gives dimension 1 | Pass |
| 3.9 Boundary constant terms | Large instability; translation by a degree-one place | Constructible core is 0 in the quotient; index N is sent to N+1, so a fixed upper bound N is not preserved | Pass |
| 3.10 Integral cusp finiteness | Torus, same two levels | Integral cusp lattices O_E and O_E² have ranks 1 and 2; not the infinite untruncated GL₂ space | Pass |
| 3.11 Eisenstein headline | Pic(P¹)=Z | Laurent group algebra E[t,t⁻¹], Weyl invariants E[t+t⁻¹] have Krull dimension 1; a nonzero finite-support spectral module has Krull dimension 0 | Pass on the spectral model |
| 3.12 One-place Hecke finiteness | H=O_E[t], M=H; M'=H/λ² | Rank_H M=1 but O_E-rank is infinite; λ-torsion exponent of M' is 2 | Pass; different finiteness notions remain separate |
| 3.13 Finite-type core | (r,#Σ∞)=(0,0),(0,2),(2,2) | Inequalities r<#Σ∞ are false,true,false; corresponding full stacks are non-finite-type, finite-type, non-finite-type | Pass; parity satisfied in each case |
| 4.1 Drinfeld finite covers | I=∅; one nonreduced point Spec F_q[ε]/ε² | Empty product condition forces Frob_T=id and gives finite F_q-point sets; nilpotent thickening has same finite étale covers as Spec F_q, although Frob(ε)=0 | Pass; no false reducedness requirement added |
| 4.2 Drinfeld lisse coefficients | One factor, constant rank 2; one torsion line | Descent fibre E² has rank 2; O_E/λ fibre has length 1; neither is identified with the zero fibre | Pass |
| 4.3 Frobenius–Weil group | Degree tuple (2,3); nonintegral unramified character | Product scalar 2²·3³=108; λ⁻ⁿ has valuation −n and cannot extend to compact profinite image | Pass |
| 4.4 Fusion/Frobenius | Two rank-one actions 2,3 on merged legs | Merged action 2·3=6; applying only one factor gives 2 or 3 | Pass |
| 4.5 Finite lisse envelopes | Monic relation F²−5F+6=0 | F²v=5Fv−6v, so span{v,Fv} contains all nonnegative powers; leading coefficient 1 is used | Pass |
| 4.6 Specialization | Constant lisse line; skyscraper control | Constant fibre map 1↦1 has inverse 1↦1; skyscraper closed/generic dimensions 1/0 are excluded from lisse-envelope assertion | Pass |
| 4.7 Product Galois action | Finite C₂ image over Q₅; nonintegral scalar | −1 preserves O_E and squares to 1, hence extends through a finite quotient; 5⁻¹ has unbounded powers | Pass; integral lattice hypothesis matters |
| 4.8 Cohomology functors | Empty legs on G_m; scalar coefficient maps | Dimensions 1 or 2 according to level; maps 2I then 3I compose to 6I; unit coefficient dimension 1 | Pass |
| 4.9 Galois-equivariant coalescence | S₃, a=(12), b=(23) | Diagonal map sends ab to (ab,ab), the product of (a,a),(b,b); replacing diagonal pullback by multiplication would confuse ab=(123) with ba=(132) | Pass |
| 4.10 Naturality | Retained scalar 3 and auxiliary scalar 2 | Commuting retained action gives 6 either way; auxiliary action inserted between creation/annihilation contributes 2, not 1 | Pass |
| 4.11 Specialization independence | diag(2,3), swapped basis, x=e₁, ξ=e₁* | ξρx=2; after simultaneous basis changes ξP⁻¹(PρP⁻¹)Px=2 | Pass |
| 4.12 Weil descent | O_E[t]/(λt−1) versus O_E[t]/λ | First is E: E-dimension 1 but not O_E-finite; second is k[t], infinite over k | Pass; rational descent does not assert integral finiteness |
| 4.13 Ind-smoothness headline | Zero-leg GL₂ on P¹; trivial-coefficient diagonal | Finite HN pieces have dimensions m+1→∞; each is lisse on the point, union not finite rank. Unit specialization E→E has rank 1 | Pass |
| 5.1 Excursions | W=1, pairing a=0,3; identity tuple on dimension 2 | Operators 0 and 3I; identity tuple gives ξ(x)I, closed standard loop 2I | Pass |
| 5.2 Invariant indexing | SL₂ diagonal A=diag(2,1/2); two legs | tr A=5/2; tr(AA⁻¹)=2; incorrect product tr A·tr A⁻¹=25/4 | Pass; cyclic matrix coefficient not arbitrary presentation |
| 5.3 Satake separation | GL₂ F=diag(2,3) | Trace 5, determinant 6, polynomial 1−5T+6T²; trace F²=13 | Pass; full invariant family retained |
| 5.4 Excursions on full cohomology | Retained rank-2 coefficient; auxiliary unit/zero | Unit pairing gives I₂; zero creation gives 0; on retained eigenvalue-2 vector auxiliary scalar 3 gives 3v, not 6v | Pass |
| 5.5 Excursion identities | Scalar tensor coefficients; S₃ ordered product | 2·3=6; a b⁻¹ with a=(12),b=(23) is (123), reversed product (132) | Pass; order matters |
| 5.6 Unramifiedness | Inertia outside N; ramified rank-one sign at N | Inserting allowed inertia leaves trace diag(2,3)=5; ramified sign at an excluded place can be −1 rather than 1 | Pass; not unramified everywhere |
| 5.7 Excursion algebra | Jordan J=[[1,1],[0,1]]; zero cusp space | dim ker(J−1)=1, dim ker(J−1)²=2; zero space has zero image algebra and no nonzero blocks | Pass; no reducedness assumption |
| 5.8 Reconstruction | G_m, Γ=Z, generator 2; unipotent SL₂ | Character reconstructs 2; unipotent and trivial SL₂ have trace 2 on all powers and same semisimplification I₂ | Pass; R03 locator |
| 5.9 Cuspidal decomposition headline | G_m ray group C₂ over Q₅ | Function dimension 2=1+1, characters at generator +1,−1; corresponding Hecke scalars +1,−1 | Pass on rank one |
| 5.10 Nonsplit headline | Norm-one torus, quotient C₂ acting by inversion | Prescribed projection has image order 2; replacing full based root datum by empty Dynkin graph gives wrong quotient order 1 | Pass; finite projection retained |
| 5.11 Modular headline | Regular C₂-module over F₂ | T−1≠0 but (T−1)²=0; generalized block dimension 2 versus eigenspace dimension 1 | Pass; scalar Hecke action not asserted |
| 5.12 Conditional eigensheaf statement | Rank-one constant eigensheaf; zero trace | Unit excursion value 1 and trivial parameter value 1; zero trace vector 0 lies in every subspace and cannot establish a parameter | Conditional statement retained, not a theorem without its compatibility hypothesis |
| 5.13 Conjectural multiplicities | S_σ=G_m, weights 0 and 1 | Invariants of weight 0 have dimension 1, weight 1 dimension 0; I=∅,W=1 gives A_σ^{S_σ}, not A_σ | Consistency only; conjecture is not used as an axiom |
| 6.1 Constant twists | Constant geometric Frobenius q, weight 2 | Multiply by q⁻¹, weight −2, to obtain 1 of weight 0; weight +2 twist instead yields q² of weight 4 | Pass; source sign corrected |
| 6.2 Companions headline | Rank 1 and rank 2 slope bounds | Rank-one bound (1−1)²/1=0; constant q has slope 1, normalized to 0. Rank-two bound 1/2; twist by q shifts [−1/2,1/2] to [1/2,3/2] | Pass; denominator positive |
| 6.3 GL_r excursion comparison | Rank 1, degree quotient 2Z | Remaining constant characters have values ±1, weight 0; unrestricted scalar q has infinite-order determinant and is not such a block | Pass on rank one; higher-rank argument consumes AL.3 |
| 7.2 Restricted shtukas | I=∅, G_m, residue F₃, levels 1 and 2 | Finite groups have orders 2 and 6, hence classifying-stack masses 1/2 and 1/6 | Pass; stack not a set of cosets |
| 7.3 Nearby cycles | Spec field; product of two curves; xy=0 control | Dimensions 0 and 2, integral bases; in k[x,y]/xy, x·y=0 with x,y≠0, so integral-base hypothesis fails | Pass; general oriented-product theorem imported |
| 7.4 Nearby-cycle transport | m=(3,7), d=(−1,2); boundary m=0,d=−1 | Result (2,9); boundary index −1 is inadmissible, not natural-subtraction value 0 | Pass |
| 7.5 Local excursions | Unit f; torus translation | δ₀*δ_n=δ_n on both local and global sides; normalized GL₂ coefficient at q=3 is +1/√3 | Pass |
| 7.6 Local-parameter headline and ordinary centre | Coefficients λʲ on ϖʲ; unit f | Supports modulo λ,λ² are {0},{0,1}; inverse-limit support is infinite. Unit excursion support is {0} for every s | Mathematics passes; uniform support is an owned target, R02 |
| 7.7 Full compact-cohomology comparison | Same decaying function; J=∅ and unit f | v_λ(λʲ)=j→∞ despite infinite support; unit convolution sends δ_n to δ_n, coefficient 1 | Pass; decay and finite support not conflated |
| 7.8 Local–global headline | Rank-one Frobenius 2; Steinberg/trivial control | Local and global restrictions both give 2; same rank-two semisimple Weil part has N-ranks 1 and 0 | Pass; conclusion expressly semisimple |
| 7.9 Monodromy distinction | F=diag(q⁻¹/²,q¹/²), N=E₁₂ or 0 | FNF⁻¹=q⁻¹N; both Weil parts identical, monodromy ranks 1 and 0 | Pass; R03 locator |
| 7.10 Gamma headline | Special rank-two block; trivial line, q=2,s=0 | Correction (−bT)·(−1/(bT))=1 as rational functions; trivial gamma 0/(1−1/2)=0; ψ(ϖ·) multiplier q^(1/2−s) | Pass; not an assertion at poles of individual rational factors |
| 7.11 Ramified GL_r comparison | Rank-one χ(ϖ)=2; two-term segment at q=3 | D∨ has arithmetic value 2, hence rec(D∨)=χ; full dual N=−E₂₁ retains rank 1. Z has N-rank 0, L=Steinberg rank 1 | Mathematics passes on controls; remove duplicated existence work, R01 |

### Seeded source audit

All fifteen sampled locators were read in the cached legal texts, including the actual hypotheses and the nearby proof where the README cites a construction. The README does not flag any additional locator as unverified. Pagination below is the pagination of the version named in its References, not an assumed numbering from another version. The GeL formula damaged by OCR was also inspected on the page image.

| Sampled target | Text opened at its locator | What the text supports, and limits retained |
|---|---|---|
| 0.2 Deformations | Hein line 158–201, proof of Proposition 1, p.4; YZ line 4019–4022, Proposition 5.17(1), p.63 | H⁰/H¹/H² for automorphisms/lifts/obstructions; H² vanishes on the curve. The flagged PGL₂ dimension is 3(g−1)+deg Σ, not the constant-group formula for every ramified model. |
| 0.5 HN data | Sch line 509–559, §2.1, pp.306–307; Schieder line 433–489, Theorem 2.3.3 and §2.4.1, pp.12–13; line 1508–1549, Theorem 4.5.1, pp.39–40; line 2043–2078, §6.3, pp.52–53; VL line 2119–2129, p.41 | Euler pairing and slope conventions; existence/comparison of canonical reductions. The README correctly retains an almost-isomorphism in arbitrary characteristic and does not assert a relative canonical reduction over every nonreduced base. |
| 0.6 Bounded loci | AH19 line 289–308, Proposition 2.2, p.6; line 404–417, Theorems 2.5–2.6, p.8; line 478–509, Remark 2.9, pp.9–10; Var line 139–153, p.4 and line 1069–1080, Lemma A.3, p.29; VL line 8260–8289, Lemma 12.1, pp.148–149 | Faithful determinant-one representation and quasi-affine finite-presentation map; openness/boundedness and cofinality. Read the HN bound as cumulative/dominant inequalities: AH19's individual-quotient equivalence is erroneous (below), but the roadmap uses the correct HN open. |
| 1.9 Geometric Satake | MV line 960–1005, Theorem 7.3, pp.23–24; line 1292–1315, Proposition 11.1, p.31; line 1370–1400, Theorem 12.1, p.33; Ric line 46–88, Theorem 0.1, p.2; VL line 2574–2625, Theorem 1.17, pp.48–49 | Reconstruction/identification of the dual group and the moving-leg coefficient functor. Ordinary symmetry needs the sign correction; an arbitrary arithmetic descent datum is not forgotten. |
| 1.10 Central action | MV line 1134–1199, projective reconstruction, pp.27–28; VL line 2698–2706, Remark 1.20, p.51; line 8666–8686, Theorem 12.16, pp.157–158 | Central action via the coefficient representation and finite-dimensional support reconstruction. Noncentral positive-loop action is not asserted to descend in the same way. |
| 1.11 Nonsplit descent | Ric line 1030–1058, Proposition 5.6/Corollary 5.8, p.22; VL line 8666–8722, pp.157–158 and line 9022–9037, pp.164–165 | Arithmetic versus pinned action, finite-quotient extension, fixed-leg coefficient presentations. The README repairs Ric's displayed group map; it does not silently use the incorrect conjugation-only formula. |
| 2.3 Local models | VL line 2865–2921, Proposition 2.8, pp.54–55 | Smooth morphism to the finite-jet quotient and relative dimension Σ_i n_i dim G in the stated reductive setting. This is not smoothness of all Schubert varieties. |
| 2.10 Coalescence | VL line 3704–3761, Propositions 4.12, 4.14 and intervening Remark 4.13, pp.69–70; line 7344–7379, Proposition 9.7, p.132 | Fusion/coalescence comparisons and their Frobenius/Galois compatibilities on the specified cohomology. |
| 3.2 Integral finiteness | VL line 6163–6189, Definition 8.19, p.115 | Finite O_E-submodules stable under the integral Hecke algebra, not merely finite-dimensional E-orbits. |
| 4.7 Product Galois action | VL line 6424–6476, Proposition 8.27 and Remark 8.28, pp.119–120 | Product Galois action on Hecke-finite vectors assembled from finite lisse pieces; distinction from the whole untruncated space. |
| 5.2 Invariant indexing | VL line 7754–7799, §10 construction preceding Proposition 10.8, pp.137–138 | Canonical cyclic subquotient/matrix-coefficient presentation and dependence on the invariant function, rather than on an arbitrary presentation. |
| 5.6 Unramifiedness | VL line 7631–7686, Lemma 10.4, p.136; line 7858–7900, Proposition 10.10, p.140; line 8298–8308, p.149 and line 8975–8993, pp.163–164 | Inertia invariance away from the level/bad set and its nonsplit extension. No assertion erases bad-place inertia. |
| 6.1 Constant twists | Chin line 499–544, Proposition 4.3, pp.13–14 | Algebraicity/plainness refinements and finite-determinant normalization. The inverse-root proof gives weight −w for the normalizing twist; the printed +w in item (6) is a sign slip. |
| 7.6 Centre parameters | GeL line 50–90, Theorem 0.1, pp.2–3; line 193–248, Theorem 1.1, pp.5–6; line 299–310, Remark 1.5, p.8; line 1468–1499, Remark 6.3, pp.39–40 | Integral Galois parameters, general Weil parameters and the ordinary-centre refinement. The uniform-modification/support argument is explicitly planned in the README, not inferred from compatible completed corners. |
| 7.7 Compact cohomology | GeL line 1581–1603, Proposition 8.1, pp.42–43, with p.43 image checked | Equality with right convolution on the integral degree-zero compact-support colimit at the diagonal generic point, with retained legs and coefficients; decay at infinity is distinct from finite support. |

Two further references absent from the package source list were fetched through the sources service from the README's legal URLs: **Sp**, the EMS publisher copy, and **Harder**, the university-hosted copy. Sp line 2383–2458, Definition 5.9, Proposition 5.10 and Remark 5.11(a), pp.651–653, retains the degree-of-infinity period and Frobenius-rotated pole sections. Harder line 1892–1991, Theorem 3.2.2 and §3.3, pp.302–305, gives the projection/residue route and Tamagawa number 1 for the Chevalley case needed for SL_r. The Harder p.302 page image was checked to distinguish a printed slip from OCR. No missing-source request remains for either work. No source text was copied into the roadmap or this report.

### Pinned library audit and headline coverage

Pins checked: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following **19 declarations** were located and their definitions or signatures opened. Paths in this table are relative to the indicated library checkout.

| Declaration | Pinned file and line | Consequence for this review |
|---|---|---|
| `AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean:40` | Locally affine locally ringed space; no implicit smoothness, finite type or nonemptiness. |
| `CategoryTheory.Pseudofunctor.DescentData` | `Mathlib/CategoryTheory/Sites/Descent/DescentData.lean:59` | Objects and compatible arrows on a cover; no algebraic atlas. |
| `CategoryTheory.Pseudofunctor.IsStack` | `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` | Effective descent extends prestack descent; not the algebraic-stack carrier required by shtukas. |
| `CategoryTheory.GaloisCategory` | `Mathlib/CategoryTheory/Galois/Basic.lean:412` | Asserts existence of a fibre functor; a geometric basepoint is not a field of the class. |
| `ExteriorAlgebra` | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60` | Real Clifford-algebra specialization on a module, not an absent geometric construction. |
| `LinearMap.charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44` | Finite free module over a commutative ring. |
| `LinearMap.aeval_self_charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean:89` | Cayley–Hamilton on that finite free carrier; cannot be applied to arbitrary unbounded shtuka cohomology. |
| `Submodule.FG` | `Mathlib/RingTheory/Finiteness/Defs.lean:46` | Finite generating set. |
| `Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean:121` | Finite generation of the top submodule, not a finite underlying set. |
| `Algebra.adjoin` | `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:32` | Generated subalgebra; commutativity needs commuting generators. |
| `Module.End.genEigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71` | Union of kernels of powers up to the index, including infinity. |
| `Module.End.iSup_maxGenEigenspace_eq_top` | `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean:74` | Finite-dimensional, algebraically closed hypotheses explicitly present. |
| `Module.End.iSup_iInf_maxGenEigenspace_eq_top_of_iSup_maxGenEigenspace_eq_top_of_commute` | `Mathlib/LinearAlgebra/Eigenspace/Pi.lean:194` | Simultaneous spanning from pairwise commutation and individual spanning. |
| `Module.End.independent_iInf_maxGenEigenspace_of_forall_mapsTo` | `Mathlib/LinearAlgebra/Eigenspace/Pi.lean:90` | Independence supplies the other half of the direct-sum assertion. |
| `CategoryTheory.Ind` | `Mathlib/CategoryTheory/Limits/Indization/Category.lean:70` | Ind-objects with explicit universe change, not a geometric cohomology construction. |
| `CategoryTheory.ObjectProperty.IsSerreClass` | `Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean:45` | Closure under zero, subobjects, quotients and extensions. |
| `CategoryTheory.ObjectProperty.isoModSerre` | `Mathlib/CategoryTheory/Abelian/SerreClass/MorphismProperty.lean:65` | Kernel/cokernel condition on morphisms; the required localization is additional work. |
| `TauCeti.FGPointRepresentationCat` | `TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:216` | Finite algebraic representations exist; no claim that both sides of Satake are absent. |
| `TauCeti.fgPointRepresentationCategoryEquivalence` | Same file, line 231 | Representation/comodule equivalence exists. |

Object searches included affine/BD Grassmannians, perverse and lisse étale coefficients, global/restricted shtukas, Bernstein centres, Weil–Deligne data, excursions, and the algebraic fields used in the signatures. The Satake hits in `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:15` concern quadratic Euler factors and Satake angles of newforms, not a geometric Satake category. Mentions of shtukas in Fargues–Fontaine or Witt-vector files are not moduli-stack/cohomology carriers.

The README's headline groups and the corresponding docstring coverage are:

| Headline group | README targets | Actual missing carrier identified in `Suggested.lean` |
|---|---|---|
| Bundle mass and function-field SL_r volume | 0.13 | Completed function-field adelic groups with the Haar/gauge measure comparison |
| Rational, integral and arithmetic geometric Satake | 1.9, 1.11, 1.14 | Curve Grassmannians, perverse étale categories with convolution and total-cohomology functor |
| Global shtuka geometry and compact cohomology | 2.1–2.5 | Algebraic moduli stacks and ℓ-adic cohomology |
| Elliptic-sheaf comparison | 2.7 | Periodic marked bundle-chain moduli |
| Integral Eichler–Shimura | 3.7 | Actual shtuka cohomology with geometric operators |
| Integral cusp/one-place Hecke finiteness and PGL₂ Eisenstein theory | 3.10–3.13 | Same compact-cohomology systems and their Hecke/spectral actions |
| Drinfeld descent, product actions and ind-smoothness | 4.7, 4.12–4.13 | Lisse/constructible coefficients and Frobenius–Weil action on these systems |
| Global cuspidal, nonsplit and modular decomposition | 5.9–5.11 | Fixed-level automorphic cusp module and geometric excursion operators |
| Companions and GL_r excursion comparison | 6.2–6.3 | Lisse ℓ-adic sheaves on curves and actual excursion parameters |
| Local parameterization, local–global compatibility, gamma factors | 7.6–7.11 | Smooth admissible representation categories, centre actions and Weil–Deligne comparison |

These groups are named in the module docstring; its explicit volume and elliptic-sheaf sentences cover the additional headlines beyond its initial list. No missing headline was made artificially statable with free `Prop` fields or a scalar algebra surrogate. No statable omitted headline was identified at the pins. Section 5.12 is conditional and §5.13 only formulates conjectures; neither is silently advertised as an unconditional acceptance theorem.

### Ownership and supplier resolution

The audit used `roadmaps grep` and `roadmaps show`, direct searches in the pinned libraries and board packages, and the supplied sibling checkouts. Broad searches were followed by narrower object searches to avoid treating a truncated hit list as exhaustive. For example the narrow searches returned 11 elliptic-sheaf hits, 2 SL_r/Tamagawa hits, 17 Drinfeld-lemma hits, 39 classical/equal-characteristic Satake hits and 19 curve-companion hits; irrelevant homotopy-theoretic “elliptic sheaves” and companion matrices were discarded by reading their context. No declaration namespace collision is possible in this folder's empty Lean module.

The **22 roadmap supplier subsections** were resolved as follows. File locators are relative to `TauCetiRoadmap/`; section names identify the consumed targets rather than treating a word match as evidence. The current supplied main/head copies were used, not an earlier repair report's recollection.

| Supplier | Located input and representative file line | Boundary checked |
|---|---|---|
| ReductiveGroups | `ReductiveGroups/README.md`, Layers 0–1, 3–4, 6–9 | Group/representation, root-datum and quotient infrastructure; not global shtukas |
| SchemeAndStackFoundations | `SchemeAndStackFoundations/README.md:2071` (§1.1), 2502–2951 (§§1.15–1.21), 4937 (§3.7), 5066–5244 (§§4.1,4.3–4.5), 5706 (§4.14) | Descent, torsors, algebraic-stack carriers, Picard gerbe, deformation and Quot infrastructure |
| EtaleCohomologyFoundations | `EtaleCohomologyFoundations/README.md:175` (F.0), 457 (F.1), 504–759 (F.2), 907 onward (F.10), 1265 onward (F.8); G.1–G.3 | Scheme coefficients and operations, not the full Artin-stack extension |
| AlgebraicVectorBundles | `AlgebraicVectorBundles/README.md:215` through 340, L0A–L2B | Module sheaves, finite locally free bundles, polynomial operations and geometric vector bundles |
| AlgebraicCurves | `AlgebraicCurves/README.md`, Layers 0–5 and 12 | Function-field/curve dictionary, places, divisors and Riemann–Roch; not bundle counts |
| JacobianChallenge | `JacobianChallenge/README.md:218` (D), 448 (F) | Relative Picard/Jacobian and Abel–Jacobi |
| AutomorphicLFunctionsAndLocalFactors | `AutomorphicLFunctionsAndLocalFactors/README.md:2308` onward, §AL.3, named curve targets | Additive analysis, vector-bundle HN/bounds, two-leg GL_r carriers, global correspondence and all-place factors. Kept general-G/multi-leg targets state their difference. |
| EndoscopicTransferAndUnitaryTraceComparison | `EndoscopicTransferAndUnitaryTraceComparison/README.md:1093`, 1117 (§§3.1–3.2) | Reductive quasi-split curve-bundle stack and one-point loop quotient; §0.1 adds nonreductive fibres, §1.1 moving legs |
| EtaleDualityAndPerverseSheaves | `EtaleDualityAndPerverseSheaves/README.md:668`, 1158, 1659–2785, 5106, 5524, 6218–6934 | Scheme duality/perversity, IC, decomposition and trace correspondences; integral/torsion hypotheses retained |
| ClassicalAdicEtaleCohomology | `ClassicalAdicEtaleCohomology/README.md:3052`, §5.4 | General oriented product and modification theorem; §7.3 applies it to restricted shtukas |
| DeligneWeightsAndPurity | `DeligneWeightsAndPurity/README.md:748`, 774, 1565, 2196, 2254, 2308, 2876 | Twists, rank-one geometric finiteness, weights and rational DM-stack coefficient descent; §1.4 extends the stack/coefficient range |
| FunctionFieldArithmetic | `FunctionFieldArithmetic/README.md:509`, 713, 1702, 1783, 1995, 2082–2226 | Picard arithmetic, differential volumes, zeta, degree-sensitive Chebotarev, all-group automorphic modules/constant terms/cusp finiteness |
| ArithmeticGaloisDuality | `ArithmeticGaloisDuality/README.md:2244`, §R02.3.2 | Function-field class formation and Brauer invariants are present; identifier repair in R03 |
| MotivesAndAlgebraicCycles | `MotivesAndAlgebraicCycles/README.md:1100`, 1114, §§6.1–6.2 | Neutral reconstruction is supplied; identifying its Satake-specific group is the local target |
| LanglandsParameterStacks | `LanglandsParameterStacks/README.md:135`, 456, 682–769, 807–858 | Restriction, WD, arbitrary-group excursion data and projected reconstruction; stale numbering repaired by R03 |
| IntegralHeckeAndGaloisDeterminants | `IntegralHeckeAndGaloisDeterminants/README.md:584`, 1857, Layers 0–1 | Trace/determinant and semisimple reconstruction; not replaced by a trace-only argument in characteristic ℓ |
| ReductiveGroupsPartII | `ReductiveGroupsPartII/README.md:5201`, 6724, 6931 | Lang theorem, dual group and L-group; connectedness and pinned action retained |
| SmoothRepresentationsOfLocalGroups | `SmoothRepresentationsOfLocalGroups/README.md`, SR.0.4, SR.1.3, SR.2, SR.3, SR.4.1; 4349 and 4585 (SR.5.2) | Generic centre/corners, induction, Satake, segments and rec. R01 separates supplied rec from the new comparison. |
| LefschetzPencilsAndVanishingCycles | `LefschetzPencilsAndVanishingCycles/README.md:317`, Layer 0 | Trait nearby/vanishing cycles, not the higher-dimensional-base specialization by itself |
| RelativeFarguesFontaine | `RelativeFarguesFontaine/README.md:2170`, §6.5 | Beauville–Laszlo module gluing |
| AlgebraicModuliForArithmeticGeometry | `AlgebraicModuliForArithmeticGeometry/README.md`, §1.3 | Coherent Grassmannians/flags, not periodic elliptic chains |
| GeometricSatakeAndFusion | `GeometricSatakeAndFusion/README.md:801`, §0.29; §2.12 | Ordinary local Schubert models before perfection and coefficient comparisons. Multi-leg collision geometry/arithmetic descent here must use those supplied models. |

Ownership against the named open work was checked. In particular:

- `SheafTheoreticSmithTheory/README.md:15` consumes this roadmap's finite-extension Satake and distinguishes its larger W(F̄_ℓ), parity and Smith extension. It is downstream, not a hidden supplier.
- `DrinfeldModulesAndTModulesPartII/README.md:7` explicitly consumes the elliptic-sheaf carrier of §2.7. Generic coherent moduli do not supply periodic chains, so local ownership of that added carrier is justified; the stale external request is R02.
- `CountingBundlesAndHallAlgebrasOfCurves/README.md`, Scope and exact contracts, consumes bundle HN/masses and develops Hall and Higgs counting. It does not justify replanning those inputs there or reversing supply here.
- `CurvesOverFiniteFields/README.md:7` assigns zeta and class-number arithmetic to FunctionFieldArithmetic. This roadmap follows that owner rather than rebuilding curve zeta theory.
- The nearby-cycle and coefficient extensions were compared with ClassicalAdicEtaleCohomologyPartII, EtaleDualityAndPerverseSheavesPartII and DeligneWeightsAndPurityPartII. Their general scheme/adic results are not alternative global/restricted-shtuka carriers. The perfect-local-system Drinfeld lemma in VStackSheavesAndLisseCategories is a different base/category from finite étale covers of finite-field scheme products.

No upward supplier was introduced to resolve an overlap. There is no requirement to await Mathlib: the README assigns the absent geometric constructions to the library-building layers and imports the native algebra that exists. No route-specific restriction or computational algorithm was found.

## Not verifiable

- **Del73 remains uncertified by the settled source status.** Its §3.12, pp.533–534; Theorem 4.1, p.535; Lemmas 4.12–4.16, pp.544–546; and §8.12, p.572, cited in §7.10, were not certified against a readable text. The existing record/brief and the README's IAS author-copy locator were consulted; no new fetch request or alternative key was made. The explicit rank-one and monodromy-cancellation calculations above were checked, and the supplied equal-characteristic local-factor contract and GeL gamma-factor passage were read; these do not certify Deligne's inaccessible pages.
- No other sampled source was inaccessible. Sp and Harder were obtained legally during this review, so their initial lookup status is not an outstanding request. This review edited no source manifest.
- The general geometric theorems are roadmap targets, not proved Lean declarations. Passing elaboration of the empty signature module and the finite adversarial instances must not be read as a formal proof of these theorems. The verdict is blocked by R01–R02 independently of this distinction.

## Source issues

- **Error** in Ric at Corollary 5.8, p.22 (Ric line 1051): the source says conjugating g by χ(γ)⁻¹ gives the semidirect-product isomorphism; it should be right multiplication by a lifted χ(γ)⁻¹ after choosing the compatible half-Tate lift; affects a stated result.
- **Misprint** in Chin at Proposition 4.3(6), p.14 (Chin line 530–542): the source says the determinant-normalizing constant twist has weight w; it should be weight −w, as its inverse-root construction shows; affects a stated result.
- **Error** in AH19 at Remark 2.9, p.9 (AH19 line 489–497): the source says individual quotient-degree bounds are equivalent to the dominant-weight inequalities for determinant-zero bundles; it should be cumulative subbundle-degree bounds, equivalently the dominant-weight inequalities; affects a stated result.
- **Misprint** in Harder at proof of Lemma 3.2.3(a), p.302 (Harder line 1915): the source says the positive exponential sum H is strictly concave; it should be strictly convex; affects the proof.

The AH19 witness is O(−1)⊂O² on P¹ with quotient O(1) and μ=(0,0): every dominant pairing is −2a≤0, while the second quotient bound is 1≤0, false. The Harder rank-one witness is H(t)=3ᵗ+3⁻ᵗ: H(0)=2 and H(±1)=10/3, with positive second derivative. These are source corrections, not counterexamples to the roadmap's stated HN opens or mass formula. The Ric and Chin corrections are already reflected in the README.
