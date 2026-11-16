# FIX-PKG-MotivesAndAlgebraicCyclesPartII~10

This report settles the three findings of `REV-PKG-MotivesAndAlgebraicCyclesPartII~9`. Each was checked against the sources and the cited roadmaps, and all three are applied. F01 is placed differently from the suggested repair, for the reason given below. Files changed: `packages/MotivesAndAlgebraicCyclesPartII/README.md` and the module docstring of `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`. `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no new source and no new supplier gap.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~9/F01 (P2) — applied

**What changed.** A new §1.8, "Étale finitary sheaves", defines `Det(X, Λ) ⊂ Dfin(X, Λ)` for a small arc-stack as the objects invariant under extensions of geometric Banach points. It has an API (colimits and t-structure, pullback, the strict description through `ν_*`) and four Checks. §4.8 is restated through this definition. The Conventions now define `Deff_mot(X, Λ)`, `Dmot(X, Λ)`, `Λ(n)` and `Λmot`. §12.2 defines these categories on `arcStack′`. §12.3 names its three categories, and the v-stack one is written `D_ét`.

**Verified.** The claim is right.
- DiamondEtaleCohomology §C2.2 (its open head) defines `D_ét(Y, Λ)` for small v-stacks only. `Marc(ℂ)` is no v-stack, yet `|2| = 2 ≥ 1` there, so the third clause of §4.8 named a category that was defined nowhere.
- `Dmot(Y, ℤ/n)` was undefined as well, and `Y = a′^* X` lives in `arcStack′`, not on Banach rings.
- Scholze line 1203–1205 (p. 28) and Remark 1.4 (lines 126–133, pp. 3–4) fix the meaning: "étale" picks out, among the finitary arc-sheaves, those invariant under change of algebraically closed field.

**Where the definition goes, and why it differs from the suggestion.** The reviewer asked for the definition in §4.8. It is placed in Layer 1 (§1.8) instead, for two reasons:
- Its statement and proof need only §§0.4 and 1.1–1.3.
- §2.4, an earlier target, already uses the same condition. §§2.4, 4.6 and 4.7 now name it ("étale (§1.8)"), and their *Needs* lines list §1.8.

The rest follows the suggestion:
- The DiamondEtaleCohomology §§C2.2 and C2.12 entries leave the §4.8 *Needs* line and the Layer 4 *Dependencies*; Layer 12 keeps them.
- The reviewer's three Checks are kept in §1.8, recomputed and sharpened. The second Check now shows non-inclusion in both directions: `Ḡ_m` is effective but not étale, and the constant sheaf `ℤ/ℓ` in characteristic `ℓ` is étale but not ball-invariant (§4.6, Checks). The third Check computes `Ḡ_m ⊗^L ℤ/n ≃ μ_n[1]` and `ℤ/n(1) ≃ μ_n`.
- §4.8 gains the Check `A = ℂ`, `p = 2`.

**§4.8 route for the third clause.** A `p`-power torsion `M` equals `M ⊗ fib(ℤ → ℤ[1/p])`, which is `colim_m (M ⊗^L ℤ/p^m)[−1]`. The first clause applies to each `M ⊗^L ℤ/p^m`, because `|p^m| ≥ 1`. Both subcategories are closed under colimits and cofibres.

**Clause numbering fixed in §4.8.** The text said "the first clause also holds under the pointwise condition" and "the second clause has `|p| ≥ 1`". These referred to the second and third clauses of the three-clause statement, and are renumbered.

**Same pattern elsewhere.**
- `Deff_mot(X, ℚ)` (§2.3), `ℚmot[−]` (§4.4) and `ℚ(n)` were used without a coefficient convention; the Conventions sentence now covers them.
- `Det` named two categories: the arc-stack one and the v-stack one of §§12.3–12.4. The v-stack one is now `D_ét(X, ℤ/n)`, DiamondEtaleCohomology's own notation (Conventions, §§12.3–12.4, and `D_et` → `D_ét` in the supplier contract).
- §12.3's route now derives `Dmot(Y, ℤ/n) ≃ Det(Y, ℤ/n)`: since `|n| = 1`, §4.8 gives `Deff_mot(Y, ℤ/n) = Det(Y, ℤ/n)`, and in that category `ℤ/n(1) ≃ μ_n` is already invertible, so stabilization changes nothing.

**Knock-on edits.**
- The Layer 12 *Dependencies* now read "Layers 0–4, 8 and 9", and the build overview says Layer 12 branches from Layers 4, 8 and 9.
- Scope and ownership, the build overview and the Layer 1 introduction mention §1.8.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~9/F02 (P3) — applied

**What changed.** README "From TauCetiRoadmap.JacobianChallenge": "Layer D (`pointedCurvePicard_representable`, the identity component `Pic⁰`)" became "Layer D (§D.2 `picardScheme`; §D.5 `isRepresentable_picZeroSets`: … representable by an open and closed subgroup scheme `Pic⁰` of `picardScheme`; §D.8 `jacobianScheme`, its representing object)". `multiplication_isogeny` also gained its locator, §E.7.

**Verified.** On main (`c639cfa`), `TauCetiRoadmap/JacobianChallenge/README.md` has no `pointedCurvePicard_representable`. The names it does have:
- `picardScheme` at line 868 (§D.2).
- `isRepresentable_picZeroSets` at line 986 (§D.5), stated for the standing curve, which line 91 defines as smooth, proper and geometrically connected of relative dimension 1.
- `jacobianScheme` and `jacobianSchemeRepresentableBy` at lines 1069–1070 (§D.8).
- `multiplication_isogeny` at line 1291 (§E.7: `n ≠ 0`, finite locally free and surjective).

The JacobianChallenge `Suggested.lean` declares `isRepresentable_picZeroSets` and `jacobianScheme` at its lines 147 and 161. `classGroupAddEquivLineBundleClass` is in the pinned Tau Ceti (`TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.lean:123`). The one lead in this job's citation list, `Perf.Spd`, is DiamondsAndVStacks §D6.1 (its line 260). After the edit the resolver reports no missing citation and no missing Lean name.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~9/F03 (P3) — applied

**What changed.**
- §10.1 API: the universal property now quantifies over every presentably symmetric monoidal `ℤ`-linear stable `𝒟`. It identifies the colimit-preserving symmetric monoidal `ℤ`-linear functors `DM_et(k, ℤ) → 𝒟` with the symmetric monoidal `F` that are additive on disjoint unions, satisfy étale hyperdescent and `A¹`-invariance, and send `cofib(F(Spec k) → F(G_m))` to an invertible object.
- The same unnamed-target pattern in the §8.1 API is repaired in the same way.

**Verified.** The bullet named no target category: "a symmetric monoidal functor out of smooth `k`-schemes … sending the reduced `G_m`-object to an invertible object" has no meaning for a target such as sets.

**An added condition.** One condition was added to the suggested wording. Every functor out of `DM_et(k, ℤ)` sends `X ⊔ Y` to `F(X) ⊕ F(Y)` and `∅` to `0`. The constant functor `F = 1_𝒟` is symmetric monoidal and sends every hypercover formed in schemes to a colimit diagram (a constant simplicial object realizes to itself), yet `F(∅) ≠ 0`. So the bullet states additivity explicitly. §10.1's definition now says the hypercovers have coproducts of representables as terms, which forces `M(∅) = 0` and `M(X ⊔ Y) = M(X) ⊕ M(Y)`.

**The same pattern in §8.1.** "A colimit-preserving symmetric monoidal functor out of `Deff_mot(X)` that inverts `ℤ(1)` factors uniquely" also named no target. It now reads: for every presentably symmetric monoidal `𝒟`, precomposition identifies the colimit-preserving symmetric monoidal functors out of `Dmot(X)` with those out of `Deff_mot(X)` that send `ℤ(1)` to an invertible object. This is EnhancedDerivedSheaves §E5:presentability.2 `tensorInversion`; its main line 1686 says `C[X⁻¹]` is initial among such categories.

## Checks run

- **Lean.** `lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is `import Mathlib`, the module docstring and an empty namespace.
  - Two docstring bullets changed. "Torsion and tilting comparisons" now lacks "`Dfin`, its étale subcategory `Det` (README §1.8), `Deff_mot` and `Dmot`". "Overconvergent comparison" now lacks "small v-stacks, their étale derived ∞-categories `D_ét`, and `Det` and `Dmot` of arc-stacks".
  - The file declares nothing, so the `#check @name` audit had nothing to compare and nothing changed.
