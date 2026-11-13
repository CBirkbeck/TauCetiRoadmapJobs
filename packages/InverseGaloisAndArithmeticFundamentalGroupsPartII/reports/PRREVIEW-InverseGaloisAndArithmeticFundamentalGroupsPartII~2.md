# Review of InverseGaloisAndArithmeticFundamentalGroupsPartII (pull request #2263 at 5b96805)

**Verdict:** accepted

Incremental re-review of the 52 lines changed since `5cf2ffd` (README only). No finding.

## Previous findings

- R01 — repaired: `README.md:1116–1121` "Define `Mod(D, P) = π_0 Diff(D, P; ∂D)` … the convention of GeometricTopology §1.7.2 with marked points added"; gap at `:420–422` asks only for the closed setwise subgroup.
- R02 — repaired: `README.md:1129–1130` "For `n = 0` it is `Mod(D²)`, trivial by GeometricTopology §1.7.2"; §1.7.2 is in the *Needs:* line `:1121` and the contract `:392–394`; ALEX23 is cited nowhere in the folder.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.1 definition `Mod(D, P) = π_0 Diff(D, P; ∂D)` | `n = 0`; `n = 1`; `n = 2`; pointwise-fixing model | `π_0 DiscDiff 2 = Mod(D²) = 1`; `1 → π_0 → 1`, so `1`; `ℤ`, map to `Sym(P) = C₂` onto, kernel `2ℤ`; wrong model gives `2ℤ` | holds | none |
| §2.1 chain `Mod(D, P) ≅ B_n ≅ π_1(Conf_n(int D), P)` | exact sequence of the pair; `n = 2`; annulus control | `π_1 Diff(D, ∂D) = 0 → π_1 Conf_n → π_0 Diff(D, P; ∂D) → π_0 Diff(D, ∂D) = 0`; `π_1 Conf_2 = ℤ = B_2`; `π_0 Diff(A, ∂A) = ℤ ≠ 0`, boundary map not onto | holds; three groups, as the Check at `:1191` says | none |
| Contract `:392–394` against GeometricTopology §1.7.2 | text on main `GeometricTopology/README.md:1214–1217, 1236–1239`; its open revision | diffeomorphisms fixing `∂F` pointwise, isotopies in the Layer 3.1 (`C^∞`) topology; `Mod(D²)` trivial, smooth case by Smale; same two passages at the open head | agrees | none |
| gap:geomtop-marked-disc-diffeomorphisms `:420–422` | the pin, for the setwise subgroup and its closedness | pin has the pointwise `Diffeomorph.fixingSubgroup` and `isClosed_fixingSubgroup` (`FixingSubgroup/Topology.lean:41`); setwise only as `fixingSubgroup_le_stabilizer` (`Basic.lean:104`), no closedness | precise, not already provided | none |
| §2.2 action bullet `:1245–1246` | `n = 2`, half twist on the two straight arcs | `Diff(D, P; ∂D)` preserves orientation (boundary fixed), so the clockwise order at `∗` is kept; smooth arcs go to smooth arcs | holds | none |

Rows for the untouched statements stand as in the previous review, of `5cf2ffd`.

- Source locators checked: EVW16 lines 354–368 (the chain of §2.1): the source writes the mapping class group as `π_0` of a diffeomorphism group, the convention now used. No sampled target other than §2.2 lies in a changed passage; its locators are unchanged.
- Library declarations opened at the pin: `TauCeti/Geometry/Diffeomorphism/Disc.lean:63` (`DiscDiff`, the boundary-pointwise group), `FixingSubgroup/Basic.lean:62, 104, 149`, `FixingSubgroup/Topology.lean:41, 53`.
- Cross-roadmap citations resolved: GeometricTopology §1.7.2, Layer 3, §§3.3, 3.4, on main and at the head of its open revision; all present, none renumbered.
- Gate at this head: every check passed (`… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`). Elaboration: `sorry` at `Suggested.lean:475` and `:492` the only warnings; the Lean file is unchanged since `5cf2ffd`, so the signature comparison and the one-tactic probe stand.
- Dependency check: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No file changed outside the folder.
- Pull request text read against this head: no sentence contradicted; the change (one convention of §2.1, one shortened gap, one reference removed) touches nothing the title or description states.
- Overlap check: read GeometricTopology (main and its open revision), InverseGaloisAndArithmeticFundamentalGroups, ArithmeticStatisticsPartVIII; mapping class groups of compact surfaces and the triviality of `Mod(D²)`: owner GeometricTopology §1.7.2, cited here; the marked-disc group `Mod(D, P)`: this roadmap, §2.1; the EVW chain shared with ArithmeticStatisticsPartVIII §5.16 is unchanged (last section).
- Source independence: changed passages only; 4 passages compared with 1 source (EVW16 lines 354–368), none shared; largest share EVW16 (117 of 147 locators at `5cf2ffd`; the change removes only the ALEX23 locator and adds none); no layer added, removed or reordered, so the contents comparison stands as in the previous review: independent.
- Remark, no change asked: the design plan's `gaps` entry `geomtop-marked-disc-diffeomorphisms` still carries the longer sentence (with the identification with the topological mapping class group); the README's shorter contract at `:420–422` is the one this head needs.

## Not verifiable

- PAL60 Theorem A: settled as uncertified, cited by locator only.
- Agreement of EVW16's arXiv numbering with the published article: only the arXiv text is in the cache.
- Ownership against open pull requests whose checkouts were not listed (TeichmullerGeometry and GeometricTopology's open revision were read through the roadmap index, not a checkout).

## Source issues

- none

## For the human reviewers

- **Scope.** ArithmeticStatisticsPartVIII §5.16 (open pull request #1179) plans the same chain, from the component ring to the étale Betti bound; `README.md:110–121` says so and imports nothing. Earlier rounds left the choice of owner to a human.
- **Gap wording.** The plan's `gaps` entry for `geomtop-marked-disc-diffeomorphisms` asks GeometricTopology for more than `README.md:420–422` now does (the comparison with the topological mapping class group); the announcement on the supplier's job would carry the longer sentence.
