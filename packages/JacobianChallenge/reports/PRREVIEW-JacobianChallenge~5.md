# Review of JacobianChallenge (pull request #1892 at 9642df6)

**Verdict:** needs changes

This is an incremental re-review of the 59 changed lines since c40cdde. There are two findings, both P3, and nothing blocks. Both earlier findings are repaired. One repair introduced a new problem, and the earlier review caused it: that review asked for a proof of geometric integrality from Stacks 056T and 033M, but Tau Ceti already has this result at the pin. The gate passes. The module elaborates with `sorry` as its only warning. The dependency check reports no problems.

## R01 (P3) — A.3's new first statement re-plans a pinned Tau Ceti instance

**Location.** `TauCetiRoadmap/JacobianChallenge/README.md` lines 363–370: "Prove first that the standing curve is geometrically integral: smoothness gives geometric reducedness and geometric normality (Stacks 056T); … Mathlib's `GeometricallyIntegral.of_geometricallyReduced_of_geometricallyIrreducible` assembles the two." The same reference appears at lines 91–92 ("this is A.3's first statement"), 141–145, 524 and 853 ("(A.3").

**Claim.** That a smooth, proper, geometrically connected curve is geometrically integral is new work for A.3.

**Witness.** Tau Ceti 2fd255d has `instance Smooth.geometricallyIntegral (f) [Smooth f] [GeometricallyConnected f] : GeometricallyIntegral f` (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyIntegral.lean` line 37). Together with Mathlib's `SmoothOfRelativeDimension.smooth` (`Morphisms/Smooth.lean` line 133), it closes the standing curve's goal in a scratch probe.

**Repair.** Cite the instance instead of planning the proof. The edits below were tested together on a scratch copy of the README:
- **Conventions, line 92.** Replace "this is A.3's first statement, never assumed" with "this is Tau Ceti's instance `Smooth.geometricallyIntegral`, never assumed".
- **From Mathlib, lines 141–145.** Replace the clause on `GeometricallyIntegral.of_geometricallyReduced_of_geometricallyIrreducible` with "`SmoothOfRelativeDimension.smooth` (`Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`)".
- **From Tau Ceti.** Add the bullet "`Smooth.geometricallyIntegral` (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyIntegral.lean`): a smooth, geometrically connected morphism is geometrically integral".
- **A.3, lines 363–370.** Replace the "Prove first …" sentence with "The standing curve is geometrically integral by Tau Ceti's instance `Smooth.geometricallyIntegral`, through Mathlib's `SmoothOfRelativeDimension.smooth` (Stacks 056T and 033M give the classical argument)".
- **A.3 *Needs:*.** Replace the Mathlib lemma with Mathlib `SmoothOfRelativeDimension.smooth` and Tau Ceti `Smooth.geometricallyIntegral`.
- **B.3 line 524 and D.4 line 853.** Replace "(A.3" with "(Tau Ceti's `Smooth.geometricallyIntegral`".
- **A.3's three new Checks.** Keep them: they test which hypotheses the instance uses.

**Tests of the repair.**
- The following elaborates in the scratch copy with no error: `example … [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] : GeometricallyIntegral X.hom := by have := SmoothOfRelativeDimension.smooth 1 X.hom; exact TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral X.hom`.
- On the Check instance `ℙ¹_L/k`, the instance's `GeometricallyConnected` hypothesis fails, as the Check says.
- `roadmaps resolve` on the edited README reports no unresolved citation and no unresolved Lean name.

## R02 (P3) — B.3 and D.4 now cite A.3, but their *Needs:* lines omit it

**Location.** `README.md` line 524: "Here `H⁰(X, 𝒪_X) = k` by geometric integrality (A.3; Stacks 0BUG (8))", with line 529 "*Needs:* B.1, B.2; Tau Ceti `Scheme.genus`, …". Line 853: "the standing curve is geometrically integral (A.3)", with line 858 "*Needs:* C.1–C.3, D.1–D.3; SchemeAndStackFoundations §0.9, …".

**Claim.** Each *Needs:* line lists, item by item, what the target's route uses.

**Witness.** Both changed sentences name an input (A.3) that their own *Needs:* lines do not list. The layer-level Dependencies of Layers B and D do include Layer A, but the README requires the input on the target's own line.

**Repair.** Add the input that supplies the curve's geometric integrality to line 529 and line 858. With R01's repair this is Tau Ceti `Smooth.geometricallyIntegral`; if A.3 keeps the proof, it is `A.3`. The scratch copy of the README with both lines edited resolves cleanly, as tested under R01.

## Previous findings

