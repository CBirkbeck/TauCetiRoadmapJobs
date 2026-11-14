<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6881455860 -->
Review (codex) of 9b32320

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The supplier already owns the exterior-square theorem for arbitrary abelian groups

   **Location.** `packages/CohomologyOfGroups/README.md:1753`, also lines 133–138, 704–706, 1731–1737, 1750–1757, 1778–1779 and 1795; `packages/CohomologyOfGroups/Suggested.lean:136`. The claimed extension is: “This extends RS.6.8's isomorphism from finite to all abelian groups.”

   **Claim.** InductionRestrictionPartII RS.6.8 supplies only the finite-abelian case, leaving this package to construct and state the general integral identification.

   **Witness.** PR #1154, `TauCetiRoadmap/InductionRestrictionPartII/Suggested.lean:186`, states `abelian_multiplier_exteriorSquare (A : Type) [CommGroup A]`, without finiteness, including the oriented commuting-pair formula. Its `README.md:1650–1658` explicitly treats arbitrary abelian groups by directed unions.

   The supplier's `Multiplier` is exactly `groupHomology.H2 (Rep.trivial ℤ A ℤ)` (`Suggested.lean:43`), not a different multiplier carrier. Its isomorphism, reversed, supplies the package's entire theorem at line 136. InductionRestrictionPartII precedes this package in `merge-order/ORDER.txt:66` and `:318`. This is an object-ownership conflict, not a missing identifier or an objection to the theorem's truth.

   **Exact repair.** Import RS.6.8's natural oriented exterior-square isomorphism for **every** abelian `A : Type` in Scope and ownership and Exact supplier contracts. Delete `nonempty_groupHomology_two_addEquiv_exteriorPower` from `Suggested.lean` and its claim as an owned headline in the module docstring. In §5.4 retain the general Pontryagin algebra and its torsion-free/rational comparisons; identify the degree-two part of its `ψ` with the imported map by the displayed formula on exterior generators. Remove the independent finite-to-finitely-generated-to-colimit proof of the already supplied integral degree-two theorem, all finite-only descriptions of RS.6.8, and the claim that ℤ² and ℚ lie outside its hypotheses. Keep the examples as Checks, with the supplier attribution. No supplier edit or change to the frozen design is needed.

   **Repair tested against the witness.** For `A = ℤ²`, both maps send `e₁ ∧ e₂` to `[e₁|e₂] − [e₂|e₁]`, generating ℤ. For `A = C₃²` the same cycle generates C₃, and reversing it gives 2 rather than 1. For `A = ℚ`, both degree-two groups are 0. Thus importing the actual general theorem preserves the infinite cases and fixes the orientation; it does not narrow §5.4.

One finding: P2 ownership duplication at a supplier's current head. The two preceding locator findings are repaired. The acceptance file elaborates; the mathematical tests below found no false headline. No package input was edited.

## Verified sound

### Previous findings and the changed passages

The prior report and repair report were read before the new pass. Neither previous finding was marked not actionable; there are no maintainer notes to adjudicate.

| Previous finding | Repaired passage and verification | Status |
|---|---|---|
| Round 5 F01, universal-coefficient locator | `README.md:1655–1660`: “the generality here, `k` of global dimension at most one and both sequences, is that of the route”. Loh19 line 5762–5771 is Cor. 3.2.20, printed p. 133: the natural homological sequence for free complexes over a PID, with a nonnatural splitting. Line 5841–5843 is the integral direct-sum corollary; line 5985–5990 only mentions the cohomological theorem. The manifest now records Cor. 3.2.20. | Repaired |
| Round 5 F02, missing comparison locator | `README.md:1509–1512`: “with its degree `(0, 0)` normalization read through the quotient `H⁰ → Ĥ⁰`”. MilneCFT line 3459–3484, II Prop. 1.38, p. 73, supplies uniqueness and both connecting-map signs. Lines 1522–1524 distinguish the native-library comparisons from that source argument; the manifest includes target 4.7. | Repaired |

The repaired patterns were searched throughout the package. §§5.1 and 5.3 already separate the source's coefficient hypotheses from the broader route; §6.9 explicitly identifies its native comparison rather than attributing it to HS53. All 41 numbered targets carry source locators. The new checks of §§4.7 and 5.2 include the degree-zero quotient, characteristic 2, a field, the trivial group, and a hereditary non-PID ring, as computed below. R01 is a newly verified current-head ownership conflict, not a re-raised settled finding.

### Principles, shape, and elaboration

Read all 41 numbered targets, their APIs and Checks, all eight layer dependency blocks, the conventions, supplier contracts, summary, and the 21 Lean declarations. The mathematical scope remains arbitrary discrete groups and arbitrary commutative coefficient rings except where the individual theorem needs stronger hypotheses. No good-prime restriction, algorithm, copied source passage, sorry-valued data, `set_option`, placeholder predicate, or process residue was found. The ownership exception is R01.

The README has the required opening, ownership/convention/contracts sections, eight mathematically named layers, Examples and Dependencies endings, consumers and references. Definitions have prose APIs and at least three discriminating Checks, including nonexamples for the sign-sensitive constructions. Own backticked declarations resolve to the seven definitions and fourteen theorems of the Lean file; mathematical symbols are not mistaken for promised Lean declarations. Upstream shape was compared with DerivedModuleAlgebra, FreeGroupsAndLimitGroups, and InductionRestriction on main. No second CohomologyOfGroups folder exists on main; the board-package index was read before checking this.

`lake env lean` on the supplied `Suggested.lean`, run from the pinned content checkout, exited 0. Its only diagnostics were the 14 expected `declaration uses sorry` warnings. All seven individual Tau Ceti imports were available. A separate copy with `#check @name` for every declaration also elaborated. All 21 resulting types were compared with the README: normality in Hopf's formula, finite index in both double-coset formulas, finiteness/primality and positive degree in the ordinary stable-element theorems, all integer degrees in the Tate version, and `Module.Free ℤ M` in integral duality are retained. No binder was lost, and no signature was changed.

