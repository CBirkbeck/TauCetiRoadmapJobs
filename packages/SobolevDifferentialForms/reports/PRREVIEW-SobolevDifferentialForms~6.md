# Review of SobolevDifferentialForms (pull request #1609 at e38f0b5)

**Verdict:** accepted

Incremental re-review of the 5 lines changed since e8a0ed0, all in `TauCetiRoadmap/SobolevDifferentialForms/README.md` (lines 113–115, the paragraph after the Tau Ceti supplier list). No findings.

## Previous findings

- R01 — repaired: the paragraph now ends "`Orientation.formHodgeStar` is Mathlib's `exteriorPower.hodgeStar` on `⋀ᵏ V`, transported to alternating forms along `TauCeti.alternatingFormEquiv`." The K5a sentence is gone; `grep -i 'K5a\|ComplexKahler'` over the folder finds nothing.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| lines 113–115 (what the deletion leaves): the star used is `formHodgeStar` with `V = E`, standard orientation | `n = 2`, `k = 1`, law `α ∧ ⋆β = ⟪α, β⟫ vol` with `⋆e¹ = e²`, `⋆e² = −e¹` (the §1.2 Check) | `e¹∧⋆e¹ = e¹∧e² = vol`; `e²∧⋆e¹ = e²∧e² = 0 = ⟪e², e¹⟫`; `e²∧⋆e² = −e²∧e¹ = vol` | paragraph and §1.2 agree | none |
| same star, involution, against §1.2 | `n = 2`, `k = 1` | `⋆⋆e¹ = ⋆e² = −e¹`; `(−1)^{k(n−k)} = −1` | agree | none |
| Conventions `δ := (−1)^{n(k+1)+1} ⋆d⋆`, which consumes this star | `n = 2`, `k = 1`, `ω = f dx¹` | sign `(−1)^5 = −1`; `⋆ω = f dx²`, `d⋆ω = ∂₁f vol`, `δω = −∂₁f`; `−div(f, 0) = −∂₁f` | agree (`δ = −div` on 1-forms) | none |
| Scope bullet (lines 34–35) and Layer 1 against the shortened paragraph | every passage naming the star's owner | Scope: star "to Tau Ceti"; supplier list: `Orientation.formHodgeStar`; no remaining passage names a second owner | consistent; the deletion orphans no citation | none |

The rows for all untouched statements stand as in the previous review, of e8a0ed0.

- Diff: 1 insertion, 4 deletions, one file; `Suggested.lean` and `metadata.toml` unchanged since e8a0ed0; nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside the folder: empty).
- Gate at this head (my run and the worker's): every check 0, `OK`.
- Dependency check: `depcheck: 230 roadmaps, 2454 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 5 `sorry` warnings (lines 123, 162, 173, 179, 187), nothing else, exit 0.
- Citation leads (2): `Covector.toExteriorPower` and `HasWeakExtDerivOn.ae_eq_zero` are this roadmap's own declarations in `Suggested.lean` (lines 74 and 123); not findings.
- Pull request text: title and the five description bullets read against the head; none is contradicted, and the change since e8a0ed0 touches nothing they describe (the description never mentioned K5a; "the Hodge star, built on Mathlib's exterior-power API" matches lines 113–115).
- Seeded sample: only §1.1 and §1.2 depend on the changed paragraph, through the supplier names; their locators and the other sampled sections are untouched and stand as previously verified. Source locators re-read this round: 0 (the diff adds none).
- Cross-roadmap citations resolved: PDE Lane A.6 and GeometricMeasureTheory G6 (both on main, unchanged); the worker's overlap list shows no dropped or revision-only id and no other pull request changing this folder.

Overlap check: read PDE, QuasiregularMaps, SchrodingerOperatorsAndSpectralTypes (open), SobolevPolynomialApproximation, CalibratedGeometry, SobolevMapsBetweenManifolds (main); nothing shared. SobolevPolynomialApproximation (line 34) hands the Sobolev theory of forms to this roadmap; SobolevMapsBetweenManifolds §8.2 owns the weak exterior derivative of rough forms on a manifold and excludes Sobolev spaces of forms (line 129), this roadmap owns the Euclidean spaces; QuasiregularMaps names this roadmap as a supplier of its Part III; the Gaffney theorem of SchrodingerOperatorsAndSpectralTypes §3.5 is essential self-adjointness on complete manifolds, not the cube identity of §7.1.

Source independence: changed passages only; the diff adds no prose (it deletes one sentence and shortens another), so 0 passages compared with 0 sources; arrangement not compared again (no layer added, removed or reordered).

Research link: the spaces `HΛᵏ`, the L² de Rham Hilbert complex and its Hodge decomposition are the analytic setting of finite element exterior calculus (Arnold–Falk–Winther 2006, 2010; Brüning–Lesch 1992); Layer 7 is Picard's compact embedding (Picard 1984; Lim–Sprekeler–Waurick). Rests on the README's summary, consumers and references.

Remark (untouched text, no change asked): the Tau Ceti contract is stated against Tau Ceti's main branch, not the pin; `Suggested.lean` imports no `TauCeti.*` module.

## Not verifiable

- The Tau Ceti declarations of the supplier list that are absent at the pin were not re-read this round; the paragraph's remaining sentence rests on the previous review's reading of Tau Ceti main.
- J. Brüning, M. Lesch, *Hilbert complexes*: paywalled, cited as a work without theorem numbers, unchanged.

## Source issues

- none

## For the human reviewers

- Scope/licence: Lim–Sprekeler–Waurick, arXiv:2608.31054v1, is a preprint cited for §7 (Theorems 2.11 and 4.10, `README.md` References); the other three sources are published journal articles.
- Supplier contract: 19 of the 24 Tau Ceti names in `README.md` lines 92–110 exist on Tau Ceti main but not at the pinned revision (previous review's count); the Lean file does not use them.
