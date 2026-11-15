# FIX-DESIGN-ConstructiveFieldTheoryPhi4~11

Repair of the findings of REV-DESIGN-ConstructiveFieldTheoryPhi4~10 (one review, one P3 finding). Files edited: `packages/ConstructiveFieldTheoryPhi4/design/README.md`, `packages/ConstructiveFieldTheoryPhi4/design/plan.json`, `packages/ConstructiveFieldTheoryPhi4/sources.toml`.

## F01 (P3) — applied

Old → new. In 1.5, the citation "Simon, Twelve Tales (3.8), Section 3, p. 24" was taken off the limit formula for `G_μ`, which now cites Fröhlich alone. It was added to the covariance sentence `(μ² − Δ_R)⁻¹` as "Simon, Twelve Tales, Section 3, pp. 23–24, for the free lattice field as a nearest-neighbour ferromagnet with Gaussian single-site measure, written there formally on ℤ² and with another normalisation of the mass term". 7.4 now carries the same qualified citation.

Verification. The finding is right. At `simon-2020-twelve-tales lines 954–976` (pp. 23–24):
- p. 23 says that the continuum free field has covariance `(−Δ + m²)⁻¹` and that the lattice approximation replaces −Δ by a finite-difference operator.
- (3.8) on p. 24 is a formal product measure on ℤ² with single-site factor `e^{−m²s²}`. It has no Green function and no limit.

Its normalisation does not give the README's kernel:
- If ordered pairs are summed, the exponent is `−(s, (−Δ + m²)s)` and the covariance is `½(−Δ + m²)⁻¹`.
- If unordered pairs are summed, the exponent is `−½(s, (−Δ + 2m²)s)` and the covariance is `(−Δ + 2m²)⁻¹`.

The README's limit formula is supported by `frohlich-1982 lines 266–269` (p. 13). There the two-point function at λ = 0 is the inverse of the mass term plus the finite-difference Laplacian, "the free lattice field".

Placement. In 1.5 the qualified citation is placed at the claim it supports: the identification of the nearest-neighbour Gaussian ferromagnet with the lattice free field of covariance `(μ² − Δ_R)⁻¹`. This follows the rule that a locator goes at its claim, and differs from the suggested repair only in where the parenthesis sits; the wording is the suggested one. In 7.4 the citation stays in the source list of the reachability target, with the suggested wording.

Pattern repaired elsewhere:
- **References.** The Simon entry now reads "Section 3 (pp. 23–25)", since p. 23 is now cited.
- **`sources.toml`.** The Simon locator was "Section 3 (pp. 24-25, (3.8)), …" and is now "Section 3 (pp. 23-25), …": the README no longer cites display (3.8) by number.
- **`design/plan.json`.** The `where` fields of 1.5 and 7.4.1 said "(3.8) lines 960-975". They now say "Section 3 lines 954-975 (free lattice field as Gaussian ferromagnet, formal, other mass normalisation…)".

I checked every other Simon citation of the README against the cached text:
- Conventions and 0.2: Section 3, p. 25, line 1021, `exp(−as⁴ − bs²)`, opposite sign of b.
- 2.1 Check: Griffiths' trick, p. 25, lines 1011–1018. `H = −(log 2)t²` agrees with `K_{12} = (ln 2)/2` because `σ₁σ₂ = 2t² − 1`.
- 2.3: p. 25, lines 1019–1022.
- 3.1: p. 24, lines 977–984, GKS for EQFT.
- 5.3: (5.19)–(5.21), pp. 36–37, lines 1529–1546.
- 5.4: (5.17), p. 36, line 1518, and (5.22), p. 37, line 1556.
- 5.5: (5.15)–(5.18), p. 36, lines 1503–1523.

Each supports the claim it is attached to, so none needed a change.

## Checks run

Dependency check (gate), output in full:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

The gate shows no UPWARD, CYCLE or `moved:` line.

- **Citation resolve** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.
- **Parsing:** `plan.json` parses as JSON, and `sources.toml` parses with 14 sources.
- **Formatting:** a search for LaTeX delimiters in the README finds nothing.
- **Lean:** the package has no `Suggested.lean` at this design stage, so no `#check` file was elaborated and no Lean command was run.
- **Gate failures:** none were listed for this round.
- **Sources:** no new source was needed. All locators used are in the cached `simon-2020-twelve-tales` and `frohlich-1982` texts, and no `needs-references.toml` was written.
- **Ownership:** unchanged by this repair, since no target was added or moved.

## Adversarial pass on the changed text

Only citations changed. The statements of 1.5 and 7.4 are unchanged, and their Checks were recomputed against the cited normalisation.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.5 limit kernel, d = 1 | μ = 1 | `(2π)⁻¹∫dp/(3 − 2cos p) = 1/√(3² − 4) = 1/√5 = 0.4472 = 1/(μ√(4 + μ²))` | README formula and Check agree; Fröhlich's `(m² − Δ)⁻¹` gives the same |
| 1.5 normalisation against Simon (3.8) | isolated site (no bonds), mass 1 | README: `b = −μ²/2` gives variance `1/(2|b|) = 1 = (μ² − 0)⁻¹`; Simon's factor `e^{−s²}` gives variance `½` | they differ by the factor in the new qualifier ("another normalisation") |
| same | infinite chain d = 1, m = μ = 1, value at the origin | README symbol `E(p) + μ²`: `1/√5 = 0.4472`; Simon with unordered bonds, symbol `E(p) + 2m²`: `(2π)⁻¹∫dp/(4 − 2cos p) = 1/√12 = 0.2887`; Simon with ordered pairs, symbol `2(E(p) + m²)`: `½·0.4472 = 0.2236` | Simon's display is not the README kernel under either reading; the citation now says so |
| 1.5 finite volume | b = −(d + μ²/2), nearest-neighbour J = 1 | `2|b|I − J⁰ = (2d + μ²)I − A_R = μ² − Δ_R` | unchanged and correct |
| 7.4 lattice scaling | `b_n = −(d + m²/(2L_n²))` | `μ = m/L_n`, kernel `G_{m/L}`, `L^{2d}·L^{−d}·L² = L^{d+2}` | unchanged; the citation now supports only the identification of the lattice field |
| 7.4 Check, d = 1 | m = 1 | `C_1(1_Q,1_Q) = 2 − (1 − e⁻²) = 1 + e⁻² = 1.1353` | unchanged and correct |

## For the maintainer

No name, section or target id changed, so no other roadmap is affected. The review's "For the human reviewers" items were not acted on, as the brief directs: the uncertified texts, the IHES preprint licence of `frohlich-1982`, and the scope of `ConstructiveFieldTheoryPhi4PartII`.
