# FIX-RT-QuasicoherentSheavesOnPrestacks~1

Files changed: `packages/QuasicoherentSheavesOnPrestacks/README.md`, `packages/QuasicoherentSheavesOnPrestacks/sources.toml` (HA locator Definition 7.5.0.4 and `cited_for` 3.1). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged: no finding concerns the Lean statement or a supplier gap.

## RT-QuasicoherentSheavesOnPrestacks~1a/F01 (P3) — applied

8.5 API bullet: "`QCoh(BΓ × Spec k) = Fun(BΓ, Mod_k)` (3.3)" → "(2.3), which is also `QCoh` of `BG = [Spec k/Γ]` (7.1), its fpqc hypersheafification, by 3.3(a)". 8.5 *Needs*: "2.2; 3.3; 6.3; 8.2" → "2.2; 2.3 (`QCoh(BΓ × Spec k) ≃ Fun(BΓ, Mod_k)`); 3.3 (3.3(a), the same `QCoh` on `BG`); 6.3; 7.1 (`BG = [S/G]`); 8.2".

Pattern: every other occurrence of the identity is already attributed to 2.3 (2.2–2.3 Checks, Layer 2 Examples, 8.4 Check, 8.6 API and *Needs*); 3.3's own Check is its use of the identity, not an attribution. No other *Needs* line uses `BG` without 7.1.

## RT-QuasicoherentSheavesOnPrestacks~1a/F02 (P3) — applied

8.5: "It fails for poorly stabilized stacks, those with a point…" → for a qcqs algebraic stack with a positive-characteristic geometric point whose stabilizer has non-semi-abelian reduced identity component, the lisse-étale `D_qc` is not compactly generated (HNR Theorem 1.1, §4). This concerns `D_qc`, not treated here; nothing is deduced from it.

Evidence: HNR line 45–47 (Theorem 1.1, qcqs algebraic stack, conclusion on `Dqc(X)`), HNR line 436–439 (geometric point, p. 9).

Pattern: the HR-perf citation in the same paragraph had the same defect. HR-perf line 19–29 states, for `D_qc` of a quasi-compact algebraic stack with quasi-finite separated diagonal, that a non-tame stack has its structure sheaf perfect and not compact. It now reads "the analogue for the lisse-étale `D_qc` of a quasi-compact algebraic stack with quasi-finite and separated diagonal". The 7.4 citation of HNR Theorem C.1 already says "lisse-étale analogue".

## RT-QuasicoherentSheavesOnPrestacks~1a/F03 (P3) — applied differently

2.5 now names all four hypotheses: composition and base change are the derived instances; pullbacks hold for every precoverage of schemes; isomorphisms are covered because an isomorphism is surjective, flat and locally finitely presented (`AlgebraicGeometry.Scheme.singleton_mem_precoverage_iff`), which instance search does not find. The Mathlib contract bullet says the same, with file:line.

Why differently: the claim is right (2.5 named only three of the four hypotheses), but the witness and the proposed repair are partly wrong. The repair follows what elaboration at the pin shows.

Evidence (scratch elaboration at the pin):
- `example : Precoverage.HasPullbacks AlgebraicGeometry.Scheme.fppfPrecoverage := inferInstance` **succeeds**. The instance is `instance (J : Precoverage C) [Limits.HasPullbacks C] : J.HasPullbacks` (Mathlib/CategoryTheory/Sites/Precoverage.lean:186). The witness's claim that `HasPullbacks` is not an instance is wrong.
- `example : Precoverage.HasIsos fppfPrecoverage := inferInstance` fails. It also fails **after** `unfold AlgebraicGeometry.Scheme.fppfPrecoverage` (error: failed to synthesize `(Scheme.precoverage (@Flat ⊓ @LocallyOfFinitePresentation)).HasIsos`). So the proposed text, that the two missing hypotheses are "obtained by unfolding its definition" through MorphismProperty.lean:104/:107, does not hold at the pin for `HasIsos`.
- The mathematics stands: the singleton family of an isomorphism f is covering iff f is surjective and has the property (`singleton_mem_precoverage_iff`, Mathlib/AlgebraicGeometry/Sites/MorphismProperty.lean:89, checked with `#check`).

## RT-QuasicoherentSheavesOnPrestacks~1b/F01 (P3) — applied

8.4 route: "(ReductiveGroups Layer 6)" → Tau Ceti `TauCeti.Comodule.isCompletelyReducible_of_reductive` with `TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`. Semisimplicity of the heart is now argued from "every subcomodule has a complement". Both are added under "From Tau Ceti" with file:line. The ReductiveGroups Layer 6 bullet is deleted from the contracts, the Scope list and the 8.4 *Needs*, and Layer 8 Dependencies now cite Layer 1 only.

