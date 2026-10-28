<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1232#issuecomment-6400460851 -->
Review (codex) of 7359b72

Verdict: needs_changes

1. **F01** (P1) Factorial equations have become impossible inequalities

   **Location.** packages/FunctionFieldArithmeticPartII/README.md:7880, §3.186, repeated in twelve other targets: “C_A(f) is the factorial affine root colimit with u_i^(i+1)≠f.” Related corruption occurs at line 10945 (§3.375) and line 14727 (Worked examples).

   **Claim.** The standing root relation for the action targets is an inequality, with the factorial missing. Read literally, these targets impose an impossible condition at index zero. The worked example also asserts a power transition from order 6 to order 5.

   **Witness.** At i=0, the stage is A[t]/(t−f), so u₀=f and u₀¹=f. Over ℤ with f=2 this is 2=2, contradicting the displayed inequality.

   The thirteen affected targets are §§3.186, 3.215, 3.216, 3.240–3.243, 3.293, 3.294, 3.308 and 3.325–3.327, at lines 7880, 8326, 8340, 8792, 8806, 8820, 8834, 9602, 9616, 9862, 10122, 10136 and 10150. This also contradicts the advertised inclusion of the zero ring. In §3.375 the expression `((n+1)!/n)/(n+1)≠1/n` does not give the claimed character identity. At n=1 both displayed sides equal 1, so its inequality is false. In the worked example, a sixth root t of 2 has (t¹⁴⁴)⁵=2¹²⁰, not 2.

   **Exact repair.** At all thirteen sites state `u_i^((i+1)!) = algebraMap(A,C_A(f))(f)`, or use d_i=(i+1)! consistently. In §3.375 state the rational identity `(((n+1)!)/n)/((n+1)!) = 1/n`, with n>0. In the worked example restore orders `6! = 720` and `5! = 120`; the final order remains 5. Add the index-zero and index-two computations as negative controls for accidental inequality or missing-factorial replacements.

   **Repair tested.** For i=0,f=2 the corrected equation is 2¹=2. At i=2 the relation is u₂⁶=2, not u₂³=2. At n=2 the corrected character is (6/2)/6=1/2. For a 720th root t of 2, (t¹⁴⁴)⁵=t⁷²⁰=2; passing through order 120 gives exponents 6 and 24, whose product is 144.

2. **F02** (P2) The finite-rank monodromy input is supplied only in rank one

   **Location.** packages/FunctionFieldArithmeticPartII/README.md:12915, §7.3: “Local systems are lisse ℚ̄_ℓ-sheaves of finite rank”; the same paragraph attributes their representation dictionary to §7.26. At line 13362, §7.26 constructs only “rank-one lisse O_E-sheaves”.

   **Claim.** The restriction theorem and its proof in §7.3 use the representation dictionary for every finite rank. The cited local adapter and its finite-level API provide rank one throughout. The scheme dictionary does not by itself state the stack comparison being invoked.

   **Witness.** On ℙ¹ over 𝔽₅, pull back the continuous ℚ₃-representation with Frobenius J=[[1,1],[0,1]]. It has rank 2, J²=[[1,2],[0,1]], and is not a sum of rank-one representations.

   This example belongs to §7.3 with R empty. It cannot be an object of the rank-one category in §7.26. The gap is in the proof input, not a counterexample to the desired restriction theorem. InverseGaloisAndArithmeticFundamentalGroups §IG.5.7 supplies the π₁-surjection, and DeligneWeightsAndPurity §8.24 supplies the constructible category; neither replaces the missing finite-rank atlas/lattice comparison attributed to §7.26.

   **Exact repair.** Extend §7.26's normal-DM lattice descent and continuous-representation comparison to locally constant finite rank, including rank zero, with lattice-preserving integral maps and localization only afterwards. Retain its rank-one tensor/dual specialization for the character-sheaf consumers. State the finite-rank API explicitly and make §7.3 cite that API. Do not narrow §7.3 to rank one.

   **Repair tested.** The lattice ℤ₃² with action J reduces to a two-dimensional representation; J has order 3 modulo 3 and order 9 modulo 9, while its rational action has infinite image. Its commutant consists of [[a,b],[0,a]], of dimension 2, so the full-faithfulness test is not merely the scalar rank-one test. The zero lattice supplies rank zero. These examples obey the corrected domain and preserve the repaired separation of reduction from rational localization.

3. **F03** (P3) The normalization finite-presentation target is already an instance

   **Location.** packages/FunctionFieldArithmeticPartII/README.md:473–483, §1.18: “For every natural n, including zero, Algebra.FinitePresentation B D holds”. Its proof route says to reuse the AdjoinRoot instance.

   **Claim.** This is a new target, although it is exactly the native quotient-algebra instance at the pin, with no additional normalization comparison.

   **Witness.** Mathlib/RingTheory/AdjoinRoot.lean:158, `AdjoinRoot.finitePresentation`, gives finite presentation of AdjoinRoot f over S when its coefficient algebra is finitely presented over S. Set S=B and f=Xⁿ−C(u).

   **Exact repair.** Delete §1.18 as a target. List this instance in Scope and ownership and From Mathlib, and replace local §1.18 dependency references with the exact imported instance. Keep any useful explanatory calculation in the normalization discussion.

   **Repair tested.** The instance applies to B=ℤ/4,u=3,n=2 and to n=0,u=1, where the latter algebra is B[T]. It also applies to the zero ring. Positivity and invertibility of n are not needed. No replacement theorem belongs in Suggested.lean.

