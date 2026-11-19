# Review of AnalyticStableMaps (pull request #2529 at 1da2f12)

**Verdict:** needs changes

**Summary.** Needs changes, for one finding. The statement of the topological regularity theorem in §7.3 puts the submersion on the wrong locus and writes its target quotient upside down; as written it is false on the roadmap's own product curve of §2.23. The sentence is not part of this pull request's diff (it is the same on main), and everything the pull request adds (§0.6–§0.8, §2.24) checks out, as do the eight repairs of the previous round. There is one format note, and one question for the human reviewers about where the repair should land.

## R01 (P2) — §7.3 states the submersion on all of `X_I^reg` and onto `E_I/E_J`; it holds only near the locus where the smaller thickening is regular, and onto `E_J/E_I`

This is the README's statement of a headline theorem, and GromovWittenTheory cites §7.3's charts, so an implementer would set out to prove a false statement. The sentence in §7.3 (line 967) reads: "`X_I^reg` is open, a topological manifold of dimension `v + dim E_I`, and the projection to `E_I/E_J` is a topological submersion."

With `I ⊆ J`, the convention of §9.1 and of Pardon, `E_I/E_J` is a subspace divided by a larger space and means nothing. With `J ⊆ I` the claim is false, because §9.2 defines `X_I^reg` by surjectivity of the linearization augmented by all of `E_I`. Take the product curve `Σ × {p}` of §2.23 with `g = 1` and `dim_ℝ F = 2`, a thickening whose `E_I` has real dimension 2 and surjects onto the cokernel (§4.3's Check), and `J = ∅`. The point lies in `X_I^reg`, a 2-manifold since `v + dim E_I = 0 + 2`. The fibre of the projection to `E_I` over 0 contains the curves `Σ × {p′}` for `p′` near p, a 2-dimensional set, whereas a topological submersion from a 2-manifold to `ℝ²` has discrete fibres.

The sources say something else. In Theorem B.1.1 (pardon13 lines 6154–6187) the regular locus is the `E′`-regular one, for a fixed subspace `E′ ⊆ E`, and it is this locus that submerses onto `E/E′`. Proposition 9.2.6(ii) (pardon13 lines 4274–4280) says that for `I ⊆ J` the map `s_(J∖I) : X_J → E_(J∖I)` is locally modelled on `ℝ^(v + dim E_I) × ℝ^(dim E_(J∖I)) → ℝ^(dim E_(J∖I))` over `ψ_IJ⁻¹(X_I^reg) ⊆ X_J`. §9.1 already states the axiom in that form ("the local `E_(J∖I)` product projections"), so only this sentence needs to change, for example: "`X_I^reg` is open in `X_I` and a topological manifold of dimension `v + dim E_I`, and for `I ⊆ J` the map `s_(J∖I) : X_J → E_(J∖I) = E_J/E_I` is, near every point of `ψ_IJ⁻¹(X_I^reg)`, locally a projection `ℝ^(v + dim E_I) × E_(J∖I) → E_(J∖I)`." Item 5 of the module docstring of `Suggested.lean` ("a topological submersion to the obstruction quotient") would carry the same locus.

## N01 — The conic Check of §2.9 has a stray phrase

"the real dimension of the space of smooth conics `ℙ⁵` minus nothing" (line 454): the smooth conics are the complement of the discriminant cubic in `ℙ⁵`, an open subset of real dimension 10. Would read better as "of the open set of smooth conics in `ℙ⁵`".

## Previous findings

The previous review read this same head and accepted it; its eight repairs were checked again in the text.

- R01 (unpinned subbundle names) — repaired: "`IsSubbundleFrameOn`, `subbundleTopology` and `IsSubbundleFrameOn.trivialization` (TauCeti/Topology/VectorBundle/Subbundle.lean)"; all exist at the pin.
- R02 (F2.6e) — repaired: "`N_u` is HeegaardFloer F2.6e's normal line … and `D_u^N` is F2.6e's quotient real Cauchy–Riemann operator up to the constant factor"; F2.6e is in §0.7's *Needs* and in the contract.
- R03 (Koszul–Malgrange) — repaired: "ComplexKahlerGeometry §4.2's Koszul–Malgrange theorem, with the holomorphic sections and frames of its §4.1, applies to it and is consumed here".
- C01 — repaired: "Wendl 2010, Theorem 3, Corollary 3.13 and Lemmas 3.14–3.15", with the arXiv versions named in the References.
- C02 — repaired: "in local real frames `e_1, …, e_{2r}` of E, r its complex rank, with real coefficients `f_i`".
- C03 — repaired: the description reads "HeegaardFloer F2.6e supplies this roadmap and keeps its embedded-sphere operator, which §0.7 identifies with its own."
- N01 — repaired: "It is super-rigid for every J for which it is J-holomorphic".
- N02 — repaired: "whose derivative in the coordinate t is `(2t, 3t²) = 2t·(1, (3/2)t)`".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §7.3 regularity (headline 5) | product curve `g=1`, `dim F=2`, `dim E_I=2`, `J=∅` | `X_I^reg` 2-manifold; fibre over `0 ∈ E_I` is 2-dimensional; submersion to `ℝ²` needs discrete fibres | false as written | R01 |
| §7.3 inverse lemma | Pardon B.12.1 | pardon13 7353–7365: injective, locally surjective at 0, Hausdorff target; proof by compact ball; Mathlib `Continuous.homeoOfEquivCompactToT2` at Topology/Homeomorph/Lemmas.lean:479 | matches | none |
| §4.1 augmented index | two lines, one node; Pardon B.1.1(ii) | `10+10−12+4−4+2 = 10 = v`; `(6g−6+2n+2ℓ)+2m(1−g)+2c₁+dim E−2ℓ = v+dim E` (pardon13 6184) | holds | none |
| §6.1 weighted norms | `ξ = c + e^(−μs)w`; linear neck section | end: `2π·Σμ^(2j)/(2(μ−δ))`; neck: `∫s²e^(2δ(R−\|s\|)) ≈ e^(2δR)/(2δ³)`, derivative term `e^(2δR)/δ`; Pardon weight `min(s,6S−s)` | holds; matches B.4.1–B.4.2 | none |
| §2.5 early index | `g = 0, 1, 2` | `2m+2c₁−6+2r`, `2c₁−2+2+2r`, `−2m+2c₁+6+2r`, each equal `(m−3)(2−2g)+2c₁+2r`; Wendl Def. 4.2 line 5083 | agree | none |
| §2.6 universal surjectivity | `ℝ²`, `v=w=e₁`, `Y=diag(1,−1)` | Y symmetric, anticommutes with i, `⟨Yv,w⟩ = 1`; `ω(Yv,w)+ω(v,Yw)=0 ⟺ ω(v,Yw)=ω(w,Yv)`; Wendl 4.55–4.57 lines 6263–6326 | holds | none |
| §2.9 generic-J (headline 3) | lines, conics, K3 genus 2, `(2,2,−2)` | `d_0 = 4, 10, 2, −2`; K3: `h⁰(K_C)=2`, `h¹=1`, index `4−2=2`, family dimension 4 | holds; Wendl 4.43, 4.48 | N01 |
| §2.2 node matching | one node, self-node, `kp = 2` | codimension `2m` each by a bump at one flag; `W^(1,2)` on a surface has no point evaluation | holds | none |
| §2.11 ordered marks | lines with 1, 2 marks; exceptional curve | `4+2=6`, `4+4=8`; `d_0 = −2+2 = 0`, marked 2, image a curve in a 4-manifold | holds | none |
| §2.20 variants | torus one mark; diagonal for lines | `f_j+2 = 2c₁`; `d_2 − 2m = 8−4 = 4` with empty solution set; J-derivative of `(du+J du j)/2` is `½Y du j` | holds | none |
| §2.23 product rigidity | `(g,n) = (1,2)`, `(0,n)`, `n = 1` | `⟨c₁,A⟩ = 2−2g`; expected `(n−1)(2−2g)`; actual `2n−2`; cokernel `g(n−1)` complex | holds | none |
| §3.3 second countability | long line; constant maps | long line: countable sets bounded, so sequentially compact, not Lindelöf; `X × \|M̄_(g,n)\|` | holds | none |
| §3.7 compactness (headline 4) | `(g,n,a) = (0,0,1), (0,4,0), (0,2,1)` | `#ghost ≤ 2g−2+n+2a`: 0, 2, 2; `#edges ≤ 3a+3g−3+n`: 0, 1, 2; weighted degrees `2+1 = 3` | holds | none |
| §8.1 orientation signs | `dim E` pairs `(1,1), (1,2), (1,3)`; `v=10, dim P=1` | `(−1)^(1·1) = −1`, `+1`, `−1`; total parity 11 odd | holds | none |
| §9.2 functional (headline 6) | point target, `(g,n) = (0,3), (1,1), (2,0)` | `v = 6g−6+2n = 0, 2, 6`; weights `1, ½, ½`; `X_I^reg` defined as `E_I`-regular with trivial automorphisms | holds; feeds R01 | none |
| §11.1 forgetting | `(0,3) → (0,2)` constant; one-marked nonconstant sphere | target empty by §1.2; unmarked nonconstant sphere is map-stable | holds; D7 item 1 on main | none |
| §11.2 clutching | two lines; two-marked sphere; ghost with marks `1, *, **` | `0+2 = 0+1+1`; `1+1 = 0+1+1`; `−2+0+3 = 1` and `−2+2+1 = 1` | holds; pinned names exist | none |
| §0.5 normalization (headline 1) | constant `π`; genus-one double cover of a line | pinned `FiniteHolomorphicMap` has `nonconstant`, so `a` is determined by `a∘π₁ = π₂`; `D(u) = 12 = 2·4 + 4` | Lean statement sound | none |
| §1.2 stability (headline 2) | `ι` empty; all components constant; genus 2 unmarked | both sides true; reduces to pinned `AuxiliaryAut.finite_iff`; `≤ 84` automorphisms | Lean statement sound | none |
| §0.7 normal index | line, double cover, cuspidal and nodal cubic, `m = 1` | `4`; `10−4 = 6`; `16−2 = 14`; `16`; `0` | holds | none |
| §2.24 criterion | index of `L_u`; double cover of a line | `t_g − a_g = 6g−6 = −3χ`; `2·2+6+6 = 16`; Wendl 2010 Thm 3 lines 1451–1461 | holds | none |
| §10.1 tame non-convexity | `J_a`, `a = ±1` | `J_a² = −1`; `ω(v,J_a v) = (x−ay)²+y²`; midpoint squares to `−2` | holds | none |

- Source locators checked against the text: 21. pardon13: Definitions 9.2.1–9.2.4, Proposition 9.2.6, Lemmas 9.2.7–9.2.8, Theorem B.1.1, Definitions B.4.1–B.4.2 with (B.4.3), Lemma B.12.1. wendl: Definition 4.2, Proposition 4.3, Definition 4.5, Theorems 4.43 and 4.48, Proposition 4.55, Lemmas 4.56–4.57. wendl10: Theorem 3, Corollaries 3.13 and 3.17. wendl23: Proposition 2.2, Definition 2.3.
- Library declarations opened at the pins: 24, among them `FiniteHolomorphicMap` (Degree.lean:134), `AuxiliaryAut.finite_iff` (FiniteAutomorphisms.lean:138), `ofComponent_injective` (ComponentAut.lean:168), `DegreeDecoration.isStable_clutch_iff` (StableMaps/DualGraph/Clutching.lean:164), `arithmeticGenus_selfClutch` (DualGraph/Clutching.lean:298), `IsFredholm.eventually_nhds` and `index_continuousAt` (Mathlib Fredholm/Open.lean:77, 97), `addHaar_image_eq_zero_of_det_fderivWithin_eq_zero` (Jacobian.lean:645).
- Cross-roadmap citations resolved on main: ComplexCurveModuli D5, D7 items 1–3; ImplicitAtlases §0.2, §0.7, §0.10, §1.1, §5.4, §5.5, §6.5; HeegaardFloer F0.0, F1.5, F2.6a–F2.6e; PseudoholomorphicCurveAnalysis PH6.2 and PH7.2 (zero count, line 1345).
- Automatic checks at this head all passed. Dependency check: `depcheck: 200 roadmaps, 2191 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` exited 0 with three `sorry` warnings (lines 105, 128, 161) and nothing else. The elaborated types of the four declarations were compared with §0.5 and §1.2; no binder is lost. None of the three theorems closes with one tactic; nothing is padding. No `set_option`, no sorried data.
- Pull request text: the title and description match the head (four headings added, none removed, `Suggested.lean` unchanged, three suppliers added and named). The diff outside the roadmap folder is empty.
- Overlap check: read HeegaardFloer (main and open), DGFloer, AlgebraicGromovWittenTheory, TeichmullerGeometry, MotivicStructuresInModuliOfCurves, GromovWittenTheory, ComplexCurveModuli, and TaubesGromov. Shared objects: the embedded-sphere normal operator, owner HeegaardFloer F2.6e, cited by §0.7; the embedded-curve normal operator of TaubesGromov TG1 is the special case `Z(du) = 0` in a consumer of this roadmap, so the general object is owned here and no citation back is possible. No name of `Suggested.lean` is declared in another roadmap.
- Source independence: 9 passages compared with 4 sources (pardon13 9.2.1–9.2.3, B.1.1, B.4.1–B.4.2, B.12.1; wendl 4.3–4.5, 4.57; wendl10 Theorem 3; wendl23 Definition 2.3), none shared beyond formulas and the items of a definition (longest common run five words); largest share pardon13, about 40 of 85 locators; contents compared with pardon13: independent (§6.1–§7.3 and §8.2 group Appendix B.2–B.13 into seven sections in the order their *Needs* lines force; Layers 0–4 and 10–13 have no counterpart).
- Research link: Layers 5–9 construct the implicit atlas on stable maps of Pardon (2013, §9.2 and Appendix B); Layer 3 is the compactness theorem of Ivashkovich–Shevchishin (1999); §0.6–§0.8 and §2.24 are the normal operator of Wendl (2010) and the super-rigidity of Wendl (2023). Rests on the README's References and the texts read.

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology* (Propositions 2.5.1 and 3.1.1, §3.2, Chapter 4): not available from an open source; cited by locator.
- Ivashkovich–Shevchishin, Invent. Math. 136 (1999), §1: paywalled, settled as uncertified; cited by locator.
- Robbin–Ruan–Salamon, Math. Z. 259 (2008): paywalled; cited by locator in the References only.
- Ivashkovich–Shevchishin arXiv:math/9903047 (§3.4, §3.6, §3.7) lies outside this round's sample and was not reopened.

Automatic checks set aside as false positives: the listing of elaborated signatures reads the words "instance supplies" in the module docstring of `Suggested.lean` as a declaration named `supplies` and reports an unknown identifier; the file declares no such instance.

## Source issues

- none

## For the human reviewers

- R01's sentence is identical on main; this pull request's diff does not touch §7.3 (`TauCetiRoadmap/AnalyticStableMaps/README.md` line 967). Whether it is repaired in this pull request or in a separate revision is yours to decide.
