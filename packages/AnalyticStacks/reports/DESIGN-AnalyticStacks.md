# Design report: AnalyticStacks

## What the design covers

The design is in `packages/AnalyticStacks/design/README.md`, with the same plan as data in `packages/AnalyticStacks/design/plan.json`. It has 8 layers, 60 targets, 180 tests and 1 supplier gap. The sources manifest is `packages/AnalyticStacks/sources.toml`: 24 entries, all certified, and `sources check` reports 0 problems.

The layer labels 0–7 are the ones the triaged target proposed and the consumers already cite. They are also the build order.

- **0, abstract six-functor formalisms (13 targets).**
  - Geometric setups and the symmetric monoidal ∞-category of correspondences.
  - The two Liu–Zheng gluing theorems for restricted multisimplicial nerves.
  - Three- and six-functor formalisms, the construction principle and the extension to sheaves.
  - The kernel bicategory, built as a Mathlib `CategoryTheory.Bicategory` (the homotopy 2-category).
  - Suave and prim objects, defined by `CategoryTheory.Bicategory.Adjunction`.
  - Suave, prim, smooth, étale, proper, open and closed maps; exceptional descent.
  - !-descent for Künneth formalisms, and the ∞-topos obtained by inverting !-equivalences.
- **1, algebraic stacks (7 targets).**
  - The affine quasi-coherent formalisms D and D^cond.
  - AlgStk, the !-topology (descendable covers) and the embedding of schemes.
  - Qcqs maps of schemes are prim with δ = 1; formal completions.
  - Classifying stacks of flat affine groups as comodules (for the MotivesAndAlgebraicCyclesPartII interface).
  - Graded, filtered and complete filtered modules; 𝔸̂¹ = BG_a[−1] and shearing.
- **2, light analytic rings (11 targets).**
  - Condensed animated rings; analytic rings; colimits, induced structures and completion; invariance.
  - Idempotent algebras, the smashing locale and open and closed immersions.
  - The comparison with SolidAnalyticRings §7.1.
  - Solid structures on discrete rings, including the localization kernels; discrete Huber pairs.
  - Solid Huber rings; rational localizations and the solid spectrum, with Stone duality; E_■ and ℚ_{p,■}.
- **3, analytic stacks (8 targets).**
  - The !-able class and the formalism on affinoids; AnStk(C₀).
  - The solid six operations on schemes and discrete adic spaces.
  - Solid Huber stacks; stacks over ℚ_{p,■}; formalisms with analytic coefficients.
  - The realization of algebraic stacks.
- **4 (5 targets).** Betti realization; classifying stacks of locally profinite groups, including the modulus dualizing complex; nuclear modules over solid ℚ_p-algebras and their descent; Fredholm analytic rings; perfect complexes on stacks of Fredholm rings.
- **5 (3 targets).** The cotangent complex of analytic rings, its properties and the descent of its exterior powers.
- **6 (6 targets).**
  - Solid finite presentation; solid smooth and étale maps.
  - Suaveness of regular immersions and of lci maps; cohomological smoothness of locally solid smooth maps.
  - The deformation to the normal cone.
  - Serre duality f^!1 ≅ det(L)[n], with the scheme, rigid, coherent-duality and ℤ/p^s corollaries.
- **7 (7 targets).**
  - Lurie's Cartier duality for bialgebras.
  - 1-categorical Cartier duality in Künneth formalisms; 1-suave and 1-étale maps, with Rodríguez Camargo's descent criterion.
  - Lattices against tori; the five additive dualities; stacky duality for vector bundles and gerbes.
  - Classifying stacks of 𝔾_m^an.

**Design decisions.**