4. **F04** (P3) Some definition Checks still do not discriminate the constructed map

   **Location.** packages/FunctionFieldArithmeticPartII/README.md:9443–9447, §3.284: “Evaluate T on an arbitrary pure tensor.” At lines 9872–9876, §3.308 checks the action unit, product law and zero ring.

   **Claim.** These lists satisfy the required concrete, discriminating Checks for their definitions. The first two tensor bullets provide no evaluated instance. All three action bullets also hold for the wrong trivial action.

   **Witness.** Define α′(g,x)=x. Then α′(1,x)=x and α′(gh,x)=α′(g,α′(h,x)); the zero-ring condition also holds. But the intended action at f=1 sends the all-one point's second root to −1.

   **Exact repair.** Give at least three concrete computations for each definition. For §3.284, over ℤ at f=2, use T(e_[1/3]⊗v₂)=e_[1/3]⊗u₁, T⁻¹(e_[1/2]⊗u₂)=e_[1/2]⊗v₆, and their sum with 1⊗1; retain the zero ring as an additional test. For §3.308 use the coherent complex family ζ_n=exp(2πi/n), the all-one root point, its product action, and a universal infinitesimal point in characteristic two.

   **Repair tested.** At roots 2 and 6 the action values are −1 and ζ₆=(1+√3i)/2, whereas the trivial action gives 1 and 1. Acting twice gives ζ₆²=(−1+√3i)/2. Over 𝔽₂ at f=0 the universal value is h₂⊗v₂, differing from 1⊗v₂ by the nonzero basis element (h₂−1)⊗v₂. The tensor examples distinguish the 2nd and 6th roots and preserve the first character factor.

5. **F05** (P3) Twenty-one citations attach the section tag to the lemma

   **Location.** packages/FunctionFieldArithmeticPartII/README.md:6625 (§3.115), repeated through line 11026 (§3.381): “Lemma26.17.2 (tag01JO)”.

   **Claim.** The tag of Lemma 26.17.2 is 01JO.

   **Witness.** NormalizationThree-codex-rtOQ9t line 1383 labels the section 01JO; line 1387 labels Definition 26.17.1 as 01JP; line 1410 labels Lemma 26.17.2 as 01JQ, printed p.31.

   **Exact repair.** In the 21 occurrences of this exact parenthetical, use `Lemma 26.17.2 (tag 01JQ), printed p.31`, citing source line 1410. Preserve the existing manifest key and valid links to section 01JO; those are not themselves wrong.

   **Repair tested.** The corrected locator reaches the affine fibre-product theorem, whose ring is A⊗_R B. For R=ℤ,A=ℤ/4,B=𝔽₂ this is 𝔽₂; the scheme fibre product is Spec 𝔽₂. No mathematical target changes.

6. **F06** (P3) Residual field-symbol and signature-model wording

   **Location.** packages/FunctionFieldArithmeticPartII/README.md:4736, §3.8: “𝔽₃(t_3^4)=e_[1]”; line 12954, §7.5: “these are private signature models, not replacements.”

   **Claim.** The first expression names the polynomial-to-character map; the second describes the imported exterior maps as private signature models.

   **Witness.** §3.8 defines the map F_n, not the field 𝔽₃. Suggested.lean has only the three root-chart definitions and two comparison theorems; it has no private tensor/exterior signatures.

   **Exact repair.** Write `F₃(t₃⁴)=e_[1]` with F₃ explicitly the map at exponent 3; preserve arbitrary coefficient ring A. Delete the private-signature clause in §7.5 and simply cite the pinned exterior maps. Keep process descriptions out of the mathematical roadmap.

   **Repair tested.** In A[ℤ/3], F₃(t₃⁴)=e_[4]=e_[1], for A=ℤ as well as A=𝔽₃. The exterior maps still give π₂α₂(v∧w)=2(v∧w); no private model is needed.

Six findings: two blocking (one P1, one P2), four P3. The package is repairable and remains an extension of FunctionFieldArithmetic. None of its mathematical files was changed in this review. The source manifest was not changed.

## Previous findings, checked individually

The preceding repair report's F01–F08 correspond to the preceding review's R01–R08. The table distinguishes repairs at the named sites from recurrence elsewhere. The earlier architecture objection, previously marked not actionable, is not re-raised.

| Previous finding | Repaired passage in packages/FunctionFieldArithmeticPartII/README.md | Verification and disposition |
| --- | --- | --- |
| F01: missing stack operations and restriction input | §7.29, line 13411: “construct the middle perverse t-structure”; line 13413: “Representability of f is not required.” | **Partly repaired.** The actual rational DM perverse construction, intermediate extension and nonrepresentable proper quasi-finite comparison are now targets. The shift and collision computations below pass. The dense-open supplier exists. However, §7.3 invokes a finite-rank dictionary while the new local adapter remains rank one: R02 below. |
| F02: reduction after rational localization | §7.26, line 13362: “No finite-reduction functor is asserted on the rational localization.” | **Repaired.** Multiplication by 3 is noninvertible on the integral lattice and zero modulo 3; it is invertible rationally. Multiplication by 2 remains invertible at both integral and residue levels. |
| F03: unowned hyperplane theorem | Exact supplier contracts, line 91: “What EtaleCohomologyFoundations must provide (gap:normal-proper-hyperplane-covers)” | **Repaired.** The same slug, supplier and general proper-normal theorem occur in design/plan.json. Layer 8 explicitly consumes the gap. SGA1 lines 8303 and 8308 support the hypotheses; the dimension-one counterexample is retained. |
| F04: duplicate directed-limit representative targets | From Mathlib, line 35: “Use `DirectLimit.exists_eq_mk`”; §§3.64–3.65 import its applications. | **Repaired at both cited targets.** §§3.87 and 3.102 are absent, and their consumers use the import. The same duplication pattern survives at §1.18, recorded as R03. |
| F05: generic Checks | §1.5, line 232: “both coordinate-algebra comparisons send T to T and 3 to 1”; §3.126 uses the actual factorial stages 2 and 6. | **Partly repaired across the package.** All six originally cited sites now have concrete computations; the extra normalization sites listed by the repair report do too. The substitution of 2→6 for the previous review's erroneous factorial 2→4 example is correct. Generic Checks remain at §§3.284 and 3.308: R04. |
| F06: aliases, process prose and notation | §7.26 names its coefficient domains; §4.6 cites “ModularCurves §0F (finite-locally-free Weil restriction)”. | **Partly repaired.** The reported explorer aliases are gone and the Weil-restriction owner resolves. Residual notation and process wording remain (R06); the factorial/inequality corruption is mathematically substantive (R01). |
| F07: SGA1 locator | Layer 8, line 13446: “Exposé X, Lemme 2.10” and “Corollaire 2.11”. | **Repaired.** The existing SGA1 manifest entry agrees. The recomposed and original printed page references are distinguished correctly. R05 concerns a different, repeated Stacks tag error. |
| F08: generic residue field treated as finite | Layer 3 Examples, line 11785: “Choose a closed point of a nonempty affine finite-type ℚ-chart”. | **Repaired.** Residue degrees at (T), (T²−2), and (0) are respectively 1, 2, and infinite. Only the first two are used in the finite-degree obstruction. |

