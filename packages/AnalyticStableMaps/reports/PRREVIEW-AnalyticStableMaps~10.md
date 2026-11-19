# Review of AnalyticStableMaps (pull request #2529 at 19aa153)

**Verdict:** needs changes

**Summary.** No mathematical error was found in the new §0.6–§0.8 and §2.24: every index identity, Check and worked example recomputes, and the normal regularity criterion and the definition of super-rigidity agree with Wendl's texts. Three problems of supply and ownership block acceptance. First, the Tau Ceti operator, frame, subbundle and normal-linearization declarations that the new sections are built on are not in the pinned Tau Ceti. Second, §0.7 duplicates the embedded-sphere normal operator of HeegaardFloer F2.6e, which supplies this roadmap, without identifying the two. Third, §0.6 restates ComplexKahlerGeometry 4.2's finite-rank holomorphic-frame theorem instead of citing it. There are also three small corrections (Wendl locators, a real-frame qualifier, and the description's follow-up plan) and two format notes. Nothing is left for a human to decide.

## R01 (P2) — The Tau Ceti declarations that §0.6–§0.8 rest on are not in the pinned Tau Ceti

At the pins, the new sections' supplier contracts point at nothing. An implementer working against the pinned library cannot find the operator class that §0.6–§0.8 "state every operator as an instance of" (line 76), nor the frame, subbundle and normal-linearization API of lines 77–80. The same names recur in §0.6–§0.8 at lines 223, 227, 239, 243, 245, 253 and 267, and in the Layer 0 Dependencies (line 296).

The pinned Tau Ceti is 2fd255d, the revision in `lake-manifest.json` (the roadmap repository's main uses the same pin). At that revision none of the following exists:

- `IsRealCauchyRiemannOperator`, `IsComplexLinearOperator`, `sectionComplexLinearPart`, `IsRealCauchyRiemannOperator.antilinearPart` and `IsRealCauchyRiemannOperator.leibniz_complex`. The directory `TauCeti/Geometry/Manifold/VectorBundle/CauchyRiemann/`, including its `Constructions.lean`, is absent.
- `IsNonvanishingHolomorphicOn`, `exists_isNonvanishingHolomorphicOn` and `cauchyRiemannChartCoeff`.
- `HasLocalContMDiffSubbundleFrames` with `.vectorBundle` and `.contMDiffVectorBundle`. The pinned `TauCeti/Geometry/Manifold/VectorBundle/Subbundle.lean` declares only `contMDiffAt_trivOperator` and `contMDiffOn_coordChangeL`.
- `normalCauchyRiemannLinearization` and its four cited lemmas, `normalFDerivMap` and `orthogonalNormalContMDiffVectorBundle`. `TauCeti/Geometry/Symplectic/JHolomorphic/Normal/`, `TauCeti/Analysis/Calculus/FDeriv/NormalQuotient.lean` and `TauCeti/Geometry/Manifold/Riemannian/Immersion/` are absent.

All of these are on Tau Ceti's main branch at 91942aa (18 November 2026). At the pin there are only `rangeQuotientMap` and `rangeQuotientHomeomorph` (`TauCeti/Topology/VectorBundle/QuotientRange.lean`, lines 48 and 122), the module `NormalSpace/VectorBundle/Quotient.lean`, and Mathlib's Maschke instance and `isotypicComponent`.

The smallest repair would rest §0.6–§0.8 on what the pins have and describe the later Tau Ceti API in prose as the intended carriers. That means PseudoholomorphicCurveAnalysis PH6.2's real Cauchy–Riemann operators (already consumed in §0.2), the pinned continuous subbundle frames `IsSubbundleFrameOn` and `subbundleTopology` (`TauCeti/Topology/VectorBundle/Subbundle.lean`), and `rangeQuotientMap`. Alternatively, the citations resolve as written once the repository's Tau Ceti pin reaches 91942aa or later, and the change could land after that bump.

## R02 (P2) — The normal operator of an embedded sphere now has two owners: §0.7 here and HeegaardFloer F2.6e, a supplier of this roadmap

There are now two definitions of the same operator and nothing says they agree. The README also lists the supplier as if it were a consumer.

HeegaardFloer is on main and supplies this roadmap (F0.0, F0.5, F1.x, F2.1–F2.6c); line 22 says it "consumes nothing from it". In its §4.6e (F2.6e, main README line 3140) it already constructs, for an embedded sphere in a four-manifold, the quotient real Cauchy–Riemann operator on the normal line through `TS² → u*TX → N`, with its kernel and cokernel comparison. §0.7 constructs `N_u = u*TX/T_u` and `D_u^N` for every curve. In the case `Z(du) = 0` on a sphere in dimension four, that is F2.6e's object. §0.7 compares it with Tau Ceti's local operators (line 253) but not with F2.6e. Line 1230 places F2.6e under Downstream consumers, which reverses the direction of supply.

TaubesGromov TG1 (main, line 42) also builds the quotient normal operator of an embedding in dimension four. TaubesGromov is downstream, since it cites this roadmap's M1–M3 at its line 13, so there the general construction here is the right owner and TG1 is the side that should cite it.

The smallest repair is three edits:

- In §0.7, beside the comparison with the orthogonal normal bundle, add the identification: for an embedded sphere in a four-manifold, `N_u` and `D_u^N` are HeegaardFloer F2.6e's normal line and quotient operator, up to the normalization factor of the Conventions.
- Add F2.6e to §0.7's *Needs* and to the HeegaardFloer contract.
- In line 1230, keep TaubesGromov TG1–TG2 as consumers and describe F2.6e as the supplier's special case.

## R03 (P2) — The finite-rank holomorphic-frame theorem of §0.6 restates ComplexKahlerGeometry 4.2 instead of citing it

One statement now has two owners on main. The README knows it: "It is the dimension-one case of ComplexKahlerGeometry K4.2's Koszul–Malgrange theorem, which reaches it through Newlander–Nirenberg; K4.2 is not consumed here" (line 223).

ComplexKahlerGeometry already supplies this roadmap (K1, K5, K5a, K7, line 116). Its §4.2 (main README lines 1134–1150) owns Koszul–Malgrange together with "its local frame-solving theorem and gluing, first in rank one and then at arbitrary fixed finite rank". On a Riemann surface every complex-linear Cauchy–Riemann operator is an integrable `(0,1)`-connection, because there are no `(0,2)`-forms. So that theorem is exactly §0.6's paragraph "Holomorphic frames at finite rank", including its statements that two frames differ by a holomorphic `GL_r(ℂ)`-valued map and that kernel sections are holomorphic combinations of a frame. The two statements differ only in route, and a route does not make a variant.

The smallest repair would cite ComplexKahlerGeometry 4.2 for the statement, in §0.6's *Needs* and the ComplexKahlerGeometry contract. If the elementary route matters, the Cauchy–Green contraction with PH3.1–PH3.2 can stay as a proof route for dimension one, since a route may be named without being made mandatory.

## C01 — Three locators into Wendl's two papers point to the wrong place

The locators below were checked against the arXiv versions: v4 of Wendl 2010 and v7 of Wendl 2023.

- §2.24 (lines 641 and 653) and the References (line 1240) cite Wendl 2010 "Theorem 4" for the splitting `dim ker L_u = 2Z(du) + dim aut + dim ker D_u^N`, `coker L_u ≅ coker D_u^N`. In the text this splitting is Theorem 3 (§3.4, p. 34). Theorem 4 (§4.3) is a different result, about limits of nicely embedded curves in dimension four.
- The References place Lemma 3.8 in §3.4; it is in §3.2 (p. 27).
- §0.8 (line 271) and the References (line 1241) cite Wendl 2023 §2 for the pullback operator `φ*D`, characterized by `(φ*D)(η∘φ) = φ*(Dη)`, and for `D_u^N = φ*D_v^N`. These are in §3.2 (pp. 24–25, Example 3.9).

The fixes are: Theorem 3, Lemma 3.8 in §3.2, and §3.2 for the pullback.

## C02 — The pullback formula of §0.8 is frame-independent only in a real frame with real coefficients

In §0.8 (line 271), the formula `(φ*D)(Σ f_i·φ*e_i) = Σ (∂̄f_i) ⊗ φ*e_i + f_i·(De_i)(φ)∘dφ` is stated "in local frames `e_i` of E". For a complex coefficient `f = a + ib` and an operator D with antilinear part A, `D(fe) − (∂̄f)e − f·De = −2b·J·Ae`. So in a complex frame the formula depends on the frame unless D is complex-linear, and `D_v^N` in general is not. "Prove that it is well defined" would then be false. The fix is to say "in local real frames `e_1, …, e_{2r}` of E, with real coefficients `f_i`", the Leibniz convention of §0.2, or to define `φ*D` by the characterizing identity alone.

## C03 — The description's follow-up plan would make HeegaardFloer and this roadmap consume each other

The description says that "pointing their supplier contracts at §0.6 to §0.8 is left to a follow-up PR". For TaubesGromov TG1–TG2, which consume this roadmap, that is the right direction. HeegaardFloer, however, supplies this roadmap, so pointing F2.6e at §0.6–§0.8 would create a cycle. Suggested text: "TaubesGromov TG1 and TG2 treat the embedded and unbranched special cases and may later cite §0.6–§0.8; HeegaardFloer F2.6e, a supplier of this roadmap, keeps its embedded-sphere operator, which §0.7 identifies with its own."

## N01 — "Super-rigid for every J" needs its qualifier

The third Check of §2.24 (line 651) and the Layer 2 Examples (line 660) call an exceptional sphere super-rigid "for every J". Super-rigidity is a property of a J-holomorphic curve, so this should read "for every J for which it is J-holomorphic".

## N02 — The letter s has two meanings in the cuspidal-cubic Check of §0.6

In the cuspidal-cubic Check of §0.6 (line 236), s is both a homogeneous coordinate of `[s : t]` and the real part of the coordinate t, so `du(∂_s)` at t is ambiguous. Writing the derivative in t would avoid this.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.5 normalization (headline, sample) | genus-one double cover of a line, m = 2 | d = 2, R = 4 ⇒ 2g − 2 = −4 + 4, g = 1; D(v) = 4, D(u) = 12 = 2·4 + 4 | both sides 12 | none |
| §0.5 injective point | `z ↦ z²` then a line | fibres of size 2 off branch points; du = 0 at branch points; no injective point | agrees with wendl Def. 4.5, line 5115 | none |
| §0.6 `c₁(T_u) = χ + Z(du)` | `z^d` on ℂP¹; cuspidal cubic `t ↦ (t², t³)` | Z = 2d − 2, c₁ = 2d; Z = 1 (du = 2t(1, 3t/2)), c₁ = 3 | both sides agree | none |
| §0.6 antilinear part | D = D^ℂ + A, A antilinear | D(Jξ) − J·Dξ = −JAξ − JAξ = −2JAξ; D(J·du·Y) = J·D(du·Y) ⇒ A(du·Y) = 0 | holds | none |
| §0.7 index (sample) | line; its double cover | 1·2 + 2·1 = 4 = D(u); ker D^T = 10, ker D^N = 6, total 16 = 2(3·2 + 2); 6 = 10 − 4 | holds | none |
| §0.7 cuspidal and nodal cubics | m = 2, c₁ = 9 | 2 + 2·6 = 14 = 16 − 2; PGL(3) orbit 8 − 1 = 7 complex; nodal 2 + 14 = 16 | holds | none |
| §0.7 m = 1 | φ of degree d | D(u) − 2Z = −2χ′ + 2dχ − 2(dχ − χ′) = 0 = index on rank 0 | holds | none |
| §0.7 sign of local comparison | u = (z, 0), ξ = (0, η) | −2i·½(dη + i·dη∘j) = dη∘j − i·dη | equals defect linearization | none |
| §0.7 complements | N, N′, ψ = π_{N′}\|_N | both sides reduce to π_{N′}·D_u·η since D_u preserves T_u | holds | none |
| §0.8 order law | cuspidal cubic ∘ z² | (z⁴, z⁶)′ = z³(4, 6z²): order 3 = (2 − 1) + 2·1; Z = 4 = 2 + 2·1 | holds | none |
| §0.8 index law | general | d(D(v) − 2Z(dv)) − (m − 3)R − 2R = d·ind D_v^N − (m − 1)R; wendl23 line 1211 with rank m − 1 | holds | none |
| §0.8 isotypic blocks | double cover of a line, ψ(z) = −z | Γ₊ = ⟨1, z²⟩ real 4 = ind D_v^N; Γ₋ = ⟨z⟩ real 2; total 6 | holds | none |
| §0.8 pullback formula | complex f = a + ib, A ≠ 0 | discrepancy −2b·J·Ae ≠ 0 | complex-frame reading fails | C02 |
| §2.24 criterion | index of both sides | 2Z + aut + D(u) − 2Z = aut + D(u) = dim 𝒯 + mχ + 2c₁, since dim 𝒯 − aut = −3χ for g = 0, 1, ≥ 2 | consistent; wendl10 Theorem 3, line 1451 | C01 (number) |
| §2.24 Check | double cover of a line | 2·2 + 6 + 6 = 16 = dim ker D_u, with T_j𝒯 = 0 | holds | none |
| §2.24 corollary | residual J | coker 0 ⇒ 2Z + dim ker D^N = d_0 ⇒ 2Z ≤ d_0; d_0 = 0 ⇒ Z = 0 | wendl10 Cor. 3.17, line 1592 | none |
| §2.24 super-rigidity | exceptional sphere | d_0 = −2 + 2 = 0; deg φ*N = −d < 0 ⇒ ker = 0 by PH7.2's zero count (main line 1343) | matches wendl23 Def. 2.3, line 461 | N01 |
| §1.2 stability (headline) | constant genus-two curve; constant sphere with two points | Aut ≤ 84, finite, 2g − 2 + n = 2 > 0; stabilizer ℂ*, infinite | both directions | none |
| §2.1 (sample) | ℝ², ℝ⁴ | Y = [[a,b],[b,−a]]: ω(Ye₁,e₂) = a = ω(Ye₂,e₁), F0.5 form b − b = 0; dimensions 2, then 8 and 6 = dim Sp(4)/U(2) | holds | none |
| §2.2 (sample) | one node, self-node, k = 1, p = 2 | codimension 2m each; kp = 2, so evaluation is not continuous | holds | none |
| §2.3 (sample) | sphere with 3 or 2 anchors; torus | residual groups trivial and ℂ*; ℤ/2, ℤ/4, ℤ/6; wendl Thm 4.43, line 5909, as cited | holds | none |
| §2.6 (sample) | v = w = e₁ in ℝ² | Y = diag(1, −1) anticommutes with i, ⟨Yv, w⟩ = 1; wendl Lemma 4.57, line 6325 | holds | none |
| §2.9 (headline) | lines, conics, genus two in K3 | d_0 = −2 + 6 = 4; −2 + 12 = 10; (−1)(−2) + 0 = 2 | holds | none |
| §2.12 (sample) | κ = 4, p = 3 | q ≥ 17; (s − 17)·3 > 2 ⇒ s ≥ 18; ℓ ≥ 36; diag(t, 1): kernel 1 → 0 | holds | none |
| §2.13 (sample) | pieces K | wendl Lemma 4.59 (line 6449) uses \|du\| ≤ c and ratio ≥ 1/c, as the K-pieces do | holds | none |
| §2.22 (sample) | ℝ² × S² | d_0 = (2 − 3)·2 + 2·2 = 2 = dim ℝ²; normal kernel ℂ, tangent O(2), both cokernels 0 | holds | none |
| §2.23 (sample) | g = 1, n = 2 | expected 0, actual 2, cokernel ℂ¹; (n − 3)(2 − 2g) + 2(2 − 2g) = (n − 1)(2 − 2g) | holds | none |
| §3.3 (sample) | constant maps; long line | X × \|M̄_(g,n)\| second countable; sequentially compact but not compact | holds | none |
| §3.5 (sample) | sphere with 2 and 3 anchors | 2 leaves ℂ*, 3 stabilizes; torus 1 | holds | none |
| §3.6 (sample) | ℙ¹ with 3 marks; torus with 1 mark; genus 2 | deg K²(p₁ + p₂ + p₃) = −1 ⇒ 0; h⁰(O(p)) = 1; 3g − 3 = 3; is99 Thm 4.2(a)–(g), line 1330, and Lemma 4.1, line 1306 | holds | none |
| §3.7 compactness (headline) | conic limit; (0, 4, 0) | 2 + 2 = 4 = 2·0 − 2 + 0 + 6; ghosts ≤ 2, edges ≤ 1 | holds | none |
| §6.2 (sample) | E = 0, regular | L₀ is evaluations only; pardon13 §B.7 (line 6667) fixes E″ ⊆ E′ and points outside the ends | holds | none |
| §13.1 (sample) | Y a point; lines | Čech^v(pt; ℚ) = 0 for v ≠ 0; v = 4 ⇒ pushforward 0; ImplicitAtlases §0.7, §5.4, §5.5, §6.5 at main lines 196, 638, 652, 753 | holds | none |
| §0.6 frames (R03) | Riemann surface, rank r | ComplexKahlerGeometry 4.2 (main line 1134) gives frames at finite rank for integrable (0,1)-connections; every one is integrable in dimension one | duplicate statement | R03 |
| §0.6–§0.8 contracts (R01) | pin 2fd255d | 9 roots, 0 hits at the pin; all present at Tau Ceti main 91942aa | absent at the pin | R01 |
| §0.7 against F2.6e (R02) | embedded sphere in dimension four | F2.6e: quotient operator via TS² → u*TX → N; §0.7 the same with Z = 0; no identification | two owners | R02 |
| §7.3, §9 (headlines) | Suggested.lean docstring | missing carriers named (thickened spaces, weighted Sobolev, implicit atlas) | correctly not stated | none |

- Source locators checked against the text: 26. These are wendl10 (Lemma 3.8, §3.3, Theorems 3 and 4, Cor. 3.13, Lemmas 3.14–3.15, Cor. 3.17), wendl23 (§2.1, Prop. 2.2, Def. 2.3, §2.2.1, §3.2 Example 3.9, §3.3–§3.4), wendl (Def. 4.2, Prop. 4.3, Defs. 4.4–4.5, Thm 4.43, Props. 4.49 and 4.55, Lemmas 4.56, 4.57 and 4.59), is99 (Lemma 4.1, Thm 4.2) and pardon13 (Lemma B.5.1, §B.7).
- Library declarations opened at the pins: Tau Ceti `SardSmale.lean` 186, 409, 433; `AlmostComplex/Prod.lean` 76, 105, 143; `Manifold/Prod.lean` 128; `Degree.lean` 443; `AlmostComplexStructure.lean` 76, 185; `QuotientRange.lean` 48, 122; `Topology/VectorBundle/Subbundle.lean` 93, 134. Mathlib `Maschke.lean` 165–168, `Isotypic.lean` 182, `Fredholm/Open.lean` 77, 97. Nine cited roots are absent (R01).
- Cross-roadmap citations resolved on main: PH3.1 (line 535), PH3.2 (581), PH7.2 (1271, zero count 1343), CharacteristicClasses C2.3, ComplexKahlerGeometry 4.2 (1134), HeegaardFloer F2.6e (3029), TaubesGromov TG1 (40) and TG2 (50), ImplicitAtlases §0.7, §5.4, §5.5 and §6.5.
- Automatic checks at this head all passed. The dependency check printed `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` exited 0 with three `sorry` warnings (lines 105, 128, 161). `#check @` of the four declarations kept every binder and matched the generality of the README's §0.5 bullets and §1.2; no change. The one-tactic probe was decided by reading: all three statements are deep.
- The diff outside the roadmap folder is empty. No previous finding is open: the previous review, of another pull request, accepted with none.
- Overlap check: read HeegaardFloer (main and open), PseudoholomorphicCurveAnalysis (open and main), DGFloer (open), GromovWittenTheory and ComplexCurveModuli (main), and also TaubesGromov and ComplexKahlerGeometry (main). Two objects are shared. The embedded-sphere normal operator is owned by HeegaardFloer F2.6e (R02), and TaubesGromov TG1 should cite §0.7. Finite-rank holomorphic frames are owned by ComplexKahlerGeometry 4.2 (R03). Nothing else is shared.
- Source independence: 15 passages were compared with 5 sources (wendl10, wendl23, wendl, is99, pardon13). The longest shared run is about five words, "closed connected Riemann surfaces … of positive degree" in the definition of super-rigidity, which the mathematics forces. The largest share of locators is pardon13, about 25 of 64. Contents were compared with pardon13 (§9.2, Appendix B), and the new sections with wendl10 §3.3–§3.4 and wendl23 §2–§3: independent. The order tangent bundle → normal bundle → splitting → criterion is forced by the *Needs* of §0.7 (§0.6) and §2.24 (§0.6–§0.8).
- Research link: §0.6–§0.8 and §2.24 are the generalized normal bundle, normal operator and regularity criterion of Wendl (2010, Theorem 3, Cor. 3.13) and the super-rigidity of Wendl (2023, Def. 2.3) behind his generic transversality of multiple covers; Layers 5–9 are Pardon's (2013) implicit atlas. This line rests on the README's References and the texts read.

## Not verifiable

- Ivashkovich–Shevchishin, Invent. Math. 136 (1999), "§1" (§0.6, line 227; References, line 1242): the publisher's page is paywalled and no arXiv copy was found. Wendl 2010 §3.3 (wendl10 line 1303) attributes the same observation to it.
- McDuff–Salamon and Robbin–Ruan–Salamon: paywalled and cited by locator only, as before; nothing in this round's changes depends on them.

Automatic checks set aside as false positives: the citation resolver's lead that ComplexKahlerGeometry has no K4.2. That roadmap's Layer 4 has the heading 4.2 (Koszul–Malgrange), and its README states that the former K4 is now Layer 4.

## Source issues

- **Gap** in pardon13 at §B.7, p. 148: the source says the evaluation isomorphism (B.7.3) exists because every element of K satisfies unique continuation, though elements with nonzero obstruction parameter need not; it should first take E″ complementary to the parameter image, so that the remaining kernel elements are unforced; affects the proof.

## For the human reviewers

- none
