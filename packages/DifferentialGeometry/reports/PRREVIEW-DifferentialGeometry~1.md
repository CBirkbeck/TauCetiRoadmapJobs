# Review of DifferentialGeometry (pull request #334 at a01a8ad)

**Verdict:** rejected

The pull request adds a fresh `TauCetiRoadmap/DifferentialGeometry/` (a 482-line README and a 154-line `Suggested.lean`) on a branch whose merge base does not contain that folder. On main the folder already exists: the differential-geometry roadmap (forms, de Rham cohomology, flows, degree; 1093-line README, 3353-line `Suggested.lean`, Layers 0 and 1 recorded as implemented in Tau Ceti). The submitted document re-plans Layers 0, 1 and 3 of that roadmap in a thinner form and would replace it on merge. A Tau Ceti roadmap is built on, never re-planned; an extension is a Part II that says where the base stops. No edit to this text repairs that, so the verdict is rejected. The remaining findings are recorded so that whatever is salvaged (a Part II, or a revision of the roadmap on main) does not carry them over.

## R01 (P1) — Re-plans the DifferentialGeometry roadmap that is already on main

**Location.** `TauCetiRoadmap/DifferentialGeometry/README.md` lines 1–55 ("Roadmap: differential forms and smooth flows … The first sub-PR covers two connected pieces of infrastructure") and `Suggested.lean` lines 44–150.

**Claim.** The pull request presents a new roadmap folder named `DifferentialGeometry` covering the paired wedge, rough forms, pullback, the manifold exterior derivative and the smooth-flow theorem.

**Witness.** On main, `TauCetiRoadmap/DifferentialGeometry/README.md` Layer 0.1 (`wedgeWith μ`, `wedgeWith_apply_one_one`, `wedge_apply_one_one`), 0.3 (`RoughForm I M F k`, `mpullback` through `mfderiv`), 1.1–1.4 (`mextDeriv`, `contDiffOn_extDerivWithin_succ`, naturality, d² = 0, Leibniz, Cartan) and 3.1–3.2 (Banach smooth dependence, `flowOf`, Lee Thm 9.12) already plan every object this pull request proposes; main's `Suggested.lean` declares `wedgeWith` (line 138), `wedge_apply_one_one` (line 223), `RoughForm` (line 529), `mpullback` (line 543), `contDiffOn_extDerivWithin_succ` (line 743), `mextDeriv` (line 766), `exists_contDiffAt_localFlow_of_completeSpace` (line 1250). Main's roadmap also already cites `urkud/DeRhamCohomology` as migration material (README "Prior work and coordination"). The pull request's merge base (`27ffe094`) has no `DifferentialGeometry` folder, so the diff is pure addition and the merge is an add/add replacement of the roadmap on main.

**Repair.** Close this pull request. What it wants that main's roadmap lacks is nothing I could identify: the coefficient-paired wedge, the Lie-algebra bracket product (`bracketWedge`, "dω + ½[ω ∧ ω]" in main's 0.1 and 1.4), degree-2 bridging via `legacySmoothTwoFormEquiv` (main's 0.4), and the Banach flow theorem (main's 3.1–3.2) are all targets there. If the author wants a connection/curvature/Bianchi development on Lie-algebra-valued forms, that is a new roadmap (or a Part II of the roadmap on main) whose introduction says where the base roadmap stops and which imports main's Layers 0–1 and 3 by section, never restating them.

## R02 (P1) — Cited Tau Ceti suppliers do not exist at the pin

**Location.** README lines 186–194 ("the integral-curve and maximal-flow development, `ExpLie.lean`, and `FundamentalVF.lean`, together with the existing `funVF`, `contMDiff_expLie` and `mlieBracket_funVF_eq_neg`"), lines 364–380 ("The existing `MaximalFlow.lean` development … the `contMDiff_flow_like` axiom/interface"), and `Suggested.lean` lines 14–15 and 132–133.

**Claim.** These files and declarations are "existing Tau Ceti work", and the headline theorem "replaces the existing flow axiom".

**Witness.** At the pinned Tau Ceti (`e8af08d`), `grep -ri` over `TauCeti/` finds no `ExpLie`, `FundamentalVF`, `MaximalFlow`, `funVF`, `flow_like`, `contMDiff_expLie`, `mlieBracket_funVF`, and no `maximalIntegralCurve`. Tau Ceti has no `axiom` declarations at all. The Lie-group exponential there is `contMDiff_lieExp` (`TauCeti/Geometry/Lie/Exponential/Smoothness.lean` line 394), not `contMDiff_expLie`. The Lean docstring (line 15) points for the "existing flow/Lie work" to a branch of a personal `mathlib4` fork, which is neither Mathlib nor Tau Ceti at the pins.

