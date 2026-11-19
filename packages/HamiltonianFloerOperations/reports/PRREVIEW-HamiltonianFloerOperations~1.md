# Review of HamiltonianFloerOperations (pull request #2590 at 47bba36)

**Verdict:** needs changes

**Summary.** The mathematics holds up: every sign, degree and normalisation I recomputed checks out, and so do all 23 Checks and the Tau Ceti and cross-roadmap citations. Two findings block. First, no target in the README carries a source locator. The single reference, the 1996 Piunikhin–Salamon–Schwarz paper, is cited for Layer 7 with no theorem or page, so none of the headline statements can be checked against the literature. Second, the ℂPⁿ computation of §8.4 rests on the line count ⟨x, xⁿ, xⁿ⟩_L = 1, and no section here or in a supplier owns it. There are also five small corrections and one format note, none blocking. The one question left for a human is that the only cited source could not be read legally.

## R01 (P2) — No statement of the roadmap carries a source locator, and the one reference is cited without a theorem or page

None of the roughly forty targets, including the three headline theorems, points to a theorem, section or page of any text. A reader therefore cannot check a hypothesis, a sign convention or the scope of a claim against the literature. This applies to the energy identity of §3.1, the support bound of §3.2, Gromov–Floer compactness in §3.4, the Leibniz rule and homotopies of §6.2–§6.3, multiplicative PSS in §7.4 and the ℂPⁿ relation in §8.4. A search of `TauCetiRoadmap/HamiltonianFloerOperations/README.md` for theorem, proposition, lemma, page or author locators finds only the References entry (lines 1190–1192). That entry cites the PSS paper for "the comparison of Floer cohomology with quantum cohomology (Layer 7)" with no locator. The seeded sample (§1.1, §1.2, §2.2, §3.1, §3.4, §4.1, §4.3, §4.5, §5.1, §6.2, §6.4, §7.2, §7.4, §8.2, §8.5) therefore had nothing to verify.

The smallest repair is a locator in parentheses at each headline claim and at each standard input, with a References entry for each work. Among texts readable at open repositories, Lu 2004 (arXiv math/0011155) has two relevant passages. Its Theorem 1.1 (p. 5, Lu2004 line 198) proves the module PSS isomorphism over ℚ for every closed symplectic manifold. Its Remark 1.2 (Lu2004 lines 201–207) names Theorem 5.1 of the PSS paper as the ring statement and says how it extends to every closed target. Pardon 2016 (arXiv 1309.2370) is relevant to Layer 5 and §5.4: its §10.4 (p. 106) defines rational Hamiltonian Floer homology on every closed manifold from implicit atlases, and its Theorem 10.7.1 computes it. The PSS paper's own Theorem 5.1 would be cited by its locator. I could not read it (see below).

## R02 (P2) — The line count that §8.4 uses for ℂPⁿ is owned by no target here or in a supplier

The target cannot be carried out as written: its proof route rests on an input that no section provides. In §8.4 (lines 905–910) the relation x^(⋆(n+1)) = q^L · 1 for n ≥ 3 is derived from ⟨x, xⁿ, xⁿ⟩_L = 1, "counted by the regular-manifold normalisation". Its *Needs:* line (line 915) names GromovWittenTheory §7.2 and ImplicitAtlases §5.6. ImplicitAtlases §5.6 (on main) applies only once the regular footprint is the whole moduli space, which means every genus-zero degree-one stable map to ℂPⁿ must have a surjective linearised operator. No section proves that, nor that the evaluation map meets point × point × hyperplane transversally in one positive point. GromovWittenTheory §7.2 states the line count N₁ = 1 only for ℂP² and only in its Checks and Examples (GromovWittenTheory README lines 666 and 674), not as a target. The ℂP¹ value appears there only as a Check too. So the input is unowned for every n, not just for n ≥ 3. Owning the ℂPⁿ relation here is itself consistent with the supply direction: GromovWittenTheory, both on main and at its open head, does not plan ℂPⁿ for n ≥ 3, so there is no second owner.

