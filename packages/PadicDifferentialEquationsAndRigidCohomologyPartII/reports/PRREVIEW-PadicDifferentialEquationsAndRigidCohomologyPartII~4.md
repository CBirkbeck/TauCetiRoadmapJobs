# Review of PadicDifferentialEquationsAndRigidCohomologyPartII (pull request #2300 at 1da98b6)

**Verdict:** accepted

Incremental re-review of the 22 lines changed since `807aec5`, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: README lines 615–623 give `φ(e_1) = p·e_1`, `φ(e_2) = e_2 + t⁻¹e_1`, `P = E(−1)`, `α = Σ p^n t^(−p^n)`, `f = a − αb`, with `rank Top(M) = 1 = rank P`, `rank M = 2`.
- R02 — repaired: `Suggested.lean` lines 62–65, “The two-step PBQ filtration from the Legendre family (README MS.2.8; Tsuzuki §3.9) lacks overconvergent F-isocrystals on `P¹ ∖ {0, 1, ∞}` over `𝔽_p`, the Legendre object …”.
- R03 — repaired: README line 1689, “(Tsuzuki, Corollary 5.5 and Proposition 5.6, p. 25, for morphisms of connected schemes”.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| MS.0.4, first Check (changed) | `K = ℚ_p`, `q = p`, `φ(t) = t^p`, `α = Σ_(n≥0) p^n t^(−p^n)`, `f(a·e_1 + b·e_2) = a − αb` | `p·φ(α) = Σ_(n≥1) p^n t^(−p^n) = α − t⁻¹`; `f∘φ_M = pφ(a) + (t⁻¹ − α)φ(b)`, `φ_P∘f = pφ(a) − pφ(α)φ(b)`; difference `0` | `φ`-morphism | None |
| MS.0.4, same Check against the theorem | `v = e_2 + αe_1`; `ρ < 1`; `f(e_1)` | `φ(v) = e_2 + (t⁻¹ + pφ(α))e_1 = v`: slope 0, kernel of `f`; `|p^n|ρ^(−p^n) → ∞`; `f(e_1) = 1` spans `P` | `λmax = 1 = slope(P)`, `rank Top(M) = 1 = rank P`, `rank M = 2`: equality case holds | None |
| MS.0.4, hypotheses of the Check | a connection on `M†` compatible with `φ` | `∇e_2 = c·e_1` forces `c = t⁻² + p²t^(p−1)φ(c)`, unique solution `−dα/dt ∉ E†` | No connection exists; the theorem is for `φ`-modules (“No connection is needed”, line 590), so the instance is admissible | None |
| MS.1.1 locator (changed; sample “PBQ”) | Theorem 3.19(1); Definition 3.20 | TSU line 878, between page markers 848 (p. 16) and 898 (p. 17); TSU line 908, after 898 | p. 16 and p. 17 as printed | None |
| MS.3.9 locator (changed) | Corollary 5.5; Proposition 5.6 with proof | TSU lines 1297–1300 and 1301–1315; page markers 1289 (p. 25), 1336 (p. 26) | p. 25 | None |
| MS.2.8 against the new docstring bullet | carriers of the statement, README lines 1333–1339 | `C = P¹_(𝔽_p) ∖ {0, 1, ∞}`, `L†`, `χ`, extension `0 → L†(χ) → M† → O(π_p²) → 0`, grades of generic maximal slopes 1, 0; each is in the bullet | Bullet names the headline and what it lacks | None |

The rows of the untouched statements stand as in the previous review, of `807aec5`.

- Source locators: 4 changed locators read against TSU (lines 878, 908, 1297, 1301); the sampled “Lefschetz condition” lies in no changed passage.
- Cross-roadmap citations: the changed passages add none; no other section or roadmap cites the changed Check.
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside-folder diff empty.
- Gate at `1da98b6`: every check 0, `OK`. `lake env lean` on `Suggested.lean`: exit 0, no output. The file has no declaration, so the `#check` comparison and the one-tactic probe have no instance.
- Headline theorems: MS.2.8 is now named in the docstring; with it every theorem of the README table's headline column is named with the carrier it lacks. None is statable at the pins.
- Pull-request text read against the head: new folder of three files; seven layers MS.0–MS.6; no declaration; nine `gap:` contracts on the parent (README lines 350–366, same nine slugs); MS.4.6(i), MS.4.8, MS.5.7, MS.6.13–MS.6.14 as the summary block states them; the gap in the proof of D'Addezio's Proposition 4.2.12 at README lines 104–106; consumers at lines 2722–2734; 8 review and 2 red-team rounds. No sentence is contradicted by the head, and the 22-line change alters nothing the text describes.
- Declared gaps: untouched by the diff; nine slugs in the README.

Overlap check: read PadicDifferentialEquationsAndRigidCohomology, KloostermanSheavesAndBesselIsocrystals, CrystallineCohomologyPartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory, AdicSpacesPartIV; nothing shared (the overlap lists are those of the previous review and the diff adds no object; no other pull request changes this roadmap, no cited id is dropped).

Source independence: changed passages only: 3 passages compared with 1 source (TSU lines 878–883, 1111–1141, 1297–1315), none shared; largest share TSU, 76 of 106 locators; the diff adds, removes or reorders no layer, so the contents comparison stands as in the review of `807aec5`: independent.

## Not verifiable

- DEJONG98 Proposition 6.4 and TSU98 Theorems 4.2.6 and 7.2.3: settled as uncertified, cited by locator only.
- MS.2.8, the K3 zeta-function input behind the slopes `0, 2`: read in TSU lines 1126–1141 only; the primary sources for that surface were not read.
- The two counterexamples to DAD Proposition 4.2.12 in “Corrections to the sources” were not recomputed; MS.5.7 does not use that proposition.

## Source issues

- none

## For the human reviewers

- **Scope.** TSU is cited as arXiv:1910.03871v3; DAD line 665 cites it as [Tsu23], a published version whose numbering was not compared with v3.
- **Licence.** AE was read from an author-hosted PDF (the co-author's university page); README lines 2858–2860 say its page locators are that PDF's, not the journal's.
- **Scope.** README lines 2763–2846 list 35 corrections to the sources; the reviews verified those at TSU Theorem 3.19, Definition 7.14, §3.9, Lemma B.1 and DAD Lemma 4.2.7, not all 35.
