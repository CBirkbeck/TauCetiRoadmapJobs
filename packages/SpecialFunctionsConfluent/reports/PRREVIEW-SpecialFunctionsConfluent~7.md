# Review of SpecialFunctionsConfluent (pull request #1995 at e167af7)

**Verdict:** accepted

**Summary.** Accepted: this head repairs all four points of the previous review (the false negative control of 5.3, the conclusions missing from `Suggested.lean`, the circular use of 3.2 in 1.3, and the digit in 5.3), and the seven restated Lean theorems were recomputed and hold. No finding and no small correction; two format notes, neither blocking. The two questions for the human reviewers of the previous report stand.

## N01 — The *Needs:* line of 1.3 no longer reaches Kummer's equation for `𝐌`

In 1.3 (`TauCetiRoadmap/SpecialFunctionsConfluent/README.md`, line 579) the line reads "*Needs:* 1.1; AsymptoticExpansions §10.2", but the basis and the constancy of `z^b e^{−z} 𝒲` use that `𝐌` solves 13.2.1, which is SpecialFunctionsParabolicCylinder §1.3; before the change it was reached through 1.4 (line 621). Adding "SpecialFunctionsParabolicCylinder §1.3" to the line would complete it.

## N02 — The hypothesis on `2μ` in the middle conjunct of `whittakerW_equation` is not needed by the Lean statement

`whittakerM` is `Gamma (1 + 2 * μ) * regularizedWhittakerM κ μ z`, and Mathlib's `Gamma` is `0` at nonpositive integers (`Complex.Gamma_neg_nat_eq_zero`), so at `2μ = −(n + 1)` the conjunct reads `0 = 0`. The hypothesis matches the README and may stay; the docstring could say that the excluded case is the junk value.

## Previous findings

- R01 — repaired: "the statement fails at `a = 1`, `z = 1` along `b = −m + 1/(m! m²)`, `m → ∞` … `M(1, b, 1)` is `−67.157…`, `272.738…` and `1088.265…` at `m = 5`, `10`, `20`" (recomputed: same).
- R02 — repaired: `Suggested.lean` now states the lower sign of 13.2.41, Whittaker's equation for `𝐌_{κ,μ}` and `M_{κ,μ}`, `Differentiable` for `whittakerWLog`, local uniformity in 1.2, the middle form of 13.2.7, 13.6.13 and the logarithmic 13.2.40; other conclusions are separate bullets.
- R03 — repaired: 1.3 states the basis `𝐌`, `z^{1−b} 𝐌(a − b + 1, 2 − b, ·)` with 13.2.33 and "*Needs:* 1.1; AsymptoticExpansions §10.2"; the basis `𝐌`, `U` is in 3.2 (N01 on the line).
- R04 — repaired: "at `b = 100` the left side is `0.01009 99901…`" (computed `0.01009 99901 0191…`).

## Verified sound

Values computed at 20 to 40 digits from the bodies of the definitions in `Suggested.lean`.

