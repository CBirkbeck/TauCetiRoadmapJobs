# Review of DeligneWeightsAndPurity (pull request #929 at ff93d18)

**Verdict:** accepted

Incremental re-review of the 15 lines changed since ddbc25a. No finding.

## Previous findings

- R01 — repaired: "`D₀ ⊂ X₀` a smooth divisor defined by an equation `t` … Let `ℱ₀[D₀]` be the tame restriction of `ℱ₀` to `D₀` formed with the Kummer covers `t^{1/n}` (LefschetzPencilsAndVanishingCycles §1.8)"; §1.8 is in the *Needs* line, the contracts, the Layer DWP.5 dependencies and the description.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 5.12 divisor clause | `ℒ_χ(t)` on `𝔾_m × 𝔾_m ⊂ 𝔸¹ × 𝔾_m`, `χ` of order `n > 1`, `n ∣ q − 1` | equation `t`: on `sⁿ = t`, `ℒ_χ(sⁿ) = ℒ_{χⁿ}(s)` is trivial, restriction to `D₀` constant; `W` one step, `N = 0`, `M = W`, weight `0` | pass |
| 5.12, change of equation | the same sheaf, equation `ut`, `u` the coordinate of `𝔾_m` | on `sⁿ = ut`: `t = sⁿ/u`, `ℒ_χ(t) = ℒ_χ(sⁿ) ⊗ ℒ_χ(u)⁻¹`, restriction `ℒ_χ(u)⁻¹`: rank `1`, Frobenius values roots of unity, weight `0`; the two sheaves differ, the weights agree | pass |
| 5.12 against its source | hypotheses of the divisor clause | `X₀` smooth over `𝔽_q`, `D₀` smooth, tame, `W` with `Gr^W_i` pure of weight `i`, equation `t`: WII line 1554–1560; conclusion `Gr^M_i` pure of weight `i`: WII line 1563–1565 | pass |
| Contract for LefschetzPencilsAndVanishingCycles §1.8 | one smooth component of the supplier's strict normal crossings divisor; `X` of finite type over `𝔽_q` | supplier: `X` regular, tame and unipotent after a Kummer cover, fixed equations, residue `N_a`, existence of relative filtrations left to weights; residue field at the generic point of `D` finitely generated over `𝔽_q`, so its §1.1 gives quasi-unipotence | pass |
| Description | section list for LefschetzPencilsAndVanishingCycles | "§§0.2–0.8, 1.1–1.6, 1.8, …: … the tame restriction along a smooth divisor": agrees with the README's contracts; no supplier, heading id or declaration added or dropped beyond this contract heading | pass |

The rows of the previous review, of ddbc25a, stand for every untouched statement.

- Source locators checked against the text: 3, all right. WII Variante (1.7.8) begins on p. 172 (WII line 1390), the dependence on the equations and the normal-bundle form are (1.7.10) on pp. 173–174 (WII line 1452–1460), and (1.8.5)–(1.8.7) are on p. 176 (WII line 1547–1565).
- Seeded sample: none of the 15 targets is a changed passage or cites one.
- Cross-roadmap citations resolved: LefschetzPencilsAndVanishingCycles §1.8 and §1.1 at its open head; the three in-page anchors the change adds resolve to their headings.
- Library declarations: none opened; `TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean` is unchanged since ddbc25a. `lake env lean` gives 5 `sorry` warnings (lines 83, 97, 112, 155, 180) and no error.
- Gate: every check zero, build passing. `depcheck: 261 roadmaps, 2605 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- Overlap check: read FourierDeligneTransform, LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, WeightsInEtaleCohomology, WeilConjectures (the lists for main and for named results are empty); LefschetzPencilsAndVanishingCycles §1.8 owns the tame restriction and leaves the existence of relative filtrations under weight hypotheses to §5.12 here; nothing shared.
- Source independence: changed passages only; 2 passages compared with 1 source (WII), none shared; largest share WII, 147 of 222 locators at ddbc25a and the one WII locator this change adds; contents not compared again (no layer added, removed or reordered).
- Research link: the targets are the theorems of Deligne (1974, 1980) with Laumon's (1987) Fourier-transform proof of the curve estimate; §8.24 is the weight spectral sequence used by Bergström–Faber–Payne (2023). Rests on the README's references and the texts read.

## Not verifiable

- [Int] (SGA 7 II, XXI §5): not in the sources cache; cited by locator only.
- Lau line 2649–2653 (the product formula in (4.4)): garbled in the extraction, so the reality step there was not compared with §2.14.
- The file-by-file mapping to the two outside Lean repositories in "Provenance: existing Lean work": the repositories and their licence were confirmed, the files were not opened.
- [Pet]: the journal reference (Geom. Topol. 21 (2017), 2527–2555) was not checked against the publisher; the locators are to the preprint, which was read.

## Source issues

- **Error** in BFP at proof of Proposition 4.2, display (3), p. 7: the source says the `E₁` term is the automorphism invariants of the tensor product of the vertex cohomologies; it should carry the orientation character `det E(G)` of the edge set; affects nothing.

## For the human reviewers

- **Licence.** `README.md` section "Provenance: existing Lean work" maps targets to formal-arithmetic-geometry/weil-conjectures (55abf46) and AxiomMath/Weil and Stacks (27cdb20, f8e70c5), all stating Apache-2.0, and says no code is transferred; no `Suggested.lean` name matches theirs.
- **Licence.** [KatzW] was read from a text the operator holds locally; the README cites the author's manuscript pagination, not the published article's.
