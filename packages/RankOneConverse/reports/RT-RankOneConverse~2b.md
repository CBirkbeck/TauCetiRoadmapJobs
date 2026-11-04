<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1780#issuecomment-6636253536 -->
Red team round 2 pass b (claude) of 9fd9f65

Verdict: needs_changes

1. **F01** (P2) The p-power torsion-freeness of the formal group used by §5.1 has no explicit owner

   Location: `packages/RankOneConverse/README.md` line 59 ("reduction is injective on local p-power torsion because the formal-group kernel over ℚ_p is torsion-free") and line 482 ("At good p≥5 the formal-group kernel is torsion-free"); Needs at line 484 "EllipticCurves Layers 1, 3–4 and 7".

   Claim: EllipticCurves Layers 1 and 4 supply that E₁(ℚ_p)=Ê(pℤ_p) has no p-torsion (Silverman IV.6.4: for e<p−1 the formal logarithm is an isomorphism Ê(𝔪)≅𝔪).

   Witness: EllipticCurves on main, README lines 637–645, lists the formal-group milestones (law, log/exp over ℚ-algebras, convergence, Ê(𝔪)≅E₁(K)) with no torsion statement; the only mention is the Provenance line 1852 "torsion-freeness of E₁ under the standard ramification condition" describing the Stoll repository, and Layer 4 (lines 793–1154) contains no "torsion" at all. The pinned Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Torsion.lean` line 72 `WeierstrassCurve.FormalGroupPoint.eq_zero_of_nsmul_eq_zero` needs `IsUnit (n : O)`, and line 114 `eq_zero_of_mem_kerReduction_of_nsmul_eq_zero` needs `(n : A) ∉ u.asIdeal`: both cover only torsion of order prime to the residue characteristic, not n=p.

   Repair: in the Tau Ceti contract (line 55) add "`WeierstrassCurve.FormalGroupPoint.eq_zero_of_nsmul_eq_zero` and `WeierstrassCurve.eq_zero_of_mem_kerReduction_of_nsmul_eq_zero` in `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Torsion.lean` give the prime-to-p torsion-freeness of E₁(ℚ_p); the p-power case is not at the pin." In the EllipticCurves contract (line 59) replace "because the formal-group kernel over ℚ_p is torsion-free" by "because, for e=1<p−1, the formal logarithm of EllipticCurves Layer 1 milestone (ii)–(iv) is an isomorphism Ê(pℤ_p)≅pℤ_p (Silverman IV.6.4), so E₁(ℚ_p) has no p-torsion"; if that milestone is read as not containing IV.6.4, declare `gap:formal-group-p-torsion` to EllipticCurves Layer 1 with needs "For an elliptic curve over ℚ_p with p≥3, prove that the kernel of reduction E₁(ℚ_p) is torsion-free, via the formal logarithm isomorphism Ê(pℤ_p)≅pℤ_p." Tested on the instance that needs it: p=5, E(ℚ₅)[5^∞]↪Ẽ(𝔽₅) of order ≤10<25 then gives E(ℚ₅)[5^∞]=E(ℚ₅)[5], which is the equality the `good-local-torsion-comparison` gap takes as input; with only the prime-to-p lemma nothing bounds the 5-part.

2. **F02** (P3) The archimedean clause of gap:squarefree-base-change-signs asks for what GL2 R16.3.6 and R17.4.3 provide

   Location: `packages/RankOneConverse/README.md` line 69 and `design/plan.json` gap `squarefree-base-change-signs`: "and the archimedean root number −1 of the weight-two discrete series after base change to ℂ".

   Claim: that archimedean value is missing from the supplier.

   Witness: GL2AutomorphicRepresentationsAndTransfer head 769f46a, R16.3.6 (show output line 971–975): complex angular weight m has epsilon i^{|m|}, "D₂ has epsilon −1; angular weights ±1 both give i"; R17.4.3 (line 1828–1832) "Real-to-complex transfer restricts the real Weil parameter … at every finite and infinite place". Computed: BC_ℂ(D₂) is induced from (z/|z|)^{±1}, epsilon i·i=−1.

   Repair: delete the clause from the needs sentence in both places, ending it at "independently of the additive character"; in the GL2 contract (line 67) add "R16.3.6 with R17.4.3 gives the archimedean sign: the restriction of the weight-two real parameter to W_ℂ has angular weights ±1, so its root number is i·i=−1." Tested: Conventions Checks lines 39–40 recompute unchanged with −1 at ∞.

3. **F03** (P3) The elliptic instance of gap:gl2-full-forward and of §4.2 is already stated by ArithmeticStatisticsPartVI

   Location: `packages/RankOneConverse/README.md` lines 145 (gap:gl2-full-forward), 458–460 (§4.4 Needs), 509–511 (§5.3 "The forward theorem over ℚ … HeegnerPointEulerSystems full-forward contract"), 423–425 (§4.2).

   Claim: the forward implication over ℚ for an elliptic curve (analytic rank 0 or 1 gives the same algebraic rank and finite Sha) and the auxiliary twist with nonzero central value are supplied only through the gap.

   Witness: ArithmeticStatisticsPartVI head 26c32bd, target "Heegner logarithm and low rank" (show output line 2412): "The same target supplies the low-analytic-rank implication over Q for any elliptic curve with modular comparison data: analytic rank zero or one implies the same algebraic rank and finite Sha" and (line 2415) "prove that specialized auxiliary-twist existence here". ArithmeticStatisticsPartVI is at merge position 156, before this roadmap.

   Repair: at line 145 add after the gap sentence "Its coefficient-degree-one instance is ArithmeticStatisticsPartVI, 'Heegner logarithm and low rank', which §§4.4 and 5.3 cite for E/ℚ; the gap is consumed for d≥2 and for the twists A_f^D." In the §4.4 and §5.3 Needs replace "HeegnerPointEulerSystems full-forward contract" by "ArithmeticStatisticsPartVI 'Heegner logarithm and low rank' (elliptic forward theorem over ℚ)". In §4.2 add "Its elliptic instance with (D,N)=1 and an inert residually ramified prime is proved inside ArithmeticStatisticsPartVI, 'Heegner logarithm and low rank'; §4.2 proves the GL₂-type and ramified cases." Tested on Theorem C: with d=1 the last step uses only the ASVI target and the sum of orders 1+0.

4. **F04** (P3) The elliptic multiplicative dictionary is attributed to a section that does not state it

   Location: `packages/RankOneConverse/README.md` line 67 ("The elliptic multiplicative dictionary, a_q=+1 for split and a_q=−1 for nonsplit multiplicative reduction with the corresponding St and St⊗ξ types, is AutomorphicGaloisRepresentations §6.4") and line 460 ("AutomorphicGaloisRepresentations §6.4 for the multiplicative dictionary").

   Claim: §6.4 states the dictionary.

   Witness: AutomorphicGaloisRepresentations head 38be382, §6.4 (show output lines 2568–2570) gives the local matrix at p∥N with "χ_u unramified with arithmetic Frobenius a_p", the Euler factor (1−a_pp⁻ˢ)⁻¹, and "identify the associated elliptic curve's conductor N and L-function with those of f"; it never mentions split or nonsplit reduction. The values ±1 are the pinned `WeierstrassCurve.localPolynomial` (Mathlib `AlgebraicGeometry/EllipticCurve/LFunction.lean` lines 43–50: 1−X split, 1+X nonsplit); the Steinberg side is R16.3.2 "L(s,π)=L(s+1/2,χ)" (GL2 line 896).

   Repair: at line 67 write "The elliptic multiplicative dictionary combines three suppliers: `WeierstrassCurve.localPolynomial` (pinned Mathlib `LFunction.lean`) gives a_q(E)=+1 for split and −1 for nonsplit multiplicative reduction; AutomorphicGaloisRepresentations §6.4 identifies the elliptic conductor and L-function with those of f, so a_q(f)=a_q(E); GL2AutomorphicRepresentationsAndTransfer R16.3.2 gives a_q(f)=μ(q) for π_q=St⊗μ, so μ=1 is St and μ=ξ is St⊗ξ." At line 460 cite the same three. Tested: nonsplit a_q=−1=ξ(q) gives St⊗ξ, as Check line 464 says.

5. **F05** (P3) The uniqueness claim for `IsPrimitiveQuadraticTwist` is justified by a theorem that needs more than the predicate gives

   Location: `packages/RankOneConverse/Suggested.lean` line 46 ("By strong multiplicity one at most one newform satisfies this"); README line 394 ("By strong multiplicity one at most one newform g′ satisfies it").

   Claim: strong multiplicity one alone determines g′ from a_q(g′) at almost all primes.

   Witness: the predicate quantifies over `g : Newform M k` of any nebentypus; strong multiplicity one (AutomorphicLFunctionsAndLocalFactors AL.3.7.1, line 2183) needs isomorphic local components at almost all places, and an unramified component is determined by a_q together with the central character value, which the predicate does not constrain. The claim is still true: equal traces at almost all Frobenius elements make the attached Galois representations isomorphic (Brauer–Nesbitt and Chebotarev), so their determinants, hence the nebentypus, agree.

   Repair: in both places replace "By strong multiplicity one at most one newform satisfies this" by "At most one newform satisfies this: the coefficients at almost all primes are the Frobenius traces of the attached Galois representation, which they determine together with its determinant, so the nebentypus is forced and strong multiplicity one applies". Tested: for f=Δ and D=5 the only candidate is Δ⊗χ_5 of level 25 with trivial character.

6. **F06** (P3) `IsPrimitiveQuadraticTwist` has one discriminating Check

   Location: `packages/RankOneConverse/README.md` lines 411–419 (§4.1 Checks); only line 418 tests the predicate.

   Claim: each definition has at least three discriminating Checks.

   Witness: lines 413–417 and 419 test signs, discriminants, local squareclasses and analytic order, not the predicate; line 418 is the single predicate Check.

   Repair: add two Checks after line 418: "For f=Δ (level 1, weight 12) and δ=5, χ_5(2)=χ_5(3)=−1, so the predicate demands a_2(g′)=24 and a_3(g′)=−252 (τ(2)=−24, τ(3)=252); the level-25 newform Δ⊗χ_5 has them and Δ itself fails at q=2." and "For a CM newform f with self-twist character χ_K and δ coprime to D_K with δD_K fundamental, the discriminants δ and δD_K give the same primitive twist, since χ_{D_K}(q)a_q(f)=a_q(f) at every good q; the predicate names g′ from δ, and δ is not recovered from g′." Tested: 24≠−24 rejects Δ; for f of CM type the two characters differ exactly at primes inert in K where a_q(f)=0.

7. **F07** (P3) PadicMeasuresIwasawaAlgebras §§1.1–1.4 are cited for objects they do not contain

   Location: `packages/RankOneConverse/README.md` line 16 ("§§1.1–1.4, 4.1–4.6, 5.1–5.2 and 6.5: completed algebras, involution, characteristic divisors …").

   Claim: §§1.1–1.4 supply the completed group rings and the involution ι.

   Witness: PadicMeasuresIwasawaAlgebras on main, §1.1 (line 606) finite coefficients and joint coordinates, §1.2 (657) convolution of finite measure algebras, §1.3 (709) finite quotients of the p-adic units, §1.4 (798) coordinates of unit measures; the involution γ↦γ⁻¹ is SelmerIwasawaCohomology §3.0 (head ebadda3, line 1330, "the involution ι via `domCongr`"). Line 102 already cites "Layers 1–2 for measures and completed group rings".

   Repair: at line 16 replace "§§1.1–1.4, 4.1–4.6, 5.1–5.2 and 6.5: completed algebras, involution, characteristic divisors, determinant and specialization algebra" by "Layers 1–2, §§4.1–4.6, 5.1–5.2 and 6.5: measures, completed group rings, characteristic divisors, determinants and topological Nakayama; the involution ι:γ↦γ⁻¹ used in §2.1 is SelmerIwasawaCohomology §3.0". Tested: Check line 302 uses only ι and the height-one primes, both then owned.

Files read in full at this head: `packages/RankOneConverse/README.md` (588 lines), `packages/RankOneConverse/Suggested.lean` (88 lines), `packages/RankOneConverse/design/plan.json` (gaps, nodes), `packages/RankOneConverse/sources.toml`, `packages/RankOneConverse/metadata.toml`, the three earlier reports and both round-1 passes. Pins read from `lake-manifest.json`: Mathlib f6090c709, Tau Ceti 358314d4a.

## Round-1 findings at this head

| Finding | Status | Witness at 9fd9f65 |
|---|---|---|
| a-F01 (headlines statable) | repaired | `Suggested.lean` lines 48–86 declare `IsPrimitiveQuadraticTwist`, `infinite_twist_analyticRank_eq_zero`, `infinite_twist_analyticRank_eq_one`; README lines 394–396 name all three. The new definition brought two small defects of its own: S05 (justification of uniqueness) and S06 (Check count). |
| a-F02 (Skinner §2.1.x locators) | repaired | README line 29 "skinner-2020 §2.1, pp.334–336"; line 33 "§§2.2–2.3, pp.336–339"; line 35 "§2.1 and §2.4". skinner-2020 line 237 opens §2.1, line 316 §2.2, line 393 §2.3; no §2.1.x remains (grep). |
| a-F03 (finite S) | repaired | README line 31 "Let S be a finite set of places of ℚ containing ∞ and every prime dividing pND … The set of all places is excluded"; Check line 44; gap line 81 carries "a finite set S"; `plan.json` needs sentence verbatim (script check); §1.3 line 239 "S as in the conventions". |
| a-F04 (algebraic tensor) | repaired | README line 491 "lim_n E(ℚ_p)/p^nE(ℚ_p)≅ℤ_p⊕ℤ/p of the p-adically completed point group"; the two other local-model passages (lines 522, 575) mention no tensor. |
| a-F05 (gap repeats §4.6) | repaired | README line 102 cites PMIA §4.6 "over every noetherian normal UFD, including Ô^ur[[T]]"; gap line 105 asks only for preservation under O[[T]]→Ô^ur[[T]] and the augmentation criterion; PMIA main lines 2716 (UFD definition) and 2818 (base change only for finite free O→O′ with finite residue fields) confirm what remains missing. |
| a-F06 (Theorem 8) | repaired | README lines 480 and 587 "Theorems 5 and 8, Corollaries 6–7 and 9"; `sources.toml` version_note likewise; poonen-stoll lines 425, 456, 461, 474, 510 carry those labels. |
| b-F01 (BFH owner) | repaired | README line 19 "…leave to a consumer it calls RankZeroOneBSD, are owned by §4.1 here: no roadmap of that name states them"; line 567. MetaplecticAutomorphicForms head ebe857f lines 3422 and 3466 still name RankZeroOneBSD; `roadmaps list`, `ORDER.txt` and the board index have no such roadmap. |
| b-F02 (docstring carriers) | repaired | `Suggested.lean` lines 26–32 name the continuation of `WeierstrassCurve.LSeries`, Sha as a module for `ContinuousCohomology.tateShafarevich`, an odd-prime Selmer group; README line 51 names `WeierstrassCurve.LFunction`, `LSeries` and the four reduction predicates (pinned Mathlib `LFunction.lean` lines 43–85, `Reduction.lean`). |
| b-F03 (Weil restriction) | repaired | README line 77 "the identification of (Res_(K/F) A)(F), its Selmer groups and its Sha over F with those of A over K"; `plan.json` verbatim; SelmerIwasawaCohomology head ebadda3 still has no Weil-restriction target (grep "Weil restriction", "Res_", "restriction of scalars": none). |
| b-F04 (PC labels) | disputed, settled | The reason holds: the README's citable units are its Layer headings; the stale "RankOneConverse §§PC.0–PC.6" is in RankZeroOneBSDPartII (#1732, README line 7) and is that sibling's to fix. Not re-raised. |
| b-F05 (AL section) | repaired | `plan.json` section names four headings; at AutomorphicLFunctionsAndLocalFactors head 4ea5784 they are AL.3.6 (line 2140), AL.3.7 (2181), AL.5.1 (2748), AL.5.4 (2829). |
| b-F06 (pinned twist model) | repaired | README line 55 names `WeierstrassCurve.quadraticTwistOf` and three lemmas; pinned `QuadraticTwist/Basic.lean` lines 169, 299, 306, 318; line 59 restricts EllipticCurves Layer 5 to the classification and the Galois twist. |

No repair introduced an error in the statements it touched; the two defects attached to the new Lean definition are reported below.

## Verified sound

Counts: 3 Lean declarations read (1 def, 2 theorems); 19 README targets read (0.1; 1.1–1.4; 2.1–2.4; 3.1; 4.1–4.4; 5.1–5.3; 6.1–6.2) plus 6 worked examples; 27 source locators verified in the cached texts; 94 Checks recomputed; 122 cross-roadmap section citations resolved at the heads named below; 21 library names checked at the pins; 10 gaps compared with `plan.json` (all slugs and needs sentences verbatim, script check).

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/RankOneConverse/` (8 files). No `lemma`, `set_option`, pull-request number, process word or machine path in README or Lean (grep). Every target has a locator. `metadata.toml` topic `math.NT`. Imports: `import Mathlib` plus `TauCeti.NumberTheory.ModularForms.LFunction.Sign` and `TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.Character`, both present at the pin.

