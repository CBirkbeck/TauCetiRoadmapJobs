<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/943#issuecomment-6373862780 -->
Red team round 2 pass a (codex) of 5fe94ca

Verdict: needs_changes

1. **F01** (P2) Larger-universe abelian headlines are already statable

   **Location:** packages/SolidAnalyticRings/Suggested.lean:23–24, “Above universe zero the marked convergent-sequence carrier and its transport of §1.3 are also missing”; packages/SolidAnalyticRings/README.md:191–203.

   **Claim:** The general-universe abelian reflection/generator and ordinary derived reflection are omitted as unstatable. The README promises these on LightCondMod over lifted integers at every universe. Their statements do not require constructing a site-transport functor.

   **Witness:** Mathlib/Topology/Homeomorph/Lemmas.lean:273,36,110 transports the sequence topology; Mathlib/Topology/Category/LightProfinite/Basic.lean:56 bundles it. Mathlib/Condensed/Light/Module.lean:42,68 and Monoidal.lean:41,56 already provide the universe-polymorphic module, free and internal-Hom carriers.

   **Exact repair text:** Replace the universe-zero restriction on the two abelian headlines by: “For each universe u, use ℤ_u=ULift.{u} ℤ and C_u=LightProfinite.of (ULift.{u} LightProfinite.NatUnionInfty), with its transported topology. Define the marked inclusion, shift, null cokernel and solidity predicate in LightCondMod ℤ_u. State the abelian reflection and countable integer-product compact projective generator with filtered index universe u+1, and the ordinary derived reflection with an explicit HasDerivedCategory (LightCondMod ℤ_u) binder.” Generalize the five supporting definitions accordingly, retaining their real bodies. Replace the module-docstring exclusion by: “The abelian reflection, compact projective generator and ordinary derived reflection are stated for every u; their proofs require §1.3's universe transport. The enhanced monoidal comparisons still require the missing enhanced carriers.” Update README:81,191,201,203 to match. This generalizes the existing acceptance tests; it adds no Check theorem.

   The carrier requires only this simple definition on a pinned type (the other four constructions are the existing inclusion, mapped shift, cokernel and internal-Hom predicate):

   ```lean
   universe u

   def liftedSequence : LightProfinite.{u} := by
     letI : SecondCountableTopology
         (ULift.{u} LightProfinite.NatUnionInfty) :=
       Homeomorph.ulift.secondCountableTopology
     letI : TotallyDisconnectedSpace
         (ULift.{u} LightProfinite.NatUnionInfty) :=
       Homeomorph.ulift.symm.totallyDisconnectedSpace
     exact LightProfinite.of (ULift.{u} LightProfinite.NatUnionInfty)
   ```

   Compactness and Hausdorffness are supplied by Mathlib/Topology/Compactness/Compact.lean:1092 and Topology/Separation/Hausdorff.lean:382. Shift continuity is `continuous_uliftMap` in Topology/Constructions.lean:1379. The lifted commutative ring instance is Algebra/Ring/ULift.lean:111.

   **Retest:** At u=1, the lifted shift sends ↑0↦↑1, ↑1↦↑2 and ↑∞↦↑∞. Killing ↑∞ gives P_u(*)=⊕ℕℤ_u, and the retained generator has point value ∏ℕℤ_u. Thus the all-one vector still separates free and solid objects. At u=0, ULift.ringEquiv and Homeomorph.ulift recover the current carrier and sign. No transport equivalence or internal-projectivity proof must exist to state either headline. This is a pinned-source statability witness; no Lean command was run.

2. **F02** (P2) Ordinary closed solid tensor is omitted as unstatable

   **Location:** packages/SolidAnalyticRings/Suggested.lean:19–20, “the closed abelian solid tensor needs the solidification functor as constructed data”; packages/SolidAnalyticRings/README.md:191,201.

   **Claim:** The ordinary closed symmetric monoidal reflection headline is excluded, although every carrier in its existential statement exists at the pins. Constructing the reflector belongs in the theorem's conclusion, just as in the existing reflection acceptance test.

   **Witness:** Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean:46 defines MonoidalClosed; Braided/Basic.lean:366,530 defines SymmetricCategory and Functor.Braided. Mathlib/CategoryTheory/Adjunction/Basic.lean:138 already expresses a reflector by existential functor/adjunction data. The native full subcategory appears at Suggested.lean:122.

   **Exact repair text:** Add the following headline in Layer 1, and name it in README §1.5: “isLightSolid_closed_monoidal_reflection states that the light solid full subcategory admits a closed symmetric monoidal structure for which its left-adjoint reflection is symmetric monoidal.” Remove the ordinary closed-tensor exclusion from the module docstring; keep its separate enhanced-derived-tensor exclusion. Generalize this signature together with S01; the following already states the universe-zero case on the existing definitions:

   ```lean
   /-- The light solid full subcategory has a closed symmetric monoidal structure
   for which solidification is symmetric monoidal (RC Theorem 3.2.4(3), p.17). -/
   theorem isLightSolid_closed_monoidal_reflection :
       ∃ m : MonoidalCategory IsLightSolid.FullSubcategory,
         letI := m
         ∃ s : SymmetricCategory IsLightSolid.FullSubcategory,
           letI := s
           Nonempty (MonoidalClosed IsLightSolid.FullSubcategory) ∧
             ∃ L : LightCondAb ⥤ IsLightSolid.FullSubcategory,
               Nonempty (L ⊣ IsLightSolid.ι) ∧ Nonempty L.Braided := by
     sorry
   ```

   **Retest:** The target uses the actual IsLightSolid full subcategory and its inclusion, with no invented tensor or free predicate. For integer free objects of ranks 2 and 3 its tensor has rank 6; the empty factor gives 0, and reflection of ℤ is the tensor unit ℤ. A zero tensor cannot satisfy the strong unit comparison because ℤ≠0. No data is admitted: the monoidal structure, closedness and reflector are all existential conclusions. This is not supplied by the bare full-subcategory construction or a one-tactic application on the current definitions. The signature is a pinned-source statability witness, not an elaboration claim.

## Prior findings: repair verification

| Earlier finding | Status and repaired passage (current location) | Recomputed witness |
| --- | --- | --- |
| r1a F01: zero coefficients in two negative controls | Repaired. README:589: “For A=0 every term is 0 and every lower bound works.” README:621: “For A=0 every layer and tail is 0.” | For A=0 all homotopy groups vanish. For A=δ𝕊 the shifted generator has π₋ₙ=ℤ^ℕ, and the split tail has π₀=⊕_(n>d)ℤ≠0. Both nonvanishing claims now specify nonzero coefficients. |
| r1b F01: missing p-power null-family input | Repaired. README:627: “These are p-power targets without split finite free quotient stages.” README:629: “prove that (f,g)↦f⊞g is final for these profile colimits.” | Hℤ_p/p=H𝔽_p cannot satisfy §5.1. The new integer target gives (pʲ) modulo p² as (1,p,0,…); the constant-one family is excluded. At p=2, π₁K₁=𝔽₂ while its marked map is 0; at p=3 both degree-one groups are 0. For h=max, f=⌊j/2⌋,g=⌊k/2⌋ give 1≤2 at (1,2). |
| r1b F02: omitted local dependency | Repaired. README:405: “*Needs:* §2.2; §3.3; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:abstract.3; EnhancedDerivedSheaves E5:abstract.4.” | §3.3 uses §§3.1–3.2, preceding §3.4; no return edge exists. The gate reports zero problems. |
| r1b F03: undefined presentations/cutoffs and universe transport | Repaired. README:19: “one diagram of total size less than κ, including its arrows”; README:139: “For every universe u”; README:75 explicitly declares gap:light-measure-site-comparison. | At every u, finite quotient ranks of the reduced convergent sequence are 0,1,2; P_u(*)=⊕ℕℤ_u. C has size ℵ₀ and Cantor space has size 2^ℵ₀. Relation arrows ×2 and ×3 yield different cokernels 𝔽₂ and ℤ/3. The new gap has the same slug and needs in design/plan.json. |
| r1b F04: free finite-presentability universe | Repaired. Suggested.lean:123: “IsFinitelyPresentable.{1}”; README:201: “index categories whose objects and morphisms lie in Lean universe 1”. | The supplied elaborated type has no universe parameter. The second headline retains the explicit HasDerivedCategory LightCondAb binder. Mathlib/CategoryTheory/Presentable/Finite.lean:49,69 supplies the intended index convention. |

The report's statement that discharging the site-comparison supplier obligation is “not actionable in this package” is accepted: the obligation is now a declared contract, not a claimed existing theorem. It is not re-raised. The marked-fiber replacement avoids imposing injectivity of p on higher sphere stems. No defect introduced by these five repairs has been established.

