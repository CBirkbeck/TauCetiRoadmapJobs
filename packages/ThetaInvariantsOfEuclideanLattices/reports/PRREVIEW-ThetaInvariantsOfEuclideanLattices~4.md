# Review of ThetaInvariantsOfEuclideanLattices (pull request #2038 at 97aa248)

**Verdict:** accepted

This is an incremental re-review of the 15 lines that changed since cff2e46. Every change is in
`TauCetiRoadmap/ThetaInvariantsOfEuclideanLattices/README.md`. `Suggested.lean` is byte-identical
to cff2e46 (`git diff cff2e465 HEAD` lists only the README). No finding remains, and the gate passes.

## Previous findings

- R01 — repaired: README:368–370 reads "Limits: `a(t) → 1` and `b(t) → 1` as `t → ∞`, by Tau Ceti
  `TauCeti.tendsto_jacobiTheta_comap_im_atTop` along `t ↦ t·i` and `t ↦ t·i + 1`, whose imaginary
  parts are `t`." The declaration is named in the *Needs:* line of 1.7 (README:358), under **From
  Tau Ceti** (README:157–158) and in the Dependencies of Layer 1 (README:419).

## Verified sound

**The changed passages.** The diff has four hunks: the **From Tau Ceti** bullet, the *Needs:* line
of 1.7, the Limits bullet of 1.7's API and the Layer 1 Dependencies. I checked each of them and
everything that depends on them.

- The pinned declaration exists as cited. Tau Ceti `2fd255d9`,
  `TauCeti/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:129` has
  `theorem tendsto_jacobiTheta_comap_im_atTop : Tendsto jacobiTheta (comap im atTop) (𝓝 1)`, inside
  `namespace TauCeti` (lines 33–135). The fully qualified name and the file path in README:157–158
  are therefore correct.
- Mathlib does not already have the limit, so citing Tau Ceti is the right deferral. Mathlib
  `1b1ccf4b`, `Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean`, has
  `norm_jacobiTheta_sub_one_le` (line 90) and `isBigO_at_im_infty_jacobiTheta_sub_one` (line 112).
  No file under `Mathlib/NumberTheory/ModularForms/JacobiTheta/` states `Tendsto jacobiTheta …`.
- The repair holds in Lean. A scratch file imports `Mathlib` and
  `TauCeti.NumberTheory.ModularForms.JacobiTheta.OneVariable`. From the pinned theorem it derives
  `Tendsto (fun t : ℝ ↦ (jacobiTheta (t * Complex.I)).re) atTop (𝓝 1)`, and the same statement at
  `t * Complex.I + 1`. The proof composes with `tendsto_comap_iff`, using that the imaginary part
  is `t`, and then with `continuous_re`. `lake env lean` prints no error, no warning and no `sorry`.
- The passages that use the limits still close:
  - The route of 1.7 (README:353–355, "as `t → ∞`, `a` and `b` tend to `1`") now reads its input
    from the cited bullet.
  - So does the Positivity bullet (README:365–367, "`b(2ᵏt) → 1`").
  - 1.8 cites "1.7 and its API" (README:398–399) and needs nothing new.
  - No other line of the README still states the old estimate `2∑_(n ≥ 1) exp(−πtn)`.
- The *Needs:* line of 1.7 now covers every input of the route:
  - Mathlib `jacobiTheta`, `NNReal.agm`, `agm_mul_distrib`, `agm_eq_agm_gm_am`, `min_le_agm` and
    `agm_le_max`;
  - Tau Ceti `legendreK`, `legendreK_eq_pi_div_two_mul_agm` and
    `tendsto_jacobiTheta_comap_im_atTop`;
  - the duplication identities, which are API bullets proved here.
- `Suggested.lean` does not import the new Tau Ceti module, and correctly so: the statement at
  Suggested.lean:126–130 does not use it, and the gate's `imports` check passes.

**Gate and build.**

