# Review of TemperleyLieb (pull request #2711 at 6459425)

**Verdict:** accepted

**Summary.** The folder is unchanged since the previous review, which had no findings, and a second full pass again finds no mathematical defect: every identity, Check and convention was recomputed, the sampled locators were reread in the sources, and the conventions were reread in the pinned Tau Ceti. All five `Suggested.lean` statements are true as stated and none closes with one tactic. There are two small corrections (the role of the square root in §3.6, carried over, and a redundant hypothesis in §7.3) and two format notes, none blocking. One fact about the most-cited source is left for the human reviewers.

## C01 — §3.6 presents the A-form as what the Kauffman braiding needs, but the q-form at `q = −A²` already agrees with it on every algebra

In §3.6 (lines 637–638) the square root "is needed only for compatibility with the Kauffman braiding (§3.5), a separate statement". An implementer reads this as two functors to build and compare, where one suffices. At `q = −A²` the q-form cap `B = [[0, −A²], [1, 0]]` is `−A` times the A-form cap `[[0, A], [−A⁻¹, 0]]`, and its cup `B⁻¹ = [[0, 1], [−A⁻², 0]]` is `−A⁻¹` times the A-form cup `[[0, −A], [A⁻¹, 0]]`. A diagram `n → m` therefore picks up `(−A)^((n−m)/2)`, so the two functors agree on every `TL_n`, in particular on `e_i` and on `A + A⁻¹ e_i`. What needs `A` is the statement of the braiding.

A possible wording: "The square root is needed only to state the Kauffman braiding (§3.5). At `q = −A²` the A-form below differs from the q-form by the factor `−A` on the cap and `−A⁻¹` on the cup, so the two agree on every `TL_n`."

## C02 — In §7.3 idempotent completeness follows from the other hypotheses

The general statement of §7.3 (line 1264) assumes "a `K`-linear additive idempotent-complete category" together with the family `X_i`. The last hypothesis is implied: if every object is a finite biproduct `⊞ X_i^(n_i)`, with `End(X_i) = K` and `Hom(X_i, X_j) = 0` for `i ≠ j`, then its endomorphism algebra is `∏ M_(n_i)(K)`, an idempotent is a tuple of idempotent matrices of ranks `r_i`, and it splits through `⊞ X_i^(r_i)`, which exists by additivity. A consumer who has the decomposition but not yet idempotent completeness is asked for something the statement does not need. The hypothesis would be dropped, or the sentence would say that it is a consequence.

## N01 — Three works are cited without a locator, and one of them is not cited in the text at all

Westbury is cited in §§1.2, 5.2 and 5.3 (lines 247, 887, 907) and Wenzl in §§6.1 and 6.4 (lines 1027, 1097), without a theorem or page. Kauffman–Lins is listed in the References (line 1604) but no section cites it. Each would get a locator or, for Kauffman–Lins, a place in the text where it is used.

## N02 — §4.1 lists Mathlib's `StarModule` for `star (r • x) = r • star x`