Evidence: `#check @TauCeti.Comodule.isCompletelyReducible_of_reductive` gives `{k} [Field k] [CharZero k] {H : FiniteTypeCommHopfAlgCat k}`, `reductiveCommHopfAlgProperty k H → ∀ {M : Type _} … [Comodule k H M], IsCompletelyReducible k H M`. That is, comodules in any universe. The `GL_n` theorem was read at TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Reductive/Basic.lean:94 (its object file is not built at the pin, so there was no `#check`). Its type is `reductiveCommHopfAlgProperty k (finiteTypeCoordinateHopfAlgebra k n)`, and `reductiveCommHopfAlgProperty k` is an `ObjectProperty (FiniteTypeCommHopfAlgCat.{u, u} k)` (Reductive/Basic.lean:71). So the two compose for `GL_n`, with k and the Hopf algebra in one universe.

The reviewer's wording for the replacement bullet ("Layer 6 states the structure theory around these…; 8.4 consumes the pinned theorems themselves") was not used. A supplier contract lists what is consumed, so the unused Layer 6 bullet is deleted instead.

Pattern: the local-finiteness fact cited to ReductiveGroups Layer 1 ("each is the directed union of its finite-dimensional subcomodules") is also pinned: `TauCeti.Subcomodule.iUnion_finiteSubcomodules_eq_univ` (TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean:300, checked with `#check`; hypothesis `Module.Free R C`, automatic over a field). It is added under "From Tau Ceti" and cited in the 8.4 route, the 8.4 *Needs* and the Layer 8 Dependencies. The ReductiveGroups Layer 1 bullet keeps only the representation–comodule dictionary, which is a Layer 1 target there and not at the pin.

## RT-QuasicoherentSheavesOnPrestacks~1b/F02 (P3) — applied

Contract bullets: E5:presentability.1–4 gains `continuousDerivedInvariants`, with the assumption that for a finite discrete Γ the cohomology of `V^{hΓ}` is Mathlib's `groupCohomology` (the cohomology of the inhomogeneous cochains, Basic.lean:183). §1.18 gains `StackInGroupoids.ofSheaf`, `Stack.isStack_stackification`, `Stack.stackification_isom_sheafify` and `Stack.stackification_locally_essSurj`. §2.18 gains `isPseudoCoherentComplex_affine_iff`. The 6.4 *Needs* gains `isPseudoCoherentComplex_affine_iff`.

Evidence (main): EnhancedDerivedSheaves README line 1720–1722 (E5:presentability.3 provides `continuousDerivedInvariants`); SchemeAndStackFoundations README lines 3543, 3559–3566 (§1.18) and 5037 (§2.18).

Pattern: a script compared every backticked name used after the contracts with the contract section. It found exactly these six, and no other supplier name is missing. 2.5's *Needs* also lacked `StackInGroupoids.ofSheaf` (used in its API), and it is added.

## RT-QuasicoherentSheavesOnPrestacks~1b/F03 (P3) — applied

7.4(d): "if `[X/G]` is quasi-compact with affine diagonal" → "if X is quasi-compact and `[X/G]^♮` has affine diagonal (4.1)". The route builds `f : ⨿ U_i → h_X → [X/G]^♮` and proves it affine, flat (6.1 added to *Needs*) and surjective after fppf covers. 8.4: "applies with `X = Spec k`, affine". A doubled-origin boundary Check was added.

The reviewer's hypothesis is kept. The justification sits in the route rather than in the statement, since it is proof material. The route is new text, and the adversarial pass checked it (table rows 7.4(d)).

Pattern: no other place applies quasi-compactness to a prestack or stack. 8.3(b) applies it to the schemes `Y_η`, and 8.1 and 5.4 to schemes and morphisms representable by schemes.

## RT-QuasicoherentSheavesOnPrestacks~1b/F04 (P3) — applied differently

3.1: a map of test rings is an open immersion, étale, or flat of finite presentation when it is flat and `π₀A → π₀B` is (Mathlib `AlgebraicGeometry.IsOpenImmersion`, `RingHom.Etale`, `RingHom.FinitePresentation`; HA Definition 7.5.0.4). Covers are the jointly faithfully flat finite families; discrete rings recover the ordinary notions. A Check was added, and the contract and *Needs* extended.

Why differently: the proposed repair defines Zariski maps as principal localizations `π₀A → (π₀A)[1/f]`. That would narrow the existing "open immersions" (for example a non-principal affine open of `Spec A`) below what the text and 3.3(d) state. The repair keeps open immersions. HA Definition 7.5.0.4 (HA line 52701–52705) is the same "π₀ étale and flat" notion and is cited, and recorded in `sources.toml`.

