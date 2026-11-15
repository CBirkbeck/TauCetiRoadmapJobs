# Review of SpecialFunctionsLegendre (pull request #2121 at ba0e38a)

**Verdict:** needs changes

## R01 (P3) — the description's list of corrected DLMF statements omits §14.2(iii)

- **Location:** description, "The roadmap states corrected forms of these DLMF statements, the first four recorded in the errata note:" and its eight bullets; `TauCetiRoadmap/SpecialFunctionsLegendre/README.md` 5.1, lines 644–656.
- **Claim:** the list names every DLMF statement the roadmap states in corrected form. 5.1 also corrects the recessiveness statements of §14.2(iii) and §14.21(ii), and the list leaves them out.
- **Witness:** DLMF §14.2(iii) (cached text lines 242, 251–253) calls the pairs recessive for all `Re μ ≥ 0`. README 5.1 requires `Re μ > 0` or `μ = 0`, because at `ν = 0`, `μ = i`, `|𝖯^{−i}_0(x)/𝖯^{−i}_0(−x)| = 1`.
- **Repair:** add this bullet after the 14.17.7 bullet: "- the recessiveness statements of §14.2(iii) and §14.21(ii) (5.1): DLMF states them for `Re μ ≥ 0` (and `Re ν ≥ −½`), but `𝖯^{−μ}_ν(±x)` and `P^{−μ}_ν` are recessive at the finite singularities only for `Re μ > 0` or `μ = 0`, and `𝑸^μ_ν` at `∞` only for `Re ν > −½` or `ν = −½`; at `ν = 0`, `μ = i` the ratio `𝖯^{−i}_0(x)/𝖯^{−i}_0(−x)` has modulus `1`."

## R02 (P3) — the description says Tau Ceti has no spherical harmonic

- **Location:** description, "What exists and what is missing", third bullet: "Neither has a Ferrers function, an associated Legendre function of non-integer degree or order, or a spherical harmonic."
- **Claim:** neither pinned library has a spherical harmonic.
- **Witness:** Tau Ceti `MvPolynomial.harmonicSphereRestriction` (`TauCeti/Analysis/MvPolynomial/Sphere.lean:115`, injective at line 126) maps the harmonic homogeneous polynomials of degree `d` onto the degree-`d` spherical harmonics. README line 262 cites it, and line 274 cites `MvPolynomial.sphereEval`.
- **Repair:** replace the second and third bullets with "- Tau Ceti has the complete elliptic integrals with their hypergeometric forms, harmonic polynomials with the harmonic (Fischer) decomposition, and their restrictions to the unit sphere (`MvPolynomial.sphereEval`, `MvPolynomial.harmonicSphereRestriction`), the real spherical harmonics of each degree." and "- Neither has a Ferrers function, an associated Legendre function of non-integer degree or order, or the spherical harmonics `Y_{l,m}(θ, φ)` in spherical coordinates."

## Previous findings

- none: the review of `ba0e38a` raised no finding.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 5.1 recessiveness against DLMF §14.2(iii) | `ν = 0`, `μ = i`, `x = 0.9`, `0.999999` | `𝖯^{−i}_0(x)/𝖯^{−i}_0(−x) = R^{−i}` with `R = 19` and `≈ 2·10⁶`: modulus `1` both times; DLMF's "recessive" needs the ratio to tend to `0` | README right, DLMF wrong; description omits it | R01 |
| 5.1 control case, `Re μ > 0` | `ν = 0`, `μ = 1`, `x = 0.9` | `𝖯^{−1}_0(0.9) = 0.229416`, `𝖯^{−1}_0(−0.9) = 4.358899`, ratio `1/19 = 0.052632`, `→ 0` | recessive, as stated | — |
| Description: "neither has … a spherical harmonic" | Tau Ceti `harmonicSphereRestriction (Fin 3) d`, `d = 1, 2` | `X 2 ↦ cos θ = (4π/3)^{1/2} Y_{1,0}`; range dimension at `d = 2`: `6 − 1 = 5 = 2·2 + 1` | Tau Ceti has degree-`d` harmonics, not `Y_{l,m}` | R02 |
| Description: 14.17.7 restricted to `m ≤ n` | `(l, m, n) = (3, 2, 1)`, `(1, 2, 1)` | `(5/2)∫₋₁¹(2x − 3x² + x⁴)dx = −4` against printed `0`; `𝖯²₁ = 0` gives `0` against printed `2/3` | description right | — |
| Description: sign of 14.7.21 for `h < −1` | `(x, h) = (0, −2)` | `h⁻¹(1 + h⁻²)^{−1/2} = −½(5/4)^{−1/2} = −0.4472136`; printed `(1 + 4)^{−1/2} = +0.4472136` | description right | — |
| Description: 14.20.10 diverges at `θ = π` | terms `k = 1, 2, 3` | lower bounds `((2k−1)!!/(2k)!!)² = 0.25, 0.140625, 0.097656`, `∼ 1/(πk)`, so the sum diverges | description right | — |
| Description, Build: "(42 headline theorems)", "at the pins of main" | `Suggested.lean` at `ba0e38a` | 42 `theorem`s, 42 `sorry` warnings, 0 errors; `lake-manifest.json` against `origin/main` (`4d169a9`): no difference | holds | — |

