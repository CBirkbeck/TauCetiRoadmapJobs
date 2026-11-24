# Review of EquivariantIntersectionTheory (pull request #3027 at cd123f8)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 69 changed lines since `74a09b7`. The change is the new §1.5 (a linearised invertible sheaf on a projective scheme descends to the quotient by a finite group of invertible order exactly when the inertia groups of the closed points act trivially on its fibres), with its entries in Convention 1, the dependencies, the scope and the supplier contracts. The statement, its route and both Checks were recomputed and read against Alper 2013 and Drezet–Narasimhan 1989 at their locators, the SchemeAndStackFoundations citations were resolved on main, and the dependency check and the elaboration were re-run: the mathematics is correct and nothing blocks. The folder is unchanged since the previous review, so its three small corrections (one of them in untouched text) and its one format note still stand; nothing is left for a human to decide.

## C01 — The description says each added section is stated in the generality of its source, but §1.5 states a case of its sources

The description says the 218 added sections are each "a theorem published before 20 November 2026 and stated in the generality of its source", with the exceptions listed in a parenthesis; EquivariantIntersectionTheory §1.5 is not among them. A reader therefore expects Kempf's descent lemma at its published generality. Alper 2013, Theorem 10.3 (p. 2386), is for any good moduli space of a locally noetherian stack and vector bundles of any rank; Drezet–Narasimhan 1989, Théorème 2.3, is for a reductive group with a good quotient. §1.5 (README lines 318–352) takes a finite constant group of order invertible in `k`, a projective `X` and invertible sheaves.

The case suits this roadmap (its quotient is the projective one of SchemeAndStackFoundations §1.17, and Layer 1 is about invertible sheaves), so the sentence to change is the description's. For example, add to its parenthesis: "in EquivariantIntersectionTheory §1.5 for a finite group of invertible order acting on a projective scheme and for invertible sheaves".

## C02 — The `Suggested.lean` docstring names every other target of Layers 1–3 as not statable at the pins, but not 1.5

A reader who looks in the module docstring for why 1.5 has no Lean statement finds nothing: its first "not statable" bullet (lines 25–29) lists 1.1–1.3 and 1.4 only. 1.5 lacks the same carriers (linearised invertible sheaves, `Stacks.QCoh` of a quotient stack) and also the quotient `X/G` of a projective scheme of SchemeAndStackFoundations §1.17. Extending that bullet would do, for example "and 1.5 (descent to the quotient by a finite group), which lacks in addition the quotient `X/G` of §1.17".

## C03 — Untouched text: README, Downstream consumers (line 593): "No roadmap on main cites this one" is false on main

The section tells a reader that nothing depends on this roadmap. On main, AbelianSchemesAndArithmeticModuli (§§1.1, 1.4), GroupSchemesOverABase (1.1, 1.3), StableReductionPartII (§§1.4, 2.1, 2.2, 2.4) and VirtualFundamentalClass cite it, and with this pull request ProjectiveModelsAndPeriodBoundsOnShimuraVarieties 9.1 becomes a corollary of the new §1.5. A separate pull request could replace the sentence by these roadmaps and the sections each cites.

## N01 — No Check of §1.5 tests the two hypotheses that make it true

Both Checks still pass if the invertibility of `|G|` is dropped or "inertia group" is replaced by "stabiliser". Two that would fail: in characteristic `p`, `ℤ/p` acting on `ℙ¹` by `t ↦ t + 1` fixes only `∞`, where it acts trivially on the fibre of `O([∞])` (in `s = 1/t` the map is `s ↦ s/(1 + s)`, of derivative `1`), yet `O([∞])` has degree `1` and pull-backs along the degree-`p` quotient `u = t^p − t` have degree in `pℤ`; and, in the first Check over a field with a non-square `a`, the closed point `t² = a` is fixed by `−1`, which acts on `κ(x) = k(√a)` by `√a ↦ −√a`, so its inertia group is trivial and the condition there is empty.

<details><summary>What was checked</summary>