1. **No (∞,2)-categories.** Suave and prim objects, and every adjunction argument, are carried out in the homotopy bicategory hK_{D,S}. This is a Mathlib bicategory, and adjunctions in it are Mathlib's `Bicategory.Adjunction`. In the Künneth case (every formalism of Layers 1–4), the kernels embed into D(S)-linear presentable ∞-categories (RCSolid Lemma 6.3.6; RC26a Proposition 2.1.9). 7 therefore works inside Mod_{D(S)}(Pr^L_κ), treated as an ∞-category, with linear adjoints as properties. The triage report listed (∞,2)-categories as a risk; the design does not need them.
2. **General base.** Analytic rings are defined over arbitrary light condensed animated rings, as in RCSolid Definition 4.1.1. ℚ_{p,■} is the instance (ℚ_p, ℤ_p)_■ (2.11), and the stacks over ℚ_{p,■} are the instance AnStk(C₀) for induced algebras (3.6).
3. **Dualizing complex.** The dualizing complex is the determinant: f^!1 ≅ det(L)[n] (6.6). The shorthand L_g[d] of ALRS Remark 6.5.6 is recorded as a Check that is correct only for d = 1. A second Check refutes it for 𝔸², where L[2] = O²[2] is not invertible.

## Adversarial pass

Each row records the instances tried and the values computed. Where a value refuted a first formulation, the change is recorded.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 geometric setup | surjections of sets; open immersions; smooth maps | Δ: {a,b} → {a,b}² misses (a,b); open immersions have iso diagonals; Δ of 𝔸¹ is a closed immersion, not smooth | definition excludes surjections and smooth maps | none |
| 0.2 Corr | {1} ← {1,2} → {1} composed with itself; E = isos | apex {1,2}×{1,2}, cardinality 4; Corr(C, iso) ≃ C^op | consistent | Check compares with Mathlib `CategoryTheory.Span.SpanBicat` |
| 0.3 Liu–Zheng | point; Nagata decomposition; surjections | point ↦ Δ⁰; p: ∗⊔∗ → ∗ and q: ∗ → ∗⊔∗ give p∘q = id with q not surjective | admissibility hypothesis needed | first Check example of non-admissibility corrected |
| 0.4 formalisms | finite sets; constant functor; f_! := f_* on (0,1) ⊆ [0,1] | f_!(M₁,M₂) = M₁⊕M₂; constant functor with identities is lax monoidal; i*j_*ℤ = ℤ ≠ 0 | constant functor is a 3FF, so D(∅) = 0 is not forced | Check claiming D(∅) = 0 for every 3FF replaced; D(∅) = 0 moved to the sheaf condition |
| 0.5 construction principle | finite sets; 𝔾_m ⊆ 𝔸¹ with ℙ¹ → ∗; sets with I = P = all and ℕ → ∗ | ⊕_m∏_n Λ → ∏_n⊕_m Λ misses the identity matrix | condition (c) is necessary | truncation Check replaced by this computed one |
| 0.6 extension | constant formalism; disjoint unions | empty cover forces D(∅) = ∗, but constant gives D(Λ); D(⊔X_i) = ∏D(X_i) | constant formalism not sheafy | earlier speculative B(ℤ/2) Check removed |
| 0.7 kernels | point; 2×2 finite sets; π₁₃* instead of π₁₃! on 𝔸¹_k | delooping of hD(Λ); matrix product; π_!O = T⁻¹k[[T⁻¹]][−1] ≠ k[T] = π_*O | ! is forced | Check made computed |
| 0.8 suave objects | f = id; zero object; finite-set row (Λ, 0) | unit diag(Λ,Λ) → diag(Λ,0), counit id_Λ, zigzags identities; Λ^{⊕ℕ} has no dual | consistent with HM Example 4.4.3 | criterion bullet corrected to SixFF Proposition 6.6 (p₁*M ⊗ p₂*D_f(M) → Hom(p₂*M, p₁^!M)) |
| 0.9 suave maps | id; finite sets; ∗/ℤ_p over 𝔽_p and over ℚ | ω = 1; ω = 1; ω = 𝔽_p[1] (cd 1, HM Example 5.3.22) and ℚ[0] | smooth ≠ trivial ω | HM Lemma 4.5.10 stated with its conservativity hypothesis |
| 0.10 étale/proper | equivalences; finite sets; Spec ℤ[1/p] → Spec ℤ in 1.1 | (∏ℤ/pⁿ)[1/p] ∋ image of (1,1,…) ≠ 0, while ∏(ℤ/pⁿ)[1/p] = 0 | Zariski open immersions are closed maps, not étale, in the algebraic formalism | non-truncated Check replaced |
| 0.11 exceptional descent | fold map; A → A×A; ℤ → ℚ | split nerve; index 1; 𝔽_p ⊗ ℚ = 0 | non-descendable fails | none |
| 0.12 Künneth !-descent | ℤ → ℤ[1/p] × ℤ_p; empty family; ℤ → ℤ[1/p] | fracture square ℤ = ℤ[1/p] ×_{ℚ_p} ℤ_p; D(X) = 0 iff empty covers | consistent | ℤ → ℤ[1/p] × 𝔽_p corrected to ℤ_p (𝔽_p does not give a finite limit) |
| 0.13 !-equivalence topos | identity; Spec(ℤ×ℤ) → Spec ℤ; omitting diagonals | image is a !-equivalence; ABLB footnote 26 | diagonal condition needed for ABFJ22 | none |
| 1.1 affine formalism | ℤ[T]/(T²); ℤ[x,y]/(x²,xy,y²); ℤ[T]; zero ring | ω ≅ B (generated by T^∨); ω needs 2 generators; ℤ[T] not perfect; ω = 0 | suave ≠ smooth; polynomial not suave | garbled first Check replaced by these two |
| 1.2 AlgStk | ℤ → ℤ[1/p] × ℤ_p; k → l finite; empty | descendable; index 1; only A = 0 | consistent | none |
| 1.3 qcqs prim | 𝔾_m ⊆ 𝔸¹; ℙ¹ → Spec ℤ | j_! = j_*; f_*O = ℤ, δ ≅ 1; ℙ¹ not suave algebraically | consistent | none |
| 1.4 formal completions | U open; Z = V(p) in Spec ℤ; 𝔸̂¹ | X^∧_U = U; derived p-complete, ℚ_p^∧ = 0; f^!ℤ = O[1] vs ι^!ℤ = ℤ[−1] | signs consistent | direction j_* (not j*) fully faithful corrected |
| 1.5 classifying stacks | 𝔾_m; trivial G; 𝔾_a over 𝔽_p | heart = graded modules; A-modules; φ(1) = 0 for every comodule map R → 𝔽_p | summand criterion fails for 𝔾_a; still a !-cover (countable flat) | Check recomputed |
| 1.6 graded/filtered | O of 𝔸¹/𝔾_m; ι₀^!1; constant vs p-adic filtration | Rees R[t] with t weight −1; t^{−1}R[−1]; lim = ℤ ≠ 0 vs lim pⁿℤ_p = 0 | weight convention pinned | none |
| 1.7 formal line | ℤ ⊗^L_{ℤ[T]} ℤ; Beilinson heart | π₀ = π₁ = ℤ, π₂ = 0; weight-one static object enters the heart as M₁[1] | ℚ-linearity kept for the heart | speculative 𝔽_p Check replaced |
| 2.1 condensed rings | ∅; {1,2}; ℕ∪{∞} | T(∅) final; ℤ²; ⊕ lacks the all-one vector, ℤ × ∏ℤ has it | consistent with SolidAnalyticRings §1.5 | none |
| 2.2 analytic rings | ℤ_■; {0}; perfect modules; discrete objects | ℤ_■[S] = lim ℤ[S_n]; zero structure analytic only for 0; ⊕Λ not perfect; ∏ℤ not discrete | axioms discriminate | none |
| 2.3 colimits | (ℤ[T],ℤ)_■[S]; ℤ_■ ⊔ ℚ^cond; ℤ_■ ⊔ ℤ_■ | (∏ℤ)[T] ≠ ∏ℤ[T]; ℚ_{ℤ_■/}; idempotent | Künneth instance | none |
| 2.4 invariance | ℤ[ε]/ε²; torsion groups | ∏ℤ/n not torsion | consistent | none |
| 2.5 idempotents | R[1/f]; R[T]; ℤ[1/2] ∪ ℤ[1/3] | R[T]⊗R[T] = R[T,T′]; a − b onto ℤ[1/6] (1/6 = 1/2 − 1/3), kernel ℤ | union = unit, i.e. a cover | Check rewritten with computed fibre |
| 2.6 spectral comparison | ℤ_■; (ℤ[T],ℤ)_■; ℤ^cond | F = ∅ structure; ℤ[ℕ∪{∞}] not solid | only rings over ℤ_■ compared | none |
| 2.7 discrete solid rings | ℤ[T] completeness; ℚ_p with T = p^{±1}; ℚ_■ | j*j_*ℤ[T] = ℤ[T]; (1 − p⁻¹σ*)(pⁿ) = 0; ℚ_■[S] = colim_B lim B[S_n] | T = p⁻¹ excluded, T = p admitted | proof of RCSolid Lemma 5.4.13(2) (left to the reader in the source) given as a target |
| 2.8 discrete Huber pairs | (ℤ[T],ℤ), (ℤ[T],ℤ[T]); ℤ[T]/Tⁿ; 𝔽₂[ε]/ε²[T] | mapping spaces R, R×R⁺; R⁺ not sifted-colimit preserving; (εT)² = 0 | consistent with SolidAnalyticRings §7.3 Check | none |
| 2.9 solid Huber rings | ℤ_■, (ℤ_p,ℤ_p)_■; (ℤ[T],ℤ)_■; Sym ℤ_■[S] | A°° = 0, pℤ_p; A⁺ = ℤ; compact but not finite type | consistent | none |
| 2.10 solid spectrum | k_■; ℤ_■; ℤ[T]_■ ⊆ ℤ[T^{±1}]_■; M₃ | k_■: point; ℤ_■ → ℤ[1/n]_■ rational, maps onto \|Spec ℤ\| | first Check ("Spec_■(ℤ_■) is a point") was false | corrected |
| 2.11 ℚ_{p,■} | induced vs (ℚ_p,ℤ_p)_■; completed sums; discrete ℚ_p | ℤ_p[[q]]/(1 − xq) = 0 for x ∈ ℤ_p; ℚ_{p,■}[S] = (∏ℤ_p)[1/p] | induced = (ℚ_p,ℤ_p)_■ | justification changed: And21 Theorem 3.5 is about condensed structure and does not give the equality; now RCSolid line 1309 and CSCond Examples 7.3(ii) |
| 3.1 !-able class | ℤ_■ → ℤ[T]_■; ℤ_■ → ℤ_{p,■} → ℚ_{p,■}; (ℤ[T],ℤ)_■ → ℤ[T]_■ | P then I; P with a closed immersion; ℤ((T⁻¹)) complete for the source, not the target | consistent | removed the claim that ℤ^cond → ℤ_■ is open (solidification is not smashing) |
| 3.2 affinoid formalism | ℤ^cond → ℤ[T]/(T²)^cond; ℤ[T]^cond vs ℤ[T]_■; split cover | ω ≅ B; ℤ[T] not dualizable over ℤ^cond | consistent with 1.1 | none |
| 3.3 analytic stacks | ∅; finite products of ℤ_■; all rings | D(∅) = 0; AnStk ≃ Ani with D(K) = Fun(K, D(ℤ_■)) | first Check said "presheaves on finite sets" | corrected to Ani (coproduct covers) |
| 3.4 solid schemes | 𝔸¹; ℤ/p^s coefficients; (A,ℤ)_■ vs A_■ | f_!1 = T⁻¹ℤ[[T⁻¹]][−1], π₋₁ a product, not discrete | f_! does not preserve discreteness for non-proper f | localization-triangle clause corrected: i* is base change to R̂_I |
| 3.5 solid Huber stacks | closed disc; Spa(ℤ[T^{±1}],ℤ); ∅ | ℚ_p⟨T⟩_■; not open; D = 0 | consistent | none |
| 3.6 ℚ_{p,■}-stacks | finite products; ℚ_p⟨T⟩_■; Betti | Ani; Tate algebra not induced; C^lc(S,ℚ_p) | Betti uses locally constant, not continuous, functions | Check corrected from C(S,ℚ_p) to C^lc(S,ℚ_p) |
| 3.7 analytic coefficients | ℤ^cond; ℤ_■ with ℤ[T]; 0 | D^cond; D((ℤ[T],ℤ)_■), not D(ℤ[T]_■) | consistent | none |
| 3.8 realization | Spec R; B𝔾_m × AnSpec ℤ_■; 𝔸̂¹ | Mod_R(D(ℤ^cond)); graded solid groups, t weight −1 | consistent with 1.6 | none |
| 4.1 Betti | ∗, ∅; {1,2}; ℕ∪{∞} | AnSpec ℤ^cond; AnSpec(ℤ×ℤ); eventually constant sequences, (pⁿ) excluded | consistent | none |
| 4.2 classifying stacks | Borel of GL₂(ℚ_p); finite groups; free pro-p group | δ(diag(p,1)) = [gKg⁻¹:K] = p⁻¹ = SR's δ_B; ℤ/p over 𝔽_p not fine; cd 1, not Poincaré | modulus convention matches SR | generality: HM is κ-condensed; the light statement for second-countable G is a target here |
| 4.3 nuclear modules | ℚ_p, ∏ℚ_p; ℚ_{p,■}[S]; degenerate diagrams | Fréchet nuclear; compact not dualizable, so not nuclear (CS22 Proposition 9.3) | consistent | scoped to solid ℚ_p-algebras, since Bos23 Theorem A.17 is over a local field; AM24 Lemma 3.29 (quasi-pro-étale) dropped |
| 4.4 Fredholm | zero ring; ℚ_{p,■}; liquid ℂ[T] | And21 Theorem 5.50 for (ℚ_p,ℤ_p); CS22 Example 9.6 dualizable non-discrete | Banach case holds for sheafy analytic complete Huber pairs | the Banach clause is scoped to And21's hypothesis; the filtered-colimit clause is proved by descent of duality data |
| 4.5 perfect complexes | AnSpec ℚ_{p,■}; ∅; non-Fredholm | finite-dimensional spaces; 0 | Fredholm hypothesis kept | none |
| 5.1 cotangent complex | ℤ[T]_■/ℤ_■; id; 𝔽_p/ℤ | ℤ[T]; 0; (p)/(p²)[1] = 𝔽_p[1] | non-static L required | none |
| 5.2 properties | ℤ((T⁻¹)); ℤ^cond → ℤ_■; A → A[T]_■ → A | 0; 0; A[1] | consistent | wording of transitivity Check fixed |
| 5.3 descent of ∧^m | m = 0; A → A×A; ℤ → ℚ | Tot of the conerve of ℤ → ℚ is ℚ ≠ ℤ | descendability needed | none |
| 6.1 solid finite presentation | ℤ[T]_■; Sym ℤ_■[S]; ℤ_{p,■} | L free of rank 1; not finite type; L = 0 but ℤ_p not discrete | L = 0 does not give finite presentation | Check recomputed |
| 6.2 solid smooth | rational localization; T ↦ T²; ℤ[T]/(T²) | Jacobian diag(g); 2T not a unit; L = [B →2T B·dT], π₁ = Tℤ | consistent | Check recomputed |
| 6.3 regular immersions | zero section; ℤ[x,y]/(x²,xy); ℤ → 𝔽_p | ℤ[−1], ℤ[−n]; Ext¹ and Ext² ≠ 0 (embedded point, depth 0); 𝔽_p[−1] | suave ≠ smooth | none |
| 6.4 solid line | ℤ_■ → ℤ[T]_■; trace; T-inversion | ℤ[T][1] (π₁ = ℤ[T]); f_!f^!1 = T⁻¹ℤ[[T⁻¹]] with trace the T⁻¹-coefficient; ω = 1 | signs consistent with 1.4 | none |
| 6.5 deformation to the normal cone | n = 1 over B𝔾_m; Hom(GL_n, 𝔾_m); ℤ[x] → ℤ and ℤ[x] → ℤ[x]/(x²) | t^{−1}ℤ[−1], δ = id; ℤ·det with ±1 ambiguity; gr = ℤ[x̄], B[u] | determinant, not inverse | garbled statement of RCSolid Proposition 7.7.2 corrected to ι₀^!1[n] ≅ det V |
| 6.6 Serre duality | d = 1; 𝔸²; ℙ¹ | det L = L; det = O vs L[2] = O²[2]; H⁰(O) ↔ H¹(O(−2)) | L[d] is wrong for d ≥ 2 | target states the determinant form |
| 7.1 bialgebra duality | μ_n; ∗; 𝔾_a over ℤ | D(μ_n) = ℤ/n; units of ℤ[T] are ±1, so the only character is 1 | dualizability needed | Check recomputed |
| 7.2 1-categorical duality | trivial monoids; trivial pairing on ℤ^Betti; finite flat G | identity; skyscrapers at 0 and 1 have equal images; O(G)^∨ = O(G^D) | consistent with Tau Ceti | a "discrete Fourier transform" Check was false (FM is a functor on categories, not on functions) and was replaced |
| 7.3 1-suave/1-étale | identity; Spec(Λ×Λ); Spec ℤ[T] | 0-étale and 0-proper; ∏_ℕ not colimit-preserving, so not 0-suave | matches 1.1 | Check recomputed |
| 7.4 lattices/tori | graded ↔ families; rank 0; character sign | (Tⁿ) class; FM sends ⋆_! to pointwise ⊗; FM^∨ sends Day convolution to the graded ⊗ | consistent | Check made precise |
| 7.5 additive dualities | exp basis; ℚ_p radius; Amice | (Xⁿ)^∨ ↦ Tⁿ/n!; v_p(n!) = (n − s_p(n))/(p − 1); δ₁ ↦ 1 + X | consistent with LocallyAnalyticDistributions | discs defined by explicit algebras, not by the norm map of ABLB §2 (RationalAnalyticPrismatization territory) |
| 7.6 stacky duality | rank 0; rank 1; St_n ⊗ St_n | identity; 7.5; scalar λ acts by λ² | dual bundle needed | none |
| 7.7 𝔾_m^an | A = 0; sequences; products | 1 ∈ ℓ^temp, p^{−n²} ∉ ℓ^temp; pointwise products stay in ℓ^temp, convolution of 1 with 1 diverges | consistent | a false Check (algebraic B𝔾_m as modules over ∏_ℤ K) was replaced |

