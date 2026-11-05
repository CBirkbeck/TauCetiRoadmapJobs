# FIX-RT-AnalyticStacks~1: repair of red-team round 1 (passes a and b)

Pass a has 33 findings and pass b has 5. Three pairs overlap and were settled once: a-F03 = b-F01 (2.4(3)), a-F07 = b-F02 (2.10) and a-F30 = b-F03 (3.1). None is disputed. Files changed: `packages/AnalyticStacks/README.md` and `packages/AnalyticStacks/Suggested.lean`. `design/plan.json`, `sources.toml` and `metadata.toml` are unchanged, because no new supplier gap and no new source was needed.

## F01 (P1) — applied

Review pass a.

1.1 API: "commutes with all six operations" → commutes with ⊗, pullback and f_! = f_*; with Hom(M, −) for M perfect; with f^! = Hom_A(B, −) for B perfect over A. New negative Check: for ℤ → ℤ[T], the discrete f^!ℤ = (∏ℤ)^disc misses the continuous map n ↦ e_n, ∞ ↦ 0 of ∏ℤ^cond. B = ℤ[T]/T² gives ℤ² on both sides.

## F02 (P3) — applied

Review pass a.

1.3 Check: "ℙ¹ → Spec ℤ is not D-suave in the algebraic formalism" → primness without suaveness is shown by Spec ℤ[T] → Spec ℤ (1.1). ℙ¹_ℤ → Spec ℤ is D-smooth with ω = O(−2)[1]: Rf_* preserves perfect complexes, so f^! = f*(−) ⊗ f^!ℤ, compatibly with flat base change (SchemeAndStackFoundations §§2.19–2.20).

## F03 (P1) — applied

Review pass a.

2.4(3): "kernel … nilpotent" → "π₀A▷ → π₀B▷ surjective with nilpotent kernel". The README notes that RCSolid Proposition 4.4.5's proof uses B▷ = A▷/I. ℤ[ε]/ε² → ℤ stays as the positive Check. New negative Check: ℤ → ℚ, using b-F01's two structures on ℤ (all modules, ℤ[1/p]-modules), which induce the same structure on ℚ. Same as b-F01.

## F04 (P2) — applied

Review pass a.

1.7: the categorical equivalence stays for every ℚ-linear V. For the Beilinson t-structure and its heart, V must now carry an accessible t-structure compatible with filtered colimits, with ⊗-closed connective part containing the unit. Connective and coconnective halves are defined by the sheared pieces M_n[n]. New Check: Mod_(ℚ[u^±1]), |u| = 2, which has no nondegenerate t-structure. D(A) satisfies the hypotheses.

## F05 (P2) — applied

Review pass a.

0.9 API: "π₂*: D(Y ×_X Y) → D(Y)" → "the pushforward π₂_* along the second projection" (HM Lemma 4.5.10, HM line 3599). New Check: for the finite-set formalism with Y = {0, 1}, π₂_* takes column sums of a 2×2 matrix, and π₂* points the other way.

## F06 (P1) — applied differently

Review pass a.

1.4 route: "Spec(A/^L f ⊕ (A/^L f)[1])" → Z ×_(X^∧) Z = Z ×_X Z = Spec(B ⊗^L_A B) = Spec Λ_B(B^n[1]), which is free of rank 2^n over B. This argument does not need the reduction to one generator. 1.4(3) now names all generators f₁, …, f_n. New Check: the origin of 𝔸²_ℤ has ranks 1, 2, 1.

## F07 (P1) — applied

Review pass a.

