# Review of InstantonFloerTheory (pull request #2596 at 82fa49f)

**Verdict:** accepted

**Summary.** Accepted: no finding. The head is the one the previous review read, so its five small corrections are all still open; I recomputed each and they stand. The fifteen sampled sections, the four headline theorems and every Check I recomputed hold, and every supplier label and library declaration resolves. There are six small corrections and one format note, none blocking: a nilpotence locator that names Frøyshov's theorem for the wrong class of manifolds, generalized excision sectors credited to an eigenspace theorem, old IFk labels still cited by five roadmaps, a missing bundle in the overview, an implicit sign in §9.3, and a Check in §7.3 that names the wrong group. For the humans: Donaldson's book carries the joint-largest share of locators and has no open copy.

## C01 — The nilpotence locator in §7.3 and §7.6 points at Frøyshov's theorem for manifolds with positive first Betti number, not at his homology-sphere theorem

Not repaired since the previous review. An implementer who opens the cited result finds a statement about a different class of three-manifolds, and "over ℤ" contradicts the section's own text. The *Needs:* line of §7.3 (line 1021) reads "Frøyshov Theorem 9 (p. 20) for nilpotence over ℤ", and §7.6 (lines 1105–1106) repeats it. At froyshov9903 lines 824–827, Theorem 9 assumes b₁(Y) > 0 and a bundle nontrivial over a surface. The homology-sphere statement on the reduced group is Theorem 10 (p. 24, froyshov9903 lines 957–960), whose proof passes through ℚ[u]-modules (line 967), and Scaduto reads it for coefficient rings containing 1/2 (scaduto1401 lines 77–78). §7.3 itself says nilpotence is stated "at their inverted-two or field hypotheses".

Suggested fix: in §7.3 write "Frøyshov Theorem 10 (p. 24), with 2 inverted"; in §7.6 keep Theorem 9 for the nontrivial admissible case and add Theorem 10 for the homology-sphere case.

## C02 — The excision of §8.3 on generalized eigensectors is credited to a theorem stated, in the cited version, for eigenspaces

Not repaired since the previous review. The target of §8.3 (lines 1166–1176) is an isomorphism of simultaneous generalized eigenspaces for (2g − 2, 2), with the locator "Kronheimer–Mrowka Theorem 7.7, p. 57, with the sectors of Definition 7.3". In the cited version, Definition 7.3 takes the simultaneous eigenspace (km0807 lines 1865–1867), and Theorem 7.7 (line 1945) is about that space. The section says that its sector contains the eigenspace, so nothing false is asserted, but the stronger statement has no source: the text proves the restriction only. The remark after Proposition 7.4 (km0807 lines 1882–1886) closes the gap in the μ(Σ) direction once μ(pt) − 2 vanishes, and leaves the μ(pt) direction.

Suggested fix: say in §8.3 that Theorem 7.7 is the eigenspace restriction and that the generalized form is proved here by the same cut-and-reglue argument, or add a locator to a text that states excision for generalized eigenspaces.

## C03 — Five roadmaps on main cite this roadmap by the labels IF0, IF1, IF3–IF4 and IF9, which the README no longer carries

Not repaired since the previous review. A reader following those citations finds no such label and no statement of where it went. The citing lines on main are SmoothBundlesConnections README line 111 ("IF1"), YangMillsConnectionsAndCaloricGauge line 139 ("IF1"), HeegaardFloer line 1527 ("IF3-IF4", and line 1625 of its open revision), and GaugeQuiltFieldTheory lines 84, 86 and 278 ("IF9", "IF0", and line 400 of its open revision). The head contains no "IF" label; the mapping is given only in the pull request's description.

Suggested fix: one sentence in the Conventions, for example "Other roadmaps cite Layer k as IFk; IF7a is §§7.2–7.5, IF7b §7.6, IF9a §9.4, IF9b §9.5, IF10a §§10.1–10.2, IF10b §10.3 and IF10c §§10.4–10.6."

