# Review of LieHighestWeight (pull request #1797 at ff51f30)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** accepted

This is an incremental re-review of the 13 lines changed since ad05d6a (8 insertions, 5 deletions). They fall in three places:

- `README.md:1045–1047` (§7.5);
- `README.md:1343–1345` (§8.5);
- the docstring of `serreLift_injective_of_base`, `Suggested.lean:75–77`.

No Lean statement changed. No file outside the folder changed.

This report raises no finding.

- The previous report's only finding, R01, is unrepaired. The repair reply to that review marks it (as H01) "not actionable in this package" and gives a reason, and the reason holds. Under the brief's rule on settled findings, R01 is therefore not re-raised.
- The previous report's remark on untouched text (Theorem 24.2 "over `ℂ`") is now corrected, and the correction is exact.

## Previous findings

- R01 — not repaired: `README.md:106–123` is unchanged: "The centre theorem for a compact connected semisimple Lie group `G` … is not part of this roadmap either … so a section here consuming them would close a cycle."
  - **The finding is settled, not re-raised.** The repair reply (H01) says the owner must come later than both LieGroups and ConvexityToric. Both placements the r39 review proposed are edits to folders this pull request does not carry.
  - **The reason holds.** I checked it against the head and against main:
    - **ConvexityToric T1** is on main at `SymplecticGeometry/ConvexityToric/`. That folder is not in the pull request.
    - **The LieHighestWeightPartII package** (merge order line 240) is a board package. Its `README.md` and design never state `Z(G) ≃ P∨/Y`. Naming it as owner from here would cite a statement it does not make.
    - **GeometricTopology**, the pull request's other folder, has no Lie-theoretic scope.
    - **Keeping the target here is not an option.** Main's subsection "Late compact-center application in LieGroups" (main `README.md:1726–1758`) consumes LieGroups Layers 4 and 6–7. LieGroups consumes this roadmap, so keeping that subsection would keep a cycle.
  - **No owner exists yet.** `roadmaps grep 'P∨ */ *Y'` over main and the 450 open heads matches only this roadmap: main `:1707`/`:1747`, the revision #1220 at `:2765`/`:2820`, and this head at `:107`.
  - **What it means for the human approver.** Once this merges, the theorem is unplanned until a revision of ConvexityToric or the LieHighestWeightPartII package takes it on, with the hypotheses and instances that r39's R01 sets out.

## Verified sound

### Gate, dependencies, elaboration

- **Worker's gate** (`gate.md`): every check is 0, `build=0`, "Every check passed."
- **My rerun of the gate command:**
  - Every scanner is 0 except `outside-folder=2`.
  - Both hits are `TauCetiRoadmap/GeometricTopology/README.md` and `Suggested.lean`. The brief names that folder as the pull request's own, and the worker's gate, which knows the pull request's folders, passes.
  - The brief's `git diff --stat origin/main...HEAD` with its exclusions is empty. `git diff --stat ad05d6a HEAD` touches only `README.md` (8 lines) and `Suggested.lean` (5 lines) in this folder.
- **Dependency check:** `depcheck: 233 roadmaps, 2267 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 10 warnings, all `declaration uses sorry`. They are at lines 78, 96, 104, 113, 119, 125, 130, 135, 147 and 164: each is one line lower than at ad05d6a, because the docstring at 75–77 grew by one line.
- **`#check @` audit:** a scratch file importing the built module checks `serreLift_injective_of_base`, `finrank_e₆`, `finrank_e₇` and `finrank_e₈`.
  - **`serreLift_injective_of_base`** elaborates to:
    - binders `[Field K] [CharZero K]`, `[FiniteDimensional K L] [LieAlgebra.IsKilling K L]`, `[H.IsCartanSubalgebra]` and `[LieModule.IsTriangularizable K ↥H L]`;
    - the hypothesis `hS : TauCeti.IsSerreSystem K base.cartanMatrix.transpose (coroots) e f` and the `lieSpan … = ⊤` hypothesis;
    - the conclusion `Function.Injective ⇑(TauCeti.serreLift hS)`.

    This matches §7.5 (`README.md:1033–1047`) binder for binder.
  - **The three `finrank_e` theorems** elaborate to `∀ K [Field K] [CharZero K], Module.finrank K (LieAlgebra.eₙ K) = 78 / 133 / 248`. This matches §8.5 (`README.md:1340–1343`), "over every field of characteristic zero".
  - Nothing changed between the elaborated types and `signatures.md`.
- **Carried forward:** no statement changed, so the r39 one-tactic padding probe and headline count still stand: 10 summary headlines and 10 theorems.

