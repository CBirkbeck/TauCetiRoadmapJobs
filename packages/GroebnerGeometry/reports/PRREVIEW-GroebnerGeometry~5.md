# Review of GroebnerGeometry (pull request #2587 at 5c81ce7)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. The folder is unchanged since the previous review of `5c81ce7`, so this round read the pull request's description against the head: its counts, its lists of kept, removed and added declarations, its "content changed" bullets and its enumerated Checks all agree with the files, and the sentence about the old G4 anchor that the previous review corrected is now right. One small correction (a former supplier that the description does not say was dropped) and one format note carried from the previous review remain, neither blocking. One point is left to the human reviewers: Miller–Sturmfels, the most-cited source, could not be read.

## C01 — The description does not say that AnalyticToricGeometry Layer 0 is no longer a named supplier

A reader who compares the supplier lists finds one roadmap gone with no sentence about it. The README on main has a supplier row "AnalyticToricGeometry Layer 0 … and native `TauCeti.Toric`" (line 37 of its supplier table). At this head there is no `### From TauCetiRoadmap.AnalyticToricGeometry` subsection: the toric carriers are cited under "From Tau Ceti" (`README.md` line 1440, "the carriers of AnalyticToricGeometry Layer 0"), and the scope section leaves only "analytic toric charts and manifolds" to that roadmap (line 1354). The description's supplier sentence lists "Mathlib, Tau Ceti, SchemeAndStackFoundations (§§0.3, 2.6, 5.4, 5.7), StableReduction (Layers 2 and 4), ClassicalGroups (Layer 6) and SchurWeyl (conventions)", and its paragraph on re-cited suppliers names only AlgebraicVectorBundles and SchemeAndStackFoundations.

A sentence that would be right, next to the one on AlgebraicVectorBundles: "The toric carriers the old README took from AnalyticToricGeometry Layer 0 are Tau Ceti declarations (`TauCeti.Toric.*`), so that roadmap is no longer a named supplier and they are cited by name under Tau Ceti."

## N01 — In §1.1, "contraction to the variables `e τ`" uses the direction of `e` from §1.7, not §1.1's `e : σ → τ`

Line 157, unchanged: with §1.1's `e : σ → τ` the variables are `e σ` (the image of `e`). The pinned `MonomialOrder.IsGroebnerBasis.comap_rename`, cited in §1.7, has `e : τ → σ`.

## Previous findings

The previous review (of `5c81ce7`) raised no finding, so there is no R-numbered point to account for. Its small correction and its format note, at this head:

- C01 (description, old G4 anchor) — repaired: the description now reads "an anchor with its old id stands before the heading of Layer 4, so the links … still land on Layer 4. The scope section has a table from the former labels G1–G6 to Layers 1–6" (`README.md` lines 706, 1358–1367).
- N01 (§1.1, `e τ`) — not repaired: the folder did not change; written again above as N01.

## Verified sound

