# Review of StackPointsAndResidualGerbes (pull request #2429 at 8ca9dfb)

**Verdict:** accepted

No findings.

## Verified sound

The previous review read this same head and listed no finding, so there was nothing to recheck; every passage was reviewed again.

| Target | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 smooth-local properties (sample) | `Bμ_p/𝔽_p`; `[Spec k[t]/(t²)/𝔾_m]`; node `k[x,y]/(xy)` | smooth atlas `𝔾_m` regular, fppf cover `μ_p` of length `p` nonreduced; atlas has `t ≠ 0`, `t² = 0`; node reduced, not regular | matches stacks-04XE 625–665 | none |
| 0.2 monomorphisms, rigidity (sample) | `Spec ℂ → Spec ℝ`; `Spec k → Spec k[ε]`; `Spec k → BG`; `U/Gal(ℚ̄/ℚ)` | fibre product has 2 points; mono, not iso, target not a field; `Spec k ×_BG Spec k = G`; section of `X → Spec ℚ̄` is mono, `U ×_X Spec ℚ̄` discrete, `U` profinite | holds; proof route `V ×_T V = V ×_k V` valid for affine `V` | none |
| 0.4 ideals, neighbourhoods (sample) | origin of `𝔸¹`, `n = 0,1,2`; `Spec k[ε]`; `Spec(k×k)` | lengths `1,2,3` (`ℐ^n` indexing: `0,1,2`); module kernel `0` over the origin, QCoh ideal pulls back to `k·t`, dimension 1; split case both kernels `0×k` | holds; (`ℐ^{n+1})² ⊆ ℐ^{n+2}` | none |
| 1.1 finite type points (sample, headline) | `η ∈ 𝔸¹_k`, `K = k(t)`; generic point of `Spec ℤ_(p)`; `Spec ℚ̄ → Spec ℚ` | `K` finite over `k[t]` would make `k[t]` a field, `1/t` not integral; `ℚ = ℤ_(p)[1/p]`; `[ℚ̄:ℚ] = ∞` | matches stacks-06RD 1545–1601 | none |
| 1.2 field-valued points (sample) | `B(ℤ/2)_ℝ`; `Spec ℚ(i)`; `𝔸¹_ℝ`; `ℂ(t) → ℂ` | 2 classes over 1 point; `id`, `σ` identified by `(a,b) = (σ,id)`, separated by one embedding (`ι(i) ≠ −ι(i)`); `t²+1` has no real representative; non-`k`-morphism hits `η` | holds; `𝒳(k)` in 6.4 and Layer 7 read as morphisms over `Spec k`, as this Check fixes | none |
| 2.3 local structure, smoothness (sample) | `Bμ_p → Spec 𝔽_p`; `Spec k → B𝔾_m` | gerbe smooth, group not smooth; fppf, diagonal is the unit section of `𝔾_m`, not flat, so not a gerbe | matches stacks-06QB 2696–2721, stacks-06RD 3335–3357 | none |
| 2.4 inertia criterion (headline) | `[𝔸¹/𝔾_m]`; `Bμ_p`; free action | inertia fibres of dimension 1 at `0`, 0 at `1`: not flat; finite flat of rank `p`; trivial inertia gives an algebraic space | holds | none |
| 2.6 dense open gerbe (sample, headline) | `[𝔸¹/𝔾_m]`; `[Spec k[ε]/𝔾_m]`; Example 101.29.2 | open point; stabiliser `k[ε][λ^{±1}]/((λ−1)ε)`, `λ−1` kills `ε`: not flat; fibre length 1 on `x₀ ≠ 0`, `p` on `x₀ = 0 ≠ x₁` | reducedness needed; matches stacks-06QB 2919–2953 | none |
| 3.4 properties of `𝒵_x` (sample) | origin of the node; `Spec ℚ(t)/ℤ`; `[𝔸¹/𝔾_m] → Spec k` | `Spec k` regular; `ℚ(t) ⊗_F ℚ(t)` finite versus `ℤ × Spec ℚ(t)`; pullback is the whole 2-point stack | matches stacks-06ML 1312–1337, stacks-06QB 2846–2861, stacks-06RD 452–456, 4831–4839 | none |
| 4.2–4.3 existence (headline) | `Bμ_p/𝔽_p`; `Bℤ`; `B(𝔾_a/ℤ)_ℚ`; `B𝔾_m` | quasi-DM, not DM; inertia `ℤ_k` not quasi-compact, still a gerbe; inertia quasi-compact, diagonal pulls back to `⊔_ℤ 𝔸¹ → 𝔸²`, dense, misses the generic point; not quasi-DM | each hypothesis sufficient, none necessary | none |
| 4.4 locally Noetherian (sample, headline) | `Spec ℚ(t)/ℤ`; `U/Gal(ℚ̄/ℚ)` | locally Noetherian, `𝒵 = X`; ideal `(a⊗1 − 1⊗a)` not finitely generated, existence by 4.1 instead | matches stacks-06RD 3096–3129 | none |
| 4.5 closed points (sample, headline) | `[𝔸¹/𝔾_m]`; DVR; `U/Gal(ℚ̄/ℚ)` | `𝒵_0` closed, `𝒵_1` open not closed; `R/𝔪` closed, `K` open; closed point, `Spec ℚ̄ → X` mono, not closed immersion | Noetherian hypothesis needed; matches stacks-06RD 4866–4878 | none |
| 5.1 decent stacks (sample) | `Spec ℚ(t)/ℤ`; doubled `Spec k[x₁,…]` times `BG`; folded line | point has fibre `⊔_ℤ Spec ℚ(t)`, not quasi-compact; base change to `T` is the scheme `X ×_k T`, not quasi-separated; quasi-separated, not a scheme | both alternatives of Lemma 101.48.3 needed (stacks-06RD 4699–4721) | none |
| 5.2 factorisation (sample) | identity of `𝔸¹`; `Spec k[ε] → 𝔸¹`; Example 68.13.11 | image is the closure of `η`; `t ↦ ε ≠ 0`; orbit map `Γ → Y` has no section | each hypothesis needed; three reductions keep the hypotheses (Lemmas 101.5.6, 101.48.3, 101.48.5, 101.33.8) | none |
| 5.3 residue field (headline) | `𝔸¹_ℚ` at `t²+1`; `[Spec ℂ/(ℤ/4)]_ℝ`; `Spec ℚ(t)/ℤ` | `ℚ(i)`; `H¹(ℝ,ℤ/4) = {0,2}` maps to `0` in `H¹(ℝ,ℤ/2)`, so `κ = ℝ`, no real object; base not a field | decency needed | none |
| 5.4 algebraicity (headline) | `𝔸¹_ℚ/ℤ`; doubled `Spec k[x₁,…]`; `η ∈ 𝔸¹_k` | `P(t+n) = P(t)` forces `n·deg P = 0`: no proper nonempty open; preimage of the other copy `⋃ D(xᵢ)` not quasi-compact; `Spec k(t) → 𝔸¹` affine, not an immersion | matches stacks-06RD 4786–4807, rydh2011 1268–1305 | none |
| 6.1 representative groupoid (sample) | `Spec κ`, `k/κ` Galois; `BG_k`; `0 ∈ [𝔸¹/𝔾_m]` | `R_x = Γ × Spec k`, `G_x = 1`, quotient `Spec κ`; `R_x = G`; `R_x = 𝔾_m` | matches stacks-06RD 1617–1665, stacks-06ML 1214–1237, 1364–1368 | none |
| 6.2–6.3 `𝒵_x ×_{κ(x)} k ≃ BG_x`, neutrality (sample, headline) | `B(ℤ/2)_k`; `η ∈ 𝔸¹_k`; `(t,−1)` over `ℚ(t)`; `Spec ℚ(t)/ℤ` | three products: automorphism group of order 2, 1 point, 2 points; `Spec K = B1`; residue `−1 ∉ ℚ^{×2}`, `(t²,−1)` split; neutral with no field representative | holds without the source's finite type and Noetherian hypotheses | none |
| 6.4 rational points and API bullet (headline) | `Spec κ`, `[k:κ] = 2`; `Bμ_p/𝔽_p(t)`; `Bℤ_K`; `Bμ_3/ℝ` | `Spec k → Spec κ` not an equivalence; `G_x = μ_p` not smooth, still `𝒵_x = BG_x`; `G_x = ℤ_K` infinite; `μ_3 = Spec(ℝ×ℂ)` not constant | `p∘x = id`, quasi-compact diagonal, `K = K̄` each needed; Lemma 101.17.8 has no hypothesis on `p` | none |
| 7.3 tangent–normal sequence (sample, headline) | `0 ∈ [𝔸¹/𝔾_m]`; `Bμ_p`; `[𝔸¹/μ_p]`, characteristic `p`; `Bα_p`; cusp | `dim Lie − dim G`: `1−1 = 0`, `1−0 = 1`, `1−0 = 1`; `dim T = 2 = 1 + 1`; `T = N` of dimension 2; weights `+1` on both sides | exact; `θ` bijective iff `G_x` smooth; left action `α∘g⁻¹` agrees with AlgebraicModuliForArithmeticGeometry §8.3's `α∘g` inverted | none |
| 7.4 quotient stacks | `SL₂` on quadratic forms, `x = uv`; `𝔾_m` on `𝔾_m` by `λ^p`; `ℤ` on `(ℤ×𝔸¹) ⊔ 𝔸¹` | orbit of dimension `3−1 = 2`, antidiagonal sends `uv ↦ −uv`, `N` trivial of dimension 1; stabiliser `μ_p`, `W` smooth so `N = 0 = T_V/T_{G·x}`; `N = ℚ·∂_t` | holds without quasi-separatedness | none |

- 102 source locators checked against the cached texts: stacks-04XE 16, stacks-06ML 16, stacks-06QB/stacks-06RD 43, stacks-decent-spaces 7, alper-moduli 9, ahr2020 4, stacks-sheaves-on-stacks 3, rydh2011 2, stacks-morphisms-spaces 1, stacks-algebraic-stacks 1; every seeded target included; each supports the statement as written.
- 37 library declarations opened at the pins, with the cited file and line: 21 of Mathlib (`finite_of_finite_type_of_isJacobsonRing` `Ring.lean:691`, `finite_of_free` `Finite.lean:167`, `retractionKerCotangentToTensorEquivSection` `Kaehler.lean:324`, …) and 16 of Tau Ceti (`IsRegular` `Scheme.lean:68`, `exists_isClosedImmersion_generalLinear` `Embedding.lean:212`, `smooth_iff_finrank_lie_eq_ringKrullDim` `Regularity.lean:112`, …); hypotheses as the README states them. The six scheme morphism classes and `IsReduced`, `IsLocallyNoetherian` of From Mathlib were not reopened.
- Cross-roadmap citations resolved on main (90b1a2c): 46 names of SchemeAndStackFoundations §§1.7–1.23, 4.8, 4.12; 15 of AlgebraicModuliForArithmeticGeometry §§4.1, 5.1, 8.1, 8.3; ReductiveGroups Layers 1, 3, 3A. None missing.
- Gaps: the 17 slugs of the README equal those of `design/plan.json`, with the same suppliers and sections; main's SchemeAndStackFoundations has no decent space, quasi-DM stack or `|f|`-openness statement, so none asks for what exists.
- Gate rerun at 8ca9dfb: OK, every check 0; outside-folder diff empty. Dependency check output: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/StackPointsAndResidualGerbes/Suggested.lean` printed nothing and exited 0. The file declares nothing, so there is nothing to `#check` or probe; the pins have no algebraic stack, inertia, 2-fibre product or gerbe (searched by object), so none of the nine headlines listed in the docstring is statable.
- Description and title read against the head: the gap count (15/1/1), the supplier sections, the layer summaries and "declares nothing" all hold.

Overlap check: read SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry and EquivariantIntersectionTheory (main); SchemeAndStackFoundations (open revision), SchemeAndStackFoundationsPartII, NashBlowups, GroupSchemesOverABase, PurityForFlatCohomology and VirtualFundamentalClass (open); nothing shared. Residual gerbes, finite type points and the dense open gerbe are stated by no roadmap on main or open. Closed substacks and the reduced induced closed substack are also stated, for Deligne–Mumford stacks, by the board package VirtualFundamentalClasses §1.2 (later in the merge order, neither open nor on main): the owner is this roadmap, as README lines 52–62 record.

Source independence: 22 passages compared with 6 sources (Stacks Chapters 100, 101 and 68, ahr2020, alper-moduli, rydh2011), among them the statements of 0.1, 1.4, 3.3 and 5.1, the proof plans of 4.4, 5.2 and 5.4 and the docstring of `Suggested.lean`; none shared beyond forced terms; largest share stacks-06QB/stacks-06RD (one text), 56 of 142 line locators; contents compared with it: independent (Layer 1 ↔ §§18–19, Layer 2 ↔ §§28–29, 33, Layer 4 ↔ §§18, 28, 31, 51, Layer 5 ↔ §§48, 50, 51; Layers 0 and 3 are Chapter 100 §§7–11, placed around them; Layers 6–7 have no counterpart; the order inside Layers 2 and 3 is forced by their *Needs:* lines).

## Not verifiable

- lmb2000, Chapter 11, Définition 11.2 (5.5): uncertified, cited by its locator only; the claim about it is taken from rydh2011 lines 1236–1245.

## Source issues

- **Misprint** in stacks-04XE at Lemma 100.8.5, proof, printed page 16: the source says the 2-isomorphism and its lift go from `x₁∘c₁` to `x₁∘c₂`; it should be to `x₂∘c₂`; affects nothing.
- **Misprint** in stacks-04XE at Lemma 100.10.1, proof, printed page 23: the source says the last term of the chain of equalities of point sets is the fibre product itself; it should be its underlying set of points; affects nothing.
- **Misprint** in alper-moduli at Exercise 4.5.11 (a), printed page 184: the source says the stabiliser acts by composing `g` after the framing `α : x → τ|_k`, which does not compose; it should be `α∘g⁻¹`; affects nothing.

## For the human reviewers

- Licence/scope: alper-moduli is an author's draft of lecture notes (5 January 2026), not a published text; README lines 2248–2250 cite it for 5.3 and 6.2–6.4, each also proved here by routes through Stacks Project lemmas.
