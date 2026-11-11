<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13140#issuecomment-6785392047 -->
Review (codex) of c83b06c

Verdict: needs_changes

1. **F01** (P2) Untwisting requires a generator of the Haar module

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1640`, “for G unimodular with a chosen Haar measure this is Dist(T, Λ)^G.”

   **Claim:** Choosing a Haar measure supplies the identification between the Haar-twisted dual and ordinary invariant distributions.

   **Witness:** Take G = 1, T = one point, p = 2, Λ = ℤ/9 and μ = three times counting measure. Evaluation on μ is a ↦ 3a, with image and kernel {0,3,6}.

   These inputs satisfy the geometric and coefficient hypotheses. Both underlying modules are Λ, but the identification supplied by this choice is not invertible. Merely requiring μ ≠ 0 would not fix it. The supplier explicitly permits unnormalized and zero measures: open pull request #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1105` defines additive invariant ring-valued measures, and line 1119 distinguishes the zero measure from the normalized one. HKW22 line 1251 likewise describes a module of measures; line 1316 leaves the required normalization implicit.

   **Exact repair:** Require a chosen **generator of Haar(G, Λ)**, for example the measure normalized by μ(K) = 1 on a compact open pro-p subgroup K. Retain the canonical twisted formula without any choice. Add the ℤ/9 example as a negative-control Check. Tested repair: μ = 1 gives a ↦ a; a unit multiple gives an invertible scalar multiplication; μ = 3 is excluded.

2. **F02** (P3) The new profinite Check assumes a countable local basis

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:601`, “along a clopen neighbourhood basis U_0 ⊋ U_1 ⊋ ⋯ of t₀”.

   **Claim:** The displayed sequence constructs two independent distribution germs for an arbitrary infinite profinite set at a non-isolated point.

   **Witness:** Let T = {0,1}^I for uncountable I and t₀ = 0. Countably many clopens involve only countably many coordinates J. For i outside J, e_i belongs to every U_n but not to {x_i=0}.

   Compactness implies that each clopen depends on finitely many coordinates. Consequently no proposed countable family is a neighbourhood basis at t₀. The split-descent argument in the second half of the Check is correct; this finding concerns the new general distribution witness, not a counterexample to split descent or to nonsmoothness.

   **Exact repair:** Separate the valid statement that every nonempty profinite projection has split universal !-codescent from a concrete nonsmoothness Check with T = ℤ₂ and Λ = F₃. Use t₀ = 0, U_n = 2ⁿℤ₂, x_n = 2ⁿ and y_n = 3·2ⁿ. The sum defining ν is finite on every clopen. It gives δ₀(U_n) = 1 and ν(U_n) = 0; on W_n = 2ⁿ + 2ⁿ⁺²ℤ₂ it gives δ₀(W_n) = 0 and ν(W_n) = 1. Thus the two germs are independent. This changes only the illustrative Check, not the general theorem's scope. Alternatively supply an argument valid without first countability.

3. **F03** (P3) Positive dimension does not force nonisomorphism for zero sheaves

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1857`, “this object is not isomorphic … when U → T′ has positive dimension and Λ ≠ 0”.

   **Claim:** The twisted and untwisted exceptional targets are never isomorphic under those two conditions, for the arbitrary sheaves quantified in the subsection.

   **Witness:** Keep the stated one-dimensional ball, take Λ = F₃ and A′₁ = 0. Then both (c′)^!(A′₁ ⊠ A′₂) and its tensor product with q^*K are zero, hence isomorphic.

   **Exact repair:** Replace the universal assertion by “need not be isomorphic, as the following example shows”, retaining the explicit constant, nonzero coefficient example. Tested repair: for A′₁ = A′₂ = Λ, the two targets are Λ(2)[4] and Λ(1)[2], with H⁻⁴ respectively Λ and 0. For A′₁ = 0 both are 0. The twist in the construction remains necessary in general. Search the neighbouring VS11.5–VS11.8 passages for the same quantifier pattern; VS11.5's concrete obstruction is already correctly scoped.