## Verified sound

The inventory has 817 numbered targets and ten layers. The review revisited the eight previous findings, the added perverse target and hyperplane contract, the repaired normalization/descent examples, all fifteen seeded source targets, all five Lean declarations, and the principal formulas and conventions across the layers. Unchanged results were inherited only where the earlier review had computed rows; the tables below record additional computations and the sampled, headline and finding-bearing targets. A successful sorry build is not used as evidence of mathematical truth.

The package preserves arbitrary rings, zero rings, nonunit parameters, wild finite roots, nonreduced branch fibres, fpqc rather than fppf infinite torsors, signed adelic conventions, negative degrees and integral/rational coefficient distinctions. The odd-characteristic restriction belongs to the quadratic geometric class-field-theory layers, not to the earlier general root library. No executable algorithm, copied source passage, sorry'd data or set_option was found in the acceptance file. The README has the requested major sections and layer endings; R03–R06 record local ownership, Check and presentation defects rather than treating the overall shape as a substitute for content.

### Seeded source verification

All fifteen sampled locators were read in the supplied legal cached texts. “Deduction” below means that the source supplies the parent construction and the README supplies the elementary coordinate proof; it is not a claim that a separately numbered theorem in that source states the adapter verbatim.

| Sample and README location | Text, locator, hypotheses and result |
| --- | --- |
| 1.18, line 473 | FramedRoot-codex-rtOQ9t line 7989, Alper Example 4.9.22 and Exercise 4.9.23(c,d), printed pp.159–160. The root-chart discussion is the parent; the all-n finite-presentation assertion follows from the native quotient instance, not an assertion about a positive-exponent cover. True but duplicated: R03. |
| 1.52, line 1065 | TV17 line 778, Corollary 3.13 and §3.1, pp.14–16; STACKS-KUMMER line 1442, Lemma 59.28.3 (040N). The latter concerns unit parameters. The arbitrary-f tensor basis is instead the stated monic-polynomial deduction; it does not silently extend the Kummer torsor hypothesis. Zero ring handled separately. |
| 1.87, line 1648 | FramedRoot-codex-rtOQ9t line 7989, same example/exercise, pp.159–160. Multiplying the section coordinate by the adjoined normalization root gives the normalized point. The arbitrary-exponent coordinate deduction does not import an étaleness assertion. |
| 1.109, line 2045 | FramedFppfCover-codex-rtOQ9t line 837, Definition 34.7.1 (021M), printed p.19. Finite free positive rank plus finite presentation supplies the singleton fppf cover. Exponent zero is not included in that covering assertion. |
| 1.156, line 2798 | NormalizationThree-codex-rtOQ9t lines 1387 and 1410, Definition 26.17.1 and Lemma 26.17.2, printed p.31. Triple pasting is the stated universal-property deduction. The sample's section-level citation is valid; R05 distinguishes the other places that explicitly mislabel the lemma's tag. |
| 1.169, line 2995 | TV17 line 778, §3.1/Corollary 3.13, pp.14–16; STACKS-KUMMER line 1442. The weighted table is an elementary quotient-root calculation, valid without cancelling f. Source unit hypotheses are not used to claim that arbitrary f gives a torsor. |
| 3.123, line 6757 | TV17 line 668, §3.1, pp.14–16. For n dividing N, the relative algebra is monic of degree N/n; this proves finite free positive rank, flatness and surjectivity. This is a coordinate deduction, including inseparable transitions. |
| 3.142, line 7094 | Stacks-finite-root-projections-codex-7e92bd line 46, Lemma 32.2.1 (01YW), printed p.2, for the affine inverse-limit framework. The coefficient natural transformation itself follows by applying opposite and Spec to the supplied ring maps. Contravariant direction checked. |
| 3.156, line 7394 | TV17 line 668, §3.1, pp.14–16. Evaluation at a coherent family is the colimit universal-property deduction on arbitrary test algebras, not just fields. |
| 3.170, line 7622 | TV17 line 650, Proposition 3.5, Remark 3.6 and §3.1, cited pp.13–16. This range contains the finite-stage/coherent tower description. Compatibility at an arbitrary positive index is the cofinal extension calculation. |
| 3.190, line 7949 | TV17 lines 668–683, §3.1, pp.14–16, gives the affine limit model. The statement's all-test-schemes universal property is obtained through the native Spec adjunction, not by testing only affine points. |
| 3.309, line 9884 | TV17 lines 698–702, §3.1, pp.14–16, gives the rational character group and grading. The map from the unity-root colimit to A[ℚ/ℤ] is the stated rank-one coordinate deduction. Its inverse uses the positive-index extension notation of §§3.217 and 3.282; a denominator is not mistaken for a factorial-stage index. |
| 3.345, line 10424 | TV17 line 668, §3.1, pp.14–16. The specified transport is the definition of the rational-coordinate coaction, retaining the left tensor factor. It is not an additional theorem asserted by TV17. |
| 6.4, line 12658 | YZ19 lines 7239–7248, §A.1.6, printed pp.517–518. The modified local units use multiplicative residue squaring. The kernel and residue-square quotient are the corresponding elementary group calculation, with one factor per closed ramified place. |
| 8.6, line 13573 | YZ19 line 7507, Lemma A.9 proof, printed p.521, especially lines 7557–7559 for the projective cover. The nonempty weight-one block and odd characteristic are retained. The rank is 2^a, not 2^ρ. |