The one-tactic probe covered **all 14** sorried theorems. None closed with `rfl`, `infer_instance`, or `simp`. An additional `exact?` search closed none: eleven failed without a matching lemma and three reached the default heartbeat limit (the two double-coset formulas and the homological stable-element theorem). Their relevant pinned candidates were read directly: representation-level Mackey decomposition, continuous Mackey, transfer/index identities and Sylow detection do not themselves state these discrete arbitrary-coefficient conclusions. R01 is duplication of an earlier roadmap's target, not padding proved by a pinned lemma. No separate padding finding is warranted.

### Headline coverage

| README headline or deep end result | Acceptance signature or named obstruction |
|---|---|
| Free-group dimension and free-product homology, §3.6 | `freeGroup_isZero_of_two_le`, line 113; `coprod_groupHomology_bijective`, line 121. Twisted coefficients and arbitrary universe are retained. |
| Integral exterior square, §5.4 | Line 136 states it, but its ownership requires deletion under R01. |
| Hopf formula, §6.8 | `nonempty_groupHomology_two_addEquiv_hopf`, line 145. The README separately fixes the constructed map's sign. |
| Double-coset formulas, §7.1 | Lines 174 and 202, with finite index only on H and a genuine representative condition. |
| Stable elements, §7.2 | Lines 226, 266, 325: ordinary cohomology, homology, and all-degree Tate cohomology. |
| Tate duality and its integral free-module form, §8.1 | Lines 339 and 359, using the actual cup product and evaluation, with perfection in the second variable. |
| Cyclic cup periodicity, §8.4 | Line 375, arbitrary coefficients and integer degree, with the generator character normalized to 1/order. |
| Global and primary periodicity, §8.5 | Lines 389 and 409, including primes not dividing the order and the trivial group. |
| Hochschild–Serre with edges and products, §§6.2–6.5 | Module docstring names the missing positive-degree quotient representations and extension filtration. |
| Transgression and low-degree sequences, §§6.6–6.7 | Module docstring names the normalized-cochain transgression and homological d². |
| Tree/amalgam/HNN exact sequences, §§3.5–3.6 | Module docstring names the G-tree action carrier and connecting maps. |
| Künneth, universal coefficients and cross-product comparisons, §§5.1–5.3 | Module docstring names the cross/cup/evaluation maps needed to state the canonical exact sequences. |
| Periodicity from a cohomologically trivial resolution, §8.3 | Module docstring names the iterated connecting class. No arbitrary class stands in for it. |

No additional statable owned headline was found missing or replaced by a weaker stand-in.

### Seeded source checks

The five readable cached texts were opened at the locators, not inferred from their titles. Printed page numbers were distinguished from extraction/PDF pages. Brown82 and CE56 remain settled uncertified citations; SwanPPeriod60 remains waived. These limitations are not represented as successful verification.

| Seeded target | Locator checked and scope of the evidence |
|---|---|
| 1.4 Permutation modules and Shapiro | SerreArbres II §2.8, pp. 168–169, line 5148–5180: permutation modules tensored with arbitrary coefficients and stabilizer homology. The full induction/coinduction formulas are also checked against the pinned projection and Shapiro declarations below. |
| 2.2 Long exact sequences | CE56 XVII is uncertified; source text unavailable. Independently checked the exactness of coefficientwise products/direct sums and finite total-degree sums, and the native connecting-map construction. |
| 3.2 Orbit spectral sequence | HS53 I §4, p. 114, line 201–218, and I §7 closing remark, p. 118, line 355–362: bicomplex and homological counterpart. The monomial first page additionally uses the declared Shapiro and additivity inputs. Brown82 VII was not read. |
| 3.4 Chain complex of a tree | SerreArbres II §2.8, p. 168, line 5130–5150: no inversions, invariant orientation, terminal-minus-initial boundary, and exact augmentation. The extension from integral chains to k is split on underlying modules. |
| 4.2 Connecting maps and uniqueness | MilneCFT II Prop. 1.38(c),(d), p. 73, line 3459–3484: left rule with no sign, right rule with degree-p sign, and dimension-shifting uniqueness. The README retains tensor exactness. |
| 4.3 Identities | MilneCFT II Prop. 1.39, pp. 73–74, line 3485–3507: associativity, graded commutativity and restriction/inflation compatibility. Cochain commutativity is correctly not claimed. |
| 4.4 Diagonal approximations | HS53 II §1, pp. 118–119, line 368–395 supports the cochain convention; Loh19 Prop. 1.6.11, p. 48, line 2205–2214 supports the periodic-resolution Check. The native Alexander–Whitney formula was opened. Brown82 V, cited for the general resolution comparison, remains uncertified. |
| 4.7 Other cup products | MilneCFT II Prop. 1.38, p. 73, line 3459–3484 supports the repaired uniqueness argument only. The comparisons themselves are new statements about the named native definitions. Positive-degree isomorphisms and the degree-zero quotient are distinguished. |
| 5.4 Pontryagin ring | Brown82 V remains uncertified. The mathematical claims were tested, and the actual general exterior-square supplier was opened; this exposed R01. |
| 6.1 Normalization and filtration | HS53 II §1, pp. 118–121, line 368–495: normalized cochains, both filtrations, inclusion, and E₁ comparison. The README's degreewise bounds and absence of a uniform lower bound agree with the definitions. |
| 6.7 Low-degree sequences | HS53 III §4, Thm. 2 and following remark, pp. 129–130, line 819–858, retains the intermediate vanishing hypotheses. Loh19 Thm. 3.2.18, p. 129, line 5568–5598 gives the free-presentation homological instance. The generic homological edge sequence is the declared supplier gap, not attributed to this special instance. |
| 7.2 Stable elements | MilneCFT II Prop. 1.30 and Cor. 1.33, pp. 70–71, line 3357–3389 give the index identity and Sylow injectivity. Hutchinson13 §3, p. 11, line 475–490 gives positive-degree localized homological stable elements. Neither is silently treated as the full arbitrary-coefficient Tate result; Brown82 III §10 remains uncertified. |
| 8.1 Tate duality | Brown82 VI §7 and CE56 XII are uncertified. The perfect-pairing formulation, degree shifts, evaluation direction, and free-module hypothesis were checked mathematically and against the native cup/evaluation APIs. |
| 8.3 Cohomologically trivial resolutions | Loh19 Thm. 4.3.7 and proof, pp. 165–167, line 7010–7080: finite free sphere-action resolution and periodicity. The README's broader algebraic statement uses Nakayama–Rim and dimension shifting; it is not asserted to be the source's literal theorem. Brown82 VI §9 remains uncertified. |
| 8.5 Periodicity | Loh19 §4.3.2, pp. 167–168, line 7080–7130 supports the subgroup obstruction and cyclic/quaternion criterion discussed there. The complete Tate equivalences and primary form also rely on the stated duality/stable-element route; Brown82 VI §9 and CE56 XII were not read. |

