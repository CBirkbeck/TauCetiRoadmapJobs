# Review of IntegralIwasawaTheory (pull request #1306 at eaaddd4)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since eaaddd4 (0 lines), and the gate passes. Both findings are P3 and concern the pull request's description only, which no longer matches this head; no file in the folder needs to change.

## R01 (P3) — The description counts three consumers; the README names eight

**Location:** pull request description, summary block: "Three downstream roadmaps consume it."

**Claim:** The head contradicts the count. The README also hands §§1.5–1.6, 3.3 and 7.4 to CyclotomicClassGroupsAndStickelberger and the §9.5 Hilbert attachment to four further roadmaps.

**Witness:** `TauCetiRoadmap/IntegralIwasawaTheory/README.md` line 1883 ("CyclotomicClassGroupsAndStickelberger §§3.4, 6.1–6.4 and 7.1–7.3 import…") and lines 13 and 1889 (AutomorphicGaloisRepresentations §3.10, HilbertModularVarietiesAndShimuraCurves §R18.3.29, WeightsInEtaleCohomology R34.3/R34.6, AlgebraicModularFormsAndSerreWeights R15.5A.1).

**Repair:** Replace the sentence and the three that follow with: "Downstream roadmaps consume it. SpecialValuesBirchTate takes the dyadic Euler characteristic and its 2^[F:ℚ] correction for Birch–Tate. EulerSystemsCyclotomicMainConjecture takes growth, control, uniform capitulation and independent μ-vanishing; EulerSystemsAndKolyvaginSystems takes the exterior-bidual and Rubin-lattice core of §12.6. CyclotomicClassGroupsAndStickelberger imports the prime-power unit-index and circular-unit formulas (§§1.5–1.6), `classNumberGrowth` and `VandiverCondition` (§7.4). AutomorphicGaloisRepresentations, HilbertModularVarietiesAndShimuraCurves, WeightsInEtaleCohomology and AlgebraicModularFormsAndSerreWeights import the parallel-weight Hilbert Galois representation of §9.5, ℚ included."

## R02 (P3) — The description omits the p-adic Baker–Brumer theorem and misdescribes the headline carriers

**Location:** pull request description, summary block: "The headline statements are phrased on Mathlib's class groups, class numbers and CM unit index, so they plug directly into existing API."

**Claim:** One of the six headline theorems is not on those carriers, and the description never says that the roadmap proves the p-adic Baker–Brumer theorem itself (§§4.1a–4.1e) rather than importing it.

**Witness:** `Suggested.lean` line 135, `bakerBrumer_expDisc`: stated on `NormedSpace.exp` over `[NormedField L] [NormedAlgebra ℚ_[p] L] [CompleteSpace L] [IsAlgClosed L]`; README Summary and Scope (lines 3, 11) name it and §§4.1a–4.1e as owned.

**Repair:** In "What this roadmap builds", after "abelian Leopoldt" add: "(through its own proof of the p-adic Baker–Brumer theorem with a constant term, `bakerBrumer_expDisc`, §§4.1a–4.1e, over every complete algebraically closed normed field over ℚ_p)". Replace the quoted sentence by: "Five headline statements are phrased on Mathlib's class groups, class numbers and CM unit index, and `bakerBrumer_expDisc` on Mathlib's `NormedSpace.exp`, so they plug directly into existing API."

## Previous findings

