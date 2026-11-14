<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15109#issuecomment-6875867729 -->
Review (codex) of 5fca6b3

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Unnormalized simplicial chains are neither cellular nor bounded by dimension

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:205`, `:1124`, `:1698`; plan targets 5.4 and 8.8. The contract expressly chooses “the unnormalized simplicial chains”; the proof later asserts “the chains vanishing above the dimension of X”.

   **Claim:** The chosen chains identify with the cellular chains on nondegenerate simplices and vanish above the nondegenerate dimension. These assertions supply the finite-length complexes used in Smith theory and the denominator proof.

   **Witness:** For X = Δ[0] over ℤ, `SSet.chainComplex` has C_n = ℤ for every n, with d₁ = 0 and d₂ = id. Cellular chains have N₀ = ℤ and N_n = 0 for n > 0.

   At the pin, `Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:44` uses the alternating-face-map complex; `:67` defines `SSet.chainComplex`, and `:106` gives the coproduct over all simplices. Brown's argument uses the **normalized** complex (Brown1974 line 302, printed p. 235). A homotopy equivalence does not make the unnormalized complex bounded.

   **Exact repair:** Keep `SSet.homology` as the homology carrier, but explicitly use the complex on nondegenerate simplices for the cellular identification in 5.4 and every bounded-chain argument in 8.8. Import the existing normalization: `SSet.splitting` in `Mathlib/AlgebraicTopology/SimplicialSet/Splitting.lean:35`, and `CategoryTheory.SimplicialObject.Splitting.nondegComplex` / `.homotopyEquivNondegComplex` in `Mathlib/AlgebraicTopology/DoldKan/SplitSimplicialObject.lean:164` / `:294`. State the required equivariance and compatibility with fixed subcomplexes and relative orbit complexes in this application; do not rebuild generic normalization. Synchronize the contracts and plan prerequisites. Suggested replacement for the two false assertions: “The normalized chains of W identify with the lifted cellular chains. The natural normalization comparison identifies their homology with `SSet.homology`.” And: “Use normalized chains, which vanish above the dimension of X.”

   **Repair test:** For Δ[0], N₀ = ℤ and N_{>0} = 0, while the comparison still gives H₀ = ℤ and H_{>0} = 0. Thus both the cellular identification and the finite-length input become true. Add this as a negative control against using unnormalized chains.

2. **F02** (P2) The plan omits finite total homology in the p-group fixed-point theorem

   **Location:** `packages/FinitenessAndDualityOfGroups/design/plan.json:2045`, hypotheses at `:2046`: “(b) G a p-group ⇒ every X^H has finite total mod-p homology”.

   **Claim:** Finite dimensionality of X alone forces finiteness of the homology of all fixed-point simplicial sets. The finite-total-homology assumption occurs inside clause (a), not in the standing hypotheses or clause (b).

   **Witness:** Let C₂ act trivially on the discrete simplicial set ℕ. Its nondegenerate dimension is zero, but H₀(X^{C₂}; 𝔽₂) = 𝔽₂^(ℕ), of infinite dimension; H_i = 0 for i > 0.

   **Exact repair:** Make clause (b) read: “If G is a finite p-group and Σ_i dim H_i(X; 𝔽_p) is finite, then every X^H has finite total mod-p homology.” Record the same clause-specific hypothesis in the hypotheses list. This matches `packages/FinitenessAndDualityOfGroups/design/README.md:1684` and Brown1974 lines 327–333, printed p. 236. Add the infinite discrete set as a negative control.

   **Repair test:** The counterexample has infinite input H₀ and is excluded. A point has total dimension 1 on both sides; reflection of a circle has total input dimension 2 and total fixed-point dimension 2.

3. **F03** (P2) The plan's largest-nonzero-degree characterization fails over the zero ring

   **Location:** `packages/FinitenessAndDualityOfGroups/design/plan.json:426`: “if cd_R G < ⊤ it is the largest k with H^k(G, F) ≠ 0 for some free F”. The nontriviality assumption at `:429` is expressly limited to the last clause.

   **Claim:** Finite cohomological dimension always has a nonzero cohomology witness with free coefficients, including over the zero ring.

   **Witness:** R = 0 and G = 1 give cd_R G = 0 < ⊤, but every module and every cohomology group is zero. The set of witnessing degrees is empty and has no largest member.

   **Exact repair:** Replace this clause with the README's statement at `packages/FinitenessAndDualityOfGroups/design/README.md:707`: for n ∈ ℕ, if cd_R G is finite and H^k(G,F) = 0 for every free RG-module F and every k > n, then cd_R G ≤ n. Preserve the separate nontrivial-R hypothesis for the last, regular-coefficient characterization. Add the zero-ring instance to this target's Checks. Also synchronize the nonzero-R guards of the plan's dimension Checks in 2.4 (line 526) and 2.6 (line 601) with the README; their unqualified equalities cd_R ℤⁿ = n and cd_R(ℤ ∗ ℤ) = 1 have the same counterexample.

   **Repair test:** For R = 0 the revised implication says 0 ≤ n, which is true, without asserting a nonexistent nonzero group. For R ≠ 0 and G = ℤ², H²(G,RG) = R ≠ 0 and cd_R G = 2 as before.

4. **F04** (P2) The generic spectral-sequence Euler identity is already owned

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1621`, target 8.6(a): “for a convergent first-quadrant spectral sequence of vector spaces”. The paragraph plans the general Euler identity itself.

   **Claim:** This roadmap owns the finite-support spectral-sequence Euler identity, in addition to its group-extension application.

   **Witness:** Open pull request #2302, `TauCetiRoadmap/SpectralSequencesAndConvergence/README.md:818`, §3.4, already states the Euler identity for a finitely supported page and finite abutment filtrations, with any additive invariant on a weak Serre class.

   I read that head, including its hypotheses and the proof using page invariance and finite filtrations. Taking the finite-dimensional K-spaces as the weak Serre class, v = dimension, and r = 2 gives exactly 8.6(a). SpectralSequencesAndConvergence is a new-roadmap supplier earlier in the merge order; this is not reliance on an open revision of a main roadmap.

   **Exact repair:** Remove ownership of 8.6(a) from the README and plan. Add SpectralSequencesAndConvergence §3.4 to Scope and ownership, Exact supplier contracts and the prerequisites of the extension argument; use its Euler identity in 8.6 and where needed in 8.7. Keep the group-extension theorem, its route through CohomologyOfGroups §6.2, and the identifier 8.6. Add the supplier to the plan. Do not replace or duplicate the supplier's generic statement.

   **Repair test:** For F₂ × F₃, the E₂ total-degree dimensions are (1,5,6). The supplied identity gives 1 − 5 + 6 = 2, and the retained group theorem gives (−1)(−2) = 2. The same proof input is available without a second owner.