The additional changed-source checks read LO-P lines 169–179 (Lemma 4.1/Theorem 4.2, p.6), 287–314 (§6, pp.9–10), 327 (Proposition 7.1, pp.10–11), and 354 (§8, pp.11–12); ACV01 lines 1594 and 1615 (Proposition A.0.7/Theorem A.0.8, pp.34–35); and SGA1 lines 8303, 8308 and 8606 (X.2.10–2.11 and XI.1.1). The correct two-sided intermediate-extension characterization in §7.29 avoids the source error noted below. The general hyperplane theorem has properness, normality, irreducibility and image dimension at least two; none is replaced by a projective-space-only supplier contract.

### Computed adversarial table

| Statement or convention | Instances and values computed on each side | Result / change |
| --- | --- | --- |
| rootChart, §1.7 and Lean definition | A=𝔽₂,f=0,n=2: t²=0 and coefficient vector of t is (0,1), nonzero. A=ℤ,f=2,n=0: ideal (1−2)=(−1), quotient zero. | Native quotient, including total n=0, is correct. |
| rootChartCoaction | n=2: (h⊗t)²=h²⊗t²=1⊗f. At n=0 the relation on both sides is 1=f and H=A[h]. | The real body satisfies its quotient relation; no μ₀ assertion. |
| rootChartComparison | A=ℤ/4,f=2,n=2: Θ(t⊗t)=2h⊗1; Θ(2t⊗t)=0, while its source coefficient is 2≠0. n=1: Θ=id_A. | Actual coaction comparison, not a free unrelated map. |
| Injectivity headline, §1.184 | n=1,f=0: true/true. n=2,A=ℤ,f=2: true/true. A=ℤ/4,f=2: kernel sizes 2 for Θ and multiplication by 2, hence false/false. Zero ring: true/true. | Both directions and regular nonunit case pass. |
| Surjectivity headline, §1.185 | n=1,f=0: true/true. n=2,A=ℤ,f=2: h⊗1 missing and 2 nonunit, false/false. A=𝔽₅,f=3: inverse coefficient 2, true/true. | Correct distinction between regularity and units. |
| Positivity boundary | n=0,A=ℤ,f=2: Θ:0→0 bijective, but n=1∨IsUnit 2 is false; multiplication by 2 is injective. | Surjectivity cannot lose hn. Both theorems retain hn explicitly. |
| §1.18, R03 | ℤ/4[T]/(T²−3) is one-generator/one-relation; n=0,u=1 gives (ℤ/4)[T]; zero base gives zero algebra. All three are finitely presented. | True native instance, delete duplicate target. |
| §1.52 source coordinates | n=2,A=ℤ/4: coefficients of 1+2x⊗1+3(1⊗x) are (1,3,2,0) in order (00,01,10,11). Zero ring: the only family is (0,0,0,0). | Unique in both cases, without a false natDegree claim over zero ring. |
| §1.87 normalized point | ℤ/4,u=3,y=1,n=2: (Ty)²=T²=3=f. ℤ/9,u=1,y=3: 3T≠0 and (3T)²=0=f. | Root equation and nonzero nilpotent retained. |
| §1.109 cover | ℤ/4,u=3,n=2: D has basis 1,T and rank 2; its residue over 𝔽₂ is 𝔽₂[T]/((T−1)²), nonzero. n=0,u=1: D=B[T], not a positive-degree finite free normalization cover. | Cover proof uses n>0 exactly where required. |
| §1.156 triple normalization | ℤ→ℤ/4→𝔽₂→𝔽₄,u=−1,n=2: both composites give 3↦1,T↦T,a↦a. n=0,u=1: both give the free variable T in 𝔽₄[T]. | Coherence and unconstrained zero exponent pass. |
| §1.169 complete table | n=2, source coefficients (1,2,3,1), f=2 in ℤ/4: output (1,2,2,3). At q=(1,0), w·c(σ⁻¹q)=2·1=2; at q=(1,1), 1·3=3. | Entire 2×2 coefficient table agrees, including wrapping. |
| Determinant sign and weights | n=1,2,3,4,5,f=3: permutation-weight determinants 1,−3,27,729,59049; sign times f^(n(n−1)/2) gives the same list. | Sign fixed by n=2, not hidden by characteristic two. |
| Framed arrows, §§1.4/1.123 | Over 𝔽₅, (u,y)=(1,2), w=3 gives (u′,y′)=(4,1). Both roots give 4; u′w²=4·9=1; inverse label 2. | Both arrow equations, direction and inverse pass. |
| Normalization-arrow inverse | Over ℤ/9 at u=1,y=3, the label −1 changes y to 6 and sends the other normalization variable to −T. Then 6(−T)=3T. | Inverse label in the ring map is essential. |
| Nonflat and inseparable changes | ℤ/4→𝔽₂ sends 2T≠0 to 0 and 3 to 1. Over 𝔽_p,n=p,f=x, the frame equation z^p=qx eliminates x and gives 𝔽_p[z,q,q⁻¹]. | Base-change naturality does not assert kernel preservation; regularity does not imply DM at μ_p. |
| §3.123 finite transitions | In characteristic 2,f=0, t₂↦t₄²; t₄²≠0, (t₄²)²=0. Relative basis 1,t₄ has rank 2. n=N gives rank 1 and identity. | Finite flat surjective remains true for inseparable and nonreduced transitions. |
| §3.142 finite scheme diagram | ℤ→ℤ/4→𝔽₂,f=2: ring maps send (7,t_n) to (1,t_n) along both paths. Spec arrows run from the 𝔽₂-chart back to the ℤ-chart. | Contravariant order and arbitrary coefficient changes pass. |
| §3.156 coherent evaluation | f=1,B=ℂ, ζ₆=(1+√3i)/2: h₆↦ζ₆,h₂↦ζ₆³=−1; all-one family gives 1,1. Zero B gives 0=1 throughout. | Evaluation retains family, coefficients and zero ring. |
| §3.170 finite extensions | t₂↦t₆³↦t₂₄¹²; direct 2→24 also gives t₂₄¹². At f=0,char 2 this element is nonzero and square zero. | Arbitrary positive-index compatibility, not just exponent-one identities. |
| §3.190 scheme limit | Compatible roots 1 at f=1 give t_n↦1 and hence a cone point. On nonaffine ℙ¹_ℂ the same map is induced by Γ(ℙ¹,O)=ℂ. Empty test scheme has one map; zero base has empty Spec. | All-test-schemes statement follows from the actual adjunction, not a field-point limit. |
| §3.309 unity coordinates | t₃²↦e_[2/3], t₆³↦e_[1/2], coefficient 2↦2e_0. For q=−1/3 the inverse uses the positive index 3 and exponent 2; returning gives e_[2/3]=e_[−1/3]. | Denominator, factorial cofinality and negative class handled correctly. |
| §3.309 nonreduced control | Over 𝔽₂, (e_[1/2]−e_0)²=e_0+e_0=0, but its two coefficients are nonzero. The corresponding t₂−1 is also nonzero square zero. | Scheme character algebra retains infinitesimal information. |
| §3.345 specified transport | f=0,char 2: ρ(v₂)=h₂⊗v₂, then E⊗id gives e_[1/2]⊗v₂=η(v₂). For a=3 both routes give e_0⊗3. | Left factor and parameter preserved. |
| §§3.186 etc., R01 | i=0,f=2: u₀¹=2 versus asserted inequality to 2. Zero ring: 0≠0 also false. i=2: correct root exponent 6, not 3. | Blocking false convention; corrected values specified in R01. |
| §3.375 and Worked examples, R01 | n=2 corrected character (6/2)/6=1/2. A sixth root t of 2 gives (t¹⁴⁴)⁵=2¹²⁰; a 720th root instead gives 2. | Restore factorials and equalities. |
| §3.284, R04 | T(e_[1/3]⊗v₂)=e_[1/3]⊗u₁; T⁻¹(e_[1/2]⊗u₂)=e_[1/2]⊗v₆; adding 1⊗1 retains both coefficients 1. | Concrete replacements for generic Checks. |
| §3.308, R04 | Trivial action gives root values 1,1. Intended action on the all-one point gives −1,ζ₆; two actions give ζ₆² at root 6. Universal characteristic-two difference is (h₂−1)⊗v₂≠0. | Existing Checks admit the wrong model; new ones reject it. |
| §§3.115–3.381 locator family, R05 | (ℤ/4)⊗_ℤ𝔽₂=𝔽₂ and Spec of that tensor is Spec 𝔽₂. | Mathematical affine-product calculation passes; correct tag is 01JQ. |
| §3.8, R06 | F₃(t₃⁴)=e_[4]=e_[1] over ℤ and over 𝔽₃. | Map symbol must not become a finite-field symbol. |
| Infinite coinvariants, §§3.391/3.401 | Over 𝔽₂,f=0: η(v₂)=e_[1/2]⊗v₂≠e_0⊗v₂, whereas η(1)=e_0⊗1. μ₂(𝔽₂) has one point and would fix v₂. | Universal coinvariants, not geometric-point invariants. |
| Infinite quotient and base change, §§3.398/3.424 | At 2→4,f=0 the retained root is t₄²≠0. Both coefficient-change routes send 3↦1,T↦T. Zero-section arrows retain μ_n labels. | Nilpotents and coherent arrows survive; quotient is not an orbit set. |
| DVR reduced gerbe | At f=0, t_n^n=0 and t_n^(n−1)≠0 for n>1. Reduction kills all t_n and leaves k; the residual band remains μ_n at finite level and D(ℚ/ℤ) in the tower. | No uniformly nilpotent ideal is asserted for the infinite limit. |
| Kummer direction and non-fppf torsor | [2]₄ maps to [2]₂≠1, while [4]₂=1. A finite field extension of degree d cannot contain a root of Xⁿ−2 for n>d. Closed residues of ℚ[T] have example degrees 1,2; generic residue degree is infinite. | Transition has no extra power; repaired closed-point argument passes. |
| Coframe/band convention | At n=3,a=2 over ℚ, coframe class is [2], Isom(origin,y) class is [1/2]; ratio 4 is not a cube. Replacing the reference frame by 3 gives [3/2]=[3][1/2]. | Inversion is visible beyond μ₂. |
| Root Picard square quotient | One geometric branch: u↦u² has kernel {±1}, size 2. Empty branch: ordinary line automorphisms remain G_m. A= k[ε]/ε², section ε has geometric value 0. | Inertia retained; effective open excludes that nilpotent global section. |
| §6.4 modified units | Over 𝔽₅, residue squares {1,4}, quotient size 2 and local kernel size 2. For one degree-two closed point over 𝔽₅, its 𝔽₂₅ residue still gives kernel size 2, not 4. Empty R: both products have size 1. | Counts closed places, not weighted degree. |
| Signed adelic equivalence | A degree-two place, a=π⁻¹: E(a)=−x, degree −2; O(−E(a))=O(x), degree +2. Supplier b=a⁻¹ gives E(b)=x, same +2. Unit 2 over 𝔽₅ has inverse 3 and inverse rigidification 2. | Local frame and Frobenius sign agree with supplier. |
| Averaging and Koszul invariants | ℚ[S₃]: e(1)=Σg/6=e²(1). ℚ[Q₈]: Σg/8 both times. Trivial group: 1. In characteristic 2, augmentation sends invariant 1+g to 0, missing 1. | Rational exactness does not extend to arbitrary integral coefficients. |
| Exterior maps and cohomology | π₂α₂(e₁∧e₂)=2e₁∧e₂. dim V=2,d=0,1,2,3: exterior dimensions 1,2,1,0, in degrees 0,1,2,3. dim V=0,d=0 gives 1. | Correct factorial, sign and rank-zero boundary. |
| Characteristic-two negative control | dim V=1 over 𝔽₂: signed-invariant square dimension 1; exterior square dimension 0. Over ℚ₂ the averaging factor 1/2 exists. | Factorial-unit qualification retained. |
| §7.3 finite-rank domain, R02 | J=[[1,1],[0,1]]: J³=I modulo 3, J⁹=I modulo 9, and no positive rational power is I. Its commuting algebra has dimension 2. | Not supplied by a rank-one dictionary; finite-rank extension required. |
| §7.26 integral/rational repair | ×3 on ℤ₃ reduces to zero and is not an integral isomorphism; ×2 reduces to 2 with inverse 2. Rational ×3 has inverse ×1/3. | Repaired reduction has correct domain. |
| §7.26 infinite character | Frobenius 4 gives 1 modulo 3; modulo 9 its powers are 4,7,1. Dual is 7 modulo 9, and 4·7=1. | Finite coefficient reductions do not impose finite global monodromy. |
| Dense restriction | Normal π₁-surjection retains intertwiner equations. Nodal cubic cycle double cover: connected components 1 before, 2 after restriction; permutation-system endomorphism dimensions 2 and 4. | Normality is essential and retained. |
| Symmetric lines at collision | Equal signs: (−1,−1) acts by +1 on tensor line, invariant dimension 1. Mixed signs: −1, invariant dimension 0. Target branch sign remains −1, not its square +1. | Identical-input-line hypothesis and inertia character retained. |
| §7.29 perverse atlas and boundary | Bμ₂: constant and sign are perverse degree 0; rational pushforward dimensions 1 and 0, positive cohomology 0. Curve L[1]: H⁻¹=L,H⁰=0. | Shift and nonrepresentable stabilizer calculation pass, including ℓ=2. |
| §7.29 pushforward/j_!* | t↦t² on A¹ in odd characteristic: both sides have unshifted rank 2 on G_m and 1 at 0; sign/constant boundary ranks 0/1. f=id,j=id gives P, including P=0. | The new comparison supplies the missing operation, not just its stalk count. |
| §7.29 source negative control | j:G_m→A¹: j_!E[1] has boundary stalk 0; E_A¹[1] has boundary H⁻¹=E. Both have perverse H⁰i*=0. | One-sided source uniqueness fails; roadmap's two-sided condition rejects j_!. |
| High-degree bound and fibres | (g,ρ,d)=(0,1,2): B=2,n=3,a=2; (1,1,2): B=2,n=2,a=1. At L(−R)=ω, H¹ has dimension 1. | Bound gives positive kernel rank; low-degree boundary cannot be admitted. |
| §8.6 projective cover | (a,ρ)=(1,1): x↦x² has rank 2 and ramification index 2. (2,1): basis 1,x₁,x₂,x₁x₂ gives rank 4=2². Characteristic 2 derivative 0. | Correct odd-characteristic cover with nonempty weight-one block. |
| Projective-space input and gap | r=0 connected cover degree 1; r=1 genus 1−m gives 0,−1,−2 for m=1,2,3. For t²:P¹→P¹ the fibre of 1 has two points, image dimension 1. | General hyperplane input applies only at image dimension at least 2. |
| All-degree character | Scalars at x,y are 2,3: at x−y both constructions give 2/3, at y−x 3/2, at zero 1. Three factors 2,3,5 give 30 under either association. | Negative degrees, unit and multiplicative coherence pass. |
| Closed-point Frobenius | In a cyclic tensor for a degree-two point, one cycle scalar α yields trace α; taking α=3 gives 3, not 9. | Geometric Frobenius convention is not raised to the residue degree twice. |
| Norm complex and obstruction | det multiplication by c+dt is c²−ad²; (c,d,a)=(1,1,2) gives −1, branch a=0 gives 1. On the double cover of P¹, invariant O(1) has degree 1, outside pullback degrees 2ℤ. | Norm sign and genuine torsor obstruction retained. |
| Ramified norm on global units | Over 𝔽₅ with branch {0,∞}, root global units number 8 and norm image number 4; (1,1,−1) is outside the image and has order 2. | No naive exactness on Picard isomorphism classes. |
| Quadratic trace headline | Split fibre: Frobenius fixes e₁−e₂, trace +1. Inert fibre: negates it, trace −1. Quadratic Artin values are respectively +1,−1. | End-theorem signs agree. |
| Universe and excluded cases | Lifting a two-object diagram gives two lifted objects and the same identity maps, not all larger-universe objects. Empty residue family gives unit 1. A finite field has q≥2, so q=1 has no instance. | Essential-image and actual-domain restrictions retained. |

