# Review of SchubertGeometry (pull request #1224 at a9b73a3)

**Verdict:** needs changes

## R01 (P3) — The description still reverses the holomorphic Picard dependency

**Location:** PR description, `scratch/pull-request.md:40`: “S3P constructs root-curve degrees and ordinary holomorphic Picard classes before Borel–Weil”; prose dependency checkbox at line 42.
**Claim:** S3P and its two-way Q2A dependency describe targets and a supplier edge absent from this head, contradicting the opening summary.
**Witness:** `TauCetiRoadmap/SchubertGeometry/README.md:44` excludes holomorphic Picard constructions; line 2063 makes GeometricQuantization a consumer. GeometricQuantization #1186, `TauCetiRoadmap/GeometricQuantization/README.md:698`, consumes SchubertGeometry S9.1/S9.7 for §3.3.
**Repair:** Replace the S3P paragraph and its prose dependency checkbox with: “S3.1 constructs algebraic equivariant lines and the scheme Picard forgetful map; S9.8 analytifies those lines. GeometricQuantization §§3.3–3.4 owns the ordinary holomorphic Picard and compact forgetful-map calculations and consumes S9.1/S9.7.”

## R02 (P3) — The description does not disclose the extent of the rewrite

**Location:** PR description, `scratch/pull-request.md:24`: “This amendment is README-only”; “all earlier programme content are preserved”; `roadmap-summary` block, lines 15–19.
**Claim:** The summary mentions replacement path targets but omits the scale of the rewrite and the removed declarations; the unqualified preservation claim contradicts the head.
**Witness:** The base-to-head diff changes README by +2108/−89 lines and Suggested.lean by +129/−90; eight named declarations disappear and five appear. README S9.2–S9.4 no longer exist.
**Repair:** Replace the present-tense preservation claims and extend `roadmap-summary`: “This revises the roadmap on main, expanding and restructuring all nine layers (+2237/−179 lines across README.md and Suggested.lean). S9.2–S9.4's Lefschetz comparisons move to Part II. Suggested.lean removes pivotCount, HasExactPivotRanks, HasSchubertRankBounds, exactPivotRanks_imply_bounds, KernelIncidence, kernelIncidence_refl, kernelIncidence_trans and pluckerCoordinate, replacing them with five LS-path headline statements.” Explicitly label any retained README-only validation as historical.

## R03 (P3) — The supplier changes are left unstated

**Location:** PR description, `scratch/pull-request.md:17`, `roadmap-summary`: “Supplier contracts separate existing algebra from geometric targets”.
**Claim:** This leaves out the removal of three foundational suppliers and the transfer of their required constructions into this roadmap.
**Witness:** Base README lines 19–26 consumes AlgebraicModuliForArithmeticGeometry, ShimuraData and ComplexComparisonPartII. Head `TauCetiRoadmap/SchubertGeometry/README.md:32` assigns relative quotients, incidence and integral comparisons locally; line 36 assigns coherent analytification and GAGA locally.
**Repair:** Add: “AlgebraicModuliForArithmeticGeometry, ShimuraData and ComplexComparisonPartII cease to be suppliers: S1.0–S1.1, S5.6 and S9.0 now construct the required relative quotient/incidence, integral Schubert and coherent analytic comparisons. Sheaf operations formerly cited through AlgebraicVectorBundles are consumed directly from pinned Tau Ceti.”

## R04 (P3) — The A₂ example points to the wrong section

**Location:** PR description, `scratch/pull-request.md:32`: “S3.1 now makes Knutson’s worked A₂ Demazure example explicit.”
**Claim:** The stated location leads to associated lines, not the character calculation.
**Witness:** `TauCetiRoadmap/SchubertGeometry/README.md:1070` names the calculation S3.6; lines 1089–1107 give the stated dimensions, multiplicities and second word.
**Repair:** Replace the sentence with: “S3.6 gives the worked A₂ signed-string character calculation for highest weight 2ω₁+5ω₂.”

## R05 (P3) — The claimed fifteen-dimensional example is absent

**Location:** PR description, `scratch/pull-request.md:46`: “the explicit fifteen-dimensional contraction kernel in Sym²(K³)⊗(K³)∨ supplies the negative example”.
**Claim:** This describes a retained construction that neither reviewed file contains.
**Witness:** `TauCetiRoadmap/SchubertGeometry/README.md:1250` gives only the adjoint comparison here. Searches of both files for the contraction-kernel construction find none; Suggested.lean lines 68–123 contains five LS-path theorems.
**Repair:** Replace that paragraph with: “S4.4 retains the adjoint SL₃ comparison: simple generators act on single basis vectors, while all-root actions force three Cartan lines. The fifteen-dimensional contraction-kernel example and SimpleGeneratorTargets.lean are not included at this head.”

## R06 (P3) — The claimed thirteen-orbit comparison is absent

**Location:** PR description, `scratch/pull-request.md:56`: “the acceptance interfaces consume LieGroups Layer8's existing smaller block-Borel calculation”; “SchubertGeometry supplies the comparison with its incidence carrier and Borel conventions.”
**Claim:** No target or acceptance signature at this head supplies that smaller block-Borel comparison.
**Witness:** `TauCetiRoadmap/SchubertGeometry/README.md:544` consumes compact flags from LieGroups. Its explicit orbit calculation at line 1940 concerns a fixed-plane parabolic on a Grassmannian. Neither reviewed file contains the claimed thirteen-orbit comparison.
**Repair:** Replace the paragraph with: “LieGroups Layer 8 supplies compact full and partial flags. The worked orbit calculation here classifies fixed-plane stabilizer orbits on a Grassmannian by intersection dimension; this head includes no thirteen-orbit smaller block-Borel comparison.” Label the following validation paragraph as historical or remove it.

