<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6862191925 -->
Red team round 2 pass a (codex) of 18e1ae6

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P1) The local ℓ-adic calculation at zero has no supplying target

   **Location:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:1398, “the normalized Satake weights fix the central scalar”; packages/KloostermanSheavesAndBesselIsocrystals/README.md:1593, “cannot contain a nontrivial principal unipotent element as required”.

   **Claim:** §§4.3 and 6.2 have the local information about the ℓ-adic eigenobject needed by their proof routes.

   **Witness:** XZ lines 2338–2341 use the nearby-cycle Frobenius calculation; XZ lines 2404–2408 use HNY Theorem 1(2). HNY lines 1214–1269 require central sheaves and their weight filtration. Neither calculation is a target of §1.6.

   The stated §1.8 comparison is at closed points of X = G_m, so it does not include zero. §4.2 supplies the p-adic nilpotent residue, not the local ℓ-adic assertion. The quoted supplier sections do not contain equal-characteristic central sheaves with this filtration. The source's proof cannot simply be imported without ownership. For SL₂, both C₀ = diag(c_q⁻¹,c_q) and −C₀ satisfy NC₀ = qC₀N and have identical weights and slopes. Their traces are opposite. Thus numerical weights alone do not remove the central ambiguity.

   **Exact repair text:** Add after §1.6: “For trivial tame character, prove that the local ℓ-adic eigenobject at zero is tame with principal unipotent monodromy. Compute its nearby-cycle weight-graded Frobenius modules from normalized Satake cohomology, including the actual Frobenius scalars, not only their weights (HNY Theorem 1(2), §4.3, pp. 261, 270–271). Transfer these local Frobenius polynomials to the arithmetic eigenobject by compatibility of nearby cycles for the same Hecke construction.”

   Add to the supplier contracts and plan's gaps: “What GlobalShtukasAndFunctionFieldLanglands must provide (gap:equal-characteristic-central-sheaves): for split connected reductive G over a finite field and ℓ different from its characteristic, the nearby cycles of the normalized Satake sheaves in the Grassmannian-to-Iwahori-flag degeneration have unipotent inertia; their monodromy filtration agrees with their weight filtration, whose length-zero IC constituents and Frobenius twists have the multiplicities prescribed by Satake hypercohomology (HNY §4.3, pp. 270–271).” Assign Layer 1 as the supplier section. Cite the new local target and this gap in §§4.3 and 6.2; for the tame-companion implication in §6.2 also name the trace formula, weights and both Euler-characteristic formulas actually used, as in XZ Lemma 4.5.3.

   The repaired local Frobenius calculation selects C₀ and rejects −C₀. It also supplies the principal unipotent element in the ℓ-adic group used by §6.2, without invoking the later companion-monodromy comparison. This is not a rejection of any already-declared gap.

2. **F02** (P2) A remaining Check still assigns a trace function to a de Rham object

   **Location:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:664, “the exponential object `E_{−π}` in (ii) and the Dwork F-isocrystal in (iii) have the matching trace function”.

   **Claim:** The algebraic D-module in theory (ii) itself has a Frobenius trace function.

   **Witness:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:737 and 884 explicitly deny this structure. The same one-dimensional fibre with endomorphisms 1 and 2 has traces 1 and 2; its underlying de Rham data cannot distinguish them.

   **Exact repair text:** “On A¹, the analytification of E_{−π}, with Frobenius forgotten, is the underlying connection of the Dwork object in theory (iii). Equipping it with the specified multiplier exp(π(t−t^q)) gives trace ψ∘Tr. The algebraic D-module in (ii) alone has no Frobenius trace.”

   The specified multiplier fixes the fibre value at zero to 1 and excludes the alternative scalar 2. Round 1a/F02 is therefore only partly repaired: its §1.3 statement is fixed, but this Check remains.

3. **F03** (P3) The tensor-square parity Check is false

   **Location:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:756, “the hypercohomology of `IC_μ ⋆ IC_μ` … would give a super vector space with odd part”.

   **Claim:** The minuscule tensor square for PGL₂ has nonzero odd cohomology before correcting the commutativity constraint.

   **Witness:** H*(P¹,K[1]) has dimensions 1 in degrees −1 and 1. Its tensor square has dimensions 1,2,1 in degrees −2,0,2, and odd dimension 0. Changing a constraint does not change those degrees.

   **Exact repair text:** “For PGL₂ and minuscule μ, H*(IC_μ) lies in odd degrees −1 and 1. The uncorrected symmetry acts as minus the ordinary flip on H*(IC_μ)⊗H*(IC_μ); the corrected constraint removes this sign. The tensor square itself has only even degrees −2,0,2.”

   For a nonzero lowest-degree class e, the two symmetries send e⊗e to −e⊗e and e⊗e respectively, so this replacement discriminates the conventions.

4. **F04** (P3) The Gauss-sum Check drops the number of lower parameters

   **Location:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:2117, “using the Gauss sum of `k₂` without the sign … multiplies the trace by `−1`”.

   **Claim:** The error factor is −1 for the general specialization n>m≥0 of §9.2.

   **Witness:** At n=3,m=2 with both lower characters quadratic over F₃, g²=−3 and g₂=3. The products g₂²=9 and (g²)²=9 agree. At m=0 both empty products are 1.

   **Exact repair text:** “At d=2 the normalizing scalar is the square of the base scalar. Replacing each g_j² by g_{j,2} without its Hasse–Davenport sign changes the product, and hence the normalized trace, by (−1)^m: −1 for odd m and 1 for even m. In particular the quadratic one-lower-parameter case changes sign.”

   The replacement gives factors 1,−1,1 for m=0,1,2, respectively.

