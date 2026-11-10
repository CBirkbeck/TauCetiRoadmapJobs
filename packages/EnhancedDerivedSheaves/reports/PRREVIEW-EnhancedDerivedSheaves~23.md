# Review of EnhancedDerivedSheaves (pull request #1630 at dc57fee)

**Verdict:** needs changes

This is an incremental re-review of the 2 changed lines since `3bb660b`. Only one README line changed (the E1.6 non-uniqueness Check, `README:880`); `Suggested.lean` is byte-identical to `3bb660b`. The change repairs r22 R03 exactly as requested. r22 R01 is repaired from the other side: EtaleCohomologyFoundations (#1891) no longer builds the predicate. The folder has no defect left. The one remaining finding is about the pull request's description. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` refers to this folder's README at this head.

## R01 (P3) — The description misstates what changes and gives no order against #1330

Carried from r22 R02 (r21 R02). No repair report marks it `not actionable in this package`.

**Location:** the description: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)."

**Claim:** only the README changes, and no order against other pull requests is needed.

**Witness:**
- `git diff --stat origin/main...HEAD` reports `README.md | 1435` and `Suggested.lean | 585`.
- `overlaps.md` lists #1330 (draft, head `856fe7a`, unchanged since r22). It changes both files of this folder and conflicts with this head, and the description names no order between the two.

**Repair:** the folder needs no change. In the description, replace the quoted sentence with: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it. Every dropped name that another roadmap cites is mapped to its pinned Tau Ceti declaration in Scope and ownership." Then add one sentence that fixes the order, for example "#1330 is rebased on this pull request after it merges" or "this pull request supersedes #1330, which is closed".

## Previous findings

