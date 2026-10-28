# Human-review response

## H01 (CBirkbeck) — answered

ColemanIntegration still constructs restriction fibers and their multi-relative iterates at `TauCetiRoadmap/ColemanIntegration/README.md:2395`, :2397 and :2435–2446, whereas `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`, :211–223 and :727 already assign the shared construction to §2.0a and preserve the Quillen-model adapters through SchemeKTheoryOperations §2.5; the iterated-fiber definition agrees with Levine94 line 655–664. The finding is accepted but unresolved: the sibling must import that construction while retaining its public names, exact cubes, Adams comparison, special-unit localizations and symbols, and this job permits no sibling edits.

## H02 (CBirkbeck) — answered

The assignment of multi-relative refinements to ColemanIntegration remains at `TauCetiRoadmap/SchemeKTheoryOperations/README.md:9` and :2403–2405, contradicting the shared ownership at `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`. This accepted sibling repair remains unresolved: its ownership clauses must name MotivicEtaleKTheory §2.0a while retaining Coleman's exact-cube realization and Adams comparison, without making the earlier SchemeKTheoryOperations vertex models, pairings or operations depend on this roadmap.

## H03 (CBirkbeck) — answered

ColemanIntegration still asks to construct reg_∞ at `TauCetiRoadmap/ColemanIntegration/README.md:2650`, with no shared-regulator import at :2659, although `TauCetiRoadmap/MotivicEtaleKTheory/README.md:17` and :729 already specify reg_∞=πₚ₋₁∘ch_D,p from §§7.1/7.4. The character construction is supported by BF line 940–960 and the positive quotient projection by BKK line 4030 and BKK line 4067 (3+4i maps to 4i for p=2 and 3 for p=3); importing it while retaining the arithmetic pairings, integral-image theorem and determinants is an accepted, unresolved sibling repair outside this job's edit scope.

## H04 (CBirkbeck) — answered

The simultaneous-eigenspace direct sum at `TauCetiRoadmap/ColemanIntegration/README.md:2395`, used on arbitrary open cubes at :2437, exceeds the supplied generalized-weight contract at `TauCetiRoadmap/MotivicEtaleKTheory/README.md:211`, :213, :235 and :727: Levine94 line 706–736 defines generalized pieces, and the displayed Jordan operator has kernel dimensions 1 and 2 for T−2 and (T−2)². This accepted sibling repair remains unresolved: arbitrary opens must retain generalized pieces or obtain a separate semisimplicity theorem with precise hypotheses; the existing simultaneous-weight identification on full cubes with product support and the ordered zero-minus-infinity convention require no further target edit.

### Scope, ownership and evidence

H01–H04 separate the four actionable points of the review's single numbered finding, in order of appearance. The review's remaining material records resolved findings and verification limits, rather than further requested changes or questions. None of the four sibling repairs is represented as completed.

Both authorized target files remain unchanged at 83b84df; no commit was made. Returning the shared construction to ColemanIntegration would introduce a later supplier, and expanding SchemeKTheoryOperations to own it would require editing another roadmap. Rewording this target's already explicit contracts would not reconcile either sibling specification.

The main copy was confirmed at ae2562cd6d39ddeac99ac18bdf78e6e46a068586. Object searches covered main and indexed open roadmap specifications, the board packages, and all 41 supplied open-roadmap folders. ColemanIntegration and SchemeKTheoryOperations were read through the indexed roadmap views; their relevant clauses still match the review's cited text. Polylogarithms §5.2 at `TauCetiRoadmap/Polylogarithms/README.md:907` already imports the auxiliary support diagram, and BorelRegulators §6.0a at `TauCetiRoadmap/BorelRegulators/README.md:725` and :731 already imports the shared character and marks the complex-point specialization; EllipticKTheory §4.5 retains its distinct integral tower comparison. These do not resolve the ColemanIntegration and SchemeKTheoryOperations conflicts.