5. **F05** (P3) A plan hypothesis names a nonexistent pinned predicate

   **Location:** `packages/FinitenessAndDualityOfGroups/design/plan.json:763`: “Monoid.IsTorsionFree G”.

   **Claim:** This is the pinned predicate to express Serre's torsion-free hypothesis.

   **Witness:** `Mathlib/Algebra/Group/Monoid.lean:552` declares `IsMulTorsionFree`. Searches of both pinned libraries find `Monoid.IsTorsionFree` only in stale documentation at `Mathlib/GroupTheory/Torsion.lean:23`, not as a declaration or alias.

   **Exact repair:** Replace the plan hypothesis with `[IsMulTorsionFree G]`, keeping `[Group G]` in scope. Use that name in the eventual signature. Do not introduce a replacement definition.

   **Repair test:** Multiplicative ℤ satisfies this predicate; C₂ fails it since s² = 1² with s ≠ 1 and s commuting with 1. The mathematical torsion-free boundary of 3.2 is unchanged. This was checked by reading the class, not by elaboration.

6. **F06** (P3) The Brown introduction is not a locator for either trace definition

   **Location:** `packages/FinitenessAndDualityOfGroups/design/README.md:1383` and `:1557`; corresponding locators in `packages/FinitenessAndDualityOfGroups/design/plan.json:1507` and `:1813`: “Brown1974 lines 81–86”.

   **Claim:** These lines support the conjugacy-class Hattori–Stallings rank and the alternating identity-class-rank definition of the naive Euler characteristic.

   **Witness:** Brown1974 lines 81–86, printed p. 230, announce a formula for the difference of two Euler characteristics. They give neither the conjugacy-class trace construction nor the alternating projective-rank definition.

   **Exact repair:** In 7.1 remove this locator, retaining BrownGTM87 §IX.2 and the exact EtaleCohomologyFoundations §F.10.3 trace contract. In 8.3 write: “For a finite projective resolution P of the trivial ℤG-module, define χ̃(G) by the alternating sum of the identity-class coefficients of the ranks of 7.1. Independence follows from Schanuel's theorem and additivity in 7.1.” Attribute the rank input to 7.1/BrownGTM87 §IX.2, rather than certifying it with Brown's introductory announcement. Synchronize both plan locators. The introductory lines may remain only as explicitly labelled context, not as a definition locator.

   **Repair test:** For the trivial group the length-zero resolution gives χ̃ = 1; for ℤ the two free terms give 1 − 1 = 0. The mathematics is unchanged, and the citation now says exactly what was and was not verified.

Six findings: one P1, three P2 and two P3. The general denominator theorem is restored, and ten previous findings are repaired. Its new proof inputs still confuse normalized and unnormalized chains. Two statements in the plan are stronger than the README, and the generic spectral-sequence Euler identity has another owner. This is a design review; no design files or source entries were changed.

## Verified sound

### Previous findings, checked before the new audit

The previous report has computed rows for all 49 original targets. I used those rows only for unchanged statements, reread all 51 present target statements and their APIs/Checks, and recomputed the seeded sample, headline results and every changed mathematical passage. No previous finding was marked “not actionable in this package”. The following quotations are from the repaired README, not from the repair report.

