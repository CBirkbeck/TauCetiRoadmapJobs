# Review of HilbertModularSurfaces (pull request #1730 at 7ebdf0c)

**Verdict:** accepted

Incremental re-review of 82 changed lines since 7b8a46f, with the pull request's title and description read against this head. No finding. README abbreviates `TauCetiRoadmap/HilbertModularSurfaces/README.md`, Lean abbreviates `TauCetiRoadmap/HilbertModularSurfaces/Suggested.lean`.

## Previous findings

- R01 — repaired: README:673 adds the row `Γ₀(𝔑)_𝔟`, `M = 𝔰⁻²𝔟⁻¹𝔑(𝔑 + 𝔐²)⁻¹`, `V = {v ∈ R^×_{>0} : v ≡ 1 mod 𝔐 + 𝔑/𝔐}`; README:2068–2070 records the printed moduli.
- R02 — repaired: Lean:125–133 has `IsReducedBasis` and `resolutionCycle (v₁) (x y)`; no `Classical.choose`; both theorems take reduced bases as hypotheses (Lean:147, 158); README:827–833, 842–845, 910–911, 948–950 agree.
- R03 — repaired: the description reads "the roadmap, 8 layers and 48 numbered sections".
- R04 — repaired: the description reads "the Kodaira classification of the level-one `sl` surfaces (rationality for D ∈ {5, 8, 13, 17}, … general type for D > 500) …; individual small-discriminant surfaces are worked examples".

Nothing was settled as not actionable; nothing is re-raised. No repair introduced a new problem.

## Verified sound

| Statement | Instances and computed sides | Result |
|---|---|---|
| §1.5 `Γ₀(𝔑)_𝔟` row (README:673) | `ℚ(√5)`, `𝔑 = 𝔭₂`: cusp `(0:1)`, `f = 0`: `M = 𝔑(𝔑 + R)⁻¹ = 2R`, modulus `R`; cusp `(1:0)`, `f = e = 1`: `M = 𝔑(𝔑 + 𝔑²)⁻¹ = R`, modulus `R`. `𝔑 = 𝔭₂²`, `𝔐 = 𝔭₂`: modulus `𝔭₂`, `φ³ = 2φ + 1 ≡ 1`, `V = ⟨φ⁶⟩`. | Agrees with the Check at README:704–707 and with `k` = order of `ε⁺` at README:835–836. |
| Row against the source's proof | Local exponents: `𝔐 + 𝔑/𝔐 = ∏ 𝔭^{min(f, e−f)}`; `𝔑(𝔑 + 𝔐²)⁻¹ = ∏ 𝔭^{e − min(e, 2f)} = ∏ 𝔭^{max(e−2f, 0)}`. | Both match `assaf` lines 556–557. |
| `CuspDatum.IsReducedBasis` (Lean:125) | Holds: `√3R`, `(3+√3, 3)`: determinant `6√3`, `w ≈ 1.577`, `w′ ≈ 0.423`. Fails: `R`, `(1, 2+√3)`: determinant `−2√3`; `R`, `(√3, 1)`: `w′ = −√3 < 0`. | Determines the reduced oriented bases. |
| Wrong model: basis with reduced quotient, negative-norm `y` | `R ⊂ ℚ(√3)`, `(√3, √3 − 1)`: quotient `(3+√3)/2` reduced, period `(3, 2)` (the dual one); determinant `√3(−√3−1) + √3(√3−1) = −2√3 < 0`. | Excluded by `IsOriented`; orientation ⟺ `N(y)(w − w′) > 0`. |
| "Every datum has a reduced basis" (README:842–843) | Successor step `(x, y) ↦ (y, by − x)` has determinant `0·b − 1·(−1) = 1`: basis and orientation kept. `R ⊂ ℚ(√3)`, `(√3, 1)`: digits `2, 4, 4, …`; next basis `(1, 2 − √3)`, `w = 2 + √3`, `w′ ≈ 0.268`. | Reduced after one step, period `(4)`. |
| `CuspDatum.resolutionCycle` on two reduced bases | `√3R`: `(3+√3, 3)` gives `(−2, −3)`, `(3, 3−√3)` gives `(−3, −2)`; `k = 1`. | A rotation of each other, as README:843–845 says. |
| `cycleIntersectionMatrix_negDef` (Lean:146) | `√3R`: `(−2, 2; 2, −3)` and `(−3, 2; 2, −2)`, minors of the negative `2, 2` and `3, 2`. `R ⊂ ℚ(√5)`, `(3)`, `k = 1`: `(2 − 3) = (−1)`; `k = 2`: `(−3, 2; 2, −3)`, minors `3, 5`. `repetition = 0` cannot occur (`V_relIndex_ne_zero`). | Negative definite for either basis. |
| `period_dual` (Lean:154) | `ℚ(√3)`, `D.M = R`, `(2+√3, 1)`: `(4)`, sum `1`; `β = √3`, `E.M = √3R`: `(2, 3)` or `(3, 2)`, sum `−1`. `β` a unit of norm `−1`, `E.M = D.M`: `ℚ(√5)`, `(3)`: `0 = −0`; `ℚ(√2)`, `(2, 4)`: `−1 + 1 = 0`. | `1 = −(−1)`; value independent of the reduced bases chosen. |
| Description, section count | `### k.n` headings per layer: 5, 5, 7, 11, 9, 3, 5, 3. | 48, as the description says. |
| Description, classification sentence | README:1694 (§6.3, `D = 5, 8, 13, 17`), :1707 (§6.4, trivial component, `D ≤ 500`), :1722 (§6.5, `D > 500`, every `𝔟`). | Agrees. |

