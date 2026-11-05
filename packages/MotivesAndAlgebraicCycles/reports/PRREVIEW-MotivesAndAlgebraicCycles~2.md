# Review of MotivesAndAlgebraicCycles (pull request #1313 at 57b8fe4)

**Verdict:** needs changes

## R01 (P1) — The representability formula mixes integral and arbitrary coefficients

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:876`, §4.18: “`Hom(M(X),M(Y))≃CH_{dim X}(X×Y)`”. The same mismatch occurs in the preceding bivariant representability formula, using §4.15's integral group.

**Claim:** These are identities in Layer 4's theory with arbitrary commutative coefficient ring R (line 554), but their right sides have integral coefficients. Section 4.15 explicitly computes its point group as ℤ, whereas §4.18's first Check computes the corresponding motivic Hom as R.

**Witness:** Take k=ℂ, X=Y=Spec k and R=𝔽₂. The left side is End(𝟙)=𝔽₂; the displayed right side is CH₀(Spec k)=ℤ. For R=0 the two sides are 0 and ℤ.

**Repair:** Define the coefficient version of the equidimensional-cycle complex and bivariant groups using derived coefficient extension, and carry R through the representability and internal-Hom formulas. Write the degree-zero Chow group as CH₍dim X₎(X×Y)⊗ℤR, as the later projective formula already does. Retain the integral construction as R=ℤ. The repaired point formulas give 𝔽₂=𝔽₂ and 0=0; do not restrict the whole layer to flat coefficients. Correct the unqualified Chow formula in the Checks at line 893 too.

## R02 (P1) — Total degree zero does not kill a disconnected curve's class

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:454`, §2.8: “A degree-zero divisor on a complex curve has zero degree-two class”.

**Claim:** The conventions at line 19 admit disconnected curves, and §2.8 explicitly works componentwise. Total degree is insufficient in that scope.

**Witness:** On C=ℙ¹⊔ℙ¹, let D=[x₁]−[x₂], one point on each component. Then deg D=1−1=0, but cl(D)=(1,−1) in H²(C,ℚ(1))=ℚ².

**Repair:** Require degree zero on each connected component, or explicitly restrict this Check to a connected curve. Keep the displayed disconnected example as a negative control. The repaired componentwise assertion says cl(D)=(deg D₁,deg D₂), so it vanishes exactly when both degrees vanish. On a connected elliptic curve, a nontorsion degree-zero divisor still supplies the intended nonzero rational Chow class with zero cohomology class.

## R03 (P2) — Import the existing nonproper de Rham comparison

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1046`, §5.7: “These nonproper and arbitrary-pair comparisons are construction targets here.”

**Claim:** The smooth nonproper comparison, its logarithmic proof and extension beyond quasiprojective varieties are planned again, although an earlier named supplier already owns that result.

**Witness:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:3821`, §C5.6, states `regularSingularDeRhamComparison` for every smooth finite-type complex variety. Its trivial-connection instance includes 𝔾ₘ, with H⁰=H¹=ℂ (line 3835).

**Repair:** Add §C5.6 to the supplier contract and §5.7's Needs; import its trivial-connection comparison and logarithmic model. Keep the additional descent from k⊂ℂ, relative arbitrary-pair/hypercover construction, and the specified multiplicative, residue and Nori-fiber adapters as local targets to the extent they are not supplied. On 𝔾ₘ the imported comparison gives the same nonzero degree-one class; the local adapter still fixes its marked period to 2πi. This is a repairable overlap, not a reason to reject the entire roadmap.

## R04 (P3) — Remove the anchor rejected by the gate

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:337`: `<a id="mc2"></a>`.

**Claim:** The worker's gate rejects explicit HTML anchor tags under its residue rule.

**Witness:** The recorded gate has `residue=1`, identifies line 337, and ends `FAIL`; every other reported counter is zero.

**Repair:** Delete the tag and use the heading's normal Markdown anchor for any link that needs it. This removes the exact token responsible for the failure; rerun the gate after the author makes the edit. No file was edited in this review.

## R05 (P3) — Point the nonneutral definition to its actual location

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:535`: “Deligne–Milne, Definition 2.19 and §3, pp.24, 30–31”.

**Claim:** Definition 2.19 supports neutrality, but the supplied page range for the general Tannakian terminology misses the relevant definition and explanation.

**Witness:** DeligneMilne line 1452 is Definition 3.7 on printed p.32; line 1468 is Remark 3.9 explaining a fiber over an extension field. Definition 2.19 is at line 1116, p.24.

**Repair:** Cite Definition 2.19, p.24, and Definition 3.7 with Remark 3.9, p.32, in the linked version. These distinguish a fiber over F from one over an extension; the zero category still fails End(𝟙)=F and an ordinary odd super line still fails symmetric neutrality.

## R06 (P3) — Cite the general cyclic-condition localization theorem

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:770`, §4.11: “Require the cyclic permutation of `T⊗T⊗T` to act trivially”.

**Claim:** The general symmetric localization target cites Voevodsky §2.1, whose concrete construction uses the stronger two-factor interchange condition. The cyclic-condition generalization needs its own exact locator.

**Witness:** MVW lines 2568–2598, Proposition 8A.10 and Corollary 8A.11, printed p.65, give the filtered-colimit construction and its symmetric/triangulated structures under the cyclic condition.

**Repair:** Cite MVW Appendix 8A, Proposition 8A.10 and Corollary 8A.11, pp.65–66, for this general target; keep Voevodsky for its motivic application. An odd line has two-factor interchange −1 but three-cycle action +1, so the repaired locator supports a case the stronger condition excludes.

## Verified sound

The scope reviewed was the whole 1,744-line README and all 145 lines of Suggested.lean, at the specified head. I read the repository's Writing a roadmap checklist and CONTRIBUTING, and compared the shape with the main-branch PivotalSpherical and SchemeAndStackFoundations roadmaps. The worktree remained unchanged; the diff outside this roadmap folder is empty. No computational algorithm, sorry-defined data, set_option, alternate roadmap import, or admitted example was found. The arithmetic conclusions retain their stated conditional premises; they are not asserted as unconditional proofs of the cycle or rank conjectures.

The following are finite-instance checks and source/ownership checks, not a claim that elaboration proves the mathematical theorems. “Retain” in the tables means the computed instance agrees with the stated target; “repair” names a finding.

### Build, signature and padding evidence

- The worker gate fails only on R04. Its reported counters were: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=1 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`.
- I ran the permitted targeted build, `lake build TauCetiRoadmap.MotivesAndAlgebraicCycles.Suggested`: success. I then ran direct `lake env lean` on the supplied file: success, with exactly four sorry warnings.
- I elaborated a scratch copy with `#check @name` for all four declarations. The field, linearity, essential-smallness, exactness, faithfulness, rigidity and monoidal hypotheses remain in their elaborated signatures. No binder repair is needed. Jannsen's statement retains both endomorphism hypotheses and equality with the original preadditive structure.
- On a separate copy I tried `simp`, `rfl` and `infer_instance` as single-tactic proofs of each of the four admitted theorems. None closed. Searches by coalgebra, comodule, reconstruction, semisimplicity and antipode objects found no pinned theorem supplying one of these conclusions by a single `exact`. No padding finding is raised.
- There are four theorem declarations, zero local definitions or instances, and no colliding fully qualified declaration found in the roadmap searches. Each of the four names occurs in the README at lines 488, 965, 1120 and 1124.

