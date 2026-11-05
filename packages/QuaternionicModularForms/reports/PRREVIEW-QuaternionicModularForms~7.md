# Review of QuaternionicModularForms (pull request #934 at 69e6e45)

**Verdict:** accepted

Incremental re-review of the 19 lines changed since 4798494. The change is confined to the module docstring of `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` (lines 14–26): the clause that called the formal substitutions the only substitution at the pins is replaced by a description of both mechanisms Mathlib offers, the formal `subst` under `HasSubst` and the topological `aeval` under `HasEval`, each with its hypotheses, and of why neither gives the analytic weight action on the Tate algebra. Every name the new text cites exists at the pinned Mathlib with the hypotheses the text gives it, the two mathematical obstructions it states (constant term `b/d` not nilpotent unless `b = 0`; Gauss norm `1`, so not topologically nilpotent; no proper open ideal in the Tate algebra over a nontrivially valued field, so not linearly topologised) compute as stated, and they are consistent with the README's definition of `Σ₀(t)` (§0.4: `d` a unit, `c ∈ π^t𝒪_L`, `t ≥ 1`). The README is unchanged since the previous head. The gate passes every check, the file elaborates with no output, the dependency check reports no problem, and nothing outside the folder changed. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean:14`–`24` now names both the formal `PowerSeries.subst`/`MvPowerSeries.subst` under `HasSubst` and the topological `PowerSeries.aeval`/`MvPowerSeries.aeval` under `HasEval`, with their hypotheses, and gives for each why the Möbius image fails it; "only substitution" is gone.

## Verified sound

**Gate and build.** The worker's gate at this head passes every check (`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 … imports=0 mathlib-subimports=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`). I elaborated `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` with `lake env lean` from the pull-request worktree: exit code 0, no output (no warning, no `sorry`, since the file declares nothing). The file has the single `import Mathlib`, one module docstring, an empty namespace `TauCetiRoadmap.QuaternionicModularForms`, no `set_option`, no `lemma`, no stand-in, no sorry'd data. The pins of `lake-manifest.json` are Tau Ceti `a91d3aa` and Mathlib `6b7abb3c`, and the checkouts under `.lake/packages` are at those revisions. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. `git diff --stat 4798494 HEAD` on the folder touches only `Suggested.lean` (13 insertions, 6 deletions): the README is byte-identical to the head the previous review read. The thirteen added lines carry no process word, no LaTeX delimiter, no pull-request number, no machine path and no instruction-like text.

**Dependency check**, run with `--movable` against the merge order and main:

```text
depcheck: 223 roadmaps, 2099 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The diff touches no `*Needs:*` line and no supplier citation; no supplier gap is declared and none is needed.

**Library declarations opened at the pin** (every name the changed lines cite, plus the ones the witnesses use).

| Name in the docstring | Where it is at the pin | What it says, and whether the docstring's parenthetical matches |
| --- | --- | --- |
| `PowerSeries.HasSubst` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:39` | `abbrev`: the constant coefficient of the substituted series is nilpotent. Matches "a nilpotent constant coefficient". |
| `MvPowerSeries.HasSubst` | `Mathlib/RingTheory/MvPowerSeries/Substitution.lean:77` | structure with `const_coeff` (each `a s` has nilpotent constant coefficient) and `coeff_zero` (for each exponent `d`, only finitely many `s` with `(a s).coeff d ≠ 0`). Matches "in several variables, only finitely many substituted series with a nonzero coefficient at each exponent". |
| `PowerSeries.subst`, `MvPowerSeries.subst` | `PowerSeries/Substitution.lean:157`, `MvPowerSeries/Substitution.lean:189` | the formal substitutions, as in the previous review. |
| `PowerSeries.HasEval` | `Mathlib/RingTheory/PowerSeries/Evaluation.lean:60` | `abbrev HasEval (a : S) := IsTopologicallyNilpotent a`. Matches "a topologically nilpotent point". |
| `MvPowerSeries.HasEval` | `Mathlib/RingTheory/MvPowerSeries/Evaluation.lean:63` | structure: `hpow` (each `a s` topologically nilpotent) and `tendsto_zero` (`a` tends to `0` along the cofinite filter). The docstring's "a topologically nilpotent point" omits the cofinite clause, which is automatic for the finite index sets (finitely many places and embeddings) this roadmap uses; not a defect. |
| `PowerSeries.aeval` | `PowerSeries/Evaluation.lean:210`, under the `variable`s of lines 125, 152–154, 206: `[UniformSpace S] [IsUniformAddGroup S] [T2Space S] [CompleteSpace S] [IsTopologicalRing S] [IsLinearTopology S S] [Algebra R S] [ContinuousSMul R S]`, argument `(ha : HasEval a)` | matches "a topologically nilpotent point of a complete Hausdorff linearly topologised ring". Defined through `MvPowerSeries.aeval (hasEval ha)`. |
| `MvPowerSeries.aeval` | `MvPowerSeries/Evaluation.lean:301`, under lines 130, 218–220, 298: `[CompleteSpace S] [T2Space S] [IsTopologicalRing S] [IsLinearTopology S S]`, argument `(ha : HasEval a)` | matches the same parenthetical. |
| `IsLinearTopology` | `Mathlib/Topology/Algebra/LinearTopology.lean:100`, `hasBasis_submodule` at `:105` | `𝓝 0` has a basis of submodules (ideals, for `IsLinearTopology S S`). Used for the "no proper open ideal, so not linearly topologised" step: the only open ideal of the Tate algebra over a nontrivially valued field is the whole ring, which is a basis of `𝓝 0` only for the indiscrete topology, excluded since the Tate algebra is a normed ring with `‖X‖ = 1 ≠ 0`. A grep of every `.lean` file of Tau Ceti finds no `IsLinearTopology` instance, so no Tate algebra carries one at the pin. |
| `PowerSeries.IsRestricted.subring 1`, `MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` | `Mathlib/RingTheory/PowerSeries/Restricted.lean:87`, `Mathlib/RingTheory/MvPowerSeries/Restricted.lean:107` | the Tate algebra carriers, as in the previous review. |
| complete normed ring on the univariate Tate algebra | `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:68` (`NormedRing`, under `[NormedRing R] [IsUltrametricDist R] [Fact (0 < c)]`), `:76` (`norm_eq_gaussNorm`), `:105` (`norm_X`, needs `[NormOneClass R]`), `:124` (`IsUltrametricDist`), `:128` (`NormOneClass`), `:133` (`NormMulClass`, needs `[NormMulClass R]`), `:138` (`CompleteSpace`, needs `[CompleteSpace R]`), `:149` (`NormedCommRing`) | `ℚ_p` and `ℤ_p` satisfy every one of those hypotheses; the Gauss-norm witness below uses `NormMulClass` and `norm_X`. |