## C04 — The overview states the Chen–Scaduto exponent on Σ_g × S¹ without the bundle it holds for

Not repaired since the previous review. Lines 23–25 say that "on Σ_g × S¹ with g ≥ 1 the operator u² − 64 … is nilpotent of exact order 2⌈g/2⌉ − 1", and the module docstring of `Suggested.lean` (lines 28–29) says the same of `I(Σ_g × S¹)`. Chen–Scaduto Theorem 1 (cs1612 lines 25–32) is for the bundle whose w₂ is dual to the circle, as §8.4 (line 1208) states. For another admissible bundle the exponent differs: if c₁(w) is dual to a curve on Σ₃, then w is odd on a torus S¹ × c, and Corollary 1 (cs1612 lines 44–47) bounds the exponent by 2⌈1/2⌉ − 1 = 1, not 3.

Suggested fix: "on Σ_g × S¹ with g ≥ 1 and c₁(w) dual to the circle factor", in both places.

## C05 — The §9.3 prose calls Ω the boundary two-form of the transgression, while its own Check computes the negative

Not repaired since the previous review. Lines 1304–1306 ask to "Prove that Ω is the boundary two-form … with the sign fixed by orienting Σ as the boundary of Y₀". The Check at lines 1329–1333 computes, for ∂Y₀ = Σ, dθ(a,b) = (1/(4π²))∫_Σ tr₂(a∧b) = −Ω(a,b). Recomputed: Stokes gives the boundary term θ_A(a) = −(1/(8π²))∫_Σ tr₂(a∧A), and ∂_aθ(b) − ∂_bθ(a) = −(1/(8π²))∫tr₂(b∧a) + (1/(8π²))∫tr₂(a∧b) = (1/(4π²))∫tr₂(a∧b). So the prose leaves the reader to discover that the sign is negative.

Suggested fix: "prove that Ω = −dθ for Σ oriented as ∂Y₀".

## C06 — The Check of §7.3 says the localized subquotient is generated by two classes, when it is the image group B(I) that they generate and the subquotient is zero

In the Check on Σ(2,3,5) (lines 1016–1018) the first clause computes `Î_Z ⊗ ℤ[1/2] = 0`, and the second says "the `v`-iterate subquotient is again generated by `δ'_0` and a unit multiple of the degree-0 generator". Those two classes generate B(I): δ'_0 generates H_4 = ℤ[1/2], and v δ'(1) = ±4 times the generator of H_0 is a unit multiple, so B(I) = Z(I) and the quotient is 0. Read literally, the sentence gives a nonzero generating set for a group just shown to vanish.

Suggested fix: "so the image group B(I) of the `v`-iterates is again generated by `δ'_0` and a unit multiple of the degree-0 generator, and the subquotient is again 0".

## N01 — The module docstring describes what Mathlib lacks but not what Tau Ceti has at the pin

The docstring of `Suggested.lean` (lines 17–19) says Mathlib has "no principal bundles, gauge groups, curvature of a connection". That is true of Mathlib. Tau Ceti at the pin has the curvature operator of a covariant derivative on a vector bundle (`curvatureOperator`, `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Basic.lean:89`) and the anti-self-dual forms (`TauCeti.SmoothForm.antiSelfDualForms`, `TauCeti/Geometry/Manifold/Riemannian/SelfDual.lean:548`). No headline becomes statable through them, since the Floer groups are still missing; a clause naming them would keep a reader from concluding that neither pin has curvature.

## Questions for the author

