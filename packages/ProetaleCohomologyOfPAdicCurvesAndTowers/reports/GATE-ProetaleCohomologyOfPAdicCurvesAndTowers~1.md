# GATE-ProetaleCohomologyOfPAdicCurvesAndTowers~1: answers to the human review

The one unanswered comment (CBirkbeck, 2026-11-15T14:48:09Z) carries seventeen findings F01–F17, numbered H01–H17 below in their order. The scratch copy of the comment stops inside F14; F14–F17 were read from the full comment on the pull request. All repairs are in commit `adac797c` on top of `77d5795`. Line numbers refer to the README and `Suggested.lean` at `adac797c`.

## H01 (CBirkbeck) — applied

§0.1, README line 175: the edges of `Γ^{(2)}` are now incidences `(a, ε)`, `ε ∈ {1, 2}`. Each `a ∈ A_c` gives two of them, even when `s₁(a) = s₂(a)`, and each leg gives one. The old version indexed edges by pairs `(a, s)` with `s` an endpoint, so the two ends of a loop collapsed (CDN-CURVES line 774 has the same set). A new Check at line 181 computes the subdivided loop: `∂(x_s, x_a) = (x_a − x_s, x_a − x_s)`, so `H¹ = L²/L(1, 1) ≅ L`, against `0` with pairs. Line 379 (§2.2) records that a fine triangulation has no loops, so its incidences can still be written `(a, s)`.

## H02 (CBirkbeck) — applied

§0.1, line 173, now defines a morphism: it respects origins and ends and sends legs to legs with the same recorded endpoint. `H⁰` and `H¹` are contravariant for all morphisms. `H⁰_c` and `H¹_c` are contravariant only for proper ones, and `H¹_c(−)^*` is covariant for proper ones by `f_*`, with `∂^* f_* = f_* ∂^*`. The covering of the loop by the line `ℤ` is a negative control (line 182): the pullback of `1_s` is the constant `1`. In §0.2, "natural for length-preserving maps" became equivariance for length-preserving isomorphisms plus compatibility with subdivision (line 192), and a Check at line 199 computes `N = (a + b)x` for a loop of length `a + b`.

## H03 (CBirkbeck) — applied

`Suggested.lean` line 145 adds `nonempty_equiv_generalizedSteinberg_iff`, with the same `p, K, A` hypotheses as the irreducibility theorem: `Nonempty ((generalizedSteinberg K A d J).Equiv (generalizedSteinberg K A d J')) ↔ J = J'`. It is named in README §0.4(a) (line 233), and a Check at line 238 covers `d = 1` (`A` versus the infinite-dimensional `Sp_∅(A)`), `d = 0` (a single label), and the construction that assigns `A` to every `J`. As round 2 ruled, the module docstring gains no "not statable" entry. This theorem is not implied by the multiplicity statement of H05, which still allows two isomorphic `Sp_J` sharing one place of the series while some other factor fills the remaining place; the two statements together pin down all the constituents.

## H04 (CBirkbeck) — applied

`Suggested.lean` lines 174–279 add three declarations:
- `hyperplaneTranslation`, the representation on `LC(𝓗^{r+1}, ℤ)`.
- `hyperplaneCocycles`, a Mathlib `Subrepresentation` with the two real conditions (alternating sum zero, vanishing on `¬ Projectivization.Independent` tuples). Its `G`-stability is proved, not `sorry`.
- `nonempty_equiv_hyperplaneCocycles`: for `r ≤ d`, `Sp_r(ℤ)` is equivalent to the cocycles (CDN-STEIN Proposition 5.6 and line 2054). Here `Sp_r(ℤ)` is `generalizedSteinberg K ℤ d J` with `J` the reflections of index `i` with `i + r < d`.

A hyperplane is the class `[a] ∈ ℙ(K^{d+1})` of a row vector, and `g·[a] = [a g⁻¹]`. This is the contragredient action written in coordinates: `Module.Dual` carries no topology at the pin, so Mathlib's quotient topology on `ℙ` cannot be formed on the dual itself. The hypothesis `r ≤ d` is needed. For `r > d` the index set is empty and the left side is the Steinberg representation, while the right side is `0`. README §0.5 (line 245) names all three declarations and states this.

## H05 (CBirkbeck) — applied

`Suggested.lean` line 159 imports `TauCeti.RingTheory.CompositionSeries.Multiplicity` and states `exists_compositionSeries_generalizedSteinberg_multiplicity_eq_one` exactly as proposed: a series `s` of `Submodule (MonoidAlgebra A G) (LC(G/B, A)).asModule` with `s.head = ⊥`, `s.last = ⊤`, `s.length = 2 ^ d`, and `compositionMultiplicity s (Sp_J).asModule = 1` for every `J`. It elaborates at the pins. It is named in README §0.4(a), line 233, and the carriers are in the supplier contracts at lines 70 and 82. At this head no "not statable" bullet existed to remove.

