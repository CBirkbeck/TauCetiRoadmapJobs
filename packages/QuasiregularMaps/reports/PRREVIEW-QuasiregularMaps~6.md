# Review of QuasiregularMaps (pull request #2134 at a1b21d8)

**Verdict:** needs changes

Incremental re-review of the 46 lines changed since 3703533. The three folder findings of the previous review (R02–R04) are repaired and the repairs introduce no new problem. The one remaining finding is in the board's design record, not in the pull request: no edit of `TauCetiRoadmap/QuasiregularMaps/` can close it.

## R01 (P2) — The board still declares the orientation-descent gap that §7.5 owns

Re-raised: H01

**Location:** `packages/QuasiregularMaps/design/plan.json` on the board's main (c3e12f0): line 1995 `"slug": "orientation-descent"`, supplier DifferentialGeometry, section "Layer 2 (missing section; proposed DifferentialGeometry, Part II)"; line 1769, the prerequisite `"gap:orientation-descent"`; line 1868, "gap orientation-descent for the missing descent section".

**Claim:** The plan asks DifferentialGeometry for the unique orientation of `X/Γ` for which the orbit projection preserves orientation. This roadmap plans that object itself in §7.5, so the gap asks for what is already provided, and the plan (seven gaps) and the README (six contracts, all SobolevMapsBetweenManifolds) declare different sets.

**Witness:** `TauCetiRoadmap/QuasiregularMaps/README.md:89–90`: "No roadmap plans the orientation of the quotient manifold of a general free, properly discontinuous action; it is owned here (§7.5)." `grep -n orientation-descent` on the README returns nothing.

**Why the repair's reason fails:** The repair after the previous review changed only the folder; the three lines of the plan are unchanged at c3e12f0, as they were in the three reviews before. The edit belongs to the board's design record, which a repair of the pull request does not reach.

**Repair:** In `packages/QuasiregularMaps/design/plan.json` on the board's main:
- delete the `orientation-descent` entry from `gaps`;
- delete the string `gap:orientation-descent` from the prerequisites at line 1769 (do not substitute `target:7.5`: in the design that id is the flat theorem itself);
- delete "; gap orientation-descent for the missing descent section" from the DifferentialGeometry note at line 1868.

Nothing in `TauCetiRoadmap/QuasiregularMaps/` changes.

Test: `ℤⁿ` acting on `ℝⁿ` by translations has every `dγ = id`, `det = 1`, and §7.5 gives the unique orientation for which `dπ` carries the standard one; the glide `(x, y) ↦ (x + 1, −y)` has `det = −1` and is excluded. After the edit the plan and the README declare the same six gaps.

## Previous findings

- R01 — not repaired: board `plan.json` line 1995 still reads `"slug": "orientation-descent"`, line 1769 `"gap:orientation-descent"`, line 1868 "gap orientation-descent for the missing descent section". Raised again above.
- R02 — repaired: README:1769–1775, "This covers the flat tori `ℝⁿ/Λ`; that the `n`-torus is quasiregularly elliptic is noted in HeikkilaPankka2025 lines 56–57 and Prywes2019 lines 35–36. It also covers every closed orientable flat manifold `N`: by the Killing–Hopf theorem …".
- R03 — repaired: README:1120 "for the conformal bullet also §1.4, §3.1 and §3.4"; :1140 "§2.2, §2.4, §2.6, §3.1"; :1584 "§2.2, §2.7, §3.1, §6.2, §6.3"; :1595 "§2.2, §2.7, §2.8 and §3.1"; :454 "Layer 6 needs §2.2, §2.7, §2.8 and §3.1".
- R04 — repaired: README:1224–1228, "at `p = 0` its integrability clause asks only almost-everywhere strong measurability … The only statement that reaches that value is §5.3 in dimension `0`, where `ℝ⁰` is a point and both sides of the equivalence hold".

## Verified sound

**Gate, build, dependency check (run on this head).**

    gate QuasiregularMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

    depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