| Statement | Instances | Left side | Right side | Result | Change |
|---|---|---|---|---|---|
| `tendsto_regularizedGaussHGFun_div_atTop`, local uniformity (1.2) | `a = 0.3+0.2i`, `c = 1.4−0.5i`; sup over 13 points of `|z| = 2`; `t` = 10², 10³, 10⁴ | sup error 1.38e−2, 1.36e−3, 1.36e−4 | 0 | error `O(1/t)` uniformly on the circle | none |
| `kummerU_neg_nat`, both forms (1.5, sampled) | `(m,b,z)` = `(2, 0.4+0.3i, −1.3)`, `(3, 2.5, 0.7+0.2i)`, `(2, −0.5, 1.1)` | `U`: 5.8+1.32i; −12.116+5.956i; −0.14 | sum and `(−1)^m (b)_m Γ(b) 𝐌`: same, each | holds; middle form also at `z < 0` | none |
| `whittakerW_equation`, three conjuncts (1.6) | `(κ,μ,z) = (0.3+0.2i, 0.35−0.1i, −0.6+0.8i)`; `μ = −3/2` for `𝐌_{κ,μ}` | residuals 1.9e−16 (`𝐌_{κ,μ}`), 1.0e−16 (`W`); at `μ = −3/2`: 8.3e−18, with `|𝐌_{κ,μ}| = 0.0622` | 0 | holds; `M_{κ,μ}` is a constant multiple | N02 |
| `differentiable_regularizedWhittakerMLog`, second conjunct | by the body | `whittakerWLog` = entire exponentials × `kummerULog (½+μ−κ) (1+2μ) w` | entire by `differentiable_kummerULog` | holds | none |
| `kummerU_eq_cpow_mul_kummerU`, logarithmic form (3.3) | `(a,b,w)` = `(0.3+0.1i, 0.45, 0.4+5i)`, `(0.7, 1.6−0.3i, −0.7−4i)`, `(0.3+0.1i, 2, 0.4+5i)`, `(1.2, 0, −0.2−4i)`, `(0.7, −1, 0.3+3.5i)` | 2.784264252692−3.215329355106i; −3.427026565116+0.964757062171i; 0.669984628903−1.353347680291i; 0.808245204340+2.516805047370i; 1.046365349259−0.850231998401i | same to 15 digits | holds off the principal sheet and at integer `b` | none |
| `regularizedHGFun_eq_kummerU_add`, both signs (3.3) | `(0.3, 0.45, 1.1±0.7i)`; `(0.3+0.2i, 1.45+0.1i, −1.1+0.7i)` and `z = −1.3`; `(0.3, 2, −1.3)`, `(0.3, 2, 0.4+0.9i)`, `(0.6, −1, 0.4−0.9i)` | 0.945582554560±0.602358436009i; 0.861689027841−0.019445374599i; 0.897053414359−0.124025374328i; 0.848706219845; 1.033251895478+0.155531920090i; −0.652513125238−0.029852203226i | upper and lower sign: same, each | holds on `z ≠ 0`, the cut and integer `b` included | none |
| `kummerU_parabolicCylinderU`, 13.6.12 and 13.6.13 (6.4) | `(a,z)` = `(0.7+0.2i, 0.9+0.8i)`, `(−1.5, 0.3−2i)`, `(0.4, 0.2+3i)` | 13.6.13: 0.327175042845−1.054976280504i; 1; −0.255770294472−0.087518167190i | same | hold for `Re z > 0` | none |
| 13.2.33 and its Checks (1.3) | `a = 0`, `b = ½`, `z = ½`; `b = 1` | 0.7421853304033011 | `sin(πb) z^{−b} e^z/π` = 0.7421853304033011; at `b = 1` both functions are `𝐌(a, 1, z)` | hold | none |
| Basis `𝐌`, `U` and its Check (3.2, sampled) | `a = 0` | `U(0, b, z) = 1`, `𝐌(0, b, z) = Γ(b)⁻¹` | `−z^{−b} e^z/Γ(0) = 0` | Check true; non-vanishing exactly for `a ∉ {0, −1, …}` | none |
| Checks of 5.3 (sampled) | `M(1, 100, 1) − 1`; `b = −m + 1/(m! m²)`, `m` = 5, 10, 20 | 0.0100999901019; −67.1574, 272.7381, 1088.2652 | README: `0.01009 99901…`; `(−1)^m e m²` = −67.957, 271.828, 1087.313 | Checks true; `𝐌(1, −m, 1) = e` by 13.2.5 | none |

The rows of the previous review, of `d2983b2`, stand for the untouched statements.