## Verified sound

All 829 lines of packages/SolidAnalyticRings/README.md and all 136 lines of packages/SolidAnalyticRings/Suggested.lean were read. There are seven declarations (five definitions, two theorems) and 27 numbered targets. The README has no separately bold mathematical target labels; its numbered targets, API bullets and Checks are inventoried below. “README:n” and “Suggested.lean:n” below abbreviate those two package-relative paths. Computations are mathematical tests, not claims that the admitted proofs were run.

### Declarations and effective contexts

All declarations are in TauCetiRoadmap.SolidAnalyticRings, Layer 1, §1.5, in a noncomputable section. There are no section variables. The supplied elaborated signatures were compared individually with the actual bodies and README. No binder disappeared. S01 concerns the deliberately excluded larger-universe instances, not a false current type.

| Declaration; line | Effective variable/instance context | Computed instances and outputs | Result; change |
| --- | --- | --- | --- |
| natShift; 91 | Native universe-zero LightProfinite sequence; no section variables | 0↦1, 1↦2, ∞↦∞. Preimage of the complement of {0,…,r} omits {0,…,r−1}. Constant 0 fails to fix ∞. | Continuous marked shift; generalize under S01. |
| inftyPoint; 97 | Native PUnit and sequence, no hypotheses | The only point maps to ∞; composing with natShift still gives ∞. Marking 0 instead gives 1 after composition. | Correct; S01. |
| nullSeq; 101 | LightCondAb, actual free functor and cokernel | At *, quotient of ⊕_(ℕ∪∞)ℤ by ℤ[∞] is ⊕ℕℤ. Reducing a marked singleton gives 0. The unreduced object retains an extra ℤ. | Real body; S01. |
| nullShift; 105 | Endomorphism of this cokernel | [0]↦[1], [1]↦[2], [∞]=0↦0. On the dual finite-support basis, σ*e₁=e₀ and σ*e₀=0. | Correct contravariance; S01. |
| IsLightSolid; 113 | ObjectProperty LightCondAb; native closed monoidal structure | For ℤ, (1−σ*)(e₀+e₁)=e₁. For 0 the unique self-map is invertible. For topological ℝ, harmonic partial sums diverge, contradicting a null preimage of (1/(n+1)). | Genuine predicate; S01. |
| isLightSolid_reflective_and_generator; 119 | No hypotheses; filtered index universe explicitly 1 | G(*)=ℤ^ℕ; multiplication by 2 has zero kernel and cokernel 𝔽₂^ℕ. Reflection of 0,ℤ,ℝ gives 0,ℤ,0. Q=ℤ_p/δℤ_p has Q(*)=0 but [pⁿ]≠0 at C, so finite free measures cannot replace G. | Current statement matches RC 3.2.4(2),(12); not padding. S01 adds general-u coverage. |
| derivedLightSolid_isRightAdjoint; 129 | Explicit [HasDerivedCategory LightCondAb]; all n:ℤ | ℤ[1] has H⁻¹=ℤ, all other H=0, hence is local; ℝ[0] fails in H⁰ and reflects to 0; zero is local. | Correct ordinary shadow of RC 3.2.4(5),(6); not padding. S01. |

The one-tactic probe does not remove either theorem: no pinned reflection theorem for this null-test subcategory or its generator was found. The native full-subcategory inclusion alone supplies neither a left adjoint nor projectivity/finite presentability/separation. All five definitions are used by the retained headlines. There are no admitted data, examples, True placeholders, options, extra imports or API padding.

### Headline coverage

The headline families are discrete spectral embedding (§1.2); light abelian reflection, compact projective generation, closed symmetric monoidal reflection and enhanced derived reflection/tensor (§1.5); homotopy detection and completeness (§2.1); spectral reflection/free measures (§2.2); Hℤ comparison/detection (§2.3); compact spectral generator (§2.4); product tensor (§3.1); split-tower tensor (§3.3); balancing and dualizable scalar change (§3.4); countable interchange (§4.1); null families and all-degree naturality (§§5.3–5.4); uniformly bounded resolutions (§6.1); quotient-completion connectivity (§6.2); realization (§6.3); prime-power null families, completed embedding and tensor comparison (§6.4); completed scalar extension (§7.2); summability and discrete Huber-pair structures (§7.3); and integer measure/static-module comparison (§7.4).

The two current abelian headline signatures are sound. S01 identifies their missing general-universe versions; S02 identifies the separately omitted ordinary closed symmetric monoidal reflection. The remaining spectral and enhanced monoidal families are named in the module documentation with their absent carriers. Searches of the pins found ordinary light module sheaves and ordinary derived categories, not stable symmetric spectra, the light spectral hypersheaf category, its solid tensor, or a derived monoidal structure on the ordinary LightCondAb derived category. Prime spectra and spectral-sequence objects are different carriers. Neither a proper-profile predicate nor a free proposition can stand in for those missing objects.

### Conventions and definitions

| Statement; README line | Computed instances and values | Result; change |
| --- | --- | --- |
| Small light site and covers; 17 | ∅ has no points and its stable sheaf value is 0; a two-point test has value X(*)². Finite free ranks 2 and 3 tensor to 6. An infinite discrete ℕ is not compact, hence not a light test. | Assumptions retained; none. |
| Cutoff and marked presentation; 19 | C has cardinal ℵ₀; Cantor space has cardinal 2^ℵ₀. κ=ℵ₀ excludes C; κ>2^ℵ₀ includes both. Two relation diagrams ×2 and ×3 give cokernels ℤ/2 and ℤ/3 despite identical vertices. | Size and arrows discriminate; gap remains conditional. |
| Left modules/right endomorphisms; 21 | e₁₂e₂₁=e₁₁ but e₂₁e₁₂=e₂₂; (1,0)e₁₂e₂₁=(1,0), whereas (1,0)e₂₂=0. | Noncommutative order consistent with supplier; none. |
| Degree and sign; 23 | H(ℤ in cochain degree 2) has π₋₂=ℤ; [1] moves it to π₋₁. Two degree-one factors swap by −1; two degree-zero factors by +1. | Same convention in StableHomotopyKTheory §5.16 and EnhancedDerivedSheaves §0.3. |
| Sphere versus integer/animated; 25 | π₁𝕊=ℤ/2, π₁Hℤ=0. H_i(BΣ₂;𝔽₂)=𝔽₂ for all i≥0, whereas animated 𝔽₂[x] has no positive π. | Neither identification is made; none. |
| Marked shift; 27 | (1−σ*)e₁=e₁−e₀; (1−σ*)(e₀+e₁)=e₁. Opposite shift gives e₁−e₂. | All summability signs agree; none. |
| Product versus discrete product; 29 | e_n→0 coordinatewise in ∏ℕℤ, while e_n is never eventually 0 in its discrete realization. Thus it defines a C-section only in the former. | Comparison arrow has correct direction; none. |
| Finite free/spherical polynomial convention; 31 | Stages r=0,1,2 have ranks 0,1,2; t²=0 at stage 2. For the constant section, s(t·1)=0 and t·s(1)=t≠0. Free commutative spectral algebra would retain symmetric-group homotopy. | No A-linearity or free-E∞ identification inferred; none. |
| Scalar quotients and marked fibers; 33 | a=1 gives quotient 0 and fiber A; a=0 gives quotient A⊕ΣA. For p on HF_p, cofiber has two copies in degrees 0,1 and transition diag(1,0); its limit is HF_p. | Coherent module cofibers, not underived quotients; none. |
| Profile direction; 33 | At exponents 3≥2≥0, transition multipliers t,t² compose to t³. Natural subtraction occurs only under f≥g, so no truncated-subtraction error. | Correct arrows; none. |
| Completed prime unit; 33 | At p=2,3 the unit point group is ℤ₂,ℤ₃; the ambient sphere has ℤ. The map sends 1↦1 and is not an isomorphism. | Completed codomain is necessary and retained; none. |

### Numbered targets

