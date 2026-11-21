# Review of EllipticIntegrals (pull request #2556 at e37e4db)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 22 lines changed since `08023cc`: the four small corrections of the previous review are all repaired (the DLMF numbers of §1.6, §2.2 and §6.6 now point at the equations that contain the statements, the digit of §4.7 is right, the Lean section comments follow the milestones, and the description states the four changes it had left out), and the description was read against this head and holds. Four format notes are carried over, none blocking. Three facts are left for the human reviewers.

## N01 — The *Needs:* line of §4.6 still omits what the bound "1 − tₙ is at most a constant times kₙ²" uses

The listed `TauCeti.Real.pi_div_two_le_legendreK` and `TauCeti.Real.legendreEc_le_pi_div_two` give only tₙ ≤ 1. The bound itself (E ≥ (π/2)√(1 − k²) and K ≤ (π/2)/√(1 − k²), so tₙ ≥ 1 − kₙ²) comes from `TauCeti.Real.le_legendreE_integrand` and `TauCeti.Real.legendreK_le_pi_div_two_div_sqrt` of §1.1 (lines 493–497).

## N02 — Line 58 of `TauCetiRoadmap/EllipticIntegrals/Suggested.lean` is 106 characters long; rewrapping the docstring brings it within 100.

## N03 — The docstring of `realPeriod_eq_of_three_real_roots` (line 112) names no source, while its one-root companion cites Byrd–Friedman 239.00; §8.2 cites formula 236.00 for the three-root integral and the docstring could carry it.

## N04 — Gauss's theorem in §4.4 (line 444) carries no locator; DLMF 19.8.5 states it for −∞ < k² < 1.

## Previous findings

The previous review, of `08023cc`, had no finding, four small corrections and four format notes.

- C01 — repaired: §1.6 "(DLMF 19.6.2, 19.6.3, 19.6.13; the arctan form is 19.6.12 with 19.2.18.)"; §2.2 "(DLMF 19.4.1, 19.4.2.)"; §6.6 "(DLMF 19.25.5, 19.25.9, 19.25.14.)". Each equation was read at NIST and contains its statement.
- C02 — repaired: §4.7 prints "3.141592653589793…"; recomputed to 45 digits, 3.14159265358979323827951….
- C03 — repaired: the five section comments read "Milestone 3", "4", "6", "7", "8" with the README's titles; the docstring says "are named in the README's milestones and are not restated here".
- C04 — repaired: the description now states the two sections not kept, the dropped citation of GrothendieckPeriodConjecture, the namespace `Complex` and the Convention 4 locator 19.16.2_5.
- N01 — not repaired: the *Needs:* line of §4.6 is unchanged (N01 above).
- N02 — not repaired: line 58 of the Lean file is 106 characters (N02 above).
- N03 — not repaired: "**The real period with three real roots**. If `Ψ₂Sq(x) = …`" names no source (N03 above).
- N04 — not repaired: §4.4 opens "For `k ^ 2 < 1`, K(k) = agmIntegral 1 √(1 − k²) and" with no locator (N04 above).

## Verified sound

The diff changes no statement; the rows are for the statements whose locators or printed values it changes.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.6 Third-kind reductions (locators changed) | α² = −3, 0.5 at φ = 1.2; k = 0.7 at φ = π/2, 0.7 | 0.68940048927 and 1.51051212247 both sides; Π(0.7, 0.49) = 2.6581590894 = E/(1 − k²); Π(0, −3) = 0.7853981634 = π/4; Π(0.7; k, k²) = 0.79067352635 both | holds; 19.6.2, 19.6.3, 19.6.12, 19.6.13, 19.2.18 each contain their formula | none |
| 2.2 Derivatives (locator added) | k = 0.6, central difference, step 10⁻⁵ | E′ = −0.5544506815 against (E − K)/k = −0.5544506808; K′ = 0.7750025015 both | holds; 19.4.1 is dK/dk, 19.4.2 is dE/dk | none |
| 4.7 Gauss–Brent–Salamin Check (digit changed) | 45-digit AGM from (1, 1/√2), n = 1, 2, 3 | 3.14057925052216…, 3.14159264621354…, 3.14159265358979323827951… | printed values agree | none |
| 6.6 Legendre dictionary (locator changed) | k = 0.6, φ = 0.9 and −1.3 | F: 0.94170158 against s·R_F = 0.94170150; E: 0.86140460 against 0.86140452; −1.41451084, −1.19998747 against −1.41451074, −1.19998737 (quadrature cut at 10⁻⁷) | holds; 19.25.9 is the R_F − R_D form, 19.25.7 the R_G form | none |

