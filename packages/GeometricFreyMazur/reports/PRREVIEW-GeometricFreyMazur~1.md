# Review of GeometricFreyMazur (pull request #2130 at 15ecde1)

**Verdict:** needs changes

All six findings are P3. The gate passes, `Suggested.lean` elaborates with `sorry` as the only warning, the depcheck shows no UPWARD or CYCLE line, and all 15 sampled locators resolve. No statement failed the adversarial pass.

## R01 (P3) — The description denies a dependency on another author's open roadmap

**Location.** Pull-request description, generated block `merge-order`: "It depends on no other author's open pull request." The dependency paragraph lists only pull requests by the same author.

**Claim.** The README uses CanonicalModelsAndGonality as a supplier at lines 11, 13, 21, 27, 104–108, 956, 962, 992, 1144, 1154, 1266, 1282, 1330, 1336 and 1350 (its §§1.1–1.7, 8.1–8.7 and 9.1). That roadmap is a new folder in pull request #1726, opened by another author. It is not on main and not in the merge order. Using it is allowed, because it adds a new roadmap folder, but the description has to name it. The port also replaced two declared gaps with these citations: `gap:gonality-norm-and-base-change` (AlgebraicCurves) and `gap:singular-metric-li-yau` (RiemannianGeometry). Both are still in the package's `design/plan.json`, but the README no longer mentions either (0 occurrences).

**Witness.** `roadmaps list`: "#1726 CanonicalModelsAndGonality (new)", another author. `ORDER.txt` has no line for it. Its depcheck prints "NOT IN ORDER … insert it after its last supplier". That supplier is MaassForms (157); this roadmap is 311, so there is no direction defect.

**Repair.** Add "#1726 (CanonicalModelsAndGonality)" to the merge-order block before this pull request and to the dependency paragraph. Delete the sentence "It depends on no other author's open pull request." On the AlgebraicCurves and RiemannianGeometry jobs, withdraw the two gap announcements that these citations replace. If depending on #1726 is not wanted, the alternative is to restore the two `What … must provide (gap:…)` contracts in place of the CanonicalModelsAndGonality citations. Tested: once #1726 is named, the description agrees with README lines 104–108.

## R02 (P3) — §8.3 omits the analytic–algebraic comparison that its imported gonality bound assumes

**Location.** README line 1154 (§8.3): "*Needs:* CanonicalModelsAndGonality §§8.6–8.7; §8.2; §0.1; … ModularCurvesPartII §3.9; ModularCurvesPartII §5.16."

**Claim.** The proof route applies the analytic 7/800 bound for X(Γ_H) to bound the gonality of the algebraic subgroup quotient X_H. CanonicalModelsAndGonality §8.7 takes the isomorphism M(X(Γ)) ≅ F_ℂ as a hypothesis and leaves it to the modular-curve roadmap to supply. Nothing in §8.3's Needs line supplies it.

**Witness.** CanonicalModelsAndGonality README line 1836, at its head, marks this isomorphism as a hypothesis. ModularCurvesPartII §6.1, "Compact analytic–algebraic modular comparison" (its README line 2123), is in this README's Scope (line 9) but is missing from line 1154.

**Repair.** Add "ModularCurvesPartII §6.1 (compact analytic–algebraic comparison, giving the isomorphism M(X(Γ_H))≅ℂ(X_H) that CanonicalModelsAndGonality §8.7 assumes)" to §8.3's Needs. Tested: with this item, every step of the route has a listed input: classifying map to X_H, then CanonicalModelsAndGonality §1.6, then the comparison, then CanonicalModelsAndGonality §8.6.

## R03 (P3) — A worked example credits AlgebraicCurves Layer 12 with the gonality inequality

**Location.** README line 1603: "A nonconstant pencil in this linear system, after removing its fixed part, proves gon(D)≤gon(B). This is the domination contract of AlgebraicCurves Layer 12 used here and in the monodromy argument."

