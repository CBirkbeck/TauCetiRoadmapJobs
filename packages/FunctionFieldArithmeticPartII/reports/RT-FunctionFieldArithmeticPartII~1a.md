<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1232#issuecomment-6433075056 -->
Red team round 1 pass a (codex) of 5a6bc6d

Verdict: needs_changes

1. **F01** (P2) The displayed build order has backward prerequisite edges

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:789, 4191, 13218. The first cited Needs line consumes “§3.30” and “§3.33” from Layer 1.

   **Claim:** The ordered layers form a usable build, with each target resting on earlier material.

   **Witness:** §1.35 needs §3.30; §3.7 needs §1.6: coarse cycle 1→3→1. §1.240 needs §2.4. Layer 7 consumes Layer 8’s projective-space input, while Layer 8 consumes Layer 7. The cross-roadmap gate omits these local edges.

   **Exact repair text:** “Place finite root-point carriers and their groupoid, root construction and evaluation (§§3.10, 3.30–3.33, 3.49 and their prerequisite closure) in Layer 1 before their first consumer. Place finite-root descent before affine stackification. Place §§7.26–7.29 before their first consumers, following their dependency order. Move the scheme projective-space input before §7.3, preserving its supplier contracts.” Renumber and update references after these moves; preserve the mathematical statements.

   **Repair test:** The explicit local-edge audit finds at least 15 numbered forward edges: 1.35→3.30,3.33; 1.58→3.31; 1.87→3.31; 1.106→3.49; 1.225→3.30; 1.240→2.4; 7.3→7.26; 7.7→7.26; 7.16→7.26; 7.17→7.29,7.27; 7.22→7.26; 7.24→7.26; 7.25→7.26. In addition, §§7.3, 7.4, 7.7, 7.11, 7.16, 7.18 and 7.22 explicitly need the scheme projective-space input in Layer 8. The proof of §7.16 also explicitly uses the later §§7.27–7.28. Reordering this prerequisite closure must make every listed supplier precede its consumer. The introductory permission to read Layer 3 alongside Layer 1 does not remove the coarse cycle.

2. **F02** (P3) Process narrative survives in the specification

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:1882: “This promotes a consumed API to a declaration; it preserves the construction and API statement.”

   **Claim:** The roadmap describes mathematical work independently of its assembly history.

   **Witness:** The sentence describes promotion of an API into a declaration, rather than a mathematical property. The same sentence recurs elsewhere; “merged SchemeAndStackFoundations” also records repository state.

   **Exact repair text:** Delete the quoted sentence at every occurrence. Replace “the merged SchemeAndStackFoundations” and “merged SchemeAndStackFoundations” by “SchemeAndStackFoundations”. Keep the mathematical statements and section references.

   **Repair test:** Source synthesis still reads c↦Σ c_(i,j)(x^i⊗x^j); at n=2 the coefficient family supported at (1,1) with value 2 gives 2x⊗x. Deleting the process sentence changes no formula or proof input.

3. **F03** (P2) Fppf stacks are confused with fppf-locally trivial torsors

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:5652: “so an fppf stack would miss it.”

   **Claim:** The twisted infinite root system cannot be an object of an fppf stack because its trivialization requires an fpqc cover.

   **Witness:** The same system is an object of the fpqc root stack, which is also an fppf stack by restriction (§3.15). Its finite roots and transition isomorphisms already form an object of the fppf two-limit.

   **Exact repair text:** “The fppf classifying stack of fppf-locally trivial G-torsors misses this object. The two-limit of finite root stacks is itself an fppf stack and contains it; the fpqc quotient identifies it with a G-torsor.”

   **Repair test:** Over ℚ, retain the compatible torsors z_n^n=2. They define an object of the finite-root two-limit, while a nonempty finitely presented ℚ-algebra splitting all of them would have a closed residue field of finite degree containing roots of 2 of every degree, contradicting §3.2.
4. **F04** (P1) The residual-gerbe theorem is attributed to a supplier that does not state it

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:12552: “This exact residual-gerbe fact is included in SchemeAndStackFoundations §1.20”.

   **Claim:** The supplier provides the classification of reduced zero-dimensional finite-type DM stacks over an algebraically closed field as disjoint unions of residual gerbes.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:2843–2950 on main defines inertia, topology, morphism properties, presentations and a valuative criterion; it contains no residual-gerbe decomposition. None of the seven declared gaps requests it.

   **Exact repair text:** Add to the supplier subsection: “What SchemeAndStackFoundations must provide (gap:zero-dimensional-dm-residual-gerbes): For an algebraically closed field K, a reduced zero-dimensional finite-type Deligne–Mumford stack with finite inertia and finitely many points is the disjoint union of its residual gerbes; a chosen K-object in each component identifies that component with the classifying stack of its finite étale automorphism group.” Add the same slug, supplier and section 1.20 to the plan’s gaps, and replace the unsupported assertion by this gap reference.

   **Repair test:** At the double branch collision, the full fibre is [Spec K[s,t]/(s²+t²,st)/μ₂]; its reduction is Bμ₂. The proposed contract applies to that reduction and retains its order-two automorphisms, without asserting the full fibre is reduced.

5. **F05** (P2) The final infinite-fibre target reintroduces an unspecified reduction

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:11744: “The reduced closed fibre of the infinite root of a DVR”.

   **Claim:** An intrinsic reduced infinite fpqc stack is available in arbitrary residue characteristic and identified with the inverse root gerbe.

   **Witness:** §3.409 explicitly avoids an unprovided reduction functor for infinite fpqc stacks and defines the zero-section gerbe and reduced-chart quotient instead. §3.427 neither defines reduction nor imports a supplier for it.

   **Exact repair text:** “The zero-section gerbe of §3.409 is the two-limit of the root gerbes of the normal line, banded by G_k=lim μ_n. It is the quotient of the explicitly reduced affine chart and is noncanonically equivalent to B_kG_k after choosing a normal-line frame.” Use this terminology in §3.428 and the Suggested.lean module docstring as well and cite §§3.409 and 3.413 for the constructions.

   **Repair test:** In characteristic p the band still contains nonreduced μ_p and all higher p-power stages. In C_k(0), z_n^r is nonzero for r<n, whereas the explicitly reduced chart is k. The repair distinguishes these three objects without requiring a new reduction operation.

6. **F06** (P3) Several coefficient-extraction Checks only repeat their defining formula

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:10777–10780, §3.366.

   **Claim:** The definition has at least three discriminating Checks.

   **Witness:** The first three Checks repeat P_q(e_r a⊗x)=δ_qr ax and its unit specialization; the fourth uses the zero ring, where every candidate map agrees. None tests a nontrivial sum or the specified factor.

   **Exact repair text:** Replace those Checks by: “Over A=ℤ, q=1/2, P_q(e_q·2⊗3+e_0·5⊗7)=6 and P_0 of the same element is 35. For q=1/3, P_q(e_(−1/3)⊗1)=0 but P_q(e_(1/3)⊗1)=1. Over A=ℤ/4, P_(1/2)(e_(1/2)·2⊗1)=2≠0, although its square is zero.”

   **Repair test:** The three values distinguish a wrong tensor factor, inverse-character indexing, and discarding nilpotent coefficients, respectively; no hypotheses on f are needed.