### Pins, ownership and supplier resolution

The library revisions used are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, from the content manifest. Examples of native declarations opened and compared, rather than inferred from names:

| Pinned declaration and file | Content used and limit checked |
| --- | --- |
| `AdjoinRoot.finitePresentation`, Mathlib/RingTheory/AdjoinRoot.lean:158 | Generic finitely presented quotient instance; no positive exponent required. R03. |
| `DirectLimit.exists_eq_mk`, Mathlib/Order/DirectedInverseSystem.lean:130 | Every directed-limit element has a component representative; no root-specific condition. At common stage 6, 1+v₂+v₃ is represented by 1+t₆³+t₆². |
| `finite_of_finite_type_of_isJacobsonRing`, Mathlib/RingTheory/Jacobson/Ring.lean:676 | Field S, Jacobson coefficient ring R, finite-type R-algebra S imply finite module. Applies to a closed residue field, not the generic residue ℚ(T). |
| `ValuationSubring.surjective_unitGroupToResidueFieldUnits`, Mathlib/RingTheory/Valuation/ValuationSubring.lean:735; residue-unit equivalence at line 743 | Supplies unit lifting used in the residue-square quotient; does not make the modified-unit homomorphism injective. |
| `Representation.averageMap`, `averageMap_invariant`, `averageMap_id`, `isProj_averageMap`, Mathlib/RepresentationTheory/Invariants.lean:126–141 | Projection to invariants when group order is a unit, over arbitrary modules. Finite dimensionality is not inserted into the package's averaging argument. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf`, TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112 | A full subcategory of module sheaves; its morphisms are all module maps. It is not already the core. The README explicitly takes the core for root arrows. |
| `InvertibleSheaf.tensorProduct`, TauCeti/AlgebraicGeometry/LineBundle/TensorProduct.lean:63 | Tensor product on native invertible sheaves. Does not by itself supply the declared section-coordinate or universe-coherence gaps. |
| `exteriorPower.fromTensorPower`, `fromTensorPower_comp_toTensorPower`, `toTensorPower_injective`, `toTensorPower_comp_fromTensorPower`, TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:170,186,204,216 | Arbitrary commutative rings/modules; factorial-unit assumption on injectivity. The two composites and naturality are imports, not new maps in Suggested.lean. |

