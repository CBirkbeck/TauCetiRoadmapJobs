# Review of TemperleyLieb (pull request #2711 at e774e41)

**Verdict:** needs changes

**Summary.** The mathematics holds up. All five `Suggested.lean` statements are true as stated, including the new Graham–Lehrer criterion, and none closes with one tactic. Every Check I recomputed is correct, and every Tau Ceti and roadmap citation resolves at the pin and on main. One finding blocks: the revision adds fourteen "(Chen)" attributions without locators, and at six targets (§§2.1, 2.6, 2.7, 3.4, 3.6, 5.6) Chen's thesis does not contain the result attributed to it. There are four small corrections and no format notes, and nothing is left for a human to decide. Of the earlier review's four notes, three are repaired; its Morrison and Chen wording points recur below as C01 and R01.

## R01 (P2) — Six targets attribute to Chen's thesis results it does not contain, and the new attributions carry no locator

A reader who follows "(Chen)" to find a statement or a proof route finds nothing at these six places. The roadmap's contract is a statement with an exact locator into a source that states it. On main this README cited Chen only in its references and its exclusions. This revision adds fourteen in-text attributions, none with a theorem or page number. I read them against arXiv:1502.06845v1:

- In §2.1 (line 289), associativity of gluing and the identity on circle counts is attributed to Chen. Chen defines composition by stacking (Definition 1.0.6, p. 5, chen-tl-categories line 187) and removes loops at once through d-equivalence (Definition 2.1.1, p. 7, line 203). Proposition 2.1.2 (p. 7) leaves the monoidal axioms as an exercise. There is no associativity statement and no circle count.
- In §2.6 (line 439), the equivalence of the presented category with the matching model is attributed to Chen. Chen has no monoidal presentation. Remark 2.2.3 (p. 10, line 303) states only the algebra presentation and refers its proof to Kauffman's Theorem 4.3.
- In §2.7 (line 469), the surjection–injection factorization and the re-factorization lemma are attributed to Chen. Chen has only Lemma 2.2.5 (p. 10, line 318): composition does not increase the number of through-strings.
- In §3.4 (line 591), the corner-dragging isomorphisms are attributed to Chen. The thesis has no such statement.
- In §3.6 (line 632) and §5.6 (line 970), the representation on `(R²)^⊗n` and its faithfulness are attributed to Chen. Neither is in the thesis. Remark 5.4.6 (p. 47, line 1942) only mentions the equivalence with representations of `U_q(sl₂)`.

The references entry (lines 1566–1568) calls the thesis a development of "Layers 1 through 7". Its contents (lines 35–56) have no counts of planar matchings, no monoidal presentations and no cellular algebras or Gram determinants, which are Layers 1, 2 and 5.

The smallest repair has two parts:

- Where Chen does state the result, give the locator: §3.1, Remark 2.1.3 (p. 8); §3.2, §5.1 (pp. 37–38); §4.1, Definition 2.2.1 (p. 9); §4.2, Remark 2.2.3 (p. 10), with Kauffman's Theorem 4.3; §7.4, Lemma 4.0.7 (p. 33) and Theorem 4.0.8 (p. 35); and for §7.5, which cites no source, Theorem 5.4.5 (p. 47).
- At §§2.1, 2.6, 2.7, 3.4, 3.6 and 5.6, either cite a source that states the result, with its locator, or remove the attribution so that the target stands as the roadmap's own.

The references entry would then read: "a self-contained development of the linear category, the Jones–Wenzl projections, the Karoubi envelope and the root-of-unity quotient (parts of Layers 3, 6 and 7)". Kauffman–Lins is cited nine times, also without chapter or page; it would need locators too.

## C01 — The description of Morrison's formula in §6.3 does not match his Proposition 5.1

In §6.3 (lines 1047–1050) the formula is "a sum over the admissible removal sequences of the diagram of a product of quantum-integer ratios, divided by a quantum factorial". Proposition 5.1 (p. 9, morrison-jw-formula lines 355–360) gives the coefficient as `(1/[n]!) ∑_(s∈S) [τ(s)]`, where each `[τ(s)]` is a product of quantum integers. The ratios `[i]/[n+1]` belong to Proposition 4.1 (pp. 7–8, lines 287–299). The text would be right as "a sum over the admissible removal sequences of products of quantum integers, divided by the quantum factorial `[n]!`".