- **Dependency check** (`gate --depcheck … --movable`), output:

  ```text
  depcheck: 239 roadmaps, 2269 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. Every supplier cited is unchanged, and all are earlier in the merge order. DiamondEtaleCohomology, JacobianChallenge and EnhancedDerivedSheaves were all suppliers before this round.
- **Citation resolver** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name found nowhere.
- **Style sweep** of every added line: no LaTeX delimiters, no machine paths and no process vocabulary.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.8 definition (extension of geometric points is isometric) | contractive map of multiplicative fields | `|φ(x)| ≤ |x|` and `|φ(x)|·|φ(x⁻¹)| = 1`, `|φ(x⁻¹)| ≤ |x|⁻¹`, so `|φ(x)| ≥ |x|` | Holds. |
| §1.8 API, colimits and truncations | `B = C`, `B = C × C`; `H^i` | evaluation at strict rings is pointwise on the strict basis (§1.2); `H^i(M)(C) = H^i(M(C))` by vanishing of positive cohomology on strict rings (§1.1) and left completeness | Holds. |
| §1.8 API, stalk formula on strict `A` | `x ∈ M(A)`, clopen `U ∋ x` | `colim_U` norm `inf_U sup_U |f| = |f(x)|`; `A → K(x)` onto (§0.4), so `colim^ A_U = K(x)`; `Marc(A_U × A_{U^c}) = Marc(A_U) ⊔ Marc(A_{U^c})` (fibre product `Marc(0) = ∅`) | Holds with no boundedness hypothesis. |
| §1.8 API, strict equivalence | `B = Cont(S, C)`, `S` profinite; filtered colimit `B = colim^ B_i` | `ν_* Φ F (U) = RΓ(U, F)` on clopens; `Φ ν_* M (B) = RΓ(M(B), π_B^* ν_* M) = M(B)`; `M(B) = lim M(B_i)` and `Γ` exact on profinite sets, so `Φ F` is finitary | Holds. |
| §1.8 Check, geometric point | `C × C`; `Cont(S, C)` | `M(C) ⊕ M(C)`; `C(S, ℤ) ⊗ M(C)`; `Spa(C, O_C)` in characteristic `p`: one point, `D_ét = D(Λ)` (§§C0.19, C2.2 API) | Holds. |
| §1.8 Check, `Ḡ_m` not étale | `C ⊂ C′`, `C′` from the Gauss point | `T = c u` with `c ∈ C^×`, `u ∈ 1 + C′_{<1}` forces `|c| = 1` and `T̄ = c̄ ∈ k`, contradicting transcendence | Holds. |
| §1.8 Check, `ℤ/ℓ` not effective in characteristic `ℓ` | `C⟨T⟩₁` | `H¹ ∋` Artin–Schreier class of `T` (§4.6 Checks), `H¹(C) = 0` | Holds; consistent with the second clause of §4.8 (`|ℓ| = 0 < 1`). |
| §1.8 Check, `Ḡ_m ⊗^L ℤ/n` | `n` prime to residue characteristic `p`; residue characteristic 0 | `binom(1/n, k) ∈ ℤ[1/n]`, `|n| = 1`; `|ζ − 1| = 1` for `ζ ≠ 1` of order prime to `p`; kernel `μ_n(C)`, cokernel `0`: cofibre `μ_n[1]`; `ℤ(1) ⊗ ℤ/n = μ_n[1][−1] = μ_n` | Holds; agrees with Scholze line 2502 (`ℤ(1)/n ≅ μ_n`). |
| §1.8 Check, complex Banach algebras | `ℂ` with `|·|^α`; nonarchimedean `C` | `(1/2)^α ≤ 1/2` forces `α = 1`; `|1/2|_C ≥ 1 > 1/2` excluded; extension = id or conjugation, an isomorphism in the slice | Holds (the reviewer's wording "isomorphism" is kept, not "identity"). |
| §2.4 restated | `n = 1`; complex point | zero category; contractible disc | Holds. |
| §4.8 first clause | `n` with `|n| ≥ 1` | unchanged content, now `Deff_mot(X, ℤ/n) = Det(X, ℤ/n)` | Holds. |
| §4.8 third clause | `A = ℂ`, `p = 2`; `A = 0`; strict `A = Cont(S, ℂ_ℓ)`, `p ≠ ℓ` | both sides: complexes with `M ⊗ ℤ[1/2] = 0` in `D(ℤ)`; both zero; both `D_{p-tors}(S, ℤ)` via §1.8 | Holds. |
| §4.8 route identity | `fib(ℤ → ℤ[1/p])` | `= (ℤ[1/p]/ℤ)[−1] = colim_m (ℤ/p^m)[−1]` with transition `1 ↦ p` | Holds. |
| Conventions coefficients | `Λ = ℚ`, `ℤ/n` | `Λ(1) = ℤ(1) ⊗ Λ ∈ Deff_mot(X, Λ)` (colimit of shifts of `ℤ(1)`); `ℚmot = ℤmot ⊗ ℚ` | Holds. |
| §12.2 categories on `arcStack′` | two norms on one base; `Y` a colimit of bases | both slices agree with the norm-free slice (API, Scholze p. 63); arc-descent for the limit | Holds (the reviewer asked for nothing beyond these two instances). |
| §12.3 stabilization | `n = 1`; `n` prime to `p` | zero; `μ_n` arc-locally `≅ ℤ/n` (separable `x^n − 1`), invertible, so inverting `ℤ/n(1)` is the identity | Holds. |
| §10.1 universal property | `𝒟 = Dmot(k)`, `F = ℤmot[(−)^arc]`; `𝒟 = D(ℤ)`, `F = 1` constant; `𝒟 = Deff_mot(k)` | factors (§10.6); constant unit: hypercovers and `A¹` hold, `F(∅) = ℤ ≠ 0` and cofibre `0` not invertible, excluded twice; `ℤ(1)[1]` not invertible before stabilization | Holds with the added additivity clause. |
| §10.1 definition, additivity | empty covering of `∅`; covering `{X, Y}` of `X ⊔ Y` | `ℤ[h_∅] ≃ 0`; Čech terms `h_X ⊔ h_∅ ⊔ h_∅ ⊔ h_Y ≃ h_X ⊔ h_Y`, so `M(X ⊔ Y) = M(X) ⊕ M(Y)` | Holds. |
| §8.1 universal property | `𝒟 = Dmot(X)`; `𝒟 = Deff_mot(X)` at a nonarchimedean point; `X = Marc(ℂ)` | factors; `ℤ(1) = Ḡ_m[−1]` not invertible, no factorization of the identity; at `ℂ`, `ℤ(1) = ℤ`, identity factors (`Dmot = Deff_mot`, §8.1 Check) | Holds. |
| §D.5/§D.8 citation | JacobianChallenge main | names at lines 868, 986, 1069–1070, 1291; hypotheses at line 91 | Holds. |

## Ownership

`Det` of a small arc-stack is owned here:
- `roadmaps grep -i` for "geometric Banach point", "change of algebraically closed field" and "arc-stack" finds no match on main or at any open head.
- DiamondEtaleCohomology owns `D_ét` of small v-stacks (§§C2.2, C2.12), and this roadmap cites it there.

No declaration was added to `Suggested.lean`. The overlap report lists no conflicting head and no dropped id.

## For the maintainer

- No roadmap cites this one. The ids it exports are unchanged; the one addition is §1.8.
- In §§12.3–12.4 the étale category of a small v-stack is now written `D_ét(X, ℤ/n)`, matching DiamondEtaleCohomology. `Det` is reserved for arc-stacks.
- One sentence was added beyond the reviewer's text: §12.2 now defines `Dfin`, `Det`, `Deff_mot` and `Dmot` on `arcStack′` (Scholze, p. 63). §12.3 uses these categories for `Y = a′^* X`, which lives in `arcStack′`.
- No text needed a new source request. No `needs-references.toml` was written.