4. **F04** (P3) Proposition 23.11 starts on the preceding page

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:431`, “Proposition 23.11, p. 146”.

   **Claim:** This is the page locator for the universal-openness statement.

   **Witness:** Sch17 lines 6085–6087 state Proposition 23.11 on printed page 145. The page-146 marker occurs at line 6096, inside its proof.

   **Exact repair:** Cite “Proposition 23.11, pp. 145–146” (or p. 145 for the statement). Reopening that range locates both the statement and proof. The mathematical use is correct, with separatedness, representability and cohomological smoothness retained.

Four findings: one P2 and three P3. The authored files were not changed. The source manifest needed no addition. Lean elaboration passed without warnings; the dependency check found no problems.

## Verified sound

### Prior findings, checked before the new pass

| Prior finding | Status and inspected replacement | Independent verification |
|---|---|---|
| F01: unrestricted proper-fine comparison | **Not repaired; settled under the brief's not-actionable rule.** README:657 says “Whether every proper fine map is cohomologically proper is not settled by the sources”. README:655 constructs c_f for every proper fine f and proves invertibility under the stated chart condition. | HKW22 lines 1165–1174 assert the comparison, but GHW22 lines 133–155 do not supply it. Sch17 line 5383 and GHW22 lines 600–614, 964–973 contain the neighbouring representability limitations cited in the new disclosure. No re-raised finding here. The repair report's suggestion of an *equivalence* with a representability question is not established by these texts; the README correctly uses only a sufficient condition. |
| F02: false nonsmooth ⇒ no descent Check | **Partly repaired.** README:601 now says “It is nonetheless of universal !-codescent”. | A section s gives f∘s=id and extra degeneracies of every base-changed augmented Čech nerve. That fixes the original error. The added distribution construction has the separate defect R02. |
| F03: assertion that no natural map exists | **Repaired at VS11.5.** README:1801 now compares the source Λ(2)[4] with the untwisted target Λ(1)[2] and acknowledges the zero map. | Their H⁻⁴ groups are Λ and 0 for Λ≠0; the twist restores Λ(2)[4]. The analogous new language in VS11.7 has the zero-sheaf defect R03. |
| F04: absent definition API / too few Checks | **Repaired.** README:1438–1446 gives seven API bullets; lines 1456–1461 give six Checks. One says sections over the two points have dimensions “2, 1 and 3”. | Restriction F₃²⊕F₃→F₃² has kernel F₃. On ℕ, compact sections are the direct sum while global sections are the product. README:661–667 also adds seven API bullets for c_f and cohomological properness; the finite-torsor calculation below checks their 2-cell compatibility. |

The changed passages, their new API bullets and their examples were reread. The same patterns were searched in the remaining text: sufficient versus necessary smoothness; maps versus isomorphisms; zero inputs in twist statements; and definition APIs. Unchanged material was not accepted merely because the previous report described it as sound: the 65 target sections were read, with a computed target ledger retained in scratch. The report below gives the seeded targets, headlines and findings rather than reproducing the entire ledger.

### Principles, shape and completeness

The introduction identifies exactly where the base roadmap stops and extends it rather than planning it again. The package uses arbitrary prime-to-p torsion coefficient rings, not just fields or good coefficient characteristics. No computational algorithm, copied source passage, sorry'd data, `set_option`, or unauthorized edit was found. Source statements are paraphrased with locators. The settled F01 scope limitation is recorded above, not silently certified as the unrestricted HKW theorem.

Read 65 numbered targets, all their Needs lines, all six layer dependency paragraphs, and all 28 explicit definition/construction API blocks. Each of those blocks has at least three Checks; the counts range from 3 to 8. R02 and R03 concern correctness rather than their number. Each layer has Examples and Dependencies. The heading structure, conventions, supplier contracts and references follow the requested form. Main-branch `EnhancedDerivedSheaves`, `DGAInfinity` and `PivotalSpherical` were read as shape comparisons.

The organization is mathematical: geometry → exceptional functors → categorical traces → relative trace formulas, with the independent locally profinite realization supplying the final representation/group-action layer. In particular the module realization is moved after the abstract trace layers, rather than retaining HKW's exposition order. The former-numbering table preserves the moved VS8–VS10 references. No layer is named after a source chapter. No process-residue or machine-path defect was found in the authored README or Lean file.

### Seeded source verification

All fifteen sampled targets were checked against the cached legal texts, including hypotheses and the printed-page boundaries. Eight cited works have eight manifest entries; none is missing, waived or unreadable. No author-marked unresolved locator remained. The mathematical qualifications/corrections in the README were checked, rather than treating a source's assertion as automatically proved.

| Target | Exact source evidence opened | Outcome |
|---|---|---|
| 6.1 Representable maps | GHW22 line 958, Definition 4.1, p.19; lines 964, 974, Warning 4.2 and Proposition 4.3, pp.19–20 | Correct test objects, representability, composition, base change and cancellation with 0-truncated quasiseparated second map. |
| 6.4 Fibre products | GHW22 line 1011, Proposition 4.5, pp.20–21 | Correct chart construction and diagonal cancellation; no separatedness of both arbitrary input maps inserted. |
| 6.5 Basic examples | GHW22 lines 90–98, discussion after Definition 1.1, p.3; HKW22 lines 1210–1214, p.25 | Analytic adic diamonds, Spd ℤ_p, Div¹ and both kinds of geometric point supported. |
| 6.6 Fine morphisms | GHW22 line 102, Definition 1.3, p.3; lines 1047, 1095, 1158, Remarks 4.6–4.7 and Proposition 4.8, pp.21–23 | Charts, local compactifiability and local finite dim.trg retained; permanence matches. |
| 6.9 Classifying stacks and 2-cells | HKW22 line 1053, Example 4.1.1, p.22 | Homomorphisms describe trivialized-torsor maps, not all unpointed maps. README's torsor formulation corrects this and keeps the nonabelian conjugation direction. |
| 6.10 Pullback/pushforward 2-cells | HKW22 line 1068, Remark 4.1.2, p.22 | Natural pullback transformations and their pushforward mates, including nontrivial automorphisms, supported. |
| 6.11 Proper fine/nice | Sch17 lines 2109–2129, Definition 10.7, Remark 10.8, Proposition 10.9, pp.51–52; lines 4118, 4132, Definition 18.1/Proposition 18.3, pp.100–101; lines 2974, 3091, 3094, Definition 12.12/Theorem 12.18/Remark 12.19, pp.72–75; line 6085, Proposition 23.11 | Properness is 0-truncated, not triviality of all 2-automorphisms. Spatial-v-sheaf point criterion retained. Page slip R04. |
| 7.7 Proper comparison | HKW22 line 1165, Theorem 4.1.8, p.24; GHW22 lines 133–155, Theorem 1.4, pp.3–4; Sch17 line 5383, p.130 | General comparison's source gap is disclosed. Construction and restricted invertibility were checked separately; prior F01 is settled, not claimed proved. |
| 7.11 Relative diagonal | HKW22 line 1192, Lemma 4.1.11, pp.24–25 | Inverse diagonal dualizing twist and the cohomologically smooth hypotheses agree. |
| 8.1 Duality and categorical traces | LZ22 lines 124, 131, 147, 176–177, Definition 1.1, Remark 1.2, Lemma 1.4, Notation 1.5 and Construction 1.6, pp.3–5 | Duality orientation, symmetry and trace morphisms agree; no identification of bicategorical data with existing 1-category data. |
| 8.10 Trace class | HKW22 lines 1529–1561, §4.3, pp.31–32 | Class lies in H⁰(Fix(c),K), uses dualizability and the correct adjunction/exchange maps; scalar only after integration. |
| 9.8 Perfect-scheme comparison | HKW22 lines 2374–2404, Proposition 5.3.2, pp.49–50 | Perfect, separated perfectly finite-type setup; proper c₁ and proper clopen fixed component; ULA and coefficient hypotheses retained. |
| 10.2 Sheaves as smooth modules | HKW22 lines 3604, 3619, Lemmas B.2.4–B.2.5, p.74 | Compact-open restriction, smooth/complete equivalences and inverse functors agree. |
| 10.10 Quotients | HKW22 lines 1306–1317, Example 4.2.5 and (4.2.1), p.27; prerequisite lines 1229–1233 | Geometric chart assumption and twisted invariant-distribution formula correct. Choice-dependent untwisting needs R01. |
| 11.11 Universal local term | HKW22 lines 1999–2040, §4.6, pp.41–42 | Fine X, smooth group diamond, ULA object, correspondence over G and action isomorphism retained. |

The four enhanced-category gap locators were also opened: LiuZhengEnhanced line 3906 (Proposition 2.2.4, pp.79–80), line 5220 (Theorem 4.1.8(1), p.105), LiuZhengGluing line 2057 (Theorem 5.4, pp.38–39), and GHW22's specialization. Edge adjointability, mixed-square Beck–Chevalley, factorization/admissibility/truncation and P0–P5bis are not replaced by unconstrained placeholders.

### Adversarial values

In this table S is a permitted geometric point; coefficient characteristics are prime to its p. These are explicit instance tests, not claims that testing proves a theorem. Finite sets are disjoint unions of S. Further target-by-target calculations are in the scratch ledger.

| Statement | Instances tried | Values on the compared sides / wrong model | Result and change |
|---|---|---|---|
| 6.1 representability | Two points → S; BC₂ → S | Fibre cardinality 2, automorphism group 1 for the first; automorphism group C₂ of size 2 for the second | Representable/nonrepresentable distinguished; none. |
| 6.4 products | 2 points × 3 points; empty factor | Product 6 points, diagonal 6 inside 36; empty product 0 | Chart and diagonal controls; none. |
| 6.5 decency examples | Spd C; Spd ℤ_p | Point with identity chart; two-point specialization space with generic/closed points, not a diamond | Decency not confused with diamondhood; none. |
| 6.6 fine maps | Identity; finite cover; smooth curve | dim.trg 0, 0, 1; a nontrivial BG has stabilizers but remains fine with the supplied chart | Generality retained; none. |
| 6.9 conjugation | S₃, h=(123), f₂(t)=(12), f₁(t)=(23) | h⁻¹f₁(t)=f₂(t)h⁻¹=(13); wrong reversed terms are (12) and (23) | Nonabelian direction fixed; none. |
| 6.9 automorphisms | BS₃; its distinguished point | Aut(id_BS₃)=Z(S₃)=1; Aut(S→BS₃)=S₃ has size 6 | 0-truncated map does not kill 2-cells; none. |
| 6.10 mates | q:S→BC₂, regular/sign representations over F₃ | Nontrivial 2-cell gives swap matrix, not identity; on sign gives -1=2 | Pullback and pushforward transformations nontrivial; none. |
| 6.11 properness | q:S→BC₂; BC₃→S | First fibre has 2 points and is proper nice; second diagonal fibre has 3 points and is not an injection | Second map not proper; R04 only locator. |
| 7.4 nonsmooth Check | {0,1}^I, I uncountable; ℤ₂ | e_i lies in every proposed U_n but outside {x_i=0}; for repaired ℤ₂ example (δ(U_n),ν(U_n))=(1,0), (δ(W_n),ν(W_n))=(0,1) | Countable basis unjustified; R02. |
| 7.4 split descent | Any nonempty profinite T; base change S′ | f∘s=id; s^!f^!=id; inserted t₀ satisfies the extra-degeneracy identities | Original false negative control repaired; no new change. |
| 7.5 exceptional functors | BC₃→S, p=2, Λ=F₃ | H⁻¹(Rf_!Λ)=F₃, H⁻¹(Rf_*Λ)=0; H¹(Rf_*Λ)=F₃ | Functor is not a disguised ordinary pushforward; none. |
| 7.6 projection formula | Fold; A ranks 2,1; B rank 3 | (2+1)·3=9=6+3; zero input 0=0 | Tensor/pushforward directions consistent; none. |
| 7.7 comparison API | q:S→BC₂; closed immersion | c_q(e_g)=δ_g; same swap acts on both bases; c_i=id | Correct pseudo-naturality, not identity 2-cells; F01 settled. |
| 7.11 relative diagonal | Smooth curve; identity | Λ(-1)[-2]⊗Λ(1)[2]=Λ; identity Λ⊗Λ=Λ | Opposite twist, not doubled twist; none. |
| 8.1 trace signs | Λ⊕Λ[1], Λ=F₃ | 1-1=0, unsigned sum 2; unit 1, zero object 0 | Correct symmetry/sign; none. |
| 8.4 native trace boundary | Λ=ℤ/6, P=3Λ | Projective trace(id)=3; native finite-free-or-zero trace=0 | Correct separate supplier, not substitution of native trace. |
| 8.5 reflexivity | Λ=F₂[t]/t², M=Λ/(t); M⊕Λ | Dual and bidual lengths 1; direct sum and its bidual length 3 | Includes finite nonprojective modules; none. |
| 8.9 dualizable iff ULA | Point, Λ²; infinite free module; zero | Evaluation/coevaluation triangles I₂; infinite identity has infinite-rank image versus finite tensor's finite-rank image; zero gives 0=0 | Correct perfectness boundary; none. |
| 8.10 trace class | Two-point support, u=(1,2), Λ=F₅ | Trace class (1,2); integrated value 3; empty class 0 | Class not prematurely scalar; none. |
| 9.1 relative formula | Fold of two-point unit; empty support | Pushforward trace 2 = 1+1; empty 0=0 | Headline control; none. |
| 9.2 proper pushforward | P¹, constant coefficients; zero sheaf | H⁰ and H² each rank 1, trace 2 equals integrated characteristic class; zero 0 | Headline control; none. |
| 9.3 Lefschetz formula | z↦az on P¹, a≠1; translation on nonproper A¹ | Two fixed terms 1+1=2 equals trace; A¹ translation has fixed sum 0 but ordinary H⁰ trace 1 | Properness necessary; none. |
| 9.6 base change | Local term 2; disjoint two-copy base | Scalar 2 stays 2 under field extension; class becomes (2,2) on two copies | No erroneous summation; none. |
| 9.8 perfect schemes | Perfect point, p=2, Λ=F₃[t]; empty component | Scheme local term 1 = v-sheaf local term 1; empty 0=0 | General torsion ring retained; none. |
| 10.2 new API | Two points, M=(F₃²,F₃) | Sections dimensions 2,1,3; restriction kernel dimension 1; wrong constant-M-on-all-opens model gives 6 instead of 3 | Repaired. |
| 10.2 inverse functors | ℕ; compact ℤ_p; empty | Direct sum Λ^(ℕ) versus product Λ^ℕ, all-ones only in latter for Λ≠0; compact both C(ℤ_p,Λ); empty 0 | Six Checks discriminate correctly. |
| 10.5 / 11.3 modulus | Affine ℚ₂ group, Λ=F₅ | χ(g)=2, μ(gKg⁻¹)=3, product 1; wrong action gives 2·2=4 | Matches inverse of SR modulus; none. |
| 10.10 untwisting | G=1,T=point,Λ=ℤ/9 | μ=3 yields a↦3a, image size 3 versus target size 9; μ=1 yields bijection | R01. |
| 11.4 character equality | C₂ sign over F₃; shift | Both characteristic class and distribution character (1,-1); shift negates both | Headline control; none. |
| 11.5 / 11.7 twists | One-dimensional ball; constant sheaves; A′₁=0 | Constant case Λ(2)[4] versus Λ(1)[2], H⁻⁴=(Λ,0); zero sheaf case (0,0) | VS11.5 repaired; VS11.7 needs R03. |
| 11.9 Künneth | Point, ranks 2 and 3; one shifted factor | Trace 6=2·3; shifted trace -6=(-2)·3; empty 0 | Both sign and zero cases; none. |
| 11.11 universal local term | C₂ swapping {a,b} | Fixed pairs (a,1),(b,1); none above σ; class values 1,1 over 1 and empty class 0 over σ | Universal versus scalar object distinguished; none. |
| 11.12 quotient characteristic class | Same action and unit sheaf | Same inertia/universal values (1,1); integrating gives character (2,0) | Headline control; none. |
| 11.13 étale locus | w↦w/(a+bw), b≠0 | Fixed equation w(bw+a-1)=0: double root 0 at a=1, two roots nearby | Isolated points alone do not imply étale; corrected target keeps étaleness. |

### Pinned declarations, headline coverage and padding

The pins read were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are source-file reads at the pins, not results from a newer online library. The citation resolver found no unresolved names; its separate library service was unavailable, so local reads supplied that verification.

| Pinned file and line | Declaration / fact actually inspected |
|---|---|
| `Mathlib/CategoryTheory/Monoidal/Category.lean:161`; `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:364` | MonoidalCategory and SymmetricCategory; symmetry is involutive braiding. |
| `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:78`, line 104, line 107, line 237 | ExactPairing, coevaluation, evaluation, HasRightDual; opposite evaluation/coevaluation orientations and both triangles. |
| `Mathlib/CategoryTheory/Bicategory/Basic.lean:61`; `Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean:89`; `Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean:57` | Bicategory, its adjunction and Pseudofunctor; no supplied symmetric monoidal bicategory structure. |
| `Mathlib/Topology/LocallyConstant/Basic.lean:212`; `Mathlib/Topology/LocallyConstant/Algebra.lean:92`; `Mathlib/Topology/Sets/Compacts.lean:777` | LocallyConstant, charFn and CompactOpens. These definitions do not supply a Hausdorff hypothesis; the README supplies it for locally profinite T. |
| `Mathlib/LinearAlgebra/Dual/Defs.lean:61`, line 70, line 203; `Mathlib/LinearAlgebra/Dual/Lemmas.lean:262`, line 284 | Dual, eval and IsReflexive; finite-projective reflexivity instance and field converse. Neither is the arbitrary truncated-DVR-module theorem of VS8.5. |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56`; `Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean:30`; `Mathlib/RingTheory/Finiteness/Defs.lean:121` | DVR excludes fields; maximal ideal is nonunits; Module.Finite is finite generation. |
| `Mathlib/LinearAlgebra/Trace.lean:75`; `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:57`, line 265 | Trace is finite-basis trace and zero otherwise; FGModuleCat's rigidity instance here is over a field, not every commutative ring. |
| `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | DerivedCategory is the localization carrier. The needed derived monoidal enhancement is not present here. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` | IsSmoothDiscrete includes the discrete topology and open stabilizers. |
| `Mathlib/RingTheory/Perfection.lean:623`; `Mathlib/RingTheory/Perfectoid/Untilt.lean:49`; `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166` | Pretilt, untilt and θ constructions, not the v-site of perfectoid spaces. |
| `TauCeti/RingTheory/Perfectoid/Basic.lean:86`; `TauCeti/RingTheory/Perfectoid/Field.lean:68` | Perfectoid Tate rings and fields, not perfectoid spaces with their v-topology. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean:40`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:249` | Pre-adic carrier and adic full subcategory; neither supplies the v-stack/sheaf constructions needed by the headlines. |

