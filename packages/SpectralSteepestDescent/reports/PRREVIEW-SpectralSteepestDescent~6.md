# Review of SpectralSteepestDescent (pull request #2423 at 7460969)

**Verdict:** needs changes

Incremental re-review of the 137 lines changed since `054ef3c`. The six findings of the previous review are repaired; the two below, both P3, are in text the repair of the former R01 changed or made wrong.

## R01 (P3) — Layer 2 `### Dependencies` contradicts the new *Needs:* lines

**Location:** `TauCetiRoadmap/SpectralSteepestDescent/README.md` line 290: "2.1 uses OI-A50 and Majorization; 2.2 uses 1.3, 2.1 and Fan dominance; 2.3 uses 1.1–1.3 and PD-B19."

**Claim:** 2.1 no longer uses OI-A50: its route is now Lidskii's inequality on the Hermitian dilations. 2.2 now also uses MAJ-A31. The layer's dependency paragraph was not updated.

**Witness:** `README.md` line 236: "*Needs:* PD-A52, `LinearMap.hermitianDilation`, MAJ-A26, MAJ-B21."; line 261: "*Needs:* 1.3, 2.1, MAJ-A31, MAJ-B21."

**Repair:** "2.1 uses PD-A52, the Hermitian dilation and Majorization; 2.2 uses 1.3, 2.1, the Ky Fan triangle inequality and Fan dominance; 2.3 uses 1.1–1.3 and PD-B19."

## R02 (P3) — §2.1: the spectrum of the Hermitian dilation is misstated and has no stated input

**Location:** `README.md` lines 224–225: "(Proved here by applying Lidskii's inequality to the Hermitian dilations `LinearMap.hermitianDilation` of `A` and `B`, whose eigenvalues are `±σᵢ`.)"

**Claim:** For `finrank E ≠ finrank F` the dilation has further zero eigenvalues, so "`±σᵢ`" with `i < finrank E` has the wrong count. The fact is the step that turns Lidskii into the target, and no pinned declaration is named for it.

**Witness:** `A = (2 0) : ℝ² → ℝ`: the dilation on `ℝ³` has eigenvalues `2, 0, −2`; `±σᵢ(A)` for `i < 2` is `2, 0, −0, −2`, four values. `TauCeti/Analysis/InnerProductSpace/HermitianDilation/Spectrum.lean` line 156 gives the nonzero multiplicities.

**Repair:** "…of `A` and `B`: the nonzero eigenvalues of the dilation of `A` are `±σᵢ(A)` for `i < rank A`, with multiplicity (`LinearMap.finrank_eigenspace_hermitianDilation_eq_adjoint_comp_self`), so its `i`-th largest eigenvalue is `σᵢ(A)` and its `i`-th smallest `−σᵢ(A)` for `i < min(finrank E, finrank F)`.)" Add the name to the Tau Ceti item of the supplier contracts. Tested on `A = (2 0)`: largest `2 = σ₀`, smallest `−2 = −σ₀`, one index.

## Previous findings

- R01 — repaired: line 214 "**Lidskii's inequality.** For symmetric `S`, `T` … every set `J` of `k` indices"; line 236 "*Needs:* PD-A52, `LinearMap.hermitianDilation`, MAJ-A26, MAJ-B21." The repair left line 290 and the dilation's spectrum wrong (R01, R02 above).
- R02 — repaired: lines 154–158 "For injective `A`, `U_A` is the isometric embedding `LinearMap.polarIsometry` … Conversely … (proved here, from PD-B12 and PD-B13)"; both names in the Tau Ceti item, lines 80–82.
- R03 — repaired: line 249 "`Kₖ(A − Q) ≤ Kₖ(A) + Kₖ(Q) = Kₖ(A + W)` (MAJ-A31) for the upper bound"; line 261 "*Needs:* 1.3, 2.1, MAJ-A31, MAJ-B21."
- R04 — repaired: lines 66–67 "PD-A29 (the modulus `LinearMap.operatorAbs`), PD-A52 (eigenvalue monotonicity), PD-B11 to PD-B16 (the canonical polar factor …".
- R05 — repaired: lines 7–8 "every isometric extension of it is a nearest isometric embedding in every unitarily invariant seminorm".
- R06 — repaired: each of the 28 names of `Suggested.lean` occurs in `README.md` at its statement (whole-word count ≥ 1 for every one).

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 2.1 Lidskii's inequality (new target) | `S = diag(2,0)`, `T = diag(0,1)`, `J = {1}, {2}, {1,2}`; `k = 0`; `S = T` | `λ(S) = (2,0)`, `λ(T) = (1,0)`, `λ(S−T) = (2,−1)`: `1 ≤ 2`, `0 ≤ 2`, `1 ≤ 1`; `0 ≤ 0`; `0 ≤ 0` | holds; the Check at line 233 agrees |
| 2.1 Lidskii, route | `H = S − T`, `c = λₖ(H)`, `P = (H − c)₊` | `Σ_J (λⱼ(S) − λⱼ(T)) ≤ kc + tr P = Σ_{i≤k} λᵢ(H)`; on the instance, `k = 1`: `c = 2`, `P = 0`, bound `2` | route closes with PD-A52 |
| 2.1 `sum_abs_singularValues_sub_le_kyFanSum`, via dilations | `A = (2 0)`, `B = 0`; `diag(3,1)` vs `diag(1,3)` | dilation eigenvalues `2, 0, −2`; `2 ≤ 2`; `0, 0 ≤ 2, 4` | holds; R02 for the spectrum sentence |
| 2.2 upper bound (MAJ-A31) | `A = diag(2,0)`, `Q = −1`, `W = 1`, `k = 1, 2` | `Kₖ(A − Q) = 3, 4`; `Kₖ(A) + Kₖ(Q) = 3, 4`; `Kₖ(A + W) = 3, 4` | holds |
| 1.3 isometry bullet | `A = 0` on `ℝ`; `E = 0`; `A = (2,0)ᵀ` | `U_A = 0`, not injective, no embedding; `U_A = 0` isometry, `A` injective; `U_A = (1,0)ᵀ` embedding, not surjective | holds, both directions |
| Summary, lines 7–8 | `A = diag(2,0)` | `W = 1`, `W' = diag(1,−1)`: `‖A − W‖_op = ‖A − W'‖_op = 1` | holds ("a nearest") |