**Claim.** AlgebraicCurves states no gonality result. Scope (line 11) and §6.2 (line 956) both assign this inequality to CanonicalModelsAndGonality §1.6.

**Witness.** On main, `grep -ci gonalit TauCetiRoadmap/AlgebraicCurves/README.md` returns 0. CanonicalModelsAndGonality §1.6 (its README line 467) proves gonality k F ≤ gonality k F′ for finite F⊆F′ with the same exact constants.

**Repair.** Replace the second sentence with "This is CanonicalModelsAndGonality §1.6, used here and in §8.3." Write §8.2 instead if R05's renumbering is applied.

## R04 (P3) — `gonality` is redefined here, with its own API and Checks, instead of citing its owner

**Location.** README lines 21–34 (Conventions): "For fields k⊂K define `gonality` to be the infimum in ℕ of the degrees [K:k(f)] …", followed by three API bullets and four Checks. Also `Suggested.lean` lines 47–50.

**Claim.** The definition, its attained positive minimum, and the Checks for k(t), genus one, hyperelliptic fields and the junk value restate CanonicalModelsAndGonality §1.1 together with §§1.4–1.5. Line 11 of this README names that roadmap as the owner. The Lean body also adds a `FiniteDimensional` conjunct that the owner's body does not have, so the two roadmaps spell the same object two ways.

**Witness.** CanonicalModelsAndGonality `Suggested.lean` lines 64–65 read `sInf {n : ℕ | ∃ x : F, Transcendental k x ∧ Module.finrank k⟮x⟯ F = n}`. Both bodies give 1 on `RatFunc k`, 0 on `k`, and 0 on k(s,t).

**Repair.**
- In Conventions, state that `gonality` is CanonicalModelsAndGonality §1.1's definition, repeated in `Suggested.lean` only so that the headlines elaborate.
- Replace the API bullets and Checks with a citation of CanonicalModelsAndGonality §§1.1, 1.4 and 1.5.
- In `Suggested.lean`, use the owner's body verbatim, deleting `FiniteDimensional (IntermediateField.adjoin k {f}) K ∧`.

Tested: the two bodies agree on every extension. When K/k is finitely generated of transcendence degree one, every transcendental f gives a finite extension. Otherwise either none does or no transcendental f exists, and both bodies give 0. Both headlines therefore keep their meaning.

## R05 (P3) — A process sentence and a missing §8.1 record the roadmap's history

**Location.** README line 11: "The former §8.1 is now CanonicalModelsAndGonality §8.6; §§8.2–8.4 retain their numbering." Layer 8 starts at §8.2 (headings at lines 1128, 1142 and 1156).

**Claim.** No roadmap cites this one by section, so no old → new mapping is needed. The sentence and the numbering gap are process narrative.

**Witness.** `roadmaps grep GeometricFreyMazur`, run over main and 434 open heads, finds only CongruenceSpectralGap README line 922. That line names this roadmap but cites no section of it.

**Repair.** Delete the sentence. Renumber §§8.2–8.4 as §§8.1–8.3 and update these references:
- line 1144: "CanonicalModelsAndGonality §8.6 and §8.2" becomes "CanonicalModelsAndGonality §8.6 and §8.1 of this roadmap";
- line 1154: §8.2 becomes §8.1;
- line 1168: §8.3 becomes §8.2;
- line 1244: §8.4 becomes §8.3;
- lines 1274, 1282 and 1322: §8.3 becomes §8.2.

## R06 (P3) — The `geometric_frey_mazur` docstring credits BT16 Theorem 2 with a threshold uniform in the constant field

**Location.** `Suggested.lean` lines 74–75: "Uniform geometric Frey–Mazur (BT16 Theorem 2): the prime threshold depends only on the gonality bound, before the constant field and function field are chosen."

**Claim.** BT16 fixes k before it chooses M_N. The threshold that is uniform in k comes from this README's §9.5, which descends to a finitely generated k₀⊂ℂ and embeds it. That argument is sound.