The ten geometric headline statements explicitly accounted for in the module docstring are VS7.5, VS8.9, VS9.1, VS9.2, VS9.3, VS9.6, VS9.8, VS11.4, VS11.9 and VS11.12. The summary's end theorems and deep inputs are among them. Each needs missing geometric or monoidal-bicategorical carriers: decent v-stacks and fine maps; D_ét with the enhanced operations; CoCorr and ULA; inertia, trace classes or universal local terms. Object searches at both pins found no existing replacement for those carriers. Rings/fields and adic spaces alone cannot state them through a few simple definitions. No statable headline was found absent; no surrogate or free-predicate statement is inserted.

`Suggested.lean` has **zero declarations**, zero admitted examples and zero sorry bodies. Consequently the exhaustive one-tactic padding probe and `#check @name` comparison each have zero inputs. There is no untested sorried theorem hidden behind that statement. VS8.5's native module theorem is an intermediate target, not a headline from the summary; the file is not required to be its API catalogue. All backticked own-name claims were resolved: none asserts an undeclared package declaration. Imports consist of the single `import Mathlib`; no Tau Ceti module needed building.

The prescribed `lake env lean` invocation, with this package's Suggested.lean as its argument and the content checkout as working directory, returned **exit 0, no output and no warnings**. No Lean process remains running.

