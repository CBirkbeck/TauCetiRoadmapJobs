# Review of InstantonFloerTheory (pull request #1083 at 1fb9d4d)

**Verdict:** needs changes

Incremental re-review of the 13 lines changed since f0af253 (the GaugeQuiltFieldTheory GQ1 supplier row, the rewritten IF9 surface-moduli paragraphs, the IF10c boundary sentence, the order and acceptance paragraphs). The mathematics of the changed passages is correct and every fact IF9 now takes from GQ1 is stated at GQ1's head with the same normalization; the supply direction is sound. No P1 or P2 finding. The verdict is needs changes because the worker's gate fails at this head on the build (R01, new since the merge of main moved the pins) and because the four notes of the previous review are unrepaired, so they are written again (R02–R05).

## R01 (P3) — the gate fails: `Suggested.lean` is not a module-system file at the new pins

Location: `TauCetiRoadmap/InstantonFloerTheory/Suggested.lean` line 1, `import Mathlib`.

Claim: the worker's gate at 1fb9d4d reports `build=2 FAIL`, twice the warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". The merge of main (commit b977f85c) moved the pins from Mathlib 6b7abb3c / Tau Ceti a91d3aaf, where the previous review found the gate passing, to Mathlib 1b1ccf4b / Tau Ceti 2fd255d9 (toolchain v4.36.0-rc2), where every Mathlib file is a module and the plain import draws the warning. The file itself elaborates: `lake env lean` on it exits 0 with no output.

Witness: `scratch/gate.md` of this review, the two `build` lines; the pull request's description still names "Lean 4.35.0-rc3, Mathlib 6b7abb3c and Tau Ceti a91d3aaf", the pins before the merge.

Repair (tested): make the file a module file, keeping everything else: first line `module`, blank line, `public import Mathlib`, then the docstring and the empty namespace. A copy in this form, with the same docstring and namespace, elaborated with `lake env lean` from the pull-request worktree and exited 0 with no output; the gate's import rule accepts `public import Mathlib`. The precedent on main is `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean`.

## R02 (P3) — README shape: no Checks, no `*Needs:*` lines, six locators for about a hundred targets

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md`, whole file (123 nonblank lines; `**Checks.**` count 0, `*Needs:*` count 0; locators at a claim: Scaduto "Theorem1.3" and DFL "Definitions7.4–7.6/Theorem7.7" only, the rest collected in the reference list).

Claim: the house shape asks that every definition carry at least three discriminating Checks, every theorem its locator at the claim, every subsection its `*Needs:*` line and every layer its `### Examples` and `### Dependencies`. The previous review raised this (its R01); the head leaves it as it was. The new IF9 paragraphs show what the repair looks like: the sentence "Check: a sphere class of Chern number2, hence Maslov index4, has Ω-area 1/2" is a discriminating Check, but it is inline prose, and IF9 still names no `*Needs:*` items although it now consumes GQ1, R5 and FukayaTheory.

Witness: compare `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` at its head, lines 64–68 and 74–78 (`**Checks.**` lists with computed values) and line 84 (a `*Needs:*` line naming R5, B4–B5, the Mathlib carriers and the source theorems), written by the same author for the supplier this head adopts.