Mathlib's `StarModule R A` states `star (r • a) = star r • star a` and needs a `Star R`, which a bare commutative ring `R` does not carry (line 705). The target as written, with `r` fixed, is the `R`-linearity of `star`; the *Needs:* line would name that, or say that `R` is given the trivial star.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.1 expansion | `q = 1`, `q = −1`, `n = 3` | `n` terms of `1`; `(−1)^(n−1) n`; `q⁻² + 1 + q² = δ² − 1`; pin has only the field form (`Basic.lean` 204) | sound, target genuine | none |
| §1.1 rotation, reversal | `k = 6`, `{0,1},{2,5},{3,4}` | pin: arcs move by `a ↦ a+1` (`Basic.lean` 108), parts by `finRotate '' B` (`Rotate.lean` 123): `{1,2},{0,3},{4,5}` both sides | sound | none |
| §1.2 product formula | `n = 4`; `3 → 1`; `n = 7` | `halfCount 4 · = 2,0,3,0,1`, `4+9+1 = 14`; `2·1 = 2 = catalan 2`; `halfCount 7 3 = 14` | sound | none |
| §2.1 diagram category | `cup ≫ cap`, `cap ≫ cup`, `e₁ ≫ e₁` | empty diagram, one circle; `e₁`, none; `e₁`, one circle; pin `cup`, `cap` are `swap 0 1` (`TLDiagram.lean` 357, 367) | sound | none |
| §2.2 Brauer comparison | identity on `n` | pin `id` is `Fin.revPerm` (`TLDiagram.lean` 338): `i ↦ 2n−1−i = n + (n−1−i) ↦ inr i` | sound | none |
| §2.5 monoidal presentations | pin | free monoidal category on objects only; no presented category in Mathlib or Tau Ceti; no source locator, roadmap's own | target genuine | none |
| §2.6 universal property | bimodules over `ℚ³`, `ℚ²`; nested circle | `d = (1,2,1)`: `1` left, `2` right on `M₁₂`; `d = e₁`: `1`, `0` on `M₁₂`; centrality at `g` turns nested circle into `d·d` | sound | none |
| §2.7 factorization | `e₁`; composite of surjections | `cap ≫ cup`; tops of `h_s` reach tops of `f_s`, all on through-strands | sound | none |
| §3.1a linear universal property | signatures | `ε F ≫ F.map η : 𝟙 ⟶ F(g⊗g)` equals `η ≫ (e⁻¹⊗e⁻¹) ≫ μ`; second composite `V⊗V ⟶ 𝟙`; types agree | sound | none |
| §3.2 pivotal | parity twist | `(−1)ⁿ` natural as `n ≡ m`; dimension of `of 1` becomes `−δ`; left and right traces scale alike | sound | none |
| §3.3 reflections | three strands at the pin | `a ↦ 5−a` fixes `e₁ = {0,1},{4,5},{2,3}`; `a ↦ 2−a` sends it to `{1,2},{3,4},{0,5} = e₂` | sound | none |
| §3.5 braiding | product, kink | `1 + (A² + A⁻² + δ)e`; `Aδ + A⁻¹ = −A³`; Tingley Def 2.1: `q^(1/2)`, `q^(−1/2)`, circle `−q − q⁻¹` | sound | none |
| §3.6 evaluation representation | q-form, A-form | `BB⁻¹ = 1`, circle `q + q⁻¹`; det `1`, circle `−A² − A⁻²`; q-form at `−A²` is `−A`, `−A⁻¹` times A-form | sound | C01 |
| §3.7 monos, epis | innermost cap; `D ≫ D̄`; no circles | `e_i ≫ D = (δ•𝟙) ≫ D`, `e_i ≠ δ•𝟙`; `δ^c'•𝟙`; circle-free injective `D` injective on basis for all `δ` | sound | none |
| §4.1 algebras | `StarModule` | Mathlib class needs `Star R`; statement is `R`-linearity of `star` | sound | N02 |
| §4.2 presentation | `n = 0, 1, 3`; augmentation | pin: `R` at `n ≤ 1`; five diagrams, `e₁e₂e₁ = e₁`; `aug e₁ = 0`, sum `1`; RSA Prop 2.3, Thm 2.4 | sound | none |
| §4.4 Markov trace | `n = 1, 2` | `δ = δ`; `tr̂(e₁e₂) = δ = tr̂(e₁)`, `tr̂(δe₁) = δ³`; Chen Def 2.1.7 p. 8, Lemma 5.1.5 p. 39 | sound | none |
| §4.6 uniqueness, existence | pin predicate | `map_one` every degree, `strandIncl : n+1 → n+2` (`Trace.lean` 52); `unique` over `CommSemiring` (line 88) | sound | none |
| §4.7 comparison | sign | `−(q + q⁻¹) = (−q) + (−q)⁻¹` | sound | none |
| §5.1 cellular | `ℤ`; `K[x]/(x²)`; `M₂(K)`; pin axiom | Gram `1`, not semisimple; `1, 0`; identity (`Matrix.lean` 86); pin axiom modulo cells strictly below (`Basic.lean` 93) | sound | none |
| §5.2 cell structure | `n = 3`, `k = 1`; action | `[[δ,1],[1,δ]]`; `(ab)•u = star a ≫ star b ≫ u = a•(b•u)`; untwisted: `u_R` vs `δ u_L`; RSA Lemma 3.1 p. 13 | sound | none |
| §5.3 Gram formula | `(2,0)`, `(3,1)`, `(4,0)`, `(4,2)`, `(5,1)`, `n = 7` at `0` | `[2]`; `[3]`; `[2]³[3]/[2]`; `[4]`; `[3]⁴[4]/[2] = [3]⁴(δ²−2)`; `−64, 3, −1, 1`; RSA (4.20) exponent `d_(n,p−j)` | sound | none |
| §5.4 semisimplicity | `δ = 0`, `n = 2, 3, 5`; char 2; `δ = ±1`, `n = 3` | `[2] = 0`; `−1, 1`; `−2`; `−2 = 0`; `[3] = 0`; RSA remarks after Cor 4.8 (lines 1157–1160) | sound | none |
| §5.5 nondegeneracy | char `p`, `δ = 2`; `δ = 0` | `[p] = 0`, `ζ + ζ⁻¹ = 2` forces `ζ = 1`; `(a,b) ↦ abδ = 0`; `tr(f g) = aug(g)[ℓ]` | sound | none |
| §5.6 faithfulness | two strands | `e₁` rank one, trace `δ`, independent of `1` at every `δ`; no source cited, roadmap's own | sound | none |
| §6.1 characterization | `n = 1`; `p = c f_n` | idempotents of `K`: `0, 1`; `c² = c`; Chen Thm 2.3.2 p. 12, Remarks 2.3.4–2.3.5 pp. 15–16 | sound | none |
| §6.2 single clasp | `n = 1, 2`; `e₂` in `f₄` | `1 − e₁/[2]`; `e₁`: `−1/δ − 1/(δ[3]) = −[2]/[3]`; `−[2]/[3] − [2]²/([3][4]) = −[2]²/[4]` | sound | none |
| §6.4 partial trace | `f₁`, `f₂` | `δ`; `δ − δ⁻¹ = [3]/[2]`; Chen p. 16: `tr₁(p_n) = ([n+1]/[n]) p_(n−1)` | sound | none |
| §6.6 constancy of dimension | `TL₃`, `δ(τ) = 1` | `px = x = xr`, `xp = x² = 0`, `E² = E`; `EAF = (t−τ)x`, dim `1`; specialized `pr = 0`, dim `0` | sound | none |
| §6.8 Goodman–Wenzl | `δ = 1`; `δ = 0` | `tr̂ f₂ = 0`; `δ = 0`: caps have no common kernel on `Hom(0, 2N)`, `N ≥ 2`, so nonzero ideals contain `𝟙₁` | sound | none |
| §7.2 quotients | `f ⊗ g = f^(2^m) g^(2^n)`; `ℤ/6` | both bracketings `f^(2^(m+p)) g^(2^(n+p)) h^(2^(n+m))`; `1 ≡ 4 (3)`, `16 ≡ 7 (9)`; `3² = 3`, ranks `(1,0)` | sound | none |
| §7.3 abelian bridge | quiver `• → •`; `K[ε]/(ε²)`; idempotents | `Hom(S₁, projective) = 0`, mono and epi, not iso; `ε² = 0`, no kernel; idempotent in `∏ M_(n_i)(K)` splits | sound | C02 |
| §7.4 generic classification | `a = b = 1, 2` | `[2]² = 1 + [3]`; `[3]² = [1] + [3] + [5]`; Chen Cor 2.4.7 p. 19, Lemma 4.0.7 p. 33, Thm 4.0.8 p. 35 | sound | none |
| §7.5 root-of-unity quotient | `δ = 1`; golden ratio; `ℓ = 2` | `min(2, 0) = 0`; `[4] = 1`, `[5] = 0`, `min(4, 2)`: `X₀ ⊞ X₂`; one simple; Chen Thms 5.4.4, 5.4.5 pp. 44, 47 | sound | none |
| `exists_basis_planarMatching` | `n = 0, 1, 2`; zero ring | algebra `R`, one matching; `1, e₁` vs two matchings; both sides trivial | sound | none |
| `existsUnique_isMarkovTrace` | degrees `0, 1, 2` | `tr 0 1 = 1`, `tr 1 1 = δ` fix the forms on `R`; `tr̂(ι e₁ · e₂) = δ` | sound | none |
| `isSemisimpleRing_iff_forall_det_gramMatrix_ne_zero` | `ℤ`; `K[x]/(x²)`; empty `M μ`; `A = 0` | excluded by `Field`; `1, 0`, not semisimple; `0×0` det `1`; both sides true | sound | none |
| `isSemisimpleRing_of_qInt_ne_zero` | char `p`, `δ = 2`, `n < p`; `δ = 0`, `n = 3` | factors `[k+j+1]` with `k+j+1 ≤ n`, all nonzero; semisimple although `[2] = 0` | sound | none |
| `isSemisimpleRing_iff_of_charZero` | `n = 0, 1`; `δ = 0`, `n = 2, 3, 4, 7`; `δ = 1`, `n = 3` | true/true; false/false, true/true, false/false, true/true; false/false | sound | none |

