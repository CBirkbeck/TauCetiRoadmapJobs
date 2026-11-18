# Review of CompactGroups (pull request #2480 at 5091844)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroups/`
**Verdict:** needs changes

## R01 (P3) — §E.2's character route uses §E.3's torus character, which its *Needs:* line omits

**Location:** `README.md:758-761` ("by characters (the characters of the `Symᵈ(ℂ²)` span a uniformly dense subspace of the continuous class functions, …). *Needs:* §2.3, §6.1-6.2, §E.1."); `README.md:780` (§E.3: "*Needs:* §E.1-E.2, §6.1.").

**Claim:** The density step needs the characters on the torus, and §E.3 is where they are computed. §E.3 in turn lists all of §E.2, although its statement needs only the definition of the symmetric powers. Once §E.2's real need is recorded, the two subsections need each other.

**Witness:** Tau Ceti `SU2/Exhaustion.lean:15` imports `SU2/Completeness.lean`. That file imports `SU2/SymmetricPower.lean` (which contains `character_symPower_torusExp`, §E.3) and Mathlib's `Topology/ContinuousMap/Weierstrass`. `SymmetricPower.lean` does not import `Exhaustion.lean`.

**Repair:**
- §E.2: "*Needs:* §2.3, §6.1-6.2, §E.1; for the character route also the torus character `Σ_{k=0}^{d} e^{i(d−2k)θ}` of §E.3 and Mathlib's `polynomialFunctions_closure_eq_top`."
- §E.3: "*Needs:* §E.1, the definition of the symmetric powers in §E.2 (not their classification), §6.1."

## R02 (P3) — The second character relation of §6.2 is more general than its locator and its proof route

**Location:** `README.md:645-648` ("`⟪χ_π, χ_ρ⟫ = 0` for unitary `π` when every continuous intertwiner `ρ → π` vanishes (…) (Knapp, Cor. 4.16, p. 243), by summing §4.1 and §4.2 over the diagonal").

**Claim:** Here `π` and `ρ` may be reducible. Knapp Cor. 4.16 treats only inequivalent irreducibles, and §4.2 assumes both `π` and `ρ` irreducible. So neither the locator nor the route's input covers the statement, and the README never names the pinned input that does.

**Witness:** Take `ZMod 2`, `π = 1 ⊕ 1` and `ρ = sgn ⊕ sgn`. Every intertwiner `ρ → π` is zero and `⟪2, 2·sgn⟫ = 0`, a case outside `knapp line 10215-10220` and §4.2. Tau Ceti proves it from `ContRepresentation.schur_orthogonality_distinct` (`Compact/Intertwiner/Basic.lean:413`), used at `Compact/Character/Basic.lean:195`.

**Repair:**
- End §4.2 with: "More generally, for a unitary `ρ` on a complete space and any continuous `π` such that every continuous intertwiner `π → ρ` vanishes, every coefficient of `π` is `L²`-orthogonal to every coefficient of `ρ` (`ContRepresentation.schur_orthogonality_distinct`); for inequivalent irreducibles §2.3 supplies the hypothesis."
- Add `ContRepresentation.schur_orthogonality_distinct` (`Compact/Intertwiner/Basic.lean`) to the §4.1-4.3 row of "From Tau Ceti".
- In §6.2, write "(Knapp, Cor. 4.16, p. 243, for inequivalent irreducibles; Kowalski, Thm 5.5.1(3), (5.23), p. 238, for unitary `π, ρ`), by summing §4.1 and the general form of §4.2 over the diagonal".

## R03 (P3) — Two pinned headlines of §5.2 have no theorem-level locator

**Location:** `README.md:527-533` ("uniformly dense in `C(G, ℂ)` (`TauCeti.representativeStarSubalgebra_dense`; Bump, Ch. 4; Bröcker-tom Dieck, Ch. III)" … "for `[T1Space G]`, that it separates points (`TauCeti.representativeStarSubalgebra_separatesPoints`)").

**Claim:** Uniform density cites only chapters of two uncertified texts, and point separation cites nothing. Both are pinned headlines (`Suggested.lean:80-81`), and a readable source states both.

**Witness:** Kowalski Cor. 5.4.8 (`kowalski line 11946-11958`), for Hausdorff groups (`kowalski line 433`). Part (1), p. 235: each `g ≠ 1` has an irreducible `ϱ` with `ϱ(g) ≠ 1`. Part (2), p. 236: matrix coefficients are dense in `C(G)` for the sup norm.

