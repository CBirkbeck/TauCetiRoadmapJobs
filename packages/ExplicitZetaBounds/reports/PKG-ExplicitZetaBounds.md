# PKG-ExplicitZetaBounds

Files written: `packages/ExplicitZetaBounds/README.md`, `packages/ExplicitZetaBounds/Suggested.lean`,
`packages/ExplicitZetaBounds/metadata.toml` (`topic = "math.NT"`, as on main), and
`packages/ExplicitZetaBounds/sources.toml` (one new source, locators and `cited_for` updated).
`design/plan.json` is unchanged: its `gaps` list stays empty, because nothing here waits on another
roadmap.

The README is the accepted design written out, with the corrections below. Every target, Check
and worked example of the design is kept, and the layer and section numbering is unchanged.

## Headline theorems

All are stated in `Suggested.lean`, each with `sorry`, except the items marked otherwise.

| # | Headline (README) | Status |
|---|---|---|
| 1 | Two-sided bound for `|Γ(σ + it)|`, `σ > 0`, `t ≠ 0` (2.5) | stated: `norm_Gamma_bounds` |
| 2 | Rademacher's convexity bound, primitive `χ`, `q > 1` (3.2) | stated: `norm_LFunction_le_rademacher` |
| 2′ | Rademacher's bound for records of finite-order type (3.2) | not statable at the pins: needs `AnalyticLFunctionData` and its continued L-function (L-functions roadmap), absent from Mathlib and Tau Ceti |
| 3 | `|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t`, `t ≥ 3` (4.7) | stated: `norm_riemannZeta_criticalLine_le` |
| 4 | Ford's explicit Vinogradov mean value theorem, first clause (4.9a) | stated: `vinogradovCount_le_ford`, with the definition `vinogradovCount` |
| 5 | Ford's Richert-type bound for `ζ` and Hurwitz `ζ(s, u) − u^{−s}` (4.10) | stated: `norm_riemannZeta_le_richert` |
| 6 | Bellotti–Wong `N(T)` bounds, `T ≥ e` (5.2) | stated: `abs_zetaZeroCount_sub_le`, with `zetaZeroCount` |
| 7 | BMOR explicit `N(T, χ)` (5.3) | stated: `dirichletZeroCount_explicit`, with `dirichletZeroCount` |
| 8 | Classical region `R₀ = 5.558691` given `RH(3·10¹²)` (7.3) | stated: `riemannZeta_ne_zero_classical`, with `RiemannHypothesisUpTo` |
| 9 | Vinogradov–Korobov region `c = 55.241` given `RH(3·10¹²)` (7.6) | stated: `riemannZeta_ne_zero_vinogradovKorobov` |
| 10 | McCurley region for `∏_{χ mod q} L(s, χ)` in Thorner–Zaman's form (7.5) | stated: `LFunction_zeroFree_mcCurley` |
| 11 | Kadiri's region `5.60`, `3 ≤ q ≤ 400 000` (7.5) | stated: `LFunction_ne_zero_kadiri` |
| 12 | Lu–Zaman–Zhao, no real zero `σ ≥ 1 − 1/(5 log q)`, `q ≤ 10¹⁰` (7.8) | stated: `LFunction_real_ne_zero_luZamanZhao` |
| 13 | Kadiri–Lumley–Ng `N°(9/10, T)` bound given `RH(H₀)` (8.3) | stated: `zetaZeroDensityCount_nine_tenths_lt`, with `zetaZeroDensityCount` |
| 14 | Ramaré's upper bounds for `|L(1, χ)|`, all four cases (9.1) | stated: `norm_LFunction_one_le_ramare` |
| 15 | MST lower bound, non-quadratic `χ` (9.3) | stated: `norm_LFunction_one_ge` |
| — | `R₀ = 4.896` (7.3), Banks's uncapped real-zero gap (7.9) | not stated: these rest on unrefereed preprints. They stay README targets as the accepted design has them, and the module docstring says so. |