**Repair.** Every supplier is a pinned Mathlib or Tau Ceti declaration cited by its file and name, or a section of a roadmap on main. Here the correct suppliers are main's DifferentialGeometry Layer 3 and the Lie-groups roadmap (`lieExp`, `contMDiff_lieExp`), which that roadmap on main already names. Drop every reference to the fork.

## R03 (P1) — `Suggested.lean` does not build

**Location.** `Suggested.lean` line 89: `(ω : RoughForm (I := I') (M := M') (F := F) k)`.

**Claim.** The file is "a compiled interface sketch" (README line 421).

**Witness.** `lake env lean` at the pins: `Suggested.lean:89:18: error: unexpected token 'ω'; expected '_' or identifier`. With `open scoped ContDiff` (line 25), `ω` is the notation for `(⊤ : WithTop ℕ∞)` (`Mathlib/Analysis/Calculus/ContDiff/FTaylorSeries.lean` line 118) and cannot be a binder name. The worker's gate records the same error. Renaming the binder to `η` in a scratch copy makes the file elaborate with only `sorry` warnings.

**Repair.** Moot under R01; in any successor, rename the binder.

## R04 (P1) — `contDiffOn_extDerivWithin` is false at `n = 0`

**Location.** `Suggested.lean` lines 108–114: hypotheses `UniqueDiffOn ℝ s`, `ContDiffOn ℝ n φ s`; conclusion `ContDiffOn ℝ (n - 1) (extDerivWithin φ s) s` with `n : WithTop ℕ∞`.

**Claim.** Differentiating a `C^n` form once gives a `C^(n−1)` form, for every `n`.

**Witness.** Subtraction in `WithTop ℕ∞` is truncated: `(0 : WithTop ℕ∞) - 1 = 0` (closed by `simp` in my probe file). Take `E = F = ℝ`, `k = 0`, `s = univ`, and the 0-form `φ x = |x|` (a continuous function, so `ContDiffOn ℝ 0 φ univ`). `extDerivWithin φ univ x = extDeriv φ x` is `alternatizeUncurryFin (fderiv ℝ φ x)`; evaluated at `![1]` it is `+1` for `x > 0`, `−1` for `x < 0`, and `0` at `x = 0` (junk value of `fderiv` at a non-differentiable point). The conclusion asks for `ContDiffOn ℝ 0`, that is continuity, which fails at `0`. Mathlib at the pin has no `ContDiffOn` lemma for `extDerivWithin` (`Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean` lines 93–260; the d² result there needs `minSmoothness 𝕜 2 ≤ r`).

**Repair.** State it in successor form, exactly as main's `contDiffOn_extDerivWithin_succ` does: hypothesis `ContDiffOn ℝ (n + 1) φ s`, conclusion `ContDiffOn ℝ n (extDerivWithin φ s) s`. Checked: with `n + 1 = 1` the `|x|` example is excluded (it is not `C¹`), and `n = ∞`, `n = ω` are unchanged.

## R05 (P1) — Sorry'd data and a `Prop` placeholder

**Location.** `Suggested.lean` line 44–49 (`noncomputable def wedgeWith … := sorry`), line 52–56 (`wedge` is defined through it), lines 59–63 (`wedge_apply_one_one` is a statement about the sorried map), line 95 (`opaque mextDeriv : Prop`).

**Claim.** The file states the headline interfaces.

**Witness.** The gate's `sorry-data` rule flags line 44. `wedge_apply_one_one` constrains nothing: with the body `sorry`, the determinant identity is a claim about `sorryAx`. `mextDeriv : Prop` is the "name a condition you cannot state" pattern the repository README forbids (Prototyping: "never a `Prop`-typed field or a `def _ : Prop := sorry`"); it is satisfiable by `True` and mentions no form.

