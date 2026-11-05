# Review of QuaternionicModularForms (pull request #934 at 4798494)

**Verdict:** needs changes

Incremental re-review of the 13 lines changed since cd50077. The change is confined to the module docstring of `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` (lines 14–19): the clause naming `MvPowerSeries.restrictedSubst` and a `TateAlgebra/Subst.lean` file, which do not exist at the pin, is deleted, and in its place the docstring describes what substitution the pins do offer. The deletion repairs the previous finding. The replacement sentence is accurate about the two formal substitutions it names and about their hypothesis, but it says they are the *only* substitution at the pins, and that is not what the pinned Mathlib contains: it also has the topological evaluations of power series at topologically nilpotent points. The docstring's conclusion (no analytic weight action, nothing statable) survives, with one more step that the finding below supplies. The gate passes on every check, the file elaborates with no output, the dependency check reports no problem, and nothing outside the folder changed.

## R01 (P3) — The docstring's "only substitution at the pins" omits Mathlib's topological evaluation

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:14`–`17`: “but the only substitution at the pins is Mathlib's formal `PowerSeries.subst` and `MvPowerSeries.subst`, defined under `PowerSeries.HasSubst` and `MvPowerSeries.HasSubst` (a nilpotent constant coefficient), so neither a Möbius transformation … nor any analytic substitution into the Tate algebra … is available.”

**Claim:** the formal substitutions are the only substitution of a power series available at the pinned Mathlib and Tau Ceti, and the absence of an analytic substitution follows from that alone.

**Witness:** at the pinned Mathlib (`6b7abb3c`) `Mathlib/RingTheory/PowerSeries/Evaluation.lean:131` defines `PowerSeries.eval₂` and `:210` `PowerSeries.aeval`, and `Mathlib/RingTheory/MvPowerSeries/Evaluation.lean:198` and `:301` their multivariate forms: evaluation of a power series in a complete Hausdorff linearly topologised ring `S` at a point with `HasEval` (`MvPowerSeries/Evaluation.lean:63`: each entry topologically nilpotent, the family tending to `0`). That is a substitution into a topological ring, not a formal one, and `HasSubst`'s nilpotency is not among its hypotheses. The docstring's conclusion still holds, for a reason the sentence does not give: a Möbius image `(a z + b)/(c z + d)` with `a`, `d` units has Gauss norm `1` in the Tate algebra (`TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:68`, `:133`, norm multiplicative, `‖X‖ = 1`), so its powers do not tend to `0` and `HasEval` fails; and over a field such as `ℚ_p` the Tate algebra has no proper open ideal, so `IsLinearTopology S S` fails as well. The previous repair replaced one inaccurate library claim with another; the acceptance file states what the pins have and lack, and every such statement is checked at the pin.

**Repair:** replace the clause from “but the only substitution at the pins” to “is available” by a sentence that names both mechanisms and why each fails, for example: the substitutions at the pins are the formal `PowerSeries.subst` and `MvPowerSeries.subst` under `PowerSeries.HasSubst` and `MvPowerSeries.HasSubst` (a nilpotent constant coefficient, and for several variables a finiteness condition on the coefficients), and the topological `PowerSeries.aeval` and `MvPowerSeries.aeval` under `HasEval` (a topologically nilpotent point of a complete linearly topologised ring); a Möbius image `(a z + b)/(c z + d)` has constant term `b/d`, not nilpotent, and Gauss norm `1`, not topologically nilpotent, so neither gives the weight action on the Tate algebra, in which the denominator `c z + d` must be inverted. The rest of the item (the carriers that exist, the missing local component map) is unchanged. Nothing else in the file changes; it still declares nothing.

## Previous findings

- R01 — repaired: `Suggested.lean:14`–`19` no longer names `MvPowerSeries.restrictedSubst` or `TateAlgebra/Subst.lean`; it names `PowerSeries.subst`, `MvPowerSeries.subst`, `PowerSeries.HasSubst`, `MvPowerSeries.HasSubst`, all present at the pin. The replacement sentence's “only substitution” claim is R01 of this report.

## Verified sound

**Gate and build.** The worker's gate at this head passes every check (`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 … imports=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 … build=0 OK`). I elaborated `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` with `lake env lean` from the pull-request worktree: exit code 0, no output. The file has the single `import Mathlib`, one module docstring, an empty namespace `TauCetiRoadmap.QuaternionicModularForms`, no `set_option`, no `lemma`, no stand-in, no sorry'd data. The pins of `lake-manifest.json` are Tau Ceti `a91d3aa` and Mathlib `6b7abb3c`, and the checkouts under `.lake/packages` are at those revisions. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The six added lines carry no process word, no LaTeX delimiter, no pull-request number, no machine path and no instruction-like text.

**Dependency check**, run with `--movable` against the merge order and main:

```text
depcheck: 235 roadmaps, 2180 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The diff touches no `*Needs:*` line and no supplier citation; no supplier gap is declared and none is needed.