Ownership searches used the mandated roadmap grep/show service on indexed main and open heads, object searches for roots, gerbes, Picard data, perverse categories and hyperplane inputs, and the board package index before any absence conclusion. A Lean-only search for the comparison theorem names and rootChartCoaction found no collision on main or in open roadmap pull requests. Main roadmaps AlgebraicVectorBundles, JacobianChallenge and EtaleCohomologyFoundations were also read for shape.

| Supplier citation resolved this round | Actual contract and ownership boundary |
| --- | --- |
| SchemeAndStackFoundations §§0.9,1.1,1.15,1.18–1.23,2.3,2.11,3.3–3.7,4.13, on main | Generic descent, stacks, root charts, finite branch fibre, Picard/cohomology/norm and regularity inputs. Its §1.21 (README line 2951) owns finite roots. The arbitrary nonreduced diagonalizable coarse extension is a declared gap, not falsely attributed to the finite-group contract. |
| AlgebraicVectorBundles L0A–L0C, on main, README lines 215–280 | Tensor/pullback coherence and rank-one module comparison. Section-coordinate and coherent universe extensions remain explicit gaps. |
| AlgebraicModuliForArithmeticGeometry §§4.3–4.4,4.23, open new-roadmap head | Neutralization uses Isom(x,y); its étale rootGerbe requires invertible exponent. This package uses fppf roots for arbitrary exponents and builds its arbitrary-scheme torsor tower separately. |
| ModularCurves §0F, on main, README line 412 | Affine finite-presentation Weil restriction for finite locally free maps, with arbitrary base change; applies to the line-frame torsor in §4.6. |
| AlgebraicCurves Layer 12, on main, README line 1085 | Closed points/places, valuations, divisors and line-bundle degrees; the completed-lattice comparison is separately declared. |
| JacobianChallenge Layers A–D, on main, README lines 111,135,143,218 | Degree, coherent cohomology/base change, symmetric/Picard geometry. A degree-two place contributes 2, and representability is not confused with a rationally chosen degree-one line. |
| FunctionFieldArithmetic §§0.1,2.1,4.1–4.2,4.5–4.10, open new-roadmap head | Arithmetic reciprocity and the positive-divisor idele convention. The explicit a↦a⁻¹ adapter gives the same O(x). The ramified quadratic residue-character identification is an explicit gap. |
| EtaleCohomologyFoundations §§F.0.2,F.0.A1–A2,F.3a,F.2.1,F.2.6–2.7,F.4.1–4.6,0.11,F.5–F.6,F.8, on main | Scheme finite-cover/adic/duality/Künneth/perverse domains. In particular README lines 200,504,645,759,776,1265 do not themselves supply stack perversity or the normal-proper hyperplane theorem. The package now owns the former and declares the latter as a gap. |
| InverseGaloisAndArithmeticFundamentalGroups §IG.5.7, open new-roadmap head, target Finite-cover criteria for full monodromy image | Normal locally noetherian connected DM stack and nonempty dense open give the finite-cover π₁-surjection. R02 is the remaining local representation-category adapter mismatch, not a missing supplier theorem. |
| DeligneWeightsAndPurity §8.24, open new-roadmap head, README line 3273 | Rational constructible DM coefficient category, effective atlas descent, refinement, pullback and Frobenius. It does not already state §7.29's perverse comparison. |
| ProfiniteCohomology Layer 10; RepresentationTheory/SchurWeyl Layer 8, on main, README lines 1549 and 352 | Genuine continuous coefficient theory and tensor permutation background. The latter's complex Schur–Weyl theorem is not used to assert arbitrary-ring exterior invariants; the native tensor/exterior APIs provide that separate input. |

