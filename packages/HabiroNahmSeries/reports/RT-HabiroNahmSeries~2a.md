<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/152#issuecomment-6358394564 -->
Red team round 2 pass a (codex) of 75188f2

Verdict: needs_changes

1. **F01** (P3) The new Rogers Check contradicts the extension formula

   **Location:** packages/HabiroNahmSeries/README.md:214: “At x=2 and x=−1 … −π²/12 and +π²/12; their sum is zero”.

   **Claim:** These are the values of the extension defined at line 208.

   **Witness:** L(1/2)=π²/12; L(2)=−π²/12; L(−1)=π²/6−L(2)=π²/4. Their sum is π²/6, nonzero modulo (π²/2)ℤ. CGZ lines 1687–1698 give these same extension rules.

   **Exact repair text:** “At x=2 and x=−1 the values are −π²/12 and π²/4. Their sum is π²/6, as [2]+[−1]=[0] requires. The inversion pair x=2,1/2 instead has sum zero.” The repaired values satisfy both defining formulas and both relations.

2. **F02** (P2) The tame-kernel gap duplicates the available arithmetic supplier

   **Location:** packages/HabiroNahmSeries/README.md:91: “in layer N.6, finiteness of K₂(𝒪_K)”; packages/HabiroNahmSeries/design/plan.json, gap tame-kernel-order.

   **Claim:** General number-ring K₂ finiteness is missing and must be supplied as an extension.

   **Witness:** TauCetiRoadmap/ArithmeticKTheory/README.md:990 states that every positive even K-group of a number ring is finite, in §3.4. The supplied open head includes K₂ explicitly at line 1011. The requested exceptional integer is already assigned to gap:finite-chern-cyclic.

   **Exact repair text:** “ArithmeticKTheory §3.4 supplies finiteness of K₂(𝒪_K). Define k_K as its finite cardinality. HabiroNumberFields Layers 0–1, through gap:finite-chern-cyclic, supplies the finite-Chern exceptional integer using this input.” Remove gap:tame-kernel-order from README and plan; replace its N.6 citation in §7.3 by ArithmeticKTheory §3.4. For K=ℚ this supplies finite K₂(ℤ), while making no finiteness claim for K₂(ℚ).

   Re-raised: pass a F12, only its ArithmeticKTheory availability premise. The repair report's reason that this supplier is unavailable fails at the explicitly supplied head. The other declared arithmetic gaps remain accepted contracts.

3. **F03** (P2) General Pochhammer targets are planned again

   **Location:** packages/HabiroNahmSeries/README.md:235: “prove that the infinite product … converges locally uniformly”; “Supply … the infinite/finite quotient identity”.

   **Claim:** These general analytic product results are new targets here.

   **Witness:** TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:209–218, §1.6, already states local uniform convergence on ℂ×{|q|<1} and the finite/infinite identity. GeometryOfNumbersAndQuadraticArithmetic §4.3 owns qPochhammer, its shift and zero divisor.

   **Exact repair text:** “Import the analytic qPochhammer, shift and zero-divisor results from GeometryOfNumbersAndQuadraticArithmetic §4.3 and the locally uniform finite-prefix limit and finite/infinite product identity from QSeriesPartitionsAndMockModularForms §1.6. Here identify the factor-log branch on its stated zero-free domain and establish the radial remainder estimates of §2.2.” Remove the repeated generic product targets; add these exact supplier citations. At w=0 the imported product is 1; at w=1 it is 0, so the logarithm remains excluded there.

4. **F04** (P3) Frobenius declaration names have drifted from the supplied head

   **Location:** packages/HabiroNahmSeries/README.md:85: “QWitt.completedEtaleFrobenius, completedEtaleFrobenius_mod and completedEtaleFrobenius_natural”; line 956 repeats the first name.

   **Claim:** These are names exported by QWittVectors §6.1.

   **Witness:** At the supplied head, TauCetiRoadmap/QWittVectors/README.md:789–807 states the theorem and its reduction/naturality laws in prose; neither that README nor Suggested.lean declares any of the three cited identifiers.

   **Exact repair text:** “Consume QWittVectors §6.1, Completed étale Frobenius: the unique continuous ψ_p-semilinear lift, its reduction law and naturality on completed étale algebras over a perfectly covered Λ-base.” Replace the invented identifier at line 956 with the same section/theorem description. The mathematics, including both factors of ℤ_p×ℤ_p, remains supplied.

5. **F05** (P3) Coordinate-field finiteness is a library corollary of the preceding target

   **Location:** packages/HabiroNahmSeries/Suggested.lean:70: “theorem nondegenerate_coordinateField_finite”.

   **Claim:** This is a separate deep acceptance target.

   **Witness:** Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:612, IntermediateField.finiteDimensional_adjoin, gives precisely this conclusion from algebraicity of the finitely many coordinates. IsAlgebraic.isIntegral is the pinned field conversion; the preceding target supplies every coordinate.

   **Exact repair text:** Delete nondegenerate_coordinateField_finite from Suggested.lean and its declaration-name claim in README. Keep the mathematical conclusion in §1.3 as a corollary of nondegenerate_zero_isAlgebraic and IntermediateField.finiteDimensional_adjoin. For P=X²−2 and x=√2 the first theorem gives algebraicity and the imported corollary gives the same degree-two coordinate field; rank zero gives ℚ.

6. **F06** (P2) Scalar restriction does not preserve coefficient lines

   **Location:** packages/HabiroNahmSeries/README.md:1377: “compatibility with tensor addition and finite étale scalar restriction”.

   **Claim:** The Picard-valued coefficient-line construction has a finite étale scalar-restriction compatibility, without naming a norm or a different variance.

   **Witness:** For B=R×R, the trivial B-line B restricts to R⊕R, of rank two, not an invertible R-module. The Check at line 1385 explicitly includes split B.

   **Exact repair text:** “Prove compatibility with tensor addition and finite étale scalar extension (pullback on Picard groups). A covariant comparison, if required, uses the finite étale norm functor and its specified K₃-index transfer; ordinary restriction of scalars is not a map between these Picard groups.” Name that additional norm comparison with its hypotheses if it is intended. On R→R×R, extension sends R to the trivial B-line; restriction still has rank two.

7. **F07** (P2) Analytic convergence and the order-one expansion are narrowed to rational data

   **Location:** packages/HabiroNahmSeries/Suggested.lean:41–46; packages/HabiroNahmSeries/README.md:17 and :243: “symmetric positive definite rational matrix … rational vector … rational number”.

   **Claim:** The analytic input carrier and convergence/holomorphy targets only admit rational entries, and §2.5 uses that carrier even at order one.

   **Witness:** GZ lines 327–328, Remark 3.2, explicitly allows real A,B,C at ζ=1. The same Gaussian majorant proves convergence and holomorphy. Rank one A=√2, B=C=0 has a positive quadratic exponent but cannot inhabit NahmDatum.

   **Exact repair text:** “Use real symmetric positive definite A and real B,C for analytic summability, holomorphy and the order-one radial expansion. Rational analytic data are their specialization for algebraicity, root-of-unity phase reduction and arithmetic descent.” Generalize the analytic carrier and its Lean signatures, or add the real carrier with these general theorems and a rational specialization. At A=√2 the exponent is n²/√2 and Gaussian domination applies; the arithmetic field targets still explicitly require rational coefficients.

8. **F08** (P3) The leading-coefficient convention lacks discriminating Checks

   **Location:** packages/HabiroNahmSeries/README.md:490: “Define cuspLeadingCoefficient relative to σ and w”; Checks at lines 494–498.

   **Claim:** The new leading-coefficient definition has three discriminating Checks, including its root-of-unity normalization.

   **Witness:** The constant and j examples both have leading coefficient 1; the remaining Checks concern widths, indices and a matrix determinant. None computes the changed coefficient under σ↦σT, or a nonunit leading coefficient.

   **Exact repair text:** Add: “For the germ 7q_w²+3q_w³ at width 3, the order is 2/3 and leading coefficient 7. Replacing σ by σT gives 7ζ₃². Adding −7q_w²+2q_w³ leaves 5q_w³, with order 1 and leading coefficient 5.” These three values distinguish the coefficient from the order, an invariant scalar, and a constant-one placeholder.

9. **F09** (P2) The repaired dependency graph still runs against the stated build order

   **Location:** packages/HabiroNahmSeries/README.md:847: “conditional on the Gaussian comparison obligations in §5.6”; :969: “potential and refined constant-unit congruences of §6.3”.

   **Claim:** Targets are presented in build order, but the level theorem in §5.5 requires §5.6, and the full Frobenius theorem in §6.1 requires §6.3.

   **Witness:** §5.6 itself needs the earlier order-m system of §5.5. The required order is: order-m system → Gaussian comparisons → level admissibility; coefficient localization → §6.3 congruences → full Frobenius defect. These are explicit target edges.

   **Exact repair text:** “Keep the congruence-series definition and order-m system before Gaussian comparison; place levelAdmissibilityCancellation and congruenceNahmSeries_levelAdmissible after that comparison. Keep Frobenius construction and coefficient localization before the modified potential; place fullCoefficientFrobeniusCongruence after both intrinsic congruences and before membership.” Move the target paragraphs and update locators accordingly. This order preserves every input and removes the forward dependencies without reinstating the old cycle.

10. **F10** (P2) The figure-eight comparison changes the source coefficient by a factor of nine

   **Location:** packages/HabiroNahmSeries/README.md:1317: “with first terms 1+(5ζ₆−7)x/3+…”.

   **Claim:** The displayed normalized Pochhammer comparison has that first coefficient, citing GSWZ (278).

   **Witness:** GSWZ line 2740, (278), has denominator 3³, not 3. For ζ₆=(1+i√3)/2 the cited coefficient is (−9+5i√3)/54; the package instead gives (−9+5i√3)/6.

   **Exact repair text:** “Define f̂ with the volume factor, determinant root and branch convention of GSWZ (278), and state the transport from the preceding f₁(h). In that convention the normalized comparison starts 1+(5ζ₆−7)x/27+O(x²).” Do not identify the two normalizations without that transport. At the specified ζ₆ the repaired coefficient is exactly (−9+5i√3)/54. The source locator verifies this coefficient; it does not establish the package's asserted all-order integrality proof.