**Repair:**
- Write "(`TauCeti.representativeStarSubalgebra_dense`; Kowalski, Cor. 5.4.8(2), p. 236; Bump, Ch. 4; Bröcker-tom Dieck, Ch. III)".
- Write "separates points (`TauCeti.representativeStarSubalgebra_separatesPoints`; Kowalski, Cor. 5.4.8(1), p. 235, for a Hausdorff group)".
- Add "the Peter-Weyl density and separation criteria (Cor. 5.4.8, pp. 235-236)" to the Kowalski entry under References.

## R04 (P3) — Three Mathlib names in §0.2 lack their namespace

**Location:** `README.md:217-218` ("These are Mathlib's `integral_mul_left_eq_self`, `integral_mul_right_eq_self` and `integral_inv_eq_self` applied to `μ_G`").

**Claim:** At the pin these names resolve only with the `MeasureTheory.` prefix. The supplier contract (`:97-98`) gives them correctly.

**Witness:** In a scratch file at Mathlib `1b1ccf4`, `#check @integral_inv_eq_self` fails with "Unknown identifier", and so do the other two. `MeasureTheory.integral_inv_eq_self` elaborates (`MeasureTheory/Group/Integral.lean:40`, inside `namespace MeasureTheory` from `:20`).

**Repair:** Write "These are Mathlib's `MeasureTheory.integral_mul_left_eq_self`, `MeasureTheory.integral_mul_right_eq_self` and `MeasureTheory.integral_inv_eq_self` applied to `μ_G`".

## Previous findings (r12, at `9c8fbb0`)

