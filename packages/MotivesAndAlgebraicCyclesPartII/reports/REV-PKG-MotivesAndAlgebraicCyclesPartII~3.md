<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6781797320 -->
Review (codex) of dfc9dde

Verdict: needs_changes

1. **F01** (P2) Algebraic closure alone does not produce the strict basis

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:178`, with the related assertion at line 149: “choose algebraic closures of the completed residue fields and take their bounded product”.

   **Claim:** This route produces a strictly totally disconnected covering ring for every Banach ring, without an analytic reduction.

   **Witness:** Take an algebraically closed field k with the trivial norm. Its sole completed residue field and completed algebraic closure are k. The resulting product is k; all nonzero norms are 1. Line 170 correctly says this is not strict.

   **Exact repair:** Before taking residue fields, add the analytic arc-cover by the completion of A[T,T⁻¹] with the prescribed inverse-compatible norm of T equal to 1/2, then uniformize. State this construction explicitly in §0.3 and use it in §0.5; merely saying that analytic covers are arc-covers does not assert their existence. Keep the zero ring separate. The source-corrections paragraph at line 1335 already mentions analytic reduction, but does not state or supply this missing cover construction. Cite Scholze Example 3.4, p.15, Scholze lines 658–664. Adjust line 149 to require this analytic reduction as well as completed algebraic closures. On the witness, the extension to the completed algebraic closure of k((T)), with norm T=1/2, is analytic, algebraically closed and one-point, hence strict. The general theorem is retained.

2. **F02** (P1) The constant presheaf in the new transfer Check is not additive

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:570`: “the constant presheaf `ℤ/ℓ`, on which a multiset of `d` maps acts by `d`”.

   **Claim:** This is an abelian presheaf with transfers satisfying §4.6's assumptions.

   **Witness:** In §4.1, ℕ[Marc(0)]=0, so identity equals zero on that correspondence object. An additive functor must send it to 0. The stated constant presheaf sends it to ℤ/ℓ≠0; it also sends two points to ℤ/ℓ instead of (ℤ/ℓ)².

   **Exact repair:** Use the additive constant-coefficient construction: the underlying presheaf of the constant abelian arc-sheaf, with sections over B given by locally constant ℤ/ℓ-valued functions on M(B), and transfer maps given by precomposition with the maps of free abelian sheaves induced by §4.1's monoid maps. State why this is finitary and ball-invariant in degree zero. Its values on 0, C and C×C are respectively 0, ℤ/ℓ and (ℤ/ℓ)²; locally varying transfer degree acts componentwise. Retain the Artin–Schreier calculation only for this correctly specified object. The cokernel on C is 0 and the disc class T remains nonzero by the displayed finite-polynomial argument. This repairs the counterexample without altering the theorem or excluding disconnected/empty inputs.

3. **F03** (P2) Integral monodromy representations are not rational objects

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1203`: “the band is a rational vector group, so the relevant representations are rational”.

   **Claim:** The integral representation category in §11.6 can be identified by treating its underlying objects as rational.

   **Witness:** Over k=𝔽̄₃, A=ℤ/2 with trivial action is a nonzero representation and yields (A,0). Yet A⊗ℚ=0. It is required by line 1199 and by the integral equivalence of §11.8.

   **Exact repair:** Keep the integral underlying object. After trivializing the line, describe the band's Hopf algebra over R=ℤ[1/p] as R⊕tℚ[t], with rational positive-degree augmentation ideal and integral constant term. Recover N from the degree-one coaction and use N^d/d! only in the positive, rational terms; retain the comodule's derived coherences and convergence condition. Cite the comodule carrier in AnalyticStacks §1.5 and Scholze lines 2566–2577, pp.61–62. Add the ℤ/2, p=3 test: the coaction is the identity into the constant term, every positive term is zero, and the recovered object is ℤ/2 rather than 0. Do not rationalize or narrow the integral headline.

4. **F04** (P2) The smallest-root formula divides by zero

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:477`: “the smallest is `min_i (|a₀|/|a_i|)^{1/i}`”.

   **Claim:** The displayed expression computes the smallest root norm for the monic polynomial under consideration, without a nonzero-coefficient restriction or an explicit index set.

   **Witness:** For T²−1 over ℂ₂, a₁=0 and both roots have norm 1. The displayed expression includes 1/0; under total real division it contributes 0, so the minimum is 0 instead of 1.

   **Exact repair:** Specify n≥1, set a_n=1, and write the largest norm as max over 0≤i<n of |a_i|^(1/(n−i)); write the smallest as min over 1≤i≤n with a_i≠0 of (|a₀|/|a_i|)^(1/i). The annulus assumption gives a₀≠0, and the minimum's index set is nonempty because a_n=1. Add T²−1 and n=1 as Checks. The repaired minimum gives 1 for T²−1 and |a₀| for T+a₀. Keep the already corrected minimum of the two annulus bounds.