**Library declarations opened at the pin.**

| Name in the docstring | Where it is at the pin | What it says |
| --- | --- | --- |
| `PowerSeries.subst` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:157` | substitution of a multivariate series into a univariate one, `substAlgHom` at `:170` under `HasSubst` |
| `PowerSeries.HasSubst` | `Mathlib/RingTheory/PowerSeries/Substitution.lean:39` | `abbrev`: the constant coefficient is nilpotent |
| `MvPowerSeries.subst` | `Mathlib/RingTheory/MvPowerSeries/Substitution.lean:189` | `substAlgHom` at `:209` under `HasSubst` |
| `MvPowerSeries.HasSubst` | `Mathlib/RingTheory/MvPowerSeries/Substitution.lean:77` | structure: each `a s` has nilpotent constant coefficient, and for each exponent `d` only finitely many `a s` have a nonzero `d`-coefficient (the second field the docstring's parenthetical omits; it is the one that matters for infinitely many variables, not for the finite products used here) |
| `PowerSeries.IsRestricted.subring 1` | `Mathlib/RingTheory/PowerSeries/Restricted.lean:87` | the univariate subring, defined through the multivariate one |
| `MvPowerSeries.IsRestricted.subring (fun _ ↦ 1)` | `Mathlib/RingTheory/MvPowerSeries/Restricted.lean:107` | the multivariate subring |
| complete normed ring on the univariate Tate algebra | `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:68` (`NormedRing`), `:124` (`IsUltrametricDist`), `:128` (`NormOneClass`), `:133` (`NormMulClass`), `:138` (`CompleteSpace`), `:149` (`NormedCommRing`) | norm = Gauss norm (`norm_eq_gaussNorm`) |
| the same on the multivariate Tate algebra | `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:65`, `:136`, `:143`, `:151`, `:303`, `:325`, `:338` | as above, plus `Algebra` and `NormedAlgebra` instances |
| `restrictedSubst`, `TateAlgebra/Subst.lean` | nowhere at the pin (the string occurs in no `.lean` file of either library; the `TateAlgebra` folder holds `Basic.lean` and `Iterate.lean`) | correctly no longer cited |
| `PowerSeries.eval₂`, `PowerSeries.aeval` | `Mathlib/RingTheory/PowerSeries/Evaluation.lean:131`, `:210` | not mentioned by the docstring (R01) |
| `MvPowerSeries.HasEval`, `eval₂`, `aeval` | `Mathlib/RingTheory/MvPowerSeries/Evaluation.lean:63`, `:198`, `:301` | not mentioned by the docstring (R01) |
| `MvPowerSeries.gaussNorm` | `Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:57` | supremum over exponents of `v(coeff) · ∏ c_i^{t_i}`; used for the witness below |

A grep of every Tau Ceti file mentioning `IsRestricted` (16 files under `RingTheory/Huber/Restricted`, `RingTheory/Huber/WeightedRestrictedSeries`, `RingTheory/MvPowerSeries/TateAlgebra`, `RingTheory/PowerSeries` and `AlgebraicGeometry/AdicSpace/Spa/Polydisc/GaussPoint.lean`) finds no definition of a substitution, evaluation or composition on the Tate algebra, and no `IsLinearTopology` instance for it: Tau Ceti adds nothing to Mathlib's two mechanisms, so the docstring's list is complete once the evaluations are added.

**Citations resolved at this head.** The docstring's section references `§2.4`, `§2.5`, `§2.6`, `§3.3`, `§§4.1–4.2`, `§4.4`, `§5.2`, `§5.3` are README headings at lines 608, 669, 739, 925, 964, 988, 1039, 1128, 1146. The README agrees with the docstring on what the pins offer: its `From Tau Ceti` contract (lines 158–160) cites only the Tate algebra with its Gauss norm, and it takes analytic substitution from RestrictedPowerSeries §2.2 (line 202) for the slash action of §1.2 (line 434). The resolver's one lead, `LocallySymmetric.AutomorphicForm` at README line 180, is a planned name of ArithmeticLocallySymmetricSpaces ALS.F.6 (the previous reviews); the line is unchanged and it is not a defect.

**Seeded sample.** None of the sampled targets (0.1, 0.2, 0.4, 1.1, 1.4, 2.1, 2.2, 2.4, 2.5, 2.6, 3.1, 3.2, 4.4, 5.2, 5.3) changed at this head; the docstring's references to §§2.4–2.6, 3.3, 4.4, 5.2 and 5.3 were checked above. Their locators and statements stand as verified in the reviews at 84012cc, 67bcbf6, 1261875 and cd50077. No source locator is in the change set, so no source was reopened this round.

**Headline coverage.** Unchanged: no headline is statable at the pins and the docstring names each with its missing carrier; the file declares nothing, so there is nothing to probe for padding and no signature to compare with the README.

**Computed adversarial pass.** New rows for the changed statement; the rest carry forward from the review at cd50077 and, through it, 1261875, 67bcbf6 and 84012cc.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Docstring: `HasSubst` excludes a Möbius substitution | `γ = (a b; c d)` over `ℚ_p` with `d ≠ 0`; constant term of `(aX+b)/(cX+d)` | constant term `b/d`; in a field `IsNilpotent (b/d)` iff `b/d = 0` iff `b = 0`; for `γ = (1 1; 0 1)`, `z ↦ z+1`, constant term `1`, not nilpotent; for `γ = (1 0; 0 1)` it is `0`, so only the identity-type cosets pass | Pass |
| Docstring: the formal substitutions are the only ones at the pins | `PowerSeries.aeval`, `MvPowerSeries.aeval` | exist at `Evaluation.lean:210`, `:301` under `HasEval`, not `HasSubst` | R01 |
| Added for R01: `HasEval` also excludes the Möbius image | `S = ℤ_p⟨X⟩` (Gauss norm, `c = 1`), `w = (aX+b)·(cX+d)⁻¹` with `a, d ∈ ℤ_pˣ`, `c ∈ pℤ_p`, `b ∈ ℤ_p` | `‖aX+b‖ = max(‖a‖,‖b‖) = 1`; `‖cX+d‖ = 1` and `(cX+d)⁻¹ = d⁻¹ Σ (−cX/d)^k` has Gauss norm `1`; `NormMulClass` gives `‖w^n‖ = 1` for all `n`, so `w^n ↛ 0` and `HasEval w` fails; over `ℚ_p⟨X⟩` an open ideal contains a ball `‖f‖ ≤ p^{−N}`, hence the unit `p^N`, so `IsLinearTopology` fails | Pass (the docstring's conclusion holds) |
| Added for R01: a contracting point does satisfy `HasEval` | `S = ℤ_p⟨X⟩`, `w = pX` | `‖(pX)^n‖ = p^{−n} → 0`, so `HasEval (pX)` holds and `aeval` would give `f(X) ↦ f(pX)` on `ℤ_p⟦X⟧`, given an `IsLinearTopology` instance, which no Tau Ceti file supplies; this is why “only” is the wrong word and “no Möbius action” is still right | R01 |
| Docstring: Tate-algebra carriers are complete normed rings at the pin | `c = 1`, `R = ℚ_p` | `Fact (0 < 1)` discharges the radius hypothesis; `NormedRing`, `CompleteSpace` instances at `TateAlgebra.lean:68`, `:138` need `[NormedRing R] [IsUltrametricDist R]`, `[CompleteSpace R]`, which `ℚ_p` has | Pass |
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