- R01 — repaired: #1891 at `ae30823`, §F.5, now reads "Invertibility of an object `T` … `(MonoidalCategory.tensorLeft T).IsEquivalence`; no predicate for it is defined here". `MonoidalCategory.IsInvertible` has one owner, this roadmap's §0.3.
- R02 — not repaired: the description still reads "README only; no Lean change, so no importer is affected" and gives no order against #1330. It is this report's R01.
- R03 — repaired: `README:880` "When the residue field is imperfect and `𝔪 ≠ 0`, the coefficient field need not be unique: … The condition `𝔪 ≠ 0` cannot be dropped: for `R = 𝔽_p(t)` itself … its inverse is the only section." No new problem.

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `dc57fee` and the worktree is clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty. `git diff --stat 3bb660b HEAD` shows one file, `README.md`, 1 insertion and 1 deletion.
- I reran `gate … --base origin/main`. It exited 0 with every counter 0 (`statement-hygiene=0`, `sorry-data=0`, `dropped=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `depcheck=0`) and ended with `OK`. The worker's gate also reports `build=0 OK`.
- The dependency check (`gate --depcheck … --movable`) exited 0 and printed:

```text
depcheck: 236 roadmaps, 2294 edges, 0 problem(s)
```

**Elaboration.**
- `lake env lean …/Suggested.lean` exits 0 with exactly 10 warnings, all "declaration uses `sorry`", at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279. These are the same lines as in r22.
- `Suggested.lean` is unchanged since `e3f468d`, so the r21 checks carry over: the `#check @` signature comparison (the 6 "dropped binder" leads of `signatures.md` are false positives), the one-tactic padding probe (none of the 10 closes) and headline coverage.

**The changed passage (`README:880`).**
- The new opening clause is the wording r22 asked for, and it agrees with the paragraph's own sentence at `README:874` ("need not be unique") and with the Check at `README:879` (a field has `𝔪 = 0`, `e = 0`, and the identity as its presentation).
- The added negative control is correct: `𝔽_p(t)` is a field, so it is complete local with `𝔪 = 0`; its residue field is `𝔽_p(t)`, which is imperfect (t has no p-th root); reduction is the identity, so a section is forced to be its inverse.
- The Check cites no source, no library declaration and no other roadmap, so no locator or citation had to be resolved for it. Nothing else in the README or in `Suggested.lean` refers to this Check.

**Cross-roadmap citations resolved this round (2).**
- `MonoidalCategory.IsInvertible`: `roadmaps grep --fixed` finds the name only in this pull request (`README:592`, `:3068`, `Suggested.lean:175`–`185`). #1891 at `ae30823` (`README:1909`–`1925`) states the hypothesis in Mathlib's vocabulary, defines no predicate, and its *Needs:* line cites "EnhancedDerivedSheaves §0.3 (tensor and internal Hom)". EtaleCohomologyFoundations on main (`f8836c4`) does not mention the predicate either.
- #1330 is still a draft at `856fe7a`, the head r22 read. #1187's conflict needs no stated order (r22: its copy of `Suggested.lean` equals main's).
- `overlaps.md` reports no id dropped by an open pull request, no id that only an open revision defines, and no id this pull request drops.

**Adversarial computations (changed statement).**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| B′ | Non-uniqueness Check (`README:880`) | `𝔽_p(t)⟦T⟧` at p = 2, 3; `𝔽_p(t)`; a perfect residue field `𝔽_p⟦T⟧` | `𝔽_p(t)⟦T⟧`: `𝔪 = (T) ≠ 0`; for nonzero `g ∈ 𝔽_p[t]`, `g(t+T) ≡ g(t) ≢ 0 mod T`, so `g(t+T)` is a unit and `t ↦ t + T` extends to a field map; both maps reduce to the identity mod T; they differ at t by `T ≠ 0`. So there are at least 2 coefficient fields, for every p. `𝔽_p(t)`: `𝔪 = 0`, imperfect, exactly 1 section, excluded by `𝔪 ≠ 0`. `𝔽_p⟦T⟧`: residue field `𝔽_p` is perfect, the hypothesis fails, and the only section is the prime field (1 section), which is consistent with "need not" being claimed only in the imperfect case | Pass |

**Adversarial rows carried from r22** (statements this head leaves unchanged; values in r22's table):

| r22 row | Statement | Values recorded | Result |
| --- | --- | --- | --- |
| A | Recorded Cohen theorem (`README:874`, Checks `:878`, `:879`, `:881`) | `k[ε]/(ε²)`: `spanFinrank (ε) = 1`, kernel `(x²)`; a field: `e = 0`; `ℤ_p`: `p ≠ 0`, no presentation | Pass |
| C | Recorded `isRegularLocalRing_iff` (Checks `:882`, `:883`) | `𝔽_p[t]_(t)`: dimension 1, `𝔪 = (t)` on both sides; cusp: embedding dimension 2 ≠ 1 on both sides | Pass |
| D | *frobeniusFlat_completion* | field: `Â = A`; `𝔽_p[t]_(t)` free on `1, …, t^{p−1}`; `𝔽_p[ε]/(ε²)` excluded | Pass |
| E | Route at `README:885` | `Tor₁^A(A/(t^p), Â)` = `t^p`-torsion of `𝔽_p⟦t⟧` = 0 | Pass |
| F | Route of `isRegular_of_frobenius_flat` (`README:920`) | `e = 1`, bound 2, attained by `𝔽_p⟦t⟧_perf` | Pass |
| G | Mapping row `README:43` | Tau Ceti gives `κ⟦x₁…x_e⟧ ↠ R` with `e = spanFinrank 𝔪` | Pass |
| 1 | `hasKInjectiveResolutions` (`Suggested.lean:101`) | 079P; acyclic K gives `I ≃ 0` | Pass |
| 2 | `locallySmall_localization_quasiIso` (`:121`) | Mathlib gives only `LocallySmall.{max u' v}`; the claim needs `Type u` | Pass |
| 3 | §0.1 instance Check | `Ext¹(ℤ/p, ℤ) = ℤ/p` in `Type u`; `Ext⁻¹ = 0` | Pass |
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

**Seeded sample (§§0.1–0.4).** The diff does not touch these sections. r21 verified the sample against the cache (Stacks 079P line 883, HA lines 4739/4743/4874/18583/46530/46277, Stacks 06YS line 1342, 08TB line 5254, More on Algebra 07KW–0923), and those passages are unchanged.

**Remark on untouched text** (no change requested): `README:3068` names EtaleCohomologyFoundations §F.5 as the consumer of `MonoidalCategory.IsInvertible`. At #1891's head that section consumes §0.3's tensor and internal Hom and states invertibility as `(MonoidalCategory.tensorLeft T).IsEquivalence`, which is the body of this roadmap's predicate. Ownership stays single either way.

## Not verifiable

- HTT, Liu–Zheng, Nikolaus–Scholze, Mathew, ECD, SAG, Fargues–Scholze, Ramzi, Efimov and Robalo are cited only outside the changed passage and are not in the source cache. They were not re-read this round.
- Ownership against open pull requests was checked only with `roadmaps grep` over the heads indexed on 2026-11-09.

## Source issues

- none
