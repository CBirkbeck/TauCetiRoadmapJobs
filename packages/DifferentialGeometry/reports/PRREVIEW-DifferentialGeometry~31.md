# Review of DifferentialGeometry (pull request #886 at 729e951)

**Verdict:** accepted

This is an incremental re-review of the 37 changed README lines since c4e2a0d, all in *Downstream consumers* (README 3155–3203). `Suggested.lean` is unchanged. The one previous finding is repaired, the repair introduced no new problem, and no finding remains. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with its 36 `sorry` warnings and nothing else.

## Previous findings

- R01 — repaired: README 3171–3175 now reads "the de Rham complex of layer 6 with compact supports (6.4) and their Mayer–Vietoris sequence (7.3), chain integration (8.4), the integration and Poincaré pairing of layer 9"; README 3201 reads "**AnalyticNumberTheoryPartI** (5, 5.6.2–5.6.3, 12)".

## Verified sound

**Gate**, re-run on this head:

    gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's run on the same head also passed the targeted build (`build=0`).

**Dependency check:**

    depcheck: 233 roadmaps, 2263 edges, 0 problem(s)

It shows no UPWARD, CYCLE or `moved:` line.

Other checks:
- `git diff --stat origin/main...HEAD` outside the folder is empty, and `git merge-tree --write-tree HEAD origin/main` is clean.
- `git diff --stat c4e2a0d HEAD` touches `README.md` only. The 64 declarations of `Suggested.lean`, their signatures and the nine "dropped binder" leads of `signatures.md` are as the earlier reports checked them.
- `lake env lean` on `Suggested.lean` exits 0 with 36 `declaration uses sorry` warnings and no other diagnostic.
- `roadmaps resolve` on the head README finds no cross-roadmap citation and no Lean name found nowhere. The seven Lean-name leads of `citations.md` are declarations of `Suggested.lean`, as the previous report recorded.
- No changed line is longer than 100 characters.
- The overlap report lists #334 and #1187 on this folder; the description orders both after this pull request. It shows no dropped or revision-only ids.

**Every section the changed lines name exists at this head** (25 headings opened): 0.4 (832), 1.4 (934), 3.5 (1324), 5.1 (1648), 5.2 (1705), 5.3 (1735), 5.4 (1757), 5.5a (1885), 5.5b (1924), Layer 5.6 (2049), 5.6.2 (2182), 5.6.3 (2296), 6.4 (2450), 7.3 (2482), 8.4 (2588), 8.5 (2617), 9.1–9.3 (2638, 2648, 2665), 10.2 (2695), 12.1–12.4 (2801, 2848, 2871, 2896), and Layer 0 (691).

**The eight changed consumer entries, resolved against the consumers on main `71c8f21`:**
- **GeometricTopology** (3155–3158). "the integral of top forms (5.2), densities (5.5a, 12.4)": 5.2 is "Integration of top forms" (1705), and 5.5a and 12.4 are the density sections (1885, 2896). This corrects the wording the previous report remarked on.
- **SymplecticGeometry** (3168–3169). Its README cites the generic-form migration (32), "forms, Cartan and homotopy formulas, de Rham theory, integration, smooth flows and Frobenius" (59), "DifferentialGeometry8–9" (80, 106, the latter for the "de Rham integration comparison") and time-dependent complete flows (80). The entry lists 0.4, 1.4, 5.4, 3.5 and layers 8–9.
- **HamiltonianReduction** (3171–3175). Its README cites 0.4 (20, 43, 350), "0.4, 3.5–3.6, 5–6 and 7.3–10 for generic-form migration, time-dependent complete flows, homotopy, compact support, relative de Rham integration and degree" (73), 3.5 and the Cartan formula (83), DG10's degree (103) and 10.2 (113). The entry lists 0.4, 1.4, 3.5, 5.4, layer 6 with 6.4, 7.3, 8.4, layer 9, 10.2 and 10, which covers each stated use.
- **MorseTheory** (3181–3183). Its README cites 5.1 (19, 263, 280), "DG Layers 3,5,10,12" for "sharp finite-dimensional Sard, metrics and Hessians" (64–65), DG's Hessian (117), DG Sard (463) and 12.2's `mgradient` (897). The entry lists 3, 5.1, 10.2, 10 and 12.1–12.3; the Hessian is in 12.3 (2871).
- **RiemannianGeometry** (3186–3189). Its README cites Layers 0–3, 5–10, 12 (69) and "DifferentialGeometry5.6" (121). Surfaces cites 5.3–5.5 (194, 556), 5.6.3 (88, 195), 10.2 (427, 466), 12.2 (716, 739, 749) and 12.4 (253, 267, 287, 311, 383, 450, 466, 556). The entry lists each one.
- **CharacteristicClasses** (3193). Its README cites "Layers1–2,5–10" for "forms, wedge, d, orientations, integration/Stokes, compact supports" (88–89), DG10.2 (963) and DG8 (981). Forms and the wedge are layer 0 here (691), so "0–2, 5–10" is the accurate range.
- **Orbifolds** (3196–3197). Its README cites "manifold forms, orientations, outward-normal-first boundary convention, smooth integration and de Rham comparison" (60–62) and 8.4–8.5 (566). The entry lists 0–1, 2, 5.1, 5.2 and 8.4–8.5.
- **AnalyticNumberTheoryPartI** (3201). Its README cites Layer 12, 5.3–5.5 and §§5.6.2–5.6.3 (134) and Layers 5 and 12 (1214). The entry lists 5, 5.6.2–5.6.3 and 12.