5. **F05** (P2) The geometric map induces the opposite cohomology arrow

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:1108`: “the induced map `f_* ℤ → g_* ℤ`”.

   **Claim:** The map h:Marc(C)→G̃_m over k directly induces the displayed arrow of cohomology algebras.

   **Witness:** With f=g∘h, the adjunction unit gives 1→h_*1 and thus g_*1→f_*1. For the inclusion of the first point into two points, this is (a,b)↦a. No reverse pullback is induced.

   **Exact repair:** State and prove the pullback equivalence g_*ℤ→f_*ℤ. Define the augmentation of f_*ℤ by the inverse of that equivalence followed by evaluation at 1 on g_*ℤ. Use that same direction in the route at line 1122. The two-point calculation verifies the variance; for this geometric h the proved equivalence then legitimately supplies the inverse needed for nearby cycles. Scholze line 2453, p.58, contains the same reversal; record it as a source misprint rather than repeating it. The final equivalence and augmentation remain unchanged.

6. **F06** (P3) The perfectoid tensor-product supplier is P2.13

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:180`: “PerfectoidSpaces §P2.3 (completed tensor products of perfectoid rings)”; also Layer 0's dependency line 215.

   **Claim:** PerfectoidSpaces P2.3 supplies the tensor-product theorem used for subcanonicity.

   **Witness:** Main `TauCetiRoadmap/PerfectoidSpaces/README.md:6235` is P2.3, rational localization. P2.13 at line 7391 supplies completed tensor products of perfectoid pairs, including uniformity, the pushout and compatibility with tilting.

   **Exact repair:** Cite P2.13 in §0.5 and the Layer 0 dependencies, and add its actual hypotheses and supplied tensor-product result to the contract at line 95. Retain P2.3 where rational localization is used in §7.3. The repaired citation supplies L⊗̂_K L for perfectoid K,L, including the identity instance K=L where the tensor product is K. This is a wrong locator with an existing owner, not an unowned prerequisite.

