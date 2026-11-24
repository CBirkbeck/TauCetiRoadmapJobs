# Review of MorseNovikov (pull request #1854 at 2f1f33b)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 1417 changed lines since `2c2bcf5`. The README at the merge base was compared with the head layer by layer and item by item, the changed statements were recomputed on small instances, the seeded source locators were read in the cached texts, the 129 declarations on the *In Tau Ceti:* lines were looked up at the pin, and `Suggested.lean` was elaborated and probed. No finding remains: every layer, section, API fact and Check of the README on `main` is kept under its id with its statement, and both findings of the previous review are repaired. There is one small correction and one format note, neither blocking; one licence question is left for a human.

## C01 — §4.2 and §4.4 now name each other in their *Needs:* lines

The *Needs:* line of §4.2 (line 811) asks for "the coset-monomial basis of §4.4", while the *Needs:* line of §4.4 (line 891) asks for "§§4.1–4.3". Read as a build order, each section waits for the other. On `main` §4.2 had no such pointer; the head adds it because §4.2's route now passes through a finite-index subgroup whose Novikov ring is a domain.

Nothing is in fact circular: the coset basis is the statement that Nov(ℤ,H,N) is free of rank [H:K] over Nov(ℤ,K,N|K) for a finite-index subgroup K, which uses Layer 1 only, and the pin already has it (`TauCeti.NovikovSeries.cosetBasis`, RingTheory/NovikovSeries/FiniteIndex.lean, with `finrank_eq_index` at line 207). The smallest change is to say so in §4.2's line, for example "the coset-monomial basis of §4.4, which needs Layer 1 only", or to split §4.4's line so that the basis is listed with "Layer 1" and the norm and torsion comparisons with "§§4.1–4.3".

## N01 — The *In Tau Ceti:* line of Worked examples is detached from the example it realises

In Worked examples (line 1733) the line naming the irrational-period declarations follows the sentences about `Suggested.lean` and "all other constructions and API targets", so it reads as if it realised those. It would sit better directly after the sentence on the irrational noninjective example that ends "as in Layer 1's Examples".

## Previous findings

- **R01 (the description omitted the pinned geometry and topology this head consumes): repaired.** The description now has the paragraph "MorseNovikov, pinned topology and geometry", which lists the consumed declarations section by section and says "The maximal flow, the flow of a complete field and the circle's angular form come from Tau Ceti in place of DifferentialGeometry".
- **R02 (three words run into their numerals): repaired.** The head reads "Prove B has order 2", "with product 0" and "the volume at ξ₀ is 1" (§2.3 and §7.2); no run-together word–numeral remains.

## Verified sound