Repair: as in the previous review: a `*Needs:*` line per section (IF9: GaugeQuiltFieldTheory GQ1, HamiltonianReduction R5, SmoothBundlesConnections B4–B5, DifferentialGeometry's Hodge-star layer, HeegaardFloer F0; the DFL locators), a `**Checks.**` list per definition, the locator in parentheses at each claim, and `### Examples` / `### Dependencies` per section. The line map of the previous review's R01 gives theorem and page numbers for the facts already verified.

## R03 (P3) — Frøyshov's maps are renamed and the README attributes the symbol `V` to the source

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md` line 109, "In Frøyshov's cohomological complex let `a:C^4→Z`, `a':Z→C^1`, and `V:C^i→C^(i+4)` be its integral point-count map", and the same paragraph's "Neither the symbol `V` there nor the Laurent `U` in IF10 is identified by name".

Claim: unchanged since the previous review (its R02). The source writes δ : CF⁴ → ℤ, δ′ ∈ CF¹ and v : CF* → CF*⁺⁴ with Theorem 4(ii) `dv − vd + 2δ⊗δ′ = 0`; there is no `V` in it.

Witness: froyshov9903 (arXiv:math/9903083) lines 148–153 and 277–281, as located by the previous review.

Repair: write "Frøyshov's δ, δ′ and v (Theorem 4(ii), §3.1, p. 7)" and keep the README's own letters only for the dual complex `ν_ℤ = v*`, `δ = (δ′)*`, `δ′ = −δ*`. The sign adapter itself is correct (previous table row 12).

## R04 (P3) — supplier rows without a section or declaration

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md` line 14, the row "DifferentialGeometry, AlgebraicTopology, CharacteristicClasses, GeometricTopology"; line 21, the row "FourManifolds, SpinGeometry" (SpinGeometry and SeibergWittenTheory); line 23, "Orbifolds/LieGroupoidsPoisson".

Claim: unchanged since the previous review (its R03). The diff touched the two rows next to them: the R5 row now says it reaches IF9 through GQ1, and the new GQ1 row names its section and exactly what is consumed, which is the shape the three rows above still lack. HeegaardFloer F0/F1, HamiltonianReduction R5, GQ1, FourManifolds F5, ComplexKahlerGeometry K5a, PseudodifferentialOperators P1/P5–P7 and IndexTheory I1–I2/I7 all resolve.

Witness: `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` at its head, line 21, "From TauCetiRoadmap.DifferentialGeometry and TauCetiRoadmap.AlgebraicTopology", and line 94, "DifferentialGeometry Layers 5, 6 and 8; AlgebraicTopology Stage 2 item 6, Stage 4 and Stage 6", name the layers consumed.

Repair: name the section of each (DifferentialGeometry's Stokes/Hodge layer, AlgebraicTopology's relative cup/slant and twisted duality section, CharacteristicClasses' Pontryagin/Stiefel–Whitney section, GeometricTopology's collar/surgery section, SpinGeometry's Clifford/de Rham symbol comparison), and drop SeibergWittenTheory and Orbifolds from the table when nothing is consumed from them (both mentions say what is not imported).

## R05 (P3) — two references carry no locator and are not in an open repository

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md` line 228, "Donaldson, Floer Homology Groups in Yang–Mills Theory; Donaldson–Kronheimer, The Geometry of Four-Manifolds: analytic and orientation constructions to be realized".

Claim: unchanged since the previous review (its R04). A paywalled text may be cited by its locator alone; these two are cited with none, so the IF3–IF5 analytic and orientation conventions have no page anywhere in the README.

Witness: the IF4 orientation convention `det(D) = or(ℝ_translation) ⊗ det(T M̂)` and the IF3 index formula `8κ − 3(1 − b₁ + b⁺)` carry no locator; they were checked by computation (previous table rows 7 and 9), not against a page.

Repair: give the chapter and section (Donaldson, Floer Homology Groups, §§3.4–3.6 and 5.4; Donaldson–Kronheimer §§4.2–4.3 and 5.4), and cite the two DFL papers at the versions read (2109.07032v1, 2109.07038v1).

## Previous findings

- R01 — not repaired: the README still has no `**Checks.**` list, no `*Needs:*` line and no `### Examples` / `### Dependencies`; the diff adds inline prose only ("Check: a sphere class of Chern number2 … has Ω-area 1/2"). Written again as R02.
- R02 — not repaired: line 109 still reads "let `a:C^4→Z`, `a':Z→C^1`, and `V:C^i→C^(i+4)` be its integral point-count map" and "Neither the symbol `V` there". Written again as R03.
- R03 — not repaired: lines 14, 21 and 23 are unchanged; the diff touched only the R5 row and added the GQ1 row, both of which name their sections. Written again as R04.
- R04 — not repaired: line 228 still cites Donaldson and Donaldson–Kronheimer without a chapter or section. Written again as R05.

## Verified sound

**Gate and build.** The worker's gate at 1fb9d4d passes every text scanner (`set_option`, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, metadata, stray-files, dirty, outside-folder, source-material, all 0) and fails only on `build=2` (R01). The dependency check, rerun here:

    depcheck: 239 roadmaps, 2361 edges, 0 problem(s)

with no UPWARD, CYCLE or `moved:` line for InstantonFloerTheory. `lake env lean TauCetiRoadmap/InstantonFloerTheory/Suggested.lean` from the pull-request worktree exits 0 with no output (10 s), and so does the module-form probe copy of R01 (5 s). The file declares nothing, so there is no `#check @name` comparison and no one-tactic padding probe to run; the docstring's five not-statable headlines are unchanged, and its reason for the fifth ("the odd-bundle surface moduli space as a symplectic manifold") remains true at the pins: GQ1 owns the moduli as a roadmap target, not as a declaration (`relationSet`, `relationModuli` are README names at GQ's head, not in Tau Ceti 2fd255d9). The file has a single `import Mathlib`, no `set_option`, no sorry'd data, no `lemma`. The branch's `lake-manifest.json` pins Mathlib 1b1ccf4b and Tau Ceti 2fd255d9, the same as main's.

