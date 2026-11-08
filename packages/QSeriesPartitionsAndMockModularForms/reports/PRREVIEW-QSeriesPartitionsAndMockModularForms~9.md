# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at 08e719f)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since de862eb (`TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean` lines 32–34, the module docstring's count of the fifth- and seventh-order unary corrections; nothing in the README, nothing outside the folder). The previous R02 is repaired: the docstring's count now agrees with the vectors the README defines. The previous R01 is not repaired and is the only finding; it is P3 and description-only, so nothing in the folder needs to change.

## R01 (P3) — ModularForms §0.2 exists only at the open ModularForms revision, and the description does not name that revision

**Location.** `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` line 832: “*Needs:* TauCetiRoadmap.ModularForms §0.2; Mathlib `ModularForm.eta_ne_zero`, …”; the same id at lines 13, 47, 48, 822, 842, 972 and 1765.

**Claim.** §5.2 consumes the eta transformation, its generator values and the closed forms of ν_eta from ModularForms §0.2.

**Witness.** ModularForms on main (content checkout 723d26b) has no `### 0.` heading. The id is defined only at the open ModularForms revision #1706, head 75cafd52, `TauCetiRoadmap/ModularForms/README.md` line 395 (“### 0.2 The eta transformation and eta quotients”), which names this roadmap as its consumer at line 1541. The description quoted as data at this head lists under “Depends on” #1172, #925, #851, #1314 and #1063 and its merge-order paragraph ends “#1314 (HabiroCyclotomicCompletions) → this pull request”; neither names ModularForms (a search of the description for “ModularForms” and “1706” finds only this roadmap's own name). The overlap index again lists ModularForms §0.2 under “only an open revision defines”.

**Repair.** Leave the README as it is (it cites the roadmap and section, as the house style requires), and in the pull request's description add ModularForms (#1706) to the “Depends on” list and place it before this pull request in the merge-order paragraph. Tested on the instance: #1706 cites this roadmap only as a consumer of §0.2 (its line 1541), so the edge ModularForms → QSeriesPartitionsAndMockModularForms creates no cycle, and the dependency check reports 0 problems with ModularForms on main. Description-only; no file in the folder moves.

## Previous findings

- R01 — not repaired: the description at 08e719f still lists “#1172 … #925 … #851 … #1314 … #1063” under “Depends on” and ends the merge-order chain at “#1314 (HabiroCyclotomicCompletions) → this pull request”; no ModularForms entry (this report's R01).
- R02 — repaired: `Suggested.lean` lines 32–34 now read “with the thirteen unilateral series of §10.3 and the twenty-six unary corrections of §§10.5 and 10.7 in place of f, ω and the three third-order theta series”; the count is verified below and the repair introduced nothing else (the diff is this one word).

## Verified sound

**The changed passage.** The docstring sentence counts the inputs of the deferred fifth- and seventh-order laws. README line 1621 (§10.5) defines G₅,₁ as half a six-component vector whose components carry 2, 2, 4, 4, 4 and 4 terms C(a,b;30τ): twenty terms with twenty distinct characteristic pairs ((1/30,5/2), (11/30,5/2), (13/30,5/2), (23/30,5/2); (19/60,0), (29/60,0), (49/60,0), (59/60,0); (13/60,0), (23/60,0), (43/60,0), (53/60,0); the same eight sixtieths with b = 5/2); G₅,₂ = −G₅,₁ adds no term. README line 1663 (§10.7) defines G₇ with 2 + 2 + 2 = 6 terms C(a,b;21τ) with six distinct pairs. 20 + 6 = 26, as the docstring now says. The thirteen unilateral series of §10.3 (ten fifth-order f₀, f₁, F₀, F₁, φ₀, φ₁, ψ₀, ψ₁, χ₀, χ₁ and three seventh-order A₀, A₁, A₂, README line 1559) are unchanged and correctly counted. The sentence cites §§10.3, 10.5, 10.6, 10.7 and 10.8, all of which exist at the README headings at lines 1557, 1619, 1639, 1661 and 1681. No Lean statement is touched: the diff lies entirely inside the module docstring, so the 37 declarations and their elaborated types are those of the r8 report.