The worker's automatic checks all pass at this head, and none was set aside. The dependency check reports no upward or cyclic edge. `Suggested.lean` is unchanged since the merge base: it elaborates with nine `sorry` warnings and no error, and a one-tactic probe closes none of its nine theorems. The new locators were read in the published text of Alper 2013 (Numdam) and in the HAL text of Drezet–Narasimhan 1989; the printed page of the latter's Théorème 2.3 could not be read. The previous review of this folder had no finding; its three small corrections and its format note are not repaired (the folder has not changed since, and the description keeps the sentence of C01), and they are repeated above.

</details>

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.5, descent iff inertia trivial on fibres | `G = 1`; `ℤ/2` swapping the points of `Spec(k × k)` | `G = 1`: `π = id`, all descend. Swap: inertia trivial, `X/G = Spec k`, `Pic^G(X) = 0 = Pic(Spec k)` | both sides agree, and with 1.4 | none |
| 1.5, Check 1 (`ℙ¹`, `t ↦ −t`, char `≠ 2`) | `O([0])`, `O(2[0])` | fibre of `O([0])` at `0` is `T₀`, `−1` acts by `−1`; degree `1` vs `2·deg N`; `O(2[0])`: `(−1)² = 1` at `0`, generator `1` at `∞`; `π^*[t² = 0] = 2[0]` | true | none |
| 1.5 against 1.3 on Check 1 | all linearisations on `ℙ¹` with `±1` | `H¹(ℤ/2, k^*) = {±1}`, `Pic^G = ℤ × ℤ/2`; characters at `0, ∞`: `O([0]) ↦ (−1, 1)`, sign `↦ (−1, −1)`; kernel `2ℤ = π^*Pic(ℙ¹)` | consistent | none |
| 1.5, Check 2 and the 1.1 Check it cites | `ℤ/2` trivial on `Spec k`, `2` invertible | `Hom(ℤ/2, k^*) = {±1}`, `Pic(Spec k) = 0`; sign character acts by `−1`, only the trivial one is `π^*O` | true | none |
| 1.5 without `|G|` invertible | `ℤ/p` on `ℙ¹` in char `p`, `t ↦ t + 1`, `L = O([∞])` | `s ↦ s/(1 + s)`, derivative `1` at `∞`: inertia acts trivially; quotient degree `p`, `deg L = 1 ∉ pℤ` | criterion fails; hypothesis needed and stated | N01 |
| 1.5, inertia rather than stabiliser | `x = {t² = a}`, `a` a non-square, `G = ±1` | `−1` fixes `x`, sends `√a ↦ −√a` on `κ(x)`; geometric points `±√a` swapped, so geometric stabiliser `= I_x = 1` | definition matches Alper's geometric points | N01 |
| 1.5 route: tame, coarse space, good moduli space | `|G|` invertible; `[X/G]` with `X` projective | subgroups of `G` linearly reductive (Maschke); inertia finite as `G` finite, `X` separated; `[X/G]` noetherian, as Theorem 10.3 requires | route's inputs present in §§1.17, 1.22, 1.23 | none |
| 1.5 locators | Alper published text; Drezet–Narasimhan HAL text | Remark 4.2 on p. 2362, Example 8.1 on p. 2380, Definition 10.1 and Theorem 10.3 on p. 2386; Théorème 2.3: reductive `G`, integral `Y`, good quotient, closed orbits, Kempf | match; DN p. 63 unread | none |
| Convention 1 with 1.5 added | finite constant `G`, projective `X` | finite constant group: étale, so smooth, affine, of finite type; projective: separated, of finite type | consistent | none |
| 1.4 as used by 1.5 (`QCoh.presentationEquiv`) | `G = 1`; free swap on two points | `[X/1] = X`; `[Spec(k × k)/ℤ/2] = Spec k`, invertible objects: one line, `Pic = 0` | agrees with 1.5 | none |
| Consumer of 1.5 (ProjectiveModelsAndPeriodBoundsOnShimuraVarieties 9.1) | char `0`, integral projective `X` | `|Γ|` invertible in char `0`; condition at every point contains the closed points; conclusion `π^*N ≅ L` | a case of the "if" direction | none |
| Description vs §1.5 generality | Alper Theorem 10.3; DN Théorème 2.3 | any good moduli space, any rank; reductive `G`; §1.5: finite `G`, projective `X`, rank one | narrower than the description says | C01 |
| Downstream sentence | search of the roadmaps at this head and on main | four roadmaps on main cite this one | false, untouched | C03 |
| `Suggested.lean` (nine theorems) | probe `rfl`, `simp`, `infer_instance`, `decide`, with `intros` | none closes; nine `sorry` warnings, no error | not padding | none |