**Witness.** BT16 lines 58–59: Theorem 1 fixes k in its first sentence and only then chooses M_N. BT16 line 67: Theorem 2 inherits "k, N, M_N as above".

**Repair.** Change the docstring to: "Geometric Frey–Mazur over one-variable function fields (BT16 Theorem 2), with the threshold made independent of the constant field as in README §9.5: M is chosen before k and K." The statement itself is unchanged.

## Verified sound

**Gate and build.**
- I re-ran the full gate on 15ecde1: every counter is 0 and the result is OK.
- Depcheck output for this roadmap: `depcheck: 232 roadmaps, 2090 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `lake env lean TauCetiRoadmap/GeometricFreyMazur/Suggested.lean` gives exactly two warnings, `declaration uses sorry`, at lines 59 and 78.
- The diff outside the roadmap folder is empty.

**Signatures.**
- I elaborated `#check @gonality`, `#check @full_monodromy` and `#check @geometric_frey_mazur` in a scratch copy. The types match the Conventions paragraph and the §9.6 and §9.8 signature paragraphs.
- The file has no `variable` block, so no binder can have been dropped. Nothing changed as a result of the check.
- Hypothesis probe: `FunctionField ℂ (RatFunc ℂ)` and `IsScalarTower ℂ (RatFunc ℂ) (RatFunc ℂ)` elaborate by `infer_instance`, so the headline hypotheses can be satisfied.

**Padding and headlines.**
- Padding probe: `simp` closes neither `gonality k (RatFunc k) = 1` nor `gonality k k = 0`. `gonality` is the one definition the headlines need, and both theorems are deep. Nothing is padding.
- Headlines:
  - §9.8, function-field Frey–Mazur: stated as `geometric_frey_mazur`.
  - §9.6, full monodromy: stated in function-field form as `full_monodromy`.
  - §9.7, the original-base form: not statable. Neither pin has an elliptic or abelian scheme carrier (a grep for `AbelianScheme` and `EllipticScheme` in Mathlib and Tau Ceti finds none). The docstring says so.
  - §§7.5 and 9.5 rigidity, the §§10.1–10.5 surface results, and the multiplicity, repulsion and systole theorems: not statable without Z(p). The docstring names each one.

