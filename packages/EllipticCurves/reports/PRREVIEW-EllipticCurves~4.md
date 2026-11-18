# Review of EllipticCurves (pull request #2483 at 2af7515)

**Verdict:** accepted

No finding. Incremental re-review of the 93 lines changed since `1fe14b8`.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 44–50 state `tateUniformization_bijective_and_map_mul`; its module docstring (lines 15–27) and `README.md` lines 221–226, 260–263, 400–402 and 1329–1331 name the pin's map, injectivity and equivariance and the open part.
- R02 — repaired: `README.md` lines 369–372 and 1338–1343: over every complete rank-1 `K` the reduction is stated on the equation; split multiplicative reduction in Mathlib's sense only "when the valuation ring of `K` is a discrete valuation ring".
- R03 — repaired: `README.md` lines 1374–1376, Layer 4 Dependencies: "Mathlib's reduction theory over a discrete valuation ring; Layer 1's formal group; Layer 2's Tate module …; Layer 3's dichotomy"; no Layer 5 statement, consistent with line 429.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `tateUniformization_bijective_and_map_mul` (headline, new) | `K = ℚ_p`, `q = p` (`p` odd and `p = 2`); `K = 𝔽₂((t))`, `q = t`; inversion | 2-torsion of `Kˣ/q^ℤ`: `{±1}`, order 2, matching the one rational 2-torsion point of `E_q` (`±√q ∉ K`); in characteristic 2 trivial on both sides (`x = 0`, `y² = a₆ = q + ⋯` not a square); pin `tateUniformization_inv`: `x⁻¹ ↦ −P` | consistent with a group isomorphism; no discreteness or characteristic hypothesis needed | none |
| Same, convention against the pin | pinned `TateCurve/Coordinates.lean` lines 73–81, `Uniformization.lean` lines 50–53 | `X = Σ_n qⁿu/(1 − qⁿu)² − 2s₁`, `Y = Σ_n (qⁿu)²/(1 − qⁿu)³ + s₁`; identity class to `0`; docstring lines 34–43 describe this map | docstring and README agree with the pinned definition | none |
| Same, binders and context | `#check`-elaborated type against README lines 1322–1331 | `[NormedField K] [CompleteSpace K] [IsUltrametricDist K] [DecidableEq K]`, `q : Kˣ`, `‖q‖ < 1`; `DecidableEq` is what the `+` of `Point` needs; `‖q‖ < 1` with `q` a unit forces a nontrivial norm | README generality equals the Lean's; no binder lost | none |
| Same, one-tactic probe | `simp [TauCeti.tateUniformization_injective]`; `exact?` on surjectivity and on additivity separately | `simp` made no progress; `exact?` closes neither; no `Surjective`, `Bijective` or `x * y` statement on `tateUniformization` under the pinned `TateCurve/` | not padding; unproved at the pin | none |
| Reduction of `E_q` on its equation (README lines 1338–1343) | `a₄ = −5q − 45q² − ⋯`, `a₆ = −q − 23q² − ⋯`, `Δ = q∏(1 − qⁿ)²⁴`, model `[1,0,0,a₄,a₆]` | `|a₄| ≤ |q| < 1`, `|a₆| = |q| < 1`; `b₂ = 1`, `b₄ = 2a₄`, `c₄ = 1 − 48a₄`, `|c₄| = 1`; `|Δ| = |q|`, `|j| = |c₄³/Δ| = 1/|q|`; reduction `y(y + x) = x³`, tangents `y = 0`, `y = −x`, distinct also in characteristic 2 | true over every complete rank-1 `K`, `ℂ_p` included; no reduction predicate used | none |
| Split reduction scoped to a DVR (lines 224–226, 369–372, 1341–1343) | pinned `TateCurve/Reduction.lean` lines 60, 67, 88 | `isIntegral_tateCurveAt` before, `hasSplitMultiplicativeReduction_tateCurveAt` after `variable [IsDiscreteValuationRing 𝒪[K]]` | README scope equals the pin's | none |
| Already in Tau Ceti (sample, changed lines 221–226) | four names at the pin | `tateUniformization` (`Uniformization.lean:50`), `tateUniformization_injective` (`Injectivity.lean:201`), `map_algEquiv_tateUniformizationBaseChange` (`Galois.lean:110`), `hasSplitMultiplicativeReduction_tateCurveAt` (`Reduction.lean:88`), all in namespace `TauCeti` | names and files correct | none |
| "each finite extension `L` is again one" (line 1330) | `L/K` finite, `K` complete non-archimedean | the norm extends uniquely, `L` is complete and ultrametric; the pin's equivariance takes `[NormedAlgebra K L] [CompleteSpace L] [IsUltrametricDist L]` | the `K`-statement covers each `L` | none |
| Layer order (lines 429, 1374–1376) | Layer 4's Tate bullet against Layer 5 | no twist in lines 1322–1346; Dependencies name Layers 1, 2, 3 and Mathlib only | "dependency order" holds | none |

