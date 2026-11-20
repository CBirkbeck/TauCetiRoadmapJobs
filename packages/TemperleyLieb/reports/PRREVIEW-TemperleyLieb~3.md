# Review of TemperleyLieb (pull request #2711 at 6459425)

**Verdict:** accepted

**Summary.** This head repairs every finding of the previous review. The unsupported attributions to Chen's thesis are gone. Each new locator into Chen, Ridout–Saint-Aubin, Goodman–Wenzl, Morrison and Tingley states what it is cited for; this includes Tingley's Theorem 4.2, whose cap and cup are the README's A-form up to the stated scalars. I found no mathematical defect. All five `Suggested.lean` statements are true as stated, and none closes with one tactic. There is one small correction (what the square root is needed for in §3.6) and one format note (citations without locators), neither blocking. One fact about the most-cited source is left for the human reviewers.

## C01 — §3.6 presents the A-form as what the Kauffman braiding needs, but the q-form at `q = −A²` already agrees with it

In §3.6 (lines 637–638) the square root "is needed only for compatibility with the Kauffman braiding (§3.5), a separate statement". This reads as if the q-form could not serve once a braiding is present, so an implementer may build and verify two functors where one suffices. At `q = −A²` the q-form's cap matrix `B = [[0, −A²], [1, 0]]` is `−A` times the A-form cap `[[0, A], [−A⁻¹, 0]]`. Its cup matrix `B⁻¹ = [[0, 1], [−A⁻², 0]]` is `−A⁻¹` times the A-form cup `[[0, −A], [A⁻¹, 0]]`. A diagram `n → m` therefore picks up the factor `(−A)^((n−m)/2)`, so the two functors agree on every endomorphism algebra, in particular on `e_i` and on the braiding `A + A⁻¹ e_i`. What needs `A` is the braiding itself.

A possible wording: "The square root is needed only to state the Kauffman braiding (§3.5). At `q = −A²` the A-form below differs from the q-form by the factor `−A` on the cap and `−A⁻¹` on the cup, so the two agree on every `TL_n`."

## N01 — Three works are cited without a locator, and one of them is not cited in the text at all

