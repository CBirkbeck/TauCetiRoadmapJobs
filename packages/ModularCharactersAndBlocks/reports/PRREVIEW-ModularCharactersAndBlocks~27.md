# Review of ModularCharactersAndBlocks (pull request #1775 at 8379fba)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** accepted

This is an incremental re-review of the 32 lines that changed since `d91b7b5`, together with the family index `TauCetiRoadmap/RepresentationTheory/README.md`, which also changed. Both previous findings are repaired. The repairs introduce no new problem, and the gate passes.

No findings.

## Previous findings

- R01 — repaired: `README.md:1227–1231`: “the completion `K′` of the maximal unramified extension of `K` is complete for a discrete valuation with `e(K′/K) = 1` and residue field `k̄` (RamificationOfCompleteDiscretelyValuedFields §4a.3; the residue field `k` of `K` is finite, hence perfect)”. The *Needs:* lines are at `:1234–1235` and `:1241`, Dependencies at `:1288–1290`, Scope at `:89–93` and the contract at `:243–249`.
- R02 — repaired: `TauCetiRoadmap/RepresentationTheory/README.md:133–136`: “consumes these foundations, imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns the Brauer-character basis theorem, decomposition matrices, Brauer reciprocity and blocks with defect.” `:80` adds SemisimpleAlgebras Layers 0–2.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate at `8379fba` passes every check, including `build=0` and `outside-folder=0`.
- My bare rerun (`gate … --base origin/main`) failed on two lines:
  - `depcheck: NOT IN ORDER: ModularCharactersAndBlocks`. This is because the public order file does not list a new roadmap yet.
  - `outside-folder: TauCetiRoadmap/RepresentationTheory/README.md`. That file is the family index, which the brief counts as this pull request's own.