**Gate and build.** This review's own run of `tauceti-roadmap gate … --base origin/main` at 08e719f prints every counter at 0 (`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0); the worker's gate at this head adds `build=0` for the targeted build. `git diff --stat origin/main...HEAD` outside the folder lists nothing (the change set confirms: none).

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. The diff adds no supplier citation.

**Elaboration.** A copy of `Suggested.lean` in the scratch directory was elaborated once with `lake env lean` from the pull-request worktree (Mathlib 6b7abb3c, Tau Ceti a91d3aaf, the manifest pins; the `TauCeti.Analysis.SpecialFunctions.Erf` object file present): seventeen `declaration uses sorry` warnings and nothing else, exit 0. The seventeen sorried theorems are the fifteen of the r7 report plus `thirdOrderCompletion_T` and `thirdOrderCompletion_S`; the padding probe of the r8 report (both new laws fail `first | simp | rfl | infer_instance` with unsolved goals) stands, since no statement changed. No sorry'd data, no `set_option`, imports unchanged (`import Mathlib`, `TauCeti.Analysis.SpecialFunctions.Erf`). None of the 37 declarations uses a section variable, so none can have lost a binder; the worker's `signatures.md` reports 0.

**Citations resolved.** ModularForms §0.2: absent on main (723d26b), present at #1706 head 75cafd52 line 395 (R01). The overlap lead “IntegralLattices §0G only at #1239” is false: main `TauCetiRoadmap/IntegralLattices/README.md` line 568 defines 0G. The citation leads are unchanged from r7 and r8: `BruinierFunke2003, §3` (README line 1167) is a source key, not a roadmap; `QToolkit.pochhammer` (line 69) is HabiroCyclotomicCompletions §1.1's own name. The overlap index lists no open pull request changing this roadmap and no dropped id.

**Sources.** The changed passage cites no source; the fifteen seeded-sample targets are untouched by the diff and were read at their locators in the r7 report, with the §10.2 lines of BringmannOno2006 and Zwegers2002 re-read in the r8 report.

**Headline audit, declared gaps, shape.** Unchanged by the diff: sixteen headlines stated (the fourteen of the r7 report and the two third-order laws), the not-statable ones named in the docstring with their missing carriers, the fifth- and seventh-order laws deferred to the mechanism the third-order vector tests; the three gap slugs (`classical-metaplectic-model`, `analytic-elliptic-regularity`, `vector-bundle-dolbeault`) at README lines 95, 103, 119 with named suppliers and one-sentence needs; every backticked name of the README declared in the Lean (gate `readme-ids-missing=0`).

**Adversarial mathematics.** The one changed statement gets a new row. Rows marked (r8) are carried from the r8 report with the values it computed; rows marked (r7) were carried into r8 from the r7 report with their values. No statement they cover is touched by the diff.

