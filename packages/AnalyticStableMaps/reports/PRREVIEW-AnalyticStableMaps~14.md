# Review of AnalyticStableMaps (pull request #2529 at 21cf625)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 306 changed lines since `890b66d`. Accepted: the new §0.6–§0.8 and §2.24, the restated §7.3 with item 5 of the module docstring, and the reworded conic Check of §2.9 were recomputed and read against Wendl (2010, 2023) and Pardon at their locators, and no statement, Check or citation is wrong; the commit since the previous review moves `## Scope and ownership` and `## Exact supplier contracts` to the end of the README and changes no line of them. There is one small correction (the description does not mention that move) and one format note (a "below" the move left pointing the wrong way); neither blocks, and nothing is left for a human to decide.

## Previous findings

The previous review, of `509fbfd`, was an acceptance with no finding, small correction or format note, so there is nothing to repair. The 192 lines changed since are 96 lines removed and the same 96 lines added elsewhere: the two sections named above, moved verbatim.

## C01 — The description does not say that the scope and the supplier contracts moved to the end of the README

A reader of the diff sees 192 of its 306 changed lines in `## Scope and ownership` and `## Exact supplier contracts` and, from the description, expects them to be edits of content ("The Scope, Conventions, supplier contracts, … are updated to match"). At this head the two sections stand after `## Downstream consumers` and before `## References` (lines 1135 and 1164), where on `main` they stood before the layers; apart from the insertions the description already lists, their text is unchanged. One sentence would do: "The Scope and ownership and Exact supplier contracts sections now come after the layers; apart from the additions listed above their text is unchanged."

## N01 — One "below" in the scope section now points backwards

In the ImplicitAtlases bullet of `## Scope and ownership` (line 1156), "Every Čech group below is the Čech cohomology of ImplicitAtlases §0.7" was written when the layers followed it; they now precede it, so "above". The other "below"s of the supplier contracts (the Mathlib and Tau Ceti bullets at lines 1168 and 1177) point at the subsection on the remaining roadmaps, which still follows them.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.6 tangential identity and antilinear part | `D = D^ℂ + A`, A antilinear | `D(Jξ) − JDξ = (JD^ℂξ − JAξ) − (JD^ℂξ + JAξ) = −2JAξ`; with `D(J·du·Y) = J·D(du·Y)` gives `A(du·w) = 0` | holds; wendl10 line 1175 | none |
| §0.6 `c₁(T_u) = χ + Z(du)` | `z^d` on `ℂP¹`; cuspidal cubic; double cover of a line | `2 + (2d−2) = 2d = deg u*TℂP¹`; `(2t, 3t²) = 2t(1, 3t/2)`, ord 1, `2+1 = 3`; `2+2 = 4 = 2·2` | holds | none |
| §0.6 order: complex, not real | cuspidal cubic, charts `s=1` and `t=1` | `t ↦ (t², t³)` critical of order 1; `s ↦ (s, s³)` immersed; `|du|²` would give 2 | Check discriminates | none |
| §0.7 index formulas | general m | `ind D^T = χ + 2(χ+Z) = 3χ+2Z`; `ind D^N = (m−1)χ + 2(c₁ − χ − Z) = (m−3)χ + 2c₁ − 2Z`; sum `mχ + 2c₁` | holds; wendl10 lines 1447–1448 | none |
| §0.7 Checks | line; its double cover; cuspidal and nodal cubic; `m = 1` | `2+2 = 4`; `h⁰(𝒪(4)) = 5`, `h⁰(𝒪(2)) = 3`, `10+6 = 16 = 2(3·3−1)`, `6 = 10−4`; `2+12 = 14 = 16−2 = 2·(8−1)`; `2+14 = 16`; `−2χ′+2dχ − 2(dχ−χ′) = 0` | all hold | none |
| §0.7 sign of the chart comparison | `u(z) = (z,0)`, `ξ = (0,η)` | `−2i·½(dη + i·dη∘j) = dη∘j − i·dη`, the linearization of `du∘j − J·du` | holds | none |
| §0.8 order and index under a cover (sampled) | `v ~ w^k`, `φ ~ z^e`; cuspidal cubic ∘ `z²`; unbranched torus cover | `ord = ek + e − 1`; `(z⁴, z⁶)`: 3 = 1 + 2·1, at ∞: 1, `Z = 4 = 2 + 2·1`; `d·D(v) − (m−3)R − 2R − 2dZ(dv) = d·ind D_v^N − (m−1)R`, also `(m−1)(dχ−R) + 2d·c₁(N_v)` | holds; wendl23 lines 1180–1191 | none |
| §0.8 symmetric splitting | double cover of a line, `ψ(z) = −z` | `Γ_+ ∋ 1, z²` real dim 4 `= ind D_v^N`; `Γ_− ∋ z` real dim 2; `4+2 = 6` | holds | none |
| §2.24 kernel formula and criterion | tangential operator on `TΣ(Δ)` with slice; double cover of a line | `(3χ + 2Z) + (6g−6 + dim aut) = 2Z + dim aut`; `2·2 + 6 + 6 = 16 = dim ker D_u` | holds; wendl10 lines 1451–1463 | none |
| §2.24 `2Z(du) ≤ d_0`; super-rigid | regular simple u; −1 sphere, cover of degree d | `2Z + dim ker D^N = d_0`; `c₁ = 2−1 = 1`, `d_0 = −2+2 = 0`, `deg φ*N = −d < 0`, kernel 0 | holds; wendl10 line 1592, wendl23 lines 461–467 | none |
| §2.24 product Check | `Σ × {p}`, `g ≥ 1`, `n > 1` (`dim_ℝ F = 2(n−1)`) | `dim_ℂ H^{0,1}(Σ) ⊗ T_pF = g(n−1) > 0`; `g=1, n=2` gives 1, as §2.23 | holds | none |
| §7.3 regularity (headline 5; sampled) | `I ⊆ J`; product curve `g=1`, `dim F = 2`, `I = J` | chart `ℝ^(v+dim E_I) × E_(J∖I)`, total `v + dim E_J`; for `I = J` target is 0, the 2-dimensional family fits | matches pardon13 lines 4269–4280, 6182–6187, 6253–6259 | none |
| §2.9 conic Check | conics in `ℂP²` | `d_0 = (2−3)·2 + 2·6 = 10 = dim_ℝ ℙ⁵`; smooth conics open in `ℙ⁵` | holds | none |
| Module docstring item 5 | against §7.3 | same locus `ψ_IJ⁻¹(X_I^reg)`, map `s_(J∖I)`, dimension `v + dim E_I`; prose only | agrees | none |

