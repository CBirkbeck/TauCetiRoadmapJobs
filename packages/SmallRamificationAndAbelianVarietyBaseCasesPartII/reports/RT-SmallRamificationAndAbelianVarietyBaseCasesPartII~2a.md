<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1646#issuecomment-6485454824 -->
Red team round 2 pass a (codex) of d5ac716

Verdict: needs_changes

1. **F01** (P1) The exterior-power import no longer exists at the pin

   **Location:** `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/Suggested.lean:2`: `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower`; also the module locator in `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md:41`.

   **Claim:** The acceptance test imports existing pinned modules and can state both geometric headlines.

   **Witness:** At Tau Ceti pin `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean` is absent. `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean:60` defines the required `SheafOfModules.exteriorPower`. The supplied elaboration failure names the obsolete module.

   **Exact repair text:** Replace the import with `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`. Replace the README module locator with `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean`.

   **Retest:** The replacement file exists and its declaration accepts the same sheaf and natural exterior degree used at Lean lines 65 and 82. Degrees 0, 1 and 2 still denote sheaf exterior powers. No theorem changes. Elaboration was not run under the read-only/no-Lean instruction.

2. **F02** (P3) The residue map is written with the base residue field as codomain

   **Location:** `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md:202`: “through the residue field O(E)→k alone”.

   **Claim:** The residue-field reduction for an allowed ramified algebraic E/K maps to k.

   **Witness:** Take p=3, k=𝔽₃ and E=Frac(W(𝔽₉))(√−3). Then e=2, f=2 and O(E)/𝔪_E=𝔽₉. No unital residue map to 𝔽₃ exists: a field map would inject nine elements into three.

   **Exact repair text:** “A lift of the image of λₛₜ under k→k_E through O(E)→k_E, where k_E=O(E)/𝔪_E, alone need not be a permitted lift when E/K is ramified.”

   **Retest:** The displayed map now has codomain 𝔽₉ in the witness and 𝔽₃ in the existing totally ramified Check. The stronger A(E)-congruence already imposed earlier in the sentence is unchanged. This is a codomain error introduced by the repair's explanatory sentence, not a defect of the repaired solution bijection.

## Round-one repair verification

The earlier reports use F01/F02 twice. The prefixes below distinguish the passes. All seven original defects are repaired; S02 records a new error in explanatory text added by a repair. No finding was marked “not actionable in this package”.

| Earlier finding | Repaired passage at this head | Retest and status |
| --- | --- | --- |
| a-F01, coefficient lifts | README:202: “λ̂ₛₜ∈O(E) mapping to that element under O(E)→A(E)” and “v₀(λ̂ₛₜ−[λₛₜ])>r/(p−1)” | **Repaired.** With p=3,r=1,π²=−3, the bad lift (1+π)² differs from 1 by valuation 1/2, failing >1/2. The permitted lift 1 yields exactly 0,±1 and their three fixed classes. README:226 contains this negative control. New residue-map typo: S02. |
| a-F02, infinite residue field in unramified lifting | README:291: “The pair (O(E),p O(E)) is henselian” and README:302: “SchemeAndStackFoundations §0.12 … and §0.14” | **Repaired.** Main supplier README:1002,1075–1082 states étale section lifting and integral/radical permanence for general rings. For k=𝔽₃(t)^perf, X²−t has derivative 2α≠0; the unramified algebra has rank 2 and e=1. For ramified E, a(E)^m and pO(E) both have maximal-ideal radical. The subsequent uniformizer belongs to L, correcting the source's E/L slip. |
| b-F01, supplier asked for consumer-owned projection | README:65 asks for the “explicit divided-power presentation of A_cris/p … and its identification with … Uₛ”; README:255: “Define here the projection A_cris/p→A(K̄)” | **Repaired.** Identical gap text occurs in plan.json. The earlier supplier no longer needs A(E). On α³=−3, φ₁([α])=[1] in A(K̄), and the period-side divided Frobenius projects to this value. In the prior b-review's proposed test, α³/(−3)=α was an arithmetic slip: the value is 1. It was not copied into the repaired target. |
| b-F02, alleged direct Enriques consumption | README:15: “declares the low-degree Hodge obstruction as its own gap”; README:645: “needs, through its declared gap fontaine-low-degree-hodge” | **Repaired.** EnriquesSurfacesAndIntegralNonexistence README:99 and :1127 at the supplied head still route that gap through PadicHodgeTheory. A ℤₚ-model base changes to a Witt model; h²⁰ is 1 on its K3 fibre and would be 0 under everywhere good reduction. No reverse supply edge is asserted. |
| b-F03, degree-ten bound | README:87: “row (b) gives [F:ℚ]≤10 … rd(F)<6.93” | **Repaired.** Supplier §1.9 row (b) actually says 6.93. Recomputed 7^(35/36)=6.631672862 and 7^(142/143)=6.905390827, both <6.93. For f=1, e divides 6; for f≥2, ef≤287 gives e≤143. The excluded e=194 gives 6.930137709>6.93. |
| b-F04, vague kernel dictionary | README:81: “G(E) fixes U pointwise iff L⊆E” and “kernel field of U⊕U′ is the compositum” | **Repaired.** Same slug and exact needs text in plan.json. For U=0, L=K and both predicates are true. For 𝔽₃(1), E=ℚ₃ fixes one of three elements and does not contain L; E=L fixes all three. Adjoining 𝔽₇(1) gives the compositum with the degree-six cyclotomic field. |
| b-F05, abstract pagination | README:330: “abstract, unnumbered cover page, PDF p. 1” and “§1, printed p. 4” | **Repaired.** Fontaine93 line 5 starts PDF page 1; line 34 starts PDF page 2; line 119 starts PDF page 5. The repair correctly rejects the earlier review's proposed *printed* p.1 for the cover. |