The ζ instance of Rademacher's bound (with the pole factor `3|(1 + s)/(1 − s)|`) is kept as a
README target but is not a separate headline. Its constant rests only on an uncertified locator
(`rademacher1959`). The Dirichlet instance is certified through its quotation in `bmor2021`
lines 566–577.

**Hypotheses in the acceptance test.** The only computational inputs taken as hypotheses are the
recorded verifications of README 0.4: `RiemannHypothesisUpTo (3·10¹²)` in items 8–9 and
`RiemannHypothesisUpTo 30610046000` in item 13. These match the README, which states them as
"Given `RH(H₀)`". Certificates (polynomial or numerical) are closed propositions and are not
hypotheses (see correction C1).

## Corrections to the design (what was wrong, what changed)

- **C1. Certificate convention.** In the design, every computation was a hypothesis of the theorem
  using it. With that rule the acceptance test could state none of the headline instances: the
  certificates (MTY Table 3, HPY's interval bound on `[3, 200)`, Platt's `S(T)` bound) would need
  the long ad hoc encodings the rules forbid. A closed true proposition also adds nothing to a
  statement.
  - The Conventions now distinguish two kinds of computation. *Recorded verifications* (0.4:
    `RH(H₀)` at literal heights, and the absence of zeros up to height 14) are hypotheses.
    *Certificates* are closed propositions named in the route of the theorem that uses them.
  - The general statements (the 4.4 recursion, Kadiri's criterion 7.3) still take the condition at
    free parameters as a hypothesis.
  - The headline instances that use a verification now say "Given `RH(H₀)`": 7.3 (MTY), 7.6, 8.1,
    8.3 and 8.5. `0.4 (RH(3·10¹²))` was added to the 7.6 *Needs:* line.
  - The "Not owned here" item on algorithms was reworded to match.
- **C2. 5.2 route.** The design listed `RH(30 610 046 000)` as the source of the certificate
  `|S(T)| ≤ 2.5167`. A bounded-height RH does not bound `S(T)`. The bound comes from Platt's
  isolation of the zeros (`bellottiwong2025` lines 121–124, 1038–1054).
  - The analytic argument with Table 2 covers `T ≥ 30 610 046 000` (lines 1024–1037).
  - The *Needs:* line and the Layer 5 Dependencies were corrected.
- **C3. 5.2, earlier bounds.** The design said Trudgian's `N(T)` bound is "not a target"
  (Phragmén–Lindelöf error). Bellotti–Wong (line 61 and the footnote at lines 83–84) show that it
  remains valid, in their normalization `0.112 log T + 0.278 log log T + 3.385` for `T ≥ e`:
  - for `T > 387 899.2` it follows from their second bound (crossover recomputed:
    `exp(exp(0.38917/0.15233)) = 387 898.5`);
  - below that height it follows from the `S(T)` certificate.

  It is now stated as that consequence. Hasanalizade–Shen–Wong's corrected bound
  (`0.1038, 0.2573, 9.4925`) follows from BW's first bound, since every one of its constants is
  larger.
- **C4. Layer 8 counting convention.** The design said the sources' strict variants "differ at most
  on the boundary" and that every bound is "stated for the larger count". That is false for a bound
  at a single `σ`: a bound on `N°` does not bound `N`.
  - Kadiri–Lumley–Ng (`kadirilumleyng2018` line 19) and Bellotti (`bellotti2025density` line 21)
    count `σ < β < 1`, `0 < γ < T`.
  - The README now has two counts: `N(σ, T)` (`β ≥ σ`, Kadiri 2013, lines 42–43) and `N°(σ, T)`.
    8.3 and 8.5 are stated for `N°`.
  - 8.3 now uses `<`, as the source does. A Check was added and the Example corrected.
- **C5. 7.6 / 8.5 constant.** 8.5 uses the Vinogradov–Korobov region with Bellotti's published
  constant `53.989` (`bellotti2025density` lines 362–365), which the design did not assert (it had
  only the arXiv `54.004`). 7.6 now asserts `53.989` as quoted there, and the Check was rewritten.
  8.5's *Needs:* line names it.
- **C6. 7.2 variant used downstream.** 7.4 and 8.5 use Ford's Theorem 3 with `log 0.618` in `J(t)`
  (HPY input; `bellotti2025density` lines 352–356). The design had only Ford's `log 3` form; the
  variant is now stated in 7.2.
- **C7. Library names.**
  - `Complex.PhragmenLindelof.vertical_strip` does not exist at the pin; it is
    `PhragmenLindelof.vertical_strip` (three places).
  - `hurwitzZeta` is `HurwitzZeta.hurwitzZeta` (4.10, Layer 4 Dependencies, Mathlib contract).
  - `Fourier.fourierIntegral` was added to the Mathlib contract.
- **C8. References.** Mojibake and LaTeX remnants in four titles were fixed (`Phragmén–Lindelöf`,
  `3·10¹²`, `|L(1, χ)|`, `L²`). The `rademacher1959` title in `sources.toml` was fixed too.
- **C9. Wording.** "belongs to a later roadmap" (exponent pairs) became "no statement here uses
  it", and "This replaces the finite-range hypothesis" was made timeless.

Additions that meet consumer requests at no cost (no re-planning, each derived from targets
already present):

- 0.4: the absence of zeros with `|Im ρ| ≤ 14` (`kadiri2005` line 992, `thornerzaman2024`
  line 305), with a Check that it is strictly stronger than `RH(14)`.
- 7.3: antitonicity in `R₀`, which gives every `R₀ ≥ 5.558691`, among them `5.5666305`
  (`mty2024` lines 86–87).
- 7.3: the region `β ≥ 1 − 1/(9.645908801 log(|γ|/17))` for `|γ| ≥ 21`, from `RH(3·10¹²)` and
  `5.558691`, with a new Check.
- 4.9a: an API list for `J_{s,k}(P)`, now that `vinogradovCount` is a Suggested.lean definition.
- Lean names at the headline targets, and the Conventions sentence relating the Lean counts to
  `zeroCount`.

## What the README could not support

These are consumer requests that this roadmap does not meet. Meeting them would need new targets
and sources, which would re-plan the design. They remain those consumers' gaps; their revisions are
their own.

- ExplicitNumberFields `gap:iterated-perron` (Landau's iterated Perron identity).
- ExplicitMultiplicativeFunctions `gap:zeta-reciprocal-bounds` (`|1/ζ|` in zero-free regions, Lee–Leong).
- ExplicitPrimeCounting:
  - `gap:dirichlet-four-zero-region` (`3.82`);
  - the Ramaré–Rumely `C₁(χ, H)` clause of `gap:dirichlet-zero-free-constants`;
  - the Johnston–Yang density table and Ramaré's `965` revision of `gap:explicit-zero-density`
    (the latter rests on an unpublished proof, as the design records);
  - Trudgian's 7/8-normalized form with `2.510 + 1/(5T)` (only BW's normalization, constant
    `3.385`, is supported, C3);
  - HSW's misprinted `9.3675`;
  - LZZ Corollary 1.2 with `≥` (the source has `>`).

## Notions moved down from later roadmaps

None.

## Duplication sweep and ownership

Nothing was deleted: every object the README owns was checked by object against main (`65930ba`),
the 476 open heads (`roadmaps grep`/`roadmaps show`) and the pins.

- **ExplicitCharacterSumsAndSieves (head `0655dd7`)** also owns the Kusmin–Landau lemma and the
  derivative tests (its Layer 1). It is later in `ORDER.txt` (272 against 270), so this roadmap
  keeps 4.1–4.4 and the Scope says that it takes them from here. Its revision is its own.
- **ExplicitPrimeCounting (head `65f9a25`)** defines `RiemannHypothesisUpTo`, `GRH(q, H)` and
  *RealZeroGap* in its §§1.1, 1.2 and 1.7. That is the same double ownership the review raised
  (F03). It is later (271), so 0.2 and 7.9 stay here and "Downstream consumers" says its §§ are
  citations of them.
- **AnalyticNumberTheoryPartI §3.23** (second moment of `ζ` with an explicit error under a finite
  input) is related to 6.6 but not the same statement. It is cited under "Not owned here".
- **§0.23a** of the same roadmap has the derivative sector bounds for `j ≥ 1` with constant `1/8`.
  2.1's `|r₁| ≤ sec²(θ/2)/(12|z|)` is sharper and not a duplicate.
- **ProbabilisticAndMetricNumberTheory** "Kuzmin" is Gauss–Kuzmin. Its van der Corput difference
  inequality is later in the order (275).
- **EffectiveClassNumbers** has only the existential `L(1, χ) ≥ c/log q` (AnalyticNumberTheoryPartI
  §0.9). No numerical `L(1, χ)` bound exists elsewhere.
- **Pins:** there is no Euler–Maclaurin, no complex `log Γ`, and no Vinogradov mean value theorem
  in Mathlib or Tau Ceti.
- **Suggested.lean's counts** spell out ZerosOfLFunctions' `zeroCount`/`N(T)` with
  `meromorphicOrderAt`. Suggested.lean cannot import a roadmap, so these are local definitions under
  `TauCetiRoadmap.ExplicitZetaBounds`; none shares a fully qualified name with a declaration of a
  readable roadmap.

Ownership against open pull requests was checked for all of the briefed open roadmaps by
`roadmaps grep`/`show`. `scratch/overlaps.md` lists no pull request that changes this roadmap and
no dropped id either way; no id was renumbered here.

## Adversarial pass

Values were computed with a small Euler–Maclaurin evaluator for `ζ`, Hurwitz `ζ` and `L(s, χ)`
and a Stirling evaluator for `log Γ` (validated: `ζ(2) = 1.6449341`, `|ζ(1/2)| = 1.4603545`,
`|Γ(1/2 + 10i)| = √(π/cosh 10π)` to 13 digits, `L(1, χ₄) = π/4`). The full output is in the
scratch directory.

| Statement | Instances tried | Values computed (left vs right) | Result | Change |
|---|---|---|---|---|
| `norm_Gamma_bounds` (2.5) | `s = 1/2+10i, 3+0.1i, 0.01+0.01i, 30+i, 1+i, 0.2−50i` | e.g. `3.775958e-7 < 3.777532e-7 ≤ 3.840939e-7`; `0.01+0.01i`: `19.82 < 70.30 ≤ 2.6e6`; `1+i`: `0.4440 < 0.5216 ≤ 0.6972`; `t = 0` excluded (lower factor undefined) | holds | none |
| `norm_LFunction_le_rademacher` (3.2) | `χ₄`, `χ₅`; `η = 1/2, 1/10`; `s = −η, −η+10i, 1/2, 1/2+30i, 1+η+5i` | `χ₄, η=1/2, s=−1/2`: `0.27518 ≤ 0.83154`; `χ₅, η=1/10, s=1.1+5i`: `1.54783 ≤ 10.58445`; all 20 hold. `q = 1` excluded: at `s = 1.01` the pole (`ζ(1.01) = 100.58`) breaks it | holds | ζ instance not in Lean (uncertified constant) |
| `norm_riemannZeta_criticalLine_le` (4.7) | `t = 3, 5, 14.1347, 20, 100, 200, 1000` | `0.53855 ≤ 0.81537`; `0 ≤ 2.54522`; `5.58978 ≤ 7.91829`; `0.99779 ≤ 13.49974` | holds | none |
| `vinogradovCount` (4.9a) | `J_{2,1}(2), J_{2,2}(3), J_{1,1}(5), J_{3,2}(3), J_{0,3}(5), J_{2,1}(0.5), J_{2,1}(2.7), J_{2,3}(3)` | brute force of the Lean definition: `6, 15, 5, 93, 1, 0, 6, 15`; `2P²−P = 15` at `P = 3`; `(2s)^{−k}⌊P⌋^{2s−k(k+1)/2} = 2 ≤ 6` | count = integral (`∫|e(α)+e(2α)|⁴ = 6`); floor dependence and diagonal law hold | API list added |
| `vinogradovCount_le_ford` (4.9a) | `k = 1000`, `s = 2k²` and `s_max = 3 213 463` | `Δ_s = 11 343` and `1001.7`; exponent of `P` `> s` (diagonal lower bound respected) | consistent with (1.5) | none |
| `norm_riemannZeta_le_richert` (4.10) | `s = 1/2+3i, 1+3i, 3/4+50i, 0.9−100i, 1/2+1000i`; `u = 1/4, 1/2, 1` | `0.6380 ≤ 81.13`; at `1/2+1000i`: `0.99779 ≤ 1.45e7`, Hurwitz `2.585, 2.590, 1.133` | holds (also `t ≤ −3`) | conjugation note |
| `abs_zetaZeroCount_sub_le` (5.2) | `T = e, 14, 15, 100, 1000` with `N = 0, 0, 1, 29, 649` | `0.7951 ≤ 8.1842 / 3.8862`; `1.3099 ≤ 8.6000 / 4.2027`; `1.2588 ≤ 9.2522 / 4.7907`; crossover of the two bounds `log T = 447.981` (difference `1.6e-6`) | holds | route C2 |
| Trudgian's bound as a consequence (5.2) | same `T`; crossover with BW2 | `3.4970, 3.9504, 3.9653, 4.3253, 4.6959` all above `|N − main|`; for `T ≤ 3.06e10`, `|N − main| ≤ 2.5167 + 7/8 + 1/(50e) = 3.399 < 3.497` | holds | added (C3) |
| `dirichletZeroCount_explicit` (5.3) | `χ₄, T = 10` (`N = 2`); `q = 3, T = 5/7`; `χ₅, T = 10` | `ℓ = 2.0333`, interval `[0.777, 5.140] ∋ 2`; `ℓ = 0.2593 ≤ 1.567` (no zero, first ordinate 8.04); `[0.795, 5.543]` | holds; sign `−χ(−1)/4` checked | none |
| `riemannZeta_ne_zero_classical` (7.3) | `|t| = 2, 3, 14.1347, 3·10¹²` | boundary `0.740461, 0.836249, 0.932079, 0.993738`, all `> 1/2`, so `RH(3·10¹²)` covers `|t| ≤ 3·10¹²` | holds | RH hypothesis explicit |
| 7.3 antitonicity / `log(|γ|/17)` region | `|γ| = 20, 21, 10⁴, 3·10¹²` | `0.362100` (left of 1/2, so excluded), `0.509388`, `0.983743` vs `0.980468`, `0.995997` vs `0.993738`; threshold `log|γ| ≥ 6.6864` (`|γ| ≥ 801.5`) | holds for `|γ| ≥ 21` | added |
| `riemannZeta_ne_zero_vinogradovKorobov` (7.6) | `|t| = 3, 14.1347` | boundary `0.962613, 0.990460`; `log log 3 = 0.094 > 0` | holds | RH hypothesis explicit |
| `LFunction_zeroFree_mcCurley` (7.5) | `q = 3, 4, 5, 400 000, 400 001`; `ρ = 1` (principal pole); `Re s = 0` | region at `t = 0`: `0.905635, 0.925217, 0.935586, 0.991963`; region never reaches `Re s = 0` (`1/(9.6459 log 3) = 0.0944`); pole has order `−1`, not `> 0` | holds; imprimitive zeros on `Re s = 0` lie outside | none |
| `LFunction_ne_zero_kadiri` (7.5) | `q = 3, 4, 5, 400 000`; `L(0.9, χ₋₃)` | region `0.837457, 0.871188, 0.889047, 0.986156`; `L(0.9, χ₋₃) = 0.58184 ≠ 0` | holds | none |
| `LFunction_real_ne_zero_luZamanZhao` (7.8) | `q = 3, 4, 5`; `q = 1, 2` | `L(0.817952, χ₋₃) = 0.56242`, `L(0.855730, χ₋₄) = 0.75592`, `L(0.875733, χ₅) = 0.38484`; `q ≤ 2` vacuous (only `χ = 1`) | holds | none |
| `zetaZeroDensityCount_nine_tenths_lt` (8.3) | `T = H₀`; count convention | bound `1.9139e8 > 0 = N°(9/10, H₀)` under `RH(H₀)`; a zero with `β = 9/10` is counted by `N` but not by `N°` | holds for the strict count only | C4 |
| `norm_LFunction_one_le_ramare` (9.1) | `χ₋₃, χ₅, χ₋₄, χ₈, χ₋₈` | `0.604600 ≤ 1.257547`; `0.430409 ≤ 0.804719`; `0.785398 ≤ 1.401388` and `≤ 1.047267`; `0.623225 ≤ 0.866434`; `1.110721 ≤ 1.220554`; `q = 1` excluded (junk `ζ(1)`) | holds | constants certified via `ramaretmeemt` lines 88–100 |
| `norm_LFunction_one_ge` (9.3) | quartic `χ` mod 5; `q = 2, 3, 4` | `0.888577 ≥ 0.222066`; `q ≤ 4` vacuous (all primitive characters real) | holds | none |
| `RiemannHypothesisUpTo` (0.2) | `H < 0`; `ζ(−2) = 0`; `H = 14` | vacuous; the strip condition excludes `−2`; first ordinate `14.1347 > 14` | definition as README | none |
| 0.4 no zero up to 14 | `1/2 + 13i` hypothetical; height `14.2` | `RH(14)` would allow it, `N(14) = 0` excludes it; fails at `14.2` | strictly stronger than `RH(14)` | added |
| `zetaZeroCount`, `dirichletZeroCount` (finsum) | infinite support, pole at `1`, non-meromorphic junk | support finite (zeros discrete, bounded region); pole order `−1` gives `toNat 0`; `meromorphicOrderAt` used directly, not the divisor (whose junk is `0` off `MeromorphicOn`) | correct counts | none |

Context check: no `variable` block is used. Every declaration carries its binders. The `#check @name`
file (all 20 declarations, elaborated once) printed each type as intended:

- `[NeZero q]`, `IsPrimitive`, `1 < q` and the ranges are present wherever the README has them;
- the exponents are real powers (`1/6`, `2/3`, `16/5`) on positive bases;
- `RiemannHypothesisUpTo (3 * 10 ^ 12)` is at type `ℝ`.

Nothing changed after the comparison except the docstrings.

## Elaboration

`lake env lean packages/ExplicitZetaBounds/Suggested.lean` (from the content checkout, pinned
Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) exits with status 0 and prints exactly 15 warnings
`declaration uses 'sorry'` (the 15 theorems) and no other message. The file starts with `module`,
then `import Mathlib`, and imports no `TauCeti.*` module. It contains no `set_option`, `lemma`,
`#check` or sorry'd definition.

## Dependency check

```
tauceti-roadmap gate --depcheck packages/ExplicitZetaBounds/README.md --name ExplicitZetaBounds --order merge-order/ORDER.txt --movable --content <content>
depcheck: 244 roadmaps, 2461 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

`roadmaps resolve packages/ExplicitZetaBounds/README.md` (main `65930ba`, 476 heads): no
cross-roadmap citation and no Lean name found nowhere. Every Mathlib name was additionally checked
at the pin with a `#check` file: all exist except `Complex.PhragmenLindelof.vertical_strip`, which
was renamed (C7). All nine Tau Ceti names were opened at the pin.

AsymptoticExpansions (§13.1, Layer 5) is another author's new-roadmap pull request and is not in
`ORDER.txt`. The gate accepts it, and the merge-order paragraph should name it.

## Sources

- One new source: `ramaretmeemt`, Ramaré's author-maintained page, fetched through the sources
  service (`licence_class = author-page`, `certified`). It confirms the four constants of
  `ramare2001` Corollary 1 (lines 88–100), which was otherwise uncertified.
- Locators and `cited_for` were updated for `thornerzaman2024`, `kadiri2005`, `bmor2021`, `mty2024`,
  `kadirilumleyng2018`, `kadiri2013density`, `bellottiwong2025` and `bellotti2025density`.
- No `needs-references.toml` was written: every locator used is in a cached text or settled.
- No source text was copied.
- No fetched text, review or pull request contained instructions; nothing suspicious to report.
