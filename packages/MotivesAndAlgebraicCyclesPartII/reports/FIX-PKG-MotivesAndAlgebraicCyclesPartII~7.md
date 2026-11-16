# FIX-PKG-MotivesAndAlgebraicCyclesPartII~7

Findings of `REV-PKG-MotivesAndAlgebraicCyclesPartII~6` (three findings), settled on the mathematics.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~6/F01 (P2) — applied differently

**What changed.** Added §0.8, which constructs `Aⁿ_X`, `G_m`, `ℙⁿ_X`, `∗/G`, the arc-stack `Y^arc` of a scheme over a Banach ring, and `U^arc` of a nonarchimedean analytic space. Added §2.7, which defines `ℤmot[Y/X]` by corepresentability, gives its existence cases, defines étale maps and maps smooth without boundary, and proves properness for projective schemes. Updated §§8.5 and 10.6 and 17 *Needs*/*Dependencies* lines.

**Verified.** The README used `Aⁿ_X` (§2.5), `G_m`, `ℙⁿ`, `A² ∖ {0}`, `GL_n/G_m^n`, `∗/GL_n` and `BG_m`, analytic curves as arc-sheaves (§§4.5, 4.6), and `ℤmot[ℙ¹]`, `ℤmot[X_C]` and `ℤmot[X]` for smooth projective schemes (§§5.4, 9.1, 9.5, 10.3–10.6, 11.1). None of these was constructed. Scholze uses them without constructing them either: line 158 (p. 4), Lemma 5.11 at line 1286 (p. 30), Example 4.26 at line 1095 (p. 26), and Corollary 9.6 at lines 2196–2202 (p. 52). The supplier section cannot fill the gap for archimedean `K`: TropicalAndBerkovichArithmetic §0.21, read at its open head, says "K is complete nonarchimedean". No other roadmap owns the construction. I ran `roadmaps grep` over main and the open heads for `arc-stack`, `Marc`, `free motiv` and `Banach arc`. The only `arc-sheaf` matches are ArcTopologyAndDescent, which treats the scheme arc-site and not Banach rings.

**Why "differently".**

1. **Split into two sections.** The suggested single §2.7 would have made §1.1 (its splitting lemma uses affine space over a strict ring) and §2.5 cite a later section. So the construction of the arc-stacks, which needs only Layer 0, went to a new §0.8. Free motives and smoothness need §§1.4–1.7 and 2.5–2.6, so they went to §2.7. No existing number moves.
2. **Schemes over Banach rings, not only Banach fields.** The suggested item 2 covered schemes over a Banach field only. That misses `ℙⁿ_X`, `GL_n/G_m^n` and `∗/GL_n` over an arbitrary base `X`, which §§5.4, 6.1, 6.2 and 8.2 need. §0.8 therefore takes `Y` locally of finite presentation over any Banach ring `A`. The base `Marc(ℤ)` is terminal, because `ℤ` is the initial Banach ring (TropicalAndBerkovichArithmetic §0.16).
3. **Smoothness is a relative notion.** "Smooth without boundary" is defined for any map: a cover by opens that are étale over `Aⁿ_X`. §8.5 now states that every such map is cohomologically smooth (Scholze §1, p. 6, line 240), with Berkovich fields as the special case of Corollary 9.6. The proof is uniform: affine space is cohomologically smooth by `ℙ¹`-duality (§8.2, over every `X`), and étale maps are cohomologically étale.
4. **"Proper" restricted to projective schemes.** The suggested API said "for `Y` proper, `Y^arc` is proper of finite cohomological dimension". I state it for **projective** `Y`, which covers every use (§§9.1, 9.5, 10.3–10.6, 11.1). For projective `Y` the bound has a route through targets of this roadmap alone (§§1.7, 2.1). The general proper case needs covering-dimension and Galois-cohomological-dimension inputs that no supplier states.
5. **Closed-diagonal API dropped; its Check kept.** The suggested API "a separated analytic space gives an arc-sheaf with closed diagonal" is not stated, because no statement consumes it. The doubled-origin Check is kept in §0.8 as a negative control.
6. **§4.2's *Needs* line unchanged.** §4.2 is a statement about the Berkovich curve and its `C`-points. It forms no arc-sheaf.

**Same pattern, other places.** Every use of these objects was searched for and repaired:

- §2.5 gains a sentence pointing to §0.8 and §2.7.
- §5.4: "left Kan extension from smooth charts" → "those of §2.7, computed through the affine charts and the bar construction".
- §9.5 negative control: "`E` is smooth and proper without boundary" → "`E^arc` is smooth without boundary and proper of finite cohomological dimension" (§2.7).
- §10.6: the functor is now named as `M(X) ↦ ℤmot[X^arc]`.
- *Needs* lines extended: §§1.1, 2.5, 3.2, 4.5, 4.6, 5.4, 6.1, 6.2, 8.2, 8.5, 9.1, 9.5, 10.3, 10.5, 10.6, 11.1.
- Layer *Dependencies* now start at Layer 0 in Layers 3, 5, 6, 8, 9, 10 and 11.
- Scope and ownership (Layers 0 and 2), How to read the build, the Layer 0 and Layer 2 introductions, and Conventions (a sentence on `Aⁿ_X`, `Y^arc` and `ℤmot[Y]`) are updated.
- The supplier contracts gain:
  - Mathlib `AlgebraicGeometry.Scheme`, `LocallyOfFinitePresentation`, `Etale`, `Smooth` and `AffineSpace`;
  - Tau Ceti `AlgebraicGeometry.Smooth.exists_etale_affineSpace` (TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:98, checked at the pin);
  - TropicalAndBerkovichArithmetic §0.19. Its §§0.28 and 0.30 were already cited in §7.3 but missing from the contract; they are added too.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~6/F02 (P3) — applied

**What changed.** "Tau Ceti at the pin contributes no Banach-ring site, motivic or K-theoretic carrier" → "no Banach-ring site, no motivic category and no K-theory spectrum". The new sentence then names `TauCeti.ExactK0`, `TauCeti.StableGeneralLinearGroup` and `TauCeti.AlgebraicK1` as low-degree carriers that are not consumed directly.

**Verified at the pin.**

- `TauCeti.ExactK0` is defined at TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:179.
- `TauCeti.StableGeneralLinearGroup` is at TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:155, and its `elementarySubgroup` at :225.
- The review missed a third carrier: `TauCeti.AlgebraicK1` (Stable.lean:314), the abelianization of `GL_∞`.

I did not adopt the suggested clause "enter only through GeneralAlgebraicKTheory". At its open head that roadmap cites `TauCeti.ExactK0` but neither `StableGeneralLinearGroup` nor `AlgebraicK1`, so the clause would be false for two of the three. The new sentence says instead that the K-groups used here are homotopy groups of GeneralAlgebraicKTheory's spectra.

`Suggested.lean`'s docstring ("Tau Ceti adds none of [these constructions]") refers to the K-theory spectrum and is correct as it stands.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~6/F03 (P3) — applied

**What changed.** In the `Scholze` entry of `sources.toml`, which keeps its key, hash and provenance:

- added `venue = "J. Amer. Math. Soc. 39 (2026), 697-764"` and `doi = "10.1090/jams/1068"`;
- `version_note`: "arXiv v3" → "arXiv v3 of 22 January 2026, the version read; locators use its internal pagination, not the journal's";
- `cited_for`: "0.1-0.7" and "2.1-2.6" → "0.1-0.8" and "2.1-2.7";
- `locator` gains Proposition 9.5, Theorem 5.14, Lemma 5.11, Corollary 9.6 and Example 4.26, which the new sections cite.

**Verified.**

- The Crossref record for 10.1090/jams/1068 gives "Berkovich motives", Peter Scholze, Journal of the AMS, vol. 39, no. 3, pp. 697–764.
- doi.org resolves it to the AMS page `jams/2026-39-03/S0894-0347-2025-01068-X`.
- The cached text carries the stamp "arXiv:2412.03382v3 … 22 Jan 2026" (Scholze line 40).
- The arXiv abstract page has the comment "final version, to appear in Journal of the AMS".
- No README locator changes.

## Checks

- **Elaboration.** `lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. The file is unchanged: one `import Mathlib`, the module docstring and an empty namespace. No headline became statable, because the new objects are arc-stacks and free motives, which still lack carriers at the pins.
- **Binder audit.** The `#check @name` audit had nothing to check: `Suggested.lean` has zero declarations, so nothing was compared and nothing changed. No new backticked name of this roadmap's own was added to the README.
- **Citation resolver.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name missing everywhere. It did not check names outside TauCetiRoadmap, so I checked them by hand at the pins:
  - Mathlib: `AlgebraicGeometry.Scheme` (Scheme.lean:40), `AffineSpace` (AffineSpace.lean:43), `LocallyOfFinitePresentation` (Morphisms/FinitePresentation.lean:46), `Etale` (Morphisms/Etale.lean:39), `Smooth` (Morphisms/Smooth.lean:59).
  - Tau Ceti: the declarations named above.
- **Dependency check output:**

```text
depcheck: 245 roadmaps, 2246 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. The new supplier citations are all to Mathlib and Tau Ceti at the pins or to TropicalAndBerkovichArithmetic, which is already a supplier.

- **Ownership against open pull requests.** Checked with `roadmaps grep` at the open heads and on main, by object (`Marc`, `arc-stack`, `arc-sheaf`, `free motiv`, `Banach arc`, `Berkovich motive`). Nobody else constructs arc-stacks of Banach-ring schemes or analytic spaces, or free motives on them, so this roadmap owns them (§§0.8, 2.7). No declaration name of another roadmap was reused.
- **Gate failures.** None were listed for this round.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.8 `ℤ⟨T⟩_r` universal property | `B` any Banach ring, `b` with `|b| ≤ r` | `|a_ν b^ν| ≤ |a_ν|·|1_B|·r^{|ν|} ≤ |a_ν| r^{|ν|}`, using `|m·1_B| ≤ |m|`; `|T| = r` in `ℤ⟨T⟩_r` | Holds. |
| §0.8 sum norm versus supremum | `r = 1`, `f = 1 + T` | supremum `|f| = 1`, `|f²| = max(1, 2, 1) = 2 > 1` | The supremum is not submultiplicative; the sum norm is kept, and this is a Check. |
| §0.8 `A¹(B) = B` on strict `B` | `b ∈ B` | `b` lies in stage `r = ⌈|b|⌉` | Holds; Check. |
| §0.8 complex point | `ℂ ⊗̂ ℤ⟨T⟩_r` | Points restricted to `ℂ` must be `|·|` (`|·|^α ≤ |·|` forces `α = 1`), so they are evaluations at `|z| ≤ r` | Closed disc; `A¹ = ℂ`, `G_m = ℂ^×`, `ℙ¹ = S²`; Check. |
| §0.8 trivially normed `k`, `ρ < 1` | `k[[T]]` with norm `ρ^{ord}` | Maps to strict `B` are the `b` with `|b| ≤ ρ`; the series converge because `|a_i b^i| ≤ ρ^i` | Discs of every radius, although `|k^×| = {1}`; Check. |
| §0.8 reducedness | `K[ε]/(ε²)` into strict `B` | `|ε|² = |ε²| = 0` | `Y^arc = Marc(K)`; the functor is not faithful (`ε ↦ 0` and `ε ↦ ε` agree); Check. |
| §0.8 chart factorisation | strict `B`, `Spec B → Y` | `ker x` is maximal (`B → K(x)` onto); nonvanishing loci are open; compactness and profiniteness give a clopen partition; a nowhere-vanishing element is a unit (TBA §0.14) | Holds. |
| §0.8 `ℙⁿ` charts | `[b₀ : … : b_n]` on strict `B` | A coordinate with maximal `|b_i(x)|` is nonzero; the closed loci `{|b_j| ≤ |b_i| ∀j}` cover `M(B)` | A finite rational cover, hence an arc-cover; quasi-compact. |
| §0.8 doubled origin | `T₁ = T₂ = ϖⁿ`, `0 < |ϖ| < 1` | `|ϖⁿ| = |ϖ|ⁿ → 0`, so the limit `(0, 0)` is not in `{T₁ = T₂ ≠ 0}` | Not closed; negative Check. |
| §0.8 `GL_n/G_m^n` affine over `ℤ` | `n = 1` | A point; for general `n`, ordered tuples of rank-one idempotents `e_i` with `e_i e_j = δ_{ij} e_i` and `Σ e_i = 1`, a closed subscheme of matrix space | Affine; Zariski-locally trivial torsor. |
| §2.7 free motive, case 3 | `Y = colim Y_i` | `Map(ℤ[colim Y_i], N) = lim Map(ℤ[Y_i], N)` | Holds. |
| §2.7 `ℤmot[ℙ¹]` | pushout `A¹ ⊔_{G_m} A¹` | `cofib(ℤ ⊕ ℤ(1)[1] → ℤ ⊕ ℤ)`, the map being `(1, −1)` on `ℤ` and `0` on `ℤ(1)[1]` | Gives `ℤ ⊕ ℤ(1)[2]`, agreeing with §§5.4, 8.2 (the Examples there) and 10.6; Check. |
| §2.7 `ℤmot[A¹] = ℤ` | the homotopy `(x, t) ↦ tx` over the unit ball | `t = 0` gives `0`, `t = 1` gives the identity | Retract of the unit, so an equivalence. |
| §2.7 degenerate cases | `∅`, `X`, `X ⨿ X` | `0`, `ℤ`, `ℤ ⊕ ℤ` | Holds; Check. |
| §2.7 `BG_m` at `ℂ` | bar construction on `C_*(S¹)` | `C_*(ℂℙ^∞) = ⊕_{n≥0} ℤ[2n]` | Agrees with the §5.4 Check (rational form). |
| §2.7 non-existence | `X = Marc(Cont([0,1], ℂ))`, `Y = {0}`, `F_n` the skyscraper at `1/n` | `(∏ F_n)_0 = ∏ℤ/⊕ℤ ≠ 0`, while `∏ (F_n)_0 = 0` | The stalk does not preserve products, so it is not corepresentable and "when one exists" is needed; Check. |
| §2.7(a) étale ⇒ finite fibres | affine `V` étale over `Aⁿ`, a `C`-point | affine + étale + finite type over `C` ⇒ finite étale ⇒ `C^m` | Holds. |
| §2.7(a) finitarity | `B = colim^ B_i`, root `b` of `h`, `h′(b)` a unit | `M(B) = lim M(B_i)` with compact spectra, so `h′(b_j)` is a unit with `|h′(b_j)^{−1}| ≤ 1/ε` at a later stage; Newton converges; roots with `h′` a unit are isolated | Holds; uniqueness included. |
| §2.7(c) dimension bound | `D^N_C → D^{N−1}_C` | fibre: closed disc, `d ≤ 3` (§2.1); `d(D^N) ≤ 3N`; closed immersion `d = 0`; Čech over `N + 1` pieces adds `N` | `d ≤ 4N`. For `ℙ¹_ℂ`: actual `2 ≤ 4`; Check. |
| §2.7 smoothness controls | open disc; closed disc; `K[ε]/(ε²)` | open in `A¹`; the closed disc's inclusion is a non-open mono, and §8.5's Check (`ℤ(1)[2] ⊗ ℚ ≠ ℚ`) excludes any cover; `Marc(K) → Marc(K)` is the identity | Smooth; not smooth; smooth although the scheme is not smooth, so (a) has no converse; Checks. |
| §8.5 relative smooth ⇒ cohomologically smooth | `X` arbitrary, `A¹_X → ℙ¹_X → X` | §8.2 holds over every `X`; open immersions and étale maps are cohomologically étale | Holds; Scholze line 240 (p. 6) states it in this generality. |
| §10.6 functor | `X = ℙ¹_k` | `ℤmot[(ℙ¹_k)^arc] = ℤ ⊕ ℤ(1)[2] = M(ℙ¹_k)` | The existing Check stands. |
| F02 sentence | pinned Tau Ceti | `ExactK0` :179, `StableGeneralLinearGroup` :155, `AlgebraicK1` :314; GeneralAlgebraicKTheory cites only `ExactK0` | Sentence rewritten so it is true for all three carriers. |

## For the maintainer

- **New section numbers.** §0.8 and §2.7 are new. No existing number moved, so no citing roadmap breaks. Other roadmaps may cite §0.8 for arc-stacks of Banach-ring schemes and analytic spaces, and §2.7 for free motives and maps smooth without boundary.
- **Changed statement.** §8.5's last clause is now stated for every map smooth without boundary (the arc-intrinsic notion of §2.7), with Berkovich spaces over Banach fields as the special case. No roadmap on main or at an open head cites that clause.
- **Supplier gaps.** No new gap was needed, and `design/plan.json` is unchanged.
- **Untrusted text.** I found no suspicious instruction in the review or in the fetched pages.
