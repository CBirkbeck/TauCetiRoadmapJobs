# Review of GlobalHolomorphicFunctions (pull request #992 at 164c2fb)

**Verdict:** needs changes

This is an incremental re-review of the 45 lines that changed since `8f130d7`. All of them are in `README.md`; `Suggested.lean` is unchanged.

The change repairs the previous R02 (the sign of the pole residue in 6.5) and does not introduce any new defect. Two earlier findings are still open because neither the description of #992 nor #1234 has changed: R01 (P2) and R02 (P3).

## R01 (P2) — ComplexKahlerGeometry at the head of #1234 still claims three objects this roadmap owns

This finding is carried from R01 of the previous review.

**Location.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:74`–77: "ComplexKahlerGeometry K2 owns parameter-dependent solvers … they consume this roadmap's scalar results (… the finite-rank Runge operator of Layer 2.5) and the complex two-form exactness of Layer 7.2." `:2539`–2542 makes the same claim.

**Claim.** K2 and K5a consume three targets from this roadmap and do not own them:
- the finite-rank Runge operator of 2.5 (`exists_finite_rank_runge_operator`, `Suggested.lean:177`);
- the scalar solver of 7.1 (`exists_smooth_conjWirtingerDeriv_eq`, `:290`);
- the complex two-form exactness of 7.2 (`exists_mextDeriv_eq_complex_two_form`, `:327`).

**Witness.** #1234 is still at `e86d496`.
- Its `README.md:598`–599 says "The finite-rank operator and its estimate are this roadmap's own".
- Its `:612`–613 says "Prove Runge's theorem for (Ω,K) in the form used here".
- Its `:1935` says "passage from the scalar solver to two-forms is this roadmap's own".
- No line of that README cites GlobalHolomorphicFunctions (`grep -c` gives 0).

**Repair.** The repair is the one the previous review gave.
- This README needs no change. On main, ComplexKahlerGeometry consumes all three targets from here (main `README.md:35`, `:199`–200, `:1637`), and a revision is never a supplier.
- Add this sentence to #992's description: "#1234 (ComplexKahlerGeometry) is rebased on this pull request and merges after it. It restores main's citations of Layer 2.5's finite-rank operator, Layer 7.1's scalar solver and Layer 7.2's complex exactness."
- In #1234, replace three things with citations of Layers 2.5, 7.1 and 7.2:
  - K2.FiniteRankRunge's own operator and its Runge proof;
  - the point case of its solver, which K5a takes as its scalar input;
  - the "this roadmap's own" passage in K5a.PlanarTwoForms.

**Test.** `roadmaps grep -i 'finite-rank Runge'` currently lists #1234 as an owner (`README.md:44`, `:351`, `:591`). After the repair it should list #1234 only as a consumer.

## R02 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

This finding is carried from R03 of the previous review. The description has not changed.

**Location.** The description of #992 contains:
- "- [ ] depends on: #886";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions";
- "twenty-eight intentional proof-target admissions";
- "The route does not consume the cotangent identity or sine product as an input";
- in the `merge-order` block, "#886 (DifferentialGeometry) → **this pull request** (#992)".

**Witness.**
- `README.md:27` says "DifferentialGeometry is not a supplier". DifferentialGeometry is on main, so #886 is a revision and cannot be a dependency.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- Elaboration gives 23 `sorry` warnings, not 28.
- 6.1 (`README.md:1840`–1845) consumes `cot_series_rep` and the sine product.

**Repair.**
- Delete the #886 task line. The `depends-on` and `merge-order` blocks are generated from it.
- Delete five passages:
  - the one on `ProductCotangentTargets.lean`;
  - the "GH4 adds an independent paired-cotangent proof" paragraph;
  - the 28/18 admission counts;
  - the ZerosOfLFunctions #253 coordination paragraph;
  - "General primary factors and products belong here". `README.md:43`–46 gives them to AnalyticNumberTheoryPartI §0.15.
- Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.
- Add the #1234 sentence from R01.

**Test.** The dependency check reports `0 problem(s)`, so after the repair the `depends-on` block is empty.

## Previous findings

- R01 — not repaired: `README.md:74`–77 is unchanged, and so are #1234 (`e86d496`, `README.md:598`–599, `:1935`) and #992's description. Carried as R01.
- R02 — repaired: 6.5 (`README.md:2216`–2220) now reads "`f(z)=(z−a)^k g(z)` for `z≠a` near `a` … where `k=m` at a zero of order `m` and `k=−m` at a pole of order `m`, gives `f′/f = k/(z−a) + g′/g`". The Check for `1/(z−1)²` (`:2234`–2235) is added. The repair introduced no new problem.
- R03 — not repaired: the description still contains "- [ ] depends on: #886", the `ProductCotangentTargets.lean` passage and "twenty-eight intentional proof-target admissions". Carried as R02.

## Verified sound

### Gate, build and Lean form

- **Gate.** I ran it myself at 164c2fb. Every counter is 0, it ends with `OK` and exits 0 (5.2 s). The worker's run, which includes the targeted build, also passed every check.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` exits 0. The only messages are 23 `sorry` warnings, at lines 53, 68, 95, 114, 132, 152, 164, 177, 195, 205, 214, 222, 236, 248, 261, 273, 290, 299, 310, 327, 335, 343 and 350. These are the same lines as in the previous review.
- **Unchanged Lean file.** `Suggested.lean`, `lake-manifest.json` and the pins did not change in `8f130d7..164c2fb`. The previous review's checks of this file therefore still hold:
  - the `#check @name` comparison of all 25 declarations, which found no binder lost (`scratch/signatures.md` agrees);
  - the one-tactic padding probe, which closed none of the 23 theorems;
  - the headline list: Looman–Menchoff, Laurent, the sharp product bound, the genus-one products, Runge, the hull and the finite-rank operator, the divisor theorems, noncontinuation, Mittag–Leffler, Cauchy–Pompeiu, the solver and the closed completions, exactness, `H²_dR = 0`, and Cousin I.

  The diff changes no headline or Summary sentence.