The repair is one target in §8.4, stated for every n ≥ 1, and its supplier sections added to the *Needs:* line. It says: for the standard complex structure on ℂPⁿ, every genus-zero stable map of degree one is regular, with u*TℂPⁿ ≅ O(2) ⊕ O(1)^(n−1) on the line and trivial bundles on contracted components, so H¹ = 0. The space of such maps with three marked points is then a compact manifold of real dimension 4n + 2, its evaluation map meets point × point × hyperplane transversally in exactly one point with sign +1, and ImplicitAtlases §5.6 gives ⟨x, xⁿ, xⁿ⟩_L = 1.

## C01 — The overview and the Lean docstring state the aspherical computation without "over ℚ", while §8.1 states it over ℚ

The Summary (lines 25–26: "on a symplectically aspherical `X` the product is the cup product") and the module docstring of `TauCetiRoadmap/HamiltonianFloerOperations/Suggested.lean` (lines 20–21) drop the coefficient ring. §8.1 (lines 875–877) proves the identification over ℚ only, through §7.4. Adding "over ℚ" in both places would make the overview's statement the one the layers prove. Alternatively, §8.1 could state the integral classical-branch version as well.

## C02 — "DGFloer §7.C.4, §5.4" reads as a DGFloer section, but §5.4 is this roadmap's

In §6.3 (line 704) the parenthesis "(DGFloer §7.C.4, §5.4)" attaches §5.4 to DGFloer, and so do the *Needs:* lines of §7.3 (line 830) and §7.4 (line 854), "DGFloer §7.C.5b or §5.4". DGFloer's Layer 5 has an item 4, its fibration theorem, so a reader can follow the wrong pointer. The phrasing of §7.4 itself (line 835: "DGFloer §7.C.5b on the classical branch, §5.4 on the rational branch") is the clear form. It would serve in all three places, for example "DGFloer §7.C.4 on the classical branch and §5.4 above on the rational branch".

## C03 — Convention 1 excludes the point by requiring n ≥ 1, yet treats it, and §8.1 asks to prove what Convention 1 defines

The Summary (line 3) and Convention 1 (line 62) take dimension 2n with n ≥ 1. Convention 1 then defines the point's Floer complex and product (lines 64–66), and §8.1 (line 875) asks to "Prove that on the point the product is multiplication". If n = 0 is meant to run through the general construction, write n ≥ 0 in Convention 1 and keep §8.1 as a check of it. The construction does give multiplication there: one constant orbit, Γ = 0 and index 0 + 0 − 0 − 0 + 0 = 0. If the point is a separate model, §8.1's clause about it states a definition and asks an implementer for nothing.

## C04 — "No automorphism of ℙ¹ fixes three points" is false as worded

The identity fixes every point. The sentence in §2.1 (lines 280–281) means that only the identity fixes three distinct points. "No automorphism of ℙ¹ other than the identity fixes three distinct points" says that.

## C05 — The §8.4 degree argument mentions only classes of degree one

The sketch (lines 907–908) uses only "a degree-one three-point class ⟨x^a, x^b, x^c⟩_L vanishes unless a + b + c = 2n + 1". It also needs the classes dL with d ≥ 2 to vanish. The general constraint is a + b + c = n + d(n + 1), and with a, b, c ≤ n this excludes every d ≥ 2 (3n < 3n + 2). It also excludes degree one in x ⋆ x^(k−1) for k ≤ n, because it would force c = 2n + 1 − k > n. Stating the general constraint would close the sketch.