| Statement | Instances | Values computed (left; right) | Result |
|---|---|---|---|
| Record against `main` | 7 layers, the numbered sections, bullets and Checks per section | head lacks 0 headings except the renamed supplier heading; 0 sections with fewer bullets or Checks; 136 reworded sentences each located at the head | kept |
| §1.1 completion and embedding | H=ℤ, N=id; N=0; H=ℤ², N(a,b)=a | Σt^k not finitely supported, so not onto; finite supports, onto; {(1,b)} infinite below C=2 | holds; pinned iff N=0, NovikovSeries/Basic.lean:697; rt3 line 133, p. 211 |
| §1.4 Laurent, Hahn, domain | t⁻²+3+t³; H=ℤ/2; ℤ² with a+√2b | same coefficients −2,0,3; (1−g)(1+g)=1−g²=0; one exponent at least period | holds; uniform equivalence over a field only (LaurentSeries.lean:183); `isDomain_of_fg` LeadingTerm.lean:266 |
| §1.5 orbit modules | lift change by h; t² on U₃; identity kernel | basis ×e^h; 2+3=5 so U₅; identity map (KernelMap.lean:224) | holds; rt3 lines 213–257, pp. 212–213 |
| §3.2 continuation | critical-free circle against two-zero circle | complex 0; two-term complex with differential ±(1−t), a unit since N(t)>0, so acyclic | chain homotopy equivalent; rt3 Lemma 2.2 line 538 p. 218, Lemma 2.5 line 592 p. 219 |
| §3.3 cellular comparison | (sin θ−C⁻¹)∂θ on S¹ | C>1: sin θ=1/C has two zeros; C<1: none, whole circle closed orbit | holds; rt3 Lemma 4.1 line 1634 p. 235, Remark 4.3 line 1712 p. 237 |
| §4.1 torsion convention | ℚ—2→ℚ; sum of a and b; degree-0 swap | ½ (pinned exponent j.negOnePow at j=−1, Basic.lean:502); a⁻¹b⁻¹; −1=1·(−1) | holds; rt3 Def. A.1 line 1851, Prop. A.2 line 1862, p. 239 |
| §4.2 and §4.4 needs (C01) | coset basis for K of index k | rank k over Nov(K) from Layer 1 alone (FiniteIndex.lean:207); §4.2 line 811 names §4.4, §4.4 line 891 names §4.2 | no real cycle; wording (C01) |
| §4.5 lift ambiguity | degree-0 lift by t; degree-1 lift by t; two-cell circle | ×t; ×t⁻¹ (exponent (−1)^i, Basic.lean:451); det[[−1,t],[1,−1]]=1−t | holds; rt3 Def. A.3 line 1886 p. 240, Def. 1.5 line 305 p. 214 |
| §5.1 return germ | P=2x conjugated by 3x; transverse dimension 0 | 2x, det(1−2)=−1 both sides; empty determinant 1 | holds; rt3 lines 67–82, p. 210 |
| §5.2 local index | x/2; 2x; x+x²−ε | +1; −1; fixed points ±√ε with 1−g′=∓2√ε, signs −,+, sum 0 | holds; rt3 Def. 1.1 line 119 p. 211, Lemma 3.2 line 855 p. 223 |
| §5.3 Euler product | i₋=0, i₊=0; i₋=1, i₊=0; Klein torus orbit with i₀=1, dim 2 | Σt^k/k gives (1−t)⁻¹ both sides; Σ(−1)^(k+1)t^k/k gives (1+t) both sides; README exponent (−1)^(2−1)=−1, rt2 (2) gives +1 | holds; pinned exponent −(ε₁σ) on 1−σe^γ, OrbitZeta.lean:220; DetSign.lean:102, 168 |
| §6.1 fold normal form | x³/3−εx; sign + and t<t₀; slide matrix [[1,a],[0,1]] | zeros ±√ε, Hessian ±2√ε, indices 0 and 1; −V₁=(t₀−t)−x₁²>0 between the zeros, index i to i−1; det 1 | holds; rt3 Lemma 2.11(a), (2.1), line 774 p. 222; Def. 2.6 line 632 p. 220 |
| §6.2 slide class | h=(−2,1), N(n,e)=−n | N(h)=2; μ(h)=−2≡1 mod 3; ν(h)=2 mod 4, ν(nh)=2n≡0 iff n even; (2,1) has N=−2 | holds; rt3 Lemma 3.7 line 1241 p. 229, Lemma 3.8 line 1289 p. 230 |
| §6.3 cutoff limits | t^m and t^(−m) as m→∞ | t^m in U_m, tends to 0; t^(−m) leaves every U_C | holds; rt3 Lemma 2.7 line 638 p. 220, Lemma 2.8 line 681 p. 221, Lemma 4.1 p. 235 |
| §6.4 calculations and overview | critical-free circle; two-zero circle; trefoil under t↦t⁻¹ | 1·(1−t)⁻¹; (1−t)⁻¹·1; (1−t⁻¹)²=t⁻²(1−t)², numerator unchanged | products agree; rt3 Ex. 1.7–1.9 lines 354–377 pp. 215–216; rt2 Ex. 1.4 line 150 p. 372 |
| `lefschetz_fixed_point_formula` (§6.5) | z↦z² on S¹; dimension 0 with a finite set; ∅ | −1=1−2; fixed-point count = trace on H₀; 0=0 | holds; Gra72 Thm. 10.1 line 545 p. 224; Hat02 line 7787 p. 179 |
| §7.2 Euler volumes | ξ₀ and ξ₀+h on the zero complex | 1; e^(image h)=e^(image h)·1 under τ(ξ+h)=e^(image h)τ(ξ) | consistent; rt3 Def. B.3 line 2009 p. 241, Def. B.4 line 2050 p. 242 |
| `poincare_hopf` and `rationalBetti` facts (§7.3) | S¹ with sin θ∂θ; S² height gradient; S³ height gradient; dimension 0 | +1−1=0=1−1; 1+1=2; +1−1=0; \|M\|=b₀ | holds; Hat02 Cor. A.8–A.9 lines 22832–22845 p. 527, Lemma 3.27(b) line 10259 p. 236 |

