# Review of K3BlochGroups (pull request #1430 at 12c408e)

**Verdict:** needs changes

## R01 (P2) — Reconcile the retained supplier gaps with local ownership

**Location:** `TauCetiRoadmap/K3BlochGroups/README.md:23`, :409 and :1980; `packages/K3BlochGroups/design/plan.json:4` and :10. The README says “The normalized positive-characteristic integral K₃-torsion comparison is a consequence proved in §2.2” and assigns general real-closed-field transfer to §5.8.

**Claim:** Both results are still requested from external suppliers in the plan, while the README explicitly constructs them locally. Neither gap slug occurs in the README's Exact supplier contracts. These are redundant supplier requests with conflicting ownership, not missing mathematical inputs.

**Witness:** The plan contains two gaps; the head README contains zero `gap:` contracts. README :409 constructs the normalized characteristic-p torsion equivalence, and :1980 proves real-closed quantifier elimination, completeness and model completeness.

**Exact repair:** Preserve the local targets and retire both superseded entries from the plan's `gaps` list, recording that §§2.2 and 5.8 discharge them. Alternatively, retain the external ownership, restore each matching `What <Supplier> must provide (gap:<slug>): ...` contract, and consume it instead of constructing the same theorem here. The plan and the head README must name one owner for each result.

**Repair controls:** With local ownership retained, the plan has zero remaining requests for these two results and the README has two local constructions. The mathematics is unchanged: at Ω=𝔽̄₂ and m=5, the normalized Bockstein is C₅→C₅ with Frobenius multiplier 4; the real algebraic numbers and ℝ both satisfy ∃x, x²=2 and both refute ∃x, x²+1=0. Thus retiring the requests does not weaken either theorem.

This carries forward R01 of [r3]. It does not re-raise FIX-RT-K3BlochGroups~2 F06's settled missing-input objection: the head now supplies a local integral construction using the coefficient square and integral injection. The remaining defect is the contradictory gap record. The old package README still has external gap contracts, but it is not the README at the reviewed pull-request head.

## Previous findings

- R01 — not repaired: README :23, :409 and :1980 still assign both results locally, while the plan retains both external supplier gaps and the head README contains no matching gap contracts.
- R02 — repaired: README :407 and :409 now cite weibel lines 28137, 28266 and 28322 with printed pp.465, 467–468; :415 distinguishes chapter pagination. The replacements reach the intended theorems and proofs.

## Verified sound

🤖 Incremental re-review of **8 changed lines since b628a17**. Four README lines changed only their locators; no Lean declaration changed. I checked both previous findings, all four changed passages, their immediate proof inputs and consumers (§§2.2,4.18,5.8), and the gate and elaborated signatures. This is not a fresh full review of the unchanged six-layer roadmap: its unchanged adversarial rows are explicitly attributed to [r3] below.

The requested head is `12c408e95743926e543ff092eafbd111e5532c18`. The worktree is clean, and both the incremental change record and `git diff --stat origin/main...HEAD` outside this folder are empty. No pull-request file, source manifest, supplier, plan or merge-order file was edited. I read the repository writing/contribution rules and the main AlgebraicTopology and completed UniversalCovers openings as shape references.

### Gate and elaboration

The supplied gate includes `build=0 OK`. The fresh gate returned exit 0:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

I separately ran the targeted `lake build TauCetiRoadmap.K3BlochGroups.Suggested`: exit 0, build completed successfully. Direct `lake env lean` elaboration of the requested file also returned exit 0. Both report only the eight expected `declaration uses 'sorry'` warnings.

A fresh scratch copy with `#check @name` for **all 13 declarations** elaborated successfully. All signatures agree with the supplied signature ledger and the corresponding README claims: arbitrary abelian groups for the diagonal theorem; arbitrary commutative rings for its supporting cokernel; arbitrary fields for symbols and block inclusion; infinite fields and i≤n for GL stability; nonzero m and j≥1 for cyclic powers; 2i≤n for symmetric stability; finite fields with prime characteristic for both SL₂ results; q≥4 for finite Bloch order; and formal reality for exact order six. The three induced-homology statements retain their identity-coefficient-map hypothesis. There are **zero changed or dropped binders**.

The eight statable headlines remain:

| Headline | Acceptance declaration and line |
| --- | --- |
| Integral diagonal exactness (§3.1) | `antisymSquare_diagonal_exact`, `Suggested.lean:40` |
| Infinite-field GL stability (§4.8) | `generalLinear_homology_stable`, :95 |
| Cyclic power action (§4.15) | `cyclicHomology_power_map`, :108 |
| Symmetric-group stability (§4.15) | `symmetricGroup_homology_stable`, :120 |
| Localized finite SL₂ third homology (§5.2) | `finite_sl2_localized_homology`, :133 |
| Integral finite SL₂ third homology (§5.2) | `finite_sl2_integral_homology`, :145 |
| Finite Bloch-group order (§5.5) | `finiteBloch_order`, :157 |
| Formally real order six (§5.8) | `blochC_order_six`, :170 |

These lines are in `TauCetiRoadmap/K3BlochGroups/Suggested.lean`. The other headline families are homological Quillen K₃ and its Hopf kernel, Milnor injectivity and the motivic edge, the normalized algebraically closed torsion comparison, Suslin exactness and finite-to-infinite compatibility, transcendental rigidity, arithmetic quotients, the Rogers detector, and the genuine finite-coefficient Chern isomorphism. The unchanged module docstring names them and the missing shared K-group, Milnor/motivic, enhanced-Tor, configuration, Rogers and Chern carriers. The five supporting definitions have real bodies. The eight unsuccessful one-tactic padding probes and object audit are carried from [r3]; no Lean change warrants rerunning those probes.

### Sources and affected supplier contracts

Of the **15 seeded targets**, §2.2 intersects the diff and was reopened. The other 14 seeded targets are unchanged: §§1.3,3.2,3.4,4.3–4.5,4.10–4.11,4.13–4.15,4.20,5.6,6.6. Their numerical rows and source/waiver status are carried from [r3]. The additional changed §5.8 Marker locator was checked directly. No newly unverified locator occurs in the changed passages.

