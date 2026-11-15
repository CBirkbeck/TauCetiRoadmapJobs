# Review of HeegnerPointEulerSystems (pull request #1423 at e9fc187)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 8b8ee4a. No findings.

## Previous findings

- R01 — repaired: `packages/HeegnerPointEulerSystems/design/plan.json` has 12 `gaps`; README has 12 `gap:` slugs; the join leaves nothing unmatched; `zhang-level-raising` and `gl2-integral-rank-zero` carry the README sentences of lines 215 and 225. The folder itself is unchanged.

## Verified sound

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| Declared gaps (previous R01) | README slugs 12, plan entries 12, README-only 0, plan-only 0; suppliers agree entry by entry; each plan `needs` is the opening sentence(s) of the README contract, no hypothesis dropped | repaired |
| Gap sections at the suppliers' heads | EulerSystemsAndKolyvaginSystems 4.13, 4.18, 4.19, 5.10–5.13, 8.28, 8.31, 8.36; HilbertModularVarietiesAndShimuraCurves R18.4.26; KatoEulerSystems 6.6; ModularIwasawaMainConjectures 1.3, 3.9; GrossZagierAndArithmeticHeights 9.20; GeometryOfNumbersAndQuadraticArithmetic 4.2; SelmerIwasawaCohomology 2.3, 2.19, 3.9, 3.10; SerreWeightAndLevelOptimisation 1.1–1.3, 2.4; ArithmeticGaloisRepresentations 6.1–6.4: every heading found | sound |
| 4.8 coefficient reduction (seeded sample) | `ℤ₅[ϖ]`, `ϖ² = 5`, e = 2, m = 2: `5² = ϖ⁴`, so `T/5²` needs `M(n) ≥ 4 = em`; e = 1 gives `M ≥ m`; zhang line 708–797 has §3.7 on PDF pp.21–23 = printed pp.211–213, classes `c_M(n)` for `M ≤ M(n)` | sound |
| 0.5 against the new Tau Ceti pin | `ringClassArtinEquiv : Pic O ≃* Gal(ringClassField O/K)` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:178`); `O = ℤ + 3ℤi`: `h = 3·(1+1/3)/2 = 2`, so `[K[3]:K] = 2`, the §0.4 kernel value | consistent; §0.5 imports existence from ClassFieldTheory Layer 13 and restates nothing |
| Headlines at the new pins | Tau Ceti `2fd255d` now has `ringClassField`, elliptic `sha` (`…/GaloisCohomology/Selmer/NumberField.lean:65`), `selmerGroup`, `kummerMap`, the moduli problem `gammaZero` (`…/ModularCurve/Gamma/Zero.lean:70`); grep for a modular parametrization, a CM point on a modular curve or a Heegner point finds none (`Heegner` occurs only in the class-number-one files) | no headline became statable; the empty `Suggested.lean` stands |

The rows for the other statements stand as in the previous review, of `8b8ee4a`.

- Gate rerun at e9fc187: every scanner 0, `depcheck=0`, `stray-files=0`, `outside-folder=0`, `OK`; the worker's gate also has `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; this roadmap is at line 389 of the merge order.
- Elaboration: `lake env lean TauCetiRoadmap/HeegnerPointEulerSystems/Suggested.lean` exits 0 with no output (no declaration, so nothing to `#check` or to probe with one tactic; no padding).
- The head is a merge of main: the folder diff against 8b8ee4a is empty and the pull request's diff against `origin/main` outside the folder is empty.
- Library declarations opened at the pins the merge moved to (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d`): all 26 Mathlib names of the README table and the 5 Tau Ceti names resolve in the files cited (for example `Subring.comap` `Algebra/Ring/Subring/Basic.lean:173`, `CommRing.Pic.mapRingHom` `RingTheory/PicardGroup.lean:579`, `map_eq_id_of_inner` `…/ContCohomology/InnerConjugation.lean:297`).
- Cross-roadmap citations: the worker's resolver and overlap list report nothing; the ids the two closest consumers cite here (§§1.4–1.6, 7.11–7.12, 8.5–8.6a, 8.13, 8.24, 8.31, 8.34, 8b.2, 8b.10) all exist as headings.
- Pull request text: title and description read against the head; the merge changes nothing they describe.
- Remark on untouched text, no change asked: README line 73 names the Mathlib and Tau Ceti commits of the earlier pins (`6b7abb3c`, `a91d3aa`); every declaration it lists exists at the present pins, and roadmaps on main carry permalinks of the same kind.

Overlap check: read EulerSystemsAndKolyvaginSystems, RankZeroOneBSDPartII, RankOneConverse (also ModularIwasawaMainConjectures and AutomorphicCongruences, as in the previous review); nothing shared: the first supplies the generic Kolyvagin-system theory, the other two consume this roadmap's sections by name.

Source independence: changed passages only: 0 passages compared with 0 sources, as the folder diff is empty; arrangement not compared again, no layer added, removed or reordered.

## Not verifiable

- none.

## Source issues

- **Misprint** in cgls at Remark 4.1.3, equation (4.3), printed p.28: the stabilized point is defined for `k > 1` and for `k = 0`, leaving `k = 1` undefined; it should be `k ≥ 1` and `k = 0`; affects nothing.
- **Error** in bcgs at Lemma 1.2.3 proof and Remark 1.2.4, printed p.12, and Corollary 1.2.12, printed p.14: the source equates `#H⁰(ℚ_p, E[p∞])` with `#Ẽ(𝔽_p)[p∞]`; it should keep them distinct (1 and 5 for `y² = x³+8x+2` at p = 5); affects a stated result.

## For the human reviewers

- **Licence.** `cs` (Castella–Sano, arXiv:2601.14504v1, 2026), `bcs` (arXiv:2405.00270v2) and `zanarella` (arXiv:1908.09197v1) are cited in the README's References as preprints with no journal reference; they are cited in §§8.18–8.19, 8.25, 8.38–8.40, 8.44–8.45 (`cs`), §§8b.1–8b.13 (`bcs`) and §6.6 (`zanarella`).
- **Licence.** `gross` and `kolyvagin-structure` were read from scans of the published articles on a third party's personal page (wstein.org), recorded in `packages/HeegnerPointEulerSystems/sources.toml` as `author-page`.
