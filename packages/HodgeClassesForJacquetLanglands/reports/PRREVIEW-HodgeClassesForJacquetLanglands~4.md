# Review of HodgeClassesForJacquetLanglands (pull request #2436 at 3528628)

**Verdict:** needs changes

Incremental re-review of the 125 lines changed since `e9118f6`.

## R01 (P3) — the projective groups `PGU_E(U)` and `PGU_B(X)°` are still undefined

**Location:** `TauCetiRoadmap/HodgeClassesForJacquetLanglands/README.md` lines 1381–1382: "an isomorphism of algebraic `F`-groups `PGU_E(U) ≃ PGU_B(⋀²U)°`".

**Claim:** The previous R02 named the projective quotients among the undefined carriers. §1.2 now defines `GU_E`, `U_E`, `GSU_E`, `GU_B`, `U_B` and `GU_B°`, but no sentence says which central subgroup `PGU` divides out.

**Witness:** `PGU` occurs only at README lines 8 and 1382, neither a definition. The two candidates differ: `GU_E(U)/𝔾_m` has dimension `16`, `GU_E(U)/Res_{E/F}𝔾_m` has dimension `15 = dim GU_B(X)° − 1`.

**Repair:** Add to §1.2, after the definition of `GU_B(X)°`: "Put `PGU_E(U) = GU_E(U)/Res_{E/F}𝔾_m`, the quotient by the central subgroup of `E`-scalars, and `PGU_B(X)° = GU_B(X)°/𝔾_m`, the quotient by the `F`-scalars (ReductiveGroups Layer 3)." Add the Check: "For `n = 4` and `m = 3`, `dim PGU_E(U) = 17 − 2 = 15 = 16 − 1 = dim PGU_B(X)°`; dividing `GU_E(U)` by `𝔾_m` only would give `16`."

## Previous findings

- R01 — repaired: lines 36–44 name HilbertModularVarietiesAndShimuraCurves §§R18.4.1, R18.4.24b, R18.4.25a, R18.4.25 for the one-split-place case and say how §§0.2–0.5 differ; the four headings exist at that roadmap's head and say what is attributed to them.
- R02 — partly repaired: §1.2 (lines 1186–1217) defines `GU_E`, `U_E`, `GSU_E`, `GU_B`, `U_B`, `GU_B°` as group functors with API and Checks; `PGU_E`, `PGU_B°` are not defined (R01 above).
- R03 — repaired: lines 736–745 separate the complex part from the `L`-rational part, the latter only for a `G(𝔸_f)`-stable `L`-model; §0.3 (lines 898–902) restricts the `M_E^L` isomorphism accordingly; the `ℚ(√5)` Check is at lines 838–845.
- R04 — repaired: line 2855, "pp. 97–98".
- R05 — repaired: line 1551, "pp. 20–23".
- R06 — repaired: lines 2880–2883 list the auxiliary data by the sections that define them.

## Verified sound

| Statement | Instances tried | Roadmap side | Computed / source side | Result |
| --- | --- | --- | --- | --- |
| §1.2 groups over a field splitting `E` | `n = 4`; `U = 0`; scalar `t ∈ F^×` | `GL_n × 𝔾_m`, dimensions `17, 16, 16`; `GU_E(0) = 𝔾_m`; `t ∈ GSU` | `g = (g₁, ν·g₁^{-T})`, `det_E g = (det g₁, ν⁴/det g₁)`; `GSU = {det g₁ = ν²}`, connected since `det` is no square character; `ν = t²`, `det = t⁴` | agrees |
| §1.2 quaternionic groups | `m = 3`, `m = 1` | `dim U_B = 15`, `GU_B°` of dimension `16`, two components; `2` for `m = 1` | forms of `O₆`, `GO₆`: `3·5 = 15`, `16`; `GO₂°` has dimension `2 = dim Res_{E/F}𝔾_m`; IP23 lines 1274–1275 | agrees |
| §1.2 multiplier determined by `g` | `U ≠ 0`, any `R`; `U = 0` | unique `ν` | `(ν − ν′)c = 0` with a coordinate of `c` in `F^×` gives `ν = ν′`; for `U = 0` every `ν` occurs | agrees |
| §1.7 kernel of `g ↦ ⋀²g` on `GSU_E(U)` | geometric points; `c = (1, −1)`; `E` a field | `Res_{E/F}μ₂`, order four, `F`-points `±1` | `⋀²g₁ = 1` forces `g₁ = ±1`, then `ν² = 1`: four points `(±1, ±1)`; `c`: `ν = −1`, `det = 1 = ν²`, `⋀²c = c² = 1`; `c² = 1` in a field gives `±1` | agrees; IP23 prints `{±1}` |
| §1.7 `IsExteriorStar.map_similitude` on the new kernel element | `g = c ∈ E^×` scalar | factor `ν²/det g` | left `σ(c)²L`; right `(σ(c)²c²/c⁴)·c²L = σ(c)²L` | agrees |
| §2.3 block isogeny | geometric points | kernel `Res_{E/F}μ₂`, connected groups of dimension eight | `H = {(a, b, ν) : det a·det b = ν²} ⊂ GL₂ × GL₂ × 𝔾_m`, dimension `8`, connected; all four scalars lie in `H` | agrees |
| §1.8 against the new kernel | scalars of `GSU` | isomorphism of projective groups | kernels of `GSU → PGU_E` and of `GSU → PGU_B°` are both `{(c₁, c₂) : c₂ = ±c₁}`; dimensions `15`, `15` | agrees; R01 |
| §0.2 Check, `L = ℚ` | definite algebra of discriminant `23`, weight two, level `Γ₀(23)` | no `ℚ`-model; a line over `ℚ(√5)` | class number `3 = 1 + 2`; `a₂ = (−1 ± √5)/2`; `(x − a)^r` has coefficient `−ra ∉ ℚ` for `r ≥ 1`; trivial character, so the gap's hypothesis holds | agrees |
| §0.3 isotypic pullback | hypothesis on `L` | `M_E^L` isomorphism only with `L`-models corresponding under `f` | IP23 line 722 (p. 17) puts the same condition on `L` | agrees |
| §10.4 auxiliary data | each item | §§7.1, 7.7, 10.1, 10.2, 10.3 | each section exists and defines the item named; IP23 line 4513, p. 98 | agrees |