| Changed location | Text opened | Result |
| --- | --- | --- |
| README :407, K₄ divisibility | weibel line 28137, Corollary VI.1.3.1(i), printed p.465; weibel line 28266, Theorem VI.1.6(i), printed p.467 | Positive even degrees are uniquely divisible in characteristic p and zero, respectively; degree four and the prime two are included. |
| README :409, normalized characteristic-p torsion | weibel line 28137 and weibel line 28322, Proposition VI.1.7.1 and proof, printed p.468 | Degree 2i−1 torsion has weight i. The proof at weibel lines 28324–28341 uses the coefficient Bockstein and Bott powers; i=2 gives the required squared automorphism action. |
| README :415, pagination | The same three theorem locations and their printed page markers | Printed pp.465,467 correspond to chapter VI pp.3,5. The corrected extraction-line references reach both asserted results. |
| README :1980, real-closed transfer | marker line 398, Theorem 3.5, printed pp.24–25; marker line 429, Corollary 3.6; marker line 444, Proposition 4.1, p.25 | Quantifier elimination is for all real closed ordered fields. Completeness and elementary embeddings with domain parameters follow. This is not confined to ℝ or to rational parameters for embeddings. |

The K₄ proof order remains noncircular: finite-field K₄ vanishing plus continuity gives K₄(𝔽̄p)=0; the integral K₃ injection and the isomorphism on degree-four finite coefficients make the Bockstein over Ω injective. Its kernel is K₄(Ω)/r. Only after that vanishing does the text define the normalized integral torsion comparison. Defining-characteristic coefficients use the separate positive-degree comparison and retain the K₀ exception. The §§4.18 and 5.8 consumers retain weight two and the period π², respectively.

I reopened **seven supplier contracts** through `roadmaps show`, using main for the completed roadmap and the indexed heads for new roadmaps. File line numbers below omit the tool's provenance header.

