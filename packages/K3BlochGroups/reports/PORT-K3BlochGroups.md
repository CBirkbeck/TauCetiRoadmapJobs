# PORT-K3BlochGroups

Branch: `roadmap/k3-bloch-groups`.

Head: `7e41dae7ddf225852b56292ece8767ef6a9f3b8f`.

Base: `a07e202`. Only `TauCetiRoadmap/K3BlochGroups/README.md`, `TauCetiRoadmap/K3BlochGroups/Suggested.lean` and `TauCetiRoadmap/K3BlochGroups/metadata.toml` enter the commit. The source package’s mathematical files and all other roadmap folders remain unchanged; the requested port report is the only addition to the package. Nothing was pushed and no GitHub write was made.

Build command: `lake build TauCetiRoadmap.K3BlochGroups.Suggested`.

Exact outcome: `Build completed successfully (8976 jobs).`

Warnings: **8**, all `declaration uses sorry` warnings on headline theorems; **0** other warnings. The signature-audit build also succeeded. Five real-body definitions and eight headline theorems are retained.

Gate summary:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean worktree. Its precommit run passed every content check and reported only the three staged files as dirty. The final gate was therefore run after the commit.

Dependency check, including the requested movable check:

```text
depcheck: 25 roadmaps, 220 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No tooling or merge-order file was edited.

## Draft pull request body

Build an integral, functorial library connecting third algebraic K-theory with Steinberg-group homology and Bloch groups. The roadmap isolates the Milnor image, constructs the natural Suslin sequence with its enhanced torsion kernel, supplies the separate finite-field comparison, and keeps exact maps between the integral Bloch conventions so downstream regulators and finite-coefficient comparisons retain their signs and two-primary information.

## Dependencies still in pull requests

AlgebraicKTheory; StableHomotopyKTheory; GeneralAlgebraicKTheory; K2SymbolsBrauer; SchemeKTheoryOperations; KTheoryFiniteLocalFields; ArithmeticKTheory; PolylogarithmFunctions; HomotopySpheres; FourManifolds. These are cited by roadmap and section in the README. AlgebraicTopology, AlgebraicCurves, GlobalNumberFields, RealAlgebraicGeometry and completed UniversalCovers were read at main where relevant; revisions of existing roadmap folders were not used as dependencies. Ordering and real-closure existence are consumed directly from the pinned Tau Ceti declarations.

## What changed in the port

- Kept the full six-layer mathematical package, including every integral convention, finite-field exception, worked example, API, finite-witness construction, and precise theorem hypothesis. Contracts are grouped by actual supplier; dependency markers use the upstream prose form. Metadata matches main's one-key format, `topic = "math.KT"`.
- No statement moved from `Suggested.lean` to the README. The supplied Lean file already had the required acceptance-test form. Its mathematical declarations and import are unchanged; its module documentation now also identifies the absent carrier for the algebraically closed integral torsion theorem. No API lemma, computed example, sorry'd data, additional import or option was added.
- Deleted the repeated degree-three Milnor-comparison API from §2.1, retaining the supplied comparison by K2SymbolsBrauer §8.4 and this roadmap's quotient and injectivity targets. The ownership record is confined to Scope and ownership.
- Replaced the absent positive-characteristic integral-torsion supplier assumption with an explicit construction in §2.2. SchemeKTheoryOperations §3.6 supplies the integral injection from the algebraic closure of the prime field. Its square with the Bott coefficient comparison makes the Bockstein injective, proving K₄ divisibility before using it to construct normalized K₃ torsion. This removes the circular use of an assumed integral torsion theorem to establish its own Bockstein normalization. The defining-characteristic degree-zero exception remains intact.
- Replaced the real-closed-elementary-transfer supplier placeholder with the full quantifier-elimination, completeness and model-completeness targets in §5.8, followed by the finite coefficient-list transfer theorem. These are not asserted by RealAlgebraicGeometry's real-number quantifier-elimination target. Mathlib has the first-order syntax and semantics, and Tau Ceti supplies `RingPreordering.exists_linearOrder` and `TauCeti.RealClosure.exists_realClosure`; the formally-real-to-ordered bridge is now explicit. Added discriminating real-closed-field checks without narrowing the formally real headline to fields embedding into ℝ.
- Named the pinned Sylow theorem precisely and retained its actual prime-primary hypothesis. The degree-zero stable-elements case remains a direct identity. Supplied the previously implicit SchemeKTheoryOperations §5.2 homotopy-invariance input to §4.21; §§5.5 and 6.4 are identified as projective-bundle and operation/product inputs.
- Strengthened the rank-two Bloch-map Check with the nonzero order-six class c, and replaced a duplicate F₂ monomial Check by F₄'s group of order 36 and exponent 12. Split compact refined-configuration Checks into separate bullets. Rephrased certificate validity as finite integer-coordinate equalities, preserving the algebraic characterization while avoiding an executable decision-procedure requirement. Corrected a duplicated word and process-dependent source wording.

The accepted ownership decisions are preserved: generic K-theory and analytic polylogarithms remain supplied; the Hopf/unit comparison, unstable SL₂ symbols, cyclic maps, symmetric stability, AHSS supplements and finite-group computations remain owned here; the Habiro composite is absent and no downstream roadmap is imported.

## Supplier resolution and duplication sweep

Read the main/completed model roadmaps LocalPurity and UniversalCovers, and inspected the additional GrothendieckEulerForms and RestrictedProducts models. Read supplier sections through `tauceti-roadmap roadmaps show`, and searched all main roadmaps and all 327 indexed open heads with `roadmaps grep`, using mathematical objects: Bloch presentations and boundaries, enhanced Tor, cross-ratios, configuration hyperhomology, injective words, symplectic symbols, cyclic power maps, generalized quaternion homology, stable elements, Hopf kernels, sphere-unit comparison, free-G-set Barratt–Priddy, real-closed transfer and algebraically closed integral torsion. Also searched the board packages and the pinned Mathlib and Tau Ceti sources. This includes the sibling heads named in the brief. At the final index (2026-10-23T09:46:21Z), all eleven consumed open-head or consumer texts re-read for the final pass were unchanged from the inspected copies. The sweeps found no earlier owner for the two newly explicit consequences or for the owned generic supplements.

ColemanIntegration §L2.Fb also specifies generic pre-Bloch, antisymmetric tensor and Bloch carriers. It is later than K3BlochGroups in the supplied merge order. Their generic ownership stays in K3BlochGroups Layer 3; ColemanIntegration's branch-dependent evaluation and its projective-coordinate adapter remain its own. The README records this direction in Scope and ownership. No ColemanIntegration declaration is copied under its fully qualified name. Polylogarithms Layer 2 and §4.2 explicitly consume the K3BlochGroups carriers and rational-curve result; PolylogarithmFunctions supplies analytic functions and projective cross-ratio foundations, with no competing Bloch carrier. ArithmeticKTheory supplies its arithmetic independently. K3SurfacesAndSymplecticBoundedness concerns geometric K3 surfaces and supplies no degree-three K-theory premise.

The only citation-resolver lead with pinned-source checking is `uce.source_superperfect`. It is not claimed to be in the pinned library: it occurs in the readable StableHomotopyKTheory §3.29 universal-central-extension API. Thus it resolves as the named planned supplier API. All cross-roadmap citations resolve; no genuinely missing supplier declaration is asserted.

Pinned sources were checked by object and by declaration, including:

| Interface | Pinned repository-relative source | What the definition requires or omits |
| --- | --- | --- |
| Trivial group homology and maps | `.lake/packages/mathlib/Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`, `LowDegree.lean`, `Functoriality.lean` | Actual representation, cycles and projection; the degree-three differential's first coefficient is acted on by g⁻¹, which disappears only for trivial coefficients. |
| Cyclic norm-complex homology | `.lake/packages/mathlib/Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`, line 122 | Supplied arbitrary cyclic representations; power-map compatibility is the added target. |
| H-space | `.lake/packages/mathlib/Mathlib/Topology/Homotopy/HSpaces.lean:65` | Fields are `hmul`, `e`, `hmul_e_e`, `eHmul`, `hmulE`; no associativity or commutativity. |
| Formal reality | `.lake/packages/mathlib/Mathlib/Algebra/Ring/IsFormallyReal.lean:104` | `not_isSumNonzeroSq_zero`; no linear order or real embedding is part of the class. |
| Preordering | `.lake/packages/mathlib/Mathlib/Algebra/Order/Ring/Ordering/Defs.lean:47` | Subsemiring, all squares, and exclusion of −1; it is not itself an ordering. |
| Ordering extension | `.lake/packages/TauCeti/TauCeti/Algebra/Order/Ring/Ordering/Extension.lean:158` | Extends a specified field preordering to a strict ordered-field structure. |
| Real closure | `.lake/packages/TauCeti/TauCeti/FieldTheory/RealClosure/Basic.lean:120` | Ordered, algebraic extension in the same universe with a strictly monotone embedding. |
| Antisymmetric tensors | `.lake/packages/TauCeti/TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` | Negative eigenspace of comm, not the cokernel; at ℤ both differ by diagonal two-torsion. |
| Shapiro | `.lake/packages/TauCeti/TauCeti/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:98` | Actual induced representation and homology comparison. |
| Transfer | `.lake/packages/TauCeti/TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:65`, line 107 | Commutative coefficient ring and finite-index subgroup. |
| Transfer transitivity | `.lake/packages/TauCeti/TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Trans.lean:86` | Actual nested-subgroup transfer maps. |
| Connecting-map naturality | `.lake/packages/TauCeti/TauCeti/RepresentationTheory/Homological/GroupHomology/LongExactSequence.lean:106` | Short-exact representation complexes and compatible morphism. |
| Sylow restriction | `.lake/packages/TauCeti/TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.lean:56` | Finite G and an element killed by a power of the Sylow prime. |
| Mackey formula | `.lake/packages/TauCeti/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Mackey/AllDegrees.lean:279` | All n≥0, profinite G, open U, closed V and discrete abelian coefficient module; finite discrete groups are compared with ordinary cochains. |

## Elaborated signatures

Placed `#check @name` for each of the thirteen declarations in one scratch Lean file, elaborated those checks together by temporarily appending them to the target module and running the authorized targeted build, compared every elaborated type with its README statement, then restored the final file and rebuilt. No mathematical declaration changed and no binder was lost.

