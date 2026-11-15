# Review of AutomorphicGaloisRepresentations (pull request #1007 at 480c64f)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 480c64f. The folder is unchanged and stands as reviewed; the three findings are all in the pull request's description, which no earlier review read against the head. None asks for a change to `README.md` or `Suggested.lean`.

## R01 (P3) — The description says the roadmap builds the weight-one argument; the head imports it

**Location:** pull request description, summary block: "with weight one handled by sparse eigenvalues and finite-group lifting"; and the first prose paragraph: "with a separate weight-one finite-image argument".

**Claim:** Under "What this roadmap builds", the description presents the Deligne–Serre argument as this roadmap's work. At this head the roadmap owns none of it.

**Witness:** `README.md` lines 1965–1970: "AlgebraicModularFormsAndSerreWeights §§6.3–6.4 (R15.5A.2a–R15.5A.3) owns the classical weight-one theory … This layer has the single target §2.10, which places that attachment in the normalization of §1.5."

**Repair:** In the summary block write "with the weight-one Artin representation imported from AlgebraicModularFormsAndSerreWeights §§6.3–6.4 and placed in the same normalisation (§2.10)". In the prose paragraph replace "with a separate weight-one finite-image argument" by "and compares the supplied weight-one Artin representation with that normalisation".

## R02 (P3) — The description does not say that the roadmap owns the analytic quaternionic theory and the eigenvariety

**Location:** pull request description, summary block ("What this roadmap builds", "Approach and generality") and the first prose paragraph: neither names §§0.2a–0.3.

**Claim:** The description omits an owned block of about 745 of the README's 3899 lines (lines 749–1492). A reader must know of it, because the open roadmap QuaternionicModularForms plans the same objects.

**Witness:** `README.md` lines 85–90: "The analytic and overconvergent quaternionic forms built on them are the targets of §§0.2a–0.2f … Section 0.3 owns the eigenvariety gluing on these objects". QuaternionicModularForms' open head `README.md` lines 34–38 owns "analytic and overconvergent forms … property (Pr)".

**Repair:** Add to "What this roadmap builds": "Layer 0 also builds, on the classical quaternionic forms of GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d, the analytic and overconvergent quaternionic forms over totally real fields, their compact operator `U_P`, Fredholm series, slope decompositions and families, theta maps and small-slope classicality (§§0.2a–0.2f), and the quaternionic eigenvariety (§0.3) that Skinner's coefficient-prime argument uses."

## R03 (P3) — "of any infinity type" is wider than the head

**Location:** pull request description, summary block: "For cuspidal GL₂ representations over totally real fields, of any infinity type, the roadmap realises rank-two λ-adic Galois representations geometrically".

**Claim:** The head treats only the regular types `(k,w)`; over `F≠ℚ` no weight-one (or partial weight-one) type is covered, and over `ℚ` weight one is not realised geometrically.

**Witness:** `README.md` line 115: "with `k_τ≥2, k_τ≡w` modulo 2"; line 1986: "Weight one does not define a `Sym^{k−2}` DFG premotive or a regular Hilbert infinity type". Parallel weight one over `ℚ(√5)` has `k_τ=1`.

**Repair:** Replace "of any infinity type" by "of every regular infinity type `(k,w)` (all `k_τ≥2`, `k_τ≡w` mod 2, parallel or not)".

## Previous findings

- none: the previous report (PRREVIEW r10, at 480c64f) was an acceptance and listed no finding, and it marked nothing "not actionable".

## Verified sound

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Description: density one of ordinary primes, `fixedSquarefreeForm_ordinary_density_one` (§7.7, the statement the description cites) | 11a1 = `η(z)²η(11z)²`, coefficients recomputed for `p<200` | `a₂=−2∈(2)`, `a₁₉=a₂₉=0`, `a₁₉₉≡0 (mod 199)`: nonordinary good primes `{2,19,29,199}`; 41 of 45 good primes ordinary; `a₁₁=1` but `11∣N`. | True; consistent with density one |
| Description: "non-CM" against the Lean hypotheses `Squarefree N`, `f.χ = 1` | the smallest weight-two CM levels with trivial character | 27=3³, 32=2⁵, 36=2²·3², 49=7²: none squarefree, so the Lean hypotheses exclude CM, as README §7.7 says. | True |
| Description: weight one "handled by sparse eigenvalues and finite-group lifting" | Layer 2 at the head | One target, §2.10, a comparison of polynomials: `η(z)η(23z)`, `p=2` gives `X²+X+1` on both sides; the argument itself is in AlgebraicModularFormsAndSerreWeights §§6.3–6.4. | False as a description: R01 |
| Description: "of any infinity type" | `F=ℚ(√5)`, parallel weight one | `k_τ=1` fails the Conventions' `k_τ≥2`. | False as a description: R03 |

The rows for the statements of `README.md` and `Suggested.lean` stand as in the previous review, of `480c64f`: this head changes none of them.

- **Gate**, rerun on this head: every check 0, `OK`, exit 0; the worker's gate at this head reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Dependency check:** `depcheck: 245 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0; the only warning is `declaration uses 'sorry'` at line 89. The signatures in `signatures.md` are those of r10 (the entry `for` at line 32 is docstring text, not a declaration).
- **Description sentences checked against the head and found right** (12): the title; folder contents; "the Lean states only real-bodied definitions" (one `def`, one `theorem`); the Lean imports no roadmap; DFG premotives and Scholl projector (§§1.3–1.5); local compatibility and Ramanujan (§§4.2–4.7); Skinner beyond Kisin's residually irreducible case, no discrete-series place (§§4.6–4.7, 3.10); dyadic primes (lines 402, 2868); Wach lattices imported (lines 106–109); integral Hecke families (Layer 6); residual ramification and density (§§7.6–7.7); the validation paragraph (gate above).
- **Library declarations opened at the pins** (2): `TauCeti.det_tateModuleGaloisRepresentation` (Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52`); `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`).
- **Seeded sample and source locators:** no sampled target falls in a changed passage (the folder has none), and the README flags no locator as unverified; no source was re-read this round.
- **Citations and overlaps:** `citations.md` reports no cross-roadmap citation found nowhere (its two Lean-name leads were resolved in earlier reports, in IntegralHeckeAndGaloisDeterminants); `overlaps.md` reports no pull request changing this roadmap and no dropped or revision-only id.
- **Remark (untouched text, passed by the earlier reviews; no change asked here):** QuaternionicModularForms at its open head (Layers 1–5, and "Downstream consumers", line 1521, naming this roadmap's §0.3) plans the analytic weights, overconvergent forms, Fredholm theory and theta classicality that §§0.2a–0.2f here also own.

Overlap check: read QuaternionicModularForms and PadicFamilies (open heads; scope sections); ModularForms and CompactOperators (main) stand as in the review of 480c64f. Shared with QuaternionicModularForms: analytic and overconvergent quaternionic forms, their Fredholm theory and theta classicality — owned here in §§0.2a–0.2f and also planned there (the remark above). PadicFamilies owns the general eigenvariety machine for a `(Pr)` module and modular-symbol families; nothing quaternionic shared.

Source independence: changed passages only — the folder has no changed passage, so 0 passages were compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered); the result of the review of 480c64f stands.

## Not verifiable

- **T. Saito, *Modular forms and p-adic Hodge theory*, Theorem 1 (`SaitoMFPH`):** recorded as uncertified (paywalled), cited by its locator; settled, and outside this round's changes.

## Source issues

- none

## For the human reviewers

- none