## Round 1 repair verification

Each quote below is from the current package. Labels a/Fxx and b/Fxx disambiguate the earlier reviews. Mathematical witnesses were recomputed; deletion-based repairs are assessed against this round's headline-only rule, not the earlier request to add Lean Checks.

| Earlier finding | Status | Current repaired passage and location | Verification witness |
|---|---|---|---|
| a/F01 | Partly repaired | packages/HabiroNahmSeries/README.md:1042, “Neither this congruence nor the intrinsic W_p theorem consumes fullCoefficientFrobeniusCongruence.” | §6.1 consumes §6.3; §6.3 consumes Frobenius, localization and cyclic products only. The former two-way edge is absent; the build order still places the full theorem first (S09). |
| a/F02 | Repaired | packages/HabiroNahmSeries/README.md:11, “ThetaSeries … (Layer 1)”; packages/HabiroNahmSeries/Suggested.lean:14, “The radial asymptotic and arithmetic descent theorems are not statable”. | No PR identifiers or trailing declaration catalogue remain in either file. |
| a/F03 | Repaired | packages/HabiroNahmSeries/sources.toml:1, “schema = "tauceti-roadmap-sources/v1"”. | Ten unique source IDs match the ten bibliography entries and the supplied legal caches. |
| a/F04 | Repaired | packages/HabiroNahmSeries/README.md:1157, “(−1)^(N+tr A) q^(−c_A)”. | A=0,m=1: raw −1/(1−t), corrected +1/(1−t). |
| a/F05 | Repaired | packages/HabiroNahmSeries/README.md:1180, “ζ_m^(−c_A)(∏_i T_i^(m−1))/(m^Nδ_A(t))”. | A=0,m=2,T=3/5: inner sum 16/3; corrected 5/2=1/(1−T), not the old 25/6. |
| a/F06 | Repaired | packages/HabiroNahmSeries/README.md:867, “requires A and C−BᵀA⁻¹B invertible”. | Matrix ((0,1),(1,0)) has determinant −1 and first block determinant 0; iteration is excluded. Aarhus line 457. |
| a/F07 | Repaired | packages/HabiroNahmSeries/README.md:994, “p∤Δm”. | p=m=5 is excluded; Φ₅ mod 5=(X−1)⁴. For p∤m the Kummer derivative mw^(m−1) is a unit. |
| a/F08 | Repaired | packages/HabiroNahmSeries/README.md:922, “étaleness of S_A[1/2]”. | N=0: ℤ[T]/(T²−1) has no 1/2, while its localization splits with unit derivatives ±2. |
| a/F09 | Repaired | packages/HabiroNahmSeries/README.md:224, “ℚ(y)=ℚ(x)=ℚ(√5)”. | y=1−x, x=y² prove both inclusions. The separate cube root of 1/2 is not in ℚ(ζ₃). |
| a/F10 | Repaired | packages/HabiroNahmSeries/README.md:54, “these are present at the pinned Tau Ceti commit”. | GaussSum.lean:172 and :284 contain the cited norm/radical theorems. |
| a/F11 | Partly repaired | packages/HabiroNahmSeries/README.md:66, “Construct its projective extension … in §1.5”. | The analytic owner and local Rogers target are corrected. The newly added x=−1 Check is false: π²/4, not π²/12 (S01). |
| a/F12 | Partly repaired; otherwise settled | packages/HabiroNahmSeries/README.md:42, “A gap contract specifies an interface required from its named owner”. | Eight matching slugs exist in plan and README. Missing Bloch/Habiro owners are now declared contracts. ArithmeticKTheory finiteness is already supplied at its head (S02). |
| a/F13 | Repaired | packages/HabiroNahmSeries/README.md:79, “gap:qseries-root-modularity … additional contracts”. | §§2.4,3.1,3.3,5.2 exist at the supplied q-series head; missing q-Lucas/Andrews–Gordon/modular extensions are declared. Generic analytic duplication remains separately S03. |
| a/F14 | Partly repaired | packages/HabiroNahmSeries/README.md:85, “From QWittVectors §6.1 consume”. | Ownership and perfectly covered hypothesis are correct. The three identifier spellings no longer exist at the supplied head (S04); the prose theorem does. |
| a/F15 | Repaired | packages/HabiroNahmSeries/README.md:1415, “these applications impose no reverse prerequisite”. | No reverse prerequisite from the Nahm applications to its declared arithmetic suppliers remains; depcheck has zero problems. |
| a/F16 | Repaired differently | packages/HabiroNahmSeries/README.md:449, “if m>0, Φ₀≠0”; packages/HabiroNahmSeries/Suggested.lean:14–16 names the missing radial carriers. | Generic unit-series descent is an API corollary, not an acceptable substitute headline. Φ=√2(1+3ε−ε²) normalizes to 1+3ε−ε²; m=0 would fail. |
| a/F17 | Repaired | packages/HabiroNahmSeries/README.md:1152, “(1−w_i^m)⁻¹”. | A=0,m=1,t=u,w=1−2u gives first coefficient 2/u−4; the added generator has the required pole. |
| a/F18 | Repaired differently | packages/HabiroNahmSeries/README.md:737 gives the t and t² coefficients; Suggested.lean now contains no examples. | A=3 at q=2 gives 8 and 512/3, excluding a constant-one model. README controls remain; adding admitted or elementary Lean controls would violate this round's rule. |
| a/F19 | Repaired | packages/HabiroNahmSeries/README.md:198–200 gives valid evaluation, localization at 5 and nonunit rejection. | Mod z³−z+1, z(1−z²)=1 and δ(2z²+3z−9)/23=1. Both identities survive localization; δ↦0 cannot. |
| a/F20 | Repaired | packages/HabiroNahmSeries/README.md:1339, “identify its unique continuous Frobenius lift with the unique roots”. | This is a characterization with a good-index hypothesis; factoring/lifting algorithm instructions are gone. |
| a/F21 | Repaired | packages/HabiroNahmSeries/README.md:1162, “for every symmetric integral A”; packages/HabiroNahmSeries/Suggested.lean:136. | 2,114 exact product comparisons passed. A=−1,k=2,q=2 gives 155/8; coupled A=((2,1),(1,1)),k=(1,1) gives −45/4. |
| a/F22 | Repaired | packages/HabiroNahmSeries/README.md:1389, “étale of relative dimension zero”. | Spec ℤ[1/6] still has (0)⊊(5), absolute dimension one; relative dimension is zero. |
| a/F23 | Repaired | packages/HabiroNahmSeries/README.md:161 cites “II.3A, (25), p. 43”; :567 cites “(28)–(30), pp. 47–48”. | Zagier lines 2216,2510,2526,2530 have these equation labels in the cited edition. |
| a/F24 | Repaired | packages/HabiroNahmSeries/README.md:822, “GSWZ (32), p. 12”. | GSWZ lines 535–540 define the congruence series; (35) is the coefficient ring. |
| b/F01 | Repaired | packages/HabiroNahmSeries/README.md:411–413 explicitly uses “a=1”, “a=2”, “a=4”. | D=2,m=3 gives G=0,1,1 respectively; D=4,a=1 terms 1,−1,1,−1 again give 0. |
| b/F02 | Repaired differently | packages/HabiroNahmSeries/README.md:1347, “every natural number m … including m=0”. | The Lean padding declaration is deleted. m=0,2,4 multiplied by 3 gives 2,0,2 on both sides. |
| b/F03 | Repaired | packages/HabiroNahmSeries/README.md:1306, “GZ §5, (39)–(42), pp. 10–11”. | GZ lines 630,651,654 locate the equations, dictionary and map; (26)–(31) instead split congruence classes. |
| b/F04 | Repaired | packages/HabiroNahmSeries/README.md:11, “The FuchsianOrbifolds roadmap”; :532, “FuchsianOrbifolds Layers 3–5”. | The process qualifier is removed; the cited main layers contain cusp charts/descent. |
| b/F05 | Repaired differently | packages/HabiroNahmSeries/README.md:105, “For every rational matrix A, without symmetry”. | Deleted the elementary Lean theorem. For A=((0,1),(0,0)), Q=n₁n₂/2 and Q(n+4u)−Q(n) is integral. |

## Verified sound

Read all 1,433 README lines and all 160 Lean lines. Compared all 17 declarations (9 definitions/structures and 8 admitted theorems) with the supplied elaborated signatures; no lost section binder was found. Read all 38 numbered subsections and all 223 Check bullets. The following ledger contains 182 README statement rows and 17 Lean declaration rows, including the bold analytic/formal conventions, positive root-expansion sign, unsigned WKB convention, Gauss-companion ±2 distinction and whole-disc condition. These counts measure the audit coverage, not proofs of 182 universal theorems.

Computed 2,114 exact generalized-product instances and 2,080 exact difference-equation instances using rational arithmetic: rank zero, rank one with A from −3 to 4, and symmetric rank-two matrices with entries from −1 to 2, at q=2 and (for the product) q=3/2, with indices 0 through 3. Also computed the cubic inverse identities, quartic Nahm relations, norms and basis trace discriminant, four Wick jets, Rogers values, finite Gaussian phases and 20 quadratic Gauss norms. The 223 README Checks were inspected; the explicit tested values and limitations are recorded below rather than treating every prose Check as an independently proved assertion.

The eight headline statements present in Lean are positive-solution existence/uniqueness, nondegenerate algebraicity, its coordinate-field corollary, summability, holomorphy, the full matrix difference equation, the general symmetric q-binomial product, and the quadratic Gauss norm evaluation. Delete the coordinate-field corollary as S05; the others do not reduce to a single pinned lemma on their current carriers. S07 records the missing real analytic generality.