Further passages compared directly include §§1.1, 1.2, 1.5, 4.1, 5.2, 6.5, 6.6, 6.8 and 8.4. HS53 line 650–706 fixes the E₂ product sign; line 980–1010 fixes the negative extension-class transgression. MilneCFT line 3793–3822 explicitly states cyclic cup periodicity but omits its proof. The eight cited works all have existing manifest entries; no new source or duplicate key was needed.

### Computed adversarial table

The unchanged computed rows of round 5 were re-evaluated where relevant; uncomputed summaries were not used as evidence. Values below are calculations, not consequences of Lean accepting a `sorry`. C_m denotes the cyclic group of order m. “Keep” means no mathematical repair; the ownership repair in R01 still applies to the indicated row.

| Statement | Instances tried | Values computed on the two sides / negative control | Result; change |
|---|---|---|---|
| 1.1 conjugation and inner triviality | S₃, H=⟨(12)⟩, g=(13); degree 0 with twisted M | Conjugated generator is (23); transported character has value 1 on it. On invariants the coefficient map is m↦g·m, not identity. For g=1 both maps are identity. | Keep |
| 1.1 change of group in degree 2 | C₄→C₂, coefficients F₂ | Inflated carry cocycle is df for f=(0,0,1,1), hence 0 in H²(C₄,F₂); degree-one inflation is identity. A degree-independent identity model fails. | Keep |
| 1.2 quotient action | S₃/A₃; C₄ with sign coefficients | Transposition acts by −1 on H¹(A₃,F₃) and H²(A₃,ℤ), by +1 on H⁴. For C₄/N=C₂ and N=C₂, action on Mᴺ=ℤ is −1. | Keep |
| 1.3 additivity | C₂ with a direct sum of trivial ℤ modules; infinite-rank free abelian group in cohomology | H₁(C₂,⊕ℤ)=⊕C₂. In H¹(ℤ^(ℕ),ℤ^(ℕ)), the identity has infinitely many nonzero coordinate homomorphisms and is absent from ⊕H¹(ℤ^(ℕ),ℤ). | Keep; no false unrestricted cohomological direct-sum claim |
| 1.4 Shapiro and projection | H=1 in C₃; H=A₃ in S₃ | H₀(C₃,ℤ[C₃])=ℤ=H₀(1,ℤ), positive groups 0. H₁(S₃,ℤ[S₃/A₃])=C₃=H₁(A₃,ℤ). Projection sends g⊗m to the coset tensor g⁻¹m. | Keep |
| 1.5 discrete comparison | ℤ discrete versus its profinite-induced topology; trivial ℤ coefficients | H¹_cont=ℤ=H¹ for the discrete topology. In the latter topology every continuous homomorphism to discrete ℤ is 0, while abstract H¹=ℤ. Homogeneous difference f(g₁)−f(g₀) sends the identity to +1. | Keep |
| 2.1 hyperhomology | S₃, C=(ℤ[S₃/A₃]→ℤ), degrees 1→0 | C is quasi-isomorphic to ℤ_sgn[1]; H₀=0, H₁=C₂, H₂=C₃. Its naive coinvariant complex is ℤ→id ℤ, with all homology 0. | Keep |
| 2.2 connecting maps | G=1; C=(ℤ→id ℤ), subcomplex C′=ℤ in degree 0, quotient C″=ℤ in degree 1 | H₁(C″)=ℤ→δ H₀(C′)=ℤ sends 1↦1; middle complex has H=0. Replacing δ by 0 destroys exactness. | Keep |
| 2.3 two spectral sequences | Same S₃ complex; G=1 | First-page augmentation is id on H₀=ℤ and C₃→C₂=0 on H₁; H₀(total)=0, H₁(total)=C₂. Second sequence gives H₀(S₃,ℤ_sgn)=C₂ in total degree 1. For G=1 only the q=0 row survives. | Keep |
| 3.1 flatness versus projectivity | Trivial G, k=ℤ/4, M=ℤ/2; flat ℤ[1/2] example | Tensoring the exact three-term sequence gives H₂=C₂ instead of 0. In the flat nonprojective dual example, b=(1,0,1,0,…) would force integer a₀=−1/3 in ℤ₂; no such integer exists, so H²≠0. | Keep |
| 3.2 orbit spectral sequence | C₂ acting on a two-edge circle by reflection versus rotation | Reflection: vertex row in odd q is C₂², edge row for q>0 is 0, so these classes survive. Free rotation: all q>0 terms are 0; quotient H₀=H₁=ℤ. | Keep |
| 3.3 free complex and coefficient action | Double covering of the circle, M=ℤ_sgn versus ℤ | Sign-twisted coinvariant differential is −2:ℤ→ℤ, yielding H₀=C₂,H₁=0; trivial coefficients give differential 0 and H₀=H₁=ℤ. | Keep |
| 3.4 tree chain complex | One oriented segment; one vertex; loop; empty graph | Segment ∂(1)=(−1,1), augmentation (a,b)↦a+b, kernel generated by (−1,1). One vertex has augmentation id. Loop has ∂=0 and nonzero H₁, so is not a tree. Native Connected excludes the empty vertex set. | Keep |
| 3.5 tree sequences | Segment with trivial stabilizers; loop quotient of a free ℤ action | Segment map is m↦(−m,m), cokernel M. For the free line action the edge-to-vertex map is t−1; trivial coefficients give H₁(ℤ,ℤ)=ℤ. Opposite difference changes the chosen orientation. | Keep |
| 3.6 free groups and free products | Rank 0, rank 1; C₂∗C₃ with trivial ℤ | Hₙ and Hⁿ vanish for n≥2 in ranks 0 and 1. H₂(C₂∗C₃,ℤ)=0⊕0=0; H₃=C₂⊕C₃. Degree zero would give ℤ²→ℤ, not an isomorphism, and is excluded. | Keep |
| 4.1 cup convention | ℤ² coordinate characters; C₂ over F₂; omitted-action model | On (e₁,e₂),(e₂,e₁), x∪y takes 1,0; evaluation on the torus cycle is +1. For C₂, x²(g,g)=1. Omitting the action with coefficients ℤ[ℤ] gives d at (1,1,1) equal to 2(t−1), not 0. | Keep |
| 4.2 uniqueness and connecting signs | p=q=1; tensor of 0→ℤ→2ℤ→C₂→0 with C₂ | Native/Milne/README right connecting sign is (−1)¹=−1. Twisting the family by (−1)^(pq) reverses the torus value +1 to −1 and changes the left rule. Tensor first arrow is 0, not injective. | Keep |
| 4.3 identities | Trivial G; C₂,F₂; ℤ²,ℤ | Degree-zero unit is multiplication by 1. In characteristic 2, x²=1 on (g,g), despite odd degree. On ℤ², x∪y and −y∪x have cochain values 1 and 0 on (e₁,e₂), but both evaluate +1 on the oriented cycle. | Keep |
| 4.4 diagonal | Homogeneous edge (g₀,g₁); trivial resolution | AW(edge)=(g₀)⊗edge+edge⊗(g₁); its boundary is (g₁)⊗(g₁)−(g₀)⊗(g₀), equal to Δ∂. Naive edge⊗edge has degree 2, not 1. Degree-zero augmentations both give 1. | Keep |
| 4.5 projection formula | H=1 in C₃, degree 0, trivial ℤ | cor(x·res y)=3xy=cor(x)·y. For H=G both sides xy. For x=res z, both sides [G:H]zy. | Keep |
| 4.6 cap/evaluation | z=[e₁\|e₂]−[e₂\|e₁] on ℤ² | Back-face y∩z=e₁, so ⟨x,y∩z⟩=1=⟨x∪y,z⟩. Front-face evaluation gives −e₁ and −1. | Keep |
| 4.7(a) repaired comparison | C₂,F₂, bidegree (1,1); degree-zero norm 2∈ℤ | Ordinary and Tate x² both generate F₂. Norm class 2 maps to 0 in Ĥ⁰(C₂,ℤ), and 2∪y=2y=0. H⁰=ℤ versus Ĥ⁰=C₂ confirms quotient, not isomorphism. | Keep |
| 4.7(b),(c) comparison scope | Finite C₃; profinite product of copies of C_p | Finite discrete cups use the same functions, giving 1 on a pair of generator characters. Continuous H¹ of the product is the finite-support coordinate dual; abstract H¹ contains noncontinuous linear functionals. The forbidden abstract/profinite identification would be false. | Keep |
| 5.1 Künneth | C₂×C₂, integral coefficients, degrees 2 and 3 | H₂=C₂ from H₁⊗H₁. H₃=C₂³: two factor classes plus Tor₁(C₂,C₂). Dropping flatness with G=H=1 and M=N=C₂ predicts a nonzero Tor in degree 1 whereas actual group H₁ is 0. | Keep |
| 5.2 repaired homological and cohomological UCT | G=C₂, k=ℤ,A=F₂,n=2 | Homology: 0⊗F₂ plus Tor₁(C₂,F₂)=F₂ equals H₂=F₂. Cohomology: Ext¹(C₂,F₂)=F₂ and Hom(0,F₂)=0 give H²=F₂. | Keep |
| 5.2 beyond the source's PID hypothesis | k=ℤ[√−5], A=k/(2,1+√−5)=F₂, G=C₂ | k is Dedekind and non-PID; H₁(G,k)=k/2k, H₂(G,k)=0. Tor₁(k/2k,A)=ker(2:A→A)=F₂=H₂(G,A). Projective-cycle/split-inclusion route applies. | Keep |
| 5.2 boundary and field cases | G=1,n=1; k=F₂,G=C₂ | For G=1 both Ext¹(k,A) and Tor₁(k,A) are 0 and positive groups are 0. Over F₂ the Ext/Tor terms vanish and H¹(C₂,F₂)=Hom(F₂,F₂)=F₂. | Keep |
| 5.3 cross product and finiteness | ℤ×ℤ over ℚ; infinite rank | ⟨x×y,[e₁\|e₂]−[e₂\|e₁]⟩=1=1·1; an extra Koszul sign gives −1. Infinite-rank diagonal bilinear form has infinite matrix rank, while a finite sum of tensor products has finite rank. | Keep |
| 5.4 exterior square and orientation | A=1,ℤ,C_m,C₂²,ℤ²,ℚ | H₂ and Λ² respectively give 0,0,0,C₂,ℤ,0. For C₃² the oriented generator is +1; reversed order is 2. The supplier already gives every one of these cases. | R01: import the general degree-two theorem |
| 5.4 Pontryagin laws and scope | C₂ integral; torsion-free ℤ²; ℚ with F_p | Degree-one shuffle square [a\|a]−[a\|a]=0, including characteristic 2. H₃(C₂,ℤ)=C₂ while Λ³C₂=0. For ℤ² exterior ranks are 1,2,1,0. ℚ⊗F_p=0 and positive H(ℚ,F_p)=0. | Keep higher-degree scope |
| 6.1 normalized filtrations | C₄, N=C₂, M=F₂, degree 1; N=G | dim A₁=2 (independent values at 1 and 3), dim A*₁=1 (equal values on their coset); A₂ in degree 1 is 0. For N=G, A₁=0 in every degree. For proper N, a supported degree-j cochain gives nonzero A_j. | Keep |
| 6.2 cohomological extension sequence | S₃/A₃,F₃; C₄/C₂,F₂ | S₃ has dimensions 1 in degrees 0,3 mod 4 and 0 otherwise from the quotient action. For C₄/C₂, d₂(y)=x²; E₃=F₂[x,y²]/(x²), giving one class in each degree, as H*(C₄,F₂). | Keep |
| 6.3 homological extension sequence | C₂ inside C₄, ℤ | H₁(C₄,ℤ)=C₄ is filtered with two C₂ quotients, not their split sum. Trivial kernel leaves only q=0; trivial quotient leaves only p=0. | Keep |
| 6.4 edge directions | C₂<C₄, degree 1 | Homological inclusion sends 1 mod 2 to 2 mod 4, quotient sends 1 mod 4 to 1 mod 2. With F₂, cohomological inflation is identity and restriction is 0. | Keep |
| 6.5 spectral-sequence multiplication | ℤ² with normal second factor | Fiber y followed by base x gives +xy on E₂; base x followed by fiber y gives −xy, the factor (−1)^(p q′). On cochains the corresponding evaluations on the oriented torus cycle are −1 and +1 respectively. | Keep |
| 6.6 transgression | C₃<C₉,F₃; C₉<C₂₇,F₃; C₄<Q₈,F₂ | At quotient pair (2,1), df=−1=2 and −carry=2. In C₂₇ the kernel is C₉, not an F₃ module, but its scalarization is F₃. In Q₈ the factor set is 2 in C₄ and becomes 0 over F₂, so d₂=0. | Keep |
| 6.7 low-degree exactness | C₂<C₄,ℤ; no vanishing over F₂ | Homological tail is 0→C₂→C₄→C₂→0 with maps 1↦2 and reduction. H¹(C₂,ℤ)=0 allows the claimed cohomological range; with F₂, H¹(C₂,F₂)=F₂ and degree-two inflation is 0, demonstrating why the omitted-vanishing version fails. | Keep |
| 6.8 Hopf map | Torus presentation; cyclic presentation; free group | Lifted torus boundary is [ba]−[ab], hence ba(ab)⁻¹=[a,b]⁻¹. Cyclic presentation has R∩[F,F]=1, so H₂=0 although R≠1. R=1 gives 0 on both sides. | Keep |
| 6.9 finite/profinite comparison | C₃<C₉,F₃ | The same normalized lift yields value −carry=2 at (2,1) in both transgressions. Split extension has carry 0 and both transgressions 0. | Keep |
| 7.1 both double-coset formulas | H=K=C₂ in S₃; H=G | Two cosets contribute indices 1 and 2 in degree 0: 1+2=3=[S₃:C₂]. In positive degree the trivial-intersection term is 0. For H=G there is one term and both formulas reduce to the given inclusion map. | Keep |
| 7.2 ordinary stable classes | S₃,p=3; excluded degree zero | H²(A₃,ℤ)=C₃ has action −1, fixed subgroup 0=H²(S₃,ℤ)(3); H⁴ has action +1 and fixed C₃. In degree 0 stable ℤ differs from H⁰(S₃,ℤ)(3)=0, correctly excluded. | Keep |
| 7.2 twisted coefficients | C₂×S₃,p=2,M=F₂³ permutation representation | H¹(P,M) has dimension 3 and all classes are normalizer-invariant. Conjugation (23) sends the z-value e₃ to e₂; this class is not stable. Actual stable dimension is dim H¹(P,F₂)=2 by Shapiro. | Keep |
| 7.2 homology | S₃,p=3,n=1; (C₃²)⋊C₂,n=2 | In S₃ the equation z=−z in C₃ has only 0, matching H₁(S₃,ℤ)(3)=0. In degree 2 inversion acts by (+1) on Λ²(C₃²)=C₃, so both stable classes and the primary homology are C₃. | Keep |
| 7.2 Tate degrees | S₃,p=2 and 3,n=0; sign module | Reduction C₆→C₂ maps {0,3} bijectively; reduction C₆→C₃ maps {0,2,4} bijectively. With sign coefficients the stable subgroup of Ĥ⁰(A₃,ℤ_sgn)=C₃ is 0=Ĥ⁰(S₃,ℤ_sgn). | Keep |
| 8.1 Q/ℤ duality | G=C₂,M=ℤ,i=0,1 | At i=0 both Ĥ⁰(C₂,Q/ℤ) and Hom(Ĥ⁻¹(C₂,ℤ),Q/ℤ) are 0. At i=1 both are C₂. Replacing Tate degree −1 by ordinary degree 0 incorrectly gives Q/ℤ. | Keep |
| 8.1 integral duality | C₃,M=ℤ,i=0,1,2; nonfree M=C₂ for G=C₂ | Pairing at i=0 is ab mod 3: exactly three homomorphisms, pairing with 0,1,2. At i=1 both groups are 0; at i=2 both C₃. For nonfree C₂, Hom(C₂,ℤ)=0 but Hom(Ĥ⁰(C₂,C₂),Q/ℤ)=C₂. | Keep |
| 8.1 infinite free rank | G=C₂,M=⊕ℕℤ with trivial action,i=0 | Ĥ⁰(M)=⊕ℕC₂; Ĥ⁰(Hom(M,ℤ))=∏ℕC₂. The finite-support dot product realizes every map ⊕ℕC₂→C₂, so finite generation is unnecessary. | Keep |
| 8.2 group classification | Q₈,D₈,C₃²; composite p=21 | Q₈'s abelian subgroups are cyclic; D₈ contains C₂² and C₃² excludes itself. C₇⋊C₃ has 6 elements of order 7 and 14 of order 3, so all g²¹=1, but (1,0)(0,1)=(1,1) versus (2,1) in reverse order. Primality is essential. | Keep |
| 8.3 twisted periodic resolution | C₂, n=0, sign kernel; cyclic two-step sequence | 0→ℤ_sgn→ℤC₂→ℤ→0 gives Ĥ⁰(C₂,ℤ)=C₂≅Ĥ¹(C₂,ℤ_sgn)=C₂. Untwisted degree-one shift would have target 0. The usual norm/(t−1) sequence gives shift 2. | Keep |
| 8.4 cyclic cup periodicity and p-period | C_m; trivial group; S₃,p=3; Q₈ | χ(generator)=1/m and δχ generates C_m; degree-zero cup sends 1 to that generator. For m=1 both Tate groups are 0, and 1/1=0 in Q/ℤ. S₃ has 3-period 4, not 2; Q₈ has Ĥ²=C₂² and Ĥ⁴=C₈, so period 4. | Keep |
| 8.5 global equivalence | 1,S₃,A₄,C_p²,SL₂(F₉) | Trivial Tate groups have order 1 and all four conditions hold. S₃ has period 4 with Ĥ⁴=C₆. A₄ contains V₄. dim Hⁿ(C_p²,F_p)=n+1. SL₂(F₉) has unipotent C₃² of order 9 dividing 720, so is not periodic. | Keep |
| 8.5 primary equivalence | A₄,p=3 and 2; C₂,p=3; S₃,p=3 | A₄ has Ĥ²=C₃ and cyclic Sylow 3, while Sylow 2 is V₄. For C₂,p=3, all primary groups are 0 of order 1=3⁰, so all four conditions hold. In ℤ/6, e₃=4, with 4²=4, 4≡1 mod3 and 4≡0 mod2. | Keep |
| Zero coefficients and zero ring | Every construction with M=0; k the zero ring where permitted | All chains, cochains, invariants, tensor terms, (co)homology and constructed maps are 0. The subgroup sums and products still yield 0. No denominator involving k is used. | Keep |

