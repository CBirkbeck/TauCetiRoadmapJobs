# Review of ClassifyingTopoi (pull request #1997 at a49e1ce)

**Verdict:** needs changes

## R01 (P3) — `GeometricFormula.relabel` is backticked as a declaration, and `Suggested.lean` does not declare it

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` line 292: "Define also, as API, `GeometricFormula.relabel` along `g : Fin n → Fin m`". Also lines 295, 310, 334, 432, 547, 554, 574 and 597.

**Claim** A backticked name of the roadmap's own states that `Suggested.lean` declares it. The repair of the previous R01 introduced this name (the repair text of that review used it too), and it is the only such name of the README without a declaration. The gate's `readme-ids-missing` does not see it, because `relabel` occurs at the pins as `Term.relabel`.

**Witness** `Suggested.lean` contains `relabel` only at lines 133–134, as Mathlib's `Term.relabel Sum.inr` inside `toInf`. Of the README's backticked `GeometricFormula.*`, `CatStructure.*`, `SetModel.*` and `IsClassifyingSite.*` names, every other one is among the file's 84 declarations.

**Repair** Keep the API as prose with a notation instead of a Lean name. Line 292: "Define also, as API, the relabelling `φ[g]` of a geometric formula `φ` along `g : Fin n → Fin m`: …". Then write `φ[Fin.castAdd k]` (295), "Relabelling moves the bound variable" (310), `φ[g].Realize x ↔ φ.Realize (x ∘ g)` (334), `M.interp φ[g] = …` (432), `ψ[Fin.castAdd 1]` (574), and "the relabelling of formulas (1.1, API)" at 547, 554 and 597. `t.relabel g` for terms stays: it is Mathlib's `Term.relabel`.

## R02 (P3) — the description is written for the previous head

**Location** Pull request description, Acceptance test: "The last commit changes only the README: the supplier contracts, the *Needs:* lines, Scope and the layer Dependencies now name the same Mathlib and Tau Ceti declarations and the same roadmap sections." Also Sources, "Read in open copies", and the contract list, "1.4 (Giraud's axioms: … for 2.2 (b))".

**Claim** The last commit is now a49e1ce. It adds the relabelling of formulas as API (1.1, 1.2, 1.4), cited by 2.2 (b) and 2.3, a new source (Stacks Project, Tag 00QO) for 4.1, and a use of GrothendieckTopoi 1.4 in target 1.4. The description states none of these.

**Witness** `git diff fb294c4 a49e1ce --stat`: `README.md`, 80 insertions, 30 deletions. README line 245: "under pullback, for 1.4 and 2.2 (b))". README lines 1252–1253 add the Stacks Project to References; the description's source list does not have it.

**Repair** Replace the quoted sentence with: "The last two commits change only the README. The first brings the supplier contracts, the *Needs:* lines, Scope and the layer Dependencies into agreement. The second adds the relabelling and weakening of formulas as API (1.1), with its realization (1.2) and its interpretation as a pullback (1.4), cited by 2.2 (b) and 2.3; cites Stacks Project Tag 00QO in 4.1; and names in Scope the other roadmaps that mention a classifying topos." In the contract list write "for 1.4 and 2.2 (b)". Under "Read in open copies" add: "The Stacks Project, Tag 00QO (Algebra, Lemma 10.127.3), for 4.1." In the Layer 1 bullet add "and formulas are relabelled along maps of contexts, with the interpretation of a relabelled formula the pullback" to the API sentence.

## Previous findings

- R01 — repaired: 1.1 defines the relabelling and the weakening `Fin.castAdd k`, 1.2 its realization, 1.4 its interpretation as `Subobject.pullback p`; 2.2 (b), its Check and 2.3 cite them in text and *Needs:*. The name it introduces is R01 of this report.
- R02 — repaired: line 1103, "Stacks Project, Tag 00QO, Lemma 10.127.3, (2) ⇒ (1) for `ℤ → S`, directed systems in `Type u` being filtered diagrams", and the reference at lines 1252–1253.
- R03 — repaired: lines 61–64 name AdicSpacesPartIV, AlgebraicModuliForArithmeticGeometry, AnabelianGeometryAndNonabelianChabauty, HomotopyTheoryOfCategories and KTheoryFiniteLocalFields, "the classifying topos of a group, finite, profinite or algebraic".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 relabelling, Check (line 310) | `ex (equal (var 0) (var 1 * var 1))`, `g = Fin.castAdd 1 : Fin 1 → Fin 2` | extension sends `0 ↦ 0`, `1 ↦ 2`: `∃ x₂, x₀ = x₂²`; `(4, 7)` true, `(2, 7)` false. Without moving the last variable: `x₀ = x₁²`, `4 ≠ 49` | holds | R01 (name only) |
| 1.2 realization of a relabelled formula | `equal (var 0) 0` weakened to `Fin 2`; `ex` case | `x ∘ Fin.castAdd 1` at `(0, 5)` is `0`, at `(5, 0)` is `5`; `Fin.snoc x a ∘ g' = Fin.snoc (x ∘ g) a` on both the first `n` and the last index. Mathlib `Term.realize_relabel` has this direction | holds | — |
| 1.4 interpretation of a relabelled formula | same formula on `ℤ` in `Type u`; `ex` square; `iSup` | `p = ` first projection, preimage of `{0}` is `{x₀ = 0}`, has `(0, 5)`, not `(5, 0)`. Square: `Aᵐ⁺¹ = Aᵐ × A` over `Aⁿ⁺¹ = Aⁿ × A`, a pullback. Joins: GrothendieckTopoi 1.2 states `Subobject.pullback f` is a frame homomorphism | holds | — |
| 1.4, direction of `p` | `g : Fin n → Fin m` | `p : M.pow m ⟶ M.pow n`, `p ≫ M.termMap t` has source `M.pow m`, as `t.relabel g : Term (Fin m)` needs; for `g = Fin.castAdd 1`, `p` is the projection of Convention 2 (`i.castSucc`) | consistent | — |
| 2.2 (b), `and` case | `(∃ y, θ) ∧ (∃ z, θ')` with `m i = m' j = 1` in `Type u` | context `n + (1 + 1)`: `θ` on the first `n + 1`, `θ'` on the first `n` and the last; `(∃y θ(x,y)) ∧ (∃z θ'(x,z)) ↔ ∃y z, θ(x,y) ∧ θ'(x,z)`; conjunction of atomic formulas stays Horn; `exs` over `n + (m + 1) = (n + m) + 1` | holds | — |
| 2.3 route, the two weakenings | axiom `φ ⊢ ψ`, disjunct `exs χ` with `χ` in `Fin (n + m)` | `ψ' = ψ` relabelled by `Fin.castAdd m`; `∃ȳ χ ⊢ ψ` iff `χ ⊢ ψ'` (adjunction `∃ ⊣` pullback); `χ'` in `Fin (n + mᵢ)` for the covering family | holds | — |
| 4.1 `finitePresentation_of_isFinitelyPresentable`, locator | Stacks Project Lemma 10.127.3 (Tag 00QO); `ℚ` | (1) finite presentation, (2) bijective, (3) surjective on directed colimits; proof (3) ⇒ (1) by factoring the identity through a finitely presented stage. `ℚ = colim ℤ[1/n!]`, identity does not factor | supports | — |
| Scope, lines 61–64 | search for "classifying topos/topoi" over main and the open heads | hits outside this roadmap and its two suppliers: exactly the five roadmaps named; groups `C₂`, `G(𝔽_q)` (finite), `π₁`, `Gal(k^sep/k)` (profinite) | holds | — |