**Depcheck** (run with `--movable --content`):

    depcheck: 207 roadmaps, 1783 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. RankOneConverse is at position 252; every cited supplier is earlier (ArithmeticGaloisDuality 48, SelmerIwasawaCohomology 59, ModularCurvesPartII 84, AutomorphicLFunctionsAndLocalFactors 92, GL2 100, ArithmeticStatisticsPartI 121, ArithmeticStatisticsPartVI 156, Metaplectic 163, SerreWeightAndLevelOptimisation 180, AutomorphicGaloisRepresentations 182, EllipticCurveModularity 186, EllipticCurveModularityPartII 188, GrossZagierAndArithmeticHeights 226, AutomorphicCongruences 249, ModularIwasawaMainConjectures 250, HeegnerPointEulerSystems 251) or on main (PadicMeasuresIwasawaAlgebras, EllipticCurves, ModularForms).

**Declaration register** (`Suggested.lean`, no section variables; every binder explicit).

| Declaration | Context | Boundary values computed | Result |
|---|---|---|---|
| `IsPrimitiveQuadraticTwist` (line 48) | `{N M} [NeZero N] [NeZero M] {k : ℤ} f g D hD : Prop`, body quantifies primes q ∤ N·M·|D| | D=1: `ZMod 1`, χ(0)=1, predicate says a_q(g)=a_q(f) off NM, so g=f; D=5, f=Δ: demands a_2=24, a_3=−252; f=11a, D=−4: q=11 excluded as 11 | D·N | real body on pinned carriers; S05, S06 |
| `infinite_twist_analyticRank_eq_zero` (line 63) | `{N} [NeZero N] {k} f (hχ : f.χ = 1) (hk : 0 < k) (ε : ℤ) (hε : I^k·frickeSign = ε) S₀ hS₀ hN` | ε from Sign.lean line 148 Λ(k−s)=i^kε_NΛ(s), so ε=i^kε_N as in bfh-1990 line 58; D=1 is one member; k odd: no nonzero trivial-character form, vacuous; q=2∈S₀ needs D≡1 mod 8 | matches bfh-1990 lines 76–86 (ii) with S⊇primes of M, infinitude by enlarging S |
| `infinite_twist_analyticRank_eq_one` (line 78) | same | ε·D<0; rank exactly 1 = simple zero | matches bfh-1990 (i) |

