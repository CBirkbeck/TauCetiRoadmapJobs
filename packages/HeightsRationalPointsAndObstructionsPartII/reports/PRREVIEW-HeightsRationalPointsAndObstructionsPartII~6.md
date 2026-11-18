# Review of HeightsRationalPointsAndObstructionsPartII (pull request #1821 at 79be752)

**Verdict:** needs changes

**Summary.** One finding blocks: an example in the Conventions asserts a count of components that is false in characteristic two, which the same section keeps in scope; the repair is a four-word hypothesis. Every sampled statement, the three Lean headlines and the supplier citations check out against the sources and the pins. There are two small corrections and one format note, none blocking, and one point for the human reviewers: §11.7 corrects the printed statement of its source, and the correction was recomputed here and holds.

## R01 (P2) — The Conventions example of a reducible fibre square is false in characteristic two

The sentence (Conventions, first paragraph, line 25) "the multisection 2x=s of E×E over E has four components in its square, indexed by E[2]" carries no hypothesis on the field, and the next paragraph says that all characteristic-p arguments retain p = 2. A reader who takes the count at face value in characteristic two is wrong, and in the supersingular case the example no longer shows what it is brought in to show.

The fibre square is `{(x₁, x₂) : 2x₁ = 2x₂} = {x₁ − x₂ ∈ E[2]}`, whose irreducible components are the translates of the diagonal by the geometric points of E[2]. In characteristic two E[2] has two geometric points for an ordinary curve and one for a supersingular curve, so the square has two components or one, each non-reduced; with one component the square is irreducible and the claim "need not have irreducible self fibre product" has no witness. The count four holds exactly when the characteristic is not two. Section 1.3 states the same example correctly ("over S = E in characteristic zero", line 183).

Smallest change: add "in characteristic different from two" to the Conventions sentence.

## C01 — The Tau Ceti contract points to a §6.12 that the roadmap no longer has

In the supplier contracts, under "From Tau Ceti" (line 1748), the sentence "Its multiplication writes the abelian-variety addition used in §§3.6, 6.8 and 6.12" names a section that is not in the README: Layer 6 ends at §6.8, and the rational-point bound that the Lean file states is now part of §6.8. A reader looking for §6.12 finds nothing. Write "§§3.6 and 6.8".

## C02 — The Hilbert-irreducibility supplier is listed for a specialization that the stated route does by Masser's counting

Section 6.2 lists InverseGaloisAndArithmeticFundamentalGroups IG.2 under *Needs* (line 895), and the contracts say it "supplies Hilbert irreducibility for finitely generated characteristic-zero models used in simultaneous specialization" (line 1853). The route of §6.2 does not use Hilbert irreducibility: it compares Masser's polynomial bounds for the two exceptional sets with the exponential lower bound of his Scholium 1 at fixed degree. An implementer cannot tell where IG.2 enters. Either say which step uses it (for example the reduction to a fixed affine number-field model), or drop the edge from §6.2 and from the Layer 6 dependencies.

## N01 — Four library line numbers in the Mathlib contract are off by two or three lines

At the pin, `EuclideanSpace` is declared at line 114 of `Mathlib/Analysis/InnerProductSpace/PiL2.lean` (the README gives 111), `Metric.closedBall` at line 420 of `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean` (418), `Matrix.IsReducedRowEchelon` at line 85 of `Mathlib/LinearAlgebra/Matrix/Echelon/Basic.lean` (87) and `Projectivization.logHeight` at line 54 of `Mathlib/NumberTheory/Height/Projectivization.lean` (51).

## Verified sound