### Headline inventory

The headline families are: the Chow category and its universal/identity principles and realizations; Jannsen numerical semisimplicity and its categorical criterion; integral cancellation, higher-Chow comparison, Chow embedding, compact-support duality and motivic measure; diagram-category reconstruction and geometric Nori realization; neutral/relative Tannaka reconstruction and the rigidity-to-antipode theorem; formal periods as the marked comparison torsor; standard-conjecture implications, Bloch–Beilinson/Murre equivalence and conditional motivic t-structure consequences; the real cycle/obstruction results; and conditional rank, height and arithmetic-theta results.

The four presently statable abstract headlines are exactly the four declarations at Suggested.lean lines 80, 94, 110 and 133. The module docstring identifies the missing geometric carriers for the other families: Chow and higher-cycle groups, transfer sheaves and motive categories, pair diagrams and Nori categories, relative coefficient representers, formal periods and marked fibers, equivariant semialgebraic cohomology, and arithmetic cycle/tower objects. Generic derived categories, a Hodge structure or a bilinear form do not replace these carriers. I found no additional missing statable geometric headline at these pins.

### Seeded source sample

Every one of the 15 requested sample targets was checked against legal source text. Source identifiers below are the fetch identifiers; line numbers refer to the service's numbered extractions. All references were attempted through that service: 55 reference bullets, including separate linked versions where needed. No source file or passage was copied into this report or the repository.

| Target | Locator opened and scope checked | Result |
| --- | --- | --- |
| 0.1 Graded correspondences | Stacks lines 90–191, §§3.1–3.3, pp.2–5: source-dimension grading, push/pull and composition | The degree and composition directions agree, including components of unequal dimension. |
| 0.2 Graphs, transpose, tensor | Stacks lines 192–290, §§3.4–3.6, pp.5–7 | The graph is contravariant; transpose changes degree by the dimension difference; products obey interchange. |
| 0.5 Adequate/numerical relations | Jannsen1992 lines 1–88, pp.447–449 | Adequacy, intersection-degree testing, and the trace identity support the stated normalized rational scope. |
| 1.5 Universal property | Stacks lines 405–442, Lemma 4.8, pp.10–11 | The additive idempotent-complete tensor target and inverted Lefschetz object give the claimed extension. |
| 2.8 Curves and kernels | Scholl lines 88–215, §§1.4–1.13, pp.3–6; MilneEtale lines 5546–5597, Theorem 24.1 and Remark 24.2, pp.144–145 | Projectors, twists, degree and projection formulas agree. R02 is a disconnected-curve error in the roadmap. The divisor/Kummer identification is explicitly in MilneEtale §23, line 5345, p.139; adding that locator would make the citation more direct. |
| 3.1 Numerical groups/trace radicals | Jannsen1992 lines 63–154, Lemmas 1–2 and Theorem 1 proof, pp.448–450 | The integer-valued intersection pairing gives finite rank; characteristic-zero traces are essential to the radical argument. |
| 3.6 Tannakian terminology | DeligneMilne lines 1116–1135 and 1438–1474, Definition 2.19, Definition 3.7 and Remark 3.9 | Neutral/nonneutral distinction is sound; repair the page locator in R05. |
| 4.11 Geometric subcategory/stabilization | MVW lines 4043–4075, Definitions 14.1–14.2, pp.109–110; lines 4903–4921, Theorem 16.25/Remark 16.26, p.131; Voevodsky lines 122–212, §2.1, pp.5–7; CisinskiDeglise lines 13493–13507, Theorem 11.1.13/Remark 11.1.14, p.307 | Thick closure, idempotent completion, compactness and the perfect-field cancellation scope agree. The unbounded compactness claim uses the §4.6 adapter, not arbitrary coproducts in the bounded-above category. |
| 4.13 Blowup/Gysin | Voevodsky lines 1090–1200, Propositions 3.5.2–3.5.4, pp.35–39 | Smoothness, perfectness, codimension and shifts agree; the two maps in the blowup triangle compose to zero with the stated sign. |
| 5.7 Nori generators/rigidity/fibers | HMS2014 lines 305–365, Lemma 1.13/Theorem 1.14, p.8, and lines 1164–1282, Appendix C, pp.26–28; HMSerrata lines 8351–8397 and 8704–8724, Theorem 9.1.10/Examples 9.1.11–13, pp.212–213, Corollary 9.2.23, p.221 | The field-valued rigidity restriction avoids the Dedekind torsion counterexample. The corrected universal property has a faithfully flat comparison extension. Nonproper comparison ownership needs R03. |
| 5.9 Geometric-to-Nori | Harrer lines 8029–8055, Theorem 7.3.1, pp.205–207; lines 8188–8212 and 8328–8348, Theorems 7.4.10/7.4.17, pp.210,213 | Contravariance, bounded derived target and inverse shift/Tate signs agree. The source permits k⊂ℂ and broader coefficients; the README explicitly extends Layer 5's base field in §6.10. No equivalence/full-faithfulness overclaim is made here. |
| 6.9 Period torsor | HMS2014 lines 447–480, Theorem 2.10/Corollary 2.11, p.11; lines 515–565, §3, pp.12–13 | Full period algebra is the comparison torsor; evaluation gives a point, not injectivity. Matrix composition fixes the left Betti/right de Rham actions. |
| 7.3 Standard conjectures | Kleiman lines 465–522, Theorem 4-1/Corollary 4-2, pp.14–15; lines 558–614, Proposition 5-1/Corollary 5-3, pp.16–18 | Rational algebraic images, hard Lefschetz as an extra hypothesis, B⇒A,C, D⇒A, and positivity plus A⇒D agree. Transport to another Weil theory correctly requires a compatible comparison. |
| 7.8 Real divisors/zero-cycles/blowups | BW1 lines 1486–1560, Propositions 2.8–2.10, pp.39–40; lines 1582–1668, Proposition 2.13/Lemma 2.14/Proposition 2.15, pp.41–44 | The arbitrary-real-closed divisor assertion keeps H²(O)=0; the blowup target explicitly excludes codimension-zero centers. Its indices agree with the source. |
| 7.18 Unitary rank specialization | LiLiu lines 65–150, equation (1.1), Conjecture 1.1 and footnote 2, pp.2–4 | Middle degree n−1, center 1/2, chosen cuspidal factor and the F=ℚ compactification qualification agree. It remains a conjecture predicate. |

