# Review of PurityForFlatCohomology (pull request #1840 at a825987)

**Verdict:** needs changes

Incremental re-review of 103 changed lines since 160e354. The folder's changes are sound; the previous finding is about the pull request's description, which still carries the sentence.

## R01 (P3) — The description still says the étale-depth bound needs no perfectoid input

**Location:** pull request description, summary block, "Approach and generality": "the étale-depth bound and Zariski–Nagata purity need no perfectoid input."

**Claim:** The head now scopes the perfectoid-free bound to coefficients of invertible order (§1.6) and assigns the bound for every commutative finite étale group to §6.3, through §6.2. The description, which names the latter as a headline, was not changed.

**Witness:** `TauCetiRoadmap/PurityForFlatCohomology/README.md` line 1199 (§1.6 heading "for coefficients of invertible order"), lines 781–783 ("the bound for every commutative finite étale group is Layer 6's (§6.3), through purity for complete intersections"), line 2065 (`*Needs:* §§1.1, 1.6, 6.2`).

**Repair:** Replace the clause in the description by: "the étale-depth bound for coefficients of order invertible in `R` (§1.6) and Zariski–Nagata purity need no perfectoid input; the bound for every commutative finite étale group (§6.3) rests on purity for complete intersections (§6.2)."

## Previous findings

- R01 — not repaired: the description still reads "the étale-depth bound and Zariski–Nagata purity need no perfectoid input"; the README was scoped instead (§1.6 heading, layer table, "How to read the build"), which is correct but leaves the sentence. Written again as R01.

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.6 (heading rescoped) against §6.3 / `etaleDepth_ge_virtualDimension` | `R = ℤ_p`, `vdim = 1`; `G = ℤ/ℓ` (`ℓ ≠ p`) and `G = ℤ/p` | `ℤ/ℓ`: `H⁰_𝔪 = ker(ℤ/ℓ → ℤ/ℓ) = 0`, inside §1.6. `ℤ/p`: `H⁰_𝔪 = 0` too, but order not invertible: outside §1.6, inside §6.3 | heading agrees with CS24 line 1381–1382 (order invertible) and line 1384 (removed in 6.2.4) | none |
| 2 | §7.12c definition "the same" as ReductiveGroups Layer 9D's | circle `x² + y² = 1` over `ℝ`; `𝔾_m ⊔ μ_2` over `Spec(k × k)`; `α_p` over `𝔽_p` | Both: fppf-locally `D_{S_i}(M_i)`, `M_i` finitely generated, depending on `i`. Circle: split by `Spec ℂ`, `M = ℤ`; `k × k`: `M = ℤ, ℤ/2`; `α_p`: Cartier dual not étale, excluded | definitions coincide over `Spec R`; over `Spec k` both give the pinned property (diagonalizable over `k̄`) | none |
| 3 | §7.12e(b) as a case of Layer 9D's monomorphism criterion | `μ_2 → 𝔾_m` over `ℤ`; `[2] : 𝔾_m → 𝔾_m` over `ℤ` | `μ_2 → 𝔾_m`: kernel `D(ℤ/ℤ) = 1`, target affine of finite presentation, closed immersion `x² = 1`. `[2]`: kernel `μ_2 ≠ 1`, not a monomorphism, no claim | the cited criterion (affine target of finite presentation) covers targets of multiplicative type | none |
| 4 | §7.12d(b), big étale site, against Layer 9D's small-site anti-equivalence | circle torus over `ℝ`; `μ_p` over `𝔽_p` | Circle: `X^*(ℝ) = 0`, `X^*(ℂ) = ℤ`, conjugation `−1`, the same Galois module on both sites. `μ_p`: `X^* = ℤ/p` constant on both | the two statements agree where both apply; neither implies the other's site | none |

The rows of the previous reviews for untouched statements stand as in the previous review, of `160e354`; the diff changes no Lean statement.

- Cross-roadmap citations resolved on main (276e711): ReductiveGroups Layer 9D (heading at README line 4976), bullet *Relative reductive groups over an arbitrary affine base* (line 5000) with its multiplicative-type paragraphs (lines 5035–5073: definition, comparison over `Spec k`, monomorphism criterion, closed subgroups, small-étale anti-equivalence and étale-local splitting, isotriviality over normal bases), and Layer 4 (line 2112). Each of the seven facts the new contract and scope bullet attribute to Layer 9D is stated there. ReductiveGroups does not name this roadmap, so the consumer bullet's removal leaves no cycle.
- Library declarations opened at the pin: `TauCeti.multiplicativeTypeAffineGroupSchemeProperty` (`TauCeti/AlgebraicGeometry/AffineGroupScheme/MultiplicativeType.lean` line 54), `TauCeti.torusAffineGroupSchemeProperty` (`…/AffineGroupScheme/Torus.lean` line 59); `TauCeti.DiagonalizableGroup.groupScheme` is cited by the README at the file it names.
- Source locators checked: 1 (CS24 Theorem 3.2.4, CS24 lines 1381–1384, printed p. 33: order invertible in `R`; the restriction is lifted in Theorem 6.2.4). No seeded target falls in a changed passage; the README flags no locator as unverified.
- The renamed §1.6 heading: no link in the README targets its anchor; EtaleDualityAndPerverseSheavesPartII (README line 1656) cites it as "§1.6", by number, which still resolves.
- Gate rerun at a825987: every counter 0, `OK`; the worker's `gate.md` shows `build=0`. Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 15 warnings, all ``declaration uses `sorry` ``, 0 errors. `Suggested.lean` is unchanged since `160e354`, so the 25 elaborated signatures and the one-tactic probe stand as recorded.
- Outside-folder diff against `origin/main`: empty. Overlaps: no other open pull request changes the roadmap, no cited id dropped, none defined only by an open revision; cross-roadmap citations found nowhere: 0. The rest of the description (title, the fifteen theorems listed, suppliers named, validation paragraph) agrees with the head.
- Overlap check: read ReductiveGroups (main), GroupSchemesOverABase, SchemeAndStackFoundationsPartII; groups of multiplicative type over an affine base: owner ReductiveGroups Layer 9D, cited here; over an arbitrary base scheme: owned here, and also by GroupSchemesOverABase (see For the human reviewers).
- Source independence: changed passages only; 6 passages compared with 1 source (CS24), none shared; largest share CS24, unchanged; no layer added, removed or reordered, so the arrangement was not compared again. SGA3 (cited by the changed §7.12c–7.12e sentences) is uncertified and was not read.

## Not verifiable

- SGA3 X 4.5 and X §5 (§§7.12c–7.12d, sentences changed this round): uncertified, cited by locator only.
- As before: SGA3 VIII–X (§§7.12a–7.12e), Aus62 Theorem 1.3 (§7.2), DF84 Remark 3 (§8.18), Avr77 Proposition 3.6 (§1.2) are uncertified.

## Source issues

- none

## For the human reviewers

- **Scope.** GroupSchemesOverABase (open, #1522; its Scope and its Downstream consumers bullet on this roadmap) owns the same objects as §§7.12a–7.12e and asks this roadmap to cite it; the gate's `dropped` check refuses that name here. Which roadmap owns them is undecided.