Here and in the tables below, unqualified README/Suggested.lean locations mean `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md` and `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/Suggested.lean`.

## Verified sound

Read every line of the **661-line README** and **92-line Suggested.lean**. Coverage: **4 Lean declarations** (2 definitions, 2 theorems), **24 numbered targets**, **28 API bullets**, **81 numbered-section Check bullets**, **24 target locator blocks**, **3 cited works**, **12 cross-roadmap contract groups** (11 suppliers and one consumer), and **8 declared gaps**. The README uses numbered target headings, not additional bold target statements; its bold Checks labels are included below. The tables record evaluations, not proofs of universal theorems. The import failure S01 prevents an elaboration verdict.

### Lean declaration and context table

All four names are in `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCasesPartII`. There is no section `variable` or `include` block. All scheme arguments are `Scheme.{0}`. Each needed hypothesis is an explicit binder or a local `letI`.

| Declaration; section; full relevant context | Instances and computed sides | Result/change |
| --- | --- | --- |
| `hasWittGoodReductionAt`, Suggested.lean:37; §0.1. `{X}`, `f:X→Spec ℚ`, `p:ℕ`, `[Fact p.Prime]`. W=WittVector p (AlgebraicClosure (ZMod p)); K=FractionRing W; ∃a,Y,g, smooth/proper g and iso over Spec K. | ℙⁿ, n=0,1,2: both pullbacks are ℙⁿ_K, both composed projections are pr₂. ∅: both pullbacks ∅ and projections identical. p=0,1: primality false, so the zero ZMod ring is excluded. E:y²=x³−x: v₃Δ=0, v₂Δ=6, local predicate true at 3, false at 2. | Body expresses the required model, without a chosen global model or lost instance. S01 prevents loading the file, not this definition's mathematical interpretation. |
| `hasEverywhereWittGoodReduction`, :50; §0.1. `{X}`, f, ∀p,hp, local Fact instance. | ℙ⁰,ℙ¹,∅: every prime witness exists, including 2; predicate true. Elliptic example: component at 3=true, at 2=false, so universal predicate=false. | Prime binder and independent existential quantifiers agree with README. |
| `lowDegreeHodgeVanishing`, :60; §3.2. `{X}`, f, `[Smooth f] [IsProper f]`, hX, i,j:ℕ, i≠j, i+j≤3; `X.Over` explicitly set to f. | ℙ²: all eight admissible off-diagonal groups have dimension 0 and cardinality 1. ℙ¹ at (1,1): dim=1, but i≠j=false. At (0,0), inequality true and off-diagonal false. ∅: all groups singleton. | Correct sheaf exterior power, relative base and vanishing predicate. No projectivity or connectedness restriction. Repair import S01. |
| `geometricK3_hasBadWittPrime`, :74; §4.2. `{X}`, f, smooth/proper f; geometric pullback a,Xbar,fbar; local Over=fbar; five explicit K3 conditions ⇒ ∃p,hp,¬local model. | K3: Ω²≅O gives dim H⁰Ω²=1; everywhere Witt reduction would give 0 at (2,0). ∅ has 0 but fails integrality; ℙ² has canonical O(−3)≄O; abelian surface has dim H¹O=2≠0. | Native expanded conditions match supplier `IsK3`; the bad prime may equal 2. Repair import S01. |

Both theorems require global arithmetic reasoning; neither closes by a definition unfolding, a boundary computation, or a single pinned theorem. Neither definition is unrelated padding. The headlines are §§1.7–1.8 (higher-weight ramification), §§2.7–2.8 (finite/rational exhaustiveness), §3.1 (odd vanishing and the full degree-two Tate action), §3.2 (Hodge vanishing), and §4.2 (K3 bad prime). The two statable geometric headlines are present; the other three groups are explicitly named in the module docstring with their missing Fontaine–Laffaille, crystalline or geometric étale-action carriers. Section 3.3 is the base-change corollary of the retained headline, not a missing independent acceptance theorem.

### All 24 targets and all 81 Checks

The common local context is prime p, perfect characteristic-p k, K=Frac W(k), v₀(p)=1, 0<r<p−1. Thus a ramified base DVR, equal-characteristic K, an imperfect k, or the zero ring is outside that context. Algebraic E/K are separable in characteristic zero. At p=2 the positive integral interval is empty; at p=3 it consists of r=1. These are domain tests, not evidence from vacuity for an admitted positive-weight theorem.