### Pinned objects and duplication audit

The object search covered group homology/cohomology, induction and transfer, Tate products/duality/periodicity, exterior squares, Hopf maps, filtered complexes, tree chains, Künneth and universal coefficients. The library near-match list was read for all 21 declarations. Matches such as ordinary subgroup transfer, scalar periodic functions, or a low-degree complex defining H₂ are not proofs of the headline statements. Relevant declarations were opened at the pins; representative exact locations and the boundaries they establish follow. Paths in this table are relative to the named library repository.

| Library | Declarations opened, file and line | Boundary checked |
|---|---|---|
| Mathlib | `groupCohomology.coindIso`, `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58`; `groupHomology.indIso`, corresponding `GroupHomology/Shapiro.lean:65`; `Rep.indCoindIso`, `Mathlib/RepresentationTheory/FiniteIndex.lean:178` | Shapiro for arbitrary subgroups; induction/coinduction comparison requires finite index. |
| Mathlib | `Rep.quotientToInvariantsFunctor`, `Mathlib/RepresentationTheory/Invariants.lean:263`; quotient coinvariants, `Coinvariants.lean:442` | Degree-zero representations only; these do not supply the positive-degree quotient action. |
| Mathlib | `Rep.standardResolution`, `Mathlib/RepresentationTheory/Homological/Resolution.lean:321`; `barResolution`, line 427; inhomogeneous-chain `d_single`, `GroupHomology/Basic.lean:132`; `H1AddEquivOfIsTrivial`, `GroupHomology/LowDegree.lean:1019` | Chain differential uses the inverse action; H₁ comparison requires trivial action. |
| Mathlib | `HInfRes`, `GroupCohomology/Functoriality.lean:376`; `infNatTrans`, line 566; `coresNatTrans`, `GroupHomology/Functoriality.lean:850`; `coinfNatTrans`, line 864 | Correct map directions and quotient coefficients. |
| Mathlib | `Rep.FiniteCyclicGroup.groupHomologyIsoEven`, `GroupHomology/FiniteCyclic.lean:85`; odd version, line 122; `TateCohomology.isoGroupCohomology`, `TateCohomology/Basic.lean:233` | Positive even degree has a nonzero-degree binder; ordinary/Tate comparison excludes degree zero. |
| Mathlib | `AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`, `Mathlib/AlgebraicTopology/DoldKan/HomotopyEquivalence.lean:81`; Moore inclusion, `AlternatingFaceMapComplex.lean:263` | Genuine deformation retract supplies normalization, not a separate new resolution theorem. |
| Tau Ceti | `TauCeti.groupCohomology.coindIso_hom`, `TauCeti/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:109`; unit comparison line 152; corestriction at `Corestriction.lean:136`, trace comparison 149, index identity 165, connecting compatibility 187 | These are the cited existing maps, not planned duplicates. |
| Tau Ceti | `TauCeti.groupHomology.indIso_inv`, `GroupHomology/Shapiro.lean:98`; counit compatibility 143; `transfer`, `GroupHomology/Transfer/Basic.lean:79`; unit compatibility 89; index identity 121 | Transfer goes down and inclusion-induced homology goes up; neither file states the new all-degree discrete double-coset sum. |
| Tau Ceti | `Rep.mackeyDecomposition`, `TauCeti/RepresentationTheory/Induction/Mackey/Decomposition.lean:392`; natural isomorphism 425; `TauCeti.indProjection`, `Induction/Projection.lean:196`; `indResProjection`, `Induction/Permutation.lean:339` | Representation-level decomposition/projection is imported; passage to the specified cohomological operations remains work. |
| Tau Ceti | `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`, `ContCohomology/DiscreteGroup.lean:166`; low-degree isomorphisms, `GroupCohomologyIso/Basic.lean:492,557`; `continuousFiniteQuotientColimit`, `FiniteQuotient/AllDegreeColimit.lean:402` | Existing all-degree equivalence is finite-group and unnamed; it does not supply the general natural Θ. |
| Tau Ceti | `TauCeti.ContinuousCohomology.corestriction_mackey`, `ContCohomology/Corestriction/Mackey/AllDegrees.lean:279`; `IsTransgressionLift`, `Transgression.lean:147`; `transgression`, line 702 | Profinite/open/closed hypotheses and continuous lift are retained in comparisons. |
| Tau Ceti | `TauCeti.TateCohomology.characterConnectingClass`, `TateCohomology/Character.lean:65`; `periodicIsoOfGenerator`, `Periodic.lean:302`; `periodicIso`, line 346; `res_comp_cor`, `Restriction/AllDegrees.lean:167` | Resolution periodicity exists; identifying the specific character cup map in every degree is stronger. |
| Tau Ceti | `cup_gradedComm`, `TateCohomology/Cup/GradedComm.lean:168`; `cup_assoc`, `Associativity.lean:214`; `cup_projection`, `Corestriction.lean:178`; `cup_res`, `Restriction/AllDegrees.lean:141`; `cup_δ_of_flat`, `Delta.lean:242`; `δ_cup_of_leftInverse`, line 443 | Signs, tensor-flatness and split-inclusion hypotheses agree with the routes. |
| Tau Ceti | `Rep.projective_of_isZero_res`, `TateCohomology/Projective/Basic.lean:232`; `isZero_res_of_projective`, line 123; Tate–Nakayama, `Cup/TateNakayama.lean:360` | Nakayama–Rim applies over ℤ to free modules of any rank; no hidden finite-generation shortcut in §8.3. |
| Tau Ceti | `SSet.shuffle`, `TauCeti/AlgebraicTopology/SimplicialSet/Shuffle.lean:689`; naturality 753; `eilenbergZilberHomotopyEquiv`, `EilenbergZilber.lean:761`; simplicial-object AW, `SimplicialObject/AlexanderWhitney.lean:172,206,222,313` | Maps are on simplicial chains, and equivariance is obtained from naturality. AW lands in the total tensor complex, with the stated front/back faces. |
| Tau Ceti | `TauCeti.ChainComplex.cupCochain`, `TauCeti/Algebra/Homology/Monoidal/Cup.lean:69`; Leibniz rule 86; `capChain`, `Cap.lean:74`; `kronecker`, `Kronecker.lean:106` | Generic cap uses front evaluation. The roadmap explicitly changes the face before descending to group coinvariants. |
| Tau Ceti | `homologyCross`, `Monoidal/Homology/Cross.lean:153`; `homologyKunneth`, `Kunneth/Basic.lean:112`; short exactness, `Kunneth/Sequence.lean:729`; splitting 793; `extToHomology`, `UniversalCoefficient/Basic.lean:121`; injectivity 153; exactness 180 | Generic complex results are consumed. Cycles and their quotient/projectivity hypotheses explain the hereditary-ring route. |
| Tau Ceti | `CochainComplex.exists_quasiIso_projective`, `CochainComplex/ProjectiveResolution.lean:71`; bounded-above K-flatness, `Monoidal/KFlat/Basic.lean:361`; `filtrationSpectralSequencePageXIsoEInfty`, `SpectralSequence/Filtered/Stabilization.lean:83`; first page, `Filtered/FirstPage.lean:89` | Bounded-above replacement and local stabilization conditions are retained; degreewise-bounded filtration is not confused with a global bound. |
| Tau Ceti | `groupHomology.exists_map_subtype_eq`, `GroupHomology/DirectedUnion.lean:113`; vanishing 132; `isZero_groupHomology_freeGroup`, `TauCeti/AlgebraicTopology/ClassifyingSpace/WedgeCircles.lean:259` | Directed-union file supplies the surjective half. Free-group vanishing there is trivial-coefficient homology in Type, not arbitrary M and cohomology. |
| Tau Ceti | `TauCeti.FactorSet.cohomologyClass`, `TauCeti/GroupTheory/GroupExtension/Cohomology.lean:120`; section independence 363; `SerreGraph`, `TauCeti/Combinatorics/Graph/Serre/Basic.lean:42`; `Connected`, line 178; `IsTree`, `Tree.lean:47` | Factor-set class is integral. A Serre tree includes nonempty connectedness; no empty-tree augmentation counterexample. |