The supplier direction remains SchemeKTheoryOperations §§2.5, 6.1, 6.8–6.9 → MotivicEtaleKTheory §2.0a → ColemanIntegration §§L3.Fa.1–L3.Fa.2, and MotivicEtaleKTheory §§7.1/7.4 → ColemanIntegration §L3.Fc.1. The first supplier's §2.5 compares the actual pointed Quillen and perfect K-models, §6.1 supplies vertex spectrum pairings, and §§6.8–6.9 supply operations and weights in their regular ample-family scope; its downstream exact-cube comparison remains distinct from the shared fiber construction. No ownership was moved and no new supplier was added. Cross-roadmap resolution reported no absent citations or Lean names; its explicit omission of pinned-library verification was supplemented by local pin checks.

The pins were confirmed as Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. At `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44` the native cycle carrier is `Function.locallyFinsupp X R`; it imposes no face-admissibility condition or cycle differential, and its map at :69 takes explicit dimension weights. At `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` the native mixed-Hodge structure consists of linear filtration and purity data, without geometric logarithmic sheaves or Deligne realization. Object searches in both pinned libraries found no higher-Chow, supported multi-relative scheme K-spectrum or geometric Deligne implementation that would replace these headline carriers.

The declaration inventory of `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` contains zero definitions, instances, structures or theorem statements. Consequently the requested `#check @name` signature comparison has zero entries: there are no declaration binders to drop or signatures to change, and the unchanged module elaborated in the build below. Its docstring retains the actual geometric headlines and their missing carriers, without a substitute theorem.

The relevant legal extractions of Levine94, BF and BKK were read at the locators above. The existing statuses of Bloch86 and Beilinson85 as uncertified, and Levine98 as waived, were retained; none is newly certified or requested again. No new work was cited and no source manifest change was needed.

### Adversarial mathematics record