GlobalShtukasAndFunctionFieldLanglands §1.4 at its open head contains the general Artin-stack perverse extension, with integral/torsion coefficients and six operations. It is a later consumer. The rational finite-type DM subcase needed here has moved to §7.29, as recorded by the repair report; it must be imported by that later roadmap when its ownership wording is aligned. There is no upward supplier citation from this package to that consumer. Generic finite roots remain in SchemeAndStackFoundations; arbitrary-exponent coordinates, coherent infinite comparisons and the ramified root-Picard character construction are the additional objects owned here.

The seven declared gap slugs agree between design/plan.json and the README: finite-diagonalizable-coarse, invertible-section-coordinates, completed-lattice-root-dictionary, quadratic-root-residue-character, coherent-site-universe-lifts, invertible-sheaf-universe-lifts, and normal-proper-hyperplane-covers. All name suppliers and specific interfaces; no `none` supplier was found. Their coordinate/coherence clauses specify one comparison, rather than unrelated bundles of theory. The last gap preserves the full SGA1 theorem. These contracts are not findings and would remain conditions of a future acceptance.

Every numbered target's explicit local Needs edges were extracted: 1,824 edges among 817 targets, with no cycle in that graph. The mandated roadmap dependency check returned:

```text
moved: FunctionFieldArithmeticPartII moved in the merge order from #16 to #169, right after its last supplier FunctionFieldArithmetic (EtaleCohomologyFoundations, AlgebraicModuliForArithmeticGeometry, InverseGaloisAndArithmeticFundamentalGroups, DeligneWeightsAndPurity also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 54 roadmaps, 601 edges, 0 problem(s)
```