5. **F05** (P2) The Weil-parameter definition omits continuity on inertia

   **Location:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:1670, “A discrete parameter is a homomorphism … with finite image on inertia”.

   **Claim:** Every homomorphism satisfying the displayed conditions cuts out the finite Galois extensions subsequently used to define its ramification groups.

   **Witness:** GR line 530 requires continuity on inertia. Finite image does not imply continuity: over F₂((t)), a discontinuous quadratic unit character can centrally twist a genuine SL₂ simple-wild parameter without changing its adjoint representation.

   Here is an explicit construction of the defect. The principal-unit square-class quotient of F₂((t)) is a product of copies of F₂ indexed by positive odd integers. Choose an F₂-linear functional that vanishes on the finite-support vectors but is 1 on the all-ones vector; extend that functional to the whole product. Its kernel is dense and proper. Extend this character trivially on the uniformizer, and pull back along the local reciprocity map from the Weil group. Twist the genuine rank-two Kloosterman local parameter by this character into the central subgroup {±1} of SL₂. The twist still has finite inertia image, finite full centralizer, adjoint invariant dimension 0 and adjoint Swan 1. Its inertia kernel is not open, so it is not the kernel defining a finite local Galois extension.

   **Exact repair text:** “A discrete parameter is a homomorphism ϕ:W_{k_∞}→H(K̄) whose restriction to inertia is continuous with finite image (equivalently, has open kernel), whose Frobenius image is semisimple, and whose full image has finite centralizer in H. Continuity is read in the discrete topology on the finite inertia image (Gross–Reeder §3, conditions (1)–(3), and §6).”

   Add the Check: “An abstract finite-image character with dense proper kernel is excluded: finite image alone does not provide a ramification filtration.” The discontinuous central twist fails the repaired condition, while the concrete degree-20 extension in §6.5 satisfies it.

6. **F06** (P2) A point of Spec A need not give an A-to-K character

   **Location:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:991, “for every `χ ∈ Spec A` the module `ω^{−1/2} ⊗ (D′ ⊗_{A, χ} K)`”.

   **Claim:** Every scheme point χ supplies the K-valued specialization used in the displayed module.

   **Witness:** For A=K[t], the generic point (0) has residue field K(t). No K-algebra map K[t]→K has kernel (0): evaluation at c has kernel (t−c). Algebraic closure of K does not remove this point.

   **Exact repair text:** “For every point χ of Spec A, form the localization after extension to its residue field κ(χ): ω^{−1/2}⊗(D′⊗_A κ(χ)), on Bun_𝒢 base-changed to κ(χ). It is a Hecke eigensheaf for the corresponding oper over κ(χ). For a K-valued character χ:A→K, this is ω^{−1/2}⊗(D′⊗_{A,χ}K).”

   Add the Check: “For A=K[t], t=0 specializes over K; the generic point specializes over K(t), where t stays transcendental.” This retains all points and makes the generic specialization well typed. Zhu Theorem 8 explicitly uses a closed point (Zhu lines 377–380); Corollary 9's K-valued notation must not be read as providing a K-valued map for nonclosed scheme points.

7. **F07** (P3) The tensor-isomorphism torsor citations point to heaps

   **Location:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:414, “§§6.1–6.3 and §6.5”; also lines 1566, 1572, 1749, 1770 and 1885.

   **Claim:** MotivesAndAlgebraicCycles §6.5 supplies the tensor-isomorphism torsor and the change-of-fibre-functor conjugation used here.

   **Witness:** TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1179 defines heaps; §6.8 at line 1229 constructs Isom^⊗ and at line 1237 identifies the conjugation twist. There is no old-numbering map identifying §6.5 with §6.8.

   **Exact repair text:** “MotivesAndAlgebraicCycles §§6.1–6.3 and §6.8 supply neutral reconstruction, tensor generation, and the affine faithfully flat tensor-isomorphism torsor, with its two actions and change-of-fibre-functor conjugation.” Replace each citation of that supplier's §6.5 for this purpose by §6.8.

   For the μ₂-torsor Spec ℚ(√2), §6.8 supplies the tensor-isomorphism representer with no rational section; §6.5 only converts an already supplied affine heap to a torsor. This is a locator repair to an existing earlier supplier, not a new gap.

8. **F08** (P3) The two-series Checks do not distinguish the two series

   **Location:** packages/KloostermanSheavesAndBesselIsocrystals/README.md:2277–2281, the three Checks for §10.4.

   **Claim:** These are discriminating Checks for the definitions of F, G and their comparison h.

   **Witness:** Replace F by G, leaving G unchanged. Both first truncations still reduce to 1; h=1 satisfies both displayed compatibilities; extension multipliers still telescope. Yet at n=1 the purported F coefficient is +8 instead of −8.

   **Exact repair text:** Replace the three Checks by:

   - “At n=1, F=1−8x+8x²+O(x³), while G=1+8x+24x²+O(x³). Taking F=G fails already at the coefficient of x; deleting the double factorial fails at x².”
   - “For this pair h=1−16x+112x²+O(x³), so h′(0)=−16=η_F(0)−η_G(0). Multiplication by h⁻¹ instead has derivative +16 and reverses the stated map E_G→E_F.”
   - “At n=1, f_{F,2}=1−8x+16x²+O(x³), whereas f_{F,4}=1−8x+8x²+O(x³). For G the corresponding x² coefficients are 16 and 24. A single squaring multiplier therefore fails the degree-two constant-field extension test.”

   The replacement rejects the F=G countermodel, the inverse comparison map and the wrong constant-extension multiplier using coefficients in characteristic zero, including at residue characteristic two.

Eight new findings are recorded below. The earlier findings are verified individually after them.

## Verification of the earlier findings

The identifiers below are those of the two supplied round-one reports. Quotations are from this head. “Repaired” concerns the particular earlier counterexample; it does not certify every assertion in the section. None of the repair report's findings was marked “not actionable in this package”.

