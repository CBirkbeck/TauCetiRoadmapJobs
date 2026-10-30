# Review of MotivicEtaleKTheory (pull request #1470 at 83b84df)

**Verdict:** accepted

Two P3 notes below; no P1 or P2 finding. The gate passes at this head, the dependency check shows no UPWARD or CYCLE line, `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` elaborates with no warning at all, and every locator of the seeded sample was read in the cached text and supports the statement as written. The two declared gaps are precise, minimal (no Whitney extension, Borel lemma or Łojasiewicz regular-situation theorem exists in Mathlib or Tau Ceti at the pins) and declared with the same slugs in `design/plan.json` and in the README's DifferentialGeometry contract.

## R01 (P3) — §6.10 contract words a universal-class statement the supplier does not spell out

Location: `TauCetiRoadmap/MotivicEtaleKTheory/README.md` lines 7 and 57 ("its §6.10 owns the universal integral motivic Chern classes and their projective-bundle and Whitney identities").

Claim: KTheoryFiniteLocalFields §6.10 supplies universal classes `Cₚ ∈ CHᵖ(B·GL_N,0)` with projective-bundle and Whitney identities.

Witness: KTheoryFiniteLocalFields at its open head, §6.10 (lines 1469–1473): the only named deliverable is `diagonalChernMilnor` on fields; the universal construction appears only in its *Needs:* line as "the integral motivic projective-bundle/splitting construction of Chern classes from V.11.11–11.14, built here". Neither "B·GL_N" nor "Whitney" occurs in that roadmap.

Repair: in the Scope paragraph and the §6.10 contract, cite what the supplier states: "§6.10 builds the integral motivic Chern-class theory of WeibelKBook V.11.11–11.14 on the shared complexes (universal classes on `B·GL_N` with the Whitney and projective-bundle identities of a Chern-class theory) and exports the field diagonal `diagonalChernMilnor`". If the author wants the universal-class export guaranteed rather than inferred from Weibel's theorem, declare it as a gap on KTheoryFiniteLocalFields §6.10 so the intake announces it. The substance is supported (Weibel's V.11.11 is a "theory of Chern classes" in his sense, WeibelKBook line 27688), so this is wording, not a missing owner.

## R02 (P3) — the References note attributes the arbitrary-field supported comparison to Levine

Location: `TauCetiRoadmap/MotivicEtaleKTheory/README.md` line 740 ("the supported comparison uses regular quasi-projective schemes over any field").

Claim: Levine94 Theorem 3.4 is proved over any field.

Witness: Levine94 line 1405 states Theorem 3.4 for a regular quasi-projective k-scheme with k "a field" (line 1184), but its proof (lines 1424–1437) runs through Theorem 3.2 and Theorem 2.7, and Theorem 2.7 (Levine94 line 1101) assumes k infinite; no finite-field reduction is given in §3. The roadmap's own §2.3 (line 309) supplies that reduction by transfer descent, correctly.

Repair: change the note to "the supported comparison is stated for regular quasi-projective schemes; its proof uses Theorem 2.7 over an infinite field, and §2.3 here supplies the finite-field descent", so the source note matches what §2.3 says. Recorded as a source gap below.

## Verified sound

**Gate and build.** The worker's gate at 83b84df: every check 0, `OK`. Re-ran the dependency check:

```
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `lake env lean TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` exits 0 with no output (no `sorry`, no warning). The outside-folder diff against `origin/main` is empty; the folder holds exactly `README.md`, `Suggested.lean`, `metadata.toml` (shape `topic = "math.AG"`, as the neighbouring roadmaps on main). `roadmaps resolve` found no dangling citation or Lean name. The brief's `#check @name` comparison has nothing to compare: the file declares nothing, which the module docstring justifies declaration by declaration.

**Headline theorems and statability.** Headlines from the README: integral cubical–simplicial comparison with supports and coefficients (§1.3); rational cycle-to-K comparison and its identification with the universal-class character (§§2.2–2.3); product formula and degree-zero agreement (§2.4); Burgos bifiltered comparison (§3.2); compactification independence (§3.4); product associativity (§4.2); semipurity with singular support (§5.2); cycle resolution (§5.4); the universal regulator with restriction coherence and pullback (§§6.1–6.3); Beilinson identification (§7.2); multiplicativity on integral higher Chow groups (§7.3); logarithm and projective witnesses (§7.4). At the pins Mathlib has no scheme K-theory, higher Chow groups, Deligne cohomology or logarithmic Dolbeault forms (grep of `Mathlib/` for `KTheory`, `ChowGroup`, `higher Chow`, `Deligne cohomology`, `Dolbeault`, `BlochCycle`: no hit) and Tau Ceti has only linear Hodge structures (`TauCeti/Geometry/Hodge/`). Every headline is therefore not statable and each is named in the docstring with its missing carrier. The empty file is correct; no padding, no stand-in, no `set_option`, no sorry'd data.

