<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1113#issuecomment-6404202590 -->
Red team round 2 pass b (claude) of d5a1b2f

Verdict: needs_changes

1. **F01** (P2) `deg_C` of a CM stack is never defined, and the Layer 3–4 identities hold only for one of its two readings

   Location: `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:27` ("Arithmetic degrees on CM stacks include stabilizer weights and divide by the matching weighted complex degree"); used at README.md:569 (§3.6), README.md:589 (§3.8), README.md:675 (§4.2b), README.md:693 (§4.2c), README.md:720 (§4.3).

   Claim: §3.8 states deĝ(Ω♯)/deg_C Y₀=Σ_Φ h_Falt(E,Φ) and §3.6 states deĝ(det H♯_dR)/deg_C Y₀=2^d d log(2π), with deg_C never defined.

   Witness: Y₀ is an O_E-stack; deĝ sums over all finite places of E and over all complex points of Y₀×_ℤ ℂ, that is over all 2d embeddings. With deg_C Y₀ read as the weighted count of all complex points of Y₀×_ℤℂ, a point y of residue field k(y)⊃E contributes [k(y):ℚ]·h_Falt(A♯_y)=2d[k(y):E]h, so deĝ(Ω♯)/deg_C Y₀=h_Falt(E♯,Φ♯)=(1/(2d))Σ_Φ h_Falt(E,Φ) by §1.6, not Σ_Φ h_Falt(E,Φ). At d=1 that reading gives h, the README gives 2h. The identities are correct only when deg_C Y₀ counts the complex points of Y₀ viewed as an E-stack (one embedding), which is A's convention (A lines 3403–3414: Σ_{y∈Y_∞(ℂ)}1/|Aut y|=2d·deg_C(Y)) and what the proof route of §3.6 ("sum over all 2d complex embeddings") silently assumes.

   Repair: in Conventions replace "divide by the matching weighted complex degree" by "divide by deg_C Y:=Σ_{y∈Y(ℂ)}1/|Aut(y)|, the weighted count of complex points of Y viewed as an E-stack through the fixed embedding ι₀, so that Y×_ℤℂ has 2d·deg_C Y weighted points; deĝ is the arithmetic degree over Spec O_E (finite places of E, archimedean term ½Σ over all 2d·deg_C Y complex points)". Add a Check to §3.8: "For d=1 and E=ℚ(i), Y₀ has one point with residue field E and |Aut|=4, deg_C Y₀=1/4; deĝ(Ω♯)/deg_C Y₀=2h_Falt(E,Φ)=Σ_Φ h_Falt(E,Φ), whereas counting both complex embeddings gives h and would make the determinant relation read 2 log 2π=κ−2h." Tested: with the E-stack reading, d=1 gives 2^{-1}Σ_Φ h=h=(1/4)deĝ(ω₀)/deg_C+0−½log 2π, consistent with ω₀≅Ω♯² up to the fixed metric constant.

2. **F02** (P3) §2.7's tautological crystal is not produced by the roadmap's own functors: H₀=E is not a T-representation

   Location: `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:412` (§2.5, "For the tautological H₀=E, the torus T_E acts by multiplication and the lattice is O_E") and README.md:446 (§2.7, "At a geometric y over q|p … the cohomological tautological crystal decomposes by primes q′|p of E"), with *Needs:* §2.2 (Breuil–Kisin comparison for T-representations) only.

   Claim: the crystal of §2.7 is an instance of the realization functors of §§2.1–2.4, which are stated for T_{ℚ_p}- and T-representations on Y_K.

   Witness: T=Res_E G_m/ker N_F/ℚ and ker N_F/ℚ acts on E by multiplication; for F=ℚ(√2) the unit 3+2√2 has norm 1 and acts on E=ℚ(√2,i) by 3+2√2≠1, so H₀ is not a T-representation and §2.4's functor does not produce it on Y_K. A obtains it either locally, through the local Artin map into E_q×⊂T_E(ℚ_p), or globally through the auxiliary cover Ỹ_K̃→Y_K of the torus T̃=T_E (A lines 1522–1542, p. 428; A lines 1584–1586 "from the proof of Proposition 3.5.2").

   Repair: in §2.7 replace "the cohomological tautological crystal" by "the Breuil–Kisin crystalline realization of the Γ_y-representation H₀⊗ℚ_p, where Γ_y acts through the local Artin map into E_q×⊂T_E(ℚ_p) composed with the quotient to T; H₀=E is a T_E-representation that does not factor through T, so this is the local recipe of §2.1 applied to T_E, not the global functor of §2.4". In §2.5 append "H₀ does not factor through T; its global realization lives on the finite T_E-cover Ỹ_K̃ of Y_K (A, proof of Proposition 3.5.6, p. 428), and only V₀=End-semilinear(H₀) descends to Y_K." Add to §2.7's *Needs:* "§2.1 local cm representations are crystalline". Tested on d=1: T=T_E, H₀ is a T-representation and the sentence is vacuous; on d=2 the witness above forces the local phrasing.