| Target; README line | Instances and computed sides | Result; change |
| --- | --- | --- |
| 1.1; 89 | Empty test/free object: 0=0; two-point free tensor three-point free: 𝕊⁶=𝕊⁶. At C and *, free π₀=⊕_Cℤ, not ∏_Cℤ. | Free/evaluation and tensor maps agree; none. |
| 1.2; 115 | δ0(*)=0; X=𝕊⊕Σ𝕊 has π₀=ℤ, π₁=ℤ/2⊕ℤ before/after δ. Limit of δH(ℤ/pʳ) admits id:ℤ_p→ℤ_p, which the discrete Hℤ_p sheaf does not. | Unit/tensor preserved, arbitrary limits not asserted; none. |
| 1.3; 139 | Reduced finite stages at n=0,1,2 have ranks 0,1,2 in each u; the reduced point group is ⊕ℕℤ_u. The marked splitting composes to 1 on ℤ_u; a constant mark at 0 fails the shift square. | Universe target and its local-lifting formulation precise; S01 concerns its acceptance use. |
| 1.4; 167 | For M=0 both internal and external tests are zero. For δHℤ, finite tail sums invert the difference. For N, point π₀ is direct sum while reflected π₀ is product. | Equivalent tests via tensor–Hom; none. |
| 1.5; 191 | Free measures at ∅,*,2,C give 0,ℤ,ℤ²,ℤ×ℤ^ℕ. (ℤ/2)⊗ᴸ■G has only π₀=𝔽₂^ℕ; (ℤ/2)⊗ᴸ■(ℤ/2) has π₀=π₁=𝔽₂. | Flat generator distinguished; signatures need S01 and S02. |
| 2.1; 241 | ΣHℤ has only π₁=ℤ; τ_≤0 kills it and τ_[1,1] retains it. Zero has every bound. Square-zero 𝕊⊕Σ𝕊 has π₁=ℤ/2⊕ℤ despite π₀=ℤ. | Homotopy and algebra distinctions hold; none. |
| 2.2; 265 | L■0=0, L■δ𝕊=δ𝕊. Free reduced C stages have ranks n and limit ∏ℕδ𝕊. ΣᵇA⊗_AΣᶜA=Σ^(b+c)A. | Units, connectivity and natural free projections agree; none. |
| 2.3; 291 | Over Hℤ at p=2,3, HF_p⊗HF_p has π₀=π₁=𝔽_p. Bottom π_b of Σᵇ𝕊→ΣᵇHℤ is 1:ℤ→ℤ. | Relative tensor and bounded-below detection consistent; none. |
| 2.4; 307 | G(*) has π₀=ℤ^ℕ and π₁=(ℤ/2)^ℕ; A=0 gives G_A=0 and the zero module category. Matrix order gives e₁₁ versus e₂₂. | Zero case and handedness correct; none. |
| 3.1; 343 | Empty I: 0→0. Ranks 2,3: six spheres, with coordinate (1,2) taking its basis tensor to 1 and the others to 0. | Canonical map specified; none. |
| 3.2; 359 | Growing ranks 1,2,3 have successive rank-one kernels; 1+n=n+1 at stage n. The zero tower has limit 0. A section of ×2 would require 2b=1 in ℤ. | Splitting is a real restriction; none. |
| 3.3; 385 | Growing tower stage (1,2) has rank 2·3=6. For any (m,n), a diagonal index r≥max(m,n) maps down to it. Constant sphere towers give sphere tensor sphere=sphere. | Initial inverse reindexing direction correct; none. |
| 3.4; 401 | For A=𝕊[t], absolute π₀ is ℤ[t₁,t₂], balanced π₀ is ℤ[t] with t₁,t₂↦t. Rational extension of ℤ^ℕ has a common denominator, excluding (2⁻ⁿ) in ℚ^ℕ. | Dualizability is needed for limit exchange; repaired §3.3 edge retained. |
| 4.1; 427 | K=∅ gives 0=0; K=* gives identity. Merely filtered J=ℕ with F(n,k)=Hℤ for k<n gives ⊕ℕℤ→∏ℕℤ, missing the all-one vector. | ω₁-filtered hypothesis discriminates; declared gap. |
| 4.2; 443 | Independent factorial stages contain (1/(j+1)!), while one denominator cannot. Split projection tower ℤ^(n+1) has limit ℤ^ℕ and lim¹=0. | Countable AB6 used separately from filtered interchange; declared gap. |
| 5.1; 469 | A=𝕊[[t]] has B₀=0,B₁=𝕊,B₂=𝕊²; J_r≃A marked by tʳ. For A=0 all terms vanish; Moore quotient at p=2 has π₀=𝔽₂ and is not finite free. | Correct general split datum; none. |
| 5.2; 497 | f(j)=j has r elements below r; f=0 has infinitely many below 1. min(id,2id)=id. Common target for all max(j−k,0) would be 0, which is improper. | Filtered but not ω₁-filtered; none. |
| 5.3; 533 | Singleton blocks with (tʲ) retain exactly r entries mod tʳ; (1) retains infinitely many. Two nonempty singleton blocks give A²; one infinite block gives A^ℕ. | Decay is across blocks; no within-block decay imposed. |
| 5.4; 549 | Negative k gives 0=0; k=1 over formal spheres gives (ℤ/2)[[t]] with survivors η,ηt mod t². Duplication gives weights 1,1,t,t; fold gives 1+t. | All degrees and finite-reduction naturality agree; none. |
| 6.1; 577 | Constant resolutions of 0,ΣᵇG_A and ⊕_IΣᵇG_A realize to themselves; π_k=0 for k<b. For sphere coefficients Σ⁻ⁿG has π₋ₙ=ℤ^ℕ; zero coefficients give 0. | Uniform bound explicit; old Check fixed. |
| 6.2; 593 | Scalars 1,0 give 0 and M⊕ΣM. For Hℤ/2ʳ, lim=ℤ₂ and lim¹=0; the separate ideal tower has lim=0,lim¹=ℤ₂/ℤ. | Bottom quotient maps are onto; sharp b bound survives. |
| 6.3; 609 | A normalized degree n layer shifts by n, giving bound b+n. First omitted degree d+1 gives b+d+1. With N_n=Σ⁻ⁿ𝕊 every layer has π₀=ℤ, hence nonzero tail in π₀. | Uniformity necessary; zero-algebra exception fixed. |
| 6.4; 625–633 | At p=2,3 completed unit π₀=ℤ_p. For HF_p the quotient transition is diag(1,0), limit HF_p. Singleton integer blocks give p-adic null sequences. Marked spectral degree-one fibers at p=2 yield ⊕ℕ𝔽₂ in the profile colimit; at p=3 yield 0. | Integer/spectral inputs now explicit. Product and two-index inputs precede closure. |
| 7.1; 679 | Full structure: L(A)=A. Zero structure: L(A)=0, with invertible unit iff A=0. ⊕ℕHℤ is not perfect. | Both directions and wrong subcategory tested; none. |
| 7.2; 705 | Full structures over Hℤ→HF₂ give derived pushout with π₀=π₁=𝔽₂ on both paths. A non-pushout terminal HF₂ also gives HF₂ on both paths. Target zero structure gives 0 on both paths. | Transitivity, not unassumed pushout/kernel generation; none. |
| 7.3; 735–739 | F=∅,{0},{1} imposes no extra test. For ε²=0, inverse is 1+εσ*. With f=1/p acting on topological ℚ_p, b_n=pⁿ gives b_n−fb_(n+1)=0 and b₀=1. | Noncompleted/nonreduced cases separated; none. |
| 7.4; 777 | HB for topological ℚ_p has π₀=B and other π=0, but pⁿ at C is absent from δB(*). For B=𝔽₂, free product generator has π₀=𝔽₂^ℕ and π₁=0, while B⊗ᴸ_ℤB has π₁=𝔽₂. | Static/discrete and relative/underived distinctions correct; site comparison conditional. |

### API statement audit

Every API bullet has a row. These laws remain README content; none needs a separate admitted Lean declaration. S01 is the only requested change to this inventory.

