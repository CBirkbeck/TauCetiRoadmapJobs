# FIX-PKG-DynamicalDegreesOfRationalMaps~3

One review, `REV-PKG-DynamicalDegreesOfRationalMaps~2`, with two findings, both P3 and both citations. Both are right and both are applied. Only `packages/DynamicalDegreesOfRationalMaps/README.md` changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged (no gap is needed: every cited section exists where it is cited).

## F01 (P3) — applied

Old: §6.1 route said "these morphisms agree on overlaps and glue", naming no input. New: on `D_+(F_i) ∩ D_+(F_k)` the coordinate maps differ on degree-`n` forms by `(F_i/F_k)^n`, so after restriction (`AlgebraicGeometry.Proj.fromOfGlobalSections_naturality`) the morphisms agree by `TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling`. Both names are added to the Tau Ceti contract, §6.1 *Needs:* and Layer 6 Dependencies.

Verification at the Tau Ceti pin.

- `TauCeti.ProjectiveSpectrum.fromOfGlobalSections_eq_of_unit_rescaling` is at TauCeti/AlgebraicGeometry/ProjectiveSpectrum/GlobalCoordinates.lean:138. Elaborated type: for ring maps `f g : A →+* Γ(X, ⊤)`, a unit `c`, `h : ∀ n, ∀ a ∈ 𝒜 n, g a = c ^ n * f a` and `hf` (the irrelevant ideal maps to `⊤` under `f`), `fromOfGlobalSections 𝒜 g _ = fromOfGlobalSections 𝒜 f hf`.
- `AlgebraicGeometry.Proj.fromOfGlobalSections_naturality` is at TauCeti/AlgebraicGeometry/ProjectiveSpectrum/Naturality.lean:74. Elaborated type: `g ≫ fromOfGlobalSections 𝒜 f hf = fromOfGlobalSections 𝒜 (g.appTop.hom.comp f) _`.
- The overlap step. Chart `i` has coordinates `φ_i(y_j) = F_j/F_i`. On `D_+(F_i) ∩ D_+(F_k) = D_+(F_iF_k)` the function `c = F_i/F_k` is a unit, with inverse `F_k/F_i`. There `φ_k(y_j) = F_j/F_k = c·φ_i(y_j)`, so `φ_k(P) = c^n·φ_i(P)` for `P` of degree `n`. That is the hypothesis of the first lemma with `f = φ_i` and `g = φ_k`. The second lemma moves both chart morphisms to the overlap.
- The module docstring of `Suggested.lean` still holds: neither library has the glued map or the chart morphisms `y_j ↦ F_j/F_i`. It needs no change.

Added a §6.1 Check that pins the direction of the unit. On the overlap of the Cremona charts of `F_0` and `F_1`, the coordinates are `(1, x_0/x_1, x_0/x_2)` and `(x_1/x_0, 1, x_1/x_2)`, related by `x_1/x_0 = F_0/F_1`. The inverse `x_0/x_1` fails at `y_0`.

Same pattern elsewhere. `fromOfGlobalSections` and gluing appear in no other route. The §6.2 route "glue the maps `y_j ↦ F_j(x)` into a section of `aA − B`" glues sections of a line bundle, not morphisms to `Proj`. Mathlib's `Scheme.Cover` gluing there needs no Tau Ceti lemma. I also found Tau Ceti's `AlgebraicGeometry.Proj.fromOfGlobalSections_eq_of_openCover_unit_rescaling` (ProjectiveSpectrum/LocalEquality.lean:42), which combines the two lemmas over an open cover. The route compares two morphisms on one open, so the two lemmas the review names are the direct inputs. I did not add the combined lemma.

## F02 (P3) — applied