## Previous findings

The preceding report raised no findings. Its carried repair entries remain repaired:

- R01 — repaired: README lines 113–150 and 685–694 retain the native Picard, sheaf-operation and both tensor-pullback contracts.
- R02 — repaired: README line 880 still distinguishes the initial-image chain from the source proof's incorrect identification with the ordinary word product.

## Verified sound

| Statement or claim | Instance | Computed left / claimed value | Computed right / head value | Result; change |
|---|---|---|---|---|
| S3.1 ordinary versus equivariant lines; R01 | PGL₂/B = ℙ¹ | Root character α has degree 2 | Pic(ℙ¹)=ℤ; equivariant image 2ℤ | Mathematical distinction holds; correct description's owner |
| Rewrite extent; R02 | Base versus head | 8 old named Lean declarations | 0 retained; 5 new; +2237/−179 lines | Disclose replacement and extent |
| Supplier allocation; R03 | Three named base suppliers | Moduli: flags; ShimuraData: integral quotients/cells; ComplexComparisonPartII: GAGA | Head owners S1.0–1, S5.6, S9.0; 0 contracts from those three | Disclose ownership transfer |
| S3.6 signed strings; R04 | SL₃, λ=2ω₁+5ω₂ | 121: dimensions 1,6,33,81; 212: 1,3,21,81 | Interlacing count 81; 46 weights; multiplicity histogram 21,15,10; zero weight 3 | Coefficients agree; fix section number |
| Adjoint comparison; R05 | Characteristic zero, matrix units | [E₁₂,E₂₁]=H₁; [E₁₃,E₃₁]=H₁+H₂ | Cartan coordinates (1,0), (1,1); head's example has dimension 8 | Retained calculation holds; remove absent-example claim |
| Claimed orbit interface; R06 | The two reviewed files | Description claims 1 thirteen-orbit comparison | 0 such targets; fixed-plane example n=3, k₀=1 has d=0,1 and 2 orbits | Correct stated scope; actions are different |
| Lowering stability, Suggested.lean:68 | SL₂, shape ω, straight path | f(tω)=−tω, endpoint −ω | Opposite LS encoding realizes −tω | Equal; no Lean change |
| Raising stability, Suggested.lean:79 | SL₂, shape ω, opposite path | e(−tω)=tω, endpoint ω | Straight LS encoding realizes tω | Equal; no Lean change |
| Straight-path generation, Suggested.lean:91 | SL₂, shape ω | Zero lowerings: tω; one: −tω | B(ω) consists of these 2 encodings | Equal; no Lean change |
| Character identity, Suggested.lean:107 | SL₂, λ=3ω; z=e^ω | (1−z⁻²)(z³+z+z⁻¹+z⁻³)=z³−z⁻⁵ | Dot alternant z³−z⁻⁵ | Equal; no Lean change |
| Decomposition, Suggested.lean:123 | SL₂, λ=μ=2ω | (z²+1+z⁻²)²=z⁴+2z²+3+2z⁻²+z⁻⁴ | B(4ω)+B(2ω)+B(0) has that character; heights 0,−1,−2≥−2 | Equal; no Lean change |
| S2.3 source-proof qualification | Word ii in rank one | Ordinary product e, length 0 | Images: point, ℙ¹, ℙ¹; δ(ii)=s, length 1 | Qualification retained |

Other untouched-statement rows stand as in the previous review of a9b73a3.

- 0 changed folder lines; 0 of the 15 seeded source targets requires a changed-passage recheck; 1 source-proof passage reopened, KnutsonBottSamelson lines 141–148.
- 5 fresh `#check @name` signatures compared with README S4.2–S4.4: 0 changed types or lost binders; prior padding probes stand.
- 2 description-related roadmap interfaces resolved: GeometricQuantization §§3.3–3.4 at #1186 and LieGroups Layer 8 on main; 0 new library declarations required opening.
- Gate: all scanner checks 0, `OK`; worker gate also reports `build=0`; targeted `lake build TauCetiRoadmap.SchubertGeometry.Suggested` succeeds.
- Direct elaboration: exit 0, exactly 5 `sorry` warnings; the targeted build additionally emits a Mathlib module-system advisory for the unchanged import.
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; 0 UPWARD, CYCLE or moved lines.
- 0 changes outside this folder; clean tracked worktree; overlap data reports 0 conflicting heads or dropped cited ids.

Overlap check: read SpringerResolutionAndCharacteristicCycles, RootSystems, ReductiveGroups, ShimuraData, HeckeStacksAndLocalShtukasPartII, KacMoody and TensorProductCombinatorics scopes; finite path theory is assigned to SchubertGeometry, type-A comparisons to TensorProductCombinatorics, the symmetrizable extension to KacMoody, and root/group foundations to pins and RootSystems/ReductiveGroups; Springer and affine-shtuka geometry are separate applications. ShimuraData's relative flag scope also overlaps the unchanged S1/S5 ownership boundary; that untouched boundary is not reopened in this incremental review.

Source independence: changed passages only; 0 roadmap passages changed, so 0 new wording/reuse comparisons and no layer-arrangement comparison were required. Source shares and the unchanged arrangement were not re-audited.

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 remain settled as uncertified, cited by locator only; no changed citation requires reopening them.

## Source issues

- **Error** in KnutsonBottSamelson at §4, proof of the related subword result, p. 4 (lines 141–148): the source says the image-growth letters have the original word's product; it should be the Demazure product, which for ii is s rather than e; affects the proof.

## For the human reviewers

- none
