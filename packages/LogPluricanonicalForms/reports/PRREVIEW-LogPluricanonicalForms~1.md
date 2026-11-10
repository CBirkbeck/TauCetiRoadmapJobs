# Review of LogPluricanonicalForms (pull request #2122 at eae214f)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). The checks were run against the pinned Mathlib (`1b1ccf4b`) and Tau Ceti (`2fd255d9`) and against the roadmaps on main. It does not assess whether this scope is the right mathematics for Tau Ceti; that needs a subject expert.

## R01 (P2) — `Suggested.lean` leaves out the roadmap's headline, which can be stated at the pins

**Location.** `TauCetiRoadmap/LogPluricanonicalForms/Suggested.lean`, lines 5–13 and 19–45. The module docstring says the file holds "algebra-facing contracts" and that "the geometric targets are specified in the README". It states no Layer 4 theorem and does not say that any headline cannot be stated.

**Claim.** The README's headlines are the Layer 4 generic nonvanishing theorem and the negative-fiber corollary (README lines 126–142). Neither is stated. The docstring never says which headlines cannot be stated or which carrier is missing. Instead the file states two Layer 3 algebra lemmas (R04, R05).

**Witness.** A scratch file with `import Mathlib` and Tau Ceti `Differentials.LocallyFree`, `Determinant.LocallyConstantRank`, `LineBundle.{TensorProduct,Dual}`, `EffectiveCartierDivisor.Invertible` and `Monoidal.TensorPow` elaborates with only a `sorry` warning. It defines `logCanonical X hE := (FiniteLocallyFreeSheaf.relativeDifferentials ℂ X).det.tensorProduct hE.toInvertibleSheaf.dual` and states the corollary over it.

**Repair.**
- Make the module docstring "Logarithmic pluricanonical forms: target signatures".
- Add two real-body definitions:
  - `logCanonical`, as above;
  - `NegLogKodaira X hE := ∀ m, 0 < m → ∀ s : Γ(tensorPow (logCanonical X hE).obj m, ⊤), s = 0`.
- State the negative-fiber corollary in the README's pointwise form (the probe that elaborated):

  `∃ Z : ℕ → Set Y, (∀ i, IsClosed (Z i) ∧ Z i ≠ univ) ∧ ∀ y : Spec ℂ ⟶ Y, y ≫ (Y ↘ Spec ℂ) = 𝟙 _ → range y.base ⊆ V \ ⋃ i, Z i → ∀ F i, IsPullback i (F ↘ Spec ℂ) f y → ∀ hEF, EF = E.comap i → NegLogKodaira F hEF → NegLogKodaira X hE`

  with `X`, `Y` integral, smooth and proper over `ℂ`, `f` over `ℂ` and surjective, and `[Smooth (f ∣_ V)]`.
- Either state the generic nonvanishing theorem as nonvanishing of the pulled-back section `i^* s`, or name it in the docstring as not statable, with the missing carrier (the fiber adjunction isomorphism).
- The probe takes `E` to be any effective Cartier divisor. Manuscript §2.2 uses only restriction and adjunction, and that argument goes through whenever `E.comap i` is effective Cartier. So also widen README Layer 4 to that generality, with reduced SNC as the case of interest, so that the README and the Lean file agree.

## R02 (P2) — Layer 1.1 re-plans strict normal crossings, which SchemeAndStackFoundations §4.17 and Tau Ceti already own

**Location.** README line 17: "This roadmap owns reduced simple normal-crossing boundaries". Lines 57–61: "Define a reduced simple normal-crossing effective Cartier divisor … through étale local coordinates … Prove compatibility with the finite-family formulation".

**Claim.** The same objects already have owners:
- SchemeAndStackFoundations §4.17 (on main) owns the definition, the finite-family formulation and its API (`.local_equation`, `.component`, `.isEffectiveCartier`, `.of_subset`).
- Tau Ceti's `TauCeti.SmoothPair.AlgebraicChart` (`AlgebraicGeometry/SmoothPair/AlgebraicChart.lean:45`) is the étale-coordinate chart in which the ideal is a product of distinct coordinates.

The wording "through étale local coordinates: locally" also does not say whether "locally" means Zariski-locally or étale-locally. That choice is the difference between strict normal crossings and plain normal crossings.