7. **F07** (P3) Two constructed objects have no definition API or Checks

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:600`: “let `X♭` be its tilt”; line 764: “`E_KH(A) = cofib(KH(A_{<1}) → KH(A))`”.

   **Claim:** These are defined objects of the roadmap, but their subsections contain only a definition/theorem, route and Needs line.

   **Witness:** Sections 4.9 (lines 598–604) and 7.4 (lines 762–768) each have zero API bullets and zero Checks. The §4.9 definition is used again in the sampled §8.3 theorem.

   **Exact repair:** Add each object's functorial API and at least three discriminating Checks. For the tilt, specify pullback on sections with marked untilts, identity/composition and base-change compatibility; test an empty stack, a perfect characteristic-p field (its own tilt), and ℂ_p versus its characteristic-p tilt, retaining prime-to-p Tate fibres and vanishing p-torsion. For E_KH, specify functorial maps of cofibre sequences, independence of unitization and the comparison with E_K under the stated hypotheses; test ℚ_p (root hypothesis absent and I/I²=𝔽_p), an algebraically closed valued field (rational rank ℚ), and a finite product of two such fields (rational rank ℚ²). These distinguish the root-free construction, its cofibre orientation and finite-product behavior. Keep these in the README, not Suggested.lean.

Seven findings: one P1, four P2, two P3; five blocking. The eleven preceding findings have been repaired as specified. The new transfer counterexample introduced by that repair is defective, and the broader pass finds additional construction, convention and shape issues. The main theorems need not be narrowed. The Lean acceptance file passes, and the dependency graph has no upward edge or cycle.

## Previous findings, checked individually

Locations below are in `packages/MotivesAndAlgebraicCyclesPartII/README.md`. The repair report marked all eleven applied; none was marked not actionable.

|Previous finding|Repaired passage and current location|Assessment and recomputation|
|---|---|---|
|R01, source-led organisation|Line 3: “builds integral étale motivic sheaves on Banach rings”; line 103 explains the two branches after cancellation.|Repaired. The source-following assertion is gone. Layer 7 uses Layer 6; Layer 8 uses Layers 1–5. The text explains this mathematical fork rather than claiming the source's order is mandatory.|
|R02, norm versus spectral radius|Line 584: “agrees with `|p|_A < 1` when `A` is uniform, but not in general”.|Repaired. Line 594 gives norm of 2 equal to 1 and spectral radius equal to 2^(−1/2); uniformization supplies the extended conclusion.|
|R03, integral motivic rank|Line 686: “the integral rank lives on `E_K(C)`”.|Repaired. For residue exponents 2, 3, 1, the motivic rank groups are ℤ[1/2], ℤ[1/3], ℤ; an integral retraction in the first two cases would solve 2m=1 or 3m=1 in ℤ.|
|R04, lost affine scope|Line 563: “its value on every affine subset of `A¹_A`”; line 576 restores the same scope for free motives.|Repaired as to the theorem. A closed disc is included, with rational free-point value ℚ before and after. The new line 570 Check has a separate defect, current R02.|
|R05, initial proper class|Line 862: “generated under composition and base change” by the bounded-ball maps.|Repaired. The initial class now uses §8.4; §9.4 supplies the later enlargement. Graphs have empty or singleton fibres, hence dimension 0. The βℕ example remains excluded from finite-dimensional ball embeddings.|
|R06, transfer-free 2-primary rigidity|Line 1026 names “Bachmann, Theorems 6.5 and 6.6”.|Repaired. The new route includes localization, projective generation and the finite étale cohomological-dimension inputs. Over 𝔽̄₃ at coefficient 2, −1 is a square, μ₂=ℤ/2 and positive shifted maps between constant coefficients vanish. The former CD-only route did not cover this case.|
|R07, sum/product negative control|Line 658: “in degree `−4` the stage `ℙ¹` gives `0` and `BG_m` gives `ℚ`”.|Repaired. The ℙ¹ stage has degree −4 value 0, whereas ℙ² and BG_m have ℚ. Sum and product coincide degreewise for the displayed complex-point family, as the repaired text acknowledges.|
|R08, obsolete dimension names|Line 49 names `TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`.|Repaired. The pinned strict bound and closed-subgroup bound were opened, including compactness hypotheses; cd≤1 gives scd≤2, and ∞+1=∞.|
|R09, adjunction domain|Line 1055: “represents `M ↦ Hom(1_K, f^* M)` for `M ∈ Dmot(k)`”.|Repaired. In the two-point test both sides are M⊕M. Dualizing ℤ⊕ℤ(−1)[−1] gives ℤ⊕ℤ(1)[1].|
|R10, duplicate unit-ball ideal|Line 410: “given at the pin by Tau Ceti `TauCeti.unitBallIdeal A`”.|Repaired. The ideal and Neumann estimates are imported, while the arc-sheaf is owned here. The zero ring is treated separately; −1 belongs to the one-units over ℚ₂ and not over ℚ₃.|
|R11, duplicate PID requirement|Line 55: “With the principal-ideal property … at the pin”.|Repaired. Both the README and plan gap now ask only for affinoid descent. The pinned theorem covers positive radius, including the trivially valued field case, where the restricted algebra at radius 1 is K[T].|

The patterns were searched beyond the repaired passages: norm/pointwise hypotheses in §§4.9, 7.3, 7.6, 8.3; rank in §§7.5–7.7; rational affine evaluation in §§4.7, 5.2; pushforward domains and directions in Layers 8–11; coefficient restrictions in Layers 10–12; and the native ideal/PID/dimension names throughout the contracts and Needs lines.

## Verified sound

The review read all 80 numbered targets, their API/Check blocks, all 13 layer dependency blocks, the nine gap entries, the four package inputs, and the prior review and repair report. A working ledger records a computed test for each numbered target; the compact table below retains every seeded target, all headline families and every target implicated by a finding. Tests are evidence against common failure modes, not substitutes for proofs of the general theorems.

### Source verification

Five cached legal texts were available; BLR is the sixth manifest work and remains settled as uncertified. All six works cited in References have one manifest key. No source entry was rewritten, no new source was required, and no new missing-reference request was made. The references explicitly identify the versions used for CD, Vakil and Bachmann. No copied source passage, computational algorithm, route-specific restriction or forbidden supplier was found.

|Seeded target|Text and exact locator inspected|Hypotheses, page and support|
|---|---|---|
|0.4 Strictly totally disconnected Banach rings|Scholze lines 698–720, Definition 3.10, p.16; Proposition 3.11, p.17.|Analytic, uniform, profinite spectrum, algebraically closed completed residues. Bounded products use nondiscrete fields and Banach ultraproducts. The definition is correct; the adjacent closure-only construction needs R01.|
|2.5 Free motivic sheaves of open subsets of affine space|Scholze lines 1287–1350, Lemma 5.11, pp.30–31; Propositions 5.12–5.13, pp.31–32.|Finite-dimensional affine space, open U, finitarity and base change agree. Analytic finite-cohomological-dimension hypotheses are retained for generation.|
|4.1 Banach presheaves with transfers|Scholze lines 1500–1505, Definition 6.2, p.35.|Uniform Banach algebras and maps of free monoid arc-sheaves. README correctly reverses the displayed correspondence category for presheaves. Additivity exposes R02.|
|4.3 Generalized Jacobian with marked trivializations|Scholze lines 1556–1572, proof of Lemma 6.4, p.37.|Smooth projective connected curve, nonempty distinct markings, degree zero, torus rank r−1 and pointwise divisibility in arbitrary characteristic. BLR §9.2 remains uncertified background.|
|4.6 Ball-invariant sheafification|Scholze lines 1506–1547, Theorem 6.3 and proof, pp.35–36.|Finitary, additive transfers, ball invariance, strict nonarchimedean base and residue-prime inversion retained. Both all-open sheafness and all-affine rational evaluation are restored. R02 concerns the added Check, not this theorem.|
|5.1 Permutations of Tate powers|Scholze lines 1813–1832, Lemma 7.3 and preceding discussion, p.43.|Homotopy-category triviality before cancellation; coherent triviality afterward. The reduced-unit swap differs by the suspension sign.|
|5.4 Symmetric powers and projective cells|Scholze lines 1841–1870, Corollaries 8.1–8.2, p.44.|Rational symmetric powers/BG_m decomposition and integral cell cofibre. n≥1 for the cell attachment; n=0 allowed for Sym.|
|7.6 Motivic K-theory on strict bases|Scholze lines 1988–1990 and proof from 2007, Theorem 8.9, pp.47–49.|Prime set S, pointwise norm restriction outside S, strict bases and localized cofibre agree. The package keeps its nonarchimedean K-cofibre context and includes p=2.|
|8.1 Stable motivic sheaves|Scholze lines 2095–2108, Definition 9.1, p.50.|Tensor inversion and the sequence model with right-adjoint transition Hom(ℤ(1),−) agree.|
|8.3 Stable motivic tilting|Scholze lines 2203–2211, Proposition 9.7, pp.52–53.|Pointwise small p, equivalence, monoidality and preservation of all Tate twists agree. Definition shape needs R07.|
|11.2 Descendability of nearby cycles|Scholze lines 2467–2473, Proposition 11.4, p.59.|The proof uses the fibre's augmentation-module structure, not merely its underlying complex. R05 corrects the preceding construction's arrow.|
|11.4 Mixed Tate motives|Scholze lines 2484–2537, Propositions 11.5–11.8, pp.59–60.|𝔽̄_p base, mixed Tate subcategories, relative tensor product and conservative t-exact Ψ. No t-structure on all motives is claimed.|
|11.8 Monodromy equivalence|Scholze lines 2557–2583, Theorem 11.9 and Corollary 11.10, pp.61–62.|Integral relative equivalence uses roots; rational equivalence uses π alone. R03 corrects the package's extra rationalization assertion in the proof route.|
|12.2 Norm-free Tate arc-stacks|Scholze lines 2630–2640, discussion after Corollary 12.2, p.63.|Perfectoid Tate characteristic-p algebras, rank-one covers, loss of plus-ring choice, and relative norm comparison agree.|
|12.4 Spatial-diamond retract|Scholze lines 2653–2667, Proposition 12.4, pp.63–64.|Spatialness, finite cohomological dimension, prime-to-p coefficients and colimit-preserving right adjoint retained. The conclusion is a retract, not compact generation of the overconvergent subcategory.|

The changed §10.2 proof was read separately in Bachmann: Lemma 3.10 at lines 543–574 (p.10), localization at 706–731 (Theorem 5.1, p.13), Corollary 6.2 at 845, Lemma 6.4 at 869–891, Theorems 6.5–6.6 at 900–929 and Theorem 7.1 at 931–943 (pp.15–17). The local finite étale dimension and invertible coefficient hypotheses hold for the algebraically closed fields used here. The proof does not borrow §§10.3–10.6. CD Theorem 4.5.2 and its transfer-dependent proof, Theorem 5.2.2, and Corollary 5.5.7/Remark 5.5.8 were also compared; Bachmann repairs the missing characteristic-odd, coefficient-2 case. Vakil's surface intersection and adjunction inputs retain smooth projective surface hypotheses in §9.5. The van der Put curve-shrinking input retains a nontrivially valued complete algebraically closed base.

### Computed adversarial table

|Statement|Instances tried|Values computed on each side|Result / change|
|---|---|---|---|
|0.3–0.5 strict basis|Trivially normed algebraically closed k; its analytic extension|Residue-closure product=k, no element of norm in (0,1); extended field has norm T=1/2 and singleton closed residue|R01.|
|0.4 strictness|ℂ, ℝ, trivial k, product ℂ²|Closed residue: yes/no/yes; analytic: yes/yes/no; ℂ² has two points|Definition discriminates all three conditions.|
|0.2, 1.1, 4.1 empty/product behavior|Zero ring and C×C|ℕ[Marc(0)]=0, additive value0; two-point value F(C)²|Contradicts the purported constant presheaf in R02.|
|2.5 free motives|Empty open, affine dimension0, ball|0; unit; unit after localization. Map(0,M)=0; Map(unit,M)=M(base)|Adjunction and localization agree.|
|3.1 unit laws|−1 over ℚ₂/ℚ₃; u=3 over ℚ₂|Norms of −2 are1/2 and1; norm(1/3−1)=1/2=norm2|Native estimates imported correctly.|
|3.4 Tate convention|Complex and real point|cofib(ℤ→ℤ⊕ℤ[1])[-1]=ℤ; real conjugation acts−1|Shift and real sign agree.|
|3.5 root norms|T²−1, a₁=0|Actual minimum root norm1; displayed total-division expression0; repaired nonzero-index minimum1|R04.|
|3.5 annulus correction|T²+T/2+4 over ℂ₂, radii1/4,4|Roots have norms1/8,2. Coefficient norm2 passes max bound4 but fails min bound1|Existing source correction is sound.|
|4.3 marked Jacobian|ℙ¹ with1,2,3 marks; characteristic p|J=0,G_m,G_m²; two-mark coordinate a/b; x↦x^p surjective on closed-field points, derivative0|Marking quotient and pointwise divisibility correct.|
|4.5 prime homotopies|x=x′; boundary ratio1+q, norm q=1/2|n=0 works for equal points; norm(tq)≤1/2, norm(1+tq)=1, including primes2,3|No good-prime restriction.|
|4.6 rational affine scope|Closed unit disc|Free-point value ℚ before sheafification and ℚ after|Restored theorem correct.|
|4.6 transfer negative control|0,C,C×C|Claimed constant values all ℤ/ℓ; additive values0,ℤ/ℓ,(ℤ/ℓ)²|R02; Artin–Schreier class alone does not verify the presheaf hypothesis.|
|4.7 free formula|U=∅; point in residue p|Group completions0 andℤ, localized to0 andℤ[1/p]|Animated, localized construction retained.|
|4.8 norm repair|Rounded 2-adic norm on ℤ₂|Norm2=1; nth-root norm of 2ⁿ tends to2^(−1/2); uniformized norm2=2^(−1/2)|Implication and extension via uniformization correct.|
|4.8 torsion|Geometric residue p; complex point|p-torsion0; prime-to-p unit ℤ/n; complex integral unitℤ|Integral scope preserved.|
|4.9, 8.3 tilting|ℂ_p and its tilt; perfect char-p field; empty stack|p-torsion0 on both, prime-to-p Tate fibre μ_n on both; char-p field unchanged; empty remains empty|Comparison supported; R07 adds missing definition tests.|
|5.1 permutation|n=0,1,2|Identity for0,1; Tate swap+1, shifted reduced-unit swap−1; (-x)/(-y)=x/y|Koszul correction consistent.|
|5.2 cancellation inverse|Identity graph over ℂ_p, U=point; basepoint graph|Degrees N and N−1 yield1; basepoint degrees N and N yield0|Eventual sequence is1 or0 as required.|
|5.3 cancellation headline|Complex point; empty base; prime-to-p torsion|Tensor byℤ is identity; Hom0→0; μ_n tensor has inverse μ_n dual|No failed boundary instance.|
|5.4 cells and BG_m|ℙ⁰, ℙ¹, ℙ²; degrees0,−2,−4|ℙ¹:ℚ,ℚ,0; ℙ² and BG_m:ℚ,ℚ,ℚ; Sym⁰=unit|Repaired negative control discriminates finite stages.|
|6.1 rank headline|Residue exponents2,3,1; complex|π₀=ℤ[1/2],ℤ[1/3],ℤ; complexℤ; integral E_K rankℤ|No integral retraction asserted for Kmot.|
|6.2 flag invariants|Σ₂ and nonabelian Σ₃|Traces(2,0) and(6,0,0) on conjugacy classes; averaged trace1|Normalizer action has the required invariants.|
|6.3 Adams splitting|Eigenvalues1,2,4|Projector denominators3,−2,6; values(1,0,0),(0,1,0),(0,0,1)|Nonzero denominators and weights verified.|
|7.1, 7.4 root hypothesis|ℚ_p versus closed valued C|pℤ_p/(pℤ_p)²=𝔽_p≠0; divisible valuation ideal has I²=I|KH extension is distinct; definition shape R07.|
|7.5 cofibre orientation|Smooth formal point|π₀ is coker(ℤ→ℤ²)=ℤ, with diagonal map|Cofibre, not fibre, retained.|
|7.6 explicit K headline|Strict point, residue exponents2,3,1; empty ring|π₀E_K[1/p]=ℤ[1/2],ℤ[1/3],ℤ; empty0|All residue characteristics included.|
|7.7 integral fracture|p=2,3|ℤ[1/p]×_(ℚ_p)ℤ_p=ℤ; integral p-completed rankℤ_p versus inverted motivic p-completion0|Integral E_K distinguished from Kmot.|
|8.1 stable motives|Complex point|Tensor inversion of unit gives D(ℤ); sequence transition Hom(ℤ,M)=M|Universal property and transition direction agree.|
|8.2 projective duality|ℙ¹ over complex point|f_*ℤ=ℤ⊕ℤ[-2]; twist[2] givesℤ[2]⊕ℤ=f_♯ℤ|Duality normalization correct.|
|8.5 initial six operations|Identity, graphs, βℕ|Identity/graph fibres dimension0; βℕ dimension0 but nonmetrizable, hence no finite-ball embedding|Repaired initial class avoids using §9.4 before §9.1.|
|9.1 geometric rigidity|D(ℤ)|ℤ compact/dualizable; infinite direct sum ofℤ neither|Headline does not confuse arbitrary objects with compact objects.|
|9.3 monadicity|Two points; empty source|Algebraℤ², modules D(ℤ)²; zero algebra, module category0|Surjectivity unnecessary; f_* is conservative on its source.|
|9.4 proper projection|Two-point finite map|f_*(M₁,M₂)=M₁⊕M₂; tensor distributes to the same two summands|Base-change/projection boundary test passes.|
|9.5 non-Tate control|Elliptic surface E² in characteristic2 or3|Three-divisor matrix diagonal0/off-diagonal1 has determinant2, rank3 overℚ; proposed Tate model would give rank2|Counterexample remains discriminating.|
|9.6 relative rigidity|j:(0,1]→[0,1] over complex locus|j!ℤ≠0; RΓ(j!ℤ)=fib(ℤ→ℤ)=0|Rigid is not asserted to mean generated by unit.|
|10.2 repaired rigidity|𝔽̄₃, n=2; n=3 control|−1=i² in𝔽₉; μ₂=ℤ/2; shifted Hom=0. n=3 fails invertibility and has nonzero Artin–Schreier class on A¹|Bachmann route covers2 and excludes3 for the stated reason.|
|10.3 repaired adjunction|Two points; Laurent field|Hom(ℤ²,M)=M²=Hom((ℤ,ℤ),(M,M)); dual ofℤ⊕ℤ(−1)[−1] isℤ⊕ℤ(1)[1]|Functor domains and shifts match.|
|10.4–10.6 mapping/comparison headlines|ℙ¹,j=1; Spec𝔽̄_p|π₋₂=K₀^(1)(ℙ¹)_ℚ=ℚ; π₀=0. Closed field rational weight0=ℚ, other weights0; torsion μ_n survives|[-2j] correction and integral comparison consistent.|
|11.1 comparison map|First point into two points|Pullback sends(a,b) to a; source is cohomology of two points|R05; use inverse only after proving equivalence.|
|11.2 descendability|Rational augmented algebra|ℚ⊕ℚ(−1)[−1], odd generator square0; fibre action factors throughℚ|Two-step module filtration supports descendability.|
|11.3 Galois stack|Rational, ℓ≠p, p fibres|Coordinate ringℚ[t±1], 𝔽_ℓ, 0 respectively; augmentation ideal≅rationalized ring as module|Fibre product and Tor-amplitude check correct.|
|11.4 mixed Tate|Weights i,j and degree m; finite coefficients|Hom=ℚ only if i=j,m=0, otherwise0; modℓ twist Hom=μ_ℓ≠0|Rational and torsion sectors distinguished.|
|11.5 value normalization|T and T^(1/n)|−log(norm T)/log2=1; root has value1/n; value groupℚ|Gerbe band and roots normalization agree.|
|11.6, 11.8 integral monodromy|ℤ/2 at p=3; rational two-step object|Underlyingℤ/2≠0, rationalization0, N=0; two-step N≠0,N²=0; scalar1 has every iterate1|R03; nilpotence and integral trivial actions both needed.|
|12.2 rank-one covers|Plus-rings C⁺⊂O_C|Rank-one singleton identical, higher-rank points may differ; prescribed map is a cover|Forgetting plus-ring is supported, not equality of adic spaces.|
|12.3 overconvergence headline|Constant sheaf; extension by zero; n=1|Specialization id onℤ/n; 0→ℤ/n not iso for n>1; 0→0 for n=1|Both directions and boundary coefficient checked.|
|12.4 retract|Point X; formal adjunction|Inclusion/right adjoint=id on D(ℤ/n); RI=id and (IR)²=IR|Retract conclusion does not claim target compact generation.|

### Libraries, ownership and supplier resolution

The main-branch styles read included PerfectoidSpaces, EnhancedDerivedSheaves and SchemeAndStackFoundations. The package has the required Summary, ownership, conventions, supplier contracts, build explanation, 13 mathematical layers with Examples/Dependencies, downstream consumers and References. There is no source-chapter heading, source-following declaration, machine path, job/PR narrative, LaTeX delimiter, executable procedure, sorry-data definition or set_option. R07 identifies the missing definition apparatus. The elementary algebra already present at the pins is cited rather than reproved.

The following pinned declarations were opened with their surrounding hypotheses; paths here are library-relative at the pins in the content manifest:

|Pinned file and line|Declaration and scope actually present|
|---|---|
|`Mathlib/CategoryTheory/Sites/Grothendieck.lean:72`|`CategoryTheory.GrothendieckTopology`: sieves, top, pullback and transitivity; no motivic infinity-topos construction.|
|`Mathlib/Analysis/Normed/Field/Basic.lean:155`|`NormedField`: field, norm and metric compatibility; no completeness, nondiscreteness or ultrametric hypothesis.|
|`Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`|`IsUltrametricDist`: maximum triangle inequality; no field or completeness.|
|`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`|`SSet.Quasicategory`: inner-horn filling; not presentable stable motivic categories.|
|`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`|`continuousCohomology`, with topological representation coefficients.|
|`Mathlib/RingTheory/PowerSeries/Restricted.lean:90`|`PowerSeries.IsRestricted.subring`: ultrametric normed coefficients and coefficient-norm decay.|
|`TauCeti/Analysis/Normed/Ring/Ultra.lean:84`|`Subring.unitClosedBall`, with ultrametric and norm-one assumptions.|
|`TauCeti/Analysis/Normed/Ring/UnitBall.lean:90`|`TauCeti.unitBallIdeal`; membership at101; Neumann norms at160,171 and the unit criterion at185. The latter require normed ring, ultrametricity, norm one and summable geometric series.|
|`TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.lean:115`|`TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`, complete ultrametric field and positive radius.|
|`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:146`|`TauCeti.cohomologicalDimensionAt` and `strictCohomologicalDimensionAt` at151.|
|`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClosedSubgroup.lean:80`|`TauCeti.cohomologicalDimensionAt_le_of_isClosed`, compact totally disconnected topological group.|
|`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Strict.lean:181`|`TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`, compact group, values in ℕ∞.|

Object searches, not just name searches, also opened `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RankLeOne.lean:147` and the adic polydisc rank interface in `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Rank.lean:188`. These are adic rank-one/disc carriers, not the general Banach arc-site, its infinity-categorical motivic localizations or algebraic K-theory spectra. No fully qualified name collision is possible in this empty Suggested.lean. Backticked native names in the README resolve; mathematical notation is not advertised as an undeclared Lean API. The sole citation-tool warning, `Perf.Spd`, resolves explicitly in DiamondsAndVStacks §D6.1, `TauCetiRoadmap/DiamondsAndVStacks/README.md:8660`.

Supplier sections were resolved against main for existing roadmaps and the provided heads for new roadmap folders. Representative exact locators, together with all consumed section ranges, are recorded here to make the resolution reproducible:

|Supplier|Resolved current text and consumed content|
|---|---|
|TropicalAndBerkovichArithmetic, #1494|`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:189`, §§0.1,0.7–0.8,0.12–0.17,0.20–0.22,0.24–0.28,0.30,0.32,1.1–1.3,1.6,3.7. Uniformization at439, completed pushouts at494, affinoid sheaves at585, spectrum comparisons at802/849 and slopes at1620.|
|EnhancedDerivedSheaves, main|`TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1732`, E5:presentability; spectra comparison1842, animation1900, finite-dimensional/Postnikov input2241, space sheaves2375. E0.4,E1.3,E2.1–4,6–7,E3.2,E3.4 and E5:abstract,presentability,descent,animation names resolve. The declared refinements remain gaps.|
|AnalyticStacks, #1687|`TauCetiRoadmap/AnalyticStacks/README.md:209`, §§0.4–0.6,0.9–0.10 and1.1–1.5. Six-operation assumptions at211, extension230, integral comodule model468. Monodromy-operator identification is explicitly assigned to this roadmap at1302.|
|GeneralAlgebraicKTheory, #1212|`TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:418`, §3.2; nonunital8.3 at1615, excision8.10 at1738, nonconnective10.10 at2267, continuity13.4–5 at2929/2939, finite fields13.8c at3027.|
|GeneralAlgebraicKTheoryPartII, #1742|`TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:336`, §1.2 group completion. §9.5 at2287 uses rather than owns the missing general KH input.|
|SchemeKTheoryOperations, #1229|`TauCetiRoadmap/SchemeKTheoryOperations/README.md:744`, negative vanishing in §2.6; supports3.1 at804, localization3.3 at904, general excision3.4 at945, Witt support3.8 at1150; operations6.4 at2403,6.8 at2636, Gysin weight shift6.11 at2787.|
|KTheoryFiniteLocalFields, #1281|`TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:267`, §§1.5–1.6; henselian rigidity2.1 at398; residue-characteristic local-field comparison6.5 at1350. Neither declared closed-field gap is silently substituted by this narrower local-field result.|
|RefinedTraceMethods, #1493|`TauCetiRoadmap/RefinedTraceMethods/README.md:1907`, §4.10 multiplicative K; §4.20 at2393 requires a flat idempotent ideal, as furnished in §7.1.|
|JacobianChallenge, main; AnabelianGeometryAndNonabelianChabauty, #1021|`TauCetiRoadmap/JacobianChallenge/README.md:111`, Layers A,B,D,E, multiplication at430; `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:4003`, characteristic-zero reduced-boundary Jacobian. The package explicitly retains arbitrary characteristic and pointwise divisibility as its difference.|
|PerfectoidSpaces, main|`TauCetiRoadmap/PerfectoidSpaces/README.md:6235`, rational-localization P2.3, tensor P2.13 at7391. P1.4,P1.19–22,P1.27,P2.7,P2.12,P3.20 supply the tilting/untilt/acyclicity statements. One incorrect attribution is R06.|
|DiamondsAndVStacks, #820|`TauCetiRoadmap/DiamondsAndVStacks/README.md:1907`, cutoff D0.23; D1.4,D2.7 at4243,D4.7,D4.9,D6.1 at8660,D6.3 at8830. The diamondification and v-descent owners are explicit.|
|DiamondEtaleCohomology, #922|`TauCetiRoadmap/DiamondEtaleCohomology/README.md:580`, C0.19; C0.24 at622,C2.2 at786,C2.12 at909,C4.5 at1237,C4.13–14 at1339/1367,C6.1 at1567,C9.8 at2931. Coefficient restrictions and compactness hypotheses agree with their uses.|
|DiamondSixOperations, #927|`TauCetiRoadmap/DiamondSixOperations/README.md:541`, S2.4; S4.2–3 at768/829, exceptional image and dualizing formalism with the stated eligibility and prime-to-p coefficients.|
|MotivesAndAlgebraicCycles, #1313|`TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:559`, §§4.1–4.6,4.9,4.11,4.15–4.18. Correspondences, Nisnevich transfers, cancellation and higher Chow comparison are imported; the new étale and Banach directions are not replanning these.|
|MotivicEtaleKTheory, #1470; AdicCoefficientsAndComparisons, #965|`TauCetiRoadmap/MotivicEtaleKTheory/README.md:282`, §2.2 rational Chow/Adams comparison; `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:1699`, L5 smooth alteration pair, including its finite extension and normal-crossing boundary.|
|EtaleCohomologyFoundations, main|`TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504`, F.2.1 proper base change; F.2.3 at540 smooth local acyclicity; F.3.0 at629 the 2dim bound with invertible torsion coefficients.|
|ProfiniteCohomology; SchemeAndStackFoundations, main|`TauCetiRoadmap/ProfiniteCohomology/README.md:2645`, §10.2 filtered coefficient continuity and Layer11 dimension theory; `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4029`, §2.16 Tsen. Native dimension bounds are cited separately at their pins.|
|RepresentationTheory, CharacteristicClasses, MorseNovikov, main|`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1078`, Layer8 flags/Bruhat; `TauCetiRoadmap/CharacteristicClasses/README.md:1377`, C5 Euler characteristic; `TauCetiRoadmap/MorseNovikov/README.md:1183`, Lefschetz trace/fixed-point formula. The normalizer action on compact flags meets these hypotheses.|

The ownership search used the provided `roadmaps grep` service on main and open heads for Banach arc-sheaves, ball invariance, Kmot, one-units, generalized Jacobians, KH, valuation K-theory, Breen–Deligne and fracture squares. The board-package index was read before making absence claims. Its board-only AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory packages are not competing motivic owners. The overlap file reports no conflicting head, dropped cited id or revision-only citation. Its closest scopes were inspected: ArcTopologyAndDescent #1755 (`TauCetiRoadmap/ArcTopologyAndDescent/README.md:8`) owns scheme arc-descent; AnalyticStacks #1687 owns generic higher algebra and explicitly assigns the monodromy identification here; DiamondEtaleCohomology #922 owns the diamond coefficient category; EnhancedDerivedSheaves is consumed on main, not through its open revisions #1187/#1330. There is no additional shared-object ownership finding.

All nine gap slugs agree between `design/plan.json` and the README contracts, with named suppliers and stated hypotheses. They are not unowned prerequisites. The animated resolution/augmentation filtration is an API for the same group-completion construction, and the KH excision/descent clauses specify the supplied KH theory; neither is a collection of unrelated requests. The spectral fracture and ordinary abelian Breen–Deligne near-matches do not supply the stronger E∞-algebra and animated-monoid contracts. Main `TauCetiRoadmap/AdicSpacesPartIII/README.md:10288` supplies finite-projective gluing for complete sheafy Tate pairs, and `TauCetiRoadmap/RigidAnalyticGeometry/README.md:619` imports the coherent affinoid comparison; these do not cover the affinoid contract's trivially valued generality. No claim is made that these narrower results are absent. The PID clause has already been removed from the gap. Eventual acceptance would remain conditional on the nine declared contracts.

The specified dependency command was run without changing the merge order. Its complete output was:

```text
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All Needs lines were read; the local supplier attribution defect is R06, which this graph check does not detect.