Conventions are pinned by witnesses, each recomputed in every layer that uses it:

- the kernel matrix product;
- ℤ[T][1] and ℤ[−1];
- t of weight −1 with ι₀^!1 = t^{−1}ℤ[−1];
- det, up to sign;
- δ(diag(p, 1)) = p⁻¹;
- exp(XT), sending (Xⁿ)^∨ to Tⁿ/n!;
- the Amice transform, sending δ_a to (1 + T)^a.

## Ownership and searches

**Searches.** I ran `roadmaps grep` over main and the 367 open roadmap pull requests at their heads. This covers every sibling checkout listed in the brief. The patterns searched were:

- six-functor and 6-functor formalism;
- suave and Heyer;
- analytic stack, Betti stack, analytic ring;
- Fredholm ring, nuclear module;
- kernel category, Beilinson t-structure, shearing;
- condensed anim, distributive lattice;
- (∞,2) and correspondence category.

I also grepped the board's design READMEs.

**Findings.**

- Nothing outside this design defines abstract six-functor formalisms, correspondences, analytic animated rings, analytic stacks, Betti stacks, Fredholm rings, the cotangent complex of analytic rings, or Cartier duality in kernel categories.
- VStackSheavesAndLisseCategories has a concrete étale kernel category (VS1.1, `KernelCategory`). It is an instance-level construction and is not duplicated here.
- VS2.2 has κ-condensed analytic measures and the integer-solid gluing. These enter only as comparison Checks, through SolidAnalyticRings §7.4.
- SolidAnalyticRings §§7.1–7.3 has spectral analytic structures and the coefficient structures of discrete Huber pairs. These are imported (2.6–2.7), not redefined.
- RefinedTraceMethods §4.3 has nuclear objects. These are imported; the gap below covers the one missing comparison.
- Mathlib at the pin has `CategoryTheory.Span.SpanBicat`, used for a Check. It has no smashing spectrum, no Stone duality for distributive lattices and no correspondence ∞-category.