**Witness.** SchemeAndStackFoundations README lines 6391–6397 define `SNCData`, `IsTransverse` and `IsStrictNormalCrossings`. Its Checks treat the nodal cubic `y² = x²(x+1)` as normal crossings but not SNC. That curve has an étale-local `xy` chart, but its single component is singular at the node, so the README's "compatibility" fails under the étale reading.

**Repair.**
- Delete the definition and the compatibility theorem from §1.1, and remove "owns reduced simple normal-crossing boundaries" from the Scope section.
- Cite SchemeAndStackFoundations §4.17 `IsStrictNormalCrossings` and its API, and Tau Ceti `TauCeti.SmoothPair.AlgebraicChart`, in the supplier contracts.
- Keep in §1.1 only what is new here: the open complement, pullback by `Scheme.IdealSheafData.comap`, and the comparison "SNC on a smooth `ℂ`-variety ⟺ Zariski-covered by `AlgebraicChart`s".

## R03 (P3) — The push gate fails

**Location.** README line 21 (`blob`). `Suggested.lean` lines 1–3 (`imports`, `mathlib-subimports` ×3, `no-import-mathlib`).

**Claim.** Running the gate on this head prints `… blob=1 … imports=1 mathlib-subimports=3 no-import-mathlib=1 … FAIL`.

**Witness.** README line 21 links `github.com/TauCetiProject/TauCetiRoadmap/blob/651d0822…/TauCetiRoadmap/AlgebraicVectorBundles/README.md`. The Lean file imports `Mathlib.RingTheory.Kaehler.JacobiZariski`, `Mathlib.LinearAlgebra.ExteriorPower.Basic` and `Mathlib.RingTheory.TensorProduct.Basic`.

**Repair.**
- Write "AlgebraicVectorBundles §3.2", or link `../AlgebraicVectorBundles/README.md#32-the-determinant-of-an-extension`.
- Replace the three imports with `import Mathlib`, followed by the `TauCeti.*` modules that R01 uses.

## R04 (P3) — `cotangentTransitivity_injective` is padding

**Location.** `Suggested.lean` lines 19–26.

**Claim.** It follows from one library lemma in a single term, so it is not a headline.

**Witness.** A scratch copy elaborates without `sorry` using this proof:

`(LinearMap.exact_zero_iff_injective (Algebra.H1Cotangent A B) _).1 (Subsingleton.elim 0 (Algebra.H1Cotangent.δ R A B) ▸ Algebra.H1Cotangent.exact_δ_mapBaseChange R A B)`

The lemma is Mathlib `RingTheory/Kaehler/JacobiZariski.lean:552`.

**Repair.** Delete it from `Suggested.lean`. In README Layer 3, cite `Algebra.H1Cotangent.exact_δ_mapBaseChange` for the injectivity step instead of planning it.

## R05 (P3) — `canonicalAdjunction` is an intermediate lemma, not a headline

**Location.** `Suggested.lean` lines 28–45, the determinant isomorphism of the transitivity sequence with explicit bases.

**Claim.** It is a Layer 3 step. Mathematically it is a special case of the ring-level short-exact determinant isomorphism, which another roadmap owns. The statement itself is true (see the table).

**Witness.** Stacks Tag 0FJB (More on Algebra, Lemma 15.120.2, p. 370; stacks-0FJB lines 17149–17163) gives the same rule, `m′₁∧…∧m′ᵢ ⊗ m″₁∧…∧m″ⱼ ↦ m₁∧…∧m_{i+j}`. PadicMeasuresIwasawaAlgebras §5.1 plans `detLine_shortExact`. Tau Ceti's `TauCeti.exteriorPower.shortExactEquiv` covers fields.

**Repair.** Delete it from `Suggested.lean`. Keep it as a Layer 3 target in the README, with *Needs:* PadicMeasuresIwasawaAlgebras §5.1 (or AlgebraicVectorBundles §3.2 with §3.3) and Mathlib `Algebra.H1Cotangent.exact_δ_mapBaseChange`.

## R06 (P3) — Targets carry no locators, including both sampled sections

**Location.** README §1.1 (lines 57–67), §1.2 (lines 71–80), Layer 2 (lines 84–99), Layer 3 (lines 103–122) and Layer 4 (lines 126–142) contain no source citation. Line 164 reads "Tag 0FJB, determinants of finite projective modules".