### Headline inventory and Lean acceptance test

The nine headline families in the Summary are cancellation (§5.3); finitary Kmot and the Adams decomposition (§§6.1,6.3); the strict-base K-cofibre (§7.6); torsion and effective/stable tilting (§§4.8–4.9,8.3); six operations and proper base change (§§8.5,9.4); geometric and relative rigidity (§§9.1,9.6); algebraic étale comparison (§10.6); nearby cycles and monodromy (§11.8); and overconvergent torsion comparison (§12.3).

Every family is named in `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`'s module docstring with its missing carrier. None is statable at these pins with a few simple definitions: the missing Banach arc-site, effective/stable motivic infinity-categories, motivic localization and K-theory spectra are precisely the major constructions promised by the roadmap. Existing normed-ring facts and ordinary K₀ structures do not make these headlines statable. No weaker stand-in was inserted.

The required `lake env lean` invocation on the package file from the pinned content checkout exited 0, with no output and **no warnings**. The file contains one `import Mathlib`, one module docstring, the required namespace, and **zero declarations and zero sorries**. The exhaustive one-tactic padding probe therefore has zero inputs; no theorem was skipped. Likewise there are zero own declarations for the `#check @name` binder comparison, so no hypothesis can be silently dropped. No Tau Ceti import/object build was needed. There is no padding finding and no statable headline omission.