| Earlier finding | Status | Repaired passage and location in packages/KloostermanSheavesAndBesselIsocrystals/README.md | Recomputed witness |
|---|---|---|---|
| 1a/F01, algebraicity | Repaired | §1.3, lines 727–732: “whose restriction to the abstract group `H(L)` is algebraic” | For H=G_m, the valuation character is 1 on all units and sends a uniformizer to itself. An algebraic character t↦t^j trivial on all units has j=0 and sends the uniformizer to 1. The spurious character is excluded. XZ lines 1650–1656. |
| 1a/F02, de Rham Frobenius | Partly repaired; S02 | §1.3, lines 734–737: “graded dimensions of that stalk cohomology; a de Rham object carries no Frobenius” | The minuscule PGL₂ stalk is dimension 1 in degree −1 in both theories; only the arithmetic stalk has eigenvalue c_q⁻¹. The §1.1 Check still claims a de Rham trace. |
| 1a/F03, invariant scaling | Repaired | §2.2, lines 939–944: “λφ matches N + λ^h x E” | A₁, λ=2: P₂(2φ)=4=P̌₂(N+4xE); P̌₂(N+xE)=1. For A₁×A₂ the factors scale by 4 and 8. |
| 1a/F04, coefficient residue field | Repaired | Conventions, lines 129–138: “The coefficient field K is a finite extension of K₀” | At p=q=3, π²=−3 and c₃²=3 imply (π/c₃)²=−1. F₃ has no square root of 2; adjoining i gives residue F₉. R can retain residue F₃ while K has residue F₉. |
| 1a/F05, negating π at 2 | Repaired by a valid different argument | Lines 159–165: “there §RD.6.95 is used with π itself” and “exp(2πt) = exp(−4t)” | π=−2 satisfies π=−2; +2 does not. The exponential radius is 2, its value at zero is 1, and both multiplier products have exponent πt^q+πt. |
| 1a/F06, toric-slope Lean headline | Not added; original objection withdrawn | §11.2 retains the toric lemma; packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean:158 states “orthogonalSum_ordinary” | At n=1,d=2 the intermediate polynomial has degree 6 and slopes 0,½,1,3/2,2,5/2; the quotient has slopes ½,3/2,5/2. The end theorem records the resulting three orthogonal eigenvalues with slopes 0,1,2. The repair's distinction between this intermediate lemma and the actual headline is supported by XZ lines 2945–2951. No additional acceptance-test declaration is required. |
| 1a/F07, equal-length ownership | Repaired | Scope lines 67–72 and §9.1: “for n = m they are that roadmap's sum” | F₅, upper trivial/lower quadratic, a=2: the raw sum is √5; the supplier at t=a⁻¹=3 gives √5, while t=a=2 gives −√5. HypergeometricMotives §4.2 is the owner. |
| 1a/F08, subquotient Check | Repaired | §6.1: “Std₈ restricts to G₂ as Std₇ ⊕ 1” | Dimensions 8=7+1; a nontrivial SO₈ representation has dimension at least 8, while the generated category contains the 7-dimensional summand. The former SL₂ tensor-square example already split as 3+1 in its source category. |
| 1a/F09, torus levels | Repaired | Layer 0 Examples, lines 608–613: “`Bun_G(1,2)` is a copy of `𝔾_m` in each degree” | For G_m, V=0 and Ω=Z; two trivialized fibres have one ratio in G_m. One remaining level fixes all automorphisms; the two-level ratio is not a point. |
| 1a/F10, pin absence claim | Repaired | Lines 214–219 distinguish “Real.besselI”, “Complex.besselJ” and “WittVector.Isocrystal” | besselI(0,0)=1 is a scalar special-function value. The native isocrystal has a Frobenius-linear automorphism, but no connection or curve. These are not the missing Bessel F-isocrystal carrier. |
| 1a/F11, finite-group ownership | Repaired | §6.3 and contract lines 442–450 name “McKaySkewGroup §§0.1–0.2” | Binary tetrahedral order 24 maps with kernel of order 2 to A₄ of order 12; its normal V₄ has order 4. The cited main-branch classification supplies this case. |
| 1a/F12, recognition and semisimplicity | Repaired | §7.5, lines 1829–1847 proves reductivity and invokes “ArithmeticGaloisRepresentations §5.13” | I₂ and the nonidentity unipotent Jordan block both have polynomial (1−T)²; the latter is not semisimple. The repaired route explicitly proves semisimplicity before recognition. The supplier includes curves over finite fields and ℓ≠p. |
| 1a/F13, logarithmic Newton input | Repaired | §5.3 and §10.5 use “gap:log-newton-semicontinuity” | N=E₁₂ has rank 1 and N²=0, so the extension across zero is logarithmic, not smooth. Its two slopes are −½,+½. The same slug and named supplier occur in design/plan.json and the contracts. |
| 1b/F01, elementary convolution padding | Repaired | §11.1(iii) remains in prose; the named convolution theorem is absent from Suggested.lean | At F₃,a=1,N=2: (1−3)(−1)+(4−3)2=4=U₂(1)−3=7−3. The substitution uses no deep comparison. The Lean file now contains four theorems, not five. |
| 1b/F02, Swan input cycle | Repaired | §6.4, lines 1646–1649 derives Swan from the slope bound and wild nontriviality | Rank 3: 3·(1/3)=1; positive integral Swan is therefore 1. A degree-two descent would give an even Swan, contradicting 1. This removes dependence on §8.1. The earlier local input needed by §6.2 has the separate defect S01. |

## Verified sound

Read all 2,619 README lines and all 169 Suggested.lean lines at the requested head. There are 65 numbered mathematical targets, seven additional bold convention blocks besides the standing datum, six bold worked examples, 238 Check bullets, six Lean definitions and four Lean theorems. The sampled rows below record computations rather than treating elaboration or a source citation as proof of truth.

The four acceptance-test headlines are the signed Dwork congruence (§10.2), the characteristic-two and odd-characteristic orthogonal identities (§11.1), and orthogonal ordinarity (§11.3). The module docstring explicitly identifies nine groups of unavailable geometric headlines and their missing carriers: eigenobjects/Bessel F-isocrystals, arithmetic Satake, Zhu and relative comparison, differential and arithmetic monodromy, Newton-point ordinarity, functoriality/companions, the characteristic-two object comparison, arithmetic hypergeometric objects, and adjoint rigidity/simple wild parameters. No replacement free predicate or sorry'd data is present. No remaining theorem is a one-tactic library consequence or a boundary-value Check. The convolution theorem removed in round one stays removed.