For abbreviated paths in the table, group (co)homology and Tate files are beneath the respective library's `RepresentationTheory/Homological`; generic homology files are beneath `TauCeti/Algebra/Homology`. Names were searched by objects as well as identifiers. The resolver reported no missing cross-roadmap references; its separate warning that its own pinned-name scanner was unavailable was not used as evidence of library validity. The direct source checks and actual Lean elaborations supply that evidence.

### Current roadmap ownership and supplier direction

The overlap facts were read and checked against main and available open heads. No second copy, conflicting change to this folder, dropped cited ID, or citation defined only by an unnamed revision was identified. The closest-results list is empty. Object-level comparison nevertheless found R01, which identifier matching alone does not detect.

| Supplier/current location opened | Ownership and resolution |
|---|---|
| DerivedModuleAlgebra, main, `README.md:955`, §S.1 | Generic first-quadrant spectral sequences, exact-row comparison, cohomological edges/low degree. Homological low-degree maps remain the explicitly declared gap. |
| SpectralSequencesAndConvergencePartII, PR #2307, §§4.3,5.2 (`README.md:1726,1894`) and scope/Layers 2–3 | Generic Künneth and filtered pairings are imported. Explicit group-extension filtration is left to this package. The exact-sequence naturality gap is stated separately. |
| SpectralSequencesAndConvergence, PR #2302, §3.6 (`README.md:893`) | Generic convergence and cohomological low-degree formalism; not the missing homological edge contract. |
| ProfiniteCohomology, main, §§3.1–3.2,5.5,6.4,10.1,10.5 and Layer 12 | Low-degree explicit/continuous comparisons, profinite transgression, Mackey, finite-quotient colimit, and continuous cups; the package's discrete natural comparisons preserve this ownership. |
| ClassFieldTheory, main, `README.md:776`, Layer 0 | Tate carrier/operations, cohomological triviality, Nakayama–Rim and Tate–Nakayama. |
| FreeGroupsAndLimitGroups, main, §§2.2,4.1–4.2,4.5–4.8 | Graphs of groups, actions without inversions, Bass–Serre tree/stabilizers and free/amalgam/HNN identifications. The new targets are their (co)homological sequences. |
| AlgebraicTopology, main, `README.md:1945,2005`, §§5.3–5.4 | Finite regular-cover comparison with constant coefficients and torus homology. The sign-twisted cover example correctly lies outside the constant-coefficient comparison. |
| StableHomotopyKTheory, main, §3.29 (`README.md:1337`) | Perfect-group universal-central-extension kernel identification; the package extends to arbitrary free presentations with the prescribed Hopf map. |
| K2SymbolsBrauer, PR #1302, §1.1 (`README.md:107`) | Normalized Hopf boundary map, torus inverse-commutator value and naturality; no general bijectivity is assumed from it. |
| SchemeKTheoryOperations, PR #1229, §6.7 (`README.md:2548,2583`) | Integral nonnegative group hyperhomology, its two spectral sequences, and all-coefficient directed-union identification. The package's extension is arbitrary k and hypercohomology, not a second integral construction. |
| K3BlochGroups, PR #1430, §§4.1,5.2 (`README.md:1189,1855`) | Bounded-below integral reindexing; trivial localized stable elements, positive integral duality, quaternion resolution and Swan periods. Those special cases are cited. |
| ArithmeticGaloisDuality, PR #858, §D7.2 (`README.md:5014`) | Finite-group integral universal coefficients and Sylow detection. General ring/group forms here retain their additional content. |
| InductionRestrictionPartII, PR #1154, RS.0.1, RS.0.3 and RS.6.8 | Central-extension exact sequence, normal Hall coinvariants, degree-two product formula and **general**, not finite-only, exterior-square theorem. R01 records the conflicting ownership. |
| InductionRestriction, main, scope/standing conventions | Induction, restriction and representation-level Mackey theory; the native implementations are imported, not redeclared here. |
| MappingClassGroupsAndCanonicalRepresentations, PR #2266, §1.1 (`README.md:847`) | Existence of the discrete Hochschild–Serre sequence, ordinary five-term sequence and invariant-cocycle lift. The explicit filtered model and higher-degree transgression remain distinct. |
| IntegralIwasawaTheoryPartII, PR #2267, §0.7 (`README.md:271`) | Its subgroup-flatness/coinflation and cyclic-cap interfaces resolve as cited. |
| ModularCurvesPartII, §15.4 (`README.md:3935` at its supplied head) | Modular-amalgam sequence with correspondence compatibility. The package supplies arbitrary amalgams; it does not claim the modular correspondence refinement. |

