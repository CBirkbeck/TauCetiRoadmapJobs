# Review of QuasiregularMaps (pull request #3034 at d774e3d)

**Verdict:** accepted

**Summary.** An incremental re-review of the 4 lines changed since `7c7b748`, together with the pull request's title and description read against this head. The one change, in the Conventions bullet on smooth metrics, repairs the previous review's only remark: the local-isometry statement of §7.6 is no longer restricted to smooth metrics, and the bullet now agrees with §7.6 and with the library declarations it names. The title and description agree with the head item by item. There is no finding, no small correction and no format note; nothing is left for a human to decide.

## Previous findings

The previous report had no finding (no R-numbered remark). Its one small correction:

- C01 — repaired: "The statements of §7.6 about flat manifolds and descended metrics are for smooth metrics, and are instances of the definitions made for continuous ones." (README lines 116–117); the local-isometry statement is no longer listed.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, "Smooth metrics": only the flat-manifold and descended-metric statements of §7.6 are for smooth metrics | the three bullets of §7.6 against the declarations they name | `Bundle.ContMDiffRiemannianMetric.quotient` returns a `ContMDiffRiemannianMetric I ∞` (smooth); `TauCeti.IsLocalRiemannianIsometry` asks only `RiemannianBundle` on each side | Pass | None |
| §7.6, second bullet (local Riemannian isometry `π : ℝⁿ → N`), now read for continuous metrics | `π` with `dπ_x` an isometry; pulled-back orientation `±` standard | `‖dπ_x‖ⁿ = 1`, `J(dπ_x) = +1` or `−1` constantly on connected `ℝⁿ`; `q_O = 1` for `o_N` or `−o_N`; route uses §2.7, §7.2 only | Pass | None |
| §7.6, third bullet (descended metric on `ℝⁿ/Γ`), smooth metric | `ℝⁿ/ℤⁿ`; Klein bottle group | `J_π = 1`, `K_O(π) = 1`; glide reflection has `det = −1`, no descended orientation; flat metric of `ℝⁿ` is smooth, so the bullet's restriction costs nothing | Pass | None |
| §2.7, "local Riemannian isometries … orientation preserving at every point … are `1`-quasiregular" (cited by the changed bullet's scope) | `x ↦ −x` on `ℝⁿ`, `n` odd | `‖df‖ⁿ = 1`, `J = −1`: excluded by the orientation clause, as stated; with `J = 1`, `1 ≤ 1·1` | Pass | None |
| Summary: for closed manifolds ellipticity is the same "for any two continuous Riemannian metrics" (description item 7) | `g' = 4g` | `‖Df‖' = 2‖Df‖`, `J' = 2ⁿJ`, quotient unchanged; agrees with the bullet's "instances of the definitions made for continuous ones" | Pass | None |

The rows for the statements this change does not touch stand as in the previous review, of `7c7b748`.

- Source locators checked against the text: none changes in this diff; the seeded sample falls in no changed passage (the bullet cites no source).
- Library declarations opened at the pins: `TauCeti.IsLocalRiemannianIsometry` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean` line 70, section variables lines 58–64: `RiemannianBundle` only); `Bundle.ContMDiffRiemannianMetric.isLocalRiemannianIsometry_descend` and `.quotient` (`TauCeti/Geometry/Manifold/Riemannian/Pullback/Descent.lean` lines 189, 258).
- Cross-roadmap citations: the changed bullet adds none; no open pull request changes this roadmap, drops an id it cites, or defines an id only in a revision.
- Automatic checks: every check passed on this head. Dependency check output: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/QuasiregularMaps/Suggested.lean` gives five `declaration uses sorry` warnings (lines 94, 110, 164, 181, 195) and nothing else. The file is unchanged since `7c7b748`; the `#check @` comparison and the one-tactic probe of the previous review stand.
- Pull request text against the head and against `main`: title and items 1–7 checked. Verified: only the two files of the folder change (315 lines, no file outside); no heading and no Lean declaration removed, added or restated, the `Suggested.lean` diff is docstring locators plus the module docstring's two additions (§2.3; §2.1, §2.2, §7.1); no "line N" locator remains in either file; the Tau Ceti pin is `2fd255d99` with no `Wirtinger/Weak.lean` and no `Beltrami` directory, and the README cites none of the three names of item 3; §2.3 "for every map"; §2.10 and §1.5 formulas and `TauCeti.wirtingerDeriv`; Parts II and III "planned roadmaps" (lines 55, 1580, 1695, 1703); *Needs:* of §7.1, §2.6, §7.6 and the §2.2 bullet (line 390); arXiv versions in the References; item 7 now matches lines 45 and 116–117 word for word. Nothing contradicted, no change left unstated.
- Record: no layer or item removed, retitled or renumbered against the merge base `de93025`.

Overlap check: read SobolevMapsBetweenManifolds, TeichmullerGeometry and DifferentialGeometry (main) as in the previous review; the Sobolev class, weak differential and oriented Jacobian are owned by SobolevMapsBetweenManifolds, weak Wirtinger derivatives and planar quasiconformal maps by TeichmullerGeometry §7.4, both cited here; nothing else shared. The change of this round adds no object; the open DifferentialGeometry, ComplexManifolds, PlanarTopology and TangentialBordism were not read in full.

Source independence: changed passages only; 1 passage compared (the Conventions bullet), which cites and paraphrases no source, none shared; largest share MartioRickmanVaisala1969, 26 of 69 mentions of the four most cited sources, as in the previous review; contents not compared, since no layer is added, removed or reordered.

Research link: Layers 2 and 7 state the definitions under which Bonk–Heinonen (2001) and Prywes (2019) bound the de Rham cohomology of closed quasiregularly elliptic manifolds, answering Gromov (1981), and Heikkilä–Pankka (2025) embed the de Rham algebra in `⋀*ℝⁿ`; §7.6–§7.7 are their torus examples. Rests on the README and on HeikkilaPankka2025 §1 and Prywes2019 §1, both read.

## Not verifiable

- Rickman1993, Vaisala1971, Ahlfors2006, Lee2012, Reshetnyak1989, IwaniecMartin2001, BonkHeinonen2001, Gromov1981 and Gromov1999 are settled as uncertified and cited by locator only; this change touches none of their locators.

## Source issues

- none

## For the human reviewers

- none
