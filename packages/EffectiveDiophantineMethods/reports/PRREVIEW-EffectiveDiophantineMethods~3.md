# Review of EffectiveDiophantineMethods (pull request #1046 at cc98c49)

**Verdict:** needs changes

Incremental re-review of the 145 lines changed since 2203525. The gate fails at this head on one `statement-hygiene` hit (R01); the other three findings are P3.

## R01 (P3) — `letI` in the signature of `mordellWeil_basis_of_height_and_saturation` (gate: `statement-hygiene`)

**Location:** `TauCetiRoadmap/EffectiveDiophantineMethods/Suggested.lean` line 173: "`letI : AddGroup.FG W.Point := WeierstrassCurve.Affine.fg_point_of_numberField`".

**Claim:** The gate rule allows no `letI`/`haveI` in a signature; the gate reports `statement-hygiene=1 … FAIL` at cc98c49.

**Witness:** Deleting the line fails at line 176: `failed to synthesize Module.Finite ℤ W.PointModTorsion`. With the binder below the file elaborates, twelve `sorry` warnings and nothing else.

**Repair:** Delete line 173 and write the first binder line as `(W : WeierstrassCurve.Affine ℚ) [W.IsElliptic] [AddGroup.FG W.Point]`; say in the docstring and in README §3.22 that the instance is Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`.

## R02 (P3) — Three unqualified backticked own names remain that `Suggested.lean` does not declare

**Location:** `TauCetiRoadmap/EffectiveDiophantineMethods/README.md` lines 1967–1973 ("`thueForm g x y := MvPolynomial.eval ![x, y] (Polynomial.homogenize g g.natDegree) ∈ ℤ`", "`thueSolutions g m := …`") and 2347–2359 ("`thueSmallSolutions g m Y₁` : Finset `(ℤ × ℤ)`").

**Claim:** The previous R02 listed these with the names repaired at this head; a backticked name of the roadmap's own claims a declaration of `Suggested.lean`.

**Witness:** `Suggested.lean` declares 21 names, none of `thueForm`, `thueSolutions`, `thueSmallSolutions`; the README uses them 8, 17 and 10 times (first at lines 1967, 1954, 2347).

**Repair:** As done in §3.13 and §6.7: write the form as `F(x, y)`, the solution set as `Sol(g, m)` and the small-solution set as `Sol(g, m; Y₁)` (defined once in §2.9 and §2.18), in every place the three names occur; no Lean change.

## R03 (P3) — The group under heading 6.23a both supplies §6.22 and consumes it

**Location:** README line 7402: "This group provides the model and differential basis, Hodge filtration data, Frobenius lift, functions `θ_{Z_i}` and height matrices … ; §6.22 and §§6.27–6.29 consume it."

**Claim:** A group that §6.22 consumes must not need §6.22.

**Witness:** README line 7399 (§6.22): "*Needs:* §6.23a; §6.5; …"; line 7481 (§6.23, inside the group): "*Needs:* §6.9; §6.8; §6.22; §6.23a."

**Repair:** Restore `### 6.23a First chart of X_s(13): the model and differential basis` as a section of its own, and open the group at `### 6.23 First chart of X_s(13): Hodge filtration, Frobenius lift, heights and the rational points on ]U_1[` with "This group provides the Hodge filtration data, Frobenius lift, functions `θ_{Z_i}`, height matrices `T_1, T_2` and the rational points on `]U_1[`; it uses §6.22 and §6.23a, and §§6.27–6.29 consume it." Checked: §6.22 needs §6.23a only; §§6.23–6.26 are needed by §6.27 (6.26), §6.28 (6.24), §6.29 (6.26).

## R04 (P3) — Three sentences of the pull request's description that the head contradicts

**Location:** the description, summary block and "Validation" paragraph.

**Claim:** Each quoted sentence is true of the head.

**Witness and repair, one per sentence:**