- **Dependency check.** It shows no UPWARD, CYCLE or `moved:` line. The merge order lists ZerosOfLFunctions at line 48, AnalyticNumberTheoryPartI at 50 and GlobalHolomorphicFunctions at 97.

  ```text
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

### The changed passages, checked at the pins and in the source

**Tau Ceti declarations (3 opened).**
- `TauCeti.Contour.residue` (`TauCeti/Analysis/Contour/Residue/Basic.lean:80`) is a `dite` on `MeromorphicAt f z₀ ∧ meromorphicOrderAt f z₀ < 0`, with `else 0`.
  - This matches `README.md:285`–287: the coefficient of degree −1 at a pole, and 0 otherwise.
  - The case "otherwise" includes an essential singularity. At such a point the residue is 0 even when the Laurent coefficient of degree −1 is not (see the `e^{1/z}` row below). No passage of the README applies it there.
- `TauCeti.Contour.residue_logDeriv_eq_meromorphicOrderAt` (`Residue/LogDeriv.lean:63`) takes `(hf : MeromorphicAt f z₀)` and `(hn : meromorphicOrderAt f z₀ = (n : WithTop ℤ))`.
  - These are exactly the hypotheses stated at `README.md:288`–290 and `:2214`–2215.
  - Order `⊤` is excluded by the type of `n`. `:294` says this.
- `TauCeti.Contour.logDeriv_eventuallyEq_principalPart` (`Argument/Principle.lean:97`) gives `g` with `AnalyticAt ℂ g s`, `g s ≠ 0`, and `logDeriv F =ᶠ[𝓝[≠] s] n·(z−s)⁻¹ + logDeriv g`. This matches `:292`–294 and `:2216`–2219.

The three module paths in the README exist at the pin. `roadmaps grep` finds the residue theorem cited only as a consumer: here, and in ZerosOfLFunctions on main (`README.md:201`, `:1225`) and its open revisions. No roadmap claims it, so the change creates no duplicate owner.

**Rainer locators (5).** Printed pages are PDF pages minus 6.
- Theorem 8.2 is at rainer line 941 (p. 18). Its proof is at lines 959–965 (p. 19, running head "8. THE RESIDUE THEOREM 19"), and lines 963–964 treat the pole case with residue `−m`. 6.5's "pp. 18–19, rainer lines 941 and 959–964" is correct.
- The four new entries of the References list are correct, and each is cited in the body:

  | Entry | Rainer line | Printed page | Cited in the body at |
  |---|---|---|---|
  | equation (10.1) | 1211 | p. 23 | `README.md:481`, `:2480` |
  | Exercise 22 | 1592 | p. 30 | `:2041` |
  | Lemma 15.1 | 1934 | p. 36 | `:1529` |
  | Theorem 8.2 | 941 | pp. 18–19 | `:2219` |

  The list still lies within "rainer lines 674–2136".

**Seeded sample.** Of this round's 15 targets, only 6.5 falls in the changed text, and it is checked above. The previous review verified the locators of 0.2, 0.3, 1.1, 2.2, 3.2, 6.1, 6.2, 7.2 and 7.3 against the cached texts. I also checked three more:
- 1.4: proof of Proposition 14.2, rainer lines 1843–1853, p. 35. It contains the monomial-expansion comparison.
- 1.5: Theorem 14.3, rainer line 1868, pp. 35–36.
- 3.3 and 7.1: Theorems 15.5 and 12.2 at lines 2086 and 1630.

2.4 cites no external source, only Mathlib and Tau Ceti.

**Remark on untouched text** (no change requested). 6.1 still lists among its own targets the residue 1 of the paired cotangent series at each integer and of `−π tan(πz)` at each half-integer (`README.md:1849`, `:1854`). Both values follow in one step from the newly cited Tau Ceti theorem, applied to `sin(πz)` and `cos(πz)`; the computed residues are 1.0000000 each. 6.1 could cite it.

### Adversarial pass

`S` is `Suggested.lean` and `R` is `README.md`. The rows marked "(r18)" are carried from the previous review (`PRREVIEW-GlobalHolomorphicFunctions~18`), which computed their values on the same statements, now unchanged. All other rows were computed this round with my own scripts: circle integrals use 400–20000 nodes, and the reciprocal-Gamma logarithmic derivative is the Weierstrass series truncated at 2·10⁴ terms plus a tail correction.

**New rows: the changed statements and three sampled targets.**

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| R Tau Ceti `residue` description (`:285`–287) | `1/z²+3/z` at 0; `e^z` at 0; `e^{1/z}` at 0 | `(2πi)⁻¹∮` gives 3.0000000, matching the residue 3; 0, matching the `else 0` branch; the Laurent `a₋₁` is 1.0000000, but `e^{1/z}` is not meromorphic, so Tau Ceti gives 0, as "0 otherwise" says. A model "Laurent coefficient at any isolated singularity" would give 1 | Pass | none |
| R `residue_logDeriv_eq_meromorphicOrderAt` description (`:287`–291, `:294`) | `(z−1)²(z+2)` at 1; `z³/(z−2)` at 2; `e^z` at 0; `f=0` | 2.0000000 = k; −1.0000000 = k; 0.0000000 = k ("regular nonzero point"); for `f=0` the order is `⊤`, so `n : ℤ` cannot match, as `:294` excludes | Pass | none |
| R `logDeriv_eventuallyEq_principalPart` description (`:292`–294) | `1/(z−1)²` (`k=−2`, `g=1`) at `0.3+0.7i` | finite-difference `f′/f = 1.4285714+1.4285714i`; `k/(z−1)+g′/g = 1.4285714+1.4285714i`; with `+2` instead, `−1.4285714−1.4285714i` | Pass | none |
| R 6.5 derivation (`:2212`–2221), both signs | zero of order 2 at 1; pole of order 2 at 1; `sin(πz)` at 0 | +2.0000000 (`k=m`); −1.9999999 (`k=−m`); 1.0000000, the residue of `π cot(πz)` | Pass (repairs r18's R02) | none |
| R 6.5 Check `1/(z−1)²` (`:2234`–2235) | `1/(z−1)²` at 1 | residue of `f′/f` is −1.9999999 ≈ −2; the wrong model `+2/(z−1)` gives +2 | Pass | none |
| R 6.5 Check Γ (`:2236`–2238) | z = 0, −1, −2 | residue of `logDeriv(1/Γ)` is 1.0000000 at each, so that of `Γ′/Γ` is −1.0000000. Sanity check: the same series gives `ψ(1) = −0.5772157 = −γ` | Pass | none |
| R 6.5 *Needs:* (`:2242`) | the Tau Ceti theorem at the pin | `Residue/LogDeriv.lean:63`; its hypotheses are `MeromorphicAt` and an integer order, which are 6.5's "local meromorphic orders" | Pass | none |
| R Scope sentence (`:92`–96) | which layer consumes the new supply | 6.5 consumes the Tau Ceti residue theorem; Layer 1 consumes the majorant; no layer restates either | Pass | none |
| R References, Rainer (`:2557`–2565) | Thm 8.2; (10.1); Ex. 22; L15.1 | lines 941/959, 1211, 1592, 1934 lie on PDF pp. 24/25, 29, 36, 42, i.e. printed pp. 18/19, 23, 30, 36, as listed | Pass | none |
| R 1.5 Check `X=ℕ` (sample) | `u_n(x)=1/(n+1)·[x=n]` | uniform product error 0.5, 0.090909, 0.009901 at N = 1, 10, 100, equal to `1/(N+1)`; `Σ_{n<100} sup|u_n| = 5.1874`, which diverges | Pass | none |
| R 2.4 Checks (sample) | unit circle, reversed circle, twice the circle | `∮dz/z = 6.2831853i`, reversed `−6.2831853i`; twice the circle `12.5663706i`, of norm 12.5663706 = `|2|·2π·1`; with `f−g=1` the value is 6·10⁻¹⁶ ≤ 2π | Pass | none |
| R 3.3 stages (sample) | unit disc, `D_n` | `D_n` has radius 0, 0.5, 0.6667, 0.9 for n = 1, 2, 3, 10, at distance 1, 0.5, 0.3333, 0.1 ≥ 1/n from the circle; points of level n ≥ m avoid `D_m ⊆ D_n` | Pass | none |

**Carried rows (r18): the 39 rows for statements the diff leaves untouched.**

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| S Looman–Menchoff (0.2) (r18) | `z²` at `1+i`; `z̄`; `exp(−z⁻⁴)`; `Ω=∅` | `f_y=−2+2i=i f_x`; `−i` against `+i`, excluded by `hline`; `|f| = 11.489, 64.388, 2244.077`, excluded by `hcont`; vacuous | Pass | none |
| R 0.2 balanced estimate (r18) | `[0,20]×[0,1]`, E the corners | 198.0100 against `5N·m = 100`; excluded by the ratio bound | Pass | none (source issue) |
| R 0.3 normalization (r18) | `ψ=(1−r²)³`; kernel on the disc | `∫₀¹ψ′ = −1 = −φ(0)`; `∫|ζ|⁻¹dA = 6.283185 = 2π` | Pass | none |
| S Laurent, annulus (0,1) (r18) | `1/(z(z−1))`, ρ=1/2 | `a_{−3..2} = 0,0,−1,−1,−1,−1`; `fp+fm = −3.6284470+1.1611030i = f`; `fm(5) = −0.2` | Pass | none |
| S Laurent, annulus (1,∞) (r18) | same f, ρ=3 | `fp=0`; `fm(2) = 0.5 = f(2)` | Pass | none |
| Wrong Laurent models (r18) | ρ=0; ρ=2; `1/z = 1+(1/z−1)` | `fp+fm=0≠f`, excluded by `hρ₁`; divergence at 0.5, excluded by `hρ₂`; `1/z−1 → −1`, excluded by the cocompact limit | Pass | none |
| R 0.4 essential singularity (r18) | `e^{1/z}`, ρ=1 | `a_{−3..1} = 0.166667, 0.5, 1, 1, 0`; `fm(2) = 0.6487212` against 0.6487213 | Pass | none |
| R 0.4 order Check (r18) | `(z+1)/z²`; `z⁻³+z` | order −2; order −3 | Pass | none |
| R 1.1 derivatives (r18) | `E₂′(−1)`; `E₁′(1)`; `log‖E₁(1/2)‖` | −0.6065307; −2.7182818; −0.193147 ≤ 0.25 | Pass | none |
| S genus-one product (r18) | `S={n²}` at 2+i; `S={1}`, m=2; `S=∅` | `−0.4312778−9.3328073i` on both sides; 0.6795705 = e/4; F=1 | Pass | none |
| S genus-one product of divisor (r18) | `2[1]`; `[1]−[2]`; `D 0=1` | divisor 2; excluded by `hD`; excluded by `hDzero` | Pass | none |
| S sharp bound 1.4 (r18) | 20000 random families; `ℤ₃`, `u=(3,3)`; norm `2|z|` | max(lhs−rhs) = 2.2·10⁻¹⁶; 0.3333 ≤ 0.7778; 6 ≤ 8 | Pass | none |
| S `holomorphicHull`, hull = fill (r18) | `{2≤|z|≤3}` in `D₄` and in `{1<|z|<4}`; ∅ | 0.667 > 0.5, so the hull is K; the closed 3-disc; ∅ | Pass | none |
| R 2.1 polynomial-hull comparison (r18) | unit circle; ℝ | both hulls are the closed disc; the hull of ℝ is ℝ, the polynomial hull is ℂ | Pass | none |
| R 2.1 stages (r18) | unit disc | radii 0, 0.5, 0.6667 | Pass | none |
| R 2.2 metric (r18) | constants 1 apart; `1/(n+1)` | 0.5; `1/(n+2)` | Pass | none |
| R 2.3 `O(K)` not closed (r18) | `Σzⁿ/(n+1)²` | 1.238, 3.078, 5.281 | Pass | none |
| S Runge iff approximation (r18) | annulus in `D₄`, `1/z`; ∅ | `6.2831853i` against 0; both sides true | Pass | none |
| R 2.5 polynomial specialization (r18) | unit circle | all three conditions fail (`2πi` against 0) | Pass | none |
| S finite-rank Runge operator (r18) | unit disc in ℂ, collar of radius 1.6, 60 nodes | ratios 1.90e−11, 1.49e−11, 2.48e−13, 1.70e−11 | Pass | owner (R01) |
| S zero-free approximation 3.1 (r18) | `{1≤|z|≤2}`, `u=z−1/2` | 0.6065307, 0.5134171, 0.5000412 → 0.5; windings 1, 0 | Pass | none |
| S zero orders, signed divisor 3.1 (r18) | `z²/(z−1)`; m=0 | 2.000000 and −1.000000; f=1 | Pass | none |
| S boundary noncontinuation 3.2 (r18) | `sin(1/z)` on `ℂ∖{0}`; ∅, ℂ | zeros 0.31831, 0.03183, 0.00318 → 0, `f(2/π)=1`; vacuous | Pass | none |
| S Mittag–Leffler 4.1 (r18) | `E=ℤ`, `π cot πz` at i | −3.1533481i against −3.1533471i | Pass | none |
| S isolated singularities 4.1 (r18) | `1/z+1/(z−1/2)` on `B(0,1/2)`; `e^{1/z}` | remainder value 2 at 0, analytic; 0 | Pass | none |
| S quotient (r18) | `cot` | `(cos, sin)`, with sin ≠ 0 off ℤ | Pass | none |
| S Cauchy–Pompeiu 6.4 (r18) | `D(0,1)∖B̄(0.4,0.3)`, `f=z²z̄+z̄²` | formula `0.1100000+0.1259682i` = `f(ξ)`; reversed sign gives `−1.2803843+0.0572953i` | Pass | none |
| R 6.4 boundary cycle (r18) | annulus, reversed, overlapping holes | 2; 0 and 1; −1 | Pass | none |
| R 6.1 tangent and products (r18) | `0.3+0.2i`; 1/4; 1; `cos(πz)`; `1/Γ(1/2)` | `−1.8790445−3.1898155i` against `−1.8790430−3.1898145i`; −3.1415914; ≈0; product matches; 0.5641896 against 0.5641898 | Pass | none |
| R 6.2 theta and `e^z−1` (r18) | r=1/2; `0.9+2.1i`; z=2πi | ratio `= r⁻¹e^{−z}`; products agree to 10⁻⁶; zero factor | Pass | none |
| R 6.3 substitution (r18) | `z↦−iz` | `−i·i = 1`, `−i·1 = −i` | Pass | none |
| S solver 7.1 (r18) | `zz̄²`; `ze^{−|z|²}` | `0.438−1.168i = 2f`; `∂̄u = 0.367879` | Pass | owner (R01) |
| S closed completion (r18) | `f=z̄z²`, `g=zz̄²` | 2.92 = 2.92 | Pass | none |
| S closed completion form (r18) | `f=z`, `g=z̄`; `g=0` | 1−1 = 0; −2i | Pass | none |
| S complex two-form 7.2 (r18) | `η=z̄ dz∧dz̄` | `−1.6−0.6i` = η; the wrong sign gives `+1.6+0.6i` | Pass | owner (R01) |
| S real two-form 7.2 (r18) | `h=1+x²` | 1.09 = h; swapped −0.12 | Pass | none |
| S `H²_dR = 0` (r18) | U=ℂ; `dθ` | `dx∧dy` exact; closed is not exact in degree 1 | Pass | none |
| R 7.3 coordinate examples (r18) | disc moments; `d(iz²)`, `d(i|z|²)` | 3.141593, 0, 1.570791, … against `π/(m+1)`; `2i, 2i`; `−2, 0` | Pass | none |
| S Cousin I 7.4 (r18) | slit cover of `ℂ∖{0}`; one-set cover | `b₁−b₂ = 1, 1, 0, 0`; `3c₁₁ = 0` | Pass | none |

The r18 row "R 6.5 residues" is replaced by the five 6.5 rows above. The 51 rows cover the 15 sampled targets, all 23 theorems and both definitions of `Suggested.lean`, every changed statement, and every target a finding touches.

### Cross-roadmap and ownership checks this round

- **#1234 (ComplexKahlerGeometry)** is unchanged at `e86d496`; this is R01. `roadmaps grep -i 'finite-rank Runge'` also hits #848 (ComplexComparisonPartII, `README.md:762`, `:1581`). Those lines treat the operator only as a scalar input that K2 consumes, so there is no ownership conflict.
- **Main ComplexKahlerGeometry** `README.md:35`, `:199`–200 and `:1637` still consume Layers 2.5, 7.1 and 7.2 from here.
- **`scratch/overlaps.md`** lists no other pull request changing this roadmap, no dropped id and no id that only an open revision defines. `scratch/citations.md` lists nothing unresolved.
- **The five source issues** recorded in the previous report are unaffected: the diff changes none of those locators.

## Not verifiable

None. All four manifest sources (rainer, gray-morris, dlmf-4-22, dlmf-5-8) are cached and certified, and every locator checked this round was read there. Ownership against open pull requests was checked with the #1234 checkout and `roadmaps grep`.

## Source issues

- none