### The changed passages

- **§7.5, `README.md:1045–1047`:** "over an algebraically closed field of characteristic zero fixed in §24.1, p. 120, line 4766". In EtingofLieGroupsLieAlgebras:
  - Line 4766 opens §24.1 and fixes `k` as algebraically closed of characteristic zero.
  - The printed "120" at line 4776 closes that page, so p. 120 is right.
  - Theorem 24.2 is at line 4818. The page break is at 4817 and the printed "122" at 4854, so p. 122 is right.
  - The proof's reduction `g(R₁ ⊔ R₂) = g(R₁) ⊕ g(R₂)` is at line 4827, as cited.
- **§8.5, `README.md:1343–1345`:** "Theorem 24.2(iv), p. 122, line 4826, over an algebraically closed field of characteristic zero". Part (iv), "semisimple with root system R", is at line 4826 on p. 122.
- **`Suggested.lean:75–77`:** the docstring's parenthetical now describes the source's setting, and agrees with the README.
- **Generality:** the README and the Lean work over any characteristic-zero field with a split Cartan. That is wider than the source's closed field, and it is not a narrowing.
  - The §7.5 route (`README.md:1048–1069`) uses only split `sl₂` theory over characteristic zero: `TauCeti.finrank_eigenspace_toEnd_neg` and `exists_isSerreSystem_of_base`.
  - The §8.5 route passes to `K` through `TauCeti.DynkinType.lieAlgebraBaseChangeEquiv`.
  - No other "over `ℂ`" attribution of Theorem 24.2 remains: `grep '24\.[0-9]'` finds lines 1045, 1054, 1063, 1344 and 1657 and `Suggested.lean:75`. The two remaining "over `ℂ`" hits (`README.md:70` and `:1449`) concern `GLₙ` and are correct there.
- **Library at the pin:**
  - `TauCeti.serreLift` is at `Algebra/Lie/Presentation/Serre.lean:507`.
  - `serreLift_surjective` is at `:601`.
  - `serreLift_lieBasis_surjective` is at `Presentation/Serre/Basis.lean:115`.
  - The pin has no injectivity theorem, so the target is not already proved (Loogle `TauCeti.serreLift`: no hits).
- **Seeded sample:** none of the 15 seeded targets falls in the changed passages, which are in §7.5 and §8.5. As spot checks I re-read §5.2 and §6.1:
  - Theorem 18.8 is at line 3704 on p. 93 (printed "93" at 3733).
  - Lemma 25.16 is at line 5072 and Theorem 25.17 at 5088, both on p. 128 (printed "128" at 5103).
  - Both locators are exact.

### Ownership, overlaps, description, citations

- **Ownership:** the changed text claims no new object. The centre theorem's lack of an owner was rechecked above, against main, the 450 open heads, and the board packages LieHighestWeightPartII and LieGroupsPartII.
- **Overlaps** (`overlaps.md`):
  - #1220 conflicts with this pull request. The order "this pull request → #1220" is stated in the description and in the `merge-order` block.
  - No id is dropped, none is defined only by an open revision, and this pull request drops no id that others cite.
- **Description:** "The README takes the house shape and consumes Tau Ceti's Weyl-group, coweight and Serre-presentation developments" still matches the head.
- **Citations:** the 6 leads in `citations.md` are source keys used in locators, not roadmaps.

### Adversarial table

