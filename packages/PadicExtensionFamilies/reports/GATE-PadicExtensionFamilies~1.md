# GATE-PadicExtensionFamilies~1: answers to human review

One comment (0stellensatz, 2026-11-03T08:00:25Z) with two distinct points: a proposal to move §0.6 to a new roadmap `EtaleMassFormula` (a question, "do you object?"), and a request to review that roadmap's pull request when it opens. The comment says itself that nothing here changes until the new roadmap merges, and nothing in this roadmap is wrong as it stands, so there are no edits this round and no commit.

## H01 (0stellensatz) — answered

No objection to the move, with the conditions below. The locators in the comment are right at `4cf9622`: §0.6 is README line 458, its uses are in the *Needs* lines at 1495 (6.3), 1672 (6.5) and 1779 (6.7) and the text at 1657, and the *Not owned here* bullet is lines 158–160. `Suggested.lean` declares nothing for §0.6, so moving it does not touch the acceptance test.

Ownership check. Nothing on main or at the open heads owns the étale mass formula as a target. MassFormula's *Long horizon* section names Bhargava's generalization as the next roadmap in its direction. ArithmeticStatisticsPartV (*Quartic quintic density constants*, and the quartic and quintic count proofs) uses the étale local mass for `n ≤ 5` only inside proof routes, citing Bhargava–Shankar–Wang Theorem 1, and states no target. So the new roadmap would be the owner and a natural supplier to that roadmap. Under the "Part II" rule it continues MassFormula, so its introduction should say where MassFormula stops.

Merge direction. Its suppliers (MassFormula, LocalFieldsRamification Layer 2, Tau Ceti `Unramified/Factorization.lean`) are all on main, so it would be placed before this roadmap, and this roadmap consuming it is a downward edge with no cycle. This roadmap keeps §0.6 until the new roadmap is on main or open as a new-folder pull request. Only then can it be cited, and then the four edits listed in the comment are the right ones.

For the moved section to serve both roadmaps:

1. **Weighted form.** Bhargava's mass weights each class by `q^{-v_K(Disc)}`, but §0.6 states only the unweighted identity, and the unweighted identity does not give the transitive mass `q^{f−n}/f`. The bijection and the automorphism count give the identity for any weight in `ℝ≥0∞` that is invariant under `K`-isomorphism. The section should state it in that generality, together with `v_K(disc_{L/K}) = f · d(L/K_f)` (from `discriminantExponent_eq_inertiaDegree_mul_differentExponent`, since the different does not change across the unramified step). With that, Serre's Theorem 1 over `K_f` (`Σ q_f^{-d}/#Aut = q_f^{1−e}`, `e = n/f`, `q_f = q^f`) gives `(1/f)·q^{f(1−e)} = q^{f−n}/f`, as the comment claims.
   - Equal characteristic: when `p ∣ n/f`, both sides of the unweighted identity are `∞` (there are infinitely many Artin–Schreier classes), so only the weighted form carries information there.
2. **6.3, 6.5 and 6.7 need more than the identity.** They use the class–orbit bijection and `#Aut_K(L) = #Aut_{K_f}(L)·#Stab([L])`, not only the displayed identity. 6.5 uses the count `f/#Stab` to reach `f·B(L/K_f)/#Aut(L/K)`. Both must stay stated targets, along with the sentence on inseparable classes. The list in the comment includes them.
3. **No citations back into this roadmap.** As written, the Checks cite this roadmap's 6.7 (`N_2(2,1)`, the degree total `7`) and 5.3 (Krasner's `6 + 8`), and the *Needs* line cites 0.5 and the canonical tower contract. Moved verbatim, these become citations of a later roadmap, which is an upward edge in the new roadmap. Each value has to be restated from a self-contained computation:
   - `6 = 7 − 1` ramified quadratics of `ℚ_2`, from its eight square classes;
   - `14 = 16 − 2` for `ℚ_4`;
   - `9 + 1 = 10` cubics of `ℚ_3`.
   Use Mathlib `L ≃ₐ[K] L` in place of 0.5. Crediting this roadmap as the origin is fine; citing it as a supplier is not.

Not verified: the claim that Bhargava's Proposition 2.1 is the class-level form of §0.6. The paper (IMRN 2007, doi 10.1093/imrn/rnm052) has no legal copy the sources service can read (HTTP 403). No statement here cites it, so no reference request was filed.

## H02 (0stellensatz) — answered

A review of the new roadmap's pull request happens on that pull request and needs no change here. When it opens, check it against the three conditions in H01: the weighted identity, the bijection and automorphism count kept as targets, and no citation of this roadmap.

## Adversarial pass (statements the answer relies on; no statement was changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Transitive mass `q^{f−n}/f` from §0.6 + Serre Thm 1 over `K_f` | `K = ℚ_2`, `n = 2`, `f = 1` | 6 ramified classes: 2 with `d = 2` (Aut 2) and 4 with `d = 3` (Aut 2); `2·(1/2)·2^{-2} + 4·(1/2)·2^{-3} = 1/4 + 1/4 = 1/2 = 2^{1−2}/1` | holds | none |
| same | `K = ℚ_2`, `n = 2`, `f = 2` | one class `ℚ_4`, `d = 0`, `#Aut_{ℚ_2} = 2`: `1/2 = 2^{2−2}/2` | holds | none |
| Unweighted §0.6 identity, equal characteristic | `K = 𝔽_2((t))`, `n = 2`, `f = 1` | infinitely many Artin–Schreier classes, each `1/#Aut = 1/2`: both sides `∞` | true but carries no information; supports condition 1 | none here |
| Orbit count used in 6.5: `#(K_f-classes in a K-class) = f/#Stab` | `ℚ_2(ζ_12)` (fixed class), `ℚ_2(∜−3)` (moved class), `f = 2` | `2/2 = 1` and `2/1 = 2`; `#Aut_{ℚ_2} = 2·2 = 4` and `1·2 = 2`, as in §0.6's Checks | holds | none |
| §0.6 degree totals | `(p, n) = (2, 2), (3, 3), (2, 4)` | `6 + 1 = 7`, `9 + 1 = 10`, `48 + 10 + 1 = 59` | agree with 6.7's totals | none |

Elaborated signatures: `Suggested.lean` is unchanged, so the 39 elaborated types in the scratch `signatures.md` still apply. No `#check` pass was rerun, since no declaration changed. The six declarations it flags were not part of this comment and were not revisited.

Ownership against open pull requests: checked with `roadmaps grep` over every open head and main for the étale (Bhargava) mass formula and for an `EtaleMassFormula` folder. There are no hits except the uses in ArithmeticStatisticsPartV described in H01. The `EtaleMassFormula` pull request is not open yet.

## Build and gate

- `lake build TauCetiRoadmap.PadicExtensionFamilies.Suggested`: `Build completed successfully (9037 jobs).` The only warnings are the expected `declaration uses 'sorry'`.
- Gate summary line: `gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The single failure is the depcheck line below.
- Depcheck output:

  ```text
  NOT IN ORDER: PadicExtensionFamilies (insert it after its last supplier)
  depcheck: 204 roadmaps, 1645 edges, 1 problem(s)
  ```

  There is no UPWARD and no CYCLE line. "NOT IN ORDER" is the design-stage case (the roadmap is inserted after its last supplier at intake), not a defect.