Pattern: `grep` for étale, Zariski cover and open immersion finds no other derived use without a definition. 3.4 and 2.5 are classical, and 3.3(d) now rests on the definition.

## Checks run

- **Elaboration of `Suggested.lean`** (`lake env lean`, from the content checkout): exit 0, one warning, `Suggested.lean:79:8: declaration uses 'sorry'`. The file is unchanged.
- **`#check` comparison** (one scratch file, elaborated once, plus a second small one for three names added later). `not_preservesCoproducts_trivial` elaborates to `∀ (k : Type u_2) [Field k] (Γ : Type u_2) [Group Γ] [Finite Γ] (p : ℕ) [CharP k p], p ∣ Nat.card Γ → ∀ [HasDerivedCategory (Rep k Γ)], ¬∀ (J : Type u_1), PreservesColimitsOfShape (Discrete J) (preadditiveCoyoneda.obj (op ((DerivedCategory.singleFunctor (Rep k Γ) 0).obj (Rep.trivial k Γ k))))`. This is identical to README 8.6, with no binder lost, and nothing changed. The same files checked every new library name: `AlgebraicGeometry.IsOpenImmersion`, `RingHom.Etale`, `RingHom.FinitePresentation`, `AlgebraicGeometry.Scheme.precoverage`, `AlgebraicGeometry.Scheme.singleton_mem_precoverage_iff`, `CategoryTheory.Precoverage.HasIsos`, `CategoryTheory.Precoverage.mem_toGrothendieck_iff_of_isStableUnderComposition`, `TauCeti.Comodule.isCompletelyReducible_of_reductive`, `TauCeti.Comodule.IsCompletelyReducible`, `TauCeti.Subcomodule.iUnion_finiteSubcomodules_eq_univ`, `groupCohomology`. All exist with the stated types. The `GL_n` theorem was read in source (above).
- **Dependency check**, full output:

```
depcheck: 250 roadmaps, 2384 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or `moved:` line. The edge count fell by one because ReductiveGroups Layer 6 is no longer cited, while ReductiveGroups itself still is.
- **Citation resolver** after the edits: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." On this host the resolver did not check names outside TauCetiRoadmap, which is why the `#check` files above exist.
- **Style scan** of the added lines: no LaTeX delimiters, process words, pull-request references or machine paths.

