# FIX-RT-AnalyticStacks~2: repair of red-team round 2 (passes a and b)

Twenty findings were raised: thirteen in pass a and seven in pass b. Pass a F11 and pass b F07 overlap (the scope of 6.3(2)), so they are settled together in one section. Eighteen findings are applied and one is applied differently. Every other finding was verified against the cited source line before it was edited. No finding is disputed and none is marked not actionable.

## RT-AnalyticStacks~2a/F01 (P1) — applied

0.2: "vertical edges into E and every square a pullback" → edges (i, j) → (l, j) go into E, and only the coordinate rectangles (i, j), (l, j), (i, k), (l, k), i ≤ l ≤ k ≤ j, must be pullbacks (HM Remark 2.2.5, HM line 1032). A new Check records the degenerate Σ₁ square. No other "every square" occurs.

## RT-AnalyticStacks~2a/F02 (P3) — applied

7.2 Check: "so FM_h is not faithful" → FM_h is M ↦ const(⊕_n M_n). It is faithful, but it is not full: Hom(δ₀, δ₁) = 0, while Hom(FM_hδ₀, FM_hδ₁) contains id_ℤ. So it is not an equivalence. The C₂ positive control is kept.

## RT-AnalyticStacks~2a/F03 (P2) — applied differently

The witness holds, but §7.3's stated laws cover only generators of an integrally closed R⁺; its proof route uses the integral closure (Lemma 5.5.5), so its stated laws cannot be imported as they stand. The step leaves this roadmap's ownership (Scope, 2.8(2)) and is imported as gap:integral-closure-tests (SolidAnalyticRings §7.3): plan.json `gaps`, supplier contracts, 2.8 Needs, Layer 2 Dependencies.

## RT-AnalyticStacks~2a/F04 (P2) — applied

3.6: "colimits … in C₀ computed on underlying algebras" → colimits of induced algebras are computed on underlying algebras. So finite limits in C₀ are AnSpec(B ⊗_A C) and coproducts are AnSpec(B × C), for diagrams with results in C₀. New Check: AnSpec(ℚ_p × ℚ_p) has two points, ℚ_p ⊗ ℚ_p = ℚ_p one.

## RT-AnalyticStacks~2a/F05 (P2) — applied

7.7 now defines 𝔾_m^an, ℓ^temp = O(𝔾_m^an)^∨ (RJRC line 2027) and ℤ^temp = AnSpec ℓ^temp (induced structure). The Hopf maps are Δ(a)_(i,j) = a_(i+j), ε(a) = a₀, S(a)_i = a_(−i) (RJRC line 2042), and the action is trivial. New Check on Δe₀, ε, S and Δ1.

## RT-AnalyticStacks~2a/F06 (P3) — applied

7.5(3) names the maps: the inclusion of constants and ∂_T(T^[n]) = T^[n−1] (RC26a line 1844). New Check: ∂T = 1 and ∂T^[2] = T in characteristic 2; kernel R; the continuous right inverse T^[n] ↦ T^[n+1] gives cokernel 0; the zero map is the negative control.

## RT-AnalyticStacks~2a/F07 (P3) — applied

Nonzero hypotheses are added, with the zero case stated: 0.5 and 0.6 (Λ ≠ 0), 2.2 (A▷ ≠ 0), 2.5 (R ≠ 0), 1.7 (N ≠ 0). The other negative Checks use fixed nonzero rings.

## RT-AnalyticStacks~2a/F08 (P3) — applied

7.6 has a new Check citing RC26a line 2053: R(AnSpec B^cond) = B, and the B-points of 𝔸¹, 𝔾_m and Spec ℤ[T]/T² are B, B^× and {b² = 0}. Over 𝔽₂[ε]/ε² these have 4, 2 and 2 elements; reducing first gives 2, 1 and 1.

## RT-AnalyticStacks~2a/F09 (P3) — applied

Suggested.lean: both instances now have docstrings, and so does the new `DistribLattice` instance.

## RT-AnalyticStacks~2a/F10 (P1) — applied

3.4: "proper map of derived schemes" → "… almost of finite type over ℤ", the category of SixFF Theorem 9.7 (line 3208), in which Theorem 9.18 is stated. New Check: the closed immersion cut out by (x₁, x₂, …) in 𝔽₂[x₁, …] gives a non-pseudocoherent A/I; the finite-variable case has a Koszul resolution.

## RT-AnalyticStacks~2a/F11, RT-AnalyticStacks~2b/F07 (P1) — applied

6.3(2) is restricted to separated maps of derived schemes almost of finite type over ℤ (the setting of SixFF Theorems 9.7 and 9.17). New Checks: 𝔽₂ → 𝔽̄₂ (⊕_ℕ𝔽₂ is not compact, so not suave), 𝔽₂ → 𝔽₄, the doubled-origin line. 6.6(1) and 6.6(3) use the formalism of 3.5, which is local on the source.