**Library declarations opened at the pins.**
- Mathlib:
  - `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean`: `ProjGenLinGroup` (41), `mk_eq_mk_iff` (64), `toPGL` (113), `toPGL_injective` (120).
  - `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean`: exists.
  - `Mathlib/Analysis/Matrix/Normed.lean`: `norm_eq_sup_sup_nnnorm` (87), `norm_apply_le_norm` (106).
  - `Mathlib/Data/Sym/Basic.lean`: `Sym.map` (342), `Sym.map_map` (361).
  - `Mathlib/NumberTheory/FunctionField.lean`: `FunctionField` (59).
  - `Mathlib/Algebra/Module/Torsion/Basic.lean`: `AddSubgroup.torsionBy` (`def` at 971; the README's 972 falls inside the declaration), `torsionBy.zmodModule` (1009).
  - `Mathlib/Algebra/Module/ZMod.lean`: `toZModLinearMap` (81).
  - `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean`: `Point.map` (822).
  - `Mathlib/LinearAlgebra/Determinant.lean`: `LinearMap.det` (164). It returns 1 when there is no finite basis, as the README says.
  - `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`: `SL2.commutator_eq_top` (804), with hypotheses a≠0 and a²≠1.
- Tau Ceti:
  - `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean`: `closure_range_toSpecialLinearGroup_eq_top_of_field` (600).
  - `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean`: `TauCeti.RiemannSurface.FiniteHolomorphicMap` (134; fields for two distinct values and finite fibres), `degree` (121), `degree_comp` (435).
  - `TauCeti/Analysis/Complex/RiemannSurface/Ramification.lean`: `ramificationDivisor` (114; coefficients e−1).
  - `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean`: `TauCeti.Isogeny` (139).
  - `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Descent.lean`: `TauCeti.Isogeny.existsUnique_map_eq_iff_galoisFixed` (117).
  - `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Hom.lean`: `Hom.degree_zsmul` (63).
- In total, 24 declarations confirmed.

**Cross-roadmap citations resolved.**
- On main:
  - SchemeAndStackFoundations §§0.8, 0.9, 0.11, 1.17, 3.2, 3.5 (`sectionNorm`, `lineBundleNorm_divisor`), 4.11–4.13 (`bertini_smoothness`), 5.1–5.3, 5.9 and 5.10.
  - ComplexKahlerGeometry K3, plus §§6.3–6.4 tagged K6.1.
  - ModularCurves §§0D, 0E, 2C, 5B and 5C.
  - AlgebraicCurves Layers 3–7 and 12 (sublayers 12A–12E).
  - FuchsianOrbifolds Layers 0–5.
- At open heads:
  - ModularCurvesPartII §§1.2, 1.3, 2.3, 3.9, 3.14, 4.1, 4.6–4.8, 4.10, 5.7, 5.13, 5.16, 6.1, 8.4 (`complexConjugationComparison`), 8.5 (`genericBaseChangeAndLevelCompatibility`), 9.10 and 9.13. In §9.13 the cyclic multiplier 6 and the full multiplier 7 at m=4 match.
  - ComplexComparisonPartII C-1.1–C-1.3, C1.9, C2.2, C4.1–C4.5, C5.4 (`CurrentCalculus`, `AnalyticCycleIntegration`, `lelongPoincareSection`) and C6.2. Its conventions dd_c=(i/2π)∂∂̄ and (i/π)∂∂̄log|f|=[div f] match this README's.
  - AbelianSchemesAndArithmeticModuli A1.6 (`relativeEllipticEquivalence`), A1.8, A3.7, A6.7, A6.20, A6.25 and A6.34.
  - NeronModelsAndSemistableAbelianVarieties §§1.3 and 1.8.
  - InverseGaloisAndArithmeticFundamentalGroups IG.0.3, IG.1.3 and IG.3.1.
  - CongruenceSpectralGap §5.3 (λ′₁≥21/100).
  - CanonicalModelsAndGonality §§1.1–1.7, 8.1–8.7 and 9.1, including §8.6's bound gon ≥ 7·index/800.
- In total, 91 section citations resolved to existing headings at main or at the cited head. I read the content of ModularCurvesPartII §§4.7, 5.7, 5.16, 6.1, 8.4–8.5, 9.10 and 9.13; ComplexComparisonPartII C-1.2, C-1.3 and C5.4; CongruenceSpectralGap §5.3; and CanonicalModelsAndGonality §§1.1–1.7, 8.1–8.7 and 9.1. For the remaining AbelianSchemesAndArithmeticModuli ids (A3.1–A3.5, A6.1, A6.6) I relied on the citations tool, which reports nothing unresolved.

**Ownership.**
- I grepped main and the 434 open heads for "Frey.Mazur", "singular bicusp", "anti-Heegner", "Kani", "diagonal quotient", "self-twist" and "proper subgroup … index". No other roadmap owns Z(p), its CM± or SBC strata, the big diagonals, or a Frey–Mazur theorem.
- ArithmeticGaloisRepresentations §4.7 mentions a PSL₂ index bound only inside its persistence-of-image argument.
- The FuchsianOrbifoldsPartII scope (Nielsen cores) is disjoint from Layer 1.
- ModularCurvesPartII owns X(p) and T_m, and this roadmap imports them.

**Declared gaps.**
- Each of the nine gaps the README states has the same slug in `plan.json` and a single supplier section.
- Minimality:
  - ComplexComparisonPartII C-1.2 and C-1.3 cover only quotients by étale presentations, not ramified finite-group quotients.
  - FuchsianOrbifolds Layer 2 has no cosine law, translation length or lens bound.
  - Neither Mathlib nor Tau Ceti has a hyperbolic cycle-volume theorem.

**Source sample.** 15 targets, each checked against the text: theorem number, page, hypotheses, and support for the statement as written.

| Target | Locator checked | Result |
|---|---|---|
| 0.2 | BT16 §2.3 p.715, line 276; BTE §1 p.1, line 11 | supported (quotient by diagonal PGL₂, BT16 lines 283–286) |
| 1.2 | BT16 §3.2 p.719, line 427 | supported (y_p, θ_p asymptotics at lines 427–433); the matrices are the README's own and verified numerically |
| 1.5 | BT16 Lemma 6 p.720, line 450 | supported |
| 2.3 | BT16 Lemma 11(a) p.722, line 578 | supported verbatim in substance |
| 2.5 | BT16 Lemma 11(a), Prop 12(a) pp.722–724 | the README's count is supported; the source's uniqueness claim is refuted (Source issues) |
| 3.6 | BT16 Prop 17 pp.727–728, line 751 | supported, with the sign extension the README states |
| 5.2 | BT16 Prop 25 pp.736–737, line 1182; BTE §4.1 | supported (d³p⁻¹ at BT16 line 1195) |
| 5.3 | BTE Prop 4.1 p.3, line 106 | statement supported; the direction of the display is not verifiable (below) |
| 5.8 | BT16 Prop 27 pp.737–740, line 1224 | the README's added hypothesis is needed (Source issues) |
| 7.3 | BT16 Thm 29 proof items (1)–(3), lines 1420–1447 | supported |
| 7.5 | BT16 Thm 3 p.710 (line 76); Thm 29 p.740 (line 1388) | supported |
| 8.2 | no source; Tau Ceti transvection theorem, line 600 | argument checked (below) |
| 8.3 | BT16 lines 71–74, 81–82; ABR96 Thm 0.1 p.1 (ABR96 lines 14–17) | supported |
| 10.1 | BT16 Cor 30 p.742, line 1458; gon≤g+1 at line 1379 | supported with the enlarged threshold |
| 10.5 | BT16 Cor 32 p.742, line 1471 | supported; "a" minimal model is correctly weaker than the source's "the" |

**Adversarial table.** 32 rows; every value was computed by me.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `gonality` (Conventions; Lean 47) | k(t); k; k(s,t); genus one | 1 (f=t, degree 1); 0 (no transcendental f); 0 (empty set here, finrank 0 in the owner's body); 2 | holds; both bodies agree | R04 |
| `full_monodromy` (§9.6) | N=0,1; N=2 with p=227 and p=229; Legendre over ℂ(t); constant curve | N≤1 vacuous because gonality≥1; 7·227=1589<1600 excluded, 7·229=1603>1600 allowed; a proper H̄ gives gon≥7·229/800=2.004>1, contradiction; a constant curve has image {I} and is excluded by j∉k | holds; `5<p` is redundant for N≥2 (a note) | none |
| `geometric_frey_mazur` (§9.8) | N≤1; W=W′ with e=±id; a quadratic twist | vacuous; `TauCeti.Isogeny.id` (equivariance sides 0=0 at zero); E[p]⊗χ≇E[p] once the image contains SL₂ (§8.4) | holds; M before k is justified by §9.5 | R06 |
| §0.2 fibre | p=7 | \|PSL₂(F₇)\|=7·48/2=168; φ_i↦φ_i∘g⁻¹ fixes φ₂φ₁⁻¹ | holds | none |
| §0.4 SBC | p=7 | partners (p−1)/2=3 out of (p²−1)/2=24 cusps | holds | none |
| §1.2 | p=7, 101, 5 | y₇=1.725082 by both formulas; (1−b)·101²/π²=1.000646; S²=U^p=(SU)³=−I to 1e−9; tr(SU)=1; at p=5, 1−4sin²(π/5)<0 | holds | none |
| §1.3 witness | p=7,11,13,17,19,23,101,103 | word equals M_p; det 1; traces 100, 244, 340, …, 21220 = 2p²+2; M_p≡I mod p; deformed trace/p² = 0.67981, 0.68388, 0.683918 at p=101, 1009, 10007, against 27/(4π²)=0.683918 | holds | none |
| §1.4 | p=7 | minimal \|tr\|=47; 2arcosh(23.5)=7.6994 against 4log7=7.7836 | holds | none |
| §1.5 | p=7 | 14·π/7=2π, while 7·π/7=π | holds | none |
| §1.8 | p=101, y=1/2 | 0.969374; 4.163618; 0.939686; 0.984568 | holds | none |
| §2.3 | M→MU^k | γ_p(U)=σ_p fixes iy_p | holds | none |
| §2.5 | p=101, a=10, c=68 | both distances 9.132087; \|z₁−z₂\|=131.7; labels (29,3) and (72,98)=−(29,3); 2log101=9.2302 | holds (count, not uniqueness) | none |
| §2.6 | p=101; R=1 | midpoints 8.844443 apart; 2artanh√tanh(1/2)=1.657454 | holds | none |
| §3.6 | F₇; p=5, a=2 | 6 maps fixing 0 and ∞, then 1 map once 1↦1 is added; u+v≡0 mod 5 forces uv≥4=p−1 at (1,4) | holds | none |
| §4.4 | p=7, d=1, R=1/2 | displacements 0, 0.980099, 1.645565, 1.961531 (then symmetric); exactly k=0,1,6 are <1 | holds | none |
| §5.2 | d=4 | ψ(1)+ψ(2)+ψ(3)=8≤14<64 | holds | none |
| §5.3 | p=101, ε=1, R=log101 | sinh1/sinh R=0.02327≈2.35/p; the reciprocal is 42.97≈0.43p | holds | none |
| §5.4 | δ₃=10⁻³, δ₁=10⁻⁴, δ₂=10⁻⁵ | exponents −1/50000 and −17/10000 | holds | none |
| §5.6 | p=7 | g=3 from both (p+2)(p−3)(p−5)/24 (ModularCurvesPartII §4.7) and 1+(p²−1)(p−6)/24, which are identical polynomials; s=24; ratio 7 | holds | none |
| §5.8 | T₁×T₁ cycle | Σmult=2d\|G₀\|, Deg=4dK, ratio 3p/(p−6): 21 at p=7, 3.189 at p=101 | the hypothesis is needed and present | none |
| §7.2–7.3 | n=2, p=7 | 6·2!·7=84; two order-7 slots give lcm 7, not 49 | holds | none |
| §7.5 | N=1; N=3 | vacuous; covers gonality 1 and 2 | holds | none |
| §8.2 | p=2,3,5; the whole group | A₃ in S₃ has index 2; Q₈ in SL₂(F₃) has index 3; the preimage of A₄ in SL₂(F₅) has index 5=p (attained); Borel index 6; the whole group has index 1 and is excluded as not proper | holds | R05 (numbering) |
| §8.3 | N=2, p=229 | D≥p gives 7D/800≥2.004>1 | holds | R02 |
| §8.4 | F₅ with C₄ | A·diag(2,3)=[[0,3],[2,0]]=−diag(2,3)·A mod 5 | holds | none |
| §9.1 | Legendre at t=2, 3 | j=1728 and 21952/9 | holds | none |
| §9.4 | Ψ=[−1], f=id | χ(σ)f[p]=f[p], f[p] invertible and p odd, so χ=1 | holds | none |
| §10.1 | N=2, g=1 | gon=2 is not <2, so M₃ is needed | holds | none |
| §10.3 | 1/3(1,1), 1/3(1,2), 1/7(1,6), 1/2(1,1) | [−3]; [−2,−2]; six (−2)-curves; [−2] | holds | none |
| §10.5 | C²=−2 with C·E=1 or 2 | −1 and +2 | holds | none |
| dᶜ convention | f=z²; f=1 | (i/2π)∂∂̄log\|z²\|²=2δ=(i/π)∂∂̄log\|z²\|; 0 for f=1 | holds | none |
| point-ball worked example | line (z,az), a=1/2 | V/a(t)=1.2308, 1.1429, 1.0323 at q=0.1, 0.5, 0.9; derivative (a²−1)/(1−a²q)²<0 | decreasing, as claimed | none |

## Not verifiable

- BTE p. 3, the displayed tube-volume ratio in the proof of Proposition 4.1, and the normalising function in Proposition 3.1. The cached text is OCR, and the PDF cannot be rendered here. The OCR line order, sinh(ρ_X(p)/2) at BTE line 129 above sinh(ε) at line 131, is consistent with the README's claim that the printed ratio is the reciprocal, but it does not settle the question.
- BLR90 §1.2 Proposition 8 and §1.4 Proposition 2. These are uncertified and cited by locator only.
- The cusp-label formula behind the §3.6 negative-reflection example. I checked the arithmetic (u+v≡0 mod p gives uv≥p−1) but did not derive the v/u ratio from the ModularCurvesPartII §9.13 boundary maps.

## Source issues

- **Gap** in BT16 at Lemma 5, p. 718: the source says the infimum over loops nontrivial after filling is reached by U(p)L(−p); it should be a witness that survives filling, since unipotent products lie in ker γ_p (line 393); affects the proof.
- **Misprint** in BT16 at §3.1, p. 718: the source says the cusped radius is the infimum of geodesic lengths; it should be half that infimum, the value Lemma 5's 2 log p gives; affects nothing.
- **Gap** in BT16 at Corollary 8 proof, p. 720: the source says a shortest loop has length at most 2 log p + O(1) and so meets one cusp neighbourhood; it should be 4 log p + O(1), and the one-cusp claim then needs a visit count; affects the proof.
- **Error** in BT16 at Proposition 12(a), p. 723: the source says at most one lift of c lies within (1+δ)ρ_X of z₀; it should be O(p^{16δ}) lifts, since the proof drops the stabilizer factors (p=101 example); affects a stated result.
- **Error** in BT16 at §2.2, p. 715: the source says X(p) is a fine moduli space; it should be a coarse moduli space, since with frames up to scale [−1] fixes every point; affects nothing.
- **Gap** in BT16 at Proposition 17 proof case (2), p. 728: the source says the bicusps lie on T_m with m = det g; it should be a signed conclusion, allowing det g < 0 and a conjugate Hecke locus; affects a stated result.
- **Gap** in BT16 at Proposition 25 proof, p. 737: the source says the CM argument covers both signs; it should be restricted to Heegner points, anti-Heegner points needing conjugate-diagonal volumes; affects the proof; corrected in print at BTE §4.1, p. 3.
- **Gap** in BT16 at Proposition 26 proof, p. 737: the source says mult_T is at most p^{−1+3δ} Deg; it should be p^{−1−2δ₃+3δ₁} Deg so that p·mult decays; affects the proof; corrected in print at BTE Proposition 4.2, p. 4.
- **Error** in BT16 at Proposition 14 and Remark 16, pp. 725–727: the source says nearby anti-Heegner CM points lie on a small Hecke divisor; it should be limited to Heegner points; affects a stated result; corrected in print at BTE Proposition 2.1, p. 2.
- **Error** in BT16 at Proposition 27, p. 737: the source says the bound holds for every curve outside all Δ_g; it should be a bound for curves with non-Hecke projections, since a T₁×T₁ cycle gives ratio 3p/(p−6); affects a stated result.
- **Misprint** in BT16 at Corollary 30, p. 742: the source says p > M_N suffices for genus below N; it should be M_{N+1} for N ≤ 2, since g=1 gives gonality 2; affects nothing.
- **Misprint** in BT16 at Theorem 29 proof, p. 742: the source says Deg(C) is at most 4πnd(2g−2); it should be 2nd(2g−2), the 4π belonging to volume; affects nothing.