No target statement was added or changed. The computations below recheck the conventions, constructions and theorem interfaces used by the findings and their surrounding layers; they are instance tests, not proofs of the general targets. Every row leaves the existing target statement unchanged.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Componentwise grading | Spec k disjoint from ℙ¹ | CH¹=0⊕ℤ; ranks 2,1 give (2,1), whereas scalar aggregation gives 3 | Components retained | None |
| Motivic degree convention | p=0,a=1 | 2p−a=−1 and the group is 0; natural subtraction would give degree 0 and ℤ | Integer reindexing needed | None |
| Derived coefficient change | ℤ/2⊗ᴸℤ/2; R=0 | Groups ℤ/2 in degrees −1 and 0, versus only degree 0 for ordinary tensor; R=0 gives 0 | Derived tensor retained | None |
| Cube/simplex orientation | Coordinate graph Γ_t; degree-one simplex | Cube boundary +[0], BF boundary −[0]; simplex boundary [1]−[0] | Distinct conventions transported | None |
| Orientation transport | Cube degrees 0,1,2 | J values 1,−1,1 and J₁J₁=1=J₂ | Multiplicative sign transport | None |
| Mixed totalization | Bidegree (1,1) | Cross coefficients −1,+1 have sum 0 | Differential squares to zero | None |
| Cochain pair fiber | 0→ℝ[0]; identity map | First fiber has ℝ in degree 1; fib(id) has differential 1 and cohomology 0 | Shift and contractibility agree | None |
| Raw and positive boundary | Γ_t in the cycle pair | d(Γ_t,0)=([0],t), hence raw [t]↦−[0]; minus-raw and B give +[0] | Boundary adapter retained | None |
| Uniformizer-last adapter | Ordered symbol {2,t} | Right-linear residue −[2]; degree-two factor −1 gives +[2], with valuations −1,+1 | Order distinguished | None |
| Tate powers and point coordinate | p=−1,0,1; z=3+4i | Powers (2πi)⁻¹,1,2πi exist; πₚ₋₁(z) for p=1,2,3 is 3,4i,3 | Nonzero denominator and parity fixed | None |
| Quotient projection | p=2 with z↦z+(2πi)²r; p=3 with z↦z+(2πi)³r | Added real part at p=2 projects to 0; added imaginary part at p=3 projects to 0 | Projection descends | None |
| Complex orientation | Positive loop; O(a) on ℙ¹ for a=−1,0,1 | ∮dz/z=2πi; normalized Chern integrals −1,0,1 | Positive marking fixed | None |
| Ordered residues and product signs | dlog z∧dlog w; (n,s)=(1,1),(0,1),(1,2) | Residues +1 and −1 after exchange; total-product factors −1,+1,+1 | Signs agree | None |
| Whitney/Borel input | Coefficients 1,1,2; coefficients n! | Derivatives 1,1,4; derivatives (n!)² with power-series radius 0 | Smooth extension exceeds analytic extension | None |
| Flat-ideal input | A=∅,B=U; coordinate axes | Sum ideals give C∞(U)+0=C∞(U); φ(x)+φ(y) at (0,1) is e⁻¹, so it is not flat on both axes | Sum differs from intersection | None |
| §1.1 normalization | Point,p=0; n=0,1,2 | Normalized groups ℤ,0,0; raw degenerate groups ℤ,ℤ,ℤ | Degeneracies excluded | None |
| §1.1 refined cycles | Γ_t; degree-one cube point 2 | First has zero-face [0]≠0; second has both faces 0 | Refined chain need not be a cycle | None |
| §1.1 refined retraction | Square Z=[x+y=3]−[x=2]−[y=2] | Each zero face of Z is [3]−[2]; each of rZ is ([3]−[2])−[3]+[2]=0 | Facewise vanishing obtained integrally | None |
| §1.1 extra cube map | h=x+y−xy, characteristics 2 and 3 | h(0,y)=y, h(x,0)=x, h(1,y)=h(x,1)=1 in both characteristics | No prime excluded | None |
| §§1.2–1.3 axes | Total degrees 0,2; point in degree 0 | Totals have 1 and 3 summands; both axes send 1↦1 in H₀=ℤ | Axes and integral comparison agree | None |
| §1.3 support comparison | Empty/full support | fib(id) has H=0; fib(C→0)=C | Support endpoints agree | None |
| §1.4 transfers and products | 𝔽₂(t)/𝔽₂(t²); two odd factors | Restriction-transfer sends 1↦2; exchange coefficient −1 | Inseparable multiplicity and grading retained | None |
| §2.0a base construction | n=0, full/empty support | Full support gives K₀(k)=ℤ with [k²]=2; empty support gives 0 | Vertex comparison agrees | None |
| §2.0a support-local map | Origin in 𝔸¹, c=1 | Raw generator maps to 1 in supported weight 1; forgetting support gives 1−1=0 | Support retained until the declared map | None |
| §2.0a vanishing endpoint | Spec ℚ,c=0; origin in 𝔸¹,c=1 | K₁^(0)(ℚ)=0 but K₀^(0)(ℚ)=ℚ; supported K₁ weight 1=0, weight 2 contains [2] with valuation 1 | a>0,b≤c have correct endpoints | None |
| §2.0a unique lift | V=𝔸²,W=V(x),D=V(y),c=1 | Support restriction ℚ→ℚ sends 1↦1; its kernel is 0; obstructing face K₁ weight 1=0 | Lift and vanishing agree | None |
| §2.0a incidence/splitting | z=t/(t−1); W={z=0} | z+(1−z)=1; W has codimension 1 in V but 0 in the face | Splitting witness works; improper support excluded | None |
| §2.0a integral Adams domain | η·1=[−1] over ℚ | ψ²1=1 and ψ²[−1]=0; a spectrum map fixing 1 would retain nonzero [−1] | Integral operations remain pointed-space operations | None |
| §2.0a ordered relativity | One full cube | (1,0)↦1, (0,1)↦−1, (1,1)↦0 under zero minus infinity | Consumer sign preserved | None |
| §2.0a two-loop exchange | {u,v} over ℚ(u,v) | Consecutive last-slot residues +1; coordinate exchange gives −1 | Loop order preserved | None |
| §2.0a full-cube Adams weights | [2] and {u,v} | ψ² coefficients 2 and 4; ψ¹ coefficients 1 and 1 | Unshifted weights 1 and 2 | None |
| §2.0a all-prime scope | Spec ℤ_p, p=2,3 | One-cube K₀=K₁(ℤ_p)=ℤ_p×; face rank differences +1,−1 at both primes | No prime restriction needed | None |
| §2.0a proper open | Spec ℤ₃ cube minus t=2 | Both face strata remain Spec ℤ₃; trivial-line ranks (1,1), difference 0 | Open carrier valid; full-cube delooping not inferred | None |
| §2.0a rational decomposition | ℙ²,h³=0 | ψ²h=2h−h², ψ²h²=4h²; eigenlattices have index 2; h=(2h+h²)/2−h²/2 | Rational coefficients needed | None |
| §2.0a generalized weights | T(e₁)=2e₁,T(e₂)=e₁+2e₂ | (T−2)e₂=e₁≠0, (T−2)²e₂=0; kernel dimensions 1 and 2 | Filtration does not prove semisimplicity | None |
| §2.0a adapter transport | Invertible Adams-equivariant C | C maps ker(T−2) to a space of dimension 1 and ker(T−2)² to one of dimension 2 | Kernels transported separately | None |
| §2.0a external pairing domain | Spec ℤ[i] self-product over ℤ; common-base cube product | At the ramified point dimension 1,cotangent dimension 2; common-base cube product remains regular | Regular product hypothesis retained | None |
| §§2.0b–2.2 Chern coefficients | Milnor degrees 1,2,3 | Integral Chern factors 1,−1,2; character factors 1,−1,1/2; composites 1,1,1 | Signs and factorials agree | None |
| §2.0b finite-field route | 𝔾_m/𝔽₂ | c₁,₁[t]=[t] with valuation 1; (𝔸¹−{0,1})(𝔽₂) has 0 points | Rational specialization alone insufficient | None |
| §§2.1–2.2 actual character | Rank 2; O(1)⊕O(−1) on ℙ¹; unit 2 | cyc/ch preserve 2; ch sum (1+h)+(1−h)=2; unit valuation 1 both ways | Zero or inverse maps excluded | None |
| §2.2 projector denominators | Weights 0,1,2 | Eigenvalues 1,2,4; pairwise differences −1,−3,−2 | All denominators nonzero | None |
| §2.3 regular versus smooth | L=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2,3 | Local and embedding dimensions 0; Ω¹_L/k=L ds≠0; degree-zero comparison 1↦1 in ℚ | Regular nonsmooth case retained | None |
| §2.3 support maps | Origin→{0,1}; crossing divisor | Enlargement sends 1↦(1,0); crossing leading cycles have coefficients (1,1) | Directions and components agree | None |
| §2.4 products/leading class | Ranks 2,3; origin in 𝔸¹; point in ℙ¹ | Product rank 6=2·3; affine leading class 0=1−1; projective leading class h with degree 1 | Leading class may vanish | None |
| §3.1 logarithmic algebra | Punctured disk; z↦2z | dlog|z|²=dz/z+dz̄/z̄; log changes by log4 and dlog by 0 | Chart transitions smooth | None |
| §3.2 weight shift | 𝔾_m; point | dlog has complex W-index 1 and H¹-weight 2=1+1; point H⁰-weight 0 | Cohomological shift retained | None |
| §3.2 flat estimates | f=e^(−1/|z|²); f=1 | f/z² has all jets 0 and value e⁻¹ at 1; 1/z has a pole | Flatness essential | None |
| §3.2 combined estimate | f=e^(−1/|zw|²) at (−2,1) | f log|z|²/(zw̄)=−e^(−1/4)log4/2; jets along axes are 0 | Denominator and extension agree | None |
| §3.3 Deligne model | Point, twists 0,1,−1 | H⁰(0)=ℝ,H¹(1)=ℝ; H⁰(−1)=ℝ(−1),H¹(−1)=0 | All integer twists retained | None |
| §3.3 cone transport/retract | Point, log2+iθ | Projection gives log2; discarded difference iθ; πI(r)=r | One identity and one homotopy distinguished | None |
| §3.3 critical differential | x=|z|²,p=1 | ∂∂̄x=dz∧dz̄; d_Dx=−2dz∧dz̄ | Sign and two-degree form jump fixed | None |
| §3.4 logarithmic realization | 𝔸¹,p=1; boundary blowup | H¹=ℝ constants; Re z has values 0,1 and is excluded by infinity growth; log|x| pulls back to log|e|, value log2 at (2,3) | Zariski and coordinate conditions needed | None |
| §4.1 product | log2 and log|t|; point constants | Product i log2 darg t, reversed product its negative; point log2•log3=0 | Odd sign and twist fixed | None |
| §4.1 unit scope | tℝ[t]; ℝ[t] | Coefficient of t in et is 0 for e∈tℝ[t], versus 1 in t; in ℝ[t],1•t=t | Nonunital input allowed | None |
| §4.2 associator | Even-critical Re z,2,3; point 2,3,5 | Both bracketings 6 Re z, value 6 at 1 despite dx≠0; point bracketings 30; h_a=0 on even-critical inputs | Closedness not needed there | None |
| §5.1 pair differential/products | General pair; disjoint supports | Second coordinate of d²=res(dω)−d(resω−dg)=0; disjoint-support product has cohomology 0 | Fiber and support intersection agree | None |
| §5.2 singular semipurity | Crossing, cusp, origin in 𝔸² | At p=1,degree 2 groups ℝ²,ℝ,0; origin at p=2,degree 4 gives ℝ | Codimension and components retained | None |
| §5.2 codimension negative control | Point,p=1,full support | Codimension 0<1; H¹=ℝ≠0 below 2p | Hypothesis cannot be dropped | None |
| §5.2 multiplicities/current normalization | Double divisor; f=t | Coefficients 2 versus 1; form-current factor (2πi)⁻¹,point-current factor 1; −log|t| gives class +1, positive log gives −1 | Multiplicity and Green sign fixed | None |
| §5.3 total degree/good truncation | (r,n)=(2p,1); nonclosed ω=Re(z₁)dz₂∧dz̄₂ | Total degree 2p−1; cube sign +1; dω evaluates to −2i on (∂ₓ₁,∂ₓ₂,∂ᵧ₂) | Top-degree cycles required | None |
| §5.3 empty-support column | Point,p=1,n=0 | Retained cochains ℝ→ℝ by 1 in degrees 1,2; H¹=H²=0 | Acyclic complex need not be zero | None |
| §5.4 comparisons | Origin and its double; point→𝔸¹ | Fundamental-class coefficients 1,2; H_D¹(p=1)=ℝ both ways; normalized positive cube cohomology 0 | Class normalization and affine contraction agree | None |
| §6.1 specified regulator roof | Point degree 0; −1,i; O(±1) | m↦m; torsion-unit values 0,0; normalized Chern integrals +1,−1 | Integral source and normalization retained | None |
| §6.2 fiber homotopy sign | A=A′=ℤ[0],B=0,B′=(ℤ→ℤ),r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong image (1,−1) has differential (0,2) | +ha forced | None |
| §6.2 supported boundary | Unit t on punctured 𝔸¹ | Regulator log|t|; raw boundary coefficient −1; negative-log Green pair coefficient +1 | Same suspension dictionary | None |
| §6.3 pullback/model comparison | Point→ℙ¹; unit 2 via compatible embeddings | c₁ pulls back to 0 on both sides; log2 unchanged; axis degree-zero generators both 1 | Maps tied to the actual constructions | None |
| §7.1 universal character | Unit 2e^(iθ); O(a) on ℙ¹ | Re log=log2 for every branch; ch(O(a))=1+a h_D with degree a | Additive character and marking agree | None |
| §7.2 Beilinson comparison | Rank 2; unit 2; empty/full support | Both composites give 2,log2; empty maps 0 and full maps absolute | Comparison endpoints agree | None |
| §7.3 integral-source multiplicativity | Units 2,t; ruling divisors | Ordered regulator period 2πi log2, reversed −2πi log2; ruling product normalized degree 1, doubled ruling degree 2 | Product and multiplicity agree | None |
| §7.4 logarithmic normalization | u=1,i,1/2; tᵃ for a=−1,0,1 | Unit values 0,0,−log2; divisor multiplicities −1,0,1 from −a log|t|, opposite to the unit representative | Positive unit versus negative Green convention retained | None |

### Validation outcomes

Build command: `lake build TauCetiRoadmap.MotivicEtaleKTheory.Suggested` (exit 0).

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (2.3s)
Build completed successfully (8976 jobs).
```

Dependency check output (exit 0; no UPWARD or CYCLE line):

```text
depcheck: 42 roadmaps, 428 edges, 0 problem(s)
```

Gate summary (exit 0, base origin/main):

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
