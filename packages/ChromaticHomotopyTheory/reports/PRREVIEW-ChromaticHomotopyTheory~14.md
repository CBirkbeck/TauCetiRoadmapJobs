# Review of ChromaticHomotopyTheory (pull request #1643 at 8ecccd2)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since 29867f9 (one bullet of §4.2, README:371), plus the first check of the pull request's title and description against this head. The folder's change is sound; the four findings are all in the pull request's description, which was written for an earlier head.

## R01 (P3) — Description credits this roadmap with the real Bott comparison

**Location:** pull request description, `<!-- roadmap-summary -->`, first paragraph: "shows ko→KO is a T(n)-equivalence for n≥1".
**Claim:** The head does not prove this; it assigns it to a supplier.
**Witness:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:10`: "§4.30a owns the positive-height real Bott comparison, that ko→KO … are T(n)-equivalences for n≥1" (GeneralAlgebraicKTheoryPartII; its README:1206 at the head of its open pull request has the heading "4.30a Real Bott localization at positive height").
**Repair:** Replace the clause by the two Layer 4 headlines the paragraph omits: "proves that the connectivity bound m=n+1 suffices in periodic vanishing (§4.3) and the weak-ring height criterion (§4.4)".

## R02 (P3) — The prose paragraph describes layers that the head hands to GeneralAlgebraicKTheoryPartII

**Location:** pull request description, first paragraph after the summary block: "Build a general chromatic homotopy library from finite p-local spectra and oriented theories to periodic detection, Bousfield–Kuhn functors, telescopic Tate vanishing, finite-local blueshift and ring height. Develop the all-prime real K-theory, modular-form and James-filtered Thom applications that supply chromatic algebraic K-theory".
**Claim:** The head owns none of the listed constructions except the modular one, and the direction of supply is the reverse of "supply chromatic algebraic K-theory".
**Witness:** README:9–10: GeneralAlgebraicKTheoryPartII §§4.10–4.12 own Bousfield–Kuhn functors, §§4.22–4.25 telescopic Tate vanishing and blueshift, §§4.26–4.29 ring height, §4.30a real Bott, §§4.31–4.33 the James application; README:127 has the heading "From TauCetiRoadmap.GeneralAlgebraicKTheoryPartII".
**Repair:** Replace the paragraph by: "Layers 0–2 are convention Checks on supplied finite spectra, orientations and periodicity. Layers 3–5 add the spectrum-valued Serre filtration, the completed KU Tate calculation, the higher norms and chromatic ∞-semiadditivity, the sharp bound m=n+1, the weak-ring height criterion and full-level TMF(N) Galois extensions. They consume the periodic, Bousfield–Kuhn, Tate, blueshift, ring-height, real Bott and Thom interfaces of GeneralAlgebraicKTheoryPartII. Higher-height telescope separation is the Part II ownership boundary."

## R03 (P3) — Description says the Lean file states definitions and theorems; it states none

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".
**Claim:** `Suggested.lean` at this head has no declaration and elaborates with no warning.
**Witness:** `TauCetiRoadmap/ChromaticHomotopyTheory/Suggested.lean`: `import Mathlib`, one docstring, an empty `namespace TauCetiRoadmap.ChromaticHomotopyTheory`; the worker's table: "Lean declarations: 0 removed, 0 added"; `lake env lean` on it: exit 0, no output.
**Repair:** "`Suggested.lean` declares nothing: its docstring names the six headline theorems (§§3.1, 4.1, 4.2, 4.3, 4.4, 5.1) as not statable at the pins, each with the carrier it lacks." and "the targeted Lake build succeeds with no warning".

## R04 (P3) — `WeierstrassCurve.formalGroup` attributed to Mathlib

**Location:** pull request description, `<!-- roadmap-summary -->`, third paragraph: "Mathlib's `FormalGroup` and `WeierstrassCurve.formalGroup` carry the formal laws".
**Claim:** The second declaration is Tau Ceti's.
**Witness:** README:17: "Tau Ceti already supplies `WeierstrassCurve.formalGroup`"; README:69–71 list it under "From Tau Ceti" (Tau Ceti `AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58`, per the review of 29867f9).
**Repair:** "Mathlib's `FormalGroup` and Tau Ceti's `WeierstrassCurve.formalGroup` carry the formal laws".

## Previous findings

- none: the previous report (of 29867f9) was an acceptance with no finding, and no repair report marks anything "not actionable in this package".

## Verified sound

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| §4.2 bootstrap bullet (README:371), hypotheses against csy | csy line 3445–3454 (Theorem 4.3.10; page marker 69 at line 3453) | README: 1≤m≤∞; (1) C 1-semiadditive, (2) R_C→R_D detects invertibility, (3) for 0≤k<m with B^kC_p dualizable in D, dim_D in R_D^tf rational nonzero; conclusion C, D m-semiadditive. Source: the same three, same conclusion | Pass |
| Same bullet, m=1 | k=0 only | B⁰C_p=C_p, dim_D=p; conclusion is hypothesis (1) plus D 1-semiadditive (csy line 3455, via Corollary 3.3.2) | Pass |
| Same bullet, "nothing of the kind is required of D" | csy Proposition 4.3.9 (line 3426) versus Theorem 4.3.10 | 4.3.9 assumes both m-semiadditive; 4.3.10 assumes only C 1-semiadditive | Pass |
| Same bullet against the §4.2 application (README:373) | n≥1; k=0, k=n, k>n | dimension p^(binom(n,k)): p, p, 1; all nonzero integers in torsion-free π₀E_n; route says "under its three hypotheses", bullet lists three | Pass |
| Definitions of rational and R^tf in the bullet | csy line 2898–2901, line 2950–2951 | ℤ[S⁻¹]⊆ℚ with S the primes invertible in R; R/I_tor | Pass (text unchanged by the diff) |

Rows for every other statement stand as in the previous review, of 29867f9.

- Source locators checked against the text: 3 (csy Definition 4.1.8, Definition 4.1.14, Theorem 4.3.10); the seeded sample falls in the changed passage only at §4.2, covered by the rows above.
- Cross-roadmap citations: the diff adds none; `citations.md` lists none unresolved; GeneralAlgebraicKTheoryPartII §4.30a resolved at its open head (README:1206).
- Gate, re-run at 8ecccd2, exit 0: every counter 0, `OK`; the worker's run adds `build=0`.
- Dependency check, in full: `depcheck: 243 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, no output; the file has no declaration, so no `#check @name` comparison and no one-tactic probe apply.
- Outside the folder: the diff against `origin/main` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Description sentences checked and found to agree with the head: Serre filtration over every CW base and every E (README:291); π₀ of the completed KU Tate spectrum ℚ_p(ζ_p) with vanishing T(1)-localization (README:333); the oriented-tower route (README:335); every N≥1, no Weil-pairing value (README:455); Part II separation for n≥2.
- Overlap check: read GeneralAlgebraicKTheoryPartII, BordismFormalGroups, EllipticCohomology (their ownership as stated at README:7–11 and, for §4.30a, at the supplier's head); the changed passage adds no object; the bootstrap theorem is stated by no other roadmap (search for "bootstrap", "Theorem 4.3.10", "detects invertibility" over main and the open heads); nothing shared.
- Source independence: 1 passage compared with 1 source (changed passages only): README:371 against csy line 3445–3454, longest shared run 4 words ("is dualizable in D"), the rest forced terms; none shared. Largest share and contents: not compared again, the diff adds, removes and reorders no layer.

## Not verifiable

- HL13, Proposition 3.4.3, behind csy Lemma 5.1.7, is not in the source cache (unchanged).
- Ravenel–Wilson, Theorem 9.2, read only through csy line 3655 (unchanged).
- The description's sentence on AI assistance (the number of review and red-team rounds) was not checked.

## Source issues

- none

## For the human reviewers

- none