The rows of the previous review for statements the diff does not touch stand as in the review of `e9118f6`.

- Source locators checked against the text (changed passages and the seeded sample falling in them, §§0.2, 1.7, 10.3): 8 in IP23, all right: §2.2.3 pp. 16–17 (lines 707–725), §5.1 and Proposition 5.1 pp. 25–26 (1076–1091), Proposition 5.6 pp. 30–31 (1249–1276), Proposition 5.10 p. 32 (1326), §4.1 p. 23 (976–984), §12.2.5 p. 97 (4462), §12.2.11 p. 98 (4503), Proposition 12.3 p. 98 (4513).
- Library declarations opened at the pins: Mathlib `QuaternionAlgebra` (`Mathlib/Algebra/Quaternion.lean:65`); the others cited in §1.2 were opened in the previous review.
- Cross-roadmap citations resolved: HilbertModularVarietiesAndShimuraCurves §§R18.4.1, R18.4.24b, R18.4.25a, R18.4.25 (headings and statements read at its head; it is earlier in the merge order and is cited for scope, not as a supplier); ReductiveGroups Layer 3 on main ("subgroups, quotients, components", line 1537).
- Gate at 3528628: every check passed. Dependency check: `depcheck: 255 roadmaps, 2431 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings and nothing else; the diff changes one docstring line and no statement, so the four elaborated signatures are those of the previous review.
- Pull request text: the description states the group schemes, the kernel `Res_{E/F}μ₂`, the complex and `L`-rational isotypic parts and the Shimura-curve scope note; it agrees with the head. No file changed outside the folder.
- Remaining `μ₂` and "kernel" occurrences in Layers 1–5 were read against the new kernel: line 1923 (derived group) and line 1939 (torus map) concern other maps and are unaffected.

Overlap check: read MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, ShimuraData, ArithmeticLocallySymmetricSpaces, AdelicAlgebraicGroups (scopes as in the previous review; `overlaps.md` lists no dropped id, no conflicting head and no close roadmap by results) and HilbertModularVarietiesAndShimuraCurves. Shared objects: the coefficient cohomology of a Shimura curve, owner HilbertModularVarietiesAndShimuraCurves, now cited with the stated difference; the group schemes `GU_E`, `GU_B`, owner this roadmap (§1.2), the only other statement being in AutomorphicLFunctionsAndLocalFactorsPartII, later in the merge order.

Source independence: changed passages only; 5 passages compared with 1 source (IP23 lines 707–725, 1076–1088, 1249–1276, 1326–1336, 4513), none shared beyond the defining formula of `GU_E`; largest share IP23, 117 of 134 locators; the diff adds, removes and reorders no layer, so the contents comparison stands as in the previous review: independent.

## Not verifiable

- none

## Source issues

- **Error** in IP23 at Proposition 5.6, pp. 30–31, and Proposition 5.10, p. 32: the source says the exterior-square isogeny has kernel of order two; it should be the `E`-scalars of square one, of order four, with `F`-points `±1`; affects a stated result.

## For the human reviewers

- none