| Previous finding | Status and repaired passage | Independent verification |
|---|---|---|
| F01, general denominator theorem | Partly repaired. At line 1742: “if G has finite homological type (4.4)”. §§5.4 and 8.8 now supply the general route. | The action/cocompactness restriction is gone. Brown1974 lines 607–610 has this scope. New R01–R02 concern the replacement inputs, not a demand to restore the former restriction. |
| F02, projective trace | Repaired. Line 1411: “χ_P(g) = LinearMap.projectiveTrace R P (g · −)”. | For R = ℚ×ℚ and P = R(1,0), both sides are (1,0); the old free trace is 0. The C₃ test distinguishes g⁻¹ from g. |
| F03, wrong cokernel action | Repaired. §6.2: “a ↦ ((s_i − 1)a)_i”. | δ(at) = δ(a)t. The former map would require ts = st in the rank-two free group. |
| F04, missing Hausdorffness | Repaired. Line 1329: “compact connected Hausdorff (T2Space M)”. | ChartedSpace and IsManifold alone do not include T2. Compactness supplies σ-compactness for second countability; the doubled-point circle is excluded. |
| F05, equivariant splitting | Repaired. Line 322: “split after forgetting the G-action (split over k)”. | In the ℤ-line sequence, the chosen section sends 1 to [0], while translation sends it to [1]. |
| F06, resolution degree zero | Repaired. §1.4: “terms RG, (RG)², 0 in degrees 0, 1, 2”. | For F₂, C₀ has infinite abelian rank and the augmentation target has rank one. |
| F07, trivial finite group | Repaired. Line 1572: “For a nontrivial finite group χ̃ is not defined”. | χ̃(1) = 1; C₂ has χ_ℚ = 1, χ = 1/2 and no finite integral projective resolution. Layer 1 now includes the nonzero coefficient qualification. |
| F08, sign and rank-zero controls | Repaired. Line 888: “When 2 ≠ 0 in R”. Layer 6 says “finite positive rank”. | The unsigned swap defect is 2(y⊗x − x⊗y), zero in characteristic two. F₀ has dimension zero; F₁ and F₂ have dimension one. |
| F09, unverifiable Bieri locators | Repaired. §6.3 says “over R the route below, with R-flatness in place of torsion-freeness, is the proof”. | All seven substitutions explicitly distinguish the integral source from the general-ring argument. No Bieri1981 citation remains; no settled source request was reopened. |
| F10, finite-free versus projective | Repaired. Line 230: “a possibly unbounded resolution”, with finitely generated free terms and projective syzygy. | The projective syzygy supplies a bounded projective resolution. ℚ over ℚ[C₂] is projective, but a finite finite-free resolution would give odd dimension as an alternating sum of even dimensions. |
| F11, downstream process text | Repaired. Line 1928: “these arithmetic and mapping-class-group instances provide comparisons”. | Downstream examples create no supplier edge. Their cited scopes were read; the process-dependent ordering language is gone. |

The same failure patterns were searched elsewhere: finite versus nontrivial finite groups, characteristic-two sign checks, zero coefficients, right/left actions, projective versus free resolutions and trace, equivariant versus underlying splittings, and topological separation. R03 is the remaining zero-ring pattern in the plan. No route-specific restriction or computational algorithm remains in the advertised scope. No suspicious instructions were encountered in the material read.

### Computed adversarial table

