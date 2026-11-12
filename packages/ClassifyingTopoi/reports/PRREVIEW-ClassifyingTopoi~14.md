# Review of ClassifyingTopoi (pull request #1997 at 8b842c8)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README line 292, "Define also, as API, the relabelling `φ[g]` of a geometric formula `φ` along `g : Fin n → Fin m`"; `φ[Fin.castAdd k]` (295), `φ[g].Realize x` (334), `M.interp φ[g]` (432), `ψ[Fin.castAdd 1]` (574), "the relabelling of formulas" (547, 554, 597). No `GeometricFormula.relabel` remains.
- R02 — repaired: the description now says "The last three commits change only the README", naming the third as writing the relabelling as `φ[g]`; it has "for 1.4 and 2.2 (b)", Stacks Project Tag 00QO under open copies, and the relabelling in the Layer 1 bullet.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `φ[g]`, Check (lines 307–310) | `ex (equal (var 0) (var 1 * var 1))`, `g = Fin.castAdd 1 : Fin 1 → Fin 2` | extension `0 ↦ 0`, `1 ↦ 2`: `∃x₂, x₀ = x₂²`, true at `(4, 7)`, false at `(2, 7)`; extending by `castAdd` instead: `x₀ = x₁²`, `4 ≠ 49` | holds | — |
| 1.1, non-injective and empty `g` | constant `g : Fin 2 → Fin 1`; `g : Fin 0 → Fin 1` on `ex top` | `equal (var 0) (var 1)` becomes `equal (var 0) (var 0)`, true everywhere; `ex top` true at every `x : Fin 1 → M`, as at `x ∘ g` | holds | — |
| 1.1 against Tau Ceti `BoundedFormulaInf.mapBound` | the Check's formula and its `toInf` | `mapBound` extends `f` by last ↦ last, as 1.1 does; both put `var 2` under the binder. It acts on `L_∞ω`, not on `GeometricFormula` | same convention; no duplicate | — |
| 1.2 `φ[g].Realize x ↔ φ.Realize (x ∘ g)` | swap of `Fin 2`, `φ = equal (var 0) 0` in `ℤ`; the `ex` step | at `(0, 5)`: `x₁ = 0` false, `φ` at `(5, 0)` false; at `(5, 0)` both true. `Fin.snoc x a ∘ g'`: `a` at last, `x (g i)` at `castSucc i` | holds | — |
| 1.4 `M.interp φ[g] = (Subobject.pullback p).obj (M.interp φ)` | `Type u` on `ℤ`: swap with `equal (var 0) 0`; constant `Fin 2 → Fin 1` with `equal (var 0) (var 1)` | `p x = (x₁, x₀)`: preimage `{x₁ = 0}`, the interpretation of `equal (var 1) 0`. `p` diagonal: preimage of `Δ` is `⊤`, the equalizer of `id, id` | holds | — |
| 1.4, the `ex` square | any `g`; `M.pow (k + 1) = M.pow k × M` | square of `p × id`, the two projections and `p`: `Mᵐ ×_{Mⁿ} (Mⁿ × M) ≅ Mᵐ × M`, a pullback for non-injective `g` too | holds | — |
| 2.2 (b) Check, `and (ex θ) ψ` to `ex (and θ ψ')` | `ℤ`, `θ = (x₀ = y·y)`, `ψ = (x₀ = 4)`, `ψ' = ψ[Fin.castAdd 1]` | `x₀ = 4`: both sides true; weakening onto `y` instead: `∃y, 4 = y² ∧ y = 4` false. `x₀ = 9`: all false | holds | — |
| 2.3 route, `exs χ ⊢ ψ` iff `χ ⊢ ψ[Fin.castAdd m]` | `ex (x₀ = y·y) ⊢ ex (x₀ = y + y)` in `ℤ` and `ℤ/3` | `ℤ`: fails at `x₀ = 1`, weakened sequent fails at `(1, 1)`. `ℤ/3`: `2` invertible, both hold | holds | — |
| 2.2 (b), 2.3 locator | Caramello2017Lattices p. 81, proof of Theorem 17.6 (lines 2928–2941, read from the page image) | cites Elephant D1.3.10: geometric theories axiomatized by `ψ ⊢ ⋁ (∃x̄ᵢ) θᵢ`, `ψ`, `θᵢ` cartesian; cartesian `θᵢ` prenex to `exs` of Horn | supports | — |
| 2.3 locator | Caramello2017Lattices Remark 3.7, p. 19, lines 638–658 | the classifying topos of a quotient as sheaves on the cartesian syntactic category, from added axioms `ψ ⊢ ⋁ ∃ θᵢ` | supports | — |

The rows for the untouched statements stand as in the previous review, of `a49e1ce`.

- Source locators checked against the text: 2, both in Caramello2017Lattices (arXiv:0905.0299v1): proof of Theorem 17.6, p. 81 (the OCR of that page is garbled, so it was read from the rendered page), and Remark 3.7, p. 19.
- Library declarations opened at the pins: Mathlib `ModelTheory/Syntax.lean:117` (`Term.relabel`), `ModelTheory/Semantics.lean:86` (`Term.realize_relabel`, with `v ∘ g`), `CategoryTheory/Subobject/Basic.lean:572` (`Subobject.pullback`); core `Fin.castAdd (m) : Fin n → Fin (n + m)`; Tau Ceti `ModelTheory/Infinitary/Operations.lean` (`BoundedFormulaInf.mapBound`) and `Substitution.lean:151` (`relabel`, which relabels free variables, not context slots).
- Cross-roadmap citations resolved: GrothendieckTopoi 1.2 (line 320 at its head: `Subobject.pullback f` a frame homomorphism; every epimorphism effective) and 1.4 (line 362: universal coequalizers of internal equivalence relations).
- Gate rerun at 8b842c8: every check 0, OK. Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty: the PROGRESS.md and STATUS.md files in the change list are main's, brought in by the merge of main.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 27 `sorry` warnings and nothing else. The file is unchanged since 6e9cb0f. The 7 signature leads are false positives: each elaborated type carries `[Category.{u_3, u_4} E]`.
- Pull request text: the title and the description were read against 8b842c8. Nothing in them is contradicted, and the change since a49e1ce (README only, the notation `φ[g]`) is stated.
- Overlap check: read GrothendieckTopoi, TotallyDistributiveTopoi, HigherToposTheory (open) and InfinitaryLogic (main) this round, and LocallyPresentableCategories and HomotopyTheoryOfCategories in the previous review. The shared objects are cited from their owners: subobject frames and Giraud's axioms from GrothendieckTopoi, `Ind A` from LocallyPresentableCategories, `BoundedFormulaInf` from InfinitaryLogic through Tau Ceti. A search of main and the open heads finds no other relabelling of geometric formulas.

## Not verifiable

- Johnstone, Elephant, D1.1, D1.2 and D1.3.10, and Mac Lane–Moerdijk, X.1–X.3 (the locators of 1.1 and 1.4): paywalled (OUP, Springer), with no open copy. D1.3.10 was checked through Caramello2017Lattices p. 81.
- Makkai–Reyes, LNM 611, pp. 272–297 (2.3): Springer paywall.

## Source issues

- **Misprint** in Caramello2017Lattices at the proof of Theorem 17.6, p. 81: the source writes the classifying topos of a cartesian theory as covariant functors on its cartesian syntactic category; it should be presheaves on that category, equivalently functors on finitely presentable models; affects nothing.