| README line; law | Computed instance, including both sides of comparisons | Result/change |
| --- | --- | --- |
| 97; free evaluation | T=∅: Map(0,M)=0=M(∅); T=2: Map(𝕊²,M)=M(*)²=M(2). | Consistent; none. |
| 99; coherent detection | Identity and zero on δHℤ differ at * by 1 versus 0; on zero they coincide at every test. | Detects a nonzero map; none. |
| 101; hyperdescent | Identity hypercover of * is constant; Tot of its constant value X is X, including X=0. | Correct direction; none. |
| 103; free tensor | ∅×T=∅ gives 0=0; 2×3 has six points and tensor rank 6. | Consistent; none. |
| 123; discrete functor | δ(0:X→Y)=0; δ(1_X)=1; δ(ΣHℤ) has π₁=ℤ=π₀Hℤ. | Consistent; none. |
| 125; discrete unit | At X=H𝔽₂, π₀ on both sides is 𝔽₂ and 1↦1; at 0 both groups vanish. | Consistent; none. |
| 127; discrete coherences | Unit gives 𝕊⊗X=X; on two suspended generators both symmetry paths multiply by −1. | Sign retained; none. |
| 147; pointed-map functor | Identity of C gives identity on ⊕ℕℤ; collapsing to marked singleton gives zero. Two shifts send [0] to [2]. | Functorial directions correct; none. |
| 149; null-Hom fiber | For δHℤ, evaluation at ∞ maps eventually constant sequences to their eventual value; its kernel is ⊕ℕℤ=Hom(N,δHℤ). | Reduced condition essential; none. |
| 151; shift coefficients | e₁ has coefficients (0,1,0,…); precomposition yields (1,0,0,…). | Correct; none. |
| 153; lifting/projectivity | Lifted finite quotient reduced ranks 0,1,2; quotient by ×2 admits coefficient lifts mod 2 locally. Successive ULifts identify ↑↑n with ↑n, fixing ∞ and the shift. | Statement is internal lifting, not evaluation-surjectivity; S01 for acceptance coverage. |
| 175; orthogonality | For M=0 all tests vanish; for δHℤ, invertible difference has zero cofiber-Hom. For ℝ harmonic null sequence yields a nonzero obstruction. | Both formulations exclude same wrong object; none. |
| 177; invariance/fullness | Identity equivalence preserves the ℤ tail-sum inverse; maps ℤ→ℤ in either full category are multiplication by the same integer. | Consistent; none. |
| 179; discrete solidity | For finite-support b=e₂ the inverse is e₀+e₁+e₂; applying 1−σ* gives e₂. Suspending preserves the computation in shifted degree. | No boundedness imposed on X; none. |
| 199; abelian closure | In 0→ℤ —×2→ ℤ→ℤ/2→0 all terms are solid. Product ℤ² is solid; Hom(0,ℤ)=0 is solid. | Closure laws compatible; none. |
| 201; reflection/tensor | Lℤ=ℤ, Lℝ=0; unit tensor ℤ⊗■ℤ/2=ℤ/2. Countable product G surjects onto ∏𝔽₂ by coordinatewise reduction. | Nontrivial reflection/generation; S01. |
| 203; derived localization | H⁻¹(ℤ[1])=ℤ; H⁰(ℝ[0])=ℝ. First belongs to the full subcategory, second does not; reflection of second is 0. | Characterization agrees; S01. |
| 205; derived monoidal comparison | Two-term resolution [ℤ→²ℤ] tensored with ℤ/2 has zero differential and two 𝔽₂ homology groups. Both enhanced descriptions give them. | Derived structure not replaced by abelian tensor; none. |
| 207; measures/generator | S=2 gives ℤ²; C gives ℤ×ℤ^ℕ. Q=ℤ_p/δℤ_p has Q(*)=0 and [pⁿ]≠0 at C. | Infinite S needed; none. |
| 209; product tensor | I=∅ gives 0; sizes 2,3 give ℤ⁶; ℕ² gives ∏_(ℕ²)ℤ and zero higher Tor. | Countable hypotheses retained; none. |
| 211; flatness | Multiplication ×2 on ℤ^ℕ has kernel 0, so Tor₁(𝔽₂,G)=0 and π₀=𝔽₂^ℕ. ×2 on 𝔽₂ has kernel 𝔽₂. | Generator flat; arbitrary objects not assumed flat. |
| 249; truncation | τ_≤0ΣHℤ=0 and τ_≤1ΣHℤ=ΣHℤ; π₁ respectively 0,ℤ. | Correct vanishing range; none. |
| 251; heart | H𝔽₃ has π₀=𝔽₃, π₁=π₋₁=0. | Correct; none. |
| 253; suspension | π₁ΣHℤ=π₀Hℤ=ℤ; bound 0 becomes 1. | Correct; none. |
| 273; universal reflection | For C=δHℤ and solid M the unit is identity, so both maps are Map(δHℤ,M); for C=0 both are 0. | Correct direction; none. |
| 275; idempotence | At 0 and δ𝕊 both successive units are respectively 1_0 and 1_𝕊. | Consistent; none. |
| 277; closed tensor | C=unit gives Hom(D,M)=Hom(unit,Hom(D,M)); D=0 gives 0 on both sides. | Correct variance; none. |
| 279; natural measures | Collapse 2→* gives ℤ²→ℤ, (a,b)↦a+b, and agrees with summing the two free Dirac elements. | Not a reversed pullback; none. |
| 315; generator unit | [n] maps to the vector with 1 at n and 0 elsewhere in the reduced-coordinate product; finite projections recover that vector. | Marked unit fixed; none. |
| 317; all π of G | k<0:0; k=0:ℤ^ℕ; k=1:(ℤ/2)^ℕ. | Includes higher sphere homotopy; none. |
| 319; module adjunction | A=unit gives Map(G,M) on both sides; A=0 allows only M=0, giving zero on both sides. | No nontriviality assumption needed. |
| 367; split data | Projection 𝕊²→𝕊 with section x↦(x,0) has composite 1; zero section instead gives 0≠1. | Laws determine correct data; none. |
| 369; equal tower maps | Identity stage maps induce identity on all finite coordinates of ∏ℕ𝕊; zero stage maps induce zero. | Coherent equality required; none. |
| 371; decomposition | Stage n=2 has rank 3=1+1+1; inverse limit has one initial factor and one factor per kernel. | Index starts at r=0; none. |
| 373; different sections | Sections x↦(x,0), x↦(x,x) both split first projection; change of coordinates (x,y)↦(x,y+x) has inverse (x,z)↦(x,z−x). | Equivalent presentations, not equal chosen splittings. |
| 477; equivalent datum | Identity on the t-adic datum induces identity on each rank-r quotient and hence on ℤ[[t]] in π₀. | Unit and tower retained; none. |
| 479; marked ideals | J₀=A with multiplier 1; J₃→J₁ has multiplier t² and its composite to A is t³. | Abstract J_r≃A does not erase filtration; none. |
| 481; completion unit | A=𝕊[[t]] maps to its compatible truncations; coefficient of t^m stabilizes once r>m. Zero module gives 0→0. | Projection compatibility; none. |
| 483; reindexing | r and 2r towers both retain every coefficient eventually; at t³, stages r≥4 and r≥2 respectively recover the same coefficient. | Initial inverse reindexing; none. |
| 485; module cofiber | a=1 gives M⊗_A0=0; a=0 gives M⊗_A(A⊕ΣA)=M⊕ΣM. | No quotient-algebra assumption; none. |
| 507; profile definition | id has sublevel sizes r; zero has infinite sublevel at 1. Altering f(0) to 0 changes any finite sublevel by at most one point. | Discriminating; none. |
| 509; filteredness | min(id,2id)=id; inf_k max(j−k,0)=0 is not proper. | No ω₁-filteredness used; none. |
| 511; transitions | Exponents 3→2→0 multiply by t then t², equal to direct t³; exponent 0 difference gives 1. | No division/junk subtraction; none. |
| 513; block composition | Identity support {j}; zero support ∅; two duplications have support {4j,4j+1,4j+2,4j+3}. | Finite unions suffice; none. |
| 515; compact blocks | Empty I gives 0; singleton I gives A; I=ℕ gives A⊗G. A map putting one block in output 2 has support {2}. | Uses §3.1 for split A; no claim for arbitrary A. |
| 639; p-complete evaluation | X=HF₂,HF₃ gives same spectrum after e_p and point evaluation; zero gives 0. | Completed unit is identity on X. |
| 641; completed smash | X=Y=completed sphere gives A_p on the solid side, completed sphere smash on the ordinary side; π₀=ℤ_p on both. | Unit agrees; none. |
| 643; integer tensor | For HF_p over Hℤ_p, both completed relative calculations have π₀=π₁=𝔽_p; for zero factor both vanish. | Retains relative base. |
| 645; orthogonality | For Hℤ[1/p], every pʳ is invertible, quotients and completion are 0. For HF_p, completion is HF_p. | Both positive and negative models; none. |
| 687; analytic data | Full subcategory has L=id, zero subcategory L=0; their values on Hℤ differ by Hℤ versus 0. | Structure not fixed by coefficient alone. |
| 689; marked reflector | For D=all, the unit at ℤ is 1; multiplication by 2 is not an invertible unit and cannot identify the same marked reflection. | Unit marking discriminates. |
| 691; morphisms | Restriction along identities is identity. A target zero complete category restricts to 0 in every source complete category. | Identities/composites allowed. |
| 693; completedness iff | D=all gives A→A; D=0 gives A→0, invertible exactly for A=0. | Both directions tested. |
| 713; completed unit | Full D: unit A; zero D: unit 0, including A=Hℤ. | Does not replace L_DA by A. |
| 715; scalar adjunction | Identity scalar/structure yields Map(M,N) on both sides; zero M gives contractible maps on both. | Correct restriction codomain. |
| 717; transitivity | A→A→A gives M on both sides; final reflection zero gives 0 on both paths. | Unit coherence retained. |
| 719; commuting square | A=A′=B=Hℤ, B′=HF₂ gives HF₂ along both paths for M=A; ring pushout would instead be Hℤ. | No pushout hypothesis needed. |
| 745; scalar tests | Discrete f on e₁ gives inverse e₁+fe₀; f=1/p on topological ℚ_p kills the nonzero null vector pⁿ. | Test has genuine negative instance. |
| 747; free complete object | F=∅ gives L_FC=C and identical mapping object; C=0 gives zero free object. | Universal map fixed. |
| 749; larger F | F=∅ versus {T}, T acting as 1/p on ℚ_p: object is in the first category and excluded from the second. | Inclusion direction correct. |
| 751; coefficient map | ℤ[T]→ℚ_p, T↦1/p sends the sequence test to pⁿ−p⁻¹pⁿ⁺¹=0; identity map preserves the exact test. | Compatibility is about tests, not arbitrary algebra maps. |
| 753; nilpotent inverse | ε²=0 in characteristic 2: (1−εσ*)(1+εσ*)=1−ε²(σ*)²=1. For f=0,d=1 inverse is 1. | Small primes/nonreduced case sound. |
| 755; generators | R⁺=ℤ needs no ℤ-algebra generators; R⁺=ℤ[T] uses {T}. In R[T] with ε²=0, εT is integral and its added test is already invertible. | Integral closure retained. |