Westbury is cited in §§1.2, 5.2 and 5.3 (lines 247, 887, 907) and Wenzl in §§6.1 and 6.4 (lines 1027, 1097), all without a theorem or page. Kauffman–Lins is listed in the References (line 1604) but no section cites it. Each would either get a locator or, for Kauffman–Lins, a place in the text where it is used.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.2 Brauer comparison | `e₁`; `id n`; crossing on 2 strands | top `2 ↦ inr 1`, `3 ↦ inr 0`: `e₁ ↦` cap `{inl 0, inl 1}`, cup `{inr 0, inr 1}`; `id ↦ permToBrauer 1`; crossing pulls back to `{0,2},{1,3}` | sound | none |
| §2.2 stacking order | `composeDiagram` (`Compose.lean` 294), loop counts (`WeightedAssociativity.lean` 449) | `D₁` above `D₂`, so `f ≫ g ↦ composeDiagram (img g) (img f)`; loop identity matches §2.1's `c(f,g) + c(f≫g,h)` | sound | none |
| §2.5 monoidal presentations | Mathlib free monoidal category; Tau Ceti ideals | free on objects only; `project` at `Free/Basic.lean` 361; `prop_projectObj` at `Free/ObjectProperty.lean` 31; no locator, roadmap's own | sound | none |
| §3.2 pivotal structure | half-turn; parity twist | half-turn of `n → m` relabels by `x ↦ x − n mod (n+m)`; full turn is `rotate_pow`; `(−1)ⁿ` natural since `n ≡ m`, dimension `−δ` | sound | none |
| §3.3 reflections | three strands; Chen Defs 2.1.5–2.1.6, Rem 2.3.5 | `e₁` (`{0,1},{4,5}`) ↔ `e₂` (`{1,2},{3,4}`); Chen: reflection in the horizontal, 180° turn, lateral reflection, dual = composite | sound | none |
| §3.6 evaluation representation | q-form; A-form; Tingley Example 3.2 | `q·1 + 1·q⁻¹`; A-form det 1, circle `−A² − A⁻²`; Tingley cap `[[0,1],[−A⁻²,0]]`, cup `[[0,−A²],[1,0]]`: ×A, ×A⁻¹ | sound | C01 |
| §3.7 monos and epis | innermost bottom cap; `D ≫ D̄`; `δ = 0`; `ℤ/6` | `e_i ≫ D = δ D`, `e_i ≠ δ•𝟙`; `D ≫ D̄ = δ^((m−n)/2 + 2c)•𝟙`; `δ•𝟙(of 0) = 0`; `3 ↦ 0` under ×2 | sound | none |
| §4.1 algebras | trivial ring; three strands | `finrank_subsingleton = 1` (`Finrank.lean` 64); `star(e₁e₂) = e₂e₁ ≠ e₁e₂`; Chen Def 2.2.1 p. 9, Rem 2.1.3 p. 8 | sound | none |
| §4.2 presentation | `n = 3`; augmentation; RSA Prop 2.3, Thm 2.4 | five diagrams, `e₁e₂e₁ = e₁`; `aug e₁ = 0` versus coefficient sum `1`; RSA pp. 7, 9, `β ∈ ℂ` | sound | none |
| §4.4–4.5 trace, expectation | two and three strands | Gram `[[δ²,δ],[δ,δ²]]`, det `δ²(δ²−1) = [2]²[3]`; `𝔼(e₂) = 1₂`, `𝔼(e₁e₂) = e₁` | sound | none |
| §5.1 cellular | `ℤ`; `K[x]/(x²)`; `M₂(K)` | `ℤ`: Gram 1, not semisimple; dets `1, 0`, not semisimple; identity, semisimple; `CellularBasis` at `Cellular/Basic.lean` 93 | sound | none |
| §5.2 TL cell structure | `n = 3`, `k = 1`; unpinned action | `[[δ,1],[1,δ]]`, det `[3]`; `e₂≫e₁≫u_R = u_R` against `e₁≫e₂≫u_R = δ u_L`; RSA §3, Lemma 3.1 p. 13 | sound | none |
| §5.3 Gram formula | RSA (4.20); `(4,0)`, `(5,1)`, `n = 7` at `δ = 0` | exponent `d_(n,p−j) = halfCount n (k+2j)`; `[2]²[3]`; `[3]⁴(δ²−2) = −2`; `−64, 3, −1, 1` | sound | none |
| §6.2 single-clasp recursion | `n = 2`; Morrison (3.4) | `e₁` coefficient `−1/δ − 1/(δ[3]) = −[2]/[3]`; `[i] ↦ (−1)^(i+1)[i]` gives `(−1)^(n−i+1)`; Prop 3.3 p. 6 | sound | none |
| §6.3 coefficient formula | Prop 5.1 p. 9; `e₂` in `f₄` | `(1/[n]!) Σ [τ(s)]`; `−[2]/[3] − [2]²/([3][4]) = −[2]²/[4]` since `[4]+[2] = [2][3]` | sound | none |
| §6.4 partial trace | `f₁`, `f₂`; Chen p. 16 | `𝔼(f₂) = δ − δ⁻¹ = [3]/[2]`, `𝔼(f₁) = δ`; Chen `tr₁(p_n) = ([n+1]/[n]) p_(n−1)`; Rem 2.3.3 p. 15 | sound | none |
| §6.8 Goodman–Wenzl | `δ = 1`; locators | `f₂ = 1 − e₁`, trace `δ² − 1 = 0`; Prop 2.1 p. 8, Thm 3.3 p. 10, Cor 3.2 p. 10; setting `ℂ(t)` stated | sound | none |
| §7.1 envelope | pin | `Mat_` monoidal (`Mat/Basic.lean` 195, 245, 312), Karoubi rigid; `MonoidalLinear` only on the quotient (`Quotient.lean` 406) | target genuine | none |
| §7.2 quotients | `f ⊗ g = f^(2^m) g^(2^n)`; `ℤ/6` | both bracketings `f^(2^(m+p)) g^(2^(n+p)) h^(2^(n+m))`; `1 ≡ 4 (3)`, `16 ≡ 7 (9)`; idempotent `3` ranks `(1,0)` | sound | none |
| §7.5 root-of-unity quotient | `δ = 1`; golden ratio; Chen Thms 5.4.4–5.4.5 | `X₁⊗X₁ = X₀`; `[4] = 1`, `[5] = 0`, `X₂⊗X₂ = X₀⊞X₂`; `a+b+c < 2n−2` gives `c ≤ 2n−4−a−b` | sound | none |
| Universal property (§2.6) | bimodules over `ℚ³`, `ℚ²` | path graph `d = (1,2,1)`: 1 and 2 on `M₁₂`; `d = e₁`: 1 and 0 on `M₁₂`; not statable, docstring says so | sound | none |
| `exists_basis_planarMatching` | `n = 0, 1, 2`; zero ring | `PlanarMatching 0`, `PlanarMatching 2` singletons, algebra `R`; basis `1, e₁`; both sides trivial | sound | none |
| `existsUnique_isMarkovTrace` | `n = 0, 1, 2` | `tr 0 1 = 1`, `tr 1 1 = δ`; `tr̂(ι e₁·e₂) = δ`, `tr̂(ι e₁·e₁) = δ³`; uniqueness `Trace.lean` 88 | sound | none |
| `isSemisimpleRing_iff_forall_det_gramMatrix_ne_zero` | `ℤ`; `K[x]/(x²)`; empty `M μ` | excluded by `Field`; dets `1, 0`, not semisimple; `0×0` det 1 | sound | none |
| `isSemisimpleRing_of_qInt_ne_zero` | `δ = 0`, `n = 3`; all `[j] ≠ 0` | semisimple although `[2] = 0` (one direction only); (4.20) quotient of nonzero factors | sound | none |
| `isSemisimpleRing_iff_of_charZero` | `δ = 0`, `n = 4, 7`; `δ = 1`, `n = 3`; char 2 | `[2]²[3] = 0`, false/false; dets nonzero, true/true; `[3] = 0`, false/false; `−2 = 0` excluded | sound | none |
| Goodman–Wenzl headline, `ℓ = 2` | `δ = 0` | every `g : 1 → 1` is `r•𝟙`, trace `rδ = 0`: `𝟙₁` negligible; separate target stated | sound | none |

