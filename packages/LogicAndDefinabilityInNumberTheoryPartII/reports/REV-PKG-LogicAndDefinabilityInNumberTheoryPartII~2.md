# Review of LogicAndDefinabilityInNumberTheoryPartII (package, round 2)

**Verdict:** needs changes

Ten findings: three P1, five P2 and two P3. The package elaborates, but elaboration does not establish the mathematical claims below. The package inputs were not edited.

## Previous findings, checked first

- **F01 — repaired.** README §1.4 now says “for `d = 3` Cossart–Piltant's theorem does” and explicitly applies the introduction theorem, HAL p. 5, to a projective model over the perfect field 𝔽₂. The reference, manifest entry and dependency are present. The theorem at cossart_piltant line 162 supplies a projective regular resolution; regular over 𝔽₂ is smooth. The added restriction “`d = δ(K) ≥ 1`” excludes the genuine degree-zero counterexample: H¹(𝔽₄, ℤ/2) has two elements, whereas the codimension-one direct sum has one. For dimension three, Ω¹_(𝔽₂/𝔽₂)=0 verifies the differential-finiteness hypothesis. In dimension four a projective-space example does not establish resolution for arbitrary fields, and the text correctly retains that distinction.
- **F02 — repaired.** README §1.2 now cites “Theorem 0.1 and Corollary 0.4 of arXiv v2”; the conventions, references and manifest identify the version and distinguish the published numbering. jannsen_hasse line 65 and lines 109–113 contain those statements. If r is transcendence degree over the global field, r+2=(r+1)+1=δ(K)+1, so the degree conversion is correct. The published-number crosswalk is corroborated indirectly by Dittmann–Pop, not by a separately read published Jannsen text; see Not verifiable.

The changed resolution and version passages were checked anew, including their downstream uses in §§3.1, 5.3, 5.7, 7.6 and 8.5. Neither previous finding was marked not actionable. The remaining review did not inherit the earlier review's blanket “sound” assertions. In particular, its dismissal of normalization as merely a milestone is inconsistent with the headline rule, and its design-stage resolution of the GF citations no longer resolves the package now available.

## R01 (P1) — The split quadratic algebra is incorrectly replaced by a field

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:560`, §2.2; also its second Check at line 566. Claim: “`q_{a₁, a₀} ≅ N ⊥ −a₁ N` with `N` the norm form of `E/F`”, where E=F(α₀).

**Witness.** F=ℚ, a₀=1, a₁=2: E=ℚ, so its norm is the degree-one map x↦x. The Pfister form has dimension four; two copies of E have dimension two. That norm is not hyperbolic.

**Repair.** Use the quadratic étale algebra A=F[X]/(X²−a₀), or F[X]/(X²−X−a₀) in characteristic two, and its binary norm form. Identify A with E only in the irreducible case. Keep the isotropy criterion with the separate split alternative. QuadraticFormInvariantsPartII, pull request #1834, `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md`, §1.2 already owns the split-algebra norm convention. On the witness, A=ℚ×ℚ and N(u,v)=uv; N⊥−2N is four-dimensional and isotropic. Add this split calculation to the Check. The nonsplit ℚ₃(i) and characteristic-two unramified examples remain valid.

## R02 (P2) — The bounded-extension test admits the zero ring

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:181`, §0.4. Claim: a monic factor of degree “`e ≤ N`” with no factorization into smaller-degree monic factors supplies a field interpretation.

**Witness.** Over ℚ, take h=X²+1 and g=1. The stated test accepts degree e=0: there are no smaller nonnegative degrees. But ℚ[X]/(1) has one element and 0=1.

**Repair.** Require 1≤e≤N, and state explicitly that the factor is nonconstant and irreducible. Add the rejected g=1 case and the N=0 case as negative controls. For the witness the only accepted monic irreducible factor is X²+1, yielding ℚ(i), with two coordinates and 0≠1. AKNS Lemma 2.11 provides interpretation of finite algebras; it does not turn this missing nontriviality condition into a field axiom.

## R03 (P1) — The dependence Check reverses the defined subset

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:380`, §0.14. Claim: “For `n = 1`, (b) is the complement of 0.13 in `K`”.

**Witness.** In K=ℚ(t), 0 is algebraically dependent and belongs to κ=ℚ; it does not belong to K∖κ. Conversely t is independent and belongs to K∖κ. The claimed two subsets are opposites.

**Repair.** Replace “the complement of 0.13” with “the same subset as 0.13”. Record the two membership pairs: 0 gives (dependent, constant)=(true,true); t gives (false,false). The main theorem and the Lean signature already have the correct negated-independence predicate; neither should change.

## R04 (P3) — The proposed real-place negative control is still detected at 2

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:444`, §1.1. Claim: deleting real places makes detection fail for ℚ, witnessed by (−1,−1).

**Witness.** Its invariants are 1/2 at 2 and 1/2 at ∞. Deleting ∞ leaves the nonzero 2-component. Reciprocity in fact makes Br(ℚ)→⊕_(p finite) Br(ℚ_p) injective.

**Repair.** Replace the example by K=ℚ(√5) and the base change of (−1,−1). There are two real invariants 1/2. The prime 2 is inert, since X²−X−1 reduces to X²+X+1; local degree two kills its invariant, 2·(1/2)=0. All finite invariants are zero, but the class is nonzero at each real place. Thus deleting real places now really loses detection. Keep the real-place hypothesis of the general theorem.

