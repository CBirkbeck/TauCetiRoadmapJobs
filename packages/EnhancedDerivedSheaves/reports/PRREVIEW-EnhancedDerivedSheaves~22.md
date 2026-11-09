# Review of EnhancedDerivedSheaves (pull request #1630 at 3bb660b)

**Verdict:** needs changes

This is an incremental re-review of the 28 changed lines since `e3f468d`. Only the README changed; `Suggested.lean` is byte-identical to `e3f468d`. The change answers r21 R03. E1.6 now records the Cohen structure theorem and the regularity of completions from the pinned Tau Ceti. It keeps *frobeniusFlat_completion* as the paragraph's one target and gives that target a proof route. It also maps the name `completeNoetherianLocal_cohenPresentation`, which DeformationAndDerivedPatchingAlgebra cites. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` refers to this folder's README at this head.

The two description findings of r21 are still open. The new text has one defect: a Check that overstates a claim.

## R01 (P2) — Two open pull requests both claim to own `MonoidalCategory.IsInvertible`

Carried from r21 R01 (r20 R01 and earlier). No repair report marks it `not actionable in this package`.

**Location:** `README:3068`: "Section 0.3 is the single owner of invertible objects of a monoidal category, `MonoidalCategory.IsInvertible`". The definition is at `README:592` and `Suggested.lean:178`.

**Claim:** §0.3 is the only owner of the predicate, and EtaleCohomologyFoundations consumes it.

**Witness:** #1891 (EtaleCohomologyFoundations, head `6217eb9`, unchanged since r21), `README:1879`–`1880`: "(the predicate MonoidalCategory.IsInvertible, built here)". `roadmaps grep --fixed 'MonoidalCategory.IsInvertible'` finds the name only in #1630 and #1891. This pull request's description does not mention #1891.

**Repair:** the folder needs no change. Add to the description: "#1891 merges after this pull request. Before it merges, #1891 `README:1879`–`1880` replaces 'built here' with 'EnhancedDerivedSheaves §0.3', and its *Needs:* line adds `MonoidalCategory.IsInvertible`." After that edit the predicate has one owner and one citation.

## R02 (P3) — The description misstates what changes and gives no order against #1330

Carried from r21 R02. No repair report marks it `not actionable in this package`.

**Location:** the description: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."

**Claim:** only the README changes, and no order against other pull requests is needed.

**Witness:**
- `git diff --stat origin/main...HEAD` reports `README.md | 1435` and `Suggested.lean | 585`.
- `overlaps.md` lists #1330 (draft, `856fe7a`). It changes both files of this folder and conflicts with this head. Its *Needs:* line at `README:814` still cites `completeNoetherianLocal_cohenPresentation` and `regularity_of_completion` as targets of this roadmap, and this head records both from Tau Ceti.
- #1187's copy of `Suggested.lean` equals main's (I diffed them), so #1187 needs no stated order.

**Repair:** in the description, replace the quoted sentence with: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it. Every dropped name that another roadmap cites is mapped to its pinned Tau Ceti declaration in Scope and ownership." Then add one sentence that fixes the order, for example "#1330 is rebased on this pull request after it merges" or "this pull request supersedes #1330, which is closed".

## R03 (P3) — A new Check claims coefficient fields are never unique when the residue field is imperfect

This finding is new; it is not r21 R03.

**Location:** `README:880`: "The coefficient field is not unique when the residue field is imperfect: in `𝔽_p(t)⟦T⟧` the homomorphisms … sending t to t and to `t + T` are both sections of reduction".

**Claim:** whenever the residue field is imperfect, the complete local ring has more than one coefficient field.

**Witness:** take R = `𝔽_p(t)` itself. It is complete local with 𝔪 = 0 and an imperfect residue field, which is the case `e = 0` of the Check at `README:879`. Reduction `R → κ` is an isomorphism, so its only section is its inverse, and the coefficient field is unique.