- **R01 (character conjugate, §5.5 kernel): repaired.** `:630-632` now reads "`χ_π(g) = Σ_i ⟪e_i, π g e_i⟫` (…), so `conj χ_π = Σ_i π_ii`". `:589-591` gives the kernel `dim · Σ_i π_ii`, "equal to `conj χ`", with a Check at `:601-603`. `star_character` is in the §6.1 row (`:138`).
- **R02 (irreducible `ρ`): repaired.** `:457` now says "irreducible `ρ` on a complete space", with a Check at `:467-469`.
- **R03 (Banach G-finite scope): repaired** (`:50-56`).
- **R04 (locators): repaired.** See §1.2 `:263-264`, §4.2 `:459-460`, §5.5 `:586, :592-593, :596-597`, §6.3 `:661-662`, §6.4 `:685`, §6.5 `:702, :707, :710` and E.2 `:756-757, :763-764`.
- **R05 (names, file, notation): repaired** (`:96, :186, :192`; `:110`; `𝓡(G)` at `:406`). The same class of defect recurs at `:217-218` (R04 above).
- **R06 (API bullets, §5.4 Check): repaired.** All ten subsections have bullets, and the Check is at `:578-579`.
- **R07 (description): repaired.** The summary now names the 26 pins that replace the 56 declarations, and the References bullet reads "at every target it covers".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §0.1 `haarProb` | `ZMod 2`; circle arc; trivial group; `(ZMod 2)^ℝ` | `haarProb{0} = 1/2`; arc `α/2π`; Dirac at `1`; coordinate characters pairwise `√2` apart, uncountably many | consistent; Knapp §IV.2 `knapp line 10035-10092` |
| §0.2 averaging | circle `zⁿ`; `S₃` indicators of `σ`, `σ⁻¹`; constant `c` | `0` for `n ≠ 0`, `1` for `n = 0`; `1/6 = 1/6`; `c` | true; names R04 |
| §1.1 `IsUnitary` | `M = [[1,1],[0,−1]]`; circle character | `‖Me₂‖ = √2 ≠ 1`; `|zⁿ| = 1`; Tau Ceti def `⟪π g v, π g w⟫ = ⟪v, w⟫` | consistent |
| §1.2 `isUnitarizable` (pin) | `M`; reversed average; discontinuous `φ : Circle → ℝ` | `S = [[1,½],[½,3/2]]`, `MᴴSM = S`, det `5/4`; reversed gives `[[3/2,2],[2,7/2]]`; `|e^φ|²s = s` forces `φ = 0` | true; Lean: complete `V`, `Continuous π`; Knapp p. 240, Kowalski p. 221 |
| §2.1 complements | swap, `U = ℂ(e₁+e₂)`; `M`, `U = ℂe₁` | `Uᗮ = ℂ(e₁−e₂)`, swap gives `−(e₁−e₂)`; `Me₂ = (1,−1) ∉ ℂe₂` | true; Knapp (4.5) p. 239 |
| §2.2 decomposition, semisimplicity (pins) | `V = 0`; trivial `ℂ²`; `M`; `[[1,φ],[0,1]]` | empty family; two orthogonal lines; lines `ℂe₁`, `ℂ(1,−2)` with `⟪e₁,(1,−2)⟫ = 1`; `(a,1) ↦ (a+φ,1)` | true; dimensions sum to `dim V`; Knapp Cor. 4.7 p. 240 |
| §2.4 comparison | trivial `ℂ → ℂ²`; regular `ZMod 2`; `S₃` via `FDRep.ofShrink` | both Hom spaces of dimension `2`; swap sends `(a,b)` to `(a,−b)`; character `2, 0, −1` | consistent; elementary |
| §3.1 `matrixCoeff` | circle `zⁿ`; one-dimensional `χ`, `v = i`; `S₃` 3-cycle | `z⁻ⁿ` (other model `zⁿ`); `−i·conj χ` against `i·χ`; `cos(2π/3) = −1/2` | consistent with Tau Ceti `⟪π g v, w⟫` |
| §3.2 representative ring | circle; indiscrete group; `ℂ·z` | trigonometric polynomials; constants; `z² ∉ ℂ·z` | consistent; carrier is `representativeSubmodule` |
| §4.1 `schur_orthogonality_self` (pin) | `χ`, `v₁ = i`; `S₃` `π_11`; `ZMod 3` on `ℝ²` | `∫ iχ·conj χ = i = conj(conj i)`, other placement `−i`; `3/6 = 1/2 = d⁻¹`; `1/2` against `0` | true; Knapp Cor. 4.10(b) p. 241 |
| §4.2 `schur_orthogonality` (pin) | `ZMod 2`: `1` against `sgn`; `sgn` against `sgn ⊕ 1` | `(1−1)/2 = 0`; `⟪sgn, sgn⟫ = 1`, excluded by irreducible `ρ` | true; Lean has both irreducibility hypotheses |
| §5.1 convolution | circle `zᵐ * zⁿ`; `k = 1`; `ZMod 3`, `k = δ_g` | `xᵐ∫y^(n−m) = δ_mn xⁿ`; constant `∫f`; `f(g⁻¹·)/3`, adjoint translates by `g⁻¹` | consistent; Tau Ceti kernel `k(x y⁻¹)` (`Convolution.lean:215`) |
| §5.2 density, separation (pins) | indiscrete two-point group; `ZMod 2` | closure `⊤` but separation fails, not `T1`; `ℂ² = span{1, sgn}` | true; Lean density without `T2`; locators R03 |
| §5.4 `stdPeterWeylBasis` (pin) | `ZMod 2`; `S₃`; circle | `{1, sgn}`, while `{(1±sgn)/√2}` is excluded by `coe`; `1+1+4 = 6`; model `n` gives mode `−n` | true; Knapp Cor. 4.21 p. 247 |
| §5.5 Hilbert sum, block projection (pins) | circle model `n`; `S₃`; trivial model | kernel `z⁻ⁿ` keeps mode `−n`, block `ℂ·z⁻ⁿ`; `zⁿ` keeps `n`; dims `1, 1, 4`; kernel `1` | true; Lean kernel `dim • star χ`; Knapp Cor. 9.6 p. 560, pp. 561-562 |
| §5.5 `G × G` (pin) | `x ↦ tr(T π x⁻¹)` under `f ↦ f(g⁻¹ · h)` | `tr(T π(h⁻¹x⁻¹g)) = tr((π g T π h⁻¹) π x⁻¹)` | true; Tau Ceti `toEuclideanCLM_peterWeylMatrixRep` (`Isometry.lean:152`) |
| §6.1 character | circle; `S₃`; trivial `ℂ²` | `χ = zⁿ`, `Σπ_ii = z⁻ⁿ = conj χ`; `2, 0, −1`; `2` | true; `star_character`; Knapp (4.11) is linear in its first slot |
| §6.2 orthonormality (pins) | `S₃`; trivial `ℂ²`; `ZMod 2`, `π = 1⊕1`, `ρ = sgn⊕sgn` | `(4+0+2)/6 = 1`; `4`; `⟪2, 2sgn⟫ = 0` with `π, ρ` reducible | true; locator and route R02 |
| §6.3 `stdCharacterBasis` (pin) | `S₃`; indicator of a transposition; circle | dimension `3` = number of classes; conjugation moves it to another indicator; same functions as Peter-Weyl via `n ↦ −n` | true; Kowalski Thm 5.5.1(1) p. 237 |
| §6.4 `range_isotypicProjector` (pin) | swap on `ℂ²` with `σ = sgn`; trivial `σ`; `S₃` without `dim σ` | `(1−swap)/2` onto `ℂ(1,−1)`; `∫ρ`; `½·Id` | true; kernel `dim • star χ`; Knapp Cor. 9.6 p. 560 |
| §6.5 Frobenius-Schur (3 pins) | trivial; circle `zⁿ`; `S₃` 2-dim; `SU(2)` `Sym¹` | `1`; `∫z²ⁿ = 0`; `(2+6−2)/6 = 1`; average of `χ₂ − χ₀` is `−1` | true; Kowalski Thm 6.2.3 p. 253; Lean forms are bilinear |
| E.1 torus conjugacy (pin) | `w = [[0,1],[−1,0]]`; `θ = π/2` | `det w = 1`, `w diag(a,b) w⁻¹ = diag(b,a)`; `diag(i,−i)` of order `4` | true; Knapp Thm 4.36 p. 255 |
| E.2 classification (2 pins) | `d = 0, 1`; `Sym²` at `diag(i,−i)` | trivial, defining; eigenvalues `−1, 1, −1`, sum `−1` = weight sum | true; character route needs §E.3 (R01); Kowalski Thm 5.6.3 p. 243 |
| E.3 Weyl character (pin) | `n = 1`, `θ = π/3`; `θ = 0, π` | `sin(2π/3)/sin(π/3) = 1 = 2cos(π/3)`; `n+1`, `(−1)ⁿ(n+1) = (n+1)cosⁿθ` | true; Lean requires `sin θ ≠ 0` |
| E.4 Weyl integration, orthonormality (2 pins) | `f = 1, χ₁, |χ₁|²`; `(m,n) = (0,0), (0,1)` | `1`; `(4/π)[sin³θ/3]₀^π = 0`; `(8/π)(π/8) = 1`; `(2/π)∫sin² = 1`; `(2/π)∫sinθ sin2θ = 0` | true; Knapp Thm 8.60 p. 550, `|W| = 2` |