**Pinned declarations opened** (file and line at the pins Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `AlgebraicCycle` (AlgebraicCycle/Basic.lean:44, `Function.locallyFinsupp X R`, no dimension condition, as the README says) and `AlgebraicCycle.map` (:69, `[QuasiCompact f]`, dimension weights `wx wy`); `Scheme` (Scheme.lean:40); `ModuleCat` (ModuleCat/Basic.lean:56); `HomologicalComplex` (:59) and `d_comp_d` (:72); `DerivedCategory` (DerivedCategory/Basic.lean:87, localization at quasi-isomorphisms of `ComplexShape.up ℤ`); `mappingCone` (MappingCone.lean:57), `inl_v_d` (:261: `inl ≫ d = φ ≫ inr − d_F ≫ inl`), `inr_f_d` (:269); `DoldKan.equivalence` (DoldKan/Equivalence.lean:167, `SimplicialObject A ≌ ChainComplex A ℕ`); `TauCeti.gradedCochainComplex` (GradedCochainComplex.lean:59, degree-one homogeneous square-zero endomorphism); `HodgeStructureOn` (Structure.lean:62), `IsMorphism` (Morphism.lean:69, conjugation equivariance plus filtration preservation); `tate` (Tate/Basic.lean:91), `tate_F` (:100), `tate_piece` (:111: piece `p = ⊤` iff `p = −m`, as the README's "only Hodge piece at −p"); `MixedHodgeStructure` (Mixed/Basic.lean:72), `Hom.range_inf_F_eq_map_F` (Strictness.lean:110: `range f ⊓ F p = (F p).map f`). All nineteen citations exact.

**Supplier citations resolved** (every section opened at its head or on main): GeneralAlgebraicKTheory §3.12, §§4.6, 4.8, 4.14, §6.3, §§7.4–7.7, §§8.12–8.13 (lines 628–1930; §8.12 fixes `∂[π]=+[k]`, §8.13 gives the left-linear adapter `(−1)^(n−1)∂`, both as the README's Conventions). SchemeKTheoryOperations §§2.1–2.6, 3.1–3.6, 4.3, 6.1, 6.7–6.9, 7.1–7.3 (lines 374–2281; §6.1 `supportPairing`/`supportMul`; §6.8 `adams` on supported `K_m` of regular finite-dimensional ample-family schemes; §6.9 the simultaneous weight decomposition and, at line 2107 inside §6.9, Riou's several-variable identification of operations on `ℤ×Gr`; §7.2 `chernCharacter_adams`). KTheoryFiniteLocalFields §3.0a (`motivicCycles` line 481, `motivicToK` line 502: arbitrary-field BlochCycle/HigherChow, two-coprime-degree finite-field descent, integral transfers) and §6.10 (`diagonalChernMilnor`, factor `(−1)^(n−1)(n−1)!`). MotivesAndAlgebraicCycles §4.4 (Tate complexes `Z(q)`), §§4.7–4.8, §4.8a (relative-cycle specialization), §4.14, §§4.17–4.18. SchemeAndStackFoundations §§2.1–2.2, 4.12, 4.17, 5.1–5.8 (main, lines 3265–7107). ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.1–6.4 (§6.2 `sncCompactification` with `_open`, `_boundary`, `_projective`). EtaleCohomologyFoundations §§G.1–G.3 (main; G.2 `nagataCompactification` for qcqs base, separated finite type). ComplexComparisonPartII §§C−1.1, C−1.4, C5.1, C5.3–C5.6, C6.0 (lines 724–3958; `regularSingularDeRhamComparison` at line 3822 with the hypothesis "residue eigenvalues not positive integers", so the trivial connection qualifies as §3.2 says; `properPureHodge`, `relativeHodgeBundles` in the C5 table; `sncCompactification` consumed at line 903). EnhancedDerivedSheaves §§0.1–0.4, E0.6, E1.4, E2.6 (main). DifferentialGeometry Layers 0–1 and 5–9 (main, lines 268–862). ComplexKahlerGeometry K1–K2 (main, lines 96, 193). AlgebraicTopology Stages 2–3, 6, 8 (main); Stage 8 item 2 owns `simplicialGroupKan` and `simplicialGroupMooreHomotopyIso` (πₙ(G)≃Hₙ(NG) including components), exactly what §§2.0b and 7.1 cite. ComplexManifolds Milestones 1–2 (main). Completed/HodgeStructures exists. Merge order: all six pull-request suppliers precede this roadmap (GeneralAlgebraicKTheory 13, ResolutionOfSingularitiesCharacteristicZero 14, SchemeKTheoryOperations 33, ComplexComparisonPartII 38, KTheoryFiniteLocalFields 67, MotivesAndAlgebraicCycles 69; this roadmap 121); the consumers follow (ColemanIntegration 123, BorelRegulators 277, Polylogarithms 281, ZagierConjecturePolylogarithms 298).

**Ownership against open work.** `roadmaps grep` for "Deligne cohomology", "logarithmic Dolbeault", "Beilinson regulator", "higher Chern character", "cubical higher Chow": every other hit cites this roadmap as owner rather than building the object: BorelRegulators §6.0a (lines 13, 157–159, 726–751: imports §§3.3–3.4, 4.1–4.2, 7.1, 7.4, and uses the same `f−r` cone with `(r,f,ω)↦(r,f,−ω)`), Polylogarithms §5.2 (lines 905–912: imports §5.1's fiber with `d(ω,g)=(d_Dω,res ω−d_Dg)` and identifies its `D_A`, `D_{A,Z}`, `H^{p,q}` with §§5.3–5.4 "after J"), ColemanIntegration §§L3.Fa.1–Fa.2 (lines 2433–2449: `cubeRelK`, `relativityIso`, face ranks `(1,0)↦1`, `(0,1)↦−1`, the Jordan-block example, the two-loop exchange sign −1, all as §2.0a states), PeriodsAndSpecialValues (line 39: "MotivicEtaleKTheory §§2.2–2.4 owns the higher Chern comparison"; line 136 uses the same `P_(n−1)(z)=(z+(−1)^(n−1)z̄)/2`), EllAdicHomotopyTypesAndWeights (line 13), EllipticKTheory (§2.3 consumer). ArithmeticKTheory (earlier in the order) has no Deligne, regulator or higher Chow content. Ownership against open pull requests whose files the brief did not give was checked through `roadmaps grep` only. Note for the author, not a defect here: K2SymbolsBrauer (#1302, lines 2224 and 3469) and CrystallineCohomology (#857, line 11538) describe a MotivicEtaleKTheory with "M.4", "Layers 5, 9, 10" and de Rham–Witt imports; those sections do not exist in this roadmap, so those roadmaps' consumer notes are stale.

**Seeded sample, all read at the locator.** §1.1: BF line 381–386 (cubical δ=Σ(−1)^(i+j)δᵢʲ, so δ=−∂□ with the README's ∂□), BF line 395–403 (Definition 1.18, N₀Cₙ=⋂ker δᵢ¹∩⋂_(i≥2)ker δᵢ⁰, differential −δ₁⁰, which J turns into +∂₁⁰), BF line 408–459 (Proposition 1.20 and its filtration proof), BF line 610 (□=ℙ¹∖{1}), BF line 639–660 (hⱼ(t)=1−(tⱼ−1)(tⱼ₊₁−1), which in x=t/(t−1) is x+y−xy; computed below), BFT line 180, Levine94 line 1184–1208. §1.3: BFT line 961 (Proposition 6.12 citing Levine Theorem 4.7), Levine94 line 1735–1772 (Lemma 4.6 acyclicity and Theorem 4.7 for any k-scheme). §2.0a: Levine94 line 407, 539, 625 (Theorem 1.10, Corollary 1.11), 655–736 (K^Z, Lemma 2.1 with the flag argument), 777–795 (Lemma 2.2 and (2.1)), 862–889 (forget-face ladder), 1006–1018 (CH_s(X;D) and Lemma 2.5), 1101–1117 (Theorem 2.7: regular quasi-projective over an infinite field, splitting and moving hypotheses); WeibelKBook line 15979 (η↦[−1]). §2.3: Levine94 line 1399–1437 (Theorem 3.4, regular quasi-projective, iterated fiber square), 1794 (Corollary 4.9, rational functoriality on smooth quasi-projective). §3.1: Burgos94 line 155–190, BKK line 4217–4220 (generators log zz̄, dz/z, dz̄/z̄). §3.2: DeligneHodgeII line 1044 (3.1.8 filtered quasi-isomorphisms), 1142 (3.2.5), 1223 (independence of compactification), 1242 (3.2.13 degeneration), Burgos94 line 181 (Theorem 2.1 bifiltered), 379–381 (Proposition 4.1). §3.4: BKK line 4239 (Theorem 5.22), 4255–4272 (presheaf colimit and (5.23)), 4297–4308 (Proposition 5.29 with Zariski sheafification), 4310–4316 (Corollary 5.31). §4.1: BKK line 4121 (Definition 5.13), 4129–4140 (Definition 5.14, four cases, `rₚ(x)=2πₚ(Fᵖd_Ax)`), 4176–4180 (special degrees). §4.2: BKK line 4142–4146 (Proposition 5.15, hₐ vanishes on even critical degrees without closedness), BF line 506–512 (Proposition 1.26). §5.3: BF line 705–719 (D_A with (d_D, δ) and ds=d_D+(−1)ʳδ), 746–752 (H^p), BFT line 266. §5.4: BF line 720 (2.8), 741 (2.9), 753 (2.11), 766 (2.13). §6.1: BF line 862–876, BFT line 277. §6.2: BF line 877–885 (3.3), 319 (Lemma 1.10 roofs). §7.2: BF line 905–912 (Theorem 3.5 header "equidimensional complex algebraic scheme"), 919 ("Consider X as a smooth quasi-projective scheme over ℂ"), 998–1036 (Grassmannian reduction, (3.7)), BFT line 296. §7.4: BKK line 3965, 4176–4180, BF line 550–552 ((0,−½log ff̄)), KLM line 553 (R₁=log z). Also opened: BKK line 3999–4030 (Definition 5.7, Notation 5.8), 4035–4050 (Definitions 5.9–5.10 with u(a,f)=−a+f and the three-case differential), 4056–4111 (Proposition 5.12 with ψ, ϕ, h), 4395–4408 ((5.38)), 4450–4462 (Definition 5.41), 4841–4846 (Proposition 5.58); BF line 528–552 ((1.30), Proposition 1.31), 1440, 1537–1542 (Definition 5.8 sign (−1)^(ns)), 1619–1624 (Proposition 5.13); Levine94 line 799–860 ((2.2), Quillen spectral sequence, (2.4)–(2.8)), 1210–1270 (Theorem 3.1 and its verification of Theorem 2.7's hypotheses), 1585–1600 (Lemma 4.3 with the finite-field coprime-tower reduction), 2226 (Theorem 5.2); Burgos94 line 102, 316, 337, 345, 358; MVW line 1054, 1204–1216, 5827–5842; WeibelKBook line 27688–27694, 27746–27747.

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: ∂□ vs BF's δ | n=1 graph Γ_t on 𝔸¹ | ∂□Γ_t=(∂₁⁰−∂₁∞)Γ_t=[0]−0=[0]; BF δ=Σ(−1)^(i+j)δᵢʲ gives −[0]; J₁=−1 | consistent with BF line 386 | none |
| Conventions: J multiplicative | n=0,1,2 and n+m | 1,−1,1; (−1)^(n+m)=(−1)ⁿ(−1)ᵐ | holds | none |
| Conventions: pair fiber vs Mathlib cone | Cone(f)[−1] in degree n = Fⁿ⊕Gⁿ⁻¹ | d[−1](x,y)=(d_Fx, −f x−d_G y); negate y: (d_Fx, f x−d_G y) | matches d(a,b)=(da,f(a)−db) | none |
| Conventions: fib(0→ℝ[0]) | A=0, B=ℝ[0] | nonzero summand Bᵃ⁻¹ at a=1 | degree 1 | none |
| Conventions: cycle pair fiber class | (𝔸¹,{0}), a=Γ_t | d(Γ_t,0)=([0],t) ⇒ [(0,t)]=−[([0],0)]; adapter −δ_raw sends t↦+[0] | consistent with B[t]=+[O₀] (GeneralAlgebraicKTheory §8.12) | none |
| Conventions: ℤ/2⊗ᴸℤ/2 | cohomological grading | Tor₁ in degree −1, Tor₀ in degree 0 | as stated | none |
| 1.1 extra cubical map in affine coordinate | x=t/(t−1), BF hⱼ=1−(tⱼ−1)(tⱼ₊₁−1) | t−1=1/(x−1); h_x=h/(h−1)=1−(x−1)(y−1)=x+y−xy; h(0,y)=y, h(1,y)=1 | matches README | none |
| 1.1 square cycle Check | Z=[x+y=3]−[x=2]−[y=2] on Spec ℚ | faces x=1,y=1: 0; x=0,y=0: [3]−[2]; ∂□Z=0; ∂₂⁰Z≠0 so not refined | as stated | none |
| 1.1 retraction identity | h₂Z=[x+y+z−yz=3]−[x=2]−[y+z−yz=2] | ∂□h₂Z=([y+z−yz=3]−[y+z−yz=2])−Z+Z; Z−∂□h₂Z=rZ; faces of rZ all 0 | rZ−Z=−∂□h₂Z verified | none |
| 1.2 total differential squares to zero | bidegree (1,1) | ∂□(−∂Δ)+(+1)∂Δ∂□: coefficients −1,+1 | 0 iff faces commute | none |
| 1.2 orientation multiplier | (1,0),(0,1),(1,1) | (−1)ⁿ: −1,+1,−1; (−1)^(n+m) would give −1,−1,+1 | as stated | none |
| 1.3 fib(id) on ℤ[0] | C=ℤ | ℤ→ℤ identity in degrees 0,1; H⁰=H¹=0 | contractible | none |
| 1.4 inseparable transfer | 𝔽₂(t)/𝔽₂(t²) on CH⁰=ℤ | restriction then transfer = ×2 | as stated | none |
| 2.0a (2.1) weight range | V=𝔸¹_ℚ, W={0}, c=1 | K₁^W(V)^(1)=K₁(ℚ)^(0)=0; K₁^W(V)^(2)=K₁(ℚ)^(1)∋[2]≠0 | b≤c needed and sharp; Levine's ladder at line 866 uses b=d | none (see Not verifiable) |
| 2.0a face obstruction Check | V=𝔸²_ℚ, W=V(x), D₁=V(y) | K₁^(pt)(𝔸¹)^(1)=K₁(ℚ)^(0)=0; restriction ℚ→ℚ, 1↦1; kernel 0 | as stated | none |
| 2.0a Adams not a spectrum map | X=Spec ℚ, η·1=[−1] | ψ²[−1]=[1]=0 ≠ [−1]; rationally [−1]=0 | as stated (WeibelKBook line 15979) | none |
| 2.0a generalized vs simultaneous weights | ℙ², h=1−[O(−1)] | ψ²h=1−(1−h)²=2h−h²; ψ²h²=4h²; lattice ℤ1⊕ℤ(2h+h²)⊕ℤh² has index det[[1,0,0],[0,2,0],[0,1,1]]=2 | as stated | none |
| 2.0a Jordan block | T e₁=2e₁, T e₂=e₁+2e₂ | (T−2)e₂=e₁≠0, (T−2)²e₂=0; dims 2 vs 1 | as stated; ColemanIntegration line 2446 agrees | none |
| 2.0a external product singularity | ℤ[i]⊗ℤ[i] at (1+i,s−i) | v=s−i, v(v+2i)=s²+1=0; 2i=−i(1+i)²∈m²; m/m² spanned by 1+i, v: dim 2 over 𝔽₂; dim ring 1 | singular, excluded | none |
| 2.0a open cube over ℤ₃ | Y=(X×□)∖{t=2} | 2≢0 mod 3 and {t=2} misses t=∞: both faces ≅ X | as stated | none |
| 2.0b diagonal factor | n=1,2,3 | (−1)^(n−1)(n−1)!: 1,−1,2; character (−1)^(p−1)/(p−1)!·that = 1 | matches WeibelKBook line 27746–27747 | none |
| 2.0b Chern vs character on ℙ² | O(1), O(1)⊕O(−1) | c₂(O(1))=0, ch₂=h²/2; c₂(O(1)⊕O(−1))=−h², ch₂=h² | as stated | none |
| 2.1 inverse convention Check | ℙ¹, h↦1−[O(−1)] vs [O(−1)]−1 | χ=1 vs χ=0−1=−1 | as stated | none |
| 2.2 eigenvalue differences | weights 0,1,2 under ψ² | 1−2, 1−4, 2−4 = −1,−3,−2 | all nonzero | none |
| 2.2 total Chern class on ℙ¹ | O(1)⊕O(−1) | (1+h)(1−h)=1−h²=1; ch=2 | as stated | none |
| 2.2 symbol residue sign | {2,t} on 𝔾_m/ℚ, right-linear ∂(x·y)=∂x·y | {2,t}=−[t]·[2] ⇒ ∂=−[2]; uniformizer-last (−1)^(2−1)∂ gives +[2], valuation 1; reversed order −[2], valuation −1 | consistent with §8.13 | none |
| 2.3 regular not smooth | k=𝔽_ℓ(t), L=k[s]/(s^ℓ−t), ℓ=2,3 | Ω¹_(L/k)=L ds≠0; L⊗ₖL=L[ε]/(ε^ℓ); CH⁰⊗ℚ=ℚ=K₀(L)^(0), 1↦[L] | as stated | none |
| 2.4 factors ch/c | p=1,2,3 | (−1)^(p−1)/(p−1)!: 1,−1,1/2 | as stated | none |
| 2.4 leading class on 𝔸¹ | {0}⊂𝔸¹ | [O₀]=1−1=0; div(t)=0 | 0=0 | none |
| 3.1 residue order | dz/z∧dw/w at 0 | +1, reversed −1 | convention pinned | none |
| 3.2 weight of dz/z | 𝔾_m⊂ℙ¹ | dz/z∈W₁∖W₀ on Ω(log); weight 1+1=2, type (1,1); residues of trivial connection (0,0) | matches DeligneHodgeII line 1147 shift | none |
| 3.2 flat extension values | f=exp(−1/|z|²) | f/z² and f log|z|² have zero jets at 0; f(1)=e⁻¹ | smooth, nonzero | none |
| 3.2 two-variable value | f=exp(−1/|zw|²), (z,w)=(−2,1) | f=e^(−1/4), log|z|²=log 4, zw̄=−2: value −(e^(−1/4) log 4)/2 | as stated | none |
| 3.3 D(A,p) at a point | A=ℂ[0], p=0,1,−1 | H⁰D(A,0)=ℝ; H¹D(A,1)=ℂ/2πiℝ; p=−1: D⁰=(2πi)⁻¹ℝ, H⁰=ℝ(−1), H¹=0 | as stated | none |
| 3.3 inclusion/projection at a point, p=1 | BKK ϕ,ψ (line 4063–4072) | ϕ(r)=(0,0,r); ψ(0,0,log 2+iθ)=π₀(log 2+iθ)=log 2 | ψϕ=id, ϕψ≠id | none |
| 3.3 critical differential | x=|z|² | ∂∂̄|z|²=dz∧dz̄; −2∂∂̄x=−2dz∧dz̄ | as stated | none |
| 3.3 cone-arrow reversal | z=3+4i, p=1,2,3 | πₚ₋₁(z)=(z+(−1)^(p−1)z̄)/2: 3, 4i, 3 | as stated; πₚ₋₁ kills ℝ(p) since i^p(1−1)/2=0 | none |
| 3.4 Zariski vs analytic sheafification | 𝔸¹, p=1, Re z | −2∂∂̄Re z=0; Re z not of log growth at ∞; D⁰(A,1)=0 so no boundary | as stated | none |
| 4.1 odd-degree product on 𝔾_m | x=log 2, y=log|t| | x(∂y−∂̄y)=(log 2)/2(dt/t−dt̄/t̄)=i log 2 darg t; period 2πi log 2; y•x=−x•y | as stated | none |
| 4.1 Leibniz Check | x=|z|², y=1, p=q=1 | x•y=−∂x+∂̄x=−z̄dz+z dz̄; d(x•y)=2dz∧dz̄; −F^(1,1): −2dz∧dz̄ = (−2∂∂̄x)∧1 | as stated | none |
| 4.1 nonunital algebra | A=tℝ[t], d=0, p=0 | coefficient of t in e·t is 0; in ℝ[t], 1•t=t | no unit asserted | none |
| 4.2 even critical degrees | x=Re z, 2, 3 in weight 0 on ℂ | both bracketings 6 Re z, value 6 at z=1; hₐ=0 by BKK 5.15(ii) | as stated | none |
| 5.1 pair fiber at Z=∅, Z=X | D_log(∅,p)=0 | fib(id) contractible; fib(D→0)=D | as stated | none |
| 5.2 semipurity on 𝔸² | p=1: Z=V(xy), V(y²−x³), {0}; p=2: {0}; p=1 full support of a point | ℝ², ℝ, 0; ℝ; H¹_D(pt,ℝ(1))=ℝ≠0 (hypothesis fails) | as stated; negative control holds | none |
| 5.2 Green current sign | f=t on 𝔸¹, BKK (5.38) and Def 5.41 | dd^c=−(2πi)⁻¹∂∂̄; Poincaré–Lelong ⇒ −2∂∂̄[−log|t|]=−δ₀ in BKK normalization, i.e. [0]−δ₀ | matches BF (1.32) and README | none |
| 5.3 good truncation Check | ω=Re z₁ dz₂∧dz̄₂ on ℂ² | dω=½(dz₁+dz̄₁)∧dz₂∧dz̄₂; on (∂ₓ₁,∂ₓ₂,∂ᵧ₂): 1·(1·(−i)−i·1)=−2i | nonzero | none |
| 5.3 empty support on a point | X=Spec ℂ, p=1, n=0 | D¹_log=ℝ; fiber ℝ→ℝ identity in degrees 1,2; H¹=H²=0 | as stated | none |
| 5.4 totalization sign | (r,−n),(s,−m) | (−1)^(ns): n=s=1 gives −1 | matches BF line 1542 | none |
| 6.2 pair-fiber map sign | A=A′=ℤ[0], B=0, B′=(ℤ→ℤ), r=f′=h=1 | image of 1: (1,1), D′(1,1)=(0,1−1)=(0,0); with −ha: (1,−1), D′=(0,2) | +ha correct | none |
| 7.1 Moore comparison scope | constant ℤ vs constant S₃ | π₀=ℤ, higher 0; π₀=S₃ nonabelian | abelian hypothesis needed | none |
| 7.4 two-unit cup | x=log|f|, y=log|g| | ∂x−∂̄x=i darg f; x•y=i(log|f| darg g−log|g| darg f) | matches §4.1 witness | none |
| 7.4 divisor vs unit sign | tᵃ on 𝔸¹ | Green −a log|t|; unit class +a log|t|; raw connecting log|t|↦−cl([0]) | consistent across §§2.3, 5.2, 6.2 | none |
| Gaps | gap:smooth-whitney-extension, gap:flat-ideal-regular-situation | Mathlib grep "Whitney" finds only WhitneyEmbedding.lean; no Borel or Łojasiewicz; Burgos94 line 316, 337, 345, 358 | precise, minimal, same slugs in plan.json | none |

Every row's instance agrees with the statement; no Check refutes a theorem of its section; no definition's wrong model (inverse cone arrow, missing J, brutal truncation, analytic sheafification, rational-only product) survives the stated Checks. Each definition has at least three Checks (counts per subsection 3–13), every layer ends with Examples and Dependencies, and every target carries a locator.

## Not verifiable

- Bloch86 §7 (the arbitrary-field universal motivic Chern construction cited in §§2.0b and 2.2) and Beilinson85 §§1–2: settled as uncertified in the manifest; cited by locator only. BF line 974–997 was read for the complex-field construction they stand behind.
- Levine98 (Part I, Chapters II–III, V): settled as waived; it certifies nothing here.
- Levine94 equation (2.1) at line 795: the extraction reads "b < d", while the proof's ladder at line 866 uses the vanishing at weight d of K₁ on the face. Whether the printed inequality is strict or not cannot be decided from the extraction; the README states the version the proof uses (b ≤ c), and its Check at §2.0a computes the sharp case.
- Burgos94: the extraction drops every display formula (Theorem 2.1's inclusion, Proposition 4.1's expression); theorem statements and numbering were verified from the surrounding prose at the cited lines, the formulas from BKK's restatement and the README's own computation.

## Source issues

- **Misprint** in BF at Proposition 1.26, printed p.10: the source displays the associativity homotopy with codomain in degree r+s+t; it should be degree r+s+t−1, as the identity d_Dh+hd_D=associator forces; affects nothing.
- **Gap** in Levine94 at Theorem 3.1 (printed p.276) and Theorem 3.4 (p.283): the source states both for a scheme over an arbitrary field k and proves them through Theorem 2.7, which assumes k infinite; it should add the finite-field reduction by coprime infinite towers used in Lemma 4.3's proof; affects the proof.