- §6.2 and the scope section say that "no roadmap on main owns a slant product". SeibergWittenTheory SW7.3 (README line 89) defines a degree-one slant `c₁(U)/γ` on its own universal line by evaluation on cross products. Is the general slant `p₁/[z]` here meant to be the owner that SW7.3 could cite, or should the two be related in the scope section? I did not find a general slant product in AlgebraicTopology §§6.1–6.4, which is why this is a question and not a remark.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §0.1 admissible data (sample) | T³; RP³ with R⊕L⊕L; homology sphere | ⟨c₁(w),[T²]⟩=1; w=(1+a)²=1+a², w₂=a²≠0, H₂(RP³;ℤ)=0; km0807 line 1776 odd integral class | holds |
| §0.5 scopes (sample) | degree of deck, half-period, μ(pt) | 8κ=8 ⇒ ℤ/8; half-period 4 ⇒ ℤ/4 (km0807 lines 1795–1796); μ(pt) degree 4 | holds |
| §1.2 stabilizers (sample) | θ on S³; T³ holonomies (±1,i,j) | H⁰_θ=su(2), stabilizer SU(2) in G_det, SO(3) effective; centralizer of {i,j} is ±1 | holds; DK Ch. 4 not readable |
| §1.3 SO(3) adapter (sample) | CP², S²×S², x²≡3; adjoint trace | p₁=x²=c₁²−4c₂; κ=−1/4; x=(1,0): κ=0; −3/4; Killing 4tr₂ ⇒ 32π² | holds |
| §2.2 irreducibility (sample) | U(1)×U(1) reduction; T³, h=0 | c₁(L₁)=c₁(L₂) real ⇒ ⟨c₁(w),S⟩=2⟨c₁(L₁),S⟩ even; two nondegenerate classes (scaduto1401 lines 1470–1472) | holds; Donaldson §5.5.1 not readable |
| §4.2 bubbles (sample) | index 1, 2 | (d−8)+4=d−4: −3, −2 < 0 | holds |
| §5.1 complex (sample) | supplier labels | HeegaardFloer §1.5 (M.5) line 467; AlgebraicTopology §2.1 line 293, §2.6 line 386 | holds |
| §5.3 disjoint unions (sample) | e→f (1→0), g→h (2→1); T³⊔T³; three copies | (−1)^\|x\|: d²=f⊗h−f⊗h=0; (−1)^(\|x\|\|y\|): 2f⊗h; shift map intertwines on all three; degrees {0,0,4,4} both; 8 vs 6 | holds |
| §5.4 cyclic Künneth | Tor witness; C'=ℤ/2; neither free; ZMod 3 | H₁(C⊗C)=ℤ/2, tensor term 0; H₁=ℤ/2=Tor, H₀=ℤ/2; H₁=0 vs Tor=ℤ/2; nine squares give +1≠(−1)⁹ | holds |
| §7.2 reducible identity | transpose; degrees; Σ(2,3,5) | (dv−vd)ᵀ=ν∂−∂ν ⇒ +2δ'δ with δ'=−δ_Fᵀ; 2+4j≢1 mod 8; Frøyshov 0, homological ℤ/8 | holds |
| §7.3 inverting two (sample) | Σ(2,3,5) | ℤ/8⊗ℤ[1/2]=0; v=±4 unit; scaduto1401 lines 2332, 2345: v=v_F/2, ∂v−v∂+δ'δ=0 | holds; C01, C06 |
| §7.4 framed group (sample) | projector; S³; lift | ((μ+2)/4)²=(4μ+8)/16=(μ+2)/4; I#(S³)=ℤ₀ (scaduto1401 line 1474); β(w₂) 2-torsion in ℤ ⇒ 0; km0807 lines 1957–1959 | holds |
| §8.3 excision | g=1; two copies of S¹×T²; g=0 | (0,±2) from Prop 7.1; ℂ⊗ℂ=ℂ; odd sphere ⇒ I=0 (cs1612 line 45) | holds; C02 |
| §9.1 splittings (sample) | handlebody H; dfl07032 lines 64–77 | [∂H]=0 ⇒ ⟨w₂,[Σ]⟩=0; Y, Y′ connected, two components, w₂ odd on each | holds |
| §9.3 boundary form | ∂Y₀=Σ; sphere of Chern number 2 | dθ=(1/4π²)∫tr₂(a∧b)=−Ω; Maslov 4, area 2/4=1/2 (dfl07032 lines 270–274: charge 1/2) | holds; C05 |
| §9.5 decorated comparison (sample) | Σ_(g+1)⊔T², g=0,1; two genus ≥ 2 factors | π₂=ℤ⊕0; point at g=0; ℤ⊕ℤ (dfl07032 lines 264–266); centralizer of diag(i,−i), quarter turn is ±1 | holds |
| §10.2 mixed comparison (sample) | dfl07032 lines 101–103, 1255 | relatively ℤ/4-graded abelian groups; N an isomorphism and a chain map | holds |
| §10.3 deck diagram | U, J, T | U²:(i+8,A+1); T:(i−8,A−1)=U⁻²; J²=T; dfl07032 line 3354 UC_(i,j)⊂C_(i+4,j+1/2); ranks 1 and 2 | holds |
| §10.5 twisted framing (sample) | S¹×S² | ⟨w₂,[S²]⟩=1; flat ⇒ pulled back from S¹ ⇒ w₂=0; reference change translates by a constant | holds |
| §10.6 operations (sample) | dfl07032 lines 140–164, 150–152 | Theorems 3, 4 on p. 5; H₁(Σ)⊕H₂(Σ) over ℚ; source uses +(1/4)p₁, Frøyshov −(1/4)p₁ (froyshov9903 line 229) | holds |
| Headline 1: I(T³)_w | km0807 lines 1793–1796 | ℤ⊕ℤ, involution of degree 4, folded ℤ | holds |
| Headline 2: μ(pt)²=4; exponent | g=1,2,3,4; w dual to a curve on Σ₃ | 1,1,3,3; Corollary 1 with torus gives ≤1, so u²=64; other bundle gives 1≠3 | holds as §8.4 states it; C04 |
| Headline 3: Scaduto decomposition | S³; Σ(2,3,5); T³ | Thm 1.3 (scaduto1401 lines 83–90); ℂ in degree 0; rank 1 degree 0 (lines 94–95); rank 1·2=2 | holds |
| Headline 4: Atiyah–Floer | dfl07032 Theorems 1, 2, 3.29 | minimal Maslov 4; index ≤2 minus 4 < 0 so no disc; ℤ/4 | holds |
| §0.3–0.4 normalizations | trivial bundle; S⁴; temporal gauge | δCS=−(1/4π²)∫tr₂(a∧F); grad=*F; F+*F=−ds∧X−*₃X; κ=c₂; E_YM=8π², E_flow=1 | holds |
| §3.3 index | S⁴ κ=1; S¹×S³; untwisted | 8−3=5; 1−b₁+b⁺=0; −(1−b₁+b⁺)=−(χ+σ)/2 | holds |
| C03 old labels | main READMEs | IF1 at SmoothBundlesConnections 111, YangMills 139; IF3-IF4 HeegaardFloer 1527; IF9, IF0 GaugeQuiltFieldTheory 84, 86, 278; head: none | correction |