The rows of the previous review, of `1fe14b8`, stand for the untouched statements (`sq_dvd_four_mul_cube_add_of_isOfFinAddOrder`, `LFunction_eq_of_isogeny`, `bsdQuotient_eq_of_isogeny` and the README Checks).

- Source locators checked against a text: 0 in the changed passages (their sources are under `## Not verifiable`).
- Library declarations opened at the pin: Tau Ceti `TateCurve/Uniformization.lean:29–32, 50, 57, 69, 102`, `Coordinates.lean:73, 79`, `Injectivity.lean:58, 201`, `Galois.lean:104–114`, `Reduction.lean:60, 67, 71, 88`.
- Cross-roadmap: no other roadmap on main or in an open pull request declares a Tate-uniformisation statement or the name `tateUniformization_bijective_and_map_mul`; the roadmaps that mention the uniformisation cite this roadmap's Layer 4.
- Dependency check: `depcheck: 234 roadmaps, 2510 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Gate at this head: every check 0, OK (the worker's run: `build=0`). `lake env lean` on `Suggested.lean`: four `sorry` warnings (lines 44, 66, 85, 98), nothing else.
- Elaborated types of the four declarations compared with their README statements: equal; nothing changed.
- No file outside `TauCetiRoadmap/EllipticCurves/` changes; `overlaps` lists no dropped id and no other pull request changing this roadmap.
- Pull-request text against the head: title ("the four open headlines"), summary block and prose agree (four declarations, four Tau Ceti imports, the Tate strand's scoping, Layer 4's Dependencies); no sentence contradicted, no change unstated.

Overlap check: read AlgebraicCurves, ModularCurves, EllipticLegendreCharacterInterfaces (main), EllipticCurvePeriodsAndModularParametrizations, HyperellipticCurves, EffectiveDiophantineMethods (open); places and the fundamental identity: AlgebraicCurves owns, this roadmap consumes; the Tate uniformisation, the BSD quotient over `ℚ`, Cassels' theorem, Nagell–Lutz and quadratic twists: this roadmap owns, the others cite; nothing owned twice.

Source independence: changed passages only: 4 passages (`README.md` lines 221–226, 369–372, 1329–1346; `Suggested.lean` lines 34–43) with 0 sources, since ATAEC, Tate 1995 and Roquette 1970 could not be read; largest share AEC, about 61 of 77 locators, text not read; no layer added, removed or reordered, so the contents comparison of `1fe14b8` stands: independent.

Research link: `Suggested.lean` states Tate's uniformisation over a complete non-archimedean field (Tate 1995; Roquette 1970), Cassels' isogeny invariance of the Birch–Swinnerton-Dyer quotient (Cassels 1965; Milne 2006) and the classical Nagell–Lutz bound; Layer 4.5b follows Kraus (1989), Layer 8 Balakrishnan–Ho–Kaplan–Spicer–Stein–Weigandt (2016). Rests on MilneADT lines 3666–3668, BHKSSW lines 52–55 and the README's references.

## Not verifiable

- ATAEC V.3.1 and V.5.3, Tate 1995 and Roquette 1970, cited by the changed passages (`README.md` lines 1343–1346, `Suggested.lean` lines 34–36): not in the sources cache; that the uniformisation is onto over a complete field that is not discretely valued rests on the README's attribution.
- The items listed as not verifiable in the review of `1fe14b8` (AEC, the other ATAEC locators, Stichtenoth, Katz–Mazur, Kraus 1989, Cassels 1965, Rubin, the mathlib pull requests, the LMFDB labels, the `ℚ(√65)` curve, the periods) are untouched and stand as there.

## Source issues

- none

## For the human reviewers

- Scope: the layer headings from Layer 1 to Layer 7, and the section comments of `Suggested.lean` lines 52 and 73, carry AEC chapter numbers; the titles name the mathematics, and roadmaps on main link to three of these anchors.
- Licence: `README.md` lines 61–67 and 2415–2419 take the `Isogeny` definition from D. Angdinata's unpublished shared files, with no public revision or stated licence; the same structure is in pinned Tau Ceti (`Isogeny/Basic.lean:139`).
- Not tested: AEC holds about 61 of 77 locators and could not be read; the wording and contents comparisons were not made against its text.
