# Review of CompactGroups (pull request #2480 at e511bc2)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroups/`
**Verdict:** needs changes

## R01 (P3) — Layer 4's Dependencies omit the file of the general Schur relation that §4.2 now states

**Location:** `README.md:498` ("Layers 0-3; Tau Ceti `Compact/SchurOrthogonality.lean`."), against `README.md:464-467` (§4.2: "More generally, … (`ContRepresentation.schur_orthogonality_distinct`)") and the §4.1-4.3 row at `README.md:135`.

**Claim:** §4.2 and the supplier table name `ContRepresentation.schur_orthogonality_distinct` in `Compact/Intertwiner/Basic.lean`, but the layer's Dependencies list only `Compact/SchurOrthogonality.lean`. Every other layer's Dependencies list every file of its table row.

**Witness:** Tau Ceti `2fd255d`, `TauCeti/RepresentationTheory/Compact/Intertwiner/Basic.lean:413`: `theorem schur_orthogonality_distinct`. `Compact/SchurOrthogonality.lean` does not declare it; it imports that file (its line 8).

**Repair:** Replace `README.md:498` by "Layers 0-3; Tau Ceti `Compact/SchurOrthogonality.lean` and `Compact/Intertwiner/Basic.lean`."

## R02 (P3) — Two Mathlib declarations are attributed to a file that does not declare them, and one has no file

**Location:** `README.md:106-109` ("`HilbertBasis.tsum_inner_mul_inner` (`Analysis/InnerProductSpace/l2Space.lean`); `IsHilbertSum`; `MeasureTheory.Lp`, `ContinuousMap.toLp` and `ContinuousMap.toLp_denseRange` (`MeasureTheory/Function/ContinuousMapDense.lean`)").

**Claim:** As written, `MeasureTheory.Lp` and `ContinuousMap.toLp` are located in `ContinuousMapDense.lean`, which declares only `ContinuousMap.toLp_denseRange` of the three. `IsHilbertSum` is the one name of the bullet without a file.

**Witness:** Mathlib `1b1ccf4`: `MeasureTheory/Function/LpSpace/Basic.lean:89` (`def Lp`); `MeasureTheory/Function/LpSpace/ContinuousFunctions.lean:144` (`ContinuousMap.toLp`); `MeasureTheory/Function/ContinuousMapDense.lean:364` (`toLp_denseRange`); `Analysis/InnerProductSpace/l2Space.lean:266` (`structure IsHilbertSum`).

**Repair:** Replace the bullet's text after "**Hilbert spaces.**" by: "`HilbertBasis`, `HilbertBasis.mkOfOrthogonalEqBot`, `HilbertBasis.tsum_inner_mul_inner` and `IsHilbertSum` (`Analysis/InnerProductSpace/l2Space.lean`); `MeasureTheory.Lp` (`MeasureTheory/Function/LpSpace/Basic.lean`); `ContinuousMap.toLp` (`MeasureTheory/Function/LpSpace/ContinuousFunctions.lean`); `ContinuousMap.toLp_denseRange` (`MeasureTheory/Function/ContinuousMapDense.lean`)."

## Previous findings (r13, at `5091844`)