| Target and README location | Instances tried; computed values on both sides | Result/change |
| --- | --- | --- |
| §0.1 :119, two model predicates; 3 Checks | ℙⁿ, n=0,1,2: ℙⁿ_W has generic fibre ℙⁿ_K, iso over K. Elliptic Δ=64,j=1728: v₃Δ=0, v₂Δ=6, v₂j=6. Local-at-3=true, everywhere=false, potential-at-2=true, Witt-at-2=false by nontrivial inertia on T₃. | All 3 Checks distinguish the intended predicates. |
| §0.2 :145, realization/comparison; 3 | Point: (dim H⁰,H¹)=(1,0); two points=(2,0); empty=(0,0). ℙ¹,q=2: F on H²=2, on dual=1/2. Invariants of C₇(i)⊗H² have dimension 1 exactly at i=1, agreeing with H^(2−i)(Ωⁱ). | Signs and disconnected domain agree. Completion and Witt comparison remain declared contracts. |
| §1.1 :174, A(E), Fil, φ; 4 | E=ℚ₃ gives A=𝔽₃,Fil¹=0. E=ℚ₃(π),π²=−3: b=(π²), A=𝔽₃[π]/π², Fil¹=𝔽₃π; [π]≠0, [π²]=0. φ₁π=π³/(−3)=π; opposite sign gives −π≠π. Over K̄, distinct valuations 1/n≤1/2 survive; any nonzero finite k-combination has its unique minimum value, so dimension is infinite. | Correct strict cutoff, sign and infinite-length ambient domain. |
| §1.2 :202, J and exact solution set; 7 | d=0: 1 tuple=1 Hom. Weight 0: x³=x gives 0,±1. Weight 1: x³=−3x gives 1 solution over ℚ₃, 3 over ℚ₃(π). Matrix rows (1,1),(0,1): (1,θ) satisfies 1=1 and θ³=−3(1+θ), vθ=1/3; transpose requires 1=1+θ. 2³=8≠2. Bad coefficient lift: v(λ̂−1)=1/2 fails >1/2 and φ₀(1+π)=1≠1+π. Nongenerating zero-Frobenius line: 3 Homs versus 1 exact root; ΣImφ=0≠M excludes it. | Solution definition and new congruence pass. Residue-map codomain S02. |
| §1.3 :233, unique lifts; 3 | M=0: 1↔1. Weight one over ℚ₃: 1↔1; over ℚ₃(π): 3↔3. e=2 implies n>1; n=2 admitted, n=1 excluded. π−(−π)=2π has value 1/2: distinct under >1/2, equal under ≥1/2. | Bijection includes fields not containing the kernel field. Corrections are a mathematical lifting proof, not an algorithmic output target. |
| §1.4 :251, period comparison; 3 | Zero: dimension 0↔0. Weight-zero unit: p↔p elements, so zero map fails. Weight-one at p=3: 3↔3, with φ₁π=π on both sides for π²=−3. For the source's α³=−3, the check in A(K̄) instead gives φ₁[α]=[1]. | Projection belongs here; realization belongs to declared supplier. No sign reversal. |
| §1.5 :269, cardinality iff containment; 3 | d=0: #J=1=p⁰ and L=K⊆E. Weight one: E=ℚ₃ has 1<3 and L⊄E; E=L has 3=3 and L⊆E. Any E⊇L still gives 3, independently of [E:L]. | Both directions tested; exact tuples justify fixed points, without commuting invariants with a quotient. |
| §1.6 :287, approximate embeddings; 4 | L=K: identity exists. p=3,r=1: c=3/2, m=2>c, m=c excluded. For quadratic L and E=ℚ₃, x²+3 mod9 has values {1,3,4,7}, so no approximate map and no embedding. For k=𝔽₃(t)^perf, α²=t: derivative 2α≠0, unramified rank=2 and e=1. | Repaired route reaches infinite residue fields. m>c>0 ensures a proper ideal, not the zero quotient by the unit ideal. |
| §1.7 :306, breaks/different; 3 | p=7,r=3: shifted c=3/2, Serre c−1=1/2. Tame p=3 field: u=1, Serre break=0, ι=1/2, v₀𝔇=1−1/2=1/2<3/2. Unramified: v₀𝔇=0<c. p=2 admits no r; p=3 only r=1. | Strict different and shift agree. Unrefined Pₘ only gives u≤c+1/e, so refined gap is used. |
| §1.8 :324, crystalline subquotients; 3 | Zero quotient: L=K,v₀𝔇=0. Nonzero mod3 cyclotomic quotient: 1/2<3/2. ℤ/9(1): e=6,d=9, v₀𝔇=9/6=3/2, violates strict inequality but is not killed by 3. | Torsion exponent and base restrictions retained; abstract/page locator repaired. |
| §2.1 :353, C₇[0,3]; 3 | Trivial ℤ/49 belongs, 7·1=7≠0. Four lines have tame scalars 3ⁱ=(1,3,2,6). Weight 4 gives 4, outside the allowed list. Zero belongs and has order 1. | Includes arbitrary finite 7-power exponents; ambient extensions not declared automatically crystalline. |
| §2.2 :379, steps; 4 | Pure χʲ line has Uᵢ=U iff i≤j. C₇⋊C₆ example: tWt⁻¹=W⁶, invariant dimension=0; order 3,2,1,0 gives (1,1,1,2), reverse gives (0,0,0,1). ℤ/25: χ powers 1,6,11,16; (6−16)u=0 gives step₃=5ℤ/25, order 5. S₃ on ℚ³: step₀(0)=ℚ(1,1,1), dim1; step₀(top) dim3; (12)e₁=e₂ disproves stability of ℚe₁. Trivial G gives every step=U; zero ring/module gives 0=0. | Correct over general commutative rings; field-only Check remains field-only. |
| §2.3 :407, trivial endpoints; 3 | Trivial ℤ/49 extension: G acts identically, but element order49 differs from exponent7 of split group. U=0: kernel ℚ, degree=rd=1. χ(g)=8 mod49 gives a(g)=(8⁶−1)/7=6 mod7; transvection has order7 and is ramified, so middle object fails FL weight zero. | Does not confuse trivial action with split groups. |
| §2.4 :425, simple objects; 3 | 42·6=252≤287<294=42·7. A Sylow count dividing n″≤6 and ≡1 mod7 is 1. Tame F′: rd≤6.631672862<6.93, so 6n″≤10 implies n″=1. Tame F: e≤143 gives rd≤6.905390827<6.93. e=194 would give 6.930137709>6.93. Four scalars=1,3,2,6; fifth=4. | Repaired bound uses actual supplier row and tame-character embedding. |
| §2.5 :443, extension splitting; 5 | For a=1,2: 0<b≤a and b≡a mod6 force b=1,2. Exponents 41+6a=47,53 give rd=8.824801584,11.652879109<12, contradicting degree42≥36. a=3 gives exponent59 and rd=15.387268512>12. Relative-unramified exponent35 gives rd=5.061140185<5.72, contradicting 42≤8. Tame conjugation with θ₀=3 gives 3,2; inverse gives 5,4. | Orientation exactly sub χ³ / quotient 1; equal and reversed pairs split. No existence of exceptional object inferred from lack of numerical contradiction. |
| §2.6 :463, no-trivial-quotient decomposition; 3 | ℤ/49(1): g₁ has 49 elements, 7 action nonzero. 𝔽₇(1)⊕𝔽₇(2): g₁,g₂ each order7, g₀ order1, total49. Conditional nonsplit χ³-by-1: invariant dimension0, trivial quotient dimension1, so hypothesis fails. Zero U has no nonzero simple quotient and decomposes as zero. | Local unramified twist removed globally by Minkowski, not silently discarded. |
| §2.7 :481, finite exhaustiveness; 3 | U=0: all orders1. ℤ/49(i): tame character differences are units mod7 and Uₖ=U precisely k≤i. Conditional nonsplit χ³-by-1: dimensions (U₄,…,U₀)=(0,1,1,1,2). | Exhaustive scalar grades need not split. |
| §2.8 :499, rational exhaustiveness; 3 | V=0: all dimensions0. ℚ₇(1)⊕ℚ₇(2): (0,0,1,2,2), quotient characters χ²,χ. Lattice uₙ=1 reduces to1 at each stage; u₁=1,u₂=2 reduce to unequal classes mod7 and have no inverse-limit element. | Finite witness compatibility, compactness and stable-lattice hypotheses are needed; the source's short passage does not replace them. |
| §3.1 :528, zero or Tate; 3 | ℙ¹,q=2: H² eigenvalue2, dual1/2; only i=1 matches m=2. For m=1,3, target absolute values 0.70710678,0.35355339 are absent from {1,.5,.25,.125}. A 2×2 Jordan block with eigenvalue2 is pure but not scalar: (F−2I)e₂=e₁≠0. | Single surviving grade forces full scalar action, beyond semisimplification. |
| §3.2 :546, Hodge vanishing; 3 | Eight off-diagonal pairs with total≤3 all have dim0 on ℙ². ℙ¹ at (1,1) has dim1 and fails i≠j. Empty has all dims0. ℙ² (2,2) has dim1 but total4>3 and is diagonal; (0,0) is excluded. | Generality matches Lean; degree-four diagonal example is not advertised as off-diagonal sharpness. |
| §3.3 :564, integral specialization; 3 | ℙ¹_ℤ: h¹⁰,h⁰¹,h²⁰,h⁰²=0 and h¹¹=1. Specℤ: h⁰⁰=1, others0. Elliptic example has v₃Δ=0 and v₂Δ=6, so one local model does not fulfill ∀p. | Base change supplies models without reverse globalization. |
| §4.1 :591, K3 dimension; 3 | Ω²_ℚ̄≅O gives dim1, preserved over ℚ by flat base change. Multiplication by2 rescales a nonzero section but dim remains1; multiplication by0 is not an iso. Abelian surface: h²⁰=1,h¹O=2; K3:1,0. | Imported K3 result, not a duplicate local predicate or theorem. |
| §4.2 :607, K3 obstruction; 3 | (2,0) satisfies 2≠0 and 2≤3; hypothetical all-prime models yield 0 versus K3 value1. Empty: value0 but fails integrality. Smooth quartic: value1, so ∃bad prime; no computed named prime is asserted. | Correct existential conclusion, including possible p=2. |
| §4.3 :623, projective-space formula; 3 | n=0: only h⁰⁰=1. n=1: h¹¹=1,h²⁰=0. n=2: h²²=1,h¹²=h²¹=0. i>n: Ωⁱ=0, hence all Hʲ=0. For ℙ¹, H⁰Ω¹=0 but H¹Ω¹=ℚ, so global one-forms cannot replace the sheaf. | Supplier formula used at n=0,1,2 and exterior-degree boundary. |

