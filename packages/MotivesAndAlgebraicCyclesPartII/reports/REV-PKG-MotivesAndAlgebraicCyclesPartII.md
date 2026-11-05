<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2291#issuecomment-6663694726 -->
Review (claude) of d21e043

Verdict: needs_changes

1. **F01** (P3) Supplier declaration names that do not exist at the suppliers' heads

   Location: `packages/MotivesAndAlgebraicCyclesPartII/README.md` lines 70, 78, 90 (`## Exact supplier contracts`), and the `*Needs:*` lines 583, 1230, 1276.

   Claim: the README attributes backticked Lean names to GeneralAlgebraicKTheory, SchemeKTheoryOperations, KTheoryFiniteLocalFields, DiamondEtaleCohomology and DiamondSixOperations.

   Witness: none of the following names occurs in the README or the `Suggested.lean` of the cited roadmap at its open head (checked with `roadmaps show <Name>` and `--file Suggested.lean`):

   - GeneralAlgebraicKTheory (#1212, head 43e9df6): `KSpace.ofRing`, `nonunitalK`, `AbsoluteExcision`, `absoluteExcision_iff_tor`, `TorUnital`, `bassSpectrum`, `bassSpectrum_filteredColimit`, `NonunitalBass.filteredColimit`, `finiteFieldKGroups` (0 occurrences each; its Lean file declares `DenseClasses.*`, `FiniteChainDomination`, `restrictedCompletion_eulerCriterion`, …).
   - SchemeKTheoryOperations (#1229, head 393a8f1): `supportKTheory` (0).
   - KTheoryFiniteLocalFields (#1281, head 3c5b201): `completed` as a declaration of §1.6 (0; `perfect_positiveK_uniqueDivisible` does exist in §1.5).
   - DiamondEtaleCohomology (#922, head d91fdb5): `Det`, `enhancedEt`, `IsPartiallyProper`, `canonicalCompactification` (0 each; the roadmap writes `D_ét(Y, Λ)` and `𝒟_ét(Y, Λ)` in prose, C2.2 and C2.12).
   - DiamondSixOperations (#927, head 445408c): `lowerShriek`, `lowerShriek_baseChange`, `lowerShriek_projection` (0 each; S2.4 is titled "Properties of `Rf_!`").

   The sections themselves exist and state what the README attributes to them (GeneralAlgebraicKTheory §3.2 connective K of rings, §8.3 nonunital K through the unitisation, §8.10 Tor-unitality and absolute excision, §10.10 Bass spectrum, §§13.4–13.5 filtered continuity, §13.8c finite-field groups; SchemeKTheoryOperations §3.1 supported perfect complexes; KTheoryFiniteLocalFields §1.6; DiamondEtaleCohomology C2.2, C2.12, C4.5, C4.13–C4.14; DiamondSixOperations S2.4, S4.2–S4.3). Only the names are invented.

   Repair: delete the backticked names listed above at lines 70, 78, 90, 583, 1230 and 1276 and cite each fact by roadmap and section with its statement in words (as the README already does for the DiamondsAndVStacks and JacobianChallenge entries, whose names `IsCutoffCardinal`, `vTopology_subcanonical`, `Perf.Spd`, `classGroupAddEquivLineBundleClass`, `pointedCurvePicard_representable`, `multiplication_isogeny` do resolve). Keep `perfect_positiveK_uniqueDivisible`, `smoothAlterationPair`, `continuousCohomology`, `cd_p_le_of_isClosed`, `scd_p_le_cd_p_add_one`, `FiniteCor`, `PST`, `ShNisTr`, `Spectrum` and every EnhancedDerivedSheaves name, which resolve.

2. **F02** (P3) A Tau Ceti declaration that does not exist at the pin

   Location: README line 70: "§6.4 (`TauCeti.KTheory.LambdaOperations.adams` on `K_m(A)` of every commutative ring)".

   Claim: Tau Ceti at the pin has Adams operations under that name.

   Witness: the pinned Tau Ceti tree (`content/.lake/packages/TauCeti/TauCeti`) has no `KTheory` directory and no file or declaration matching `LambdaOperations` or `adams` outside `Algebra/Homology/DG/Algebra/AdamsCompletion.lean` (Adams completion of a dg algebra, unrelated). The README's own line 44 says Tau Ceti "contributes no … K-theoretic carrier", which contradicts line 70. SchemeKTheoryOperations §6.4 ("Universal higher operations and products", A commutative) and §6.8 do own the operations.

   Repair: at line 70 replace the parenthesis by "(Adams operations `ψ^k` on `K_m(A)` for every commutative ring `A`, through the universal lifting property)" without a Tau Ceti name.

3. **F03** (P3) "KII.1/additive-k" and "KII.4/multiplicative-k" are not sections of GeneralAlgebraicKTheoryPartII

   Location: README lines 14, 70, 679, 709.

   Claim: GeneralAlgebraicKTheoryPartII KII.1 supplies connective K-theory as the group completion of the E∞ space of finite projective modules, and KII.4 supplies that the K-theory of an E∞-ring is an E∞-ring.

   Witness: GeneralAlgebraicKTheoryPartII at its head (#1742, 90bcf29) contains no string `KII.`; its sections are numbered §0.1, §§1.1–1.4, §§2.1–2.4, §§3.1–3.6, §§4.1–4.46, §5.x. The group-completion model is its §1.2 ("Additive ∞-categories and group-completion K-theory": `Kadd(C)` as the group completion of the E∞ space `C≃`, with `Kadd(Proj^ω(A)) ≃ τ≥0 K(A)` for connective A). No target of that roadmap states the E∞-ring structure on `K(R)` for an E∞-ring R; the earliest owner in the merge order is RefinedTraceMethods §4.10 ("K-theory as tensor unit and the Dennis trace": connective K is the tensor unit of the presentably symmetric monoidal category of finitary additive invariants and the inclusion is lax symmetric monoidal), position 223, before this roadmap at 228. (The design-node ids `KII.1/additive-k`, `KII.4/multiplicative-k` are also the kind of label the house style forbids in a README.)

   Repair: at lines 14, 70, 679 and 709 cite "GeneralAlgebraicKTheoryPartII §1.2" for the group-completion model and "RefinedTraceMethods §4.10" for the E∞-ring structure on `K` of an E∞-ring; add RefinedTraceMethods §4.10 to the `### From TauCetiRoadmap.KTheoryFiniteLocalFields and RefinedTraceMethods` contract and to the Layer 6 Dependencies.

4. **F04** (P3) The vanishing direction in the §6.2 route is misstated

   Location: README line 685: "By cancellation (§5.3) `Hom(ℚ(i)[2i], ℚ(j)[2j])` vanishes for `i < j` and `End(ℚ(i)[2i]) = H⁰(X, ℚ)`, so `e` is triangular".

   Claim: the off-diagonal entries above the diagonal vanish.

   Witness: cancellation reduces `Hom(ℚ(i)[2i], ℚ(j)[2j])` to `Hom(ℚ(m)[2m], ℚ)` for `i − j = m > 0` or to `Hom(ℚ, ℚ(m)[2m])` for `j − i = m > 0`. The first vanishes because `ℚ(m)[2m]` is `m`-connective (Scholze line 1864: "ℚ(n)[2n] sits in degrees ≥ n") and `ℚ` sits in degree 0; that is the direction `i > j`. The direction `i < j` is `H^{2m}(Marc(ℤ), ℚ(m))`, which nothing in the README computes. Scholze line 1931 says only "upper-triangular", and one direction suffices for the diagonal-entry argument.

   Repair: replace "vanishes for `i < j`" by "vanishes for `i > j`, because `ℚ(i−j)[2(i−j)]` is `(i−j)`-connective and the target sits in degree zero"; the rest of the paragraph is unchanged.

5. **F05** (P3) The §9.5 negative-control Check does not prove its claim

   Location: README line 925, third Check of §9.5: "…whose rational objects are graded `ℚ`-vector spaces (§11.4) with endomorphism algebras products of matrix algebras over `ℚ`; but the rational endomorphisms of the `H¹`-summand contain `End(E) ⊗ ℚ`, a quadratic field or a quaternion division algebra."

   Claim: the containment is a contradiction.

   Witness: `ℚ(i)` embeds in `M₂(ℚ)` by `i ↦ [[0, −1], [1, 0]]` (square is `−1`), and a quaternion division algebra over `ℚ` embeds in `M₄(ℚ)` by left multiplication; so a division algebra of dimension 2 or 4 sits inside a product of matrix algebras, and the sentence refutes nothing. The claim itself (`DMT(C) ≠ Dmot(C)` at the nonarchimedean point) is true, but this justification is not a proof.

   Repair (tested on `E` ordinary over `𝔽̄_p`, `End(E) ⊗ ℚ` an imaginary quadratic field): replace the justification by a dimension count. If `ℚmot[E]` were mixed Tate over `k = 𝔽̄_p`, it would be `⊕ ℚ(i)[m]^{n_{i,m}}` with `n_{i,m} = dim Hom(ℚmot[E], ℚ(i)[m]) = dim K_{2i−m}(E)^{(i)}_ℚ` (§§10.5, 11.4); `K₀(E)_ℚ = ℚ²` (rank and degree, since `E(𝔽̄_p)` is torsion) gives `n_{0,0} = n_{1,2} = 1`, and `K_n(E)_ℚ = 0` for `n ≥ 1` (Harder's vanishing for smooth projective curves over finite fields, passed to `𝔽̄_p` by filtered continuity; a new source entry) gives all other `n_{i,m} = 0`; so `End(ℚmot[E]) = ℚ × ℚ`, of dimension 2, whereas duality (§8.5, `E` smooth proper, so `ℚmot[E]^∨ = ℚmot[E](−1)[−2]`) and §10.5 give `End(ℚmot[E]) ≅ CH¹(E × E)_ℚ = NS(E × E)_ℚ`, of dimension `2 + rank End(E) ≥ 4`. If the extra source is unwanted, delete the elliptic-curve sentence and keep the Check as "at a nonarchimedean geometric point `DMT(C)` is the localizing Tate subcategory and no claim that it is all of `Dmot(C)` is made", which is what §9.8 uses.

6. **F06** (P3) §0.6 tests fewer fields than Scholze's Definition 4.3

   Location: README line 179: "quasi-pro-étale when for every map `A → C` to a geometric Banach point, the uniform completion of `B ⊗̂_A C` is isomorphic to `Cont(S, C)`" (geometric Banach point = nondiscrete algebraically closed, line 26).

   Claim: this is Scholze's Definition 4.3.

   Witness: Scholze line 812: "after any base change `A → C` to an algebraically closed Banach field `C`", discrete fields included. For analytic `A` the two agree (a topologically nilpotent element maps to 0 in a trivially normed field, yet such elements generate the unit ideal, so an analytic ring has no map to a discrete field), and every strict ring is analytic; for a non-analytic `A` the README's condition tests strictly fewer base changes.

   Repair: state the definition with "every algebraically closed Banach field `C`" and add the sentence "for analytic `A` only nondiscrete `C` occur, so the condition may be tested on geometric Banach points"; or keep the README's definition and add that sentence as the reason it agrees with Definition 4.3 on the analytic rings where §§0.6–0.7, 1.7 and 9.3 use it.

Six findings, all P3 (supplier-name drift, one nonexistent Tau Ceti name, two mislabelled supplier sections, one route direction, one flawed Check justification, one definition narrower than its source). No P1 or P2. The mathematics of the sampled targets and of every headline theorem agrees with the source at the cited pages; the nine declared supplier gaps are precise, minimal and declared in both `design/plan.json` and the README; the dependency check reports no UPWARD or CYCLE line; `Suggested.lean` elaborates (exit 0, no output) and correctly states nothing, since no headline theorem is statable at the pins.

## Verified sound

**Principles.** No route-specific shortcut (every statement is over all Banach rings or all small arc-stacks, with the source's hypotheses); the base roadmap MotivesAndAlgebraicCycles is imported (§§4.1–4.18 cited, nothing re-planned) and the Part II introduction says where it stops; supply is downward only; no copied passages (every statement is paraphrased with a locator); no algorithm; `Suggested.lean` has no sorry'd data and no `set_option`; the sources are open (arXiv, Numdam) or recorded `uncertified` (BLR).

**Sources, sampled targets** (all against `Scholze` arXiv v3 text; pages checked with the `=== page N ===` markers):

| Target | Locator in README | Found at | Hypotheses and statement |
| --- | --- | --- | --- |
| 0.3 | Examples 3.4–3.8, Prop. 3.9, pp. 15–16 | Scholze lines 658–694 (Ex. 3.4–3.5 p. 15, Ex. 3.6–3.9 p. 16) | agree (uniform completion, bounded product of residue fields, completed perfection with rescaled norm, Morita equivalence with compact Hausdorff spaces; real case with involution) |
| 0.4 | Def. 3.10, p. 16 | lines 698–705 | agree (analytic, uniform, profinite spectrum; strict adds algebraically closed residue fields; surjectivity `A → K(x)` lines 702–705; Prop. 3.11(iv) line 720 for bounded products) |
| 0.6 | Def. 4.3, p. 19; Lemmas 4.4–4.6, pp. 19–20 | lines 812–847 | agree except the test class (R06); Lemma 4.5 needs `A` strict (line 837) as the README says |
| 0.7 | proof of Thm 4.20, p. 24 | lines 1030–1031 | Scholze asserts repleteness and cites [MR25] for Postnikov completeness; the README's own route (tower of covers, inverse limit of surjections of compact Hausdorff spaces is surjective) is sound; the gap `replete-postnikov` covers the cited theorem |
| 1.1 | Thm 4.1, Rem. 4.2, pp. 19–20; Lemmas 4.7–4.9, pp. 20–22 | lines 791–809, 918–936 | agree (finite products and filtered colimits; positive cohomology vanishes on strict rings; compactly assembled targets) |
| 1.7 | Thm 4.20, Ex. 4.26, pp. 24, 26 | lines 1015–1036, 1095 | agree (0-truncated proper, finite `d(f)`, base change, projection only for quasi-pro-étale; bounded-below case needs no finiteness, line 1023) |
| 3.2 | Def. 5.15, p. 32 | lines 1365–1372 | agree (quotient in arc-sheaves of abelian groups, nonarchimedean locus) |
| 4.5 | Lemma 6.4, pp. 36–37 | lines 1549–1572 | agree (prime may be the residue characteristic; marked semiabelian variety, one-unit interpolation) |
| 8.3 | Prop. 9.7, pp. 52–53 | lines 2204–2211 | agree (`|p| < 1` on `X`, symmetric monoidal, functorial; Tate twist preserved) |
| 9.3 | Lemma 10.4, p. 55 | lines 2315–2325 | agree (quasi-pro-étale proper; `f_*` conservative; colimit statement) |
| 10.2 | CD Thm 4.5.2, Cor. 4.5.3 (p. 41), Thm 5.2.2 (p. 44), Cor. 5.5.5 (p. 55), Cor. 5.5.7 (p. 56) | CD lines 1896–1911, 2048–2057, 2521–2529, 2579–2584 | agree; Cor. 5.5.7's hypothesis "characteristic zero or 2 invertible in R" is as the README states, and CD Remark 5.5.8 (lines 2598–2612) confirms the gap concerns Ayoub's (SS)₂ property, not orderings |
| 10.4 | CD Thm 5.2.2 formula (5.2.2.a), Thm 4.5.2 | CD line 2053 | agree: `Hom(ℚ_X, ℚ_X(p)[q]) = Gr^p_γ K_{2p−q}(X)_ℚ`, which gives `π_i Map(M(X)(−j), ℚ) = K_{i+2j}^{(j)}` |
| 10.5 | Thm 11.1, pp. 57–58 | lines 2395–2441 | agree; the shift `[−2j]` is not written in the source (E6 below) |
| 11.7 | Thm 11.9, p. 61 | lines 2549–2565 | agree (`h_* O` in degrees 0 and 1, band `Hom(ℚ, L)`, identity on the value group) |
| 12.3 | Prop. 12.3, p. 63 | lines 2641–2652 | agree (`n` prime to `p`; overconvergence at higher-rank points; compatibilities) |

Also read and found to agree with the README: Def. 2.1 (conventions, line 287), Def. 2.7–Prop. 2.9 (§0.1, lines 367–392), Def. 2.20 (line 509), Def. 3.1 and Prop. 3.2 (§0.2, lines 605–622), Thm 4.14–Prop. 4.16 and Defs 4.17–4.19 (§§1.3, 1.5, lines 993–1011), Defs 5.1–5.2 and Lemma 5.3 (§2.1, lines 1110–1121), Prop. 5.19 (§3.5, lines 1449–1479), Def. 6.2 and Thm 6.3 (§§4.1, 4.6, lines 1500–1547), Thm 6.7, Prop. 6.8, Cor. 6.9 (§§4.8–4.10, lines 1656–1700), Cor. 8.1–8.2 proof (§5.4, lines 1860–1870), Def. 8.3–Cor. 8.6 (§§6.1–6.3, lines 1872–1942), Props 8.7–8.8, Thm 8.9, Cor. 8.10, Thm 8.11, Cor. 8.12, Thm 8.13 (Layer 7, lines 1964–2079), Thm 9.2–Cor. 9.6 (§§8.2–8.5, lines 2109–2202), Prop. 10.1, Cor. 10.2, Prop. 10.3, Props 10.8–10.9 (Layer 9, lines 2215–2222, 2248–2256, 2263–2277, 2359–2379), Prop. 11.4–11.8 and the `MG_k`, `MG_C` constructions (§§11.1–11.6, lines 2460–2578), Prop. 12.1, Cor. 12.2, Prop. 12.4 (§§12.1, 12.4, lines 2603–2621, 2653–2667), Thms 1.7, 1.9, 1.12, Prop. 1.5–1.6 (pp. 4–7). van der Put: Theorem 1.1 is stated on p. 156 (file line 57) with proof to p. 158 and Corollary 1.3 on p. 159 (line 165), matching §4.2.

**Source corrections E1–E6.** Each confirmed at the text: E1 at Scholze lines 1621–1624 (outer threshold printed as `r₁ > 1` against `r₁ < 1`; inner bound printed as `r₁ⁿ`); E2 at line 1631 (sign of the difference); E3 at line 1633 (garbled containment); E4 at lines 1601–1603 (`ℚ^e` per domain in the top row against `ℚ^{de}` below); E5 at line 1471 (`max` for `min`; I recomputed the witness `T² + T/2 + 4` over `ℂ₂`: `|a₀| = 1/4`, `|a₁| = 2`, roots of norm 2 and 1/8 by the Newton polygon, `min(4, 1) = 1 < 2` excludes, `max = 4` admits; and I checked both directions of the `min` criterion by the Newton polygon); E6 at lines 2398–2399 (the shift is omitted; `X = Spec k`, `j = 1` gives `π_{−1} = k^× ⊗ ℚ = K₁^{(1)}`, consistent only with `[−2j]`).

**Adversarial pass** (sampled targets, headline theorems, finding-touched targets):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 weakly compact maps | `ℤ[T]_{r'} → ℤ[T]_r`, `r' > r`; identity of `ℤ[T]_r` in `colim ℤ[T]_{r+1/n}` | colimit norm of `T` is `inf_n (r + 1/n) = r`; each stage has `r + 1/n > r`, so no stage receives `ℤ[T]_r` | holds; identity not weakly compact |
| §0.2 covers | zero ring; nonzero `A` | `M(0) = ∅`, empty finite subfamily surjects; `M(A) ≠ ∅` by `|1| = 1` | holds |
| §0.2 lifting criterion | any point `x ∈ M(A)`, test fields restricted to geometric points | `K(x)` extends to a nondiscrete algebraically closed field; a lift to `M(B_i)` at a point gives a common extension by Prop. 3.2(i) | equivalent to Scholze's criterion |
| §0.4 strict | `ℂ`; `ℝ`; trivially normed `k`; bounded product over infinite `I` | `ℝ`: one point, residue field not closed; `k`: no `0 < |x| < 1`, not analytic; `M(∏ C_i) = βI` (Prop. 3.11(ii)) | holds |
| §0.6 test class | analytic `A` and a discrete field `C` | a topologically nilpotent `x` has `|x|_C = 0`, but `(x_1,…,x_n) = (1)` forces `1 = 0` in `C`: no such map | agrees with Def. 4.3 on analytic rings; R06 for the rest |
| §0.7 repleteness | tower of covers `A → B₁ → B₂ → …` | `M(colim B_n) = lim M(B_n)` (Prop. 3.2(ii)); inverse limit of surjections of nonempty compact Hausdorff spaces surjects onto `M(A)` | holds |
| §1.1 finitary on `Cont(S, C)` | constant `ℤ` versus all functions, `S` infinite | `colim_j ℤ^{S_j}` = locally constant maps ≠ `ℤ^S` | holds (Check 3 of §1.2) |
| §1.4 open loci | `a = 0`; `r >` spectral radius; `a = 1`, `r ≤ 1` | whole; whole; `|1|_x = 1 ≥ r` so empty | holds |
| §1.6 excision | `[0,1]`, `U = (0,1]`, `Z = {0}` | stalks `0 → ℤ → ℤ` at 0 and `ℤ → ℤ → 0` at `t > 0` | holds, convention pinned |
| §1.7 bounded-below | Thm 4.20 proof line 1023 | preservation on `D⁺` without finite `d(f)`; unbounded needs Postnikov completeness | holds as stated |
| §2.1 `d(C⟨T⟩₁) ≤ 3` | `ℂ`; nonarchimedean `C` | `2 + 0`; `1 + scd ≤ 1 + (cd ≤ 1) + 1 = 3` | holds |
| §3.1 one-units | `−1` in `ℚ₂`, `ℚ₃` | `‖−2‖₂ = 1/2 < 1`; `‖−2‖₃ = 1` | holds |
| §3.2 reduced units | pseudouniformizer `π`; unit of norm 1 with residue `≠ 1` | `|π| < 1 ≠ 1`, not a one-unit; `|u − 1| = 1` | holds |
| §3.4 Tate twist | complex point; real point | `cofib(ℤ → ℤ ⊕ ℤ[1])[−1] = ℤ`; conjugation acts by `−1` on `H₁(S¹)` | holds |
| §3.5 annulus criterion | `T² + T/2 + 4` over `ℂ₂`, `r₁ = 1/4`, `r₂ = 4` | Newton points `(0,2),(1,−1),(2,0)`, slopes `−3, 1`, root norms `1/8, 2`; `min = 1`, `max = 4` | `min` correct, both directions |
| §4.3 marked Jacobian | `r = 1`; `ℙ¹`, `Z = {0, ∞}` | kernel `G_m^0`; `(a, b)` mod scaling, coordinate `a/b` | holds |
| §4.4 line domains | `|T| ≥ r₂`; `|T − a_i| ≤ r₁` | `|T|^n ≥ r₂^n > s₂`; other factors have norm `|a_i − a_j| = 1`, product `≤ r₁^{k_i} < s₁` | holds (E1) |
| §4.5 one-unit interpolation | `s₁/s₂` on a boundary disc, value 1 at `z_i` | `|s₁/s₂ − 1| < 1` on the disc, so `1 + t(s₁/s₂ − 1)` is a unit for `|t| ≤ 1` | holds |
| §4.8 norm versus pointwise | `Marc(ℤ_p)`; `Marc(ℤ)` | `|p|_x ≤ |p|_{ℤ_p} = 1/p`; `M(ℤ)` has `|·|_∞^s`, trivial, `|·|_q^s` points | holds; Thm 6.7 hypotheses matched |
| §5.3 cancellation inverse | multiplicities `N`, `N − 1` | difference 1; base-point summand 0 | holds |
| §5.4 cells | `ℙ⁰`, `ℙ¹`, `ℂℙ^∞` | `ℤ`; `ℤ ⊕ ℤ(1)[2]`; `⊕_n ℚ[2n]`, a sum | holds |
| §6.1 `Kcn` not ball-invariant | `1 + aT`, `0 < |a| < 1`, in `C⟨T⟩₁` | Gauss norm of `aT` is `|a| < 1`, so `1 + aT` is a unit not in `C^×` | holds |
| §6.2 flag invariants | `n = 2`; general `n` | antipodal map on `S²`: traces `+1`, `−1`; `w ≠ 1` acts freely on `U(n)/T` (fixed point iff `ẇ ∈ T`), Lefschetz number 0; `w = 1`: `n!`; regular representation, invariants `H⁰` | holds; direction of vanishing corrected (R04) |
| §6.3 projectors | eigenvalues `1, 2, 4` | `(ψ−2)(ψ−4)/3` at `1, 2, 4` gives `1, 0, 0`; `−(ψ−1)(ψ−4)/2` gives `0, 1, 0`; `(ψ−1)(ψ−2)/6` gives `0, 0, 1` | holds |
| §7.1 Tor-unitality | `ℚ_p`, `I = pℤ_p` | `I/I² ≅ 𝔽_p ≠ 0` | holds (not in the class) |
| §7.1 valued field | `C`, `B = O_C` | `K(m) = fib(K(O_C) → K(k))`; `cofib(K(m) → K(C)) = K(C) ⊔_{K(O_C)} K(k)` | holds (matches Scholze line 2431) |
| §7.2 contractible fibres | `g₀ + ta`, `g₀ ∈ GL_n(ℤ)`, `a` with entries in `A_{<1}`, `|t| ≤ 1` | `det(1 + t g₀⁻¹ a) ∈ 1 + A_{<1}`, a unit | holds |
| §7.5 fibre versus cofibre | `A = C` | cofibre `π₀ = ℤ`; fibre `π₀ = C^×/(1 + C_{<1})` | direction pinned |
| §7.6 strict K formula | residue characteristic 0; `S = ∅` | `p = 1`, nothing inverted; README's "nonarchimedean" excludes `ℂ`, where `ℂ_{<1}` is not an ideal | holds (narrower than Thm 8.9's wording where the source is undefined) |
| §7.7 fracture on `π₀` | `p = 2` and odd `p` | `ℤ = ℤ[1/p] ×_{ℚ_p} ℤ_p` | holds |
| §8.1 sequence model | `ℤ(−1) ⊗ ℤ(1)` | `(ℤ(n−1))_n` shifts to `(ℤ(n))_n` | holds |
| §8.2 duality | complex point | `(ℤ ⊕ ℤ[−2]) ⊗ ℤ[2] = ℤ[2] ⊕ ℤ = ℤmot[ℙ¹]` | holds |
| §8.5 boundary | closed disc over nonarchimedean `C` | `f_* ℤ = ℤ`; smoothness would force `ℤ(1)[2] ≅ ℤ`, but `(Ḡ_m ⊗ ℚ)[1] ≠ ℚ` (value group `ℚ`) | holds |
| §9.3 monadicity | `Y = ∅`; `Y = X ⨿ X` | `f_* ℤ = 0`, zero category; `ℤ × ℤ`, product category | holds |
| §9.5 negative control | `E` over `𝔽̄_p` | `ℚ(i) ⊂ M₂(ℚ)`: the stated contradiction fails; dimension count `2` versus `2 + rank End(E) ≥ 4` works | R05 |
| §9.6 not compactly generated | `Cont([0,1], ℂ)`, `j_! ℤ` from `(0,1]` | `RΓ_c((0,1], ℤ) = 0`; unit compact | holds |
| §10.2 rational and torsion | `Spec k`, `j = 1`; `ℤ/ℓ` | `k^× ⊗ ℚ = 0` for `𝔽̄_p`, `≠ 0` for `ℂ`; `μ_ℓ ≅ ℤ/ℓ` | holds |
| §10.4 shift | `ℙ¹`, `j = 1` | `π_{−2} = K₀^{(1)} = ℚ`; `π₀ = K₂^{(1)}(ℙ¹)_ℚ = 0` | `[−2j]` required (E6) |
| §10.5 formula | `X = Spec k`, `j = 1` | `π_{−1} = k^× ⊗ ℚ = K₁^{(1)}` | holds with the shift |
| §11.3 `G_m^rat` | `⊗ 𝔽_ℓ`, `⊗ ℚ`, `⊗ 𝔽_p` | augmentation ideal `(t−1)ℚ[t^±]` is a `ℚ`-space, so `R/ℓ = 𝔽_ℓ`; `ℚ[t^±]`; `0` | holds |
| §11.3 Tor amplitude | counit `R → ℤ[1/p]` | `I = R ⊗ ℚ` is flat over `R` (flat over the localization `R_ℚ`), so amplitude `[−1, 0]` | holds |
| §11.4 orthogonality | `Hom(ℚ(i), ℚ(j)[m])` | `K_{2(j−i)−m}^{(j−i)}(𝔽̄_p)_ℚ = 0` unless `i = j, m = 0` | holds |
| §11.7 degree-one map | `h_* O → f_* ℤ` | both `ℤ[1/p] ⊕ ℚ(−1)[−1]`; the map on `ℚ(−1)[−1]` is the identity of the value group | holds (Scholze line 2563) |
| §11.8 example | `A = ℚ ⊕ ℚ(1)`, `N` | `N ≠ 0`; `N²` lands in the twist of a summand `N` kills, `N² = 0` | holds |
| §12.1 compactification | open disc; closed disc | union of closed discs of radius `< 1`: partially proper; closed disc: not | holds |
| §12.3 overconvergence | `j_! ℤ/n` from the rank-one point; `n = 1` | specialization `0 → ℤ/n` not an isomorphism for `n > 1`; `n = 1` everything zero | holds |

**Context.** `Suggested.lean` has no declarations, so no `variable`/`include` binder can be lost; the `#check @name` comparison has nothing to compare. Every README statement carries its hypotheses in the sentence.

**Declared gaps** (nine; same slugs in `design/plan.json` `gaps` and in the README contracts): each is precise and minimal. `replete-postnikov`: EnhancedDerivedSheaves E2.7 states "Repleteness alone is not claimed to suffice" (its main README, Layer E2). `compact-hausdorff-dimension`: E2.4's `postnikov_converges_of_finiteDimension` is a per-object criterion from a cohomological bound on a site, not the covering-dimension input. `animated-group-completion`, `einfty-fracture-square`: no "Breen", "group completion", "augmentation ideal" or "fracture" in EnhancedDerivedSheaves. `kh-excision-cdh-descent`, `valuation-ring-k-regularity`: SchemeKTheoryOperations Layer 5 ("Projective bundles, Bass theory and blowups") has no KH, cdh or valuation-ring target (GeneralAlgebraicKTheoryPartII independently declares KH gaps on its §5.2; the two requests are complementary). `suslin-rigidity`: KTheoryFiniteLocalFields §2.1 is henselian-pair rigidity. `padic-k-integers-oc`: its §6.5 is for local fields. `affinoid-line-bundles`: TropicalAndBerkovichArithmetic §§0.17, 0.20 define affinoid algebras and the structure sheaf without the principal-ideal or descent statements.

**Supplier order.** Dependency check output:

```
depcheck: 225 roadmaps, 2213 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every supplier is on main (EnhancedDerivedSheaves, PerfectoidSpaces, JacobianChallenge, CharacteristicClasses, MorseNovikov, ProfiniteCohomology, RepresentationTheory/LieGroups, SchemeAndStackFoundations) or earlier in `merge-order/ORDER.txt` (AnabelianGeometryAndNonabelianChabauty 201, TropicalAndBerkovichArithmetic 206, RefinedTraceMethods 223, AnalyticStacks 225, GeneralAlgebraicKTheoryPartII 227; this roadmap 228). Sections resolved at the open heads: TropicalAndBerkovichArithmetic §§0.1, 0.7, 0.8, 0.12–0.17, 0.20–0.22, 0.24–0.28, 0.30, 0.32, 1.1–1.3, 1.6, 3.7 (all present); EnhancedDerivedSheaves E0.4, E1.3, E2.1–E2.7, E3.2, E3.4, E5:abstract.1–5, E5:presentability.2–4, E5:descent, E5:spectra-comparison, E5:animation.1 and all 22 cited names (present); AnalyticStacks §§0.4–0.6, 0.9–0.10, 1.1–1.5 at #1687 (present; its downstream line 1303 names this roadmap's interfaces, and the "stays with that roadmap" sentence is at line 1120 of the board design README); GeneralAlgebraicKTheory §§3.2, 8.3, 8.10, 10.10, 13.4–13.5, 13.8c; SchemeKTheoryOperations §§3.1, 3.3, 3.4, 3.8, 6.4, 6.8, 6.11, Layer 5; KTheoryFiniteLocalFields §§1.5, 1.6, 2.1, 6.5; RefinedTraceMethods §4.20 (statement matches: flat idempotent ideal, dualizable almost modules, `fib(IK(B) → IK(B/I))`); JacobianChallenge Layers A–E and its three names; AnabelianGeometryAndNonabelianChabauty "Generalized Jacobian of a reduced boundary" (characteristic zero, as the README says); PerfectoidSpaces P1.4, P1.19–P1.22, P1.27, P2.3, P2.7, P2.12, P3.20; DiamondsAndVStacks D0.22, D0.23, D1.4, D2.7, D4.7, D4.9, D6.1, D6.3; DiamondEtaleCohomology C0.19, C0.24, C2.2, C2.12, C4.5, C4.13–C4.14, C6.1, C9.8; DiamondSixOperations S2.4, S4.2–S4.3; MotivesAndAlgebraicCycles §§4.1–4.6, 4.9, 4.11, 4.15–4.18; MotivicEtaleKTheory §2.2 (Adams weight `p` summand of `K_n(X)_ℚ` is `CH^p(X, n)_ℚ`); AdicCoefficientsAndComparisons L5 with `smoothAlterationPair`; ProfiniteCohomology's three names (README and Suggested.lean on main); SchemeAndStackFoundations §2.16 (`tsen_theorem`); RepresentationTheory/LieGroups Layer 8 ("Borel-Weil, flag manifolds, and Bruhat"); CharacteristicClasses C5 ("Euler integral of G/T equals |W|"); MorseNovikov (owns the Lefschetz formula). Drift found only in names and the two labels (R01–R03).

**Duplication and ownership.** `roadmaps grep` over main and the open heads for "Berkovich motive", "small arc-stack", "ball-invariant", "arc-topology on Banach", "DM_et", "integral étale motives", "motivic K-theory", "Kmot": the only matches outside this roadmap are bibliography lines citing Scholze's paper (SchemeKTheoryOperations, EnhancedDerivedSheaves, RefinedTraceMethods, TropicalAndBerkovichArithmetic) and EnhancedDerivedSheaves' dualizable-category targets, which the README cites rather than restates. No roadmap on main, at an open head or in the board packages index plans the Banach arc-site, `Dfin`, `Deff_mot`, `Dmot`, `Kmot`, `DM_et(k, ℤ)`, the motivic Galois stacks or the arc/v comparison. Ownership against open pull requests was checked through `roadmaps grep` and the sibling checkouts named in the brief.

**Pinned libraries.** `CategoryTheory.GrothendieckTopology` (`Mathlib/CategoryTheory/Sites/Grothendieck.lean` line 72), `NormedField` (`Mathlib/Analysis/Normed/Field/Basic.lean` line 154), `IsUltrametricDist` (`Mathlib/Topology/MetricSpace/Ultra/Basic.lean` line 46), `SSet.Quasicategory` (`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean` line 41) exist at the pin. No file in the pinned Mathlib or Tau Ceti mentions "Berkovich" or an algebraic K-theory spectrum, so the docstring's "not statable" verdicts are correct.

**Shape and house style.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–12 each with `### Examples` and `### Dependencies`, Downstream consumers, Corrections to the source, References: present. Every definition has an API list and at least three Checks (counted: 0.1, 0.2, 0.4, 0.6, 1.2, 1.4, 1.5, 2.1, 2.2, 2.5, 3.1, 3.2, 3.4, 4.1, 4.3, 4.8, 5.4, 6.1, 6.2, 7.1, 7.5, 7.7, 8.1, 9.2, 9.3, 9.5, 9.6, 9.7, 10.1, 10.2, 10.4, 10.6, 11.1, 11.3, 11.4, 11.5, 11.6, 11.8, 12.1, 12.2, 12.3, 12.4); every theorem carries hypotheses and a locator. No LaTeX delimiters, no process words, pull-request numbers, dates in the roadmap text, or machine paths (grep for `\(`, `$`, "pull request", "handoff", "round", "optional", "deferred", "removed" and home-directory prefixes: no match). `Suggested.lean`: single `import Mathlib`, one module docstring naming each headline and what it lacks, the namespace, nothing else; elaboration from the content checkout exited 0 with no output; no padding possible.

**Headline theorems** (README summary): cancellation (§5.3); finitarity and Adams decomposition of `Kmot` (§§6.1, 6.3); explicit `Kmot` on strict bases (§7.6); torsion and tilting comparisons (§§4.8, 4.9, 8.3); six operations and proper base change (§§8.5, 9.4); rigidity (§§9.1, 9.6); `DM_et(k, ℤ) ≃ Dmot(k)` (§10.6); monodromy equivalence (§11.8); overconvergent comparison (§12.3). Each is named in the module docstring with its missing carrier, and none is statable at the pins (no Berkovich spectrum, arc-site, presentable stable ∞-category of sheaves, formal inversion or K-theory spectrum in the pinned libraries).

**Sources manifest.** Four entries, keys unique; `Scholze` and `CD` certified from arXiv with `cited_for` matching the README's uses; `vanDerPut` certified from Numdam; `BLR` uncertified by DOI and locator. No `needs-references.toml` was needed and none was written.

## Not verifiable

- BLR §9.2, Proposition 3, Example 8, Proposition 10: paywalled, recorded `uncertified`; cited only as background for §4.3, whose statement is supported by Scholze lines 1558–1560.
- Scholze's reference [MR25] (Mondal–Reinecke) for "replete implies Postnikov complete" and [HN20], [Kra80] in the proof of Corollary 8.10: not fetched; each enters only through a declared gap (`replete-postnikov`, `padic-k-integers-oc`) or a supplier section (KTheoryFiniteLocalFields §1.5), never as a locator of this roadmap.
- Harder's theorem on rational K-groups of curves over finite fields, proposed in R05: not fetched; it is a repair option, not a current citation.

## Source issues

- **Error** in Scholze at proof of Proposition 5.19, p. 35: the source says a monic polynomial with constant term in the target annulus has all roots in the annulus iff each `|a_i|` is below the maximum of two bounds; it should be the minimum of the two bounds (witness `T² + T/2 + 4` over `ℂ₂`); affects the proof (the fibre is still an open polydisc with the corrected bound).
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the outer estimate holds for `|T| ≥ r₁ > 1` and bounds the product on a deleted disc by `r₁ⁿ`; it should be `|T| ≥ r₂` and the bound `r₁^{k_i}` with the other factors of norm one; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the ratio of nearby coordinates is `1 + (T₂ − T₁)/(T₂ − a_j)`; it should be `1 + (T₁ − T₂)/(T₂ − a_j)`; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source displays a containment with a stray `⊂ ℚ →` in the middle; it should say the reduced-unit summand lies in the image of the point classes; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source gives each annular domain a degree factor `ℚ^e` in the top row of the diagram; it should be `ℚ^d`, matching `ℚ^{de}` below; affects nothing.
- **Gap** in Scholze at Theorem 11.1, p. 57: the source says the rational mapping object is the weight-`j` Adams piece of `K(X)`; it should include the shift `[−2j]`, as `X = Spec k`, `j = 1` shows; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d21e043c4f1c12ae8ae39a8f195b5aff331efbef", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII", "model": "fable", "worker": "chris-x19"} -->