- Source locators checked against the text: 34 (rt3 26, rt2 3, Hat02 4, Gra72 1); every seeded target's locator matches, with printed page = PDF page + 208 for rt3.
- Library declarations: all 129 names on the 18 *In Tau Ceti:* lines are declared in the pinned Tau Ceti; 19 were opened and their hypotheses and conclusions compared with the items they realise.
- Cross-roadmap citations resolved on `main`: MorseTheory M1, M2, M6 (lines 132, 229, 1075); HeegaardFloer §1.5 (M.5) at 467 and §2.8 (F0.6) at 1913; GeometricTopology Layers 1, 3–5, 11 and §4.4 (2740); the citation resolver reports none missing. DGFloer and UniversalCovers are no longer named as suppliers; DGFloer appears only under Downstream consumers.
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with only `declaration uses sorry` at 109:8 and 156:8. `#check @` on all 8 declarations agrees with the README binder for binder; nothing changed. `simp`, `rfl`, `infer_instance`, `decide` and `exact?` each fail on both theorems. No `set_option`, no sorry'd data. `Suggested.lean` changes against `main` in its docstrings only.
- The pull request's text: the title and description agree with the head (18 lines, 129 declarations, no layer, section number or declaration changed, the heading "From TauCetiRoadmap.AlgebraicTopology" renamed, the six statements whose content differs from `main` listed). No file outside the pull request's own folders changes.

Overlap check: read MorseTheory, DGFloer and HeegaardFloer on main, and the open heads of HeegaardFloer, GeometricTopology and AlgebraicTopology; nothing shared. HeegaardFloer, AlgebraicTopologyPartII, CharacteristicClasses and the open GravitationalLensing each defer the Lefschetz formula and the vector-field Poincaré–Hopf theorem to MorseNovikov; the Novikov ring of the open AlgebraicGromovWittenTheory is that of effective curve classes, a different object.

Source independence: 10 passages compared with 3 sources (changed passages only), none shared; largest share rt3, 62 of 99 source mentions; the diff adds, removes or reorders no layer, so the arrangement was not compared.

Research link: The headline equality of Novikov torsion times the zeta function with Reidemeister torsion is Hutchings 2002 (Theorems A and B), extending Hutchings–Lee 1999; TaubesGromov on main consumes Layers 1 and 4–6 for its orbit expansions. Rests on rt3, rt2 and the README's Downstream consumers.

## Not verifiable

- Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35 (§§7.1 and 7.3 and the `zeroSign` docstring): not in the manifest and no legal copy; the passages citing it are unchanged from `main`.
- Hopf 1929 (`Hop29`): settled as uncertified; cited by its locator.
- Milnor, Whitehead torsion, §3, pp. 365–368 (§4.1): not in the cache; the citation is unchanged from `main`.
- rt1 (Topology 38 (1999)): not reopened in this round; no changed passage cites a locator into it.

Automatic checks set aside as false positives: the check for changes outside the folder lists five files, all in BanachSpaceTheory, SelfAdjointSpectralTheory and the OperatorTheory index, which are this pull request's own folders.

## Source issues

- **Error** in rt2 at equation (2), p. 371: the source gives each irreducible orbit the exponent −(−1)^(i₀) in every dimension; it should be (−1)^(n−i₀), which agrees only for odd n (an orbit with i₀=1 on a surface gets (1−t)⁺¹ instead of (1−t)⁻¹); affects a stated result.

## For the human reviewers

- Licence: Scope and ownership names an outside formalisation, Dongryul Kim's lean4-novikov (revision d5e705bd), and asks for coordination before code integration; `Suggested.lean` takes nothing from it. The passage is on `main` with one sentence reworded.