- No UPWARD, CYCLE or `moved:` line. SobolevMapsBetweenManifolds is line 402 of the merge order, QuasiregularMaps line 403.
- `lake env lean` on `TauCetiRoadmap/QuasiregularMaps/Suggested.lean` exits 0 with five `declaration uses sorry` warnings (lines 90, 106, 160, 177, 191) and nothing else.
- The change since 3703533 touches `README.md` only (28 insertions, 18 deletions); `Suggested.lean` is byte-identical, so the ten elaborated signatures, the `#check @` comparison, the headline coverage and the padding probe of the previous report stand. Nothing outside the folder changes.

**The changed passages (8 hunks), each read in full with what cites it.**

1. *Mathlib contract, README:254–256.* `MeasureTheory.memLp_zero_iff_aestronglyMeasurable` exists at the pin, `Mathlib/MeasureTheory/Function/LpSeminorm/Basic.lean:84`: `MemLp f 0 μ ↔ AEStronglyMeasurable f μ`. Name, file and statement agree with the README.
2. *Build overview, README:453–454.* Checked against every `*Needs:*` line: Layer 3's sections cite only §1.x and §2.x; Layer 4's cite §1.2, §1.4, §2.x, §3.1, §3.4 ("Layers 2 and 3", Layer 1 through Layer 2); Layer 6's cite exactly §2.2, §2.7, §2.8, §3.1 outside the layer; Layer 7's cite §2.x, §4.1–§4.4, §6.1, §6.4. The sentence agrees with the Dependencies blocks of Layers 3, 4 and 6. No edge points to a later layer: §3.1 needs §1.2, §2.2–§2.4; §3.4 needs §1.4, §2.2, §2.3.
3. *§4.1 Needs.* The conformal bullet is the only one that speaks of `q_I`, `K_I`, `K` and `K_S`; the added §1.4, §3.1, §3.4 are where `q_S`, `K_I`/`K` and `K_S` are defined.
4. *§4.2 Needs.* `K_O` is §2.2 and `K_I` is §3.1; both now listed.
5. *§5.1 sentence.* True as written: among the Lean statements, the §5.2 equivalence carries `1 ≤ p`, the line-derivative theorem has no exponent, the §3.2 theorems do not mention `IsACLpOn`, and §5.3 uses the exponent `↑n`, which is `0` only for `n = 0`. The Conventions paragraph it points to (README:130–137) says the dimension-`0` case holds trivially.
6. *§6.4 Needs and Layer 6 Dependencies.* §3.1 added in both; consistent with hunk 2.
7. *§7.6.* The torus locators now sit on the torus sentence: HeikkilaPankka2025 lines 56–57 say the bound is sharp because the `n`-torus is quasiregularly elliptic, Prywes2019 lines 35–36 say the `d`-torus is. The flat-manifold sentence is now the roadmap's own deduction with no source locator. Its inputs exist: the RiemannianGeometry contract (README:417–421; R4 item 7 on main, `killingHopf_euclidean` and the quotient description), `TauCeti.RiemannianIsometry.isLocalRiemannianIsometry` and `TauCeti.IsLocalRiemannianIsometry.comp` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean:197`, :182) for "the orbit projection followed by that isometry", and the second bullet of §7.6. `N` is connected by Layer 7's standing hypothesis and complete because closed.

**Seeded sample.** Of the fifteen targets, two fall in changed passages: §5.1 (hunks 1 and 5: MartioRickmanVaisala1969 Definition 2.16 unchanged; the new Mathlib citation checked at the pin) and §6.4 (hunk 6: a *Needs:* line only; HeikkilaPankka2025 Proposition B.1, lines 1247–1251, unchanged). §7.6, outside the sample, had its two locators re-read against the cached texts (hunk 7). The other thirteen targets are untouched; the previous report's sample table covers 1.3, 1.4, 2.7, 3.3, 3.4, 5.1, 5.3 and 7.1 and its adversarial table 2.2/2.3, 6.4 and 7.3.