**Claim.** No claim has a locator. 0FJB is the short-exact-sequence lemma; the determinant itself is defined at 0FJ9.

**Witness.**
- The finite-family equivalence of §1.1 is Stacks Tag 0BIA (Lemma 41.21.2); the definition is Tag 0BI9 (Definition 41.21.1), étale chapter p. 26, stacks-0BI9 lines 1163–1179.
- The Layer 4 argument is in openai-reverse-log-kodaira §2.2, p. 5, lines 220–224.

**Repair.**
- §1.1: cite "(Stacks Project, Tags 0BI9 and 0BIA)", or SchemeAndStackFoundations §4.17 after R02.
- §1.2: cite a text that states that `ω_X(E)` is the sheaf of top forms with simple poles along `E`.
- Layer 4: cite "(manuscript §2.2, first paragraph, p. 5)" at the theorem.
- Line 164: write "Tag 0FJ9 (determinant), Tag 0FJB (short exact sequences)".

## R07 (P3) — The README does not follow the house shape

**Location.** The whole README. Line 1 reads "# Logarithmic pluricanonical forms and generic fiberwise nonvanishing". The headings are `## Existing foundations and supplier contracts`, `## Required checks and consumers` and `## Mathematical references and prior formalization`.

**Claim.** Missing pieces:
- the `# Roadmap:` title, the `**Summary.**` paragraph, `## Conventions`, `## How to read the build` and `## Downstream consumers`;
- `### k.n` subsections in Layers 2–4, and `### Examples` and `### Dependencies` in every layer;
- every `*Needs:*` line, and every API bullet list.

There are seven Checks in total, and none sits under a definition.

**Witness.** Of the seven definitions (SNC boundary, `ω_X(E)`, the pluriform section module, negative log Kodaira dimension, the fiber model, the restriction map, the very-general quantifier), none has three Checks. The very-general quantifier (line 136) names no ambient space.

**Repair.** Restructure on the model of AlgebraicVectorBundles:
- Give each definition prose API bullets and at least three Checks.
- Give each target a *Needs:* line naming its inputs, for example Mathlib `Scheme.Hom.isOpenMap` or Chevalley constructibility for the Layer 4 open set, and `KaehlerDifferential.tensorKaehlerEquiv` for the base change used in Layer 3.
- Define "very general" on the `ℂ`-points of `Y ∖ |D|`, as the complement of a countable union of proper closed subsets of `Y`.

## R08 (P3) — The supplier contracts are vague, and one name is wrong

**Location.** README lines 35–46: "Tau Ceti `AlgebraicGeometry.Modules.Differentials.{Basic,Rational,Canonical,Rank}`"; "`FiniteLocallyFreeSheaf.det` and `pullbackDetIso` from AlgebraicVectorBundles"; "`Submodule.mem_of_forall_maximal_exists_smul_mem`".

**Claim.**
- The list names modules where it should name declarations.
- `det` and `pullbackDetIso` are Tau Ceti declarations at the pin, not AlgebraicVectorBundles targets.
- The `Submodule` lemma exists in neither pinned library.
- The carriers that `ω_X(E)` is built from are not named.

**Witness.**
- A search of both pins finds no `mem_of_forall_maximal_exists_smul_mem`. Mathlib has `Submodule.mem_of_localization_maximal` (`RingTheory/LocalProperties/Submodule.lean:48`).
- `FiniteLocallyFreeSheaf.det` is at `VectorBundle/Determinant/LocallyConstantRank.lean:62`.
- `relativeDifferentials` is at `Differentials/LocallyFree.lean:95`.

**Repair.** Write `### From Mathlib`, `### From Tau Ceti` and `### From TauCetiRoadmap.<X>` lists with exact names:
- From Tau Ceti: `FiniteLocallyFreeSheaf.relativeDifferentials`, `FiniteLocallyFreeSheaf.det`, `FiniteLocallyFreeSheaf.pullbackDetIso`, `Scheme.IdealSheafData.IsEffectiveCartier.toInvertibleSheaf`, `InvertibleSheaf.dual`, `InvertibleSheaf.tensorProduct`, `TauCeti.tensorPow`, `TauCeti.SmoothPair.AlgebraicChart`, `TauCeti.exteriorPower.equivBaseChange`, `IsBaseChange.exteriorPowerEquiv`, `Scheme.IdealSheafData.ideal_comap_of_le`.
- From Mathlib: `Submodule.mem_of_localization_maximal`, `Algebra.H1Cotangent.exact_δ_mapBaseChange`, `Scheme.IdealSheafData.comap`.
- From the roadmaps: AlgebraicVectorBundles §3.2–3.3, PadicMeasuresIwasawaAlgebras §5.1, SchemeAndStackFoundations §4.17.