## R05 (P3) — Ramification outside the torus does not test shrinking the torus

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:640`, §2.7. Claim: adjoining √t₂ demonstrates that the finite normalization of the torus need not be étale everywhere.

**Witness.** In characteristic zero, t₂ is a unit on the torus. In its square-root cover, y is a unit and the derivative 2y is invertible: the cover is étale everywhere on that torus.

**Repair.** Use k₁=ℚ and l=ℚ(t₂)(√(t₂−1)). The torus point t₂=1 is now ramified: y=0 and 2y=0. On the open t₂≠1 the derivative is invertible. This tests the necessity of the smaller open U within the torus. The original square-root extension is also inseparable in characteristic two, so specify this characteristic-zero example.

## R06 (P1) — The LocalFieldsRamificationPartII supplier ids no longer resolve

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:76`, and all occurrences of GF.1/GF.5 in scope, Needs and Dependencies. The claimed owners are “§GF.1” and “§GF.5”.

**Witness.** `packages/LocalFieldsRamificationPartII/README.md:384` has §1.1 normalization/prolongations; line 423 has §1.3 valued-field henselization; lines 1086, 1112, 1137 have §§5.1–5.3. Its README contains neither GF id nor an old-numbering map.

**Repair.** Resolve each dependency to its actual target: §1.1 for normalization/prolongations; §§1.2–1.3 for henselizations and comparison embeddings; §5.1 for composition; §5.2 for coarsening; §5.3 for Abhyankar. Replace the old ids throughout this package, choosing only the sections each use needs. For example §0.2 consumes §5.3, §6.5 consumes §5.1, and §3.7 consumes §§1.3, 5.1–5.2. These statements are present at the cited lines; this is not a request to rebuild them here. The old design headings explain the earlier verdict but do not resolve citations to the available package. The roadmap is earlier in the merge order.

## R07 (P2) — The point-count supplier does not cover the varieties used

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:96` and line 336. The contract attributes an all-extension estimate for an arbitrary geometrically integral variety to WeilConjectures WC.5.

**Witness.** Pull request #1208, `TauCetiRoadmap/WeilConjectures/README.md:1121`, §5.17 assumes smooth projective geometrically connected X. Section 0.11(e) permits W=𝔸¹×E, which is not projective; its projection is smooth.

**Repair.** Import SieveMethodsAndPrimePatterns §5.4, “Uniform algebraic point counts”, `SieveLangWeil.lang_weil_uniform` (pull request #1495, `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3582`). It supplies both the geometrically irreducible affine estimate and the uniform upper bound for arbitrary fibres of bounded presentation. Explain the finite affine stratification used for W and its fibres, and list this supplier in scope, contracts and §0.11 Needs. Retain WeilConjectures for the smooth projective curve bound. On E/𝔽₂ with four points, W has 2·4=8 points, while ℙ¹×E has 3·4=12; the open variety cannot simply be substituted into the projective theorem. The Lang–Weil contract does apply to the required affine pieces, including empty or reducible fibres. This supplier is earlier in the merge order.

## R08 (P2) — A statable normalization headline is omitted

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:3`, §6.9 at line 1186; `packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean:14`. The summary promises definable finite normalizations, but the acceptance file neither states their definability nor names it as unavailable.

**Witness.** The following signature elaborated against the pins, on a scratch copy, using only the existing definition of Kronecker dimension and native carriers. No additional data encoding or missing carrier was needed.

**Repair.** Add the uniform-normalization headline, its declaration name in the README and a Layer 6 comment. A statable core is:

```lean
theorem exists_formula_arithmeticNormalization (d e : ℕ) :
    ∃ φ : FirstOrder.Language.ring.Formula (Fin (e + 1)),
      ∀ (K : Type u) [Field K] [Field.FG K],
        kroneckerDimension K = d → (ringChar K ≠ 2 ∨ d ≤ 3) →
        letI := FirstOrder.Ring.compatibleRingOfRing K
        ∀ T : Fin e → K, IsTranscendenceBasis (⊥ : Subfield K) T →
        ∀ x : K, φ.Realize (Fin.cons x T) ↔
          IsIntegral (Subring.closure (Set.range T)) x := by
  sorry
```

Quantification over e expresses the two possible transcendence-basis lengths without a complicated dependent arity. Algebraicity of κ over the prime field makes the basis conditions equivalent. The predicate is exactly membership in R_T, not a stand-in for it; dittmann_pop lines 763–765, Remark 5.4, explicitly supplies uniformity with T as variables. Include the statable normality, finite-generation and fraction-field conclusions if these are packaged in the same headline; the above is the missing uniform-definability assertion itself. Extend the existing docstring's resolution caveat to the conditional characteristic-two cases. Tests: for ℚ and the empty basis, 2 is integral over ℤ and 1/2 is not; for 𝔽₂(t) and T=t, t is integral and 1/t is not; for T=t², t is integral, since it satisfies X²−t². This also preserves inseparable finite normalizations.

