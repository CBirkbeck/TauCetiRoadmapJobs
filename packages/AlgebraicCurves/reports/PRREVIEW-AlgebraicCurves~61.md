# Review of AlgebraicCurves (pull request #1807 at 9eacb17)

**Verdict:** needs changes

Independent AI review. This is an incremental re-review of 49 changed lines since `c8821a4`. It has one P3 finding and nothing blocking. Acceptance would mean ready for a human's final approval, not approval or merge by the AI.

Inside the folder, the 49 lines are the progress bot's report merged from main. `PROGRESS.md` and `STATUS.md` at this head are identical to main's, and `README.md`, `Suggested.lean` and the pins have not changed since `c8821a4`. The same merge brought in main's revisions of SchemeAndStackFoundations and AlgebraicVectorBundles. Those revisions make three consumer sentences of this README wrong (R01).

## R01 (P3) — Consumer sentences list SchemeAndStackFoundations and AlgebraicVectorBundles, which no longer take input from this roadmap

**Location.** The sentences are in `TauCetiRoadmap/AlgebraicCurves/README.md`:

- lines 74–75: "SchemeAndStackFoundations §4.15, which consumes this roadmap's function-field theory";
- lines 2397–2399: "SchemeAndStackFoundations consumes Layers 0–12 for function fields, divisors, Riemann–Roch, … and restates none of it";
- lines 2401–2402: "AlgebraicVectorBundles consumes the curve divisors and Riemann–Roch".

**Claim.** Both roadmaps take input from AlgebraicCurves.

**Witness.** Main's `TauCetiRoadmap/SchemeAndStackFoundations/README.md:135` says AlgebraicCurves "is not an input here". Its §4.15 (from line 6037) never names AlgebraicCurves. Main's `TauCetiRoadmap/AlgebraicVectorBundles/README.md:157` mentions it once, only as the owner of curve-specific degree theory.

**How the change made them wrong.** When the previous review read `c8821a4`, its main base was `eaf17b10`. There, SchemeAndStackFoundations listed "From AlgebraicCurves: 3, 4, 7, 8, 10, 12" (line 422) and named AlgebraicCurves in its Dependencies (line 5030). AlgebraicVectorBundles said that AlgebraicCurves "supplies curve-specific divisors and Riemann–Roch" (line 408). Main commits `c20f72af` and `47e423e0` removed all three, and the merge of main into this head carries those removals. This pull request's description says AlgebraicCurves' consumer sentences were rewritten so that each names an actual consumer; these three no longer do. The open revisions #1808 and #1854 carry the same three sentences.

**Repair.**

1. Lines 74–75: "… over a base: SchemeAndStackFoundations §4.15, which takes no input from this roadmap; §11.4 here proves the function-field statement …".
2. Delete the SchemeAndStackFoundations bullet at lines 2397–2399 from `## Downstream consumers`, and add to `## Scope and ownership`: "SchemeAndStackFoundations takes no input from this roadmap and restates none of Layers 0–12. It leaves here the comparisons of its Layer 3 scheme forms with the function-field forms. They are 12B.0d (the Cartier ramification divisor against the trace-dual different, on the separable-residue branch), §8.2 with 12B.0b (smooth-model base change) and 12A–12E (the dictionary)."
3. Lines 2401–2402: replace the AlgebraicVectorBundles clause with "AlgebraicVectorBundles leaves curve-specific degree theory here".

**Repair tested.**

- Each new sentence agrees with main's SchemeAndStackFoundations at lines 133–137 and with AlgebraicVectorBundles at line 157.
- The three sections the second sentence names say what it attributes to them: 12B.0d (line 2225), §8.2 (line 1300, "Genus and divisor base change on the smooth model") and 12B.0b (line 2205).
- Keep "on the separable-residue branch": 12B.0d states the ramification-divisor comparison only there. SchemeAndStackFoundations attributes these comparisons to "12E" (its lines 137 and 4852); correcting that locator is SchemeAndStackFoundations' own work.

## Previous findings

Review ~60 (at `c8821a4`) raised no findings of its own, so there is no open finding to account for. The four repairs it carried from review ~57 are in text unchanged since then, and I reread each:

- R01 — repaired: `README.md:2041` keeps "the `p`-th powers of `E^G`-linearly independent elements of `E`" before the separating-basis step of §11.4.
- R02 — repaired: `README.md:1629–1634` keeps the residue of `x^{−p−1} dx` as 0, with the form not exact, against the exact `x^{−p} dx`.
- R03 — repaired: `README.md:1257` and `:2010` keep the geometric-reducedness criterion and `PrimeSpectrum.isHomeomorph_comap_of_isPurelyInseparable`.
- R04 — repaired: `Suggested.lean:27–28` keeps "genus invariance under separable algebraic constant extension, finite or not".

## Verified sound

### What changed, and what it touches

- **Folder diff `c8821a4..9eacb17`.** It touches only `PROGRESS.md` (+9) and `STATUS.md` (+24/−16). Both come from main's progress-bot commit `cb757163`. `git diff origin/main HEAD -- TauCetiRoadmap/AlgebraicCurves` lists only `README.md` and `Suggested.lean`, which are unchanged since `c8821a4`. The pins in `lake-manifest.json` are also unchanged: Tau Ceti `2fd255d997`, Mathlib `1b1ccf4b`.
- **Changes outside the thirteen folders.** The diff from `origin/main...HEAD` that excludes this folder and the twelve sibling folders the pull request owns is empty. The 510 files in the brief's "changed outside the folder" list all came in through the merge of main.
- **The new progress report against the pin.** Every declaration it names exists at the Tau Ceti pin. The README cites six of them:
  - `RegularProjectiveCurveCat.equivFunctionFieldCat` (§12C);
  - `genus_eq_genus_add_finsum_singularityDegree` and `singularityDegree` (§8.5);
  - `isProjectiveOver_of_isCurveOver` (§12B);
  - the Castelnuovo inequality (§8.11);
  - `infinite_algEquiv_of_genus_eq_one` (§11.1).
- **Uncited progress-report declarations.** None contradicts a README statement.
  - The obstruction `TauCeti.Place.isEmpty_completion_algEquiv_laurentSeries` (`Place/Completion/InseparableResidueField.lean:139`) refutes no target: §9.2 already requires `F_P/k` separable at non-rational places, and §5.7 only constructs completions.
  - The remaining items in `STATUS.md` (12B.0d, the fierce different, the residue comparison) are all targets that this README still states, at lines 2225, 1452 and 1604.

### Gate, build, elaboration, signatures, padding

- **Worker's gate.** The worker's PR-aware gate at `9eacb17` passes every check, including `build=0`, `depcheck=0`, `outside-folder=0` and `statement-hygiene=0`.
- **My standalone gate rerun.** It reports `outside-folder=23` and zero on every other scanner. The 23 files are exactly the README and `Suggested.lean` of the twelve sibling folders the brief names as this pull request's own (ComplexKahlerGeometry has only its README changed). This is the same scope false positive recorded in reviews ~59 and ~60, so it is not a failing check for this folder.
- **Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicCurves/Suggested.lean` succeeds. Its only messages are `declaration uses 'sorry'` at lines 80 and 104.
- **Signatures.** I elaborated a scratch copy with `#check @name` for both declarations. The general headline keeps all four fields, the five algebra instances, both scalar towers, `IsAlgClosure k K`, `hF`, `hex`, `hc`, `hg` and `hK`. The perfect-field corollary keeps `PerfectField k`, `hF`, `hex` and `hg`. Both match README §11.4, and no binder was lost.
- **One-tactic probe.** With `first | infer_instance | simp | exact?` on a scratch copy, both statements fail ("`exact?` could not close the goal"), so neither is padding.
- **Dependency check.** Run with the prescribed arguments, it printed exactly:

```text
depcheck: 236 roadmaps, 2159 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or `moved:` line.

### Overlaps and cross-roadmap citations resolved this round

The overlap facts list #1808 and #1854 as conflicting revisions of this folder. The description's `merge-order` block orders this pull request → #1808 → #1854. The overlap report finds no dropped cited ids, no ids that only an open revision defines, and no dropped ids cited elsewhere.

I checked every roadmap on main whose README newly mentions AlgebraicCurves since `eaf17b10`:

| Citing roadmap on main | Lines | What it cites | Resolution at this head |
|---|---|---|---|
| BelyiMaps | 578–582, 3416, 3463, 3489, 4232, 4715, 4960 | Layers 0, 1, 3, 5, 6, 7; §8.1 item 2; 12B.0a, 12B.0b, 12B.0d | All exist: §8.1 item 2 at line 1247, 12B.0a at 2197, 12B.0b at 2205, 12B.0d at 2225. 12B.0d supplies what row 581 asks for: geometric ramification indices and branch values preserved under extension of algebraically closed characteristic-zero constants, and descent of finitely many finite models to a finitely generated subfield (lines 2225–2237). |
| ModularCurves | 594 | Layers 7–9 and 12 | Matches README line 2401. |
| ModularForms | 63 | GAGA left out of AlgebraicCurves | Matches "Outside the roadmap" and README line 68. |
| FuchsianOrbifolds | 152 | Layer 0 and the Layer 12 dictionary | Both exist. |
| SchemeAndStackFoundations | 133–137, 263, 4850–4852 | 12B–12C, 12E; "not an input" | 12B–12C and 12E exist; the "not an input" statement contradicts the consumer sentences (R01). |
| AlgebraicVectorBundles | 157 | curve-specific degree theory | Contradicts the consumer sentence (R01). |

The supplier READMEs of JacobianChallenge, FormalLaurentPuiseux and LocalFieldsRamification are unchanged on main since `eaf17b10`: only their `PROGRESS.md` and `STATUS.md` moved. Review ~60's resolution of those three supplier contracts therefore stands. The same holds for the unchanged consumers EllipticCurves, EtaleCohomologyFoundations (lines 49 and 308–313, Layers 8 and 12) and AbhyankarLemma (line 97).

Ownership against open roadmaps by vocabulary (CanonicalModelsAndGonality, JacobianChallenge, FunctionFieldArithmetic, HyperellipticCurves) is untouched text: review ~59's audit is carried.

### Pinned declarations opened (Tau Ceti `2fd255d997`)

| Declaration | File and line | Use here |
|---|---|---|
| `TauCeti.finite_algEquiv_of_two_le_genus` | `FieldTheory/FunctionField/Automorphism/HigherGenus.lean:124`, `[IsAlgClosed k]` at :57 | Assumes algebraically closed `k` and gap injectivity; strictly narrower than both headlines, as the module docstring says. |
| `TauCeti.infinite_algEquiv_of_genus_eq_one` | `Automorphism/Elliptic.lean:227` | Genus-one infinitude over algebraically closed `k`; supports the docstring's load-bearing remark. |
| `TauCeti.IsEllipticFunctionField.infinite_algEquiv` | `Automorphism/Elliptic.lean:217` | Perfect `k` with infinitely many degree-one places; this is the docstring's elliptic curve over `ℚ` with a point of infinite order. |
| `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat` | `AlgebraicGeometry/Curves/TwoChartModel/AntiEquivalence.lean:397` (proper version :296) | `RegularProjectiveCurveCat k ≌ (FunctionFieldCat k)ᵒᵖ`, as cited in §12C and the module docstring. |
| `TauCeti.genus_eq_genus_add_finsum_singularityDegree` | `ConstantExtension/Genus/Change.lean:413` | Cited in §8.5 and the docstring. |
| `TauCeti.Place.traceResidue_coord_smul_eq_repartitionDualComponent` | `Differential/Independence.lean:275` | See remark 2. |
| `TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating_eq` | `Differential/Independence.lean:253` | See remark 2. |
| `TauCeti.Place.ramificationIdx_eq_of_pow_eq`, `TauCeti.Place.differentExponent_add_one_eq_of_pow_eq` | `Different/Radical.lean:259, 269`; standing binders :69–73 | See remark 1. |
| `TauCeti.two_mul_genus_eq_of_pow_eq_of_squarefree` | `Radical/Genus.lean:337` | The superelliptic special case over `k(x)`; §10.6's Kummer genus formula is more general, so this is not a duplicate. |
| `TauCeti.AlgebraicGeometry.projectivePlaneCurve.genus_eq` | `AlgebraicGeometry/Curves/PlaneCurve/Genus.lean:135` | Scheme-side genus; §10.5 states and cites the function-field form. |

### Headline theorems

The headline inventory is unchanged. The module docstring (`Suggested.lean:15–44`) names the pinned results. The two stated headlines are general automorphism finiteness under positive geometric genus, and its perfect-field case.

### Seeded sample and sources

None of the fifteen seeded targets (§§0.5, 3.4, 4.1, 5.3, 5.5, 5.7, 6.1, 7.1, 7.4, 8.1, 8.7, 9.3, 11.2, 11.3, 11.4) lies in the changed lines. I still reread each and computed rows A1–A16 below. The README flags no locator as unverified.

I checked the §11.4 and `Suggested.lean` locators into Rosenlicht 1955 against `Rosenlicht1955`. Printed pages equal PDF pages (Trans. AMS 79, pp. 1–11).

| Locator | Where it is | Result |
|---|---|---|
| §2, first Lemma, pp. 2–3 | starts at `Rosenlicht1955` line 54, page 2 | correct |
| §2, second Lemma, pp. 3–4 | starts at line 107, page 3 | correct |
| §2, Theorem, p. 4 | line 140, page 4 | correct |
| §3, p. 5 | lines 188–212 | correct |

The §3 passage gives the separable-generation corollary, then the genus comparison with equality without singular places or for separable `k′`, then the conclusion that `k̄K` is rational in the exceptional case. That is exactly the genus-positive form of the headline, including the drop to genus one.

### Adversarial table: rows computed this round

| # | Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| A1 | §0.5 weak approximation, Prop. 1.3.3 | `k(X)`, `P₀, P₁`, targets `0`, orders `1, 2`; `X² + 1 / ℚ`; `𝔽₂(X)` | `f = X(X − 1)²`: `ord₀ f = 1`, `ord₁ f = 2`. `ord · deg = 1 · 2 = 2 = [ℚ(X) : ℚ(X² + 1)]`. Rational places of `𝔽₂(X)`: `0, 1, ∞`, i.e. 3, while `X² + X + 1` gives a degree-2 place | holds | none |
| A2 | §3.4 Riemann, genus | `k(X)`; `ℂ(X)/ℝ`; `y² = x³ − x / ℚ` | `ℓ(nP∞) = n + 1 = deg + 1 − 0` for `n ≥ 0`, and `ℓ(−P∞) = 0 = −1 + 1`. Over `ℝ`: `ℓ(nP∞) = 2n + 2`, `deg = 2n`, so `deg − ℓ + 1 = −1`, the genus truncates to `0` and `2n + 2 > 2n + 1`. Cubic: `ℓ(nO) = n = n + 1 − 1` for `n ≥ 1`, but `ℓ(0) = 1 ≠ 0` | holds; exact constants load-bearing | none |
| A3 | §4.1 filtration | `D = −P∞`, zero repartition; `1/X` at `P_X` | Multiplicative condition: `v(0) = 0 ≤ exp(−1)`, so it lies in `A(D)`; the additive condition with junk `ord 0 = 0` gives `0 ≥ 1`, false. `ord_{P_X}(1/X) = −1 ≥ −1`, so it lies in `A(P_X)`; `−1 ≥ 0` fails, so not in `A(0)` | holds | none |
| A4 | §5.3 strong approximation | `S` = all places of `k(X)`; all but `P∞`; cubic, all but `O` | Regular everywhere ⇒ constant, so `ord_{P_X} ∈ {0, ∞} ≠ 1`. `x = X` works with `ord_P X ≥ 0` at finite `P`. `ℓ(P + 2O) = 3 > ℓ(2O) = 2`, so a simple pole at `P` is attained | holds | none |
| A5 | §5.5 Clifford, infinite `k` | `D = 0, W`; `(x)∞` on `y² = x⁵ − 1`; `P` on non-hyperelliptic `g = 3` | `2 ≤ 2`; `2g ≤ 2g`; `ℓ = 2` (`1, x`) gives `4 ≤ 4`; `ℓ(P) = 1` gives `2 ≤ 3` | holds | none |
| A6 | §5.7 local components | `ω(1)`; `k(X)` at `P_X`, `P_{X²+1}/ℚ`; `η` | `Σ ω_P(1) = ω(1) = 0`; residue fields `k`, `ℚ(i)` of degrees 1, 2; `(η) = −2P∞`, degree `−2 = 2·0 − 2` | holds | none |
| A7 | §6.1 `e`, `f` | `y² = x` (char ≠ 2); `ℝ(x) ⊂ ℂ(x)` | `P_x`: one place, `e = 2`, `f = 1`, `Σ ef = 2`. `P_{x−1}`: `y = ±1`, two places, `Σ = 2`. `P∞` of `ℝ(x)`: `e = 1`, `f = 2`, `Σ = 2 = [ℂ(x) : ℝ(x)]` | holds | none |
| A8 | §7.1 different | `y² = x`; `y² + y = x³ / 𝔽₂` | `d = 1 = e − 1` at both ramified places: `−2 = 2(−2) + 2`. At `∞`, `m = 3`: `d = (2 − 1)(3 + 1) = 4 > e − 1 = 1` | holds | none |
| A9 | §7.4 Hurwitz | cubic over `ℚ`; `y² = x⁵ − 1`; `y² + y = x³ / 𝔽₂`; `k(y)/k(y^p)` | `0 = −4 + 4`; `2 = −4 + 6`; the tame count `−4 + 1 = −3` is odd against an even left side; `Tr(yⁱ) = 0` for `0 < i < p` and `Tr(1) = p = 0`, so the trace is identically zero | holds | none |
| A10 | §8.1 items 1–2 | `ℂ ⊗_ℝ ℂ(x)`; `y^p = a + b x^p / 𝔽_p(a, b)`; `K = k` | `e = (1⊗1 − i⊗i)/2`: `e² = (2·1⊗1 − 2 i⊗i)/4 = e`, with `e ≠ 0, 1`. `z^p = y^p − a − b x^p = 0` with `z ≠ 0`. `k ⊗_k F ≅ F` is a domain | holds | none |
| A11 | §8.7 Hilbert's formula | `y² + y = x³` at `∞`; a tame place; fierce `V₄` | `G₀ = … = G₃ = ℤ/2`, `G₄ = 1`: `Σ = 4 = d`. Tame: `Σ = e − 1 = d`. Fierce (carried C21): `Σ = 3 ≠ d = 2`, excluded by the residue hypothesis | holds | none |
| A12 | §9.3 comparison, residue theorem | `dx` on the cubic; `x dx/(x² + 1)` on `ℚ(x)`; `dx/x` | `(dx) = −4O + (P₀ + P₁ + P₋₁ + O) = div y`, degree `0`. Residue `i/(2i) = 1/2`, trace `1`; at `∞`, `−1`; traced sum `0`, untraced sum `−1/2`. For `dx/x`: `1 − 1 = 0` | holds | none |
| A13 | §11.2 rigidity | Möbius fixing `0, 1, ∞`; `x ↦ 1/x`; involution of `y² = x⁵ − 1` | `(ax + b)/(cx + d)`: fixing `∞` gives `c = 0`, fixing `0` gives `b = 0`, fixing `1` gives `a = d`, so the identity. `1/x` fixes only `±1`, two places. The involution fixes `6 = 2g + 2` places | holds | none (remark 3) |
| A14 | §11.3 Weierstrass weights | `y² = x⁵ − 1`, char 0; Klein quartic; `y³ + y = x⁴ / 𝔽̄₃` | Gaps `{1, 3}`: `w = 0 + 1 = 1`, and `6 = 2³ − 2`. `24 = 3³ − 3`. `⟨3, 4⟩` has gaps `{1, 2, 5}`, `5 − 2 ≡ 0 mod 3`, and `p = 3 < 2g − 1 = 5`, so the hypothesis excludes it | holds | none |
| A15 | §11.4 general headline (Lean line 80) | Rosenlicht field, `p = 5`; elliptic over `ℚ` with an infinite-order point; `y² = (x³ − t)(x² − 1) / 𝔽₃(t)` | `g = 4·3/2 = 6`; with `w = y − αx`, `α^p = a`: `w^p = y`, so `x = (w^p − w)/α` and `F′ = K(w)` has genus 0: `hK` fails, consistent with infinite `Aut`. Elliptic: `g = 1`, `hg` fails, consistent with infinite `Aut`. Carried C1: `g = 2`, `g′ = 1 > 0`, finite | holds | none |
| A16 | §11.4 perfect case (Lean line 104) | `k(x)/ℚ`; `y² = x⁵ − 1 / ℚ`; Hermitian over `𝔽₉` | `g = 0`, so `hg` fails, consistent with infinite `PGL₂(ℚ)`. `g = 2`: finite. Hermitian `g = 3`: `\|PGU₃(3)\| = 27·28·8 = 6048`, finite | holds | none |
| A17 | README 74–75, 2397–2402 (consumer sentences) | SchemeAndStackFoundations and AlgebraicVectorBundles on main versus at `eaf17b10` | SchemeAndStackFoundations names AlgebraicCurves on 8 lines (133, 135, 137, 263, 4780, 4850–4852), with 0 in §4.15 and line 135 "not an input"; at `eaf17b10` it had supplier lines 422 and 5030. AlgebraicVectorBundles: 1 mention (157), against line 408's "supplies divisors and Riemann–Roch" at `eaf17b10` | false at this head | R01 |

### Adversarial table: rows carried from review ~60

Every statement these rows test is unchanged since `c8821a4`, so each row is carried from [review ~60](PRREVIEW-AlgebraicCurves~60.md), "Adversarial table", which itself carried review ~59's computations. These values were not recomputed this round.

| Row (review ~60) | Statement | Values as computed there | Result |
|---|---|---|---|
| T1 | §0.1 predicate | `[k(X) : k(X² + 1)] = 2`; `trdeg k(X, Y) = 2` and `trdeg ℚ(i) = 0` fail; `[ℂ(X) : ℝ(X)] = 2` | holds |
| T2 | §3.2 product formula, `Cl⁰` | `1 − 1 = 0`; `2 − 2 = 0`; `ℓ(P − O) = 0` on the cubic; `ℓ(0) = 2` over `ℝ` without exactness | holds |
| T3 | §3.5 `k(X)` divisors | `deg (f)∞ = 2 = max(2, 1)`; `ℓ(2P∞) = 3`; `L(P_X − P∞) = k·X⁻¹` | holds |
| T4 | §4.2 quotient dimensions | `dim 𝔪⁻¹/𝔪⁰ = 2` at `X² + 1`; `dim = n + 1` | holds |
| T5 | §4.4 Riemann–Roch | `n + 1 = n + 1 + 0`; `0 = −1 + 1`; `W₀ = 0` gives `1 ≠ 2` | holds |
| T6 | §5.1 `deg D ≥ 2g − 1` | `ℓ(W) = g ≠ g − 1`; `(x)∞ = 2O`, `(y)∞ = 3O` | holds |
| T7 | §5.6 class number | `h = 4 = 3 + 1 − 0` for `y² = x³ − x / 𝔽₃`; three rational places on `𝔽₂(x)` | holds |
| T8 | §6.1 `e`, `f` | `ord_{P′}(x) = 2`; `efr = 2`; `e = 1`, `f = 2` at `∞` | holds |
| T9 | §7.2 Dedekind | `d = 1 = e − 1`, `0 = −4 + 4`; Artin–Schreier `d = 4 ≥ e = 2` | holds |
| T10 | §8.11 genus bounds | `f = p` at `(t − s)`, `e = p` at `(t)`; Riemann bound `2`; plane bound `1 = g` | holds |
| T11 | §10.1 elliptic | `Δ = 64`; `b₆ = 4a = 0`; `x³ − t`: `Δ = 0`, `g = 1` | holds |
| T12 | §10.5 plane curves | `g = 3, 1, 0`; nodal cubic `g = 0 ≠ 1` | holds |
| T13 | §11.3 weights | `6 = 2³ − 2`; `24 = 3³ − 3`; `⟨3, 4⟩` gaps `5 − 2 ≡ 0` | holds |
| T14 | §11.5 Hurwitz bound | `1/42`; `1/24`; `\|Aut\| = 24 ≤ 84` | holds |
| T15 | §11.6 Hermitian | `q³` translations; `68921 > 68796`; `6048` | holds |
| N1–N3 | §8.1 items 1–2 | `z^p = 0`, `[F : kF^p] = p²`; idempotent in `ℂ(x) ⊗_ℝ ℂ`; `i ∉ ℝ` load-bearing | holds |
| N4–N8 | §11.4 steps 1, 3, `p`-th-power lemma | two primes without exactness; `g = 2`, `g′ = 1`; `det = 1 = 1^p`; `r(t + a) = r(t)` | holds |
| N9 | §9.2 residue Check | `d(cx⁻³) = 0` at `p = 3`; `x⁻⁵dx = d(x⁻⁴)` at `p = 5` | holds |
| N10 | `Suggested.lean:27` | separability binder at `Genus/Basic.lean:267` | agrees |
| S1–S8 | §§0.2, 0.3, 1.2, 7.4, 8.4, 8.10, 9.3, 10.2 | e.g. `2 = −4 + 6`; `2·2 ≤ 2 + 2`; `e = lcm(2, 3) = 6`; `div x = 2P₀ − 2O` | hold |
| C1, C2 | both Lean headlines | `g′ = 1`, `\|Aut\| ≤ 12`; `y⁵ − y = a x⁵`, `g′ = 0`, infinite; `6048`; `g = 2` | true |
| C5–C25 | §§11.4 step 2, 2.3, 6.3, 1.1, 3.1, 3.4, 4.1, 4.2, 5.1, 5.2, 5.7, 6.1, 7.2, 8.7, Layer 6, 8.1/12B.0, 10.1, 8.11, 11.6 | e.g. `2n − 2(n + 1) + 1 = −1`; Hilbert sum `4 = d`; fierce `V₄` sum `3`, `d = 2`; `68921 > 68796` | hold |
| ~60 supplement | §§2.2, 3.1, 4.3, 5.4, 6.2, 6.4, 8.5, 8.10, 10.4, 11.1 | `ord₀ X = 1`; `div(i) = 0`; `div(Xη) = P₀ − 3P∞`; gaps `{1, 3}`; `2·1 = 2·1`; `z² = x − 1`, `e = 1`, `f = 2`; `δ = 1`; `4·1 = 2·2`; `(5 − 1)/2 = (6 − 2)/2`; `#PGL₂(𝔽₂) = 6` | hold |