- Previous review (head e774e41): every remark is repaired. R01 is repaired: §§2.1, 2.6, 2.7, 3.4 and 5.6 no longer cite Chen, §3.6 cites "his Theorem 4.2 with his equation (18)", Chen locators stand at §§3.1, 3.2, 4.1, 4.2, 7.4 and 7.5, the references entry reads "parts of Layers 3, 4, 6 and 7", and Kauffman–Lins is no longer cited in the text. C01 is repaired: "products of quantum integers, divided by the quantum factorial `[n]!`". C02 is repaired: "Over `ℂ` these are Goodman–Wenzl's Proposition 2.1 (p. 8)…". C03 is repaired: "how a non-standard ribbon element removes it". C04 is repaired: "the identities `𝟙 (of n)` form a monoidal natural isomorphism".
- Source locators checked against the text: 46. By source: chen-tl-categories 21, ridout-saint-aubin 8, goodman-wenzl-ideals 9, morrison-jw-formula 3, tingley-minus-sign 5. Every theorem number, page and setting is correct.
- Library declarations opened at the pins: 16 Tau Ceti files (`Brauer/{Diagram,Compose,LoopCount,WeightedAssociativity}`, `PlanarMatching/TLDiagram`, `Monoidal/Scalar`, `Monoidal/Free/ObjectProperty`, `TemperleyLieb/{Trace,JonesWenzl,QuantumDimension}`, `Cellular/Basic`, `Envelope/{Quotient,Mat/Basic,Karoubi/Rigid}`, `Linear/{Mat,Karoubi}`) and 2 Mathlib files (`Finrank.lean`, `Monoidal/Free/Basic.lean`).
- Cross-roadmap citations resolved on main (7bf06a3): 11 roadmaps. QuantumGroups' "`TLCat.lift` of Layer 2" is mapped at line 1421, and DiagrammaticCoherence's anchor `#layer-2-the-diagram-category-and-its-presentation` still resolves. No change outside the folder.
- Automatic checks: all passed. Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `Suggested.lean` gives five `sorry` warnings and nothing else. `#check @` of all five matches the README's generality; there is no `variable` block. One-tactic probes (`simp`, `rfl`, `infer_instance`, `aesop`, `decide`) fail on all five.
- Copying: the 6- and 8-word runs shared with the five sources are reference titles and formula fragments. The longest prose run is 6 words in §6.7, naming Goodman–Wenzl's objects in an erratum.