The additional headline endpoints are the radial expansion and its Kummer/Chern descent; modularity implying distinguished Bloch torsion; formal admissibility and Gaussian comparison; full coefficient-algebra Frobenius and Habiro-module membership; all-root residue gluing; quartic Bloch-order and descendant-rank endpoints; and cohomological exports. The module docstring names these families and the missing carriers. It does not replace them with free predicates or sorry'd data. Elementary recurrence uniqueness, boundary values and generic unit-series descent remain README API material rather than acceptance-test padding.

The package has one import, `import Mathlib`, the required namespace and layer comments, docstrings on every declaration, no `set_option`, no `lemma`, no admitted data and no admitted examples. The `origin/main...HEAD` diff has seven files and 2,185 insertions, all within packages/HabiroNahmSeries. The review only adds this report; no tracked package file was changed. No Lean build or elaboration was run. The supplied signature dump was used instead.

### Source locator audit

The ten manifest entries have unique keys and legal cached texts. The table records 36 locator groups inspected this round; broad equation ranges are one group, not a claim to have independently proved every equation in a paper. The source year field sometimes denotes the original preprint year; the explicit version notes identify the actual text read. No additional source or missing-reference request was necessary.

| Locator group | Text witness and result |
|---|---|
| CGZ §7.1, (40)–(42) | CGZ lines 1660–1703: unsigned equation, positive point, complementary Rogers convention. Projective Check fails as S01. |
| CGZ Theorem 7.1, (43)–(44) | CGZ lines 1703–1728: radical-valued radial expansion and power-field conclusion; arithmetic descent is not the same theorem as analytic convergence. |
| CGZ Corollary 7.2 and Remark 7.3 | CGZ lines 1729–1748: constant normalization and rational-data extension; README keeps nonzero-constant and coherent-field obligations. |
| CGZ Theorems 7.4–7.5 | CGZ §7.2–§7.3, following line 1748: Andrews–Gordon application and modularity implication. The final theorem is for the distinguished positive solution. |
| VZ Lemma 2.1 | VZ lines 32–94: convexity proof of the unique positive solution. Real A is allowed. |
| GZ Lemma 2.1 | GZ §2, (2)–(8): root Pochhammer expansion and its local hypotheses; the package supplies additional uniform remainder targets. |
| GZ (13)–(14) | GZ lines 205–226: normalized Gaussian bracket and perturbative series. The covariance is the inverse quadratic matrix. |
| GZ (16), (18)–(21) | GZ lines 237–326: phase splitting and radial theorem. The package explicitly corrects the local errors and names the arithmetic obligations. |
| GZ Remark 3.2 | GZ lines 327–328: real A,B,C allowed at the order-one root, supporting S07. |
| GZ §4 and (23)–(37) | GZ §4: saddle and lattice proof route. The package's additive remainder and covolume targets avoid division by a zero Gauss factor. |
| GZ §5, (39)–(42) | GZ lines 620–660: Neumann–Zagier equations and matrix dictionary; repaired locator matches. |
| GSWZ (27)–(42), Theorems 3–5 | GSWZ lines 494–655: plethystic data, formal series, congruence series and coefficient ring. (32), not (35), is the congruence-series definition. |
| GSWZ (65)–(73), Corollary 2.4 | GSWZ lines 930–1040: root expansions and recognition. The positive sign of the corrected u term is independently tested at m=2. |
| GSWZ Lemma 2.5, (74)–(75) | GSWZ lines 1040–1070: admissible Dwork logarithm with a possible simple pole. |
| GSWZ (78)–(89), Theorem 6 | GSWZ lines 1070 onward, §2.3: q inversion, shift ratios and admissibility route; negative integral matrices remain allowed. |
| GSWZ (92)–(109) | GSWZ §2.4: level admissibility and restricted Dwork formula. The package enlarges the coefficient ring; its Φ₄ counterexample passes. |
| GSWZ (110)–(118) | GSWZ lines 1434–1535: formal Gaussian conventions and integrand. Weighted completion and corrected linear term are explicit additions. |
| GSWZ Lemmas 2.12–2.13, (125)–(136) | GSWZ lines 1584–1658: Gaussian coefficient/potential identities. All-factor descent is an additional target, not inferred from one formal branch. |
| GSWZ (165)–(171) | GSWZ lines 1868–1916: synthesis and Hessian. The package uses the logarithmic, not ordinary, Hessian. |
| GSWZ (174)–(183), Theorem 9 | GSWZ lines 1950–2030: local dilogarithm/regulator inputs; the package states unramified p>3 restrictions through its gap. |
| GSWZ (184)–(195) | GSWZ lines 2030–2114: Dwork integrality needs the first coefficient as well as the constant; this is retained. |
| GSWZ (213)–(224), Theorems 11–12 | GSWZ lines 2250–2376: membership and residues. Repaired residue sign and T^(m−1) factor have independent finite witnesses. |
| GSWZ (229)–(249) | GSWZ lines 2394–2540: cubic coefficients and recurrences; universal positive support is a target, not established by the displayed rows alone. |
| GSWZ (255)–(262) | GSWZ lines 2580–2645: quartic example, torsion/rank claims and finite experiments. Integral-model corrections are checked exactly; the reported finite experiments are not all-order proofs. |
| GSWZ (264)–(275) | GSWZ lines 2659–2712: Frobenius computations. The package adds the monogenic-index and simple-root hypotheses omitted from the informal source explanation. |
| GSWZ (1)–(2), (276)–(278) | GSWZ lines 94–100 and 2719–2742: figure-eight series and normalized product. First product coefficient has denominator 3³; S10. |
| GSWZ (279)–(288) | GSWZ lines 2769–2824: selected cubic factors, scalar and finite coefficient evidence. Corrected scalar square was checked in the cubic quotient. |
| GSWZ (289)–(295) | GSWZ lines 2836–2935: quadratic Gauss and Rogers–Ramanujan examples. The companion at m=4 is −2, correcting the printed +2; raw RR sign matches. |
| GSW Lemmas 3.1–3.2, (22)–(25) | GSW lines 444–503: affine Gaussian shift/change-of-variable identities. The package states an actual filtered domain. |
| Aarhus Proposition 2.13 | Aarhus lines 440–472: algebraic Gaussian Fubini; required invertible block/Schur complement is now explicit. |
| GW Definition 1.2 and (13)–(14) | GW lines 180–227: all-root whole-unit-disc condition and smooth proper input in every degree, not an unconditional scalar comparison. |
| GW Proposition 1.14, (47) | GW lines 535–557: general integral symmetric-matrix product. The negative-index form was tested independently, including coupled matrices. |
| GW Theorem 1.18, (50)–(53) | GW lines 570–609: affine top-form map in degree N, retaining its geometric, analytic and Frobenius inputs. |
| Wagner Corollaries 2.13 and 3.13 | Wagner lines 1470–1506 and 1818–1843: étale relative Habiro and q-Hodge comparisons. Separate completion triviality is not inferred. |
| Stacks tag 00UO | Stacks lines 18677–18689: formal unramifiedness iff vanishing differentials for a ring map. Finite-dimensionality is a separate pinned theorem with essential finite type. |
| Zagier II.1A, II.3A (25), II.3B (28)–(30) | Zagier lines 1023–1064, 2210–2222 and 2505–2530: Nahm equations and saddle constants. Corrected printed-page locators agree. |

### Supplier, ownership and pin audit

Used the roadmap service's list, object grep and citation resolver, then read the actual cited passages; the resolver's four misses are not treated as verdicts. Checked 14 supplier/reference groups below and independently searched the 21 explicitly supplied sibling heads by object. No extra open-head lookup was inferred from a PR number. No declaration with this package's fully qualified namespace was found on main, in completed roadmaps, another board package or the indexed open work.

| Supplier/reference group checked | Resolution and scope |
|---|---|
| HabiroCyclotomicCompletions §1.1 | QToolkit namespace and finite symbols at TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:213–227; infinite symbols at :262–290. Their characteristic-zero/rational-function and q-adic versions are separate. Local multivariate augmentation extension belongs here. |
| QSeriesPartitionsAndMockModularForms §§1.6,2.4,3.1,3.3,5.2 | The supplied head contains finite/infinite analytic products, binomial/Euler evaluation, signed lower-index adapter, Rogers–Ramanujan identities and eta multiplier. §3.1 does not supply negative upper indices. S03 identifies duplicated generic convergence. |
| PolylogarithmFunctions §§1,3,5,6 | Analytic Li₂/distribution, Bloch–Wigner and interval Rogers targets exist; no projective CGZ extension is supplied. That extension and Nahm trigonometric application belong here. |
| Polylogarithms §§2.1,2.3, supplied open head | General embedding regulator and calibration, not the Nahm-specific class or critical-value calculation. No duplicated general carrier introduced here. |
| ColemanIntegration L2.Fb, L2.13, L2.18 | Antisymmetric pre-Bloch carrier, integral modified polylogarithms and reflection are supplied. Integral CGZ/Suslin comparison remains a distinct declared gap. |
| GeneralAlgebraicKTheory | General K-theory carriers are supplied; this does not supply the missing integral Bloch or finite-Chern comparison. |
| KTheoryFiniteLocalFields §§1.8,7.4 | Finite Chern operations and completion/unramified reduction supplied. §7.4 distinguishes ordinary Chern naturality from finite-cd edge maps and requires m invertible at the place. The package does not substitute the edge theorem at real dyadic places. |
| QWittVectors Layer 1, §§2.4,6.1,6.2 | Perfect coverage and completed étale Frobenius exist at the supplied head; §6.2 is cyclotomic overlap, not a general substitute. Identifier drift S04. |
| ArithmeticKTheory §3.4 | All positive even number-ring K-groups finite at supplied head, TauCetiRoadmap/ArithmeticKTheory/README.md:990; redundant N.6 gap S02. |
| ThetaSeries Layer 1 | TauCetiRoadmap/ThetaSeries/README.md:423–482 supplies full lattice Poisson summation with phase and covolume, Schwartz hypotheses and Gaussian transform. |
| StandardDistributions Layers 1,5 | Even/odd Gaussian moments and covariance/affine laws supplied; density and polynomial integrability also present at the pins. |
| FuchsianOrbifolds Layers 3–5; ModularForms | Existing cusp charts, meromorphic descent and modular geometry. Local σ here is inverse to the supplier's cusp-to-infinity chart; the explicit matrix test verifies the direction. |
| GeometryOfNumbersAndQuadraticArithmetic §4.3 | Existing analytic qPochhammer/shift/zero-divisor owner, independently located by object search; import correction S03. |
| ArithmeticQuantumTopology Layers 5–6 | A downstream-use description, expressly not a prerequisite. Its absence from available roadmaps is not an unowned input here. |