## R09 (P3) — Some targets are conditional on a Kodaira-dimension API that does not exist

**Location.** README line 29: "an existing dimension API should be connected by an equivalence". Lines 98–99: "If an existing Kodaira-dimension object is used, prove …". Lines 139–140: "If a full Kodaira-dimension API is in use, derive …".

**Claim.** These targets are optional in effect, which is against "be definite about scope".

**Witness.** A search of both pins finds no Kodaira-dimension or Iitaka-dimension declaration. The only hits are the Kodaira–Néron reduction theorems on elliptic curves and Kodaira fibre types.

**Repair.** Delete the three conditional sentences. If the Kodaira dimension is wanted, make it a definite target with its bottom-value equivalence.

## R10 (P3) — Process narrative, and a Check that refers to external code

**Location.**
- Line 157: "Give the explicit comparison with the family 033 rational-lattice section space and recover its original negative-fiber theorem".
- Lines 169–175: "The user-supplied cLEAN refactoring … Its snapshot and declaration-by-declaration contribution map accompany this draft."
- Line 33: "the destination's actual pinned dependencies".
- Line 130: "The proof must produce the open from …".

**Claim.**
- The family 033 Check tests code outside Tau Ceti, not mathematics.
- "this draft", "user-supplied" and "destination" are process words.
- Line 130 makes a proof route mandatory.

**Witness.** "family 033" and "rational-lattice section space" are defined nowhere in the README. No snapshot or contribution map is in the repository.

**Repair.**
- Replace the 033 Check with a mathematical one, for example `C × ℙ¹ → ℙ¹` with `E = C × {0, ∞}`, where the section `1` of `ω_X(E) ≅ 𝒪` restricts to `1` on every fiber over `ℙ¹ ∖ {0, ∞}`.
- Cut the process sentences down to a one-line provenance note.
- Rephrase line 130 as a proof sketch.

## R11 (P3) — The orientation Check leaves the maps unspecified

**Location.** README line 148: "For `0 → R → R² → R → 0`, the determinant comparison sends `1 ⊗ 1` to `e₁ ∧ e₂`".

**Claim.** The value depends on the inclusion and the projection, and the Check fixes neither. In characteristic 2 the sign cannot discriminate anyway.

**Witness.** With inclusion `1 ↦ e₂` and the first projection, the rule "submodule factor first" gives `e₂ ∧ e₁ = −e₁ ∧ e₂`.

**Repair.** Write "with inclusion `1 ↦ e₁` and the second projection", as the AlgebraicVectorBundles §3.2 orientation Check does. Add that over `𝔽₂` the sign is invisible, so `ℤ` is the case that discriminates.

## Verified sound

**Gate and dependency check.**
- I ran the gate on this head. Every check passed except `blob` and `imports` (R03).
- The dependency check printed `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`, so no UPWARD or CYCLE line.
- The only supplier cited by name is AlgebraicVectorBundles, which is on main. Its §3.2 exists and states `γ` with the submodule factor first.
- `git diff --stat origin/main...HEAD` lists only the three files in the folder. `metadata.toml` is `math.AG`.

**Lean.**
- `lake env lean` on `Suggested.lean` gives two `sorry` warnings and nothing else.
- `#check @` on both declarations confirms the binders `R A B`, `[IsScalarTower R A B]`, `[Subsingleton (Algebra.H1Cotangent A B)]` and `b`, `c`. Nothing was dropped, and the generality matches README Layer 3.
- The R01 headline probe elaborated after building `TauCeti.CategoryTheory.Monoidal.TensorPow`.