| Declaration | Elaborated hypotheses compared with README | Outcome |
| --- | --- | --- |
| antisymSquare | R,M; CommRing R; AddCommGroup M; Module R M | Exact; arbitrary commutative ring. |
| antisymSquare_diagonal_exact | Arbitrary abelian A | Exact; canonical projection, all diagonal classes, and A/2A equality criterion retained. |
| preBlochRawSymbol | Arbitrary Field F | Exact; zero extension only at zero. |
| preBloch | Arbitrary Field F | Exact; [1] and admissible five-term subgroup. |
| preBlochSymbol | Arbitrary Field F, x:F | Exact; quotient symbol. |
| generalLinearStabilization | F:Type u, Field F, n:ℕ | Exact; native block inclusion. |
| generalLinear_homology_stable | Infinite F:Type u, i≤n; φ is identity on coefficients | Exact; ULift integral coefficients retain universe u. |
| cyclicHomology_power_map | m≠0, j≥1; natural a; identity coefficient morphism | Exact; degree 2j−1 cannot underflow. |
| symmetricGroup_homology_stable | 2i≤n; identity coefficient morphism | Exact; actual last-letter-fixing inclusion. |
| finite_sl2_localized_homology | F:Type u finite field; p prime; CharP F p | Exact; characteristic inverted, coefficients lifted. |
| finite_sl2_integral_homology | Same F,p binders | Exact; seven exceptional cardinalities. |
| finiteBloch_order | Finite F:Type u; 4≤card F | Exact; boundary fixed on every admissible generator; even/odd order formula. |
| blochC_order_six | Field F; IsFormallyReal F | Exact; no LinearOrder or embedding into ℝ silently assumed. |

## Source checks

Line locators below refer to `pdftotext -layout` of the certified copies identified in `packages/K3BlochGroups/sources.toml`; the source ids are those of that manifest. Newly fetched copies of Weibel chapter VI, Mirzaii, Hutchinson 2013, Hutchinson 2024, published CGZ, Goncharov and Marker have SHA-256 values identical to the accepted manifest. No source passage was copied into the roadmap.

- weibel line 91: positive-characteristic algebraically closed integral K-theory, including positive even unique divisibility. weibel line 215: torsion carries the i-th Tate twist, with Bott-Bockstein normalization. These support the repaired §2.2 route; the preceding proof at weibel line 69 explicitly uses the integral field-extension injection.
- weibel line 729: integral Milnor K₃ injectivity; weibel line 1438: indecomposable monomial sequence; weibel line 1484: injective root-cycle detector.
- hutchinson2013 line 674: characteristic-localized H₃ order q²−1. hutchinson2013 line 825: all seven characteristic-primary H₃ exceptions. hutchinson2013 line 1605: odd-field Bloch order, with the even-field branch adjacent to the preceding Lemma 7.1; the accepted Lemma 7.4 and Corollary 7.5 locators are retained.
- marker line 376: quantifier elimination for all real closed ordered fields; marker line 405: completeness; marker line 420: model completeness. These support the full transfer target, including non-Archimedean real closed fields.
- hutchinson2024 line 160: finite Chern comparison for every field and every invertible modulus. Its number-field root-containing corollary is a specialization, not a restriction on this theorem.

The accepted source-access waivers for Suslin 1984, Suslin 1991 and Bloch remain waivers; no copied passage or unverified source attribution is substituted for them. The scanned Goncharov file matches the accepted hash but has no useful text layer. The all-curve vanishing is expressly conditional in the README; the rational-curve theorem is the unconditional target and is kept separate.

## Adversarial mathematics pass

