# Review of DifferentialGeometry (pull request #886 at c4e2a0d)

**Verdict:** needs changes

This is an incremental re-review of the 64 changed README lines since bd8a8c3. `Suggested.lean` is byte-identical to bd8a8c3 (and to 4753cef). Both previous findings are repaired. One P3 finding remains, in the downstream-consumer entries this round rewrote: two of them still leave out sections their consumers cite by number. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with its 36 `sorry` warnings and nothing else.

## R01 (P3) — Two rewritten consumer entries leave out sections their consumers cite

**Location.** README 3170–3171: "HamiltonianReduction 0.4, 3.5, the de Rham carrier, compact supports (6.4), chain integration (8.4), Sard (10.2) and the degree (10)". README 3194: "**AnalyticNumberTheoryPartI** (5, 12)".

**Claim.** This round rewrote these entries as section-by-section lists, and the section's preamble (3146) says consumption is recorded "by layer or section". Two lists are still incomplete:

- HamiltonianReduction cites 7.3 and layer 9, which its entry leaves out.
- AnalyticNumberTheoryPartI cites §§5.6.2–5.6.3. This README treats 5.6 as a layer of its own: "### Layer 5.6" (2049), "planar Green (5.6)" (32, 3176, 3201). The entry "(5, 12)" therefore leaves 5.6 out.

A renumbering of 7.3, 9 or 5.6 would not show up as touching these consumers. This is the same defect as the previous report's R02 on the ComplexKahlerGeometry entry.

**Witness** (main `71c8f21`):
- SymplecticGeometry/HamiltonianReduction README 73: "DifferentialGeometry 0.4, 3.5–3.6, 5–6 and 7.3–10 for … compact support, relative de Rham integration and degree".
- AnalyticNumberTheoryPartI README 134: "§§5.6.2–5.6.3 supply planar Green, integer-weighted arc cancellation".

**Repair.** Make two replacements.

1. At 3170–3171, replace "compact supports (6.4), chain integration (8.4), Sard (10.2)" with the following text:

   > compact supports and their Mayer–Vietoris sequence (6.4, 7.3), chain integration (8.4), the integration and Poincaré pairing of layer 9, Sard (10.2)

2. At 3194, replace "(5, 12)" with "(5, 5.6, 12)".