Every `*Needs:*` line was read. No upward or cyclic edge was found. The requested mechanical check returned:

```text
depcheck: 244 roadmaps, 2206 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Both gap slugs agree between `packages/CohomologyOfGroups/design/plan.json` and the README: `homological-low-degree` names DerivedModuleAlgebra §S.1 with homological edges and the exact five-term sequence; `flat-kunneth` names SpectralSequencesAndConvergencePartII §4.3 with the naturality of its two-column exact sequence. Their hypotheses and owners are explicit. Neither asks this package to reprove generic machinery, and the missing contracts are not additional findings.

Overlap check: read SpectralSequencesAndConvergencePartII, K3BlochGroups, ArithmeticGaloisDuality, InductionRestrictionPartII, SpectralSequencesAndConvergence, ProfiniteCohomology, DerivedModuleAlgebra, InductionRestriction; generic spectral sequences/pairings belong to the first, fifth and seventh; localized stable elements/quaternion/Swan theory to K3BlochGroups; finite integral universal coefficients to ArithmeticGaloisDuality; continuous theory to ProfiniteCohomology; representation induction/Mackey to InductionRestriction and the pins; degree-two abelian Künneth and the full exterior-square theorem to InductionRestrictionPartII, with the latter duplicated here (R01).

### Source independence

Compared 21 readable passages with five sources: the twelve seeded passages with accessible supporting text and nine further passages across distinct sections, including the Hopf signature's statement against Loh19. No copied prose, translated paragraph, source exercise list or source figure was found. Formulas and conventional theorem names account for shared mathematical wording. Unavailable Brown/CE text was not counted as compared.

Counting source-key occurrences before References, including repeated extraction-line pointers, gives HS53 42, Loh19 27, Brown82 14, Hutchinson13 12, MilneCFT 11, SerreArbres 4, CE56 3, SwanPPeriod60 2: 115 total. This states the counting convention rather than treating repeated pointers as different works.

HS53 is largest. Its chapter description at line 22–42 and its section headings were compared with the roadmap. There is no matching run of chapters: the package's Layers 3–5 and 7–8 do not map to HS53's chapters. Even within Layer 6, §6.1 uses II §1, §6.2 combines I §7 and II §§2–4, §6.4 uses III §1, §6.5 returns to II §5, and §§6.6–6.7 use III §§3–4. Dependencies force the normalized filtration before its spectral sequence, then its multiplicative structure and transgression before the higher low-degree sequence. This is a mathematical build order, not the source's exposition relabelled.

Source independence: 21 passages compared with 5 sources; no prose reuse found; largest share HS53, 42 of 115 source-key/locator-pointer occurrences; contents compared with HS53: independent. Brown82 and CE56 wording was not tested because their text is unavailable; their settled statuses are unchanged.

## Not verifiable

- Brown82 text is unavailable and its manifest entry is settled `uncertified`. Its locators in the seeded §§3.2,4.4,5.4,7.2,8.1,8.3,8.5 could not be checked against the book. Independent calculations and named routes are recorded above, not substituted for a claim of source verification.
- CE56 text is unavailable and settled `uncertified`: XVII for §2.2 and XII for §§8.1,8.5 could not be opened. No new request was made.
- SwanPPeriod60 is settled `waived`. The accessible Hutchinson13 statement and K3BlochGroups contract were checked; the original paper was not read.
- The all-theorem elementary tactic probe completed. Three broader `exact?` searches reached the default heartbeat limit; the corresponding pinned candidates were compared by source rather than claiming exhaustive automatic proof search.
- No mathematical theorem in the acceptance file has been proved by this review. Successful elaboration checks types; the table records the independent mathematical tests and their limits.

## Source issues

- **Misprint** in Hutchinson13 at Corollary 3.3 proof, printed p. 12, line 518: the source says the relevant degree is congruent to three modulo three; it should be congruent to three modulo four; affects the proof.

## For the human reviewers

- Brown82 and CE56 remain cited by locators without readable text; their wording was not tested. Their `uncertified` status is recorded in `packages/CohomologyOfGroups/sources.toml`.
- Loh19 and MilneCFT are institutional/author course notes. The source manifest records their provenance; no source text or figures were copied into the package.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9b3232018d1d035ef07393fb4bdb74f09f503078", "job": "REV-PKG-CohomologyOfGroups~6", "model": "gpt-6-astra", "worker": "chris-6"} -->