## Not verifiable

- BLR §9.2, Proposition 3, Example 8 and Proposition 10 remain legally unread and recorded as `uncertified`. This settlement was respected; no replacement key or repeated request was created. Scholze's proof of Lemma 6.4 supplies the immediately used marked-Jacobian statement.
- The nine declared supplier contracts are future mathematical inputs, not completed proofs inspected here. Their declaration, owners, hypotheses and nonduplication were audited. Their absence today is not a finding.
- Small-instance calculations and source comparisons do not certify future formal proofs, especially the unbounded infinity-categorical constructions. The present verdict makes no acceptance claim while R01–R07 remain.

## Source issues

- **Misprint** in Scholze at Proposition 2.21, p.13, Scholze line 521: the source says spectral radius gives a norm before completion; it should be a seminorm before separated completion, since a nonzero nilpotent has radius zero; affects nothing.
- **Misprint** in Scholze at Definition 6.2, p.35, Scholze lines 1500–1504: the source says the transfer presheaf is covariant in the displayed correspondence category; it should be contravariant to give ordinary presheaf pullback; affects a stated result.
- **Error** in Scholze at proof of Proposition 5.19, p.35, Scholze line 1471: the source says use the maximum of the two coefficient bounds; it should be their minimum, as the root norms 1/8 and 2 demonstrate; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, Scholze lines 1621–1624: the source says the outer threshold is r₁ and the inner bound is r₁ⁿ; it should use outer radius r₂ and inner exponent kᵢ; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, Scholze line 1631: the source says the ratio-minus-one numerator is T₂−T₁; it should be T₁−T₂; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, Scholze line 1633: the source says a malformed containment includes an extra rational term; it should include the reduced-unit summand in the image of differences of point classes; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, Scholze lines 1601–1603: the source says each annular domain has e degree coordinates; it should have d per domain and de in total; affects nothing.
- **Gap** in Scholze at six-operation construction after Proposition 9.3, p.52, Scholze lines 2181–2186: the source says start with all finite-cohomological-dimension affine maps; it should first justify their projection formula or start with the bounded-ball class and enlarge after rigidity; affects the proof.
- **Error** in Scholze at Theorem 11.1, p.57, Scholze lines 2398–2399: the source says the rational mapping spectrum is the weight-j K-summand; it should include the cohomological shift [−2j]; affects a stated result.
- **Misprint** in Scholze at construction preceding Definition 11.3, p.58, Scholze line 2453: the source says the geometric map induces f_*ℤ→g_*ℤ; it should induce g_*ℤ→f_*ℤ, whose inverse defines the subsequent augmentation; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "dfc9dde0796f9a1dce80b2918357ca42c69e28ce", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~3", "model": "gpt-6-astra", "worker": "chris-6"} -->