**Owned here because nobody supplies them.** The correspondence ∞-category, the Liu–Zheng gluing theorems, the ABFJ22 topos theorem in the form used, Stone duality (GvG24) and Lurie's bialgebra Cartier duality (Lur18a §3) are general notions with no supplier on main or earlier in the order. Each is planned once, at the generality its uses need.

**No Suggested.lean in this deliverable.** The README backticks only Mathlib, Tau Ceti and supplier declarations. No fully qualified name of another roadmap is reused as a declaration name.

## Notions moved down from later roadmaps

- **HigherHidaAndColemanTheory** (merge-order line 240) planned the solid six operations on finite-type ℤ-schemes as its target D1/solid-scheme-operations, because no owner existed. This design owns them in 3.4, with the ℤ/p^s duality in 6.6(4). That roadmap should cite AnalyticStacks 3.4 and 6.6 instead.
- Its gaps solid-localization-kernel and discrete-adic-solid-comparison are supplied by 2.7 and 2.8.
- RationalAnalyticPrismatization's contracts with supplier "none" are supplied as listed in the README's Downstream consumers. That design is not yet in the merge order and comes later.

## Proposed Part IIs and boundary notes

- **Gestalten.** A separate roadmap, after this one, should own n-affine, n-proper and n-étale maps of Gestalten and the transmutation of six-functor formalisms (Gest Lectures VI–IX). RationalAnalyticPrismatization's contracts gestalten-affine-proper and gestalten-transmutation are not supplied here. 7.3 defines only the 1-suave and 1-étale maps of CAlg(Pr_V)^op that RC26a §2.5 needs, directly and without Gestalten.
- **Liquid and gaseous analytic geometry.** A possible later roadmap; the definitions of 2 cover it.
- **Uniqueness.** The uniqueness clause of RCSolid Corollary 6.3.4 rests on CLL25, which was not read, and is not a target. No consumer uses it.