- Earlier remarks: the previous review had no finding; its C01–C05 are quoted above, each not repaired (the head is unchanged).
- Source locators checked against the text: 38 (km0807 10, scaduto1401 8, froyshov9903 7, cs1612 3, dfl07032 10).
- Library declarations opened at the pins: 24 elaborated together with `#check`, all found; `ComplexShape.TensorSigns` synthesizes on `down ℕ` and `up ℤ` (`Mathlib/Algebra/Homology/ComplexShapeSigns.lean:168,182`) and fails on `down (ZMod 8)`, as §5.4 says. Neither pin has a Chern–Simons, instanton or principal-bundle declaration.
- Cross-roadmap citations resolved on main: 14 suppliers, every cited section heading located (FourManifolds §§5.1–5.3; HeegaardFloer §§1.5, 2.1–2.5, 2.7, 3.4; AlgebraicTopology §§2.1, 2.6, 6.1–6.4; FukayaTheory FK1.1, FK1.2b, FK2.2, FK3, FK6, FK8.0; SpinGeometry G2, G4.2, G4.3, G6.1, G6.4; GeometricTopology §§1.1, 1.3–1.5, 5.2, 9.1; and the rest).
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there was nothing for the one-tactic probe or for `#check @name`. All headlines are named in the docstring with the carrier each lacks.
- Pull-request description against the head: 84 Checks bullets counted at the head; it says the roadmap is revised in form, gives the label mapping, the ten changed statements, the supplier corrections and the docstring-only change to `Suggested.lean`; no sentence is contradicted by the head.