The rows for the untouched statements stand as in the previous review, of `054ef3c`; `Suggested.lean` is unchanged since then.

- Source locators: the diff changes none; FanHoffman1955 lines 59–65 (the subset inequality imported there from Wielandt) and 66–70 (Theorem 1) read again against §§2.1–2.2.
- Library declarations opened at the pin: `LinearMap.polarIsometry` (`Polar/Isometry.lean` 96, injective `A`); `exists_linearIsometryEquiv_eq_polarFactor` (`Polar/Finite.lean` 382, injective, equal `finrank`); `hermitianDilation` (`HermitianDilation/Basic.lean` 40); `finrank_eigenspace_hermitianDilation_eq_adjoint_comp_self` (`HermitianDilation/Spectrum.lean` 156); `kyFanSum_add_le` (`KyFan.lean` 387).
- Cross-roadmap citations resolved on main: PD-A29 (line 195), PD-A52 (line 257), PD-B12, PD-B13 (lines 333, 335) of PolarDecomposition; MAJ-A31 (line 185) of Majorization, whose notation `Kₖ` line 249 uses.
- Duplication by object: no Lidskii inequality in the pinned Mathlib or Tau Ceti, on main or at an open head; this roadmap is its owner.
- Dependency check: `depcheck: 247 roadmaps, 2305 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `7460969`: every check 0, OK. Elaboration of `Suggested.lean`: 20 `sorry` warnings, nothing else.
- The pull request changes no file outside the folder; its title and description agree with this head (`OperatorIdeals` OI-A50 is still a cited supplier, line 78).
- Remark: line 249 has no full stop between "for the upper bound" and "(Fan–Hoffman, Theorem 1, p. 112, …", so the locator reads as attached to the upper bound alone.
- Overlap check: read Majorization, PolarDecomposition, PrincipalAngles (main); nothing shared.

Source independence: changed passages only; 5 passages compared with 2 sources (FanHoffman1955, BernsteinNewhouse2024), none shared; largest share BernsteinNewhouse2024, 6 of 10 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- none

## Source issues

- **Misprint** in JordanMuon2024 at section *Proving that NS iteration orthogonalizes the update* (line 119): the source says the iterated odd quintic should tend to 1 for every starting value in the closed interval from 0 to 1; it should be the half-open interval excluding 0, where every odd polynomial vanishes; affects nothing.

## For the human reviewers

- **Scope.** §4.3 (band `[17/25, 5/4]`, entry time `K(s)`, threshold `1/270`) is stated in no source; the README says so after the §4.3 bullets. JordanMuon2024 is a web post, BernsteinNewhouse2024 an arXiv preprint.
- **Scope.** Layers 1–2 are general matrix analysis continuing `OperatorTheory/Majorization` and `OperatorTheory/PolarDecomposition`, now including Lidskii's eigenvalue inequality (`README.md` line 214); they sit in a top-level roadmap whose `metadata.toml` topic is `math.OC`.
- **Licence.** The README's `## Provenance` section names `github.com/brettkoonce/lean4-mlir` (stated BSD-3, by the pull request's author) as a prior formalization; `Suggested.lean` was not compared with its files.
