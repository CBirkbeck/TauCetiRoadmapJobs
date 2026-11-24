# Review of EtaleDualityAndPerverseSheaves (pull request #3027 at a4d9b5d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 248 changed lines since `74a09b7`. The change is the new §7.6 (Lefschetz numbers of finite-order automorphisms) with its contract rows, consumer sentence and four references; `Suggested.lean` is unchanged. Accepted: every statement, proof route and Check of §7.6 was recomputed and its readable locators (Dudas–Michel §13, Serre exposé 487, Illusie–Zheng Theorem 3.2) agree with the text; there is no finding and no small correction, and one format note that does not block. The second statement of the stabilizer lemma in FiniteReductiveGroups 3.4 remains deferred (D02), and one point is left for the human reviewers: the Deligne–Lusztig paper has no legal open copy.

## N01 — The Check of the quotient formula has every term equal to zero, so it does not see the factor `|Π|⁻¹`

In the second Check of lefschetzDevissage (line 7492), `Lef(1, X/Π) = ½(Lef(1, X) + Lef(−1, X))` reads `0 = ½(0 + 0)`, which also holds without the `½`. A Check that would fail for the unnormalised sum: `Π = ℤ/2` exchanging the two points of `X`, where `X/Π` is a point and `1 = ½(2 + 0)`.

## Deferred findings

- D02 — stands

## Previous findings

The previous review (of `094da69`) raised no new finding; the folder's text is unchanged since that head.

- R01 — not repaired: deferred (D02)

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| lefschetzIntegrality, `Lef = −R_g(∞)` | one eigenpair `(ζ, α)`; sign convention `γ ↦ (γ⁻¹)^*` | `αt/(1−αt) → −1`, so `−R_g(∞) = Σ(−1)^i ζ_j` = alternating trace of `g^*` = `Lef(g⁻¹)`; equals `Lef(g)` since the value is rational and the two are conjugate | holds | none |
| same, Check `𝔾_m`, `g = 1` | `H¹_c`, `H²_c` of dimension 1 | `Lef = −1 + 1 = 0`; `Σ(q^m − 1)t^m = qt/(1−qt) − t/(1−t)`, value at `∞` is `−1 + 1 = 0` | holds | none |
| same, Check inversion on `𝔾_m` | `p ≠ 2`, `p = 2` | traces `−1` on `H¹_c`, `+1` on `H²_c`: `Lef = 1 + 1 = 2`; fixed points `±1` (two) or `1` (one, `x² = 1` non-reduced) | holds; `Lef ≠ |X^g|` for `p = 2` | none |
| lefschetzDevissage (c) | `ℤ/2` on two points; `μ₂` on `𝔾_m` | `1 = ½(2 + 0)`; `0 = ½(0 + 0)` (`−1` lies in the connected `𝔾_m`, so acts trivially) | holds | N01 |
| lefschetzDevissage (d), trace on a projective `(ℤ/ℓ^ν)[C]`-module | `C = C_ℓ × C_{ℓ′}`, `γ_ℓ ≠ 1` | `(𝒪_i/ℓ^ν)[C_ℓ]` local, module free over it; `γ` = unit scalar × permutation of `C_ℓ` without fixed point: trace `0` over `𝒪_i/ℓ^ν`, hence over `ℤ/ℓ^ν` | holds | none |
| (d), negative control | `ℤ/p` translating `𝔸¹` | only `H²_c ≠ 0`, trivial action: `Lef(γ) = 1 ≠ 0`; order of `γ` is a power of `p` | hypothesis needed | none |
| lefschetzJordanFormula, "image of `g` has order divisible by a prime `≠ p`" | image of `p`-power order `p^a` | then `g^{p^a} ∈ Θ` and `⟨g^{p^a}⟩ ⊇ ⟨g_{p′}⟩`, so `g_{p′} ∈ Θ`, contradicting no `g_{p′}`-fixed point on the piece | holds | none |
| same, Checks | inversion on `𝔾_m`, `p ≠ 2`; translation of `𝔸¹` | `2 = Lef(1, {±1}) = 2`; `g_{p′} = 1`, `Lef(g, 𝔸¹) = 1` against `Lef(1, ∅) = 0` | holds; `X^g` is the wrong scheme | none |
| finitelyManyStabilizers, Checks | `𝔾_m` on `𝔸²`, weights `(1,2)`; `𝔾_a²` on `𝔸²` | stabilizers `𝔾_m`, `μ₂`, `1` (three); `(s,u)(s′,u′)` adds, stabilizer `{s + au = 0}` varies with `a`, family `F[u,a,b]` free over `F[a,b]` | holds; diagonalizable needed | none |
| same, generic-flatness step | `exists_dense_open_flat` at the pin | hypotheses: target reduced, locally Noetherian; morphism quasi-compact, locally of finite type; `S → Z₁` is affine of finite type over reduced Noetherian `Z₁` | met | none |
| lefschetzGroupActions (b), choice of `t` | stabilizer `A ⊉ T`; point fixed by `g_{p′}t` | `{t : g_{p′}t ∈ A}` empty or a coset of `A ∩ T ⊊ T`; fixed point's stabilizer contains `g_{p′}t`, so `T`, so `g_{p′}`; `(gt)_{p′} = g_{p′}t`, `(gt)_p = g_p` | holds | none |
| (b), Check | `𝔾_m` on `ℙ¹`, `g = 1` | `Lef(1, ℙ¹) = 1 + 1 = 2`; `(ℙ¹)^T = {0, ∞}`, `Lef = 2` | holds | none |
| (a), non-properness remark | `G = 𝔾_m`, `X` a point | `H⁰_c(pt) = ℚ̄_ℓ ≠ 0`, `H⁰_c(𝔾_m) = 0` | holds | none |
| Mathlib contract sentence | the two declarations at the pin | `linearIndepOn_isGroupLikeElem`: domain, torsion-free coalgebra (GroupLike.lean:98–103); `Module.Flat.torsion_eq_bot` (Flat/TorsionFree.lean:84) | as stated | none |
| Stabilizer lemma and (a), ownership (D02) | FiniteReductiveGroups 3.4 at head, lines 1221–1262 | still states (d) and proves (a) for every connected group with its own route | stands | deferred |