The rows marked "changed" were computed this round. The rest are carried from the r39 report, which in turn carried values from r37 and r38.

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| `serreLift_injective_of_base`, source setting (changed) | line 4766 vs the Lean binders | source: `k` closed, characteristic 0; Lean: `[CharZero K]` + `[IsTriangularizable K H L]` | the attribution is exact; the Lean is wider than the source and supported by the split route |
| same, non-closed split field (changed) | `sl₂(ℚ)`, diagonal `H` | presented `A₁`: `1 + 2 = 3`; `dim sl₂ = 3`; after `⊗ ℚ̄`: `3 = 3` | injective |
| same, non-split control (changed) | `so(3, ℝ)`, `H = ℝ·J` | char. poly of `ad J` is `t(t² + 1)`, eigenvalues `0, ±i ∉ ℝ` | excluded by `IsTriangularizable`, which is what replaces algebraic closure |
| same, reducible root system (changed) | `sl₂ × sl₂` over `ℚ` | line 4827: `g(A₁ ⊔ A₁) = g(A₁) ⊕ g(A₁)`, `3 + 3 = 6`; `2 + 4 = 6` | holds |
| `finrank_e₆/₇/₈`, attribution (changed) | `K = ℚ`, `ℚ(√2)`, `ℂ` | `6 + 72 = 78`, `7 + 126 = 133`, `8 + 240 = 248` for each `K`, since base change of the presentation keeps the dimension; wrong model "rank + positive roots": `42`, `70`, `128` | holds; the wrong model is excluded |
| Changed locators (changed) | EtingofLieGroupsLieAlgebras | §24.1 at 4766, "120" at 4776; Thm 24.2 at 4818, "122" at 4854; (iv) at 4826; proof at 4827 | exact |
| `Z(G) ≃ P∨/Y` (r39; settled, H01) | `SU(2)`, `SO(3)`, `SU(3)`, `SO(4)`, trivial group | `{±I}`, `ℤ/2 = ℤ/2`; `1 = 1`; `ω²I`, `det A₂ = 3`; `(ℤ/2)²/Δ = ℤ/2`; rank 0: `1` | true; not owned, settled as not actionable here |
| Semisimple hypothesis (r39) | `U(1)` | `t/Y = U(1)`, which is infinite | the hypothesis is needed |
| `Γ_Y`-equivariance (r39) | `SU(3)`; `SO(4)`; `SO(8)` | `C₂` inverts `ℤ/3`; the swap fixes the diagonal; stabilizer `C₂ ≠ S₃` | `Γ_Y`, not `Γ_root`, is needed |
| `Y/Q∨` stabilizer versus centre (r39) | `SU(2)`, `SO(3)` | stabilizer `0`, `ℤ/2`; centre `ℤ/2`, `1` | holds ("orders reversed") |
| `[P∨ : Q∨] = \|det A\|` (r39) | `A₁`, `A₂`, `B₂`, `G₂` | `2 = 2`; `3 = 3`; `2 = 2`; `1 = 1` | holds |
| Centre paragraph and §10.1 locators (r39) | EtingofLieGroupsLieAlgebras | Thm 43.4 at line 8891, "216" at 8899; Cor 43.5 at 8914, "217" at 8939; (iii) at 8919–8924; §21.6 at 4313–4334, p. 109 | exact |
| §7.5 chain, positive and negated (r38) | `G₂` `θ`, `B₂`, `A₂`, `A₁` | heights 5, 4, 1; 3, 1; 2, 1; empty; negated −5, −4, −1 | holds |
| §7.5 Mathlib hypotheses (r38) | `rootSystem H` | `Base.lean:537` `[CharZero R]`; `:692` `[Finite ι] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]` | holds |
| §7.5 graded pieces and `sl₂` symmetry (r37) | `G₂` `4α₁ + 2α₂`; `B₂`; `V(1)`, `V(2)` | goes to `2α₁ + 2α₂`, then to `2α₁`, which is `0`; `10 = dim so₅`; `1 = 1` | holds |
| `serreLift_injective_of_base` (r37) | `A₁`; `sl₂ × sl₂`; `B₂` transpose | `3 = 3`; `6 = 6`; `−e₂` vs `−2e₂` | holds |
| §3.2, §6.2, §9.1, §0.2 (r37) | Rees kernel; dominant set; `gl₂`, Heisenberg; `V(1) ⊗ V(1)` | `t` in the kernel; `{2ϖ, 0}`; reductive / not; `4 = 3 + 1` | holds |
| §1.1–§2.2, §3.1, §5, §6.1–§6.3, §7.1–§7.3 (r37) | `sl₃`, `A₂`, `G₂`, `sl₂` PBW and Casimir | `8 = 2 + 6`; `det = 3`; `dim F₂ = 10`; `n(n+2)/8`; Kostant `2`; `t² + 2t` vs `t² − 1` | holds |
| Layer 8 headlines (r37) | characteristic 0; `ℝ` | `14`; `52 = 4 + 48`; negative definite; `78, 133, 248` | holds |
| LR headline (r37) | `N = 2`, `λ = μ = (1)` | `(2)`: 1, `(1,1)`: 1; `4 = 3 + 1` | holds |
| `existsUnique_…ToPerm_mul`, §10.3 (r37) | `A₂`; `B₂`; `D₄`; `E₆` | `π(ω) = (0 1 2)`; `2`; `24 = 4·6`; `6 = 3·2` | holds |

## Not verifiable

- HumphreysIntroLieAlgebras §18.3, cited in the changed §7.5 sentence and in the docstring: the manifest records it as uncertified (paywalled), so it is cited by locator only and was not read.

## Source issues

- none