## N01 — "The roadmap sits on four neighbours" (line 29) names five: DGFloer, GromovWittenTheory, ImplicitAtlases, AnalyticStableMaps and HeegaardFloer.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §1.1 cap gluing, class A = D₀ + u − D₁ − D₂ | S² × S², areas 1, 2; B = (−2, 1) | ω(B) = −2 + 2 = 0, 2c₁(B) = 2(−4 + 2) = −4; joint kernel {a + 2b = 0, 2a + 2b = 0} = 0, so Γ = ℤ² | holds |
| §1.1 orientation Check | A′ = −A, recap D₁ by B | change 2c₁(B) + 2c₁(B) = 4c₁(B); correct A: 2c₁(B) − 2c₁(B) = 0 | holds |
| §1.1 Tau Ceti laws | `productClass` = D₀ −ᵥ glue D₁ D₂ (Cap/Basic.lean:185) | vadd_out: +γ; vadd_fst/snd: −γ; matches README | holds |
| §1.2 branch models | ℂP¹; monotone with c₁ = 0 | T = e^(−L): degree −4, ν = ω(L) > 0; Σe^(−kL) ∈ Λ, Σe^(kL) ∉ Λ; ω = τ·0 = 0 gives Γ = 0 | holds |
| §1.3 regrading Check | C^k = CF_(c+k), CF_(c−k) | product degrees c − n and n − c; differentials −1 and +1; only c = n with the minus sign | holds |
| §1.4 comparison Check | ℂP¹, x ⋆ x = q^L | deg q^L = 4; e^(−L): raw −4, cochain +4 = 2 + 2; e^(+L): cochain −4 | holds |
| §2.2 compatible tangent condition | differentiate ω(J·, J·) = ω | ω(Y·, J·) + ω(J·, Y·) = 0, equivalent to ω(Yv, w) + ω(v, Yw) = 0 given JY = −YJ | holds |
| §2.3 curvature Check | (ℝ², dq∧dp), K = q ds + p dt | X_q = −∂_p, X_p = ∂_q, {q, p} = 1, R_K = 0 − 0 − 1 = −1; constant-map density 1 = −R_K | holds |
| §2.4 index Check | C²-small Morse, A = 0, max input | n + (ind p − n) − (ind p − n) − n = 0; without −n: n | holds |
| §3.1 energy identity (sample) | density expansion | ω(u_s − X_Ks, u_t − X_Kt) = u*ω + d(K(u)) − R_K(u); ∂S = x₁ + x₂ − x₀; ∫u*ω = ω(A) + ωD₁ + ωD₂ − ωD₀ | holds |
| §3.1 cylinder Check | K = H dt | E = A_H(x₊) − A_H(x₋), input at s → +∞ has larger action | holds |
| §3.2 support Check | actions 3, 2, 1, C = 0 | ω(A) ≥ −3 − 2 + 1 = −4; ν < 0 gives E ≤ 3 + 2 − 1 = 4; e^A side gives −ω(A) ≤ 4 | holds |
| §3.3 cutoff Check | constant ρ ∈ [0, 1] | R_ρK = ρR_K + (ρ − ρ²){K_s, K_t}, max ρ − ρ² = 1/4 at ρ = 1/2; pin formula adds dρ terms, zero here | holds |
| §3.3 pants bound Check | pin definition (PairOfPants/Basic.lean:69) | curvature ±β′(±s − 1)H_q on 1 ≤ ±s ≤ 2; ∫β′ = 1, total ≤ B₀ + B₁ + B_∞ | holds |
| §3.4 compactness (sample) | aspherical X | zero-area J-spheres are constant, so only breakings occur; no locator to check | no locator (R01) |
| §4.1–§4.2 exclusion (sample) | c₁-zero, simple spheres | one-pointed spheres sweep codim 4; 0- or 1-dim pants families on a 2-dim domain sweep ≤ 3 < 4 | consistent; no locator (R01) |
| §4.3 gluing (sample) | ends of 1-dim pants moduli | breakings at three ends give the three Leibniz terms of §6.2 | consistent; no locator (R01) |
| §4.5 T² normalisation | α, β of degree 1; point class | m₂(α, β) = pt = −m₂(β, α); with degree 2 input (−1)^(2b) = 1 detects nothing | holds |
| §4 Examples, monotone ceiling | index 0 | c₁(A) = (μ₀ − μ₁ − μ₂ + n)/2, ω(A) = τc₁(A), E ≤ A₁ + A₂ − A₀ + τc₁(A) + C | holds |
| §5.1 punctured moduli (sample) | aspherical X | ω = c₁ = 0 on S_sph, so it is c₁-zero and on both branches | holds; no locator (R01) |
| §6.1 dense periods Check | S² × S², areas 1, √2 | b = 1: (−1, 1), area 0.414, c₁ 0; b = 3: (−4, 3), 0.243, −2; b = 5: (−7, 5), 0.071, −4 | holds |
| §6.2 Leibniz Check | a, b degree 1, da = x, db = y | naive sign: mixed d² terms 2 x⊗y; Koszul: (−1)^(a+1) + (−1)^a = 0 | holds |
| §6.3 commutativity | pin theorem (Commutativity.lean:163) | sign (−1)^(ij) with D = δ₁⊗1 + (−1)^(d₁) 1⊗δ₂ matches Convention 8 | holds |
| §6.4 unit Check | Morse function with one maximum | ind 2n → μ = n → cochain 0; μ = n − ind → −n → cochain 2n | holds |
| §7.1 left-dual Check | T², GWT §7.2 left duals | α ⋆ 1 = (∫α⌣β)e^β; e^β = α (left), −α (right); GWT line 667 agrees | holds |
| §7.2 neck function Check | L(R) = R − 1 | one-sided derivative 1 at R = 1⁺, 0 at 1⁻ (ρ = 1); ρ(0) = 0 so K₀ = 0 | holds |
| §7.4 multiplicative PSS | algebra of §7.3 | F₀(G₀T − Q_M) − (F₀G₀ − 1)T = T − F₀Q_M; homotopy F₀K − H₀T | holds; Lu2004 Thm 1.1, Rem. 1.2 |
| §8.2 recapping | D₀ → D₀ + B; D₁ → D₁ + B | A → A + B, coefficient ×e^(−B), generator ×e^B, product fixed; A → A − B, ×e^B | holds |
| §8.4 ℂPⁿ | dimension count | a + b + c = n + d(n + 1); x ⋆ x^(k−1), k ≤ n: no d ≥ 1; x ⋆ xⁿ: d = 1, c = n, dual 1 | holds; input unowned (R02, C05) |
| §8.4 Check | ℂPⁿ | deg x^(n+1) = 2n + 2 = 2c₁(L) | holds |
| §8.5 T² exchange | unsigned exchange | α⌣β = β⌣α = −α⌣β gives 2α⌣β = 0 ≠ over ℚ | holds |
| Headline 1: product algebra | point (n = 0); ℂP¹ | point: index 0, product 1·1 = 1; raw degree −n, unit cochain degree 0 | holds; overview C03 |
| Headline 2: multiplicative PSS | ℂP¹ | QH side x ⋆ x = q^L, degree 4; HF side e^(−L)·1, cochain degree 4 | holds |
| Headline 3: computations | aspherical; ℂPⁿ | Γ = 0, Λ = R; overview omits ℚ (C01); ℂPⁿ degrees 2n + 2 both sides | C01, R02 |
| §2.1 automorphisms (C04) | Möbius maps fixing 0, 1, ∞ | z ↦ (az + b)/(cz + d) fixing all three is the identity | literal wording false |