- Source locators checked against the text: 12. Dudas-Michel-2015 Propositions 13.1 (iii), 13.3, 13.5, 13.6, 13.7, 13.8, 13.9, 13.10 and Corollaries 13.2, 13.4 (lines 2569–2692; quasi-projective convention at line 973); Serre-1977 Propositions 1–3 and Corollaire 1 (lines 119–166); Illusie-Zheng-2013 Theorem 3.2 (a)–(c) (lines 796–801). Of the 15 seeded targets only §7.6 lies in changed or affected text; the README flags no locator as unverified.
- Library declarations opened at the pins: 3. Mathlib `linearIndepOn_isGroupLikeElem` (`Mathlib/RingTheory/Coalgebra/GroupLike.lean:103`), `Module.Flat.torsion_eq_bot` (`Mathlib/RingTheory/Flat/TorsionFree.lean:84`); Tau Ceti `AlgebraicGeometry.Scheme.Hom.exists_dense_open_flat` (`TauCeti/AlgebraicGeometry/Morphisms/Flat/Generic.lean:124`).
- Cross-roadmap citations resolved: 21. EtaleCohomologyFoundations §§0.8, 0.11, F.0.2, F.0.4, F.2.4, F.2.5, F.2.5a, F.2.7, F.3, F.4.4, F.4.5, F.4.6, F.10.1, F.10.2b, F.10.3, F.10.4a (headings at this head; F.2.5a and F.10.4a are added by this pull request, and their statements are the ones §7.6 uses); InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 (main, line 195); SchemeAndStackFoundations §1.24 (main, line 3891); ReductiveGroups Layer 4 (head, line 2246); DeligneLusztigTheory Layer 1 (head; cites §7.6 in nine places and restates none of it); FiniteReductiveGroups 3.1–3.4 (head).
- Record: no layer removed, retitled or added since the merge base (9 layers); one heading added (§7.6); `Suggested.lean` unchanged, so no declaration and no signature changed. §7.6 is not among the Summary's headline theorems, and its objects (compactly supported ℓ-adic cohomology) are named as absent in the module docstring.
- Dependency check: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`; no supplier roadmap is added or dropped by the change.
- Automatic checks: all passed in the worker's run. Elaboration with `lake env lean`: 7 `sorry` warnings, no error. Every file the pull request changes lies in a folder it owns.
- Description: read against this head, the live text included. It names §7.6 as an addition to this roadmap, says DeligneLusztigTheory needs it, and its merge-order block orders this folder after the other open pull request that changes it.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations, ClassicalAdicEtaleCohomology, SheafTheoreticSmithTheory, GlobalShtukasAndFunctionFieldLanglands, DeligneWeightsAndPurity for the objects of §7.6, and DeligneLusztigTheory and FiniteReductiveGroups as its consumers; quotient cohomology and free-action perfectness are owned by EtaleCohomologyFoundations §§F.2.5a, F.10.4a and cited here; Lefschetz numbers of finite-order automorphisms are owned by §7.6; the stabilizer lemma has the second statement recorded as D02.

Source independence: changed passages only. 7 passages compared with 3 sources (the route and statement of lefschetzIntegrality with Dudas-Michel-2015 lines 2579–2600; lefschetzDevissage (a), (c) with lines 2609–2645; lefschetzGroupActions (c) with lines 2664–2676; lefschetzJordanFormula and the free-action statement with Serre-1977 lines 139–155; the route of (d) with Illusie-Zheng-2013 lines 796–815), none shared beyond formulas; no layer was added, removed or reordered, so the contents were not compared.

Research link: §7.6 is the Lefschetz-number calculus of Deligne–Lusztig 1976 §3 (as in Serre 1977 and Dudas–Michel 2015 §13) on which Deligne–Lusztig induction rests; the roadmap's headlines (decomposition theorem; Fujiwara–Varshavsky trace formula, Varshavsky 2023, Hansen–Kaletha–Weinstein 2022) serve geometric Satake and local Langlands. Rests on the README and the three sources read.

## Not verifiable

- Deligne-Lusztig-1976, Proposition 3.3, Theorem 3.2 with the first step of its proof, and Proposition 6.4: the paper has no legal open copy (JSTOR only). The locators were checked through the attributions in Serre-1977 (Propositions 1, 2, 3 name them) and Illusie-Zheng-2013 (proof of Theorem 3.2).

## Source issues

- none

## For the human reviewers

- Deligne-Lusztig-1976 (Ann. of Math. 103) has no legal open copy; its four locators in §7.6 of `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` (lines 7431, 7481, 7510, 7606) were checked only through Serre-1977 and Illusie-Zheng-2013.
