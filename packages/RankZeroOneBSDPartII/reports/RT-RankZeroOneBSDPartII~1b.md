<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1744#issuecomment-6400345831 -->
Red team round 1 pass b (claude) of 07fd530

Verdict: needs changes

1. **F01** (P1) The base roadmap `RankZeroOneBSD` exists nowhere

   **Location:** `packages/RankZeroOneBSDPartII/README.md:7`: "This is the Eisenstein-converse continuation of RankZeroOneBSD: the base direction stops at the forward low-analytic-rank theorem and the Iwasawa equalities"; also the title and Summary (lines 1, 3) present the roadmap as "part II" of that base.

   **Claim:** The README cites a roadmap `RankZeroOneBSD` as the base whose stopping point this roadmap continues from.

   **Witness:** No folder `TauCetiRoadmap/RankZeroOneBSD` or `Completed/RankZeroOneBSD` on main (7922565); `roadmaps list` over the 363 open roadmap pull requests has no `RankZeroOneBSD`; the board's `packages/` has no such package; `merge-order/ORDER.txt` does not list it. The package report itself records the absence. Every other roadmap that mentions the name (NeronModelsAndSemistableAbelianVarieties, EllipticCurveModularity, MetaplecticAutomorphicForms) names it as a consumer, never as a folder.

   **Repair:** Replace the first sentence of line 7 by: "No base roadmap `RankZeroOneBSD` exists on main or in an open pull request; the forward low-analytic-rank theorem and root-number parity this roadmap starts from are ArithmeticStatisticsPartVI's supporting targets, and the anticyclotomic Iwasawa equalities are HeegnerPointEulerSystems Layer 8b's. The new implication starts from Selmer corank." Keep the folder name (an intake matter), but do not describe a stopping point of a roadmap that cannot be read. (The design READMEs of CMRankZeroConverse and RankOneConverse carry the same "Part II" title; this finding is only about this package's README.)

2. **F02** (P2) The local-twist table of §4.2 is cited to ArithmeticStatisticsPartVII §5.10, which does not state it

   **Location:** `packages/RankZeroOneBSDPartII/README.md:101`: "for every ℓ≠3 a local twist with ratio 1 is needed, including ℓ=2 … The required instances of the latter local table are part of this local-ratio contract"; `README.md:374`: "At each bad prime ℓ≠3 choose a local twist with c_ℓ=1 by BKLOS Proposition 10.7"; `README.md:383`: "*Needs:* … ArithmeticStatisticsPartVII §5.10 local Selmer ratios and stratum density".

   **Claim:** §5.10 of ArithmeticStatisticsPartVII supplies, for every prime ℓ≠3 (including ℓ=2), a local squareclass at ℓ with c_ℓ(ι^d)=1.

   **Witness:** ArithmeticStatisticsPartVII at #1178 (cbcd49e), §5.10 (lines 1288–1522) has the targets "Selmer ratio of an isogeny", "Local selmer ratio via tamagawa numbers", "Tamagawa ratio under potentially good reduction" (which gives c_v=1 only when some twist is good at v), "Selmer ratio classes are locally defined", the parity theorem and the two restricted bounds; none asserts the existence of a ratio-one twist at a potentially multiplicative or dyadic prime. That statement is §5.32 "Abelian three-isogeny twist applications", target "Attainable local three-isogeny ratios" (line 2336): for every 3-isogeny over a finite extension of ℚ_p with p≠3, including p=2, some quadratic twist has c(φ_s)=1 (cites BKLOS Propositions 10.4, 10.6–10.7, Theorem 10.5).

   **Repair:** In line 101 replace "The required instances of the latter local table are part of this local-ratio contract." by "The ratio-one local twist at every ℓ≠3, including ℓ=2, is Part VII §5.32 'Attainable local three-isogeny ratios'." In line 383 add "ArithmeticStatisticsPartVII §5.32 'Attainable local three-isogeny ratios'" to the Needs line, and name §5.32 in the heading paragraph of the Part VII supplier contract.

3. **F03** (P3) ArithmeticStatisticsPartI section numbers do not match the cited targets

   **Location:** `packages/RankZeroOneBSDPartII/README.md:91`: "§0.5 'Quadratic twist squareclass family', 'Family defined by local conditions', 'Positive squareclass denominator' and 'Squarefree integers in residue classes'"; the same "§0.5" attributions at lines 366, 383, 400, 416, 472.

   **Claim:** All four named targets are in §0.5 of ArithmeticStatisticsPartI.

   **Witness:** ArithmeticStatisticsPartI at #1171 (3b1a24f): "Family defined by local conditions" is in §0.2 "Local specifications and acceptable weights" (line 463); "Squarefree integers in residue classes" is in §0.6 "Squarefree integer denominators" (line 1241); "Positive squareclass denominator" is in §0.15 "Restricted radicands and squareclass denominators" (line 1951). Only "Quadratic twist squareclass family" (line 1119) is in §0.5 (lines 1031–1181). §0.1's "Relative density" and "Relative density is multiplicative in towers" (lines 259, 319) are correctly placed.

   **Repair:** Line 91: "Use §0.1 'Relative density' and 'Relative density is multiplicative in towers', §0.2 'Family defined by local conditions', §0.5 'Quadratic twist squareclass family', §0.6 'Squarefree integers in residue classes' and §0.15 'Positive squareclass denominator'." Lines 383 and 400: "ArithmeticStatisticsPartI §0.15 positive squareclass denominator"; line 472: "ArithmeticStatisticsPartI §0.6 squarefree residue counts and §0.1 density"; line 366 and 416 keep §0.5 for the squareclass family.

4. **F04** (P3) GrossZagierAndArithmeticHeights §8.17 carries a squarefree-conductor hypothesis the README says is not imposed

   **Location:** `packages/RankZeroOneBSDPartII/README.md:87`: "No squarefree-conductor restriction is imposed by this specialization"; `README.md:267`: "*Needs:* … GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.17–8.19".

   **Claim:** The cited Gross–Zagier sections give the X₀(N) formula for the trace point with no squarefree restriction on N.

   **Witness:** GrossZagierAndArithmeticHeights at #1487 (4c1d51f), §8.17 (line 5064) assumes "(sqf) N squarefree" and "(sgn) ε(f,K)=−1"; §8.18 (line 5092) is the GL(2)-type non-torsion criterion with an admissible order and "(N, D) = 1". The squarefree-free elliptic statement over ℚ is §8.19 (line 5106): for E/ℚ of conductor N, f:X₀(N)→E, c=1, χ=1, L'(1,E,1)=2^(−μ(N,D))·‖ω₀‖²ĥ_K(P_K(f))/(C²u²√|D|) under CST's Heegner conditions, with ĥ_K the K-relative x-height; §8.14 is the general Cai–Shu–Tian formula.

   **Repair:** Line 267: cite "GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.19" and in line 87 say "§8.19's X₀(N) specialization (§8.17 is not used: its (sqf) hypothesis is not available here)".

5. **F05** (P3) `no_good_three_twist` is a worked example on one curve, not a headline

   **Location:** `packages/RankZeroOneBSDPartII/Suggested.lean:38-51`: `def scopeObstructionCurve : WeierstrassCurve ℚ` with coefficients (1,0,3,0,0) and `theorem no_good_three_twist (d : ℚ_[3]) (hd : d ≠ 0) : ¬ … .HasGoodReduction ℤ_[3]`.

   **Claim:** The file states a headline theorem of the roadmap.

   **Witness:** The statement is the §5.3 scope diagnostic: v₃(j)=−3 for j=(−71)³/(−2160)=357911/2160 (recomputed: b₂=1, b₄=3, b₆=9, b₈=0, Δ=−216−2187+243=−2160, c₄=1−72=−71), j is twist- and model-invariant (`j_quadraticTwistOf`), and a good minimal model has unit Δ and integral c₄. It is a value computation on one explicit curve, treating the boundary case of the §4.4 hypothesis; the README itself files Layer 5 under "scope diagnostics" and says "Model invariant computations and API checks belong to README.md". The thirteen actual headlines are, as the module docstring says, not statable at the pins.

   **Repair:** Delete `scopeObstructionCurve` and `no_good_three_twist` from `Suggested.lean`; replace the last docstring paragraph by "The local good-reduction obstruction of §5.3 is a worked example and is kept in README.md; no headline theorem is statable at the pins." The README §5.3 keeps the statement, and line 502 ("The headline `no_good_three_twist` …") becomes "The obstruction states the local form for every d∈ℚ₃ with d≠0: …" without the backticked name.

6. **F06** (P3) A §4.1 Check is worded so that its own fourth Check contradicts it

   **Location:** `packages/RankZeroOneBSDPartII/README.md:358`: "For good ordinary E at 3 with rational isogeny kernel, local classes represented by 1,2,3,6 have exactly the class 2 admissible".

   **Claim:** For a good ordinary E with a rational 3-isogeny, the admissible local class is 2.

   **Witness:** Every rational isogeny has a rational (Galois-stable) kernel; with kernel character φ|G₃=η (nontrivial unramified), line 361's Check says the identity class is admissible and class 2 is excluded. The Check at line 358 is only true when the kernel is generated by a rational 3-torsion point (φ=1 locally): then 1 fails the exclusion, 2 gives η, 3 and 6 give bad reduction.

   **Repair:** Line 358: "For good ordinary E at 3 whose isogeny kernel is generated by a rational point of order 3 (φ|G₃=1), local classes represented by 1,2,3,6 have exactly the class 2 admissible: …".

## Verified sound

Declarations read: 2 of 2 (`scopeObstructionCurve`, `no_good_three_twist`), with their README statements (§5.3 and line 502). Targets read: all 17 (§§0.1–0.2, 1.1–1.2, 2.1–2.3, 3.1–3.3, 4.1–4.4, 5.1–5.3) and every API bullet and Check. Locators verified in the cached texts: CGLS 14 (standing hypotheses line 79, Conjecture B and (disc) lines 121–154, (Sel) line 179, Theorem E line 219, Corollary 3.4.2 line 1847, (4.4)–(4.5) lines 1939–1958, Corollary 4.2.3 line 2001, Theorem 5.2.1 and conditions (a)–(d′) lines 2145–2187, Corollary 5.2.2 line 2191, Corollary 5.2.3 line 2198, Remark 5.2.4 line 2206, page numbers of §§3.4, 4.1, 4.2, 5.2 in the table of contents); BKLOS 9 (lines 94, 156–163, 166–186, 643–661, 674, 713, 764, 800–806; page markers 4, 14–18); PS 5 (lines 64, 132, 425, 456–461, 474, 510; pages 10–12). Checks tested: 22, all passing (values below). Sibling citations checked at the heads the brief gives: SelmerIwasawaCohomology §§2.6, 2.9–2.12a, 3.9–3.11, 4.26, 4.28, 4.29 (§4.29 states elliptic alternation, divisible radicals and the reduced primary product T×T; §4.28 states `selmerParity_quadraticTwist`); HeegnerPointEulerSystems §§8.5, 8.6, 8.6a, 8.13 (the (4.5) constants u_Kα²(β−1)² verbatim), 8.24, 8.31, 8.32, 8.34, 8b.2, 8b.10; GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.17–8.19; ModularIwasawaMainConjectures §6.1; EllipticCurveModularity Layers R29.3–R29.6 (R29.6 has no quadratic base-change factorization, so the declared gap is justified); ArithmeticStatisticsPartVI "Heegner logarithm and low rank" and "Elliptic p-parity"; ArithmeticStatisticsPartVII §5.10 targets (all six named ones present, bounds 1/2 and 5/6 on r₃=dim Sel₃−dim E(F)[3]); ArithmeticStatisticsPartIII "Windowed cubic counting contract" (anchor support-coregular-count); CMRankZeroConverse C.0 "Rank-r p-converse" and RankOneConverse PC.0–PC.6 (board designs); EllipticCurves Layers 1, 2, 4, 5, 7, ModularForms Layer 7, PadicMeasuresIwasawaAlgebras Layer 4 on main. Pinned declarations found at Mathlib 6b7abb3c / Tau Ceti a91d3aa: `WeierstrassCurve.minimal` (Reduction.lean:299, returns a curve over K), `HasGoodReduction` (:323, IsMinimal plus valuation of Δ equal to 1), `hasGoodReduction_iff_isElliptic_reduction` (:328), `NumberField.finite_setOfPred_logHeight₁_le` (Height/NumberField.lean:431), `WeierstrassCurve.Affine.finite_naiveHeight_le` (Height/EllipticCurve.lean:116), `WeierstrassCurve.LSeries` (LFunction.lean:84), `ContinuousCohomology.tateShafarevich` (Sha.lean:71), `TauCeti.Isogeny` (Isogeny/Basic.lean:139), `quadraticTwistOf`, `Δ_quadraticTwistOf`, `isElliptic_quadraticTwistOf_iff`, `j_quadraticTwistOf` (QuadraticTwist/Basic.lean:169, 239, 299, 306), `Point.canonicalHeight_nonneg` and `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` (CanonicalHeight/Basic.lean:260, 332, the latter with `[Northcott (Point.canonicalHeight)]` as the README says). Merge order: this roadmap is at position 283, every cited supplier is earlier (SelmerIwasawaCohomology 59, ArithmeticStatisticsPartI 121, PartIII 125, PartVI 156, PartVII 157, EllipticCurveModularity 186, GrossZagierAndArithmeticHeights 226, ModularIwasawaMainConjectures 250, HeegnerPointEulerSystems 251, RankOneConverse 252, CMRankZeroConverse 282); EllipticCurves, ModularForms, PadicMeasuresIwasawaAlgebras are on main. Dependency check output: `depcheck: 53 roadmaps, 599 edges, 0 problem(s)`. The five declared gaps have named suppliers, the same slugs in `design/plan.json` and the README, single-sentence needs, and none asks for what a supplier already states (R29.6 lacks the factorization; §5.10 lacks the CGLS ordinary control; ArithmeticStatisticsPartVI's low-rank target proves only the value branch inside a deduction, not a stated two-branch theorem with prescribed splitting). Policy: no `lemma`, no `set_option`, no pull-request numbers or process words, every target has a locator, both Lean names appear once in the README, the diff touches only the package folder.

Adversarial table (statement; instances; values; result):

- Conventions, local characters at p=3: φ=η with η(Frob)=−1, η|I=1; ψ=ωη has ψ|I=ω|I≠1; φψ=η²ω=ω. φ=1 or ω fails. Exclusion is symmetric: φ∉{1,ω} iff ψ=ωφ⁻¹∉{ω,1}. Pass.
- Conventions, exclusion equals a_p≢1: étale kernel gives φ|G_p=ε unramified with ε(Frob)=a_p mod p, so φ≠1 iff a_p≢1; connected kernel gives φ=ωε⁻¹, φ≠ω iff a_p≢1. Both cases give E(ℚ_p)[p]=0 and α−1 a unit. Pass (so §2.2's "α−1 is a unit" holds).
- Conventions, projectors: (1±c)/2 on c=±1 give (1,0),(0,1); at p=2 not integral. Pass.
- Conventions, Λ=ℤ₃⟦T⟧: γ⁻¹−1=(1+T)⁻¹−1=−T/(1+T), order 1 at T=0. Pass.
- Conventions, heights: h_(O)(P)=1, h_(O)(2P)=4 give h_x=2,8 and B_x(P,P)=(8−2−2)/2=2=h_x(P). Pass.
- Conventions, local masses at 3: squarefree coprime to 3 has proportion (1−1/3)/(1−1/9)=3/4, split equally over residues 1 and 2 (3/8 each); 3|d has 1/4, split over d/3≡1,2 (1/8 each); sum 1. Pass.
- §0.2: 0→E(ℚ)[p∞]/p→Sel_p→Sel_{p∞}[p]→0, so E(ℚ)[p]=0 gives the isomorphism; Sel/Sel_div≅Ш[p∞]/Ш_div (the preimage of a divisible subgroup under a surjection with divisible kernel is divisible); T×T gives dim(T×T)[p]=2 dim T[p]; (c,s)=(0,0),(1,0),(1,1) give dimensions 0,1,3; r=c+2s with r≤1 forces s=0. ℤ/9: B(a,b)=abB(1,1)=0 for every alternating form. Pass.
- §1.1 signs: Heegner hypothesis gives w(E/K)=−1=w(E)w(E^K); r=1: w(E)=−1, w(E^K)=+1, value branch; r=0: w(E)=+1, w(E^K)=−1, derivative branch; matches CGLS (d) and (d′). 2 split forces D≡1 mod 8, odd. Pass.
- §1.2: coranks 0+1 and 1+0; K_v=ℚ_p at v|p so E(K_v)[p]=E(ℚ_p)[p]=0. Pass.
- §2.1: R=ℚ₃⟦T⟧: R/TR has dimension 1, R⊕R/(T) has 2; X∼Λ⊕M⊕M with corank one forces no elementary divisor of M divisible by T, matching CGLS Corollary 3.4.2. Pass.
- §2.2: trace of (1−α⁻¹σ_v)(1−α⁻¹σ_v̄)P[1]/u_K over Gal(K[1]/K) is u_K⁻¹(1−α⁻¹)²P_K; for a₃=2: X²−2X+3 has unit root α≡5 mod 9 (25−10+3=18), β=2−5≡6; α⁻¹≡2, (1−α⁻¹)²≡1, α²(β−1)²=625≡4 mod 9; u_K=1 for D<−4. Pass.
- §2.3: the converse needs char(S/Λκ∞)² ⊆ char(X_tors) at P₀, i.e. the main-conjecture equality, not the Euler-system divisibility of HeegnerPointEulerSystems §8.34 alone; the README correctly imports the equality (§8b.10, CGLS Corollary 4.2.3 with (Sel)). κ=T in S=R: tower class nonzero, bottom zero, (T²)≠(1). Pass.
- §3.1: 1−(1−r)=r for r=0,1; r=2 gives junk 1−2=0 in ℕ, hence the restriction. Pass.
- §4.1: A₃ depends only on the class of d in ℚ₃ˣ/ℚ₃ˣ² (order 4); good ordinary with φ|G₃=1: classes (1,2,3,6) give (no,yes,no,no); with φ|G₃=η: (yes,no,no,no); with ω or ωη symmetric; v₃(j)<0: all no. (E^{d₀})^d=E^{d₀d}. Pass.
- §4.2 ratios: c₃=1 (étale kernel) or 3 (connected, φ'(0) of valuation 1); c_∞=1 or 1/3 by whether y(P)² is positive, which the sign of d flips (P has order 3, so the cubic value is nonzero); products (1,1/3) and (3,1) give m=0,−1 and m=1,0. Pass.
- §4.3: even X≥0 with E X≤1 gives P(X=0)≥1/2; odd X≥1 with E X≤4/3 gives 3−2q≤4/3, q≥5/6; masses 1/8, 1/4 give 1/16, 5/24. BKLOS Theorem 2.5 line 159 matches. Pass.
- §4.4 and BKLOS Theorem 2.6(i): T₀ and T₁ are nonempty for every rational 3-isogeny, so the good-at-3-twist hypothesis is needed only for A₃≠∅. Pass.
- §5.1: b₂=4, b₄=2, b₆=1, b₈=0; Δ=−64−27+72=−19; c₄=16−48=−32; c₆=−64+288−216=8; j=32768/19. Mod 3: x=0,1,2 give 2,2,1 affine solutions, 6 points, a₃=−2≡1 mod 3 (so α≡1 and E itself is excluded). Tangent at (0,0): F_x=−1, F_y=1, y=x, residual x³. Twist (0,−2): (4·2)⁶=8⁶. Pass.
- §5.2: a₃(E^d)=−a₃=2 for d≡2 mod 3; admissible iff d unit nonsquare at 3 iff d≡2 mod 3; density 3/8; 3/8=0.375<0.4166=5/12. LMFDB confirms "19.a3 = Cremona 19a3 = [0,1,1,1,0]" with torsion ℤ/3, so the label in CGLS and BKLOS is not a misprint. Pass.
- §5.3: tangent at (0,0) on y²+xy+3y=x³ is y=0 (F_x=0, F_y=3), residual −x³; Δ=−2160=2⁴·3³·5; c₆=−1+108−1944=−1837; v₃(357911)=0 (digit sum 26); raw twist discriminant valuations 3 (d=1) and 9 (d=3). Pass.
- Lean statement truth: for d≠0 in ℚ₃, 4d is a unit times d, the twist is elliptic, its minimal model has the same j with v₃(j)=−3, and a unit discriminant with integral c₄ would force v₃(j)≥0. True as typed; `minimal ℤ_[3]` and `HasGoodReduction ℤ_[3]` take the DVR explicitly and the curve over ℚ₃, as the pinned signatures require. Pass.

## Not verifiable

- Elaboration: no Lean command is permitted in this job; `#check` of the two declarations and the instances `IsFractionRing ℤ_[3] ℚ_[3]`, `IsDiscreteValuationRing ℤ_[3]` were not run ("not built"). The package report states the file elaborated at the pins.
- The CGLS standing-hypothesis pages 517–521 and §5.1 (control theorem, Gross–Zagier formulae) were read in the cached text; the Perrin-Riou and Howard originals cited inside CGLS Remark 4.1.3 and HeegnerPointEulerSystems §8.13 were not opened (HeegnerPointEulerSystems is their owner).
- BKLOS Propositions 10.4, 10.6 and Tables 1–3 (lines 722–762) were not checked line by line; only Proposition 10.7 (line 764) and the Theorem 2.6 proof (line 800) were read, which suffice for §4.2.
- Ownership against open pull requests whose files the brief does not give (other than the 363 indexed heads searched through `roadmaps grep` for `RankZeroOneBSD`, Eisenstein converse, three-isogeny twist proportions) was not checked beyond that index.
- Whether the ArithmeticStatisticsPartVI target "Heegner logarithm and low rank" exports its auxiliary-twist existence as a usable statement with prescribed splitting cannot be decided from its text; the declared gap is kept.

## Source issues

- **Gap** in CGLS at Corollary 5.2.3 proof, printed page 575: the source says the local character condition is arranged by a quadratic twist and then applies Corollary 5.2.2; it should be noted that Corollary 5.2.2 needs good reduction at 3, which no twist of y²+xy+3y=x³ (v₃(j)=−3, rational flex (0,0)) has; affects the proof.
- **Gap** in CGLS at Remark 5.2.4, printed page 575: the source says Corollary 5.2.2 and BKLOS give at least 41.6% of twists of 19a3 with analytic and algebraic rank 1; it should restrict to twists satisfying the corollary's hypotheses, which are exactly d≡2 mod 3, of density 3/8=37.5%; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "07fd530", "job": "RT-RankZeroOneBSDPartII~1b", "model": "fable", "worker": "fable-rt51"} -->