Old: "§2.6: Serre vanishing for ample line bundles …; finite-dimensionality of coherent cohomology …". New: "§2.6: finite-dimensionality …; and its target `proper_fibreDimension_vanishing` …, used for `X → Spec K`: on a proper `K`-scheme of dimension `≤ r`, `H^q(X, F) = 0` for `q > r`". It makes the truncated Euler characteristic the full one (Conventions) and additive in dimension `≤ r` (§2.1).

Verification on main. SchemeAndStackFoundations §2.6 (`TauCetiRoadmap/SchemeAndStackFoundations/README.md`, heading "2.6 Quasi-coherent cohomology") states `proper_fibreDimension_vanishing` for proper `f : X → Y` with `Y` locally Noetherian and fibres of dimension `≤ d`: `R^q f_* F = 0` for `q > d` and quasi-coherent `F`. `Spec K` is Noetherian, and the fibre of `X → Spec K` is `X`. §2.6 computes `R^q f_*` on affines by `H^q(f⁻¹U, F)`, so over `Spec K` it is `H^q(X, F)`. The citation resolver finds the name on main.

"Serre" occurred once in the README, in this bullet. `ample_serre_vanishing` is used by no route: §3.3 gets bigness from ArakelovGeometryAndAbelianHeightsPartII §0.3, and §3.1 gets very ampleness from AlgebraicModuliForArithmeticGeometry §1.4. So I dropped it from the exact contract. I checked whether Tau Ceti at the pin has the general vanishing, which would make Tau Ceti the supplier. It does not. It has `subsingleton_cohomology_of_two_le_of_isCurveOver` (Curves/Cohomology.lean:91), for curves only, and `Module.Basis.subsingleton_cohomology_proj_of_card_le` (Cohomology/ProjectiveSpace/Vanishing.lean:87), for projective space only. The §2.6 citation stands.

Same pattern elsewhere. Two other places use the same vanishing without citing it, and both are now cited.

- The Tau Ceti contract for `AlgebraicGeometry.Scheme.Modules.eulerCharBelow` says "It equals `χ` once `n > dim` on a proper scheme". It now adds "by the vanishing above the dimension of SchemeAndStackFoundations §2.6".
- The §2.1 route uses "additivity of `χ`" for the truncated `χ`. On a short exact sequence its defect lies in `H^{r+1}` of the first term, which is zero only by the same vanishing. The §2.1 *Needs:* now reads "§2.6 (finite-dimensional cohomology; vanishing above the dimension, for additivity of `χ`)".

The `Suggested.lean` docstring of `numericalIntersection` states the vanishing as mathematics without a supplier, which is correct for a Lean docstring. It is unchanged.

## Checks

- **Elaboration.** `lake env lean packages/DynamicalDegreesOfRationalMaps/Suggested.lean`, run from the content repository: exit 0, 20 warnings, all `declaration uses 'sorry'`, no errors. No object file was missing.
- **Signatures.** I put `#check @name` for all 33 declarations of `Suggested.lean`, and for the two Tau Ceti lemmas now cited, in one scratch file and elaborated it once: exit 0, no errors. `Suggested.lean` is unchanged this round. The 33 elaborated types are the ones in the worker's `signatures.md`; every binder is in the declaration's own signature. The two Tau Ceti types are quoted under F01 and match the contract bullet: `ψ(a) = c^n·φ(a)`, with the irrelevant-ideal hypothesis on `φ`.
- **Dependency check** (command of the brief): `depcheck: 235 roadmaps, 2234 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve` on the README): cross-roadmap citations found nowhere: none. Lean names found nowhere: none. That includes `proper_fibreDimension_vanishing`, found in SchemeAndStackFoundations on main.
- **Gate failures listed in the brief:** none.

## Adversarial pass (new and changed statements)