- Source locators checked against a text: 0 in the README (none exist). Passages read for the repair: Lu2004 lines 65–207 and Pardon2016 lines 1–120 and 4386–4420.
- Library declarations opened at the pinned Tau Ceti: `Floer.productClass` and its laws (Cap/Basic.lean:185–275, Cap/Sewing.lean:77), `PeriodGroup` and lemmas (PeriodGroup.lean:78–282), `NovikovRing` (NovikovRing.lean:91–122), Laurent model (Laurent.lean:55–133), `coefficientComparison` family (CoefficientComparison.lean:59–188), `pairOfPantsPerturbation` (PairOfPants/Basic.lean:69), curvature and bracket (Energy.lean:99–127, Manifold.lean:51, Cutoff.lean:146, Hamiltonian/Basic.lean:48, 190), `kernelProduct_mem_cochain_gradeBy` (Grading.lean:45), commutativity theorem (NovikovModule/Commutativity.lean:163), neck, perturbation and time-independent lemmas (Neck.lean:186, Perturbation.lean:61, TimeIndependent.lean:94), end signs (ThricePuncturedSphere/EndCoordinate.lean:59).
- All 103 dotted names in the README resolve to a declaration at the pins. The Tau Ceti contract names 96 of them.
- Cross-roadmap citations resolved on main: DGFloer §7.C.1, 7.C.2a, 7.C.2b, 7.C.3, 7.C.3a, 7.C.3c, 7.C.4, 7.C.5b, 7.C.6 (all kept at the open DGFloer head); GromovWittenTheory §0.1, §0.2, §5.2, §6.1, §7.1, §7.2; HeegaardFloer §1.3, 1.4, 1.5, 1.9, 1.9a, 2.2, 3.1, 3.4, 3.5, 4.2–4.6d; AnalyticStableMaps §3.7; ImplicitAtlases §1.1–1.2, 4.2–4.3, 5.2–5.3, 5.6, 6.1–6.4, 7.1–7.4; MorseNovikov §1.1, 1.2, 1.5; MorseTheory Layers 1, 2, 6; AlgebraicTopology §6.2–6.4. Every supplier is on main.
- Dependency check output: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- Automatic checks: every check passed at this head, including the targeted build.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there were no `#check @name` signatures to compare. It has a single `import Mathlib`, no `set_option` and no sorry'd data.
- Headline theorems: the product algebra, multiplicative PSS, and the aspherical and ℂPⁿ computations. None is statable at the pins: there is no Floer complex, quantum cohomology or spherical class group of a manifold, as searched in Tau Ceti and Mathlib. The docstring names each headline and its missing carrier. There is no padding.
- Pull-request text: the counts (23 Checks in 19 sections, about ninety Tau Ceti declarations, 12 conventions, 11 removed Lean declarations, five old `Mathlib.*` imports) match the head. No sentence of the description is contradicted.