For §4.11's general tensor localization I also opened MVW lines 2568–2602, Proposition 8A.10 and Corollary 8A.11, pp.65–66. This supplies the precise cyclic-condition generality and the triangulated structure; R06 supplies the corrected locator.

### Adversarial values

Notation: pt=Spec k; L is the Chow Lefschetz object; R is the coefficient ring in Layer 4. Matrix products use the stated order, with the right factor applied first. The 152 rows record the operation or conclusion tested and the value of its comparison or wrong alternative. Separate rows distinguish materially different statements within a subsection.

| Statement | Instances tried | Computed values on the two sides / excluded alternative | Result; change |
| --- | --- | --- | --- |
| 0.1 correspondence grading | pt; ℙ¹; empty source | Corr⁰(pt,pt)=ℚ; identity degree 0; empty-source group=0 | Retain |
| 0.1 composition | Two points; a=E₂₁,b=E₁₂ | b∘a=E₁₁; a∘b=E₂₂, unequal | Retain order |
| 0.2 graph/transpose | Inclusion pt→ℙ¹ | Graph in Corr⁰(ℙ¹,pt); transpose in Corr⁻¹(pt,ℙ¹), since 0−1=−1 | Retain |
| 0.2 external product | Scalar correspondences 2,3 on pt | Exterior product and action both 6; identity factors give 1 | Retain |
| 0.3 projectors | Pointed genus-one curve | Ranks (π₀,π₁,π₂)=(1,2,1); pairwise products 0; sum identity rank 4 | Retain |
| 0.4 algebraic equivalence | ℙ¹⊔ℙ¹; divisor (1,−1) | Total degree 0; component degree vector (1,−1), so not algebraically trivial | Retain; contrast R02 |
| 0.5 numerical testing | ℙ¹×ℙ¹, u²=v²=0, uv=1 | (u−v)(u+v)=0; (u−v)u=−1 | Retain all complementary tests |
| 0.5 normalization | pt; total equivalence relation | Correct quotient ℚ with deg(1)=1; total relation would impose 1=0 | Retain normalization |
| 0.5a supports/purity | Empty support; (𝔸¹,{0}) | Empty supported groups=0; nonzero purity term in degree 2 with twist 1 | Retain |
| 0.5b residue convention | Uniformizer t, unit u, t³u | Residue/valuation=3; for u alone 0; two successive boundaries compose to 0 | Retain |
| 0.5c inseparable multiplicity | k=𝔽ₚ(t), adjoining t^(1/p) | Finite pushforward degree p; replacing the nonreduced base change by multiplicity 1 loses factor p | Retain |
| 0.6 universal support | ℙⁿ; a positive-genus curve | CH₀(ℙⁿ_K)=ℤ, support dimension 0; curve needs dimension 1 in general | Retain quantifier over extensions |
| 0.6 coniveau range | d=3, support dimension s=2 | The stated low-degree range has p=0; it does not assert all-degree vanishing | Retain |
| 0.6 real restriction | Real curve with two real components | A divisor with parity vector (1,1) has nonzero Borel–Haefliger vector, despite even total degree | Retain component data |
| 0.7 indices | Anisotropic conic; ℙ¹; empty scheme | Conic index=2 but χ(O)=1; ℙ¹ gives 1; empty gcd convention gives 0 | Retain distinct indices |
| 0.8 torsion cycle | Order-two class τ in the stated quadric example | 2τ=0, τ⊗ℚ=0; an integral parity detector can still have value 1 mod 2 | Retain integral/rational distinction |
| 1.1 twisted Hom | Unit twists m,n; zero projector | Hom=ℚ for m=n and 0 otherwise; projector 0 gives zero object | Retain |
| 1.2 Tate/additivity | 𝟙(1)⊗L; empty sum | Twist 1+(−1)=0 gives 𝟙; empty sum gives 0 | Retain |
| 1.3 duality | 𝟙(m); ℙ¹ | Dual twist −m; evaluation/coevaluation compose to identity; ℙ¹ dual is h(ℙ¹)(1) | Retain |
| 1.4 Chow/identity principle | L; unit | CH¹(L)=ℚ, CH⁰(L)=0; CH⁰(𝟙)=ℚ | Retain degrees |
| 1.5 universal extension | F(L)=U, 𝟙(1) | F(𝟙(1))=U⁻¹; F(L⊗𝟙(1))=U⊗U⁻¹=𝟙 | Retain |
| 1.6 projective formula | ℙ²; ranks 0,1 | Diagonal=h₁²+h₁h₂+h₂², coefficients all 1; projective rank 0 gives 0, rank 1 gives h(X) | Retain |
| 1.7 adequate quotients | Numerical pt; total quotient | End(𝟙)=ℚ versus 0; the latter is excluded by point normalization | Retain |
| 2.1 Koszul symmetry | Degree-one line; degree-two line | Self-interchange −1 versus +1; squared interchange 1 in both | Retain |
| 2.2 Weil dimensions/trace | ℙ¹; elliptic curve; disjoint pair of ℙ¹ | Euler traces 2,0,4; disjoint H⁰ and H² each dimension 2 | Retain finite support/components |
| 2.3 Tate rescaling | Dimension 1, marking scaled by λ=2 | Divisor class multiplied by 1/2, trace by 2; trace of class remains 1 | Retain directed marking |
| 2.3 homological ⇒ numerical | Class zero; complementary class arbitrary | Cup product=0, degree pairing=0; converse is not assumed | Retain |
| 2.4 Chern normalization | Structure sheaf of a codimension-two point | Leading c₂=−[pt]; multiplying by (−1)^(2−1)/(2−1)!=−1 recovers [pt] | Retain |
| 2.5 normalized comparison | ℙ¹ point class | Raw integral 2πi; twist normalization multiplies by (2πi)⁻¹, giving trace 1 | Retain |
| 2.6 field trace | Spec ℚ(i) over ℚ | Two embeddings; trace of 1 is 2 on both algebraic and Betti sides | Retain |
| 2.6 de Rham Chern sign | O(1) on ℙ¹ | Deligne c′ convention integrates to −2πi; −c′ integrates to +2πi | Retain convention |
| 2.7 Frobenius | ℙ¹/𝔽_q, q=2 or 3 | H² eigenvalue q; Tate eigenvalue 1/q; twisted product 1 | Retain geometric Frobenius |
| 2.7 prime restriction | ℓ=char k | μ_(p^n)(ksep)={1} for every n; its inverse limit has rank 0, not the required rank 1 | Excluded by hypothesis |
| 2.8 zero-degree Check | ℙ¹⊔ℙ¹, D=(1,−1) | deg=0; cl=(1,−1)≠(0,0) | Fails; R02 |
| 2.8 finite-map formula | First-component inclusion; degree-two map of ℙ¹ | f_*f*=diag(1,0) in first case; 2 id in second | Retain locally constant degree |
| 3.1 trace radical | Genus-two curve | Supertrace id=1−4+1=−2; total dimension=6 | Retain signed trace |
| 3.1 characteristic-zero need | Identity on 𝔽ₚ^p | Tr(id^n)=p=0 for every n≥1, but id is not nilpotent | Positive-characteristic shortcut excluded |
| 3.2 Jannsen criterion headline | Finite K-spaces, dimensions 0,1,2 | Decompositions have n=0,1,2; endomorphism rings 0,K,M₂(K) are semisimple | Retain; zero object not forced simple |
| 3.2 radical negative control | Dual numbers K[ε]/ε² | ε≠0, ε²=0; endomorphism radical nonzero, failing semisimplicity | Retain hsemi |
| 3.3 numerical semisimplicity | Point; zero motive | End rings ℚ and 0; simple decompositions have 1 and 0 summands | Retain normalized scope |
| 3.4 lifting | Upper triangular matrices modulo strictly upper triangular ideal | e=diag(1,0), f=[[1,1],[0,0]]: e²=e, f²=f, f−e in square-zero radical | Retain nonunique lifts |
| 3.5 signed symmetry | Genus-two curve; odd line | Original ranks −2,−1; corrected ranks 6,1 | Retain distinction |
| 3.6 neutral terminology | Vec_F; zero category; odd super line | End units F,0,F; odd line trace −1 conflicts with ordinary one-dimensional trace +1 | Retain; locator R05 |
| 4.1 finite correspondences | 𝔸¹→pt and its transpose | Graph finite over 𝔸¹; transposed support has dimension-one fiber over pt | Retain source finiteness |
| 4.1 inseparable graph | Frobenius of 𝔸¹ in characteristic p | Graph/transpose transfer composite p id, not id | Retain multiplicities |
| 4.2 transfer tensor | Transfer 2id and two factors | Correct single diagonal transfer factor 2; separately transferring both factors gives 4 | Retain Day-tensor distinction |
| 4.2 disjoint sums | Two-point representable squared; empty scheme | Product has 4 points; empty representable is 0 | Retain |
| 4.3 Nisnevich condition | Spec ℂ→Spec ℝ; identity field cover | First has no residue-field-preserving lift, second has one | Retain |
| 4.3 cohomological obstruction | Gₘ on ℙ¹ and 𝔸¹ | Pic(ℙ¹)=ℤ, Pic(𝔸¹)=0 | Retain derived, not sectionwise, descent |
| 4.4 Suslin differential | Constant simplicial abelian group | Alternating face sums are 0,id,0,id,…; positive homology 0 | Retain |
| 4.4 Tate/weight one | Gₘ; pt | Reduced Gₘ motive shifted by −1 gives R(1); integral H^(1,1)(k)=k× | Retain |
| 4.5 homotopy tests | Gₐ versus Gₘ over a field | k→k[t] is not onto; k×→k[t]× is an isomorphism | Retain |
| 4.5 contraction | Gₘ | Units k[t,t⁻¹]×/k×=ℤ; next contraction=0 | Retain |
| 4.5 finite-field descent | Coprime degrees 2 and 3 | (−1)·2+1·3=1; degree 2 alone cannot invert 2 integrally | Retain integral descent |
| 4.6 derived tensor | ℤ/2⊗ᴸℤ/2 | H⁻¹=ℤ/2 and H⁰=ℤ/2; ordinary tensor gives only H⁰ | Retain |
| 4.6 boundedness | ⊕ₙ≥0 R[−n] for R≠0 | Cohomology in degrees 0,1,2,…; no upper bound | Retain ambient category |
| 4.7 higher cycles | pt, codimension 0 | CH⁰(pt,0)=ℤ; CH⁰(pt,n)=0 for n>0 | Retain |
| 4.8 localization/homotopy | 𝔸¹ | CH₀(𝔸¹)=0; CH₁(𝔸¹)=ℤ; flat pullback raises cycle dimension by 1 | Retain |
| 4.8a specializations | A length-p inseparable fiber | Fundamental cycle multiplicity p; reduced support alone has coefficient 1 | Retain |
| 4.8b smooth-pair coordinates | (𝔸², coordinate 𝔸¹); codimension 0 | Normal rank 1 in first case, 0 in second | Retain adapted coordinates |
| 4.9 cancellation rational function | n=1; n=0 | (t²−1)/(t²−t)=(t+1)/t, divisor on Gₘ has degree 1; n=0 denominator vanishes identically | Retain “large enough” index |
| 4.9 cancellation headline | Unit and Tate twist | End(R)=R=End(R(1)); zero coefficients give 0=0 | Retain perfect-field scope |
| 4.10 complex comparison | K=F[1] | H⁻¹(K)=F, whereas a degree≥0-only comparison sees 0 | Retain all degrees |
| 4.10 cdh topology | Nilpotent thickening; empty center blowup | Same reduced cycle data; empty-center blowup is identity | Retain; not all universal homeomorphisms |
| 4.11 geometric compactness | Unit; infinite sum of units, R≠0 | Unit is compact; identity matrix on the infinite sum has infinitely many nonzero columns and cannot factor through a finite subsum | Retain |
| 4.11 cyclic condition | Odd graded line T | Two-factor interchange −1; three-cycle sign (−1)²=+1 | Retain; locator R06 |
| 4.11 tensor inversion | Discrete tensor monoid ℕ; tensor object ℚ in Ab | Exponents become ℤ; ℤ/p⊗ℚ=0 | Retain full-faithfulness hypothesis |
| 4.12 projective bundles | ℙ⁰,ℙ¹,ℙ²; rank 0 bundle | 1,2,3 Tate summands respectively; rank-zero projective bundle gives 0 | Retain |
| 4.12 Mayer–Vietoris sign | Cover with one member all of X | Composite from intersection is i−i=0; two plus signs would give 2i | Retain |
| 4.13 blowup splitting | Divisor; point on smooth surface | Extra summand counts 0 and 1; latter is R(1)[2] | Retain c≥1 |
| 4.13 Gysin boundary | (𝔸¹,{0}), parameter t | Boundary(t)=+1; purity target R(1)[2] | Retain |
| 4.14 relative cycles | st=1 in 𝔸¹×𝔸¹ | Generic fiber one point, fiber at s=0 empty; quasi-finite but not finite over source | Retain distinction |
| 4.15 bivariant groups | pt; 𝔸¹ | Integral A₀,₀(pt,pt)=ℤ; A₀,₀(pt,𝔸¹)=0; Suslin H₀(𝔸¹)=ℤ | Retain integral definition; R01 for its use |
| 4.16 cycle duality | U=pt then U=ℙ¹ | Cycle-dimension shift 0 then +1; homological index stays i | Retain |
| 4.16 Gysin sequence | Codimension c=1 | Closed cycle index r+1; boundary index i−1 | Retain |
| 4.17 compact support headline | pt; 𝔸¹; empty scheme | Mᶜ(pt)=R, Mᶜ(𝔸¹)=R(1)[2], Mᶜ(∅)=0; ordinary M(𝔸¹)=R | Retain |
| 4.17 higher-Chow headline | H^(2,1)(ℙ¹,R); out-of-range a>2b | First group R=CH¹(ℙ¹;R); negative higher-Chow degree gives 0 | Retain |
| 4.18 representability | pt, R=𝔽₂ and R=0 | Written formula compares 𝔽₂ to ℤ, and 0 to ℤ; repaired RHS gives 𝔽₂ and 0 | Fails; R01 |
| 4.18 Chow embedding headline | L; 𝟙(1) | Images R(1)[2] and R(−1)[−2]; applying both twists gives R | Retain contravariance/transposition |
| 4.18 projective Hom | X=Y=ℙ¹, i=0, R=ℤ/2 | Hom=(ℤ/2)²=CH₁(ℙ¹×ℙ¹)⊗ℤ/2; positive-Ext formula gives 0 | Retain later corrected formula |
| 4.19 compact duality headline | X=𝔸¹, d=1; X=pt | Mᶜ(X)(−1)[−2]=R=M(X)∨; point gives R∨=R | Retain |
| 4.19 Tate extension | Hom(R,R(1)[1]) | k×⊗ℤR in the flat rational case; no assertion that all Tate extensions vanish | Retain |
| 4.20 motivic measure headline | ℙ¹=𝔸¹⊔pt; Gₘ=𝔸¹−pt | [ℙ¹]=L+1, [Gₘ]=L−1; [M[1]]=−[M] | Retain additive K₀ supplier |
| 5.1 endomorphism coalgebra | One vertex K²; two K-vertices with identity arrow | End algebras M₂(K), dimension 4, and K, dimension 1; zero arrow instead gives K² | Retain diagram relations |
| 5.2 reconstruction headline | Vec_K; finite modules over K[ε]/ε² | First coefficient coalgebra K; second has dimension 2 and nonsemisimple comodules | Retain; not a semisimplicity assertion |
| 5.3 pair motives | (X,X); (Gₘ,{1}) | First relative cohomology 0; second H¹=ℚ(−1) | Retain |
| 5.4 cellular filtration | (𝔸¹,{0,1}) | Differential ℚ→ℚ² is diagonal, rank 1; relative H¹ has dimension 1 | Retain actual differential |
| 5.5 total complex | Two degree-one differentials | Mixed terms in d² have coefficients +1 and −1, sum 0 | Retain Koszul boundary |
| 5.6 ordinary tensor symmetry | Two degree-one good-pair classes | Geometric flip −1; correction −1; ordinary composite +1 | Retain |
| 5.6 canonical localization | ℚ[t]→ℚ, t↦1 | Kernel=(t−1)≠0; ℚ[t,t⁻¹] has no such kernel from ℚ[t] | Retain universal property |
| 5.7 generators/rigidity | Two-point support; torsion ℤ/2 | Support H⁰ dimension 2, hence two Tate summands; Hom_Z(ℤ/2,ℤ)=0, so torsion is not dualizable | Retain field restriction |
| 5.7 geometric comparison | Gₘ; 𝔸¹ | H¹_dR(Gₘ)=ℂ·dlog t with period 2πi; H¹_dR(𝔸¹)=0 | Mathematics retained; ownership R03 |
| 5.8 correspondence action | rΔ, r=0,−1,2 | Actions 0,−id,2id; sum of two point maps is sum, not half-sum | Retain |
| 5.8 equivariance | S₃ over ℚ; coefficients of characteristic 2 | Rational averaging has factor 1/6; this factor is unavailable in characteristic 2 | Retain rational invariant comparison |
| 5.9 Nori realization headline | pt; R(1)[2] | Images ℚ_N[0], L_N[−2]; cohomology of latter occurs in degree 2 | Retain inverse shifts |
| 5.9 choice independence | Cellular model for (𝔸¹,{0,1}) | Rank-one differential persists; replacing by graded groups alone loses that map | Retain derived comparison |
| 6.1 finite reconstruction | Gₘ character of weight 1 | Tensor square has weight 2, outside the one-weight finite hull; full closure contains all integer weights | Retain finite-hull distinction |
| 6.2 neutral reconstruction headline | Rep(Gₘ); Rep(μₚ) in characteristic p | Coordinate rings K[t,t⁻¹] and K[t]/(tᵖ−1); second remains nonreduced, not replaced by trivial point group | Retain all characteristics |
| 6.2 antipode headline | Group-like t in K[t,t⁻¹] | S(t)t=tS(t)=1; choosing S(t)=t instead gives t²≠1 | Retain both convolution laws |
| 6.2 antipode degenerate | Unit element 1; primitive x in K[x] | S(1)=1; (−x)+x=x+(−x)=0=ε(x) | Retain |
| 6.3 finite type vs finite | Gₘ; trivial group | K[t,t⁻¹] finitely generated as algebra but infinite-dimensional; K is one-dimensional | Retain |
| 6.3 functor of points | μ₂ over K of characteristic 2, R=K[ε]/ε² | 1+ε has square 1 and differs from 1; K-valued points alone miss it | Retain nonreduced algebras |
| 6.4 coequalizer | Matrix units E₁₂,E₂₁ | Products E₁₁ and E₂₂ differ; naturality relations must use actual composition order | Retain |
| 6.4 finite coefficient pieces | Gₘ weights in finite S | Coalgebra dimension #S; increasing union has basis indexed by ℤ | Retain finite-valued restriction |
| 6.5 heap | Additive integers 5,2,3 | h=5−2+3=6; h(x,y,y)=x; wrong x+y+z gives x+2y | Retain |
| 6.5 nonabelian heap | S₃, x=(12), y=(123), z=(23) | xy⁻¹z=(132), whereas xyz=id; h(x,y,y)=(12) | Retain inverse middle factor |
| 6.5 unpointed torsor | Real μ₂-torsor t²=−1 | No ℝ-point; over ℂ two points ±i; choosing an ℝ-origin is impossible | Retain no chosen point |
| 6.6 integral coefficients | Relation 2(y−x)=0 | Quotient ℤ⊕ℤ/2; its ordinary ℤ-dual loses the ℤ/2 term | Retain integral warning |
| 6.6 matrix coefficients | Functional picking entry (1,2) | On E₁₂ value 1; diagonal-only coefficients give 0 | Retain full coefficient algebra |
| 6.7 full formal periods | Unit; Tate period ℓ | per(1)=1, per(ℓ)=2πi, per(ℓ⁻¹)=(2πi)⁻¹ | Retain localization |
| 6.8 actions/extension | b=[[1,1],[0,1]], d=[[1,0],[1,1]] | bd=[[2,1],[1,1]]; db=[[1,1],[1,2]] | Retain sided actions |
| 6.9 torsor headline | Φ=I, x=bd | xΦ⁻¹=x=Φ⁻¹x; h(Φ,Φ,Φ)=I; bΦd=bd≠db | Retain |
| 6.9 Tate coactions | Laurent generator t | Left u⊗t, right t⊗v; heap t⊗t⁻¹⊗t | Retain |
| 6.10 Artin case | Quadratic extension; S₃ Galois extension | Fibers dimensions 2 and 6; quadratic splits 1⊕sign; regular algebra dimension 6, not M₆ dimension 36 | Retain |
| 6.10 pure Tate | 1⊕L; weight n | End=ℚ×ℚ; automorphism a acts by aⁿ; self-symmetry of L is +1 | Retain |
| 7.1 Hodge inverse image | tate 0; tate(−1); zero comparison | Relevant pieces ℚ in types (0,0),(1,1); wrong pieces 0; zero comparison has full inverse image | Retain injectivity qualification |
| 7.2 Tate target | pt⊔pt over finite field | Invariant target ℚ_ℓ²; one point spans (1,0), not (0,1) | Retain components |
| 7.2 strong Tate | Frobenius [[1,1],[0,1]] | Fixed space dimension 1; no invariant complementary line | Retain separate semisimplicity condition |
| 7.2 rational injection | Finite-field versus complex elliptic curve | Finite-field Pic⁰⊗ℚ=0; complex nontorsion degree-zero class survives ⊗ℚ with class 0 | Retain finite-field scope |
| 7.3 Lefschetz inverse | Curve, deg η=a>0 | L sends 1 to a·[pt]; inverse sends [pt] to 1/a | Retain rational representative |
| 7.3 primitive positivity | ℙ¹×ℙ¹, primitive u−v | (u−v)²=−2; signed surface form=+2 | Retain sign |
| 7.3 compared realization | ℙ¹, graded map h↦2h | Trace changes 1→2; dimensions stay (1,1); map fails normalized comparison | Retain extra comparison laws |
| 7.4 Frobenius projectors | ℙ¹/𝔽₂ | (2−T)/(2−1) takes values 1,0 at T=1,2; (T−1)/(2−1) takes 0,1 | Retain coprime factors |
| 7.4 norm coefficient | n=3 | ((n−1)!)ⁿn!=2³·6=48; n!ⁿ=216 | Retain corrected coefficient |
| 7.5 filtration headline | Curve and projective space | Curve F¹CH¹=Pic⁰⊗ℚ, F²=0; projective-space positive filtration=0 | Retain conjectural equivalence, not existence claim |
| 7.5 projector descent | Diagonal ℚ→ℚ² | Image consists of (a,a); idempotent (1,0) is not in it | Retain rational representative requirement |
| 7.6 motivic t-structure | M(ℙ¹)=R⊕R(1)[2] | Second summand contributes in shifted degree −2 before cohomological realization; not two unshifted heart objects | Retain conditional t-structure scope |
| 7.6a equivariant groups | C₂, trivial and sign ℤ | Trivial H⁰=ℤ,H²=ℤ/2; sign H⁰=0,H¹=ℤ/2 | Retain twists |
| 7.6b real/complex purity | Real codimension-one immersion | Real degree shift 1; complex equivariant shift 2 with Tate twist 1 | Retain distinct normalizations |
| 7.7 admissibility | Real point; nonreal conjugate pair | Point class degree 1 on its real component; norm class degree 2 | Retain integral target |
| 7.7 zero/out-of-range | Empty variety; codimension beyond dimension | Cycle and admissible target both 0 in the stipulated range conventions | Retain |
| 7.8 blowup indices | c=1,2,3 and k=2 | Extra terms: none for c=1; one for c=2; for c=3 indices i=0,1 and powers ξ,1 | Retain |
| 7.8 excluded zero center codimension | Blow up pt along itself | Rees Proj empty; degree-zero map ℤ→0 is not iso | Correctly excluded |
| 7.8 projective space | ℙ², k=0,1,2,3 | Admissible generators 1,h,h²,0 | Retain |
| 7.9 genus/one-cycles | Anisotropic real conic | Genus 0, χ(O)=1; closed-point degrees even but curve itself has cycle multiplicity 1 | Retain distinct detectors |
| 7.9 norm parity | Nonreal point, odd-degree transfer | Norm degree 2; an odd transfer has degree 1 modulo 2 | Retain parity |
| 7.10 dimension restriction | Real genus-one curve with real point | With a real point the stated torsion descent holds; its only integral curve is itself, of genus 1≡1 mod 2, not even genus | Retain d≥2 alternative |
| 7.11 quaternionic action | T(A,B,C,D)=(B̄,−Ā,D̄,−C̄) | T²(A,B,C,D)=−(A,B,C,D); a fixed vector is 0 | Retain correction |
| 7.11 invariant-line obstruction | Tv=a v, v≠0 | T²v=abs(a)²v cannot equal −v since abs(a)²≥0 | Retain |
| 7.11 Euler example | B×ℙ¹ for genus-one B | χ(O)=0, not odd; h¹(O)=1 | Retain odd-Euler hypothesis |
| 7.12 coefficient boundary | Integral Bockstein on BC₂, degree 1 | H¹(BC₂,ℤ/2)=ℤ/2 maps isomorphically to H²(BC₂,ℤ)=ℤ/2; generator 1 maps to the nonzero order-two class | Retain degree +1 |
| 7.13 torsion calculation | ℤ⊕ℤ/2⊕(ℝ/ℤ)³⁰ | Torsion=ℤ/2⊕(ℚ/ℤ)³⁰; free ℤ contributes 0 | Retain conditional calculation |
| 7.14 cycle questions | Line in ℙ³; anisotropic conic | Degree-one cycle exists in first case; degree-one zero-cycle absent in second | Retain existential quantifiers |
| 7.15 compatible Hodge/Tate classes | Unit; nonzero Tate twist; nontrivial quadratic Artin character | Unit fixed type-(0,0) space ℚ; wrong-weight and nontrivial fixed-character spaces 0 | Retain both compatibility conditions |
| 7.16 rank predicate | Elliptic curve rank 0 | Rational Mordell–Weil dimension 0; torsion need not be zero; classical center is s=1 | Retain rational rank |
| 7.17 rational vs complex positivity | ℓ(u,v)=u−√2v, b=ℓ⊗ℓ | b(x,x)>0 for nonzero x∈ℚ²; b((√2,1),(√2,1))=0 over ℝ/ℂ | Retain stronger complex premise |
| 7.17 primitive exponent | d=3,p=2; d=2,p=1 | m=0 and primitive ker L; m=1 and primitive ker L² respectively | Retain |
| 7.17 height normalization | Extension degrees 1,2, then 3 | Raw multipliers 1,2,6; absolute multiplier 1 throughout | Algebra consistent; source limitation below |
| 7.18 rank specialization | n=2; base change with two factors of orders 1 and 2 | Shimura dimension 1; selected order 1 versus product order 3 | Retain chosen factor |
| 7.19 archimedean factor | r=1 and even [F:ℚ]=2 | C₁=−π/4; C₁²=π²/16>0 | Retain |
| 7.19 local/cardinality premise | q=3; exactly two split places | Denominator q+1=4≠0; split-place count 2 satisfies ≥2 | Retain |
| 7.19 nonvanishing conclusion | A localized module of dimension 2 | Module≠0 holds but dimension=1 fails | Retain nonvanishing, not rank equality |