### Suppliers, ownership and merge order

The board package index and overlap report were read before searching ownership. Searches used `roadmaps grep` by objects, the available open-head `roadmaps show` texts, main-branch files, board packages and pinned library sources. The searches covered decent/prespatial diamonds, cohomological correspondences, categorical traces, Haar modules and distribution characters, smooth/complete locally constant-function modules, reflexivity and universal local terms. Scheme/coherent correspondences and complex analytic distribution characters are not the same object as the v-stack/torsion constructions here.

Resolved supplier citations include the following. A line in an open-head file is a line in that roadmap's README, not a line in a cached tool wrapper.

| Supplier and location resolved | Contract consumed and boundary |
|---|---|
| #1230, `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:100`, 135, 234, 328, 1219, 1390 | VS0.1–0.2, VS1.1–1.2, VS4.2 and VS5.2's torsion ULA/perfect-invariants subtarget exist. These supply Artin stacks, smooth descent, smooth shriek, ULA and smooth representation equivalence. General fine-stack exceptional pushforward remains this Part II's extension. |
| #927, `TauCetiRoadmap/DiamondSixOperations/README.md:119`, 150, 215, 262, 281, 308, 342, 368, 488, 541, 590, 609, 643, 663, 706, 768, 829, 872, 900, 1030, 1070 | All cited S0.1–0.2/S0.4, S1.1–1.5, S2.3–2.4, S3.1–3.4, S4.1–4.5, S5.4–5.5 headings and operations resolve. Representability, compactifiability and finite dimension are retained where needed. |
| #820, `TauCetiRoadmap/DiamondsAndVStacks/README.md:5780`, 6300, 6367, 6586, 6870, 7046, 7328, 7637, 7697, 8134, 8954, 9035 | D4.1/D4.6/D4.7/D4.10, D5.1/D5.2/D5.5/D5.11/D5.12/D5.14 and D6.4–D6.5 resolve, including every named target in the contract. Spatial-v-sheaf criterion is not an assertion that all decent v-sheaves are diamonds. |
| Main, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:580`, 1153, 1229, 1440, 2293 | E1.4, E3.2, E3.4, E5:abstract.1 and E2.6 exist. Ringed diagrams/mates do not already supply the four unrestricted Liu–Zheng contracts. |
| #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:765`, 1105, 1798, 1814, 1916, 2048 | SR.0.3, SR.1.1, SR.0d.2, SR.2.1–2.2 supply averaging, Haar/integration, derived invariants/duality/admissibility, induction and modulus. R01 identifies the specific missing normalization, not a missing supplier section. χ_G is the inverse of that supplier's δ. |
| #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:6220`, 6283, 6417, 6427, 6562 | §§6.1–6.3 include scheme trace/correspondence/local-term interfaces; the supplied coefficient/complex range is narrower than the two declared extension contracts. |
| #965, `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:787`, 931, 1443, 1468, 1498, 1543 | All six named L1/L3 targets resolve. Full faithfulness, tensor/pullback, right-adjoint internal Hom and proper-support comparison are distinct; the package does not infer an unrestricted ordinary-pushforward comparison. |
| Main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1658`, 1714 | §0.23a étale topological invariance and §0.24 perfection, including perfection_universalHomeomorphism, resolve. |
| Main, `TauCetiRoadmap/PivotalSpherical/README.md:318`, 477; `TauCetiRoadmap/AdicSpacesPartIII/README.md:11858`; `TauCetiRoadmap/DGAInfinity/README.md:431` | Layers 2/7 own the 1-categorical trace; R3.8 owns projective-module trace/realization; Layer 5 owns compact=perfect. This package imports them and builds the stated bicategorical/derived criteria. |

The closest-open-roadmap checks found no additional duplicate owned target: #1252 `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1` concerns Hecke/local-shtuka geometry; #1687 `TauCetiRoadmap/AnalyticStacks/README.md:157` develops its analytic enhanced machinery. This package does not own the generic restricted-nerve theorem: its named owner is EnhancedDerivedSheaves through the explicit gap contract. #927, #1230 and #965 are the narrower suppliers above. No new package declaration can collide with an open roadmap's fully qualified Lean name because this Lean file declares none.

The overlap facts report no conflicting head changing this roadmap, no dropped cited ids, and no ids available only in an open revision. The inspected supplier headings and former-numbering table support those results. No revision-only supplier was silently imported. No object was moved in this review and no upward supplier was introduced.

All six declared gap slugs match between `design/plan.json` and the README's Exact supplier contracts:

- vs-pii-enhanced-operation-map
- vs-pii-partial-adjoints
- vs-pii-restricted-nerves
- vs-pii-descent
- vs-pii-scheme-correspondences
- vs-pii-scheme-local-terms

Each has a named earlier supplier and a specific mathematical interface. The first four extend beyond coherent ringed diagrams, with the cited theorem hypotheses; the last two extend the scheme coefficient/complex range. None asks this package to rebuild something it imports. The old VS10 references in the plan's neededBy fields correspond to VS9 under the README's explicit former-numbering table. They are not undeclared or ownerless prerequisites. Since the verdict is needs changes, no conditional-acceptance field is used in review.json.

The prescribed dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.

## Not verifiable

- The unrestricted isomorphism Rf_! ≅ Rf_* for every proper fine map is not proved by the cited GHW theorem. Its general validity is not certified here. The package's disclosure and prior settled F01 are recorded above; neither a new theorem nor an equivalence with the neighbouring open representability questions is inferred.
- No source-access limitation remains: all eight recorded texts were readable legally. No missing-source request was created.
- The remote citation resolver could not inspect its own pinned-library checkout; the relevant local pinned declarations were opened directly instead. This did not prevent the Lean elaboration or the local duplication audit.

## Source issues

- **Misprint** in GHW22 at §1.2(3), printed p.5 (GHW22 line 219): the source says the partial-adjoint input is Liu–Zheng Proposition 1.4.4; it should be Proposition 2.2.4 in the cited v4 numbering, pp.79–80; affects the proof.
- **Error** in HKW22 at Example 4.1.1, printed p.22 (HKW22 line 1055): the source says maps between classifying stacks are described by group homomorphisms; it should be torsors with commuting action, with homomorphisms describing trivialized torsors; affects a stated result.
- **Misprint** in HKW22 at Definition 4.1.7 and its surrounding references, printed pp.23–24 (HKW22 line 1133): the source says GHW statements have numbers absent from the public version; it should be GHW Definitions 4.1 and 1.1, Proposition 4.8 and Proposition 4.14 as applicable; affects nothing.
- **Gap** in HKW22 at Theorem 4.1.8, printed p.24 (HKW22 line 1165): the source says GHW Theorem 1.4 supplies the proper-pushforward comparison; it should be accompanied by a proof or another reference for that comparison; affects the proof.
- **Error** in HKW22 at Example 4.2.5, printed p.27 (HKW22 line 1316): the source says choosing a Haar measure untwists the distribution module; it should be a generating Haar measure, since nonunit multiples fail over general coefficient rings; affects a stated result.
- **Misprint** in HKW22 at Definition 4.3.4, printed p.30 (HKW22 line 1482): the source says the tensor target uses an unprimed, wrongly indexed first coefficient; it should be A′₁ ⊠ A′₂; affects nothing.
- **Misprint** in HKW22 at the paragraph after Proposition 4.3.5, printed p.31 (HKW22 line 1514): the source says the ULA criterion is FS Theorem IV.2.24; it should be Theorem IV.2.23 in the cited version; affects nothing.
- **Error** in HKW22 at Example 4.3.10, printed p.33 (HKW22 line 1618): the source says properness of X suffices for the displayed arbitrary-correspondence trace formula; it should also require the proper correspondence-support map used by Theorem 4.3.8; affects a stated result.
- **Error** in HKW22 at the proof of Proposition 4.4.1, printed p.34 (HKW22 line 1671): the source says the diagonal group is a direct factor of G×G; it should use closed-subgroup induction, since a nonabelian diagonal need not even be normal; affects the proof.
- **Gap** in HKW22 at equations (4.5.8)–(4.5.9), printed p.40 (HKW22 line 1955): the source says the remaining functorial and monoidal coherences are straightforward but omits them; it should supply the coherent comparison and compatibility argument; affects the proof.
- **Misprint** in HKW22 at the proof of Theorem 4.5.3, printed p.41 (HKW22 line 1990): the source says the fibre product is over inertia of T₁; it should be over inertia of T; affects nothing.
- **Error** in HKW22 at the closing remark of §4.6, printed p.44 (HKW22 line 2135): the source says isolated fixed points make the relative fixed locus étale; it should assume étaleness or a sufficient transversality condition, since double fixed points can specialize from two points; affects a stated result.
- **Misprint** in HKW22 at §5.3, printed p.48 (HKW22 line 2320): the source says the trace-class discussion precedes Definition 4.3.5; it should refer to the discussion before Definition 4.3.6; affects nothing.
- **Misprint** in HKW22 at Lemma B.1.1, printed pp.72–73 (HKW22 line 3534): the source says the socle exponent is m−1 with m undefined; it should be k−1 for Λ=R/𝔪^k; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c83b06c8bb75591f54df8e633a79f31e9ed7656c", "job": "REV-PKG-VStackSheavesAndLisseCategoriesPartII~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