7. **F07** (P3) The collision Check identifies the full fibre with its gerbes

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:13196: “At 2x with x∈R the fibre is [pt/μ₂]²→[pt/μ₂]”.

   **Claim:** The ordered-map fibre at a double branch collision is described entirely by this map of classifying stacks.

   **Witness:** Over an algebraically closed field of odd characteristic, the full fibre is [Spec K[s,t]/(s²+t²,st)/μ₂]. The classes s and t are nonzero nilpotents. Its reduction is Bμ₂; §7.16's preceding paragraph correctly distinguishes these.

   **Exact repair text:** “At 2x with x∈R, the map of reduced residual gerbes is Bμ₂×Bμ₂→Bμ₂ induced by multiplication. Its relative reduced fibre is Bμ₂. The full fibre retains the nilpotents described in §5.23, and the ordered map is not representable.”

   **Repair test:** The atlas ring has basis 1,s,t,s² with t²=−s², st=0 and s³=t³=0. Reduction gives K and retains the diagonal μ₂ stabilizer, as the replacement states.

8. **F08** (P3) Several extraction locators point to different results

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:4816, 11907, 12095, 12899, 13118, 14654. Examples pair “line 7333” with Definition A.1 or A.2, and “line 234” with AV99 Lemma 2.2.3.

   **Claim:** The numbered extraction lines locate the named source statements.

   **Witness:** YZ19 line 7333 lies in §A.2, whereas Definitions A.1 and A.2 begin at lines 6918 and 6995. AV99 line 234 is Lemma 2.3.4; Lemma 2.2.3 starts at line 189.

   **Exact repair text:** Use “YZ19 line 6918, Definition A.1, p.514”; “YZ19 line 6995, Definition A.2, p.515”; “YZ19 line 7142, §A.1.4, p.517”; “YZ19 line 7184, §A.1.5, p.517”; and “YZ19 line 7570, §A.2.2, pp.521–522” at their respective uses, instead of the common line 7333. Use “AV99 line 189, Lemma 2.2.3, pp.4–5” for quotient charts and “AV99 line 213, Lemma 2.3.3, p.5” for averaging/base change. For the long exact sequence use “MILNE-LEC line 2602, §9(c), p.64”, reserving line 3104 for Theorem 11.4. At §3.11 use “TV17 line 605, Proposition 3.2, p.13”, instead of line 668 (which begins §3.1). Add ETINGOF Theorem 3.8, p.37 to its bibliography and manifest locator, since that is the averaging proof actually cited in §7.2.

   **Repair test:** The revised Definition A.2 locator gives a=0, α=ε with ε²=0 as a hat object but not an effective object. The revised averaging locator gives (x,y)↦((x+y)/2,(x+y)/2), and the long exact sequence locator supplies the connecting maps used in §10.27.

9. **F09** (P1) The perverse target widens the coefficient supplier's base field

   **Location:** packages/FunctionFieldArithmeticPartII/README.md:13414: “Let k be a finite field or an algebraic closure of one”.

   **Claim:** DeligneWeightsAndPurity §8.24 supplies the full rational constructible category on every finite-type DM stack over either kind of field.

   **Witness:** TauCetiRoadmap/DeligneWeightsAndPurity/README.md:3275 explicitly supplies the coefficient category for stacks over 𝔽_q. Its geometric cohomology output does not state the full coefficient category over 𝔽̄_q. None of the seven gaps extends that domain.

   **Exact repair text:** Add “What DeligneWeightsAndPurity must provide (gap:geometric-dm-coefficients): For every finite-type Deligne–Mumford stack over an algebraic closure of a finite field and ℓ different from its characteristic, construct the full bounded rational constructible étale category by atlas descent, with coherent refinement and pullback comparisons, agreeing with geometric pullback of §8.24's finite-field construction.” Add the matching supplier, section 8.24 and slug to the plan’s gaps, and cite that contract in §7.29. Retain the algebraically closed-field generality.

   **Repair test:** A geometric lisse ℚ₃-line on an elliptic curve over 𝔽̄₅ can have a nontrivial character of its pro-3 Tate module with image in 1+3ℤ₃ and no Frobenius-periodic descent. On y²=x³+x, Frobenius has polynomial T²−2T+5, so no positive power has eigenvalue 1. Such a line belongs to the required geometric category; defining that category only by finite-field descent would exclude it.

## Verified sound

Read 5 Lean declarations (3 real-bodied definitions and 2 admitted theorems), all 91 lines of Suggested.lean, and all 14,784 README lines. The statement inventory covered 816 numbered targets and the additional projective-space input: 817 targets. Repeated identical coordinate blocks were compared as identical text, not treated as additional mathematical evidence. The sampled audit below retains the 66 distinct families of boundary, sign, nilpotent and negative-control calculations used in that review, plus the projective-space input. This is the count of distinct Checks tested, rather than a count inflated by repetitions. All five elaborated signatures supplied with the job were compared with the README; no section binder was lost.

Resolved 62 distinct numeric source anchors in the README against the cached extractions, and inspected the additional theorem-only locators for ETINGOF, CONRAD-EXT, MILNE-CFT, NOOHI, SGA1, ACV01 and LO-P. The mismatched uses are R08. There are 39 manifest keys: 38 certified cached entries and the settled uncertified B24 entry. Several Stacks keys share one extraction. Source errors found during this check are registered separately below; an error there does not imply that the package repeats it.

Compared supplier contracts at section level for 12 roadmap owners: SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, AlgebraicVectorBundles, ModularCurves, AlgebraicCurves, JacobianChallenge, FunctionFieldArithmetic, EtaleCohomologyFoundations, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity, ProfiniteCohomology and RepresentationTheory/SchurWeyl. R04 and R09 record the unsupported supplier claims. The seven declared gap slugs match the plan and README, have named suppliers, and describe identifiable extensions; their current absence is not a finding. The hyperplane contract matches SGA1 line 8303 and line 8308, including normality, properness and image dimension at least two.

Ownership searches used the roadmap grep service, main/Completed, board packages, and the supplied sibling heads. Generic finite root stacks, quotient stacks and ordinary Picard/norm geometry remain with SchemeAndStackFoundations; tensor/exterior primitives remain with their pinned owners. The additional root-coordinate, infinite-coframe, ramified-Picard and collision comparisons are this roadmap's constructions. No collision was found for the five fully qualified Lean names. These object searches do not certify every possible synonym used in unrelated roadmaps.

The pins inspected are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. In particular:

- Mathlib/RingTheory/AdjoinRoot.lean supplies the quotient, root equation, universal algebra map, positive-degree power basis and finite-presentation instance. The normalization polynomial is finitely presented even at exponent zero; a covering assertion is not made there.
- Mathlib/RingTheory/HopfAlgebra/MonoidAlgebra.lean:40 supplies the group-algebra Hopf structure, including the inverse-character antipode.
- TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:171 supplies the projection from tensor powers. Its two composites are the factorial and antisymmetrizer, and injectivity uses the unit-factorial condition. The roadmap's degree-two signed tensor has the correct minus sign.
- TauCeti/RepresentationTheory/Symmetric/TensorAction/Basic.lean supplies the tensor permutation representation. TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean:433 supplies finite-group annihilation in positive degrees.
- TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:89 and :250 supply finite-place approximation and residue interpolation; the roadmap separately treats an empty residue family by the nonzero function 1.