## Gaps

**gap:nuclear-hom-criterion** (supplier RefinedTraceMethods, §4.3).

- *Needed:* RefinedTraceMethods §4.3 defines nuclearity by "every map from a compact object is trace-class". ABLB Appendix A, Bosco's Theorem A.17 and CS22 Definition 8.5 use the criterion "(P^∨ ⊗ X)(1) → Hom(P, X) is an equivalence for compact P". The equivalence of the two in compactly generated presentably symmetric monoidal stable categories with compact unit is needed by 4.3.
- *Status:* §4.3 states the closure theorem (MW Theorem 2.4) but not this equivalence.

## Sources

**New entries.** Seven sources were fetched through the sources service from open repositories or author pages, and recorded:

- LZ12b (arXiv:1211.5294v4);
- ABFJ22 (arXiv:2101.02791v4);
- Bos23 (arXiv:2306.06100v1);
- Mat16 (arXiv:1404.2156v2);
- BHL17 (arXiv:1507.01925v1);
- Mao21 (arXiv:2107.02921v2);
- GvG24 (arXiv:2203.03286v5, the pre-publication version of the book; numbers cited from it).

Lur18a is Lurie's *Elliptic Cohomology I* from his author page, version of February 2018. RC26a's reference [Lur18a] is Elliptic I. The service was first pointed at Elliptic II by mistake; the key was then updated to Elliptic I, and the §3 numbering (Propositions 3.8.1, 3.8.5, 3.9.9) was checked in that text.

