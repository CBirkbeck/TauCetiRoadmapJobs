<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13140#issuecomment-6783543107 -->
Review (codex) of 704fbf9

Verdict: needs_changes

1. **F01** (P2) The general proper-comparison theorem remains outside the plan

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:33`, 655–657, 930, 1155, 1180, 1993. At line 657: “Whether every proper fine map is cohomologically proper is not settled by the sources”.

   **Claim:** Constructing the comparison for all proper fine maps, but proving its invertibility only for a representable subclass and assuming universal invertibility in downstream theorems, repairs the previous scope restriction.

   **Witness:** HKW22 line 1165, Theorem 4.1.8, p. 24, asserts the proper comparison isomorphism. README line 655 instead defines the additional hypothesis by invertibility itself; lines 1155 and 1180 retain it in the end theorems.

   Re-raised: REV-PKG-VStackSheavesAndLisseCategoriesPartII~2/R01.

   The repair report calls this “applied differently,” explaining that the cited source does not prove the isomorphism. The source criticism is correct: GHW22 line 133, Theorem 1.4, does not list this comparison. But lack of that proof is not a reason to remove the general result from a library roadmap under the binding no-bypassed-theory principle. The new construction and geometric criterion are useful partial progress; defining the desired conclusion as an additional hypothesis does not supply the missing theorem. This finding concerns scope, not falsity of the restricted formalism, and does not allege that every decent v-sheaf is a diamond.

   **Exact repair:** Restore an explicit target that c_f is invertible for every proper fine map, with arbitrary 2-cell and base-change compatibility, and own its missing geometric or descent prerequisites here, or declare precise contracts with an eligible earlier supplier. Propagate that general proper class to Corr/CoCorr, integration and VS9.1–VS9.2. Keep the representable special cases and the source-gap disclosure. A sufficient-point criterion alone is not the missing prerequisite unless the plan also proves it under the required proper-fine hypotheses. The boundary tests remain: q:S→BC₂ is proper nice with a nonidentity swap, and c_q sends e_g to δ_g and commutes with that swap; BC₃→S at p=2, Λ=F₃ is not proper and must stay excluded, since H⁻¹ of its shriek pushforward is F₃ whereas H⁻¹ of its ordinary pushforward is 0.

2. **F02** (P3) The proposed nonsmooth descent counterexample has split descent

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:601`: “a version requiring only surjectivity would be wrong.” This follows the infinite profinite projection offered as a negative Check for !-codescent.

   **Claim:** Its failure of cohomological smoothness witnesses failure of the proposed surjective !-codescent statement.

   **Witness:** For T=ℤ₂, f:T×S→S has section s(x)=(0,x). Extra Čech degeneracies insert 0; s^!f^!=id. The split augmented !-diagram has limit D_ét(S,F₃), despite f not being smooth.

   **Exact repair:** Retain the non-smoothness test, but remove the asserted descent failure. Record this as a split positive control: the closed-immersion section and its extra degeneracies give !-codescent even though the smoothness criterion does not apply. If retaining the separate claim that surjectivity alone is insufficient in general, provide an actual failing example and its failed comparison. On the present example, the proposed correction computes the augmentation equivalence, while the germs of δ₀ and normalized Haar remain independent, so it still distinguishes smoothness from descent. This does not dispute the smooth-surjection theorem of GHW22 Proposition 3.16.

3. **F03** (P3) A twist mismatch excludes an isomorphism, not every natural map

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1777`: “Without the twist by g^*K_(U/T), there is no natural map”.

   **Claim:** Different shifts of the untwisted source and target imply that no natural transformation exists.

   **Witness:** Take S=T a geometric point, U smooth of dimension one, Y₁=Y₂=U and A₁=A₂=Λ≠0. The source is Λ(2)[4], the target Λ(1)[2]; the zero natural transformation exists.

   **Exact repair:** Replace this with the precise obstruction to an **isomorphism** or to the required Künneth identification. Specify the above maps and coefficients, for example Λ=F₃ with p=2. At a geometric stalk H⁻⁴ has values Λ and 0, and H⁻² has values 0 and Λ, so the untwisted objects cannot be isomorphic. After inserting g^*K_(U/T), both sides are Λ(2)[4]. This preserves the intended discriminating Check without denying the zero map. The κ target and the inverse base twist in VS11.7 need no change.

4. **F04** (P3) The sheaf construction has only two Checks

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1424`, 1434–1437: “The functors M ↦ F_M (F_M(U) = 1_U·M)”. The Checks block contains two bullets.

   **Claim:** This subsection supplies the sheaf construction and its inverse equivalences in the required definition/API/Checks form.

   **Witness:** The block beginning at line 1434 has exactly two bullets before its Needs line. For T=ℕ, global sections of the constant sheaf are Λ^ℕ, whereas compact sections are Λ^(ℕ).

   **Exact repair:** Give F_M its explicit API bullet list using the facts already stated, and at least three discriminating Checks. For example: on two points and M=(F₃²,F₃), singleton sections have dimensions 2 and 1 and global sections dimension 3; on ℕ, distinguish the product of global sections from the direct sum of compact sections using the all-ones sequence; on the empty set, both module and sheaf are zero. These tests reproduce the stated equivalences and reject confusing smooth modules with their completion. Keep these in the README, not Suggested.lean.