### API, convention and gap evaluations

API numbers below are bullet positions within their numbered section, so every one of the 28 bullets has a row. For the local rows put p=3,r=1,π²=−3 unless stated otherwise.

| API statement | Computed instance | Result/change |
| --- | --- | --- |
| 0.1/1 existential characterization | ℙ¹ has witness ℙ¹_W and fibre ℙ¹_K on both sides; bad elliptic prime2 has no witness on either side. | Same predicate. |
| 0.1/2 ℤₚ base change | ℙ¹_ℤ₃⊗W=ℙ¹_W, generic fibre ℙ¹_K. | Proper/smooth transport gives the witness. |
| 0.1/3 invariance under ℚ-iso | On ℙ¹, x↦2x has inverse x↦x/2; the composed generic-fibre map still has structure map pr₂. | Unmarked scheme iso is not substituted for iso over K. |
| 0.1/4 ℤ-model witnesses | Specℤ gives SpecW and SpecK at every prime, including2. | Universal prime quantifier satisfied. |
| 0.1/5 extraction of prime witness | ℙ¹ everywhere=true, component at2=true; elliptic component at3=true does not imply everywhere=true. | Correct direction. |
| 1.1/1 quotient kernel | π maps to nonzero ε, π² maps to0; values 1/2 and1 respectively. | Kernel exactly v>1/2. |
| 1.1/2 representative equivalence | π and−π differ by valuation1/2 and are unequal; π andπ+3 differ by value1 and are equal. | Both directions discriminated. |
| 1.1/3 filtration | Fil⁰=A of dimension2; Fil¹=kε of dimension1; Fil²=0. | Cutoff at r+1. |
| 1.1/4 divided Frobenius | φ₀(a+bε)=a; φ₁(bε)=bε for b∈𝔽₃. | Formula, addition and semilinearity match. |
| 1.1/5 embedding functor | Nontrivial quadratic embedding sends ε↦−ε; φ₁(−ε)=−ε agrees with embedding of φ₁ε. Square of embedding sends ε↦ε. | Identity and composition hold. |
| 1.1/6 factor through mod p | p=3 has valuation1>1/2 and maps to0; 1 maps to1. | W(k)/p action well-defined and nonzero. |
| 1.2/1 filtered morphism admission | Weight-one e↦π gives φ₁π=π; e↦1 violates Fil¹ since v1=0<1/3. | Correct morphism condition. |
| 1.2/2 basis determination | One-dimensional e↦π and e↦−π are unequal; agreement at e forces equality on ae for every a. Zero basis has one map. | No extra choice data. |
| 1.2/3 field functor | Weight-one Hom over ℚ₃={0}; over L={0,±π}; inclusion maps0↦0. Nontrivial L automorphism permutes π,−π. | Linear and functorial. |
| 1.2/4 contravariance | Projection M⊕M→M induces Hom(M,A)→Hom(M⊕M,A), x↦(x,0); dimensions1→2. | Direction correct. |
| 1.2/5 exact-solution membership | For the triangular matrix, (1,θ) gives both defining equalities; transpose fails at first coordinate by θ≠0. | Coefficients must satisfy repaired A(E)-congruence. |
| 1.2/6 comparison | Unit source and target each have3 elements; comparison sends nonzero unit to nonzero class. | Same §1.4 target, not a second construction. |
| 2.1/1 packaging | Trivial order49 satisfies both conditions; inertial weight4 line fails local interval. | Full finite exponent range. |
| 2.1/2 Homs | End of trivial ℤ/49 consists of49 multiplication maps; on distinct χ andχ² lines over𝔽₇, (3−2)a=0 implies a=0. | Ambient equivariant maps exactly. |
| 2.1/3 subquotients | In ℤ/49(1), 7U and U/7U each have7 elements with χ action. | Same local interval inherited. |
| 2.1/4 direct sums/zero | Two allowed lines give order49; empty direct sum has order1. | Zero object retained. |
| 2.1/5 lattice reduction | T=ℤ₇(2): T/7ⁿT has order7ⁿ and actionχ²; n=1,2 give7,49. | Matches lattice supplier. |
| 2.2/1 step membership | On ℤ/25, (ρ−χ³)u=−10u; u=5 gives0, u=1 gives15≠0. | Correct congruence, not scalar equality upstairs. |
| 2.2/2 monotonicity/naturality | S₃ permutation representation: step₀(0) dim1≤step₀(top) dim3. Projection of split χ⊕χ² to χ carries its χ-step identically to χ. | Image-compatible qualification retained. |
| 2.2/3 stable and containing | N=top gives top; N=0 gives χ-eigenspace. Nonstable ℚe₁ in permutation representation has (12)e₁=e₂∉N, so containment fails without stability. | Needed hypothesis present. |
| 2.2/4 quotient eigenspace/invariants | χ=1,N=0 on S₃ gives diagonal line; N=U gives zero quotient on both sides. | Uses pinned invariants at trivial character. |
| 2.2/5 iteration | Pure χ²-line: dimensions U₄,…,U₀=(0,0,1,1,1). | Correct index order and initial zero. |
| 2.2/6 isomorphism transport | Scaling χ²-line by2 preserves zero and whole terms and conjugates each scalar to itself. | No basis dependence. |