Overlap check: I read the scope of DGFloer, GromovWittenTheory, FukayaTheory, SymplecticFieldTheory and AnalyticStableMaps, both on main and at the open DGFloer head. These objects are shared:
- capped complexes, continuation and module PSS: owned by DGFloer;
- the closed quantum product and the left-dual convention: owned by GromovWittenTheory;
- genus-zero stable-map compactness: owned by AnalyticStableMaps;
- the Lagrangian m₂: owned by FukayaTheory and excluded here;
- contact and Reeb buildings: owned by SymplecticFieldTheory and excluded here;
- the ℂPⁿ quantum relation for n ≥ 3: owned here, and planned nowhere else.

SymplecticFieldTheory (line 94 on main) says this roadmap consumes its buildings, which this README does not. That sentence is SymplecticFieldTheory's to correct.

Source independence: I compared 7 passages (Conventions 5 and 7, §5.2, §5.4, §7.4, the Summary and the References entry) with 2 sources (Lu2004 and Pardon2016, neither cited by the README). A shared-wording scan found only the bibliographic title of the PSS paper in common. No source has a share of the locators, because the README has 0 locators. The only cited source, PSS1996, could not be read legally, so its contents could not be compared. The layer order is the construction order that the Dependencies lines force (Layer k needs only Layers below k).

Research link: The headline theorems are the pair-of-pants product and the ring isomorphism between quantum and Floer cohomology of Piunikhin–Salamon–Schwarz 1996 (README References). Lu 2004 (Theorem 1.1, Remark 1.2) and Pardon 2016 (§10) extend the Floer and PSS constructions to every closed target over ℚ, the setting of Layers 5 and 7. This rests on the README and texts I read.

## Not verifiable

- PSS1996 (Piunikhin, Salamon, Schwarz, *Symplectic Floer–Donaldson theory and quantum cohomology*, 1996): the sources service found no legal copy, and a web search found none on author, institutional or open-repository pages.
- The seeded sample (§1.1, §1.2, §2.2, §3.1, §3.4, §4.1, §4.3, §4.5, §5.1, §6.2, §6.4, §7.2, §7.4, §8.2, §8.5): these carry no locator, so there was nothing to verify (R01).

## Source issues

- none

## For the human reviewers

- Not tested: the only source the README cites, PSS1996 (References, lines 1190–1192), could not be read legally, so its wording and table of contents were not compared with the roadmap. The README carries no locators into any source.