Overlap check: read GaugeQuiltFieldTheory, HeegaardFloer, FourManifolds, FukayaTheory, DGFloer and SeibergWittenTheory. Odd-degree surface moduli M(P,δ): GaugeQuiltFieldTheory GQ1, consumed here. Compact SU(2) ASD core: FourManifolds Layer 5. Generic Fredholm and determinant package: HeegaardFloer Layer 2. Cylindrical ASD, the instanton theories and the Atiyah–Floer comparison: this roadmap, as GaugeQuiltFieldTheory (line 266) and HeegaardFloer (line 1527) assign. Nothing has two owners. A search of the open pull requests for instanton Floer, Chern–Simons functional and Atiyah–Floer found only GaugeQuiltFieldTheory's revision, which assigns them here.

Source independence: 12 passages compared with 5 sources (km0807, scaduto1401, cs1612, froyshov9903, dfl07032), none shared beyond a run of 4 words; largest share Donaldson's book and dfl07032, 32 each of about 155 locators in the layers; Donaldson's text and contents not readable; contents compared with dfl07032: §§9.1–9.4 meet its §§2.1–2.4 in the order the *Needs:* lines force (9.2 needs 9.1, 9.3 needs 9.2, 9.4 needs 9.1–9.3) with different scopes, Layer 10 merges its §§3–6 and splits §7, §§9.5 and 10.5 have no counterpart: independent.

Research link: the headlines are Floer's instanton homology and surgery triangle, Frøyshov's reduced groups (1999), Kronheimer–Mrowka excision (2008), Scaduto's framed decomposition (2014), Chen–Scaduto nilpotence (2016) and the Daemi–Fukaya–Lipyanskiy admissible Atiyah–Floer theorem (2021); Kronheimer–Mrowka build sutured instanton homology on excision (km0807 §7). Rests on the README's Summary and the sources read.

## Not verifiable

- Donaldson, *Floer Homology Groups in Yang–Mills Theory* (Cambridge Tracts 147): no open copy, and the operator holds none; its locators in §§0.3–0.4, 2.1–2.3, 3.1–3.3, 4.1–4.4, 5.1–5.2, 6.1 and 7.1–7.2 were not checked.
- Donaldson–Kronheimer, *The Geometry of Four-Manifolds* (Oxford, 1990): no open copy; its chapter locators in Layers 1, 3, 4 and 6 were not checked.
- Daemi–Fukaya–Lipyanskiy, *mixed equation* (dfl07038): readable, but §10.1 is outside this round's sample; its four theorem locators were not reopened.

## Source issues

- **Misprint** in km0807 at Proposition 7.4, p. 55: the source says Y = S¹ × R, with Σ of positive genus, and concludes about I(Y|R); it should name one surface throughout; affects nothing.
- **Gap** in froyshov9903 at Theorem 10, p. 24: the source states nilpotence of u² − 64 on the reduced group, defined in §3 with integer coefficients, while the proof passes to ℚ[u]-modules; it should state the coefficient ring (Scaduto reads it with 2 inverted); affects a stated result.

## For the human reviewers

- **Not tested.** Donaldson's book shares the largest count of locators (32 of about 155 in the layers, `TauCetiRoadmap/InstantonFloerTheory/README.md` lines 1995–2004). It and Donaldson–Kronheimer (lines 2005–2009) have no open copy and are not in the sources manifest, so wording and arrangement were not compared against them.