| Convention | Computed calibration and excluded model | Result |
| --- | --- | --- |
| Base field and schemes | ℙ⁰ has dim H⁰O=1, ∅ has0, two points have2; all have proper smooth models. Spec(ℚ[ε]/ε²) is nonreduced and nonsmooth. | Nonempty/connected not implicit; thickening excluded by smoothness. |
| Valuation and two ideals | v₀(3)=1, v₀π=1/2; π survives b, while valuation2 dies in a². v₀0=∞ gives zero in both quotients. | Strict and weak inequalities kept distinct. |
| Frobenius and denominator | π³/(−3)=π versus π³/3=−π; p≥3 in positive range implies p−1≥2≠0. | Correct normalization, no division-by-zero case admitted. |
| Upper/lower shift | Tame quadratic: Serre0, Fontaine1, lower displacement1/2, different1/2. | Shift1; different not upper break. |
| Duals and Tate twists | q=2: H² eigenvalue2, dual1/2; C₇(1)⊗ℚ₇(−1)=C₇ gives invariant dimension1. | HT(χ)=+1 and geometric Frobenius consistent. |
| Orientation and tame action | Sub χ³/quotient1 gives dimensions1,1,1,2; tame powers3¹=3,3²=2 modulo7 versus inverse5,4. | Both order and conjugation sign fixed. |
| Total-function boundaries | m−i appears only with 0≤i≤m; m=0,i=0 gives degree0 and excluded i≠j in Hodge target. i>n gives exterior sheaf0. q is a prime≥2, never1. | No natural subtraction or reciprocal junk admitted. |