- **R01 (§E.2/§E.3 Needs): repaired.** `README.md:770-772`: "for the character route also the character on the torus of §E.3 and Mathlib's Weierstrass theorem `polynomialFunctions_closure_eq_top`"; `:791`: "the representation on `Symⁿ(ℂ²)` defined in §E.2 (not the classification)". The Mathlib contract (`:116-118`) and the engine's Dependencies (`:824`) name the Weierstrass theorem.
- **R02 (general second relation): repaired**, except the Dependencies line (R01 above). `:464-468` states the general form with the hypotheses of the pinned declaration; `:135` names it with its file; `:655-656` cites "Kowalski, Thm 5.5.1(3), (5.23), p. 238, for unitary `π` and `ρ`" and "the general form of §4.2".
- **R03 (§5.2 locators): repaired.** `:535-536` "Kowalski, Cor. 5.4.8(2), p. 236, for a Hausdorff group"; `:540-541` "Kowalski, Cor. 5.4.8(1), p. 235, for a Hausdorff group, which for a topological group is the same as `T1`"; References `:882`.
- **R04 (Mathlib namespaces): repaired.** `:219-220` carry `MeasureTheory.`; all three elaborate at the pin.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §0.2 averaging (sample) | circle `zⁿ`; `S₃` indicators of `σ`, `σ⁻¹`; constant `c` | `1` at `n = 0`, else `z₀ⁿ·avg = avg` forces `0`; `1/6 = 1/6`; `c` | true; Mathlib `Group/Integral.lean:40, :91, :101` |
| §1.1 `IsUnitary` (sample) | `M = [[1,1],[0,−1]]`; circle `zⁿ`; trivial | `M² = 1`, `‖Me₂‖ = √2`; `|zⁿ| = 1`; identity | matches pinned def `⟪π g v, π g w⟫ = ⟪v, w⟫` |
| §1.2 `isUnitarizable` (sample, pin) | `M`; reversed average; discontinuous `φ : Circle → ℝ` | `MᴴM = [[1,1],[1,2]]`, `S = [[1,½],[½,3/2]]`, det `5/4`; reversed conjugate `[[3/2,2],[2,7/2]] ≠ [[3/2,−½],[−½,1]]`; `|e^φ|²s = s ⇒ φ = 0` | true; Lean: complete `V`, `Continuous π`; `knapp line 10093`, `kowalski line 11203` |
| §2.2 decomposition, semisimplicity (sample, 2 pins) | `V = 0`; trivial `ℂ²`; `M`; `[[1,φ],[0,1]]` | empty family; two lines; eigenlines `ℂe₁`, `ℂ(1,−2)`, pairing `1`; `(a,1) ↦ (a+φ,1)`, no complement | true; `knapp line 10101` |
| §2.3 Schur (sample) | circle `zᵐ, zⁿ`; `ZMod 3` on `ℝ²` | `T(zᵐ − zⁿ) = 0 ⇒ T = 0`; quarter-turn commutes, not scalar | true; Lean: `V` finite-dimensional, `IsAlgClosed` for scalars; `knapp line 10109, 10115` |
| §2.4 comparison (sample) | trivial `ℂ → ℂ²`; regular `ZMod 2`; `S₃` | both Hom spaces of dimension `2`; swap ↦ `diag(1,−1)`; character `2, 0, −1` | consistent with `intertwiningMapEquiv` (`V` finite-dimensional, `T2`) |
| §3.1 `matrixCoeff` (sample) | circle `zⁿ`; `χ`, `v = i`; `S₃` 3-cycle; translation laws | `z⁻ⁿ` (other model `zⁿ`); `−i·conj χ` against `i·χ`; `−1/2`; `⟪π(g₀g)v,w⟫ = ⟪π g v, π g₀⁻¹ w⟫` | consistent; QuantumGroups `:528` uses the same `π_ij` |
| §3.2 representative ring (sample) | circle; indiscrete group; `ℂ·z` | trigonometric polynomials; constants; `z² ∉ ℂ·z` | consistent |
| §4.1 `schur_orthogonality_self` (sample, pin) | `χ`, `v₁ = i`; `S₃` `π_11`; `ZMod 3` on `ℝ²`; Kowalski (5.24) transposed to Mathlib's inner product | `i = conj(conj i)`, other placement `−i`; `(1+¼+¼+1+¼+¼)/6 = ½`; `½` against `0`; `⟨v₁,v₂⟩⟨w₂,w₁⟩/d = conj⟪v₁,v₂⟫⟪w₁,w₂⟫/d` | true; `knapp line 10135` |
| §4.2 `schur_orthogonality`, general form (pin; R01) | `1` against `sgn`; `sgn` against `sgn ⊕ 1`; `1⊕1` against `sgn⊕sgn` | `0`; `1` (excluded: `ρ` reducible); `0` with all intertwiners zero | true; Lean general form: `V` any inner product space, `W` complete, `ρ` unitary |
| §5.1 convolution | circle; `k = 1`; `ZMod 3`, `k = δ_g`; right translation | `xᵐ∫y^(n−m) = δ_mn xⁿ`; `∫f`; `f(g⁻¹·)/3`; `T(R_h f)(x) = (Tf)(xh)` | consistent with pinned kernel `k(x y⁻¹)`, `IsMollifier` fields |
| §5.2 density, separation (sample, 2 pins) | indiscrete two-point group; `ZMod 2` | closure `⊤`, separation fails, not `T1`; `ℂ² = span{1, sgn}` | true; Lean density without separation axiom; `kowalski line 11946-11958` |
| §5.3 skeleton (sample) | circle minus one character; a repeated character; `e^{itφ}` | exhaustion fails; inequivalence fails; `t ≠ s ⇒ e^{itφ} ≠ e^{isφ}` (image of `φ` has arbitrarily small values) | matches pinned fields; irreducible excludes `dim = 0` |
| §5.4 `stdPeterWeylBasis` (sample, 2 pins) | `ZMod 2`; `S₃`; circle | `{1, sgn}`, `{(1±sgn)/√2}` excluded by `coe`; `1+1+4 = 6`; model `n` ↦ mode `−n` | true; pinned family `√dim · matrixCoeffLp (e_a) (e_b)`; `knapp line 10439` |
| §5.5 Hilbert sum, projection, `G × G` (sample, 3 pins) | circle model `n`; `S₃`; left-regular `E_τ`; `f ↦ f(g⁻¹ · h)` | kernel `z⁻ⁿ` keeps mode `−n`; dims `1,1,4`; `d∫conj χ(g)F(g⁻¹x)dg = d∫conj χ(xy⁻¹)F(y)dy`; pinned action `p.1⁻¹ * x * p.2` | true; pinned kernel `dim • star χ`; `knapp line 23495`, `kowalski line 12089-12093` |
| §6.2 orthonormality (sample, 2 pins) | `S₃`; trivial `ℂ²`; circle; (5.23) with no common constituent | `(4+0+2)/6 = 1`; `4`; `δ_mn`; `Σ n_π(ϱ₁)n_π(ϱ₂) = 0` | true; Lean: only `π` unitary; `knapp line 10215`, `kowalski line 12061-12071` |
| §6.3 `stdCharacterBasis` (2 pins) | `S₃`; indicator of a transposition | dimension `3`; moved to another indicator | true; `kowalski line 12037` |
| §6.4 `range_isotypicProjector` (pin) | swap, `σ = sgn`; `S₃` without `dim σ` | `(1−swap)/2`; `½·Id` (trace `⟨χ,χ⟩ = 1`, `d = 2`) | true; `knapp line 23495-23499` |
| §6.5 Frobenius-Schur (sample, 3 pins) | trivial; circle; `S₃`; `SU(2)` `Sym¹` | `1`; `∫z²ⁿ = 0`; `(2+6−2)/6 = 1`; `2cos 2θ = χ₂ − χ₀`, average `−1` | true; pinned def `∫χ(g·g)`; `kowalski line 12859-12870` |
| E.1-E.2 (3 pins) | `w = [[0,1],[−1,0]]`; `Sym²` at `diag(i,−i)` | `det w = 1`, swaps the diagonal; `−1+1−1 = −1` | true |
| E.3 Weyl character (pin) | `n = 1`, `θ = π/3`; `θ = 0, π`; `⟪χ₀,χ₂⟫` on the torus | `1 = 1`; `n+1`, `(−1)ⁿ(n+1)`; `1 ≠ 0` | true; Lean: `sin θ ≠ 0`, and `(d+1)cosᵈθ` otherwise |
| E.4 Weyl integration (2 pins) | `f = 1, χ₁, |χ₁|²` | `2π/2π = 1`; `(4/π)[sin³θ/3]₀^π = 0`; `(8/π)(π/8) = 1` | true; Knapp Thm 8.60, p. 550 |