All eight gap slugs match between design/plan.json and the README supplier subsections, and every one names a supplier. The detailed contracts separate the antisymmetric carrier from integral comparisons, the unramified p>3 regulator lattice from Coleman functions, the affine higher-degree comparison from scalar membership, and global module descent from a selected branch. They are accepted conditional contracts, except the redundant finiteness request in S02. No missing gap owner was reported merely because its promised target is not present today.

Pinned Mathlib is 6b7abb3c7686292736be2955bd3eb9ebf63b456a; pinned Tau Ceti is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Direct checks cover the named matrix, field, differential, Euler, cusp, Gaussian, Gauss-sum and Hensel APIs. In particular:

| Native declaration/property | Pinned witness and retained hypothesis |
|---|---|
| Matrix.PosDef | Mathlib/LinearAlgebra/Matrix/PosDef.lean:164 includes IsHermitian, not merely positivity of the symmetric part; :456 gives the finite-vector characterization. |
| IntermediateField.finiteDimensional_adjoin | Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:612 requires a finite generator set and integrality. This is S05's one-lemma corollary. |
| Coordinate-field finiteness route | Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:662; Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean:118; Mathlib/RingTheory/Kaehler/Basic.lean:251; Mathlib/RingTheory/Unramified/Finite.lean:158. Essential finite type, formal unramifiedness and free module hypotheses are needed. |
| Euler and Poisson APIs | Mathlib/NumberTheory/ModularForms/DedekindEta.lean:102,113; Mathlib/Analysis/Fourier/PoissonSummation.lean:216. The latter is one-dimensional; general lattice input comes from ThetaSeries. |
| Cusps and widths | Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:108; Mathlib/NumberTheory/ModularForms/Cusps.lean:32,115,317; TauCeti/NumberTheory/ModularForms/Norm/Cusps.lean:148. A width is not positive for every arbitrary subgroup; finite-index input is present. |
| Gaussian density/integrability | TauCeti/Probability/Distributions/Gaussian/Density.lean:75,171; TauCeti/Probability/Distributions/Gaussian/PolynomialMemLp.lean:81,100. Positive definite covariance/nonzero variance restrictions retained. |
| Finite quadratic Gauss sums | TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean:172,284. Nondegenerate norm and quadratic-radical quotient are distinct inputs. |
| Henselian lifting | Mathlib/RingTheory/Henselian.lean:94,170. The is_henselian field provides monic-polynomial simple-root lifting over a general ring/ideal, with derivative a unit in the quotient; it does not say an arbitrary repeated root lifts uniquely. |

The mechanical direction check on the unchanged README returned exactly:

```text
depcheck: 22 roadmaps, 189 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This roadmap consumes earlier suppliers, with the declared gap owners accepted as contracts. The target-level forward ordering of S09 is not detected by this cross-roadmap check.

### Suggested.lean declaration ledger

All declarations are in TauCetiRoadmap.HabiroNahmSeries, inside a noncomputable section with BigOperators open. There are no section variables or implicit section instances. Indices are Fin N; coefficient fields and rings are concrete. The supplied elaborated signatures were compared individually with the unchanged file and README. No Lean command was run: the read-only/no-build instruction takes precedence, and the supplied 17 elaborated types suffice for this comparison.

| Declaration; line; section | Explicit context and README match | Instances and computed values | Result/change |
|---|---|---|---|
| quadraticExponent; 35; 1.1 | N; rational A,B,C; n:Fin N→ℤ; no symmetry needed for definition | A=2,B=0,C=−1/60: 60Q(0)=−1,60Q(1)=59. N=0 gives Q=C. | Body matches; real generalization S07. |
| NahmDatum; 41; 1.1 | N; rational matrix/vector/constant; symmetry and real PosDef bundled | A=3/2 gives vᵀAv=3v²/2>0 for v≠0. All-ones rank two gives 0 on (1,−1), rejected. | Rational carrier correct; S07. |
| NahmEq; 49; 1.2 | Real A,x; open cube explicitly part of predicate | A=1,x=1/2 gives 1/2=1/2. A=2,x=(√5−1)/2 gives 1−x=x². x=0,1 rejected. | Correct real powers and strict bounds. |
| existsUnique_nahmEq; 55; 1.2 | Real A, hA:PosDef; Hermitian included by native predicate | N=0 has one empty tuple, det H=1. A=1 solution 1/2; A=0 has only boundary x=0 and fails PosDef. | No lost symmetry hypothesis. |
| nondegenerate_zero_isAlgebraic; 61; 1.3 | N rational polynomials, complex zero, evaluated Jacobian det≠0 | P=X²−2,x=√2: P=0,J=2√2≠0. P=0,x transcendental: J=0, excluded. N=0 has det 1 and no coordinates. | True at stated generality. |
| nondegenerate_coordinateField_finite; 70; 1.3 | Same binders, adjoin ℚ(range x) | P=X²−2 yields degree 2; N=0 gives adjoin ∅=ℚ, degree 1. | True library corollary; delete padding, S05. |
| nahmSummand; 81; 2.1 | NahmDatum, arbitrary τ and natural n; totalized denominator | A=2,B=C=0,n=1,q=1/2 gives (1/2)/(1/2)=1; n=2 gives (1/16)/(3/8)=1/6. At q=1,n=1 totalized value 0, outside analytic theorem. | Branch and denominators match; S07. |
| analyticNahmSum; 88; 2.1 | Total tsum of the preceding summand | N=0,C=0 gives 1; C=1/2,τ=i gives e^(−π); τ↦τ+1 negates it. | Correct total definition; no convergence asserted off ℍ. |
| nahmSummand_summable; 92; 2.1 | hτ:0<τ.im explicit; PosDef in D | A=1: Q=n²/2 and Gaussian bound e^(−π Imτ n²). N=0: singleton sum abs(e(Cτ)). q=1 excluded. | No missing binder; S07 generality. |
| analyticNahmSum_holomorphic; 97; 2.1 | DifferentiableOn on {Imτ>0}; PosDef in D | N=0 gives exp(2πiCτ), derivative 2πiC exp(2πiCτ); C=0 derivative 0. | Normal convergence proof route appropriate; S07. |
| formalExponent; 104; 5.2 | Integral A,natural n; integer division totalized; symmetry on consumers | A=3,n=2: numerator18, quotient9. A=−1,n=2: −6/2=−3. Nonsymmetric ((0,1),(0,0)),n=(1,1): numerator1, quotient0. | Consumers retain hA, so junk quotient not used as exact half. |
| formalNahmSeries; 109; 5.2 | Integral A on native MvPowerSeries over RatFunc ℚ | A=3,q=2: c₀=1,c₁=8,c₂=512/3; A=0 gives reciprocal Euler series. | Native coefficient-function carrier, no missing hypothesis on used theorems. |
| formalNahmSeries_qDifference; 116; 5.2 | hA:IsSymm explicit; j:Fin N; column rescaling | A=3,q=2,n=2: LHS=(512/3)(−3)=−512; RHS=(−8)·8·8=−512. 2,080 exact cases passed. | Not one-library-lemma padding; full shifts retained. |
| generalizedQBinomial; 128; 7.1 | Integer r,natural k; rational-function quotient | q=2: [−4 choose2]=155/512; [2 choose1]=3; [0 choose1]=0; every [r choose0]=1. | Negative upper indices retained, denominator nonzero as rational function. |
| formalNahmSeries_symmetrisation_qBinomial; 136; 7.1 | Integral symmetric A; k:Fin N→₀ℕ; native coeff/product | A=3,q=2: both sides31/4 at k=1 and10795/64 at k=2. A=−1,k=2:155/8. Coupled k=(1,1):−45/4. | 2,114 exact cases passed; q-inversion is represented by I−A correctly. |
| rationalGaussTaylor; 146; 7.5 | m:ℕ, rational piecewise body | m=0,1,2,3,4 gives 2,1,0,1,2. | Junk index0 explicit and excluded from evaluation theorem. |
| rationalGaussTaylor_eq_gaussSum; 151; 7.5 | hm:0<m; complex sums of explicit exponentials | m=1:1; m=2:0; m=4:(2+2i)(2−2i)/4=2. m=1…20 agree with max numerical error1.71·10⁻14. | Correct normalization; finite quadratic norm theorem still needs parity/radical analysis. |

### README statement ledger

Locations below are in packages/HabiroNahmSeries/README.md. A passing instance is a falsification test, not a proof of the universal statement. “Conditional” retains a declared supplier contract; “not certified” means that the finite computation does not verify the stated all-order or global claim. Definitions and subsequent theorems are separated where they have different hypotheses. Rank-zero conventions are empty sum 0, empty product 1, determinant 1 and a singleton set of empty tuples. Field inputs exclude the zero ring; arbitrary coefficient-ring identities are polynomial identities and specialize to 0=0 in the zero ring. Nonabelian groups, non-quasi-separated spaces and arbitrary infinite fans are outside these carriers, not additional test inputs.

| Statement and location | Instances and values computed | Result/change |
|---|---|---|
| Cyclic-product supplier convention; 68–75 | m=2,w=2:D(w)=3,D(−w)=−1; ratio−1/3=(1−2)²/(1−4). m=1 gives1 away from w=1. | Product and its m-th root are different; zero denominator excluded. |
| Full determinant coefficient algebra; 33–38 | δ=1 gives R[T]/(T²−1); at2 inverted it has two factors. T↦−T exchanges them; no preferred component. | Matches all-factor module contract. |
| Relative comparison coefficient structure; 87,1373 | In an unramified quadratic extension ofℚ₃ containing√2, Frobenius sends√2 to−√2. An untwisted constant family√2 would require√2=−√2. | ℤ[q]-algebra, not arbitrary untwisted R-algebra. |
| Summary; analytic/formal distinction; 3,17,24 | A=3: unsigned polynomial x³+x−1 has discriminant −31; signed polynomial z³−z+1 has discriminant −23. | Distinction necessary; real analytic scope S07. |
| Quadratic exponent; 103 | A=2,B=0,C=−1/60: Q(0)=−1/60,Q(1)=59/60. Rank zero gives C. | Agrees with Lean. |
| Denominator of Q; 105 | Q=n²/4 requires d divisible by 4: 2Q(1)=1/2,4Q(1)=1. d=0 excluded. | Integer-valuedness distinguished from period. |
| Strong denominator; 105 | Q=n²/4 has period 2 since Q(n+2)−Q(n)=n+1; Q=n/2 fails period 1 by 1/2. Rank-zero Q=3/2 has period 1. | Correct difference convention, including nonsymmetric A. |
| Unsigned Nahm equation; 119 | A=1,x=1/2: both sides 1/2. A=2,x=(√5−1)/2: both sides x². x=0,1 excluded. | Open cube correctly carried. |
| Signed equation over units; 121 | A=3,z=3 in 𝔽₅: 1−z=3=−z³. Using the unsigned equation gives 2 on the right. | Sign detected; 2 may collapse signs but not unit condition. |
| δ and logarithmic Hessian; 124 | A=2,x=2 in 𝔽₅: δ=x⁻²(2−x)=0 and H=2+x/(1−x)=0; algebraicity alone does not give nondegeneracy. A=3 gives δ=z⁻³(3−2z) on the signed branch. | General formula and branch-specific Hessian distinguished. |
| Coordinate algebra/nondegenerate locus; 127 | A=3 deformed at t=4/27,z=3/2: 1−z=−tz³ and 3−2z=0. This point is removed by δ inversion. | Double root correctly excluded. |
| Positive existence and uniqueness; 129 | N=0 one solution; A=1 solution 1/2; A=0 forces x=0, outside cube and positive definiteness. Rank-two all-ones matrix has quadratic value 0 on (1,−1). | Matches PosDef hypothesis. |
| Positive Hessian; 131 | A=1,x=1/2 gives H=2; A=2 golden x gives H=2+x/(1−x)>2. | Determinant positive, Gaussian denominator nonzero. |
| Cleared polynomial system; 148 | A=2,d=1: P=1−y−y². A=−1: P=(1−y)y−1. Clearing in rank two with diagonal −1/off-diagonal 1 permits the extraneous origin. | Torus restriction retained. |
| Jacobian factorization; 155 | A=2: P′=−1−2y; at golden x, P′=−(1−x)(2+x/(1−x))/x. | Row/column and minus sign agree. |
| Vanishing differentials → finite field; 163 | P=X²−2 at √2 has Jacobian 2√2≠0; P=Xᵖ−a in characteristic p has derivative 0 and is excluded. | Inseparability cannot enter through the nonzero determinant. |
| Algebraicity and coordinate-field corollary; 163–165 | P=X²−2 gives ℚ(√2), degree 2; empty coordinate set gives ℚ, degree 1. | Corollary padding only in Lean, S05. |
| Positive radical field; 165 | A=1/2: y=(√5−1)/2, x=y², y=1−x; both fields ℚ(√5). Replacing y by −y violates the selected equation. | No false strict extension remains. |
| Unsigned Bloch boundary; 179 | A=2: x∧(1−x)=x∧x²=0. Symmetric off-diagonal terms x∧y+y∧x cancel. | Rational denominators require clearing. |
| Rational class/denominator independence; 181 | d replaced by 2d multiplies c_d by 2 and division by 2d returns the same rational class. | Integral and rational targets separated. |
| Signed boundary; 184 | Odd rank-one A=3 leaves z∧(−1); twice it is z∧1=0. Even diagonal 8,4 contributes no (−1) term. | Factor two retained. |
| Antisymmetric integral comparison; 187 | A symbol and its inverse have opposite images; the residual z∧(−1) can be nonzero before multiplication by 2. | Conditional on integral convention gap; no integral cancellation asserted. |
| Integral model/evaluation; 189 | Mod z³−z+1: z(1−z²)=1; δ(2z²+3z−9)/23=1. δ↦0 cannot define evaluation of δ⁻¹. | Two genuine unit identities and a failing specialization. |
| Embedding regulator; 204 | Real arguments have D=0; conjugate nonreal arguments give D and −D. Rank zero sum 0. | All embeddings retained; numerical cubic value not certified. |
| Torsion iff all regulators vanish; 204 | Zero class has every coordinate 0; the real coordinate alone is 0 even when the two complex coordinates are opposite nonzero numbers. | Conditional on rational Borel comparison; wrong real-only test excluded. |
| Algebraic-closure comparison; 206 | On rationalized groups cor∘res=[E:F]; for degree 2 this is multiplication by 2, invertible over ℚ. On integral 2-torsion it is 0. | Rational injectivity not confused with integral injectivity. |
| Projective Rogers extension; 208 | In π² units: L(1/2)=1/12,L(2)=−1/12,L(−1)=1/4. | False new Check, S01. |
| Rogers endpoints and quotient; 210 | L(0),L(1),L(∞)=(1/6,0,−1/6)π²; 3L(0)=π²/2=0 in the circle, not in ℝ. | Quotient essential. |
| Torsion ⇒ rational Rogers value; 210 | For [0] of order dividing 3, 3L(0)=π²/2; golden x gives π²/15, complementary increasing value π²/10. | No converse asserted. |
| Finite/infinite Pochhammer; 235 | (0;q)_n=1; (1;q)_∞=0; q=0 gives 1−w for n>0. At q=−1, (q;q)₂=0. | Generic target duplicated, S03; logarithm excludes zeros. |
| Analytic summand and sum; 240 | A=2,B=C=0,q=1/2: n=1 term 1,n=2 term 1/6. Rank zero gives e(Cτ). | Actual exponential branch retained. |
| Summability/holomorphy/constant shift; 243 | A=√2 gives Q=n²/√2 and Gaussian decay; N=0,C=1/2 gives e^(πiτ), changing sign under τ↦τ+1. | Real scope S07; totalized q=1 denominator unused. |
| Uniform Euler–Maclaurin; 256 | f(s)=s,M=1: integral 1/2 plus B₁(θ)=θ−1/2 gives θ; M=0 gives empty sum/integral/boundary differences all 0. | Shift normalization passes. |
| Radial ψ expansion; 271 | w=0 makes Li_j(wᵐ)=0 and ψ=0. At m=2 the linear w-variable contribution is Li₁(u²)w/(2h). | Linear correction retained. |
| Uniform ψ remainder; 285 | Zero argument gives exact remainder 0; compact radius ρ<1 bounds 1/(1−w) by 1/(1−ρ), which diverges as ρ↑1. | Compactness hypothesis essential; full bound not certified computationally. |
| Dedekind phase χ; 291 | a/m=1/3: phase argument π/18; 2/5: phase 1; 1/1: phase 1. | Phase depends on representative and branch convention. |
| Euler product asymptotic; 299 | Inverse Euler correction starts 1−ε/(24m); m=1 coefficient −1/24. Rank N gives −N/(24m). | Opposite sign fails saddle coefficient. |
| Saddle potential and R_k; 316–321 | −εB(s/ε+v/√ε)/m=−Bs/m−Bv√ε/m. Normalized second moment m/H. | Negative linear sign and 1/2 fixed. |
| Local remainder/parity; 325 | Odd v integrates to 0; v⁴ moment is 3m²/H²; A=2 first normalized coefficient −1/60, omission of Euler term adds 1/24 giving 1/40. | Polynomial/parity mechanism consistent; universal estimate not proved here. |
| Finite Euler modulus; 330 | n=0: log 1=0 and Li₂(1)−π²/6=0. n→∞: Li₂(0)=0 gives −π²/(6mε). | Endpoint signs agree. |
| Global Gaussian domination; 337 | At the saddle v=0 exponential bound is Mε⁻ᴸ; at window boundary ‖v‖=ε⁻¹/¹² it is Mε⁻ᴸe^(−cε⁻¹/⁶), smaller than every power. | No positivity of complex terms or division by Gauss factor used. |
| Wick functional; 354 | ⟨1⟩=1,⟨v⟩=0,⟨v²⟩=M⁻¹,⟨v⁴⟩=3M⁻². | Filters exclude arbitrary infinite constant-degree contributions. |
| Gaussian integral bridge; 357 | Covariance ((1,1/2),(1/2,1)): ⟨v₁v₂⟩=1/2 and ⟨v₁²v₂²⟩=3/2. | Diagonal-only model fails. |
| Shifted Gaussian lattice; 362 | N=1,H=1: leading unscaled sum √(2πm)/(m√ε); replacing spacing by mD√ε multiplies by D⁻¹. | Covolume normalization correct. |
| Congruence phase/Gauss factor; 378–386 | Q=n²/2,m=3,D=2: a=1 gives (1−1)/2=0; a=2,4 give (1+1)/2=1. D=4,a=1 again gives 0. | Representative dependence and denominator refinement distinguished. |
| Congruence remainder difference; 386 | When G=0, differences can be O(εᴷ) while quotient by leading coefficient is undefined (0 denominator). | Difference formulation survives cancellation. |
| I_k, S and c(Q); 391 | Rank zero I=S=c=1; A=2,m=1 gives cS(0)=[H(1−x)]⁻¹/²=(2−x)⁻¹/². | Nonzero denominators from 0<θ<1. |
| Radial theorem; 402 | N=0 gives e(aC/m)(1−Cε/m+…); G=0 example gives zero formal expansion. | No unit-series inference at zero leading term. |
| Coherent coefficient fields; 420 | d=2,m=3,x=1/4 gives y=1/2 and η³=1/2; [ℚ(η):ℚ]=3 whereas [ℚ(ζ₃):ℚ]=2. | Strict extension exists here, not in the A=1/2 example. |
| Radical automorphisms; 427 | σ(η)=ζ^sη implies σ(θ)=ζ^(ds)θ; d=2,m=3 multiplies exponent by 2, not 1. | Coherent rational powers retained. |
| Kummer all-coefficient descent; 432 | m=2,Φ=√2(1+3ε−ε²): Φ²=2+12ε+14ε²−12ε³+2ε⁴, all rational. | Finite control; universal recurrence is an explicit obligation. |
| ω and Φ splitting; 440 | A=1,m=1,x=1/2,H=2: ω=1/2; B=1/2 gives Φ₀=√2, so leading coefficient 1/√2. | Square root does not silently disappear. |
| Chern/eigenspace comparisons; 444 | m=1 Kummer quotient is trivial; m>1 changing a chosen m-th root by ζ changes its representative, not its power class. | Conditional on named arithmetic identities and gaps. |
| Unit-series descent; 449 | Above Φ/Φ₀=1+3ε−ε². With m=0 every Φ has Φ⁰=1, so no descent follows. In characteristic 2, squaring loses the linear coefficient. | m>0, nonzero constant and characteristic zero all retained. |
| Andrews–Gordon example; 462 | n=3,r=0: Λ=0; n=5,r=1: Λ=π²/15; n=7,r=2: Λ=2π²/21. | Rank-zero and normalization agree; general Chern value supplied conditionally. |
| Cusp representatives and width; 484 | σ=((2,1),(5,3)) has determinant 1; P=2/5. Enlarging by −I leaves weight-zero invariants unchanged. | Actual finite-index condition retained. |
| Laurent criterion; 487 | f=q_w² has order 2/w; f=q_w⁻¹ has a pole of order 1 in q_w. Essential germ exp(1/q_w) has infinitely many negative terms. | Meromorphic excludes essential case. |
| Normalized order; 490 | Width 3: q_w² has order 2/3; same function described with width 6 has exponent 4 and order 4/6=2/3. | Width-normalized value consistent. |
| Leading coefficient; 490 | 7q_w²+3q_w³ gives 7; σT at width 3 gives 7ζ₃²; cancellation with −7q_w²+2q_w³ gives 5. | Missing discriminating Checks, S08. |
| Uniform Laurent error; 505 | q_w²(7+3q_w) differs from leading 7q_w² by 3q_w³, ratio (3/7)q_w→0. | Relative estimate requires nonzero leading coefficient. |
| Inverse cusp map; 510 | σ=((2,1),(5,3)),τ=2/5+iy: σ⁻¹τ=−3/5+i/(25y). | Direction, phase and c² all correct. |
| Radial cusp estimate; 513 | Leading q_w^k gives phase e(−kd/(cw)) and modulus exp(−2πk/(wc²y)); k<0 grows. | Sign convention passes. |
| Growth/order bound; 517 | f=q gives order 1 and exponential decay; f=q⁻¹ gives order −1 and exponential growth. | Inequality direction preserved. |
| Positive real majorant; 540 | For q=re(iθ), abs(1−q^j)≥1−r^j; at θ=0 equality, at r=1/2,θ=π,j=1 gives 3/2≥1/2. | Works termwise without positivity of the original sum. |
| Exact residue splitting; 550 | A=2,B=1,C=11/60,m=2: B′=1/2 or 3/2, prefactors Q(0)=11/60,Q(1)=131/60. | Constant term retained. |
| Block lower bound; 557 | At n=1, ratio (1−e^(−2t))/(1−e^(−t))=1+e^(−t)≥1. Empty block ratio 1. | Lower-bound constants c₁=c₂=1 work in this control. |
| Every-root growth bound; 563 | Rank zero C=7: f(it/(2π))=e^(−7t), at t=log2 equals 1/128. C does not alter the 1/t rate. | Boundary target consistent. |
| Cusp meromorphicity and orders; 579–582 | A=2,B=−3,C=5: Q(1)=Q(2)=3, producing leading 2q³. C=5 is not the first exponent. | Minimization, not n=0 assumption. |
| Weight zero and modular order-one expansion; 590–594 | Rogers–Ramanujan C=−1/60 cancels the −1/60 coefficient: (1−t/60)(1+t/60)=1+O(t²). | Necessary control, not a proof of modularity. |
| Fixed arithmetic field; 605 | D=24 gives one extension before n varies; n=1 quotient is trivial. Replacing the field for each n also changes M_E. | Fixed-field quantifier order correct. |
| Integral lift and finite Chern; 608 | Cleared symmetric boundary cancels after adjoining D-th roots; n=1 power class 1. | All good-order/root-unit hypotheses routed through declared gap. |
| Modular constant phase; 618 | Substitution ε=dh/(1−ich/(2π)) gives Λ/ε=Λ/(dh)−iΛc/(2πd); with λ=Λ/(4π²), phase e(−λc/d). | Minus sign verified. |
| Uniform bounded power; 621 | First RR data permits s=120, clearing 24, 2den(B),den(C),den(λ); s independent of d. | Full power assertion conditional on earlier arithmetic identities. |
| Unbounded good orders; 623 | L=6,k=1,2 yields d=37,73, each ≡1 mod6; determinant of ((1,6k),(6,1+36k)) is 1. | No primality assumption needed. |
| Finitely generated divisibility; 634 | 1∉nℤ for n>1; in ℤ/5, 1∈nG whenever gcd(n,5)=1. Repeating n=1 tests nothing. | Unbounded distinct values essential. |
| Modularity ⇒ distinguished class torsion; 636 | Free coordinate divisible by unbounded n is 0; rational restriction/corestriction multiplies by [E:F]≠0. Rank zero class 0. | Distinguished solution only; no converse or every-solution claim. |
| Multivariate log/exp; 659 | log(1+t₁t₂)=t₁t₂−t₁²t₂²/2+t₁³t₂³/3+…; exp(log((1−t₁)⁻¹))=(1−t₁)⁻¹. Constant 2 is outside the augmentation-one domain. | Native finite-degree operations; no extra infinite summation. |
| Plethystic coefficients; 664 | (T;q)_∞ has L₁=1,L₂=0; its inverse has L₁=−1. (-T;q)_∞ instead has L₂=1/(1+q). | Sign convention distinguishes false Euler product. |
| Admissibility and Euler product; 667 | exp(−T/(1−q)²) has L₁=1/(1−q), not a Laurent polynomial; (T;q)_∞ has finite support {0} at n=1. | Strong integrality condition retained. |
| Root Laurent expansion; 670 | 1/(1−q) at ζ=1 is −1/x; at ζ=−1 is 1/2+x/4+x²/8+…. | No evaluation of a pole at x=0. |
| V_F; 673 | For (T;q)_∞, V=Li₂(T)=T+T²/4+…; inverse negates V. Rank zero V=0. | Residue normalization fixed. |
| δ_F; 673 | Same example L₁=1,L′₁=0 gives logδ=Li₁(T), δ=(1−T)⁻¹=1+T+T²+…. | Minus-square-root factor consistent. |
| u and U_m; 680 | Same example m=1:U=1; m=2:U=(1+T)⁻¹/²=1−T/2+3T²/8+…. | Detects the repaired positive (m−1)/(2m) sign. |
| Root-expansion theorem; 690 | F=(T;q)_∞ at ζ=1 has [T]logF=−1/(1−q)=1/x. Residue formula gives [T]V/x=1/x. | Leading sign agrees. |
| Recognition theorem; 696 | F=(T;q)_∞ and (qT;q)_∞ have same V (L₁(1)=1) but differ by factor 1−T. Full root expansion distinguishes them. | V alone not claimed sufficient. |
| Integral formal exponent; 711 | A=3,n=2 gives (12+6)/2=9; A=−1,n=2 gives (−4−2)/2=−3. Nonsymmetric half numerator 1 has integer quotient 0. | Symmetry present in consumers, not silently inferred in definition. |
| Formal Nahm series; 714 | A=0:inverse Euler; A=1:(qt;q)_∞. A=3,q=2:c₀=1,c₁=8,c₂=512/3. | Exact native coefficients; no positivity restriction. |
| Difference equation; 721 | A=3,q=2,n=2: −3·512/3=−512=(−8)·8·8. Coupled matrices tested; 2,080 coefficient comparisons. | Column shift includes off-diagonal entries. |
| Difference-equation uniqueness; 721 | Recurrence divides by 1−qⁿ for n>0 in ℚ(q); n=0 has 0=0 and requires specified constant 1. At q=1 denominator 0. | Root evaluation not used for recursion. |
| q inversion and block laws; 724 | A=0 gives F₀(q⁻¹)=F₁(q); I−A switches 0 and 1. Block diagonal gives product; off-diagonal 1 changes mixed coefficient. | Inversion is a rational-function map. |
| Deformed formal solution; 729 | A=0:z=1−t; A=1:z=(1−t)⁻¹; A=3:z=1+t+3t²+12t³+55t⁴. | Sign detected already in linear coefficient. |
| Formal δ; 732 | A=3 gives δ=1−5t−3t²−10t³−42t⁴+…; A=0 gives δ=1−t. | Constant one; inverses well-defined formally. |
| Integral shift ratio; 745 | A=0:R₁=1−t,R₂=(1−t)(1−qt),R₋₁=(1−q⁻¹t)⁻¹. | Negative shifts do not mean negative natural indices. |
| Root orbit product; 751 | A=1: orbit product ∏(1−ζ^jt)⁻¹=(1−tᵐ)⁻¹. For m=2, denominator (1−t)(1+t)=1−t². | Every residue class retained. |
| Root Nahm identification; 755 | m=2,A=1 yields z(t²)=(1−t²)⁻¹ from orbit product. | Constant-one branch fixed. |
| Residue potential and critical value; 757,768 | A=3:V=t+5t²/4+28t³/9+165t⁴/16; A=−1:V=t−3t²/4+10t³/9−35t⁴/16. | Negative matrix included. |
| All-root residue; 760 | m=2: A=0 residue t²/4; A=3 residue −t²/4−5t⁴/16. ζ=−1 contributes the sign. | Ordinary t and t² substitution distinguished. |
| Logarithmic Hessian; 771 | For A=0, z=1−t, logarithmic derivative t∂_t log z=−t/(1−t); ordinary derivative is −1/(1−t). | Euler factors cannot be discarded. |
| Formal admissibility; 784 | A=3:L₁=q³,L₂=q⁷,L₃=q¹⁰+q¹¹+q¹³; coupled ((2,1),(1,1)):L₁₁=−q³. | Tests reject product of independent one-variable answers. |
| Dwork logarithm; 790 | A=0,p=5:[t](logF(t⁵,q⁵)−5logF(t,q))=−5/(1−q)=5/x at q=1+x. | Permitted simple pole; not 5ℤ₅[[x]]. |
| Congruence series; 809 | m=1,k=0 gives F_A; m=2,k=1 gives support 1+2ℕ after multiplying by t. | Initial monomial removed before constant-one operations. |
| Order-m system; 818 | A=1,m=3 sign (−1)³=−1; m=2,k=1 initial monomial killed by factor 1−q⁻¹σ. | Corrected parity and q⁻s retained. |
| Congruence-system uniqueness; 818 | At n_j=m denominator ∏_{s=0}^{m−1}(1−q^(m−s)) is a nonzero rational function; at q=ζ_m it vanishes. | Laurent-field recursion only. |
| Restricted Adams coefficients; 827 | F=1+t₁t₂,m=2:L₁₁=−(1−q²),L₂₂=(1−q²)/2; m=1:L₂₂=1−q. | Coprimality restriction changes coefficients. |
| Level coefficient ring R_m; 834 | m=2 allows Φ₄⁻¹ since gcd(4/2,2)=2, excludes Φ₂⁻¹. At ζ₂,Φ₄(−1)=2 invertible in ℤ[1/2]. | Enlarged ring passes old counterexample. |
| Level admissibility; 838 | (t;q²)_∞ gives L₂=1/(2(1+q²)), evaluated at −1 gives 1/4∈ℤ[1/2]. | Rational evaluation subring specified. |
| Restricted residues; 843 | A=0,m=2,c=2 gives residue coefficient 1/4; c=4 has gcd(c/m,m)=2 and is outside the assertion. | Bad quotient orders not used. |
| Level cancellation/end theorem; 847 | A=0,m=2 restricted degree-two coefficient at q=2 is −11/70; at q=i its numerator is i−1≠0 and Φ₄ denominator vanishes. | Smaller localization refuted; current one survives. Build order S09. |
| Weighted Gaussian completion; 864 | Degree-six w⁶/h² contracts to 15hC³, not a negative h-power. Unfiltered ∑w^(2n) at h⁰ has infinitely many moments. | Weighted domain excludes the latter. |
| Affine change/Fubini; 867 | Matrix ((0,1),(1,0)) has determinant −1 but first block 0, so iterated Gaussian not defined. Diagonal identity has Schur complement 1. | Block invertibility repair effective. |
| Corrected ψ in Gaussian integrand; 872 | m=2 linear term Li₁(u²)w/(2h); setting u=0 kills it. | Missing linear term would change the center. |
| Gaussian integrand; 882 | Cubic interaction a w³/(6h) gives first h coefficient 5a²C³/24. Quartic w⁴/(24h) gives hC²/8. | Wick combinatorics fix scale. |
| Normalization and recurrence comparison; 893–898 | a=C=1 gives 5/24; adding linear w and cubic w³/(6h) gives 29/24. | Finite controls pass; all-order comparison explicitly conditional. |
| Mixed regularity; 896 | hLi₀(1−t)/12=h/(12t)−h/12 has a negative t-power, so separate h-adic expansions do not imply mixed regularity. | Stated cancellation obligation necessary. |
| Universal algebra S_A; 917 | Rank zero S=ℤ[T]/(T²−1), two branches away from 2. | All-factor carrier retained. |
| Étaleness after 2 inversion; 922 | Derivative of T²−1 is 2T: mod2 it is 0; after inverting2 it is a unit at T=±1. | Correct localization. |
| WKB coefficients; 927 | Unsigned A=3:z=1−t+3t²−12t³, X=−t+5t²−28t³. A=0,1 have b₁=0; A=3 has b₁=3X². | Unsigned deformation is distinct from earlier signed series. |
| Polynomiality/Δ denominator; 934 | A=3:b₁=3X² has no constant or linear term; A=0,1 gives zero. | Low-order control only; universal polynomiality not certified computationally. |
| Completed étale Frobenius; 956 | On ℤ_p×ℤ_p both factors have Frobenius; projection to one factor loses (0,1). | Supplier exists; cited identifier drift S04. |
| p-saturation and coefficient descent; 958 | ℤ_p[u]/(u²−1)→ℤ_p,u↦1 kills u−1 while other factor is −2 for odd p. | Selected branch cannot certify coefficient integrality. |
| Branch control; 960 | A=5,p=5,δ=z⁻⁴ mod5 gives T=±z², differing by 2z²≠0. | Both determinant roots must remain. |
| Full Frobenius defect; 965 | Empty-rank potential and constant defects are 0; unit 1 defect is log1=0. | Inputs separated, build order S09. |
| Localization transfer; 969 | A rational 1/p coefficient is not integral merely because a noninjective projection sends it to 0; faithful coefficient map is necessary. | Exact transfer obligation present, not certified by branch tests. |
| Jet polynomial; 984 | Pure cubic=5/24; mixed cubic/linear=29/24; quartic=1/8; pure linear=1/2 for unit covariance. | Four independent normalization controls. |
| Jet interpretation; 990 | Pure cubic arises from (w³/6h)²/2: 15h³/(72h²)=5h/24. | Formula agrees with Wick contraction. |
| Finite étale coefficient algebra; 994 | p=m=5 gives Φ₅=(X−1)⁴ mod5, excluded. p∤m makes mw^(m−1) invertible. | p∤Δm repair works. |
| First-jet integrality; 998–1005 | The rational cubic jet formula evaluated at z=1 gives 0 (a formal limiting control, not a special-unit specialization) after including the universal +1/24 correction; omitting it leaves −1/24. | Control at p>3; p=2,3 denominators excluded explicitly. |
| Integral local regulator; 1017 | Unramified p>3 and special units required; p=2,3 are not inputs. Zero class has regulator 0∈p²O. | Declared gap retained; no general-DVR assertion inferred. |
| Modified potential W_p; 1023 | Empty rank W_p=0; η=0 removes logarithmic correction and leaves p times the modified dilogarithm sum. | Integral-completion rather than rational-only target. |
| Formal comparison and W_p integrality; 1027 | At t=0 every Li term is 0, giving W_p(0)=0. Branch projection alone cannot descend integrality (preceding split example). | Global all-factor step still a required target. |
| Positive regulator sign; 1033 | D_p(1−z)=−D_p(z) cancels the preceding minus sign; empty class gives +0. | Reflection used once, not twice. |
| Specialization; 1037 | z and1−z both units are required; z=1 makes 1−z=0 and is excluded. | Domain explicit. |
| Refined constant-unit congruence; 1042 | u=1 gives zero logarithmic defect; products of cyclotomic factors at m=2 give (1−w)(1+w)=1−z, a unit. | Does not assume the full defect it later helps prove. |
| Kummer orientation; 1053 | Inverting a representative changes its power class to the inverse; at m=1 both are the trivial class. | Nontrivial m required to test orientation. |
| Refined unit and full constant; 1055 | A unit multiplied by a cancelling finite Gaussian sum can give 0; the Gauss example m=3,D=2 has exactly 0. | Nonvanishing imposed when generation is claimed. |
| Finite presentation/specialization; 1058 | Product denominator ∏_{a modm}(1−ζᵃw)=1−z; at z=1 it is 0, outside special-unit input. | All-factor descent separate from chosen embedding. |
| Quadratic coefficient extension; 1060 | δ=a² gives B≅K×K with T=±a⁻¹; summing local generators 1 and−1 gives0. | Arbitrary determinant branch not selected. |
| Restricted module membership; 1063 | Rank zero gives unit section1; Gauss cancellation gives zero section, still membership but not generator. | Good-order/module/generator claims separated. |
| Ψ and normalized P; 1080 | γ=2,q=2,F_+=t,F_−=1,μ_+=μ_−=1 gives Ψ=16t⁴,P=16t²; reversed coupling gives256t⁴. | Order of the two shifted arguments matters. |
| Symmetrization recurrences; 1087 | γ=1,F_−=t,ν=−1 gives t/2 at q=2; mixed t₁+t₂ with shift (1,−1) gives2t₁+t₂/2. | Negative/column shifts retained. |
| Family uniqueness; 1095 | In ℚ×ℚ,q=(2,1), q−1=(1,0) is a zero divisor. Regular-q hypothesis excludes this cancellation failure. | No arbitrary-ring uniqueness. |
| Product gluing; 1097 | γ=1 causes no inverted prime; γ=5 introduces1/5. | Localization by γ explicit. |
| Powered pole; 1102 | For F₀ and γ=2, −Li₂(t²)+Li₂(t) has coefficient t equal1, so pole does not cancel just by raising to a power. | Naive power integrality rejected. |
| Descendant transport; 1117 | m=2,ν=1: t=q²=1−2x+x² near q=−1; using t=q instead has constant−1. | Ramified curve and branch transport necessary. |
| Good-order power/global extension; 1119 | n=1 loses all m-th-power class data; an order-one component1 does not determine even-order values0,2. | All-root extension separate. |
| Converse membership guards; 1121 | Zero constant can be a member but not a unit generator; the Gauss cancellation is a concrete example. | No unconditional converse from one component. |
| J/P residue kernels; 1146 | A=0,m=1 constant kernel carries a minus sign; the correction at 1157 changes −1/(1−t) to+1/(1−t). | Sign repair tested. |
| Ambient kernel localization; 1152 | t=u,w=1−2u gives coefficient2/u−4, requiring (1−wᵐ)⁻¹. | Earlier missing inverse repaired. |
| Corrected shifted residue; 1157–1160 | A=0,m=2,T=3/5: inner sum16/3; prefactor T/(2δ)=15/32 gives5/2=1/(1−T). | Extra T^(m−1) retained. |
| General symmetric q-binomial product; 1165 | A=3,q=2:k=1→31/4,k=2→10795/64; A=−1,k=2→155/8; coupled k=(1,1)→−45/4. | 2,114 exact comparisons; general matrix theorem kept. |
| Generalized q-binomial Laurent integrality; 1171 | q=2:[−4 choose2]=155/512,[2 choose1]=3,[0 choose1]=0,[r choose0]=1. | Negative upper indices not truncated. |
| Residue-product gluing; 1173 | Rank zero yields1·1=1; A=0,m=1 corrected constants multiply consistently. | All-root theorem still needs module/descent inputs. |
| Finite constant formula; 1180 | A=0,m=2,T=3/5 yields5/2; deleting T gives25/6. | Repaired numerator explicitly tested. |
| All-root Habiro membership; 1186 | Rational Gauss constants at orders1,2,4 are1,0,2, distinguishing all-root family from its q=1 germ. | General membership not proved by this finite sample. |
| Cubic algebra/discriminant; 1204–1207 | z³−z+1=0: discriminant−23; z⁻¹=1−z²; δ=−z²−z−2 with inverse(2z²+3z−9)/23. | Exact quotient computations passed. |
| Cubic local Gaussian coefficients; 1213–1217 | Linear coefficient0; displayed jet cancellation0. δ-inverse exists only after23 inversion. | Higher displayed coefficient formulas not independently expanded here. |
| Cubic Euler/DT data; 1218 | With s₁,…,s₆=1,1,3,10,40,171, exponents −ns_n reproduce z=1+t+3t²+12t³+55t⁴+273t⁵+1428t⁶. | Finite support/positivity in every degree not established by six terms. |
| Cubic symmetrization; 1223 | At q=2 coefficient values31/4 and10795/64 agree with the general formula. | Uses general matrix theorem. |
| Corrected cubic root numerator; 1230 | q=−1 expansion1+T+4T²+5T³+21T⁴+28T⁵ agrees with corrected(z⁻¹+T)/δ. Summing every Nahm root instead gives−1/t. | Selected branch and numerator repair distinguished. |
| Cubic small-prime/all-order descent; 1236 | Mod2,z³+z+1 has no root and derivative z²+1 has no common root; Frobenius z↦z². | Good algebra at2 does not prove all coefficients descend. |
| Quartic selected fields; 1249 | p=u⁴+u³+3u²−3u−1; norms u=−1,v=1,1−u=1,1−v=−1. | Units verified; full D₄/S₄ splitting claims not independently certified. |
| Quartic relations and δ; 1254 | With displayed v, both1−u−u⁸v⁵ and1−v−u⁵v⁴ reduce to0; δ·δ⁻¹=1 inℚ[u]/p. | Exact polynomial identities passed. |
| Quartic basis; 1261 | e=(2−u²+u³)/5 satisfies e²−3e+1=0; polynomial discriminant−11875, proposed basis trace discriminant−475. | Integral element and index5 verified; maximality not certified. |
| Norm/exceptional-prime ledger; 1270–1272 | Normδ=9025=5²·19²; disc basis=−475=−5²·19. | K₂ finiteness supplier duplicate S02; exact tame-kernel order not computed. |
| Quartic analytic normalization; 1273 | detH>0 at distinguished positive root; changing determinant square root multiplies leading coefficient by−1. | Selected positive root required; decimal values not certified. |
| Quartic coefficients/certificates/descendant rank; 1277–1284 | The verified quadratic e relation has discriminant5, with roots(3±√5)/2. This finite subfield test does not verify the60-torsion certificate or rank8. | Explicit certificates and global rank still not certified. |
| Knot matrix dictionary; 1301–1306 | Invertible chosen block is essential: a zero block has no inverse; figure-eight matrix is ((1,1),(1,1)), with kernel vector(1,−1), while the dictionary is I−ℬ⁻¹𝒜. | No topology or presentation-independence claimed. |
| Figure-eight solution/determinant; 1308 | z=ζ₆:1−z=z⁻¹; z²−z+1=0; δ=−√(−3), Normδ=3. | Nonreal determinant root extension required. |
| Figure-eight h-normalization; 1312 | Displayed first coefficients satisfy2a₂−a₁²=−1/27; fourth root of−3 is not inℚ(√−3). | Bare square-root normalization cannot stay in the quadratic field. |
| Figure-eight Pochhammer comparison; 1317 | Source first coefficient(5ζ₆−7)/27=(−9+5i√3)/54; package coefficient is nine times this. | Source normalization/first coefficient S10. |
| Selected cubic components/scalars; 1320–1323 | Mod u³−u²+1: (−24u²+32u−26)+2(2u²−2u+3)²=0. | Exact scalar relation passed. |
| Hensel/Frobenius characterization; 1339 | Cubic mod2 irreducible and simple; Frobenius sends z to z². At a repeated root derivative0 does not meet uniqueness hypothesis. | Characterization, not computational algorithm. |
| Rational Gauss family; 1341 | m=1…4 norm values1,0,1,2; for m=4 numerator(2+2i)(2−2i)=8, divide by4→2. | Normalization passes,20 numerical moduli tested. |
| Rational Gauss companion/signs; 1347 | Companion at m=1…4 is i,0,−i,−2; piecewise value at m=0 is2 and remains2 after multiplying index by3. | ±2 and zero-index convention distinguished. |
| Raw RR residues/polynomial; 1349–1352 | F₁=−1/2−√5/10 satisfies−5F₁²−5F₁=1. Normalized−F₁ satisfies−5(−F₁)²+5(−F₁)=1. | Raw and normalized polynomials differ. |
| Degree-zero comparison η; 1369 | κ:H_R→H_rel and d:qHdg→H_rel give η=d⁻¹κ; identity inputs give η(1)=1,η(0)=0. | Direction fixed; declared comparison gap. |
| Nahm degree-zero export; 1373 | Rational family retains1,0,2 at orders1,2,4 while q=1 completion is1. | Completion does not reconstruct global family after2 inversion. |
| Coefficient lines and Picard class; 1377 | B=R×R: B-lineB has rank1 overB, rank2 overR. | Scalar restriction fails, S06. |
| Completion of lines; 1377 | A completed line can be free although its original class is nonzero; the comparison alone only transports its class, not a trivialization. | No unsupported implication; no explicit nontrivial global example constructed. |
| Whole-disc Habiro condition; 1389 | ∑(x/p)ⁿ has radius p⁻¹, positive but below1; rank-zero Specℤ[1/6] has relative dimension0 and absolute dimension1. | Whole-disc and dimension distinctions correct. |
| Affine top-form export; 1391 | N=0 top-form degree0; N=1 uses1-form and degree1, not degree0. Frobenius scaling a form byp is not a fixed form. | Actual degree and fixed-form hypothesis retained. |
| Higher comparison/base change; 1394 | Bare real regulator tuple supplies no p-Frobenius map or Taylor coefficients; a specified de Rham form does. | Explicit supplier-facing obligation, not automatic scalar consequence. |

## Not verifiable

- Independent Lean elaboration was not run under the read-only/no-build instruction. All 17 supplied elaborated types were compared with the unchanged source; this report does not claim a fresh build.
- The seven nonredundant declared supplier gaps remain contracts. This review does not certify their future implementations, global effective descent, finite-Chern injectivity or the regulator/cohomology comparison constructions. Their absence today is not a finding.
- The all-order analytic remainder, Gaussian mixed-regularity, level-cancellation and full coefficient-algebra transfer targets are not proved by the finite tests. Their explicit hypotheses and prerequisite directions were audited; S09 records the remaining ordering defect.
- No independent complete certificate was reconstructed for the quartic maximal order, its two complete Galois groups, the 60-torsion Bloch relation, the eight-dimensional descendant module or the exact tame-kernel order. The displayed polynomial relations, norms, integral element and trace discriminant were computed. The roadmap explicitly requests the missing certificates.
- Decimal regulator/critical-point approximations and the degree-27, degree-200, degree-400 and degree-600 coefficient experiments were not recomputed. They are not accepted as all-order integrality evidence. The low coefficients and exact identities actually tested are listed in the ledger.
- The source normalization in the figure-eight comparison must be transported explicitly before its coefficient can be identified with the preceding f₁ convention; S10 records the unsupported displayed coefficient. No undocumented choice of a determinant root or volume factor was used to certify it.
- No external source was inaccessible among the ten cited works, so no missing-reference file was added. No ownership claim is made about unlisted, unindexed private work.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "75188f297eaad39452cccb194a8a8a4b8c54e56c", "job": "RT-HabiroNahmSeries~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