| Statement / object | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| Docstring count of unary corrections in §§10.5 and 10.7 | README lines 1621 and 1663, read term by term | §10.5: components carry 2, 2, 4, 4, 4, 4 terms C(a,b;30τ) = 20, twenty distinct (a,b); G₅,₂ = −G₅,₁ adds 0; §10.7: 2 + 2 + 2 = 6 terms C(a,b;21τ), six distinct (a,b); total 26; competing values: 30 (the previous docstring) would need four more pairs that no component carries, 32 would count G₅,₂'s terms again | Keep: twenty-six is right |
| 10.1 `thirdOrderOmega` coefficients (r8) | formal, q⁰…q¹¹ | 1, 2, 3, 4, 6, 8, 10, 14, 18, 22, 29, 36; ω·(q²;q²)∞ = 1+2q+2q²+2q³+2q⁴+2q⁵+q⁶+…, as the “omega pairing” Check states; BO (2.1) expansion 1/(1−q)² + q⁴/((1−q)²(1−q³)²) + … | Keep |
| 10.2 g-translation identities (Check “third t exchange under the correction”) (r8) | z = 0.2+0.9i | g₀(z+1)/g₂(z) = 0.5000+0.8660i = e(1/6); g₂(z+1)/g₀(z) = 0.5000+0.8660i; g₁(z+1)/g₁(z) = 0.9659+0.2588i = e(1/24); exact: 3(n+1/3)² = 3n²+2n+1/3 gives (−1)ⁿe(1/6), 3(n+1/6)² = 3n²+n+1/12 gives e(1/24) | Keep |
| 10.2 correction transforms by T₃ (r8) | from the identities | rayPeriod g₁ (τ+1) = e(−1/24)·rayPeriod g₁ τ; rayPeriod g₀ (τ+1) = e(−1/6)·rayPeriod g₂ τ, so G₃,₂(τ+1) = −e(−1/6)G₃,₃(τ) = e(1/3)G₃,₃(τ); same for G₃,₃ | Keep: Check is right |
| 10.2 `thirdOrderVector`, `thirdOrderCorrection`, `thirdOrderCompletion` at τ = i (Check “third fixed point”) (r8) | τ = i | F₃ = (1.3016831357, 0.2690404473, 0.2263083242); G₃ = (0.7951171069, −0.2375255814, 0.2263083242); H₃ = (0.5065660287, 0.5065660287, 0.0000000000) | Keep: 0.2263, 0.5066, 1.3017, 0.2690 as stated |
| 10.2 `thirdOrderCompletion_T` (r8) | τ = 0.17+1.1i; i; −0.3+0.8i | H₃(τ+1) = (0.5525235809−0.1737189399i, −0.0731011002−0.0609011005i, −0.2345058393+0.3220508205i) = T₃H₃(τ); residuals 4.6×10⁻¹⁵, 3.0×10⁻¹⁵, 1.7×10⁻¹⁴ | Keep |
| 10.2 `thirdOrderCompletion_S` (r8) | τ = 0.17+1.1i; i; −0.3+0.8i | H₃(−1/τ) = (0.4201232721+0.0122349522i, 0.6066971611−0.0728417389i, 0.0094558586−0.0999339339i) = √(−iτ)S₃H₃(τ); residuals 1.8×10⁻¹⁴, 1.4×10⁻¹⁴, 2.5×10⁻¹⁴ (H₃(−1/(−0.3+0.8i)) = (0.5708231226−0.0610409467i, 0.3072609468+0.0752620868i, −0.0468339435+0.2228138396i)) | Keep |
| 10.2 wrong models of the S law (r8) | τ = 0.17+1.1i; i | root −√(−iτ): residual 1.22, 1.01; H = F₃+G₃: residual 2.14, 2.07; F₃ alone: residual 1.07, 1.03 | Keep: the Check's “order one” is right |
| 10.2 non-diagonal T₃ (Check) (r8) | τ = 0.17+1.1i | H₃ = (0.5786585666−0.0247959850i, 0.3961571115+0.0420626040i, −0.0161913500+0.0937579600i); \|H₃,₂−H₃,₃\| = 0.4156 | Keep |
| 10.2 `rayPeriod` parametrisation (r8) | z = −τ̄+it | dz = i·dt, −i(z+τ) = −i(2i·Im τ + it) = 2·Im τ + t > 0; the factor i and the real root are what the S residuals above test (a dropped i rotates G₃ by a quarter turn and fails S by order one) | Keep |
| 10.2 `thirdOrderG0` junk values (r8) | n < 0 in `(-1 : ℂ) ^ n` (zpow) | (−1)^(−n) = (−1)ⁿ, so the ℤ-indexed alternation is the source's; the cast `(n : ℂ) + 1/3` is exact | Keep |
| 10.2 T and S laws (r7 witness, superseded) (r8) | τ = 0.17+1.1i | r7 Simpson residual 4×10⁻⁹ now 1.8×10⁻¹⁴ with the t = u² substitution | Stated: R02 of r7 repaired |
| 1.2 integer index (sample) (r7) | a=3, q=2, n=−1 (exact) | P₋₁ = 1/(1−3/2) = −2; forbidden a=q=2: factor 1−2/2 = 0, no inverse | Keep; unit hypothesis needed |
| 1.3 regular quotient (r7) | ([3];[1];2), ([3];[2];2) at j=−1 (exact) | (2−1)/(2−3) = −1; (2−2)/(2−3) = 0 although P₋₁(2;2) is a pole | Keep regular quotient |
| 1.5 inversion (sample) (r7) | a=3, q=2, n=2 and j=−1 (exact) | P₂ = (1−3)(1−6) = 10 = 9·2·(2/3)(5/6); j=−1: (−1/3)·2·1/(1−2/3) = −2 = P₋₁ | Keep; j(j−1)/2 exponent |
| 2.2 bilateral j=−1 (sample) (r7) | r=s=1 | Q₋₁(−1)^(0)q⁰z⁻¹ = (q−b)/((q−a)z) | Keep |
| 2.3 large-base radius (sample) (r7) | q=2, a=−1/2, r=1, s=0 | ratio (1−a2ⁿ)/(1−2^(n+1)) → a/2, radius 4 = \|q/a\|; Gasper's \|∏B/∏A\| would give 2 | Keep the README's q factor; source issue |
| 2.3 termination at \|q\|>1 (r7) | q=2, a=1/2 (exact) | P₂(1/2;2) = (1/2)(1−1) = 0, c₁ = (1/2)/(1−2) = −1/2, Φ = 1 − z/2 | Keep |
| 2.3 negative-tail shift (r7) | A=[], B=[0] | Q₋ₙ = 1, t₋ₙ = (−1)ⁿq^(n(n+1)/2)z⁻ⁿ, t₋₁ = −q/z, t₋₂/t₋₁ = −q²/z | Keep |
| 2.3 q=0 unilateral (r7) | e=0; e>0 | Pₙ(a;0) = 1−a for n≥1, so Φ = 1 + Cz/(1−z); for e>0 only n=1 survives, Φ = 1 + (−1)^e Cz | Keep |
| 2.4 `qBinomial` (sample) (r7) | a=.3, q=.2, z=.7 | sum 3.0073063453638, product ratio 3.0073063453649 | Keep |
| 2.4 `qBinomial_largeBase` (r7) | q=2, a=.5, z=.7 (\|az/q\| = .175) | sum 0.6500000000, P(z/q;q⁻¹)/P(az/q;q⁻¹) = 0.6500000000 | Keep |
| 2.4 `euler_qExponential` (r7) | q=.2, z=.7; entire z=2 | 4.0156995292 both; 4.6270225951 both | Keep |
| 2.5 `ramanujanOnePsiOne_hasSum` (r7) | (a,b,q,z) = (.8,.1,.2,.7); b=0; (2,.5,.3,.6) | 1.1892209225 vs 1.1892209225; 0.9663838972 vs 0.9663838972; −0.6482294967 vs −0.6482294967 | Keep; b=0 covered |
| 2.5 negative term (r7) | j=−1 | (b−q)/(a−q)·z⁻¹, equal to (q/b;q)₁/(q/a;q)₁·(b/(az)) after cancelling b/a | Keep |
| 2.6 `baileyPair`, 2.7 `baileyLemma_transform` (sample) (r7) | ℚ exact: a=1/3, q=1/2, ρ₁=3/5, ρ₂=−2/7, α=(1,2,−1/3,5,0,7/2) | β from α; α′, β′ by the displayed formulas; β′ recomputed from α′ by the pair relation: equal in all six indices (β′₁ = 17052/13585) | Keep; the stated transform preserves the relation |
| 3.3 `rogersRamanujan_count` (r7) | n=0…12 | gap-two counts 1,1,1,1,2,2,3,3,4,5,6,7,9 = ±1 mod 5 counts | Keep |
| 3.3 `rogersRamanujan_count_two` (r7) | n=0…12 | 1,0,1,1,1,1,2,2,3,3,4,4,6 on both sides | Keep |
| 3.3 `rogersRamanujan_hasSum` (r7) | q=.2 | 1.2520840054 both; 1.0500833387 both | Keep |
| 3.4 `quintupleProduct_hasSum` (r7) | q=.2, z=.7; z=−1.3+0.4i | 1.0990660555 both; −0.1156366879+0.0841812178i both | Keep sign convention |
| 4.1 `partitionRank`, `partitionCrank` (r7) | (3,2,1,1), (1), (3,3) | (−1,−1), (0,−1), (1,3) as the Checks state | Keep |
| 4.5 `rank_equidistribution_five_seven` (r7) | sizes 4, 9, 14 mod 5; 5, 12 mod 7 | counts [1]×5, [6]×5, [27]×5; [1]×7, [11]×7 | Keep |
| 4.5 `crank_equidistribution_five_seven_eleven` (r7) | sizes 4, 9, 14; 5, 12; 6, 17 | [1]×5, [6]×5, [27]×5; [1]×7, [11]×7; [1]×11, [27]×11 | Keep |
| 4.4a/4.5 no rank-11 law (r7) | size 6 mod 11 | rank counts [1,2,1,1,0,1,1,0,1,1,2] | Keep (negative control) |
| 4.6 offsets (sample) (r7) | 25, 343, 65, 13 (exact) | 24·24 ≡ 1 (25), 24·243 ≡ 1 (343), 24·19 ≡ 1 (65), 19 mod 13 = 6, 24·6 ≡ 1 (13) | Keep |
| 4.8 decimation (sample) (r7) | ℓ=11 | φ = x⁵f(x¹²¹)/f(x) starts x⁵; coefficient of x¹¹ is p(6) = 11, so U₁₁φ starts 11x | Keep |
| 4.8a Watson degree-5 eta equation (r7) | τ = 0.1+0.9i, X = η(τ)/η(τ/5), Y = η(5τ)/η(τ) | polynomial value 1.0×10⁻¹⁴ with \|X\| = 1.41, \|Y\| = 0.39 | Keep |
| 4.8a Watson degree-7 eta equation (r7) | same τ with ℓ=7 | polynomial value 4.6×10⁻¹³ | Keep |
| 4.9 `partition_primePowerCongruences` (sample) (r7) | p(24), p(49) mod 25; p(47) mod 49; p(243) mod 49, 343; p(116) mod 121; p(124) mod 125 | 0, 0; 0; 0 and 245; 0; 0 | Keep ⌊r/2⌋+1 for 7 |
| 5.1 `zwegersOddTheta` = i e^(πiτ/4+πiz) jacobiTheta₂(z+(τ+1)/2, τ) (r7) | τ=.17+1.1i, z=.31−.2i | −0.8764998324+0.2046506273i both | Keep |
| 5.1 zero and derivative (r7) | τ=.17+1.1i; τ=i, z=1/4 | ϑ(0) = 6×10⁻¹⁷; ϑ′(0) = −2.6219290518−0.3451705426i vs −2πη³ = −2.6219290523−0.3451705427i; ϑ(1/4;i) = −0.6435897640 | Keep |
| 5.6 `zwegersMu`, 5.7 `zwegersMuHat` witnesses (r7) | u=1/3, v=1/4, τ=i | μ = −0.8941872843i, μ̂ = −0.7325888912i, as the Checks state | Keep |
| 5.7 `zwegersMuHat_elliptic` (r7) | (k,l,m,n) = (1,0,0,1), (0,1,1,0), (1,1,−1,2), (2,0,1,0) at τ=i | residuals 3×10⁻¹⁷, 4×10⁻¹⁷, 3×10⁻¹⁸, 7×10⁻¹⁸ (values 0.0158290182∓0.0274166638i etc.) | Keep |
| 5.7 `zwegersMuHat_modular` with the eta-quotient multiplier (r7) | S at τ=.3+i; (1 0;1 1) at τ=−.5+i; (2 1;3 2) at τ=−2/3+i (Im γτ = 1/9); −I | both sides 0.2788687532+0.6802428570i; 0.7547571358+0.1157296627i; 1.0786211696+0.6205051890i; −0.1725809428−0.7134868122i; residuals ≤ 2×10⁻¹⁵ | Keep; w²(η(τ)/η(γτ))³ is ν⁻³√w on every branch |
| 5.2 ν_eta values (r7) | T, S, −I, (1 0;1 1), (2 1;3 2) | 0.9659+0.2588i = e^(πi/12); 0.7071−0.7071i = e^(−πi/4); −i; 0.9659−0.2588i = e^(−πi/12); 0.9659−0.2588i; 24th powers 1 | Keep |
| 5.2 §0.2 closed form vs quotient (r7) | (2 1;3 2): s(2,3) = −1/18 exact; (14 3;23 5): s(5,23) = 7/46 | exp(πi((a+d)/(12c)−s−1/4)) = 0.9659−0.2588i and 0.5000−0.8660i, equal to the quotients | Keep (consumed, not restated) |
| 6.1 unary theta (sample) (r7) | a=1/6, b=0 leading term; ξ sign | ν=1/6 gives (1/6)e^(πiτ/36) = (1/6)q^(1/72); ξ_(1/2)C = 2i√y·conj(−i g(a,−b;−τ̄)/√(2y)) = −√2 g(a,b;τ) | Keep |
| 7.2 ordered kernel (sample) (r7) | hyperbolic A, c₁=(1,0), c₂=(0,−1), ν=(1/2,1/2), (1/2,−1/2) | B(c₁,ν) = ν₂, B(c₂,ν) = −ν₁: kernels 1−(−1) = 2 and −1−(−1) = 0; Q(ν) = 1/4 gives 2e(τ/4) | Keep |
| 7.4 S-law constant (r7) | Cor 2.9(5) | i(−iτ)^(r/2)e(B(a,b))/√(−det A) Σ_p θ_(b+p,−a): matches README line 1116 | Keep |
| 8.4a mode functions (r7) | v = e^(−2πBy); second solution | v″+(k/y)v′+((2πkB/y)−4π²B²)v = 4π²B²−2πkB/y+2πkB/y−4π²B² = 0; Wronskian ∝ y^(−k) forces J′ = y^(−k)e^(4πBy) | Keep |
| 8.4a comparison with H_k (r7) | β<0: t = −4πβs | e^(−2πβy)∫_(−4πβy)^∞ e^(−t)t^(−k)dt = −(−4πβ)^(1−k)K_(k,β)(y) | Keep |
| 8.5 central parity (r7) | Z=(−I,i); (I,−1) | F_h = i^(2k)e^(−πiσ/2)F_(−h) = e^(πi(k−σ/2))F_(−h); (I,−1): F = (−1)^(2k)(−1)^σ F | Keep |
| 9.1 components (sample) (r7) | m=1, l=0,1 | n=0,±2: 1+q(e(2z)+e(−2z)); n=±1: q^(1/4)(e(z)+e(−z)); n = l+2mj gives e^(πil²τ/2m+2πilz)·jacobiTheta₂(2mz+lτ, 2mτ) | Keep |
| 9.4 `R_(m,l)` endpoints (sample) (r7) | u=0, l=0 and l=m | pairs ±λ cancel exactly by oddness of E; λ=0 term 1: R_(m,0)(0) = 1, R_(m,m)(0) = 0 | Keep |
| 9.5 coefficient and residue constants (r7) | Theorem 3.9 | −πi on the h_l residue sum and −2πi on the decomposition, as README line 1455 | Keep |
| 10.1 `thirdOrderF_rank` (r7) | q=.2; coefficients | f(.2) = 1.1399164971 = Σ(Σ_p(−1)^rank)qⁿ; coefficients 1,1,−2,3,−3,3 | Keep |
| 10.3 constants (sample) (r7) | q → 0 | f_s, F_s, φ₀, ψ₁, χ_s, A₀, A₂ → 1; φ₁, ψ₀, A₁ → 0; χ₁(0) = 2 + lim φ₁(−q)/q = 2−1 = 1 | Keep |
| 10.3 χ relations from Zagier's matrix (r7) | j=1: χ−2 = 2U−3W, φ(−q) = W, F−1 = U−W; j=2 with √q | χ₀ = 2F₀ − φ₀(−q); χ₁ = 2F₁ + φ₁(−q)/q | Keep |
| 10.6 fifth S matrix (r7) | ((2/√5)M₅)² | diagonal 1 within 2×10⁻¹⁶, off-diagonal 0 | Keep |
| 10.8 seventh S matrix (sample) (r7) | M₇² | identity to 10⁻¹² | Keep |
| 10.8 T phase (sample) (r7) | third component | 143 ≡ −25 mod 168 | Keep |
| Lean `IsGapTwo` (r7) | (2,2), (3,1), (4) | sorted pairwise a+2 ≤ b: false, true, true | Keep |
| Lean zpow junk (r7) | `quintupleProduct_hasSum` with q=0 | q^n for n<0 is 0 in Lean; hypothesis q ≠ 0 present; n(3n−1) always even, so the ℤ-division is exact | Keep |

1 new row, keep; 62 rows carried from the r8 report with their values.

## Not verifiable

- GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified; none is cited by the changed passage.
- Ownership against open pull requests whose files this brief does not give was not checked; the diff states no construction.

## Source issues

- none