Four findings: one P2 and three P3; one blocking finding. Nine previous findings are repaired; the remaining one is partly repaired and re-raised below. The prescribed Lean elaboration and dependency check pass. Neither establishes the missing general proper-comparison theorem. No authored package input was changed.

## Verified sound

### Previous findings checked first

The previous repair report was read as a set of claims to verify. The following quotations are from the repaired README, not from that report. Old target numbers were translated using the former-numbering table at lines 135–140.

| Previous finding | Repaired passage | Status and independently recomputed witness |
|---|---|---|
| R01, general proper comparison | 655: “there is a natural transformation c_f : Rf_! → Rf_*”; 33: “among cohomologically proper maps” | **Partly repaired.** The transformation and its coherence are now targets, but the general isomorphism is not. Current R01. |
| R02, triviality of 2-cells | 662: “No triviality of 2-morphisms is used, and none holds” | **Repaired.** Aut(S→BC₂)=C₂. On the regular F₃² it acts by identity and swap, and on the sign fibre by 1 and −1. The new c_q commutes with both. |
| R03, torsor orientation | 381: “left multiplication by h⁻¹”; 1677: “φ(y·g) = g⁻¹φ(y)g” | **Repaired.** For h=(123), f₂(t)=(12), f₁(t)=(23), h⁻¹f₁(t)=f₂(t)h⁻¹=(13). The wrong choice gives (12) versus (23). The inertia formula gives (13), not (23). |
| R04, Haar numerical hypotheses | 38: “over ℚ₂ (so p = 2), Λ = F_5”; “normalised by μ(K) = 1” | **Repaired.** μ(gKg⁻¹)=3, so the intended value is 2·3=1, the reversed value 2·2=4. At odd p or μ=0 those controls cease to distinguish. Both occurrences now fix this. |
| R05, four finite-set operations | 1491: “the finite sum and product agreeing” | **Repaired.** Two-point pullback gives (Λ,Λ), and pushforward gives Λ², not Λ. Singleton and empty cases give rank 1 and 0. |
| R06, action correspondence | 997: “in general not a 1-morphism”; 1929: “For G finite étale it is one” | **Repaired.** G_m on a point gives α^*Λ=Λ versus α^!Λ=Λ(1)[2]. The finite C₂ swap gives fixed pairs (a,1),(b,1), class (1,1), and nothing over σ. |
| R07, scalar trace | 1059: “For S = X = C with both legs the identity” | **Repaired.** C=S⊔S, u=(1,2) gives class (1,2) and integral 3 in F₅; C=S, u=2 gives scalar 2. |
| R08, zero coefficients | 1668: “For Λ ≠ 0”; 1669 supplies the zero-coefficient control | **Repaired.** Over Λ=0 the unit 0 is invertible, j_!0 is ULA and regular invariants are perfect 0. Over F₃ the Q₂/Z₂-indexed regular invariants are not finite. Current R03 is a different defect in a modified Check. |
| R09, opens of inertia | 1127: “An open subset of In_S(X) need not be the inertia of an open substack”; 1965: “restrict the isomorphism of sheaves” | **Repaired.** (2,3) restricts to 2 on an actual open of a two-point X. The nonidentity inertia component of BC₂ is not the inertia of any open of BC₂. VS11.13 now restricts the sheaf isomorphism from VS11.6 instead. |
| R10, source-driven order | 131: “VS8 and VS9 do not use it”; former numbering table 135–140 | **Repaired.** Trace formalism and its general theorem now precede locally profinite applications. There is no Needs edge from layers 8 or 9 to layer 10; layer 11 combines the branches. Old IDs have explicit translations. |

All 65 target subsections were read, including their routes and Checks. The earlier review was relied on only for unchanged computed tests, with the moved IDs translated; its descriptive summaries were not treated as completed mathematical tests. The new comparison, representability criterion, 2-cell coherence, right-torsor conventions, Haar calculation, finite operations, scalar trace and inertia restriction were examined afresh. Searches for each repaired pattern elsewhere in the package found the issues recorded above, rather than a recurrence of the nine repaired assertions.

### Seeded source sample

All fifteen requested locators were opened in the supplied legal line-numbered texts. Numbering, printed pages and hypotheses were compared with the actual target, not just its heading. No locator was marked unverified. All eight works cited by the package have certified entries; no new source or manifest entry was required.

