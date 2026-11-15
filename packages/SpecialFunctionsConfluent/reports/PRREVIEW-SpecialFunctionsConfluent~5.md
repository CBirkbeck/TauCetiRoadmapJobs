# Review of SpecialFunctionsConfluent (pull request #1995 at af5a60b)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since the review of `af5a60b` (0 lines). This round read the pull request's title and description against the head and resolved their supplier citations at the suppliers' present heads.

## R01 (P2) — LaguerreJacobi is cited by labels its head no longer has

**Location:** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:395–396`, "`Polynomial.laguerre` (A1) and the orthogonality `Polynomial.integral_laguerre_mul_laguerre_laguerreMeasure` for `−1 < α` (B3)"; also lines 182, 932 and 1066, and the description's sentence "supplies the Laguerre polynomials `Polynomial.laguerre` (A1) and their orthogonality (B3)".

**Claim:** LaguerreJacobi has targets labelled A1 and B3.

**Witness:** `TauCetiRoadmap/LaguerreJacobi/README.md` at the head of its pull request (`8e25e5e`): no "A1" or "B3" anywhere and no table of former labels; `Polynomial.laguerre` is in "### 1.1 Definition and degree", the orthogonality in "### 2.3 The orthogonality relation".

**Repair:** Write `§1.1` for `A1` and `§2.3` for `B3`: README:182 "(LaguerreJacobi §2.3)", 395–396 "`Polynomial.laguerre` (§1.1) … for `−1 < α` (§2.3)", 932 "LaguerreJacobi §1.1", 1066 "LaguerreJacobi §2.3"; in the description, "`Polynomial.laguerre` (§1.1) and their orthogonality (§2.3)". Both declaration names and the hypothesis `−1 < α` stand as they are at that head.

## Previous findings

- none: the review of `af5a60b` had no finding (its R01 and R02 of the round before were recorded there as repaired, and the folder has not changed since).

## Verified sound

| Statement | Instances | Left side | Right side | Result | Change |
|---|---|---|---|---|---|
| `kummerU_eq_integral` (13.4.4; description: "4.1 proves that this `U` is QuantumFoundations' `U`") | `(a,b,z) = (1.8+0.3i, 1.7−0.4i, 0.9+0.6i)` | bracket 13.2.42: 0.0766572537−0.3731340518i | quadrature of 13.4.4: 0.0766572537−0.3731340518i | holds | none |
| `whittakerW_eq_integral` (13.16.5; description: "`W_{κ,μ}` is AutomorphicSpectralTheory's `W`") | `(κ,μ,z) = (−1.4, 0.35, 1.1+0.7i)` | 0.0886732829−0.0785981842i | quadrature: 0.0886732829−0.0785981842i | holds | none |
| Description: "13.9.3 and 13.9.4 need `a > 0`" | sign changes of `𝐌(a,b,·)` on `(0,60]` at `(0,−½)`, `(½,−½)`, `(0,−5/2)`, `(½,−5/2)` | 0, 1, 0, 1 | printed formulas give 1, 1, 1, 1 | the description and README:1042–1044 are right | none |
| Description: "13.9.6 needs `a ∉ {−1, −2, …}`" | `(−1,−3/2)`, `(−3/2,−5/2)`, `(−2,−9/2)` | 0, 1, 0 | printed 13.9.6 gives 1, 1, 1 | right; fails only at integer `a` | none |
| Description: 13.6.18 "for `−π/2 < ph z ≤ π/2`" | `n = 2`, `z = ±1` | `U(−½, 3/2, 1)` = 0.5000000000 (both) | `H₂(z)/(4z)` = ½ at `1`, −½ at `−1` | right; fails at `z = −1` for even `n` | none |
| Description: "`b`-zeros … only away from the poles" | 13.2.5 at `a = 1`, `z = 1`: `(1)_{n+1} 𝐌(n+2, n+2, 1)` | `(n+1)! · e/Γ(n+2)` | `e` | `𝐌(1,−n,1) = e ≠ 0`, so `M(1,b,1)` has a pole at each `−n` | none |
| R01: 7.1, zeros of `M(−n, b, ·)` through LaguerreJacobi §2.3 | `n = 1`: `(b)₁ M(−1,b,x)`; norm at `m = n = 0` | `b − x`, one zero `x = b > 0`; `∫₀^∞ x^α e^{−x} dx = Γ(α+1)` | `L₁^{(b−1)}(x) = b − x`; §2.3 gives `Γ(0+α+1)/0!` | the content cited is at §1.1 and §2.3 with `−1 < α`, i.e. `b > 0` | labels only (R01) |

The rows for the other statements stand as in the previous review, of `af5a60b`.

- Description against the head, sentence by sentence: the ten layer titles, the scope and exclusions (README:32–42, 185–214), the Layer 10 formula list (README:126–127), the six corrections to DLMF (README:893–895, 918–920, 1023–1046, 1070–1075, 1151–1158), the three Tau Ceti imports and the four roadmap-local copies (`besselI`, `besselK`, `airyAi`, `parabolicCylinderU`), topic `math.CA`, the "Prior formalization" section (README:1313): all agree. It adds a roadmap (not on main), which the description says.
- Pins: `lake-manifest.json` has Tau Ceti `2fd255d997…` and Mathlib `1b1ccf4b08…`, identical to `origin/main`, as the description states.
- Supplier citations of the description resolved at the present heads: QuantumFoundations §9.4 and §9.5 (head of its pull request; §9.4 defines `U` by 13.4.4 and gives it no Lean name), AutomorphicSpectralTheory §§0.26–0.28, SpecialFunctionsBessel Conventions, Layer 1, 3.1 (10.32.9), 4.3 (10.39.5), 7.1; on main AsymptoticExpansions §§4.2, 4.3, 8.1, 8.2, 8.6, 10.2–10.4, SpecialFunctionsParabolicCylinder §§1.1–1.6 and 6.7, SpecialFunctionsEiLiErfIncompleteGamma §§2.2, 4.1, 11.4. Only LaguerreJacobi fails (R01).
- Merge order: AutomorphicSpectralTheory (98) and QuantumFoundations (215) precede this roadmap (216); LaguerreJacobi and SpecialFunctionsBessel are open pull requests that add new folders. Dependency check: `depcheck: 245 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate re-run with `--base origin/main`: every text and Lean counter is 0; without the candidate merge order it prints `depcheck: NOT IN ORDER: SpecialFunctionsConfluent (insert it after its last supplier)`, which is not a finding. The worker's gate with the targeted build: `build=0 OK`.
- `lake env lean` on `TauCetiRoadmap/SpecialFunctionsConfluent/Suggested.lean`: 42 warnings, all `declaration uses sorry`, no error, as the description states. No file outside the folder is changed.
- Remarks, no change asked: four of the eight suppliers the description's "Merge order" and "Depends on" lines name (AsymptoticExpansions, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsAiry) are now on main, as the generated block shows. `Suggested.lean:312` titles Layer 6 "large argument and large parameters"; the README's heading is "large argument".
- Overlap check: read SpecialFunctionsBessel, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsAiry (scope sections and the sections cited above); shared objects: `I_ν`, `K_ν`, 10.39.5 owned by SpecialFunctionsBessel, `𝐌` basics and Weber's `U(a, z)` by SpecialFunctionsParabolicCylinder, 8.5.1 and 7.11.4 by SpecialFunctionsEiLiErfIncompleteGamma, `Ai`, `Bi` by SpecialFunctionsAiry; each is cited here, none restated. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id.
- Source independence: changed passages only; the folder is unchanged since `af5a60b`, so 0 passages were compared this round with 0 sources; the largest share of the locators is DLMF Chapter 13, as before (not recounted); the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Unchanged from the earlier rounds: Gautschi (1967) and Wimp (1965) were not opened (paywalled). No sentence of the description rests on their text beyond the attribution of Wimp's theorem.
- The description's statement of how the roadmap was drafted and checked (mpmath against the live DLMF text) cannot be checked from the head.
- The seeded sample of sources was not re-read: no sampled target lies in a changed passage.

## Source issues

- none

## For the human reviewers

- **Licence.** README:1313–1326 and the description name B. Braams' `lean-DLMF` (Apache-2.0, the author's repository) as source material, with "reused code carries attribution". `Suggested.lean` was not compared with that repository in this round.
- **Not tested.** DLMF Chapter 13 has the largest share of the locators; its contents were not set beside the layers this round. README:87–99 pairs each layer with DLMF sections (Layer 3 with §§13.3 and 13.15, Layer 4 with §§13.4 and 13.16).