2.10: "insensitive to nilpotent kernels on π₀" → unchanged under a map with the induced structure that is surjective on π₀ with nilpotent kernel. The README notes that the proof of RCSolid Lemma 7.2.10 goes through Proposition 4.4.5. New Check: ℤ_■ → ℤ[T]_■ as the negative case (b-F02's witness, {|1| ≤ |T|}) and (ℤ[ε]/ε²)_■ → ℤ_■ as the positive case. Same as b-F02.

## F08 (P1) — applied

Review pass a.

5.2: the connectivity estimates now require m ≥ 1; for m = 0 both powers are A, which is only connective. The README now records the source omission and the n = 0 error of RCSolid Corollary 7.4.6 (∧²ℤ² = ℤ). New Check: M = ℤ[2] with m = 0 fails; m = 1 is exact; Sym²(ℚ[2]) = ℚ[4].

## F09 (P1) — applied

Review pass a.

6.3(2): "f^!1 ≅ det(L_(X/Y))" → det(L_(X/Y))[d], with d = χ(L) the virtual relative dimension. Conventions (3) now defines det and χ of a perfect complex, with det(P[1]) = (det P)^∨. A regular immersion recovers det(I/I²)^∨[−c] (6.3(1)) and a smooth map det Ω¹[n] (6.6). New Check: ℤ → ℤ[T] gives ℤ[T][1], and ℤ → 𝔽_p gives 𝔽_p[−1].

## F10 (P1) — applied

Review pass a.

7.1 API: "fibre sequences of grouplike objects to fibre sequences" → colimit diagrams go to limit diagrams, in particular cofibre sequences go to fibre sequences, and nothing is claimed for arbitrary fibre sequences. New Check: 0 → 0 → ℤ^Betti dualizes to 𝔾_m → 0 → 0.

## F11 (P2) — applied

Review pass a.

0.2 API: the Cartesian clause now requires C to have finite products and ∗ to be final in C_E (HM line 1320). New Check: finite sets with injections form a setup, but C_E has no final object; with E = all, ∗ is final.

## F12 (P1) — applied

Review pass a.

New supplier contract "From TauCetiRoadmap.EtaleCohomologyFoundations" for §§G.1–G.3, with `nagataCompactification` from §G.2. It is cited in the 3.4 Needs line, the 3.4 route, the Layer 3 Dependencies and the 0.3 compactification Check. EtaleCohomologyFoundations is earlier in the merge order. SchemeAndStackFoundations (README line 141) assigns compactifications to it.

## F13 (P2) — applied

Review pass a.

`Suggested.lean` gains the definition `SpectralSpaceCat`, a structure with a `Category` instance built from Mathlib's `SpectralMap.id`, `SpectralMap.comp` and their laws. It also gains the theorem `spectralStoneDuality`: there is an equivalence `SpectralSpaceCat.{u} ≌ BddDistLat.{u}ᵒᵖ` whose object map is order-isomorphic to `TopologicalSpace.CompactOpens`. Both names are added to README 2.10, the Mathlib supplier contract and the module docstring. New Check: the spectra of small lattices (∅, the point, the discrete two-point space, the Sierpiński space).

## F14 (P3) — applied

Review pass a.

4.4 Needs and the Layer 4 Dependencies: E5:presentability.1 → E5:presentability.4, `dualizable_filteredColimit` (EnhancedDerivedSheaves README line 1758). The 4.4(7) route now says why base-change transitions are strongly continuous: their right adjoint, restriction of scalars, preserves colimits.

## F15 (P2) — applied

Review pass a.

0.2 API: "induces a symmetric monoidal functor" → a lax symmetric monoidal functor, with structure spans ∏F(X_i) ← F(∏X_i); it is symmetric monoidal when F preserves finite products (HM Example 2.3.6, HM line 1303). New Check: the functor selecting {1, 2} is not strong.

## F16 (P1) — applied

Review pass a.

3.7: "Fun_(D(ℤ))(D_!, D(A))" → "Fun_(D(A▷(∗)))(D_!, D(A))", with the dualizability hypothesis spelled out. The README records RCSolid line 4474 as a misprint. New Check: for A = R = 𝔽_p, the ℤ-linear version gives modules over 𝔽_p ⊗^L_ℤ 𝔽_p, which has π₁ = 𝔽_p. 1.1, where A▷(∗) = ℤ, is correct as written.

## F17 (P2) — applied

Review pass a.

5.2: the square-zero improvement now requires k > 0 (RCSolid line 5348). New Check: for 𝔽_p → 𝔽_p[T], π₀ of B̃ is 𝔽_p[T^p], so the k = −1 case fails.

## F18 (P3) — applied

Review pass a.

7.2 Check: "never induces a duality" → "need not induce a duality". The ℤ^Betti non-faithfulness witness stays, and the constant Künneth formalism on C₂ is added as the case where FM_h is the identity.

## F19 (P2) — applied

Review pass a.

7.5(3)–(4): radii are now positive reals, r → 0 is taken through positive radii, and the norm sup|a_n|rⁿ is stated (RC26a line 1728). 7.6(2) also says r > 0. New Check: e₁ has norm r, and r = 0 is excluded. The derivative on the Poincaré sequence was not added: this repair did not need it.

## F20 (P2) — applied

Review pass a.

7.6 route: "covered by the point" → covered by the coproduct over n ≥ 0 of the frame atlases S → BGL_n^R, with rank n handled as the n-fold product of rank one through Künneth. New Check: the rank-one point has empty pullback to BGL₀ and BGL₂.

## F21 (P1) — applied

Review pass a.

1.7 route: "modules over a polynomial algebra" → modules over the finite dual exterior algebra ℚ ⊕ ℚη, with η of degree −1 and weight +1 and η² = 0. After shearing η has degree 0 and weight +1 and still squares to zero, which gives d∘d = 0 with coherences. New Check: the three-term identity sequence is excluded because d∘d = 1.

## F22 (P3) — applied

Review pass a.

2.8 Check: maps from (ℤ[T], ℤ) form R and maps from (ℤ[T], ℤ[T]) form R ×_π₀R R⁺ (RCSolid lines 3254–3256). New witness: T ↦ 1/2 into (ℚ, ℤ) is a map from the first pair only.

## F23 (P3) — applied

Review pass a.

0.8 Checks: "⊕_ℕ Λ is neither" → for Λ ≠ 0; for Λ = 0 it is the zero object, which is both. The finite-set row Check now also says Λ ≠ 0.

## F24 (P2) — applied differently

Review pass a.

3.7/3.8 cycle: the sentence "prove that the realization of 3.8 is compatible with base change along A" moved from 3.7 to 3.8, which already needs 3.7. The cycle is gone. 0.2 → 0.3: this job may not edit the target ids of `design/plan.json`, so the sections were not renumbered. Instead "How to read the build" now says that 0.3 is built before 0.2. Within Layer 0 there is no return edge (0.3 does not need 0.2).

## F25 (P2) — applied

Review pass a.

Conventions (4): "open pro-p subgroup K" → any compact open K, with the generalised index written out and independent of K; in the locally pro-p cases of 4.2, K may be chosen pro-p. The README adds ∏_ℓ ℤ_ℓ (no open pro-p subgroup, δ = 1). The Borel witness δ(diag(p, 1)) = p⁻¹ is unchanged.

## F26 (P3) — applied

Review pass a.

7.1 Check: the group-algebra example now requires an integer n ≥ 1 ("finite free of rank n"). It adds n = 1 and n = 2 (also over 𝔽₂) as positive cases and n = 0 (ℤ[T^±1], infinite rank) as excluded.

## F27 (P2) — applied

Review pass a.

0.2: Σ_n is ordered by (i, j) ≤ (k, l) iff i ≤ k and l ≤ j (HM Definition 2.2.1(a), HM line 990). New Check: for n = 1 this order gives a span, while the componentwise order gives a chain. 0.3's API now says its poset has the componentwise order.

## F28 (P2) — applied

Review pass a.

1.4 route: "the image of j_! is computed by derived Nakayama" → j_* has the derived I-complete image (Nakayama) and j_! = RΓ_I has the I-torsion image. Statement (3) now also gives the image of j_!. New Check: j_*ℤ_p = ℤ_p versus j_!ℤ_p = (ℚ_p/ℤ_p)[−1].

## F29 (P2) — applied

Review pass a.

4.3(1) is no longer a target: it is now imported from RefinedTraceMethods §4.3, "Closure and generation of nuclear objects", and applied to D(A). The label "(1)" is kept, because RationalAnalyticPrismatization's reviews cite §4.3(1)–(2). Scope bullet "Nuclear objects": Layer 4 owns only the nuclear-specific statements (2)–(3). The gap `nuclear-hom-criterion` is unchanged.

## F30 (P3) — applied

Review pass a.

3.1 Check: "ℤ[1/p][−1]" → "(ℤ[1/p]/ℤ)[−1] = (ℚ_p/ℤ_p)[−1]". The dual of T − p on ⊕ℤe_n (e_n ↦ e_(n−1) − p e_n) is injective, with relations p e₀ = 0 and e_(n−1) = p e_n, so e_n ↦ p^(−n−1). The conclusion that ℤ_p is not a retract of ℤ is unchanged. Same as b-F03.

## F31 (P3) — applied

Review pass a.

0.13 Check: the restatement of the definition is replaced by the computed example. X is the constant presheaf on K(ℚ, 2) in the finite-set formalism over 𝔽_p. D_!(X → ∗) is an equivalence because C_*(K(ℚ, 1); 𝔽_p) = 𝔽_p. The diagonal pulls back to K(ℚ, 1) → ∗, which gives Mod_(𝔽_p[ℚ]) and is not an equivalence. The ABLB footnote 26 locator stays.

## F32 (P3) — applied differently

Review pass a.

SolidAnalyticRings §7.3 constructs D_F for any family F and proves independence of the ℤ-algebra generating set of R⁺. 2.8(2) and the generator clause of 2.7(7) now import these through 2.6. 2.8(2) keeps as its target only the integral-closure step for an arbitrary S: (R, S)_■ = (R, R⁺[S])_■. SolidAnalyticRings states this only in its proof route and a Check, not as a law. Scope bullet updated.

## F33 (P3) — applied

Review pass a.

7.5: three new Checks for ℓ^ℕ_R(r): e₀ and e₁ have norms 1 and r; a_n = πⁿ lies in ℓ(r) exactly for r < 2; a_n = π^⌈√n⌉ lies in ℓ(1) but in no ℓ(r′) with r′ > 1, so it is outside R⟨T⟩_≤1.

## F01 (P2) — applied

Review pass b.

Settled with a-F03: 2.4(3) now requires surjectivity on π₀. b-F01's ℤ → ℚ witness (the ℤ[1/p]-module structure) is the new negative Check.

## F02 (P2) — applied

Review pass b.

Settled with a-F07: 2.10 now requires surjectivity on π₀ with the induced structure. b-F02's ℤ_■ → ℤ[T]_■ witness and its (ℤ[ε]/ε²)_■ → ℤ_■ test are the new Check.

## F03 (P3) — applied

Review pass b.

Settled with a-F30: the value is (ℚ_p/ℤ_p)[−1], with the backshift computation in the Check.

## F04 (P3) — applied

Review pass b.

1.2(1): "Mat16 Proposition 3.31" → "compare Mat16 Proposition 3.31, which proves descendability of a faithfully flat map of E∞-rings when π_*(A) is countable" (Mat16 line 1134). RCSolid Lemma 6.4.3 remains the locator for the index bound.

## F05 (P3) — applied

Review pass b.

Downstream consumers: "perfect-complexes-fredholm-stacks → 4.5 …" → "hypercover-inversion → 0.13(6) with 3.3, and 4.5 for Perf^[a,b] over Fredholm C₀". The slug comes from `packages/RationalAnalyticPrismatization/reports/REV-DESIGN-RationalAnalyticPrismatization~3.md` line 21. Its line 197 lists Perf^[a,b] among the hypercover-inversion forms.

## Checks run

**Elaboration.** `lake env lean packages/AnalyticStacks/Suggested.lean`, run from the content checkout, prints only two `declaration uses sorry` warnings, for `restrictedDiagonalMap_isEquivalence_hoFunctor` and `spectralStoneDuality`. There are no errors and no other warnings. The file imports Mathlib only, so no `TauCeti.*` module had to be built.

**#check audit.** I put `#check @` for all eight names in one scratch file and elaborated it once. The names are `bisimplex`, `compactificationBisimplex`, `restrictedDiagonal`, `restrictedDiagonalMap`, `restrictedDiagonalMap_isEquivalence_hoFunctor`, `SpectralSpaceCat`, `SpectralSpaceCat.carrier` and `spectralStoneDuality`. The file has no `variable` block, so no binder can be lost. The five existing types are unchanged from `signatures.md`. `spectralStoneDuality : ∃ e, ∀ X : SpectralSpaceCat, Nonempty ((e.functor.obj X).unop ≃o TopologicalSpace.CompactOpens X.carrier)`, with `e : SpectralSpaceCat.{u} ≌ BddDistLat.{u}ᵒᵖ`, which matches README 2.10.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The new edge to EtaleCohomologyFoundations points to an earlier roadmap.

**Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Modulus, any compact open K | ∏_ℓ ℤ_ℓ; Borel of GL₂(ℚ_p), p = 2, 3 | compact, so δ = 1; diag(p,1)·N(ℤ_p)·diag(p,1)⁻¹ = N(pℤ_p), index p⁻¹ | holds | K any compact open |
| det/χ of perfect complexes | V[1] of rank n; 𝔽_p[1] over 𝔽_p | χ = −n, det = (∧ⁿV)^∨; det(𝔽_p[1]) = 𝔽_p, χ = −1 | consistent with 6.3(1) | Conventions (3) |
| lci duality det(L)[d] | ℤ → ℤ[T]; ℤ → 𝔽_p; 𝔸²; codim-c regular | O[1]; 𝔽_p[−1]; O[2]; det(I/I²)^∨[−c] | matches 6.4, 6.3 Check, 6.6, 6.3(1) | 6.3(2) |
| Σ_n order | n = 0, 1, 2 | n = 0: one object; n = 1: (0,1) below (0,0) and (1,1), a span; n = 2: (0,2) is the minimum, a pullback-grid apex | holds | 0.2 |
| Cartesian clause | finite sets with injections; with all maps | no final object in C_E; ∗ final | hypothesis needed | 0.2 API |
| Lax functor | ∗ ↦ {1,2}; ∗ ↦ ∗ | unit goes to {1,2} ≠ ∗; the product-preserving one is strong | lax only | 0.2 API |
| Discrete embedding versus f^! | ℤ[T]/ℤ; ℤ[T]/T² over ℤ | (∏ℤ)^disc ≠ ∏ℤ^cond at S = ℕ∪{∞}; ℤ² = ℤ² | perfect case only | 1.1 |
| ℙ¹ in the algebraic formalism | ℙ¹_ℤ; 𝔸¹_ℤ | f^!ℤ = O(−2)[1], H⁰(O) = ℤ = H¹(O(−2)); ℤ[T] not perfect | ℙ¹ smooth, 𝔸¹ prim but not suave | 1.3 Check |
| Self-intersection of a formal completion | n = 1 regular; n = 2 at the origin | ranks (1,1); ranks (1,2,1) | 2^n | 1.4 route |
| j_* and j_! images | ℤ_p along (p) | j_*ℤ_p = ℤ_p (π₀); j_!ℤ_p = (ℚ_p/ℤ_p)[−1] (π₋₁) | distinct | 1.4 |
| t-structure hypothesis | Mod_(ℚ[u^±1]), \|u\| = 2; D(ℚ) | Σ² = id forces C_≥0 = C_≥2, so degenerate; standard t-structure | needed for the heart only | 1.7 |
| Square-zero dual algebra | ℚ in weights 0, 1, 2 with identity maps; ℚ → ℚ | d∘d = 1 ≠ 0, excluded; next piece 0, allowed | square-zero, not polynomial | 1.7 route |
| 2.4(3) surjectivity | ℤ[ε]/ε² → ℤ; ℤ → ℚ | kernel squares to 0, bijection; trivial and ℤ[1/p]-structures both give all ℚ-modules | needed | 2.4(3) |
| Spec_■ invariance | ℤ_■ → ℤ[T]_■; (ℤ[ε]/ε²)_■ → ℤ_■ | ℤ[T^±1]_■ ≠ ℤ[T,1/n]_■; ℤ[ε]/ε²[1/n] ↔ ℤ[1/n] | needed | 2.10 |
| Free Huber pairs | (ℚ, ℤ), T ↦ 1/2 and T ↦ 0 | 1/2 ∈ R \ R⁺; 0 ∈ both | order fixed | 2.8 Check |
| RHom(ℤ_p, ℤ) | p = 2, 3 | e₀ ↦ 1/2 (order 2), 1/3 (order 3); cokernel ℤ[1/p]/ℤ | (ℚ_p/ℤ_p)[−1] | 3.1 Check |
| 3.7 linearity | A = R = 𝔽_p | relative: D(A); over ℤ: 𝔽_p ⊗^L_ℤ 𝔽_p with π₁ = 𝔽_p | relative is right | 3.7 |
| Connectivity, m ≥ 1 | M = ℤ[2] with m = 0, 1; ℚ[2] with m = 2 | A has π₀ ≠ 0, bound 1 fails; M exactly 2-connective; Sym² = ℚ[4] | m ≥ 1 needed | 5.2 |
| Square-zero improvement, k > 0 | 𝔽_p → 𝔽_p[T]; identity | π₀B̃ = 𝔽_p[T^p], not hit by 𝔽_p; zero fibres | k > 0 needed | 5.2 |
| D on fibre sequences | 0 → 0 → ℤ^Betti | 𝔾_m → 0 → 0 is not a fibre sequence | cofibre only | 7.1 API |
| ℤ[ℤ/n] | n = 0, 1, 2 | ranks ∞, 1, 2 | n ≥ 1 | 7.1 Check |
| Trivial pairing | constant formalism on C₂; ℤ^Betti | FM = id; δ₀ and δ₁ both go to ℤ | "need not" | 7.2 Check |
| Radii | r = 0, 1, 2 | ‖e₁‖ = 0 (invalid), 1; πⁿ is in ℓ(r) iff r < 2 | r > 0 | 7.5 |
| π^⌈√n⌉ | r = 1 versus r′ > 1 | 2^(−⌈√n⌉) → 0; r′ⁿ 2^(−⌈√n⌉) → ∞ | in ℓ(1), not in R⟨T⟩_≤1 | 7.5 Check |
| Cover of Vect | ranks 0, 1, 2 | the rank-one point has empty pullback to ranks 0 and 2 | coproduct of frame atlases | 7.6 route |
| K(ℚ,2) Check | f: K(ℚ,2) → ∗; its diagonal | C_*(K(ℚ,1); 𝔽_p) = 𝔽_p, an equivalence; Mod_(𝔽_p[ℚ]) → D(𝔽_p), not one | !-equivalence fails | 0.13 Check |
| π₂_* direction | Y = {0, 1} | column sums D(Y×Y) → D(Y) | pushforward | 0.9 |
| Stone duality (Lean) | ∅, point, discrete 2, Sierpiński | 1, 2, 4 elements; 3-chain (not Boolean); M₃ is not distributive | true, statement elaborates | Suggested.lean, 2.10 |
| SpectralSpaceCat laws | id ∘ f, f ∘ id, associativity | `SpectralMap.comp_id`, `id_comp`, `comp_assoc` | proved, no sorry | Suggested.lean |

## For the maintainer

- **Cited names.** The new Lean names are `SpectralSpaceCat` and `spectralStoneDuality`; no existing name changed. Section numbers are unchanged, and 4.3 keeps the label "(1)" for the imported closure statement. The RationalAnalyticPrismatization slug mapping now uses `hypercover-inversion`.
- **Ownership.** No other roadmap I could read states Stone duality as a category equivalence, so this roadmap owns it, as its Scope already said. I checked by object on main, the board packages and the sibling checkouts; the README's Scope bullet and Mathlib (no bundled category of spectral spaces at the pin) agree. Nuclear closure (a-F29) and the discrete coefficient structures (a-F32) now go to their owners, RefinedTraceMethods §4.3 and SolidAnalyticRings §7.3.
- **No change of supplier.** Nothing moved down from a later roadmap.
- **Source issues (RCSolid).** The README now records these errors at their locators: Proposition 4.4.5 and Lemma 7.2.10 omit surjectivity; Lemma 7.4.5 omits m ≥ 1; Corollary 7.4.6 allows n = 0; line 4474 has the subscript D(ℤ) where D(A▷(∗)) is meant.
- **Untrusted text.** Nothing suspicious was found in the reviews.
