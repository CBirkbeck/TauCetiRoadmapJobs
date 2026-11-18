# Review of SpecialFunctionsBessel (pull request #1987 at 862c486)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the off-by-one at `ν = 0` in the zeros of the cross-product of derivatives (10.6), is repaired, and the repaired statement was recomputed at five orders and three ratios `λ`. The five small corrections of that review are repaired as well, and the repairs introduce no new problem. There is one format note and no small correction. Two matters are left to the human reviewers: the six books could not be read, and the relation to the author's `lean-DLMF`.

## N01 — Three decimals in the new Checks of 10.6 are rounded but end in an ellipsis

In the Checks of 10.6 (README lines 1607–1608), `6.31235…`, `6.31236…` and `9.44447…` are roundings of `6.3123495`, `6.3123554` and `9.4444653`, not their leading digits. Either truncate (`6.31234…`, `6.31235…`, `9.44446…`) or drop the ellipses.

## Previous findings

- R01 — repaired: "for `ν > 0`, the `m`th positive zero of the cross-product 10.21.49 has the expansion 10.21.50 with the coefficients 10.21.52" and, at `ν = 0`, "`α = mπ/(λ − 1)` and the coefficients 10.21.51 at `μ = 4`"; recomputed.
- C01 — repaired: "The forms 10.16.3–10.16.4 are SpecialFunctionsParabolicCylinder 9.6 (DLMF 12.14.13–12.14.14) at `x ↦ 2x^{1/2}`", with 9.6 in the *Needs* line; 9.6 is on main (its README line 1238).
- C02 — repaired: `TauCeti.scorerGi` is in the supplier contract (SpecialFunctionsAiry Conventions, its README line 142), and 9.12.23 is "the limit as `ε → 0+` of the integral over `(0, ζ − ε) ∪ (ζ + ε, ∞)`".
- C03 — repaired: the Legendre-function formulas go "to a roadmap that consumes SpecialFunctionsLegendre and this one", as SpecialFunctionsLegendre's Downstream consumers say at its open head (README lines 1594–1595).
- C04 — repaired: the description says "All eight suppliers are on main; this pull request depends on no open pull request."
- C05 — repaired: a "Former numbering" table closes Scope and ownership (`3.1 → 5.1`, `4.3 → 8.1`, `8.2 → 11.2`, `11.1 → 8.2`); each row was checked against the section it names and against the citing lines of the two roadmaps on main.

## Verified sound

Values recomputed with mpmath (20 to 30 digits). The diff changes no statement of `Suggested.lean`; the rows are the README statements the diff changes.

| Statement | Instances | Left side | Right side | Result |
|---|---|---|---|---|
| 10.6, 10.21.49 at `ν = 0` (corrected form) | `λ = 2`, `m = 1, 2, 3`; `λ = 1.5`, `m = 6` | zeros `3.196578381`, `6.312349510`, `9.444464925`; `37.70573783` | `3.197081096`, `6.312355429`, `9.444465315`; `37.70573783` | agree; equal to zeros of 10.21.48 at `ν = 1` to 10 digits |
| 10.6, negative control (DLMF 10.21.52 at `ν = 0`) | `λ = 2`, `m = 2, 3, 4`; `λ = 1.5`, `m = 6` | same three values at `m = 2, 3, 4`; `31.42387485` | 6th zero `37.70573783` | one index too high, as the Check says |
| 10.6, coefficients | 10.21.51 at `μ = 4`, 10.21.52 at `μ = 0`, `λ = 2` | `p, q, r = 0.1875, −0.1435546875, 0.3593078613` | the same | equal |
| 10.6, 10.21.49 with 10.21.52 for `ν > 0` | `(ν, λ) = (0.3, 2)`, `(0.01, 2)`, `(5, 1.1)`, `(10, 3)` | zeros `0.2038669`, `3.2043734`, `6.3160347`; 7th `18.85947795`; 13th `377.0221649`; 26th `39.69657861` | `m = 2, 3`: `3.2046943`, `6.3160385`; `18.85947795`; `377.0221649`; `39.69657811` | count right for `ν > 0` |
| 10.6, route: `φ′_ν < 0` on `(0, ν)` (10.18.8) | `(ν, x) = (0.3, 0.15)`, `(0.3, 0.6)`, `(1, 0.5)`, `(1, 2)` | numerical `φ′`: `−0.48073`, `0.46765`, `−0.59237`, `0.74110` | `2(x² − ν²)/(πx³N²)`: the same | agree; `φ_ν ∈ (0, π/2]` before `j′_{ν,1}`, so the difference never reaches `−π` |
| 8.2, 9.12.22 | `x = 1.3`; `z = 1.1 + 0.5i` | `Hi(−x) = 0.1900484997`; `0.1989421606 − 0.0511112400i` | integral: the same to 16 digits | agree |
| 8.2, 9.12.23 as a principal value | `x = 1.3`, `ε = 10⁻³, 10⁻⁵` | `Gi(1.3) = 0.2177270337` | `0.2176096605`, `0.2177258600` | converges, error proportional to `ε` |
| 8.1, 10.16.3 from 12.14.13 | `x ↦ 2z^{1/2}` | `W(0, 2√z) − W(0, −2√z) = −2^{1/4} π^{1/2} z^{1/4} J_{1/4}(z)` | 10.16.3 solved for `J_{1/4}`: coefficient `−2^{−1/4} π^{−1/2} z^{−1/4}` | agree |