**Edits outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/InstantonFloerTheory'` is empty: the long list in `scratch/changes.md` is the merge of main (commit b977f85c), not the pull request's own changes.

**The changed passages against the supplier at its head** (`TauCetiRoadmap/GaugeQuiltFieldTheory/README.md`, pull request #1076, head 023814f, by the same author; GaugeQuiltFieldTheory is line 280 of the merge order and InstantonFloerTheory line 281, so the new supplier edge points backward). Every fact IF9 takes from GQ1 is stated there:

| IF9 takes | GQ1 states | Line |
|---|---|---|
| `M(P,δ)` = central-curvature connections with determinant connection δ, modulo determinant-one unitary gauge transformations; smooth compact | the same definition; "compact smooth symplectic quotient" for r ≥ 2 coprime | 45, 69 |
| tangent space `H¹` of the trace-free deformation complex | "trace-free stabilizer Lie algebra zero … surface duality … obstruction vanishing"; Downstream paragraph "its tangent space `H¹` of the trace-free deformation complex" | 69, 260 |
| `Ω(a,b) = −(1/(4π²))∫ tr₂(a∧b)` | `B(ξ,η) = −tr(ξη)/(4π²)`, `Ω(a,b) = ∫_X B(a∧b)`; "`−∫_X tr₂(a∧b)` of IF0 equals `4π²·Ω(a,b)`" | 43, 82 |
| dimension `6g−6` for g ≥ 2 | `(2g−2)(r²−1)` at r = 2 | 69 |
| simple connectivity; genus-one point; empty sphere | `relationModuli_simplyConnected` (g ≥ 1); Checks g = 0, r = 2 empty; genus one a point | 57, 64, 69 |
| `c₁(M(P,δ)) = 4[Ω]` | `c₁ = 2r[Ω]`, r = 2, with the Scaduto–Stoffregen witness `c₁(TN_g) = 2α`, α = 2[Ω] | 71–75, 78 |
| line-tensoring reduces odd d to 1 | `P ↦ P⊗L`, `d ↦ d + rℓ`, `δ ↦ δ + r a`, reduction to `1 ≤ d′ ≤ r−1` | 78 |
| full SO(3) quotient = `M(P,δ)/H¹(Σ;ℤ/2)` with isotropy | the same, with the DFL Remark 2.2 sequence; Check: the genus-one point is fixed by every sign change | 67, 80 |
| GQ1 states no complex structure; IF9 builds the Hodge star | "IF9 constructs its Hodge-star complex structure on it" | 80, 82 |
| GQ2–GQ5 are not inputs | GQ5: "neither a prerequisite nor a conclusion of that comparison" | 248 |

GQ's `*Needs:*` lines (84, 94, 118, 144, 174, 182, 196, 210, 224, 240, 244, 252) name no InstantonFloerTheory section; its GQ5 and Downstream paragraphs name IF9–IF10 as the owner of the instanton side and as a consumer, so there is no cycle between the two roadmaps. The surface moduli has one owner (GQ1), the SO(3)/determinant adapter, the Hodge-star complex structure and all three-dimensional data one owner (IF9), and both READMEs say so in the same words. The pull request's description names #1076 under "Depends on" and under the revision line (it calls it a revision of a roadmap on main; GaugeQuiltFieldTheory is not on main, so #1076 is a new folder from the same author's open pull request, which is an allowed supplier; the description is data and not part of the folder). HamiltonianReduction R5 is `## R5. Gauge actions over a surface`, line 305 of `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md` on main. DFL eq. (2.5), dfl07032 (arXiv:2109.07032v1) lines 257–260, is the unnormalized form `−∫_Σ tr(c∧c′)`, with the complex structure `J = *₂` and `⟨c,c′⟩ = Ω(c,Jc′)` at lines 261–263, and the dimension `−3χ(Σ)` at line 236; these are the facts IF9 restates with GQ1's `1/(4π²)`.

**Overlaps.** `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped by an open pull request, no cited id is defined only by an open revision. The closest roadmaps in vocabulary (GaugeQuiltFieldTheory, FukayaTheory, FourManifolds, DGFloer) were compared on the surface moduli, the Lagrangian Floer complex and the mixed equation: the division is the one in the table above, and DGFloer (both heads) states no surface moduli of flat connections. `scratch/citations.md`: nothing found nowhere.

**Adversarial table.** Rows 1–24 are carried from the previous report (its table, same numbering, statements the diff leaves untouched: CS variation and gradient, the ASD flow orientation, `p₁(ad E)`, the energy identities, the index formula, the bubble stratum, the determinant order, the point-operation degrees, the genus-one projector, the Frøyshov sign adapter and degrees, the descent of ν, the ℤ[1/2] comparison, the S³ calibration, the nilpotence exponents, the U(2) lift obstruction, the T³ sectors, the odd Heegaard surface, `U² = T⁻¹`, the forgetful quotients, the nilpotence of `K_i`). New rows for the changed statements, values mine:

| # | Statement | Instances | Values on each side | Result |
|---|---|---|---|---|
| 25 | `Ω(a,b) = −(1/(4π²))∫tr₂(a∧b)` is GQ1's form; unnormalized = `4π²Ω` | GQ1's `B = −tr/(4π²)`, `Ω = ∫B(a∧b)` | `∫ −tr(a∧b)/(4π²)` = README's Ω; `−∫tr(a∧b) = 4π²·Ω` | holds |
| 26 | `c₁(M(P,δ)) = 4[Ω]` | r = 2 in GQ1's `c₁ = 2r[Ω]`; the index formula | 2·2 = 4; a charge-κ instanton has index 8κ and CS drop κ, a sphere of Chern number c has Maslov 2c, so matching index with Maslov and action with Ω-area forces `2c = 8·area`, i.e. `c = 4·area` | holds, and consistent with IF3's `8κ` |
| 27 | Chern number 2 ⇒ Maslov 4 ⇒ Ω-area 1/2; unnormalized area `2π²` | the minimal class (SS: `c₁(TN_g) = 2α`, α the generator) | Maslov = 2·2 = 4; area = 2/4 = 1/2; `4π²·1/2 = 2π²` | holds |
| 28 | The Ω-area 1/2 is the action drop of IF10b's half-period `J`, path index 4 | README line 193: `J` has charge 1/2, path index 4, action drop 1/2; `J² = T` with `T` charge 1, index 8, action 1 | index 4 = Maslov 4, action 1/2 = area 1/2; doubling gives (8, 1) = `T` | holds |
| 29 | Ω is the boundary two-form of CS with coefficient `−1/(8π²)` | `CS(A) = −(1/8π²)∫tr(A dA + ⅔A³)` on Y with boundary Σ, `A ↦ A + ta` | `δCS(a) = −(1/4π²)∫_Y tr(a∧F_A) − (1/8π²)∫_Σ tr(a∧A)`; the boundary one-form `θ_A(a) = −(1/8π²)∫_Σ tr(a∧A)` has `dθ(a,b) = ±(1/4π²)∫_Σ tr(a∧b)`, the sign depending on the orientation of Σ and the sign convention for dθ | magnitude holds; the sign is the orientation choice the target states ("Σ as the boundary of Y0") |
| 30 | `Ω(a,*a) = (1/(4π²))‖a‖²_B` and compatibility of `J = *` | `B = −tr₂`; 1-forms on an oriented surface | `−(1/4π²)∫tr(a∧*a) = (1/4π²)∫B(a∧*a) = (1/4π²)‖a‖²_B > 0` for a ≠ 0; `*a∧*b = a∧b` since `⟨*a,b⟩ = −⟨a,*b⟩` and `** = −1`, so `Ω(*a,*b) = Ω(a,b)`; `J² = −1` | holds; matches dfl07032 lines 261–263 and GQ1 line 82 |
| 31 | dimension `6g−6` for g ≥ 2, point at g = 1, empty at g = 0 | `−3χ(Σ_g)` | g = 2: 6, g = 1: 0, g = 0: −6 < 0 | holds; GQ1's `(2g−2)(r²−1)` at r = 2 agrees |
| 32 | line-tensoring reduces odd d to 1 | `d ↦ d + 2ℓ` | d = 2k+1, ℓ = −k gives 1; d = −3, ℓ = 2 gives 1 | holds |
| 33 | the `H¹(Σ;ℤ/2)` action has fixed points, so the full SO(3) quotient is not the smooth target | g = 1, `A = diag(i,−i)`, `B` the rotation by π/2 | `BAB⁻¹ = −A`, `ABA⁻¹ = −B`: all four sign changes stay in the orbit, every element of `H¹(T²;ℤ/2) = (ℤ/2)²` fixes the point | holds; for g ≥ 2 the fixed points are the bundles pushed forward from the étale double cover of a nontrivial 2-torsion class |
| 34 | the moduli of the two-component Σ is the product | `π₂` of the product | dfl07032 lines 265–266: `π₂(M(Σ)) = π₂(M(Σ₀)) ⊕ π₂(M(Σ₁))`, each 0 at genus 1 and ℤ otherwise | consistent |
| 35 | IF0's `G_det` is GQ1's determinant-one gauge group, acting through its quotient by ±1 | the constant −1 | acts trivially on connections on both sides; effective group `G_det/{±1}`, the normal subgroup of the SO(3) gauge group with quotient `H¹(Σ;ℤ/2)` (dfl07032 line 244, `ℤ/2 ⊕ ℤ/2 ↪ G(F) → G_ex(F) ↠ H¹(Σ;ℤ/2)` for the two-component surface) | holds |

**Supplier-order audit.** InstantonFloerTheory is line 281 of the merge order; GaugeQuiltFieldTheory line 280, FourManifolds 125, FukayaTheory 218, SmoothBundlesConnections 8; the rest of the table is on main. The dependency check above reports no problem. No declared gaps.

**Principles.** The changed passages introduce no route-specific shortcut (every odd degree is reduced by GQ1's line tensoring rather than assumed to be 1), re-plan nothing (the surface moduli is consumed by section, not rebuilt; the previous head rebuilt it "from R5", which the diff removes), copy no passage, add no algorithm, no process word, no pull-request number, no absolute path.

## Not verifiable

- Donaldson, *Floer Homology Groups in Yang–Mills Theory*, and Donaldson–Kronheimer, *The Geometry of Four-Manifolds*: cited without locators and not in an open repository (R05); the IF3–IF5 conventions were checked by computation (previous table rows 1–9).
- GQ1's own locators (Wehrheim–Woodward Theorem 3.3.3 and eq. (26), Scaduto–Stoffregen §4.2) were not re-opened here: they are the supplier's claims, reviewed on its own pull request; this review checked that IF9 restates GQ1 exactly and that the restated values are consistent with the index formula (row 26) and with DFL eq. (2.5).

## Source issues

- none