## RT-AnalyticStacks~2a/F12 (P3) — applied

0.12 Check → descent holds at X iff D(X) = 0, and the empty family is a !-cover only if it is also subcanonical. Witness: the zero formalism on finite sets at ∗, where the two-point representable fails. The 0.13 Check on ∅ → X involves no topology and stays.

## RT-AnalyticStacks~2a/F13 (P3) — applied

1.7 Check: "no V♡ and no Beilinson heart" → V does carry admissible t-structures (the degenerate V_≥0 = V, V_≤0 = 0). Every t-structure on V has heart 0, since V_≥0 = V_≥0[2] ⊆ V_≥1. With the degenerate structure the theorem reads 0 = 0. For D(A) the standard structure gives Ch(A).

## RT-AnalyticStacks~2b/F01 (P2) — applied

The witness holds. Added to Suggested.lean: `cartesianNerve`, `cartesianNerveToNerve`, and `cartesianNerveToNerve_isEquivalence_hoFunctor` (LZ12b Corollary 0.2, line 120: pullbacks, admissible E₁ and E₂, f = q ≫ p with q ∈ E₂ and p ∈ E₁). README 0.3 gets prose, API, three Checks and a contract. The docstring's "not statable" now covers only the ∞-categorical case and general Theorem 0.1.

## RT-AnalyticStacks~2b/F02 (P3) — applied

Suggested.lean adds a `DistribLattice` instance on `CompactOpens` of a quasi-separated space (at the pin it carries only semilattices: Compacts.lean:827, 851). It also adds `compactOpensComap` (preimage as a `BoundedLatticeHom`) and `compactOpensFunctor`. `spectralStoneDuality` changes from ∃ e … to `compactOpensFunctor.IsEquivalence`. README 2.10 is updated and has two new Checks: the Sierpiński pullback, and a continuous map that is not spectral.

## RT-AnalyticStacks~2b/F03 (P3) — applied

5.2: "f iso iff π₀f iso and L = 0" → "for f with induced structure, …", noting the source's omission at RCSolid line 5339 (checked: the statement there is for arbitrary f). New Check: ℤ^cond → ℤ_■ has π₀ an isomorphism and L = 0, but is not an isomorphism.

## RT-AnalyticStacks~2b/F04 (P3) — applied

6.1 API: "A_■ → B_■" → "(A, A)_■ → (B, B)_■, the solid Huber rings with I-adic condensed structure (2.9)". The text now says that the discrete A_■ of 2.7 differs from it (for A = ℤ_p it lacks pⁿ), matching RCSolid line 5479, which says the source means the I-adic topology.

## RT-AnalyticStacks~2b/F05 (P3) — applied

2.2: "A[T] = A ⊗ A▷[T]" → "A[S] = A ⊗_A▷ A▷[S] for a light profinite S". AnRing^un and AnRing are now spelled out. No other use of A[T] for a free module exists; the other A[T] are polynomial rings.

## RT-AnalyticStacks~2b/F06 (P3) — applied

4.2(2): fineness is cited to HM Corollary 5.3.3 (line 4649), with the source's hypothesis that H has locally finite cohomological dimension. Deriving that hypothesis from G, as the reviewer proposed, would need an uncited Shapiro argument, so the hypothesis is stated instead. The check on H = 1 still applies.

## Checks run