I tested both on a scratch copy of the README. `roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere, and no line is longer than 100 columns. 7.3 (2482) and 9.1 (2638) exist at this head.

## Previous findings

- R01 — repaired: README 1714–1721 now names `TauCeti.integralTopForm_eq_chartIntegral` for integrable forms supported in one chart. It then gives the explicit chart formula for continuous compactly supported forms under `TauCeti.integralTopForm_of_tsupport_subset_chart` (`Integration/Regularity.lean`). The From Tau Ceti contract (446) lists that name.
- R02 — repaired: README 3159–3167, the ComplexKahlerGeometry entry, now lists 0.1, 0.3, 1.2, 1.5, 2.2, 5.2, 5.4, 6.2, 8.3–8.5, 9.3 and 12.1. That covers every DG section ComplexKahlerGeometry on main cites (README 63–144, 587, 629, 922–978, 1293–1396, 1666).

## Verified sound

**Gate**, re-run on this head:

    gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's run on the same head also passed the targeted build (`build=0`).

**Dependency check:**

    depcheck: 233 roadmaps, 2263 edges, 0 problem(s)

It shows no UPWARD, CYCLE or `moved:` line.

Other checks:
- `git diff --stat origin/main...HEAD` outside the folder is empty, and `git merge-tree --write-tree HEAD origin/main` is clean.
- `roadmaps resolve` on the head README finds nothing. The seven Lean-name leads of `citations.md` (`Distribution.exists_leaf`, `Manifold.Orientation.pullbackSign`, …) are declared in `Suggested.lean` (333, 346, 356 and the `Distribution` section, 636–734).
- The overlap report lists #334 and #1187 on this folder. The description's generated merge-order block orders both after this pull request. The report shows no dropped or revision-only ids.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 36 `declaration uses sorry` warnings and no other diagnostic. `git diff --stat 4753cef HEAD -- Suggested.lean` is empty. The 64 declarations, their signatures and the nine "dropped binder" leads of `signatures.md` are therefore exactly as the reports on 4753cef and bd8a8c3 checked them.

**The 5.2 chart formula, checked against the pin** (Tau Ceti `2fd255d9`):
- `Integration/Regularity.lean:67` `integralTopForm_of_tsupport_subset_chart` takes:
  - `l : OrientationLift I M (Fin k)`;
  - `IsSmoothForm I 0 φ`;
  - compact `tsupport φ`;
  - `tsupport φ ⊆ (chartAt H α).source`;
  - `b : Basis (Fin k) ℝ E` with `b.orientation = l.modelOrientation`.

  It concludes that `integralTopForm (mk l) φ = ∫ y in (extChartAt I α).target, l.signAt α ((extChartAt I α).symm y) * mpullback 𝓘(ℝ,E) I (extChartAt I α).symm φ y b ∂b.addHaar`. README 1715–1721 says exactly this: a continuous form, compact support in the chart source, any lift, a positively oriented basis, the sign at the inverse-chart point, and the coefficient of the inverse-chart pullback on `b`.
- `TopForm.lean:722` `integralTopForm_eq_chartIntegral` takes `IntegrableTopForm φ` and `tsupport φ ⊆ (extChartAt I α).source`, and its conclusion is `l.chartIntegral φ α`. That is README 1713–1714's "an integrable form supported in one chart has that chart's integral for any representing lift".
- The variables at `Regularity.lean:34–37` (`[MeasurableSpace E] [BorelSpace E]` on the model, `[IsManifold I 1 M]`) put no Hausdorff or measurable structure on `M`, as 5.2 says.
- Other declarations opened: `Regularity.lean:43, 56, 77`, `TopForm.lean:695`.
- The name resolves for its consumers:
  - QuaternionicAnalysis README 160 and 810 (main), which use it "coefficientwise on that chart";
  - DeRhamCohomologyAndDuality README 252, 980 and 1006 (open head), which cite it with its full name.

**Downstream-consumer entries, resolved against the consumers on main `71c8f21`:**
- **AlgebraicTopology.** It cites DG2, DG2.2 (1436), DG2.4's outward-first S² orientation (1357, 2100), DG5.1 (82, 1002, 1526) and DG10 (87, 2103); the entry lists all of these. Its "DG9.3" lines (82–88, 1205, 1320, 1352) and "DifferentialGeometry 10.5" (394) state DG's consumption of AT, not the reverse. Its "DG1.3" (2098), and GeneralizedCohomology's (2223), is DGFloer 1.3, "The spectral sequence of a filtered complex" (DGFloer head README 1135).
- **GeometricTopology.** It cites Boundary and corners, Layers 3, 4, 5 and 12, 8.3 and 8.4 (149–153, 658–676, 803, 936, 1608, 6720–6882, 7096, 7728). All are listed.
- **ContactGeometry.** It cites layers 0–1 and DG4's contact model and non-involutivity (8, 27, 67). DG 1446–1474 and 1633–1634 carry it.
- **HeegaardFloer.** It cites:
  - 0.1, 0.3, 0.4 and 1.1–1.4 (2445–2451, 2590);
  - Layers 0–3, 6, 8 and 10 (153), and layer 2 with its cover (400, 778);
  - 3.2–3.5 (2476–2477);
  - 5.4, 5.6.3, 6.2 and 8.4–8.5 (3421–3459), and 10.2 (134, 1373).

  All are listed, at least at layer level.
- **LieGroupoidsPoisson.** It cites 0.1, 0.2, 0.4, Layers 1, 3, 4, 5 and 6, and 8.3, 10.1, 10.3–10.4 and 12.1 (190–196, 1412, 1676, 1686). The entry matches item for item.
- **GeneralizedCohomology.** It cites DG12.1 (2493). The entry matches.
- **ComplexKahlerGeometry.** See R02 above.
- **HamiltonianReduction and AnalyticNumberTheoryPartI.** See R01.

**Seeded sample.** The eight targets are now at README 545 ("Smooth 2-forms"), 1409, 1632, 2075, 2231, 2339, 2364 and 2379. None lies in a changed passage; they shifted by one line after 446 and by seven after 1721. Their earlier verification stands. No locator is flagged as unverified, and the changed lines add no locator.

**Ownership.** The changed lines add no owned object. They name a Tau Ceti native and consumers' sections. `roadmaps grep` of the new name finds only this folder, #1187 (the pin bump, ordered after this pull request) and #2085, which consumes it.

**Remarks** (untouched text and consumer-side citations; not findings):
- SymplecticGeometry's own clause (3168, unchanged) lists 1.4 and 5.4. SymplecticGeometry README 80 and 106 also cite "DifferentialGeometry8–9".
- GeometricTopology's unchanged wording "form integration (5.5a, 12.4)" points form integration at 5.5a. It is 5.2.
- On the consumer side:
  - HamiltonianReduction README 113 cites "DG3.6 proper exhaustion". There is no 3.6 on main or at this head.
  - ComplexKahlerGeometry README 1382–1397 cites a "DG8.4 open-pair cone" and relative chain comparisons. Main's DG has no open-pair cone either, and this head (102–106) leaves the relative theory to DeRhamCohomologyAndDuality.

**Adversarial table.** The first twelve rows are this round's. Rows marked "r29" are carried from the report on bd8a8c3, whose statements this diff leaves untouched; rows marked there as carried from r28 or r27 are carried with them.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 5.2 explicit chart formula (1715–1721) vs `Regularity.lean:67` | `M = ℝ`, chart `id`, `l` standard, `b = (e₁)`, `ω = f dx`, `f ∈ C_c`; lift `l'` = flip (model `−`, signs `−1`) with `b' = (−e₁)`; wrong model: `l` with `b = (−e₁)`; `dim 0` | `∫ 1·f = ∫ f` both sides; `∫ (−1)(−f) d(Leb) = ∫ f`; `−∫ f ≠ ∫ f`, excluded by the stated positivity of `b`; target `{0}`, `b.addHaar = δ₀`, value `signAt·ω(pt)()` both sides | holds | none |
| 5.2 chart integral of integrable forms (1713–1714) vs `TopForm.lean:722` | `ω = 1_[0,1] dx` on `ℝ` (rough, integrable) | `IsSmoothForm I 0` fails, so only `eq_chartIntegral` applies: `l.chartIntegral ω 0 = 1`; the README gives the explicit formula only for continuous forms | holds | none |
| From Tau Ceti contract (446) | name, file | `integralTopForm_of_tsupport_subset_chart` at `Regularity.lean:67`; `Regularity` is in the listed `{…}.lean` set (441) | holds | none |
| AlgebraicTopology entry (3151–3154) | AT README on main | cites {2, 2.2, 2.4, 5.1, 10}; the entry lists {2, 2.4, 5.1, 5.5b, 10.5}; DG1.3 = DGFloer 1.3 | holds | none |
| GeometricTopology entry (3155–3158) | GT README on main | cites {B&C, 3, 4, 5, 8.3, 8.4, 12}; the entry lists {2, 3, 4, 5.5a, 5.5b, 8.3–8.4, 12, 12.4} | holds | none |
| ComplexKahlerGeometry entry (3159–3167) | CKG README on main | cites {0.1, 0.3, 0.4, 1.2, 1.5, 2.1, 2.2, 5.2, 5.4, 5.5, 6.2, 8.3–8.5, 9.3, 12.1, 12.4}; the entry lists the same set | holds | none |
| ContactGeometry clause (3169–3170) | CG README 8, 27, 67 | cites {0–1, 4}; the entry lists {0–1, 4} | holds | none |
| HamiltonianReduction clause (3170–3171) | HR README 73, 103, 113 | cites {0.4, 3.5, 5–6, 6.4, 7.3, 8, 8.4, 9, 10, 10.2}; the entry lists {0.4, 3.5, 6, 6.4, 8.4, 10, 10.2}; missing {7.3, 9} | incomplete | R01 |
| HeegaardFloer entry (3174–3178) | HF README on main | cites {0.1, 0.3, 0.4, 1.1–1.4, 2, 3.2–3.5, 5, 5.4, 5.6.3, 6, 6.2, 8, 8.4–8.5, 10, 10.2}; the entry covers every layer and subsection | holds | none |
| LieGroupoidsPoisson entry (3192) | LGP README on main | cites {0.1, 0.2, 0.4, 1, 3, 4, 5, 6, 8.3, 10.1, 10.3–10.4, 12.1}; the entry is identical | holds | none |
| AnalyticNumberTheoryPartI entry (3194) | ANT-I README 134, 1214, 2218 | cites {5.3–5.5, 5.6.2–5.6.3, 5, 12}; the entry lists {5, 12}; 5.6 is a separate layer here (2049) | incomplete | R01 |
| GeneralizedCohomology entry (3194) | GC README 2223, 2493 | cites {12.1} (2223 is DGFloer); the entry lists {12.1} | holds | none |
| 0.4 legacy two-form identity (r29) | constant `dx∧dy` on `ℝ²` at `(e₁, e₂)`; closedness | `1` on both sides; `mextDeriv φ = 0 ↔ mextDeriv φ = 0` | holds | none |
| 3.3 `Flow ℝ M` as toFlow (r29) | `v = 1` on `ℝ`; `v = x²` | `x + t` both sides; not complete, no flow | holds | none |
| 5.5a scaling `(c • μ).toFun v = c · μ.toFun v` (r29) | `ℝ²`, `μ = \|dx∧dy\|`, `T = diag(2, −1)`, `c = 2, −1`; wrong model `v ↦ μ(cv)` | `4 = \|−2\|·2`; `−2 = 2·(−1)`; `μ(2e) = 4 ≠ 2` | holds | none |
| 5.5a Check `2 • μ` (r29) | as above | `2` on `e`, `2·\|det T\|` on `Te`; `μ(2e) = 4` | holds | none |
| 5.5a `φ · sign_o`, `∫_o φ = ∫ φ · sign_o` (r29) | `φ = dx` on `ℝ`, `v = −1`; `o`, `−o` with `f dx` | `(−1)(−1) = 1 = \|−1\|·1`; `∫ f = ∫ f`, `−∫ f = −∫ f` | holds | none |
| 8.4 Stokes as SmoothSimplex.integral_mextDeriv (r29) | `σ = id` on `Δ¹`, `0`-form `f` | `f(1) − f(0)` on both sides | holds | none |
| 8.5 acceptance period (r29) | `σ(t) = exp(2πit)` on `[0, 1]`; reversed | period `2π`; `−2π` | holds | none |
| 12.4 `ρ_g` value `1` on orthonormal bases (r29) | flat `ℝ²`; `g = diag(4, 1)`; wrong model `det g` | `1`; `2 = √det g`; `4 ≠ 2` | holds | none |
| 12.4 `∫ f dvol_g = ∫ f • ρ_g` (r29) | flat `ℝ²`; `g = diag(4, 1)` | `∫ f dx`; `∫ 2f dx` both sides | holds | none |
| 5.5a rough densities (r28, via r29) | `ℝ²`, `m = 2`, `T = diag(2, −1)`; `m = 1`; `dim 0`; `dx∧dy` | `2 = \|det T\|`; `1 ≠ 2`; `Density 0 0 ≅ ℝ`; `−2 ≠ 2` | holds | none |
| 5.5a Check `\|ω\|` and the Riemannian density (r28, via r29) | flat `ℝ²`, `T = diag(2, −1)` | `√det(TᵀT) = 2 = \|det T\|` | holds | none |
| Docstring: `immersionMetric`, `halfSpaceBoundaryMetric` (r28, via r29) | `n = 0`; flat half-plane | trivial fibre; `dy²` on both sides | holds | none |
| Docstring: `Density`, `planarRadialPrimitive`, `contractionAlongMap`, `familyContraction` (r28, via r29) | `P = 1, Q = 0`; `ι_{e₁}(dx∧dy)` | `g = Re z` vs `(x dy − y dx)/2`; `dy` | holds | none |
| 5.5a `Density` (r27, via r29) | `V = ℝ`, `m = 1`; `dx` | `toFun(−1) = toFun 1`; `dx(−1) = −1` | discriminates | none |
| 12.1 `immersionMetric` (r27, via r29) | `id`; `2x`; `x²` | metric; `4dx²`; `hinj` fails at `0` | body correct | none |
| 2.4 orientation cover (r27, via r29) | `∅`; `dim 0`; `S¹ ⊔ S¹`; `S¹ ⊔ B` | true/true ×3; false/false | holds | none |
| 2.4 averaging and `d` (r27, via r29) | `τ ≡ c`; `τ = id` | `df/2`; `dφ` | holds | none |
| 9.2 top compact cohomology (r27, via r29) | point; `ℝ`; open Möbius band | `ℝ`; `ℝ` by `∫`; `0` | holds | none |
| 9.3 `bijective_poincarePairing` (r27, via r29) | `∅`; discrete; `ℝ`; `[0, 1]` | `0 → 0`; `∏ℝ → (⊕ℝ)^*`; `1 ↦ ∫`; excluded | holds | none |
| 10.3–10.4 degree formula (r27, via r29) | `id` on `S¹`; constant; `o ↦ −o`; `n = 0` | `1·∫η`; `0`; negated; `±1` | holds | none |
| 4.2–4.4 Frobenius on `TauCeti.IntegralManifold` (r27, via r29) | constant; contact; rank 0; irrational line | affine; `∂z ∉ D`; points; dense | holds | none |
| 5.6 punctured-plane family (r27, via r29) | general `α`; unit circle; ellipse | curl `2(1−α)ρ^(−α)`; `2π`; `πab` | holds | none |
| 12.5 divergence theorem with boundary (r27, via r29) | half-line; unit disc; `n = 0` | `−f(0)`; `2π`; trivial fibre | holds | none |
| 11 hairy ball (r27, via r29) | `n = 0, 1, 2` | `v = 0`; `ix` excluded; vanishes at poles | holds | none |
| 2.2 top form, atlas criterion, `pullbackSign` (r27, via r29) | `dim 0`; `ℝ`; `Icc 0 1`; charts `t`, `−t` | `φ = 1`; `dx(e₁) = 1`; excluded; `−1` | holds | none |
| 0.3 `isSmoothBundleForm_mpullback` (r27, via r29) | `f = id`; trivial bundle | `φ`; native case | holds | none |
| 3.1–3.5 flows (r27, via r29) | `v = 1`; `x²`; `ℓ²`, `Ax`; `v s x = s` | `x + t + u`; `1/(1/x − t)`; `e^{tA}x`; `x + (t² − s²)/2` | holds | none |
| 5.4 radial primitive, 5.4a moving pullback (r27, via r29) | `(y, x)`; `(−y, x)`; `x + t e₁`, `x dy` | `xy`; excluded; `dy = 0 + dy` | holds | none |
| 12.1 `volume_circle` (r27, via r29) | round metric | `2π` | holds | none |

## Not verifiable

- [Lee], GTM 218, is not in the sources cache and is not open access. The changed lines add no locator. Its existing citations near them (Prop. 16.6 in 5.2) are unchanged since 03882f5.
- The consumer entries were resolved against main `71c8f21`. DGFloer 1.3 was read at its open head, which can move.

## Source issues

- none