**Citations resolved at this head.** The docstring's section references (`§3.3`, `§5.2`, `§§4.1–4.2`, `§4.4`, `§5.3`, `§2.4`, `§2.5`, `§2.6`) are outside the diff and were resolved at the previous head to README headings; the README is unchanged. The changed lines cite no roadmap section and no source. The resolver's one lead, `LocallySymmetric.AutomorphicForm` at README line 180, is the planned name of ArithmeticLocallySymmetricSpaces ALS.F.6, unchanged since earlier rounds; not a defect. The docstring's "level group" is the level's local component `U₀(π^t)` of README §0.4 (line 346–349: invertible integral matrices of `Σ₀(t)`), whose elements have `a` and `d` units and `c ∈ π^t𝒪_L` with `t ≥ 1`, which is exactly what the Gauss-norm witness uses.

**Seeded sample.** None of the sampled targets (0.4, 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 2.4, 2.5, 3.1, 3.2, 4.1, 4.3, 4.4, 5.2) changed at this head: the README diff since 4798494 is empty. Their locators and statements stand as verified in the reviews at 84012cc, 67bcbf6, 1261875 and cd50077. No source locator is in the change set, so neither `williams` nor `buzzard-eigen` was reopened this round.

**Headline coverage.** Unchanged: no headline is statable at the pins and the docstring names each with its missing carrier; the file declares nothing, so there is nothing to probe for padding and no signature to compare with the README (the worker's `signatures.md` records no named declaration, and I confirm it).

**Ownership.** The change adds no construction; ownership against open pull requests was not re-checked for it.

**Computed adversarial pass.** New rows for the changed statement; the rest carry forward from the review at 4798494 and, through it, cd50077, 1261875, 67bcbf6 and 84012cc.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Docstring: `HasSubst` hypotheses as stated | `PowerSeries.HasSubst` on `a = X + 1` and on `a = X`; `MvPowerSeries.HasSubst` on `σ = Fin 2`, `a = (X₀ + 1, X₁)` | constant coefficients `1` (not nilpotent in a domain) and `0` (nilpotent): first fails, second holds; multivariate: `coeff_zero` holds trivially for finite `σ`, `const_coeff` fails at `s = 0`; both fields present at `MvPowerSeries/Substitution.lean:77`–`79` | Pass |
| Docstring: `HasEval` hypotheses as stated | `PowerSeries.HasEval` is `IsTopologicallyNilpotent` (`:60`); `MvPowerSeries.HasEval` has `hpow` and `tendsto_zero` (`:63`–`65`) | for finite `σ`, `Tendsto a cofinite (𝓝 0)` holds for every `a` (cofinite filter on a finite type is `⊥`), so the multivariate condition reduces to each entry topologically nilpotent, as the parenthetical says | Pass (parenthetical exact for the finite index sets used) |
| Docstring: `aeval` needs a complete Hausdorff linearly topologised ring | `variable` blocks `PowerSeries/Evaluation.lean:152`–`154`, `MvPowerSeries/Evaluation.lean:218`–`220` | `[CompleteSpace S] [T2Space S] [IsTopologicalRing S] [IsLinearTopology S S]` all in scope of both `aeval`s | Pass |
| Docstring: constant term of `(az+b)/(cz+d)` is `b/d`, nilpotent only when `b = 0` | `γ = (1 1; p 1)` and `γ = (1 0; p 1)` in `Σ₀(1)` over `ℚ_p` | `(cz+d)⁻¹ = d⁻¹ Σ (−cz/d)^k` has constant term `d⁻¹`; product with `az+b` has constant term `b/d`: `1` for the first (not nilpotent in the domain `ℚ_p⟨z⟩`), `0` for the second (nilpotent); so `HasSubst` holds exactly on the `b = 0` matrices and the formal substitution cannot define the action on `Σ₀(t)` | Pass |
| Docstring: Gauss norm `1`, so not topologically nilpotent | `w = (z+1)/(pz+1)` over `ℚ_p`, `c = 1` | `‖z+1‖ = max(1,1) = 1`; `‖(pz+1)⁻¹‖ = sup_k |p|^k = 1`; `NormMulClass` (`TateAlgebra.lean:133`) gives `‖w‖ = 1` and `‖w^n‖ = 1` for all `n`, so `w^n ↛ 0` and `HasEval w` fails. Negative control: `w' = pz` (from `γ = (p 0; 0 1) ∈ Σ₀(1)`, `a` not a unit): `‖(pz)^n‖ = p^{−n} → 0`, so `HasEval` holds; this is why the docstring restricts to `a`, `d` units, and why it adds the second obstruction, which covers `w'` too | Pass |
| Docstring: `c ∈ π^t𝒪_L`, `t ≥ 1` is needed for the inverse to lie in the Tate algebra | `γ = (1 0; 1 1)` (README §0.4 Check, `c = 1`, not in `Σ₀(1)`) | `(z+1)⁻¹ = Σ (−z)^k` has coefficients of norm `1` not tending to `0`: not restricted, so `w_γ ∉ ℚ_p⟨z⟩`; consistent with the README's exclusion of this matrix | Pass |
| Docstring: no proper open ideal in the Tate algebra over a nontrivially valued field | `K = ℚ_p`; general `K` with `|a| < 1` for some `a ≠ 0` | an open ideal `I` contains a ball `{‖f‖ ≤ p^{−N}}`, hence the scalar `p^N`, a unit, so `I = K⟨z⟩`; for general `K`, `a^N ∈ I` for `N` large; over `ℤ_p` instead, `pℤ_p⟨z⟩ = {‖f‖ ≤ 1/p}` is a proper open ideal, so the claim is correctly restricted to fields | Pass |
| Docstring: hence not linearly topologised | `IsLinearTopology S S` at `LinearTopology.lean:100`, basis of ideals at `:105` | the only open ideal is `S`; `{S}` is a basis of `𝓝 0` iff `𝓝 0 = 𝓟 S`, false since the ball `{‖f‖ < 1}` is a neighbourhood of `0` not containing `1` (`NormOneClass`, `:128`) | Pass |
| Docstring: Tate-algebra carriers are complete normed rings at the pin | `c = 1`, `R = ℚ_p` | `Fact (0 < 1)` discharges the radius hypothesis; `NormedRing`, `CompleteSpace` instances at `TateAlgebra.lean:68`, `:138` need `[NormedRing R] [IsUltrametricDist R]`, `[CompleteSpace R]`, which `ℚ_p` has | Pass (4798494) |
| Carried: §2.6 `det Ω₁(𝔫) = Ô_Fˣ ∩ (1 + 𝔫Ô_F)`; ray-class component count; `F = ℚ(i)`, `𝔫 = 3`: two components; `U₁(𝔫)` count `h` | as in cd50077 | `(𝒪_F/3)ˣ` of order 8, image of `𝒪_Fˣ` of order 4, quotient 2; `ℚ(√−5)`, `𝔫 = 3`: `#Cl_𝔫 = 4 ≠ h = 2` | Pass (cd50077) |
| Carried: §2.6 Check existence of `u ≢ 1 mod 𝔫`; surjectivity `Ô_Fˣ → (𝒪_F/𝔫)ˣ`; negative control `ℚ(√−7)`, `𝔫 = 2`; `Ω₁(𝔫)` as a kernel; Williams growth locator | as in 1261875 | as in 1261875 | Pass (1261875) |
| Carried: §2.4 Checks, §2.6 purity, `λ` Checks, Williams twist (`1/2` vs `1/4`), Hecke factor `q_v^{k/4}`, cuspidal degrees `(1,1)`, §3.1 Hecke relation | as in 67bcbf6 | as in 67bcbf6 | Pass (67bcbf6) |
| Carried: §0.1–0.4, §1.1–1.3, §2.1–2.3, §2.5, §3.2–3.3, §4.1–4.4, §5.1–5.3 | as in 84012cc | as in 84012cc | Pass (84012cc) |

## Not verifiable

- **Gross, *Algebraic modular forms* (1999)** and **Harder (1987), §3**: paywalled, uncertified, untouched by the diff.
- **Published numbering of Williams (2017):** the arXiv text in the cache was read in earlier rounds; untouched by the diff.
- **Ownership against open pull requests** beyond those whose files this brief gives: not re-checked for this change, which adds no construction.

## Source issues

- none