| Target | Locator read | Result |
|---|---|---|
| 6.2 Decent v-stacks | GHW22 line 67, Definition 1.1 and Remark 1.2, p. 2; line 90, p. 3 | Diagonal condition, surjective locally separated smooth charts and clean-chart refinement agree with v1. HKW22's altered wording is not substituted. |
| 6.4 Fibre products | GHW22 line 1011, Proposition 4.5, pp. 20–21 | Fibre products over decent stacks and the diagonal/chart argument retain the assumptions. |
| 6.6 Fine morphisms | GHW22 line 102, Definition 1.3(i), p. 3; line 1047, Remarks 4.6–4.7, pp. 21–23; line 1158, Proposition 4.8 | Chart-wise compactifiability and finite dim.trg, and the representable-map characterization, have the stated hypotheses. |
| 6.8 Cohomologically smooth fine morphisms | GHW22 line 114, Definition 1.3(ii), p. 3; line 1092, Remark 4.6, p. 22 | Smoothness is a chart-wise condition, not merely invertibility of the dualizing object on the original stack. |
| 6.10 Compatibility with 2-morphisms | HKW22 line 1068, Remark 4.1.2, p. 22 | Pullback is covariant in invertible 2-cells; pushforward uses the mate of the inverse. The new nonabelian convention is consistent with this. |
| 7.1 Prespatial diamonds | GHW22 line 623, Definition 3.1, Lemma 3.2; line 640, Definition 3.3/Lemma 3.4, p. 13; line 650, Proposition 3.6, p. 14 | Quasicompact inclusion, geometric-point condition, qcqs scope and local/global distinction retained. |
| 7.8 Intrinsic smoothness | GHW22 line 1594, Proposition 4.14, p. 31; FS21 line 4983, Proposition IV.2.33, p. 129 | Invertibility and the tensor-to-shriek comparison are required after every decent base change; ULA criteria have their geometric scope. |
| 8.7 CoCorr | HKW22 line 1409, Definition 4.3.4, pp. 29–30; line 1519, p. 31 | Composition, Künneth direction and endomorphisms of the unit agree. The primed tensor target is corrected. General proper 2-morphisms remain the scope issue R01. |
| 8.12 Open restriction | HKW22 line 1567, Lemma 4.3.7, p. 32 | The open is in X; its inertia is then used. Corrected Checks respect this. |
| 9.3 Proper-diamond Lefschetz formula | HKW22 line 1618, Example 4.3.10, equation (4.3.5); line 1636, Definition 4.3.11, pp. 33–34 | The package correctly adds properness of the correspondence support, needed by Theorem 4.3.8 at line 1572. ULA and proper diamond hypotheses retained. |
| 10.10 Locally profinite quotients | HKW22 line 1306, Example 4.2.5 and equation (4.2.1), p. 27; chart assumptions at line 1229 | Equivariant smooth modules and invariant Haar-dual distributions agree; decency uses the free-action chart construction. |
| 11.1 Admissibility | HKW22 line 1657, Proposition 4.4.1/Definition 4.4.2, pp. 34–35; FS21 line 7065, V.7.1, p. 183; line 6578, Corollary V.1.4, p. 170; line 4972, Proposition IV.2.32, p. 129 | Perfect compact-open pro-p invariants, ULA and dualizability agree. The Bun_G statement is explicitly adapted rather than quoted as a theorem already about arbitrary BG. |
| 11.2 Inertia of BG | HKW22 line 1702, §4.4, p. 35 | Adjoint quotient and distribution identification agree; right-torsor conversion checked separately on S₃. |
| 11.10 Inertia of a quotient | HKW22 line 1999, §4.6, pp. 41–42; Cartesian square at line 2042 | Fixed pairs, simultaneous conjugation and the pullback square over G→[G//G] agree. |
| 11.13 Étale fixed locus | HKW22 line 2135, closing remark, p. 44; line 2416, Proposition 5.4.1/Corollary 5.4.2, p. 50 | Source's isolated⇒étale claim fails; package explicitly assumes étaleness. Its intended application has a separate explicit inertia description. |

Additional text opened includes LZ22 lines 225–441 (Constructions 1.7–1.10, Lemma 1.11 and Remark 1.12); Sch17 lines 2109, 2974, 3091 and 5047 (0-truncation/separation, spatiality, geometric-point criterion and dim.trg); LiuZhengEnhanced line 3906 (Proposition 2.2.4, pp. 79–80) and line 5220 (Theorem 4.1.8); LiuZhengGluing line 2057 (Theorem 5.4, pp. 38–39); GHW22 line 1419 (Theorem 4.9); and Stacks07LT line 9463 (Tag 07LT). These resolve the abstract inputs and the compact/perfect ownership boundary.

### Computed adversarial table

S is a geometric point in the finite-group and scalar rows. Unless the row says otherwise, coefficients are nonzero and prime to the base characteristic. These calculations test distinctions and conventions; they do not purport to prove the general source theorems. The longer working ledger covers all 65 numbered targets; this table records the sample, every headline and every target touched by a finding.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Conventions; 11.3 | Affine Q₂ group, F₅, μ(K)=1; also odd p and μ=0 | χ=2, μ(gKg⁻¹)=3; 2·3=1 versus reversed 2·2=4. Odd p: both 1. Zero measure: both 0 | Normalization now discriminates | None |
| 6.2 | BZ₂ and its point atlas, F₃ | Structure-map dualizing line rank 1; atlas base-change has independent δ₀ and Haar germs, rank at least 2; Haar(2ⁿZ₂)=2⁻ⁿ≠0 | Decent need not mean every atlas smooth | None |
| 6.4 | Two and three points over S; empty factor | Product has 6 points, diagonal 6 points in a 36-point square; empty product has 0 | Chart and diagonal counts agree | None |
| 6.6 | Identity; degree-two finite étale map; one-dimensional smooth chart | dim.trg 0, 0 and 1, respectively; fibres of first two have 1 and 2 points | Finite dimension, not dimension zero, is required | None |
| 6.8 | BZ₂→S versus S→BZ₂ | Rank-one Haar dual versus noninvertible distribution object after base change | Intrinsic smoothness needs its full condition | None |
| 6.9; 11.2 orientation | C₂→S₃, h=(123), f₂(t)=(12) | Correct intertwining gives (13)=(13); wrong gives (12)≠(23). Right-torsor φ((123))=(13), opposite formula (23) | Previous orientation repair holds | None |
| 6.10; 6.11 | q:S→BC₂, sign and regular F₃ representations | Aut(q)=C₂, regular actions I and swap P; sign actions 1 and −1 | 0-truncation does not erase 2-cells | None |
| 7.1 | Finite 2×3; countable disjoint points | Product has 6 points and is qc; countable disjoint union has no finite subcover by singleton opens | Prespatial/local distinction retained | None |
| 7.4 | Z₂×S→S with section 0 | f∘s=id, s^!f^!=id; split Čech !-limit is D_ét(S,F₃), not a failing descent category | Negative Check does not refute descent | R02 |
| 7.5 headline | BC₃→S at p=2, Λ=F₃ | H⁻¹(Rf_!Λ)=F₃; H⁻¹(Rf_*Λ)=0; H¹(Rf_*Λ)=F₃ | Truly stacky exceptional operation; map not proper | Preserve boundary in R01 |
| 7.6 | Two-point f, A=(Λ²,Λ), B=Λ³ | Projection ranks (2+1)·3=9=6+3 | Tensor and projection orientations agree | None |
| 7.7 comparison | q:S→BC₂; closed immersion | c_q(e_g)=δ_g; IP=PI=P; c_i=id | New construction handles nontrivial cells; no general invertibility target | R01 |
| 7.8 | Zero coefficients; Z₂ projection with F₃ | At Λ=0: 0→0 invertible. At F₃: two independent distribution germs, not a line | Negative examples now exclude zero coefficients | None |
| 8.7 | Point with A=Λ²; G_m action; finite C₂ action | End(A) rank 4; α^*Λ=Λ versus α^!Λ=Λ(1)[2] for G_m, but equal for finite étale C₂ | Corrected action Check; proper range still restricted | R01 |
| 8.8–8.9 headline | A=F₃²; infinite direct sum; zero category | A∨⊗A has dimension 4=dim End(A); infinite case image consists of finite-rank operators and excludes id; zero case 0→0 | Both directions distinguish finite/perfect from arbitrary | None |
| 8.10 | X=S,C=S⊔S,u=(1,2); C=S,u=2 | Class (1,2), integral 3 in F₅; scalar class 2 only in second case | Scalar repair holds | None |
| 8.12 | Two-point X, A=(Λ²,Λ³); BC₂ | (2,3) restricts to 2; BC₂ has two opens but its inertia has two nonempty components | Actual open restriction distinguished from inertia-only restriction | None |
| 9.1 headline | Fold of two points, identity on units; empty source | tr(id on Λ²)=2=1+1; empty trace 0=0 | Formula passes proper nice cases, full range unplanned | R01 |
| 9.2 headline | P¹ unit sheaf | Integrated class 2; H⁰ and H² each contribute 1, giving 2 | Proper pushforward specialization agrees | R01 for general scope |
| 9.3 headline/sample | z↦az on P¹, a≠1; translation T↦T+p on closed disc | Two simple fixed points: 1+1=2=trace. Nonproper disc: fixed set empty, 0 versus trace 1 | Properness cannot be dropped | None |
| 9.6 headline | Field extension; disconnected base change | Scalar local term 2 remains 2; over two base components becomes section (2,2) | Base-change target is H⁰, not an untyped scalar | None |
| 9.8 headline | Perfect point with Λ=F₃[t]; empty fixed scheme | Scheme and diamond traces 1=1; empty terms 0=0 | Uses declared infinite-coefficient extension | None |
| 10.2 construction | Two fibres F₃²,F₃; ℕ; empty space | Singleton section dimensions 2,1; total 3. ℕ: product global sections versus direct-sum compact sections. Empty: 0 | Construction valid, Check coverage too thin | R04 |
| 10.4 repaired Check | Two points; singleton; empty | f^*Λ=(Λ,Λ); f_!f^*Λ=Λ²=f_*f^*Λ; ranks 1 and 0 in boundary cases | No identity-functor conflation | None |
| 10.10 sample | G=1,T two points or empty; affine Haar control | H⁰(K)=Λ²=Hom(Λ²,Λ); empty 0=0; conjugation integral 2·3=1 | Distribution and Haar twists agree | None |
| 11.1 sample | Trivial Z₂ representation; Q₂ regular; Λ=0 | Invariants F₃ rank 1; regular invariants ⊕_(Q₂/Z₂)F₃ infinite rank; zero invariants perfect 0 | Admissibility criterion discriminates | None |
| 11.2 sample | G=S₃ and G=1 | Inertia components BS₃,BC₂,BC₃ versus one S; centralizer orders 6,2,3 | Stabilizers retained, not just conjugacy set | None |
| 11.4 headline | C₂ sign over F₃; shift; zero | Characteristic and distribution values (1,−1) on both sides; shift negates; zero gives (0,0) | Character normalization agrees | None |
| 11.5 | S=T, Y_i=U smooth curve, A_i=Λ | Untwisted Λ(2)[4] versus Λ(1)[2]; H⁻⁴ ranks 1 versus 0. Zero map exists. Twisted sides both Λ(2)[4] | Excludes iso, not natural map | R03 |
| 11.9 headline | Point base, ranks 2 and 3; one shifted factor | Product trace 6=2·3; shifted trace −3=(−1)·3; zero factor gives 0 | Künneth sign and base twist agree | None |
| 11.10 sample | C₂ swap on {a,b}; trivial action | Fixed pairs {(a,1),(b,1)}, none over σ; trivial action gives X×C₂ | Fixed-pair quotient agrees | None |
| 11.11–11.12 headline | Same swap | Universal local terms (1,1) over 1 and 0 over σ; pulled-back quotient characteristic class has the same values | General-base construction retained | None |
| 11.13 sample | w(bw+a−1)=0 with b≠0 | At a=1: double root 0. At a≠1: roots 0 and (1−a)/b, both simple | Isolated fibres do not imply étale family; package requires étale | None |

Further unchanged algebra checks include: supertrace of Λ⊕Λ[1] is 0, not 2; over Λ=Z/6 the projective identity on 3Λ has categorical trace 3 while the pinned finite-basis trace gives 0; over F₂[[t]]/(t²), the dual and bidual of Λ/(t) each have length 1, and Λ⊕Λ/(t) and its bidual length 3. These separate the actual trace and truncated-DVR targets from the simpler pinned notions. For VS11.7–VS11.8 the inverse base twist sends B=Λ[1], A₁=A₂=Λ to Λ[−1]; associating three point-base factors of ranks 2,3,4 gives 24 in both orders.

### Pinned libraries, names and headline acceptance test

The manifest pins read in this round are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Object searches and declaration-body reads were made at these pins. The resolver found no unresolved roadmap citation or backticked name, but reported that its external-library check was unavailable; the following direct reads therefore matter.

| Pinned file and line | Declaration/body inspected; consequence |
|---|---|
| `Mathlib/CategoryTheory/Monoidal/Category.lean:161`; `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:364` | MonoidalCategory and SymmetricCategory exist; these are 1-categorical structures. |
| `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:78`, 104, 107, 237 | ExactPairing, coevaluation, evaluation and HasRightDual. Coevaluation targets X⊗Y, evaluation starts at Y⊗X; the README follows this orientation. |
| `Mathlib/CategoryTheory/Bicategory/Basic.lean:61`; `Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean:89`; `Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean:57` | Bicategory, its Adjunction and Pseudofunctor exist. No symmetric monoidal bicategory carrying the promised trace formalism was found. |
| `Mathlib/Topology/LocallyConstant/Basic.lean:212`; `Mathlib/Topology/LocallyConstant/Algebra.lean:92`; `Mathlib/Topology/Sets/Compacts.lean:777` | LocallyConstant, charFn and CompactOpens. Local constancy itself imposes no Hausdorff/local-compactness assumption; those are explicit in layer 10. |
| `Mathlib/LinearAlgebra/Dual/Defs.lean:61`, 70, 203; `Mathlib/LinearAlgebra/Dual/Lemmas.lean:262`, 284 | Dual, eval, IsReflexive, instIsReflexiveOfFiniteOfProjective and instFiniteDimensionalOfIsReflexive. The native predicate is bijectivity of evaluation; it does not supply the arbitrary-module truncated-DVR criterion. |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56`; `Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean:30`; `Mathlib/RingTheory/Finiteness/Defs.lean:121` | IsDiscreteValuationRing, maximalIdeal and Module.Finite. The DVR carrier includes the domain/nonfield/local-PID conditions; Λ=R/𝔪ᵏ with k>0 is not restricted to Z_p. |
| `Mathlib/LinearAlgebra/Trace.lean:75`; `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:57`, 265 | LinearMap.trace uses a finite basis and otherwise zero; FGModuleCat's rigid instance here is over a field. Neither replaces the finite-projective/derived trace target. |
| `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | DerivedCategory is present, but no monoidal instance for this carrier was found. EnhancedDerivedSheaves supplies the missing derived tensor enhancement. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` | IsSmoothDiscrete uses discrete modules and open stabilizers. It is not a classifying v-stack or its sheaf category. |
| `Mathlib/RingTheory/Perfection.lean:623`; `Mathlib/RingTheory/Perfectoid/Untilt.lean:49`; `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166` | PreTilt, untilt and fontaineTheta are ring-level constructions. |
| `TauCeti/RingTheory/Perfectoid/Basic.lean:86`; `TauCeti/RingTheory/Perfectoid/Field.lean:68` | Perfectoid Tate ring and field predicates exist; they are not the geometric v-site. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean:40`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:249` | PreAdicSpace has a ring presheaf, local stalks and valuations; AdicSpace is the sheafy locally affinoid full subcategory. Neither declares perfectoid spaces or étale sheaves on their v-site. |

The headline list from the summary/end-theorem paragraph is VS7.5, VS8.9, VS9.1, VS9.2, VS11.4, VS11.9 and VS11.12. Additional deep results VS9.3, VS9.6 and VS9.8 are also accounted for. All ten appear in the module docstring with their missing carriers: decent v-stacks/fine maps/enhanced D_ét; symmetric monoidal bicategories and CoCorr; inertia/relative dualizing objects; diamonds and local terms; classifying/quotient stacks and based correspondences. These are substantial constructions, not a few omitted native predicates. The generic derived dualizability statement also needs the absent monoidal derived category, and the bicategorical prefix needs its absent monoidal bicategory carrier. Existing 1-categorical traces are imported from their owners rather than restated as headlines.

`Suggested.lean` has one `import Mathlib`, one module docstring and the correct empty namespace. It has zero declarations, zero admitted statements, zero examples, zero sorry'd data and zero `set_option`s. Thus the exhaustive one-tactic probe has zero inputs, as does the `#check @name` comparison of this package's elaborated declarations. No stand-in was substituted. There is no own Lean identifier in the README left undeclared. No fully qualified declaration can collide with another roadmap because this file declares none.

The prescribed `lake env lean` invocation on this package's `Suggested.lean`, run from the pinned content checkout, exited **0 with no output and no warnings**. No Tau Ceti module build was required. This is an elaboration result, not certification of the README's mathematics.

### Suppliers, duplication and order

The board package index was read before ownership conclusions. Main and the available open heads were searched by objects, including decent/prespatial geometry, cohomological correspondences, ULA duality, classifying-stack operations, distributions, restricted nerves and traces. Current supplier sections were then opened. Existing main roadmaps were resolved on main, rather than importing changes from their open revisions. The three main shape examples read were EnhancedDerivedSheaves, DGAInfinity and PivotalSpherical.

| Supplier resolved | Sections/targets checked and ownership boundary |
|---|---|
| `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md`, open #1230 | VS0.1–VS0.2, VS1.1–VS1.2, VS4.2 and VS5.2, including Relative adjoints and ULA calculus and Torsion ULA and perfect invariants. The base supplies smooth stacky pullback/partial supports, ULA and smooth representations; this Part II extends to arbitrary fine shriek maps. The perfect-invariants target is about Bun_G and is explicitly adapted here. |
| `TauCetiRoadmap/DiamondSixOperations/README.md`, open #927 | S0.1–S0.2, S0.4; S1.1–S1.5; S2.3–S2.4; S3.1–S3.4; S4.1–S4.5; S5.4–S5.5. The coherent representable six operations, amplitude, smooth base change and profinite-quotient inputs are present. S4.4's representability descent assumes the relevant diamond geometry; it does not prove the missing general point condition in current R01. |
| `TauCetiRoadmap/DiamondsAndVStacks/README.md`, open #820 | D4.1, D4.6, D4.7, D4.10; D5.1, D5.2, D5.5, D5.11, D5.12, D5.14; D6.4–D6.5. New citations for spatial v-sheaves, quasi-pro-étale permanence and the point criterion exist. A spatial v-sheaf is not silently identified with a diamond. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, main | E1.4 (line 580), E3.2 (1153), E3.4 (1229), E5:abstract.1 (1440), E2.6 (2293). Ringed-diagram coherence and derived categories are supplied; the four declared contracts extend E3.4 to abstract restricted-nerve operations, partial adjoints and descent. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md`, open #1040 | §§6.1–6.3; pullbackAlong and restrictOpen at lines 6427 and 6429. Its finite-coefficient bounded-constructible range and hypotheses on pullback are narrower than the declared general coefficient/complex contracts. This package does not own the scheme foundations again. |
| `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md`, open #965 | L1/char-p-scheme-diamond-and-comparison-functor, L1/comparison-pullback; L3/commutation-and-adjoints-27-1-27-3, full-faithfulness-27-2, internal-Hom-right-adjoint, rf-shriek-comparison-27-4 (heading at line 1543). The shriek mate has its stated direction; it does not give unrestricted pullback–upper-shriek commutation. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, main | §0.23a (1658), §0.24 (1714), perfection_universalHomeomorphism (1728). Étale topological invariance/perfection are imported, not reconstructed here. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, open #1688 | SR.0.3, SR.0d.2, SR.1.1, SR.2.1–SR.2.2. Smooth vectors, derived invariants/duals, Haar integration, induction and admissibility belong there. VS10.5 adds the Haar module/geometric twist; VS11.1 makes the geometric equivalence; VS11.3 supplies the torsion-valued character. χ_G=δ_SR⁻¹ was checked numerically. |
| `TauCetiRoadmap/PivotalSpherical/README.md`, main | Layers 2 (318) and 7 (477) own ordinary rigid traces. This roadmap's retained general extension is bicategorical. |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md`, main | R3.8 (11858), projective-module-trace and projective-trace-realization own finite-projective traces. The README imports these, avoiding misuse of the finite-basis native trace. |
| `TauCetiRoadmap/DGAInfinity/README.md`, main | Layer 5 (431), compact/perfect equivalence at 456–463. VS8.4 uses it to prove a dualizability criterion, not to re-plan compact=perfect. |

The fresh dependency check printed exactly:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All 65 Needs lines and six layer Dependencies paragraphs were read. No target is sent to a later supplying layer. The internal references resolve after the renumbering; VS9.3's local-term notation uses the explicitly named VS9.4 definition in the same layer. The blanket list of suppliers does not hide a new later-roadmap dependency.

The six declared gap slugs agree between the README and `packages/VStackSheavesAndLisseCategoriesPartII/design/plan.json`:

- `vs-pii-enhanced-operation-map`
- `vs-pii-partial-adjoints`
- `vs-pii-restricted-nerves`
- `vs-pii-descent`
- `vs-pii-scheme-correspondences`
- `vs-pii-scheme-local-terms`

Each has a named earlier supplier and a specific extension. The four enhanced-category contracts refer to the precise input conditions of LiuZhengEnhanced Proposition 2.2.4, Theorem 4.1.8 and LiuZhengGluing Theorem 5.4, rather than assuming unrestricted adjoints/gluing. The two scheme contracts preserve arbitrary prime-to-p torsion rings (for example F₃[t]) and the stated complex ranges, genuinely beyond the supplier's finite coefficient setting. No gap has supplier `none`, and none requests a pinned result already supplied at that generality. Their absence as implemented declarations is not a finding. They would remain conditions on a later acceptance; they do not cover the proper-comparison gap in R01.

The overlap report has no conflicting head, dropped cited ID or dependency on numbering defined only in an open revision. Its five nearest roadmaps were compared with their actual scopes: #927 DiamondSixOperations, #1230 VStackSheavesAndLisseCategories and #965 AdicCoefficientsAndComparisons are the suppliers just resolved; #1252 HeckeStacksAndLocalShtukas builds specific Hecke/shtuka geometry rather than this general trace formalism. #1687 AnalyticStacks, `TauCetiRoadmap/AnalyticStacks/README.md:157` (§0.3), also discusses restricted-nerve machinery. This package does not claim ownership of that machinery: it assigns it to the earlier EnhancedDerivedSheaves contracts. The later AnalyticStacks construction is not an allowable replacement supplier here and does not require this package to duplicate it. No mutually handed-off object or duplicate declaration owned by this package was found. The old→new numbering table preserves references to the moved layers.

### Shape and policy

There are six mathematically named layers, 65 numbered subsections and 65 Needs lines. Every layer has Examples and Dependencies. The 26 explicit API blocks each have at least three Checks; the additional construction in VS10.2 is the exception R04. The roadmap states hypotheses and locators in prose, and its special examples remain Checks rather than Lean padding. The new general comparison constructor has source and target and an explicit diagonal/adjunction construction; it is not an arbitrary opaque map. Its restricted invertibility result remains the distinct scope problem R01.

The reordering puts general trace theorems before locally profinite applications and no longer reproduces the source's free expository order. The base-roadmap stopping point is stated. No copied source passages, computational algorithms, prohibited supplier citation, sorry'd data, `set_option`, process identifiers, machine paths, HTML anchors or own undeclared backticked API names were found in the authored files. References identify the versions actually read. All mathematical restrictions were checked against the stated coefficient convention, including zero coefficients, p=2 and p=3 controls, nonabelian torsor actions, infinite versus finite support, nonprojective modules and nonétale fixed-locus degenerations. R02 and R03 are Check defects, not changes to the central enhanced-operation or Künneth statements.

## Not verifiable

- No required source text was inaccessible. No missing-reference request was needed, and no waived or uncertified citation was reopened.
- The source trail does not establish invertibility of c_f for every proper fine map. The geometric-point criterion is a sufficient reduction, not a proof of its hypothesis. This is recorded as the unresolved library obligation in R01, not as a claim that a counterexample to the full theorem has been found.
- The headline geometry cannot be elaborated at the current pins because its carriers are absent, as itemized in the module docstring and the pinned audit above. The successful empty-file elaboration cannot verify those future constructions.

## Source issues

- **Misprint** in GHW22 at §1.2(3), printed p. 5, GHW22 line 219: the source says the gluing reference supplies partial adjoints as Proposition 1.4.4; it should be LiuZhengEnhanced v4 Proposition 2.2.4, pp. 79–80; affects the proof.
- **Gap** in HKW22 at Theorem 4.1.8, printed p. 24, HKW22 line 1165: the source says GHW22 Theorem 1.4 supplies the proper comparison isomorphism; it should be separately justified beyond the properties listed there; affects a stated result.
- **Misprint** in HKW22 at Definition 4.1.7 and related references, printed pp. 23–28, HKW22 line 1133: the source says GHW22 has the cited definitions and propositions under different numbering; it should be located against v1 Definitions 1.1/1.3/4.1 and Propositions 4.5/4.8/4.14, retaining their hypotheses; affects a stated result.
- **Error** in HKW22 at Example 4.1.1, printed p. 22, HKW22 line 1055: the source says all maps BG→BH arise from group homomorphisms; it should be H-torsors with commuting G-action, with homomorphisms describing trivialized torsors; affects a stated result.
- **Misprint** in HKW22 at Definition 4.3.4, printed p. 30, HKW22 line 1482: the source says the tensor-product target mixes an unprimed sheaf into the target pair; it should be the external product of the two primed target sheaves; affects a stated result.
- **Misprint** in HKW22 at the paragraph after Proposition 4.3.5, printed p. 31, HKW22 line 1514: the source says the ULA criterion is FS21 Theorem IV.2.24; it should be FS21 Theorem IV.2.23; affects nothing.
- **Error** in HKW22 at Example 4.3.10, printed p. 33, HKW22 line 1618: the source says properness of X suffices for the displayed arbitrary-correspondence trace formula; it should be assumed also for the correspondence support, as required by Theorem 4.3.8; affects a stated result.
- **Error** in HKW22 at the proof of Proposition 4.4.1, printed p. 34, HKW22 line 1671: the source says the diagonal subgroup presents every G as a direct factor of G²; it should be treated by the closed-subgroup induction formalism, since a nonabelian diagonal is not normal; affects the proof.
- **Gap** in HKW22 at equations (4.5.8)–(4.5.9), printed p. 40, HKW22 line 1955: the source says the needed composition and monoidal coherence details are omitted; it should be supplied by compatible Künneth and exchange transformations, as targeted in VS11.8; affects the proof.
- **Misprint** in HKW22 at the proof of Theorem 4.5.3, printed p. 41, HKW22 line 1990: the source says the fibre product uses In_S(T₁); it should be In_S(T), the common base; affects nothing.
- **Error** in HKW22 at the closing remark of §4.6, printed p. 44, HKW22 line 2135: the source says isolated fixed points imply the relative fixed locus is étale; it should be assumed étale, since isolated fibres can merge in a ramified family; affects a stated result.
- **Misprint** in HKW22 at §5.3, printed p. 48, HKW22 line 2320: the source says the trace-class discussion precedes Definition 4.3.5; it should be Definition 4.3.6; affects nothing.
- **Misprint** in HKW22 at the proof of Lemma B.1.1, printed pp. 72–73, HKW22 line 3534: the source says the socle and induction quotient have exponent m−1; it should be k−1, with induction over R/𝔪^(k−1); affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "704fbf91bde33a2d5fa0de3b839dc6375a11a262", "job": "REV-PKG-VStackSheavesAndLisseCategoriesPartII~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
