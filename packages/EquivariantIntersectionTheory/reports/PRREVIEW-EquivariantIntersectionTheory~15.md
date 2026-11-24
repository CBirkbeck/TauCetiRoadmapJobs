# Review of EquivariantIntersectionTheory (pull request #3027 at 477bb48)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 69 changed lines since `aecb53a`. The review checked the new §1.5 (descent of a linearised invertible sheaf to the quotient by a finite group of invertible order) against Alper 2013 and Drezet–Narasimhan 1989 at their locators. It recomputed both Checks, the inertia condition and a characteristic-`p` counterexample to the hypothesis-free statement, resolved the SchemeAndStackFoundations §§1.17, 1.22 and 1.23 citations on main, and re-ran the dependency check and the elaboration. The statement, its route and its Checks are correct and nothing blocks. Three small corrections (the description's claim that each added section has its source's generality, a `Suggested.lean` docstring that omits 1.5, and an untouched downstream-consumers sentence that is false on main) and one format note remain, and nothing is left for a human to decide.

## C01 — The description says each added section is stated in the generality of its source, but §1.5 states only a case of its sources

The description says each of the 217 added sections is "a theorem published before 20 November 2026 and stated in the generality of its source", and it lists the exceptions in a parenthesis. A reader would therefore expect Kempf's descent lemma at its published generality in EquivariantIntersectionTheory §1.5. The section states only a case of it:

- Alper 2013, Theorem 10.3 (p. 2386), holds for every good moduli space of a locally noetherian stack and for vector bundles of every rank.
- Drezet–Narasimhan 1989, Théorème 2.3, holds for a reductive group with a good quotient.
- §1.5 (README lines 318–352) takes a finite constant group of order invertible in `k`, a projective `X` and invertible sheaves.

The case suits this roadmap: its quotient is the projective one of SchemeAndStackFoundations §1.17, and Layer 1's objects are invertible sheaves. So the sentence to change is the description's. One option is to add to its parenthesis: "in EquivariantIntersectionTheory §1.5 for a finite group of invertible order acting on a projective scheme and for invertible sheaves, the case of Alper's Theorem 10.3 that the quotient of SchemeAndStackFoundations §1.17 carries".

## C02 — The `Suggested.lean` docstring names every other target of Layers 1–3 as not statable at the pins, but not 1.5

A reader who looks in the docstring for why a README target has no Lean statement finds nothing for 1.5. It is not statable for the reasons the first bullet gives for 1.1–1.4: linearised invertible sheaves, and `Stacks.QCoh` of a quotient stack. It also lacks the quotient `X/G` of a projective scheme (SchemeAndStackFoundations §1.17). The pinned Tau Ceti has only the invariant quotient of an affine scheme (`TauCeti.AffineInvariantQuotient`, `TauCeti/AlgebraicGeometry/Quotient/Affine.lean`). Extending the first bullet (lines 25–29) would fix this, for example with "and 1.5 (descent to the quotient by a finite group), which lacks in addition the quotient `X/G` of §1.17".

## C03 — Untouched text: README, Downstream consumers (line 593): "No roadmap on main cites this one" is false on main

A reader uses this section to see who depends on the roadmap, and it says nobody does. At the merge base and on main, at least four roadmaps cite this one:

- AbelianSchemesAndArithmeticModuli (§§1.1, 1.4)
- StableReductionPartII (§§1.4, 2.1, 2.2, 2.4)
- ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (9.1, citing §1.1)
- VirtualFundamentalClass (Layer 2)

With this pull request, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties 9.1 also becomes a corollary of the new §1.5. A separate pull request could replace the sentence with these roadmaps and the sections each cites.

## N01 — No Check tests the two hypotheses that make §1.5 true

Neither Check of §1.5 fails if the invertibility of `|G|` is dropped, or if the inertia group is replaced by the stabiliser. Two Checks would cover them:

- **Order of `G`.** In characteristic `p`, `ℤ/p` acting by `t ↦ t + 1` on `ℙ¹` fixes only `∞`. Its inertia there acts trivially on the fibre of `O([∞])`, yet `O([∞])` has degree `1` while pull-backs along the degree-`p` quotient have degree divisible by `p`.
- **Inertia, not stabiliser.** Over a field `k` with a non-square `a`, the point `t² = a` of the first Check is fixed by `−1`, which acts nontrivially on `κ(x) = k(√a)`. Its inertia group is trivial, so the condition there is empty.

<details><summary>What was checked</summary>

The automatic checks were re-run at this head. Every scanner is clean except the one for changes outside the roadmap folder; it lists the other roadmap folders this pull request also changes, and nothing else changes outside them. The dependency check reports no upward or cyclic edge. `Suggested.lean` is unchanged since the merge base: it elaborates with nine `sorry` warnings and no error, and a one-tactic probe closes none of its nine theorems. The new locators were read in the published Alper text (Numdam), in its arXiv v3 text, and in the HAL text of Drezet–Narasimhan. The printed page of Drezet–Narasimhan's Théorème 2.3 could not be checked. No earlier review of this pull request exists.

</details>

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.5, descent iff inertia acts trivially on fibres | `G = 1`; `ℤ/2` acting trivially on `Spec k`, `2` invertible | `G = 1`: inertia trivial, `π = id`, every `L` descends. `Spec k`: sign linearisation, inertia `ℤ/2` acts by `−1`; `π^*N` carries the trivial action | both sides agree | none |
| 1.5, Check 1 (`ℙ¹`, `t ↦ −t`, char `≠ 2`) | `O([0])`, `O(2[0])` | `1/t ↦ −1/t`: `−1` at `0`; `deg O([0]) = 1`, `deg π^*N = 2 deg N`; `1/t²` fixed; `π^*[t² = 0] = 2[0]` | true | none |
| 1.5 without `|G|` invertible | `ℤ/p` on `ℙ¹_{𝔽_p}`, `t ↦ t + 1`, `L = O([∞])` | inertia at `∞` is `ℤ/p`, acts by `1`; quotient `u = t^p − t`, degree `p`; `deg L = 1 ∉ pℤ` | criterion fails, so the hypothesis is needed | N01 |
| 1.5, inertia rather than stabiliser | `x = {t² = a}`, `a` a non-square | `G_x = ℤ/2`, acting on `k(√a)` by `√a ↦ −√a`; geometric points `±√a` swapped; `I_x = 1` | definition right | N01 |
| 1.5, closed points suffice | `y` non-closed, `x` in its closure, `X` projective | `g ∈ I_y` fixes the closure of `y` pointwise, so `I_y ⊆ I_x`; its scalar is constant on that proper integral closure | agrees with Alper, Definition 10.1 | none |
| 1.5 route: `[X/G]` tame, `X/G` a good moduli space | `|G|` invertible; `ℤ/p` over `𝔽_p` | Maschke makes invariants exact; `H¹(ℤ/p, 𝔽_p) = 𝔽_p ≠ 0`, so not exact for `ℤ/p` | route uses the hypothesis it states | none |
| 1.5, locators | Alper published and arXiv v3; Drezet–Narasimhan HAL text | Remark 4.2 p. 2362, Example 8.1 p. 2380, Theorem 10.3 p. 2386 match; Théorème 2.3 statement and Kempf attribution match | verified; DN p. 63 unread | none |
| 1.5, Check 2 and the 1.1 Check it cites | `ℤ/2` on `Spec k`, `2` invertible | `Hom(ℤ/2, k^*) = {±1}`; `Pic(Spec k) = 0`; only the trivial character descends | true | none |
| Convention 1 with 1.5 added | finite constant `G`, projective `X` | a finite constant group is étale, so smooth and affine of finite type; projective implies separated of finite type | consistent | none |
| Description vs §1.5 generality | Alper Theorem 10.3; DN Théorème 2.3 | Alper: any good moduli space, any rank; DN: reductive `G`, good quotient; §1.5: finite `G`, projective `X`, rank one | narrower than claimed | C01 |
| Downstream sentence | `git grep` at `aecb53a` and on main | five roadmaps outside this folder cite it | false | C03 |
| 0.1 shift classes | `k[t, t⁻¹]` with `deg t = 2`; zero ring | units `c tⁿ` of degree `2n` give `2ℤ`, `ℤ/2`; zero ring gives `⊤` | true | none |
| 0.2 connected spectrum | `k × k`, trivial grading; `k[ε][t, t⁻¹]` | `(1,0)`, `(0,1)` not units, gradings `ℤ²`; `(1 + εt)(1 − εt) = 1` | true | none |
| 0.4 weighted rings | `f = x²`; `f = xy` with weights `2, 3` | `x = x³/x²`, a unit of degree `1`: `ℤ`; `2a + 3b` generate `ℤ` | true | none |
| 0.5 discriminant | `m = 2, 3`; characteristic `3`, `2` | `−4a₂` (weight 2); `−4a₂³ − 27a₃²` (weight 6); char 3: `−a₂³`; char 2, `m = 2`: `0` | true | none |
| 1.3 exact sequences | `𝔾_m` acting on itself | `X^*(𝔾_m) = ℤ → Pic [𝔾_m/𝔾_m] = 0` not injective; `k[X]^* = k^* t^ℤ` | true | none |
| 1.4 slices | `Aff` on `𝔸¹`, `Y = {0}` | `𝔾_a × {0} → 𝔸¹`, `b ↦ b` is an isomorphism; `[𝔸¹/Aff] ≅ B𝔾_m`, `Pic = ℤ` | true | none |
| 2.1 approximation | `𝔾_m`, `l = 2, 3`, `i = −1` | `A_0(ℙ¹) = ℤ = A_1(ℙ²)`; nonzero exactly for `1 − l ≤ i ≤ 0` | true | none |
| 2.2 localisation | `𝔾_m` on `𝔸¹` weight 1, `Z = {0}` | image `(t)` in `ℤ[t]`, quotient `ℤ` | true | none |
| 2.3 classifying spaces | `μ_n`, `μ₁` | `[pt/μ_n] = [(𝔸¹ ∖ 0)/𝔾_m]` with weight `n`: `ℤ[t]/(n t)`; `n = 1`: `ℤ` | true | none |
| 2.4 `c₁` isomorphism | `𝔾_m` on `𝔸ⁿ ∖ 0`; `Bμ_n` | `ℤ[t]/(tⁿ)`: `A¹ = ℤ` for `n ≥ 2`, `0` for `n = 1`; `A¹_{μ_n} = ℤ/n` | true | none |
| 3.1 model case | `n = 1`, weight 2; `n = 2`, weights `1, 1`, `f = x` | `ℤ/2 = Pic Bμ₂`; complement `≅ 𝔸¹` via `y/x`, `Pic = 0 = ℤ/1` | true | none |
| 3.2 `M_{1,1}` | weights `4, 6` | `4a³` and `27b²` both of weight `12`: `ℤ/12` | true | none |
| 3.3 hyperelliptic | `g = 2, 3` | `4g + 2 = 10`, `8g + 4 = 28`; `2g(2g + 1) = 20 = 5·4`, `42 = 7·6` | true | none |
| 3.4 `[M_{0,n}/𝔖ₙ₋₁]` | `n = 3, 4, 5, 6` | `m(m − 1) = 2, 6, 12, 20`; order of `O(χ^{m−1})` is `m` | true | none |
| `Suggested.lean` 0.1–0.5 (nine theorems) | one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`) | none closes; elaboration gives nine `sorry` warnings and no error | not padding | none |

- Source locators checked against the text: 4 (Alper 2013 Remark 4.2, Example 8.1 and Theorem 10.3, in the published and arXiv v3 texts; Drezet–Narasimhan 1989 Théorème 2.3, in the HAL text); 3 of 4 printed pages confirmed.
- Library declarations opened: `TauCeti.AffineInvariantQuotient` (`TauCeti/AlgebraicGeometry/Quotient/Affine.lean:48`, `projection` at `:61`); no new library name in the change.
- Cross-roadmap citations resolved: SchemeAndStackFoundations §1.17 (`finiteGroupQuotient_projective`), §1.22 (`Stacks.QCoh`, `QCoh.presentationEquiv`, `QCoh.pushforward`), §1.23 (`finite_quotient_coarse`, `IsTame`, `.geometric_fibres`). All are on main and at both open revision heads of that roadmap. The three resolver leads (`GroupSpace.ofGroupScheme`, `actionQuotient.torsorEquiv`, `StableCurves.Mbar`) are README names of SchemeAndStackFoundations (lines 3204, 3758, 7056 on main).
- Consumer check: ProjectiveModelsAndPeriodBoundsOnShimuraVarieties 9.1 at this head (characteristic 0, integral projective `X`, inertia condition at every point) is a case of the "if" direction of §1.5.
- Dependency check, verbatim: `depcheck: 124 roadmaps, 1377 edges, 0 problem(s)`.
- Automatic checks on this head: every scanner reports 0 except the scan for changes outside the roadmap folder (set aside below). The change touches nothing outside the folders this pull request owns.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `sorry` warnings and no error. The file and its 15 elaborated signatures are unchanged since the merge base.
- Record check: the README at the merge base has 4 layers; the head keeps every layer id and item and adds only §1.5. The diff removes no heading or Lean declaration.

Overlap check: read VirtualFundamentalClassPartII, SchemeAndStackFoundations (main and both open revisions), MotivicStructuresInModuliOfCurves, VirtualFundamentalClass and StackPointsAndResidualGerbes, plus AlgebraicModuliForArithmeticGeometry §5.3. That section applies Alper's Theorem 10.3 inside the proof of its descent of finite locally free algebras, a different object. Nothing is shared: this roadmap owns the descent of §1.5, and the open SchemeAndStackFoundations revisions add cohomologically affine morphisms but not good moduli spaces or vector-bundle descent.

Source independence: changed passages only. 6 passages were compared with 2 sources: the 1.5 statement against Alper Theorem 10.3 (published lines 1589–1593) and against Drezet–Narasimhan Théorème 2.3 (HAL lines 408–411); the route against Alper Remark 4.2 (published lines 567–572), Example 8.1 (lines 1353–1354) and the proof of Theorem 10.3 (lines 1594–1600); Check 1 against Alper Remark 10.4 (arXiv lines 1495–1498); and Check 2. The longest shared run is the defined term "is a good moduli space". Largest share: eg1998, 11 of 31 locator citations in the layers. The arrangement was not compared, because no layer was added, removed or reordered.

Research link: Layers 2–3 build Edidin–Graham's equivariant Chow groups (Edidin–Graham 1998), which Arsie–Vistoli 2004 and Edidin–Hu 2025 use for stacks of hyperelliptic curves, and recover Pic `M_{1,1}` = ℤ/12 (Mumford 1965; Fulton–Olsson 2010). §1.5 is the finite-group case of Kempf's descent lemma (Drezet–Narasimhan 1989; Alper 2013, Theorem 10.3). This rests on the README and on eg1998, fo2010 and Alper 2013.

## Not verifiable

- Drezet–Narasimhan 1989, printed page 63 of Théorème 2.3: only the HAL text was read, which has its own pagination (page 11 of 38); the theorem number, statement and attribution are verified.
- Drezet–Narasimhan 1989, the issue number and Zbl 0689.14012 in the References: not opened.

Automatic checks set aside as false positives: the scan for changes outside the roadmap folder, run on the whole branch, lists the files of the other roadmap folders this pull request also changes (each reviewed on its own); nothing outside those folders changes.

## Source issues

- **Misprint** in Drezet–Narasimhan 1989 at Théorème 2.3 (HAL text, page 11): the statement introduces the equivariant bundle under one letter and then asserts descent for a bundle named by another letter; the second letter should be the first; affects nothing.

## For the human reviewers

- none