The rows for the untouched statements stand as in the previous review, of `8e37c64`.

- Source locators checked against the text: DLMF §10.21(x) (10.21.48–10.21.54 and the standing hypotheses `ν ≥ 0`, `x > 0`, `λ > 1`), §10.18 (10.18.3, 10.18.4, 10.18.8, 10.18.18) and §9.12(vii) (9.12.22 with `|ph z| < π/3`, 9.12.23 with the principal-value sign and `x > 0`), fetched this round. The seeded sample does not fall in the changed passages.
- Library declarations opened at the pins: none new; `Suggested.lean` is unchanged since `8e37c64`.
- Cross-roadmap citations resolved: SpecialFunctionsParabolicCylinder 9.6 (main), SpecialFunctionsAiry Conventions, 8.3 and Downstream consumers (main), SpecialFunctionsHypergeometric 4.2 and Downstream consumers (main), SpecialFunctionsLegendre Downstream consumers (open head).
- Dependency check: `depcheck: 218 roadmaps, 2361 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changed outside the folder. The automatic checks all passed.
- Elaboration of `TauCetiRoadmap/SpecialFunctionsBessel/Suggested.lean`: 50 warnings, all `declaration uses 'sorry'`, no error.
- Pull request text read against the head: the "Former numbering" sentence, the supplier sentence and the 50-theorem count agree with it.

Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsStruve, SpecialFunctionsLegendre (open), SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder (main), as far as the changed passages touch them; one shared object, the `a = 0` relation between `W(0, ±x)` and `J_{±1/4}`, `J_{±3/4}`, owner SpecialFunctionsParabolicCylinder 9.6, now cited from 8.1. The Legendre-function formulas are owned by neither this roadmap nor SpecialFunctionsLegendre; both name the same future consumer.

Source independence: changed passages only; 4 passages compared with 1 source (DLMF §§9.12, 10.18, 10.21), none shared; largest share DLMF, about 725 of 990 locators; no layer added, removed or reordered, so the contents comparison stands (independent). The six books could not be read.

Research link: 10.3 states the Lorch–Szegő higher monotonicity of zero differences (Andrews–Askey–Roy 1999, Theorem 4.15.1); 6.3 and 9.1 rest on Olver's (1974) error-bound theory; the `K`-Bessel kernels of AnalyticNumberTheoryPartI and AutomorphicSpectralTheory and the open Struve, confluent and Legendre roadmaps consume it. Rests on the README's sources and the cited roadmaps.

## Not verifiable

- Andrews–Askey–Roy, Beals–Wong, Lebedev, Olver, Temme, Whittaker–Watson: no legal copy was found in the previous round; the changed passages add no locator into them.
- `check_roadmap_topics.py` (description) was not run.

## Source issues

- **Error** in DLMF-Bessel at §10.21(x), 10.21.49 with 10.21.52, Release 1.2.8: the source says the `m`th positive zero of the cross-product of derivatives has `α = (m − 1)π/(λ − 1)` for all `ν ≥ 0`; it should restrict this to `ν > 0`, the formula at `ν = 0` giving the `(m − 1)`th zero; affects a stated result.

## For the human reviewers

- **Not tested.** Wording, page locators and arrangement were compared with DLMF only. The six books the README cites (Andrews–Askey–Roy, Beals–Wong, Lebedev, Olver, Temme, Whittaker–Watson) could not be read legally, so parts 1 and 2 of the copyright check were not run against them.
- **Licence.** The README (`## Prior formalization`) and the description name the author's `lean-DLMF` (Apache-2.0, `github.com/bjbraams/lean-DLMF`) as source material; `Suggested.lean` was not compared with that repository.