Previous review (of 653f2ec): it had no finding. Its repaired R01 concerned the headings of Layer 12; this head deletes Layers 8 and 12 and §§0.3, 4.1–4.3, 5.12, 6.9–6.12, and no remaining passage cites them except the pointer of C01.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions: fibre square of 2x = s | char 0; char 2 ordinary; char 2 supersingular | components = geometric points of E[2]: 4; 2; 1 (irreducible, non-reduced) | false without char ≠ 2: R01 |
| Conventions: level-four normalisations | r = 1, genus-two Abel curve | c₁(𝔏⁴) = 8c₁(L): degree 8·2 = 16; ĥ for 𝔏⁴ = 4ĥ for L⊗[−1]*L | agrees with §1.2 and GGK (4.10), (4.12) |
| Conventions: function-field height of [1 : 1/(t²+1)] | reference ℝ(t); coordinates in ℂ(t); reference ℂ(t) | one pole of residue degree 2: 2; two poles, 4/[ℂ(t):ℝ(t)] = 2; 4 | consistent with §7.1 Check and Layer 11 Examples |
| 1.1 restricted Hilbert scheme | E, L = O(3·0), r = 1, d = 3; r = g; diagonal of E×E | Hilbert polynomial 3n; one reduced point; degree 3 + 3 = 6 | ggk-2026 lines 425–458, pp. 198–199: matches |
| 1.2 Check on level structures | g = 1 | order of SL₂(ℤ/4) = 4³·(3/4) = 48; −1 acts as −I ≠ I: 24 points over one pair | correct; the source's "pairs" is loose (Source issues) |
| 2.4 lower bound (DGH 4.2) | constant section of a constant family, d = dim S ≥ 1 | F restricts to O(1) of the base: F^d constant in N, so no κN^{2d} bound | dgh-2021 lines 767–768, p. 17: matches; Check true |
| 2.5 upper bound (DGH 4.3) | d = 1; degrees of [2^l] | (M) = degree of X over the base, independent of N; D_l = 4^l, D′_l = (4^l − 1)D′/3 | dgh-2021 lines 917–919 and 966, pp. 19–20: matches |
| 2.6 total-space inequality (DGH 4.1) | E with degree-4 embedding, S a point, N = 2 | deg F = 4·2² = 16, deg M = 0, vol(F − tM) = 16 ≥ 16 − 0 | dgh-2021 lines 731–735, 1061–1075, pp. 16, 21–22: matches |
| 2.7 choice of N | N² ≥ 2c₀/c₁ | c₁ − c₀/N² ≥ c₁/2 > 0 | correct |
| 3.1 graph-degree normalisation | S a point, X = A; torsion section | positive multiple of Haar; ω restricted is 0, no measure | kuhne-2021 lines 119–131, 764, 864–865, 1828–1835: matches |
| 3.4 exceptional-set form (GGK 5.1) | rescaling by n = l/g! | u*L ≡ n²L₀: threshold × n², degree of a k-fold × n^{2k} ≤ n^{2(r−1)} | ggk-2026 lines 978–987, 1304–1345, pp. 211, 217–218: matches |
| 3.5 uniform Bogomolov | dim X = 0; threshold c″₃/4; non-generating X | one point; ĥ(P − P₀) ≤ 2ĥ(P) + 2ĥ(P₀) ≤ c″₃; translate into ⟨X − X⟩ | statement of ggk-2026 Theorem 1.3 extended by the README's own induction, which is sound |
| 3.6 and `uniform_maninMumford_curves` | D = [Q]; g = 1; one-tactic probe | c = −a(Q) gives a(Q) + c = 0; g = 1 fails (infinite torsion), excluded by 2 ≤ g; probe leaves goals | Lean equals README; dky-2020 lines 49–59: 34 points |
| 4.6, 4.7 constants | n = 2, k = 1; c′₁ = c′₃ = c″₃ = 1 | factor 4; B = 2, c₁ = min(1/2, 1/2) = 1/2 | correct |
| 5.6 isolated fibres or small exceptional set | r = 1; r = 2; X = [3]⁻¹Θ, L = 3Θ | D²; sD² ≤ D^{i+3} ≤ D⁴; D = 3·9·2 = 54, stabiliser of order 81 ≤ 54² | exponents and both Checks correct |
| 5.7 Check on heights of [3:5:1] | coefficient and Fubini–Study heights | log 5; ½ log 35; difference ½ log(7/5) < ½ log 3 | correct |
| 5.11 packing hypothesis (GGK 7.2) | c₁ = 1/4, c₃ = 2 | threshold c₀⁻¹ ≤ c₁ forces c₀ ≥ 4 = max{c₁⁻¹, c₃} | ggk-2026 lines 1518–1560, pp. 222–223; README right, source misprinted |
| 6.2 Check, Legendre section | μ² = 2(2 − λ), P = (2, μ) | 2·1·(2 − λ) = μ²; at μ = 0 order 2, generically not 2-torsion, so 2P is killed | correct |
| 6.4 specialization (GGK 7.3) | F = ℚ̄; rank of Γ_v | identity; rk Γ_v ≤ ρ so c^{1+rk Γ_v} ≤ c^{1+ρ} | ggk-2026 lines 1580–1623, pp. 223–224: matches |
| 6.7 uniform Mordell–Lang | Γ = torsion; Γ = 0 | at most c(g, d) torsion cosets; X° ∩ Γ has 0 or 1 point | ggk-2026 line 121 and §7: matches |
| 6.8 and `uniform_mordellLang_curves`, `uniform_rationalPoints_curves` | ρ = 0, s = ∅; no rational point; probe | condition is pⁿ = 1, n > 0: all torsion, bound B; no x₀, statement not instantiated; probe leaves goals | kuhne-2021 lines 322–333, p. 8: matches; rank form equivalent |
| 7.5 special ⇒ dense small points | torsion point; constant point | height 0 in both cases | xy-2022 lines 91–97, p. 3: matches |
| 9.4 defect induction | δ = d₁ + d₂ − e | trdeg(b, τb, c) = 2e − d₁; δ′ = 2δ − d₁ + a, a ≤ d₁ − δ, equality excluded by §9.3 | correct |
| 9.8 pencil height inequality | ℙ¹×ℙ¹, F a fibre | (pr₁*O(1)·F) = 0, (O(1,1)·F) = 1 | xy-2022 lines 639–645, 681–706, pp. 17–18: matches; README repairs the positivity step |
| 9.10 multi-sections | zero section; Legendre (0,0) | order 1, degree 1; order 2, degree 1 | xy-2022 lines 737–747, p. 19: matches |
| 9.11 numerical class | elliptic scheme over a projective curve | everywhere good reduction forces deg ω = 0, so (0·0) = 0 and class 2[0] | xy-2022 lines 787–794, p. 20: matches |
| 9.16 jump locus | r = 1; codimension count | e = 0; dim A′_{e+1} + e + 1 ≤ dim A′ + e − 1 | xy-2022 lines 959–969, p. 25: matches |
| 9.17 Check on E×E | L = H₁ + H₂, M = H₂, ε = ½ | M·L = 1 ≤ L² = 2; (M + ½L)² = 3/2; M² = 0 | correct |
| 9.19 geometric Bogomolov | constant A; trivial trace | every Y⊗K̄ special; special = torsion subvariety | xy-2022 lines 101–105, p. 3: matches |
| 10.1 product-grid exponent | three fibres in C² | degree 3, codimension 1: 3 ≤ 3; exponent 1/2 would give 3 ≤ √3 | yuan-2026 lines 2235–2244: matches; owner is the supplier's §12.4 |
| 10.2 non-isotrivial points | k = ℝ, K = ℂ(t), the point i | k′ = ℂ, factors through Spec k′: isotrivial | yuan-2026 lines 2761–2764, p. 82: matches |
| 10.5, 10.8 thresholds | S a point, g = 2 | 4.17: dim S, +1, +g, +1, +g; 4.19 each +1; C − C = J at m = 1 | yuan-2026 lines 3335–3343 and 3417–3426: matches |
| 11.1 isotrivial pairs | α = O(generic point); char 2, 2α = ω | pair non-isotrivial on a constant curve; torsor under J₀[2](k̄), all constant | yuan-2026 lines 2466–2499, pp. 73–74: matches |
| 11.4 comparison height | c = (g/2)log(2π²) + 1; g = 2 shift | h_Fal + c ≥ 1 and ≥ h_Fal; h = 2ĥ(2(x − α)) = 8ĥ(x − α) | agrees with the supplier's §13.7 and §6.5 on main |
| 11.5 moduli height over function fields | s of dimension 0 | Hodge term 0 = h_Fal of an isotrivial curve; deg N ≥ 1 | yuan-2026 lines 2684–2706, pp. 79–80: matches |
| 11.7 Yuan's theorem with ε_α = 1/d_α | constant genus-2 curve, α_N = w + Q_N | ĥ(Q) = 2, ĥ(x − α_N) = 2/N², ĥ(2α_N − ω) = 8/N², d_α ≥ N²/2; with 1: 2/N² ≤ c₁(1 + 8/N²) for all constant x | printed statement fails; corrected one survives: 10c₁/N² < 2/N² for c₁ < 1/5 |