**Library declarations opened at the pins.**
- Mathlib: `Algebra.H1Cotangent.exact_δ_mapBaseChange` (`JacobiZariski.lean:552`), `LinearMap.exact_zero_iff_injective` (`Algebra/Exact/Basic.lean:277`), `Scheme.IdealSheafData.comap` (`IdealSheaf/Functorial.lean:39`), `Smooth` and `SmoothOfRelativeDimension` (`Morphisms/Smooth.lean:59, 127`), `KaehlerDifferential.tensorKaehlerEquiv` (`Kaehler/TensorProduct.lean:238`), and the scoped notation `Γ(M, U)` (`Modules/Sheaf.lean:92`).
- Tau Ceti: `FiniteLocallyFreeSheaf.relativeDifferentials` (`LocallyFree.lean:95`), `FiniteLocallyFreeSheaf.det` (`LocallyConstantRank.lean:62`), `pullbackDetIso` (`Determinant/Pullback.lean:156`), `IsEffectiveCartier.toInvertibleSheaf` (`Invertible.lean:307`), `InvertibleSheaf.dual` (`Dual.lean:44`), `InvertibleSheaf.tensorProduct` (`LineBundle/TensorProduct.lean:65`), `tensorPow` (`TensorPow.lean:54`), `Scheme.Modules.instMonoidalCategory` (`Modules/TensorProduct.lean:55`), `exteriorPower.equivBaseChange` (`ExteriorPower/BaseChange.lean:68`), `IsBaseChange.exteriorPowerEquiv` (`ExteriorPower/Localization.lean:45`), `ideal_comap_of_le` (`IdealSheaf/Affine.lean:79`), `exteriorPower.shortExactEquiv` (`ExteriorPower/ShortExact.lean:140`), `SmoothPair.AlgebraicChart` (`SmoothPair/AlgebraicChart.lean:45`) and `projectiveLine` `genus_eq_zero` (`Cohomology/ProjectiveLine/Basic.lean:755`).

**Ownership and overlaps.**
- I searched main and all 447 open heads by object: normal crossings, Kodaira dimension, plurigenera, log canonical, `Ω(log`, `SmoothPair`.
- The SNC duplication is R02.
- No roadmap on main owns a Kodaira dimension or logarithmic pluricanonical sections.
- AbundanceStatement (open) owns Weil canonical divisors on normal varieties and excludes Kodaira dimension, so it does not overlap with the log canonical line bundle here.
- `overlaps.md` lists no dropped ids and no conflicting heads, and I confirmed both.

**Sources.**
- The seeded targets §1.1 and §1.2 carry no locator (R06).
- For §1.1 I checked the natural source, Stacks 0BI9 and 0BIA. Its hypotheses (locally Noetherian, regular at the points of `D`) cover smooth `ℂ`-varieties. It supports the finite-family equivalence as the README states it, provided "locally" means Zariski-locally.
- Stacks 0FJB (Lemma 15.120.2, p. 370) supports the submodule-first determinant rule.
- Stacks 02G1 is Lemma 29.35.12 (smooth implies `Ω` finite locally free).
- The manuscript (openai/math, Apache-2.0) §2.2, p. 5, lines 220–224 supports the negative-fiber argument. Its standing hypotheses (lines 64–71: connected fibers, `Supp f*D ⊆ Supp E`, stratum smoothness) are stronger than README Layer 3 needs for this case. The weaker README hypotheses (`f` smooth over `Y ∖ |D|`, `E_F` supplied) still suffice, by the argument in row 9 below.

**Adversarial pass.**