## C02 — §6.8 states Goodman–Wenzl over every field of characteristic zero, but the paper works over ℂ

§6.8 (lines 1149–1151) states the theorem "over a field of characteristic zero" and cites Theorem 3.3, pp. 10–11, for existence, negligibility, generation and uniqueness. Goodman–Wenzl work over `ℂ(t)` and its specializations at `τ ∈ ℂ` (goodman-wenzl-ideals lines 21–24 and 95–101). Theorem 3.3 (p. 10, line 778) gives uniqueness. Generation by `f_(ℓ−1)` is Proposition 2.1 (p. 8, line 702). §5.4 already handles the same situation by saying that "the extension to every field of characteristic zero is part of the target". The same clause would fit here, with the locator "(Goodman–Wenzl, Proposition 2.1, p. 8, and Theorem 3.3, p. 10, over ℂ)".

## C03 — The Conventions say Tingley shows the sign is intrinsic; his note shows how to remove it

The Conventions (lines 72–73) say that "Tingley's note explains why the sign is intrinsic". The note explains where the sign comes from: the square roots of `q` chosen for the braiding and for the ribbon element (tingley-minus-sign lines 73–76). With a non-standard ribbon element, "the annoying minus sign disappears" (lines 57–60). "Tingley's note explains where the sign comes from and how a different ribbon element removes it" would match the source.

## C04 — §3.2 calls the rotation a pivotal structure, which is not the kind of object a pivotal structure is