## H06 (CBirkbeck) — applied

§4.9 Check, line 656: "the limit stabilizes" became "`ι_BdR(x)` is the limit of the bounded-lift construction", followed by the witness. For `x = 0` and constant lifts `v ≠ 0` in the vector-group kernel, the terms `p^n v` are pairwise distinct and tend to `0`. CDN-CURVES line 4114 takes a limit and does not assert stabilization.

## H07 (CBirkbeck) — applied

§5.5 Check, line 743: `Ω⁰/ker d = O(X_C)/C` became `O(X_C)/H⁰_dR(X_C)`, which equals `O(X_C)/C` for connected `X_C`. The two-copy half-plane model is added as the witness: `(0, 1)` is nonzero modulo `C` and zero modulo `C²`.

## H08 (CBirkbeck) — applied

§7.2 Check, line 915: "two copies of the standard model over `O_F` (`E = F`)" became "two copies over `O_{F₂}` (`E = F₂`), exchanged by `Gal(F₂/F)`; over `O_F`, their descent". The split form would give `H⁰ = 𝔽_p²` over `F`, against `𝔽_p` in the §7.7 Check (CDN23 lines 196–208). The thickness-one and valence statements are kept as geometric statements.

## H09 (CBirkbeck) — applied

§2.1 gains three Checks (lines 371–373):
- `Spf O_C⟨T⟩` is a short (CDN-CURVES line 1414).
- `Spf O_C⟨T, U⟩/(TU − p)` is not: its node has a 2-dimensional cotangent space, so it is not formally smooth.
- `Spf(O_C⟨T⟩ × O_C⟨T⟩)` is not: its generic fibre has two components.

## H10 (CBirkbeck) — applied differently

Both purported counterexamples are deleted: the §6.7 bullet "Without `τ≤i` the statement fails" and the parallel §5.3 bullet. As the finding says, `H¹ ≠ 0` against the `H⁰` of a truncation never computes an untruncated right-hand side. The proposed scope sentences were not added, because both statements already carry the truncation ("after truncation `τ≤r`" in §5.3; `γ: τ≤i … ≅ τ≤i[τ≤i AΩ{i} → τ≤i AΩ{i}]` in §6.7). Each section keeps three distinct Checks.

## H11 (CBirkbeck) — applied

Two additions:
- Line 36, "It imports": a new bullet for FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.20, R07.2.25–R07.2.26 and R07.2.28.
- Line 151, the contract bullet for AbelianSchemesAndArithmeticModuli §A4.2: it now also names §A4.CR.7.2 (*Crystalline Dieudonné theory*: the contravariant Dieudonné crystal and Grothendieck–Messing theory, §4.9).

Both sections exist at the heads of their open pull requests (FiniteFlatGroupsAndIntegralPadicHodgeTheory README lines 3742, 4101, 4168, 4369; AbelianSchemesAndArithmeticModuli line 2144). Both roadmaps are earlier in the merge order. The other contract entries were already present and were not added again.

## H12 (CBirkbeck) — applied

At the Mathlib pin:
- `LocallyConstant.comapₗ` is at line 327 (`Algebra.lean`); README line 68: 326 → 327.
- `class Isocrystal` is at line 112; README line 75: 113 → 112.
- `def EllAdicCohomology` is at line 76; README line 76: 75 → 76.

The other eighteen locators in the contracts were re-read at the pins and point at their declarations, and so do the locators added for H03–H05.

## H13 (CBirkbeck) — applied

On main, the target *steinberg* is in SmoothRepresentationsOfLocalGroups §SR.3.4 (README of that roadmap, line 3002), defined on `B∖G`. "SR.3" → "SR.3.4" in the five places: lines 35, 157, 220, 241 and 265. The §0.3 Check at line 220 now spells out the conversion `f ↦ (g ↦ f(g⁻¹))`, which sends `x ↦ f(xh)` to `x ↦ f(x⁻¹h) = f((h⁻¹x)⁻¹)`, that is left translation by `h`.

## H14 (CBirkbeck) — applied

§4.8, line 631: `0 → V_p(J) → Ĵ → C ⊗ Lie(J) → 0` became `0 → V_p(J) → Ĵ → Lie(J) → 0`. Here `Lie(J)` is the Lie algebra of the `C`-Lie group `J(C)`, equal to `C ⊗_K Lie(J_K)` for a curve over a closed `K ⊂ C` (CDN-CURVES lines 4015–4027). The Check at line 641 reads "no longer be `Lie(J)`". For `g = 1` this gives `Lie(J) = C`, as the Tate-curve and ordinary Checks use.

## H15 (CBirkbeck) — applied