The rows for every other statement stand as in the previous review, of 7b8a46f.

- Gate: the worker's run at this head passes every check (`statement-hygiene=0`, `build=0`, `outside-folder=0`). A run of the gate command without the merge-order candidate prints only `depcheck: NOT IN ORDER: HilbertModularSurfaces (insert it after its last supplier)`, which is the placement of a roadmap the order does not list yet, not a defect.
- Dependency check with the merge-order candidate: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The diff changes no `*Needs:*` line and no supplier citation.
- Elaboration: `lake env lean` on Lean gives four `declaration uses sorry` warnings (Lean:86, 146, 154, 178) and nothing else. `#check @` of `IsReducedBasis`, `resolutionCycle`, `cycleIntersectionMatrix_negDef`, `period_dual` on a scratch copy: each keeps `[NumberField F]` and `(D : CuspDatum F)`; the binders match README:827–833 and :948–950.
- One-tactic probe of the two changed theorems on scratch copies: `simp` makes no progress, `rfl` fails, `simp_all` with the definitions unfolded leaves both goals; neither is padding. `IsReducedBasis` is needed to state both.
- Source lines read: `assaf` 479–490 (Proposition 3.3.8(a)–(b)), 544–559 (proof); `assaf-errata` 17; `hirzebruch` 1092–1097 (§2.4, definiteness), 1188–1209 (§2.5, reduced base and primitive cycle), 1288–1304 (§2.6, strict equivalence). Seeded targets falling in changed passages (1.5, 2.5, 2.7) are covered by these; no README locator is marked unverified.
- Names: `IsReducedBasis` and `resolutionCycle` are declared by no other roadmap's `Suggested.lean` on main or at an open head (the `CuspDatum` of MaassForms and ConformalMappingPartII is Tau Ceti's `Subgroup.CuspDatum`, a different namespace); no stale mention of the deleted `CuspDatum.period` remains in README or Lean. `overlaps.md` lists no dropped id, second copy or other pull request changing the folder; the leads of `citations.md` are this roadmap's own declarations and LMFDB knowl names.
- Pull request text: the title, the summary block and the prose were read against this head and the folder's change (a new roadmap, 2294 lines added, 16 declarations, `metadata.toml` `math.AG`); no sentence is contradicted and no removal or renumbering is left unstated. No file is changed outside the folder against the base.
- Remark, no change asked: the sentence "Builds on the sibling drafts #1724 (HilbertModularForms)" names one of the six open suppliers; the generated `depends-on` block lists all six.

Overlap check: read HilbertModularForms (§1.4 at its head); the groups, cusps and form spaces are HilbertModularForms', cited at README:693; SiegelModularForms, QuaternionArithmetic, BianchiModularForms, ShimuraCompactifications and NoncongruenceModularForms were not re-read (the diff touches no object they could share); nothing shared.

Source independence: changed passages only: 4 passages compared with 3 sources (`assaf`, `assaf-errata`, `hirzebruch`), none shared beyond the forced formulas of the table row; the arrangement was not compared again (no layer added, removed or reordered) and the largest-share count was not recomputed.

## Not verifiable

- van der Geer (1988) and Prestel (1968): settled uncertified in the manifest; cited by locator only. The changed sentence of §2.7 keeps its van der Geer locator unchanged.

## Source issues

- **Misprint** in assaf at Proposition 3.3.8(a), preprint p. 10, line 485: the source says the modulus of v ≡ 1 is 𝔐 + 𝔐/𝔑; it should be 𝔐 + 𝔑/𝔐, as the proof's min(f, e − f) at line 556 shows; affects nothing.
- **Error** in assaf at Proposition 3.3.8(b), preprint p. 10, line 490: the source says the modulus of v² ≡ 1 is 𝔑 + 𝔑/𝔐; it should be 𝔐 + 𝔑/𝔐, the same as in part (a) by the proof at lines 558–559; affects a stated result.
- **Misprint** in assaf-errata at item (3), line 17: the source says part (b) should read modulo 𝔐 + 𝔐/𝔑; it should be 𝔐 + 𝔑/𝔐, since 𝔐/𝔑 contains R and the congruence would be empty; affects nothing.

## For the human reviewers

- none
