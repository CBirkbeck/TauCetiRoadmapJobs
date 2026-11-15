# Review of K2SymbolsBrauerPartII (pull request #1432 at d3eace4)

**Verdict:** needs changes

## R01 (P3) — Gate fails `statement-hygiene`: `symbolAlgebra_split` concludes a bare `Nonempty` isomorphism

**Location** `TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean` line 67: "`Nonempty ((L ⊗[F] SymbolAlgebra F m ζ a b) ≃ₐ[L] Matrix (Fin m) (Fin m) L)`".

**Claim** The push gate fails on this headline. A bare `Nonempty` drops the specified generator images promised by README §2.2's API bullet at line 334 ("It sends the named generators to the displayed diagonal and shift operators").

**Witness** Gate at d3eace4: "line 67: P3 theorem `symbolAlgebra_split` concludes `Nonempty (…)`; repair: state the canonical map and `IsIso` of it". The `Nonempty` also holds for the opposite presentation XY=ζYX, which is split by the same L.

**Repair** Replace `Suggested.lean` lines 60–68 with the following. The name stays the same, so README line 337 needs no change.

```lean
/-- README §2.2: over any field extension `L` of `F` containing an `m`-th root `α` of `a`,
the `L`-algebra map sending `X` to `diag(α ζ^(-i))` and `Y` to the forward shift with wrap
factor `b` (`Y v_i = v_(i+1)`, `Y v_(m-1) = b v_0`) is bijective, so
`L ⊗_F A_ζ(a,b) ≃ Mat_m(L)`. No root of `b` is required. -/
theorem symbolAlgebra_split {F : Type*} [Field F] (m : ℕ) (hm : 2 ≤ m)
    (hmF : IsUnit (m : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ m) (a b : Fˣ)
    (L : Type*) [Field L] [Algebra F L] (α : L) (hα : α ^ m = algebraMap F L (a : F)) :
    ∃ f : (L ⊗[F] SymbolAlgebra F m ζ a b) →ₐ[L] Matrix (Fin m) (Fin m) L,
      f (1 ⊗ₜ RingQuot.mkAlgHom F (SymbolRel F m ζ a b) (FreeAlgebra.ι F 0)) =
          Matrix.diagonal (fun i : Fin m => α * algebraMap F L ζ⁻¹ ^ (i : ℕ)) ∧
        f (1 ⊗ₜ RingQuot.mkAlgHom F (SymbolRel F m ζ a b) (FreeAlgebra.ι F 1)) =
          Matrix.of (fun i j : Fin m => if (i : ℕ) = j + 1 then 1
            else if (i : ℕ) = 0 ∧ (j : ℕ) + 1 = m then algebraMap F L (b : F) else 0) ∧
        Function.Bijective f := by
  sorry
```

How the repair was tested: `lake env lean` elaborates it at the pins with only the `sorry` warning. The generator images satisfy all three `SymbolRel` relations (see the table). The conclusion is an `∃` over an `AlgHom`, which the rule's `Nonempty`/`∃ e : A ≃ B` patterns do not match.

## R02 (P3) — The description's summary narrows the conic/Hilbert headline to local fields

**Location** Pull request description, `<!-- roadmap-summary -->`, first paragraph: "Locally it proves the signed formula linking norm-residue symbols to inv β_ζ and identifies `conicSymbol` with `hilbertSymbol` on units".

**Claim** The head proves the conic/Hilbert identification over every field of characteristic different from two, not over local fields only. The summary also leaves out the characteristic hypothesis.

**Witness** `Suggested.lean` lines 101–106: "over every field of characteristic different from two … No local-field hypothesis", with `(h2 : (2 : F) ≠ 0)`. README line 511: "prove `conicSymbol_eq_hilbertSymbol` for every field F with (2:F)≠0". Over ℚ, (3,−1), both sides are −1.

**Repair** Replace that sentence with: "Over nonarchimedean local fields it proves the signed formula linking norm-residue symbols to inv β_ζ; over every field of characteristic not two it identifies `conicSymbol` with `hilbertSymbol` on units, and over ℝ it proves the total real criterion."

## Previous findings

- none: the review of `d3eace4` raised no finding. That review's gate run had no `statement-hygiene` check; this round's gate has one, and R01 is its hit on text that did not change.