All eight `needs` strings are identical in the README and plan.json; all suppliers are named. The presentation/realization and kernel-dictionary clauses are coherent single interface contracts with explicit outputs, not unnamed bundles of future theories. Their missing work is accepted conditionally as the brief requires.

| Gap | Boundary evaluation and minimality check |
| --- | --- |
| witt-proper-smooth-comparison | k=F̄₇: degree-two ℙ¹ has one crystalline dimension and Tate H²=ℚ₇(−1); empty fibre gives0=0. PadicHodgeTheory §8.1 still starts with finite K/ℚₚ, so its comparison alone does not cover this base. |
| fl-acris-truncation | Unit: p solutions on both realizations; weight-one at3:3 solutions. Existing ring S and rational S_K comparison do not state this explicit killed-p A_cris presentation/identification; A(E) and its projection are no longer requested upstream. |
| fl-weight-zero-unramified | Trivial ℤ/p² has inertia identity despite nonzero multiplication byp; an unramified nontrivial character also has inertia1. A modp unit Check in §R07.3.7 is not the arbitrary-length assertion. |
| fl-rank-one-inertia | χⁱλ with unramified λ has identical inertiaχⁱ; at n=2 χ on ℤ/9 can be nontrivial beyond mod3. Simple tame modp weights in §R07.3.9 alone do not give this length-pⁿ statement. |
| fl-oriented-mod-p-splitting | For FL basis weights i>j, the filtered basis adjustment kills the off-diagonal coefficient; φ_j of the higher-weight basis vector is0 modulo p. Reversed ordinary extension subμ_p/quotientℤ/p need not split. p=2 admits no j<i<p−1. |
| pm-remove-inverse-e | For tame u=1, a map into O_K/a^m with m≤1 can send a ramified uniformizer to0, while K lacks that root; Pₘ fails. For the local application c=3/2,e=2, the unrefined conclusion is only u≤2, not≤3/2. §R07.6.4's integral lci-specific refinement is narrower than the requested generic criterion. |
| finite-torsion-kernel-dictionary | U=0 gives kernel fieldK; mod3 cyclotomic gives fixed counts1 or3 and containment false ortrue. Direct sum gives kernel intersection and fixed-field compositum. χ₇ mod7 has six possible units. No current §2.2 target states this whole finite-torsion interface. |
| completed-unramified-inertia | Nontrivial unramified quadratic representation becomes trivial over Frac W(F̄₃), with inertia action1; tame χ₃ retains order2 there. Existing finite-residue Layer2 and finite-extension ramification comparisons alone do not state the absolute-Galois equivalence with this completed field. |

### Supplier, ownership and pin audit

Cross-roadmap references were resolved again against main or the current supplied/open head, not against round-one line numbers. The resolver identifies main `c994070` and the 415-head index dated 2026-10-29. It found no unresolved roadmap or Lean name; it explicitly skipped external pinned-library names, so the manual pin search below was necessary. For the six supplier texts exposed through `roadmaps show`, the scratch copy's initial provenance comment adds one line; the repository-relative line numbers here omit that comment.