- Previous review (same head): it had no findings. Its small correction (§3.6) and its format note (locators) are not repaired, the folder being unchanged; both are carried above as C01 and N01.
- Source locators checked against the text: 34, in chen-tl-categories (17), ridout-saint-aubin (6), goodman-wenzl-ideals (6), morrison-jw-formula (3) and tingley-minus-sign (2). Every number, page and setting is as cited.
- Library declarations opened at the pins: `Combinatorics/PlanarMatching/{Basic,TLDiagram,DyckWord}.lean`, `Combinatorics/NoncrossingPartition/{Rotate,Reverse}.lean`, `Algebra/TemperleyLieb/{Basic,Trace,JonesWenzl,QuantumDimension}.lean`, `Algebra/Cellular/{Basic,Matrix}.lean`, `QuantumGroups/QuantumInteger/{Chebyshev,Laurent,Basic,RootOfUnity}.lean`, `CategoryTheory/Monoidal/Envelope/Quotient.lean`.
- Cross-roadmap citations resolved on main: TemperleyLiebOperatorAlgebras (Layer 1), QuantumGroups (its citation of the linear universal property as Layer 2 is mapped at line 1421), the Schur–Weyl roadmap (Layer 9), FreeProbability (F2), DiagrammaticCoherence and Foams (both name this roadmap's Layer 2 as owner of monoidal presentations), PresentationsOfMonoidalCategories. No change outside the folder.
- Automatic checks: all passed. Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `Suggested.lean` gives five `sorry` warnings and nothing else. The elaborated types of all five were compared with the README statements; the file has no `variable` block, and nothing changed. One-tactic probes (`simp`, `rfl`, `infer_instance`, `aesop`) fail on all five.
- Pull-request text: read against the head; 67 Checks in 37 lists as stated, the removed and added declarations as stated, no sentence contradicted.

Overlap check: read TemperleyLiebOperatorAlgebras, QuantumGroups, PivotalSpherical, PresentationsOfMonoidalCategories and CategoricalOperatorAlgebras; nothing shared. TemperleyLiebOperatorAlgebras owns the Hermitian, unitary and affine theory and the sign isomorphism, and consumes Layers 1–7 from here. PresentationsOfMonoidalCategories builds categories from F-symbol data, not from generating morphisms. No other roadmap, open or on main, plans monoidal categories presented by generators and relations.

Source independence: 40 passages compared with 5 sources (the 34 locators, plus §§5.4, 6.1, 6.6, 6.7 and 7.5 and one `Suggested.lean` docstring), none shared beyond formulas and standard names; largest share chen-tl-categories, 22 of about 49 locators; contents compared with chen-tl-categories (Chapters 1–6): independent. Layers 0, 1, 2 and 5 have no chapter there, its Chapters 3 and 6 have no layer here, and its 2.1–2.4 and 5.1–5.4 are spread over Layers 3, 4, 6 and 7.

Research link: Layers 6–7 state Goodman–Wenzl's unique-tensor-ideal theorem (2003, appendix to Freedman's magnetic-model paper) and build the `A_n` fusion categories surveyed by Edie-Michell–Morrison (2017). Layer 5 is Ridout–Saint-Aubin's Gram determinant (2012) with Graham–Lehrer's criterion (1996). This rests on the README's references and goodman-wenzl-ideals lines 12–15.