§3.2 (lines 548–550) asks to "prove that the rotation of Layer 1, transported through diagBasis, is a pivotal structure". Tau Ceti's `TauCeti.PivotalCategory` is a monoidal natural isomorphism `𝟭 C ≅ doubleRightDualFunctor C` (`TauCeti/CategoryTheory/Monoidal/Pivotal/Basic.lean` line 76), so an implementer cannot tell what to construct. With the nested-cup duality of §2.4, every object is its own dual, and the double dual of a diagram is the diagram turned through a full rotation, which is the diagram itself. The pivotal structure is therefore the identity isomorphism, and the rotation enters only through that computation. A possible wording: "prove that, for the duality of §2.4, the double dual functor is the identity, so that the identity isomorphism is a pivotal structure". The Check's "twists the rotation" would then read "twists this pivotal structure".

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.2 Brauer comparison | `e₁`; `id n`; crossing on 2 strands; associativity | `e₁ ↦` cap `{inl 0,inl 1}`, cup `{inr 0,inr 1}`; top `2n−1−i ↦ inr i`; crossing pulls back to `{0,2},{1,3}`; loop identity matches | sound | none |
| §3.2 pivotal, spherical | parity automorphism; dimension of `of 1` | `(−1)ⁿ` natural since `n ≡ m (mod 2)`, monoidal; dimensions `δ` and `−δ`; Tau Ceti pivotal = monoidal iso `𝟭 ≅` double dual | sound | C04 (wording) |
| §3.5 braidings | product of braidings; positive convention; kink | `(A + A⁻¹e)(A⁻¹ + Ae) = 1 + (A²+A⁻²+δ)e = 1`; positive: `1 + 2(A²+A⁻²)e`; `Aδ + A⁻¹ = −A³`, Tingley's kink value | sound | none |
| §3.6 evaluation representation | `B = [[0,q],[1,0]]`; `A`-form | `BB⁻¹ = B⁻¹B = I`; circle `q + q⁻¹`; `A`-form determinant 1, inverse `[[0,−A],[A⁻¹,0]]`, circle `−A² − A⁻²` | sound | R01 (attribution) |
| §4.2 presentation, augmentation | `n = 0, 1, 3`; identity coefficient | `TL_0 = TL_1 = R` with one matching; five diagrams, `e₁e₂e₁ = e₁`; identity diagram arises only from identity factors, so the coefficient is multiplicative | sound | none |
| §4.3 tower | `x ↦ x ⊗ 𝟙` on the basis | distinct diagrams go to distinct diagrams, no circle formed; injective for every `R`, `δ` | sound | none |
| §4.4 Markov trace, pairing | `n = 1, 2, 3`; symmetry | `tr̂(e₁) = δ = tr̂(1₁)`; `ι e₁ · e₂` has trace `δ`, `ι e₁ · e₁` has trace `δ³`; `⟨y,x⟩ = tr̂(star(star x · y))` | sound | none |
| §4.5 conditional expectation | three strands | `𝔼(e₂) = 1₂`; `𝔼(ι e₁) = δ e₁`; `𝔼(e₁e₂) = 𝔼(ι e₁ · e₂) = e₁` by the bimodule property | sound | none |
| §4.7 comparison with Tau Ceti's trace | sign | `δ = −(q + q⁻¹)` is `q′ = −q` in `δ = q′ + q′⁻¹`; `IsMarkovTrace.eq_markovTrace` at `MarkovTrace.lean` line 518 | sound | none |
| §5.4 semisimplicity | `δ = 0`, `n = 2, 3, 4, 5, 7`; characteristics 2, 3 | `n = 7`: `[3]¹³([4]/[2])⁶[5] = −64`, `[5]⁶[6]/[2] = 3`, `[7] = −1`, `1`; `n = 4`: `[2]²[3] = 0` | sound | none |
| §6.6 constancy of dimension | `TL₃`, `δ(τ) = 1` | `px = x = xr`, `xp = x² = 0`; `EAF` spanned by `(t−τ)x`, dimension 1; `p(τ)r(τ) = 0`, dimension 0 | sound; source error confirmed | none |
| §7.1 envelope | pin | monoidal `Mat_` (`Mat/Basic.lean` line 195), `Karoubi` (`Karoubi/Basic.lean` line 121), rigid and linear instances; no `MonoidalLinear` on either | sound, target genuine | none |
| §7.3 abelian bridge | quiver `• → •`; `K[ε]/(ε²)`; `Mat_ K` | `P₂ → P₁` mono and epi (no map `P₁ → P₂`), not iso; `ε ≫ ε = 0`, `ε ≠ 0`, no kernel | sound | none |
| §7.4 generic classification | `a = b = 1`; `a = b = 2` | `[2]² = 1 + [3]`; `[3]² = [1] + [3] + [5] = d⁴ − 2d² + 1`; matches Chen Lemma 4.0.7 | sound | none |
| §7.5 root-of-unity quotient | `δ = 1`; golden ratio | `ℓ=3`: `X₁⊗X₁ = X₀`; `φ`: `[3]=φ`, `[4]=1`, `[5]=0`, `X₂⊗X₂ = X₀⊞X₂`; Edie-Michell–Morrison truncation `2k−(i+j)`, `k = ℓ−2` | sound | none |
| `exists_basis_planarMatching` | `n = 0, 1, 2`; zero ring | `PlanarMatching 0`, `PlanarMatching 2` singletons, algebra `R`; `n = 2`: basis `1, e₁` = `catalan 2`; zero ring: both sides trivial | sound | none |
| `existsUnique_isMarkovTrace` | `n = 0, 1`; tower normal form | `tr 0 1 = 1`, `tr 1 1 = δ` fix rank one; uniqueness `IsMarkovTrace.unique` (`Trace.lean` line 88); closure trace meets all four fields | sound | none |
| `isSemisimpleRing_iff_forall_det_gramMatrix_ne_zero` | `ℤ`; `K[x]/(x²)`; `M₂(K)`; empty `M μ` | `ℤ`: det 1, not semisimple, excluded by the field; `K[x]/(x²)`: dets 1, 0, not semisimple; `M₂`: identity, semisimple; empty cell: det 1 | sound | none |
| `isSemisimpleRing_of_qInt_ne_zero` | `n = 0, 1, 3, 5`; characteristic `p` | numerators `[k+j+1]` all have index `≤ n`; `n = 5`: `[3]⁴(δ²−2)`, `[5]`, 1; identity holds in `ℤ[X]` | sound | none |
| `isSemisimpleRing_iff_of_charZero` | `δ = 0`, `n = 2…5, 7`; `δ = 1, √2`; `𝔽̄₂` | `δ=0`: odd semisimple, even not; `[3]=0` (`δ=1,n=3`), `[4]=0` (`δ=√2,n=4`): both sides false; `𝔽̄₂, n=5`: `−2=0`, excluded | sound | none |
| §2.6 universal property | bimodules over `ℚ³` and `ℚ²` | path graph: `d = (1,2,1)`, acts by 1 and 2 on `M₁₂`; `ℚ²`: `d = e₁` balanced on `V`, 1 against 0 on `M₁₂` | sound | R01 (attribution) |
| §6.8 Goodman–Wenzl | `δ = 1`; `δ = 0` | `f₂ = 1 − e₁`, `tr̂ f₂ = δ²−1 = 0`; at `δ=0`, `𝟙₁` negligible, `End(0)` meets the ideal in 0: proper | sound | C02 |
| §2.1, §2.7 attributions | Chen Def 1.0.6, Prop 2.1.2, Lemma 2.2.5 | composition by stacking, axioms left as exercise, no circle counts; through-string bound only, no factorization | unsupported as cited | R01 |
| §3.4 corner-dragging | `𝟙 (of 1)` | `(𝟙₀ ⊗ cup) ≫ (𝟙₁ ⊗ 𝟙₁) = cup`, Tau Ceti's `dragRight_id_one`; inverse by the zigzag | sound | R01 (attribution) |
| §6.2 single-clasp recursion | `n = 1, 2`; all-negative variant | `f₂ = 1 − e₁/[2]`; coefficient of `e₁` in `f₃` is `−(1 + 1/[3])/d = −[2]/[3]`; all-negative variant gives `−([3]−1)/(d[3])` | sound | none |
| §6.3 coefficient formula | `e₂` in `f₄`; Proposition 5.1 | via the recursion `−[2]/[3] − [2]²/([3][4]) = −[2]²/[4]`; Morrison: products over `[n]!` | sound | C01 |
| §5.3 Gram anchors | `(2,0), (3,1), (4,2), (4,0), (5,1)` | `[2]`; `δ²−1`; `[4]`; `[2]³[3]/[2]`; `[3]⁴[4]/[2] = [3]⁴(δ²−2)`; Ridout–Saint-Aubin (4.20) with `p = (n−k)/2` | sound | none |
| §5.2 cell action | right cap `u_R` on three points | `e₁ ≫ u_R = u_L`, `e₂ ≫ u_R = δu_R`, `e₂ ≫ u_L = u_R`: unpinned action gives `u_R` against `δu_L` | sound | none |
| §1.1 intertwining | `k = 6` example; definitions at the pin | both rotations transport along `finRotate`, both reflections along `Fin.revPerm`; rotated arcs `{0,3},{1,2},{4,5}` | sound | none |
| Conventions, Tingley | his introduction | the sign disappears with the non-standard ribbon element (lines 57–60) | misdescribed | C03 |
| §7.2 negative tests | `f ⊗ g = f^(2^m) g^(2^n)`; `ℤ/6` | both bracketings `f^(2^(m+p)) g^(2^(n+p)) h^(2^(n+m))`; `1 ≡ 4 (mod 3)`, `1 ≢ 16 (mod 9)`; `3 ↦ (1, 0)` | sound | none |