**Adversarial table.** Rows marked "r5" are carried from the previous report (PRREVIEW-QuasiregularMaps~5), whose statements the diff leaves untouched; the others are computed for this head.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.1 sentence on `p = 0` (changed) | `n = 0` with `K = 1`, `K = 2`; `n = 1` | `MemLp f 0 μ ↔ AEStronglyMeasurable f μ` at the pin; `n = 0`: left `‖Du‖⁰ = 1 ≤ K · det = K · 1`, right `‖f'‖⁰ = 1 ≤ K · 1`, both true for `K = 1, 2`; `n = 1`: exponent `↑1 = 1 ≠ 0` | Sentence true | None |
| §4.1 conformal bullet and its *Needs:* (changed) | `A = diag(2, 1)`, factor `e^{w−u} = 3`, `n = 2` | `‖A‖' = 6`, `ℓ' = 3`, `‖A‖'_HS = 3√5`, `J' = 18`; `q'_O = 36/18 = 2 = 4/2`; `q'_I = 18/9 = 2 = 2/1`; `q'_S = 45/(2·18) = 5/4 = 5/(2·2)` | Pass; `q_S` (§1.4), `K_I` (§3.1), `K_S` (§3.4) are used | None |
| §4.2 and its *Needs:* (changed) | identity `(o, o)` vs `(−o, −o)` vs `(o, −o)` | `J = 1, 1, −1`; `K_O = K_I = 1` for the first two (§2.2, §3.1), `∞` for the third | Pass | None |
| §6.4 and its *Needs:* (changed) | torus doubling, `dp = diag(2, 1)` | `K_O = 4/2 = 2` (§2.2); `K_I = 2/1 = 2` (§3.1) | Pass | None |
| §7.6 flat manifolds, new route (changed; headline 5) | screw-motion 3-manifold `ℝ³/Γ`, `(x, y, z) ↦ (−x, −y, z + 1/2)`; Klein bottle; flat `T²` | rotation part `det diag(−1, −1, 1) = 1`; projection then isometry has `‖d‖ = 1`, `J = ±1` by pulled-back orientation, and `J = −1` is turned to `+1` by §7.2, so `K = 1`; glide `det = −1`, no orientation, outside the statement; `T²`: `‖dπ‖ = J = 1` | Pass | None |
| Build overview (changed) | every `*Needs:*` line of Layers 3, 4, 6, 7 | Layer 6 external sections `{§2.2, §2.7, §2.8, §3.1}`; Layer 4 `⊆` Layers 1–3; Layer 3 `⊆` Layers 1–2 | Pass | None |
| §1.3 `q_I ≤ q_O^{n−1}`, `q_O ≤ q_I^{n−1}` (sample) | r5: `diag(2,1,1)`, `diag(1,1,1/2)`, projection | `2 ≤ 16`, `4 ≤ 4`; `4 ≤ 4`, `2 ≤ 16`; projection `∞ ≤ 0` false, so `J > 0` is used | Pass (r5) | None |
| §1.4 `q_S ≤ q_O ≤ n^{n/2} q_S` (sample) | r5: `diag(2,1)`, `diag(1,ε,ε)` | `5/4 ≤ 2 ≤ 5/2`; ratio `→ 3^{3/2}` | Pass (r5) | None |
| §2.2/§2.3 outer distortion, attainment (sample) | r5: identity, fold, `M = ∅` | `[1, ∞)`; `K_O = ∞`; essential supremum `0`, `K_O = 1` | Pass (r5) | None |
| §2.4 Jacobian sign (sample) | r5 (§2.1 row): `max(0, t)`; fold | `Df ∈ {0, 1}`, `J ≥ 0`; fold `J = sign x₁` | Pass (r5) | None |
| §2.7 `C¹` maps (sample) | r5: `(x³, y)`; `−x` on `ℝ²`, `ℝ³` | `q_O ≈ 33.3` at `x = 0.1`, unbounded; `J = +1`, `−1` | Pass (r5) | None |
| §3.2 Lean, both theorems (headline 1) | r5: `n = 0`, `n = 1`, radial `a = 1/2`, `a = 2` | `1 ≤ 1`; `a ≤ |a|`; equality `|x|^{−3/2}/2 = 4|x|^{−3/2}/8`; `8|x|³ ≤ 4 · 2|x|³` | Pass (r5) | None |
| §3.3, §3.4 (sample) | r5: projection `n = 3`; winding map | `‖DP‖ = 1 > K · 0`; `K_S = √2 ≤ 4 ≤ 7.35` | Pass (r5) | None |
| §5.2 Lean, both theorems (headline 2) | r5: `|x|^{1/2}`; Cantor; `p = 1/2` series | both sides iff `p < 4`; both false; `Σ 8^{−k/2} < ∞`, `Σ 1 = ∞` | Pass (r5) | None |
| §5.3 Lean (headline 2, sample) | r5: `K = 0` constant; `max(0, t)`; radial `a = 1/2` | left fails `1 ≤ 0`, right holds, so `hK` is used; both hold, `K = 1`; `K_O = 2` vs maximal `4` | Pass (r5) | None |
| §6.1, §6.3 (sample) | r5 (§6.2, §2.8 rows): fold; `|x|^{1/2}` | `J = −1` on `x₁ < 0`; derivative in `L^p` iff `p < 2` | Pass (r5) | None |
| §6.4 (headline 3, sample) | r5: strip map `h`; partial collapse | `q_O = k` on the `k`-th strip, `K_p = ∞`; `1 > K · 0` | Pass (r5) | None |
| §7.1 (sample) | r5: identity; constant; unit ball | `1`-quasiregular; excluded; every `N` would qualify | Pass (r5) | None |
| §7.2, §7.3 (headline 4, sample) | r5: `f ∘ R`; `T²` with `dx² + 4dy²` | `J = J_f(Rx) ≥ 0`, same `K`; bound `4`, true value `1` | Pass (r5) | None |
| §7.4 transfer (sample) | r5 (§4.3, §4.4 rows): torus projection; shear `θ` | `K_π = 1`; `K_θ = ∞` | Pass (r5) | None |
| §7.5 orbit orientation | r5: translations; glide; antipodal on `S¹`, `S²` | `det = 1`; `−1`; degrees `+1`, `−1` | Pass (r5); R01 concerns the board only | None |
| §7.7 (headline 6) | r5: doubling `∘ π` | `K_π = 1`, `K_p = 2`, composite `≤ 2` | Pass (r5) | None |