Binder audit by reading (no Lean run): each headline's type mentions N, k, f, hχ, hk, ε, hε, S₀, hS₀, hN and binds M, g inside the existential; nothing is dropped, and the README's generality (positive weight, trivial nebentypus, any positive level, finite S₀ containing the level primes) equals the Lean's. The elaborated-signature file of the worker was empty (object file missing in its environment); the round-1 repair report records a successful elaboration after building `Sign`.

**Headlines and padding.** Headlines: 0.1, 1.2–1.4, 2.2–2.4, B, 4.1 (both branches), A, A′, C, E. Statable at the pins: only 4.1, which is stated; the others need A_f with its Hecke action, a Bloch–Kato Selmer group, Sha as a Galois module, the continuation of `WeierstrassCurve.LSeries` or an odd-p Selmer group, none at the pins (Mathlib `LFunction.lean` lines 43–85 is a formal Dirichlet series; Tau Ceti has only `selmerGroup₂`); the docstring names each. One-tactic probe: the two theorems are deep (BFH); the definition has a real body; no padding, no sorry'd data, no `True`, no hypothesis containing its conclusion.

**Adversarial pass** (one row per statement; values on both sides).

| Statement | Instances; values | Result |
|---|---|---|
| Conventions, root number (line 55) | k=2: i²=−1, ε=−ε_N; k=12 level 1: i^12=1, ε=ε_1=+1 | agrees with bfh-1990 line 58 Λ(s)=εΛ(k−s) |
| Conventions, Euler polynomials (line 42) | q=5, a=1: V* 1−T+5T²; V=V*(1): roots α/5,β/5, sum 1/5, product 1/5 | matches |
| Conventions, HT weights (line 41) | V: 0,−1; V*: 0,+1; V(−1): 1,0 = V* | matches |
| Conventions, signs (lines 39–40) | two inert: (−1)(−1)(−1)=−1; one inert +1; ramified St⊗ξ: −ξ(q)=+1, times −1 = −1; ramified St: −1·−1=+1 | matches skinner-2020 lines 885–890 |
| Logarithmic Euler factor (line 45) | p=5: a=1→1, a=0→6/5, zero only at a=6>2√5≈4.47 | matches GZAH §9.7 |
| Check line 44 (finite S) | D=−111≡1 mod 8, 2 splits; 37 | D ramified; primes of pND = 3,5,37 | consistent (2 listed in S is redundant, harmless) |
| 0.1 | U=(1 1;0 1) over 𝔽₅: U²=(1 2;0 1), fixed line (1,0); over 𝔽₂ U²=1 | matches Lemma 2.8.1 lines 746–758 |
| 1.1 | id_ℚ: dim 1, ker 0 ✓; zero map: ker ℚ ✗; dim 0 source ✗; loc(x)=(x,2x), e=2, h=3: transported x↦(3x/2,3x), h(loc 1)=(3,6)=loc′(2) | matches |
| 1.2 | rank d, Sha[p∞] finite: dim_L H¹_f=d/d=1; torsion generator: log 0 | matches Lemma 2.2.2 with the BSW input |
| 1.3 | local: h⁰=0, h²=h⁰(V*(1))=h⁰(V)=0, χ=−2 so h¹=2, finite line 1; global χ=−2, image = h¹−h² = 2 | matches Lemma 2.3.1 |
| 1.4 | axis vector (0,y) in X, conjugate (cy,0): X=axes, X∩F of dim 0 or 2, never 1; strict kernel ⊂ H¹_f, dim 1 and image 1 ⇒ 0 | matches Lemma 2.3.2 |
| 2.1 | Sel_∞ = ker(H¹(G_{K,S},M)→H¹(I_𝔭,M)) as skinner-2020 lines 632–635; X_∞=Hom_Λ(Sel_∞,Λ*) line 637; un-inverted action via adjunction; n=2 weights (2,1),(−2,−3); a=1+p: a⁻¹≠a | matches |
| 2.2 | containment of ideals of Λ^ur⊗L, skinner-2020 lines 673–675; AC §2.22 Thm 1.2 at head c88704a line 1179 "(L)⊇char(X) as fractional ideals of Ô^ur_L[[Γ_K]]⊗L"; p=5, n₀=8, κ=16, 8 | 16; γ↦a⁻¹γ at a gives 1 | matches |
| 2.3 | ℤ/p²: rational Tate 0; ℚ_p/ℤ_p: ℚ_p; a≠1: V^I/(a−1)=0 | matches (2.7.1) |
| 2.4 | Λ/(t²): char (t²)⊆(t), coinvariants O; Λ/(t−p): O/p rank 0; Λ/(p,t): rank 0; Λ: rank 1 and (X/TX)_{(T)} = X_{(T)}/T of dimension ≥ rank | matches Prop. 2.7.3 |
| 3.1 (B) | hypotheses 1–5 = skinner-2020 lines 106–114; orders (0,1),(1,0) sum 1; d=2: 1+1=2; ℤ/5⊕ℚ₇/ℤ₇ finite 5-part, infinite | matches lines 115–116 |
| 4.1 | twisted sign εχ_D(−M)=ε·sgn D when all primes of M split (bfh-1990 lines 71–75); value branch εD>0, derivative εD<0; D₀=−7, δ=17: −119≡1 mod 8; 13 square in ℚ₃, 2 not; level 11: χ_{−4}(11)=−1, χ_5(11)=+1 | matches bfh-1990 lines 76–86; infinitude by adding a ramified prime of each excluded field (D=1 excluded at most once) |
| 4.2 | St⊗ξ prime ramified: −(+1)=−1; St prime q with q′ inert of either type: BC at the unramified field is St, sign −1, total (−1)(−1)(−1)=−1; q′=2 forbidden | matches skinner-2020 lines 874–890 and extends (iii) to a q′ of type St⊗ξ |
| 4.3 (A) | rank d, Sha finite ⇒ dim 1 ⇒ w=−1; twist order 0 ⇒ rank 0 (§6.0e head d2cbd93 line 691) and Sha finite (gap); over K rank d+0; per-conjugate run gives order 1 each, product d | matches lines 66–70 and §3 |
| 4.4 (A′) | a_q=+1 split (1−X), −1 nonsplit (1+X) at the pin; conductor 2q split at both fails | matches lines 78–83; S04 for the citation |
| 5.1 | Sel_p≅Sel_{p∞}[p] when E(ℚ)[p]=0 (surjectivity via local torsion Kummer classes); r+dim F[p]=1; cyclic F with alternating perfect pairing is 0; E(ℚ₅)[5^∞] ≤10<25; model ℤ_p⊕ℤ/p: (1,0)↦1, (0,1)↦0; nonzero map ℚ_p/ℤ_p→ℚ_p/ℤ_p has isomorphic rational Tate map | matches skinner-2020 lines 902–903; S01 for the torsion input |
| 5.2 | genus(1)=1+1/12−1/4−1/3−1/2=0; genus(2)=1+1/4−1/4−0−1=0; 11a1 has rational 5-torsion | matches; SWLO §2.10 at head 0825d40 line 526 has ℓ≥3, q∤Mℓ |
| 5.3 (C) | dims 1+0=1; K_𝔭=ℚ_p so the 𝔭-restriction is the ℚ_p-restriction; orders 1−0=1 | matches lines 145–153 |
| 6.1 | dim 0 ⇒ w=+1; w(f/K)=−1 ⇒ twist sign −1 ⇒ ε(g)=−1, derivative branch, δ>0; ranks 0+d | matches §4 lines 920–926 |
| 6.2 (E) | 1−1=0; (2,1) would give 3≠1 | matches |
| Worked examples 1–6 | 2/2=1; −3 denominator; indefinite algebra at two inert primes; coinvariant ranks 1,0,0,1; (1,0)/(0,1); 1−0 and 1−1 | each agrees with its section |
| Gap squarefree-base-change-signs | split (−μ(q))²=+1; unramified field: μ(N ϖ)=μ(q)²=1, −1; ramified: μ(Nϖ_K)=μ(q), −μ(q); ∞: i·i=−1 | values right; S02 for the archimedean clause |
| Gap gl2-full-forward | HPES head c6b3301 §7.11 (line 1295) is elliptic over K under the Heegner hypothesis, §7.12 (1303) RM over K; §6.0e gives A_g(ℚ) finite only | genuinely missing for d≥2; S03 for d=1 |
| Gap ordinary-root-number-parity | SIC §4.28 (line 2374) is parity constancy in families; line 22 excludes root numbers | genuine |
| Gap wan-period-dictionary | GZAH head 7aec75d §9.22 (line 5697) compares with BDP and Brooks only; no "Wan", "ψ₀", "two-variable" | genuine |
| Gap strict-anticyclotomic-control | SIC §3.13 (line 1620) is cyclotomic; no anticyclotomic finite generation (grep) | genuine |
| Gap gl2-rational-kummer, quadratic-abelian-sha, good-local-torsion-comparison | SIC has no GL₂-type Kummer, no Weil restriction (grep); §2.12 (650) and §4.26 (2330) are elliptic | genuine |
| Gap unramified-augmentation-divisor | PMIA §4.6 line 2818 base change only for finite free O→O′ | genuine, narrowed |
| Gap gl2-analytic-products | AL head 4ea5784: no L(A_f)=∏L(f^σ) or base-change product (grep "base change", "conjugate", "A_f") | genuine |