§7.5 Check, line 955: the false clause "contains the nonzero étale classes `H¹_ét(M_∞, L(1))[M′] = H¹_ét(M_∞, L(1))[M]`" is replaced. The new witness: by §7.3 the quotient of `H¹_proét[M′]` by `exp` is `X^1_st(H¹_HK(M_∞)[M′]) = X^+_st(M) ⊗̂ LL(M)^* ≠ 0`, against `X^+_st(M′) = 0`. The Check also says why the étale part is `0`: the central character of `JL(M′)` is that of `JL(M)` times `χ²`, with `χ(ϖ)` a non-unit, so it is non-unitary and admits no `G`-bounded vector.

## H16 (CBirkbeck) — applied

CDN-CURVES lines 156–164 state no value of `H¹_HK^sep` for the disc. The §3.2 Check at line 474 now computes it from (d) with the triangulation of §2.2: `H¹(Γ_int, C̆) = 0`, the middle piece is `0` (both components are `ℙ¹`), and `H¹_c(Γ, C̆)^* = 0`. For the closed annulus the same computation gives `0, 0, C̆(−1)`, which agrees with the next Check.

## H17 (CBirkbeck) — applied

§0.4, line 233, gains one sentence. The characteristic-`p` statements of (a), and (b), hold for every non-Archimedean local field of residue characteristic `p`, `𝔽_q((t))` included (GK14 lines 9 and 26, Corollaries 4.3–4.5). They are stated here for `K/ℚ_p` finite, the case Layers 6–7 use and CDN-STEIN Proposition 5.1 states. The Lean hypotheses are unchanged, so README and Lean agree, and nothing is widened.

## Build and gate

- `lake build TauCetiRoadmap.ProetaleCohomologyOfPAdicCurvesAndTowers.Suggested`: `Build completed successfully (18342 jobs).` It gives four `declaration uses 'sorry'` warnings: `generalizedSteinberg_isIrreducible`, `nonempty_equiv_generalizedSteinberg_iff`, `exists_compositionSeries_generalizedSteinberg_multiplicity_eq_one` and `nonempty_equiv_hyperplaneCocycles`. There are no other warnings and no errors.
- Gate summary line: `gate ProetaleCohomologyOfPAdicCurvesAndTowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable --pr 2287`), full output: `depcheck: 244 roadmaps, 2232 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.
- `roadmaps resolve` on the README finds no cross-roadmap citations and no Lean names that are missing everywhere.

## Signature check

`#check @name` for all ten declarations was elaborated once: the lines were appended temporarily to `Suggested.lean`, built, and removed. Each elaborated type matches its README statement, and every hypothesis sits in the declaration's own signature (the file has no section `variable`s).
- The three `p`-adic Steinberg theorems carry `[Fact p.Prime] [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K] [Nontrivial Kˣ] [Field A] (hA : CharZero A ∨ CharP A p)`.
- `nonempty_equiv_hyperplaneCocycles` carries the same field hypotheses and `(hr : r ≤ d)`.
- `hyperplaneTranslation` and `hyperplaneCocycles` need only `[Field K] [TopologicalSpace K] [IsTopologicalRing K]`.

No binder was lost. Nothing changed as a result of the check.