**Library declarations opened at the pins for this round (4).** `MeasureTheory.memLp_zero_iff_aestronglyMeasurable` (`Mathlib/MeasureTheory/Function/LpSeminorm/Basic.lean:84`); `TauCeti.IsLocalRiemannianIsometry` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean:70`), `.comp` (:182) and `TauCeti.RiemannianIsometry.isLocalRiemannianIsometry` (:197). The 75 names elaborated and 8 read in source by the previous report are cited by unchanged text.

**Cross-roadmap citations resolved for this round (1).** RiemannianGeometry R4 item 7 on main (5fc1aa8): the Killing–Hopf classification and the quotient by free, properly discontinuous isometries with the projection a local Riemannian isometry, as the new §7.6 sentence uses them. The resolver's three leads are as before: SobolevMapsBetweenManifolds is the design-stage supplier of the six declared gaps, and the two `IsQuasiregularOn.*` names are declared in `Suggested.lean`. The overlap data lists no pull request changing this roadmap and no dropped id. The change adds no object, so ownership and duplication are as the previous report found them.

**Declared gaps.** The six SobolevMapsBetweenManifolds contracts (README:380–405) are unchanged and match the plan slug for slug; the seventh entry of the plan is R01.

**Description.** Unchanged in substance and still agrees with the head ("closed orientable flat manifolds", the six gaps, §7.5 owned locally). The generated blocks were not reviewed as prose.

Remark, no change requested: README:453 says "Layers 1 and 5 can be built at once", while §5.3 needs §2.9 and §3.1; the preceding paragraph ("independent of Layers 2–4 except in §5.3") and Layer 5's Dependencies already say so.

## Not verifiable

- Nothing in the changed passages. Rickman1993, Vaisala1971, Ahlfors2006, Lee2012, Reshetnyak1989, IwaniecMartin2001, BonkHeinonen2001, Gromov1981 and Gromov1999 are settled as uncertified in the manifest, as in the previous report; none of the changed lines cites them.

## Source issues

- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24 (line 1328): the source composes the Nash embedding before the manifold map; it should compose the embedding after it, giving `ι ∘ p : M → ℝᵐ`; affects the proof.
- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24 (lines 1333 and 1338): the denominator's determinant drops the simplex index; it should be the minimum over `κ(σᵢ)` of `det Dϕᵢ`; affects the proof.