## Adversarial pass on new and changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 8.5 API: `QCoh(BG) ≃ QCoh(BΓ × Spec k) ≃ Fun(BΓ, Mod_k)` via 7.1, 3.3(a), 2.3 | Γ = ℤ/2, k = 𝔽₂; Γ = 1 | realization of the constant Γ over `Spec k` acting on `Spec k`: `colim_n Γ^n × Spec k = BΓ × Spec k`; `π₀ Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = 𝔽₂` on both; Γ = 1: `Mod_k` on both | holds | F01 |
| 8.5 HNR sentence | `B(ℤ/p)` over `𝔽_p`; `BG_a` over `𝔽_p` | stabilizer ℤ/p: `(ℤ/p)⁰_red = 1`, semi-abelian, so not poor; `G_a⁰_red = G_a`, not semi-abelian, so poor (HNR line 439–440 names `B_k G_a`) | consistent with the last Check (`k[Γ]` compact generator) | F02 |
| 8.5 HR-perf clause | `B(ℤ/p)` over `𝔽_p` | quasi-finite separated diagonal (finite group); not tame since p divides `|Γ|`; O perfect, not compact, matching 8.5's `∏ 𝔽_p ≠ ⊕ 𝔽_p` | consistent | pattern |
| 2.5 hypotheses of `mem_toGrothendieck_iff_of_isStableUnderComposition` for `fppfPrecoverage` | an isomorphism `f : X ≅ S`; empty scheme | f surjective, flat, locally finitely presented, so `{f}` covers (`singleton_mem_precoverage_iff`); `HasPullbacks` from Precoverage.lean:186; `HasIsos` not synthesized, before or after unfolding (scratch) | 4 of 4 hold; text matches the pin | F03 |
| Pinned complete reducibility for `GL_n` | `GL_1 = G_m` over ℚ; `GL_2` over ℚ; char p | `ℚ[t^{±1}]`-comodules are graded ℚ-spaces, every graded subspace a summand; `GL_2`: `Sym^n` of the standard representation is simple and every finite-dimensional representation is a sum of these and determinant twists; over `𝔽_p` the hypothesis `[CharZero k]` excludes `B(ℤ/p)`-type failures (8.5) | holds; universes `{H : FiniteTypeCommHopfAlgCat.{u,u} k}`, `M : Type w` | b/F01 |
| complete reducibility ⇒ heart semisimple and every object a sum of simples | an infinite-dimensional comodule M | S = sum of simple subcomodules has a complement Q; if `Q ≠ 0` it has a nonzero finite subcomodule (`iUnion_finiteSubcomodules_eq_univ`), hence a simple one (atomicity), contradicting the choice of S; so M = S | holds | b/F01 |
| E5:presentability.3 `continuousDerivedInvariants` for finite discrete Γ | Γ = ℤ/2, V = 𝔽₂ | open stabilizers automatic (discrete topology); continuous cochains = all cochains; `H¹ = 𝔽₂` = Mathlib `groupCohomology` via the inhomogeneous cochains | holds | b/F02 |
| 7.4(d) hypothesis "X quasi-compact, `[X/G]^♮` affine diagonal" | `X = Spec k`, `G = GL_n`; `X = ℙ¹_k`, `G = G_m` scaling one coordinate; plane Z with doubled origin, G trivial; `X = ⨿_ℕ Spec k` | `f = Spec k → BGL_n`, base change along itself `GL_n`, affine and flat; ℙ¹: diagonal base change `G_m × ℙ¹ → ℙ¹ × ℙ¹` affine (ℙ¹ separated, `G_m × ℙ¹ → ℙ¹` affine), f from `Spec(k[t] × k[t⁻¹])`; Z: base change of f along U is `U ⊔ (𝔸² ∖ 0) → U`, not affine; `⨿_ℕ`: no finite affine cover, so f not from an affine | holds where stated; Z and `⨿_ℕ` outside the hypothesis | b/F03, Check added |
| 7.4(d) route: f affine, flat, points lift | point `Spec R → [X/G]^♮` lifting to `x : Spec R′ → h_X` | base change of f: `⨿_i (orbit map)^{-1}(U_i) ⊆ G ×_k Spec R′`, open, flat over R′; f affine by affine diagonal, so this is `Spec(B ⊗_R R′)` and B is flat over R by descent | holds | b/F03 |
| 7.4(d) route: F embeds in `f_* I` | F a nonzero heart object | `f^*` exact and conservative on the heart (points lift after fppf cover); `f^*(F → f_* f^* F)` split mono, so kernel 0; `f_*` left exact, so `F ↪ f_* I` | holds | b/F03 |
| 3.1 open immersion / étale / fppf maps of test rings | `𝔽_p → 𝔽_p ⊗ᴸ_ℤ 𝔽_p`; `ℤ → ℤ[1/2]`; `ℤ → ℤ_p`; `ℝ → ℂ`; discrete A | first: `π₀` identity, not flat (`π₁`: 0 vs 𝔽_p), and `π₁(B ⊗_{𝔽_p} B) = 𝔽_p²` (Künneth) vs `π₁B = 𝔽_p`, so not a monomorphism; `ℤ[1/2]`: flat, open immersion; `ℤ_p`: flat, not of finite presentation (uncountable); `ℝ → ℂ` étale, faithfully flat; discrete A: flat M has `π_n M = 0` for `n ≠ 0` | holds | b/F04, Check added |
| 3.1 Check, first draft "Čech descent fails along `𝔽_p → 𝔽_p ⊗ᴸ 𝔽_p`" | same map | it has a retraction `B → π₀B = 𝔽_p`, so A is a retract of B, the map is descendable and Čech descent **holds** | draft false | replaced by the monomorphism computation before submission |
| 3.1 vs 2.5 fppf covers, classical | `{ℤ → ℤ[1/2], ℤ → ℤ[1/3]}`; `ℤ → ℤ[1/p] × ℤ_p` | first: each flat and finitely presented (`ℤ[x]/(nx − 1)`), jointly faithfully flat, an fppf cover under both definitions; second: fpqc, not fppf, under both | definitions agree | none |

## For the maintainer

- No section, target or Lean name of this roadmap changed. No roadmap that cites it is affected.
- ReductiveGroups Layer 6 is no longer consumed. 8.4 now relies on three pinned Tau Ceti theorems for complete reducibility and local finiteness, and ReductiveGroups Layer 1 only for the dictionary between representations and comodules. Both supplier gaps (`gap:chevalley-quasiprojective-quotient`, `gap:twist-quasiprojective`) are unchanged.
- Ownership: the new 3.1 definition of open immersions, étale maps and fppf maps of animated and connective test rings was searched for by object (`roadmaps grep` over main and the open heads). EnhancedDerivedSheaves, DerivedModuleAlgebra and SchemeAndStackFoundations do not define it. PrismaticCohomology uses "completely étale" maps of animated rings, a p-complete notion in a later roadmap. This roadmap owns the definition, which restates the HA notion for its three contexts.
- The 7.4(d) statement now asks for affine diagonal of `[X/G]^♮` explicitly. For non-affine X this is a hypothesis, not a consequence; the doubled-origin Check shows why.