## Adversarial pass on the added and changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| §0.1 subdivision by incidences | loop; segment `s→t`; two parallel edges `s⇉t`; one leg | loop: image `L(1,1)`, `H¹ = L` (pairs: `0`); segment: `∂` onto `L²`, `H¹ = 0`; parallel: image rank 3 in `L⁴` (alternating sum vanishes), `H¹ = L`; leg: `H¹ = 0` | all equal the unsubdivided values | incidences, loop Check |
| §0.1 functoriality | identity; covering `ℤ →` loop; leg sent to a compact edge `s→t` | identity: `f^* = id`; covering: `f^*1_s = 1` on `ℤ`, not in `L^{(ℤ)}`; leg→edge: `f_*∂^*φ = (φ(a), 0)` against `∂^*f_*φ = (φ(a), −φ(a))` | properness and the leg condition are both needed | morphism defined, proper, variance |
| §0.2 equivariance and subdivision | loop `µ = a + b` cut in two; scaling by `2` | `ker ∂^* = {(x, x)}`, `H¹ ≅ L` via `u + v`, `N = (a + b)x`; scaled `2µ` | agrees with the loop; lengths `µ` each would give `2µ` | statement and Check |
| `nonempty_equiv_generalizedSteinberg_iff` | `d = 0`; `d = 1`, `J = ∅` against `{s}`; `J = J′`; wrong model (`A` for every `J`) | one label; `Sp_∅` infinite-dimensional against `A` of dimension `1`; identity equivalence; wrong model fails `←` | true; it excludes the wrong model that irreducibility admits | new theorem, Check |
| multiplicity theorem | `d = 0`, `d = 1`; wrong model; `Sp_J ≅ Sp_J′` hypothetically | `0 ⊂ A` length `1 = 2⁰`; `0 ⊂ A ⊂ LC(ℙ¹)` length `2`, factors `A`, `Sp_∅`; wrong model gives count `1` for both labels, so this statement alone passes it; isomorphic labels leave one place free | needs the non-isomorphism theorem beside it | both stated; noted in the docstring |
| `hyperplaneTranslation` convention | `d = 1`, `g = diag(2, 1)`, `H = ker(x₀ − x₁) = K(e₀ + e₁)`, `a = (1, −1)` | `g(H) = K(2e₀ + e₁)`; `ker(a g⁻¹) = ker(x₀/2 − x₁) ∋ (2, 1)`, equal; `[a g] = [(2, −1)]` has kernel `K(e₀ + 2e₁) = g⁻¹(H)` | `g·[a] = [a g⁻¹]`, so `(g·f)(H) = f([a g])` as defined | docstring states the convention |
| cocycle sign | `r = 1` | Lean `i = 0, 1, 2`: `+f(H₁, H₂) − f(H₀, H₂) + f(H₀, H₁)` | matches CDN-STEIN line 2048 | none |
| `nonempty_equiv_hyperplaneCocycles` | `d = r = 0`; `d = 1`, `r = 0, 1`; `d = 2`, `r = 0, 1, 2`; `r = d + 1` | `𝓗` a point, both sides `ℤ`; `J = {s₀}` → `ℤ` = constants; `J = ∅` → `LC(ℙ¹)/ℤ` = coboundaries `φ(H₁) − φ(H₀)`; `J = {s₀, s₁}`, `{s₀}` (planes), `∅`; `r > d`: `J = ∅` (Steinberg `≠ 0`) against `0` (every `r + 1 > d + 1` equations dependent) | true for `r ≤ d`, false without the bound | `hr : r ≤ d` added; README states it |
| short Checks | `O_C⟨T⟩`; `O_C⟨T, U⟩/(TU − p)`; `O_C⟨T⟩²` | special fibre `𝔸¹` smooth; node, cotangent dimension `2`; `π₀` of cardinality `2` | each fails exactly one condition | three Checks |
| §3.2 disc Check | disc; annulus | pieces `0, 0, 0`; annulus `0, 0, C̆(−1)` | consistent with (d) and the next Check | Check replaced |
| §4.8 `Lie(J)` | `g = 1`; `⊗_{ℚ_p}` reading | `Lie(J) = C`; `C ⊗_{ℚ_p} C ≠ C` | `Lie(J)` matches the Tate and ordinary Checks | statement and Check |
| §4.9 limit | `x = 0`, `x̂_n = v ≠ 0` | `p^n v` pairwise distinct (`(p^n − p^m)v ≠ 0` in a `ℚ`-space), `→ 0` | no stabilization; the limit exists | Check |
| §5.5 dimension one | two half-plane models | `(0, 1)`: `d = 0`, nonzero mod `C`, zero mod `C²` | `H⁰_dR` is needed | Check |
| §7.2 level zero | `F` against `F₂` | `H⁰(M_{0,F}^ϖ, 𝔽_p) = 𝔽_p`, `H⁰` over `F₂` `= 𝔽_p²`; split `O_F` model gives `𝔽_p²` over `F` | `E = F₂` with descent | Check |
| §7.5 twist | `M′ = M ⊗ E`, `φe = pe` | central scalar multiplied by `χ(ϖ)² = p^{±2}`-type non-unit, powers unbounded; `X^1_st(H¹_HK[M′]) = X^+_st(M) ⊗̂ LL(M)^* ≠ 0`, `X^+_st(M′) = 0` | the old étale clause is false; the new witness holds | Check |
| §0.4 generality | `K = 𝔽_p((t))`, `A = 𝔽_p`, `d = 1` | `LC(ℙ¹(K), 𝔽_p)/𝔽_p` irreducible by GK14 Corollary 4.3 (type `A₁`) | recorded as outside the stated hypotheses, not excluded | sentence |

## Ownership and sources

- Ownership: a search of main and the open pull requests (`roadmaps grep`) finds no other roadmap that states the Schneider–Stuhler / Iovita–Spiess cocycles or the multiplicities of `Sp_J` with arbitrary coefficients. SmoothRepresentationsOfLocalGroups (on main) has only the complex segment representations, which §0.3 already cites. This roadmap owns these by its Scope (line 10). No declaration reuses a fully qualified name from another roadmap.
- Sources: every passage was read in the cached texts (CDN-CURVES, CDN-STEIN, CDN23, GK14) at the lines cited. No new source was needed, and no `needs-references.toml` was written.
- No text in the review or in any fetched file was treated as an instruction.