The rows for the untouched statements stand as in the previous review, of `08023cc`.

- Source locators checked against the text: 12 DLMF equations (19.6.2, 19.6.3, 19.6.11, 19.6.12, 19.6.13, 19.2.18, 19.2.19, 19.4.1, 19.4.2, 19.25.5, 19.25.9, 19.25.14) and 19.25.7, 19.16.2_5, 19.16.3 for the description, read in the texts of §§19.2, 19.4, 19.6, 19.16, 19.25 fetched from NIST. None of the seeded sample's targets lies in a changed passage.
- Library declarations opened at the pin: none new; the change touches no declaration name. The eleven statements of `Suggested.lean` are unchanged.
- README on main against this head: 8 milestones, 42 numbered items counted at this head, none removed or renumbered by the change.
- Cross-roadmap citations: none added or changed. GrothendieckPeriodConjecture is absent from main's roadmap folders and from the open roadmap pull requests, as the description says.
- Dependency check: `depcheck: 74 roadmaps, 807 edges, 0 problem(s)`. The automatic checks all pass on this head; nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `sorry` warnings and nothing else. The section comments of the Lean file carry the README's milestone titles word for word.
- Pull request text read against this head: the four headline theorems, the five neighbours named in the overview, the 42 items, the items listed as unproved (those without, or with a partial, *In Tau Ceti* line), the three Tau Ceti supplier groups, the five locator corrections and the grouping of the Lean file under Milestones 3, 4, 6, 7, 8 all hold; no omission found.

Overlap check: read SpecialFunctionsTheta, SpecialFunctionsHypergeometric and SpecialFunctionsAppell (main), as in the previous review; the change adds no object and no citation; nothing shared.

Source independence: changed passages only; 4 passages (three locator lines, one Check) compared with 1 source (DLMF §§19.2, 19.4, 19.6, 19.25), none shared; largest share DLMF, 41 of 47 locators (the previous count of 38 of 44, with five equation numbers added and two removed); no layer added, removed or reordered, so the contents comparison stands as in the previous review: independent.

Research link: Milestone 8 evaluates the real period of the Birch–Swinnerton-Dyer quotient by the AGM, the method of Cremona 1997, §3.7 for period lattices; the duplication theorem of Milestone 6 is the step of Carlson's 1995 algorithms; §4.7 is Salamin 1976, Theorem 1b. Rests on the README and those three sources, read in the previous review.

## Not verifiable

- Carlson 1977, Chapter 9 (the locator of §6.1): a book; the project's source cache has no copy and none was sought elsewhere.
- Byrd and Friedman, formulas 236.00 and 239.00 (§§8.2, 8.3 and one docstring): no copy in the source cache; the integrals were confirmed by quadrature in the previous review.
- The statement in Provenance that the author of `lean-codes` agreed to its use (Lean Zulip), and the table of counterparts in `lean-codes`: not opened in this review.

## Source issues

- none

## For the human reviewers

- Scope: 41 of the 47 locators are to the NIST handbook (DLMF Chapters 19 and 22); the refereed sources are Salamin 1976, Carlson 1995 and Cremona 1997 (§4.7, §6.5, §8.4 of `TauCetiRoadmap/EllipticIntegrals/README.md`).
- `TauCetiRoadmap/EllipticIntegrals/STATUS.md` (generated, at Tau Ceti commit d2083f0, 2026-11-08) reports seven of eight milestones proved; the pinned commit (2fd255d, 2026-11-04) lacks the eleven statements of `Suggested.lean`, which this review treated as targets.
- Licence: Provenance (README lines 1051–1071) directs implementers to port from `lean-codes` (Apache-2.0 per the README) and says its author agreed on Zulip; an earlier review reported `carlsonRF_duplication` there under the same name. Neither was opened here.