- Earlier review (head 6d5a5c7): the note on executable milestones is repaired (`qIntAux` is now Tau Ceti's, the stack-machine sentence is gone, and the `#eval` milestone is restated). The process narrative is removed. On locator wording, the RandomMatrices title is repaired, but the Morrison and Chen wordings are not (C01, R01). The note on Checks is repaired (37 Check lists, 67 Checks).
- Source locators checked against the text: 27 (Chen 12, Goodman–Wenzl 7, Morrison 3, Ridout–Saint-Aubin 2, Tingley 2, Edie-Michell–Morrison 1).
- Library declarations: all 163 qualified names the README cites resolve, with namespaces checked by hand, at Tau Ceti `2fd255d997` and Mathlib `1b1ccf4b`. I opened 21 Tau Ceti files, including `PlanarMatching/{Basic,TLDiagram,HalfDiagram}.lean`, `NoncrossingPartition/{PerfectMatching,Rotate,Reverse}.lean`, `TemperleyLieb/{Trace,JonesWenzl,QuantumDimension}.lean`, `Cellular/Basic.lean`, `Brauer/{Diagram,Associativity,WeightedAssociativity}.lean`, `Pivotal/Basic.lean` and `Envelope/{Quotient,Mat/Basic,Karoubi/Basic}.lean`. None of the remaining targets is already at the pin (no single-clasp recursion, through-strand count, Brauer comparison, `MonoidalLinear` envelope or ideal extension).
- Cross-roadmap citations resolved on main: PivotalSpherical, RandomMatrices ("feeds Layers 3, 4 and 6", line 287), FreeProbability §F2 (line 184), SchurWeyl (lines 63–70 and 1476, and at its open head). In the other direction, citations of this roadmap from GeometricTopology, TemperleyLiebOperatorAlgebras, QuantumGroups, DiagrammaticCoherence and Foams resolve against this head: the sentence at line 1392 maps `TLCat.lift`, and the table at lines 1374–1390 maps the items now proved in Tau Ceti.
- Automatic checks: every check passed. Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. No change outside the folder.
- Elaboration: `Suggested.lean` elaborates with five `sorry` warnings only. `#check @` on all five against the README shows matching generality, with no `variable` block. One-tactic probes (`simp`, `rfl`, `infer_instance`, `aesop`, `exact ⟨Module.Free.chooseBasis …⟩`) fail on all five.
- Ownership: the closest roadmaps all cite this one by layer and own none of its objects. TemperleyLiebOperatorAlgebras owns the affine, annular and unitary material; PresentationsOfMonoidalCategories builds from F-symbol data, not generators and relations; CategoricalOperatorAlgebras' Karoubi completion is the C*-version. DiagrammaticCoherence and Foams name this roadmap as the owner of monoidal presentations.
- Copying: 7-word runs shared with the six sources read are reference titles and formula fragments only.

Overlap check: read TemperleyLiebOperatorAlgebras, QuantumGroups, PivotalSpherical, PresentationsOfMonoidalCategories and CategoricalOperatorAlgebras; nothing shared.

Source independence: 14 passages compared with 6 sources (Chen, Ridout–Saint-Aubin, Morrison, Goodman–Wenzl, Tingley, Edie-Michell–Morrison), plus a 7-word comparison of the whole README; none shared. Largest share is chen-tl-categories, 15 of about 61 source attributions. Contents compared with chen-tl-categories (Chapters 2–6): independent. The roadmap's Layers 0, 1, 2 (presentation), 4 and 5 have no chapter there, and Chen's Chapters 3 and 6 have no layer here.

Research link: Layers 6–7 are Goodman–Wenzl's unique-tensor-ideal theorem (2003, appendix to Freedman's magnetic-model paper) and the `A_n` fusion categories catalogued by Edie-Michell–Morrison (2017). Layer 5's Gram determinants are Ridout–Saint-Aubin's Theorem 4.7. This rests on the README's references, goodman-wenzl-ideals lines 8–15 and edie-michell-morrison lines 7–12.