## R09 (P2) — Galois action alone is not the claimed arbitrary-field descent

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:273`, §0.8a, and its Needs at line 281. The route says “the universal property makes the Galois action … effective, and Galois descent gives `Alb_V`” for arbitrary L.

**Witness.** For L=𝔽₂(s), every L-automorphism of L̄ fixes √s, although √s∉L. Thus Galois invariance over L̄ does not even descend scalars to L. SchemeAndStackFoundations §2.15 supplies étale cohomology, not effective descent of abelian varieties.

**Repair.** Replace that descent step by an explicit arbitrary-field descent target, with the full descent datum over a finite field extension, including inseparable overlaps and a compatible ample line bundle. Import the effective polarized descent statement from AlgebraicModuliForArithmeticGeometry §3.5, `ModuliDescent.polarizedDescentComparison` (pull request #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1832`), rather than attributing it to SchemeAndStackFoundations §2.15 (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:4001`). Supply a source and proof input for constructing that datum at the full generality of the claimed geometric Albanese; Serre's algebraically closed theorem alone is not that input. Do not silently restrict the whole library to perfect fields. The repaired descent condition distinguishes the witness: for L′=L(√s), the two images √s⊗1 and 1⊗√s in L′⊗_L L′ differ by a nonzero square-zero element, whereas Galois invariance sees no difference. Merely renaming the supplier leaves this mathematical gap open.

## R10 (P2) — The layer describes its organization as following sources

**Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1210`. Layer 7 says it proceeds “following Aschenbrenner–Khélif–Naziazeno–Scanlon (AKNS) and Dittmann–Pop”.

**Witness.** This is the source-following description expressly excluded by the planning contract. The actual Needs already give a mathematical order: §§7.1–7.3 → §7.4 → §7.5 → §7.6.

**Repair.** Replace the source-following clause with that mathematical explanation: bounded finite algebra interpretations and the dimension-one core produce the definable comparison; the fraction-domain presentation transfers it to fields. Keep the exact source locators on the targets. This changes no dependency and preserves the computed conductor and fraction-field examples below.

## Verified sound

### Coverage, principles and shape

Read all nine layers, all target paragraphs and Checks, the conventions, supplier contracts, metadata, sources manifest, both earlier reports, the board package index and the overlap report. Read main-roadmap shape examples AlgebraicCurves, GlobalQuadraticForms and Completed/RealAlgebraicGeometry. Every layer ends in Examples and Dependencies. Definition blocks have APIs and at least three Check bullets; the failing or nondiscriminating Checks identified above still need repair. The two-Check §0.13 is an existence theorem for a formula defining the already defined constant field, not another definition block.

The generality includes inseparable extensions, all places, real and dyadic conditions, characteristic two and finite fields. No good-prime restriction, computational algorithm, copied source passage, process residue, HTML anchor, machine path, Lean `lemma`, `set_option`, sorry'd data or prohibited import was found in the package. The only import is `import Mathlib`. Layer 7's wording is the organizational exception R10; otherwise the order is justified by the explicit mathematical dependencies rather than source chapter numbering.

The base roadmap is an existing supplier, not absent: the supplied board index identifies LogicAndDefinabilityInNumberTheory at pull request #164, head 8d875d1. Its §§0.1–0.4 own interpretations, syntax/semantics, fractions and arithmetic interpretation. This Part II starts with finitely generated fields and imports those constructions. It does not re-plan the base. Its two simple Lean definitions specialize native carriers solely to state headlines; they do not duplicate the supplier's future fully qualified declaration names.

### Seeded source audit

All fifteen requested targets were checked against the available texts. The theorem/page conventions are the author's identified versions, not an assumed published numbering. The manifest parses with sixteen distinct work keys: twelve certified and four settled uncertified. Every work in References has an entry; no entry was altered or added, and no missing-source request was made.

| Target | Text read and locator | Outcome and hypothesis check |
|---|---|---|
| 0.1 | dittmann_pop lines 35–36, 66–70, pp. 1–2; poonen_uniform lines 102–109, Definition 2.1, p. 2; jannsen_hasse lines 1889–1897, Definition 4.18 | Kronecker convention and the resolution hypothesis agree; the repaired d=3 input is independently sourced. |
| 0.3 | dittmann_pop lines 71–77, Theorem 1.3, p. 2; poonen_uniform lines 137–140, §2.3 | Fixed arity precedes the field; empty failed fibres are permitted, not arbitrary extra rings. |
| 0.4 | akns lines 595–602, Lemma 2.11, p. 13 | Supports bounded finite-algebra interpretation. It does not justify accepting g=1 as a field: R02. |
| 0.14 | poonen_uniform lines 511–542, §5, Lemma 5.2 and proof of Theorem 1.4, pp. 10–11 | Relative and absolute dependence agree with the assertions; empty tuples require false. The n=1 Check is reversed: R03. |
| 1.2 | dittmann_pop lines 149–159, Fact 2.1, p. 4; jannsen_hasse lines 65, 109–113, Theorem 0.1/Corollary 0.4 | Regular function field over the global subfield; r+2=δ+1. Version repair verified. |
| 1.4 | dittmann_pop lines 204–225, Fact 2.3, p. 5; jannsen_hasse lines 180–197, Theorem 0.6, p. 5; cossart_piltant lines 162–167, introduction theorem, HAL p. 5 | Positive d, smooth projective model and conditional resolution retained. Characteristic equals the coefficient characteristic; Kato's groups are used. |
| 4.3 | dittmann_pop lines 607–618, Notations/Remarks 4.1(5), p. 14, and line 645 | Finite zero support of a nonzero function; positive odd order follows with lower slots units. |
| 4.4 | dittmann_pop lines 614–618, p. 14 | Strict inequality is 2w(τ)>w(a); the explicit zero branch correctly handles integer-order junk values. |
| 5.2 | dittmann_pop lines 619–624, 665–683, Theorem 4.2/Recipe 4.3, pp. 14–15 | Guarded stabilizer, properness and the valuation alternative are all required. The bounded-extension subformula still needs R02. |
| 5.3 | dittmann_pop lines 71–77, 665–683, Theorem 1.3 and Recipe 4.3 | All geometric divisors, fixed d and fixed parameter length; no chosen-model restriction. |
| 5.6 | pop_eei2 lines 474–487, Notation 3.5; 633–697, Key Lemma 4.7; 699–752, §5A and Conclusion 5.2, pp. 2102, 2107–2109 | Nonzero symbol and good reduction locus retained; singleton construction uses pole order prime to n. Package corrects the source's threshold and stabilizer issues below. |
| 6.4 | dittmann_pop lines 704–713, Proposition 5.1, p. 16 | Geometric normalization uses κ[T], not ℤ[T]; e=0 gives K. |
| 6.5 | dittmann_pop lines 715–732, Proposition 5.1 proof, Case 2, p. 16 | Full e-step flag, then a finite arithmetic place. The source's rank-one index typo is corrected explicitly. |
| 7.4 | akns lines 959–961, Theorem 3.1; 968–981, Propositions 3.3–3.4; 1014–1025, 1063–1130, pp. 21–24 | Infinite domain, finite generation, localization at a nonzero conductor element and definable comparison retained. Mutual interpretations alone would not suffice. |
| 8.3 | dittmann_pop lines 44–46, Theorem 1.1, p. 1; native finite-field uniqueness opened | Exact-cardinality ring sentence plus field axioms characterizes the finite field; no inverse symbol or arithmetic interpretation is needed. |

Also read the earlier incompletely verified material: Pop 2002 Facts 1.1–1.3 at pop_eei lines 137–207 and the dimension theorem at lines 361–372; Poonen's finite-field elliptic inputs at poonen_uniform lines 233–405; Waterhouse Theorem 4.1 at waterhouse lines 619–627; AKNS's explicit coefficient coding at akns lines 1055–1059. The OCR spells some occurrences of “Fact” with a space; these passages are present. Rumely and Serre limitations are recorded below rather than treating an unreadable scan as verified. Source-internal slips were compared against the roadmap's corrected conventions. Section 6.7 also correctly chooses a residue-torus point: for g=T+1 over 𝔽₃, g(0)=1 does not make 0 a root of unity, whereas g(1)=2≠0 and 1 is a root of unity. This repairs the additional source slip recorded below.

### Computed adversarial table

“Pass” means the indicated statement survives these instances, not that an admitted theorem has been proved. Failure rows give the repair above. Empty intersections, zero branches, inseparability, the two Pfister conventions, positive-characteristic coefficients and quantifier order were tested throughout. Algebraic equalities here are calculations, not merely source matches.

| Statement | Instances tried | Values computed on both sides | Result / change |
|---|---|---|---|
| 0.1 dimension and H_d | ℚ, 𝔽₉, ℚ(s,t), 𝔽₂(s,t,u), 𝔽₂(s,t,u,v) | δ=0+1=1, 0+0=0, 2+1=3, 3+0=3, 4+0=4; resolution trigger false,false,false,false,true | Pass; arbitrary d=4 remains conditional. |
| 0.2 geometric divisor | t-adic ℚ(s,t); 2-adic ℚ; trivial valuation | Residue dimensions 2→1 with char 0=0; 1→0 with char 0≠2; trivial residue dimension unchanged and valuation ring a field | Geometric, arithmetic, excluded respectively. |
| 0.3 failed fibres | false guard; empty detecting set | false∧P=false, fibre ∅; raw intersection over ∅ is K, properness=false, final fibre ∅ | Pass; K is not an allowed failed fibre. |
| 0.4 bounded algebra | ℚ, h=X²+1, g=1 versus g=h | Degrees 0≤2 and 2≤2; quotient cardinalities 1 and infinite; dimensions 0 and 2 | Fail R02; 1≤e removes the zero ring. |
| 0.5 smooth coordinates | 𝔽_p(s)[X]/(X^p−s) | Polynomial derivative 0; residue extension degree p, inseparable; no compatible separable coefficient lifting from this argument | Smoothness/separable-residue conditions essential; retained. |
| 0.6 Pfister convention | Over ℝ, plus slots (1,1); minus slots (−1,−1) | Both give x₁²+x₂²+x₃²+x₄² and have zero locus {0}; minus slot +1 has nonzero zero (1,1) | Signs in conventions agree; no conversion by forgetting signs. |
| 0.8 dimension sentence headline | n=0,1,3 on 𝔽₄, ℚ, ℚ(s,t) | Equality matrix has diagonal true and off-diagonal false; δ values 0,1,3 | Pass; sentence chosen before K. |
| 0.8a descent | L=𝔽₂(s), L′=L(√s) | √s fixed by every automorphism; √s∉L; ε=√s⊗1−1⊗√s≠0, ε²=0 | Fail R09; fpqc compatibility detects the missing condition. |
| 0.10 characteristic sentence headline | ℚ with Z=ℤ; char 2; char odd p | [ℤ:2ℤ]=2; 2=0 fails first clause; in odd p, 2·((p+1)/2)s=s gives Z=2Z | Pass, including non-FG positive-characteristic fields. |
| 0.11 finite-field point counts | E: y²+xy=x³+1 over 𝔽₂; W=𝔸¹×E | E has 3 affine points+∞=4, trace 3−4=−1; W has 8; projective compactification has 12 | Supplier mismatch R07; ordinarity holds. |
| 0.12–0.13 constants headline | 𝔽₄(t), ℚ(t), finite 𝔽₄ | Relative constants 𝔽₄, ℚ, 𝔽₄; t not algebraic, 0 and 1 algebraic | Pass; finite-field fibre is whole field. |
| 0.14 dependence headline and Check | Empty tuple; (0),(t),(t,t²) in ℚ(t) | Empty tuple independent=true so dependent=false; singleton dependence true,false; last tuple satisfies X₂−X₁²=0 | Theorem passes; complement Check fails R03. |
| 0.15–0.16 relative closure | K=𝔽₂(s,t), k₁=𝔽₂(s), empty extra tuple; K=ℚ(t) | Relative closures 𝔽₂(s), ℚ; remaining trdeg=1 in both cases | Pass; empty tuple gives base global subfield, not K. |
| 1.1 real-place Check | (−1,−1) over ℚ and over ℚ(√5) | Over ℚ finite invariant at 2=1/2; over ℚ(√5) finite invariants all 0, real pair (1/2,1/2) | Original Check fails R04; replacement loses exactly real detection. |
| 1.2 relative Jannsen degree | K=ℚ(t) over ℚ; K=ℚ | r=1 gives r+2=3=δ+1; r=0 gives 2=δ+1 | Pass; completions of the global subfield, including real ones. |
| 1.4 positive dimension | K=𝔽₄; 𝔽₂(t); 𝔽₂(s,t,u) | d=0: source ℤ/2, target 0; d=1: degree 2 Brauer detection; d=3: ℙ³ smooth projective and degree 4 | Repaired exclusion works; d=3 model theorem correctly owned. |
| 1.5–1.6 symbol order | char 2: n=3; char ≠2: n=2 | n nonzero and invertible in both cases; n=2 in char 2 would equal 0 | Pass; μ_(2n) and no-orderings condition not discarded. |
| 2.1 niceness and 2.2 norm | ℚ₃(i), a₁=3 or 2; split a₀=1 over ℚ | Unramified norm valuations even, v₃(3)=1 excluded; N(1+i)=2 accepted; split field E=ℚ has norm degree 1 versus binary required | Nonsplit tests pass; split identity fails R01. |
| 2.3–2.6 selected parameters | Uniformizer at v₁; unit at Σ; global function field nonconstant a₁ | v₁(a₁)=1; v_Σ(a₁)=0; principal divisor degree 0 forces a pole when a zero occurs | Pass; the omitted split place is necessary, and pole is allowed there. |
| 2.7 torus specialization | y²=t and y²=t−1 over ℚ[t,t⁻¹] | First: 2y is a unit everywhere; second: derivative=0 at (t,y)=(1,0), invertible when t−1≠0 | First does not test shrinking; R05. |
| 3.2–3.5 units and root fields | u=2, ε=1; normalized valuation with lower unit and outer value 1 or 2 | a=u²−u−ε=1; a/u²=1/4=1−1/2−1/4, not 3/4; outer parity 1 odd, 2 even | Minus sign correct; even-order detector rejected under unit hypotheses. |
| 3.6–3.8 coarsening | Lexicographic Γ=ℤ², w(a_d)=(1,0), lower value (0,1) | No N has N(0,1)≥(1,0); after quotient by {0}×ℤ values become 1 and 0 | Pass; lower slot becomes a unit, top stays positive. |
| 4.1–4.2 stabilizer | b=∅, b=K, b=t²O for a DVR | Stab(∅)=K=Stab(K); v(x t²)≥2 iff v(x)≥0, so Stab(t²O)=O | Pass; properness cannot be omitted from final formula. |
| 4.3 detecting family | Nonzero constant a_d; globally isotropic q; unique zero of odd order | Zero support ∅ in first case; anisotropic-place set ∅ in second; third V_a={w}; negative-order poles omitted | Pass; finiteness uses nonzero a_d and curve places. |
| 4.4 strict ball | w(a)=1,3; w(τ)=0,1,2; τ=0 | For 1: false,true,true; for 3: false,false,true. Thus B=𝔪 and 𝔪². Explicit zero branch=true although integer ord(0)=0 | Pass; strict inequality and zero convention agree. |
| 4.5–4.8 intersections and isolation | Two places t=0,t=1 of k(t), x=t/(t−1) | v₀(x)=1, v₁(x)=−1; neither x nor x⁻¹ belongs to both rings; singleton gives Stab(𝔪)=O | Pass; two-place intersection is not a valuation ring. |
| 5.1–5.2 guarded formula | Zero slot; V_a=∅; two-place intersection; singleton | G=false→∅; raw=K→proper=false→∅; inverse alternative=false→∅; singleton O passes all ring and inverse axioms | Pass after bounded-extension repair R02. |
| 5.3 d≥3 coverage | K=ℚ(s,t), t-divisor and exceptional divisor at origin | t-divisor residue ℚ(s), δ=2; exceptional residue ℚ(s/t), δ=2; K has δ=3 | Both eligible; model-specific omission would be wrong. |
| 5.5 characteristic-two threshold | n=3, β=1, char 2 | Old 2n=0 gives v(2n)=∞ and impossible ∞>∞; corrected c_n=n has value 0 and v(β−1)=∞>0 | Package uses corrected threshold; source issue below. |
| 5.6 shifted singleton | One place P; R=1+𝔪_P; pole order m modulo n | (1+𝔪_P)²=1+𝔪_P (factor 1 allowed); subtracting 1 gives 𝔪_P; n∣m gives v_P(f)=0 mod n and P absent | Pass; coprime pole order required. |
| 5.7 divisor headline, all d | Finite field; ℚ; 𝔽₂(t); ℚ(s,t) | First two have no geometric DVR with required residue dimension/characteristic; false formula exhausts empty set. t-adic 𝔽₂(t) has δ residue 0 and δ field 1; ℚ(s,t) has 3→2 | Pass; proper DVR excludes the field valuation. |
| 6.1–6.4 geometric intersection | ℚ(t), T=t; 𝔽₂(t), T=t²; K=ℚ,T=() | S_T=ℚ[t]; in inseparable case integral closure of 𝔽₂[t²] is 𝔽₂[t]; empty geometric intersection=ℚ | Pass; normality and all height-one primes are needed. |
| 6.3 normality negative control | A=k[t²,t³], Frac(A)=k(t) | t satisfies X²−t²=0 but t∉A; normalization k[t] strictly larger | Normal-domain hypothesis retained; theorem not extended to nonnormal A. |
| 6.5 full geometric flag | ℚ(s,t), s=1 then t=1; e=0 for ℚ | Rank-one residue ℚ(t), δ=2; two-step residue ℚ, δ=1; empty geometric flag leaves ℚ and all finite terminal places | Pass; rank-one flags alone would miss arithmetic coefficients. |
| 6.6–6.9 arithmetic intersection | ℚ(s), x=(s+2)/3, flag s=−1 then 3; ℚ(i), prime 5 split | x maps to 1/3, order −1; 1/(2−i) is integral at 2+i but has order −1 at 2−i | Pass; arithmetic terminal place and all prolongations essential. |
| 6.9 missing Lean headline | ℚ,T=(); 𝔽₂(t), T=t or t² | R_T=ℤ, 𝔽₂[t], 𝔽₂[t]; 1/2,1/t,1/t excluded respectively; t integral over 𝔽₂[t²] | Exact native predicate elaborates; R08. |
| 7.1–7.4 arithmetic coding and conductor | Coefficient code n=1,2 over 𝔽₂; core ℤ[√5] | n=1 has no positive-index bit→polynomial 0; n=2 gives coefficient 1 at index 0. (1+√5)/2 is missing from core but enters after inverting 2 | Package uses i≥1 and conductor localization; no false automatic Dedekind claim. |
| 7.4 domain bi-interpretation | Finite 𝔽₄ versus ℤ[t] | Any finite power/quotient of 𝔽₄ is finite, so cannot interpret infinite ℤ; ℤ[t] is infinite and meets FG/domain hypotheses | Finite domain excluded from this theorem, but covered by §8.4. |
| 7.5–7.6 fraction comparison | B=ℤ or 𝔽₂[t]; pairs (1,2),(2,4) over ℤ | 1·4=2·2=4; both classes map to 1/2; denominator 0 excluded | Pass; fraction field is ℚ or 𝔽₂(t), with definable comparison. |
| 8.1–8.2 finite-generation language | ℚ as a ring and as a total-inverse structure | ℤ[a₁,…,a_r] inverts finitely many primes, so is not ℚ; closure of {1} under total inverse and ring operations is ℚ; inverse graph gives (0,0), not (0,1) | Pass; the QFA bridge uses the correct language and FG class. |
| 8.3 finite-field sentence | q=4 on 𝔽₄, 𝔽₂, ℤ/4ℤ; q=1 boundary | Exact-cardinality test true,false,true; field axiom true,true,false; combined true,false,false. One-element ring fails field axiom | Pass; cardinality alone is insufficient. |
| 8.4 domain sentence headline | B=ℤ; test S=ℤ, ℤ/2ℤ, zero ring | Nonempty ring equivalence true,false,false, as characteristic and 0≠1 show | Signature includes IsDomain B and FG commutative S, not just fields. |
| 8.5 field sentence headline | K=𝔽₄; L=𝔽₄,𝔽₂,𝔽₄(t) | Isomorphism predicate true,false,false; sizes 4,2,infinite | Pass; L has only Field and Field.FG, with no extra H_d assumption. |

### Acceptance file, headlines and padding

The headline inventory is: fixed-dimension sentences (§0.8), characteristic sentence (§0.10), uniform constants (§0.13), dependence (§0.14), uniform geometric divisor families (§§5.3, 5.7), definable finite normalizations (§6.9), arithmetic bi-interpretation for infinite domains and fields (§§7.4, 7.6), and the domain/field characterization sentences (§§8.4, 8.5). Seven are stated as theorems; divisor dimensions are combined in one signature. Bi-interpretation is correctly named as unavailable because the interpretation/homotopy carriers are absent. Conditional high-dimensional characteristic-two statements are explicitly identified as unavailable because the required resolution hypothesis has no established carrier. Normalization is the omission R08. Finite-field characterization is covered by the general field headline, not padded with a separate boundary-case theorem.

Ran the requested `lake env lean` elaboration on `packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean` from the pinned content checkout: exit 0, exactly seven `declaration uses sorry` warnings, at lines 53, 62, 75, 84, 97, 115, 126; no other warning. No Tau Ceti module build was needed. A scratch copy with `#check @name` for all nine declarations also elaborated. Compared each signature with §§0.1, 0.2, 0.8, 0.10(e), 0.13, 0.14(b), 5.7, 8.4 and 8.5: no lost section binder and no mismatch in the seven stated theorems. The final field theorem correctly places hK on K only. No input file changed.

Every one of the seven admitted theorems was tested with `simp`, `rfl` and `infer_instance`; none closed. Each was also probed with bottom/top existential witnesses followed by `simp`; none supplied a proof. The probe file elaborated with its final sorries, and its only additional lint was in a deliberately failing probe, not the package. Reviewed the library near-match leads at the pins: none is an exact lemma proving these uniform first-order assertions. Consequently there is **no padding finding** and no theorem to delete for being a one-tactic consequence. The separately elaborated normalization signature is a positive test of statability, not an added package declaration.

### Pinned declarations and duplication by object

Pins checked: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. File names below are relative to those library roots. These are opened declarations, not search-result suggestions.

| Library file and line | Declaration/object and comparison |
|---|---|
| `Mathlib/Algebra/Field/Subfield/Basic.lean:458` | Field.FG: a finite generating set for the subfield, not finite type as a ring. |
| `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45` | Algebra.trdeg is cardinal-valued. |
| `Mathlib/RingTheory/AlgebraicIndependent/Defs.lean:54`, line 173 | AlgebraicIndependent uses injective polynomial evaluation; IsTranscendenceBasis is native, including empty bases. |
| `Mathlib/FieldTheory/AlgebraicClosure.lean:39` | algebraicClosure is the relative algebraic intermediate field. |
| `Mathlib/FieldTheory/Finite/GaloisField.lean:260` | FiniteField.ringEquivOfCardEq requires finite field structures/cardinal equality, not merely a finite ring of that cardinality. |
| `Mathlib/RingTheory/Valuation/ValuationSubring.lean:37`, line 298 | ValuationSubring and ofPrime. ValuationSubring alone permits the whole field; discreteness/properness must be added. |
| `Mathlib/RingTheory/Valuation/LocalSubring.lean:117` | LocalSubring.exists_le_valuationSubring; no geometric-prime-divisor conclusion. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054` | QuadraticMap.Anisotropic is the zero-locus condition, not a dimension or nonsingularity condition. |
| `Mathlib/ModelTheory/Algebra/Ring/Basic.lean:223` | FirstOrder.Ring.compatibleRingOfRing supplies the actual ring-language interpretation. |
| `Mathlib/ModelTheory/Definability.lean:54` | Set.Definable; does not supply the required one-formula-across-fields existence theorem. |
| `Mathlib/ModelTheory/Semantics.lean:526`, line 627 | Formula.Realize and Sentence.Realize. |
| `Mathlib/RingTheory/Henselian.lean:95` | HenselianLocalRing extends IsLocalRing and asserts simple-root lifting; completeness is not part of it. |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56` | IsDiscreteValuationRing excludes a field via the nonzero maximal ideal condition. |
| `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean:28` | ResidueField is quotient by the maximal ideal. |
| `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean:74`; `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:223` | IsIntegrallyClosed and integralClosure already provide the normalization predicates, not uniform ring formulas defining them. |
| `Mathlib/RingTheory/FiniteType.lean:39`; `Mathlib/RingTheory/Localization/FractionRing.lean:52` | Algebra.FiniteType and IsFractionRing; no FG-field/FG-ring conflation. |
| `Mathlib/RingTheory/Algebraic/Defs.lean:45`; `Mathlib/Algebra/CharP/Defs.lean:154` | IsAlgebraic and ringChar; characteristic zero contributes the explicit extra 1 in δ. |
| `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean:561` | HeightOneSpectrum.iInf_localization_eq_bot is in the Dedekind setting; it does not duplicate the arbitrary normal Noetherian intersection theorem of §6.3. |
| `Mathlib/ModelTheory/Algebra/Field/CharP.lean:47`; `Mathlib/RingTheory/KrullDimension/Field.lean:24` | A theory of fields of fixed characteristic is not the characteristic sentence headline; ring Krull dimension of a field is 0, not its Kronecker dimension. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96`, lines 196, 209 | ValuationSpectrum.patchTopology, compactSpace_patchTopology and isClopen_patchTopology_basicOpen; genuine compactness/clopen API. |
| `TauCeti/FieldTheory/FunctionField/Place/Basic.lean:103`, lines 132, 145, 167 | Place, integers, ord, ord_zero. Place is a normalized surjective valuation trivial on constants; the structure alone does not assert a function-field hypothesis. ord(0)=0. |
| `TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:145` | exists_ne_zero_forall_mem_ord_eq, for finitely many places. |
| `TauCeti/FieldTheory/FunctionField/Consequences/HighDegree.lean:247` | exists_ord_eq_neg_and_forall_ne_ord_nonneg; requires the function-field and constant-field closure hypotheses and n≥2g. The package chooses large positive m coprime to n. |
| `TauCeti/FieldTheory/FunctionField/Consequences/StrongApproximation.lean:88` | exists_forall_mem_valuation_sub_le_and_forall_mem_integers; an omitted place is required. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84` | AbelianVariety.IsAlbanese is a pointed factorization property. It neither constructs an Albanese for arbitrary varieties nor supplies arbitrary-field descent. |

Searched by object using the roadmap service and local pinned files: interpretation/homotopy, uniform constants and dependence, geometric prime divisors, valuation composition, finite normalization, height-one intersections, Albanese universality and norm forms. Existing valuation, norm-residue, global-field, approximation and quadratic-form objects are imported. The retained general normal-Noetherian intersection and arbitrary-variety Albanese targets are not supplied by the weaker native instances inspected; R09 concerns their missing proof input, not an instruction to duplicate an existing carrier. No duplicate fully qualified declaration name was found for the nine acceptance-file declarations. All backticked names attributed to this roadmap resolve to its two definitions and seven theorems; other declaration-like names are attributed to suppliers.

### Supplier order, contracts and overlaps

The requested dependency command completed with:

```text
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This establishes the direction of named-roadmap edges; it does not validate the section contents, which were checked separately. Every Needs line and supplier citation was read. The content failures are R06, R07 and R09.

| Supplier and resolved sections | What was checked at main, the provided board head, or the open head |
|---|---|
| LogicAndDefinabilityInNumberTheory §§0.1–0.4, #164 | Quotient interpretations, semantics/composition, fraction-pair interpretation and arithmetic; the homotopy extension is a declared gap. |
| QuadraticFormInvariantsPartII #1834, §§1.1, 1.2, 1.5, 2.5, 3.1, 3.7–3.9, 4.1–4.3, 5.6–5.7, 6.3, 6.5, 7.2 | Characteristic-sensitive Pfister norm convention; Kato groups and residues; principal-unit and value-independence criteria; Kronecker dimension; non-FG isotropy criterion; patch-open henselian isotropy. §6.5 allows the non-FG henselian relative-closure field used in §3.7. |
| LocalFieldsRamificationPartII current board README §§1.1–1.3, 5.1–5.3 | Objects exist; old GF ids do not. R06 gives the exact replacement sections and lines. |
| AlgebraicModuliForArithmeticGeometry #853, §7.5 | arithmetic_normalization_genericallyEtale; ArithmeticCoefficients.valuation_prolongation_integrality and root_coefficient_descent. The first intersection comparison does not require the intersection's fraction field to be the ambient field; the coefficient statement includes all roots with multiplicities. Resolver leads for those two names are false alarms. §3.5 is relevant to R09. |
| AdicCoefficientsAndComparisonsPartII #1796, §§PA.6.8, PA.6.10 | Odd-degree regular alterations and detection over the indicated excellent henselian DVR; residue-characteristic restriction retained. |
| ArithmeticGaloisDuality §§R02.3.2, R02.4.4 | Function-field class formation and cd bounds; the cyclic function-field Hasse norm theorem is expressly a gap, not claimed present. |
| ClassicalAdicEtaleCohomology §11.2 | Cohomological-dimension ascent by transcendence degree. |
| FunctionFieldArithmetic §5.8 | Degree-sensitive Frobenius/constant-field compatibility; split places in sufficiently large compatible degrees, not every degree. |
| AbelianSchemesAndArithmeticModuli §§A3.1, A6.5; NeronModelsAndSemistableAbelianVarieties §5.1 | Isogenies, Poincaré reducibility and good-reduction invariance via inertia. |
| WeilConjectures §§WC.5.17, WC.5.29; AnalyticNumberTheoryPartI §0.21 | Smooth projective point-count estimates and curve bound; Mertens estimate. The larger claimed Lang–Weil input fails: R07. |
| LefschetzPencilsAndVanishingCycles §§3.4–3.5 | Pencils after suitable embedding and descent to a finite field; model and dimension hypotheses retained. |
| DeligneWeightsAndPurity §§7.12, 7.15; MotivesAndAlgebraicCycles §0.5b; KTheoryFiniteLocalFields §§3.0–3.0a | Weight bounds, Gersten-type input, Bloch–Gabber–Kato and norm-residue comparisons with the two characteristic regimes distinguished. |
| SchemeAndStackFoundations §§0.12, 0.20, 2.15, on main | Henselian, normalization/excellence and cohomological descent inputs; §2.15 does not provide effective Albanese descent, R09. |
| AlgebraicCurves Layers 0, 2, 6, 12, on main | Places, normal affine models, prolongations/fundamental equality without a perfect-base assumption, closed points of the normal proper curve. |
| Completed/Chebotarev Layer 10; Completed/GlobalNumberFields Layers 1, 6 | Splitting primes outside a finite set; weak and strong approximation. Opened hasDirichletDensity_frobeniusPrimeSet and the finite-adele dense-range statement. |
| ClassFieldTheory Layers 10, 13; GlobalQuadraticForms §5.5, on main | Brauer reciprocity, number-field cyclic Hasse norm theorem, local-global quadratic-form input; real places retained. |
| Completed/RealAlgebraicGeometry Layer 1; EllipticCurves Layers 1, 3–6; JacobianChallenge Layer F | Ordered real-closure existence, elliptic formal/finite-field/reduction/twist/arithmetic inputs, pointed Abel–Jacobi universality. The last is not arbitrary-variety Albanese existence. |

Both declared gaps occur with matching slugs and named suppliers in `design/plan.json` and the README's Exact supplier contracts: `biinterpretation-homotopy` and `function-field-cyclic-hasse-norm`. They specify the missing data/theorem and hypotheses, ask for no identified duplicate at the pins or earlier owners, and are not findings. The first concerns both comparison homotopies, not mutual interpretability; the second concerns cyclic extensions and all places. Their eventual discharge remains part of the supply contract.

Read the supplied overlaps report and checked its closest scopes: QuadraticFormInvariantsPartII #1834, AdicCoefficientsAndComparisonsPartII #1796, HeightsRationalPointsAndObstructions #1017, EtaleDualityAndPerverseSheavesPartII #1743, and AnabelianGeometryAndNonabelianChabauty #1021. The first two own the imported quadratic/cohomological machinery; the others own heights, duality or anabelian/Chabauty constructions rather than uniform ring-language definitions of all geometric divisors. No shared object was found that both this package and one of those heads claim to own. The overlap report has no conflicting modification, dropped cited id or open-revision-only id for this roadmap. The GF issue is drift from a board design to its available package, not an unreported conflicting pull-request revision. No inspection of unspecified open heads is claimed.

## Not verifiable

- **Four settled uncertified works:** kato_hasse, merkurjev_suslin, moret_bailly and lenstra_cm. Their primary texts were not available for direct verification. The locators remain recorded under the existing keys; these are not new missing-source requests. Available Dittmann–Pop/Poonen statements corroborate the uses but do not count as having read the primary proofs.
- **Serre's scan:** serre_albanese at Théorème 5, p. 10-10, lines 368–405 is substantially garbled by OCR. The algebraically closed setting can be identified, but the complete printed assertion/proof cannot be certified from that extraction. Independently of OCR, the stated arbitrary-field Galois descent step fails the test in R09.
- **Rumely's detailed sequence coding:** rumely around p. 211, lines 687–690 has damaged OCR. The introduction's uniform-definability assertions are readable; the exact coding passage is not fully certified. The explicit coding used in §7.2 is also in the readable AKNS passage cited above.
- **Published Jannsen numbering:** checked arXiv v2 directly. The published crosswalk is indirect, as disclosed in the previous repair; no claim is made to have read the published numbering separately.
- Ownership against open pull requests whose heads/files were not supplied was not independently checked. Main, the supplied board index/packages and the authorized roadmap-service results were used; absence was not inferred from the single board checkout alone.

## Source issues

- **Misprint** in dittmann_pop at Proposition 3.10, Claim 1, p. 12: the source says the divided lower-slot expression has a positive epsilon term; it should be negative, since a=u²−u−ε; affects the proof.
- **Misprint** in dittmann_pop at Proposition 5.1, Case 2, p. 16: the source says to index the arithmetic composites by the rank-one family W_T; it should be full geometric e-divisors with terminal number-field residue; affects a stated result.
- **Error** in pop_eei2 at Notation 3.5, p. 2102, and Recipe 5.1, p. 2109: the source says the strict threshold uses v(2n) also in characteristic two; it should use v(n) there, as 2n vanishes; affects the proof.
- **Gap** in pop_eei2 at Recipe 5.1(4), p. 2109: the source says to stabilize the intermediate U-set; it should justify that stabilization or stabilize the shifted product identified with the maximal ideal; affects the proof.
- **Error** in akns at proof of Theorem 3.1, p. 23: the source says the finitely generated arithmetic core is Dedekind; it should invert a nonzero conductor element before using Dedekind properties; affects the proof.
- **Misprint** in akns at §2.9, p. 19: the source says QFA quantifies over structures without the finite-generation restriction; it should quantify over finitely generated structures, as in the introduction; affects a stated result.
- **Misprint** in akns at Lemma 3.8, p. 23: the source says the binary coefficient sum starts at index zero although those digits start at one; it should start at one; affects nothing.

- **Misprint** in dittmann_pop at Lemma 5.3, Claim, p. 17: the source says a residue tuple avoiding the polynomial zero set has root-of-unity coordinates; it should choose such a tuple in the residue torus; affects the proof.