### All 108 README Checks

Each row is one bullet Check; combined examples within a bullet are included in its computed values. All 108 agree on these instances. The table is not an independent proof of the general headlines.

| README line | Values computed | Result |
| --- | --- | --- |
| 107 | M(∅)=0; a nonzero constant presheaf would give X≠0. | Wrong presheaf excluded. |
| 109 | M(*⊔*)=M(*)²; 𝕊[*⊔*]=𝕊². | Agrees. |
| 111 | At *, π₀free(C)=⊕_Cℤ; at 2, its square. All-one vector has infinite support. | Free/product distinction. |
| 131 | δ0(*)=0, unit=1_0. | Agrees. |
| 133 | π₀(𝕊⊕Σ𝕊)=ℤ; π₁=ℤ/2⊕ℤ. | Both summands retained. |
| 135 | lim C(T,ℤ/pʳ)=C(T,ℤ_p); id at T=ℤ_p has infinite image. Locally constant maps from compact T to a discrete group have finite image. | δ does not preserve this limit. |
| 157 | cofib(1:𝕊→𝕊)=0; unreduced singleton gives 𝕊. | Reduced object distinguished. |
| 159 | σ*e₁=e₀; difference=e₁−e₀; difference of e₀+e₁=e₁. | Sign correct. |
| 161 | Right shift sends e₁ to e₂; difference=e₁−e₂, different from e₁−e₀. | Wrong shift excluded. |
| 163 | Finite sets have sizes 1,2,3; reduced ranks 0,1,2. Direct-sum point group excludes all-one vector at every u. | Universe repair valid. |
| 183 | Hom(N,0)=0; unique endomorphism of 0 is invertible. | Zero solid. |
| 185 | δ𝕊: π₀=ℤ,π₁=ℤ/2; Hℤ: π₀=ℤ,π₁=0. | Sphere not replaced. |
| 187 | N(*) has π₀=⊕ℕℤ; G(*) has π₀=∏ℕℤ containing (1,1,…). | N not solid. |
| 215 | 0↦1,1↦2,∞↦∞; constant mark 0 would move to 1. | Mark compatibility. |
| 217 | Hom(P,ℤ)(*)=⊕ℕℤ; (1−σ*)(e₀+e₁)=e₁; opposite difference of e₁ is e₁−e₂. | Tail inverse correct. |
| 219 | Measures of ∅,*,2,C: 0,ℤ,ℤ²,ℤ×ℤ^ℕ; reduced product contains all-one vector. | Free versus solid. |
| 221 | Product tensor ranks: 2·3=6; empty factor gives 0; ℕ×ℕ gives integer product with no higher Tor. | Agrees. |
| 223 | Tor₁(𝔽₂,ℤ^ℕ)=ker(×2)=0; π₀=𝔽₂^ℕ. B=0 gives 0. Tor₁(𝔽₂,𝔽₂)=𝔽₂. | Flatness distinguished. |
| 225 | ℤ[1]: H⁻¹=ℤ. Harmonic b has partial sums tending to ∞, but a null solution gives x₀−x_(N+1)→x₀. | ℝ fails solidity; source separately proves reflection 0. |
| 227 | Q(*)=ℤ_p/ℤ_p=0; pⁿ is not locally constant near ∞, and cannot become locally constant after a surjective compact cover. Its quotient section is nonzero. | Finite measures not generators. |
| 257 | ΣHℤ has π₁=ℤ,π₀=0; cochain degree 2 has π₋₂=ℤ. | Grading correct. |
| 259 | Every π_k0=0. | All bounds hold. |
| 261 | Square-zero sphere extension has π₀=ℤ and π₁=ℤ/2⊕ℤ; square of the added ideal is 0. | Not determined by heart. |
| 283 | L■0=0; 0⊗■M=0. | Agrees. |
| 285 | L■δ𝕊=δ𝕊; δ𝕊⊗■M=M. | Unit agrees. |
| 287 | Continuous maps ℤ^ℕ→𝔽₂ depend on finitely many coordinates, giving ⊕ℕ𝔽₂; abstract dual of 𝔽₂^ℕ has cardinal 2^(2^ℵ₀). | Internal Hom not abstract Hom. |
| 299 | Hℤ corresponds to ℤ[0]; π₀=H⁰=ℤ. | Agrees. |
| 301 | Tensor [ℤ→ᵖℤ] with 𝔽_p gives zero differential; homology 𝔽_p in degrees 0,1, zero elsewhere, for p=2,3. | Derived relative tensor retained. |
| 303 | H_i(BΣ₂;𝔽₂)=𝔽₂ for i≥0; positive homotopy of animated 𝔽₂[x] is 0. | Commutative theories differ. |
| 323 | π₀G(*)=ℤ^ℕ; all-one has every coordinate 1. | Agrees. |
| 325 | For each fixed coordinate k, (e_n)_k=0 for n>k; e_n itself is always nonzero. | Product versus discrete topology. |
| 327 | A=0 gives G_A=0; the unital module law forces every module to be 0. | Zero-category generation valid. |
| 329 | (1,0)e₁₂=(0,1), then e₂₁ gives (1,0); (1,0)e₂₂=0. | Right action. |
| 351 | Empty stable product=0; 0⊗G=0; ∅×J=∅. | Both sides 0. |
| 353 | Six basis pairs; projection (1,2) gives 1 on its pair and 0 on five others. | Map fixed, not just rank. |
| 355 | Suspended exchange sign (−1)^(1·1)=−1; unsuspended sign=+1. | Agrees. |
| 377 | Zero tower limit=0; identity sphere tower has kernels 0 and limit 𝕊. | Boundaries agree. |
| 379 | Stage ranks 1,2,3; successive rank differences 1,1. | Decomposition indices agree. |
| 381 | A section of ×2 would have degree b with 2b=1, impossible in ℤ. | Nonexample valid. |
| 393 | Constant sphere towers: 𝕊⊗■𝕊=𝕊 and double limit=𝕊. | Agrees. |
| 395 | At (m,n)=(1,2), product rank=(1+1)(2+1)=6. | Independent indices retained. |
| 397 | t·1=0 in A/(t), so s(t·1)=0, but t·s(1)=t in A. | Section not A-linear. |
| 409 | A=𝕊 reduces both sides to X⊗■Y; X=0 gives 0. | Agrees. |
| 411 | Absolute π₀=ℤ[t₁,t₂]; balanced π₀=ℤ[t], both variables sent to t. | Scalar action fixed. |
| 413 | Every element of ℤ^ℕ⊗ℚ has one denominator d; valuations of 2⁻ⁿ are unbounded below. | Limit exchange fails without hypothesis. |
| 435 | K=∅:0=0; J=*: both sides lim_KF. | Agrees. |
| 437 | At stage n, π₀=ℤⁿ; colimit=⊕ℕℤ. Coordinate colimits then product give ℤ^ℕ. All-one absent only on left. | Ordinary filteredness insufficient. |
| 439 | K=* gives identity colim_JF→colim_JF. | Boundary case; kept only as Check. |
| 451 | Choose stage n_j=j+1 to include 1/(j+1)!; no fixed factorial denominator contains every coordinate. | Independent bounds necessary. |
| 453 | All-zero family gives product and colimit 0; empty abelian product=0. | Agrees. |
| 455 | limℤ^(n+1)=ℤ^ℕ; truncate/extend-by-zero witnesses each projection onto; lim¹=0. | Agrees. |
| 489 | Finite t-adic stage basis 1,…,t^(r−1); limit has one copy of each sphere stem per coefficient. cofib(t) has the constant sphere, with no surviving top-degree error in the limit. | Example satisfies split datum. |
| 491 | Over the zero algebra, quotient, marked fiber and completion are all 0. | Admitted correctly. |
| 493 | π₀(𝕊/p)=ℤ/p, which cannot be ℤ^n for any n. | Prime tower excluded from split datum. |
| 519 | id profile: sublevel at r has r entries; zero profile: sublevel at 1 is infinite. | Definition discriminates. |
| 521 | Empty block product in a stable category=0; product over all empty blocks is 0. | Agrees. |
| 523 | At coordinate j, max(j−k,0)=0 once k≥j; a common target must be identically 0. | Not ω₁-filtered. |
| 525 | Identity support {j}; zero support ∅; induced zero maps on quotients stay 0. | Correct supports. |
| 527 | Composed duplication yields {4j,4j+1,4j+2,4j+3}, cardinal 4. | Composition finite. |
| 529 | t^(j+1)x in the smaller ideal is the same element in t^jA; t^j is not in t^(j+1)A for formal spheres. | Arrow direction correct. |
| 541 | (tʲ) modulo tʳ has r survivors; (1) has infinitely many. | Correct nullness criterion. |
| 543 | Choosing f(0)=f(1)=0 gives both copies of A; all later empty blocks contribute 0. | A² on both sides. |
| 545 | f(0)=0 allows all of A^ℕ in the one block; other blocks vanish. | No within-block decay. |
| 557 | π_kJ_r=0 for k<0; products and the displayed completion have the same vanishing. | Connective case. |
| 559 | π₁A=(ℤ/2)[[t]]; modulo t² only η and ηt remain. | Sphere class retained. |
| 561 | Duplicating terms 1,t gives output weights 1,1,t,t at 0,1,2,3 modulo t². | Naturality agrees. |
| 563 | Sum tʲ=(1−t)⁻¹; modulo t² it is 1+t and (1−t)(1+t)=1−t²=1. Infinitely many nonzero terms exclude the uncompleted direct sum. | Denominator is a unit. |
| 585 | Zero simplicial resolution realizes to 0. | Agrees. |
| 587 | Constant ΣᵇG_A or any coproduct of these realizes to itself; π_k=0 for k<b, for all index cardinalities allowed by the universe. | Uniform bound retained. |
| 589 | At A=δ𝕊, π₋ₙΣ⁻ⁿG=ℤ^ℕ≠0; at A=0 all groups are 0. | Prior failure repaired. |
| 601 | cofib(1_M)=0 for every stage, so limit=0. | Agrees. |
| 603 | cofib(0_M)=M⊕ΣM; for M=Hℤ, π₀=π₁=ℤ. | Derived quotient distinguished. |
| 605 | Quotient tower ℤ/2ʳ has lim=ℤ₂, lim¹=0; ideal tower 2ʳℤ has lim=0, lim¹=ℤ₂/ℤ. | Tower distinction correct. |
| 617 | Realization of constant ΛM is ΛM, and completion of constant realization is ΛM; map=identity. | Agrees. |
| 619 | Normalized degree 1 contributes ΣM: first degree b becomes b+1; completion preserves that lower bound. | Shift correct. |
| 621 | N_n=Σ⁻ⁿ𝕊 has suspended layer 𝕊; tail π₀=⊕_(n>d)ℤ≠0. A=0 gives tail 0. | Prior failure repaired. |
| 649 | p=2 completed unit π₀=ℤ₂, ambient unit π₀=ℤ. | Units differ. |
| 651 | p=3 completed unit π₀=ℤ₃; comparison maps 1↦1. | No good-prime restriction. |
| 653 | Topological Hℤ_p⊗ᴸ■_HℤHℤ_p=Hℤ_p. HF_p⊗ᴸ_Hℤ_pHF_p has π₁=𝔽_p as well as π₀=𝔽_p. | Relative and underived tensors separated. |
| 655 | HF_p/pʳ=HF_p⊕ΣHF_p with diag(1,0) transition; limit has only π₀=𝔽_p. | Completion fixes HF_p for p=2,3. |
| 657 | Mod 4: (2ʲ)↦(1,2,0,…); mod 9: (3ʲ)↦(1,3,0,…). Constant ones never decay. Hℤ_p/p has π₀=𝔽_p. | Separate nonsplit target necessary. |
| 659 | One infinite block gives ∏ℕℤ_p or ∏ℕA_p by f(0)=0; all-one allowed there. All empty blocks give 0. | Both formulas agree. |
| 661 | Empty indices give 0; singleton gives A_p; ranks 2,3 give π₀=ℤ_p⁶ and π₁=(ℤ/2)⁶ at p=2. | Projection comparison fixes basis maps. |
| 663 | p=2: π₁K₁=𝔽₂ and marked ×2=0. Lowering positive profile values kills their degree-one coordinates; finite zero-profile coordinates yield ⊕ℕ𝔽₂. p=3: π₁A_p=0. | Marked fiber not multiplication image. |
| 665 | h=max gives f=⌊j/2⌋,g=⌊k/2⌋, sum at (1,2)=1≤2. For j+k, sublevel cardinal r(r+1)/2 is 0,1,3 at r=0,1,2. | Inequality and finality direction agree. |
| 697 | D=all gives L=id and unit 1_A. | Completed. |
| 699 | D=0 gives unit A→0, invertible iff A=0. | Both directions. |
| 701 | Hℤ^⊕ℕ has infinitely generated H⁰ and is not a bounded finite-projective complex. | Perfect objects fail coproduct closure. |
| 723 | Reflector preserves 0; zero tensor and extended zero both equal 0. | Agrees. |
| 725 | For D=0 over Hℤ, π₀L_DA=0 versus π₀A=ℤ. | Completed unit not A. |
| 727 | [ℤ→²ℤ]⊗𝔽₂ gives two 𝔽₂ homology groups; both scalar paths give this derived pushout. | Tor retained. |
| 729 | With A=A′=B=Hℤ and B′=HF₂, both paths give HF₂; actual pushout of the first three rings is Hℤ. | Pushout unnecessary. |
| 731 | Final zero reflector gives 0 on either path; intermediate kernels are 0 while final kernel is all modules. | Kernel-generation unnecessary. |
| 759 | Empty F has no tests; f=0 gives 1; f=1 gives the already invertible solid difference. | All yield full solid module category. |
| 761 | σ*(e₁+fe₀)=e₀; subtracting f times it from e₁+fe₀ gives e₁. | Scalar and shift sign correct. |
| 763 | pⁿ−p⁻¹pⁿ⁺¹=0, with b₀=1 and b_n→0 at p=2,3. | Coefficient not complete. |
| 765 | ε²=0 gives (1−εσ*)(1+εσ*)=1; every module satisfies the test. | Nilpotent localization is identity. |
| 767 | ℤ is generated as ℤ-algebra by ∅; ℤ[T] by T. First imposes no extra condition; second imposes T-summability. | Distinct structures. |
| 769 | T=1/p on ℚ_p kills pⁿ under 1−Tσ*, so that module is in D_∅ but outside D_{T}. | Inclusion direction correct. |
| 771 | (εT)²=0, so εT is integral over R; it is not constant. Its inverse test is 1+εTσ*. | Nonreduced integral closure respected. |
| 773 | (1,0)e₁₂e₂₁=(1,0), but (1,0)e₂₂=0. | Same right-action convention. |
| 785 | Integer measures at 2,∅,* give ℤ²,0,ℤ. | Agrees. |
| 787 | In (∏O_E)[1/p] one exponent clears every denominator; p⁻ⁿ has no such exponent. The sequence pⁿ→0 is not eventually constant, excluding the discrete realization. | Smith/product and static/discrete distinctions. |
| 789 | B=𝔽₂ with integer product generator gives π₀=𝔽₂^ℕ,π₁=0; B⊗ᴸ_ℤB gives π₁=𝔽₂. | Flat generator versus arbitrary B. |
| 791 | θ(𝔽₂[x]) remains static; free commutative derived algebra has H_i(BΣ₂;𝔽₂)≠0 for i>0. | No false positive-characteristic equivalence. |
| 793 | Finite quotient cardinalities 1,2,3; free point group ⊕_Cℤ, reduced free ⊕ℕℤ, solid measure ℤ×ℤ^ℕ. | Cocones distinguished at each admitted cutoff. |
| 795 | Cantor cardinal=2^ℵ₀<κ; C cardinal=ℵ₀ is not <ℵ₀. | Size hypothesis necessary. |
| 797 | coker(×2)=ℤ/2, coker(×3)=ℤ/3 on identical vertices ℤ,ℤ. | Relation data necessary. |