C_m denotes a cyclic group, F_r a free group of rank r, and K the Klein bottle group. Unless indicated, coefficient rings are nonzero. These computations test statements; they do not certify inaccessible source text. The table covers all 15 sampled targets, all nine numbered headline targets, every new target, and every finding's mathematical instance. Unchanged nonsampled targets retain only the previous report's explicit computed evidence, not its unsupported summaries.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| 1.3 implications/base change | C₂ over ℤ and ℚ; ℤ over ℤ and 𝔽₂ | FP: false → true for C₂; the t−1 resolution stays exact and FL: true → true for ℤ | Correct direction; no converse inferred. |
| 1.5 finiteness criterion | G = ℚ, modules R[ℚ/(1/i!)ℤ]; G = 1 | colim invariants = 0, invariants of colim = R; comparison 0→R injective but not bijective. For 1 it is identity | FP₀/FP₁ endpoint separated. |
| 2.1–2.2 dimension | R = 0, G = 1; R ≠ 0, G = ℤ² | cd₀ = 0, all H^k = 0 and witnessing set empty; over R ≠ 0, cd = hd = 2 and H²(G,RG) = R | R03; README implication survives. |
| 2.4 extensions/products | ℤ²; C₂×ℤ; K over 𝔽₂ | 2 ≤ 1+1 = 2; ∞ ≤ ∞+1 = ∞; H²(K,𝔽₂) = 𝔽₂ gives cd = 2 | Bounds correct; plan Checks need nonzero-R guard. |
| 2.5 directed-union Check in plan | S₃ as union of cyclic subgroups | H₁(C₃,ℤ) = C₃ maps to 0 in H₁(S₃,ℤ) = C₂; C₃ is in no larger cyclic subgroup | Valid negative control for directedness, despite differing from README's ℤ² example. |
| 2.6 amalgams/HNN/free groups | F₀,F₁,F₂; C₄∗_{C₂}C₆ over ℚ | cd = 0,1,1; amalgam cd = 1 = max(0,0,0+1) | Correct bounds; zero-ring qualification in R03. |
| 3.1 tensor signs | F = (Rx→Ry), dx=y; R=ℤ,𝔽₂; index one | d(x⊗x)=y⊗x−x⊗y; unsigned defect 2(y⊗x−x⊗y), nonzero over ℤ, zero over 𝔽₂; index-one functor is identity | Repaired sign witness works. |
| 3.2 Serre | K with subgroup ℤ²; C₂×ℤ with subgroup ℤ | 2 = 2; without torsion-freeness ∞ ≠ 1 | The theorem is correct; R05 changes the predicate name. |
| 4.1 virtual dimension | C₂, C₂×ℤⁿ, ⊕ℕ C₂, C₄∗_{C₂}C₆ | vcd = 0,n,∞,1; the last group has index-12 free kernel F₂ with cd=1 | Definition/independence distinguished from ordinary cd. |
| 4.4 virtual types/finite homological type | C₂; C₂×ℚ | First is virtually FL and finite homological type; second has vcd=2 but H₁(ℚ,ℤ)=ℚ, not finitely generated | Finite vcd alone insufficient. |
| 5.3 Eilenberg–Ganea | 1,ℤ²,ℤ³,C₂ | gd≤max(3,cd): 0≤3, 2≤3, 3≤3, ∞≤∞ | No claimed dimension-two equality. |
| 5.4 action construction | finite G with Γ=1; C₂×ℤ with Γ=ℤ | W=point yields stabilizer order |G|=[G:1]; product of two lines has dimension 2 and stabilizers of order 2 or 1 | Stabilizer/dimension bounds hold. |
| 5.4/8.8 chain convention | X=Δ[0] | Unnormalized ranks (1,1,1,…) versus cellular/normalized ranks (1,0,0,…); d₁=0,d₂=id | R01. Normalization repairs both assertions. |
| 6.1 duality definition | ℤ; C₂ over ℚ; R=0 | Generator x maps to x(t)=1; averaging (1+s)/2 inverts invariants→coinvariants; over zero ring all maps 0→0 in every n | Negative-degree vanishing explicit; nontriviality needed for dimension uniqueness. |
| 6.2 dualizing action | F₂=⟨s,t⟩; F₁ | δ(t)=((s−1)t,(t−1)t); reversed order would require ts=st; cyclic quotient is R[t,t⁻¹]/(t−1)=R | Correct right-linearity. |
| 6.3 duality criterion | ℤⁿ; ℤ∗ℤ²; R=0 | Regular cohomology R only in degree n, flat; for ℤ∗ℤ², cd=2 but H¹ contains ℤG≠0; zero ring both predicates true in all n | Both directions and degenerate coefficients tested. |
| 6.4–6.6 orientation/manifolds | Tⁿ, K, S², doubled-point circle | Tⁿ: PD_n, w=1. K: w(t)=−1, H²(K,ℤ)=ℤ/2, versus ℤ for trivial w. S²: π₁=1 has cd=0≠2. Doubled circle: H¹=ℤ² versus rank-one prediction | Asphericity and T2 independently necessary. |
| 7.1 rank | ℚS₃ trivial and regular modules | Trivial rank on three classes: (1/6,1/2,1/3), sum 1; regular: (1,0,0) | Nonabelian class quotient correct; R06 is citation only. |
| 7.2 projective characters | R=ℚ×ℚ,P=R(1,0); C₃-character ω; S₃ trivial module | (1,0)=(1,0); 3·ω/3=ω, wrong inverse gives ω⁻¹; centralizers (6,2,3) times ranks (1/6,1/2,1/3) give (1,1,1) | Projective trace and inverse convention repaired. |
| 7.3 rational Swan | P=(ℤS₃)²; trivial ℤ over C₂ | rankℤ P=12, rational free rank=12/6=2; nonprojective trivial module gives dimension 1, not divisible by 2 | Projectivity discriminates. |
| 7.4 mod-p Swan | (ℤC_p)², p=2,3 | Reduced dimensions 4,6, free rank 2; trivial ℤ reduces to dimension 1 and fails projectivity | No good-prime restriction. |
| 7.5 Hom formula | Γ=ℤ,P=ℤΓ,V=K_λ; P=ℤ | Projective case: dim Hom=1 for every λ, RHS=1; nonprojective case λ≠1 gives 0 versus 1 | General field/twist and missing-projectivity control. |
| 8.3 naive/rational χ | 1,ℤ,C₂ | χ̃=1,0,undefined; χ_ℚ=1,0,1 respectively; χ(C₂)=1/2 | Repaired finite-group Check; R06 leaves values unchanged. |
| 8.4 finite-index χ | C₂; amalgam with index-12 F₂; C₂×ℤ | 2·(1/2)=1; 12·(−1/12)=−1; 2·0=0 | Index factor and subgroup independence consistent. |
| 8.5 twisted coefficients | ℤ with λ=1 and λ≠1; F₂ trivial; C₂/ℚ without FP | Dimensions (1,1) and (0,0), both sum 0; 1−2=−1; outside FP, 1≠1/2 | Every-field formula passes; FP hypothesis used. |
| 8.6 extensions/Euler identity | F₂×F₃; K | E₂ total dimensions (1,5,6), sum 2=(−1)(−2); K gives 0=0·0 | Mathematics passes, ownership R04. |
| 8.7 equivariant χ | C₄∗_{C₂}C₆; C₂∗C₃; F_r; BS(1,2) | 1/4+1/6−1/2=−1/12, wrong edge sign 11/12; 1/2+1/3−1=−1/6; 1−r; 0−0=0 | Edge sign and stabilizer denominators fixed. |
| 8.8(a) Smith/Floyd | Circle reflection; free half-rotation; point with trivial C_p action, p=2,3 | Reflection: χ(X)=0,χ(fixed)=2,χ(quotient)=1, so 0+2=2; free action 0+0=2·0; point 1+(p−1)=p | Identity and inequality: fixed total Betti 2≤2 in reflection case. |
| 8.8(b) fixed-point finiteness | C₂ trivial on discrete ℕ | dim H₀(X^{C₂};𝔽₂)=∞, higher dimensions 0; claim demands finite total | R02; finite dimensionality does not mean finite homology. |
| 8.8(c,d) projective and orbit divisibility | C=𝔽_p[P] in degree 0; free EC₂ | χ(C)=|P|=|P|·1; EC₂ has χ=1 but all simplex orbits have order 2, and 2∤1 | Projective clause passes; EC₂ violates bounded dimension, showing why R01 matters. |
| 8.9 denominator theorem | C₄∗_{C₂}C₆; C₂∗C₃; finite G; torsion-free G | 12·(−1/12)=−1, max-order 6 gives −1/2; 6·(−1/6)=−1, max 3 gives −1/2; |G|·1/|G|=1; m=1 | General theorem retained; lcm distinguished from maximum. |
| 9.2 complete resolutions | C₂ over ℤ; trivial group | (1−s)(1+s)=0, ker(1−s)=im(1+s), ker(1+s)=im(1−s); trivial group completion contractible | Exactness and comparison-tail model pass. |
| 9.3 Farrell degrees | C₂ with ℤ; regular coefficients; ℤ | Degrees (−1,0,1,2) give (0,ℤ/2,0,ℤ/2); regular coefficients and ℤ give zero in every degree | Shift by one would wrongly give degree-zero 0. |
| 9.4 comparison/vanishing | C₂×ℤ; C₄∗_{C₂}C₆; C₂ at k=0 | Both high-degree theories of C₂×ℤ give ℤ/2 for k≥2; amalgam even group ker(C₄⊕C₆→C₂)=C₁₂, odd=0; endpoint ℤ→ℤ/2 has kernel 2ℤ | Strict comparison range and merely surjective endpoint tested. |
| 9.5 finite-group Tate comparison | C₂,1 with trivial ℤ | Norm ×2 gives degree (0,1,2,−1) groups (ℤ/2,0,ℤ/2,0); norm id for 1 gives all zero | Norm normalization matches pinned Tate construction. |