**Repair:** replace the opening clause with "When the residue field is imperfect and 𝔪 ≠ 0, the coefficient field need not be unique:" and keep the example. Tested:
- R = `𝔽_p(t)` is now excluded by 𝔪 ≠ 0.
- In `𝔽_p(t)⟦T⟧`, a nonzero `g ∈ 𝔽_p[t]` has `g(t+T) ≡ g(t) ≢ 0 mod T`, so `g(t+T)` is a unit. Hence `t ↦ t + T` extends to a second section, and it differs from the first at t.

The wording "need not be unique" also matches the paragraph's own sentence at `README:874`.

## Previous findings

- R01 — not repaired: #1891 `README:1879`–`1880` at `6217eb9` still reads "the predicate MonoidalCategory.IsInvertible, built here", and the description of #1630 does not mention #1891.
- R02 — not repaired: the description still reads "README only; no Lean change, so no importer is affected" and gives no order against #1330.
- R03 — repaired: `README:874` "(`TauCeti.exists_surjective_mvPowerSeries_spanFinrank`, `TauCeti.AdicCompletion.isRegularLocalRing_iff`, *frobeniusFlat_completion*). The first two are Tau Ceti theorems, used unchanged." Both are recorded at `README:20` and `:176`, and cited at `:897` and `:922`. The repair added one Check that overclaims (this report's R03).

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `3bb660b` and the worktree is clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- I reran `gate … --base origin/main`. It exited 0 with every counter 0 (`statement-hygiene=0`, `sorry-data=0`, `dropped=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`) and ended with `OK`. The worker's gate also reports `build=0 OK`.
- The dependency check (`gate --depcheck … --movable`) exited 0 and printed:

```text
depcheck: 236 roadmaps, 2294 edges, 0 problem(s)
```

- The new supplier citation, PerfectoidSpaces P7.16a (`powerSeries_regular_field`), is on main at its `README:17397` and `:17433`. Regularity of power series rings appears at neither pin: Mathlib has only `MvPolynomial.isRegularRing_of_isRegularRing`. So the citation is needed, and it points to a roadmap on main.

**Elaboration.**
- `lake env lean …/Suggested.lean` exits 0 with exactly 10 warnings, all "declaration uses `sorry`", at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279. These are the same lines as in r21.
- `Suggested.lean` is unchanged since `e3f468d`, so the following r21 checks carry over: the `#check @` signature comparison (the 6 "dropped binder" leads of `signatures.md` are false positives), the one-tactic padding probe (none of the 10 closes) and headline coverage.

**Library declarations opened at the pins for the changed text.**
- Tau Ceti `2fd255d9`:
  - `TauCeti.exists_surjective_mvPowerSeries_spanFinrank` (`TauCeti/RingTheory/LocalRing/CoefficientField.lean:164`):
    - hypotheses: `[Field k] [IsLocalRing R] [Algebra k R] [IsAdicComplete (maximalIdeal R) R]` and `(maximalIdeal R).FG`;
    - conclusion: a section `s` of `residue R`, and a surjective `φ : MvPowerSeries (Fin (maximalIdeal R).spanFinrank) (ResidueField R) →+* R` with `φ.comp C = s` and `span (range (φ ∘ X)) = maximalIdeal R`;
    - `README:874` and `README:176` restate exactly these hypotheses and this conclusion.
  - `TauCeti.AdicCompletion.isRegularLocalRing_iff` (`TauCeti/RingTheory/AdicCompletion/LocalRing.lean:58`, `@[stacks 07NY]`) assumes only `[IsLocalRing R] [IsNoetherianRing R]`, as `README:874` and `:176` say.
  - `Ideal.isNoetherianRing_adicCompletion` (`TauCeti/RingTheory/AdicCompletion/Noetherian.lean:213`) is an instance, as the *Needs:* at `README:887` cites it.
  - `TauCeti.isRegularRing_of_isRegularLocalRing` (`TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean:441`) is an instance. It turns P7.16a's regular local ring `κ⟦x₁, …, x_e⟧` into the `[IsRegularRing P₀]` that `perfect_projectiveDimension_le` (`Suggested.lean:207`) takes, so the route at `README:920` connects as written.
  - The pin's flatness criteria `Module.Flat.of_flat_quotSMulTop` and `Module.Flat.of_isWeaklyRegular_map_algebraMap` (`TauCeti/RingTheory/Flat/LocalCriterion.lean:222`, `:355`) cover only a principal ideal and a regular sequence. That file says it avoids the general criterion (Stacks 00MK).
    - So "the local criterion of flatness in its Tor₁ form, which is part of this target" (`README:887`) duplicates nothing at the pins.
    - `roadmaps grep '00MK|local criterion (of|for) flatness'` finds no roadmap that owns it; PerfectoidSpaces `README:17450` on main only cites 00MK.
- Mathlib `1b1ccf4b`:
  - `AdicCompletion.flat_of_isNoetherian` (`RingTheory/AdicCompletion/AsTensorProduct.lean:378`).
  - The `IsLocalRing` instance on `AdicCompletion (maximalIdeal R) R` (`RingTheory/AdicCompletion/LocalRing.lean:85`).
  - The `IsAdicComplete (maximalIdeal Â) Â` instance (`:127`). This instance is what lets the Cohen theorem apply to Â in the route at `README:920`.
  - `ZMod.algebra (p) [CharP R p]` (`Algebra/Algebra/ZMod.lean:47`), as `README:874` uses it.
  - `IsRegularRing` requires `IsRegularLocalRing (Localization.AtPrime p)` at every prime (`RingTheory/RegularLocalRing/Defs.lean:93`), as the route at `README:920` states.

**Locators in the changed text.**

| Locator | Where | Supports |
| --- | --- | --- |
| Stacks, More on Algebra, Lemma 15.44.4, tag 07NY, p. 111 | StacksMoreOnAlgebra line 5229, page marker 111 | A Noetherian local A is regular if and only if its completion is |
| Stacks, Commutative Algebra, Theorem 10.160.8, tag 032A | fetched through the sources service without a manifest; line 20606, p. 438 | A complete local ring has a coefficient ring; if 𝔪 is finitely generated, the ring is a quotient of `Λ[[x₁,…,xₙ]]` with Λ a field or a Cohen ring |
| BS17, proof of Corollary 11.35, p. 50 | BS17 lines 2304–2306 | Kunz's converse is checked after completion, and flatness of Frobenius passes to completions |
| BS17 Remark 11.3 (not cited by the README; read as context) | line 1876 | Complete Noetherian local rings are quotients of regular rings by the Cohen theorem, which is the reduction the new route at `README:920` makes |

**The proof route at `README:885`, step by step.**
1. The local criterion applies to Frobenius `Â → Â`: it is a local homomorphism of Noetherian local rings, and the module is the target ring, which is finite over itself.
2. Let `L•` be a finite free resolution of κ over A. Since Â is flat over A and `κ ⊗_A Â = κ`, `L• ⊗_A Â` resolves κ over Â. Hence `Tor₁^Â(κ, F_*Â) = Tor₁^A(κ, F_*Â)`, where A acts through `A → Â → Â`, that is, through `a ↦ a^p`.
3. Since Frobenius of A is flat, `L• ⊗_{A,F} A` resolves `κ ⊗_{A,F} A = A/𝔪^[p]`. This gives `Tor₁^A(A/𝔪^[p], Â)`, which is 0 because Â is flat over A.
4. The route does not use `isRegular_of_frobenius_flat`, so the two targets form no cycle.

**Cited names and overlaps.**
- `completeNoetherianLocal_cohenPresentation` is cited by DeformationAndDerivedPatchingAlgebra (#1034 `README:82`, `:845`) for "the coefficient-field surjection `k[[x_1,…,x_e]]→R` onto a complete Noetherian local ring of characteristic `p`". The new row at `README:43` maps it to the Tau Ceti theorem, which states that surjection.
- `regularity_of_completion` is cited only in this roadmap's own copies, on main and in #1330, so it needs no row.
- `overlaps.md` reports no dropped id.
- The E1.6 opening (`README:818`) says "the first five paragraphs" record library results. They are `README:820`, `829`, `838`, `846` and `854`, as stated.

**Adversarial computations (changed statements).**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | Recorded Cohen theorem (`README:874`, Checks `:878`, `:879`, `:881`) | `k[ε]/(ε²)`; a field k; `ℤ_p`; any complete Noetherian local ring of characteristic p | `spanFinrank (ε) = 1`, `x ↦ ε`, kernel `(x²)`. A field: `spanFinrank ⊥ = 0` and `κ⟦Fin 0⟧ = κ`. `ℤ_p`: residue field 𝔽_p; every quotient of `𝔽_p⟦x⟧` has `p = 0`, but `p ≠ 0` in `ℤ_p`, and `ℤ_p` contains no field since `1/p ∉ ℤ_p`. Characteristic p: `ZMod.algebra` gives the field, and Noetherian gives `𝔪.FG` | Pass |
| B | Non-uniqueness Check (`README:880`) | `𝔽_p(t)⟦T⟧`; `𝔽_p(t)` | `g(t+T) ≡ g(t) ≠ 0 mod T`, so it is a unit, and the two sections differ at t. For R = `𝔽_p(t)`, reduction is an isomorphism, so there is one section | R03 |
| C | Recorded `isRegularLocalRing_iff` (Checks `:882`, `:883`) | `𝔽_p[t]_(t)`; the cusp at p = 2, 3, 5 | `𝔽_p[t]_(t)`: dimension 1 and `𝔪 = (t)` on both sides, so both are regular. Cusp: `dim 𝔽_p⟦x,y⟧/(y² − x³) = 1`, and `y² − x³ ∈ 𝔪²` gives embedding dimension 2 ≠ 1 for every p, so both are non-regular | Pass |
| D | *frobeniusFlat_completion* (`README:874`) | A a field; `𝔽_p[t]_(t)`; `𝔽_p[ε]/(ε²)` | A field: `Â = A`, and every field map is flat. For `S = {h ∈ 𝔽_p[t^p] : h(0) ≠ 0}`, `g(0) ≠ 0` gives `g^p ∈ S`, so `S⁻¹𝔽_p[t] = 𝔽_p[t]_(t)` is free on `1, …, t^{p−1}` over its Frobenius image; the same holds over `𝔽_p⟦t^p⟧`. `ε ↦ 0`: Frobenius is not flat, so the hypothesis is excluded (and `Â = A`) | Pass |
| E | Route (`README:885`) | `A = 𝔽_p[t]_(t)` | `𝔪^[p] = (t^p)`, and `Tor₁^A(A/(t^p), Â)` is the `t^p`-torsion of `𝔽_p⟦t⟧`, which is 0 | Pass |
| F | Route of `isRegular_of_frobenius_flat` (`README:920`) | `𝔽_p⟦t⟧`; the cusp; localization | `e = 1`, so the bound is `e + 1 = 2`. The true global dimension of the valuation ring `𝔽_p⟦t⟧_perf` is also 2: its maximal ideal `(t^{1/p^∞})` is countably generated and not finitely generated, so `pd(R/𝔪) = 2`, and the bound is attained. Cusp: not regular, so by Kunz its Frobenius is not flat and the hypothesis is excluded. Localization: inverting `s^p` inverts s, so `F_*(R_𝔭) = (F_*R)_𝔭` | Pass |
| G | Mapping row `README:43` | #1034 `README:845` (F-finiteness) | #1034 needs `κ⟦x₁…x_e⟧ ↠ R` for R complete Noetherian local of characteristic p. Tau Ceti gives it with `κ = ResidueField R` and `e = spanFinrank 𝔪` | Pass |

**Adversarial rows carried from r21** (statements this head leaves unchanged; values in r21's table, rows 1–18):

| r21 row | Statement | Values recorded in r21 | Result |
| --- | --- | --- | --- |
| 1 | `hasKInjectiveResolutions` (`Suggested.lean:101`) | 079P: termwise mono into a K-injective; Prop-valued Tau Ceti `ModuleCat` instance, so no diamond; acyclic K gives `I ≃ 0` | Pass |
| 2 | `locallySmall_localization_quasiIso` (`:121`) | Mathlib gives only `LocallySmall.{max u' v}`; the claim needs `Type u` | Pass |
| 3 | §0.1 instance Check | `Ext¹(ℤ/p, ℤ) = ℤ/p` lands in `Type u`, not `Type (u+1)`; `Ext⁻¹ = 0` | Pass |
| 4 | `smallEtaleTopology_W_isMonoidal` (`:148`) | `Spec k ⊔ Spec k`: presheaf tensor `Λ⁴`, sheaf tensor `Λ²` | Pass |
| 5 | Koszul Check | unsigned `dτ(e₀₁) = −e₁₁ ≠ τd(e₀₁) = e₁₁`; Koszul signs agree | Pass |
| 6 | `P((ℤ/2)_X)` over `ℤ/4` | `Tor_i = ℤ/2` for all i ≥ 0 | Pass |
| 7 | §0.1 cone Checks | `cone(0)`: `H⁻¹ = H⁰ = A`; `cone(id)` acyclic | Pass |
| 8 | §0.3 tower Check | `lim¹ = ℤ_ℓ/ℤ`; `Rlim K = [ℤ → ℤ_ℓ]` | Pass |
| 9 | `isInvertible_iff_isUnit_toSkeleton` (`:184`) | `𝟙` both true; `ℤ/2` both false; `ε(Λ_X[1]) = −1` | Pass |
| 10 | `isRegular_of_frobenius_flat` (`:196`) | `𝔽_p[t]` regular, flat; `𝔽_p[ε]/(ε²)` neither; zero ring excluded | Pass |
| 11 | `perfect_projectiveDimension_le` (`:207`) | bounds 1 and 2 against true value 0 | Pass |
| 12 | `perfect_torDimension_le_two_mul_dim` (`:219`) | `Tor₂(R/(x), R/(y)) ≅ k ≠ 0`, `Tor₃ = 0` | Pass |
| 13 | `isDerivedComplete_iff_derivedCompleteness` (`:248`) | f = 0, f a unit, ℤ with (p), `ℤ[x₁,…]`: sides agree | Pass |
| 14 | `isAdicComplete_iff_derivedComplete_separated` (`:262`) | `I = ⊤`, `I = 0`, ℤ with (p), `coker ψ`: sides agree | Pass |
| 15 | `derivedCompleteModules_weakSerre` (`:279`) | `ℤ ⊂ ℤ₂` not complete; `ℤ_p/ℤ` not complete | Pass |
| 16 | E4.1 Check | `T = ℤ[1/p][−1] ≠ 0`; mapping spaces vanish | Pass |
| 17 | E2.5 Check | `C_p` invariants `ℤ·N ↦ p` | Pass |
| 18 | E1.8 Check | `⊕_ℕ ℤ[0]` quasicoherent, not perfect | Pass |

r21 row 19 (the E1.6 Cohen and completion targets) is replaced by rows A–G above. r21 row 20 is R01.

**Seeded sample (§§0.1–0.4).** The diff does not touch these sections. r21 verified the sample against the cache (Stacks 079P line 883, HA lines 4739/4743/4874/18583/46530/46277, Stacks 06YS line 1342, 08TB line 5254, More on Algebra 07KW–0923), and those passages are unchanged.

No remark on untouched text.

## Not verifiable

- HTT, Liu–Zheng, Nikolaus–Scholze, Mathew, ECD, SAG, Fargues–Scholze, Ramzi, Efimov and Robalo are cited only outside the changed passages and are not in the source cache. They were not re-read this round.
- Ownership against open pull requests was checked only with `roadmaps grep` over the heads indexed on 2026-11-09.

## Source issues

- none