## Not verifiable

- graham-lehrer-cellular (Invent. Math. 123, 1996), Theorems 3.4 and 3.8: the DOI resolves only to a paywalled publisher page, so it is uncertified. The new Lean criterion was checked against Tau Ceti's definition and by examples, not against the text.
- westbury-tl-rep (Math. Z. 219, 1995): paywalled, uncertified. The Gram determinants were verified in Ridout–Saint-Aubin instead.
- Kauffman–Lins (Princeton University Press, 1994): a book with no open copy, cited without chapter or page (nine places).
- Wenzl, C. R. Math. Rep. Acad. Sci. Canada 9 (1987): no open copy. The recursion was checked by computation.

## Source issues

- **Error** in goodman-wenzl-ideals at Proposition 1.1, printed p. 4: the source asserts dimension constancy of `eAf` for the span of an arbitrary set of diagrams; it should require `eA ⊆ A` and `Af ⊆ A`, which its four-corner sum uses; affects the proof.
- **Gap** in goodman-wenzl-ideals at Theorem 3.3, printed pp. 10–11: the source takes the first equality of its dimension chain from constancy of dimension; it should show the image lattice under `x ↦ z_α(x ⊗ 1_m)` is saturated; affects the proof.
- **Gap** in goodman-wenzl-ideals at §1.1, printed p. 3, and Theorem 3.3: the source uses left inverses dividing by `d` and never defines "proper root of unity"; it should treat or exclude `d = 0` (`τ = ±i`); affects the proof.

## For the human reviewers

- none