| Supplier | Resolved location | Input used by the changed passages |
| --- | --- | --- |
| KTheoryFiniteLocalFields §§3.0,3.0a,5.17,6.5a,6.10 | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:500`, :534, :1214, :1362, :1488 | Milnor p-torsion freeness, full finite motivic comparison, defining-characteristic symbol comparison, separably closed Bott coefficients and the signed factorial Chern composite. |
| SchemeKTheoryOperations §3.6 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1112` | Integral Kₙ(k)→Kₙ(A) injection for algebraically closed k and nonzero commutative k-algebra A; Ω meets these hypotheses. |
| GeneralAlgebraicKTheory §§13.8a–c | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:2993`, :3010, :3027 | Brauer comparison and finite-field K₄=0, with K₃ order q²−1. |
| K2SymbolsBrauer §§5.13–5.14 | `TauCetiRoadmap/K2SymbolsBrauer/README.md:712`, :725 | Algebraically closed Milnor unique divisibility in degrees n≥2, including repeated roots in characteristic p. |
| ArithmeticKTheory §5.2 | `TauCetiRoadmap/ArithmeticKTheory/README.md:1634` | Characteristic-zero integral torsion comparison, Bott/Bockstein normalization and naturality. Its stated scope does not already supply the positive-characteristic local target. |
| RealAlgebraicGeometry Layers 1,6 | `Completed/RealAlgebraicGeometry/README.md:128`, :437 | Ordered real closures; the CAD elimination target is explicitly over ℝ. General elementary transfer is the additional target here, subject to R01. |
| PolylogarithmFunctions §§6.1,6.3–6.5 | `TauCetiRoadmap/PolylogarithmFunctions/README.md:905`, :939, :952, :973 | Interval Rogers normalization, reflection, pentagon and midpoint; the period-π² Suslin descent remains local. |

`roadmaps grep` object searches were cross-checked against the board packages. The old package copy retains the two gap contracts, whereas the reviewed head owns the corresponding constructions; that confirms R01 rather than supplying contracts to the head by implication. The affected objects have no newly competing construction in the searched open-head/main material. Unchanged ownership checks, including disjoint acceptance declaration names, are inherited from [r3]; no claim is made about inaccessible or hypothetical work.

The dependency command was rerun with the prescribed order and content checkout:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No supplier edge changed in this diff. The local `Needs` lines at README :428, :1637 and :2009 still point to the inputs above and earlier local constructions.

### Pinned declarations opened

The manifest pins remain Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I opened these **five declarations** relevant to §5.8, rather than treating names found by a resolver as evidence:

| Declaration | File and line at the pin | What its type includes |
| --- | --- | --- |
| `TauCeti.RealClosure.exists_realClosure` | `TauCeti/FieldTheory/RealClosure/Basic.lean:120` | Ordered algebraic real closure in the base universe with a strictly monotone field embedding; no embedding into ℝ. |
| `RingPreordering.exists_linearOrder` | `TauCeti/Algebra/Order/Ring/Ordering/Extension.lean:158` | A linear order compatible with the field operations and nonnegative on the specified preordering. |
| `FirstOrder.Language.ElementaryEmbedding` | `Mathlib/ModelTheory/ElementaryMaps.lean:44` | Preservation and reflection of formulas at finite parameter tuples, beyond atomic formulas. |
| `FirstOrder.Language.Theory.IsComplete` | `Mathlib/ModelTheory/Satisfiability.lean:385` | Satisfiability as well as a decision of each sentence; not vacuous consequence from an inconsistent theory. |
| `IsFormallyReal` | `Mathlib/Algebra/Ring/IsFormallyReal.lean:104` | Zero is not a sum of nonzero squares; with a field this supplies the proper sums-of-squares preordering. |

Object searches in the pinned sources did not find a ready general real-closed-field completeness theorem replacing the local target. The Quillen and shared Milnor carrier audit is unchanged from [r3]. No mathematical declaration was added by the locator repair.

### Fresh adversarial checks

Cₙ denotes ℤ/n. These controls use the identified source/supplier K-group calculations and then compute the relevant maps, quotients, signs and truth values. They do not pretend that finite examples prove the general theorems. They replace the affected rows of [r3]; the remaining rows follow with individual provenance.

| Statement or defining law | Instances | Computed values on both sides / excluded model | Result; change |
| --- | --- | --- | --- |
| §2.2 signed Chern composite | Ordered symbol {t₁,t₂,t₃}, characteristic zero | Successive residues give 1; the composite gives 2; reversed first entries give −2; zero map gives 0. | +2 retained; locator only changed. |
| §2.2 characteristic-p branch | 𝔽₂(t₁,t₂,t₃); Prüfer group negative control | Residues of x and 2x are 1 and 2 in ℤ; in C₂∞, 2·(1/2)=0 despite divisibility. | Imported torsion freeness remains necessary. |
| §2.2 edge quotient | ℚ | C₄₈/{0,24}=C₂₄; edge kernel has order 2, equal to the Milnor image. | Quotient statement unchanged. |
| README :407, all-prime K₄ divisibility | Ω=𝔽̄₂, r=2,5; Ω=ℂ,r=2 | K₄(𝔽̄₂)=0 and both quotients are 0; K₄(ℂ)/2=0 by the positive-even source theorem. At degree zero ℤ/2ℤ=C₂≠0. | Correct new locators include r=2; n=0 is excluded. |
| README :409, Bockstein normalization | Ω=𝔽̄₂,m=3,5,2 | At 3 and 5 the normalized maps Cₘ→Cₘ send 1↦1, have kernel {0} and full image; at 2 both groups are 0. | Integral comparison preserved; R01 is ownership only. |
| §2.2 weight-two naturality; §4.18 consumer | Ω=𝔽̄₂,m=3,5 | Frobenius multiplies both detected torsion and Bott-square coordinates by 4: 1 mod 3 and 4 mod 5. Untwisted roots give 2 mod both. | Wrong weight excluded. |
| §2.2 degree-zero exception | Ω=𝔽̄₂, modulus 2 | K₀(;C₂)=C₂; K₄(;C₂)=K₃[2]=0. | No defining-characteristic overclaim. |
| README :407,:409,:415, source-location agreement | Three Weibel theorem references | Lines 28137,28266,28322 give VI.1.3.1,VI.1.6,VI.1.7.1; printed pages 465,467,468 equal chapter pages 3,5,6. | Three correct destinations; previous R02 repaired. |
| README :1980, RCF completeness | Real algebraic numbers, ℝ; ℚ and ℂ controls | ∃x x²=2: true,true,false,true; ∃x x²+1=0: false,false,false,true. | Both RCFs agree; ordered-field-only and algebraically-closed substitutions fail. |
| §5.8 model completeness with parameters | Ordered RCF embedding, parameter a or t | x=a+1 gives x−a=1>0 in both; ∃x x²=t is true for t≥0 and false for t<0 on both sides. | Full parameter preservation matches Marker Proposition 4.1. |
| §5.8 finite-certificate transfer | Empty relation list; k=0,1; ξ=[2]−[3] | k[1]=0 iff k=0 in both fields. ξ has coefficients (1,−1), hence is nonzero in both despite augmentation 0. | Equality-pattern condition excludes the false model. |
| §5.8 Rogers detector | 1/2,2,−1 | In units π², 1/12−1/6=−1/12; 1/6−1/12=1/12; 1/12−1/3=−1/4. Their c-sum is −1/6. | Supplier midpoint and local normalization agree. |
| §5.8 formally-real headline | c=[2]+[−1]; any formally real field via its real closure | Modulo π² the residues of c,2c,3c,6c are 5/6,2/3,1/2,0. Thus order is 6, whereas period π²/2 would give 3. | Transfer carries the finite-relation obstructions; headline unchanged. |
| R01 ownership consistency | Two plan gap entries versus head contracts and targets | External requests 2; matching README gap slugs 0; local constructions 2. Under the proposed local-ownership repair: requests 0, local constructions 2. | Still fails ownership agreement; carry R01. |
| Source cyclotomic-image control | Ω=𝔽̄₂,μ₇ | Frobenius image {1,2,4}; full unit group {1,2,3,4,5,6}; 6 is absent. | Source surjectivity assertion false; roadmap needs only actual automorphisms. |
| Source interval-witness control | (−∞,0),(0,∞),(−∞,∞) | Interior points −1,1,0 respectively; endpoint-midpoint expression is undefined in all three cases. | Retain source proof gap; no false transfer theorem inferred. |

### Carried adversarial checks

The following 130 rows concern unchanged statements. Each cites [r3], which records the original computations; they were not rerun in this incremental review. Together with the 16 fresh rows, they cover all seeded targets, all headline families and this report's finding. References to retaining a statement describe the mathematical result, not an approval of the unresolved ownership record.

| Statement or defining law | Instances | Computed values on the two sides / excluded model | Result; change and provenance |
| --- | --- | --- | --- |
| 1.1 Steinberg plus and connectivity | A=0,ℤ | A=0: K₃=H₃(1)=0. A=ℤ: π₂(BSt⁺)=0; π₂(BE⁺)=C₂. | Retain; wrong plus space excluded. Carried from [r3]. |
| 1.1 covering comparison | A=ℚ | π₁(BSt⁺)=0; π₁(BGL⁺)=ℚˣ, containing −1≠1. | Retain. Carried from [r3]. |
| 1.2 canonical composite and inverse | C₅, q=×2, others id | c(1)=3; q(c(1))=6=1; unreversed q gives 2. | Retain. Carried from [r3]. |
| 1.2 additivity/naturality | Same C₅ model | c(1+1)=1=3+3; c(0)=0; inverse composite sends 2 to 2. | Retain. Carried from [r3]. |
| 1.3 unnormalized differential | Identity entries | d₄[1,1,1,1]=[1,1,1]; d₃[g,1,1]=[1,1]−[g,1]. | Retain; normalized and unnormalized models differ. Carried from [r3]. |
| 1.3 noncommutative bar order | S₃, g=(01),h=(12) | gh(2)=0; hg(2)=1. Middle term is −[gh], not −[hg]. | Retain pinned order. Carried from [r3]. |
| 1.3 cycle evaluation and witnesses | z=d₄[1,1,1,1] | z≠0 as a free chain; d₃z=0 and ev(z)=0. | Retain; zero class need not be zero chain. Carried from [r3]. |
| 1.4 identity/composition | A→A→A, identity | A support coefficient 7 remains 7; every tuple and its boundary are unchanged. A=0 gives class 0 on both routes. | Retain. Carried from [r3]. |
| 1.4 filtered stages without injectivity | C₂→1 and trivial coefficient homology | Nonzero H₃(C₂)=C₂ class becomes 0 at the next stage; a later boundary witnesses equality. | Retain; no uniform/injective-stage assumption. Carried from [r3]. |
| 1.5 wedge decomposition | 0,1,2,3 sphere summands | Ranks r+r(r−1)/2 are 0,1,3,6; Hopf and unordered-pair coordinates give those same ranks. | Retain. Carried from [r3]. |
| 1.5 swap, pinch and fold | Two S² summands | Pair swap has sign (−1)⁴=+1; pinch Hopf coordinates (1,1,1); fold gives η+η+2η=4η. | Retain. Carried from [r3]. |
| 1.5 finite-subwedge compatibility | Include first two of three spheres | (a,b,c)↦(a,b,0,c,0,0); restriction returns (a,b,c). | Retain; no extra pair coordinate. Carried from [r3]. |
| 1.5 Hopf–Hurewicz kernel | ℤ; characteristic two field | ℤ: C₄₈/⟨24⟩=C₂₄. In characteristic two, [−1]=[1]=0. | Retain. Carried from [r3]. |
| 1.5 sphere-unit normalization | η³ in C₂₄ | 12 has order 2; −12=12; quotient order 12. | Retain; supplier locators resolved. Carried from [r3]. |
| 2.1 Milnor image/cokernel | ℚ | Image={0,24} in C₄₈; cokernel C₂₄. Quotient by all torsion would be 0. | Retain. Carried from [r3]. |
| 2.1 quotient uniqueness | C₄₈→C₂₄ | 1 and 25 both map to 1; their difference 24 lies in the specified image. | Retain. Carried from [r3]. |
| 2.3 signature image | r₁=0,1,2 | Image orders 1,2,4; all-negative triple has coordinates (1) or (1,1); sign-isolating symbols give (1,0),(0,1). | Retain. Carried from [r3]. |
| 2.4 imaginary quotient | ℚ(i) | r₁=0; Milnor image 0; K₃=K₃ind=ℤ⊕C₂₄. | Retain. Carried from [r3]. |
| 2.4 stable-SL quotient | ℚ | H₃(SL∞)=C₂₄ and K₃ind=C₂₄; K₃ itself is C₄₈. | Retain. Carried from [r3]. |
| 2.5 rational rank | ℚ and ℚ(i) | Rational dimensions 0 and 1, equal r₂; C₄₈⊗ℚ=C₂₄⊗ℚ=0. | Retain. Carried from [r3]. |
| 3.1 tensor cokernel headline | A=0,ℤ,C₃,C₂ | Qₛ=0,C₂,0,C₂; Λ²=0 in all four; kernels equal A/2A=0,C₂,0,C₂. | Retain. Carried from [r3]. |
| 3.1 mixed coordinates | A=ℤ² | Qₛ=C₂²⊕ℤ, Λ²=ℤ; diagonal kernel C₂². For (1,1), diagonal is e₁²+e₂². | Retain. Carried from [r3]. |
| 3.1 exact diagonal relations | A=C₄, a=1,b=3 or 0 | 1²=3² in Qₛ and 1−3=2·1; 1²≠0² and 1∉2C₄. | Retain both directions. Carried from [r3]. |
| 3.1 eigenspace distinction | A=ℤ | Flip-negative subgroup is 0; cokernel is C₂. After tensoring ℚ both are 0. | Retain distinct ownership. Carried from [r3]. |
| 3.2 cross-ratio and permutation | (0,∞,1,3) | cr=3; first-two swap gives 1/3; supplier reciprocal is 1/3. | Retain adapter. Carried from [r3]. |
| 3.2 deletion faces | (0,∞,1,2,3) | Face values (1/2,3/4,3/2,3,2); alternating sum is R(2,3). | Retain. Carried from [r3]. |
| 3.3 admissibility and junk values | (x,y)=(2,3), (1,3),(2,2) | Valid arguments 2,3,3/2,3/4,1/2. x=1 gives a zero denominator/numerator; x=y is excluded, not an added relation. | Retain. Carried from [r3]. |
| 3.3 free equality certificate | Coefficients 0 and 1 at R(2,3) | 0 evaluates to the zero chain; coefficient 1 evaluates to the displayed five-term chain, zero only after quotienting. | Retain. Carried from [r3]. |
| Raw/quotient symbol definitions | x=0,1 over any field | Raw(0)=0; raw(1) is one free basis vector; quotient symbol(0)=symbol(1)=0. | Retain; real bodies match. Carried from [r3]. |
| 3.4 presentation, small fields | 𝔽₂,𝔽₃ | Reduced generator ranks 0,1; no admissible pairs; P=0,ℤ. | Retain. Carried from [r3]. |
| 3.4 reduced/unreduced equivalence | 𝔽₃ | Unreduced has [1],[2]; killing [1] leaves ℤ[2], same as reduced. | Retain. Carried from [r3]. |
| 3.5 boundary and signs | ℚ, x=3 and 1/3 | (v₂,v₃)-alternating values −1 and +1; reversing tensor order reverses these values. | Retain. Carried from [r3]. |
| 3.5 kernel and K₂ cokernel | 𝔽₅ | P=C₆; ∂[3]=1 in C₂; kernel C₃; cokernel 0=K₂(𝔽₅). | Retain. Carried from [r3]. |
| 3.6 reflection/inversion | 𝔽₅, generator g=[3] | [2]=2g,[4]=0; c=2g; h(2)=3g; 2h=6g=0; ∂h=1≠0. | Retain h in P, not B. Carried from [r3]. |
| 3.6 3c and sixth-root cases | 𝔽₇, g=[3] | [−1]=2g, c=4g; 3c=4g=h(−1), 6c=0; c≠0. | Retain. Carried from [r3]. |
| 3.7 finite presentation orders | 𝔽₅,𝔽₇,𝔽₁₁,𝔽₁₃ | Integer relation-lattice indices 6,8,12,14; c orders 3,2,6,1. | Retain. Carried from [r3]. |
| 3.8 exterior comparison | 𝔽₅ | Λ²(C₄)=0; exterior kernel is all P=C₆; Suslin B=C₃, index 2. | Retain. Carried from [r3]. |
| 3.9 raw full tensor | 𝔽₃ and 𝔽₅ | 𝔽₃: λ:ℤ→C₂, ker=2ℤ. 𝔽₅: R(2,3)=[4], λ[4]=2 mod 4≠0. | Retain. Carried from [r3]. |
| 3.9 μ kernel and image | 𝔽₅ | 2[4]≠0 in the free group, λ=0, μ=0; 4[3] maps to 4g, of order 3. | Retain. Carried from [r3]. |
| 3.9 rational noninjectivity | ℚ | 4[−1] has free coefficient 4 and infinite order; λ=0 and μ=0. It remains nonzero after tensoring ℚ. | Retain. Carried from [r3]. |
| 3.10 obstruction and sixfold lift | 𝔽₃; 𝔽₅, α=2[3] | 𝔽₃: E=L=0, 2ℤ→2ℤ identity. 𝔽₅: σα=α, γ=4[4], λγ=0 and μγ=0=6·2g. | Retain. Carried from [r3]. |
| 3.11 generic projective symbols | 𝔽₃ | Quadruple (0,∞,1,2) gives [2]; no 5-tuples; H₃ coinvariants=P=ℤ. | Retain. Carried from [r3]. |
| 3.12 local specialization | DVR F[t]_(t) | t↦0, t⁻¹↦∞, 1+t↦1; stalk dimension 1. A field stalk has dimension 0 and is not this closed-point DVR. | Retain. Carried from [r3]. |
| 3.12 singular/thickened negative controls | Cusp and square-zero thickening | Cusp cotangent dimension 2 versus ring dimension 1; thickening has ε≠0, ε²=0. Neither native stalk is a DVR. | Retain smoothness. Carried from [r3]. |
| 3.12 all-curve quotient | 𝔽₃, rationalized | P⊗ℚ=ℚ; exterior target 0; projective inversion gives 2[2]=0 and therefore kills [2] rationally, so the comparison kernel is ℚ, not torsion. | Retain conditional relation equality. Carried from [r3]. |
| 3.13 old relation defect | ℚ, ξ(2,1) | Boundary 2∧(−1) has nonzero value 1 under v₂⊗sign modulo 2; proposed denominator is not contained in the kernel. | Retain intersection repair. Carried from [r3]. |
| 3.13 old comparison | 𝔽₁₁ | B=C₆, B_old=C₆; map image C₃, kernel C₂, cokernel C₂. Same orders do not give an isomorphism. | Retain. Carried from [r3]. |
| 3.14 negative-unit target | 𝔽₃ and 𝔽₅ | Q₋=C₂ and 0, respectively; ordinary exterior target is 0 in both. | Retain. Carried from [r3]. |
| 3.15 projective reduced quotient | 𝔽₂,𝔽₃,𝔽₁₁ | B_new orders 3,1,3 versus Suslin B orders 1,infinite,6. | Retain size hypotheses. Carried from [r3]. |
| 3.16 convention maps | 𝔽₁₁, mod 3 and mod 2 | C₆→C₃ induces C₃≅C₃ modulo 3; modulo 2 gives C₂→0. | Retain odd/invert-two qualifications. Carried from [r3]. |
| 4.0 finite words and augmentation | Sets of sizes 0,1,2 | Empty augmented degree 0 is ℤ; size 1 differential [x]↦1 gives zero homology; size 2 top cycle (a,b)+(b,a) has boundary 0. | Retain top term. Carried from [r3]. |
| 4.0 exactness range | Five letters | Chain ranks 1,5,20,60,120,120; boundary ranks 1,4,16,44,76; top homology rank 44. | Retain finite/infinite distinction. Carried from [r3]. |
| 4.1 total differential | Bidegree (1,1) | Cross terms have signs +1 and −1, sum 0; using + in both positions gives 2. | Retain. Carried from [r3]. |
| 4.1 hyperhomology identity | Trivial G, complex ℤ in degree 0 | E²₀,₀=ℤ; all other entries 0; abutment H₀=ℤ,Hᵢ>₀=0. | Retain actual module construction. Carried from [r3]. |
| 4.2 independent frames | n=1, F=𝔽₂ versus ℚ | 𝔽₂: one nonzero vector, augmented boundary is id ℤ. ℚ: reduced degree-one group consists of finite sums with coefficient sum 0. | Retain indexing. Carried from [r3]. |
| 4.3 scalar coinvariants | F=ℚ,V=ℚ,j=1,k=ℚ | Scalar 2 gives (2−1)V=V, so H₀=0; with V=0 all groups 0; at j=0 H₀=ℚ≠0. | Retain j>0; source waiver noted. Carried from [r3]. |
| 4.3 affine stabilizer | Upper triangular GL₂(ℚ), M=ℚ | Scalar on first block sends u↦2u; on second sends u↦u/2; differences ×1 and ×(−1/2) are invertible. | Retain either-block hypothesis. Carried from [r3]. |
| 4.4 frame coinvariants | F=ℚ | S₀=ℤ; S₁=ℚˣ; the extra S₂ generator is (0,1), not zero in K₂ᴹ⊕ℤ. | Retain. Carried from [r3]. |
| 4.5 ordered Milnor symbols | {t₁,t₂} | Successive parameter-last residues give 1; reversed symbol gives −1. Unadjusted inverse comparison changes the sign. | Retain supplier normalization. Carried from [r3]. |
| 4.6 splitting | S₂=K₂ᴹ⊕ℤ | (x,7) projects to x and 7; inclusion-sum reconstructs (x,7); (0,1) survives. | Retain simultaneous induction. Carried from [r3]. |
| 4.7 monomial subgroup | 𝔽₂ and 𝔽₃, rank 2 | Orders 2 and 2·2²=8; GL₂(𝔽₃) has order (9−1)(9−3)=48. | Retain distinct carrier. Carried from [r3]. |
| GL block inclusion definition | n=0,1; g=2 over ℚ | 0×0 unit maps to (1); g maps to diag(2,1), inverse diag(1/2,1), product I₂. | Retain. Carried from [r3]. |
| 4.8 GL stability headline | n=i=0; n=1,i=1 | H₀ map ℤ→ℤ sends 1↦1; H₁(ℚˣ)→H₁(GL₂ℚ) is determinant identity. n=0,i=1 would be 0→ℚˣ, not onto. | Retain i≤n. Carried from [r3]. |
| 4.10 projective coinvariants | 𝔽₂,𝔽₃ | Degree-three homology 0 and ℤ, equal P; in the latter no degree-four distinct tuples exist. | Retain all-field claim. Carried from [r3]. |
| 4.11 matrix faces/determinants | a=2,3 | det(A,B,C)=(−1,−2,2),(−2,−6,3); At=(∞,1,a). a=0 or 1 makes a determinant 0. | Retain. Carried from [r3]. |
| 4.11 eight-term chain identity | a=2,3,−1,4 over ℚ | Expanded d(u) minus six claimed terms has zero coefficient on every right-diagonal orbit in all four cases. | Retain. Carried from [r3]. |
| 4.11 Shapiro seven-commutator reduction | a=2,3,−1,4 over ℚ | Shapiro(uw−u) minus the seven commutators equals exactly the negative boundary of the specified bar 3-chain; remaining coefficient vector 0. | Retain. Carried from [r3]. |
| 4.11 differential and shear | a=3, alternating valuation | Raw signed pair (1,−1) maps to (0,−1); inverse shear restores (1,−1). | Retain; raw splitting would be wrong. Carried from [r3]. |
| 4.11 determinant-one torus | Ordered pair with wedge value 1 | Raw (2,−2) maps to (0,−2); coefficient +2 would reverse the second entry. | Retain. Carried from [r3]. |
| 4.12 infinite-field restriction | 𝔽₄ negative control | H₂(GL₂𝔽₄)=C₂; Λ²𝔽₄ˣ⊕K₂(𝔽₄)=0. | Retain infinite hypothesis. Carried from [r3]. |
| 4.13 rotations and norm | Degrees 0,1,4 | N₀=1; N₁=1−t; N₄=1+t+t²+t³+t⁴. At fixed generators these evaluate 1,0,5. | Retain signs. Carried from [r3]. |
| 4.13 cone differential | x=0, nonzero y | d(0,y)=(−Ny,−dy); two applications have first component −dNy+Ndy=0. | Retain. Carried from [r3]. |
| 4.14 rank-three projection | [3;2] over ℚ | Projection gives [3], boundary valuation −1; swapped first two gives [1/3], value +1. | Retain. Carried from [r3]. |
| 4.14 cyclic norm and P sign | All admissible pairs over 5,7,11,13 | Respectively 6/6,20/20,72/72,110/110 sums equal 2c. At 11, 2c has order 3; +2c on P would leave 4c≠0. | Retain −2c. Carried from [r3]. |
| 4.15 corrected identity | All x≠0,1,−1 over 5,7,11,13 | Corrected equality: 2/2,4/4,8/8,10/10. Printed formula: 0/2,1/4,2/8,1/10. | Retain correction. Carried from [r3]. |
| 4.15 permutation conjugation | P₁₂,P₃₄,P₁₃P₂₄ | det Γ=1; lower-right blocks diag(−1,1),diag(1,−1),swap; lower-left blocks all 0. Upper-right entries match (2,3)=1 and (1,4),(2,4)=1,−1. | Retain, including char 2. Carried from [r3]. |
| 4.15 cyclic power-map headline | m=1,2,7; a=2,j=2 | H₃=0,C₂,C₇; multipliers 0,0,4. For m=7,j=1 multiplier is 2, not 4. | Retain positive-degree scope. Carried from [r3]. |
| 4.15 different-order inclusion | C₂→C₄ | Odd H map sends 1↦2, order 2; erroneously squaring the index would send 1↦0 in degree three. | Retain. Carried from [r3]. |
| 4.15 symmetric stability headline | (n,i)=(0,0),(2,1),(1,1) | First map ℤ≅ℤ; second C₂≅C₂; excluded third map 0→C₂ is not onto. | Retain 2i≤n. Carried from [r3]. |
| 4.15 prime contributions | C₅ power 2; C₃ inversion | H₃ multipliers 4 and 1; 4−1=3 is a unit mod 5, so fixed part 0; 3-primary contribution can survive. | Retain. Carried from [r3]. |
| 4.16 monomial indecomposables | 𝔽₂,𝔽₄ | π₃ind models C₁₂ and C₃⊕C₁₂; latter has exponent 12 and order 36, not C₃₆. | Retain nonsplit possibility. Carried from [r3]. |
| 4.16 bottom unit and η³ | Sphere summand | Stable third stem C₂₄ maps after η³ quotient to C₁₂; element 12 is killed, element 1 survives. | Retain; supplier locators resolved. Carried from [r3]. |
| 4.17 doubling | μ=C₂,C₅ | γδ sends 1↦0 and 1↦2; not an injection at 2. | Retain distinction from detector. Carried from [r3]. |
| 4.17 Chern sign | Weights +1,−1; m=5,2 | (1+u)(1−u)=1−u²; coefficients −1=4 mod 5 and 1 mod 2. | Retain. Carried from [r3]. |
| 4.18 closure detector | μ₅ in 𝔽̄₂ | Domain C₅, target Tor=C₅, normalized generator 1↦1; Frobenius both sides ×4. Ordinary μ⊗μ=0. | Retain. Carried from [r3]. |
| 4.18 two-primary modulus | Torsion order 2 in modulus 8 | 2 divides 8; Chern coefficient −1=7 is a unit; no product at modulus 4 is required. | Retain. Carried from [r3]. |
| 4.19 enhanced Tor model | μ=C₂,C₃ | Enhanced group C₄ in char 0 versus ordinary C₂; char 2 gives C₃ versus C₃. | Retain characteristic split. Carried from [r3]. |
| 4.19 naturality versus abstract roots | C₅, automorphism a=2 | Tor acts ×4; unmarked root model acts ×2. | Retain warning on nonnatural identifications. Carried from [r3]. |
| 4.20 Suslin exactness | ℚ | 0→C₄→C₂₄→C₆→0, injection 1↦6, kernel {0,6,12,18}. | Retain. Carried from [r3]. |
| 4.20 splitting exclusion | Same sequence | Every lift of 1 is 1+6k; sixfold multiples are 6 or 18, never 0. | Retain nonsplit assertion. Carried from [r3]. |
| 4.21 rational-function rigidity | 𝔽₄ and 𝔽₄(t) | μ=C₃ in both; K₃ind=C₁₅ in both; B=C₅ after the mixed comparison. | Retain proof order. Carried from [r3]. |
| 4.21 residue compatibility | {u,v,t} | Parameter-last residue is {u,v}; degree-three comparison sign (−1)²=+1. | Retain. Carried from [r3]. |
| 5.1 restriction/transfer | 𝔽₂⊂𝔽₄ | K₃ orders 3,15; restriction ×5, transfer reduction mod 3; tr∘res=×2 and res∘tr=×5. | Retain. Carried from [r3]. |
| 5.1 norm-one multiplication | 𝔽₄/𝔽₂, ω²+ω+1=0 | Matrix [[0,1],[1,1]] has determinant 1 and trace 1=ω+ω⁻¹. | Retain. Carried from [r3]. |
| 5.2 localized-SL₂ headline | q=2,3,4,5,7 | H₃ orders after inverting characteristic: 3,8,15,24,48 = q²−1. | Retain. Carried from [r3]. |
| 5.2 integral-SL₂ headline | q=2,3,4,5,7,8,9,27 | Orders 6,24,30,120,48,126,240,2184; extra p exactly on listed exceptional q. | Retain. Carried from [r3]. |
| 5.2 nonabelian stable elements | S₃, p=3, Sylow C₃ | Normalizer inversion acts ×1 on H₃(C₃)=C₃; stable H₃ part C₃. H⁰ restriction sends 1↦1. | Retain separate degree zero. Carried from [r3]. |
| 5.2 quaternion periodicity | Q₈ | H₁=C₂², H₃=C₈; replacing by abelianization homology would lose the order-eight class. | Retain. Carried from [r3]. |
| 5.3 stabilization | 𝔽₅ | Integral H₃ C₁₂₀→K₃ C₂₄ has kernel C₅; localization gives C₂₄≅C₂₄. | Retain. Carried from [r3]. |
| 5.3 extension comparisons | 𝔽₂⊂𝔽₄; 𝔽₃⊂𝔽₉ | Localized target orders 15,80; subgroup images have orders 3,8, respectively. | Retain. Carried from [r3]. |
| 5.4 refined boundary | 𝔽₅, nonsquare ε | λ₁[2]=0; λ₁[3]=(ε−1)²=2(1−ε)≠0; augmented R(2,3)=[4]=0. | Retain. Carried from [r3]. |
| 5.4 refined cross-ratio | (0,∞,a,b) | Value ⟨a⟩[b/a]; at a=1 equals [b]; at nonsquare a the coefficient is ε, not 1. | Retain. Carried from [r3]. |
| 5.4 finite comparison range | q=4, P¹ has 5 points | Augmented top degree 5; ordinary homology vanishes in degrees 1,2,3. Transitive C₅ orbit has 5 points, so complement is empty. | Retain general comparison, not βx,y in this case. Carried from [r3]. |
| 5.4 d² and torus comparison | Square class a over 𝔽₅ | Four multiplicative coordinates product a⁻¹, same square class as a; determinant-one tensor coefficient −2. | Retain. Carried from [r3]. |
| 5.4 refined coinvariants | Odd q, G_F=C₂ | I=ℤ(ε−1), I²=2I,I³=4I; I²/I³=C₂ and H₁(C₂,I²_sign)=0. | Retain. Carried from [r3]. |
| 5.5 finite Bloch headline | q=4,5,7,11 | B orders 5,3,4,6; enhanced kernel orders 3,8,12,20; products 15,24,48,120 equal q²−1. | Retain. Carried from [r3]. |
| 5.5 integral/localized kernels | q=4,5 | Integral kernels 30/5=6,120/3=40; localized kernels 15/5=3,24/3=8. | Retain. Carried from [r3]. |
| 5.5 small exclusions | q=2,3 | Actual Suslin B=0,ℤ; extrapolated order formula would give 3,2. | Retain q≥4. Carried from [r3]. |
| 5.6 odd Cartan quotient | (q,n)=(4,5),(5,3),(7,3) | First five groups C₅; second five C₃; excluded third has K₃/n=C₃ but B/n=0. | Retain gcd condition. Carried from [r3]. |
| 5.6 basis independence | Change basis e↦eg | Multiplication matrices M↦g⁻¹Mg; trace u+u⁻¹ and determinant 1 unchanged. At u=1 and −1: I and −I. | Retain. Carried from [r3]. |
| 5.7 arithmetic quotient | ℚ,ℚ(i) | C₄₈/C₂=C₂₄; (ℤ⊕C₂₄)/0=ℤ⊕C₂₄. | Retain. Carried from [r3]. |
| 6.1 witness transport | R(2,3) under identity/embedding | Five coefficients remain (1,−1,1,−1,1); their argument equalities and zero quotient are preserved. | Retain. Carried from [r3]. |
| 6.2 tensor coordinates | C₄⊕ℤ² | Torsion diagonal modulus 2, torsion/free modulus 4, free diagonals modulus 2, mixed free coordinate ℤ. | Retain integral bookkeeping. Carried from [r3]. |
| 6.2 boundary certificate | ℚ, [2] and [2]+[−1] | Mixed v₂/sign coordinate 1 and 1+1=0 mod 2, respectively. | Retain accepts cycle, rejects symbol. Carried from [r3]. |
| 6.3 root multiple | Primitive sixth root ζ | 1−ζ=ζ⁻¹; ∂[ζ]=−ζ⊗ζ is nonzero C₂ diagonal; ∂(2[ζ])=0. | Retain. Carried from [r3]. |
| 6.3 dependence on −1 square | ℚ(√−3),ℂ | (−1)∧(−1) nonzero in the former, zero in the latter since −1=i². | Retain exact condition. Carried from [r3]. |
| 6.4 invertible denominators | Mod 5, m=2 or 4 | 2⁻¹=3 and 4⁻¹=4; (4·symbol)/4= symbol, (2·symbol)/2=symbol. | Retain unit hypothesis. Carried from [r3]. |
| 6.4 nonflat scalar change | 2ℤ↪ℤ, tensor C₂ | Source becomes C₂, target C₂, induced map ×2=0; injectivity is lost. | Retain no flatness shortcut. Carried from [r3]. |
| 6.5 fibres | C₂₄→C₆ over 1 | Fibre {1,7,13,19}; C₄ action adds 6 transitively/freely; multiplying lifts by 6 gives 6,18,6,18. | Retain no canonical additive section. Carried from [r3]. |
| 6.5 bar witness boundary | Trivial group, z=[1,1,1] | z=d₄[1,1,1,1], ev(z)=0; zero witness works for z−z=0. | Retain actual chains. Carried from [r3]. |
| 6.6 mixed field square | 𝔽₄→𝔽₄(t)→𝔽₄(t)(s) | Both routes send [ω]↦[ω] and [ω²]↦4[ω] in C₅. Reciprocal sends 1↦4, unequal. | Retain map-sensitive comparison. Carried from [r3]. |
| 6.6 snake sequence | C₄→C₂₄→C₆, n=2 | T[2]=C₂→K[2]=C₂ is iso; K[2]→B[2] is 0; B[2]→T/2 is iso; K/2→B/2 is iso. | Retain full six-term sequence. Carried from [r3]. |
| 6.6 rationalization | ℚ,ℚ(i) | T̃⊗ℚ=0; K₃ind⊗ℚ and B⊗ℚ have dimensions 0,1. | Retain. Carried from [r3]. |
| 6.6 odd/root hypothesis | 𝔽₇,n=3; ℚ,n=5 | First: T̃/3=C₃, K₃/3=C₃, B/3=0. Second: all ordinary quotients 0. | Retain hypothesis. Carried from [r3]. |
| 6.7 true coefficients | ℚ,n=5 | K₃/5=0; 5{2,−31}={32,−31}=0; residue 2 has powers 2,4,8,16,1 mod 31, hence exact order 5. | Retain nonzero K₂[5] extension. Carried from [r3]. |
| 6.7 degree-two correction | ℝ,n=2 | K₂(;C₂)=C₄; c₂(2β)=1 in C₂ but 2c₂(β)=0. | Retain degree distinction. Carried from [r3]. |
| 6.7 coefficient boundaries | n=1; characteristic p with n=p | n=1 gives 0 on both sides; n=p is excluded by invertibility, not silently evaluated as étale μ_p. | Retain. Carried from [r3]. |
| 4.13 distinct versus normalized tuples | X={a,b} | Injective C₂=0; normalized all-tuple degree two has basis (a,b,a),(b,a,b), rank 2. | Retain precyclic formulation; source error not copied. Carried from [r3]. |
| 4.13 omitted-last-face finite control | cardinality of X = 3,4 | dᵃ preserves the last entry; each summand is an augmented word complex on 2 or 3 letters. Top ranks are 3·1=3 and 4·2=8. | Retain infinity hypothesis. Carried from [r3]. |
| Source order control | p=3,m=2,n=9,q=17 | q+1=18; primitive-root class has order 9, not 3; q≡−1 mod 9. | Roadmap keeps actual homology and root order. Carried from [r3]. |

## Not verifiable

- `suslin-1984`, `suslin-1991` and `bloch` remain settled waivers. In particular the primary Rogers descent and the monomial detector's Suslin arguments are not newly source-certified. Their unchanged numerical checks and the previous review's limitations are carried forward.
- No new unreadable source was needed: the corrected Weibel and Marker passages are in the supplied legal cache. No source request or manifest edit was made.
- Unchanged source and ownership coverage is inherited from [r3], not represented as a fresh full audit. The new work is limited to the four changed lines, their affected interfaces, the previous findings and required mechanical checks.

## Source issues

These two issues were encountered again in the reopened passages; neither is introduced by the locator repair. Other unchanged source errata remain recorded in [r3].

- **Error** in weibel at the preamble to Definition VI.1.7, printed p.468 (weibel line 28314): the source says characteristic-p algebraic-closure automorphisms surject onto every automorphism of the root group; it should use the cyclotomic image generated topologically by Frobenius, giving {1,2,4} modulo seven in characteristic two; affects a stated result.
- **Gap** in marker at the end of Theorem 3.5's proof, printed p.25 (marker line 428): the source says to choose the midpoint after allowing infinite interval endpoints; it should choose finite interior points separately for the unbounded intervals; affects the proof.

[r3]: packages/K3BlochGroups/reports/PRREVIEW-K3BlochGroups~3.md