- With the candidate merge order and `--build`, my run of the gate prints:
  `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
  The worker's gate reports the same.
- With the default merge order, the gate stops at
  `depcheck: NOT IN ORDER: ThetaInvariantsOfEuclideanLattices (insert it after its last supplier)`.
  That is the placement of a new roadmap, not a defect. The pull request's description mentions it.
- `lake env lean` on Suggested.lean prints exactly 21 "declaration uses `sorry`" warnings and
  nothing else. These are the 21 theorems; the 3 definitions (`h0θ`, `h1θ`, `h0Div`) have real
  bodies.
  - Imports: `Mathlib`, `TauCeti.Algebra.Module.ZLattice.Dual` and
    `TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre`.
  - No `set_option`, no `lemma`.
- `git diff --stat origin/main...HEAD` shows only README.md, Suggested.lean and metadata.toml, all
  in the roadmap folder. Nothing changes outside it.

**Dependency check.** I ran it with the candidate merge order, `--movable`, `--content` and
`--pr 2038`. Its output, verbatim:

```text
depcheck: 236 roadmaps, 2272 edges, 0 problem(s)
```

The roadmap is at line 141 of the order. Its suppliers are LFunctions (27, on main),
GeometryOfNumbersAndQuadraticArithmetic (55), SieveMethodsAndPrimePatterns (57) and
ArakelovGeometryAndAbelianHeights (140). There is no UPWARD, CYCLE or `moved:` line. The new edge
goes to Tau Ceti at the pin, which is always an allowed supplier.

**Elaborated signatures.** These are unchanged, because the file is unchanged.

- `scratch/signatures.md` again flags one binder as possibly dropped: `[InnerProductSpace ℝ E]` on
  `h0θ` (Suggested.lean:67–68). The body uses only `‖(v : E)‖`, so nothing is lost.
- `h1θ` keeps the binder, because it needs it for `ZLattice.dual`.

**Seeded sample.** 1.7 is the only sampled target that the diff touches. Its locators did not
change, and I re-read them at DLMF version 1.2.8 (source ids dlmf-20-9 and dlmf-20-7, fetched
through the sources service):

- 20.9.1 at dlmf-20-9 lines 88–90: `k = θ₂²/θ₃²`.
- 20.9.2 at dlmf-20-9 lines 121–127: `K(k) = ½π θ₃²`.
- 20.7.5 at dlmf-20-7 lines 186–188: `θ₃⁴ = θ₂⁴ + θ₄⁴`.
- 20.7.11 at dlmf-20-7 lines 427–429. At `z = 0` it gives `θ₃(0,q)θ₄(0,q) = θ₄(0,q²)²`, which with
  `q = e^(−πt)` is `a(t)b(t) = b(2t)²`.

All four match the README. The new Limits bullet cites a pinned declaration and no source, so it
has no locator to check.

The other sampled targets lie in untouched text: 1.1, 1.2, 1.3, 1.5, 1.6, 1.8, 2.2, 2.4, 3.2, 3.3,
4.1, 4.3, 4.4 and 4.5. Their locator verdicts stand as the previous review recorded them in its
table "Seeded sample of locators" (Bos15, GS98, Gro01, dlmf-20-7, dlmf-20-9).

**Adversarial table.** The first row is new; it covers the changed statement. Every other row is
carried forward, with its values, from the previous review (PRREVIEW-…~3, at cff2e46), because the
diff leaves those statements untouched. Values for the new row are theta sums over `|n| ≤ 200`.

| statement | instances | computed values | result |
|---|---|---|---|
| **1.7 API, Limits (changed)** | `t = ½, 1, 2, 4, 8` along `t·i` and `t·i + 1`; imaginary parts; negative control along `t ↦ t + i` | `a = 1.4194955, 1.0864348, 1.0037349, 1.0000070, 1.0000000`; `b = 0.5879743, 0.9135791, 0.9962651, 0.9999930, 1.0000000`; `\|a − 1\| = 8.643e−2, 3.735e−3, 6.975e−6, 2.432e−11` for `t = 1, 2, 4, 8`, each below Mathlib's bound `2∑ e^(−πtn)` = `9.033e−2, 3.742e−3, 6.975e−6, 2.432e−11`; `im(t·i) = im(t·i + 1) = t`; along `t + i` (imaginary part fixed at `1`) the values alternate `1.0864348, 0.9135791, 1.0864348, 0.9135791` at `t = 10, 11, 12, 13`, so no limit exists | holds. The filter `comap im atTop` is the right one: both stated paths lie in it, and the control path, which does not, has no limit. The Lean probe closes both limits |
| 1.7 Positivity (depends on the limits) | `t = ½`, `b(2ᵏ·½)` for `k = 0, 1, 2, 3, 4` | `0.5879743, 0.9135791, 0.9962651, 0.9999930, 1.0000000` | `b(2ᵏt) → 1` as used; `b > 0` follows |
| 1.1 `h0θ` (carried from ~3) | `⊥`; `ℤ`; sum over `L ∖ 0`; exponent `2π` | `0`; `0.0829015`; `log 0.0864348 = −2.4483648`; `0.0037279 = h0θ(√2ℤ)` | sound |
| 1.1 `h1θ` (carried) | `2ℤ` | `h1θ = 0.6931542`, `h0θ = 0.0000070` | sound |
| 1.2 (carried) | `ℤ`; `2ℤ`; rank 0 | `0 = 0`; `0.0000070 − 0.6931542 = −0.6931472`; `0 = −log 1` | holds |
| 1.3 (carried) | `2ℤ`; non-discrete `ℤ + √2ℤ`; `ℤ²`, `½ℤ` | `0.0000070 > 0`; `tsum = 0`, `h0θ = 0`, `L ≠ ⊥`; `0.1658030 ≥ 0`, `0.6931542 ≥ 0.6931472` | holds; discreteness needed only in the iff |
| 1.4 (carried) | `½·id: ℤ → ½ℤ`; `2·id`; projection `ℤ² → ℤ`; `2ℤ ⊆ ℤ` | `0.0829015 ≤ 0.6931542`; `0.6931542 > 0.0829015`; `0.1658030 > 0.0829015`; `0.0000070 < 0.0829015` | holds; the iff holds both ways |
| 1.5 (carried) | `2ℤ ⊆ ℤ`; `h¹`; `⊥ ≤ ℤ` | `−0.6102457 ≤ 0.0000070 ≤ 0.0829015`; `0.0829015 ≤ 0.6931542 ≤ 0.7760487`; `relIndex = 0` would give `0.0829 ≤ 0` | holds; `≠ 0` needed |
| 1.6 (carried) | `ℤ × ℤ`; sup norm | `0.1658030 = 2·0.0829015`; mass `1.3457671`, `log = 0.2969642` | holds |
| 1.7 duplication (carried) | `t = ½, 1, 2` | `a² + b² = 2a(2t)²`: `2.3606812`, `2.0149674`, `2.0000279`; `ab = b(2t)²`: `0.8346268`, `0.9925442`, `0.9999861` | hold |
| 1.7 (carried) | `t = ½, 1, 2`; modulus `√(1 − (b/a)²)`; factor `π` | `K = ½πa²`: `3.1651035`, `1.8540747`, `1.5825517`; moduli `0.9851714`, `0.7071068`, `0.1715729`; `agm(a², b²) = 1.0000000`; wrong modulus `1.7097562`; wrong factor `3.7081494`, `6.3302069` | holds; the Checks are correct |
| 1.8 (carried) | value; route; `Γ(1/4)` | `1.0864348112133` on both sides; `a(1)⁴ = 1.3932039 = 2b(1)⁴`; `K(1/√2) = 1.8540747`; `Γ(1/4)Γ(3/4) = 4.4428829 = π√2`; `0.3672031 < 1` | holds |
| 2.1 (carried) | `ℤ`, `x = ½`, `1`; `ℤ²`, `x = (½, 0)`; rank 0 | `0.9135791 < 1.0864348`; equal; `0.9925442 < 1.1803406`; `1 = 1` | holds in both directions |
| 2.2 (carried) | `ℤ²`, `K = ℝ(1,1)`, `g = (½,−½)`; `K = ℝe₁`, `g = e₂` | `e^(−π/2)·0.4157606 ≤ e^(−π/2)·1.0037349`; `e^(−π)·1.0864348` on both sides | holds |
| 2.3 (carried) | `ℤ²`, `K = ℝ(1,1)`; `K = ℝe₁`; `K = ℝ(1,√2)` | `0.1658030 < 0.3540294`; `0.1658030 = 2·0.0829015`; `0.1658 ≤ 0` is false without `hK` | holds; `hK` needed |
| 2.4 (carried) | `ℤ²`, `K = ℝ(1,1)` | `0.1658030 < 0.3503015 + 0.0037279` | holds |
| 3.1 (carried) | `2ℤ`, `r = 2`; `r = 0.3` | `0.0000070 ≤ 0.0000109`; `1 − 1/(2π·0.09) = −0.7683883` | holds; hypotheses needed |
| 3.2 (carried) | `2ℤ`, `t = 5.0132565`; `t = 1` | `0.0000070 ≤ 0.0000288`; `1/0 = 0` junk value | holds; `t > 1` needed |
| 3.3 (carried) | `ℤ`, `x = ½`, `t = 1`; `ℤ`, `x = 0`, `t = 2.6` | `0.9135791 ≤ 1.0864348`; `0.0000070 ≤ 0.1585656` | holds |
| 4.1 `h0Div` (carried) | ℚ, `x = 0, 1`; ℚ(i), `x = 0`; `I = 0` | `0.0829015`, `1.0000000`; `0.0074559` against `0.1658030`; `log 1 = 0` | sound |
| 4.2 (carried) | ℚ, `f = 2`, both signs | `0.0829015` against `1.3862944` | holds; sign pinned |
| 4.3 (carried) | ℚ, `x = 1`; ℚ(i), `x = 0`, `0.3` | `1 − 0 = 1`; `−0.6931472 = −½ log 4`; `−0.3931472` on both sides | holds; normalisation pinned |
| 4.4 (carried) | ℚ, `x = −½`, `−1` | `0.0003910` against `0.0001955`; `1.658·10⁻¹⁰` against `8.290·10⁻¹¹` | holds with `β ≥ 2` over ℚ |
| 4.5 (carried) | ℚ, `x = 1`; degree `0` | `1.0000000 ≤ 1.0829015`; at degree `0` the conclusion is the hypothesis | holds |

**Headline theorems and padding.** `Suggested.lean` is unchanged, so the headline list and the
padding probe are as before. The headlines are 1.2–1.8, 2.1–2.4, 3.1–3.3 and 4.2–4.5. All are
stated on the roadmap's carriers, and the docstring declares none unstatable. In the previous
review's one-tactic probe, all 21 theorems failed. The new citation affects only the proof route of
1.7, not its statement at Suggested.lean:126–130.

**Cross-roadmap citations re-resolved at their current heads.**

- `roadmaps resolve` on the README lists no missing citation and no missing Lean name.
- GeometryOfNumbersAndQuadraticArithmetic, at its open head:
  - §0.2.2 `projected_adapted_basis` (README line 294)
  - §0.3.1 `covolume_projection` (357)
  - §4.4.4 `latticeGaussianSum` (1750)
  - §4.4.7 `gaussian_shift_le` (1770)
  - §4.4.8 `gaussian_scale_le` (1779)
  - §4.4.13 (1804, whose *Needs:* names `gaussian_variable_tail`)
- SieveMethodsAndPrimePatterns: §0.11a (README lines 13, 69).
- ArakelovGeometryAndAbelianHeights: §1.7 (README lines 350–352).
- LFunctions, on main, in its Suggested.lean: `coe_dualIdealLattice` (613), `latticeTheta` (760) and
  `latticeTheta_inv` (786). These line numbers are one lower than the previous review recorded; the
  names are unchanged.

**Ownership and overlaps.** The change removes a restatement and adds no object. `scratch/overlaps.md`
reports:

- no open pull request that changes this roadmap;
- no cited id that an open pull request drops;
- no cited id that only an open revision defines.

**Remark on untouched text** (not a finding). The pull request's description says "It states all
25 declarations". At this head `Suggested.lean` has 24: 3 definitions and 21 theorems. The
description's Layer 1 summary also does not mention Jacobi's relation (1.7).

## Not verifiable

These items are unchanged from the previous review. This review opened no source other than DLMF
§§20.7 and 20.9.

- Groenewegen's displayed formulas (Theorem 3.2, Proposition 4.4, Lemmas 5.2 and 5.3, Proposition
  6.4). The Numdam scan has its displays as images. Each of these targets also has a Bost locator,
  which was verified.
- Montgomery (1988) and Cohn–Kumar–Miller–Radchenko–Viazovska (2022), cited in the non-target
  paragraph after 1.3. They were not opened; the numerical values there were recomputed.
- Banaszczyk (1993), Francini (2001, 2004), Tran (2017), Tran–Tian (2018) and Tran–Tian–Feaver
  (2023), cited in Research context without targets. Not opened.

## Source issues

- none