- Source locators checked against the text: DLMF 13.2.7, 13.2.33, 13.2.34, 13.2.40, 13.2.41 (both signs), 13.6.3, 13.6.12, 13.6.13, read at dlmf.nist.gov; each agrees with the changed passage that cites it.
- Library declarations opened at the pin: `Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:424, 428` (the Gauss function is the sum of its series, so `z/t` in the unit disk is what the local uniformity uses).
- Cross-roadmap citations in the changed passages: QuantumFoundations §9.4 (13.2.34, 13.2.41), AsymptoticExpansions §10.2, SpecialFunctionsParabolicCylinder §1.3 (`### 1.3 Kummer's equation` on main); no citation found nowhere.
- Dependency check: `depcheck: 220 roadmaps, 2378 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Internal order after the change: 1.3 needs 1.1; 2.1 needs 1.1–1.4; 3.2 needs 1.3–1.5, 3.1, 2.1: acyclic.
- The automatic checks all passed at this head. `lake env lean` on `TauCetiRoadmap/SpecialFunctionsConfluent/Suggested.lean`: exit 0, 43 warnings, all `declaration uses sorry`. One-tactic probe (`simp` with the definitions unfolded, `rfl`) on a scratch copy of the seven restated theorems: none closes. The seven elaborated signatures were compared with their README bullets: they agree; the file has no section variable.
- The pull request's title and description against this head: 9 layers, 43 theorems, 43 warnings, three Tau Ceti imports and the supplier paragraphs still agree; the change removes no heading, declaration or supplier. No file outside the folder is changed.
- Overlap check: as in the previous review (read SpecialFunctionsBessel, SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsStruve, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsAiry, SpecialFunctionsHypergeometric); the change adds no object: 13.2.33 moved within this roadmap, `I_ν`, `K_ν`, Weber's `U`, Tricomi's `U` keep their owners.
- Source independence: changed passages only; 6 passages (1.3, 3.2 and its Check, the Checks of 5.3, three docstrings) compared with 1 source (DLMF §§13.2, 13.6), none shared beyond formulas; largest share DLMF Chapter 13, about 530 of about 715 locators; no layer added, removed or reordered, so the contents were not compared again.
- Research link: Tricomi's `U` and `W_{κ,μ}` are identified with the functions QuantumFoundations §§9.4–9.5 (Coulomb functions) and AutomorphicSpectralTheory §§0.26–0.28 use; Layer 9 states the zero-free theorem of Wimp (1965); rests on the README's scope and sources.

## Not verifiable

- Lebedev (9.10.2), (9.10.11); Beals–Wong (6.1.7); Olver §9.2, §10.5; Temme (7.6), (7.10); Kristensson (7.2), cited in the changed 1.3 and 3.2: no legal copy, as in the previous review; the statements were checked against DLMF and by computation.
- The other items of the previous report stand (the eight books, Whittaker–Watson fourth edition, Wimp, Gautschi, the printed form of 13.11.3).

## Source issues

- **Error** in DLMF Chapter 13 (Release 1.2.8) at 13.9.3 and 13.9.4, §13.9(i): the source gives a positive number of positive zeros for `a ≥ 0`; it should be `a > 0`, since `M(0, b, x) = 1`; affects a stated result.
- **Error** in DLMF Chapter 13 (Release 1.2.8) at 13.9.6, §13.9(i): the source imposes only `⌈−b⌉ > ⌈−a⌉ > 0`; it should also exclude negative integers `a` (`M(−2, −4.5, ·)` has no positive zero, the formula gives 1); affects a stated result.
- **Error** in DLMF Chapter 13 (Release 1.2.8) at §13.9(i), last sentence: the source says `M(a, b, z)` has finitely many `b`-zeros; it should restrict to `b` away from the poles (`M(1, b, 1)` vanishes near `−10.00000082`, and near every large even `−n`); affects a stated result.
- **Error** in DLMF Chapter 13 (Release 1.2.8) at §13.9(ii), first sentence: the source says `U(a, b, z)` has finitely many zeros in the sector for complex `a`, `b`; it should bound `|z|` away from `0` (`U(½+i, 1+2i, 2x)` is a multiple of `K_i(x)`); affects a stated result.
- **Error** in DLMF Chapter 13 (Release 1.2.8) at §13.9(i), the paragraph after 13.9.9: the source extends the closed zero-free regions to the partial sums; it should take the interior (`1 + z` vanishes at the vertex `−1` of `P₁`); affects a stated result.
- **Gap** in DLMF Chapter 13 (Release 1.2.8) at 13.9.1 and 13.9.2, §13.9(i): the source allows `b = 0`, where `M(a, 0, x)` is not defined; it should be `b > 0`; affects a stated result.

## For the human reviewers

- **Licence.** The README's provenance section and the description name B. Braams' `lean-DLMF` (Apache-2.0, the pull request author's repository) as source material for most layers; `Suggested.lean` was not compared with that repository.
- **Not tested.** Eight of the ten books the README cites could not be read (listed under "Not verifiable"); the wording and the arrangement were compared with DLMF Chapter 13 and Whittaker–Watson only.