| statement | instances tried | values on each side | result | change |
| --- | --- | --- | --- | --- |
| Contract: `fromOfGlobalSections_eq_of_unit_rescaling` | Cremona, `φ = φ_0`, `ψ = φ_1`, `c = x_1/x_0`; `n = 1` on `y_0`; `n = 2` on `y_0y_1`; `n = 0` | `ψ(y_0) = x_1/x_0 = c·1`; `ψ(y_0y_1) = x_1/x_0`, `c²·φ(y_0y_1) = (x_1/x_0)²·(x_0/x_1) = x_1/x_0`; constants, `c^0 = 1` | hypothesis holds; irrelevant ideal: `φ(y_0) = 1` | new bullet |
| Contract: `fromOfGlobalSections_naturality` | `g = id`; `g` the inclusion of `D_+(F_iF_k)` into `D_+(F_i)` | `id^* ∘ φ = φ`, so both sides are the same; `g^*` is restriction, sending `F_j/F_i` to its image in the localization at `F_iF_k` | right | new bullet |
| §6.1 route, overlap step | charts `i, k` with `F_i, F_k ≠ 0`; `a = 0` (all `F_j` constants `c_j`); `a ≥ 1` | `φ_k = (F_i/F_k)^n·φ_i` on degree `n`; for `a = 0`: `φ_k(y_j) = c_j/c_k = (c_i/c_k)·(c_j/c_i)`, unit `c_i/c_k ∈ K^×`, glued map the constant `[c_0 : ⋯ : c_d]`, `V(F) = ∅` | unit exists in every case; direction `F_i/F_k` matches `g = c^n·f` with `g` the chart of `F_k` | route sentence |
| §6.1 Check (new), direction of the unit | `c = x_1/x_0` and its inverse | `c·(1, x_0/x_1, x_0/x_2) = (x_1/x_0, 1, x_1/x_2)`; `(x_0/x_1)·1 = x_0/x_1 ≠ x_1/x_0` | discriminates the direction | new Check |
| Contract §2.6, `proper_fibreDimension_vanishing` for `X → Spec K` | `r = 0`, `X = Spec L`, `[L : K]` finite; `ℙ¹`, `r = 1`, `O(−2)`; line `Z ⊆ ℙ²`, `r = 1` | `H^q = 0` for `q ≥ 1` (affine); `H² = 0`, so `χ` truncated at `2` is `0 − 1 = −1 = χ`; `H^q(ℙ², O_Z) = H^q(Z, O_Z) = 0` for `q ≥ 2` | right | contract bullet |
| §2.1 additivity of truncated `χ` | `0 → O_Z(−2) → O_Z(−1) → O_P → 0` on a line `Z`, `r = 1`; truncated at `2` and at `1` | at `2`: `χ(O_Z(−1)) = 0 = −1 + 1`; at `1`: `h⁰`: `0` versus `0 + 1`, defect `h¹(O_Z(−2)) = 1` | additivity needs vanishing in degree `r + 1`, now cited | *Needs:* line |
| `eulerCharBelow` contract, "equals `χ` once `n > dim`" | `ℙ¹`, `O(−2)`, `n = 2` and `n = 1` | `−1 = χ`; `0 ≠ −1` at `n = 1 = dim` | `n > dim` is the right bound | citation added |
| Dropped Serre vanishing | every route of Layers 2–3 | §3.3 bigness from ArakelovGeometryAndAbelianHeightsPartII §0.3 (2′); §3.1 very ampleness from AlgebraicModuliForArithmeticGeometry §1.4; no `H^q(F ⊗ L^n) = 0` step anywhere | unused | removed from contract |

## Notes for the maintainer

- No name of `Suggested.lean` changed and no section, layer or target id changed, so nothing that other roadmaps cite is affected.
- No new construction or target was added; both repairs are citations to suppliers already named (Tau Ceti at the pin, and SchemeAndStackFoundations on main). So no ownership question arises against open pull requests.
- The review's adversarial table labels its two findings `R01` and `R02`, and its round-1 notes refer to "R01 below". These are the findings it lists as F01 and F02.
- No passage of the review was suspicious, and none asked for anything outside this package.