### Signature audit and sampled headline instances

All declarations are in `TauCetiRoadmap.KloostermanSheavesAndBesselIsocrystals`; there are no ambient `variable` or `include` blocks. Each instance is an explicit binder. K and F are independently universe-polymorphic except for the finite fields in the final theorem, which are in Type; finite fields can be transported to that universe. `Finite` supplies a finite carrier without a selected enumeration. All coefficient fields are nonzero. No theorem requires completeness unless stated in its own signature.

The supplied signature output contains ten valid `#check @name` results. Its advertised count of twelve includes two parser-generated nondeclarations from prose. The ten genuine types agree with the explicit source binders; none loses a standing hypothesis. I read those results and the source signatures; I did not run Lean, as this pass prohibits Lean builds and makes no source changes.

| Declaration; layer; line in Suggested.lean | Full relevant context | Instances and computed values | Result/change |
|---|---|---|---|
| signed_dwork_congruence; 10; 66 | R,K:Type*; CommRing R, IsDomain R, IsDiscreteValuationRing R; Field K, CharZero K, Algebra R K, IsFractionRing R K; 2 nonunit; every B(i,j) nonzero; integer-unit signs independent of a,n; ha,hb,hc explicitly bound; m,s,N:N | R=Z_(2), K=Q, ranks 3 and 5: 2,952 coefficient tests for constant F, constant G and alternating F/G, s≤3,m≤2,N≤40 have nonnegative quotient valuations. Minimum valuations for rank 3 are 0,1,3; for rank 5 are 0,1,2. F(4)/F(2)=1/27≡−1 mod4, versus 1 at m=0. | Matches §10.2's incomplete-DVR extension. All denominators protected by hB. R of odd residue characteristic and R a characteristic-zero field fail h2. |
| orthogonalSum_sub_card_eq_kloostermanSum; 11; 133 | Finite field F, Algebra(ZMod 2) F; arbitrary coefficient field K; ψ₀≠1; n≥1; a:Fˣ | F₂,n=1,2: 1−2=−1=R₃=R₅. F₄,a=1,n=1: 9−4=5=R₃(1). A noncanonical shifted character of F₄ is not substituted for traceChar. | Correct scope; coefficient characteristic 2 makes hψ₀ impossible rather than producing a false case. |
| gaussSum_mul_orthogonalSum_sub_card; 11; 145 | Finite field F, ringChar F≠2; arbitrary coefficient field K; arbitrary ψ≠1; n≥1; a:Fˣ | F₃,a=1,n=1: (−i√3)(1−3)=2i√3=H₃(1). n=2: (−i√3)(7−3)=−4i√3. Every nontrivial character over F₃,F₅,F₇,F₉ passes the finite tests. | Correct Gauss sign and 4a argument; no division by the Gauss sum in Lean. |
| orthogonalSum_ordinary; 11; 158 | p prime; F:Type finite field and ZMod p algebra; nontrivial ψ₀ to C_p; n≥1,a unit; ∃β BEFORE ∀finite L/F; L has both algebra structures | F₂,n=1,a=1: α+β=−1, αβ=2; eigenvalues α²,2,β² have slopes 0,1,2. Their sum is −1=U₁−2. Their squared sum is 5=U₁(F₄,1)−4=9−4. | Uniform eigenvalues fixed before extension. The two ZMod p structures commute automatically by uniqueness, so an extra scalar-tower binder is unnecessary. Norm=cardⁱ fixes finite slopes and excludes zero eigenvalues. |

### Bold conventions, worked examples and excluded boundary inputs

| Passage | Computed instance | Result |
|---|---|---|
| Standing datum | p=2,s=1 gives q=2; q=1 would require s=0 or a nonprime p. | q=1 is excluded, not silently used as a finite field. |
| Coefficients | p=3: π²=−3, c₃²=3, (π/c₃)²=−1; p=2: π=−2. | Separate geometric base and coefficient extension are necessary and now present. |
| Connections/Frobenius | Rank-one A=−πt gives C′/C=π(1−qt^(q−1)); at t=0 the opposite sign differs by2π. | Column convention consistent with the chosen direction of C. |
| Rank-one dictionary | At p=2, exp(−4t) has radius2; at odd p, v_p(2π)=1/(p−1), giving radius1. | Sign-change isomorphism is overconvergent only in the stated characteristic-two case. |
| Half twists | q=4,d=2: (1/2) scalar¼; (1) scalar1/16. Rank2/F₂ trace−1/√2. | No integral-twist substitution. |
| Principal grading/Newton | A₁ residue condition NC=qCN gives entries√q on both sides; C has valuations−½,+½. | No assumption that ρ itself is an integral cocharacter. |
| Orthogonal sums | F₂ unique unit tuple gives U_n(1)=1 for every n≥1. F₃,n=1 gives1 and4. | Raw and normalized sums distinguished. |
| Matrices/universes | E₁₂²=0; E₁₂E₂₁ has trace1. Standard rank2 is indexed by two entries, regardless of displaying indices starting at1. | No zero-based matrix substitution. All finite fields can be placed in the stated small universe. |
| Worked characteristic two | R₂=1,R₃=−1,U₁=1: R₂²−2=−1. | Both sides agree. |
| Worked odd characteristic | F₃: R₂(1)=−1,R₂(2)=2,g=−i√3; g(1−3)=2i√3. | Both sides agree; opposite Gauss character reverses the sign. |
| Worked toric constant | n=4,q=2: corrected1+8−2=7; printed1+4=5. | Corrected value independently enumerated. |
| Worked residue | With t²=q, NC₀=qC₀N=tE₁₂; C₀⁻¹NC₀=qN. | Distinguishes C from its inverse. |
| Worked cyclic quotient | e₂=xηe₁ gives ∇e₁=ηe₁dx; its solution line has opposite coefficient−η. | The dual is essential. |
| Worked signed congruence | Rank3 F(4)/F(2)=1/27≡3 mod4; comparison at m=0 is1. | Unsigned congruence fails, signed one survives. |
| Zero object, empty tuples | Zero representation produces rank0/trace0; tensor unit rank1/trace1. Fin0 product=1,sum=0; raw rank0 fibre sum is δ_(a=1). | No rank-zero monodromy claim: classification assumes almost-simple H and specified nonzero representations. |
| Zero rings, equal-characteristic coefficients, inseparability | Field instances have 0≠1; CharZero K excludes characteristic p. In Dwork, h2 excludes a DVR where2 is a unit. Finite fields are perfect, so inseparable finite-field extensions do not occur. | These are excluded by hypotheses; no invented counterexamples using inadmissible rings. |
| Nilpotent bases/non-split groups | Over k[ε]/(ε²), a root coordinate1+ε remains a unit with inverse1−ε; coordinate ε does not. Split pinning is required, so a nonsplit group is not an instance. | Genericity via invertible root coordinates and the relative-base gap retain infinitesimal tests. |