- `lake env lean packages/AnalyticStacks/Suggested.lean`: no errors. There are three `declaration uses sorry` warnings, one each for `restrictedDiagonalMap_isEquivalence_hoFunctor`, `cartesianNerveToNerve_isEquivalence_hoFunctor` and `spectralStoneDuality`. No `set_option` is used, the only import is `import Mathlib`, and every new `def` and `instance` has a real body, with the functor laws proved by `rfl`.
- `#check @name` for all twelve declarations, in one scratch file. Every binder is explicit in the declaration, there is no `variable` block, and each elaborated type agrees with its README statement. Changed: `spectralStoneDuality` is now `compactOpensFunctor.IsEquivalence`, and `cartesianNerve` lives in `SSet.{max u v}` for `C : Type u`, `[Category.{v} C]`.
- Dependency check: `depcheck: 156 roadmaps, 1068 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation or Lean name found nowhere.

## Gate failures repaired

- tex=1 (README, Layer 1 Checks, the ordinary-case pullback Check): the fibre product `{1} ×_{1} {1}` was written outside a code span, so its `_{…}` subscript read as TeX. It is now an inline code span; no other text changed. A grep of the README for `_{` or `^{` outside code spans finds no other occurrence.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.2 coordinate-rectangle rule | Σ₁, span ∗ ← {1,2} → ∗; square (0,1)⇉(0,0) with identities | n = 1: every rectangle has two equal sides, so it is a pullback; the degenerate square is a pullback iff W → X₀ is invertible (here {1,2} → ∗: no) | rule admits spans |
| `cartesianNerve` / Cor. 0.2 | finite sets, E₁ = all, E₂ = bijections; E₁ = E₂ = isos | first: the factorization f = id ≫ f holds and each simplex is determined by its diagonal; second: the factorization fails for a non-iso | hypotheses fit |
| factorization order | 𝔸¹_k → Spec k | open then proper: Nagata; proper then open: the only open of the point is the point, so 𝔸¹ would be proper | q ∈ E₂ first |
| pullback condition | {1,2} → {1} squares | the square with all other corners {1}: {1} ×_{1} {1} has 1 point, not 2; the identity-sided square is a pullback | condition excludes it |
| `compactOpensFunctor` | Sierpiński {o,c}, f = inclusion of c | {o} ↦ ∅, whole ↦ point; 3-chain → 2-element lattice | contravariant |
| spectral vs continuous | ℕ ∪ {∞} → Sierpiński | the preimage of {o} is ℕ: open but not compact | only spectral maps |
| 3.4 finiteness | 𝔽₂[x₁,…] / (x₁,…); 𝔽₂[x₁..x_n] | A/I not finitely presented; Koszul length n | aft needed |
| 6.3(2) | 𝔽₂ → 𝔽̄₂; 𝔽₂ → 𝔽₄; doubled-origin line | ⊕_ℕ 𝔽₂ is not compact; 𝔽₂² is dualizable with ω ≅ 𝔽₄; L is not separated | scope fixed |
| 3.6 colimits | AnSpec ℚ_p ⊔ AnSpec ℚ_p | algebra ℚ_p², 2 points; ℚ_p ⊗ ℚ_p = ℚ_p, 1 point | variance fixed |
| 7.2 trivial pairing | δ₀, δ₁ on ℤ^Betti | Hom = 0 vs ∏_ℤ ℤ ∋ id | faithful, not full |
| 7.5 ∂_T | T, T^[2] in characteristic 2; right inverse | ∂T = 1, ∂T^[2] = T; r′·(→ 0) | exact |
| 7.7 Hopf | e₀, e₁, 1; a_(i−j) | Δe₀(1,−1) = 1, (e₀⊗e₀)(1,−1) = 0; εe₁ = 0; Se₁ = e₋₁; a_(i−j) not cocommutative | additive ℤ |
| 7.6 transmutation | B = 𝔽₂[ε]/ε², 𝔽₂ | 4, 2, 2 versus 2, 1, 1 | discriminating |
| 5.2 criterion | ℤ^cond → ℤ_■ | π₀ an isomorphism, L = 0, not an isomorphism | induced structure needed |
| 0.12 empty family | zero formalism on finite sets, X = ∗, ∅ | D = 0 at ∗, but h₂(∗) = 2 ≠ 1; at ∅, h₂(∅) = 1 | descent ≠ cover |
| 1.7 periodic V | V_≥0 = V, V_≤0 = 0 | heart 0; Beilinson heart 0 = Ch(0) | Check corrected |
| zero inputs (F07) | Λ = 0, A▷ = 0, R = 0, N = 0 | all sides 0; exclusions disappear | hypotheses added |

## Notes for the maintainer

- A new supplier gap is declared: `gap:integral-closure-tests` (SolidAnalyticRings §7.3), in plan.json `gaps` and in the README contracts. This roadmap no longer owns the integral-closure step.
- The signature of `spectralStoneDuality` changed, and four definitions and one theorem were added (`cartesianNerve`, `cartesianNerveToNerve`, `cartesianNerveToNerve_isEquivalence_hoFunctor`, `compactOpensComap`, `compactOpensFunctor`). No other readable roadmap declares these fully qualified names. Ownership: no roadmap on main or in the supplied open heads states Liu–Zheng gluing or spectral Stone duality; this was checked by object in the round 1 ownership searches and rechecked this round with `roadmaps resolve`.
- The scope of 3.4 finiteness, 6.3(2) and 6.6(1) has narrowed or changed formalism. AutomorphicBundlesPartII uses 3.4 and 6.6 over Artinian bases ℤ/p^s, which are almost of finite type, so it is unaffected.
- sources.toml: locators were added for LZ12b Corollary 0.2, RJRC Definition 4.4.1 and Lemma 4.4.3, and HM Remark 2.2.5 and Corollary 5.3.3. No new source was fetched and `needs-references.toml` was not written.
- No suspicious instructions were found in the reviews.