- R01 — repaired: "`AlgebraicGeometry.isCommMonObj_of_isProper_of_geometricallyIntegral` (…; Stacks 0BFD is the same theorem, stated for abelian varieties and proved by rigidity) … the Picard group law is commutative directly by tensor product, with no rigidity (D.2, through `IsCommMonObj.ofRepresentableBy`)."
- R02 — repaired: "Prove first that the standing curve is geometrically integral: smoothness gives geometric reducedness and geometric normality (Stacks 056T); after every extension `K/k` … hence integral (Stacks 033M …), so `X` is geometrically irreducible". The repair introduced this report's R01 and R02.

## Verified sound

**Repair of the earlier R01 (0BFD).**
- Mathlib's theorem carries `@[stacks 0BFD]` at the pin (`Mathlib/AlgebraicGeometry/Group/Abelian.lean` lines 130–133). Its hypotheses are `IsProper`, `GeometricallyIntegral` and `GrpObj`.
- Stacks Definition 39.9.1 (tag 03RO, section 0BF9) defines an abelian variety as a group scheme that is a proper, geometrically integral variety. So "the same theorem, stated for abelian varieties" is accurate.
- The Stacks proof of 0BFD (Lemma 39.9.5) reduces to `k̄`. It takes the commutator map `(x, y) ↦ (x, xyx⁻¹y⁻¹)`, which is constant on `e × A`, and uses the finiteness Lemma 37.44.3 (tag 0AH8) to make it constant near `e`. That is the rigidity argument, so "proved by rigidity" holds.
- D.2 names `IsCommMonObj.ofRepresentableBy` at lines 778–780 and in its *Needs:* at line 794. That declaration is at `Mathlib/CategoryTheory/Monoidal/Cartesian/CommMon_.lean` line 29.

**Repair of the earlier R02, mathematically.**
- Stacks 056T (Varieties, Lemma 33.25.4): a scheme smooth over `k` is geometrically regular, geometrically normal and geometrically reduced.
- Stacks 033M (Properties, Lemma 28.7.6): a Noetherian scheme is normal exactly when it is a finite disjoint union of normal integral schemes.
- `X_K` is of finite type over `K`, hence Noetherian, for every field `K` (transcendental ones included).
- `X_K` is nonempty: Mathlib's `GeometricallyConnected` (`Geometrically/Connected.lean` line 40) gives a `Surjective` instance (line 69).
- The Mathlib names in the contract exist at the pin: `GeometricallyReduced` (`Reduced.lean` 44), `GeometricallyIrreducible` (`Irreducible.lean` 42), `GeometricallyIntegral` (`Integral.lean` 40), `of_geometricallyReduced_of_geometricallyIrreducible` (`Integral.lean` 61).
- Mathlib's `geometrically` (`Basic.lean` 46) quantifies over every field `K : Type u` and every pullback, which matches "after every extension".
- B.3 still cites Stacks 0BUG (8): Varieties, Lemma 33.9.3, for a proper geometrically integral `X` over `k`, `H⁰(X, 𝒪_X) = k`.
- D.4 still cites Stacks 0A26: Varieties, Lemma 33.43.4, a proper scheme of dimension at most one over a field is H-projective.

**Gate, build, dependency check.**
- My gate run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also reports `build=0`.
- `lake env lean` on `TauCetiRoadmap/JacobianChallenge/Suggested.lean` exits 0 with 14 warnings, all "declaration uses `sorry`". They are at lines 70, 83, 99, 130, 147, 185, 198, 224, 234, 242, 265, 273, 283 and 309, as in the previous round.
- Dependency check with `--movable`: `depcheck: 239 roadmaps, 2323 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. JacobianChallenge is line 1 of the merge order.
- Nothing changed outside the folder (`git diff --stat origin/main...HEAD` is empty). The pins are Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b.

**Signatures and padding.**
- `Suggested.lean` is unchanged since c40cdde.
- A scratch copy with `#check @` for all 27 declarations gives 27 elaborated types, each found in `signatures.md`.
- The previous round's one-tactic padding probe still applies: no declaration closed.
- The newly found instance cannot discharge `geometricallyIntegral_jacobianScheme`, because it needs `[Smooth (jacobianScheme X).hom]` and the pin has no such instance.

**Headline theorems.** These are unchanged from the previous report's table: every headline listed there is either stated in `Suggested.lean` or named in its docstring as not statable.

**Cross-roadmap citations resolved** (main c0c3d151). D.4's suppliers in SchemeAndStackFoundations:

| Section | README line |
|---|---|
| §0.9 | 848 |
| §0.11 | 938 |
| §1.1 | 2071 |
| §4.9 (`formalFunctionsIso` at 5457, 5467) | 5448 |
| §4.14 | 5706 |

The resolver's one lead, `formalFunctionsIso`, is planned in §4.9. `overlaps.md` reports no dropped id and no id defined only by an open revision. The previous report's finding still applies to #1187: its Tau Ceti target is an ancestor of the pin, so that pull request is superseded. The changed passages introduce no new object.

**Seeded sample.** The four sampled targets lie outside the diff: "Cohomology and base change" is C.2, lines 621–668; "Field base change", "Properness and geometric integrality" and "Jacobian" are D.8, lines 964–1016. Their text is identical to c40cdde. The previous report's verification therefore stands: Stacks 02KH, 0B91, 0BDN, 0B9T; 056U; Kleiman Theorem 5.11 (p. 42); Milne III Proposition 2.1 (p. 91).

**Remarks on untouched text** (no change requested):
- B.3 lines 524–527 derive `H⁰(X, 𝒪_X) = k` and "`k` integrally closed in `k(X)`". Both are pinned in Tau Ceti: `Scheme.baseRingToGlobalSections_bijective_of_geometricallyIntegral` (`Geometrically/GlobalSections.lean` 99) and `isIntegrallyClosedIn_functionField_of_geometricallyIntegral` (`Geometrically/FunctionField.lean` 102). The second is exactly the `hk` argument of `eulerDegree_relativeDifferentials` (`Modules/Differentials/Canonical.lean` 215, 305).
- In D.8's "Properness and geometric integrality", once `jacobianScheme X` is known to be smooth and geometrically connected, its geometric integrality follows from the same instance `Smooth.geometricallyIntegral`.