Overlap check: read TemperleyLiebOperatorAlgebras, QuantumGroups, PivotalSpherical, PresentationsOfMonoidalCategories and CategoricalOperatorAlgebras (all on main; the open layout revision that touches them does not change their scope); nothing shared. TemperleyLiebOperatorAlgebras owns the affine, annular and unitary theory. PresentationsOfMonoidalCategories builds categories from F-symbol data. CategoricalOperatorAlgebras' Karoubi completion is the C*-one. DiagrammaticCoherence and Foams name this roadmap as the owner of §2.5.

Source independence: 20 passages compared with 5 sources: every verified locator, plus §§0.1, 2.6, 4.4, 5.2, 6.6 and 6.7 and two `Suggested.lean` docstrings. A word-run scan of the whole README and `Suggested.lean` found none shared beyond titles and formulas. Largest share chen-tl-categories, about 21 of 48 locators. Contents compared with chen-tl-categories (Chapters 2–6): independent. Layers 0, 1, 2 and 5 have no chapter there, Chen's Chapters 3 and 6 have no layer here, and Chen's 2.1–2.4 and 5.1–5.4 are spread across Layers 3, 4, 6 and 7.

Research link: Layers 6–7 state Goodman–Wenzl's unique-tensor-ideal theorem (2003, appendix to Freedman's magnetic-model paper) and build the `A_n` fusion categories surveyed by Edie-Michell–Morrison (2017). Layer 5 is Ridout–Saint-Aubin's Gram determinant (Theorem 4.7) with Graham–Lehrer's criterion (1996). This rests on the README's references and goodman-wenzl-ideals lines 8–15.

## Not verifiable

- Graham–Lehrer, *Cellular algebras* (Invent. Math. 123, 1996), §3: not in the cache or the manifest, and not fetched here, since this review edits no manifest. The previous round found the DOI paywalled. The Lean criterion was checked against Tau Ceti's `CellularBasis` and by examples.
- Westbury (Math. Z. 219, 1995): not in the cache, and no locator is given. The statements cited to Westbury were checked in ridout-saint-aubin.
- Kauffman–Lins (Princeton University Press, 1994): a book with no open copy; it is now cited only in the References.
- Wenzl (C. R. Math. Rep. Acad. Sci. Canada 9, 1987): no copy in the cache. The recursion was checked by computation and against Tau Ceti's `jonesWenzl_add_two`.
- Edie-Michell–Morrison (arXiv:1710.07362): cited as context only, not opened.

## Source issues

- **Error** in goodman-wenzl-ideals at Proposition 1.1, printed p. 4: the source asserts constancy of dimension of `eAf` for the span `A` of any set of diagrams; it should require `eA ⊆ A` and `Af ⊆ A`, which its four-corner count uses; affects the proof.
- **Gap** in goodman-wenzl-ideals at Theorem 3.3, printed p. 11: the source takes its first dimension equality from constancy of dimension, but `z_α` need not preserve `T_n ⊗ 1_m`; it should show that the image lattice is saturated; affects the proof.
- **Gap** in goodman-wenzl-ideals at §1.1, printed p. 3, used in Theorem 3.3: the left inverses of the embeddings divide by powers of `d`, and "proper root of unity" is never defined; it should treat or exclude `d = 0` (`τ = ±i`); affects the proof.

## For the human reviewers

- chen-tl-categories, the source with the largest share of locators (about 21 of 48), is a 2014 Australian National University honours thesis posted on arXiv (chen-tl-categories lines 8–11). The tensor-ideal headline is located in Goodman–Wenzl, which appeared in Comm. Math. Phys.