- Source locators checked against the text: 14. wendl10: Lemma 3.8 (line 1175), §3.3 (1298–1330), Theorem 3 and Corollary 3.13 (1451–1463), Lemmas 3.14–3.15 (1500–1501), Corollary 3.17 (1592). wendl23: §2 normal operator (437–444), Proposition 2.2 (458), Definition 2.3 (461–467), §3.2 (1169–1186), Example 3.9 (1189), §3.3–§3.4 (1456, 1627). pardon13: Proposition 9.2.6 (4269), Theorem B.1.1 (6182), Lemma B.12.1 (7353). Of the seeded sample, §0.8 and §7.3 fall in changed text; the other thirteen targets are untouched and unaffected.
- Library declarations opened at the pins: `TauCeti.IsSubbundleFrameOn`, `subbundleTopology`, `IsSubbundleFrameOn.trivialization` (TauCeti/Topology/VectorBundle/Subbundle.lean, lines 25, 18, 363), `IsSubbundleFrameOn.contMDiffOn_coordChangeL` (TauCeti/Geometry/Manifold/VectorBundle/Subbundle.lean:82), `rangeQuotientMap`, `rangeQuotientHomeomorph` (TauCeti/Topology/VectorBundle/QuotientRange.lean:48, 122), `localMultiplicity` (…/RiemannSurface/LocalMultiplicity.lean:89), `ramificationDegree` (…/Ramification.lean:78), `FiniteHolomorphicMap` (…/Degree.lean:134); Mathlib `IsSemisimpleRing` on the group algebra (Mathlib/RepresentationTheory/Maschke.lean:164–168), `isotypicComponent` (Mathlib/RingTheory/SimpleModule/Isotypic.lean:182).
- Cross-roadmap citations resolved on main: HeegaardFloer §4.6e (F2.6e, the quotient operator through `TS² → u*TX → N`), ComplexKahlerGeometry §4.1–§4.2 (Koszul–Malgrange), CharacteristicClasses §2.3 and §3.0 (local indices, `c₁ = e`), PseudoholomorphicCurveAnalysis §7.2 (Riemann–Roch and the zero count), TaubesGromov Layers 1–2 (its README maps the former TGk to Layer k). All suppliers are on main.
- Record: no layer, section or item of the README at the merge base is removed, retitled or renumbered; four sections are added under new ids (0.6, 0.7, 0.8, 2.24).
- Automatic checks at this head all passed. Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` exited 0 with three `sorry` warnings (lines 106, 129, 162) and nothing else. The diff changes only the module docstring: one definition with a real body, three theorems, no `set_option`, no sorried data; signatures, headline list and the one-tactic probe stand as in the earlier reviews. The new sections add no headline; the description says why they are not statable (bundle-valued Sobolev spaces).
- Pull request text: title and description agree with the head, except as in C01. The diff outside the roadmap folder is empty.
- Overlap check: read HeegaardFloer, ComplexCurveModuli, GromovWittenTheory, ComplexKahlerGeometry, TaubesGromov; the embedded-sphere normal operator is owned by HeegaardFloer F2.6e and cited by §0.7, the embedded-curve and twisted torus operators by TaubesGromov Layers 1–2 (a consumer, named as such), Koszul–Malgrange by ComplexKahlerGeometry §4.2; nothing else shared.
- Source independence: changed passages only; 9 passages compared with 3 sources (wendl10, wendl23, pardon13), none shared beyond formulas and standard names; largest share pardon13, 28 of about 63 named locators; the diff adds, removes and reorders no layer, so the contents comparison stands: independent.
- Research link: §0.6–§0.8 and §2.24 are the normal operator and regularity criterion of Wendl (2010) and the super-rigidity setting of Wendl (2023); Layers 5–9 build Pardon's (2013) implicit atlas on stable maps; Layer 3 is the compactness theorem of Ivashkovich–Shevchishin (1999). Rests on the README's References and the texts read.

## Not verifiable

- Ivashkovich–Shevchishin, Invent. Math. 136 (1999): paywalled, settled as uncertified; §0.6 cites it by locator beside Wendl 2010 §3.3, which was read and attributes the construction to it.
- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*: not available from an open source; cited only in untouched text.

## Source issues

- none

## For the human reviewers

- none