The move is permitted, not a finding. No merge-order file was edited. The citation resolver's clean name-resolution result was treated as a lead; it does not detect the rank-domain mismatch in R02.

### Headline and Lean acceptance audit

| README headline | Suggested.lean treatment |
| --- | --- |
| Sharp affine root comparison: injectivity and surjectivity | Both are stated with their actual quotient/tensor maps, arbitrary CommRing A, arbitrary f and explicit 0<n. |
| Relative regular root geometry | Named unavailable: finite-root stack carrier and morphism properties. |
| Coherent infinite root stack, fpqc quotient, arbitrary base change | Named unavailable: coherent root pseudofunctor and represented band-action quotient. |
| Infinite affine coinvariants | Named unavailable: coherent colimit coaction and rational-character grading, substantial constructions rather than a few simple definitions. |
| Infinite DVR gerbe, Kummer classification, non-fppf torsor | Named unavailable: relative gerbe and fpqc torsor groupoid carriers. |
| Root Picard square quotient and signed adelic equivalence | Named unavailable: root Picard stack/degree components and completed-lattice gluing functor. |
| Rational DM perverse descent and proper quasi-finite j_!* comparison | Named unavailable: native DM constructible derived category and perverse heart. |
| Symmetric lisse lines, collisions and multiplication | Named unavailable: root symmetric-power stack and its adic lisse category. |
| Exterior-power cohomology | Named unavailable: stack étale cohomology on those objects with Frobenius. |
| High-degree Abel–Jacobi descent | Named unavailable: root Abel–Jacobi morphism and stack lisse descent. |
| Normalized character in every integer degree | Named unavailable: graded root Picard stack and lisse Frobenius category. |
| Ramified norm complex and torsor obstructions | Named unavailable: root multiplicative sheaf, norm and compatible torsor groupoids. |
| Quadratic Frobenius trace comparison | Named unavailable: root Picard character sheaf and its trace. |

`lake env lean` on packages/FunctionFieldArithmeticPartII/Suggested.lean, run from the pinned content checkout as instructed, exited 0. Its only warnings were the two declarations using sorry, at lines 79 and 86. There is one import, `import Mathlib`; no TauCeti object build was required. No Lean process was left running.

An independent scratch copy appended `#check @name` for all five declarations. The elaborated types retain A, CommRing A, f and n, and both headline types retain hn:0<n. There are no omitted section hypotheses to repair. The three definitions have real bodies and are used by both headline theorems; the README names all five. No mathematical package file was altered.

The one-tactic probe used a scratch copy with `fail_if_success solve | simp`, then the corresponding rfl and infer_instance probes before each remaining sorry. It elaborated with only the two expected sorry warnings: none of the six probes closes a headline. Object searches at the pins found no single existing theorem with either sharp comparison iff; the monic basis and tensor APIs are inputs to the nontrivial matrix argument. There are no additional admitted API, small-value or boundary theorems to delete from Suggested.lean. The README's statable affine headlines are present, and the other headlines are individually named in the module docstring with their missing carriers.

## Not verifiable

- **B24:** remains settled uncertified. Its §3/pp.135–136 locators were retained as locators alone. The text was not available legally in the supplied cache; it was not requested again or assigned another key. The independent finite Kummer and coordinate calculations do not certify that unread text.
- **Two indexed board package heads:** read requests for packages/SchemeAndStackFoundationsPartII/README.md at accb0a0 and packages/VStackSheavesAndLisseCategoriesPartII/README.md at 99411c4 each returned HTTP 404. Their existence is recorded in the supplied board index. Ownership against those exact package texts could not be certified; local design documents were not substituted for them.
- **Open-work coverage boundary:** ownership was checked through the indexed roadmap-head service and readable board packages. This is not an assertion that unread or inaccessible package heads contain no overlapping construction.

All fifteen seeded texts were readable; no new missing-reference request or manifest mutation was needed. The existing manifest has 38 source entries. Elementary deductions in the source table are distinguished from directly stated source theorems.

## Source issues

- **Misprint** in AGV08 at Appendix B.2, item (3), printed p.53 (AGV08 line 2439): the source says the section uses an unrelated exponent m; it should be raised to the defining root exponent d; affects nothing.
- **Error** in AGV08 at Appendix B.2, printed p.54 (AGV08 line 2473): the source says the finite root chart times G_m is the smooth frame chart; it should be the contracted product by the antidiagonal μ_d action; affects the proof.
- **Misprint** in YZ19 at proof of Lemma A.5, printed p.518 (YZ19 line 7281): the source says the idele coefficient composes the local frame after the inverse generic frame; it should compose the generic frame after the inverse local frame for the asserted divisor sign; affects nothing.
- **Misprint** in YZ19 at proof of Lemma A.5, printed p.518 (YZ19 line 7279): the source says the extra root data uses the line-frame symbol; it should use the root-frame symbol; affects nothing.
- **Gap** in YZ19 at A.3.3, display (A.11), printed p.525 (YZ19 line 7870): the source says the sheaf sequence yields an exact four-term Picard-stack sequence without its obstruction interpretation; it should specify based torsor fibres and connecting obstructions, excluding naive exactness on isomorphism classes; affects a stated result.
- **Error** in LO-P at Lemma 6.1, printed pp.9–10 (LO-P line 292): the source says the restriction and i* boundary condition uniquely determine intermediate extension; it should also impose the i! boundary condition, equivalently exclude boundary subobjects as well as quotients; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7359b7220f5413246e2b82e07a2c4864ca467a77", "job": "REV-PKG-FunctionFieldArithmeticPartII~3", "model": "gpt-6-astra", "worker": "chris-32"} -->
