# Review of ModularIwasawaMainConjecturesPartII (pull request #2281 at 6fc6492)

**Verdict:** accepted

## Previous findings

- none: the previous review, of `6fc6492`, raised no finding; the folder has 0 changed lines since.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side / wrong model | Result; change |
|---|---|---|---|---|
| §4.2 class-number Check, cited by the description ("the class number formula and Rubin's Euler-system bound agree at p = 2") | K=ℚ(i), F=ℚ(ζ₁₂), h_F=1, w_F=12, R=log(2+√3)=1.3169579 | −h_F·R/w_F = −0.1097465 | ζ_K(0)·L(χ₋₃,0)·L′(χ₁₂,0) = (−1/4)(1/3)(R) = −0.1097465; ordinary norm gives regulator R/2, off by 2 | Agrees; no change |
| §2.3 dictionary, cited by the description ("squared-norm dictionary … without rescaling the generators") | Same field, f=(3), a=(5); χ=1 and quadratic η | Squared-norm logs of the inverse unit: −2·6·log 3 = −13.1833475; 8R = 10.5356632 | 24·(−(log 3)/2) = −13.1833475; 24·L′(η,0) = 24·R/3 = 10.5356632; ordinary norm gives half of each left value | Agrees; no change |

Rows for untouched statements stand as in the previous review, of `6fc6492`.

- Pull request text: the title and each sentence of the description and its `roadmap-summary` block were read against the head; none is contradicted. The folder holds README, `Suggested.lean` and `metadata.toml`; the Lean file has 0 declarations, as the description says; the change adds the roadmap (976 insertions, 0 deletions, no heading or declaration removed).
- Supplier names in the description: 3 named in the summary and the 4 named non-prerequisites (CMRankZeroConverse, AnticyclotomicLocalUnits, InertAnticyclotomicCMMainConjecture, EllipticCurvePeriodsAndModularParametrizations) match `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:30-32` and `:918`; every README supplier not on main (15) is in the description's dependency list.
- Cross-roadmap citations resolved for the description's claims: NonordinaryCMSpecialValues §§2.1–2.6 exist at its open head (headings at its README lines 335–446); the worker's citation check lists none unresolved.
- Source locators: 1 rechecked (Kato line 5769, below); changed passages: none.
- Dependency output: `depcheck: 234 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: rerun on this head, every check 0, `OK`; the worker's gate includes the targeted build. `lake env lean` on `Suggested.lean` exits 0 with no warning; 0 declarations, so no signature or one-tactic probe applies.
- Changes outside the folder: none.

Overlap check: read KatoEulerSystems, NonordinaryCMSpecialValues, AutomorphicCongruences, ModularIwasawaMainConjectures, CMRankZeroConverse, IntegralIwasawaTheory and CyclotomicClassGroupsAndStickelberger scopes as recorded in the previous review; the overlap listing is unchanged (no other pull request changes this roadmap, no dropped or revision-only id). Owners: zeta morphism and CM module structure — KatoEulerSystems; Kronecker formulas and CM constructions — NonordinaryCMSpecialValues; KMC formulation — ModularIwasawaMainConjectures; p-converse — CMRankZeroConverse; elliptic-unit generator and CM equality descent — this roadmap.

Source independence: changed passages only; 0 passages changed, so 0 compared; largest share Kato, 33 of 98 locators, as counted in the previous review; no layer added, removed or reordered, so the previous contents comparison stands.

## Not verifiable

- Carried forward: the dyadic compact-support comparison in §4.2 uses Itakura §3.1 through JLK line 432; no legal copy was found by the earlier sources-service search.

## Source issues

- **Misprint** in Kato at proof of Proposition 15.17, printed p. 265 (Kato line 5769): the source says to apply Lemma 14.12; it should be Lemma 14.15, the length lemma stated at Kato line 4912; affects the proof.

## For the human reviewers

- JLK line 394 chooses the ordinary Beilinson regulator; `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:393` replaces it by the Dirichlet regulator. The scalar calculation above agrees; the dyadic integral comparison through the unavailable Itakura preprint remains unverified.