The following rows record instances and values for the definitions, targets, conventions, comparisons and their API equations, in README order. Exact finite-field presentation orders were independently calculated from the integer relation matrices for q=2,3,4,5,7,8,9,11,13; the extended projective relation matrices also distinguish B_old and B_new. Ordered-configuration boundary ranks were recomputed through five letters. The eight-term bar lift was expanded modulo its simultaneous right-diagonal stabilizer at a=2,3,−1,1/2. The seven-row tensor reduction was recomputed in C₂⊕ℤa⊕ℤ(1−a), retaining every diagonal and mixed two-torsion coordinate. All rank-three rotation sums were checked over the listed finite fields. Rogers values were independently evaluated from the interval dilogarithm series as a numerical consistency check. These are instance checks and source-supported structural calculations, not proofs of the admitted general theorems.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Unital rings and the zero ring | A=0,ℤ | 1=0 at A=0; St(0)=E(0)=1; St(ℤ)≠1 | Nontriviality is not imposed on rings | Retained |
| Nontrivial fields | 𝔽₂ and the zero ring | ∣𝔽₂∣=2; 0=1 in the zero ring excludes Field | q=1 cannot enter finite-field formulas | Retained |
| Trivial integral coefficients | G=1 and S₃ | H₀=ℤ in both cases; H₁(S₃)=ℤ/2 | Does not mean a trivial group | Retained |
| Universe transport | 𝔽₂ and ULift 𝔽₂ | Both cardinalities 2; q²−1=3 | Coefficient lifts change no order | Retained explicit ULift binders |
| Antisymmetry convention | A=ℤ and ℤ² | 1∧1 has order 2; e₁∧e₂=−e₂∧e₁ | Alternation is stronger | Retained |
| Negative-unit convention | 𝔽₃ and 𝔽₅ | Q_neg has orders 2 and 1; exterior square is 0 in both | Negation is multiplication by −1 | Retained |
| Cross-ratio direction | (0,∞,1,3),(∞,0,1,3) | cr=3,1/3; supplier=1/3,3 | Reciprocal adapter required | Retained |
| Boundary direction | [3] over ℚ | (v₂,v₃) pairing of 3∧(−2)=−1; reversed value +1 | Sign determined | Retained |
| Indecomposable convention | ℚ | K₃=ℤ/48, Milnor image={0,24}, quotient=ℤ/24; torsion-free quotient=0 | Quotient is by the Milnor image | Retained |
| Weight-two convention | C₇, power 2 | 2²=4 mod 7, not 2 | Ordinary root action fails | Retained |
| Tensor of divisible roots | μ=ℚ/ℤ | μ⊗μ=0; Tor₁(μ,μ) has nonzero elements of order 5 | Tate twist is Tor | Retained |
| Coefficient quotients | ℚ, n=5 | K₃/5=0, but {2,−31} has residue 2 of order 5 | Finite-coefficient K-theory is larger | Retained |
| 1.1 Steinberg plus space | A=0,ℤ | π₁,π₂ of St⁺ are 0; at ℤ, π₂(BE⁺)=ℤ/2 | Two-connected model distinguished | Retained |
| 1.1 plus inclusion | St(ℤ) | π₁ before plus is St(ℤ)≠1; after plus 1 | Trivial-subgroup plus fails | Retained |
| 1.1 comparison q in degrees ≥3 | A=ℤ, degree 3 | π₃(BSt⁺)=K₃(ℤ)=ℤ/48 | Not Hurewicz for BGL⁺ | Retained |
| 1.1 cover factorization | A=ℚ | π₁(BGL⁺)=ℚ×; π₁(BSt⁺)=1 | Base component and cover retained | Retained |
| 1.1 functoriality | Identity on zero ring | 0↦0 for identity and its square | Based maps compose on induced groups | Retained |
| 1.2 canonical comparison composite | All carriers ℤ/5, q=×2, others id | c(1)=3; unreversed q gives 2 | Composition direction discriminated | Retained |
| 1.2 inverse composite | Same ℤ/5 model | c⁻¹(3)=1; c(c⁻¹(3))=3 | Both inverses tested | Retained |
| 1.2 additivity and zero kernel | Same ℤ/5 model | c(1+1)=1=c(1)+c(1); ker={0} | Zero map excluded | Retained |
| 1.3 cycle evaluation | G=1 | Nonzero chain [1,1,1] has d₃=0 and evaluation 0 | Evaluation on cycles not injective | Retained |
| 1.3 finite boundary witness | G=1 | 1−1+1−1+1=1; d₄[1,1,1,1]=[1,1,1] | Unnormalized chains retain units | Retained |
| 1.3 noncycle exclusion | g≠1 in S₃ | Boundary coefficients at (1,1),(g,1) are 1,−1 | Not every finite chain is a cycle | Retained |
| 1.3 equality iff boundary | [1,1,1] and 0 | Difference d₄[1,1,1,1]; both values 0 | Equality in homology differs from chain equality | Retained |
| 1.3 scalar linearity | Twice the identity triple | d₄(2[1,1,1,1])=2[1,1,1]; evaluation 0=2·0 | Witness scales integrally | Retained |
| 1.4 tuplewise naturality | ℤ→ℚ, identity entries | Each of the five d₄ coefficients remains 1,−1,1,−1,1 | Finite support and boundary agree | Retained |
| 1.4 identity and composition | Two coefficientwise inclusions | [1,1,1,1] maps to itself by either route | Transport is strict on chains | Retained |
| 1.4 finite-stage existence | Zero ring, every rank | Group 1; degree-three homology 0 at every stage | No finite-stage superperfectness inferred | Retained |
| 1.4 finite-stage equality witness | Identity quadruple at any rank | Boundary is the identity triple already at that rank | Witness, not finite-stage injectivity, is used | Retained |
| 1.5 lifted multiplication | Identity cover of K(ℤ,2) | Projected product (a,b)↦a+b; at (0,0) value 0 | Unit lift fixed | Retained |
| 1.5 unit homotopies | Contractible zero-ring cover | One map and one product value | No associativity assumption added | Retained |
| 1.5 wedge homotopy | 0,1,2 spheres | π₃ ranks 0,1,3 | Mixed Whitehead generator necessary | Retained |
| 1.5 Hopf sum formula | Two sphere inclusions | Coordinates of (ι₁+ι₂)η=(1,1,1) | Mixed coefficient +1 | Retained |
| 1.5 Hopf additivity on H-spaces | K(ℤ,2), K(ℤ,3) | π₃=0 in first; π₂=0 in second; Whitehead image 0 | H-space hypothesis retained | Retained |
| 1.5 Hopf–Hurewicz exactness | K(ℤ,2), K(ℤ,3) | 0→0 in first; π₃→H₃ is ℤ→ℤ identity in second | Surjectivity and kernel distinguished | Retained |
| 1.5 sphere-unit normalization | Transposition over ℤ,𝔽₂ | Determinants −1,+1 | Minus-one scalar fixed | Retained |
| 1.5 elementary homology exactness | A=ℤ | ℤ/48→ℤ/24, kernel {0,24} | Not an isomorphism or split quotient | Retained |
| 1.5 characteristic-two product | A=𝔽₂ | −1=1, K₁ class 0, minus-one product 0 | No inverted prime assumption | Retained |
| 2.1 supplied Milnor comparison | Finite field and ℚ | Source 0 for finite fields; {−1,−1,−1} has image 24 mod 48 over ℚ | Comparison owned by K2SymbolsBrauer §8.4 | Deleted repeated supplied API |
| 2.1 indecomposable quotient definition | ℚ | 48/2=24 | Torsion survives in quotient | Retained |
| 2.1 kernel and quotient surjection | ℤ/48→ℤ/24 | 0 and 24 map to 0; 1 maps to 1 | Image and kernel exact | Retained |
| 2.1 quotient universal property | ℤ/48→ℤ/24→ℤ/6 | 1↦1↦1 and 24↦0↦0 | Factorization kills the Milnor image | Retained |
| 2.1 quotient field maps | 𝔽₂→𝔽₄ | Groups have orders 3 and 15; source Milnor groups 0 | Canonical quotient maps are identities under transport | Retained |
| 2.2 Milnor injection | ℚ,𝔽₅ | ℤ/2→ℤ/48 sends 1↦24≠0; 0→ℤ/24 injective | Integral, not rational, assertion | Retained |
| 2.2 Chern diagonal multiplier | Degrees 1,2,3 | (+1,−1,+2); iterated residue of degree-three symbol is 2 | Zero and sign reversal give 0 and −2 | Retained |
| 2.2 motivic edge cokernel | ℚ | K₃/im m₃ has order 24; H¹ weight-two edge has same quotient | Milnor injectivity is not needed for cokernel factorization | Retained |
| 2.2 kernel killed by two | ℚ model | 2·0=0; injective Milnor comparison has kernel 0 | Does not imply divisibility kills torsion | Retained |
| 2.2 characteristic-p torsion input | 𝔽₂(t₁,t₂,t₃) | Iterated residue {t₁,t₂,t₃}↦1 in ℤ; 2·1=2≠0 | Prüfer 2-group has 2·(1/2)=0 and is a negative control | Retained supplier theorem |
| 2.2 degree-zero coefficient exception | Ω=𝔽̄₂ | K₀/2=ℤ/2; positive defining-characteristic coefficient groups 0 | Degree zero cannot be discarded | Retained |
| 2.2 weight-two mod-two vanishing | Ω=𝔽̄₃ | K₄=0, H⁰(Ω,ℤ(2))/2=0; injection to ℤ/2 has image 0 | Algebraic-closure argument uses divisibility | Retained |
| 2.2 K₄ all-prime divisibility | Ω=𝔽̄₂, r=2,5 | K₄=0 in both cases; ×r:0→0 onto | Characteristic prime retained | Replaced absent torsion assumption by integral-injection square |
| 2.2 positive-characteristic Bockstein | Ω=𝔽̄₂, m=5 | K₄(Ω;ℤ/5)=ℤ/5→K₃(Ω)[5]=ℤ/5; 1↦1 in Bott coordinates | Construct torsion comparison after divisibility | Added explicit target and normalization |
| 2.2 order-three Frobenius witness | Ω=𝔽̄₂,m=3 | Bockstein C₃→C₃; Frobenius 2²=1 mod 3, untwisted multiplier 2 | Weight-two normalization nontrivial | Added Check |
| 2.2 torsion automorphism compatibility | m=5, a=2 | Bott square changes by 4; 1↦4 mod 5 | Untwisted 1↦2 excluded | Added explicit target |
| 2.2 algebraically closed Milnor unique divisibility | Degrees 0,1,≥2 | K₀=ℤ not divisible; K₁ has roots of order 2 or 3; K₂ over 𝔽̄p=0 | No extension to K₀ or K₁ | Consumed supplied theorem |
| 2.3 real signature basis | ℚ and two real places | b has coordinate 1; δ_v=(1,0), δ_w=(0,1) | One all-negative symbol cannot represent both basis vectors | Retained |
| 2.3 sign-isolating units | Two real places | Signs of u_v=(-,+); symbol {−1,−1,u_v} gives (1,0) | Choice of unit does not alter basis class | Retained |
| 2.3 minus-one surjection | ℚ | {−1,−1} multiplied by {−1} gives nonzero order-two triple | Image equals all Milnor K₃ for number fields | Retained |
| 2.3 decomposable subgroup | ℚ,ℚ(i) | D has orders 2,1; 2d=0 | Not all torsion: K₃(ℚ) has order 48 | Retained |
| 2.3 signature restriction | A real place that becomes complex | That coordinate restricts to the empty sum 0 | Places restricting to v determine pullback | Retained |
| 2.4 stable special-linear quotient | ℚ | K₃→H₃(SL∞) is 48→24, 1↦1,24↦0 | SL∞ distinguished from SL₂ | Retained |
| 2.4 totally imaginary quotient equivalence | ℚ(i) | ℤ⊕ℤ/24 maps identically to its indecomposable quotient | Both rank-one and order-24 classes survive | Retained |
| 2.4 finite-field stable comparison | 𝔽₅ | K₂=0; K₃ and H₃(SL∞) have order 24; P has order 6 | Pre-Bloch group is a different carrier | Retained |
| 2.5 rational quotient | ℚ,ℚ(i) | Rational dimensions 0,1 on both K₃ and K₃^ind; D⊗ℚ=0 | Only number-field Milnor group is erased | Retained |
| 3.1 antisymSquare definition | ℤ,ℤ/2,ℤ/3 | Cokernel of ×2 is ℤ/2,ℤ/2,0 | Tensor square or exterior square gives wrong values | Retained |
| 3.1 diagonal additivity | A=ℤ², a=e₁,b=e₂ | (a+b)² has coordinates (1,1,0); cross terms cancel | Diagonal map is additive, not generally R-linear | Retained |
| 3.1 bilinear universal property | A=ℤ, target ℤ/2 | (a,b)↦ab mod 2 sends (1,1)↦1 | Nonzero diagonal permitted | Retained |
| 3.1 functoriality | ×3 on A=ℤ | Diagonal generator maps by 9≡1 mod 2 | Identity and composite scalar actions agree | Retained |
| 3.1 exterior projection exactness | A=0,ℤ² | Kernel 0 at A=0; at ℤ² kernel (ℤ/2)² and projection (a,b,c)↦c | Mixed e₁∧e₂ maps to +1 | Retained headline |
| 3.1 diagonal equality criterion | A=ℤ | 1∧1=3∧3=1; 1∧1≠2∧2=0 | Differences 2 and −1 discriminate A/2A | Retained headline |
| 3.1 eigenspace comparison | R=M=ℚ and ℤ | ℚ: both spaces 0; ℤ: cokernel ℤ/2, eigenspace 0 | Invertibility of two retained | Retained |
| 3.1 direct-sum decomposition | ℤ×ℤ | Diagonal coordinates (ℤ/2)² and mixed ℤ | A missing mixed summand loses e₁∧e₂ | Retained |
| 3.2 projective cross-ratio definition | (0,∞,1,2) translated by +1 | cr(1,∞,2,3)=2 | Translation invariance computed | Retained adapter |
| 3.2 orbit and stabilizer | 𝔽₃ projective line | Four points; every ordered quadruple cross-ratio −1; scalar stabilizer has order 2 | Centre differs from determinant-one torus | Retained |
| 3.2 deleted-face values | x=2,y=3 over ℚ | 1/2,3/4,3/2,3,2 | Signs +,−,+,−,+ recover R(2,3) | Retained |
| 3.2 empty-domain case | 𝔽₂ | No injective quadruple; 𝔽₂ minus 0,1 empty | No totalized reciprocal identity used | Retained |
| 3.3 preBlochRawSymbol definition | ℚ at 0,1,2 | 0,[1],[2], last two distinct nonzero basis vectors | Unreduced and reduced symbols differ | Retained Lean definition |
| 3.3 admissibility definition | (2,3),(2,2),(2,1) over ℚ | true,false,false; y=1 would create denominator 0 | No junk division admitted | Retained |
| 3.3 five-term raw expression | (2,3) over ℚ | [2]−[3]+[3/2]−[3/4]+[1/2] | Every argument ≠0,1 | Retained |
| 3.3 reflection relation | (2,3),(−2,−1) | Difference [2]+[−1]−[3]−[−2] | Universal-class difference fixed | Retained |
| 3.3 four-relation inversion identity | x=2,y=3 | Sum=2([3/2]+[2/3]) | Factor two retained | Retained |
| 3.3 finite-field raw relation | 𝔽₄,ω²+ω+1=0 | R(ω,ω²)=3[ω]−2[ω²] | A coefficient/sign change changes determinant 5 | Retained |
| 3.3 diagonal five-term value | x=y=2 over ℚ | Raw unreduced expression [1]; reduced value 0 | [1] is killed separately | Retained |
| 3.3 finite relation certificate definition | No pairs, k=2 | Evaluation 2[1], not 0 in free group | Empty list does not mean zero | Retained finite-witness mathematics |
| 3.3 certificate evaluation homomorphism | Indicator (2,3) plus its negative | Five coefficients 1,−1,1,−1,1 cancel with their negatives to 0 | Additivity and negatives computed | Retained |
| 3.3 certificate field transport | ℚ→ℝ at (2,3) | Arguments remain 2,3,3/2,3/4,1/2 and integer coefficients unchanged | Identity and composition preserve support images | Retained |
| 3.4 preBloch definition | q=2,3,4,5 | P=0,ℤ,ℤ/5,ℤ/6 | Missing [1] relation gives extra generator at q=3 | Retained Lean definition |
| 3.4 preBlochSymbol definition | 𝔽₅ at 0,1,2,3 | Orders 1,1,3,6 | Zero symbol map fails | Retained Lean definition |
| 3.4 quotient universal property | P(𝔽₅)→ℤ/6 | [3]↦1, [2]↦2, [4]↦0 | Generators determine map | Retained |
| 3.5 boundary construction | 𝔽₅ | [3]↦1 mod 2; [2]↦0 | Boundary is nonzero | Retained |
| 3.5 Bloch kernel definition | 𝔽₅ | Kernel {0,2,4} in P=ℤ/6 | [3] is rejected | Retained |
| 3.5 inversion boundary | 𝔽₅,x=2 | ∂([2]+[3])=1 mod 2 | Inversion symbol need not be Bloch | Retained |
| 3.5 complement boundary | ℚ,x=2 | 2∧(−1)+(−1)∧2=0 | Boundary order and antisymmetry agree | Retained |
| 3.5 Matsumoto cokernel exactness | 𝔽₅ | P order 6→Q_s order 2 is onto; K₂=0 | Cokernel 0, kernel order 3 | Retained |
| 3.6 universal c definition | q=4,5,7,11 | Orders 1,3,2,6 | All four divisibility patterns occur | Retained |
| 3.6 inversion homomorphism h | 𝔽₅ |  h(2)=[2]+[3]=3[3], order 2; ∂h(2)≠0 | Codomain P, not B | Retained |
| 3.6 square vanishing of h | 𝔽₅,x=4 |  h(4)=2[4]=0 | Square condition matters | Retained |
| 3.6 relation 3c=h(−1) | 𝔽₁₁ | c order 6; 3c has order 2 and equals h(−1) | 6c=0 but 3c≠0 | Retained |
| 3.6 characteristic-two torsion | 𝔽₄,ω | ω³=1,ω≠1; c=0 | Order-three root, not order six | Retained |
| 3.6 sixth-root torsion | 𝔽₇,ζ=3 | ζ²−ζ+1=0; c order 2 | 2c=0 does not imply c=0 | Retained |
| 3.7 small fields | 𝔽₂,𝔽₃ | B=0,2ℤ; 2h(−1)=4[−1]≠0 in P(𝔽₃) | Size hypothesis ≥4 necessary | Retained |
| 3.8 exterior-kernel definition | 𝔽₅,𝔽₃ | B̃=P=ℤ/6,ℤ; B=ℤ/3,2ℤ | Exterior kernel can be larger | Retained |
| 3.8 square-class exact discrepancy | 𝔽₅ | B̃/B has order 2; F×/F×² has order 2; K₂=0 | Both directions of quotient description checked | Retained |
| 3.8 divisible-unit case | ℂ | ℂ×/ℂ×²=0, so diagonal kernel 0 and B̃=B | Not inferred for ℚ | Retained |
| 3.8 inversion exterior obstruction | ℚ,x=2 | Sign/valuation pairing of 2∧(−1)=1 mod 2 |  h(2) outside B̃ | Retained |
| 3.9 raw lecture kernel | q=2,3 | A₀=0,ℤ; λ=0,reduction mod 2; kernels 0,2ℤ | Kernel is taken before five-term quotient | Retained |
| 3.9 raw relation not a cycle | 𝔽₅,R(2,3) | R=[4]; λ[4] has order 2 | Cannot descend λ to P | Retained |
| 3.9 lecture comparison μ | 𝔽₅ | 4[3]↦2c≠0; 2[4]↦0 | Map has nontrivial image and kernel | Retained |
| 3.9 μ_rel injection | 𝔽₅ | 2[4] is in K_raw and becomes 0 after quotient | Infinite free-cycle kernel is removed | Retained |
| 3.9 rational raw noninjectivity | ℚ | 4[−1] has infinite free order and maps to 0 | μ⊗ℚ not injective | Retained |
| 3.10 obstruction definition | 𝔽₃ | S=0, E=L=0; μ:2ℤ→2ℤ identity | Obstruction quotient 0 | Retained |
| 3.10 obstruction six-annihilator | 𝔽₅, α=2[3] | σα=α, deg α=2, γ=4[4], μγ=0=6c | Formula includes the correction term | Retained |
| 3.10 nonzero lecture lift | 𝔽₅, α=4[3] | λ α=0; μ α=2c of order 3 | Surjectivity differs from injectivity | Retained |
| 3.11 generic configuration presentation | q=2,3,5 | G_gen=0,ℤ,ℤ/6; boundary kernels 0,ℤ,ℤ/3 | Presentation not identified with kernel | Retained |
| 3.11 negative boundary comparison | ℚ,[3] | Valuation pairing −1 for ∂, +1 for δ_gen | Identity-on-symbols equivalence keeps sign reversal | Retained |
| 3.12 all-curve quotient definition | 𝔽₃ | P⊗ℚ=ℚ, inversion gives 2[−1]=0, so G_curv=0 | Rational kernel nonzero | Retained conditional boundary |
| 3.12 local specialization lemma | O=ℚ[[π]], f=π,π⁻¹,2 | Specializations 0,∞,2; first two boundaries 0 | Zeros and poles distinguished | Retained |
| 3.12 boundary descent sign | ℚ,[3] | δ_curv pairing +1; Suslin boundary −1 | Nonzero test rules out zero boundary | Retained |
| 3.12 torsion-unit cycle | ℂ,i |  i has order 4; i tensored with uniquely divisible quotient vanishes rationally; δ_curv[i]=0 | Uses multiplicative units | Retained |
| 3.12 class(1) relation | [t]+[1−t] on P¹ | sp₀ gives [0]+[1], sp∞ gives 2[∞]; quotient kills [1] | Degenerate generators matter | Retained |
| 3.12 all-curve conjectural equality | 𝔽₃ | K_curv=ℚ≠0 | Cannot export unconditional all-field equality | Retained as boundary, not a headline |
| 3.13 older projective group definition | q=2,5,11 | B_old orders 3,3,6; orders of [0] 3,3,3 | Intersection repair essential | Retained |
| 3.13 invalid exterior relation | ℚ, ξ₂,₁ | Boundary 2∧(−1) has sign/valuation value 1 mod 2 | Extended relation subgroup is not contained in exterior cycles | Retained |
| 3.13 older comparison κ | 𝔽₁₁ | ℤ/6→ℤ/6, c↦[0] of order 3; kernel and cokernel order 2 | Same group orders do not imply isomorphism | Retained |
| 3.14 negative-unit quotient | 𝔽₅ | T=ℤ/4; g⊗(−g)=3 generator, quotient 0 | Different from Q_s=ℤ/2 | Retained |
| 3.14 Q_neg versus exterior | 𝔽₃ | Q_neg=ℤ/2, exterior=0 | No projection identifying these carriers | Retained |
| 3.14 kernel ∂H | 𝔽₅ |  h(2) boundary generates Q_s=ℤ/2 | Ker p_neg is entire Q_s | Retained |
| 3.15 published projective boundary | ℚ, ξ₂,₁ | Q_neg boundary 0; exterior boundary detected by 1 mod 2 | No intersection repair needed for this target | Retained |
| 3.15 published Bloch kernel | q=2,3,11 | B_new orders 3,1,3 | Unrestricted small-field comparison false | Retained |
| 3.15 B_new=(B+H)/H | 𝔽₇ | B order 4, B∩H order 2, quotient order 2 | Not B_old of order 4 | Retained |
| 3.16 κ_new surjectivity | q=5,7,11 | Map orders 3→3,4→2,6→3; kernels 1,2,2 | Surjective with exponent-two kernel | Retained |
| 3.16 inclusion B_new→B_old | 𝔽₇,𝔽₁₁ | 2↪4 and 3↪6, both index 2 | Injection, not an isomorphism | Retained |
| 3.16 localization comparison | 𝔽₁₁, modulus 3 | B/3=B_new/3=B_old/3=ℤ/3 | 2-primary discrepancy disappears | Retained |
| 3.16 lecture coefficient comparison | 𝔽₅, modulus 5 | B/5=0; six acts invertibly mod 5 | Coprimality to six retained | Retained |
| 3.16 extra relation [0]=0 | 𝔽₁₁ | B_new=ℤ/3 generated by [0]; extra quotient 0, kernel B=ℤ/6 | Effect differs from generic configuration presentation | Retained |
| 4.0 ordered configuration definition | ∣X∣=3 | Ranks C₀,C₁,C₂=3,6,6, rather than 3,3,1 | Order and distinctness both essential | Retained |
| 4.0 alternating differential | (x,y,z) | d₁d₂=0; unsigned deletion yields coefficient 2 at each vertex | Sign convention discriminated | Retained |
| 4.0 augmentation | (x,y) | d(x,y)=(y)−(x); augmentation 1−1=0 | Singleton value is 1 | Retained |
| 4.0 infinite exactness | Finite two-letter control | H₁=ℤ on (x,y)+(y,x), so finite acyclicity false | Infinite hypothesis retained | Retained |
| 4.0 finite exactness | m=0,1,2,3,4,5 | Top augmented ranks 1,0,1,2,9,44; all lower ranks 0 | Empty augmentation kept | Retained |
| 4.0 five-letter comparison range | m=5 | Ranks 1,5,20,60,120,120; boundary ranks 1,4,16,44,76 | H₁,H₂,H₃=0, top H₄ rank 44 | Retained |
| 4.1 total differential | Commuting square with both differentials 1 | D² coefficient (−1)^p+(−1)^(p−1)=0 | Anticommutation sign fixed | Retained |
| 4.1 hyperhomology definition | G=1, C=0 and C=ℤ[0] | Homology 0 and ℤ in degree zero | Generic construction, not free Prop | Retained |
| 4.1 augmentation comparison | G=1, X={x,y} | H₁(G,C)=ℤ, but H₁(G,ℤ)=0 | Acyclicity needed | Retained |
| 4.1 Shapiro stabilizers | GL₂(𝔽₅), pair and triple | Pair torus order 16, triple centre order 4 | Different stabilizer carriers | Retained |
| 4.2 independent-frame complex |  n=0,m=1 | Only degree zero ℤ; no projected nonzero vector | Lower block does not create frames | Retained |
| 4.2 independence restriction |  e₁,2e₁ in ℚ² | Rank 1, so no degree-two generator | Distinctness is insufficient | Retained |
| 4.2 frame boundary | (e₁,e₂) | d=(e₂)−(e₁), then augmentation 1−1=0 | Alternating order retained | Retained |
| 4.2 lower-block action |  n=m=1, shear u=1 | (1,0)↦(1,1) | Trivial lower-coordinate action excluded | Retained |
| 4.2 top-only frame homology |  n=1,m=0, ℚ | (2)−(1) is a nonzero cycle; degree-two chains 0 | Top homology not discarded | Retained |
| 4.3 scalar acyclicity | F=ℚ,V=ℚ,k=ℚ,j=1 | H₁(V,k)=ℚ; scalar 2 minus identity is ×1, so coinvariants 0 | Coefficient module itself nonzero | Retained |
| 4.3 affine-stabilizer comparison | M=0, G₁=G₂=ℚ× | Block group equals diagonal product; map identity | Contains scalar matrices; no finite-field assertion | Retained |
| 4.4 top-frame coinvariants |  n=0,1,2 | S₀=ℤ,S₁=F×,S₂=K₂ᴹ⊕ℤ | Not uniformly Milnor K-theory | Retained |
| 4.4 frame generators |  n=1,a=1,2 over ℚ | ⟨1⟩↦1 multiplicatively (0 additively); ⟨2⟩↦2≠1 | Zero generator distinguished | Retained |
| 4.4 ordered product | ⟨a⟩·⟨b⟩ | Four S₂ terms have integer coordinates 1−1−1+1=0; Milnor coordinate {a,b} | Naive product ⟨a,b⟩ would have integer coordinate 1 | Retained |
| 4.4 e multiplication and unit | S₀→S₂ | 1↦e=(0,1); multiplying by S₀ unit preserves e | Extra ℤ summand visible | Retained |
| 4.5 connecting map δ₁ | [2] over ℚ | δ₁[2]=⟨2⟩, corresponding to multiplicative unit 2 | Sign-normalized connecting map | Retained |
| 4.5 δ₃ lower-rank vanishing | Any stabilized H₃(GL₂) class | δ₃ image 0 in S₃ | Lower-rank image is excluded from quotient | Retained |
| 4.5 ordered Milnor retraction | ℚ(t₁,t₂,t₃) | {t₁,t₂,t₃} has iterated residue +1; swapped order −1 | Coefficient +1 fixed | Retained |
| 4.5 θ₁ | F=ℚ | H₁(GL₀)=0, quotient H₁(GL₁)=ℚ×; 2↦2 | Initial induction case nonzero | Retained |
| 4.5 θ₂ Steinberg relation |  a=2,1−a=−1 | {2,−1}=0; ordered torus class vanishes modulo H₂(GL₁) | Relation uses both nonzero units | Retained |
| 4.5 unstable symplectic symbols |  b=1, a=2 | Coinvariants force s(2,−1)=0 from s(a,1−a) | Steinberg relation not assumed from stability | Retained owned presentation |
| 4.5 conjugation action formula |  c=1 | 1·s(a,b)=s(a,b)−s(a,1)=s(a,b) | Action identity normalized | Retained |
| 4.5 real nonzero Milnor class | ℝ, {−1,−1,−1} | Order 2; multiplying normalization by 2 gives 0 | Integral section distinguished | Retained |
| 4.6 frame algebra splitting | S₂ over ℚ | ⟨1,1⟩↦(0,1), its Milnor retraction 0 | Kernel of retraction contains e | Retained |
| 4.6 e injectivity | S₀=ℤ→S₂ | k↦(0,k), kernel 0 | Stability follows simultaneous induction | Retained |
| 4.7 diagonal and monomial groups |  n=1, F=𝔽₃ | T₁=M₁=GL₁=C₂ | No permutation factor in rank one | Retained |
| 4.7 semidirect product |  n=2,F=𝔽₃ | ∣T₂∣=4, ∣Σ₂∣=2, ∣M₂∣=8; ∣GL₂∣=48 | Monomial group is proper and nonabelian | Retained |
| 4.7 characteristic-two monomial group |  n=2,F=𝔽₂ | T₂=1,M₂=C₂, order 2 | Diagonal group may be trivial | Retained |
| 4.8 generalLinearStabilization definition |  n=0,1; scalar 2 over ℚ | Empty unit→(1); 2→diag(2,1), inverse diag(1/2,1) | Last block must be 1 | Retained Lean definition |
| 4.8 homological GL stability |  n=i=1, F=ℚ | H₁ identifies via determinant with ℚ×→ℚ× identity, 2↦2 | Actual inclusion and identity coefficients | Retained headline |
| 4.8 GL stability boundary |  n=0,i=0 and i=1 | H₀ ℤ→ℤ iso; H₁ 0→ℚ× misses 2 | Range i≤n necessary | Retained headline |
| 4.8 frame d¹ parity |  q=1,2 | Alternating face sums 1 and 1−1=0 | Stabilization versus zero distinguished | Retained |
| 4.8 degree-three quotient | Ordered three-unit product | Retraction gives {a,b,c}, coefficient 1 | No factorial or ψ normalization change | Retained |
| 4.10 projective coinvariants | 𝔽₂,𝔽₃ | H₃=0,ℤ on [−1]; C₃ absent at q=2 and C₄ absent at q=3 | Any-field statement retained | Retained |
| 4.11 Borel homology comparison | F infinite, radical 0 control | T₂=B₂ in zero-radical control; induced homology identity | Scalar hypothesis for actual Borel retained | Retained |
| 4.11 first differential convention | (∞,0) | Boundary (0)−(∞), so 1−swap | Ordering pins sign | Retained |
| 4.11 mixed Künneth swap |  a⊗b | Swap gives −b⊗a; two swaps give a⊗b | Integral diagonal 2-torsion retained | Retained |
| 4.11 face matrices |  a=2,3 | Determinants (−1,−2,2),(−2,−6,3) | All nonzero; at a=0 or 1 one vanishes | Retained |
| 4.11 eight-term chain lift |  a=2,3,−1,1/2 | Expanded boundary has 6 terms; difference from specified six-term chain has 0 coefficients | Chain equality tested before homology | Retained |
| 4.11 seven-row Shapiro reduction | U=C₂⊕ℤa⊕ℤb | Raw exterior vector (0,0,1), tensor vector (0,0,0,0,0,−1) | Equals (a∧b,−a⊗b) | Retained |
| 4.11 total differential sign |  a=3 over ℚ | Raw d³ pair has valuation values (1,−1) | Negative of the uncorrected lift | Retained |
| 4.11 changed splitting | (v,t)=(1,−1) | (v+alt(t),t)=(0,−1); inverse returns (1,−1) | Projection is not an equivalence | Retained |
| 4.11 determinant-one torus coefficient | Raw (2,−2) | Shear gives (0,−2) | Coefficient −2 used again in finite refinement | Retained |
| 4.12 rank-two Bloch edge | ℚ,c | c has order 6 and lies in image; [2] has nonzero boundary | Codomain B is a proper subgroup of P | Strengthened first Check |
| 4.12 monomial kernel | Diagonal torus image | ψ image 0; nonzero c remains outside kernel | Does not say ψ itself zero | Retained |
| 4.12 infinite-field restriction | 𝔽₄ control | H₂(GL₂)=ℤ/2, while exterior units plus K₂=0 | All-field H₂ formula false | Retained |
| 4.13 general-position definition | Three collinear points in ℙ² | Determinant 0 excludes tuple; three coordinate points determinant 1 includes it | Not all injective tuples | Retained |
| 4.13 finite general-position failure | ℙ²(𝔽₂) | Maximum arc size 4, GP_n=0 for n≥4 | Infinite-field acyclicity not applied | Retained |
| 4.13 rotations | (x,y,z) | t³=id; t(x,y,z)=(z,x,y) | Right-rotation convention fixed | Retained |
| 4.13 omitted-last-face complex | (x,y), m=3,4 |  dᵃ(x,y)=(y); top ranks 3,8 for finite m=3,4 | Cannot assume finite acyclicity | Retained |
| 4.13 cyclic norm chain map | (x,y,z) | N=1+t+t²; dᵃN=Nd | Alternating powers 1−t+t² fail | Retained |
| 4.13 cone sign | D₁ pair (x,y) | d first component dᵃx−Ny; d² first component −dᵃNy+Ndy=0 | Minus sign necessary | Retained |
| 4.14 ψ′ on five-tuples | q=4,5,7,11,13 | Rotation sum equals 2c for all 2,6,20,72,110 admissible pairs | Forces ψ′(P)=−2c | Retained |
| 4.14 chain map to pre-Bloch | [2;x] over ℚ | ψ′=[2] with boundary 2∧(−1)≠0 | Only induced homology map lands in B | Retained |
| 4.14 rank compatibility | (0,∞,1,3) | Both rank-two and rank-three symbol assignments give [3] | Opposite convention would give [1/3] | Retained |
| 4.14 torus vanishing | Ordered diagonal product | Milnor quotient coordinates possible nonzero; ψ-image 0 | K₃^ind quotient, not all GL homology | Retained |
| 4.15 quadratic symbol identity | 𝔽₅,x=2 | [4]=0; right side 2([2]+[3]+[4])=6[3]=0 | Excluded x=0,±1 not used | Retained |
| 4.15 corrected four-symbol identity | 𝔽₅,x=2 | Left side [4]+2[2]−2[1]−[1]=4[3]=2c | Formula differs from printed exercise | Retained |
| 4.15 permutation-image subgroup | ℚ | c order 6; 2c order 3 | Cannot replace image by ⟨c⟩ | Retained |
| 4.15 monomial exact sequence | F=ℚ, element in Σ∞ factor | Pair (ι_*x,x) maps to ψι_*x−ψι_*x=0 | Minus sign fixes complex | Retained |
| 4.15 mixed Tor control | C₃×C₃ | Tor₁(C₃,C₃)=C₃≠0; diagonal torus image under ψ=0 | Tor term retained, not discarded | Retained |
| 4.15 Sylow change of basis | Γ over ℤ | Det Γ=1; three conjugates have exact blocks displayed in README | Valid also mod 2 | Retained |
| 4.15 off-block entry | Γ⁻¹P₁₂Γ | Entry (2,3)=1; lower-right diag(−1,1) | Entry remains 1 mod 2 | Retained |
| 4.15 lower-right swap | Γ⁻¹P₁₃P₂₄Γ | Lower-right matrix [[0,1],[1,0]] | Levi not T₄ | Retained |
| 4.15 cyclicHomology_power_map | m=7,a=2,j=2 | Multiplier 2²=4; at a=0 multiplier 0; at a=1 multiplier 1 | j≥1 and m≠0 retained | Retained headline |
| 4.15 cyclic inclusion formula | C₂→C₄ | Generator of H₃ maps to 2 mod 4, order 2 | Different-order inclusion is not power-map formula | Retained |
| 4.15 symmetricGroup_homology_stable | Σ₀→Σ₁, i=0 | ℤ→ℤ identity | Range includes n=i=0 | Retained headline |
| 4.15 symmetric stability boundary | Σ₁→Σ₂ and Σ₂→Σ₃, i=1 | 0→ℤ/2 fails; ℤ/2→ℤ/2 identity passes | Range n≥2i retained | Retained headline |
| 4.15 five-primary permutation contribution | C₅ normalizer power 2 | H₃ multiplier 4; fixed equation 3x=0 mod 5 has only 0 | Stable subgroup 0 | Retained |
| 4.16 monomial indecomposable definition | 𝔽₂ | π₃=ℤ/24; η³=12; quotient order 12 | Products actually divided out | Retained |
| 4.16 stable-unit split quotient | ℤ/24→ℤ/12 | 1↦1; kernel {0,12} | π₃^ind contains unit image ℤ/12 | Retained |
| 4.16 AHSS unit splitting | BG=point | p=0 column=π_*ˢ; collapse and unit compose to id, ν↦ν | Bottom column survives | Retained |
| 4.16 AHSS sphere-module action | G=1, total degree 3 | η·η²=12ν≠0 in ℤ/24 | Abstract stem order alone insufficient | Retained |
| 4.16 free-G-set Barratt–Priddy | G=1, one free orbit | Group completion sends orbit count 1 to 1∈ℤ | Not a finite-set carrier for nontrivial G | Retained |
| 4.16 enhanced monomial sequence | 𝔽₄ | T̃=C₃; π₃^ind=C₃⊕C₁₂, order 36, exponent 12 | Cyclic C₃₆ is a wrong model | Strengthened distinct Check |
| 4.17 δ doubling | F=ℚ, H₃(μ)=ℤ/2 | Tor projection of δ is ×2=0, although detector image nonzero | Projection is not detector | Retained |
| 4.17 cyclic Chern evaluation | Weights +1,−1 mod 5 | First classes u,−u; c₂=−u²=4u² | Negative sign and weight two fixed | Retained |
| 4.18 closure detector definition | F=ℚ | H₃(μ)=ℤ/2 maps nontrivially to second twist | Zero detector excluded | Retained |
| 4.18 cofinal Moore moduli | Order 2 torsion at m=8 | 2 divides 8; −1≡7 mod 8, nonzero | No mod-4 product assertion needed | Retained |
| 4.18 characteristic-two detector | Ω=𝔽̄₂,m=5,2 | Coefficient groups ℤ/5 and 0; power 2 acts by 4 mod 5 | Defining characteristic and prime-to-characteristic branches separated | Retained |
| 4.18 tensor-zero exclusion | μ divisible torsion | μ⊗μ=0, but detector has order-five elements | Ordinary tensor cannot replace Tor | Retained |
| 4.19 enhanced Tor definition | ℚ | T̃ order 4; Tor order 2; μ₂ order 2 | Extension not split | Retained |
| 4.19 root-group model | ℚ,𝔽₅ | μ̃=μ₄,μ₈; orders 4,8 | Not the ordinary roots subgroup | Retained |
| 4.19 squaring in characteristic two | 𝔽₄ | ω↦ω², ω²↦ω; kernel 1 | Isomorphism not identity | Retained |
| 4.19 nonnaturality of abstract root model | ℚ(ζ₃), conjugation | On μ₆: k=−1; on Tor: k²=1 | Untwisted natural identification excluded | Retained |
| 4.19 nonsplit extension | C₄→C₂ | Only element of order 2 maps to 0; no section of quotient | C₂⊕C₂ wrong extension | Retained |
| 4.20 infinite Suslin sequence | ℚ | Orders 4·6=24; ordinary Tor would give 2·6=12≠24 | Enhanced term necessary | Retained |
| 4.20 rational Suslin equivalence | ℚ | Both rational vector spaces 0, torsion term tensor ℚ 0 | Actual map, not chosen cyclic isomorphism | Retained |
| 4.21 K₃^ind rational-function rigidity | 𝔽₂ and 𝔽₃ | K₃^ind orders 3 and 8; Milnor quotient unchanged after adjoining t | Does not require good small-field Bloch behavior | Retained |
| 4.21 signed residue square | {2,t,π} over ℚ(t)((π)) | Last-slot Milnor residue {2,t}; next Quillen boundary 1/2, not 2 | Degree-three sign +1 | Retained |
| 4.21 degree-two parity control | {2,5} at 5 | Milnor residue 2, right-linear Quillen residue 3; 2·3=1 mod 5 | Cannot drop (−1)^(n−1) | Retained |
| 4.21 Bloch rigidity | 𝔽₄→𝔽₄(t) | [ω] has order 5 on both sides | Finite case placed after mixed compatibility | Retained |
| 4.21 rational specialization | R(tx,ty) at t=0 | Arguments 0,0,y/x,y/x,1; result [1] | Not zero before degenerate quotient | Retained |
| 4.21 rational-curve degenerate relation | s=1/(1−t) | sp₁−sp₀ of [s]+[1−s]=2[∞]−[1]−[0] | Forces [1]=0 | Retained |
| 4.21 rational-curve nonrelation | α=[t] alone | Boundary (1−t)∧t nonzero; [t]+[1−t] boundary 0 | Arbitrary specialization differences excluded | Retained |
| 4.21 colliding-pair cancellation | Collision at positions 0,2 | Surviving ratios r,r⁻¹; sum h(r) killed rationally | Integral cancellation would be false in general | Retained |
| 5.1 finite indecomposables | q=2,3,4,5 | Orders q²−1=3,8,15,24; Milnor K₃=0 | Small fields included | Retained |
| 5.1 restriction and transfer | 𝔽₂→𝔽₄, d=2 | Choose res(1)=5 mod 15, tr(1)=1 mod 3; tr∘res(1)=2 mod 3; res∘tr(1)=5 mod 15=(16−1)/(4−1) | Both composites agree with the stated maps | Retained |
| 5.1 finite Frobenius | 𝔽₄ over 𝔽₂ | Multiplier 2²=4; (4)²=1 mod 15 | Weight two retained | Retained |
| 5.1 norm-one matrix | 𝔽₄/𝔽₂,ω | Matrix [[0,1],[1,1]], determinant 1, trace 1 | Nonzero norm-one unit included | Retained |
| 5.1 excluded zero multiplication | u=0 | Matrix 0, determinant 0 | Zero is not a norm-one unit | Retained |
| 5.1 basis-change conjugation | Swap basis (1,ω) | Conjugate matrix [[1,1],[1,0]], determinant 1 | Entries change, map changes by GL₂ conjugation | Retained |
| 5.2 finite_sl2_localized_homology | q=2,3,4,5,7 | Orders 3,8,15,24,48 | Only characteristic inverted | Retained headline |
| 5.2 finite_sl2_integral_homology | q=2,3,4,5,7,8,9,27 | Orders 6,24,30,120,48,126,240,2184 | Exceptional primary factor retained | Retained headline |
| 5.2 Sylow stable elements | S₃, r=3 | Normalizer inversion acts by (−1)²=1 on degree-four cyclic cohomology; stable part C₃ | Nonabelian test included | Retained |
| 5.2 degree-zero stable elements | S₃ and C₃ | H⁰=ℤ_(3) on each; restriction 1↦1 | No torsion-only proof at degree zero | Retained |
| 5.2 finite-group duality | C_m, d=1 and d=0 | H²=C_m dual to H₁=C_m; H¹=0 but H₀=ℤ | d≥1 indispensable | Retained |
| 5.2 quaternion periodic homology | Q₈ | H₁=C₂², H₂=0, H₃=C₈ | Cyclic resolution would give H₁=C₈ | Retained |
| 5.2 period from Sylow | Odd cyclic Sylow with inversion | Normalizer automorphism order 2, period 4; cyclic 2-Sylow period 2 | No uniform period-two substitution | Retained |
| 5.2 subgroup homology injection | C₃≤S₃=SL₂(𝔽₂) | C₃ injects into H₃=C₆ as order-three subgroup | Actual map distinguished from order equality | Retained |
| 5.2 characteristic-primary branch | q=4 and 7 | Primary orders 2 and 1; localized orders 15 and 48 | Exceptional set includes q=4 | Retained |
| 5.2 finite-extension injection | 𝔽₂→𝔽₄ | C₃ injects into C₁₅ with image order 3 | Proof precedes stabilization injectivity | Retained |
| 5.2 GL₂ conjugation triviality | 𝔽₃→𝔽₉ | Every 𝔽₃ unit square in 𝔽₉; inner action upstairs acts as 1 on localized C₈ | Injection descends equality | Retained |
| 5.3 actual stabilization σ | 𝔽₅ | Integral C₁₂₀→C₂₄ kills characteristic-primary subgroup of order 5 | Localization required | Retained |
| 5.3 quadratic-torus factorization | 𝔽₂→𝔽₄, 𝔽₃→𝔽₉ | Equal image orders 3 in C₁₅ and 8 in C₈₀ | Both maps separately injective | Retained |
| 5.3 root-cycle detection | m=3 or 8 | Detected cyclic generator has order 3 or 8 | Nonzero root cycle proves σ injectivity | Retained |
| 5.3 finite σ bijectivity | q=2,3 | Orders source=target 3,8 after injection | Small finite fields retained | Retained |
| 5.3 closure stabilization output | Ω=𝔽̄₂ | Filtered positive even Milnor groups 0; root H₃ prime-to-2 torsion survives | Closure comparison follows finite theorem | Retained |
| 5.4 refined pre-Bloch definition | 𝔽₄ | Square-class group 1, RF=ℤ, λ₁=0, RP=P | Even field control | Retained |
| 5.4 refined boundary λ₁ | 𝔽₅ | λ₁[2]=0, λ₁[3]=2(1−ε)≠0 | Ordinary coefficients lose information | Retained |
| 5.4 refined five-term relation | 𝔽₅,(2,3) | (1−ε)[2]+ε[4]=0 | Square-class factors essential | Retained |
| 5.4 refined cross-ratio | (0,∞,1,ω) over 𝔽₄ | Coefficient square class 1, symbol [ω] | Augmentation recovers same cr | Retained |
| 5.4 bar-comparison normalization | Adjacent repeated entries | Normalized image 0; distinct orbit tuple gives its tuple | Degeneracies handled before symbols | Retained |
| 5.4 bar-comparison orbit hypothesis | Norm-one C₅≤SL₂(𝔽₄) | Orbit size 5 equals ∣P¹∣; no outside y | General comparison required | Retained |
| 5.4 finite comparison range | q=4 | Augmented top degree 5; ordinary H₁,H₂,H₃=0 | Degree-three range includes smallest allowed field | Retained |
| 5.4 quotient ideal Ī | 𝔽₅ | I=ℤ(ε−1), J=2I, Ī=ℤ/2 | Free augmentation ideal is wrong second-page carrier | Retained |
| 5.4 d² square-class formula | a=2 in 𝔽₅ | Product of diagonal lift coordinates a⁻¹=3, same nonsquare class as 2 | Inversion disappears only after square classes | Retained |
| 5.4 determinant-one comparison | Raw coordinates (2,−2) | Changed coordinates (0,−2) | Same shear as §4.11 | Retained |
| 5.4 refined forgetful equivalence | 𝔽₅ | I²/I³≅ℤ/2=Q_s; RB order 3 and B order 3 | RP itself is not asserted equal to P | Retained |
| 5.4 integral λ kernel | q=5,7,4 | 120/3=40,48/4=12,30/5=6 | Integral versus localized domains distinguished | Retained |
| 5.5 finiteBloch_order | q=4,5,7,8,9,11,13 | Orders 5,3,4,9,5,6,7 | Both parities, p=2 and 3 included | Retained headline |
| 5.5 small-field negative controls | q=2,3 | B=0,ℤ; order formula would give 3,2 | Hypothesis q≥4 necessary | Retained headline |
| 5.5 normalized b_F definition | 𝔽₅ | C₂₄→C₃; kernel order 8 | Defined by λ_loc∘σ⁻¹ | Retained |
| 5.5 finite enhanced Tor arrow | q=4,5,7 | T̃ orders 3,8,12; subgroups inject into K₃ orders 15,24,48 | Left map constructed before image comparison | Retained |
| 5.5 odd-characteristic extra factor two | q=5 and 7 | Split torus orders 4,6; full b kernel orders 8,12 | Torus alone misses factor two | Retained |
| 5.5 quaternion β image | q≡1 mod 4 | Image h(square)=0; at 𝔽₅, h(4)=0 | Not inferred solely from cyclic orders | Retained |
| 5.5 C₄ β image | q≡−1 mod 4 | 2h(−1/y²)=0 since h exponent 2 | Extra factor two in kernel | Retained |
| 5.6 odd-coefficient comparison | q=5,n=3 | gcd(3,4)=1; K₃/3=B/3=C₃ | Coprimality visible | Retained |
| 5.6 root-coprimality failure | q=7,n=3 | K₃/3=C₃, B/3=0 | Hypothesis cannot be omitted | Retained |
| 5.6 even-field Cartan comparison | q=4,n=5 | H₃ norm-one=C₅; C₃₀/5=C₅,C₁₅/5=C₅,B/5=C₅ | No odd-q restriction | Retained |
| 5.6 Cartan trace and central unit | 𝔽₄/𝔽₂,ω and 1 | Trace ω+ω⁻¹=1; matrix at 1 is I₂ | Norm and trace conventions agree | Retained |
| 5.7 rational quotient | ℚ | 48→24; image Milnor {0,24}; no additive section | Ambient arithmetic imported | Retained |
| 5.7 Gaussian quotient | ℚ(i) | r₁=0,r₂=1,w₂=24; group ℤ⊕C₂₄; D=0 | Free generator noncanonical | Retained |
| 5.8 real-closed quantifier elimination | ℚ_alg∩ℝ,ℝ,ℚ | ∃x x²=2 true,true,false | Real-closed hypothesis required | Added explicit general target |
| 5.8 real-closed completeness | ℚ_alg∩ℝ and ℝ | ∃x x²+1=0 false in both; true in ℂ | Algebraic closure is a wrong model | Added explicit general target |
| 5.8 real-closed model completeness | Ordered real closed extension, parameter a | Witness a+1 gives x>a in both; x²=t iff t≥0 | Handles parameters, not just rational sentences | Added explicit general target |
| 5.8 formal reality to ordering | ℚ,𝔽₃ | −1 not sum of squares over ℚ; over 𝔽₃,1²+1²=−1 | Formally real condition supplies proper preordering | Added pinned bridge |
| 5.8 Rogers detector definition | x=1/2,2,−1 | ρ/π²=−1/12,+1/12,−1/4 | Piecewise constants fixed | Retained |
| 5.8 real five-term descent | (2,3) | Numerical sum divided by π²=0, using five arguments 2,3,3/2,3/4,1/2 | Independent numerical consistency check | Retained |
| 5.8 finite coefficient-list transfer | No pairs, k=0,1 | k[1]=0 exactly for k=0; [2]−[3] has coefficients 1,−1, not zero | Augmentation equality alone insufficient | Retained |
| 5.8 blochC_order_six | ℚ and arbitrary formally real field via transfer | ρ(c)/π²=−1/6; 2ρ(c)=−1/3,3ρ(c)=−1/2 nonzero mod 1; 6ρ(c)=0 | No real-embedding assumption in Lean | Retained headline |
| 5.8 period negative control | ρ(c) modulo π²/2 | Order 3, versus order 6 modulo π² | Period choice essential | Retained |
| 6.1 five-term witness transport | Indicator (2,3), all n including 0 | Five-term class=0 in P/n; n=0 gives integral P | Zero modulus is not excluded | Retained |
| 6.1 no witness for a noncycle | ℚ,[2] | Boundary sign/valuation coordinate 1 mod 2 | Cannot be five-term evaluation | Retained |
| 6.2 boundary-coordinate definition | ζ=−1,g=2, ξ=[2]+[−1] | Mixed coordinate (0−1)+(1−0)=0; diagonals 0 | Both symbol terms needed | Retained |
| 6.2 negative boundary certificate | Same data, ξ=[2] | Mixed coordinate −1≡1 mod 2 | Rejected, despite exterior loss | Retained |
| 6.2 sixth-root certificate | ℚ(√−3),m=6,ξ=[ω] | Exponents 1,5; diagonal 5≡1 mod 2 | 2[ω] gives 10≡0 and passes | Retained |
| 6.2 direct-summand converse | Subgroup ⟨−1,2⟩≤ℚ× | C₂⊕ℤ is a direct summand; nonzero mixed coordinate stays nonzero | Converse not asserted for arbitrary chosen generators | Retained |
| 6.2 Bloch element from data | ℚ,[2]+[−1] | Boundary 0; output c of order 6 | [2] alone rejected | Retained |
| 6.2 equality of data outputs | Reflected pair (2,3) | Difference is R(2,3)−R(−2,−1), so quotient difference 0 | Five-term equality proves Bloch equality | Retained |
| 6.2 CGZ transport | ℚ,c | c order 6 maps to [0] order 3 | Integral kernel may contain 3c | Retained |
| 6.3 root boundary annihilation | Primitive sixth root ω | ∂[ω] diagonal of order 2; 6∂[ω]=0 | m[ζ] always a cycle; raw symbol may not be | Retained |
| 6.3 sixth-root square criterion | ℚ(√−3),ℚ(ζ₁₂) | −1 nonsquare/square; diagonal class nonzero/zero | Antisymmetric, not exterior, target | Retained |
| 6.3 generic rootMultiple | δ:ℤ→ℤ/2,x=1,m=2 | Kernel element has underlying value 2, not 1 | Proof does not change value | Retained |
| 6.3 rootMultiple scaling | δ reduction, b=2,m=3 | Underlying value 6; m=0 gives 0 | Generic construction handles zero multiplier | Retained |
| 6.4 rootCoefficient definition | δ reduction,x=1,m=2,R=ℤ/5 | Kernel coordinate 3, raw image 2·3=1 mod 5 | Unit denominator explicit | Retained |
| 6.4 independence of annihilator | m=2 and 4 over ℤ/5 | Coordinates 1·3=3 and 2·4=8≡3 | No flatness hypothesis needed | Retained |
| 6.4 nonflat negative control | 2ℤ↪ℤ tensored ℤ/2 | Source C₂→C₂ is zero; source generator nonzero; 2 not invertible | Raw projection does not characterize a tensor class | Retained |
| 6.4 modular root class | ζ=−1,m=2,n=3 | u=2; class 2h(−1)=0 in B/3 | Division only after invertibility | Retained |
| 6.4 localization coefficient compatibility | m=2,n=5 | 1/2 maps to 3 mod 5; m·class maps to original root multiple | Coefficient transport consistent | Retained |
| 6.4 p-adic root class | m=2,p=3 | 2 is a unit in ℤ₃; 2·(1/2)=1; p=2 excluded | No division by a nonunit | Retained |
| 6.5 SuslinLift definition | ℤ/24→ℤ/6, β=1 | Fibre {1,7,13,19} | Nonempty torsor, no preferred origin | Retained |
| 6.5 free transitive action | Kernel elements 0,6,12,18 | Translate 1 to 1,7,13,19 uniquely | Enhanced kernel action distinguished | Retained |
| 6.5 zero fibre | Same reduction, β=0 | Fibre {0,6,12,18}=kernel | Equality of sets in both directions | Retained |
| 6.5 no additive chosen section | Candidate lifts 1,7,13,19 | Sixfold values 6,18,6,18 mod 24, all nonzero | Choice not additive | Retained |
| 6.5 finite bar witness definition | G=1,β=0 | Both chains 0 and [1,1,1] represent zero; chain values differ | Extensionality uses cycles, not homology | Retained |
| 6.5 empty nonzero bar fibre | G=1,β≠0 | H₃=0, so ψ image 0 cannot equal β | Surjectivity hypothesis necessary | Retained |
| 6.5 noncycle exclusion | g≠1 | Boundary [1,1]−[g,1] has coefficients 1,−1 | Missing cycle equation would accept invalid input | Retained |
| 6.5 boundary modification | z=0,w=[1,1,1,1] | New chain [1,1,1], same homology 0 | Witnesses remain distinct | Retained |
| 6.5 lift ambiguity | ℚ | K₃ kernel has order 8; exact factors Milnor order 2 and enhanced Tor order 4 | Ambiguity is not just ordinary roots | Retained |
| 6.6 finite-to-infinite right-arrow compatibility | 𝔽₄→𝔽₄(t) | cr=ω on both sides; [ω²]=4[ω]≠[ω] | Order comparison alone cannot identify arrow | Retained |
| 6.6 mixed composition square | 𝔽₄→𝔽₄(t)→𝔽₄(t)(s) | [ω]↦[ω] by both paths, order 5 | Zero map ruled out | Retained |
| 6.6 combined natural sequence | ℚ | 0→C₄→C₂₄→C₆→0 | Does not split | Retained |
| 6.6 finite Bloch rigidity consequence | 𝔽₄ and 𝔽₄(t) | Both B groups C₅; source [ω] survives | Proof placed after mixed square | Retained |
| 6.6 rational number-field comparison | ℚ,ℚ(i) | Dimensions 0,1; finite Milnor group tensors to 0 | No general-field Milnor vanishing | Retained |
| 6.6 snake sequence | C₄→C₂₄→C₆, n=2 | C₂→C₂→C₂→C₂→C₂→C₂; first map id, second 0, connecting id, next 0, last id | Torsion and tensor quotients both needed | Retained |
| 6.6 odd root-free comparison | ℚ,n=5 | C₂₄/5=C₆/5=0; no primitive fifth root | Induced maps agree | Retained |
| 6.6 root obstruction control | 𝔽₇,n=3 | μ/3=C₃≠0; K₃/3=C₃ but B/3=0 | Root hypothesis necessary | Retained |
| 6.7 finiteChernIndEquiv | ℚ,n=5 | K₃/5=0; K₃(;ℤ/5)≅K₂[5]≠0 | Genuine finite coefficients retained | Retained |
| 6.7 nonzero K₂[5] witness | {2,−31} over ℚ | 5symbol={32,−31}=0; residue 2, powers 2,4,8,16,1 mod 31 | Exact order 5 | Retained |
| 6.7 n=1 boundary | Any field | Coefficient and étale groups 0 | No root choice carries data | Retained |
| 6.7 odd number-field Milnor quotient | ℚ,n=3 | (ℤ/2)/3=0 | Full coefficient group equals indecomposable coefficient quotient | Retained |
| 6.7 even Milnor caution | ℚ,n=2 | (ℤ/2)/2=ℤ/2, not 0 | Odd-coefficient argument does not extend | Retained |
| 6.7 Chern additivity exception | ℝ,m=2,degree 2 | c₂(2β)=1; 2c₂(β)=0 in ℤ/2 | Degree-three additivity remains unrestricted | Retained |

## Unresolved items and limits

No unresolved build, gate, dependency-direction or signature defect remains. The all-curve Goncharov vanishing assertion is conditional mathematical background, as in the accepted package, and is not used to prove the unconditional rational-curve theorem. The audit is an author-side port and mathematics pass performed with Codex (GPT-6), not a new independent approval of the package.

External ownership coordination remains for the worker: ColemanIntegration §L2.Fb should consume this earlier roadmap's general integral carriers instead of independently owning them. Its analytic descent and coordinate adapters remain distinct. The supplied scope and folder restriction does not authorize editing that roadmap here. The accepted primary-source waivers and scanned-source limitation described above are unchanged.

Final repository status: clean. The committed diff contains exactly the three target-folder files. No Lean build or other job remains running.


Pull request: #1430 (roadmap/k3-bloch-groups at 7e41dae)
