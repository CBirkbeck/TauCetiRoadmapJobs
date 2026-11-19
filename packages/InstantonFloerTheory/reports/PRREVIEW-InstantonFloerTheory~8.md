# Review of InstantonFloerTheory (pull request #2596 at 82fa49f)

**Verdict:** accepted

**Summary.** Accepted: no finding. The fifteen sampled sections, the four headline theorems and the recomputed Checks hold at their locators and under computation, and every supplier label resolves on main. There are five small corrections and no format notes, none blocking: two locators that point at a narrower or neighbouring theorem (Frøyshov's homology-sphere nilpotence; generalized excision sectors), the old IFk labels that four roadmaps on main still cite, a missing bundle hypothesis in the overview, and a sign the §9.3 prose leaves implicit. For the humans: Donaldson's book has the largest share of locators but no open copy, so it was not checked.

## C01 — The nilpotence locator in §7.3 and §7.6 points at Frøyshov's theorem for bundles over manifolds with positive first Betti number, not at his homology-sphere theorem

An implementer who looks up the cited result finds a statement about the wrong class of three-manifolds. The *Needs:* line of §7.3 (line 1021) gives "Frøyshov Theorem 9 (p. 20) for nilpotence over ℤ", and §7.6 (lines 1105–1106) repeats it. At froyshov9903 lines 824–830, Theorem 9 assumes b₁(Y) > 0 and an SO(3) bundle that is nontrivial over a surface. Nilpotence of u² − 64 on the reduced group of an integral homology sphere is Theorem 10 (p. 24, line 957), and mod-4 periodicity is Corollary 3 (p. 24). The proof of Theorem 10 runs through exact sequences of ℚ[u]-modules (line 967), and Scaduto reads the theorem with 2 inverted (scaduto1401 lines 77–78). So "over ℤ" is not what it gives, which matches what §7.3 itself says ("at their inverted-two or field hypotheses").

Suggested fix: in §7.3 write "Frøyshov Theorem 10 and Corollary 3 (p. 24), with 2 inverted". In §7.6 keep Theorem 9 for the nontrivial admissible case and add Theorem 10 for the homology-sphere case.

## C02 — The excision of §8.3 on generalized eigensectors is credited to a theorem that, in the cited version, is stated for eigenspaces

The excision target is now stated on the simultaneous generalized eigenspace for (2g − 2, 2), and its locator is "Kronheimer–Mrowka Theorem 7.7, p. 57, with the sectors of Definition 7.3" (lines 1166–1176). In the arXiv v2 the README links, Definition 7.3 takes the simultaneous eigenspace (km0807 lines 1859–1867), and Theorem 7.7 (line 1945) is about that space. The section says this itself, so nothing false is asserted. Still, the cited text proves only the eigenspace version, while the stronger statement is the target. The generalized form is how the same authors read their definition later: Kronheimer–Mrowka, *Instanton Floer homology and the Alexander polynomial*, arXiv:0907.4639v2, §2.2, p. 6, define I(Z|R̄) "as in [Knots, sutures and excision]" as the simultaneous generalized eigenspace and use excision for it in the proof of Lemma 2.3.

Suggested fix: add that locator to §8.3 and to the References. Alternatively, say that Theorem 7.7 is the eigenspace restriction and that the generalized form is proved here by the same cut-and-reglue argument.

## C03 — Four roadmaps on main cite this roadmap by its former labels IF0, IF1, IF3–IF4 and IF9, which the README no longer carries

A reader who follows those citations finds no such label and no statement of where it went. The citing lines are:

- SmoothBundlesConnections README line 111 ("InstantonFloerTheory (IF1)");
- YangMillsConnectionsAndCaloricGauge line 139 ("IF1");
- HeegaardFloer line 1527 ("IF3-IF4"), and line 1625 at its open revision;
- GaugeQuiltFieldTheory lines 84, 86 and 278 ("IF9", "IF0"), and lines 129 and 400 at its open revision.

The head contains no "IF" label at all. GaugeQuiltFieldTheory's open revision handles the same renaming with one sentence in its Conventions (item 8: "Other roadmaps cite Layer k of this roadmap as GQk; …"). Suggested fix: add the equivalent sentence here, for example "Other roadmaps cite Layer k as IFk; IF7a is §§7.2–7.5, IF7b §7.6, IF9a §9.4, IF9b §9.5, IF10a §§10.1–10.2, IF10b §10.3 and IF10c §§10.4–10.6."

## C04 — The overview states the Chen–Scaduto exponent on Σ_g × S¹ without the bundle it holds for

Lines 23–25 say that "on Σ_g × S¹ with g ≥ 1 the operator u² − 64 … is nilpotent of exact order 2⌈g/2⌉ − 1". Chen–Scaduto Theorem 1 (cs1612 lines 25–32) and §8.4 (line 1208) prove this for the bundle whose c₁(w) is dual to the circle factor. Other odd bundles on the same manifold give other groups (km0807 Proposition 7.8 uses uw). Suggested fix: "on Σ_g × S¹ with g ≥ 1 and c₁(w) dual to the circle".

## C05 — The §9.3 prose calls Ω the boundary two-form of the transgression, while its own Check computes the negative

Lines 1304–1306 ask to "Prove that Ω is the boundary two-form … with the sign fixed by orienting Σ as the boundary of Y₀". The Check at lines 1329–1333 computes, for Σ = ∂Y₀, dθ(a,b) = (1/(4π²))∫_Σ tr₂(a∧b) = −Ω(a,b). I recomputed it from θ_A(a) = −(1/(8π²))∫_Σ tr₂(a∧A) and dθ(a,b) = ∂_aθ(b) − ∂_bθ(a). Suggested fix: write the result in the prose: "prove that Ω = −dθ for Σ oriented as ∂Y₀".

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §0.2 sign changes on T³ (sample) | holonomies (A₁,A₂,A₃)=(±1,i,j) | ε₁ swaps A₁=±1; ε₂ undone by conj. j (j i j⁻¹=−i); ε₃ by conj. i; stabilizer order 4; km0807 p. 53 degree-4 involution | holds |
| §1.1 Sobolev scales (sample) | dim 3, k=2 | H³⊂C⁰ (3>3/2); FourManifolds Layer 5 "s≥3" (line 2197); K5a §5.4 `BundleSobolev` (line 1445); P5 present | holds; DK Ch. 4 not readable |
| §1.4 realizations (sample) | Needs items | §§1.1–1.3; K5a §5.4; P5–P6; GeometricTopology §1.1 (line 788); FourManifolds §5.3 (line 2473) all exist on main | holds |
| §2.3 finiteness (sample) | Frøyshov p. 4; T³, h=0 | froyshov9903 lines 125–127: finitely many nondegenerate critical points, θ only reducible; T³: 2 points | holds |
| §3.1 weighted Fredholm (sample) | supplier labels | HeegaardFloer F0.2 = §2.4 (line 1609), F0.0 = §2.2; IndexTheory I1, I2; P1, P5–P7 present | holds; Donaldson not readable |
| §4.2 bubble exclusion (sample) | index 1, 2 | stratum dim (d−8)+4 = d−4: 2−4=−2, 1−4=−3 < 0 | holds |
| §5.1 complex (sample) | M.5, §§2.1/2.6 | HeegaardFloer §1.5 (M.5, line 467); AlgebraicTopology §2.1 (293), §2.6 (386) | holds |
| §6.1 cobordism maps (sample) | GeometricTopology | §1.1 (788), §1.3 gluing and handles (851), §1.4 connected sum (939) | holds |
| §7.1 absolute grading (sample) | Frøyshov p. 4 | i(α) ≡ dim M(α,θ) mod 8 (lines 142–143) | holds |
| §7.3 inverting two (sample) | Σ(2,3,5) | Î_Z=ℤ/8 → ℤ/8⊗ℤ[1/2]=0; v=ν_Z/2=±4, a unit; Scaduto p. 54 v = v_F/2 | holds; Thm 9 locator → C01 |
| §8.3 excision (sample) | g=1; two copies of S¹×T² | KM 7.7 hypotheses match; Prop 7.1, k=0: (0,±2); I(T³\|T²)=ℂ; ℂ⊗ℂ=ℂ | holds; locator → C02 |
| §9.1 splittings (sample) | handlebody H | dfl07032 p. 3: Y, Y′ connected, Σ two components, w₂ odd on each; [∂H]=0 ⇒ ⟨w₂,Σ⟩=0 | holds |
| §9.2 surface moduli (sample) | g=0,1,2; d=−3 | −3χ: −6, 0, 6 (dfl07032 line 236); BAB⁻¹=−A, ABA⁻¹=−B; −3+2·2=1 | holds |
| §10.1 mixed phase (sample) | locators; index 0, 1 | dfl07038 Thm 3.4/3.6 p. 14, 4.2 p. 20, 4.44 p. 30; contents §4.4 p. 53, §4.7 p. 59; 1−8+4<0, 1−4<0 | holds |
| §10.5 twisted framing (sample) | S¹×S² | w₂ dual to S¹: ⟨w₂,[S²]⟩=1; flat ⇒ pulled back from S¹ ⇒ w₂=0; no flat reference | holds |
| Headline 1: I(T³)_w | KM p. 53 | ℤ⊕ℤ in degrees differing by 4 (line 1793); folded ℤ | holds |
| Headline 2: μ(pt)²=4; exponent | g=1,2,3,4 | 2⌈g/2⌉−1 = 1,1,3,3 (cs1612 lines 31–32); Cor. 1 with genus 1 gives u²=64 | holds; overview hypothesis → C04 |
| Headline 3: Scaduto decomposition | S³; Σ(2,3,5) | Thm 1.3 (lines 83–90): Î=0 ⇒ ℂ in degree 0; rank 1 in degree 0 (lines 94–95) | holds |
| Headline 4: Atiyah–Floer | DFL Thm 2, 3.29 | relatively ℤ/4-graded abelian groups (lines 101–103); N chain iso (line 1255); min Maslov 4 | holds |
| §0.3–0.4 normalizations | trivial bundle; S⁴ | dCS = −(1/8π²)·2∫tr(a∧F); p₁=−4c₂ ⇒ κ=c₂; E_YM=8π²; E_flow=E_YM/(8π²)=κ | holds |
| §1.3 split bundle | CP²; S²×S² | x²=1 ⇒ κ=−1/4; x=(1,0): x²=0, κ=0; x²≡3 ⇒ κ∈−(ℤ+3/4) | holds |
| §5.3 Koszul sign | e→f (1→0), g→h (2→1) | (−1)^\|x\|: d²(e⊗g)=f⊗h−f⊗h=0; (−1)^{\|x\|\|y\|}: 2f⊗h; shift: (−1)^{\|y\|} intertwines | holds |
| §5.4 Künneth on ZMod (2m) | Tor witness; ZMod 3 | H₁(C⊗C)=ℤ/2=Tor₁(ℤ/2,ℤ/2), tensor term 0; ε(0)=ε(3)=−ε(0) impossible | holds |
| §7.2 transpose and degrees | dual of Frøyshov Thm 4(ii) | (dv−vd)ᵀ=ν∂−∂ν; δ'=−δ_Fᵀ gives +2δ'δ; correction 5+4k ≢ 0 mod 8 | holds |
| §10.3 deck diagram | U, J, T | U²:(i+8, A+1); T:(i−8, A−1)=U⁻²; J²=T; dfl07032 Def 7.4(i) UC_{i,j}⊂C_{i+4,j+1/2} | holds |
| C03 old labels | main READMEs | IF1 at SmoothBundlesConnections 111; IF3-IF4 HeegaardFloer 1527; IF0/IF9 GaugeQuiltFieldTheory 84, 86, 278; head: no "IF" | correction |
| C05 boundary form | ∂Y₀=Σ | dθ(a,b)=(1/8π²)(∫tr(a∧b)+∫tr(a∧b))=(1/4π²)∫tr(a∧b)=−Ω(a,b) | correction |

- Source locators checked against the text: 41 (km0807 9, scaduto1401 8, froyshov9903 9, cs1612 2, dfl07032 10, dfl07038 3), plus arXiv:0907.4639v2 §2.2 read for C02.
- Library declarations opened at the pins: 26, elaborated together with `#check` (exit 0). Among them: Tau Ceti `Kunneth/Sequence.lean:729`, `Split.lean:357`, `UniversalCoefficient/Basic.lean:121,153`; Mathlib `ComplexShapeSigns.lean:119,168,182`. There is no `TensorSigns` on `ZMod` and no Chern–Simons, ASD or `BundleSobolev` declaration at either pin.
- Cross-roadmap citations resolved on main: 14 suppliers, every cited label located. The open revisions of GaugeQuiltFieldTheory, HeegaardFloer, FourManifolds and FukayaTheory keep or map every label cited here.
- Automatic checks: gate `OK` with every counter 0. Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there was nothing to probe with one tactic. All four headlines are named in the docstring with their missing carriers, and the docstring's claims about Mathlib (covariant derivatives but no curvature or principal bundles) hold at the pin.
- Pull-request description against the head: 84 Checks bullets against 80 on main; the label mapping, the ten changed statements and the Suggested.lean diff all match the head. The previous review's R01 and R02 (about the description of the pull request that added the roadmap) were already repaired; nothing carried over.
- Overlap check: read GaugeQuiltFieldTheory, HeegaardFloer, FourManifolds (each on main and at its open revision), FukayaTheory, DGFloer, SeibergWittenTheory and YangMillsConnectionsAndCaloricGauge. Odd-degree surface moduli M(P,δ): GaugeQuiltFieldTheory GQ1 (Layer 1 in its revision), consumed. Compact SU(2) ASD core: FourManifolds Layer 5. Generic Fredholm and determinant package: HeegaardFloer F0. Cylindrical ASD, the instanton theories and Atiyah–Floer: this roadmap, as HeegaardFloer F0.0, SmoothBundlesConnections' scope and GQ5 assign. Slant products and cyclic Künneth: owned nowhere else. Nothing has two owners.
- Source independence: 14 passages compared with 6 sources (km0807, scaduto1401, cs1612, froyshov9903, dfl07032, dfl07038); longest shared run 4 words ("one or two components", "exactly two connected components"). Largest share: Donaldson's book, about 37 of about 168 source mentions, not readable. Contents compared with dfl07032: §§9.1–9.4 follow its §§2.1–2.4 in the order the Needs lines force (splitting, moduli, Lagrangians, complex). Layer 10 merges its §§3–6 and splits its §7, and §§9.5 and 10.5 have no counterpart there. Result: independent.
- Research link: the headlines are Floer's instanton homology and surgery triangle, Frøyshov's reduced groups (1999), Kronheimer–Mrowka excision (2008), Scaduto's framed decomposition (2014), Chen–Scaduto nilpotence (2016) and the Daemi–Fukaya–Lipyanskiy admissible Atiyah–Floer theorem (2021). Kronheimer–Mrowka build sutured instanton homology on the excision theorem (km0807 §7). This line rests on the README's Summary and the sources read.

## Not verifiable

- Donaldson, *Floer Homology Groups in Yang–Mills Theory* (Cambridge Tracts 147): searched for an open copy; only Cambridge Core (paywalled) and library records. Its locators in §§0.3–0.4, 2.1–2.3, 3.1–3.3, 4.1–4.4, 5.1–5.2, 6.1 and 7.1–7.2 were not checked.
- Donaldson–Kronheimer, *The Geometry of Four-Manifolds* (Oxford, 1990): print monograph with no open copy; its chapter locators in Layers 1, 3, 4 and 6 were not checked.
- The published version of km0807 (J. Differential Geom., 2010), which arXiv:0907.4639v2 cites with generalized eigenspaces and a different Proposition 7.9: not read, as it is not open. Only arXiv v2 exists.

## Source issues

- **Misprint** in km0807 at Proposition 7.4, p. 55: the source says Y = S¹ × R, with Σ of positive genus, and concludes about I(Y|R); it should name one surface throughout (R); affects nothing.
- **Gap** in froyshov9903 at Theorem 10, p. 24: the source states nilpotence of u² − 64 on the reduced group, which §3 defines with integer coefficients, while the proof passes to exact sequences of ℚ[u]-modules; it should state the coefficient ring (Scaduto reads it with 2 inverted); affects a stated result.

## For the human reviewers

- **Not tested.** Donaldson's book is the source with the largest share of locators (about 37 of about 168 source mentions, `TauCetiRoadmap/InstantonFloerTheory/README.md` lines 1995–2004). It and Donaldson–Kronheimer (lines 2005–2009) have no open copy and are not in the roadmap's sources manifest, so wording and arrangement were not compared against them.