**Seeded sample.** The eight targets are at README 545, 1409, 1632, 2075, 2231, 2339, 2364 and 2379, all before the changed passage (3155–3203), on lines identical to c4e2a0d. Their earlier verification stands. No locator is flagged as unverified, and the changed lines add no locator, no statement and no Lean name.

**Ownership.** The changed lines add no owned object and no supplier: they record which sections existing consumers read. Nothing in them names a roadmap as a supplier of this one.

**Headlines and padding.** `Suggested.lean` is unchanged since 4753cef, so the headline list, the docstring's not-statable list and the one-tactic probes of the earlier reports stand.

**Remarks** (consumer-side or untouched text; not findings):
- HamiltonianReduction README 73 and 113 cite "3.5–3.6" and "DG3.6 proper exhaustion". There is no 3.6 on main or at this head; the entry lists 3.5 only.
- ComplexKahlerGeometry README 1382–1397 cites a "DG8.4 open-pair cone". This head leaves the relative theory to DeRhamCohomologyAndDuality.
- Surfaces calls 5.6.3 a Green identity "for piecewise `C¹` cycles", and the entry repeats that wording. 5.6.3 (2296) states it for absolutely continuous cycles, which include them.

**Adversarial table.** The first eight rows are this round's, one per changed entry (the diff changes no mathematical statement). The others are carried from the report on c4e2a0d (r30), whose statements this diff leaves untouched; rows that report carried from r29, r28 or r27 are carried with them.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| GeometricTopology entry (3155–3158) | GT README on main; headings 1705, 1885, 2896 | cites {B&C, 3, 4, 5, 8.3, 8.4, 12}; the entry lists {2, 3, 4, 5.2, 5.5a, 5.5b, 8.3–8.4, 12, 12.4}; 5.2 = integration of top forms, 5.5a = densities | holds | none |
| SymplecticGeometry clause (3168–3169) | SG README 32, 59, 80, 106 | cites {0.4 migration, Cartan, homotopy, time-dependent flows, 8–9}; the entry lists {0.4, 1.4, 5.4, 3.5, 8–9} | holds | none |
| HamiltonianReduction clause (3171–3175) | HR README 20, 43, 73, 83, 103, 113 | cites {0.4, 3.5, 3.6 (absent), 5–6, 7.3–10, Cartan, 10, 10.2}; the entry lists {0.4, 1.4, 3.5, 5.4, 6, 6.4, 7.3, 8.4, 9, 10, 10.2}; r30's missing {7.3, 9} now present | holds | none |
| MorseTheory entry (3181–3183) | MT README 19, 64, 117, 263, 463, 897 | cites {3, 5, 5.1, 10, Sard, 12, Hessian, 12.2}; the entry lists {3, 5.1, 10.2, 10, 12.1–12.3}; Hessian in 12.3 | holds | none |
| RiemannianGeometry entry with Surfaces (3186–3189) | RG README 69, 121; Surfaces 88, 194, 427, 556, 716 | RG cites {0–3, 5–10, 12, 5.6}; Surfaces cites {5.3–5.5, 5.6.3, 10.2, 12.2, 12.4}; the entry lists the same sets (5.5 as 5.5a–5.5b) | holds | none |
| CharacteristicClasses entry (3193) | CC README 88–89, 963, 981; DG heading 691 | cites {1–2, 5–10} for forms and wedge; wedge and forms are layer 0; the entry lists {0–2, 5–10} | holds | none |
| Orbifolds entry (3196–3197) | Orbifolds README 60–62, 566 | cites {forms, orientations, boundary convention, integration, 8.4–8.5}; the entry lists {0–1, 2, 5.1, 5.2, 8.4–8.5} | holds | none |
| AnalyticNumberTheoryPartI entry (3201) | ANT-I README 134, 1214 | cites {5, 5.3–5.5, 5.6.2–5.6.3, 12}; the entry lists {5, 5.6.2–5.6.3, 12}; r30's missing 5.6 now present | holds | none |
| 5.2 explicit chart formula (1715–1721) vs `Regularity.lean:67` (r30) | `M = ℝ`, chart `id`, `l` standard, `b = (e₁)`, `ω = f dx`, `f ∈ C_c`; lift `l'` = flip (model `−`, signs `−1`) with `b' = (−e₁)`; wrong model: `l` with `b = (−e₁)`; `dim 0` | `∫ 1·f = ∫ f` both sides; `∫ (−1)(−f) d(Leb) = ∫ f`; `−∫ f ≠ ∫ f`, excluded by the stated positivity of `b`; target `{0}`, `b.addHaar = δ₀`, value `signAt·ω(pt)()` both sides | holds | none |
| 5.2 chart integral of integrable forms (1713–1714) vs `TopForm.lean:722` (r30) | `ω = 1_[0,1] dx` on `ℝ` (rough, integrable) | `IsSmoothForm I 0` fails, so only `eq_chartIntegral` applies: `l.chartIntegral ω 0 = 1`; the README gives the explicit formula only for continuous forms | holds | none |
| From Tau Ceti contract (446) (r30) | name, file | `integralTopForm_of_tsupport_subset_chart` at `Regularity.lean:67`; `Regularity` is in the listed `{…}.lean` set (441) | holds | none |
| AlgebraicTopology entry (3151–3154) (r30) | AT README on main | cites {2, 2.2, 2.4, 5.1, 10}; the entry lists {2, 2.4, 5.1, 5.5b, 10.5}; DG1.3 = DGFloer 1.3 | holds | none |
| ComplexKahlerGeometry entry (3159–3167) (r30) | CKG README on main | cites {0.1, 0.3, 0.4, 1.2, 1.5, 2.1, 2.2, 5.2, 5.4, 5.5, 6.2, 8.3–8.5, 9.3, 12.1, 12.4}; the entry lists the same set | holds | none |
| ContactGeometry clause (3169–3170) (r30) | CG README 8, 27, 67 | cites {0–1, 4}; the entry lists {0–1, 4} | holds | none |
| HeegaardFloer entry (3174–3178) (r30) | HF README on main | cites {0.1, 0.3, 0.4, 1.1–1.4, 2, 3.2–3.5, 5, 5.4, 5.6.3, 6, 6.2, 8, 8.4–8.5, 10, 10.2}; the entry covers every layer and subsection | holds | none |
| LieGroupoidsPoisson entry (3192) (r30) | LGP README on main | cites {0.1, 0.2, 0.4, 1, 3, 4, 5, 6, 8.3, 10.1, 10.3–10.4, 12.1}; the entry is identical | holds | none |
| GeneralizedCohomology entry (3194) (r30) | GC README 2223, 2493 | cites {12.1} (2223 is DGFloer); the entry lists {12.1} | holds | none |
| 0.4 legacy two-form identity (r30, from r29) | constant `dx∧dy` on `ℝ²` at `(e₁, e₂)`; closedness | `1` on both sides; `mextDeriv φ = 0 ↔ mextDeriv φ = 0` | holds | none |
| 3.3 `Flow ℝ M` as toFlow (r30, from r29) | `v = 1` on `ℝ`; `v = x²` | `x + t` both sides; not complete, no flow | holds | none |
| 5.5a scaling `(c • μ).toFun v = c · μ.toFun v` (r30, from r29) | `ℝ²`, `μ = \|dx∧dy\|`, `T = diag(2, −1)`, `c = 2, −1`; wrong model `v ↦ μ(cv)` | `4 = \|−2\|·2`; `−2 = 2·(−1)`; `μ(2e) = 4 ≠ 2` | holds | none |
| 5.5a Check `2 • μ` (r30, from r29) | as above | `2` on `e`, `2·\|det T\|` on `Te`; `μ(2e) = 4` | holds | none |
| 5.5a `φ · sign_o`, `∫_o φ = ∫ φ · sign_o` (r30, from r29) | `φ = dx` on `ℝ`, `v = −1`; `o`, `−o` with `f dx` | `(−1)(−1) = 1 = \|−1\|·1`; `∫ f = ∫ f`, `−∫ f = −∫ f` | holds | none |
| 8.4 Stokes as SmoothSimplex.integral_mextDeriv (r30, from r29) | `σ = id` on `Δ¹`, `0`-form `f` | `f(1) − f(0)` on both sides | holds | none |
| 8.5 acceptance period (r30, from r29) | `σ(t) = exp(2πit)` on `[0, 1]`; reversed | period `2π`; `−2π` | holds | none |
| 12.4 `ρ_g` value `1` on orthonormal bases (r30, from r29) | flat `ℝ²`; `g = diag(4, 1)`; wrong model `det g` | `1`; `2 = √det g`; `4 ≠ 2` | holds | none |
| 12.4 `∫ f dvol_g = ∫ f • ρ_g` (r30, from r29) | flat `ℝ²`; `g = diag(4, 1)` | `∫ f dx`; `∫ 2f dx` both sides | holds | none |
| 5.5a rough densities (r30, from r28) | `ℝ²`, `m = 2`, `T = diag(2, −1)`; `m = 1`; `dim 0`; `dx∧dy` | `2 = \|det T\|`; `1 ≠ 2`; `Density 0 0 ≅ ℝ`; `−2 ≠ 2` | holds | none |
| 5.5a Check `\|ω\|` and the Riemannian density (r30, from r28) | flat `ℝ²`, `T = diag(2, −1)` | `√det(TᵀT) = 2 = \|det T\|` | holds | none |
| Docstring: `immersionMetric`, `halfSpaceBoundaryMetric` (r30, from r28) | `n = 0`; flat half-plane | trivial fibre; `dy²` on both sides | holds | none |
| Docstring: `Density`, `planarRadialPrimitive`, `contractionAlongMap`, `familyContraction` (r30, from r28) | `P = 1, Q = 0`; `ι_{e₁}(dx∧dy)` | `g = Re z` vs `(x dy − y dx)/2`; `dy` | holds | none |
| 5.5a `Density` (r30, from r27) | `V = ℝ`, `m = 1`; `dx` | `toFun(−1) = toFun 1`; `dx(−1) = −1` | discriminates | none |
| 12.1 `immersionMetric` (r30, from r27) | `id`; `2x`; `x²` | metric; `4dx²`; `hinj` fails at `0` | body correct | none |
| 2.4 orientation cover (r30, from r27) | `∅`; `dim 0`; `S¹ ⊔ S¹`; `S¹ ⊔ B` | true/true ×3; false/false | holds | none |
| 2.4 averaging and `d` (r30, from r27) | `τ ≡ c`; `τ = id` | `df/2`; `dφ` | holds | none |
| 9.2 top compact cohomology (r30, from r27) | point; `ℝ`; open Möbius band | `ℝ`; `ℝ` by `∫`; `0` | holds | none |
| 9.3 `bijective_poincarePairing` (r30, from r27) | `∅`; discrete; `ℝ`; `[0, 1]` | `0 → 0`; `∏ℝ → (⊕ℝ)^*`; `1 ↦ ∫`; excluded | holds | none |
| 10.3–10.4 degree formula (r30, from r27) | `id` on `S¹`; constant; `o ↦ −o`; `n = 0` | `1·∫η`; `0`; negated; `±1` | holds | none |
| 4.2–4.4 Frobenius on `TauCeti.IntegralManifold` (r30, from r27) | constant; contact; rank 0; irrational line | affine; `∂z ∉ D`; points; dense | holds | none |
| 5.6 punctured-plane family (r30, from r27) | general `α`; unit circle; ellipse | curl `2(1−α)ρ^(−α)`; `2π`; `πab` | holds | none |
| 12.5 divergence theorem with boundary (r30, from r27) | half-line; unit disc; `n = 0` | `−f(0)`; `2π`; trivial fibre | holds | none |
| 11 hairy ball (r30, from r27) | `n = 0, 1, 2` | `v = 0`; `ix` excluded; vanishes at poles | holds | none |
| 2.2 top form, atlas criterion, `pullbackSign` (r30, from r27) | `dim 0`; `ℝ`; `Icc 0 1`; charts `t`, `−t` | `φ = 1`; `dx(e₁) = 1`; excluded; `−1` | holds | none |
| 0.3 `isSmoothBundleForm_mpullback` (r30, from r27) | `f = id`; trivial bundle | `φ`; native case | holds | none |
| 3.1–3.5 flows (r30, from r27) | `v = 1`; `x²`; `ℓ²`, `Ax`; `v s x = s` | `x + t + u`; `1/(1/x − t)`; `e^{tA}x`; `x + (t² − s²)/2` | holds | none |
| 5.4 radial primitive, 5.4a moving pullback (r30, from r27) | `(y, x)`; `(−y, x)`; `x + t e₁`, `x dy` | `xy`; excluded; `dy = 0 + dy` | holds | none |
| 12.1 `volume_circle` (r30, from r27) | round metric | `2π` | holds | none |

## Not verifiable

- [Lee], GTM 218, is not in the sources cache and is not open access. The changed lines add no locator.
- The consumer entries were resolved against main `71c8f21`. Consumers that exist only as open pull requests were not re-read; the changed lines touch none of them.

## Source issues

- none