### Suppliers, ownership and build direction

The pinned revisions were checked against lake-manifest.json and the library checkouts: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The 33 distinct named Mathlib interfaces in README:41–51 were read at those pins, including their variable blocks. No direct Tau Ceti declaration is imported. The content checkout's relevant rules and supplier files agree with the indexed main revision a4a8652. The current open-head copies were used for StableHomotopyKTheory and VStackSheavesAndLisseCategories.

| Citation group | Resolved owner and evidence | Scope and computation retained |
| --- | --- | --- |
| GeneralizedCohomology G2.1–G2.7, G3.8–G3.9 | TauCetiRoadmap/GeneralizedCohomology/README.md:213–431,785–915 | Concrete pointed/symmetric spectra and HR modules; coherent tower fiber and prime completion. For multiplication by p on HF_p, the quotient has π₀=π₁=𝔽_p, transition diag(1,0), limit HF_p. Ordinary completion comparisons retain their hypotheses. |
| StableHomotopyKTheory §§5.13–5.18 | TauCetiRoadmap/StableHomotopyKTheory/README.md:1998–2115 | Operadic comparison, HR-relative modules, cochain sign, cellular approximation and connectivity. Relative HF_p⊗ᴸ_HℤHF_p has π₁=𝔽_p; π_k=H^(−k). It does not supply the light spectral category. |
| EnhancedDerivedSheaves §§0.1–0.3, E1.3 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429–472,549–578 | Small ringed-site enhancement, tensor/Hom and limits; the two-term complex [ℤ —2→ ℤ] retains its derived tensor with 𝔽₂. |
| EnhancedDerivedSheaves E0.4, E0.8, E3.2–E3.3 | Same README:211–240,376–427,1153–1227 | Stability, cardinal filteredness, accessibility, localization and compact generation. No theorem identifying arbitrary filtered colimits with countable limits is supplied: ⊕ℕℤ→∏ℕℤ remains non-surjective. |
| EnhancedDerivedSheaves E2:towers, E2.1–E2.3 | Same README:1294–1438,2035–2183; IsReplete.countableProduct_epi at 2071 and IsReplete.milnor at 2097 | Coherent 1−shift, countable exactness and Postnikov comparison. The quotient tower ℤ/pʳ has lim¹=0; the ideal tower pʳℤ has lim¹=ℤ_p/ℤ. No underived replacement is used. |
| EnhancedDerivedSheaves E2.6–E2.7 | Same README:2293–2397 | Hypercovers and space sheaves distinguish hypercompletion from Postnikov completion. Empty and two-point values are 0 and X(*)² in the stable specialization. |
| EnhancedDerivedSheaves E5:abstract.2–E5:abstract.5 | Same README:1456–1595 | Algebra/module fibers, bar scalar extension, monoidal localization, stable structure and monadicity. Balancing ℤ[t₁,t₂] identifies t₁,t₂ with t; it is not an absolute tensor identity. |
| EnhancedDerivedSheaves E5:presentability.1–E5:presentability.2 | Same README:1597–1696 | Compactness, presentable categories and stabilization. These define the objects of gap:cardinal-interchange but do not already state its interchange conclusion. |
| EnhancedDerivedSheaves E5:spectra-comparison, E5:animation.4 | Same README:1842–1896,1994–2033; animatedModules_discrete at 2012 | Point-site spectrum/module and animated comparisons. H𝔽₂[x] is static, whereas the free commutative H𝔽₂-algebra on degree-zero data has positive symmetric-group homology. The package retains this restriction. |
| EnhancedDerivedSheaves E4.1, E4.4 | Same README:2569–2629,2703–2737 | Integer-derived completion and completed tensor. The sphere-linear p-complete extension is explicitly a local target, not claimed to be supplied here. |
| VStackSheavesAndLisseCategories VS2.1 | TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:653–710 | Compact-Hausdorff integer solidity, reflection and derived tensor. Integer free measures on ∅,*,2 are 0,ℤ,ℤ². The new light null-test category is connected only through the declared comparison. |
| VStackSheavesAndLisseCategories VS2.2 | Same README:713–776; ZSolidAnalytification.formalComplement at 764 | Analytic measure objects/Dirac maps, scalar change and finite-extension topological E-coefficients exist as targets. For infinite I, (∏_I O_E)[1/p] excludes unbounded denominators p⁻ⁿ. Formal complements are only cited for underlying-integer-solid structures. |
| HabiroRings §§2.8–2.12, downstream only | TauCetiRoadmap/HabiroRings/README.md:65–85,585–705 at the supplied open head | It explicitly consumes this light spectral contract. Polynomial quotient ranks at n=1,2 are 1,3. Its factorial divisibility and arithmetic multiplication remain there; the present general p-power construction does not consume them. |
| LocallyAnalyticRepresentationsOfLocalGroups LR.3, downstream design only | packages/LocallyAnalyticRepresentationsOfLocalGroups/design/plan.json:2625–2634,7422–7429 | The available design asks for strongly inaccessible cutoffs and separate functional analysis. The package expressly limits its export to common light presentations. No claim that this already supplies unrestricted representation categories was accepted. |