The rows for the untouched statements stand as in the previous review, of `fb294c4`.

- Source locators checked against the text: 1 (Stacks Project, Lemma 10.127.3, Tag 00QO, statement and proof).
- Library declarations opened at the pins: Mathlib `ModelTheory/Semantics.lean:86` (`Term.realize_relabel`), `ModelTheory/Syntax.lean:117` (`Term.relabel`), `CategoryTheory/Subobject/Lattice.lean:259, 467` (`pullback_top`, `inf_pullback`). `Fin.castAdd` is core Lean.
- Cross-roadmap citations resolved: GrothendieckTopoi 1.2 (frame of subobjects, `Subobject.pullback f` a frame homomorphism with left adjoint `Subobject.exists f`, README lines 320–321 at its head) and 1.4 (universal coproducts and coequalizers, lines 361–362).
- Gate rerun at a49e1ce: every check 0, OK; the worker's run reports `build=0`. Depcheck: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 27 `sorry` warnings and nothing else. The file is unchanged since 6e9cb0f, so the signature comparison and the one-tactic probe of the previous review stand.
- Overlap check: read GrothendieckTopoi, LocallyPresentableCategories, HomotopyTheoryOfCategories; nothing shared beyond the objects cited from their owners (`B G`, subobject frames and Giraud's axioms from GrothendieckTopoi; `Ind A` from LocallyPresentableCategories). No roadmap, on main or open, defines a relabelling of geometric formulas. No open pull request changes this roadmap or drops an id it cites.

## Not verifiable

- Nothing new in the changed passages. The paywalled locators listed in the previous review (Mac Lane–Moerdijk, Elephant, Makkai–Reyes, Hakim) are unchanged.

## Source issues

- none