### Supplier, ownership and merge-order audit

The nineteen named supplier roadmaps were resolved against main or the supplied open-head copies, not recalled from previous reviews. Contract checks included the following groups of locators. These are nineteen supplier checks, not a claim that the future libraries have already been implemented.

| Supplier | Locators and contract result |
|---|---|
| CongruenceSpectralGap | §§4.2a–4.2b: raw product-fibre sum and scalar sheaf; empty-rank convention checked separately in this package. |
| CharacterSumsOverFiniteFields | §3.3: norm-lifted multiplicative character, trace-lifted additive character, factor (−1)^(d−1). S04 is the package's application error. |
| HypergeometricMotives | §4.2: equal upper/lower lengths and constraint t∏x=∏y. The package correctly uses t=a⁻¹. |
| KloostermanMomentsAndPotentialAutomorphy | §§1.1,1.3,2.1,2.5–2.6: normalized scalar sheaf, groups, connection and cyclic-solution dictionary. The supplied head contains §2.6; the resolver's missing-§2.6 lead is a false positive. All-prime scalar ordinarity remains a declared gap. |
| GlobalShtukasAndFunctionFieldLanglands | §§0.1,0.3,0.14 and1.1–1.9,1.12: existing finite-field geometry/Satake. Relative geometry and the valuation bound are separately declared gaps. These sections do not supply S01's local zero calculation. |
| ReductiveGroupsPartII | RG2.3.3, RG2.3.6, RG2.4.1: parahorics, full Moy–Prasad filtration and Ω. The torus filtration is not replaced by commutator powers. |
| ReductiveGroups | Layers1,7,9,10: representations, structure, integral split groups, highest weights. The principal-SL₂ classification remains a named gap. |
| OrthogonalSpinGroups | Layers0–1: classical form groups and central spin maps. Integral Chevalley groups are supplied by ReductiveGroups Layer9, not inferred from characteristic-zero points. |
| PadicDifferentialEquationsAndRigidCohomology | RD.0–RD.6 sections in the contracts: radii, local modules, isocrystals, specialization square, log extensions, full faithfulness, traces, duality, monodromy and scalar Kloosterman objects. In particular RD.4.58–59 supply maps, not the relative comparison isomorphism; RD.5.112 includes the underlying isocrystal version. New generic operations and comparisons are visibly declared gaps. |
| PadicDifferentialEquationsAndRigidCohomologyPartII | MS.4, especially MS.4.6–MS.4.8: the specified maximal-slope map lifts on curves. The citation to MS.4 is valid at the supplied head. |
| BunGAndNewtonStrata | §§1.5,1.22: rational dominance and detection by representations. The linear closed-point Frobenius specialization is owned here. |
| MotivesAndAlgebraicCycles | §§6.1–6.3 exist; tensor-isomorphism torsors and conjugation are in §6.8, not §6.5. S07. |
| FormalConnectionsOpers | F2,F4,F6: torsor connections, opers and normal forms; the explicit Bessel slice and normalized comparison are this package's targets. |
| AffineLieAlgebras | A7–A8: complex critical centres. Rational forms and base extension are declared separately, not falsely attributed to the complex theorem. |
| SpringerResolutionAndCharacteristicCycles | §§8.1–8.6,9.1–9.2,9.4,9.6–9.7: smooth characteristic-zero D-modules, operations, holonomicity and intermediate extension. Stack descent is explicitly constructed in §1.1 here. |
| DeligneWeightsAndPurity | §§8.5,8.12,8.14,8.19: operations, purity and geometric semisimplicity. Geometric semisimplicity alone is not used as arithmetic semisimplicity in the repaired §7.5. |
| EtaleCohomologyFoundations | Finite-type constructible étale coefficient operations, not arithmetic D-modules. |
| McKaySkewGroup | §§0.1–0.2 on main: finite SL₂ subgroups and the central quotient used in §6.3. |
| ArithmeticGaloisRepresentations | §5.13: continuous semisimple ℓ-adic representations on finite-field curves, with ℓ≠p, recognized by all closed-point Frobenius polynomials. |

All twelve gap slugs agree between README and design/plan.json, have a named supplier and retain their stated hypotheses: relative-level-geometry, cuspidal-newton-bound, arithmetic-d-module-operations, formal-slope-comparison, companion-monodromy, principal-sl2-subgroups, scalar-kloosterman-ordinarity, dense-convergence-detection, critical-center-rational-forms, toric-exponential-sum-hodge-bound, toric-exponential-sum-ordinarity and log-newton-semicontinuity. No gap is reported merely because its supplier does not yet contain it. No duplicate existing implementation of these requested extensions was found. S01 concerns an additional input, not any of those contracts.

Object-based searches covered main/Completed, board packages and the indexed open roadmaps. The closest scopes were compared: ordinary and mixed-characteristic ℓ-adic Satake is not the arithmetic D-module Satake constructed here; the p-adic roadmap supplies the generic cohomology theory; MixedHodgeModulesAndIrregularHodgeTheory concerns complex/Hodge realizations; PotentialAutomorphyDworkMotivesPartII concerns automorphy of a different Dwork family. AffineLieAlgebras supplies the centre, not this level-specific localization. GlobalShtukasAndFunctionFieldLanglandsPartII is a downstream consumer of the local Kloosterman inputs and cannot be used as their supplier. No equal fully qualified name among this package's ten declarations was found outside its other open copy. The raw sum restatement is a necessary small definition for an acceptance theorem and explicitly credits its owner.