The rows for untouched statements stand as in the previous review, of `ba0e38a`.

- Changed passages: none. The folder has 0 changed lines since `ba0e38a`, and nothing outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Description, read sentence by sentence against this head: the "adds" statement, the definitions paragraph (14.3.1, 14.3.6, 14.3.7, 14.3.10, 14.3.12), the 11 layer titles, the Beyond list (README lines 1172–1207), the Chapter 10 formulas (lines 1163–1165), the three suppliers, the imports, the local `𝐅`, and the eight corrections (README lines 586–595, 726, 786, 811–814, 957, 968–978, 1034, 1038). The CI `build` job, which runs the topics check (`ci.yml:134`), succeeded at `ba0e38a`. R01 and R02 are the only defects found.
- Suppliers resolved on main (`4d169a9`): SpecialFunctionsHypergeometric Downstream (lines 1129–1130) assigns 15.9.16–15.9.23 to "a roadmap for the Legendre functions (DLMF Chapter 14)"; SpecialFunctionsEiLiErfIncompleteGamma 4.1 (line 700); RiemannianGeometry R8.2 (line 4869). The 6.2 *Needs:* line uses 15.8.1 (Pfaff) and Layer 7 (quadratic), as the description says.
- Library declarations opened at the pins (11): Mathlib `Polynomial.shiftedLegendre` (`RingTheory/Polynomial/ShiftedLegendre.lean:40`), `Complex.Gamma_mul_Gamma_one_sub` (`Analysis/SpecialFunctions/Gamma/Beta.lean:398`), `Complex.Gamma_mul_Gamma_add_half` (same file, line 580), `InnerProductSpace.instLaplacian` (`Analysis/InnerProductSpace/Laplacian.lean:138`); Tau Ceti `legendreK`, `legendreEc` (`EllipticIntegral/Legendre.lean:95, 98`), `legendreK_eq_ordinaryHypergeometric`, `legendreEc_eq_ordinaryHypergeometric` (`EllipticIntegral/Hypergeometric.lean:134, 142`), `harmonicSubmodule` (`RingTheory/MvPolynomial/Harmonic.lean:210`), the Fischer decomposition (same file, line 327) and `harmonicSphereRestriction` (`Analysis/MvPolynomial/Sphere.lean:115`). Neither pin has a declaration matching `ferrers`, `associatedLegendre` or `sphericalHarmonic`.
- Sources: DLMF §14.2(iii) read at its text (lines 240–256) for R01, and DLMF §14.12 checked for the four integrals the description's Layer 7 line names: Mehler–Dirichlet 14.12.1, Laplace 14.12.7, Neumann 14.12.13 and Heine 14.12.14, all targets of 7.1–7.2.
- Gate rerun at `ba0e38a`: every check `0`, OK. The worker's run also reports `build=0`. Dependency check: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Elaboration (`lake env lean`): 42 warnings, all "declaration uses `sorry`", and nothing else.
- Overlap check: read SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsEiLiErfIncompleteGamma (main), and SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsStruve, SpecialFunctionsAppell (open). A search of every open head and of main for these objects also found QuantumFoundations 9.3 (open). Nothing is shared. SpecialFunctionsHypergeometric assigns 15.9.16–15.9.23 here. QuantumFoundations 9.3 states the operator spectra of `L²` and `L₃` from RiemannianGeometry R8.2, not the coordinate basis `Y_{l,m}` or 14.30.11–14.30.13.
- Source independence: changed passages only. 0 passages changed and none compared. The contents were not compared again because no layer was added, removed or reordered. The largest share of locators is DLMF Chapter 14, about 717 of 736 locator mentions.
- Remark (untouched text, no change asked): the summary (README line 46, "rests on Mathlib, Tau Ceti and two roadmaps") and the boundary sentence (lines 141–142) name two supplier roadmaps. The contracts (line 257) add RiemannianGeometry as a third.

## Not verifiable

- Hobson (1931, pp. 386–389, 399–401), cited in the untouched 9.1: no open copy was fetched, as in the previous review.
- The description's account of the two local reviews ("three findings", "six findings", all addressed): no report of them is available to this review.

## Source issues

- **Error** in DLMF 1.2.8 at §14.2(iii), equations 14.2.3–14.2.11 and the text after them: the source says `𝖯^{−μ}_ν(±x)` are recessive at `±1` whenever `Re μ ≥ 0`, and that `P^{−μ}_ν`, `𝑸^μ_ν` are recessive at `1`, `∞` whenever also `Re ν ≥ −½`; it should be that recessiveness at `±1` needs `Re μ > 0` or `μ = 0`, and at `∞` needs `Re ν > −½` or `ν = −½`; affects a stated result.

## For the human reviewers

- Licence: README "Prior formalization" names `lean-DLMF` (Apache-2.0, LICENSE at its repository root) as source material for every layer. `ferrersP_zero_count` has the same name as `DLMF/Legendre/Zeros/FerrersAndReal.lean:290` there, but its hypotheses and statement differ.