**Supplier citations resolved at the current heads** (every section number cited in the README was located; heading line numbers are those of `roadmaps show` output or the rev checkout): SelmerIwasawaCohomology #869 ebadda3: §§2.1, 2.10, 2.12, 2.12a, 2.16–2.20, 2.24, 3.0, 3.8–3.13, 3.16, 4.9, 4.24, 4.26, 4.28, 4.29 (lines 344–2509), §4.29 line 2539 "elliptic pairing is alternating, with both kernels the maximal divisible subgroup … T×T". GrossZagierAndArithmeticHeights #1487 7aec75d: §§0a.3, 0a.4, 0.7, 3.2–3.4, 4.2, 8.3, 8.13, 8.17, 9.6, 9.7, 9.10, 9.13, 9.16–9.22 (lines 208–5697); §8.3 line 4788 ε=(−1)^{#Σ}; §8.17 line 5111 per-embedding with all embeddings in §8.13 line 5039; §9.17 line 5619 admits ramified level primes (Case I). HeegnerPointEulerSystems #1423 c6b3301: §§1.4–1.6, 7.11, 7.12, 8b.5. EllipticCurveModularityPartII #1491 d2cbd93 §6.0e line 691. ModularIwasawaMainConjectures #1499 8f21cae §5.4 line 1742 with (3) as cited. AutomorphicCongruences board package at its head c88704a (fetched by the index's read command): §2.22 line 1179, Theorem 1.2 restated as the README says. ArithmeticStatisticsPartVI #1176 26c32bd: "Anticyclotomic main-conjecture implication" (2396, elliptic, (D,N)=1, inert residually ramified prime), "Heegner logarithm and low rank" (2412), §4.22 (1795) "Rank one selmer criterion" (1799, at least two odd prime factors), "Twisted rank one selmer criterion" (1815), "Positive simultaneous rank one" (1969). ArithmeticStatisticsPartI #1171 4ced5ee: the bold target "Squarefree integers in residue classes" sits inside §0.6 "Squarefree integer denominators" (line 1171) with main term (6/π²)q⁻¹∏(1−p⁻²)⁻¹X and error C_q√X; at q=8, odd a: X/π². AutomorphicGaloisRepresentations #1007 38be382: §§1.4, 1.5, 4.1, 6.1–6.4, 7.2, 7.5–7.7; §7.7 line 3189 has exactly the two quantifiers of README line 63. GL2AutomorphicRepresentationsAndTransfer #931 769f46a: R16.1.8, R16.3.2 (a(St⊗χ)=1 or 2a(χ)), R16.3.5, R16.3.6, R16.4.6, R17.3.1, R17.3.8, R17.4; no local root number of St⊗μ anywhere, so the nonarchimedean part of the gap is genuine. ArithmeticGaloisDuality #858 59edfe2: R02.1.3, R02.3.1, R02.4.2–R02.4.4 (finiteness for finite S line 3508, Euler characteristic line 3802), R02.5.1. MetaplecticAutomorphicForms #1063 ebe857f §§8.85–8.87 (factors (2mN³)⁻¹, (2m)⁻¹, line 3446 "No nonvanishing theorem under all local conditions is concluded here"). AutomorphicLFunctionsAndLocalFactors #924 4ea5784 AL.1–AL.3 and the four named headings. SerreWeightAndLevelOptimisation #1013 0825d40 §§2.10, 4.7, 4.8. EllipticCurveModularity #1018 b7c957c R29.5, R29.6 (continuation with bad factors, line 1928). ModularCurvesPartII #913 07e21ad §7.2 line 2282 (f↦2πi f dτ, width-w cusp f dq_w/q_w). PadicMeasuresIwasawaAlgebras main §§4.1–4.6, 5.1, 5.2, 6.5 (S07 for §§1.1–1.4). EllipticCurves main Layers 1–5, 7 (S01). ModularForms main 10B (genus formula line 1115), 10C (S₂≅H⁰(Ω¹) line 1118).