### Sources: all seeded targets and new proof inputs

The manifest has eleven cited works: six readable extractions and five settled uncertified works. All named works still cited are represented. No new fetch or source request was needed. Bieri1981 is no longer cited; its earlier waiver was not reopened. A source's integral statement was not silently certified at general-ring scope: the explicit extension route was checked separately.

| Sampled target | Text and locator read | Outcome |
|---|---|---|
| 1.3 implications/change of coefficients | BrownGTM87 VIII.5, settled uncertified | Text unavailable; algebraic instances above checked. |
| 2.4 extensions/products | BieriEckmann1973 lines 479–480, p. 115; BieriEckmann1974 Proposition 3.3(a), lines 298–313, pp. 81–82 | Extension dimension bound appears inside the duality argument; the latter gives integral FP inheritance. The general-R resolution/LHS route is stated separately. |
| 2.6 amalgams/HNN/free groups | BrownGTM87 VIII.2, settled uncertified; CohomologyOfGroups §3.6 read | Book unverified. Supplier exact sequences support the stated bounds with injective edge maps. |
| 4.1 virtual cohomological dimension | Serre1971Bourbaki lines 77–86, p. 339; Brown1974 §3 lines 352–358, pp. 236–237 | Serre's passage is in the lattice setting; Brown gives the virtual-dimension setting. Independence for arbitrary groups is derived using 2.3 and 3.2, not asserted as the lattice passage alone. |
| 4.4 virtual finiteness/finite homological type | Brown1974 lines 367–370 and Proposition 1, lines 382–384, p. 237 | Definition and finite-index inheritance agree; all torsion-free finite-index subgroups are quantified. |
| 6.1 duality groups | BieriEckmann1973 Definition 1.1 and conventions, lines 116–135, p. 105; Brown1975 lines 195–199, p. 133 | Integral source read; right/left conversion and explicit k>n vanishing agree. R-flatness is the declared general-ring replacement. |
| 6.6 closed aspherical manifolds | Serre1971Bourbaki lines 63–67, p. 338; BieriEckmann1974 §3.2, lines 271–281, pp. 80–81 | Sources give the geometric duality setting. Full manifold generality is supplied by AlgebraicTopology §§6.3–6.4 and 8.7; compactness, connectedness, T2 and asphericity are now explicit. |
| 7.2 projective characters | BrownGTM87 IX.2, settled uncertified | Book unverified; independently checked the idempotent/projective-trace calculation, including nonfree projectives. |
| 7.3 rational Swan | Brown1974 Swan's theorem, lines 169–172, p. 232 | Supports rational freeness of a finite projective integral group-ring module. |
| 7.5 Hom into a representation | Brown1974 Appendix A, Theorem 7 and proof, lines 1284–1355, pp. 260–261 | Finite generation, projectivity, finite-index normal subgroup, arbitrary field and finite-dimensional representation retained. The three cases in the argument match their hypotheses. |
| 8.5 twisted coefficients | Brown1974 Theorem 4 and Corollary 1, lines 425–451, pp. 238–239, plus Appendix A above | Main-text characteristic-zero theorem alone is insufficient; Appendix A supplies the every-field route actually used. |
| 9.2 complete resolutions | Farrell1977 and BrownGTM87 X.2, settled uncertified | Primary statements not read; native complete-resolution carriers and the cyclic exact complex checked. |
| 9.3 Farrell cohomology | Farrell1977 and BrownGTM87 X.3, settled uncertified | Primary text not read; indexing checked against Tate examples. |
| 9.4 comparison/vanishing | Farrell1977 and BrownGTM87 X.3, settled uncertified | Primary text not read; strict degree bound, endpoint and projective vanishing checked mathematically. |
| 9.5 finite groups | BrownGTM87 VI.3 and Farrell1977, settled uncertified | Primary text not read; comparison normalization checked against the pinned norm splice. |