**Dropped.** AM24 was removed from the manifest. Its Lemma 3.29 concerns quasi-pro-étale nuclear sheaves on perfectoid spaces, and the analytic-stack statement the consumers need follows from 4.1.

**Unreadable sources.** None; no `needs-references.toml` was written.

**Locators.** Every locator in the README was read in the cached extraction: RCSolid §§4–7; HM §§2–5; SixFF Lectures II–X; RC26a §§2–3; ABLB §3.3, §4.2 and Appendix A; ALRS §2.9, Appendix A.1 and Remark 6.5.6; Sch24 §VI.1; CS22 Lectures V, VI, VIII and IX; And21 Proposition 3.34, Theorems 3.5, 4.1 and 5.50; Mou; RJRC 4.4.8; and the new sources.

**Steps inside proofs.**

- The filtered-colimit step taken from inside the proof of CS22 Proposition 9.11 is restated at the generality of analytic rings. Its argument (descent of compact objects and duality data) does not use liquidity.
- HM's κ-condensed results are restated for light condensed anima and second-countable groups. This is a target here; it is not claimed as HM's statement.

## Untrusted text

Nothing suspicious was found in the board files, the consumer designs, the roadmap pull-request contents or the fetched sources. No text asked for commands, credentials or changes outside this job.

## Dependency check

    candidate: AnalyticStacks is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 646 edges, 0 problem(s)

There are no UPWARD or CYCLE lines.

- The last supplier is RefinedTraceMethods (merge-order line 221).
- The first requesting consumer is MotivesAndAlgebraicCyclesPartII (line 224), so the placement right after RefinedTraceMethods serves every consumer.
- `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. The Mathlib and Tau Ceti names were checked by hand at the pins, with file and line given in the supplier contracts.