**Repair.** Moot under R01. In general: a definition with a real body (main's `wedgeWith` is the permutation formula pinned by `wedgeWith_apply`) or no definition; a heavy construction is a README target, never an opaque `Prop`.

## R06 (P2) — `contMDiff_flow_like` is a complete-field special case, with hypotheses the README disowns

**Location.** `Suggested.lean` lines 137–150; README lines 53–55 ("The exact finite-regularity hypotheses … are intentionally left for the implementation") and 373–377 ("Those numbers are interface placeholders to be verified").

**Claim.** The theorem "corresponds to the smooth-flow conclusion of Lee, Theorem 9.12".

**Witness.** The hypothesis `∀ x, IsMIntegralCurve (fun t => Φ t x) X` uses Mathlib's global predicate (`Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean` line 77: a derivative condition for every `t : ℝ`), so `Φ` exists only when every integral curve of `X` is defined for all time. For `X = x² ∂ₓ` on `M = ℝ` no such `Φ` exists and the theorem is silent, whereas Lee 9.12 gives the flow on its open domain. Instances where the statement is true: `X = 0` (`Φ t x = x`), `X = ∂ₓ` on `ℝ` (`Φ t x = x + t`), both `C^∞`. The statement is true as written (uniqueness `isMIntegralCurve_eq_of_contMDiff` identifies `Φ` with the maximal flow once `hΦ₀` holds, and a `C²` field has a `C²` flow), but it is the completed-flow corollary, not the fundamental theorem; main's Layer 3.2 states the theorem on `flowDomain`. The `minSmoothness ℝ` wrappers are identities over `ℝ` (`minSmoothness_of_isRCLikeNormedField`), so the signature is `IsManifold I 3`, field `C²`, flow `C²`; the README then says these numbers are not claimed. A `Suggested.lean` statement is one the roadmap is sure of. Separately, the namespace is `TauCetiRoadmap.DifferentialForms` while the folder is `DifferentialGeometry`.

**Repair.** Moot under R01; the flow headline is main's `contMDiffOn_flowOf` and its Banach extension.

## R07 (P2) — The README overstates what the ICERM report records

**Location.** README lines 131–140: "The report records progress through: … a smooth vector bundle of continuous alternating maps; bundled `r`-smooth `k`-forms on a manifold; transfer of properties from normed spaces to manifolds."

**Claim.** Those items are recorded progress.

**Witness.** kudryashov-lindauer-icerm-2026 lines 112–124: the revised key-components list places the marker "We are here" (line 119) after the topological vector bundle and before the smooth vector bundle, bundled forms and transfer, so those three are stated as remaining work, not progress. The obstacle (smoothness of `compContinuousLinearMap`, line 371) and the notation remark (lines 378–380) are correctly reported.

**Repair.** Say the report reaches the topological bundle of alternating maps and lists the smooth bundle, bundled forms and transfer as next.

## R08 (P3) — README shape and policy

**Location.** README throughout.

**Witness.** Line 3 is a heading addressed to a person ("@deicyde — should we split…"); lines 5–15, 408–423 and 448–449 are process narrative ("sub-PR", "Tau Ceti's LLMs", "Jack: review the architecture"); line 481 is a pull-request number (gate `prnum`); lines 154–155, 200, 357 are bare URLs; there is no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, no `## Layer k` sections, no definition API lists, no `**Checks.**`, no `*Needs:*` lines, and no locator finer than a chapter for Tu (§§21.4–21.6, §22.2 are cited without theorem numbers or pages); `metadata.toml` is missing (gate). The dependency map (lines 76–113) and acceptance chain (393–406) are diagrams, not targets with hypotheses.

**Repair.** Moot under R01. A successor follows the repository README's "Writing a roadmap" and the shape of main's DifferentialGeometry README.

## Verified sound

- **Gate** (worker's run at `a01a8ad`): `prnum=1 sorry-data=1 metadata=1 build=2`, FAIL; reproduced the build error with `lake env lean` (exit 1, error at 89:18). Probe copy with the binder renamed: elaborates, 4 `sorry` warnings, `#check` of all 8 declarations printed; their elaborated types match the signatures file (no dropped section binder).
- **Dependency check**: `depcheck: 155 roadmaps, 1059 edges, 0 problem(s)`; no UPWARD or CYCLE line. The README has no `*Needs:*` lines or supplier citations for the check to read, which is itself R08.
- **Adversarial table** (values computed on each side):

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `wedge_apply_one_one` | `E = ℝ²`, `φ = dx`, `ψ = dy`, `(v,w) = (e₁,e₂)`; and `v = w` | RHS `1·1 − 0·0 = 1`; `v = w`: `φv ψv − φv ψv = 0` | consistent with the shuffle convention (main's Conventions: no `1/k!l!`); LHS uncomputable, `wedgeWith` is `sorry` | R05 |
| `wedge` degree 0 | `k = l = 0`, `φ = a`, `ψ = b` | should be `a·b`; body is `sorry` | unverifiable | R05 |
| `contDiffOn_extDerivWithin` | `n = 0`, `φ = |x|` on `ℝ`, `k = 0`, `s = univ` | `0 − 1 = 0` in `WithTop ℕ∞`; `extDeriv φ x ![1] = sign x`, `0` at `0`: not continuous | **false** | R04 |
| same | `n = 1`; `n = ∞`; `n = ω` | `1 − 1 = 0`: `C¹ ⇒ d` continuous ✓; `∞ − 1 = ∞` ✓; `ω − 1 = ω`, derivative of analytic is analytic ✓ | true for `n ≥ 1` | successor form |
| `mpullback` | `k = 0`, `f` not differentiable at `x`; `k ≥ 1`, same | `mfderiv = 0`; `compContinuousLinearMap` on `Fin 0` ignores it: `(f^*η) x = η (f x)`; for `k ≥ 1`: `0` | total, junk convention as stated | duplicates main 0.3 |
| `RoughForm` | `k = 0` | `(x : M) → (TangentSpace I x [⋀^Fin 0]→L[ℝ] F) ≅ M → F` | functions are 0-forms | duplicates main 0.3 |
| `mextDeriv : Prop` | — | satisfiable by `True`; mentions no form | vacuous | R05 |
| `contMDiff_flow_like` | `X = 0`; `X = ∂ₓ` on `ℝ`; `X = x²∂ₓ` on `ℝ` | `Φ t x = x` ✓; `Φ t x = x + t`, `C^∞` ✓; no `Φ` satisfies `hΦ` (blow-up at `t = 1/x`) so the theorem is silent | true, complete fields only; `hΦ₀` necessary (without it `Φ t x = γ(t)` for a fixed curve satisfies `hΦ`) | R06 |
| same, regularity | `minSmoothness ℝ 3`, `minSmoothness ℝ 2` | `= 3`, `= 2` by `minSmoothness_of_isRCLikeNormedField` | `C²` field ⇒ `C²` flow is the classical finite-regularity statement | note only |

- **Library declarations opened at the pins** (Mathlib `05ae010`, Tau Ceti `e8af08d`): `extDeriv`/`extDerivWithin` (`Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean` lines 73, 88) and the lemma list there (lines 93–260, no `ContDiffOn` lemma); `extDerivWithin_extDerivWithin_eqOn` with `minSmoothness 𝕜 2 ≤ r` (line 222); `minSmoothness` (`Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean` line 492); `IsMIntegralCurve` (`Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean` line 77); `isMIntegralCurve_eq_of_contMDiff` (`…/IntegralCurve/ExistUnique.lean` line 238); the `ω` notation (`…/ContDiff/FTaylorSeries.lean` line 118); no wedge on `ContinuousAlternatingMap` in Mathlib (only `AlternatingMap.domCoprod`, `Mathlib/LinearAlgebra/Alternating/DomCoprod.lean` line 137); `TauCeti.SmoothTwoForm` (`TauCeti/Geometry/Manifold/TwoForm.lean` line 59, a `ContMDiffSection` of bilinear forms with `isAlt`, as the README describes); `contMDiff_lieExp` (`TauCeti/Geometry/Lie/Exponential/Smoothness.lean` line 394); `TauCeti/Geometry/Manifold/IntegralCurve.lean` (regularity of integral curves only).
- **Cross-roadmap**: main's DifferentialGeometry README Layers 0, 1, 3, "What Tau Ceti already has", "Prior work and coordination", and its `Suggested.lean` declarations listed in R01. `roadmaps grep` shows the same objects in main's roadmap and in the open revision pull request of that roadmap (#886); no other open roadmap owns them. Ownership against open pull requests was checked only through that grep.
- **Sources**: kudryashov-lindauer-icerm-2026 (fetched, institutional copy): authors and title lines 6–8, progress list lines 112–124, obstacle lines 371–380, `extDeriv_pullback` lines 327–330. yin-kudryashov-flows (arXiv:2602.13247, fetched): title and authors lines 5–6, Lee 9.12(a) used for uniqueness line 263, the `C^k` Banach flow theorem described as in progress lines 272–276, so the README's "continuous-flow prior art" characterisation is accurate. `urkud/DeRhamCohomology` (public repository): `DeRhamCohomology/ContinuousAlternatingMap/Wedge.lean` declares `wedge_product (g) (h) (f : N →L[𝕜] N' →L[𝕜] N'')` with notations `g ∧[f] h` and `g ∧[𝕜] h`, as README lines 202–220 state; the worker's citation lead on `wedge_product` is resolved as an external name, not a pinned one. Tu GTM 275: Chapter 4 "Tools from Algebra and Topology" contains §21 "Vector-Valued Forms" with §21.2 "Products of Vector-Valued Forms" (publisher's table of contents), matching README lines 20–22.

## Not verifiable

- Tu, GTM 275, §§21.4, 21.5, 21.6, §§10–11 and §22.2 titles and contents: paywalled; only the chapter and §21.1–21.3 headings are public. Cited by locator (uncertified).
- Lee, *Introduction to Smooth Manifolds*, 2nd ed., Theorem 9.12: paywalled; the numbering is corroborated by yin-kudryashov-flows line 263 and by main's roadmap. Uncertified.
- The Tau Ceti files the README calls existing (`ExpLie.lean`, `FundamentalVF.lean`, `MaximalFlow.lean`) could be verified only at the pin, where they are absent (R02); I did not inspect the personal fork the Lean docstring links.

## Source issues

- none