This verifies four upstream roadmap contracts and one downstream README contract, with a sixth cross-roadmap group checked only against its available design. The four named supplier targets singled out in the package—IsReplete.countableProduct_epi, IsReplete.milnor, animatedModules_discrete and ZSolidAnalytification.formalComplement—exist at the cited sections. Repeated citations were resolved against these same versions. The fresh citation resolver returned no unresolved cross-roadmap citation or name; its notice that it could not discover pinned Lake packages was handled by direct inspection of the pins, not treated as library verification.

Ownership searches used the roadmap index's grep/show tools, main and Completed, the board packages, and all 26 supplied sibling checkouts, by the objects “light condensed”, “solid spectrum”, null sequences, product measures, split towers, proper profiles, p-complete tensor, analytic measures and summability. The seven fully qualified declaration names have no duplicate in those searches. Generic spectra and enhancements remain with GeneralizedCohomology, StableHomotopyKTheory and EnhancedDerivedSheaves; integer compact-Hausdorff measures remain with VStackSheavesAndLisseCategories. The light spectral specialization, light-null reflection and sphere-linear analytic constructions are this earlier roadmap's scope.

There is a concrete ownership overlap with the later HabiroRings §2.11: its separable_weights theorem has the same generic lower-profile mathematics as README:629. Since SolidAnalyticRings is at ORDER position 150 and HabiroRings at 219, the generic proper-profile/finality prerequisite belongs here and is exported forward; HabiroRings keeps the factorial specialization. Its existing Lean name is not reused here. This records the downward ownership move required by the brief, rather than adding an upward dependency. The current package still leaves arithmetic two-variable estimates to HabiroRings, as README:809 specifies.

| Declared gap | Registration and minimality | Computed boundary |
| --- | --- | --- |
| light-measure-site-comparison | README:75 and design/plan.json's matching gap share the slug, supplier and needs. One coherent comparison contract for VS2.1–VS2.2, on specified diagrams and cutoffs; no unrestricted site equivalence. | At κ>2^ℵ₀ both C and Cantor presentations are allowed; at κ=ℵ₀ C is excluded. Arrows ×2 and ×3 must stay distinct. |
| cardinal-interchange | README:69 and design/plan.json's matching gap name EnhancedDerivedSheaves E0.8/E5:presentability.2. The general theorem is absent from those sections; HTT supplies its model. | For κ=ω only finite limits are promised; κ=ω₁ permits countable limits. The filtered-but-not-ω₁-filtered truncation diagram gives ⊕ℕℤ≠∏ℕℤ. |
| light-countable-ab6 | README:77 and design/plan.json:1577–1585 match; supplier VS2.1's light continuation is named. Mathlib Light/AB.lean states countable exact products, not this independent-union law. | Independent bounds contain (1/(j+1)!) in the product of rational unions; a single denominator does not. This is distinct from the cardinal-interchange gap. |

These are conditional supplier contracts, not additional findings. None has supplier “none”, asks for the local spectral specialization itself, or duplicates an already supplied theorem. All local Needs edges point backwards after the explicit §3.3 correction; the §6.2→§5.1 use is restricted to the cofiber definition and does not assume its split hypotheses. Source-derived auxiliary steps are stated as targets where the spectral generalization is new.