- **Gate:** rerun at this head, every scanner reports `0`, `OK`; the worker's gate, including `build`, is `OK`.
- **Dependency check:** `depcheck: 235 roadmaps, 2499 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line, and no change outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` at Mathlib `1b1ccf4` and Tau Ceti `2fd255d` exits 0 with no warning and prints 26 signatures. Each was compared with its README statement, with no mismatch: continuity, irreducibility of both representations in §4.2, `T1Space` and `IsAlgClosed` are present where the README requires them.
- **Signature probe:** 119 backticked README names were `#check`ed at the pins. All elaborate except the three in R04. `#print` of `IrrepModel`, `IsIrrepSkeleton` and `IsUnitary` matches §§1.1 and 5.3.
- **Definitions read at the pin:** `convolutionCLM_apply_apply`, `peterWeylBlockAveraging`, `isotypicKernel`, `frobeniusSchurIndicator`, `peterWeylBlock`, `biRegularLp`, `toEuclideanCLM_peterWeylMatrixRep`, `IsRepresentative`, `IsMollifier`, `peterWeylFamily`, `symPowerModel`, `SU2`, `torusExp`.
- **Sources (30 locators read):**
  - Knapp, 23: §IV.2, (4.5), Prop. 4.6, Cor. 4.7, Prop. 4.8, Cor. 4.9, Cor. 4.10(a) and (b), p. 242, (4.11)-(4.15), Cor. 4.16, Thm 4.20 and its proof, Cor. 4.21, Cor. 9.6, pp. 561-562, Example 4, Thm 1.66, p. 314, Problem IV.1, Thm 4.36, Thm 5.113, Thm 8.60.
  - Kowalski, 7: Thm 5.2.11, Thm 5.5.1(1), the proof of Lemma 5.5.2, Thm 5.6.3, and Thm 6.2.3 with its parts (1) and (2).

  Every page is correct. The only scope gap is R02. Knapp and Kowalski (`kowalski line 433`) assume Hausdorff groups; the README's non-Hausdorff generality rests on the pinned proofs.
