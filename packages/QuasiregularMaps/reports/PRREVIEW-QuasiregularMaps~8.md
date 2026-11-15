# Review of QuasiregularMaps (pull request #2134 at a1b21d8)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `a1b21d8`; this round reads the title and description against the head. No finding.

## Previous findings

- The previous report (of `a1b21d8`) accepted the folder with no finding of its own; there is nothing to repair. Its board matter is repeated under "For the human reviewers".

## Verified sound

**Adversarial table** (the folder changed no statement; rows are for statements the description cites, with values computed for this review).

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §3.2, Lean `IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow` and `IsQuasiregularOn.of_det_le_mul_minimalStretch_pow` ("Euclidean distortion comparisons") | `Du = diag(3,1,1)` on `ℝ³` | `‖A‖³ = 27`, `det = 3`, `ℓ = 1`: `q_O = 9`, `q_I = 3`. First: `3 ≤ 9² · 1 = 81`. Converse with `K = 3`: `3 ≤ 3 · 1`, conclusion `27 ≤ 3² · 3 = 27`, equality | Pass; `K_O = K_I^{n−1}` attained | None |
| §1.4, §3.4 ("sharp comparisons … Hilbert–Schmidt") | `diag(3,1)` | `‖A‖_HS² = 10`, `q_S = 10/(2 · 3) = 5/3`, `q_O = 9/3 = 3`; `5/3 ≤ 3 ≤ 10/3`; ratio `9/5 < 2` | Pass | None |
| §7.6 ("closed orientable flat manifolds with distortion one") | `ℝ² → ℝ²/ℤ²`; Klein bottle | `‖dπ‖² = 1 = 1 · J_π`; glide reflection `det = −1`, no orientation, outside the statement | Pass | None |
| §5.2, Lean `isACLpOn_iff_exists_hasWeakFDerivOn` ("`ACLᵖ` … for `1 ≤ p ≤ ∞`") | `u = |x₁|` on `ℝ²`, `p = ∞` | absolutely continuous on every line; `∂₁u = sign x₁`, `∂₂u = 0`, `‖Du‖ = 1 ∈ L^∞_loc` | Pass | None |

The rows for every other statement stand as in the previous review, of `a1b21d8`.

**Title and description against the head** (each sentence of the prose and of the summary block read against the README and `Suggested.lean`):

- "adds `TauCetiRoadmap/QuasiregularMaps/` (README, `Suggested.lean`, and `metadata.toml`)": the folder is absent from main, 3 files, 2119 insertions, 0 deletions, nothing changed outside it.
- Suppliers named (DifferentialGeometry 2.1–2.2, 12.1, 12.4; RiemannianGeometry R4 item 7; GeometricTopology Layer 11; TeichmullerGeometry §7.4; six SobolevMapsBetweenManifolds contracts) are exactly the subsections of `## Exact supplier contracts` (README:370–434); the six slugs are those of README:380–405.
- "Orientation descent is owned locally in §7.5 and used by §7.6": README:89–90 and the *Needs:* line of §7.6 (README:1787).
- "`Suggested.lean` states …": the five theorems at lines 90, 106, 160, 177, 191; the docstring (lines 26–44) names the five manifold headlines and the missing carrier.
- Summary block: `n ≥ 1` (README:130), Fubini and coordinate lines (§5.2, README:1291–1302), Rademacher (§2.8, README:840), no compactness in §6.4 (README:1554–1555), Parts II and III as consumers (README:113–124).
- Remark, no change asked: SobolevMapsBetweenManifolds is on main now (the description says it "precedes this roadmap in the merge order", which remains true: lines 409 and 410 of the merge order).

**Counts.**

- Gate, run on this head: `gate QuasiregularMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/QuasiregularMaps/Suggested.lean`: five `declaration uses sorry` warnings (lines 90, 106, 160, 177, 191), nothing else. The ten elaborated signatures were compared with the README statements again; none lost a binder.
- Cross-roadmap citations resolved again, 19 section ids: SobolevMapsBetweenManifolds §1.2, 3.1, 3.3, 4.2–4.6, 5.1–5.3, 6.1–6.3, 7.1, now on main, each under the cited number and title (its README:386–1256); TeichmullerGeometry §7.4 at its open head (README:741, weak Wirtinger derivatives, Beltrami equation); DifferentialGeometry, RiemannianGeometry, GeometricTopology, PDE, Orbifolds, PseudoholomorphicCurveAnalysis folders on main.
- Source locators: none new to check (no passage changed); the 15 seeded targets stand as read in the previous review.
- Declared gaps: the six SobolevMapsBetweenManifolds contracts are unchanged and each cited section exists on main; the acceptance is conditional on them.
- Overlaps: no open pull request changes this roadmap, drops an id it cites, or is the only definer of one.

Overlap check: read SobolevMapsBetweenManifolds, DifferentialGeometry, RiemannianGeometry (main), TeichmullerGeometry, SobolevDifferentialForms, PlanarTopology (open); locally Lipschitz members and `ACL^p` are ceded to QuasiregularMaps by SobolevMapsBetweenManifolds (its README:118–120); planar quasiconformal maps stay with TeichmullerGeometry §7.4; nothing shared.

Source independence: changed passages only: 0 passages changed, none to compare; largest share MartioRickmanVaisala1969, 25 of 85 mentions of source ids; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- Rickman1993, Vaisala1971, Ahlfors2006, Lee2012, Reshetnyak1989, IwaniecMartin2001, BonkHeinonen2001, Gromov1981, Gromov1999: settled as uncertified, cited by locator only; not requested again.
- The description's generated blocks (`depends-on`, `merge-order`) are outside the check of the text.

## Source issues

- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24 (line 1328): the source composes the Nash embedding before the manifold map; it should compose the embedding after it, giving `ι ∘ p : M → ℝᵐ`; affects the proof.
- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24 (lines 1333 and 1338): the determinant in the denominator drops the simplex index; it should be the minimum over `κ(σᵢ)` of `det Dϕᵢ`; affects the proof.

## For the human reviewers

- **Board record.** `packages/QuasiregularMaps/design/plan.json` still lists a seventh gap, `orientation-descent` (supplier DifferentialGeometry); README §7.5 owns that object, so the entry is obsolete. Only a maintainer's edit of the board removes it.