| Statement | Instances tried | Statement side | Other side (computed, source or library) | Result |
|---|---|---|---|---|
| Description: "49 numbered sections", "52 Checks in 35 blocks" | count at the head | 49; 52 in 35 | `###` k.n headings: 10+7+7+11+7+7 = 49; `**Checks.**` blocks 35, bullets 52 | agrees |
| Description: "`import Mathlib` plus seven Tau Ceti modules"; five kept, ten added theorems | `Suggested.lean` | 1 + 7 imports; 26 declarations | lines 1–8; 11 theorems (one kept, `flagMinor_leadingTerm`), 15 definitions; kept five have the statements of main | agrees |
| `flagMinor` "the same polynomial" (description) | old and new bodies | `det (X (toLex (rows r, castLE c)))` on main | `rename toLex (mvPolynomialMinor R rows (Fin.castLE hd))`: `rename` commutes with `det`, entries `X (toLex (rows r, castLE hd c))` | agrees |
| `exists_hilbertPolynomial_pluckerMap_two` (§6.6, cited in the description) | `n = 2, 3, 4` | degree `2n − 4`, leading coefficient `catalan (n − 2)/(2n − 4)!`: `1`; `1/2`; `2/24 = 1/12` | point: `1`; `ℙ²`: `C(m+2, 2)`, leading `1/2`; quadric in `ℙ⁵`: `C(m+5,5) − C(m+3,5)`, leading `2/4!`, value `20` at `m = 2` | holds |
| §5.5 Check, the "Dickson invariant" of the description | `q = x² + x y + y²` over `𝔽₂`, `n = 1` | fixed by the six points of `SL₂(𝔽₂)`, not a coaction invariant | `x ↦ x + y`: `x² + y² + x y + y² + y² = q`; swap: symmetric; group-scheme invariants for `n = 1` are `k` | holds |
| §2.5 stabilizers (description bullet) | `T = (ℤ/2)²`; Whitney umbrella | `Spec k[T] = μ₂ × μ₂`, nonreduced iff `char = 2`; stabilizer `𝔾_m × μ₂` | `README.md` lines 484–489, 503, 1201: `L_S ⧸ gp F ≅ ℤ ⊕ (ℤ/2)²`, resp. `ℤ ⊕ ℤ/2` | agrees |
| §6.7 flag count (description: "the flag count 8") | coefficient of `u v` in `(1 − u v)/((1 − u)³(1 − v)³(1 − w))` | `8` | `3 · 3 − 1 = 8`; semistandard tableaux of shape `(2, 1)` on three letters: `8` | holds |
| §5.5 locator (description: "over every field") | Hashimoto Theorem 17 | README: any commutative ring, `n ≥ 4`; Lean: `[Field k]`, every `n` | Hashimoto line 372–374: `R` a commutative ring; `n ≤ 3` reduced to four rows in the README | agrees |
| Description: suppliers | "From" subsections at the head | Mathlib, Tau Ceti, SchemeAndStackFoundations §§0.3, 2.6, 5.4, 5.7, StableReduction Layers 2, 4, ClassicalGroups Layer 6, SchurWeyl | lines 1371–1496: the same six; main also had AnalyticToricGeometry Layer 0 and AlgebraicVectorBundles | agrees; the dropped one is C01 |

The folder changed by 0 lines; the rows for its statements stand as in the previous review, of `5c81ce7`.

- Source locators checked against the text, 1: Hashimoto Theorem 17 (line 372–374). The seeded sample falls in no changed passage (there is none).
- Library declarations opened at the pin, 0 new; the eight import lines resolve (the file elaborates).
- Cross-roadmap citations resolved, 1: AnalyticToricGeometry is a completed roadmap on main; the README cites its carriers as `TauCeti.Toric.*` declarations.
- Dependency check: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder. Every automatic check passed and none was set aside.
- Elaboration: `Suggested.lean` elaborates with 11 `sorry` warnings and nothing else; no `set_option`; imports are `import Mathlib` and seven `TauCeti.*` modules. The file is unchanged, so the elaborated types and the one-tactic probes of the previous review stand.
- Headlines: unchanged; the 11 stated theorems and the two named as not statable are as in the previous review, and the description lists the same ones.
- Pull request text: every paragraph of the description read against the head and against the README and `Suggested.lean` on main; the one omission is C01.

Overlap check: read TensorProductCombinatorics and ClassicalGroups (closest by vocabulary, open and on main; the results list is empty); nothing shared, as in the previous review. No open pull request changes this roadmap, drops an id it cites, or defines an id it cites.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared; largest share MillerSturmfels, 9 of 49 locator lines (text not readable); no layer added, removed or reordered, so the contents comparison stands as before: independent.

Research link: Layer 3 states the SAGBI criterion and lifted-relation presentation of Bruns–Conca–Lembo (2025); Layer 5 the flag-minor degeneration of Kogan–Miller (2003) and Göbel's conjecture as proved by Reichstein (2003) and Thiéry–Thomassé (2006); Layer 6 the tree degenerations of Speyer–Sturmfels (2003). Rests on the sources read.

## Not verifiable

- Miller–Sturmfels, *Combinatorial Commutative Algebra* (uncertified): not read; no changed passage cites it.
- Eisenbud, *Commutative Algebra*, and Cox–Little–O'Shea (uncertified): not read; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Not tested: MillerSturmfels has the largest share of the README's locators (9 of 49 locator lines) and its text could not be read legally; the wording was not compared with it, and the arrangement only with the chapter list on its author's page.