- Rerun with `--order` set to the candidate order, `--pr 1775 --build`: `depcheck=0`, `build=0`. The only hit is the same family-index line.
- `git diff --stat origin/main...HEAD` with the folder and the family index excluded is empty, so nothing else changes outside the folder.
- Dependency check (candidate order, `--movable`): `depcheck: 235 roadmaps, 2134 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The edge count is one more than at `d91b7b5`, from the new edge to RamificationOfCompleteDiscretelyValuedFields. That roadmap is line 2 of the order and is on main; this roadmap is line 101.
- `lake env lean` on `Suggested.lean`: exit 0, 13 warnings, all `declaration uses sorry`. `Suggested.lean` is byte-identical to `82701b2`, and `lake-manifest.json` and `lean-toolchain` match main. The r26 elaborated-signature check (no lost binder) and one-tactic probe (all 13 theorems fail) therefore still hold.

**The new supplier citation, resolved on main (`32cc4c3`).**
- RamificationOfCompleteDiscretelyValuedFields `README.md:1185` is headed “4a.3 Completed maximal unramified base change”. Lines 1187–1189 state that `K′` is complete for a discrete valuation, with `e(K′/K) = 1` and residue field an algebraic closure of `k`. Line 151 says Layer 4a assumes `k` perfect.
- The folder's Scope bullet and contract restate exactly this. The contract restricts it to `K` finite over `ℚ_p`, which is the `K = F_v` of §1.1 (`README.md:415–416`). That residue field is finite, hence perfect, as `:1229–1230` says.
- The relative link `../../RamificationOfCompleteDiscretelyValuedFields/README.md` resolves.
- ReductiveGroupsPartII §RG2.0.4, also on main, states `Breve E` for nonarchimedean local fields, and §4a.3 identifies its own `K′` with it. Citing §4a.3 is consistent with both. Neither pinned library has the completed field: Tau Ceti `TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean:97` defines only `maximalUnramifiedExtension`.

**The changed §7.2 route, step by step.**
- Sambale's standing system (sambale lines 312–316) has `K` a splitting field for `G` of characteristic `0`, `O` a complete DVR and `F` algebraically closed.
- `K′ ⊇ K` contains a primitive `e`-th root of unity, so it splits `G` and every subgroup, in particular `C_G(u)`. `ζ_{|u|} ∈ K′`, because `|u|` divides `e`.
- The valuation ring `O′` is a complete DVR, `CharZero K′` holds, and the residue field is `k̄`. Since `O → O′` is local, `m′ ∩ O = m`. So the Conventions' definition of a splitting `p`-modular system (`README.md:129–133`) holds for `K′`.
- §6.2 (`k` splits `G` and `C_G(u)` by §2.3) and the uniqueness of central lifts in §1.3 then carry the blocks across.
- Sambale Prop. 1.11 and Theorems 1.13–1.14 (lines 438–472, p. 16) say what the README says.

**Seeded sample.** None of the fifteen sampled targets lies in the changed passages. The r26 checks of 0.1, 0.3, 2.1, 2.2, 3.1, 4.1, 5.1, 6.1, 6.3 and 7.3 carry forward. I also spot-checked the five sampled targets that the r26 table did not list:

| Target | Locator (source line, printed page) | Result |
| --- | --- | --- |
| 1.2 | Webb T9.4.8 p.153 (webb 6434); Martínez T1.7, L1.8 p.4 (martinez 189, 196) | supports |
| 2.3 | Webb Ch. 9 Ex. 4 p.165 (6974), Ex. 8(a) p.166 (7004) | supports radical base change and simple-module count |
| 2.4 | Webb P10.3.2 p.182 (7703), C10.2.4 and the remark after it p.178 (7502, 7520–7522), T9.4.11 p.155 (6518) | supports |
| 5.2 | Sambale T1.14 p.16 (465) | supports the block-summed form |
| 8.1 | Martínez T1.14 p.6 (316), C8.2/P8.4 p.51 (1895, 1907), T8.5 p.52 (1928); Sambale T1.23 p.18 (542) | supports; bijectivity only when `G/C_G(N)` is a `p`-group, as stated |

**The family index (R02).**
- The imported items match GL2AutomorphicRepresentationsAndTransfer §R17.5.11 at its open head (heading at README line 2927; its *Needs:* line 2938 says modular characters and their projective pairing are owned there). The owned items match folder §§2.2, 2.4, 3.1 and Layers 4–7.
- SemisimpleAlgebras on main: Layer 0 is the Jacobson radical (line 169), Layer 1/1.5 the simple modules (186, 200), Layer 2 Artin–Wedderburn (212). This matches the index's parenthesis.
- The description says the index conflicts with #1146 and merges cleanly with #1047 and #1220. `git apply --check` of each head's index diff against this head confirms it: #1146 fails at line 115, while #1047 (`7fcba97f`) and #1220 (`37a51648`) apply.
- The description already names RamificationOfCompleteDiscretelyValuedFields §4a.3 among the reused foundations.

**Ownership and overlaps.** The overlap report lists no other pull request changing this folder, no dropped id and no revision-only id. The resolver finds every citation and Lean name. Ownership was checked against the 438 heads in the index of 2026-11-11T06:08:50Z.

**Adversarial table.** Rows A01–A08 and A10–A21 cover statements this diff leaves untouched and are carried from the r26 report with its computed values. A09 is recomputed and A22–A23 are new. Notation: `r = (123)`, `t = (12)`, `e₀ = 1 + r + r²`, `e₁ = r + r²`.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| A01–A08 | §6.2 traces, Mackey, `isDefectGroup_conj`, Sylow criterion, `O_p(G)`, defect zero, central character, scalar extension | as in r26 | as in r26 (e.g. `Tr_1^G` image `𝔽₂e₁`; `e_α + e_{α²} = e₁`) | Pass (r26) | none |
| A09 | §7.2 passage to the system of §1.1 via `K′` | `S₃`, `p = 2`; `S₃`, `p = 3`; `C₂`, `p = 2`; control `K^ur` | `p = 2`: `K = ℚ₂(ζ₃)`, `k = 𝔽₄`, `K^ur = ℚ₂^ur`, `K′` uniformizer `2`, residue `𝔽̄₂`, `ζ₆ ∈ K′`; lifts `(1+r+r²)/3 ↦ e₀`, `(2−r−r²)/3 ↦ e₁` in `ℤ₂[ζ₃][S₃] ⊆ O′[S₃]`; `d^t = (1, −1, 0)`, nonzero on `B₀` only. `p = 3`: `π = 1 − ζ₃` stays a uniformizer (`v′(3) = 2`), residue `𝔽̄₃`, `d^r = (1, 1, −1)`, one block. `C₂`: residue `𝔽̄₂`, one block. Control: `K^ur` is not complete (§4a.3 Check), so it fails `IsAdicComplete` | Pass; the completion and `k` splitting `C_G(u)` (§2.3) are both needed | none |
| A10–A21 | Suggested headlines and §7.1 Check | as in r26 | as in r26 (e.g. `e₊e₋ = 6 + 6t = 0` over `𝔽₃`; `C = [[2,1],[1,2]]` for `S₃` at `3`) | Pass (r26) | none |
| A22 | Contract: §4a.3 for `K` finite over `ℚ_p` | `K = ℚ₂(ζ₃)`; wrong models `K′ = K`, `K′ = K^ur` | `e(K/ℚ₂) = 1`, `f = 2`, so `K ⊆ ℚ₂^ur`, `K′ = (ℚ₂^ur)^`, uniformizer `2`, residue `𝔽̄₂ ⊋ 𝔽₄`. `K′ = K` fails: `𝔽₄^×` has order `3`, so `α` has no cube root. `K^ur` fails completeness | Pass | none |
| A23 | Block form of §5.2 (its *Needs:* changed) | `S₃`, `p = 2`, `B₀ = {1, sgn}`, `B₁ = {std}` | `u = v = 1`, `φ = ψ = 1`: `1 + 1 = 2 = c_{11}` (`P_1 = 𝔽₂[S₃]e₀`, factors `1, 1`); `u = 1`, `v = t`: `1·1 + 1·(−1) = 0`; `u = v = t` on `B₀`: `1 + 1 = 2 = c^t_{11}` of `𝔽₂[C₂]`; on `B₁`: `0·0 = 0`, `b^G = B₀ ≠ B₁` | Pass | none |

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, and Serre (`serre`), Part III §§15.2 and 16.1: settled as uncertified and cited by locator.
- The two Axiom formalizations under References are named as proof sources only and were not opened.
- Brinon–Conrad, which RamificationOfCompleteDiscretelyValuedFields cites for §4a.3, is that roadmap's source. This roadmap cites only the section.

## Source issues

- none
