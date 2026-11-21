# Review of SpecialFunctionsMathieu (pull request #2538 at 7e94e57)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The classification of the point at infinity of DLMF 28.2.2 in 1.4 now separates `q ≠ 0` (irregular) from `q = 0` (regular, exponents `±√a/2`) and says in which sense "rank one" is meant; I recomputed the two new Checks and they agree. There are no small corrections and no format notes; a licence point and the unread books are left to the human reviewers.

## Previous findings

- R01 — repaired: "at `∞` it has an irregular singularity for `q ≠ 0` and a regular one with exponents `±√a/2` for `q = 0`", with rank one "in the sense of DLMF §2.7(ii)" and §10.4 said not to apply.
- N01 — repaired: "The numbers are those of the layers above".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.4 singular point at `∞` of 28.2.2 (bullet, lines 358–362) | `q = 0`; `q ≠ 0`; DLMF §2.7(ii), §28.2(i) reread | `ζf → 1`, `ζ²g = −qζ − (a+2q)/4 + O(1/ζ)`; indicial `ρ² = a/4`; `f₀ = g₀ = 0`, `g₁ = −q`, so `λ² = 0` | true in both cases | none |
| 1.4 Check, expansions of `f`, `g` at `∞` (lines 379–380) | `a = 2.3`, `q = 0.7`, `ζ = 10³, 10⁴` | `ζ³(f − 1/ζ − ½ζ⁻²)` = `0.5005`, `0.50005`; `ζ³(g + q/ζ + (a+2q)/(4ζ²))` = `−0.9259`, `−0.9251`: both bounded | agrees | none |
| 1.4 Check, `q = 0`, `u = cos(√a z)` (lines 381–383) | `a = 2.3`, `ζ = −10⁸(1 − 10⁻³i)`, `−10¹²(1 − 10⁻³i)` | `−1.0375464 − 0.9848784i` at both; closed form `2^{√a−1} e^{−iπ√a/2} = −1.0375464 − 0.9848784i` | agrees | none |
| Conventions, correction to §28.2(i) (lines 255–256) | DLMF sentence after 28.2.2 reread | DLMF: irregular at `∞`, no condition on `q`; computed: regular at `q = 0` | agrees | none |
| Module docstring of `Suggested.lean` (lines 25–27) | AsymptoticExpansions `Suggested.lean` on main searched | only `regularSingular_solution` and `exists_rankOne_solution` (series hypotheses, `hne : lam₁ ≠ lam₂`); no predicate for a singular point | agrees | none |

The rows for the untouched statements stand as in the previous review, of `c287391`.

- The diff changes no Lean statement (the module docstring only) and no layer; none of the fifteen sampled targets lies in a changed passage, so the sample was not reread.
- Source locators checked against the text: DLMF §28.2(i) (the sentence after 28.2.2) and DLMF §2.7(ii) (the rank-one condition, 2.7.9, the equal-roots case), both read online.
- Cross-roadmap citations resolved on main: AsymptoticExpansions §10.3 (regular singularities at a finite point) and §10.4 (stated for roots `λ₁ ≠ λ₂`), in its README and its `Suggested.lean`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 48 warnings, all `declaration uses sorry`, and no error.
- Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- The pull request's description agrees with the head: it lists the ninth correction (§28.2(i)), says "false as stated or lack a condition", and its counts (eight layers, four suppliers, 48 theorems) are unchanged.
- Recomputed in double precision with the principal `arcsin` and square root: the values of the two new Checks of 1.4.

Overlap check: read SpecialFunctionsLegendre, SpecialFunctionsHeun, SpecialFunctionsConfluent, SpecialFunctionsBessel (as in the previous review; the change adds no object); nothing shared. Sturm comparison: owner SpecialFunctionsBessel (cited); Pincherle's theorem: owner SpecialFunctionsEiLiErfIncompleteGamma §4.1 (cited); Hilbert–Schmidt kernels: owner AutomorphicSpectralTheory §0.8 (cited).

Source independence: changed passages only; 4 passages compared with 1 source (DLMF: the sentence after 28.2.2 and §2.7(ii) against the bullet of 1.4, its two Checks and the Conventions entry), none shared beyond formulas; largest share DLMF, 213 of 293 source mentions as counted in the previous review; the diff adds, removes or reorders no layer, so the arrangement was not compared again (previous result: independent); the eight books could not be read.

Research link: Hill's discriminant, bands and gaps (Layer 3) are the spectral theory of periodic Schrödinger operators as in Levitan–Sargsjan 1991 and Kato 1995; the Mathieu and modified Mathieu functions are DLMF Chapter 28 and separate the Helmholtz equation in elliptic coordinates (Whittaker–Watson 1927). Rests on the README's sources and on DLMF as read.

## Not verifiable

- Whittaker–Watson, Levitan–Sargsjan, Kato, Hale–Koçak, Arnold, Courant–Hilbert, Temme, Kristensson: no legal copy found (the publishers' pages are paywalled); their section and page locators were not checked. None is cited in a changed passage.
- DLMF was read through a text rendering that loses radicals and nested fractions.

Automatic checks set aside as false positives: the report of a section heading of `Suggested.lean` with no declaration under it; the heading stands over the `#check` lines that pin the library declarations the README names, which the form allows.

## Source issues

- **Gap** in DLMF at §28.2(i), the sentence after 28.2.2, as read online on 2026-11-21: the source says the equation has an irregular singular point at infinity, with no condition; it should require `q ≠ 0`, since for `q = 0` infinity is a regular singular point with exponents `±√a/2`; affects a stated result.

## For the human reviewers

- **Licence.** The README's "Prior formalization" section says the roadmap reuses the design of the author's `lean-DLMF` (Apache-2.0) and that "reused code carries attribution"; I did not compare `Suggested.lean` with that repository.
- **Not tested.** The eight cited books could not be read, so wording and locators were compared with DLMF only; DLMF has the largest share of the locators (213 of 293 mentions) and was read through a text rendering.
- **Scope.** The roadmap states corrected forms of nine DLMF statements (Conventions, "Corrections to DLMF"), the ninth being the condition `q ≠ 0` at §28.2(i); whether to report them to NIST is not the roadmap's matter.