Round 2. The eight round-1 findings are checked first, finding by finding, at this head; then the full pass was run again with fresh attention to normalisation conventions, carriers that the roadmap's own functors do not produce, the two Lean statements and every supplier citation. New findings are numbered from S01.

## Round-1 repairs at this head

| Finding | Status | Witness at d5a1b2f |
| --- | --- | --- |
| r1a F01 (uniformizer class of order two) | repaired | `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:300` "π²=12+6√3∉ℚ₃, so its class in E_p×/ℚ₃× does not have order two. Its square maps to 0 in the valuation quotient"; same correction at README.md:362 and README.md:1269. Recomputed: π²=3(4+2√3), 4+2√3 a 3-adic unit (norm 4), so π²∈ℚ₃×O_E,v×∖ℚ₃×. No new error. |
| r1a F02 (quadratic endpoint locator) | repaired | README.md:746 cites [C] Theorem 0.3(ii), p. 631 (C line 297) and §0.6, pp. 632–633 (C lines 339–370); C lines 339–370 are the Chowla–Selberg paragraph with the height identity. The new ℚ(i) Check (README.md:752) recomputed: ℓ(0)=−log 4+2 log R_Γ=0.783157, height −log R_Γ−½log π=−1.657091; checked independently against the stable Faltings height of y²=x³−x (below). No new error. |
| r1a F03 (Chebotarev unowned) | repaired | README.md:72–74 contract "From TauCetiRoadmap.Chebotarev … Layer 9, abelian Chebotarev"; README.md:914 §7.1 Needs "Chebotarev Layer 9"; README.md:964 Layer 7 Dependencies. `TauCetiRoadmap/Chebotarev/README.md:370` on main is "### Layer 9: abelian Chebotarev" (density 1/#G per element of an abelian Galois group). Chebotarev is on main. No new error. |
| r1a F04 (hermitian balancing unquantified) | repaired | README.md:138 new contract `gap:quantitative-hermitian-lattice-balancing` with D=max(2,|disc R|,N,det Gram_L(q)); `design/plan.json` `gaps` has the same slug, supplier and sentence (9 gaps, all matching). §13.3 (README.md:1208) supplies N=[O_E:R], the determinant identity and the finite index. The identity det Gram_L(q)=N^(2nr)|Nm ζ|^r det Gram_L(ψ) recomputed: q(x,y)=ψ(x,Nζy) and multiplication by Nζ on L has determinant Nm_E/ℚ(Nζ)^r=N^(2nr)Nm(ζ)^r. Checks 1–3 recomputed (table below). No new error. |
| r1a F05 (Check restating API) | repaired | README.md:934 "take relative field degree 3 and arithmetic degree 6 log 2, giving height 2 log 2 … numerator 12 log 2 and denominator 6, again 2 log 2; leaving the numerator unchanged instead gives log 2". Values 6/3=12/6=2≠6/6. No new error. |
| r1b F01 (geometric versus arithmetic Artin) | repaired | README.md:21 "ShimuraVarieties §4.1 uses the geometric map art_F(s)=rec_F(s)⁻¹; convert every supplied geometric reciprocity formula by s↦s⁻¹ before use"; contract README.md:104 "reciprocity in its geometric normalization, converted by s↦s⁻¹"; §1.3 route README.md:309 "Convert the supplied geometric reciprocity formula by s↦s⁻¹". ShimuraVarieties head line 981 still defines `art_F(s)=rec_F(s)⁻¹`. Check recomputed: 2·3≡1 (mod 5). No new error. |
| r1b F02 (contracts missing consumed sections) | repaired | README.md:104 "§§4.1–4.6, 5.1–5.11, 6.1–6.2 and 8.1–8.6"; README.md:156 "Consume Layers 4–7". ShimuraVarieties head has headings 6.1, 6.2; MetaplecticAutomorphicForms head has Layer 4, 5, 6, 7 headings. No new error. |
| r1b F03 (Layer 8 numbering) | repaired | README.md:976 "### 8.2 Height of the quaternionic CM point"; README.md:1004, 1012 cite "§8.2". `roadmaps grep` finds no external citation of the old §8.3. No new error. |

## Verified sound

Counts: 2 declarations read (all of `Suggested.lean`, 86 lines); 68 numbered targets read (every line of the 1304-line README); 30 source locators verified against the cached texts (A 18: Definitions 9.1.1–9.1.4, Theorem 9.1.5, Conjecture 9.1.6, Proposition 9.2.1, Proposition 9.3.1 and (9.3.1), Proposition 9.3.2, Corollary 9.3.3, §9.4 metric and (9.4.2)–(9.4.3), Proposition 9.4.1, Theorem 9.4.2 and (9.4.4)–(9.4.5), (9.4.9), §3.2 (3.2.1)–(3.2.2), proof of Proposition 3.5.6, §3.6, Theorem 4.8.1, Proposition 9.5.2 and Lemmas 9.5.3–9.5.4, (9.5.1)–(9.5.3), intro p. 397–398; Y 6: Theorem 1.1, height definition p. 537, Theorems 1.6, 1.7, 2.3, proof of Corollary 2.6; C 1: §0.6; T 2: §2.2 and Proposition 2.2, Theorem 2.3; PT 1: Lemma 3.7; T12 1: (4)–(5); YE 1: contraction step); 35 Checks and worked-example values recomputed (table); 125 supplier section headings resolved at main or the open heads by script (Chebotarev L9; ClassFieldTheory L13; GlobalNumberFields L11; DiophantineApproximationAndTranscendence 0.2–0.3; ReductiveGroups L4; ReductiveGroupsPartII RG2.0a.2; ShimuraData L1, L3; ShimuraVarieties 4.1, 4.6, 5.1, 5.11, 6.1, 6.2, 8.1, 8.6; PELModuli M2.1–M2.3, M3.9, M5, M6.1–M6.2, M6.8–M6.10; GrossZagierAndArithmeticHeights 0a.4, 0.1, 0.5, 0.9–0.11, 2.1, 2.9, 2.14, 6.5–6.8, 6.21, 6.25, 6.56, 7.15, 7.28, 7.65–7.67, 7.77, 7.78; ArakelovGeometryAndAbelianHeights 1.3, 1.11, 1.13–1.14, 2.1, 2.7, 2.10, 3.4–3.5, 4.6–4.8, 6.5; HilbertModularVarietiesAndShimuraCurves R18.1, R18.2.12, R18.2.17–R18.2.18, R18.5; MetaplecticAutomorphicForms L4–L7; HeightsRationalPointsAndObstructions 0.11–0.13, 0.16; GeometryOfNumbersAndQuadraticArithmetic 0.1–0.3, 1.2, 1.5, 2.2, 2.7–2.9; IntegralIwasawaTheory 3.4 `classNorm_cokernel` (line 495 at head: cokernel Gal((F′F_n∩H(F_n))/F_n), n=0 gives every finite extension); AnalyticNumberTheoryPartI 2.2, 2.31d–f (bold subsections of §2.31 at lines 1630, 1647, 1666), 2.32, 2.44–2.46, 3.27 (uniform X^(1+ε) count, constants uniform in E); AutomorphicLFunctionsAndLocalFactors AL.1; CyclotomicClassGroupsAndStickelberger 3.4, 4.1; ComplexMultiplicationAndExplicitReciprocity 0.1–0.2, 2.1–2.3, L4–L5; AbelianSchemesAndArithmeticModuli A4.1, A4.3, A4.CR.7.2, A5.1–A5.7, A6.1, A6.4–A6.5, A6.8, A6.22, A6.25, A6.37–A6.38; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15–R07.2.16, R07.2.20, R07.4; NeronModelsAndSemistableAbelianVarieties 1.5, 5.1–5.2; AutomorphicBundles B1.1–B1.3, B2, B2.7, B4.10; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2 "Lubin–Tate character" (design README line 410) and "Comparison with local reciprocity" (line 447), board design; FaltingsFinitenessAndIsogenyTheoremsPartII QI.5 "Geometric isogeny estimate" (design README line 676: degree ≤C_g max(1,h_F(A),[k:ℚ])^κ_g, not k-defined, not polarized), board design). AdelicAlgebraicGroups "AA.2.4" is cited only indirectly through AnalyticNumberTheoryPartI §2.2, whose own README uses that label; it is not a *Needs:* edge here.

Statements of the consumed supplier sections agree with the contracts where the exact content matters: ArakelovGeometryAndAbelianHeights §4.7 (local freeness of the four τ-quotients is a hypothesis, matching `gap:ramified-component-determinants`), §6.5 (c(g)∈ℝ, negative allowed); GrossZagierAndArithmeticHeights §7.78 (i₀(P,P)/[O_E×:O_F×]=−h_L(P)) and §0a.4 (quaternionCMPoint with action x^(Art_E(s))=[z,ι(r_z(s)⁻¹)g]); PELModuli M6.8 ([F′:F]≤2·3^(4g²)); AnalyticNumberTheoryPartI §2.31f (|H(1)|⁻¹+|H′(1)|≤C Q^a with Q=D_K N(f_ψ), giving |ℓ(1)|≤C D_E^ε since Q=D_E/D_F) and §2.32 (bounded-degree Brauer–Siegel, nonnormal fields included).

Pinned declarations checked at the pins with file and line: `NumberField.IsCMField` (CMField.lean:69, class with `IsTotallyComplex` and `IsQuadraticExtension (maximalRealSubfield K) K`, no finiteness), `complexConj`:141, `complexConj_apply_apply`:163, `indexRealUnits_eq_one_or_two`:372, `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`:438 (2^rank K·(indexRealUnits)⁻¹, rank K=g−1); `classNumber` ClassNumber.lean:64, `classNumber_pos`:69, `exists_ideal_in_class_of_norm_le`:77; `Scheme.Hom.finrank` FlatRank.lean:88 (via `IsAffine.finrank`, line 57: `f.appTop.hom.finrank` at the point, the rank of the localized module; flat finite case gives the fibre degree), `one_le_finrank_iff_surjective`:201, `isLocallyConstant_finrank`:231; Tau Ceti `AbelianVariety` Basic.lean:95, `dim`:118 (topological Krull dimension), `zeroPoint`:171, `End` End/Basic.lean:83 (`Additive (A ⟶ A)`) with `instRing`:168, `End.toHom`:92, `isogenies`/`IsIsogeny` Isogeny.lean:55–61 (finite and surjective), `Hom.toSchemeHom` Hom/Basic.lean:133, `card_ideal_absNorm_le` IdealCount/Basic.lean:399 (X²·2^[F:ℚ]), `abs_discr_le_of_basis_isIntegral` Discriminant/Basic.lean:61. No Faltings height, CM type or Siegel carrier exists in the pinned Tau Ceti (grep of `TauCeti/` for `faltings`, `CMType`, `CM type`, `Siegel` finds only unrelated files), so the nine headlines named in the module docstring are correctly not statable; no statable headline is absent; neither declaration is padding (both need Brauer–Siegel and the ideal-class torsor argument).

Lean versus README: the worker's elaborated signatures were compared with §§10.1–10.2 by hand (no Lean run here). `relative_class_number_growth`: ∃C>0 before ∀E, Field/NumberField/IsCMField, finrank ℚ E=2g, C·|discr E|^(1/4−ε)≤h_E/h_{E⁺} with real division and `rpow` on a nonnegative base; true by Brauer–Siegel (h_E R_E≥cD_E^(1/2−ε), h_F R_F≤CD_F^(1/2+ε), R_E/R_F=2^(g−1)/Q_E, D_F≤D_E^(1/2)); the finitely many fields of bounded discriminant are absorbed into C. `distant_cm_isogenies`: ∃c>0 before ∀E ∀A ∀ι ∃B ∃κ; the existential conjunct's isogeny forces dim B=g; every isogeny A→B is O_E-linear (it differs from the intertwining one by an element of End⁰A=E); the ideal-class torsor and §3.27's X^(1+ε) count give the bound for D_E≥D₀ and the finite range is absorbed into c. No binder lost, no vacuous carrier, no hypothesis containing the conclusion.

Ownership: `roadmaps grep` over main, the 367 open heads and the board packages finds no other statement of the total reflex determinant, the relative class-number growth, the distant-isogeny theorem, the center-order orbit bound or the CM lift height; ArakelovGeometryAndAbelianHeights (head line 18) explicitly excludes "CM-type invariance and the averaged Colmez theorem"; GrossZagierAndArithmeticHeights supplies the adjunction identity but not Yuan–Zhang Theorem 1.7 or 9.1. The two Lean names occur in no other `Suggested.lean`.

Gaps: the nine `gaps` of `design/plan.json` match the nine README contract sentences (slug, supplier, section, sentence); every supplier is named; each `needs` is a single precise sentence; none asks for what the pins or an earlier roadmap provide (ArakelovGeometryAndAbelianHeights §4.7 assumes local freeness; HilbertModularVarietiesAndShimuraCurves §§R18.2.17–R18.2.18 at the head still assume F_v/ℚ_p unramified; GeometryOfNumbersAndQuadraticArithmetic §§1.2, 1.5, 2.7 have minima and hermitian lattices, no quantitative Siegel matrix or balancing bound). The new hermitian balancing contract is true with polynomial constants (Minkowski-reduced basis of the integral positive form q, selection of r E-independent basis vectors, Cauchy–Schwarz at each place, Hadamard for the index).

Policy: the pull request changes only the package folder (9 files under `packages/ComplexMultiplicationAndExplicitReciprocityPartII/`); no `lemma` (the only hits are source locators), no `set_option`, no pull-request number or process word in README or docstrings, no machine path in README, Lean or `sources.toml`; every target has a locator with a source line; `Suggested.lean` imports `Mathlib` and one existing Tau Ceti module, has no `def`, `instance` or `example`, and its two theorems end in `sorry`.

Dependency gate, complete output:

```text
moved: ComplexMultiplicationAndExplicitReciprocityPartII moved in the merge order from #229 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 655 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the `moved:` line is not a defect (AutomorphicBundles is an open pull request adding a new roadmap folder, 5644 lines at its head). Every other named supplier is on main (Chebotarev, ClassFieldTheory, GlobalNumberFields, DiophantineApproximationAndTranscendence, ReductiveGroups, IntegralLattices, OrthogonalSpinGroups) or earlier in `ORDER.txt` (ReductiveGroupsPartII 25, IntegralIwasawaTheory 31, CyclotomicClassGroupsAndStickelberger 36, AdelicAlgebraicGroups 37, AbelianSchemesAndArithmeticModuli 49, FaltingsFinitenessAndIsogenyTheoremsPartII 50, FiniteFlatGroupsAndIntegralPadicHodgeTheory 56, LubinTateFormalModulesAndQuasiCanonicalLifts 57, NeronModelsAndSemistableAbelianVarieties 59, GeometryOfNumbersAndQuadraticArithmetic 81, AutomorphicLFunctionsAndLocalFactors 96, AnalyticNumberTheoryPartI 99, ShimuraVarieties 120, PELModuli 133, ShimuraData 135, ArakelovGeometryAndAbelianHeights 156, HeightsRationalPointsAndObstructions 157, MetaplecticAutomorphicForms 168, HilbertModularVarietiesAndShimuraCurves 177, ComplexMultiplicationAndExplicitReciprocity 186, GrossZagierAndArithmeticHeights 228).

Settled findings: the repair report marks no finding `not actionable in this package`; none is re-raised.

### Computed adversarial pass

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Conventions metrics | ℂ/ℤ[i] | ∫dz∧dz̄ has modulus 2; squared metrics 2, 1, 1/π; shifts −½log2, +½log(2π) | consistent; none |
| Conventions D_E=D_F²d_E/F | ℚ(i); ℚ(ζ₁₂)/ℚ(√3) | 4=1·4; 144=12²·1 (relative different trivial) | consistent; none |
| Conventions Artin | ℚ₅, u=2 | rec(2) acts on Lubin–Tate 5-torsion by 2⁻¹=3; art(2) by 2; 2·3≡1 | consistent; none |
| §0.3 character identity | identity; c; d=1 | at 1: (1/2d)·2^d·d=2^(d−1)=2^(d−2)(1+1); at c: 0=2^(d−2)(1−d/d) since Indχ(c)=−d; d=1: (1+χ)/2 | consistent; none |
| §0.3 height identity | a=d/2+½Indχ | Z̃=−(d/2)log2π−ℓ(0)/2−¼log(D_E/D_F) using ζ′(0)/ζ(0)=log2π, f(Indχ)=D_E/D_F | matches A (9.3.1); none |
| §1.1 kernel | d=1,2 | diagonal composed with N_F/ℚ is t↦t^d: kernel μ₁, μ₂; T-characters: a_ι+a_cι constant | consistent; none |
| §1.2 K₀,p equals largest compact above K_so,p | general p | preimage P of K_so,p has P/(ℤ_p×·r(O_E,p×))≅ℚ_p×/ℤ_p×≅ℤ torsion-free, K∩ℚ_p×=ℤ_p× | equivalence true; none |
| §1.2 Check 3 | ℚ(√−3), p=2 inert | K₀,2=O_E,2×, 2 has valuation 1 | consistent; none |
| §1.6 a⁰(E♯,Φ♯)=(1/2d)Σa⁰ | d=1; E=ℚ(i,√2) at 1,s,c,cs | d=1: both equal a⁰_Φ₀ (conjugate type has the same averaged overlap); d=2: LHS (2,1,0,1), RHS (1/4)(8,4,0,4)=(2,1,0,1) | consistent with A Prop 9.3.2; none |
| §2.6 | ℚ(i), f_a(x)=a x̄ | f_a∘f_b=ab̄·id, f_i²=1, z=(1,i): B(z,z̄)=4 | consistent; none |
| §2.7 carrier | F=ℚ(√2), unit 3+2√2 | norm 1, so in ker N_F/ℚ; acts on E by 3+2√2≠1 | H₀ not a T-representation; S02 |
| §3.6, §3.8 determinant relation | d=1, E=ℚ(i), both readings of deg_C | det H=Δ+rω₀−2Ω♯ with Δ trivial; E-stack reading: deĝ(Ω♯)/deg=2h, ω₀≅Ω² up to κ=2log2π consistent; ℤ-stack reading: deĝ(Ω♯)/deg=h forces κ=2h, impossible | S01 |
| §3.8 with A | general d | 2^(−d)Σh=¼deĝ(ω₀)/deg+¼logD_F−(d/2)log2π; A line 5280 identical; intro A line 285 is 4× this | consistent; none |
| §4.2b, §4.2c, §4.3 formulas | compare with A lines 179, 275/4991, 5647 | identical up to moving d·log(4πe^γ) across; §4.3 coefficient ¼ | consistent; none |
| §4.2c analytic cancellation | E_error=0 | −2(ℓ+½logQ−(d/2)log(4πe^γ))−d log(4πe^γ)=−2ℓ−logQ | consistent; none |
| §4.2c rank-one Check | E=ℚ(i,√2), ξ=√2 | ξxx̄=√2(a₁²+2a₂²+b₁²+2b₂²)+4(a₁a₂+b₁b₂), Tr_F/ℚ=8(a₁a₂+b₁b₂); ⟨1⟩∨=½ℤ, Q(½)=¼ | consistent; none |
| §4.2d sign | A (9.5.1) | [ω:Y]−deĝ(ω₀)−logD_F≈0 so difference +logD_F; combined with §3.8 and §4.2c gives Theorem A | consistent; none |
| §4.4 parity | ℚ(ζ₁₂)/ℚ(√3) | unramified at finite places; −1∈O_F× forces (−1)^d=1 so d even; d_F=𝔭₂²𝔭₃, χ(𝔭₂)=χ(𝔭₃)=−1 (both inert), χ(d_F)=−1=(−1)^(2/2) | consistent; none |
| §4.6 ℚ(i) | y²=x³−x, ω=dx/(2y) | lattice 2.6221·ℤ[i], area (π/4)R_Γ², Δ=64 so ord_v(ω)=−e_v/2 at v∣2; Deligne height −½log2−½log(6.875)=−1.3105; unscaled −1.6571; formula −ℓ(0)/2−¼log4−½log2π=−1.6571 | agrees; none |
| §5.2 | Y Thm 2.3 | h(Φ)−Σ_τh(Φ,τ)=−(1/(4[E_Φ:ℚ]))log(d_Φd_Φc), R_Φ the image of O_{E_Φ}⊗O_E | identical; none |
| §5.4 | g=1,2,3 | edges 1,4,12; each h(Φ,τ) is one endpoint, so Σ_ΦΣ_τh=2Σ_edges h_near, coefficient 2^(1−g) | consistent; none |
| §6.2 x−x̄∈δ | O_E ∋ x | f_x′(x)=x−x̄ divides into the different | consistent; none |
| §7.1 ramification | g=1,2,3 | g+|S|=3,3,3 odd; B(τ) ramified at g−1+|S|=2,2,2 places, division | consistent; none |
| §7.4+§8.2⇒§9.1 | substitute Y Thm 1.7 into Thm 1.6 | h_L/2−¼log(d_𝔹D_F)=−ℓ/2+¼log(d_𝔹/d_E/F)−¼log d_𝔹−¼logD_F=−ℓ/2−¼log(D_E/D_F) | matches Y Thm 1.1 (line 104); none |
| §8.1, §8.2 | GZ §7.78 | i₀/e=−h_L with e=[O_E×:O_F×]; Y Thm 1.7 line 254: h_L=−ℓ+½log(d_𝔹/d_E/F) | consistent; none |
| §10.1 Lean | ℚ(i), ℚ(√−3), ε=1/8, C=4^(−1/8) | lower sides 1 and 0.9647 ≤ ratio 1; exponent ≤0 when ε≥¼ | true; none |
| §10.2 Lean, all isogenies linear | f arbitrary, f₀ intertwining | h=f₀⁻¹f∈End⁰A=E commutes with ι(a) | bound over all f equals T's; none |
| §10.2 Lean, dim B | ∃ isogeny A→B | isogeny forces dim B=dim A=g | no missing hypothesis; none |
| §10.2 degrees | id, [2], (1+i) on ℂ/ℤ[i] | finrank at zero point 1, 4, 2 | consistent; none |
| §10.3 functional equation | Γ_ℝ′/Γ_ℝ(1)=−½logπ−γ/2−log2, Γ_ℝ′/Γ_ℝ(2)=−½logπ−γ/2 | ℓ(0)=−ℓ(1)−logQ+g(γ+log2π); mean h=ℓ(1)/2+¼logQ−gγ/2−g log2π | matches README; none |
| §10.3 average to individual | m=2, b=−1, heights (−1,3) | mean 1; 3≤2·1+1 | consistent; none |
| §11.1 Check 2 | u=(1+√2)^8 | 577+408√2, 577≡1, 408≡0 (mod 3), ū=u, uū=u²≠1 | consistent; none |
| §11.2 exponents | κ=2, δ=1/16, a=3/16, ε=1/32 | δκ=1/8<3/16<1/4, εκ=1/16<3/16; [k:ℚ]≤4·3^(8g²)[F_A:ℚ] | consistent; none |
| §12.1 Check 1 | ℤ+2ℤ[i] | J=2, D=16 | consistent; none |
| §12.3 dyadic exponential | p=2 | exp converges for v≥2, not on 2ℤ₂ | consistent; none |
| §12.4 gap versus T12 (4)–(5) | T12 lines 727–739 | orbit ≫ B^{|i_x|}[MT(Ẑ):K_x]·|im Cl(L)→Cl_MT| | gap matches source; none |
| §13.1 degree | product center algebra | Galois group embeds in S_{2g}, degree ≤(2g)!, with i: 2(2g)! = 4, 48 | consistent; none |
| §13.3 Checks 1–3 | ℤ[i], h_m; 2ℤ[i]; ψ=Im(x̄y), ζ=±i | Gram diag(2m,2m), det 4m², entry m, index 1; diag(8,8), det 64, entry 4, index 1; H_ψ=−ix̄y/2, h=x̄y/2, q=Re(x̄y), det 1=1·1·1; ζ=−i negative definite | consistent; none |
| §13.3 Check 4 | Z=M+i, Z=i/M | ((1,−M),(0,1)): Z↦i, h₀=√(M²+1), entry M; ((0,−1),(1,0)): Z↦iM, h₀=M, entry 1 | consistent; none |
| §13.3 determinant identity | q(x,y)=ψ(x,Nζy), L⊂E^r | det Gram(q)=det Gram(ψ)·Nm(Nζ)^r=N^(2nr)Nm(ζ)^r det Gram(ψ), Nm(ζ)>0 | consistent; none |
| Hermitian gap truth | q integral positive on L, rank 2nr | reduced basis with q(b_i,b_i)≤c det; r E-independent among them; σh(v,v)≤q(v,v)/N; Hadamard bounds [L:ΣRv_i]² | true with polynomial constants; none |
| Siegel gap sanity | Im Z entries ≤h₀, det ≥1/h₀ | λ_min≥det/λ_max^(g−1) polynomial in h₀ | plausible; declared gap |
| Worked example ramified quotient | ℚ_p(√p), p odd; ℚ₂(√2) | τ-quotient O_L/(c(√p)−√p)=O_L/(2√p), length 1; v(2√2)=3 | consistent; none |
| Worked example p=2 | ℚ(√17,√−7) | 17≡1, −7≡1 (mod 8): 2 splits completely; 𝔽₂⁴ not monogenic | consistent; none |

## Not verifiable

- No Lean was run (the brief forbids builds in this pass); the binder check relies on the worker's elaborated-signature listing for this head, compared with the README by hand.
- A Theorem 9.4.2's archimedean step (Δ̂=(Δ,0) having norm 1 and the 2^d d log(2π) volume computation) was checked only against A line 5310 and the d=1 consistency above, not recomputed from the trace isomorphism.
- A Theorem 4.8.1's support clauses for E(f) (odd p with p²∤D, dyadic case for n≥5) were read at A lines 2585–2600 only as far as the statement; the decomposition on A p. 455 was not recomputed.
- Y Theorem 9.1's proof and the Erratum Propositions 4–6 were checked at their cited lines; the Breuil–Kisin multiplier computation and the contraction threshold n≥max(2,e_v) (YE line 253 states n≥[O_v:W(k_v)]) were not recomputed.
- T12 Lemmas 7.2–7.5 and PT Lemmas 3.4–3.6 statements were checked; the index estimates behind §§12.3 and 13.3 were not recomputed.
- Ownership against open pull requests was checked through the `roadmaps grep` index of 367 open heads and the board packages; pull requests outside that index were not examined.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d5a1b2ff2ae4b2d06cc44015244e7a0948478ee2", "job": "RT-ComplexMultiplicationAndExplicitReciprocityPartII~2b", "model": "fable", "worker": "chris-h"} -->