### Remarks on untouched text (no change requested in this review)

1. §10.6, line 1863, calls the general-`n` Kummer equality "a target here". The pinned `TauCeti.Place.ramificationIdx_eq_of_pow_eq` and `differentExponent_add_one_eq_of_pow_eq` (`Different/Radical.lean:259, 269`) already prove it for every `n` invertible in `k`, without (c) or (d).
2. §9.3, lines 1643–1646, asks to prove two results that the pin already has: that `μ` does not depend on `x` (`kaehlerDifferentialEquivWeilDifferentialOfSeparating_eq`, `Independence.lean:253`), and that local components are trace residues (`Place.traceResidue_coord_smul_eq_repartitionDualComponent`, `:275`). The second needs only a separable `F_P/k`, not a perfect `k`.
3. §11.2's third Check (line 1948): the six branch places of `y² = x⁵ − 1` are rational only when `k` contains the fifth roots of unity. Over `ℚ`, only `x = 1` and `∞` are rational.
4. §6.4's first Check in characteristic 2 (raised by review ~60) is unchanged.

## Not verifiable

- `Stichtenoth2009` is settled as uncertified. The Stichtenoth locators of the sampled targets (Thm. 1.1.19, 1.3.1, Prop. 1.3.3, Thm. 1.4.17, Def. 1.5.2–1.5.3, Thm. 1.6.5, 1.6.13, Def./Prop. 1.7.1–1.7.4, Def. 3.1.5, Prop. 3.1.4–3.1.7, Def. 3.4.3, Thm. 3.4.13, Props. 3.6.1–3.6.8, Thm. 3.8.7, Thm. 4.3.2, Ex. 3.16–3.17, Rem. 1.6.9) cannot be read. The pinned docstring of `Place.traceResidue_coord_smul_eq_repartitionDualComponent` cites the same Thm. 4.3.2, which corroborates the numbering but does not certify it.
- `Hartshorne1977`, `Serre1979`, `Deuring1973`, `Goldschmidt2003`, `Rosen2002`, `VillaSalvador2006`, `Roquette1970`, `Stichtenoth1973a`, `Stichtenoth1973b` and `Liu2002` are also settled as uncertified and are kept by locator only. None was refetched.
- Ownership against open pull requests was checked only for the overlap facts and the conflicting revisions #1808 and #1854. The wider vocabulary audit is carried from review ~59, because the text it covers is unchanged.

## Source issues

- none