The indexed open roadmap #2289 also changes this same roadmap. Its text is not identical to this package: for example its coefficient convention enlarges the residue field of R, whereas this head separates R from K; its characteristic-two sign passage lacks this head's explicit overconvergent gauge; it also contains more precise MS.4.6 and scalar-headline wording. There is no duplicate on main. The eventual roadmap update must be reconciled onto #2289's current head, retaining the repairs here and the valid precision there, rather than treating them as independent additions. No dropped cited id was reported by the overlap check. This records the overlapping-head requirement without creating a new mathematical owner.

The prescribed read-only dependency gate returned:

```text
depcheck: 239 roadmaps, 2177 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. The downstream citation does not become a supplier edge. The gate does not detect the missing within-route mathematical input in S01. The read-only diff against origin/main contains eleven files, all within packages/KloostermanSheavesAndBesselIsocrystals. Neither package source file was edited during this review.

### Pinned API audit

The following native definitions were opened at the pins, with object-based searches used for absence/near-match claims. Neither besselI/besselJ nor the Witt-vector isocrystal is a curve-valued Bessel object. None of the library near-match leads proves one of the four retained headlines.

| API | Pinned file and line | Relevant content |
|---|---|---|
| AddChar.compAddMonoidHom; sum_eq_ite; mulShift | Mathlib/Algebra/Group/AddChar.lean:242,354,463 | Composition, character orthogonality over a domain, multiplication in the argument. The additive zero character and multiplicative one notation both denote the trivial character at this pin. |
| AddChar.sum_eq_zero_of_ne_one | Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:240 | Domain coefficients and nontriviality are required and present. |
| FiniteField.trace_to_zmod_nondegenerate; algebraMap_trace_eq_sum_pow | Mathlib/FieldTheory/Finite/Trace.lean:37,49 | Finite-field trace and Frobenius-sum formula. |
| ZMod.algebra and uniqueness | Mathlib/Algebra/Algebra/ZMod.lean:23,47 | Subsingleton algebra structure; resolves the apparent scalar-tower omission. |
| gaussSum_mul_gaussSum_eq_card | Mathlib/NumberTheory/GaussSum.lean:200 | Nontrivial multiplicative character and primitive additive character; this is not Hasse–Davenport. |
| quadraticChar; MulChar.ringHomComp | Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120; Mathlib/NumberTheory/MulChar/Basic.lean:455 | Integer values and transport, including zero at zero. |
| PadicComplex | Mathlib/NumberTheory/Padics/Complex.lean:137 | Completion of the algebraic closure; the finite powers in the headline use its norm. |
| PowerSeries.mk; expand | Mathlib/RingTheory/PowerSeries/Basic.lean:112; Mathlib/RingTheory/PowerSeries/Expand.lean:33 | Native coefficient construction and x↦x^p substitution. |
| IsDiscreteValuationRing; IsFractionRing; IsAdicComplete | Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56; Mathlib/RingTheory/Localization/FractionRing.lean:52; Mathlib/RingTheory/AdicCompletion/Basic.lean:57 | Algebraic DVR/fraction-ring assumptions are separate from adic completeness. |
| WittVector.Isocrystal | Mathlib/RingTheory/WittVector/Isocrystal.lean:112 | A module with Frobenius-linear automorphism; no base curve or connection. |
| Complex.besselJ; Real.besselI | Mathlib/Analysis/SpecialFunctions/Bessel.lean:55; TauCeti/Analysis/SpecialFunctions/BesselI.lean:81 | Analytic scalar functions, not the missing geometric carriers. |
| TauCeti.FGComoduleCat | TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean:95 | Full subcategory of finitely generated right comodules; finite dimensional over a field. |
| TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor | TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138 | Hopf reconstruction as group-valued functors, with the explicit universe lift. |
| Lower/upper Herbrand quotient theorems | TauCeti/NumberTheory/LocalField/Herbrand/Quotient.lean:176; TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean:98 | Finite normal local-field towers; lower index changes by Herbrand, upper index stays fixed. |

### Source locator and expression audit

All seventeen readable cached works were consulted; the seven settled uncertified works were not requested again. The following table records 32 locator-check groups, counting a contiguous group of related numbered statements once. Mathematical limitations of the OCR and unpublished material are separated below. In addition to comparing the statements at these locators, eighteen prose passages were paired with their sources: coefficient and ULA definitions, the Satake proof route, the FG definition, invariant matching, localization, middle-image comparison, Frobenius-at-zero route, Weil parameters, HNY functoriality, quadric potential, hypergeometric construction, the signed-Dwork docstring, adjoint rigidity, the Newton-bound route, minimal-slope reconstruction, companion comparison and weights. They span eleven sources. A whole-text lexical screen covered all seventeen readable sources; its longest common prose run was eleven words, the standard mixed-characteristic-DVR hypothesis. No distinctive copied sentence, translated passage or clause-by-clause borrowed proof plan was identified. Formulae, standard hypotheses and group classification facts were not treated as copyrightable wording.

| Source and locator group | Source-line witness and result |
|---|---|
| XZ Definition2.8.2, Proposition2.8.3, Proposition2.8.5 | XZ lines 994–1029: all base-change morphisms between smooth schemes, graph comparison and shifts match. |
| XZ Theorem2.10.2 | XZ lines 1173–1181: repelling-to-attracting comparison and weak equivariance match. |
| XZ §§3.4.7–3.5.4 | XZ lines 1542–1581: sign-corrected symmetry, Tannakian equivalence and torus case; S03 is the package Check error. |
| XZ Proposition3.6.5, Theorem3.6.7, §3.6.8 | XZ lines 1650–1656,1688–1710: algebraic restriction and normalized IC subcategory support repairs F01/F02. |
| XZ Lemma4.1.4, Theorem4.1.5 | XZ lines 1827–1896: cleanness, eigenobject, ULA route and purity; does not by itself provide the zero-place calculation. |
| XZ Theorem4.2.1, Lemma4.2.3 | XZ lines 1994–2044: connection comparison, middle degree and specialization; finite-extension fibres must be included. |
| XZ Lemma4.2.6, §§4.2.7–4.2.8 | XZ lines 2057–2145: middle image, dense convergence and tensor summands; the source's affine/concentration argument is not valid unchanged. |
| XZ §4.4, Theorem4.4.4, Proposition4.4.5 | XZ lines 2294–2342: parameter scaling, log extension, Frobenius equation, local scalar; source convention error and S01 distinguished. |
| XZ Lemmas4.5.3,4.5.5 and Corollaries4.5.6–4.5.7 | XZ lines 2401–2408,2425–2490: tame contradiction, principal subgroup exclusion, companion and adjoint arguments; corrected exponents and stronger companion input necessary. |
| XZ Lemma5.1.1, Proposition5.1.3, Theorem5.1.4 | XZ lines 2523–2575: central ratio, radius, integral parameter and HNY functoriality. |
| XZ Theorem5.2.2 and §5.2.3 | XZ lines 2620–2645: rank/weight, trace sign and Gauss normalizer; source's zero-spectrum endpoint is a misprint. |
| XZ §5.3.4 and Proposition5.3.5 | XZ lines 2769–2802: even shift and quadric count; corrected constant independently tested. |
| XZ Proposition5.3.8, §§5.3.9–5.3.11 | XZ lines 2883–2911: factor4, characteristic-two comparison and convolution; zero spectrum and normalization need the stated corrections. |
| XZ Theorem5.4.2, Lemma5.4.3 | XZ lines 2932–3007: log specialization, all-prime classical cases, toric degree and slopes; raw sum is negative of the trace in the odd total-degree case. |
| XZ TheoremsA.3,A.5 and A.13 | XZ lines 3033–3059,3159–3258: maximal-slope reconstruction and signed modulus2^s. |
| XZ CorollaryA.7, PropositionA.9, LemmaA.12 | XZ lines 3076–3158: unit-root solution line, cyclic quotient and two-series comparison. Column quotient is dual to the solution line. |
| XZ equations(1.2.9.1)–(1.2.9.2) | XZ lines 297–336: printed raw-sum factors fail the F₂ instances; the package corrects them. |
| HNY Theorem1(2), §4.3 | HNY lines 1214–1269: tame principal unipotence requires nearby cycles/central sheaves and the weight calculation. Supports S01. |
| FG Corollary10 and Proposition11 | FG lines 1237–1271: D-index and repeated I₀ misprints; preceding boundary sequence fixes the latter. |
| Zhu Theorem8, Corollary9, Lemmas18–21 | Zhu lines 377–380,435–439,918–921,993–1035: closed-point localization, flatness and oper slice. S06 distinguishes general scheme points from characters. |
| BD §5.3 | BD lines 6178–6247: de Rham Satake and symmetry. This does not put Frobenius on de Rham objects. |
| Miy Theorem4.1.3, Remark4.1.9 | Miy lines 1187–1192,1294–1310: convergence, dense-open detection and trace sign. |
| GR §3, Proposition5.6, §6 | GR line 530 and lines 1302–1358: continuity, Weyl-prime condition, adjoint-type ramification result and definition. Supports S05; central lifting uses Herbrand, not unchanged lower numbering. |
| LT Theorem1.8 (=7.10) | LT lines 262–267: cominuscule geometric crystal/minuscule eigenobject identification, not an arbitrary flag variety. |
| PRW §3.3, Theorem3.2 | PRW lines 685–729: open quadric and rational potential; package changes notation and restricts the overlapping low-rank labels. |
| Car equation(4) | Car lines 35–37,47–76: characteristic-two identity; exact small-field evaluation confirms the OCR's intended formula. |
| Dw69 Theorems2–3 | Dw69 lines 394–418,527–542: ordinary coefficient congruences and periodic analytic limit. OCR corrupts some subscripts; XZ A.4–A.5 provides a readable restatement. |
| Spe80 Theorem(2.35) | Spe80 lines 535–539: eigenvalue theorem located, but its displayed valuation formula is absent from the extraction. Not fully certified from this text. |
| VL-est Proposition2.1 | VL-est lines 264–302: split reductive group, cuspidal eigenfunction and v(q_v)=1 bound; finite-order central-character application follows immediately. |
| DAd Theorem1.2.1 (=4.3.2) | DAd lines 65–83: compatible system, semisimplicity, finite coefficient extension and faithful common representation. |
| Tsu Theorem1.3 and Conjecture1.2 | Tsu lines 70–86: smooth connected curve, maximal quotient and unique specified lift. |
| Abe Theorem4.4.5; AC Proposition1.3.13 and Theorem4.1.3 | Abe lines 6506–6528: precise companion hypotheses; AC lines 817–830,2927–2932: complete c-affine frame condition and dual weight sign. These inputs are imported through the declared arithmetic-operations contract, not re-owned. |

The locator-share count uses explicit author-followed-by-locator introductions in the mathematical text, counting a grouped citation once and excluding the bibliography: XZ90, HNY8, FG7, Zhu5, Miy5, GR4, and one each for BD, LT, PRW, Car, Dw69, Spe80, VL-est, AC and DH35, total128. Bare bibliographical mentions, generic supplier names and repeated implicit references are not additional counted groups.

XZ's contents at lines 16–54 were compared with all twelve layers. The organisation is not a one-to-one same-scope run of that contents: Layer1 combines XZ §§2,3,4.1; Layer2 precedes Layer3 although XZ §4.3 follows §4.2; Layer5 moves generic ordinarity out of §5.4 before monodromy; Layer8 precedes Layer9 although XZ §5.3 follows §5.2; Layer10 isolates the appendix; Layer11 combines the remaining slopes and all-prime consequences. The dependencies forcing the mathematical order are §3.5→§4.1, §§4.2–4.3→§5.3, §§5.3,10.4→§10.5, and §§10.5,MS.4→§10.6→§11.4. The separate foundational suppliers and the FG, Zhu, Miy, GR, LT and PRW constructions give these layers different scopes from XZ's sections. No copied figure, exercise list, numerical table or independently licensable formalization was identified in Suggested.lean.

## Not verifiable

- AS89, Wan93, Wan04, Bal82, DH35, ESDE and KatzCC remain the seven settled uncertified sources. Their locators were retained; their unseen text was not certified, fetched again or added to a missing-reference request. The declared toric/scalar/slope contracts are not findings merely for this reason.
- Spe80's cached extraction omits the displayed valuation formula at Theorem(2.35). Dw69's extraction damages indices in Theorems2–3. The readable XZ restatements and independently computed examples support the uses recorded above, but do not certify every symbol in those scans.
- No Lean command was run. The supplied ten genuine elaborated signatures were inspected, with no source edit requiring fresh elaboration. The report does not claim a new build or proofs of any sorry.
- Numerical computations test finitely many cases. They do not prove the all-prime identities, all-extension eigenvalue statement, all coefficient congruences, higher-dimensional quadric boundary count or geometric comparison theorems. In particular the general toric and log-boundary theorems remain conditional on their declared suppliers.
- The source locator table certifies the listed passages, not all intervening proofs or every internal reference in those papers. The complete package was read, but this review is not a formal proof of its 65 planned targets. The unsupported proof inputs and false Checks actually witnessed are reported above.

## Source issues

- **Misprint** in FG at Corollary10, printed p.28 (FG line 1239): the source says the D-family index is 2n+1; it should be n+1, with D₄ handled separately; affects a stated result.
- **Misprint** in FG at Proposition11, equation(14.1), printed p.29 (FG lines 1267–1271): the source subtracts the zero-place invariant dimension twice; it should subtract the zero and infinity invariant dimensions; affects a stated result.
- **Error** in XZ at equation(1.2.9.1), printed p.6 (XZ lines 300–309): the source scales the characteristic-two raw rank-three sum by −q^−½; it should use the raw sum without that factor; affects a stated result.
- **Error** in XZ at equation(1.2.9.2), printed p.7 (XZ lines 324–336): the source uses −q^−½ and subtracts q^(n−1) in the raw convolution identity; it should give U_n−q with no prefactor; affects a stated result.
- **Gap** in XZ at §4.2.4, printed p.44 (XZ lines 2041–2044): the source tests coherent-module fibres only at displayed R-valued points; it should test after finite residue and coefficient extensions to cover every rigid point; affects the proof.
- **Error** in XZ at Lemma4.2.6(i), printed p.44 (XZ lines 2057–2071): the source treats the punctured quasi-minuscule chart as affine and its direct image as holonomic in one degree; it should use the middle image without that affine concentration; affects a stated result.
- **Error** in XZ at equation(4.4.3.1), printed p.50 (XZ lines 2323–2335): the source's matrix differential equation conflicts with its stated pullback-to-object Frobenius direction; it should use δC+AC=qCA(x^q), or consistently transform both direction and convention; affects a stated result.
- **Misprint** in XZ at proof of Lemma4.5.5, printed p.53 (XZ lines 2440–2441): the source indexes principal-SL₂ summands by exponents minus one; it should use Sym^(2e_i) for exponents e_i; affects the proof.
- **Gap** in XZ at proof of Corollary4.5.6, printed p.53 (XZ lines 2474–2477): the source infers isomorphism from a surjection between subgroups of one ambient group; it should compare neutral groups, representations and component groups, controlling the kernel; affects the proof.
- **Misprint** in XZ at §5.2.3, printed p.57 (XZ line 2639): the source gives 2n+1 zero-place eigenvalues for a rank-n object; it should give α,qα,…,q^(n−1)α; affects a stated result.
- **Error** in XZ at Proposition5.3.5(ii), printed p.59 (XZ lines 2776–2802): the source's toric correction is (q−1)q^(n−2); it should be q^(n−1)−q, giving 7 rather than 5 at n=4,q=2; affects a stated result.
- **Misprint** in XZ at proof of Proposition5.3.8(i), printed p.61 (XZ line 2890): the source puts zero in the normalized Frobenius spectrum; it should put one; affects the proof.
- **Error** in XZ at §5.3.9 and Corollary5.3.11(i), printed p.61 (XZ lines 2893–2907): the source omits the shift and half twist in normalized convolution; it should insert [1](1/2), giving trace factor −q^−½; affects a stated result.
- **Error** in XZ at proof of Lemma5.4.3, printed p.63 (XZ lines 2966–2975): the source calls the raw quadratic hypergeometric sum the Frobenius trace; it should be its negative under the normalization of Theorem5.2.2; affects the proof.
- **Error** in XZ at PropositionA.9 and its proof, printed p.66 (XZ lines 3105–3124): the source identifies the column cyclic quotient with the solution line d−ηdx; it should use the dual line d+ηdx; affects a stated result.
- **Gap** in XZ at the transition from PropositionA.9 to A.11, printed p.66 (XZ lines 3107–3138): the source compares underlying maximal-quotient connections before invoking Frobenius-compatible reconstruction; it should identify quotient multipliers q^n/f and verify compatibility of the comparison; affects the proof.

Source independence: 18 additional prose passages compared with 11 sources, plus the 32 locator groups above; lexical screening covered 17 sources. No distinctive shared expression found. Largest share XZ, 90 of 128 explicitly introduced locator groups; contents compared with XZ: independent, with dependency-forced ordering identified above.

## For the human reviewers

- BD is an unpublished manuscript, cited at packages/KloostermanSheavesAndBesselIsocrystals/README.md:2588 and used for de Rham Satake/localization. Its cached author copy was readable; this review checked original wording and locators, not a redistribution licence for the manuscript.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "18e1ae6d3ad6a1014715fe604c857ac50371329f", "job": "RT-KloostermanSheavesAndBesselIsocrystals~2a", "model": "gpt-6-astra", "worker": "chris-9"} -->