- Source locators checked against the text: 36 (the fifteen sampled targets and 21 further ones in ggk-2026, dgh-2021, kuhne-2021, xy-2022, yuan-2026 and dky-2020); all agree with the README.
- Library declarations opened at the pins: 18 (13 with the line the README gives, 4 off by two or three lines, see N01; `TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese` at `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean` line 84, with `comp_eq_one` and `existsUnique_fac` as the contract says; `AbelianVariety.dim` at `Basic.lean` line 118).
- Cross-roadmap citations resolved by section heading: 15 suppliers, 10 on main and 5 at their open heads (HeightsRationalPointsAndObstructions, AbelianSchemesAndArithmeticModuliPartII, StableReductionPartII, TropicalAndBerkovichArithmetic, ArakelovGeometryAndAbelianHeightsPartII); every cited section exists. None of the seven declared gaps is already provided by its supplier (no interpolation estimate in the parent's §5.9b, no non-proper intersection inequality in SchemeAndStackFoundations Layer 5, no abelian valuation map or strict-support statement in TropicalAndBerkovichArithmetic).
- Automatic checks at this head: all passed; nothing changed outside the folder. Dependency check: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` exits 0 with three "declaration uses `sorry`" warnings (lines 58, 76, 97) and nothing else. The three elaborated types were compared with §§3.6 and 6.8: every hypothesis is an explicit binder, none lost.
- One-tactic probe on a scratch copy (`rfl`, `infer_instance`, `simp`, and `simp` after introducing B = 1): all three theorems leave unsolved goals. No padding.
- Headline theorems: uniform Manin–Mumford, uniform Mordell–Lang and the rational-point bound for curves are stated; the ten that are not statable are each named in the module docstring with the missing carriers (polarization degrees, canonical heights on general abelian varieties, adelic line bundles, traces).
- Pull request text: title and description read against this head; "eleven layers (numbered 0–7 and 9–11)", the three Lean headlines, the suppliers named and the summary block all agree with the README.

Overlap check: read ArakelovGeometryAndAbelianHeightsPartII (scope and consumer paragraphs, §§0.3, 12.4, 13.7), HeightsRationalPointsAndObstructions (summary, Layers 0 and 5 headings, §0.21), ArakelovGeometryAndAbelianHeights and JacobianChallengePartII on main (cited sections); AbelianSchemesAndArithmeticModuliPartII, ArithmeticDynamics, FaltingsFinitenessAndIsogenyTheoremsPartII and RelativeJacobiansAndIntegralCurveModels were searched for the owned objects only. Shared objects and owners: product-grid degree bound, positive comparison height, two-nef Siu inequality — ArakelovGeometryAndAbelianHeightsPartII (cited here); Néron–Tate form and qualitative Vojta method — HeightsRationalPointsAndObstructions (cited; halved here by convention); generically special locus — AbelianSchemesAndArithmeticModuliPartII (cited); uniform Bogomolov and small-point counts — this roadmap, as ArakelovGeometryAndAbelianHeightsPartII's scope paragraph also says. No object has two owners, and no other roadmap declares the three Lean names.

Source independence: 12 passages compared with 5 sources (ggk-2026, dgh-2021, kuhne-2021, xy-2022, yuan-2026), none shared beyond definitions and formulas that can be written one way; largest share ggk-2026, 44 of 145 source citations; contents compared with ggk-2026: independent (Layer 0 ↔ §2 in part, Layer 1 ↔ §3, Layer 3 ↔ §§5 and 8, Layer 4 ↔ §§4 and 6, Layer 5 ↔ §7.1 and Appendix A, Layer 6 ↔ §§7.2–7.4, with Layer 2 from dgh-2021 and the source's §4 placed after its §5). Layer 9 runs through xy-2022 §§3–5 in dependency order, forced by its *Needs* lines (9.4 needs 9.2–9.3, 9.6 needs 9.5, 9.9 needs 9.6–9.8, 9.17 needs 9.11 and 9.16), with §§9.1, 9.12 and 9.14 its own.

Research link: The headline targets are Gao–Ge–Kühne's uniform Mordell–Lang and Bogomolov theorems (2026), Kühne's curve bounds (2021) built on Dimitrov–Gao–Habegger (2021), Xie–Yuan's geometric Bogomolov theorem (2022) and Yuan's uniform Bogomolov-type bound (2026); rests on the README's References and the texts read.

## Not verifiable

- remond-2000-decompte (Lemma 3.1, Propositions 3.3–3.4): uncertified; §§5.5–5.7 were checked only against the restatements in ggk-2026 Appendix A.
- The explicit constants quoted from remond-2000-vojta Théorème 1.2 in the route of §5.4: not opened this round (display formulas are lost in the extraction, as earlier reviews record).
- The published version of yuan-2026 (Ann. of Math. 203): only the author manuscript of 21 August 2024 was read, so whether the printed journal statement of Theorem 1.1 differs is not known.
- The "good model" reference that ggk-2026 uses in the proof of Lemma 7.3 (its reference 39): not read; §6.3 gives its own route.

## Source issues

- **Misprint** in dgh-2021 at §4, p. 16 (line 756): the source says Proposition 4.3 gives a lower bound for the mixed intersection number; it should be an upper bound, as its statement and line 753 say; affects nothing.
- **Misprint** in ggk-2026 at Theorem 1.3, p. 192 (line 166): the source says the two constants are both called c₃; it should be c₃ and c₄, as display (1.4) uses; affects nothing.
- **Misprint** in ggk-2026 at the proof of Proposition 7.2, p. 223 (line 1560): the source says c₀ is the maximum of c₁ and c₃; it should be the maximum of 1/c₁ and c₃, since the threshold in (7.10) is c₀⁻¹; affects nothing.
- **Gap** in ggk-2026 at the proof of Theorem 1.3, p. 226 (lines 1700–1711): the source says Proposition 5.1 applies to X inside the abelian subvariety generated by X − X and inducts on components of the exceptional set; it should first translate X by a small point into that subvariety and compare heights, since components need not generate; affects the proof.
- **Error** in ggk-2026 at §5.1, p. 211 (lines 1000–1003): the source says the points of the restricted Hilbert scheme over level-four moduli are pairs of a subvariety and a polarized abelian variety; it should be triples with a level-four structure, finite-to-one over pairs; affects nothing.
- **Error** in yuan-2026 at §4.4.2, p. 81 (lines 2734–2735), with Theorem 1.1, p. 5 and Theorem 4.7, p. 70: the source says the function-field bound extends to classes over the algebraic closure by enlarging the field, keeping the constant 1; it should be 1 divided by the degree of the field of definition of the class, since enlarging the reference field rescales heights but not the constant; affects a stated result.
- **Gap** in xy-2022 at Proposition 5.4, p. 25 (line 972), with its proof p. 26 (lines 996–997): the source says the statement holds for every torsion point off the jump locus; it should be restricted to order prime to the characteristic, the only case the proof treats; affects a stated result.
- **Gap** in xy-2022 at the proof of Lemma 3.7, p. 18 (lines 703–705): the source says the final inequality holds because both bundles are ample; it should use that the pulled-back base bundle is nef and base-point free, since it is not ample on the total space; affects the proof.

## For the human reviewers

- **Scope.** `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/README.md` line 1698 states Yuan's Theorem 1.1 with the constant 1/d_α and calls the printed function-field statement false; the counterexample (line 1709) was recomputed here and holds for the author manuscript; the journal version was not read.
- **Licence.** `README.md` line 1876 records the repository AxiomMath/Mordell (Apache-2.0, a fixed commit) as provenance, not as a dependency; `Suggested.lean` shares no declaration with it.