The PR diff is confined to packages/FunctionFieldArithmeticPartII. The plan diff changes only its top-level gaps list. Suggested.lean has one import Mathlib, the required namespace, no set_option, no admitted data, no lemma declarations and no admitted examples. Neither retained theorem is padding: their proofs require the weighted root comparison, and neither is a definition unfolding or a single pinned-library lemma. No deletion from Suggested.lean is requested.

### Headline coverage

| README headline | Acceptance-test status |
|---|---|
| Sharp injectivity and surjectivity of the root-chart comparison (§§1.184–1.185) | Both stated on the actual AdjoinRoot/tensor carriers. |
| Relative regular root geometry and exact DM locus (§§2.17–2.18) | Named in the module docstring; finite root-stack morphism carriers are missing. |
| Coherent infinite root stack, fpqc quotient and arbitrary base change (§§3.15, 3.398, 3.424) | Named; root pseudofunctor, coherent band action and quotient carriers are missing. |
| Infinite universal coinvariants (§§3.391, 3.401–3.426) | Named; constructing the colimit coaction is substantial work, not a simple stand-in definition. |
| Infinite DVR gerbe, Kummer classification and non-fppf torsor (§§3.144, 3.409, 3.427–3.428) | Named; geometric gerbe/torsor carriers are missing. Terminology repair is R05. |
| Root Picard square quotient and signed adelic equivalence (Layers 4 and 6) | Named; root Picard, degree and completed-lattice gluing carriers are missing. |
| Symmetric lisse lines and multiplication (§§7.7, 7.16, 7.22) | Named; root symmetric stacks and lisse categories are missing. |
| Exterior-power cohomology (§7.23) | Named; the theorem needs the geometric cohomology and Frobenius carriers, not merely abstract modules. |
| Rational DM perverse descent and proper quasi-finite comparison (§7.29) | Named; constructible derived category and perverse heart are missing. Supplier extension is R09. |
| High-degree Abel–Jacobi descent (§8.13) | Named; root Abel–Jacobi and lisse descent carriers are missing. |
| Normalized character sheaf in every integer degree (Layer 9) | Named; graded root Picard and its Frobenius/lisse carriers are missing. |
| Ramified norm complex and torsor obstructions (§§10.23–10.29) | Named; root multiplicative sheaf and compatible norm-torsor carriers are missing. |
| Quadratic Frobenius/idele comparison (§§10.20, 10.24) | Named; root Picard character sheaf and trace are missing. |

No statable geometric headline was found replaced by a free-predicate, abstract-scalar or bounded surrogate.

### Lean declaration audit

All declarations are in TauCetiRoadmap.FunctionFieldArithmeticPartII, Layer 1, with universe u. There are no standing section variables to recover. The definitions explicitly bind (A : Type u) [CommRing A] (f : A) (n : ℕ); the two theorems additionally bind hn : 0 < n. No field, reducedness, nontriviality, invertible exponent or regular-parameter instance is silently assumed.

| Declaration / location in Suggested.lean | Computed instances and values | Result |
|---|---|---|
| rootChart :42 | ℤ,f=2,n=2: t²=2 and t⁴=4. 𝔽₂,f=0,n=2: t≠0,t²=0. n=0: quotient by 1−f, so f=1 gives A[t] and A=ℤ,f=2 gives 0. | Real definition has the advertised total domain. |
| rootChartCoaction :48 | δ(t)=h⊗t; over ℤ,f=2,n=2 its square is 1⊗2. Over 𝔽₂,f=0 the nilpotent t is retained. At n=0,f=1, h is an unrestricted polynomial variable; no μ₀ assertion is made. | Real definition; left coaction interpretation restricted correctly to n>0. |
| rootChartComparison :72 | At n=2, Θ sends the basis (1⊗1,1⊗t,t⊗1,t⊗t) to (1,t,ht,fh); determinant −f. At n=3 three columns wrap, determinant f³. At n=1 it is identity. | Correct factor order and parameter weight. |
| rootChartComparison_injective_iff :79 | ℤ,f=2,n=2: both sides true. ℤ/4,f=2,n=2: both false, with 2t⊗t≠0 killed. n=1,f=0: both true. Zero ring: both true. Without hn, ℤ/4,f=2,n=0 has injective zero map but RHS false: 1−2 is a unit, while 2·2=0. | True as typed; hn essential. |
| rootChartComparison_surjective_iff :86 | ℤ,f=2,n=2: both false, missing h-coordinate modulo2. 𝔽₂,f=1,n=2: both true despite wild exponent. n=1,f=0 and zero ring: both true. Without hn, ℤ,f=2,n=0 is surjective but RHS false. | True as typed; hn essential. |

### Mechanical dependency check

The requested command completed with the following output:

```text
moved: FunctionFieldArithmeticPartII moved in the merge order from #16 to #169, right after its last supplier FunctionFieldArithmetic (EtaleCohomologyFoundations, AlgebraicModuliForArithmeticGeometry, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 646 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The permitted move is not a finding. The internal target/layer ordering defects in R01 are not checked by this cross-roadmap gate. No merge-order file was changed. The previously settled package-splitting request in FIX-PKG-FunctionFieldArithmeticPartII~2 was not re-raised.

## Computed statement audit

The sample below retains one row from each of the 66 calculation families, plus the scheme projective-space input. Context codes give the variables and instances; each sampled row keeps its computed values and result. Repeated per-target rows are omitted. These are adversarial instances, not formal proofs; process and locator defects are recorded in R02 and R08. Tests respect the stated carriers: fields are nonzero, lines have rank one, finite fields have q>1, and geometric root indices are positive.

| Code | Variable and instance context | Instances |
|---|---|---|
| N | A commutative; n>0; framed root and chosen normalization covers | ℤ/4,u=3,y=0,n=2; change to 𝔽₂; n=1 |
| F | A commutative; n>0; u unit, uyⁿ=f; arrows retain labels | 𝔽₇,n=2,p=(1,1),q=(2,2),w=2; ℤ/4,u=3,y=0 |
| P | A commutative; invertible sheaf and coherent tensor powers | Trivial line, z=3; z=0; powers 0,1,2 |
| PERM | n>0; i,j in Fin n, arithmetic modulo n | n=1; n=2; n=3,(i,j)=(2,2) |
| WRAP | n>0; 0≤i,j<n | n=1,(0,0); n=3,(0,2),(2,2) |
| ALG | A commutative; tⁿ=f; universal character hⁿ=1 | ℤ,n=2,f=2; 𝔽₂,n=2,f=0; n=1 |
| ACTION | A commutative; ζⁿ=1; n>0 | n=2,ζ=−1; dual numbers in characteristic 2,ζ=1+ε; ζ=1 |
| MAT | A commutative; n>0; ordered monomial tensor bases | n=2,f=2 over ℤ; n=3; n=1 |
| COEF | A commutative; n>0; source/target coefficient functions | n=2,f=2; family c₁₁=2; n=3,(2,2) |
| KER | A commutative; n>0; annihilator of f | ℤ/4,f=2,n=2; field,f=0,n=3; f=1 |
| COK | A commutative; n>0; module quotient by f | ℤ,f=2,n=2; ℤ/4,f=2,n=2; field,f=0,n=3 |
| INJ | A commutative; n>0 | ℤ,f=2,n=2; ℤ/4,f=2,n=2; n=1,f=0 |
| SURJ | A commutative; n>0 | ℤ,f=2,n=2; 𝔽₂,f=1,n=2; n=1,f=0 |
| UNIT | A commutative; f unit; n>0 | 𝔽₅,n=2,f=4; n=1; zero ring |
| DIM | Field; n>0; f=0 where kernel/image dimensions used | n=1,2,3,4 |
| ROOT | Schemes/stacks; invertible line, section; n>0 | n=1; f unit; k[t]/t² branch |
| DESC | Groupoid-valued roots; fixed site universes; n>0 | ℤ/4,u=3,y=0,n=2; trivial cover; zero ring |
| INV | A arbitrary commutative ring; universal coaction, not pointwise action | ℤ/4,f=0,n=2; unit chart; zero ring |
| SMOOTH | n>0; smooth quotient atlas; relative stack hypotheses | n=1; 𝔽_p[x],f=x,n=p; f=0,n=2 |
| DM | Base regular / relative DM hypotheses; regular Cartier divisor when required | 𝔽_p[x],f=x,n=p; Spec ℤ,f=2,n=3; f=1 |
| INDEX | Positive divisibility indices; factorial d_i=(i+1)! | i=0,1,2; n=3; 2|6|24 |
| CHAR | A commutative; finite/infinite character grading | n=2,3,6; rationals modulo ℤ |
| TRANS | A arbitrary; positive n|m; monic root quotients | 2|6; 1|2; n=m |
| COLIM | A arbitrary; factorial/positive directed root diagrams | 2|6; 3|6; n=1 |
| BASE | A→B→C unital; no flatness; common arbitrary universe | ℤ→ℤ/4→𝔽₂; f=2; a=3; i=2 |
| COACT | A arbitrary; universal LEFT coaction | i=0,1,2; a=3; f=0 or 2 |
| HOPF | A arbitrary; unit-root colimit / A[ℚ/ℤ] | q=1/3; q=0; q=1/2 |
| SCALE | Compatible unit families σ_i^(d_i)=1 | Over ℂ,σ_i=exp(2πi/d_i); identity family; zero root |
| POINT | Algebra-valued root groupoids; labelled arrows; n>0 | n=2,f=0 over ℤ/9; n=1; change to 𝔽₃ |
| KUM | Field or flat torsor tower as stated; fpqc limit | ℚ,roots of 2; 𝔽_p(t),p-th root of t; ℝ |
| COFRAME | Compatible root lines; normalized coframes; left band action | φ(e²)=3 over ℤ/4; n=3 normal-line frame change 2; n=1 |
| INF | Infinite root fpqc stack; all positive exponents | Trivial unit root; roots-of-2 tower over ℚ; zero section |
| RAD | DVR residue field k; all positive roots; normal-line frame chosen only for neutralization | k characteristic 0 or p; zero-root chart; r<n |
| PCOEF | A arbitrary; q in ℚ/ℤ; tensor coefficient P_q | A=ℤ,q=1/2; q=1/3; A=ℤ/4 |
| INFINV | A arbitrary; universal rational-character coinvariants | z=3; z=u₂; ℤ/4 coefficient 2; nonflat reduction |
| INVCRIT | φ:A→B; coefficient identifications of invariant algebras | ℤ→ℤ/4; ℤ→ℚ; identity on zero ring |
| PIC | Finite field of odd characteristic; smooth projective geometrically connected X; finite reduced R | R=∅; one rational branch over 𝔽₅; degree −1 on ℙ¹ |
| FRAME | Root Picard data; K on finite étale R; square action | γ=1,u=2 over 𝔽₅; R=Spec 𝔽₂₅; R=∅ |
| SECT | Root Picard section α on R; no invertibility required | α=0,1,ε over 𝔽₅[ε]/ε²; two branches |
| EFF | Relative root divisors; arbitrary nonreduced test schemes | d=0; (a,α)=(0,0); α=ε with ε²=0 |
| EVAL | Smooth curve; finite reduced branch divisor; arbitrary test schemes | ℙ¹,R={0,∞},d=1,2; duplicated evaluation equation |
| ADD | Effective root divisors; tensor addition; n=2 | Two branch factors with root sections s,t; three signs; d=0,1 |
| FIBRE | Odd characteristic; ordered root-divisor map; geometric fibre | d=0,1; D=x+y,x≠y; D=2x at a branch |
| AJFIX | Fixed root Picard object including α; geometric fibre | ℙ¹,L=O,R={0,∞}; α=(0,1),(0,0); R=∅ |
| ADELE | Finite field odd; all closed places; normalized valuations; labelled quotients | a_x=π_x⁻¹; κ(x)/k degree 2; principal divisor of t |
| MODUNIT | Modified units H; ū=v²; finite reduced R | One degree-two branch over 𝔽₃; two rational branches; empty R |
| STAB | Full double-quotient stabilizers | 𝔽₅,one rational branch; R=∅; two branches over 𝔽₃ |
| KOSZUL | Commutative coefficient ring; unit d! for invariant equivalence; arbitrary modules | rank 2,d=2 over ℚ̄₂; rank 1 over 𝔽₂; d=0,1 |
| AVG | Finite group; rational/characteristic-zero coefficients; linear functors | C₂ swapping K²; S₃ regular representation; C₂ over 𝔽₂ |
| LISSE | Normal finite-type DM; ℓ≠p; finite-rank lattices then rationalization | Frobenius ζ₃; ℤ₃²,J=[[1,1],[0,1]]; rank 0 |
| SYML | Odd characteristic; root symmetric powers; rational lisse input line | d=0,1,2; scalar Frobenius ζ₃; double branch collision |
| COH | Geometrically nontrivial lisse line; rational coefficients; V=H¹ | dim V=2,d=0,1,2,3; geometrically trivial arithmetic ζ₃-line |
| PBC | Proper tame DM source over scheme atlases; stated reduction condition | Bμ₂,ℓ=2 rational; ℤ₂ sign reduced mod2; nilpotent root fibre |
| PERV | Finite-type DM; rational coefficients; proper quasi-finite maps as stated | j:𝔾_m→𝔸¹; f:t↦t²; Bμ₂ |
| HIGH | d≥B=ρ+max(2g−1,1); n=d−g+1; a=n−ρ | g=0,ρ=1,d=2; g=1,ρ=1,d=2; boundary d=2g−2+ρ |
| QUAD | Split high-degree evaluation; coordinates (u,α), arbitrary test scheme | (u,α)=(2,3); dual numbers (0,ε),(1,ε); splitting change t |
| WEIGHT | a≥1,ρ>0, weights (2^a,1^ρ), char≠2 | (a,ρ)=(1,1),(2,1); α=0 and α≠0 |
| PDESC | High-degree proper scalar quotient; lisse line; connected fibres | ℙ⁰; ℙ¹; (a,ρ)=(2,1) |
| AUX | Integer degrees; auxiliary effective divisors away from finite R | d=−5,B=3; closed point P degree2; R=∅ |
| CHARLINE | Rational rank-one L; every integer degree; normalized tensor comparisons | Trace a=ζ₃; D=x,2x,−x; degree-two closed point |
| NORM | Finite flat quadratic cover; odd characteristic; root norm | t²=a; c+dt; ramified a=0 |
| H90 | Odd characteristic; ramified quadratic chart; norm-one unit with residue1 | u=−1; u=1; u≡1 at branch |
| TRACE | Quadratic cover; geometric Frobenius; rational coefficients | Split point; inert point; cyclic tensor of length2 or3 |
| APPROX | Finitely many places; prescribed nonzero residues | No places; residues2 and3 in 𝔽₅; one degree-two place |
| TORSOR | Étale sheaves A,B,K,T; two exact norm sequences; compatible based fibres | Double ℙ¹ over 𝔽₅ branched0,∞; trivial norm; invariant O(1) |
| RECIP | Finite function field odd; geometric Frobenius corresponds to π⁻¹ | Split/inert places; ramified residue2 over 𝔽₅; signed divisor |

| Statement (README section and line) | Context | Computed values on the tested constructions | Result / change |
|---|---|---|---|
| §1.1 Diagonalizable action on the affine root chart (line 111) | ACTION | t↦−t, twice gives t; (1+ε)²=1 and t↦t+εt retains infinitesimal action; identity sends t↦t. Root relation maps to ζⁿf=f. | No contradiction in these instances |
| §1.2 Cyclic root coefficient permutation (line 139) | PERM | σ(0,0)=(0,0); σ(1,1)=(1,0), inverse=(1,1); σ(2,2)=(2,1), inverse=(2,2). Wrapping counts 0,1,3; signs 1,−1,1. | No contradiction in these instances |
| §1.3 Root comparison wrapping exponent (line 167) | WRAP | floor((i+j)/n)=0,0,1; lower-coordinate test after permutation is false,false,true. n=0 has no pair in Fin 0; division formulas are used only for n>0. | No contradiction in these instances |
| §1.5 The chosen normalization pullback pasting comparison (line 215) | N | D=(ℤ/4)[T]/(T²−3), T⁻¹=3T, z=Ty=0; both base-change/pasting routes send T↦T, 3↦1 and z↦0; at n=1 T=u, cover=id. The zero ring gives the unique map. | No contradiction in these instances |
| §1.6 Euclidean reduction of quotient-root powers (line 241) | ALG | t²=2,t⁴=4; (h⊗t)²=1⊗2; in 𝔽₂[t]/t², t≠0 but t²=0. At n=1 t=f and h=1. Counit sends h⊗t to t; both coassociativity routes give h⊗h⊗t. | No contradiction in these instances |
| §1.8 Canonical coordinates for powers of the trivial line (line 300) | P | z⁰,z¹,z²=(1,3,9); for z=0 these are (1,0,0). Tensor coordinates 2⊗3↦6 and both associativity routes (2·3)·4=2·(3·4)=24. | No contradiction in these instances |
| §1.13 Inverse of a unit-chart root (line 385) | UNIT | t⁻¹=4t since 4t²=16=1; Θ⁻¹(h⊗1)=4t⊗t, Θ thereof=16h=h. Θ⁻¹(1⊗t)=1⊗t; n=1 and zero-ring comparisons are identities. | No contradiction in these instances |
| §1.26 Affine action comparison (line 602) | MAT | Θ(1⊗1,1⊗t,t⊗1,t⊗t)=(1,t,ht,2h); det=−2. General n=3: three wrapped columns, det=f³; n=1: matrix [1]. | No contradiction in these instances |
| §1.35 The normalized chart embedded in framed coordinates (line 763) | F | y_q=2=wy_p; u_qw²=2·4=1=u_p; inverse label=4; T_q↦4T_p and T_qy_q↦T_p. Over ℤ/4 no unit square is 3, while D supplies T²=3. | R01 |
| §1.52 Source monic tensor coordinates (line 1052) | COEF | Source synthesis gives 2t⊗t and analysis returns c₁₁=2; comparison gives 4h⊗1, target coefficient (1,0)=4, all other entries=0. At n=3, t²⊗t²↦f h²⊗t. | No contradiction in these instances |
| §1.100 Dimension of the root tensor source (line 1903) | DIM | source dimensions 1,4,9,16; kernel dimensions 0,1,3,6; image dimensions 1,3,6,10. Each source dimension equals kernel+image; wrap count=n(n−1)/2. | No contradiction in these instances |
| §1.127 Lower target residue map (line 2336) | COK | coker Θ=ℤ/2, respectively ℤ/2; lower residue coordinate h mod f detects nonimage. At n=3,f=0 cokernel dimension=3, matching three copies of A/(f). | No contradiction in these instances |
| §1.176 Kernel coefficient criterion (line 3109) | KER | ker Θ={0,2t⊗t}, matching ann(2)={0,2}; at f=0,n=3 kernel dimension=3=3·2/2; f=1 gives kernel=0=ann(1). | No contradiction in these instances |
| §1.184 Sharp injectivity criterion (line 3242) | INJ | Injective Θ=true,true RHS over ℤ; over ℤ/4 both false (2t⊗t≠0 maps to 0; 2·2=0). At n=1 both true via first disjunct despite f=0. Zero ring: both true. | No contradiction in these instances |
| §1.185 Sharp surjectivity criterion (line 3260) | SURJ | Surjectivity and RHS are false,false over ℤ (h has no preimage); true,true for unit 1 even in characteristic 2; true,true at n=1. Zero ring: IsUnit(0)=true and the unique map is onto. | No contradiction in these instances |
| §1.240 Affine action charts stackify to root objects (line 4176) | DESC | No normalized chart point over ℤ/4 has u=3; D adjoining T²=3 does, with rank 2 and z=0; its two overlaps have inverse-unit transition satisfying w₁₂w₂₃=w₁₃. Identity descent returns the original labelled object; empty scheme returns the terminal groupoid. | R01 |
| §2.1 Root stacks over an algebraic-stack base (line 4256) | ROOT | Root₁=X; unit section gives X with trivial relative inertia; f=0,n=2 gives [Spec k[t]/t²/μ₂], t≠0, reduction Bμ₂. Over B𝔾_m the relative identity retains base inertia 𝔾_m. | No contradiction in these instances |
| §2.2 Vanishing of the positive-degree invariant coefficients (line 4276) | INV | δ(2t)−1⊗2t=2(h−1)⊗t≠0 although all (ℤ/4)-valued μ₂-points fix 2t. Weight-zero submodule=A·1. δ(3)=1⊗3. Over the zero ring both sides are {0}. | No contradiction in these instances |
| §2.13 A smooth presentation valid for wild roots (line 4409) | SMOOTH | V₁=Spec A[q,q⁻¹]; V_p(x)=Spec 𝔽_p[z,q,q⁻¹] after x=z^p/q, regular and smooth; for f=0, V=Spec A[z,q,q⁻¹]/z² retains z. W×^{μ_n}𝔾_m=V; the direct product gives a wrong degree-n map. | No contradiction in these instances |
| §2.17 Regular roots of regular Cartier divisors (line 4475) | DM | At x=0 relative inertia μ_p has nonzero tangent space, so not DM; away from x=0 it is 1. On V(2), 3 is invertible, so n=3 root is DM although 3 is not invertible on ℤ. Unit section gives relative identity. | No contradiction in these instances |
| §3.1 Affine divisibility transition (line 4519) | TRANS | t₂↦t₆³; (t₆³)²=t₆⁶=f. B₆ is free of rank 3 over B₂ with basis 1,t₆,t₆²; 1|2 has rank 2; equal-index map sends t_n↦t_n and has rank 1. Constants map identically. | No contradiction in these instances |
| §3.5 Positive divisibility root indices (line 4623) | INDEX | d=(1,2,6), not (1,2,3); u₀=f, u₁=u₂³, u₂⁶=f. For 2|6|24 both routes take t₂ to t₂₄¹². n=0 is outside the geometric index category. | No contradiction in these instances |
| §3.6 Coherent factorial root-of-unity points (line 4652) | SCALE | σ₂³=−1=σ₁ and σ₂⁶=1; S_σ(u₁)=−u₁, S_σ²(u₁)=u₁, S_σ⁻¹S_σ(u₂)=u₂; S_1(u₂)=u₂; every scaling sends zero root to zero. Choosing σ₀=−1 fails d₀=1. | No contradiction in these instances |
| §3.7 The universal finite cyclic root character (line 4680) | CHAR | c₂(1)=1/2=c₆(3); c₃(1)=1/3≠−1/3=2/3; c₃(3)=0. Character multiplication e_(1/2)²=e₀ and e_(1/3)³=e₀; inverse e_(1/3) is e_(2/3). | No contradiction in these instances |
| §3.10 algebra-valued finite root points (line 4764) | POINT | Roots 3 and 6 are joined by label −1 since −3=6; root 0 is not isomorphic to 3 by any unit. Identity label=1, inverse of −1=−1; both roots reduce to 0, while labels remain part of arrows. | No contradiction in these instances |
| §3.12 Normalized coframes of a finite root (line 4820) | COFRAME | Coframe β has β²=φ, hence β(e)²=3; β(t) transforms by ζ. Isom(x_λ,y) has class [a⁻¹], so at a=2,n=3 the class is [1/2], not [2]; changing λ to 3λ gives [3/2]. At n=1 the torsor is trivial. | No contradiction in these instances |
| §3.15 Infinite root stacks (line 4909) | INF | Trivial system has canonical compatible roots 1; twisted roots-of-2 system exists in the 2-limit and fpqc quotient but not as an fppf-locally trivial G-torsor. For f=0 chart z_n≠0 with z_n^n=0; zero-section gerbe retains band lim μ_n. | No contradiction in these instances |
| §3.64 Factorial root chart colimit (line 5767) | COLIM | The two models send t₂ to u₂³ and t₃ to u₂²; both recover t₂,t₃ under inverse comparison. (u₂³)²=(u₂²)³=u₂⁶=f; coefficient 2 remains 2, and every finite-stage monomial remains injective, including nilpotents. | No contradiction in these instances |
| §3.116 Coefficient change of the finite root diagram (line 6618) | BASE | Both composites take a=3 to 1 and u₂ to the level-2 root; u₂⁶=2 becomes u₂⁶=0. Base-change tensor map sends 3⊗u₂ to u₂ in characteristic 2; identity sends 1⊗u₂ to u₂. Labels e_(1/6) retain 1/6. | No contradiction in these instances |
| §3.132 Finite cyclic coordinates intertwine comultiplication (line 6920) | HOPF | Δ(e_(1/3))=e_(1/3)⊗e_(1/3), ε(e_q)=1, S(e_(1/3))=e_(2/3). Both convolution orders give e₀=1; S²(e_q)=e_q; at q=1/2 inverse fixes e_q. | No contradiction in these instances |
| §3.144 A Kummer limit torsor without fppf trivialization (line 7136) | KUM | [2]₂≠[1]₂ and [4]₂=[1]₂; transition [2]₆↦[2]₂. t is not a p-th power in 𝔽_p(t). Over ℝ lim k×/(k×)^n has 2 classes, while lim μ_n(ℝ)={1}. Over ℚ degrees n are unbounded, so no finite-type splitting cover. | R03 |
| §3.154 Universal coaction on the factorial chart (line 7326) | COACT | δ(u₂)=e_(1/6)⊗u₂; δ(u₂³)=e_(1/2)⊗u₂³; δ(u₂⁶)=e₀⊗f=1⊗f. Counit gives u₂ and both associativity routes give e_(1/6)⊗e_(1/6)⊗u₂; δ(3)=1⊗3. | No contradiction in these instances |
| §3.356 Coefficient coinvariance (line 10587) | INFINV | δ(3)=1⊗3, unique coefficient=3; δ(u₂)=e_(1/6)⊗u₂≠1⊗u₂. In ℤ/4, δ(2u₂) retains nonzero weight 1/6; after reduction to 𝔽₂ it becomes 0. Equalizers are A before change and B after tensor base change. | No contradiction in these instances |
| §3.366 Rational-character tensor coefficient (line 10759) | PCOEF | P_(1/2)(e_(1/2)·2⊗3+e₀·5⊗7)=6 and P₀=35; P_(1/3)(e_(−1/3)⊗1)=0 versus P_(1/3)(e_(1/3)⊗1)=1; P_(1/2)(e_(1/2)·2⊗1)=2≠0 over ℤ/4. | R06 |
| §3.425 Invariant-map injectivity criterion (line 11716) | INVCRIT | Invariant-map surjectivity=true and injectivity=false for ℤ→ℤ/4, matching φ; for ℤ→ℚ injectivity=true and surjectivity=false; zero-ring identity is both. Kernel element 4 and missing rational 1/2 witness the failures. | No contradiction in these instances |
| §3.427 The infinite reduced DVR fibre (line 11742) | RAD | z_n^r≠0 for r<n but z_n^n=0; reduced chart=k. Band is lim μ_n, retaining μ_p stages in characteristic p. For n=2 the full chart is k[z]/z², while the zero-section gerbe is Bμ₂. | R05 |
| §4.1 The graded root Picard stack (line 11791) | PIC | R=∅ gives ordinary Picard with full inertia 𝔾_m, relative inertia 1. With one branch, (c,v)=(4,2) has v²=c; (1,2) fails. O(−1) is an allowed negative-degree root Picard object, although it has no nonzero global section. | No contradiction in these instances |
| §4.2 Square-action presentation of the root Picard stack (line 11820) | FRAME | Frame changes to γ′=4 and root coordinate a′=2; γ′⁻¹(a′)²=4⁻¹·4=1. The frame torus has 24 rational units for 𝔽₂₅, not (5−1)²=16. Empty R has trivial relative frame group. | No contradiction in these instances |
| §4.3 The root Picard stack with a root section (line 11836) | SECT | α²=0,1,0 respectively, but ε≠0. For one branch, full stabilizer is 𝔾_m at α=0 and 1 at α=1; for two branches α=(1,0) leaves μ₂. Scalar −1 does not fix ε in odd characteristic. | No contradiction in these instances |
| §5.1 Hat and effective root symmetric powers (line 12069) | EFF | Zero sections define hat objects; effective degree-zero object has a=1. (0,ε) is outside the effective open despite α≠0. Over k[ε]/ε³, a=ε² is nonzero but zero in every geometric fibre, so is not effective. | No contradiction in these instances |
| §5.2 The evaluation smoothness criterion (line 12099) | EVAL | For d=1 the incidence divisors are distinct points with empty intersection; at d=2 their intersection is the point 0+∞ of codimension 2. Two copies of f=z have differential rank 1<2; f=z² has derivative 0 at z=0. | No contradiction in these instances |
| §5.5 Addition of root divisors (line 12147) | ADD | Output root=st and (st)²=s²t². Signs (−1,−1) act trivially on st, giving diagonal μ₂ kernel; (−1,1) acts by −1. For three factors with omitted index 0, swap(0,1) sends (ζ,η) to ((ζη)⁻¹,η). Degree-zero addition is identity. | No contradiction in these instances |
| §5.9 Root Abel–Jacobi maps (line 12234) | AJFIX | Evaluation has image {(a,a)}. Fibre at α²=(0,1) is empty; at (0,0) it is the kernel {0}. For empty R the effective fibre over a fixed line is H⁰(L)−{0}, not its projectivization. | No contradiction in these instances |
| §5.23 Geometric two-fibres of ordered divisors (line 12544) | FIBRE | Fibre point counts 1,1,2; stabilizers 1,1,1. At 2x the full atlas is K[s,t]/(s²+t²,st), dimension 4 with nonzero nilpotents; reduced relative fibre=Bμ₂. Both source inertia μ₂²→μ₂ and kernel diagonal μ₂ are retained. | R04 |
| §6.1 Modified local units at ramified places (line 12572) | MODUNIT | For one 𝔽₉ branch, kernel μ₂ has 2 rational points and residue square quotient has 2 classes, not 4. Two rational branches give kernel of size 4; empty R gives H=∏O_x× and kernel=1. | No contradiction in these instances |
| §6.2 Root lines with a generic trivialization (line 12600) | ADELE | E(a)=−x, line O(x), degree +2=−(−2). O(div t)≅O but framed divisors differ. Right quotient retains generic frames; the double quotient admits the principal multiplication arrow. For residue v=2 in 𝔽₇, inverse label 4 has square 2=(v²)⁻¹. | No contradiction in these instances |
| §6.11 The stabilizer extension in the double quotient (line 12806) | STAB | (c,v)=(4,2) has order 4 since its square is (1,4)≠1; full stabilizer C₄ is not C₂×C₂. Empty R gives 𝔽₅× of size 4. Two rational branches over 𝔽₃ give 4 admissible (c,v₁,v₂). | No contradiction in these instances |
| §7.1 Koszul-signed permutation action on tensor powers (line 12852) | KOSZUL | Signed invariant dimension=1 with e₁⊗e₂−e₂⊗e₁; unsigned dimension=3. π∘α=2 id, so inverse is π/2. Over 𝔽₂, e⊗e is invariant but ∧²=0. Degree 0 gives K and degree 1 gives V. | No contradiction in these instances |
| §7.2 Rational averaging: invariants are exact and commute with linear functors (line 12887) | AVG | Average(x,y)=((x+y)/2,(x+y)/2), square=itself. S₃ regular average sends each basis vector to (Σ_g g)/6, invariants dimension 1 and higher cohomology 0; over 𝔽₂ invariants→trivial augmentation sends 1+g to 0, so not exact. | No contradiction in these instances |
| §7.3 Local systems on the root curve and inertia of order two (line 12903) | LISSE | ζ₃ has order 3 despite branch inertia order ≤2. J mod3 has order3, mod9 order9, End(J) dimension2. Rank-zero object has zero fibre. On Bμ₂, trivial/sign invariants have dimensions 1/0. | R01 |
| §7.14 Rational coarse comparison for symmetric local systems (line 13153) | PBC | Rational constant/sign H⁰ dimensions=1/0 and H^i=0 for i>0. Integral sign invariants=0, but mod2 invariants=𝔽₂: reduction fails without the condition. k[t]/t² and k have equivalent étale categories although t≠0. | No contradiction in these instances |
| §7.16 Comparison with the symmetric pushforward description (line 13186) | SYML | Symmetric line traces are 1,ζ₃,ζ₃² for rational repeated points. Tensor character on (−1,−1) is +1, so descends through multiplication μ₂²→μ₂. Coarse stalk of branch sign is 0; on the stack it remains a one-dimensional line. | R01/R07 |
| §7.18 Cohomology of a geometrically nontrivial twisted curve sheaf (line 13220) | COH | Only H^d survives with dimensions 1,2,1,0=dim∧^d V. For a geometrically trivial line, H⁰ has dimension1, so the nontriviality hypothesis cannot be dropped. Rank-zero V gives ∧⁰=K and positive exterior powers 0. | R01 |
| §7.29 Rational DM perverse descent and proper quasi-finite comparison (line 13412) | PERV | j_!*E[1]=E[1], with H⁻¹=E,H⁰=0. Under f, unshifted stalk dimensions are 2 off 0 and 1 at 0; sign summand has boundary stalk0. On Bμ₂ both sign and constant are degree-zero perverse; pushforward dimensions0/1. Supplier domain issue R09 remains. | R09 |
| §8.1 High-degree section evaluation is surjective (line 13458) | HIGH | (n,a,weights)=(3,2,(2,2,1)) and (2,1,(2,1)). At the strict boundary L=ω(R), H¹(L(−R))=H¹(ω) has dimension1, so evaluation need not be onto. With R=∅, g=1,d=1 fibre quotient is ℙ⁰. | No contradiction in these instances |
| §8.3 Split quadratic section coordinates (line 13490) | QUAD | Section coordinates are (2,9),(0,0),(1,0). The second tuple is ineffective; the third is effective and retains ε. Changing the splitting gives u′=u−t(α²), a quadratic correction, with weights 2 on u and 1 on α. | No contradiction in these instances |
| §8.6 A projective cover of the weighted quotient (line 13576) | WEIGHT | Projective cover ℙ¹→ℙ(2,1) has degree2, ramified along square coordinate; ℙ²→ℙ(2,2,1) has degree4. Stack stabilizer at α=0 is μ₂, at α≠0 is1; coarse weighted quotient is geometrically simply connected. | No contradiction in these instances |
| §8.9 Triviality of the symmetric sheaf along Abel–Jacobi fibres (line 13624) | PDESC | Connected finite étale covers of ℙ⁰,ℙ¹ have degree1; degree2 of a connected étale ℙ¹-cover would force genus−1. The weighted fibre quotient has π₁=1, so line fibre invariants have dimension1 and adjunction is an isomorphism; α=0 retains μ₂ before the coarse quotient. | No contradiction in these instances |
| §9.1 Effective auxiliary divisors away from R (line 13757) | AUX | D=4P has degree8 and d+deg D=3≥B; 3P gives1<B. Multiples of P are arbitrarily large without a rational point. For D,E both allowed, D+E dominates both and addition of divisor degrees agrees on either route. | No contradiction in these instances |
| §9.2 The tensor line attached to an effective divisor (line 13773) | CHARLINE | Signed tensor traces are a,a²,a⁻¹. A degree-two closed point contributes its κ(x)-Frobenius eigenvalue a, not a². D+(−D)=0 gives a·a⁻¹=1; the normalized unit is1. Rescaling comparison by c≠1 breaks the unit condition. | No contradiction in these instances |
| §10.1 The root multiplicative sheaf (line 14130) | NORM | Norm(c+dt)=det[[c,ad],[d,c]]=c²−ad²; Norm(t)=−a. At a=0 norm is c²; residue root is c. For c=0,d=1,a=2 norm=−2. Zero section maps to zero, not to a unit. | No contradiction in these instances |
| §10.2 The Frobenius trace is a character (line 14158) | RECIP | Trace and Artin quadratic character are +1 at split, −1 at inert; at ramification a nonsquare residue2 has character−1. Modified-unit residues v² have character+1. π_x⁻¹ has degree+[κ(x):k], fixing the arithmetic/geometric inverse convention. | No contradiction in these instances |
| §10.4 Nonzero residue interpolation (line 14204) | APPROX | Empty family is realized by f=1, not a potentially zero witness. At places 0,1 on ℙ¹, f=t+2 has residues2,3 and valuations0,0; a degree-two point uses one κ(x)-valued residue, not two independent rational residues. | No contradiction in these instances |
| §10.5 Cyclic tensor trace in rank one (line 14220) | TRACE | Split permutation has trace2, constant trace1, anti-trace+1; inert transposition trace0, anti-trace−1. Cycle length2 with monodromy−1 has tensor trace−1, not (+1); length3 monodromy2 has trace2, not8. | No contradiction in these instances |
| §10.15 Étale-local surjectivity of the root norm on units (line 14395) | H90 | u=−1 has norm1 but residue−1, hence is excluded. For normalized u, w=1+u has residue2≠0 and w/σ(w)=u; u=1 gives w=2 and ratio1. Characteristic2 would make this denominator residue0 and is excluded. | No contradiction in these instances |
| §10.23 The exact ramified norm sheaf sequence (line 14548) | TORSOR | Root global units have size8; norms (w²,w,w) give4. c=(1,1,−1) has nonzero connecting class of order2. O(1) is involution-invariant but not a pullback, whose degrees are even. Changing τ changes the based obstruction by δ_q¹δ_N⁰(c); the quotient class is unchanged. | No contradiction in these instances |
| Layer 8 scheme projective-space input | Algebraically closed k; r≥0; finite étale covers | ℙ⁰: a connected finite étale algebra is k, degree1. ℙ¹: an étale cover of degree2 would have genus−1. In ℙ² a hyperplane is ℙ¹; the declared hyperplane gap gives surjective π₁=1→π₁(ℙ²), hence the target group is1. | Conditional on the declared hyperplane supplier contract |

## Not verifiable

- B24, §3, pp.135–136 remains uncertified under the supplied settled source status. Its text was neither requested again nor guessed. The explicit zero-chart and Kummer calculations were checked independently; R05 concerns the package's own incompatible terminology and missing interface.
- No Lean process or build was run. The five supplied elaborated types were inspected and compared, but this pass does not independently certify elaboration or the eventual proofs.
- The seven declared supplier extensions are contracts for future work. The audit checks their declarations, scope and direction, not their eventual implementation. R04 and R09 ask for additional explicit contracts rather than treating undeclared work as already supplied.
- Ownership searches are by mathematical objects and declaration names in the available files. They cannot exclude a differently worded construction that those searches did not identify. No inaccessible open-pull-request text was used as evidence.
- The tables record concrete adversarial calculations and proof-route checks, not exhaustive formal proofs of every general target. The 66 distinct Check families are counted once; repeated API identities do not create additional independent evidence.

## Source issues

- **Misprint** in AGV08 at Appendix B.2, printed p.53 (AGV08 line 2439): the source says the section compatibility uses exponent m although the root has order d; it should be exponent d; affects a stated result.
- **Error** in AGV08 at Appendix B.2, printed p.54 (AGV08 line 2473): the source says the smooth root presentation is W times G_m; it should be the contracted product W times G_m modulo μ_d; affects a stated result.
- **Misprint** in YZ19 at Definition A.2, printed p.515 (YZ19 line 7006): the source says a_R is the restriction of a_R; it should be the restriction of a; affects nothing.
- **Error** in YZ19 at §A.1.3 and Lemma A.7's proof, printed pp.515–516 and 519–520 (YZ19 line 7028 and line 7436): the source says branch fibres and collision preimages are the displayed classifying gerbes; it should be their reductions, with full fibres retaining nilpotent root coordinates; affects a stated result.
- **Misprint** in YZ19 at Lemma A.5's proof, printed p.518 (YZ19 line 7281): the source says the idele is the local trivialization composed with the inverse generic trivialization; it should be the inverse ratio to obtain the stated π_x⁻¹ to O(x) normalization; affects the proof.
- **Misprint** in YZ19 at §A.2.1, printed p.519 (YZ19 line 7347 and line 7364): the source says the unshifted symmetric pushforward is perverse; it should be shifted by d before asserting middle perversity; affects a stated result.
- **Error** in YZ19 at §A.2.1, printed p.519 (YZ19 line 7358): the source says the ordered root-divisor map is finite; it should be proper quasi-finite with finite relative stabilizers, generally nonrepresentable at branch collisions; affects the proof.
- **Error** in YZ19 at Lemma A.8's proof, printed p.520 (YZ19 line 7491): the source says the arbitrary input line has monodromy in {±1}; it should be monodromy in the coefficient-field units, with only branch inertia restricted to order two; affects the proof.
- **Gap** in YZ19 at Lemma A.10's proof, printed p.522 (YZ19 line 7653): the source says to choose an unrestricted divisor of sufficiently large degree before using addition on effective symmetric powers; it should be an effective auxiliary divisor there; affects the proof.
- **Misprint** in YZ19 at Proposition A.11's proof, printed p.523 (YZ19 line 7735): the source says multiplication is checked after pullback by the Abel map in the sum degree; it should be pullback by the product of the two Abel maps; affects the proof.
- **Misprint** in YZ19 at Proposition A.11's proof, printed p.523 (YZ19 line 7744): the source says L without the Picard superscript in formulas on Picard components; it should be the descended Picard local system; affects the proof.
- **Error** in YZ19 at §A.3.3, display (A.11), printed p.525 (YZ19 line 7872): the source says the four-term sheaf complex directly gives the displayed exact sequence of Picard stacks; it should be two torsor fibre sequences retaining chosen trivializations and connecting obstructions; affects a stated result.
- **Misprint** in CONRAD-EXT at §4, printed p.12 (CONRAD-EXT line 533): the source says tensors with distinct basis indices form a basis of the entire tensor power; it should be a linearly independent subset of that basis; affects the proof.
- **Misprint** in LO-P at the end of §3, printed p.5 (LO-P line 159): the source says the nonpositive aisle vanishes in nonpositive degrees and the nonnegative aisle in nonnegative degrees; it should be vanishing in positive and negative degrees respectively; affects a stated result.
- **Misprint** in LO-P at Theorem 5.1's proof, printed p.7 (LO-P line 200): the source says the nonpositive truncation belongs to both opposite truncation subcategories; it should be the nonnegative truncation in the second occurrence; affects the proof.
- **Error** in LO-P at Lemma 6.1, printed pp.9–10 (LO-P line 292): the source says restriction and vanishing boundary perverse i-star characterize intermediate extension uniquely; it should be the joint perverse i-star and i-shriek vanishing criterion, excluding both boundary subobjects and quotients; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5a6bc6d55e09a242a28720a8407f348760bf405e", "job": "RT-FunctionFieldArithmeticPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