The required dependency check exited successfully, with exact output:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. Relevant positions are StableHomotopyKTheory 4, EnhancedDerivedSheaves 19, VStackSheavesAndLisseCategories 149, SolidAnalyticRings 150, HabiroRings 219 and RefinedTraceMethods 220. The read-only origin/main...HEAD diff contains eight files, all beneath packages/SolidAnalyticRings; no outside-package change was found. The source README and Lean file contain no process narrative, pull-request number, algorithm target, lemma declaration or set_option. Every numbered target has a source locator. The report is the only file written in the package during this review.

### Source locator ledger

All nine manifest works have certified legal cached copies and a single manifest key. The eight mathematical works below contribute 31 distinct numbered/paragraph locators; the AS course/disclaimer locator was checked separately as context. Integer and arithmetic sources were not counted as proofs of the advertised spectral extensions.

| Source and locators read | Extracted-text witnesses | What the locator supports and the boundary tested |
| --- | --- | --- |
| W 2.1–2.3, pp.11–12 (3) | W line 437–478 | Light spectra, null criterion, product generator and bounded-below p-completion. Unit π₀ changes ℤ→ℤ_p; the package corrects the ambient-codomain monoidality slip. |
| MW 4.1–4.2, p.41 (2) | MW line 1748–1782 | Spectral solidification and Huber-pair summability. For f=1/p, pⁿ−fpⁿ⁺¹=0; this is not a completed coefficient structure unless its unit is local. |
| Q B.6–B.8, printed pp.79–80 (3) | Q line 3643–3725 | Product/tower, profile and bounded-below arithmetic models. Extraction pages 124–125 are correctly distinguished from printed pages. Factorial quotient ranks 1,3 agree; finite-free hypotheses do not apply to ℤ_p/p. |
| Bosco A.3–A.4, pp.92–93 (2) | Bosco line 3459–3528 | Integer p-complete tensor, uniformly bounded-above cohomological resolutions and the p-null-family model. At p=2,3 the sequence pʲ has finite support modulo p²; constant ones fail. |
| RC 2.3.3, 3.2.1, 3.2.4, pp.12–17 (3) | RC line 537–578,732–890; measure proof at RC line 912–1009 | Light exactness/internal projectivity, null solidity, reflection and countable product generators. Finite/empty free measures are treated separately from the source's erroneous unrestricted Lemma 3.3.2. |
| RC 4.0.1, 4.0.3, 4.1.1, 4.1.2, 4.1.6, pp.27–30 (5) | RC line 1392–1519 | Hypercomplete light objects, cardinal continuity, uncompleted structures and completed scalar change. Full and zero subcategories give L(A)=A and 0; the unit distinguishes completedness. |
| RC 4.6.4, 5.5.1, 5.5.4–5.5.6, pp.43–44,64–66 (5) | RC line 2114–2148,3236–3325 | Summability, integrally closed discrete Huber pairs and their module categories. Nilpotent ε gives inverse 1+εσ*; εT is integral over R, so the nonreduced integral closure matters. |
| CS 5.8, 6.2, pp.35–36,43 (2) | CS line 1243–1283,1578–1612 | Compact-Hausdorff integer reflection and derived solid tensor, imported through VS2.1. The product generator is flat, but 𝔽₂⊗ᴸ_ℤ𝔽₂ still has degree-one Tor. |
| AG 6.12, 6.14, 12.1, 12.4, 12.5, pp.39–40,79–80 (5) | AG line 1361–1408,3014–3070 | Analytic measures and completed-module tensor/scalar extension. Transitivity holds for a coherently commuting square; it does not assert the square is a ring pushout. |
| HTT 5.3.3.3, printed p.394 (1) | HTT line 18705–18728 | κ-filtered colimits commute with κ-small limits in spaces. Spectra are the declared stabilization extension. The cofinal-map target slip does not alter the theorem. |
| AS course identification and editorial caveat | AS line 9–44 | Public contributor transcript and lecture numbering only. No mathematical theorem here relies on an unverified transcript assertion. |

Counts: seven Lean declarations read with all seven supplied elaborated signatures compared; 27 numbered targets, 63 API laws and 11 convention rows computed; all 108 README Check bullets evaluated; 31 mathematical source locators verified, plus the contextual AS locator; 33 named pinned interfaces checked; four upstream roadmap contracts and one downstream README contract resolved, plus one downstream design; all 26 supplied sibling folders included in ownership searches. Every definition has at least three relevant README Checks, including a positive case and a negative control across its section.

## Not verifiable

- No Lean command was run, as required by this read-only pass. The worker-supplied elaborated signatures cover the unchanged seven declarations. S01's lifted-carrier and S02's existential-monoidal signatures are justified by pinned definitions and instances, but were not elaborated here; the repair worker must elaborate the added/generalized signatures.
- The three declared supplier gaps remain obligations, not proved interfaces. This review verifies their precise registration and direction, not their discharge. In particular the common-presentation comparisons cannot be treated as unrestricted equivalences of sites.
- RefinedTraceMethods and HigherHidaAndColemanTheory are downstream descriptions in README:811–813. Their authoritative roadmap files were not among the supplied sibling checkouts or available main/package README copies. Ownership against those heads was not checked; no dependency on either was inferred. LocallyAnalyticRepresentationsOfLocalGroups was available only as a design, whose broader requirements are recorded above.
- AS was checked for provenance and lecture context only. Its full lecture assertions were not certified. No requested mathematical locator was inaccessible, and no new missing-reference request was needed.
- The future spectral proofs and gap extensions are not implemented by this package. The computed instances and proof-input audit establish no substitute for those proofs.

## Source issues

- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.12, RC line 550: the source says the lifting map has tensor factor N; it should be P, the null-sequence object defined immediately above; affects the proof.
- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.12, RC line 555–556: the source says the compactification factor is the product of the naturals with the infinity singleton; it should be their one-point union; affects the proof.
- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.13, RC line 569–570: the source says the map being extended has domain S×ℕ; it should be S′×ℕ, the space being compactified; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(1), printed p.18, RC line 812: the source says the second difference subtracts a₁ from itself; it should be a₁−a₂; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(4), printed p.19, RC line 866: the source says the null-sequence relation ranges over integer indices; it should range over natural-number indices; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5(7), printed p.19, RC line 874–875: the source says the inner Hom and solidity argument use B; it should use C, the solid complex quantified in that argument; affects the proof.
- **Misprint** in RC at proof of Proposition 3.2.5, printed p.19, RC line 876: the source says the remaining derived conclusions assume properties (11) and (12); it should assume (12) and (13), as the proposition specifies; affects the proof.
- **Misprint** in RC at §3.3, printed p.20, RC line 919: the source says the unreflected null-sequence object P is solid; it should be a light condensed abelian group whose solidification is computed next; affects nothing.
- **Error** in RC at Lemma 3.3.2, printed p.20, RC line 923–927: the source says every light profinite S has free solidification isomorphic to P's, although S=∅ gives zero instead of ∏ℕℤ; it should require S infinite; affects nothing.
- **Misprint** in RC at proof of Lemma 3.3.3, printed p.22, RC line 1007: the source says the idempotent retract is the solidification of ℤ[S]; it should be the solidification of the bounded-sequence group in that lemma; affects the proof.
- **Misprint** in RC at proof of Proposition 4.1.6, printed p.30, RC line 1514: the source says a kernel object already belongs to the complete category; it should belong to the ambient condensed-module category; affects the proof.
- **Misprint** in RC at proof of Proposition 5.5.6, printed p.66, RC line 3312: the source says finite B-submodules range inside R⁺; it should range inside R, as in the preceding displayed colimit; affects the proof.
- **Misprint** in RC at proof of Proposition 5.5.6, printed p.66, RC line 3312: the source says the measure module is a direct limit of finite-quotient free modules; it should be their inverse limit; affects the proof.
- **Misprint** in RC at proof of Proposition 5.5.6, printed p.66, RC line 3312: the source says the algebra generated by the tested element T already lies in R⁺; it should initially lie in R, before proving T integral over R⁺; affects the proof.
- **Error** in W at paragraph 2.2, printed p.11, W line 461–462: the source says completed discreteness is symmetric monoidal into all solid spectra, whose unit has π₀=ℤ; it should have codomain the bounded-below p-complete solid category, with unit π₀=ℤ_p; affects nothing.
- **Misprint** in HTT at proof of Proposition 5.3.3.3, printed p.394, HTT line 18710: the source says the cofinal nerve map lands in spaces; it should land in I, the filtered indexing category; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5fe94ca5680a6ef4eea0569649a6184401c31158", "job": "RT-SolidAnalyticRings~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