The sample formulas also retain the following limits on inference: positive-characteristic étale realization excludes ℓ=char k; the real-closed theory uses semialgebraic cohomology rather than analytic Hodge theory; resolution-dependent compact-support arguments do not supply resolution in positive characteristic; and the local arithmetic intersection identity remains an explicit hypothesis until its separate model comparison is proved.

### Pinned declarations and ownership

Pins checked against lake-manifest.json: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In the paths below, `Mathlib/` and `TauCeti/` denote the respective library repository roots at those pins.

| Opened pinned declaration | What the body/signature supplies |
| --- | --- |
| `Mathlib/CategoryTheory/Simple.lean:52`, `Simple` | The mono/isomorphism characterization excludes calling the zero object simple; n=0 handles it in the Jannsen conclusion. |
| `Mathlib/CategoryTheory/Abelian/Basic.lean:111`, `Abelian` | Includes preadditivity, so explicitly preserving the supplied preadditive structure matters. |
| `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:530`, `Functor.Braided` | Extends the monoidal functor structure; the reconstruction signature is not merely lax monoidal. |
| `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean:64`, `FGComoduleCat.isFG` | Module.Finite is part of the finite-comodule carrier. Over a field this gives finite dimension. |
| `TauCeti/Algebra/Coalgebra/Comodule/Finite/Abelian.lean:68` and lines 94,101 | Abelian structure and exact forgetful functor under the module's Noetherian/flat hypotheses; the field specialization used here is valid. |
| `TauCeti/Algebra/Coalgebra/Comodule/Finite/Symmetric.lean:61` and lines 81,93,102 | Tensor braiding, braided forgetful functor and symmetry for the given commutative bialgebra. Does not construct the bialgebra from an arbitrary category. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:63` and line 138 | `tensorAutFunctor`, `pointsFunctorIsoTensorAutFunctor` reconstruct a given group's points from its representation fiber. They are not arbitrary-category reconstruction. |
| `TauCeti/Geometry/Hodge/Tate/Basic.lean:91`, lines 100,111,133 | `tate`, its filtration and piece computations: weight −2m and piece index −m. |
| `TauCeti/Geometry/Hodge/Morphism.lean:130` | `map_piece_le` uses the actual Hodge-morphism hypothesis. |
| `TauCeti/Algebra/Category/GradedVectorSpace/Basic.lean:68` | Native carrier is integer-graded ModuleCat; it imposes no finite-total-dimension condition. The roadmap's restriction adds something. |
| `TauCeti/Algebra/Homology/GradedCochainComplex.lean:59` | `gradedCochainComplex` packages graded differential data, not geometric cohomology. |
| `TauCeti/CategoryTheory/Monoidal/Rigid/Biproduct.lean:154` and line 161 | Finite-biproduct coevaluation/evaluation are already supplied. |
| `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean:139`, lines 147,155,193,281,327 | `TriangulatedK0`, generators, triangle/shift relation, lift and map. Section 4.20 appropriately adds the tensor ring and geometric measure. |
| `TauCeti/RepresentationTheory/QuaternionicStructure.lean:68`, lines 94,100 | Square −1 and intertwining; bijectivity and absence of fixed vectors. The particular coefficient action and invariant-line calculation remain separate. |

I searched objects, not just the four proposed names, in the pins, main roadmaps, supplied open heads and board packages, using the roadmap search tool as well as local searches. Search terms included Chow and higher cycles, finite correspondences, Suslin complexes, finite comodules, arbitrary reconstruction, formal periods, supported/Gersten cohomology, tensor localization, triangulated K₀, nonproper de Rham comparison and primitive heights.

Resolved ownership checks include:

- `TauCetiRoadmap/PivotalSpherical/README.md:318` and line 352: trace and finite simple-decomposition APIs. The latter starts with an abelian category; it does not subsume this roadmap's theorem constructing abelianness from endomorphism algebras.
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3701` through §2.14: Nisnevich topology, elementary distinguished squares and henselian points; the cited declarations are planned there, despite the resolver finding no pinned library versions. Its §§3.1–3.8 and 5.1–5.8 provide Picard/intersection inputs. The roadmap constructs transfer and motive adapters, not a second Chow-group foundation.
- `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:647`, lines 981,1001,1043,1122,1159,1182 and 1203: Künneth, classical/pro-étale/rational realizations, cycle classes, smooth trace, duality and Gysin. Their finite/invertible-coefficient and smoothness hypotheses are not silently discarded by the realization adapters.
- `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, lines 441,455 and 492: module-valued enhancement, replacements, tensor–Hom, derived limits and coherent functors.
- `TauCetiRoadmap/DifferentialGeometry/README.md:503`, lines 782,806,816, and `TauCetiRoadmap/AlgebraicTopology/README.md:326`, lines 471,946: integration, analytic de Rham, relative chains, excision, products and manifold duality.
- `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md`, §§5.2,5.5,6.2–6.4: characteristic-zero resolution, SNC compactification and coordinates. The smooth-pair coordinate adapter is distinguished from coordinates on a smooth ambient scheme.
- `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:513`, §3.0a: higher cycles, arbitrary derived coefficients, localization, homotopy and moving with coprime-degree finite-field descent. It supplies the named `motivicCycles` contract used in §§4.7–4.8.
- `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, §§7.1–7.2: rational gamma/Chow comparison and Chern-character normalization on smooth quasiprojective schemes; the smooth projective use is within that scope.
- `TauCetiRoadmap/ComplexComparisonPartII/README.md`, §§C5.1,C5.3–C5.4,C6.3–C6.6: proper complex and finite/relative/adic Artin comparisons. Its additional §C5.6 is the overlap in R03.
- `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:656` assigns formal-period construction to this roadmap; `TauCetiRoadmap/MotivicEtaleKTheory/README.md` consumes its motivic categories. `TauCetiRoadmap/AlgebraicTopologyPartII/README.md`, scope and exact contracts, consumes the semialgebraic/equivariant foundations rather than supplying them upward.
- `packages/MotivesAndAlgebraicCyclesPartII/design/README.md:5` expressly continues this roadmap into Banach/Berkovich motives. It does not make the present algebraic roadmap a re-plan of that extension.