- none: the previous review, of this same head, accepted with no finding; its six `## Previous findings` bullets (all "repaired") stand, since the folder has not changed.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `bakerBrumer_expDisc` (R02; description's "abelian Leopoldt") | p=3, ℓ=log 4; no `hli`: ℓ=(log 4, log 16); p=2, ℓ=2 | ρ₃=3^{−1/2}≈0.577; ‖log 4‖₃=‖3‖₃=1/3<ρ₃, exp ℓ=4: conclusion says log 4 is transcendental. β=(2,−1): 2·log 4−log 16=0, β≠0. ‖2‖₂=1/2=ρ₂, excluded; `‖2ⁿ/n!‖₂=2^{−s₂(n)}`↛0 | holds; `hli` and the strict disc needed |
| `classNumberGrowth` (cited by the description) | K=ℚ, p=3, cyclotomic ℤ₃-extension; n=0 | n=0: subgroup is all of Gal, layer=ℚ, h=1. Layers ℚ(ζ₉)⁺, ℚ(ζ₂₇)⁺: h=1, so v=0 and (μ,λ,ν)=(0,0,0) | holds |
| `ferreroWashington` (cited by the description) | E=ℚ, p=3 | 3 is regular: 3∤h(ℚ(ζ_{3^{n+1}})) for all n, v=0, μ=0 with (λ,ν)=(0,0) | holds |
| Description: "IntegralHeckeAndGaloisDeterminants, whose local Ribet contract §9.6 consumes" | supplier head cb05366 | "## Layer 6: integral Ribet modules and Fitting ideals" at its README line 3622; `IntegralRibet.local_ribet` at lines 5103, 5116 | correct |
| Description: "Roadmaps on main are cited by name; everything else … is a consumer" | 14 suppliers of README lines 33–51 | 13 are on main (GlobalNumberFields, LocalFieldsRamification, LocalGaloisGroups, ProfiniteArithmetic under `Completed/`); the 14th is IntegralHeckeAndGaloisDeterminants, merge position 28 < 30 | correct |

No statement changed; the rows for the other statements stand as in the previous review, of `eaaddd4`.

- Gate: `tauceti-roadmap … gate … IntegralIwasawaTheory --base origin/main` exits 0; every check is 0 and the run ends `OK`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean` exits 0; the only diagnostics are six `declaration uses sorry` warnings (lines 80, 92, 113, 135, 146, 162).
- Dependency check: `depcheck: 245 roadmaps, 2211 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/IntegralIwasawaTheory'` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`, as the description says.
- Description checked sentence by sentence against the head: title, the three summary paragraphs, the prose paragraph, the folder line, the dependency paragraph and the validation line. Apart from R01 and R02 each agrees with README lines 3–17, 33–51 and 1875–1893 and with the gate (set_option=0, readme-ids-missing=0, round-labels=0, empty-sections=0).
- Cross-roadmap citations resolved: the consumers of R01 at their open heads (CyclotomicClassGroupsAndStickelberger 10bc9eb cites this roadmap by section 39 times, AutomorphicGaloisRepresentations 480c64f 13 times, EulerSystemsAndKolyvaginSystems ccd7e7a has "### From IntegralIwasawaTheory §12.6" at line 75).
- Seeded sample: no passage changed, so none of the 15 targets falls in a changed passage; no source was reopened.
- Remark (untouched text): SpecialValuesBirchTate, named as a consumer at README lines 17 and 1893 and in the description, is not on main, not among the open roadmap pull requests, not in the merge order and not in the board's package list.

Overlap check: read EulerSystemsCyclotomicMainConjecture, CyclotomicClassGroupsAndStickelberger, NoncommutativeAndEquivariantIwasawa, IntegralIwasawaTheoryPartII, PadicMeasuresIwasawaAlgebras, LinearFormsInLogarithms; the rational main-conjecture endpoint is shared with EulerSystemsCyclotomicMainConjecture and owned here (it consumes this roadmap); §§1.5–1.6 and 7.4 are owned here and imported by CyclotomicClassGroupsAndStickelberger; the p-adic Baker theorem with a constant term is stated both here (§4.1e) and by LinearFormsInLogarithms §8.10 on main (see the human reviewers' section).

Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Whether a roadmap named SpecialValuesBirchTate is planned: found in none of the four places listed in the remark above.
- "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package" (description): nothing in the folder records it.
- The sources listed as not verifiable in the previous review (NSW ed. 2.3, Wiles, Taylor, Burns–Flach, Koblitz, Baker, Hindry–Silverman, Katz) were not reopened.

## Source issues

- none

## For the human reviewers

- **Scope / ownership.** LinearFormsInLogarithms, now on main, states the p-adic Baker theorem over `ℂ_[p]` (its §8.10, `PadicBaker.eq_zero_of_add_sum_mul_eq_zero`) and names this roadmap as its consumer (its README line 1374); this roadmap proves the same theorem in §§4.1a–4.1e and does not cite it.