| # | Statement | Instances tried | Values computed | Result |
|---|---|---|---|---|
| 1 | `cotangentTransitivity_injective` | (a) `ℤ → ℤ[x] → ℤ[x,y]`; (b) `ℤ → ℤ[x] → ℤ[x]/(x)` | (a) H₁ = 0; the map `B·dx → B·dx ⊕ B·dy` is injective. (b) H₁ = `(x)/(x²) ≅ ℤ ≠ 0`, excluded; the map `ℤ·dx → Ω_{ℤ/ℤ} = 0` is not injective. | True; the hypothesis is needed; one-term proof (R04) |
| 2 | `canonicalAdjunction`, degenerate case | `n = r = 0`, `R = A = B = ℤ` | Both sides `≅ ℤ`; `e(1 ⊗ 1) = ιMulti(∅) = 1` | True |
| 3 | `canonicalAdjunction`, lift independence | `ℤ[x] → ℤ[x,y]`, `b = (dx)`, `c = (dy)`; lifts `z = dy` and `z = dy + dx` | `dx ∧ dy`, and `dx ∧ (dy + dx) = dx ∧ dy` | True; the same holds over `𝔽₂[x] → 𝔽₂[x,y]` |
| 4 | `canonicalAdjunction`, the H₁ hypothesis | `ℤ[x] → ℤ`; `𝔽_p(t^p) → 𝔽_p(t)` | Without it: `∧¹ℤ ⊗ ∧⁰0 = ℤ` but `∧¹Ω_{ℤ/ℤ} = 0`. Inseparable case: H₁ `≅ B ≠ 0`, and `d(t^p) = 0` | Hypothesis necessary and correctly placed |
| 5 | §1.1 SNC | `V(xy) ⊂ 𝔸²`; nodal cubic; empty divisor | `V(xy)`: SNC with 2 components. Nodal cubic: étale-local `xy` chart exists, the Zariski equation is irreducible, the component is singular. Empty: SNC. | The étale reading contradicts the finite-family claim (R02) |
| 6 | §1.2 `ω_X(E)` and the pole convention | `𝔸¹`, `E = V(x)`; `X = Spec ℂ`; `ℙ¹` with `E = {0, ∞}` | `x·(dx/x) = dx` is regular, so `dx/x ∈ ω(E)`. `x·(dx/x²) = dx/x` is not regular, so `dx/x² ∉ ω(E)`. `det(0) = ∧⁰ = 𝒪`. `ω_{ℙ¹}(0 + ∞) ≅ 𝒪(−2 + 2) = 𝒪`, `h⁰ = 1` (`dz/z`). | True |
| 7 | Layer 2 rational description; unit change of equation | `𝔸¹`, `t = x`, `m = 2`; `t ↦ 2t` | `(dx)^{⊗2}/x² ∈`, `(dx)^{⊗2}/x³ ∉`; `(2x)² ω` is regular iff `x² ω` is | True |
| 8 | Negative log Kodaira dimension; the `m > 0` hypothesis | `ℙ¹`, `E = ∅`; `E = {0, ∞}`; `m = 0` | `h⁰(𝒪(−2m)) = 0` for all `m > 0`, so negative. `h⁰(𝒪) = 1`, so not negative. `m = 0`: `h⁰ = 1` always. | True; `m > 0` is needed |
| 9 | Layer 4 generic nonvanishing | `C × ℙ¹ → ℙ¹`, `C` elliptic, `E = C × {0, ∞}`, `D = {0, ∞}` | `ω_X(E) ≅ 𝒪`; the section `1` restricts to `1 ≠ 0` on `F = C` for every `y ∉ D`; `U = ℙ¹ ∖ {0, ∞}` | True; `f⁻¹D ⊆ E` and SNC are not used |
| 10 | Negative-fiber corollary, nonvacuous case | `ℙ¹ × Y → Y`, zero boundaries | Fibers: `h⁰(ℙ¹, 𝒪(−2m)) = 0`. Total space: `h⁰ = h⁰(ℙ¹, 𝒪(−2m)) · h⁰(Y, ω_Y^m) = 0` | Consistent |
| 11 | The very-general quantifier | `Y = Spec ℂ`; `Y = ℙ¹` | Point: proper closed sets are `∅`, so very general means everywhere. `ℙ¹`: the complement of a countable set, nonempty because `ℂ` is uncountable (and, correctly, not asserted) | True |
| 12 | Identity-map Check | `f = id_X`, `y ∈ X` | Fiber is `Spec ℂ`, `ω_pt = 𝒪`; restriction is `s(y) ∈ (ω_X)_y^{⊗m}` | True |
| 13 | SES orientation Check | inclusion `1 ↦ e₁`, `pr₂`; inclusion `1 ↦ e₂`, `pr₁` | `e₁ ∧ e₂`; `e₂ ∧ e₁ = −e₁ ∧ e₂` | Underdetermined (R11) |
| 14 | Headline statability | the R01 probe at the pins | Elaborates, with a `sorry` warning only | Statable (R01) |

## Not verifiable

- **§1.2 locator.** The README gives none. The standard reference, Esnault–Viehweg, *Lectures on Vanishing Theorems*, §2, could only be reached on a paywalled publisher page, through the sources service and a web search, so I could not check any page.
- **Prior-implementation materials.** The "user-supplied cLEAN refactoring" and its "contribution map" are in neither the repository nor any public place I found. The openai/math Lean files at commit `4eaee875` were not opened, because no target depends on them once R10 is applied.

## Source issues

- none