- **Gate:** rerun at `e511bc2`: every scanner `0`, `OK`; the worker's gate, with `build=0`, is `OK`. No file outside the folder changes.
- **Dependency check:** `depcheck: 235 roadmaps, 2499 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- **Elaboration:** `lake env lean` on `Suggested.lean` at Mathlib `1b1ccf4`, Tau Ceti `2fd255d`: exit 0, no warning, 26 signatures printed; each compared with its README statement, no mismatch (continuity, both irreducibility hypotheses in §4.2, `T1Space`, `IsAlgClosed`, `sin θ ≠ 0` present).
- **Name probe:** 109 backticked library names of the README `#check`ed in one scratch file: all elaborate. 85 Tau Ceti names matched to the file the table gives: all declared there. 29 Mathlib names matched to their files: all but the two of R02.
- **Definitions read at the pin:** `IsUnitary`, `IrrepModel`, `IsIrrepSkeleton`, `gramOperator` (`Unitarizable.lean:122-129`), `convolutionCLM_apply_apply` (`Convolution.lean:214`), `IsMollifier`, `peterWeylFamily`, `peterWeylBlock`, `peterWeylBlockAveraging`, `biRegularLp`, `peterWeylMatrixRep`, `frobeniusSchurIndicator`, `Representation.IsIrreducible`.
- **Sources (19 locators read, all pages correct):** Knapp §IV.2, (4.5), Prop. 4.6, Cor. 4.7, Prop. 4.8, Cor. 4.9, Cor. 4.10(a), (b), p. 242, (4.11)-(4.15), Cor. 4.16, Thm 4.20, Cor. 4.21, Cor. 9.6 with pp. 561-562, Thm 8.60; Kowalski Thm 5.2.11, Cor. 5.4.8(1), (2), Thm 5.5.1(1), (3) with (5.23), Lemma 5.5.2 and its proof, Thm 5.6.3, Thm 6.2.3. Sampled §§0.2, 1.1, 2.4, 3.1, 3.2 and 5.3 carry no source locator; they were checked against their pinned declarations.
- **Cross-roadmap citations resolved:** on main (`ca7079b`) Completed/OrthogonalL2Bases §B2 (`:275`), OperatorIdeals Part C (`:530`), LieGroups Layer 6 (`:673`), LieHighestWeight Layer 5 (`:1438`), the 12 downstream links (AmenableGroups' anchor `#layer-0-normalized-haar-measure-and-averaging` still resolves); CompactGroupsPartII §2.1 at its open head (`:772`).
- **Padding probe:** not applicable: no sorried declaration; the 26 pins are proved Tau Ceti declarations. Pull-request text read against the head: 26 pins, 17 `TauCeti.*` imports, the general form of §4.2 and the Kowalski locators are stated; no sentence contradicted.

Overlap check: read CompactGroupsPartII, SatoTateGroups, SmoothRepresentationsOfLocalGroupsPartII (open), CharacterTheory, AutomorphicFormsOnReductiveGroups (main); Banach G-finite vectors and their density: CompactGroupsPartII §2.1 (`README.md:50-56`; AutomorphicFormsOnReductiveGroups `:53` still addresses the gap to Layer 5); `SU(2)` Weyl integration: this E.4, cited by SatoTateGroups; finite-group characters: CharacterTheory; unitarizability of smooth representations of locally profinite groups: SmoothRepresentationsOfLocalGroupsPartII, a different object.

Source independence: 27 passages compared with 2 sources (the 19 locators above, and the Conventions on coefficients, §3.2, the routes of §§2.2, 4.1, 5.2 and 6.3, and the Layer 4 and 5 comments of `Suggested.lean`); longest shared run 4 words (`README.md:407` against `knapp line 10320`); largest share `knapp`, 22 of 40 locators; contents compared with Knapp Ch. IV §§1-3, Ch. V, Ch. VIII, §IX.1: independent (Layers 0-4 all lie in §IV.2; the order is forced by the *Needs:* lines of §§1.2, 2.2, 4.1, 5.4, 6.3).

Research link: Layers 0, 5, 6 and the `SU(2)` engine supply Haar measure, character orthonormality, the class-function basis and the Weyl density that DeligneWeightsAndPurity (main) consumes for equidistribution after Deligne's Weil II (1980), and SatoTateGroups (open) for Sato-Tate moments; this rests on those roadmaps' READMEs, not on this README.

## Not verifiable

- Bump, *Lie Groups* (key `bump`, uncertified): Chs. 1, 2, 3, 4, 16, 17 at §0.1, §4.1, §5.1, §5.2, E.1, E.4 were not read.
- Bröcker-tom Dieck (key `brockerTomDieck`, uncertified): Ch. III at §5.2 and Ch. II at §6.5 were not read; both targets also carry Kowalski locators that were read.
- Ownership against open pull requests was checked through the roadmap service (index of 2026-11-18T02:14:50Z) and the three open roadmaps named in the overlap line, not against every open head.

## Source issues

- **Misprint** in kowalski at Thm 5.6.3, (5.26), p. 243: the source says the character of `ϱ_m` at `diag(e^{iθ}, e^{−iθ})` is `sin((m+1)θ)/sin θ` for every `θ` in `[0, π]`; it should be `θ ∈ (0, π)`, the endpoint values `m+1` and `(−1)^m(m+1)` being limits; affects nothing.

## For the human reviewers

- `RepresentationTheory/STATUS.md:43` lists CompactGroups as complete and `README.md:27-30` says Tau Ceti `2fd255d` proves every target; whether the folder moves to `Completed/` is open (the description leaves it to maintainers).
- `README.md:52` names CompactGroupsPartII §2.1, a roadmap not yet on main, as owner of the Banach G-finite theory (a deferral, not a supplier; the dependency check passes).