Additional repaired/new locators read: Brown1974 §6 Lemma, lines 637–651, p. 244 (Serre's construction); Theorem 1′, lines 174–185, p. 232; Theorem 2′ and Corollary, lines 246–260, p. 234, with proof lines 261–333, pp. 234–236; §6 Corollary 1 and proof, lines 607–610 and 652–673, pp. 243–245. Floyd1952 Theorems 2.3–2.4, lines 110–176, pp. 140–141; facts (3.4)–(3.6), lines 261–267, p. 144; Theorems 4.2 and 4.4, lines 292–348, pp. 145–146. Floyd's topological hypotheses were read; the roadmap's proposed extension is a chain argument, whose boundedness requires R01's normalization. Brown's argument does not require cocompactness for the general denominator result.

### Pinned declarations and carrier boundaries

The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches were by objects as well as names: resolutions and syzygies; Ext/Tor and directed colimits; classifying-space cellular chains; total acyclicity and complete resolutions; traces and finite-group characters; normalized simplicial chains. Relevant declarations and their actual hypotheses were opened at these pins, including:

| Pinned file and line | Declaration / boundary checked |
|---|---|
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:202`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:246` | `groupCohomologyIsoExt`, `groupHomologyIsoTor`: the chosen representation/module carriers. |
| `TauCeti/Algebra/Module/PseudoCoherent/Basic.lean:89`, `:133`, `:205` | `IsPseudoCoherentOver`, zero and one characterizations; finite generation is not finite presentation. |
| `TauCeti/LinearAlgebra/Trace/Projective.lean:72`, `:96`, `:118`, `:158` | `projectiveTrace`, cyclicity, free-trace comparison, base change: finite projective hypotheses retained. |
| `Mathlib/LinearAlgebra/Trace.lean:75` | Ordinary trace uses a finite basis and otherwise returns zero; it does not replace projective trace. |
| `Mathlib/Geometry/Manifold/ChartedSpace.lean:141`, `:236`; `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777` | Native charted/smooth structures have no T2 field; second countability follows under the stated σ-compact/second-countable-model assumptions. |
| `Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:67`, `:106`, `:124` | Unnormalized chains, all-simplex coproduct and homology; finite nondegenerate dimension does not bound these chain terms. |
| `Mathlib/AlgebraicTopology/SimplicialSet/Splitting.lean:35`; `Mathlib/AlgebraicTopology/DoldKan/SplitSimplicialObject.lean:164`, `:294` | Canonical nondegenerate splitting and normalization homotopy equivalence already exist; R01 needs their specialization. |
| `TauCeti/AlgebraicTopology/SimplicialSet/EilenbergZilber.lean:761` | `SSet.eilenbergZilberHomotopyEquiv` supports the product acyclicity route; it alone does not supply bounded chains. |
| `Mathlib/Topology/Homotopy/Lifting.lean:489` | `IsCoveringMap.existsUnique_continuousMap_lifts`: chosen basepoint, simply connected and locally path-connected domain. |
| `Mathlib/Algebra/Group/Monoid.lean:552` | `IsMulTorsionFree`, the correct native predicate for R05. |

The audited contracts also correctly import Tau Ceti's `IsFPD` with its projective final syzygy, `leastENatBound`, cellular resolutions, total acyclicity without an accidental finite-generation assumption, complete-resolution comparison, projective-character vanishing, and the existing local Swan theorem. These are inputs rather than new declarations. The new group-specific complete resolution and Farrell comparison extend those inputs; they do not claim ownership of generic Gorenstein objects.

### Cross-roadmap ownership and supplier order

The board package index was read before checking existence. The scope search used main, the supplied open-head index and the board packages, including `roadmaps grep` and `roadmaps show`; it was not limited to names in this README. Main has no second copy of this roadmap. The supplied overlap facts report no conflicting head and no dropped cited identifier; checking the relevant heads did not change that conclusion.

Resolved supplier citations:

- CohomologyOfGroups §§1.2, 1.4–1.5, 3.1–3.2, 3.4–3.6, 4.6, 5.2 and 6.2–6.3: read `packages/CohomologyOfGroups/design/README.md`, including the cap product at line 1172, tree sequence at line 959 and Hochschild–Serre convergence at line 1529. The citation resolver's §4.6 lead is resolved there. BieriEckmann1974 and BrownGTM87 in its other two leads are source keys, not missing roadmaps.
- ClassifyingSpaces Stage 2 item 10 and Stage 4 items 16–17: main `TauCetiRoadmap/ClassifyingSpaces/README.md:173`, `:224`, `:238`; scopes and old-to-new mappings in open #1807 and #1808 were also read. The current citations remain valid without importing a revision's new numbering.
- AlgebraicTopology §§4.7, 6.3–6.4, 8.1, 8.3, 8.5, 8.7, 8.11a: main `TauCetiRoadmap/AlgebraicTopology/README.md:1739`, `:2491`, `:2873`, `:3219`, `:3334`, `:3413`, `:3618`, `:3971`; the corresponding scopes/mappings at #1807 and #1808 were checked. Main's simplicial replacement does not state the dimension bound.
- FreeGroupsAndLimitGroups §§4.5, 4.7–4.9: main `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:863`, `:906`, `:937`, `:950`, also checked against #2205. Graphs of groups and their trees are imported; this roadmap adds homological finiteness and dimension consequences.
- SchemeKTheoryOperations §6.7: new roadmap #1229, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2582`, supplies the directed-union homology comparison over arbitrary commutative coefficients. No dependence on a revision of an existing main roadmap is needed.
- EtaleCohomologyFoundations §F.10.3: main `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1295`, trace at `:1322`, supplies the generic ring trace. The opposite-ring specialization and conjugacy-class quotient in §7.1 are genuinely group-ring work.
- ProfiniteCohomology Layer 11 concerns continuous cohomology with discrete torsion coefficients. Its dimension is not the discrete arbitrary-R invariant here. Their comparison is a separate target, not a second definition with the same name.

Other nearby ownership was read: GorensteinHomologicalAlgebra #323 excludes complete cohomology of groups; SheafTheoreticSmithTheory #1734 owns étale sheaf Smith restriction, not the bounded classical simplicial-chain theorem; PosetHomotopyAndSubgroupComplexes #2296 treats finite-poset/subgroup-complex consequences. The general acyclic-action and denominator inputs belong here, subject to R01. ArithmeticKTheory #1418 §3.2 owns its arithmetic bordification/finite-CW application, and BianchiModularForms #1719 §9.3 its arithmetic Euler/duality application, not the general library. FuchsianOrbifolds' Euler formula specializes correctly: signature (0;2,3;1) gives 2−1/2−2/3−1 = −1/6. The mapping-class-group virtual-dimension instance remains a consumer. The additional generic overlap discovered is R04.

Overlap check: read ClassifyingSpaces (main, #1807, #1808), AlgebraicTopology (main, #1807, #1808), FreeGroupsAndLimitGroups (main, #2205); ClassifyingSpaces owns classifying spaces and cellular group-(co)homology comparisons, AlgebraicTopology owns topological comparisons and manifold duality, FreeGroupsAndLimitGroups owns graphs of groups and Bass–Serre trees. The present roadmap imports these objects. SpectralSequencesAndConvergence #2302 owns the additional shared Euler identity (R04).

Every `*Needs:*` line, supplier subsection and plan-local target edge was read. No forward local target dependency was found. The dependency gate output was:

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2200 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The additional supplier required by R04 precedes CohomologyOfGroups in the given order. The gate must be rerun after that repair.

The declared `gap:simplicial-replacement-dimension` has the same slug in README and plan, names AlgebraicTopology §8.11a, and asks specifically for preserving an upper dimension bound in simplicial replacement of a CW complex. The existing section gives replacement without that bound. The contract is precise and minimal; it is not an unowned prerequisite and creates no finding. A later acceptance can be conditional on it.

### Shape, headline theorems and design-stage limits

All nine layers have Examples and Dependencies, with per-target `*Needs:*` lines. All twelve definition targets have API lists and at least three Checks: 1.2, 2.1, 4.1, 4.4, 5.1, 6.1, 6.4, 7.1, 8.3, 8.4, 9.2 and 9.3. The construction 3.1 also has its action/sign laws and discriminating examples. The roadmap uses prose, Unicode mathematics and named suppliers. No computational algorithm, copied table, machine path, pull-request reference, sorry'd data or `set_option` was found in the design. The claimed generic result in 8.6(a) needs the supplier citation of R04; other source limits are explicitly recorded above.

The README's numbered headline list is: finiteness criterion (1.5); Serre (3.2); Eilenberg–Ganea (5.3); duality criterion (6.3); finite-homological-type Euler characteristic (8.4); extension multiplicativity (8.6); equivariant Euler formula (8.7); Brown denominator theorem (8.9); Farrell/ordinary comparison (9.4). The summary additionally promises Swan's rational and mod-p theorems and the finite-group Tate comparison. These are present as design targets.

There is no `Suggested.lean` in this design-stage package. Elaboration: **not available (this lane does not elaborate)**. No `#check @name`, one-tactic probe, import check or binder-elaboration test was run, and no passing build is claimed. There are zero sorried declarations here to probe. The package-stage requirement to state statable headlines, document missing carriers and delete padding remains untested, rather than a finding against this design. Backticked library names were resolved at the pins; mathematical notation is not treated as a claimed local Lean declaration. R05 is the concrete unresolved plan predicate.

### Source wording, arrangement and reuse

I compared twenty selected statement/proof/definition passages with the six readable sources. They include the readable sampled targets and additional passages from 1.1, 1.2, 2.2, 5.4, 6.3, 6.4, 8.1, 8.8 and 8.9. No source sentence, translated passage, clause-by-clause paraphrase or copied example list was identified. Formulae, standard theorem names and forced hypotheses were treated as mathematics. The two unsupported introductory locators are R06, not copying findings.

Counting named source citation occurrences before References gives 129: Brown1974 36, BieriEckmann1973 28, BrownGTM87 21, BieriEckmann1974 13, Brown1975 8, Serre1971Bourbaki 7, Serre1971Prospects 6, Farrell1977 5, Floyd1952 3, EilenbergGanea1957 1 and Wall1961 1. This is a reproducible occurrence count, not a count of distinct theorems.

Brown1974 has the largest share. Its contents at lines 36–57, printed p. 229, were compared with the design. Its sequence is complexes, semisimplicial complexes, finiteness, Euler characteristics, equivariant characteristics, finite subgroups, p-fractional parts, applications and appendices. The design instead draws §3 into Layer 4, §6 into 5.4, Appendix A into Layer 7, and §§1,4,5,2,6 into Layer 8. There is no one-to-one run of its sections. The dependencies 8.1→8.2→8.4→8.5→8.6→8.7 and 5.4/8.8→8.9 explain the order of the Euler results. BrownGTM87's text and contents could not be read, so independence against that book is not certified.

Source independence: 20 passages compared with 6 readable sources, no expressive copying or reused source artefact found; largest share Brown1974, 36 of 129 named citation occurrences; contents compared with Brown1974: independent. BrownGTM87 text and contents unavailable; that comparison remains untested.

## Not verifiable

- BrownGTM87, Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects are settled uncertified sources. Their exact theorem/page support, and the book's wording and arrangement, were not certified. They were not requested again or added to a missing-references file.
- Seven of the fifteen seeded targets have no readable primary locator in this lane: 1.3, 2.6, 7.2, 9.2–9.5. Their mathematical instances and available suppliers were checked; this does not replace source verification.
- No Lean elaboration, one-tactic padding probe or elaborated-binder audit is available in this design lane. No `Suggested.lean` exists to inspect. These are package-stage checks, not a claimed pass.
- The printed-source erratum below was found in the supplied line-numbered extraction and checked against the cited paper's theorem statements; a separate visual scan inspection was not available.

## Source issues

- **Misprint** in BieriEckmann1974 at Theorem 3.4 proof, printed p. 82, line 334: the source says its conclusion follows from Bieri–Eckmann 1973 Theorem 4.6; it should be Theorem 4.5, the duality criterion; affects the proof.

## For the human reviewers

- BrownGTM87 is settled uncertified. Its text and table of contents were unavailable, so wording and arrangement against that book were not tested. Brown1974, the largest citation share, was read and compared.
- Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects retain their settled uncertified status. No new licence judgment or request is made; the report distinguishes their unread statements from the six readable sources.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5fca6b3e28cc802c8c307247d8801b034d647423", "job": "REV-DESIGN-FinitenessAndDualityOfGroups~2", "model": "gpt-6-astra", "worker": "chris-10"} -->