**Ownership by object** (`roadmaps grep` over main and the 446 open heads, plus the board index): no other declaration of `IsPrimitiveQuadraticTwist` or `infinite_twist_analyticRank*`; the BFH deduction is claimed by no existing roadmap (Metaplectic names RankZeroOneBSD, which exists nowhere); CMRankZeroConverse (#1744, line 7) records "RankOneConverse owns its rank-one results"; RankZeroOneBSDPartII (#1732, line 9 of its design README) leaves Theorems A, A′, B, C, E here. Ownership against open pull requests whose files the brief did not give was checked only through that index.

**Source locators verified** (cached texts): skinner-2020 Theorems A (line 66), A′ (78), B (104–116), C (145–153), E (913–917), §2.1 (237), §2.2 (316), §2.3 (393), §2.7 definitions (623–639), Prop. 2.7.2 (673–675) and its proof (682–706), Prop. 2.7.3 (741), Lemma 2.8.1 (746–758), §3 (848–907), §4 (908–926); bfh-1990 functional equation (55–75), Theorem (76–86), twisting remark (94–99); poonen-stoll 425, 456, 461, 474, 510; wan-2020 Theorem 1.2 via the AutomorphicCongruences restatement; bsw-2026, skinner-urban-author and brooks-2015 locators as resolved in round 1 (unchanged text, unchanged README lines).

**Checks.** All 94 Checks recomputed where numeric; none false, vacuous or a restatement. Definitions: §1.1 (3), §1.4 (4), §2.1 (6) have at least three discriminating Checks; `IsPrimitiveQuadraticTwist` has one (S06).

## Not verifiable

- No Lean was run (forbidden here); the worker's signature file was empty because its environment lacked the `Sign` object file. The binder audit above is by reading.
- The ten declared gaps are contracts; their mathematics (exact anticyclotomic control, the ψ₀ dictionary, absolute parity, all-primary forward finiteness) was not re-proved.
- bsw-2026 is an arXiv v2 preprint; no published numbering to compare.
- The internal arguments of Wan §7E and §9, Brooks §8 and Metaplectic §§8.73–8.84 were not re-derived; only their exported statements were compared.
- The AutomorphicCongruences README was read at its board head c88704a through the index's read command, not from a checkout.

## Source issues

- **Misprint** in bfh-1990 at the introductory Theorem, printed p.544 (lines 82 and 85): the source labels both assertions (i); the second should be (ii); affects nothing.
- **Misprint** in skinner-2020 at the proof of Lemma 2.8.1, printed p.347 (line 749): the source names the tame-inertia generator at a prime q while the prime under discussion is ℓ; it should be ℓ; affects nothing.
- **Misprint** in skinner-2020 at the proof of Proposition 2.7.2, printed p.346 (lines 705–706): the source calls the two Iwasawa algebras unique factorization ideals; it should say unique factorization domains; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9fd9f650257432f50c9f7bf41b1d568e48538805", "job": "RT-RankOneConverse~2b", "model": "fable", "worker": "chris-x10"} -->