**Adversarial table.** Rows marked (r4) are carried from the previous report (`PRREVIEW-JacobianChallenge_r4`), whose statements this diff leaves untouched. The other rows are computed this round.

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| Conventions / A.3: standing curve geometrically integral | `X_K`, `K = k(s)` transcendental; `X = ∅`; `ℙ¹_ℂ/ℝ`; Lean probe | finite type over `K`, Noetherian, normal (056T), connected, so integral (033M); excluded by `Surjective`; 2 components, excluded by `GeometricallyConnected`; closes with pinned names | true; pinned | R01 |
| A.3 Check 1 (`ℙ¹_L/k`) | `k = ℝ`, `L = ℂ` | `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`, base change `ℙ¹_ℂ ⊔ ℙ¹_ℂ`; `dim_ℝ H⁰ = 2 ≠ 1` | holds | none |
| A.3 Check 2 (`ℙ¹_{k'}/k`) | `p = 2`, `k = 𝔽₂(t)`, `k' = k(√t)` | `k' ⊗_k k̄ = k̄[u]/(u − √t)²`: `ε = u − √t ≠ 0`, `ε² = 0`, one point; regular, proper, geometrically connected, not geometrically reduced | holds | none |
| A.3 Check 3 (real conic) | `x² + y² + z² = 0` over `ℝ` | no real point (sum of squares positive); over `ℂ` a smooth conic `≅ ℙ¹_ℂ`, integral; `H⁰ = ℝ`, dimension 1 | holds | none |
| Mathlib contract: 0BFD | Stacks 03RO definition vs. Mathlib hypotheses; constant `S₃` | both are proper, geometrically integral group schemes; `S₃` is proper and smooth but not geometrically connected, so excluded, and it is noncommutative | holds | none |
| Picard law commutative (D.2) | `Pic(X_T)/Pic(T)` under `⊗` | `L ⊗ M ≅ M ⊗ L`; `IsCommMonObj.ofRepresentableBy` takes `F : Cᵒᵖ ⥤ CommMonCat` | holds | none |
| B.3: `H⁰ = k` by geometric integrality | `ℙ¹_ℂ/ℝ`; real conic | `H⁰ = ℂ`, dimension 2 (not geometrically integral); `H⁰ = ℝ`, dimension 1 (0BUG (8)) | holds; *Needs:* incomplete | R02 |
| D.4: specialization to the curve | `ℙ¹_k`; real conic `C` | projective and geometrically integral, `∐_ℤ Spec k`; dimension 1 proper, so H-projective (0A26), `∐_ℤ Spec ℝ` | holds; *Needs:* incomplete | R02 |
| `finiteDimensional_cohomology` (r4) | `∅`; `ℙ¹`, `𝒪(−2)`; `ℙ²`, `𝒪(−3)`; `𝔸¹` | `0`; `h⁰ = 0, h¹ = 1`; `h² = 1`; `k[t]` excluded by `IsProper` | holds | none |
| `serreDuality_exists_trace` (r4) | `ℙ¹`, `𝒪(n)`; `∅`; `ℙ¹ ⊔ E` | `max(−1−n, 0) = h¹(𝒪(n))`; `0 = 0`; `1 + 1 = 1 + 1` | holds | none |
| B.2 negative control (r4) | `𝔽_p(t)`, `x^p = t` | `res_∞ = −1`, `res_P = 1`, `Tr = 0` | holds | none |
| B.3 degree formula (r4) | `ℙ¹_L/k` | `−4 ≠ −2` | hypothesis needed | none |
| B.4 Riemann–Roch (r4) | conic, `deg P = 2` | `χ = 3 = 2 + 1 − 0` | holds | none |
| A.3 base-field Check (r4) | conic to `ℂ` | `2`; `2`; `6 − 2 = 4 = 2·2` | holds | none |
| `isRepresentable_relativeEffectiveCartierDegreeSubfunctor` (r4) | `d = 0, 1`; `ℙ¹`, `d = 2`; `ℙ¹ ⊔ ℙ¹` | `Spec k`, `X`; `ℙ²`; three components of dimension 2 | holds | none |
| D.2 Checks (r4) | `𝟙 S`; fold on `ℙ¹_k` | `S`; presheaf `ℤ`, sheafified `0` | holds | none |
| `hasPicardScheme_of_curve` (r4) | `ℙ¹_k`; `C/ℝ` | `∐_ℤ Spec k`; `2ℤ ⊊ ℤ` | holds | none |
| D.1 sequence (r4) | `C/ℝ`; `ℙ¹` pointed | `ℤ → ℤ/2 → Br`; split | holds | none |
| `isRepresentable_picZeroSets` (r4) | `C/ℝ`; Selmer cubic; `ℙ¹` | `Spec ℝ`; an elliptic curve; `Spec k` | holds | none |
| D.8 field base change (r4) | `K = k`; `C → ℂ`; `E → ℂ` | `𝟙`; `Spec ℂ`; `E_ℂ` | holds | none |
| `isProper_`/`geometricallyIntegral_jacobianScheme` (r4) | `ℙ¹`; `E`; genus 2; `C/ℝ` | `Spec k`; `E`; a surface; `Spec ℝ` | holds | none |
| `dim_jacobianVariety` (r4) | `ℙ¹`; `E`; Selmer; `y² = x⁵ + 1` | `0`; `1`; `1`; `2` | holds | none |
| `multiplication_isogeny` (r4) | dimension 0; `n = −2`; `n = p`; `n = 0` | `id`; degree 4; `p²`; fails | `n ≠ 0` needed | none |
| `multiplication_etale_iff` (r4) | `E/𝔽₃`, `n = 2, 3, 6, 0`; dimension 0 | iff holds; `[3] = id` while `3 = 0` | `0 < dim` needed | none |
| E.1 cube Checks 1–3, square (r4) | `ℙ¹³`; `Spec k ⊔ Spec k`; `A × A × {0}`; `T`-points | as recorded | holds | none |
| `abelJacobi`, `isAlbanese_abelJacobi` (r4) | `E`, `O`, `P`; `g = 0, 1` | `a_P = t ∘ a_O`; `0`; `f ∘ a⁻¹` | holds | none |
| `isClosedImmersion_abelJacobi` (r4) | `g = 1, 2, 3` | `h⁰(Ω(−x)) = g − 1 < g` | holds | none |
| `isIso_abelJacobi_of_genus_eq_one` (r4) | `g = 1, 2` | `1 = 1`; `1 ≠ 2` | holds | none |
| `isAlbanese_baseChange_abelJacobi` (r4) | `K = k`; `E → ℂ`; `ℙ¹` | `ε` invertible; iso; constant | holds | none |
| E.5–E.7, C.2–C.4, D.4–D.5 Checks, F.2 (r4) | as recorded there | as recorded there | holds | none |

## Not verifiable

- The Stacks tags 056T, 033M, 0BFD, 03RO (section 0BF9), 0A26 and 0BUG are not in the sources cache. I read them on the Stacks project site.
- Hartshorne, Mumford, Serre, Stichtenoth, Bosch–Lütkebohmert–Raynaud and Milne's *Jacobian Varieties* are settled as uncertified, as recorded in the previous report. No changed passage cites them.
- Ownership against open pull requests: the changed passages add no object. I checked them with `overlaps.md` and the resolver over the 469 open heads, not by re-reading every sibling checkout.

## Source issues

- none