- **Cross-roadmap citations resolved on main:** Completed/OrthogonalL2Bases §B2; OperatorIdeals Part C (OI-C14); LieGroups Layer 6 (its `:673`); LieHighestWeight Layer 5 (its `:1438`); and the 12 downstream-consumer links. CompactGroupsPartII §2.1 resolves at its open head (its `:771`). The citations of this roadmap elsewhere (the "What is not consumable…" paragraph, `su2Irrep`, the Layer 0 anchor) are mapped at `:351-354` and `:150-156`.
- **Padding probe:** not applicable. There is no sorried declaration, and the 26 pins are proved Tau Ceti declarations.

Overlap check: read CompactGroupsPartII, SatoTateGroups and SmoothRepresentationsOfLocalGroupsPartII (open), and CharacterTheory and AutomorphicFormsOnReductiveGroups (main). Shared objects and their owners:
- Banach G-finite vectors and their density: CompactGroupsPartII §2.1 (`:50-56`). AutomorphicFormsOnReductiveGroups still records them against Layer 5 as a gap.
- The continuous-kernel Hilbert-Schmidt step: this §5.1 for Haar convolution, and CompactGroupsPartII §0.2 for general compact spaces, a variant that roadmap marks as such.
- `SU(2)` Weyl integration: this E.4. SatoTateGroups cites it beside its own `USp(2g)` formula.
- Finite-group characters: CharacterTheory.
- Unitarizability of smooth representations of locally profinite groups: SmoothRepresentationsOfLocalGroupsPartII. This is a different object.

Source independence: 38 passages compared with 2 sources: the 30 verified Knapp and Kowalski locators, plus the Conventions on coefficients, §3.2, the routes of §§4.1 and 6.3, the two compactness routes of §5.1, the E.2 routes and the Layer 1, 5 and 6 comments of `Suggested.lean`. The longest shared run is 4 words ("of all matrix coefficients", `README.md:404-405` against `knapp line 10320`). The largest share of locators is `knapp`, 22 of 37. Contents compared with Knapp §I.9, Ch. IV §§1-3, Ch. V, Ch. VIII and §IX.1: independent. Layers 0-4 all fall within §IV.2, and characters come after Peter-Weyl, an order forced by the *Needs:* lines of §§1.2, 2.2, 4.1, 5.4 and 6.3.

Research link: Layers 0, 5 and 6 and the `SU(2)` engine supply the Haar measure, character orthogonality, class-function density and the density `(2/π) sin²θ`. DeligneWeightsAndPurity (main, its `README.md:533-539`) uses them for finite-field equidistribution on Deligne's Weil II (1980) route, and SatoTateGroups (open) uses them for Sato-Tate moments. This rests on those READMEs.

## Not verifiable

- Bump, *Lie Groups* (key `bump`, uncertified): Chs. 1, 2, 3, 4, 16 and 17, cited at §0.1, §4.1, §5.1, §5.2, E.1 and E.4, were not read.
- Bröcker-tom Dieck (key `brockerTomDieck`, uncertified): Ch. III at §5.2 and Ch. II at §6.5 were not read. §6.5 is also supported by Kowalski Thm 6.2.3.
- Ownership against open pull requests was checked through the roadmap service's grep of the indexed heads (index of 2026-11-18T01:17:03Z) and the three open checkouts named above.

## Source issues

- **Misprint** in kowalski at Thm 5.6.3, (5.26), p. 243: the source gives the character of `ϱ_m` as `sin((m+1)θ)/sin θ` for every `θ` in `[0, π]`; it should say `θ ∈ (0, π)`, with the endpoint values `m+1` and `(−1)^m(m+1)` obtained as limits; affects nothing.

## For the human reviewers

- `RepresentationTheory/STATUS.md:43` lists CompactGroups as complete, and `README.md:27-30` states that Tau Ceti `2fd255d` proves every target. Whether the folder moves to `Completed/` is open; the description leaves it to maintainers.