## Verified sound

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| `symbolAlgebra_split` as it stands (`Nonempty`) | ℝ, m=2, a=b=−1, L=ℂ, α=i | X↦diag(i,−i), Y↦[[0,−1],[1,0]]: X²=Y²=−I; YX=[[0,i],[i,0]]=−XY; ℂ⊗ℍ≅M₂(ℂ) | true, but also true for any L-split degree-m algebra: the generator images are not pinned (R01) |
| R01 restatement: generator images respect `SymbolRel` | m=2,3,4,5,6; ζ=e^(2πik/m), k=1 and m−1; a=2.7−1.3i, b=−0.6+2.2i | X^m=aI, Y^m=bI and YX=ζXY all hold, up to 1e−9, for diag(αζ^(−i)) and the forward shift with wrap b | the lift `f` exists; the statement is satisfiable |
| R01 restatement, wrong model (backward shift) | m=3, Y e_i=e_(i−1) | YX e_i=αζ^(−i)e_(i−1), ζ·XY e_i=αζ^(−i+2)e_(i−1): YX=ζ⁻¹XY | excluded at m=3 (ζ²≠1) by the stated Y image |
| R01 restatement, degenerate a=α^m in F | ℚ, m=2, a=4, α=2, b=3, L=ℚ | X↦diag(2,−2), Y↦[[0,3],[1,0]]: X²=4I, Y²=3I, YX=[[0,−6],[2,0]]=−XY | ℚ-split Mat₂(ℚ), matching §2.2's first Check |
| `conicSymbol_eq_hilbertSymbol`, non-local field | ℚ, (r,s)=(3,−1) | conic 3x²−y²=1: insoluble mod 3, value −1. `hilbertSymbol 3 (−1)`: −1=x²−3y² insoluble mod 3, value −1 | equal over a non-local field: the headline is field-generic (R02) |
| same | ℚ, (2,−1) | conic: (1,1) gives 2−1=1, value 1; Hilbert: −1=1²−2·1², value 1 | equal |
| same, characteristic 2 | 𝔽₂(t), (1,t) | conic: point (1,0), value 1; x²−y²=(x+y)²≠t, Hilbert −1 | differ; `h2` excludes this, and R02's repair names the hypothesis |

Rows for the untouched statements stand as in the previous review, of `d3eace4`.

- Gate (my run at d3eace4): `set_option=0 … statement-hygiene=1 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. R01 is the only failing check; the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The outside-folder diff against `origin/main` is empty, and the worktree is clean at d3eace43.
- Elaboration: `lake env lean` on a scratch copy with `#check @` for all 8 declarations exits 0. The only warnings are the five `sorry`s (lines 54, 64, 75, 97, 104). All 8 elaborated types agree with `scratch/signatures.md`, with every binder present. The R01 restatement elaborates too.
- Pull request text: the title, the 3 summary paragraphs and the 5 prose paragraphs were read against the head. 1 sentence fails (R02). The cubic-witness claim was checked: Artin sign README line 550, residue sign lines 264 and 268, Chern sign line 905, all at Q₇, m=3. The supplier partition was checked: 6 suppliers on main, 8 open suppliers, consumers RefinedTraceMethods and EllipticKTheory. The validation figures were checked against the gate.
- Library: `TauCeti.hilbertSymbol` at Tau Ceti a91d3aa, `NumberTheory/HilbertSymbol/Basic.lean:46`: value 1 iff b=x²−ay² is soluble. It is defined for every field, with no local hypothesis.
- Supplier sections resolved this round: K2SymbolsBrauer §§7.1, 8.1, 10.32a–c and 12.5; KTheoryFiniteLocalFields §§1.8, 2.2, 3.0a and 3.1; ArithmeticKTheory §§6.1, 6.3 and 6.13, all at their open heads; QuadraticFormInvariants 6C on main.
- Sources: the folder diff is empty, so no seeded target falls in it. Their locators stand on the verification of the earlier rounds.
- Remarks on untouched text (no change asked): README lines 112 and 495 describe `Suggested.lean` as stating only the conic/Hilbert equality and the real criterion, but it also states the three Layer 2 headlines. `symbolAlgebra_matrix_corner` (line 81) nests the same `Nonempty (… ≃ₐ[F] …)` inside a conjunction; the gate does not flag it.

Overlap check: read K2SymbolsBrauer, KTheoryFiniteLocalFields, ArithmeticKTheory, EllipticKTheory, K3BlochGroups (open) and QuadraticFormInvariants (main).
- K2SymbolsBrauer §10.32a owns the prime-degree local function-field symbol presentation; Layer 2 extends it on the common domain.
- KTheoryFiniteLocalFields §3.1 owns the local K₂ norm-residue map.
- ArithmeticKTheory §§5.2, 6.1 and 6.3 own the S-integer comparisons.
- QuadraticFormInvariants §6C owns the unit-input Hilbert symbol.
- EllipticKTheory and K3BlochGroups share nothing. A search for `SymbolAlgebra`, `conicSymbol` and "symbol algebra" across main and the open heads finds no other owner.

Source independence: changed passages only, and 0 lines changed, so no passage was compared. No layer was added, removed or reordered, so the arrangement was not compared again. The largest share is Weibel's, 21 of 50 author-and-locator citations; the earlier rounds compared the contents with Weibel's and found them independent.

## Not verifiable

- The gate's `statement-hygiene` scanner runs on a worktree only, so it was not run on the R01 restatement. The restatement was checked against the rule's text and by elaboration.
- The printed page p.242 of Weibel III.6.10.1 is not visible on the cached page; it is carried from the earlier rounds.

## Source issues

- none

## For the human reviewers

- none