| Contract group | Located supply and domain |
| --- | --- |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:848` §0.9 finite-presentation limits and spreading; :938 §0.11 field descent; :1002 and :1075–1082 étale/henselian targets for arbitrary rings; :3437 §2.6 qcqs coherent flat base change; :4275 §2.20 duality; :4713 §3.3 curve calculations; :5383,5448,5487 formal completion/existence on given schemes. Surface constants and h²⁰ are supplied separately by K3 §1.4, so the curve-only §3.3 is not used as a general surface theorem. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504,522,776` §§F.2.1–F.2.2,F.3a; :850 §F.4.0 finite-dimensional local-field representations, compactness and stable lattices; :959,979,999,1021,1041,1089 §§F.4.1–F.4.6 realization and continuous action. Prime-to-residue coefficients used where required. |
| PadicHodgeTheory | `TauCetiRoadmap/PadicHodgeTheory/README.md:120,198,665,682,705,732,1077,1384` §§0.1,0.4,3.2–3.5,5.5,8.1. Completed-unramified base change still detects admissibility; Hodge–Tate signs and duals match. §8.1 rational geometric comparison is finite K/ℚₚ; the declared domain gap is retained. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4801` §R07.3.4; §§R07.3.5–R07.3.17 supply strictness, Uₛ, simple tame weights, exactness/full faithfulness, subquotient closure and lattice correspondence on the safe interval. :8298 §R07.6.1a explicitly allows arbitrary perfect residue fields; :8365,8410,8444,8498 §§R07.6.2–R07.6.5 distinguish shifted numbers, the 1/e-loss, the lci-specific refinement and the finite-flat theorem. None duplicates this higher-weight killed-p proof. |
| ArithmeticGaloisRepresentations | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:670,768,878,1007,1121,1588` §§1.1–1.3,1.6,1.9,2.2. Continuous operations, restrictions, Tate twists, lattice models and global ramification exist; the finite torsion kernel-field dictionary remains explicitly requested. |
| SmallRamificationAndAbelianVarietyBaseCases | `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:281,428,520,622` §§1.1,1.4,1.7,1.9. Row(b) is rd<6.93⇒n≤10; row(d) rd<19.02⇒n≤287; row(f) rd≤5.72⇒n≤8. The unconditional n≥36⇒rd>12 estimate and normalized different input are consumed on actual totally complex fields. |
| LocalFieldsRamification | Main `TauCetiRoadmap/LocalFieldsRamification/README.md:561` finite-residue unramified theory; :705 Layer3; :825–837 injective θ₀ and conjugation; :1033–1049 tame different/towers. These are used over ℚ₇, not over an arbitrary perfect residue field. |
| DeligneWeightsAndPurity | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:699,709,2291` §§0.8,0.9,7.15. Invariant characteristic-polynomial multiplication and pure subquotients require no invariant complement or semisimplicity; proper smooth purity has no projectivity hypothesis. Geometric χ has eigenvalue q⁻¹. |
| K3SurfacesAndSymplecticBoundedness | Supplied head `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:267,296,310,328,451`; Suggested.lean:87–92 expands the same five K3 conditions. Arbitrary field extension, projectivity and Hodge numbers retain this owner; §4.1 here only specializes. |
| CrystallineCohomology | `TauCetiRoadmap/CrystallineCohomology/README.md:3208`, §CR.3.5, with explicit projective-space formula at :3437–3444, for all base rings. It supplies Ω-cohomology, not just twisting-sheaf cohomology. |
| EllipticCurves | Main `TauCetiRoadmap/EllipticCurves/README.md:793–857`, Layer4. Minimal equation, potential good reduction by integral j, and NOS with ℓ≠residue characteristic match the p=2,ℓ=3 negative Check. |
| Enriques consumer | Supplied head `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:99,1099,1119,1127`. Current gap routing is described accurately after the repair. No reverse dependency or new cover/twist construction is introduced here. |

Ownership searches used `roadmaps grep` by the objects (Witt good reduction, low-degree Hodge vanishing, Fontaine's title, truncated valuation rings and cyclotomic filtrations), then local searches in main, Completed, board packages and the supplied sibling checkouts. Matches concerning generalized cohomology or Habiro cyclotomic filtrations describe different objects. The Enriques occurrence is its declared application gap. None of the four full acceptance names occurs in another indexed Suggested.lean. No independent duplicate owner of the higher-weight/global Hodge endpoint was found. The base ramification roadmap, K3 and projective-space owners remain explicitly imported.

The checked pins are **Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`** and **Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`**, matching both lake-manifest and the package checkout revisions. In particular, the older pins recorded by the round-one reports cannot certify this head's imports.

| Pinned object | Exact carrier/hypotheses checked |
| --- | --- |
| Representation, invariants, comap | `Mathlib/RepresentationTheory/Basic.lean` defines the algebraic representation, with no topology field; `Mathlib/RepresentationTheory/Invariants.lean:73,80` gives invariants and membership; `Mathlib/Algebra/Module/Submodule/Map.lean:171` gives comap. Stability is an extra condition in §2.2. |
| Witt DVR and completeness | `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean:148`, `Complete.lean:116`, `Identities.lean:88,92`; prime, perfect characteristic-p field and nontriviality present. `FractionRing` and the uniquely determined ℚ ring map give the stated scalar extension. |
| Henselian/étale and degree formula | `Mathlib/RingTheory/Henselian.lean:170` gives IsAdicComplete.henselianRing; `Etale/Basic.lean:205`, `Etale/StandardEtale.lean:261` give the actual carriers; `RamificationInertia/Basic.lean:72` assumes domain, module-finite, flat and finite set of primes over p. The finite free unramified algebra meets these conditions. |
| Native geometry | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59,127`, `Morphisms/Proper.lean:41`, `Geometrically/Integral.lean:40`, `Over.lean:36`, Spec and native pullbacks. Smooth relative dimension2 is stronger than smoothness; geometric integrality tests field fibres and excludes ∅. |
| Differential and exterior sheaves | `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85` uses explicit R,X and X.Over. `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean:60` sheafifies sectionwise exterior powers; the README/import's old module is absent (S01). |
| Cohomology | `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61` is small-Zariski Sheaf.H, not an arbitrary type; `Module/Base.lean:45` supplies the base-ring module using the specified Over structure. Subsingleton means group vanishing without assuming finite dimension. |
| Numerical/p-group/sign inputs | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:83` gives rootDiscr ℚ=1. `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:158` assumes field, ExpChar, finite dimension and Nontrivial V. `TauCeti/Geometry/Hodge/Tate/Basic.lean:111` places the Tate piece at −m. |
| Compact inverse limits | `Mathlib/Topology/Category/TopCat/Limits/Konig.lean:126`, `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`, takes nonempty compact Hausdorff objects in a cofiltered system. Nonempty finite discrete solution sets in §2.8 meet these conditions. |

The exact four local names match the README. No sorry-valued data, `set_option`, forbidden command, process narrative or `lemma` target occurs. The PR diff is wholly inside `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/`; the only changed top-level plan.json key is `gaps`. No computational algorithm is a target. Only the report and scratch notes were written during this pass.

The required read-only dependency check returned:

    depcheck: 187 roadmaps, 1222 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. The seven original repairs did not introduce a dependency reversal. The eight explicit gaps remain conditional contracts, not absent-supplier findings.

### Source-locator audit

All three works are already cached from the legal locations in sources.toml; no additional source was needed. All 24 target locator blocks were compared at theorem/section level, with the formula-extraction limits below.

| Targets | Source location actually read and correspondence |
| --- | --- |
| 0.1,3.2,3.3,4.2 | Fontaine93 lines 93–103, Theorem1 and Remark(a), printed p.3: independent Witt models and off-diagonal total≤3 theorem. |
| 0.2,3.1,3.2 | Fontaine93 lines 141–156 and 184–193, §2.1 and comparison footnote: geometric cohomology/dual, odd vanishings and degree-two Tate action, Hodge–Tate fixed-space route. |
| 1.1 | Fontaine93 lines 294–311, §3.2, printed pp.8–9: strict valuation cutoff, ≥i/p filtration, denominator (−p)ⁱ. |
| 1.2,1.3 | Fontaine93 lines 316–337, §3.4, printed p.9: filtered basis, column matrix, simultaneous equations and strict n>re/(p−1) lifting threshold. The roadmap's A(E)-congruence makes the unspecified coefficient lifts precise. |
| 1.4 | Fontaine93 lines 285–313 and 341–360, §§3.1,3.3,3.5: divided-power projection and unique recovery using invertible matrix. |
| 1.5 | Fontaine93 lines 361–368, §3.6 Lemma3, printed p.10: cardinality bound and iff field embedding. |
| 1.6 | Fontaine93 lines 369–399, §3.7 Lemma4, printed pp.10–11: approximate map gives filtered injection and enough solutions; corrected E/L choice in the roadmap. |
| 1.7 | Fontaine93 lines 110–118,400–414, Theorem2 and §3.8: upper bound, subtraction of positive lower displacement, strict different. |
| 1.8 | Fontaine93 lines 23–30 (abstract, unnumbered PDF p.1),127–139 (§1, printed p.4): crystalline lattice-subquotient form. The strict result is supported by §3.8, not inferred from the abstract's weak inequality alone. |
| 2.1,2.2,2.7,2.8 | Fontaine93 lines 141–146,172–183,274–283: ordered steps and finite/rational exhaustiveness. |
| 2.3 | Fontaine93 lines 184–197: trivial-action endpoints, weight-zero middle and unramified global kernel field. |
| 2.4 | Fontaine93 lines 198–213: simple-object route. Its table bound208 is deliberately replaced by the supplied bound287 and the verified tame estimate. |
| 2.5 | Fontaine93 lines 220–239: orientation (quotient i,sub j), local extension splitting, lower break and discriminant contradiction. The replacement of class-number input uses the already-owned discriminant rows. |
| 2.6 | Fontaine93 lines 240–273, printed pp.7–8: cyclic case and both induction branches. The global unramified ratio is explicit in the roadmap. |
| 4.1,4.2 | Schroeer23 lines 683–697, Proposition5.5 proof, printed p.16: h²⁰=1 and Witt-local obstruction. K3 supplier provides the actual Hodge computation. |
| 4.3 | CrystallineCohomology §CR.3.5 supplies the complete projective-space Hodge formula; Fontaine93 lines147–151 only support compatibility with the endpoint, as stated. |
| Elliptic Checks | LMFDB32a3 line164 equation,262 Δ=64,277 j=1728,510–517 p=2 additive III with ord₂Δ=6. Reduction implications are separately supplied by EllipticCurves. |

## Not verifiable

- **No Lean execution.** The binding read-only instruction forbids Lean builds/commands here. The supplied signatures file is unavailable because elaboration failed on the obsolete exterior-power import. I did not run the requested scratch `#check @name` elaboration or claim a successful build. The four binder comparisons above are by reading the source signatures and native definitions; S01 requires an authorized repair worker's later elaboration.
- **OCR formulas.** Fontaine93 lines98,110–118,205,225,232,250 and390 are partly missing or damaged. The numbered claims, surrounding proof and independent computations establish the reported correspondences, but do not certify every glyph of those displays. No OCR artifact was reported as an author error. Sources marked certified in the manifest were not reclassified or fetched under new keys.
- **Future contracts.** The eight supplier gaps have been checked for explicit hypotheses, ownership and boundary behavior; they are not implementations or completed proofs. Supplier targets themselves are read as contracts, not certified Lean theorems.
- **Review boundary.** Ownership checks concern the supplied sibling heads and the indexed main/open snapshots. No claim is made about later changes or unseen work. No sibling, source manifest, source text, package implementation or merge order was edited.

## Source issues

- **Misprint** in Fontaine93 at plan of the letter, printed p.4 (Fontaine93 line125): the source says §3 proves Theorem1; it should be Theorem2, the ramification theorem proved there; affects nothing.
- **Misprint** in Fontaine93 at §3.6, printed p.10 (Fontaine93 line361): the source says its notation comes from Theorem1; it should be Theorem2, which introduces the local field and filtered module; affects nothing.
- **Misprint** in Fontaine93 at §3.7, proof of Lemma4, printed p.11 (Fontaine93 lines379–381): the source chooses the uniformizer and ramification index of E; it should choose those of L, whose minimal polynomial is evaluated in E; affects the proof.
- **Misprint** in Schroeer23 at Proposition5.5 proof, printed p.16 (Schroeer23 line686): the source identifies W(F₂^sep) with the maximal unramified extension of ℤ₂; it should identify it with that extension's completion; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d5ac716e621f7b3704b01ac7b939205126aa0e67", "job": "RT-SmallRamificationAndAbelianVarietyBaseCasesPartII~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