## Not verifiable

- Graham–Lehrer, *Cellular algebras* (Invent. Math. 123, 1996), §3: not in the cache or the manifest. The Lean criterion was checked against Tau Ceti's `CellularBasis` axiom and by examples.
- Westbury (Math. Z. 219, 1995): not in the cache, and no locator is given. The statements cited to it were checked in ridout-saint-aubin.
- Wenzl (C. R. Math. Rep. Acad. Sci. Canada 9, 1987): no copy in the cache. The recursion was checked by computation and against Tau Ceti's `jonesWenzl_add_two`.
- Kauffman–Lins (Princeton University Press, 1994): a book with no open copy, cited only in the References.
- Edie-Michell–Morrison (arXiv:1710.07362), Spencer and Jensen–Tubbenhauer–Wedrich: cited as context only, not opened.

## Source issues

- **Error** in goodman-wenzl-ideals at Proposition 1.1, printed p. 4: the source says the dimension of `eAf` is constant under specialization for the span `A` of any set of diagrams; it should be required that `eA ⊆ A` and `Af ⊆ A`, which its four-corner count uses; affects the proof.
- **Gap** in goodman-wenzl-ideals at Theorem 3.3, printed p. 11: the source says its first dimension equality is an instance of constancy of dimension; it should show that the image of the lattice under multiplication by `z_α` is saturated, since `z_α` does not preserve `T_n ⊗ 1_m`; affects the proof.
- **Gap** in goodman-wenzl-ideals at §1.1, printed p. 3, used in Theorem 3.3: the source says the embeddings into `T_m` have left inverses, which divide by powers of `d`, and never defines "proper root of unity"; it should exclude `d = 0` in the body, as its Theorem 0.1 does with `n ≥ 3`; affects the proof.

## For the human reviewers

- chen-tl-categories, the source with the largest share of locators (22 of about 49), is a 2014 Australian National University honours thesis posted on arXiv. The tensor-ideal headline is located in Goodman–Wenzl, which appeared in Comm. Math. Phys.