- "README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero": the README has 22 labelled Checks (lines 3683–3686, 5398–5402, 5502–5505, 5754–5758, 5831–5834, e.g. "refineClasses_empty_input."). Write "README identifiers absent from Lean, round labels and empty Lean sections are all zero", or drop the 22 labels as §6.7 now does.
- "The classical proofs follow the original reductions but start from Matveev's archimedean bound": §6.38 starts from Yu's p-adic bound alone (README lines 8136–8137, "from Yu's bound through §2.30") and §6.39 from Yu's and Matveev's (line 8204). Write "… but start from Matveev's archimedean bound and Yu's p-adic bound (the S-unit equation from Yu's alone), which changes only the first reduction scale."
- "with author-side red-team passes to follow": the branch has six red-team repair commits and two review-repair commits on this folder. Write "followed by author-side red-team passes and review repairs".

## Previous findings

- R01 — repaired: README line 8088 reads "`N_{L/ℚ}(ψ − 1) = 2`".
- R02 — partly repaired: the names of §§1.10–1.11, 2.11, 3.13, 4.17, 5.6–5.17, 6.4, 6.7, 6.10, 6.15 are prose or notation; `thueForm`, `thueSolutions`, `thueSmallSolutions` remain (R02 above).
- R03 — repaired: line 8169 "(§18Ex, table pp. 278–279)", line 8228 "§18Ex, pp. 276–278, table pp. 278–279"; lines 3537, 3557 "Mathlib `…naiveHeight_eq_logHeight₁`"; line 4285 "Tau Ceti `AbelianVariety` (module `TauCeti.AlgebraicGeometry.AbelianVariety.Basic`)".

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `mordellWeil_basis_of_height_and_saturation` (R01) | no `letI`; `[AddGroup.FG W.Point]` binder | first: synthesis of `Module.Finite ℤ W.PointModTorsion` fails; second: elaborates, 12 `sorry` warnings | binder repair works; `fg_point_of_numberField` (Tau Ceti `MordellWeil/FinitelyGenerated.lean` line 121) discharges it |
| §6.37 norm of `ψ − 1` | `f(T) = T³ − 4T + 1` | `N(ψ − 1) = (−1)³f(1) = −(1 − 4 + 1) = 2`; `(−3.1149)(−0.7459)(0.8608) = 2.000` | correct at this head |
| §6.7 `C(Ω, g, Z)` shift identity | general blocks; `Z = [[0,1],[−1,0]], c = (1,0), Ω = (0,1)` | `unipotent(c, cᵀZ, e)·C(Ω,g,Z)` has rows `(1,0,0), (Ω+c,1,0), (g + cᵀZΩ + e, (Ω+c)ᵀZ, 1)`; `cᵀZΩ = 1`, shift `1 + e` | bullets and Check agree |
| §6.10 `L_Z`, `R_Z` | `u = (1,(1,0),0), v = (1,(0,1),0)`, `Z = [[0,1],[−1,0]]`; symmetric `Z = 1` | `L_Z(u)L_Z(v) = L_Z(aa′, ab′ + a′b, ac′ + a′c + bᵀZb′)`; `u*v = (1,(1,1),1)`, `v*u = (1,(1,1),−1)`; right action row `(c, bᵀZᵀ, a)` | `R_Z` needs `Zᵀ = −Z`, as stated |
| §3.13 `Enc(W, P, n; λ⁻, λ⁺, c⁻, c⁺)` | width; `P = (2,3)` on `y² = x³ + 1`, `n = 0` | endpoints `(λ⁻ − c⁻)/4ⁿ, (λ⁺ + c⁺)/4ⁿ`, width `((λ⁺ − λ⁻) + c⁺ + c⁻)/4ⁿ`; `c⁻ ≥ log(432)/6 + 961/500 = 2.933 > log 2`, so 0 is inside | correct |
| §2.13 group sentence | consumers by `*Needs:*` | §2.16 (line 2311), §2.19 (2436), §2.20 (2475), §6.36 (8072); the group needs §§2.2, 2.3, 2.10–2.12, 0.10 only | as stated, no cycle |
| §6.5 group sentence | consumers by `*Needs:*` | §6.10 (6836), §6.11 (6879), §6.13 (6947), §6.14 (6984), §6.17 (7146), §6.22 (7399), §6.23 (7481), §6.27 (7645) | as stated, no cycle |
| §6.23a group sentence (R03) | consumers and needs | consumers §6.22, §6.27, §6.28, §6.29; member §6.23 needs §6.22 | cycle at group level |

The rows for untouched statements stand as in the previous review, of 2203525.

- Gate (worker, cc98c49): every counter 0 except `statement-hygiene=1`; `build=0`; `outside-folder=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean`, twelve `declaration uses sorry` warnings (lines 64, 84, 116, 136, 155, 192, 214, 222, 230, 241, 258, 297), nothing else. The diff changes no Lean line.
- Dependency check: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is line 180 of the merge order, after all ten open suppliers.
- Library declarations opened at the pins: Mathlib `WeierstrassCurve.Affine.Point.naiveHeight_eq_logHeight₁` (`Mathlib/NumberTheory/Height/EllipticCurve.lean` line 43), Tau Ceti `AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` line 95), `fg_point_of_numberField` (line 121).
- Cross-roadmap citations: the worker's resolve finds none missing; the diff adds no citation. The ten roadmaps of the description's dependency block are all open new-roadmap pull requests and all cited in the README; the other suppliers named are on main (RealAlgebraicGeometry under `Completed/`); ArithmeticDynamics is named as a consumer only.
- Source locators: the locators that the retitled headings carried are still in the bodies of their sections (§2.12 Lemma 1.1 pp. 103–104, §2.13 Lemma 1.2 pp. 105–106, §2.14 Lemmas 2.1–2.2 pp. 107–110, §2.15 Lemmas 2.3–2.4 p. 110, §6.8 Theorem 4.11 p. 917, §6.13 Lemma 5.5 p. 924); they were not checked against the sources again. None of the fifteen seeded targets lies in a changed passage.
- Overlap check: the closest roadmaps of `scratch/overlaps.md` (ComputationalNumberTheory, ArithmeticDynamics, AnabelianGeometryAndNonabelianChabauty; DiophantineApproximationAndTranscendence, ClassicalArithmeticCompletion, EllipticCurves; third list empty) were not read again in this round; the worker's overlap facts list no shared roadmap, dropped id or second copy, and the diff adds no object.
- Source independence: changed passages only; 5 passages (the four new titles of §§2.12–2.15 and the §2.13 group sentence) compared with 1 source (tzanakisDeWeger1989 lines 144, 293, 389), longest shared run 4 words ("linear form in logarithms"); the other changes replace identifiers by prose and correct locators; no layer added, removed or reordered, so the arrangement was not compared again.
- Remark (untouched text, no change asked here): §§2.14–2.15, 6.6–6.9 and 6.23–6.26 are now bold run-in targets under a group heading; every `§` reference to them in the README still finds its number.

## Not verifiable

- The items of the previous report stand (bruinStoll2010 published page numbers; siksek2009sym beyond the fetch; the numerical tables of the modular applications; de Weger Table II's printed page).
- bdmtv2019annals was not reopened for the new heading of §6.5; the comparison of wording above covers the Layer 2 titles only.

## Source issues

- none

## For the human reviewers

- Reuse: the 72-tuple list of README §6.39 (line 8169 ff.) and `ED6.thueMahlerSolutionList` is given "in the order of Tzanakis–de Weger's table" (tzanakisDeWeger1992, printed pp. 278–279); the set is a theorem, the order is the source's.
- Licence: tzanakisDeWeger1989 was read from `ris.utwente.nl`, which the sources service does not classify; it was read as an institutional repository (University of Twente).