- Source locators checked against the text: 5 (Alper 2013, Remark 4.2, Example 8.1, Definition 10.1, Theorem 10.3, published text, with printed pages; Drezet–Narasimhan 1989, Théorème 2.3 and its setting, HAL text).
- Library declarations opened: none new; the change names no library declaration, and `Suggested.lean` is unchanged since the merge base.
- Cross-roadmap citations resolved on main: SchemeAndStackFoundations §1.17 (`finiteGroupQuotient_projective`, Noetherian base, no condition on `|Γ|`), §1.22 (`QCoh.presentationEquiv`, `QCoh.pushforward`), §1.23 (`finite_quotient_coarse`, `IsTame`, its `.geometric_fibres` criterion). This pull request does not change that roadmap. The three name leads of the resolver (`GroupSpace.ofGroupScheme`, `actionQuotient.torsorEquiv`, `StableCurves.Mbar`) are README names of SchemeAndStackFoundations, in untouched text.
- Dependency check, verbatim: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`.
- Automatic checks at this head: all pass.
- Elaboration: `lake env lean` on `Suggested.lean`: nine `sorry` warnings, no error.
- Record check: the head keeps every layer and item of the README at the merge base; the diff adds §1.5 and removes no heading and no Lean declaration.

Overlap check: read VirtualFundamentalClassPartII, SchemeAndStackFoundations (main; the open revisions were searched for good moduli spaces and bundle descent), MotivicStructuresInModuliOfCurves, VirtualFundamentalClass, StackPointsAndResidualGerbes; nothing shared. AlgebraicModuliForArithmeticGeometry applies Alper's Theorem 10.3 inside the proof of its descent of finite locally free algebras, a different object; the descent of §1.5 has this roadmap as its only owner.

Source independence: changed passages only; 6 passages compared with 2 sources (the 1.5 statement with Alper 2013 Theorem 10.3 and Definition 10.1 and with Drezet–Narasimhan Théorème 2.3; the route with Remark 4.2, Example 8.1 and the proof of Theorem 10.3; the two Checks), none shared beyond the term "good moduli space"; largest share eg1998, 11 of 32 source citations in the layers; arrangement not compared, no layer being added, removed or reordered.

Research link: Layers 2–3 build the equivariant Chow groups of Edidin–Graham 1998, used by Arsie–Vistoli 2004 and Edidin–Hu 2025 for stacks of hyperelliptic curves, and recover `Pic M_{1,1} = ℤ/12` (Fulton–Olsson 2010). §1.5 is the finite-group case of Kempf's descent lemma (Drezet–Narasimhan 1989; Alper 2013, Theorem 10.3). Rests on the README, eg1998 and Alper 2013.

## Not verifiable

- Drezet–Narasimhan 1989, printed page 63 of Théorème 2.3: only the HAL text was read, with its own pagination (its page 11); the theorem number, statement, setting and attribution are verified.
- Drezet–Narasimhan 1989, the issue number and the Zbl number in the References: not opened.

## Source issues

- **Misprint** in Drezet–Narasimhan 1989 at Théorème 2.3 (HAL text, page 11): the statement introduces the equivariant bundle under one letter and asserts descent for a bundle under another letter; it should be the first letter in both places; affects nothing.

## For the human reviewers

- none