The resolver's missing `StandardConjectures` name occurs as a downstream consumer, not a supplier; I did not turn that lead into an upward-dependency finding. The four abstract Lean declarations do not reuse a sibling roadmap's fully qualified name.

### Supplier direction and shape

I ran the requested dependency check with the supplied order and main content, including `--movable`. Its complete output was:

```text
depcheck: 205 roadmaps, 1551 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. I read all five literal Needs lines (README 63,393,423,439,1048) and the supplier/dependency prose. No supplier gap is declared. The internal ordering is finer than numerical layer order: §§7.6a–7.6b precede the real applications; the abstract fiber-extension result in §6.8 is used after the rigidity part of §5.7, not as a proof of that rigidity. These are not supply cycles.

All eight layers have Examples and Dependencies endings and each numbered subsection has Checks. Most API obligations and dependencies are written in paragraphs rather than the requested per-target API bullets and Needs lines; the author should expose direct dependencies beside individual targets when repairing the README. The most consequential ownership repair is R03. The Lean file has the required namespace, declaration docstrings and allowed imports, though it groups the four abstract results by namespace rather than using the requested per-layer section comments.

## Not verifiable

- **KunnemannPicard:** the reference for §7.17, *Higher Picard varieties and the height pairing*, DOI 10.1353/ajm.1996.0033, especially Conjecture 5.2, pp.786–787, and Theorem 6.1, p.788. The service encountered a publisher verification page; the institutional CiteSeer route redirected to an unavailable archive snapshot (404). This is the sole remaining missing-source entry. The elementary scalar/primitive-kernel checks above do not certify the claimed geometric normalization against that text.
- **KatzMessing:** Theorem 2(1), pp.76–77, remains service-marked uncertified because the DOI resolves to a paywall. I checked the conditional polynomial-projector construction directly and Kleiman's attribution, but not that primary proof. It is not re-requested as a missing text.
- Source checking outside the seeded sample was targeted at the displayed counterexamples, normalization issues and proof dependencies, not a line-by-line certification of all 55 works. In particular, the primary proofs behind the broad standard-conjecture/divisor register and every arithmetic height/local-model input were not independently reproduced. The explicit conditional statements in §§7.2 and 7.19 remain conditional.

## Source issues

- **Misprint** in Stacks at tag 0FH9, Lemma 8.5 proof, printed p.24: the source says the pulled-back norm Chern power has coefficient (n!)ⁿ; it should have coefficient ((n−1)!)ⁿn!, giving 48 rather than 216 for n=3; affects the proof.
- **Misprint** in Jannsen1992 at the grading formula preceding the modified symmetry, printed p.451: the source says the graded piece of (X,p,m) has final twist r; it should be (X,pπ^(r+2m),m); affects a stated result.
- **Misprint** in MVW at Theorem 16.25, final paragraph of proof, printed p.131: the source says Hom out of an arbitrary direct sum is the direct sum of Hom groups; it should be the product of Hom groups; affects the proof.
- **Error** in HMS2014 at Proposition C.4 and its Appendix C hypotheses, printed pp.26–28: the source says perfect-duality generators force rigidity over a Dedekind domain for the whole abelian category; it should require a field here or a suitable projective, non-abelian restriction; affects a stated result.
- **Misprint** in BW1 at the proof of Lemma 2.14, printed p.43: the source says δ equals ι*(γ−π*α); it should equal −ι*(γ−π*α), since the exceptional normal bundle is O_E(−1); affects the proof.

These source issues have direct witnesses: the square-free term of (x₁+x₂+x₃)³ has coefficient 6, not 27; 𝟙(1) should remain itself in graded degree −2; a map from a countable sum of units to the unit may have every component 1; ℤ/2 has no dual in finitely generated ℤ-modules; and on a surface blowup ι*ι*(1)=−ξ while the displayed δ is ξ. The Jannsen, MVW and BW1 formulas were also inspected in rendered source pages to exclude extraction errors. None is attributed to the author of this roadmap.

