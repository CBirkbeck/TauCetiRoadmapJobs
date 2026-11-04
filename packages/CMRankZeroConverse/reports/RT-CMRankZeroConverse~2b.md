<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/993#issuecomment-6484114369 -->
Red team round 2 pass b (claude) of 902f65d

Verdict: needs_changes

1. **F01** (P3) Two SelmerIwasawaCohomology declaration names cited do not exist at its head

   Location: `packages/CMRankZeroConverse/README.md:87` ("by its etale_jStar_degreeOne, degree-one j_* classes …" and "§4.9 blochKatoStructure"); the same names at `README.md:262` and `README.md:339` (four occurrences on three lines).

   Claim: SelmerIwasawaCohomology §3.15 exports a declaration `etale_jStar_degreeOne` and §4.9 a declaration `blochKatoStructure`.

   Witness: SelmerIwasawaCohomology at #869 (head cbf830f): neither name occurs in its README nor in its Suggested.lean (grep of both, zero hits). §3.15's target is the bold item "Stalks of j_* and R^q j_*, and the degree-one Leray sequence" (its README line 1700 onward), which states the content cited; §4.9's target is "The Bloch–Kato local condition on T and W" (line 1933), whose text uses "the unramified rational condition" away from p.

   Repair (three lines, four occurrences): replace `§3.15 etale_jStar_degreeOne` by `§3.15, "Stalks of j_* and R^q j_*, and the degree-one Leray sequence"`, and replace `§4.9 blochKatoStructure` by `§4.9, "The Bloch–Kato local condition on T and W" (unramified rational condition away from p)`. At `README.md:87` the sentence becomes: "by its target "Stalks of j_* and R^q j_*, and the degree-one Leray sequence", degree-one j_* classes are exactly the classes unramified at every omitted bad prime. Away from p the rational Bloch–Kato condition is the unramified one (§2.15 and §4.9, "The Bloch–Kato local condition on T and W"), and rational H¹ at the real place vanishes." Tested on the supplier Check at its line 1749 (ℚ, p=3, Σ={2,7}, cubic subfield of ℚ(ζ₇)): the ramified class is outside degree-one j_*, exactly the content the roadmap uses in §2.4.

2. **F02** (P3) `CuspForm.conj` locator is off at the current Tau Ceti pin

   Location: `packages/CMRankZeroConverse/README.md:49` ("`CuspForm.conj` in `TauCeti/NumberTheory/ModularForms/Conjugate.lean`, line 298").

   Claim: the declaration is at line 298.

   Witness: at Tau Ceti 358314d, `TauCeti/NumberTheory/ModularForms/Conjugate.lean:298` is the proof line `rw [ModularForm.coe_conj]` inside `ModularForm.qExpansion_conj`; `def conj` in `namespace CuspForm` is at line 309 (`qExpansion_conj` for cusp forms at line 371). Every other pinned locator in the README (43 declarations in 23 files) matches at the current pins.

   Repair: replace "line 298" by "line 309".

3. **F03** (P3) ArithmeticStatisticsPartI §0.7 is cited for a family it does not name

   Location: `packages/CMRankZeroConverse/README.md:133` ("§0.7 for the both-sign fundamental-discriminant family") and `README.md:465` (§5.1 *Needs:* "ArithmeticStatisticsPartI §§0.1, 0.7").

   Claim: §0.7 supplies the family of fundamental discriminants d with both signs ordered by |d|.

   Witness: ArithmeticStatisticsPartI at #1171, §0.7 "Discriminant-ordered fields" (its line 1299) is the family of number fields ordered by |Disc|, with the degree-2 remark at its line 1353; no target of that roadmap names fundamental discriminants (grep "fundamental discriminant" hits only the §0.1 Check at its line 391). The identification needs the dictionary d≠1 ↦ ℚ(√d), |Disc ℚ(√d)|=|d|, with d=1 the one exception, which the README leaves implicit ("up to finite-change conventions").

   Repair: at `README.md:133` write "§0.7 for quadratic fields ordered by |Disc|, which are the fundamental discriminants d≠1 through d↦ℚ(√d) with |Disc|=|d|; the discriminant d=1 is the single finite exception"; at `README.md:449` after "The family is unweighted" add "(the quadratic fields of ArithmeticStatisticsPartI §0.7 ordered by |Disc|, plus d=1)". Checked on d=−3, 5, −4, 8, 12: each is the discriminant of ℚ(√d), and the count of fundamental discriminants with |d|≤X, (4+1+1)X/π² by the three piece counts of §5.4, equals the count of quadratic fields with |Disc|≤X.

Three P3 findings, no P1 or P2. All six round-1 findings are repaired at this head; one repair introduced two citation names that do not exist in the supplier at its current head (S01). Pins used: Mathlib f6090c7, Tau Ceti 358314d (the `lake-manifest.json` of the content checkout; these differ from the pins the round-1 reports name, so every library locator was re-grepped).

## Verification of the round-1 findings

| Finding | Status | Witness at 902f65d |
| --- | --- | --- |
| a-F01 (P1) weight-two Tate module | repaired | `packages/CMRankZeroConverse/README.md:19` "M_f(1)=ρ_f^∨(1)≅ρ_(f*), rather than M_f, is a Tate-module component: … the λ-component of the rational Tate module V_p(A_f) … with complex-conjugate coefficient action"; `README.md:284` level 37 against level 11; `README.md:210` the determinant Check now names the λ-component. Recomputed: det ρ_f=ψχ at k=2, so ρ_f^∨(1)=ρ_f⊗ψ⁻¹ has trace ψ(ℓ)⁻¹a_ℓ=ā_ℓ and determinant ψ̄χ, which is ρ_(f*); AutomorphicGaloisRepresentations §6.1 at #1007 identifies the λ-factor of V_ℓ(A_f) with the arithmetic ρ_(f,λ). |
| a-F02 = b-F02 (P2) finite-condition gap | repaired, with one new defect | gap renamed `finite-condition-shapiro` (`README.md:91`, plan `gaps`, verbatim equal, checked by script); away-p comparison cited as supplied (`README.md:87`); coefficient extension and the quadratic corank identity derived (`README.md:93`); `isogeny-corank-all-primes` removed (`README.md:67`). The two declaration names the repair introduced, `etale_jStar_degreeOne` and `blochKatoStructure`, do not exist in SelmerIwasawaCohomology at #869 (S01). |
| a-F03 (P3) newform parent | repaired | `README.md:43` "extends the nonzero good-prime cuspidal eigenform with nebentypus `HeckeRing.GL2.EigenformAwayFromLevel` … and adds newspace membership and the normalization that the first Fourier coefficient is one"; pinned `Newform.lean:84,104` confirm. |
| b-F01 (P2) compound EllipticCurveModularity gap | repaired | `README.md:59` narrowed to the base-change identity; `README.md:61` new gap `congruent-number-root-numbers`; `README.md:57` derives finite order from `LSeries.tendsto_atTop` (pinned `Mathlib/NumberTheory/LSeries/Injectivity.lean:124`, abscissa `< ⊤` hypothesis) and isogeny invariance from R29.3 and R29.4 (ECM #1018 lines 1074–1075 "depends on the isogeny class", `newformOf_isogeny_invariant` line 1216, `IsNewformOf.coeff_eq` line 1422). Consumers repointed (§§0.1, 4.4, 5.3, 5.4). |
| b-F03 (P3) KatoEulerSystems §4.6 range | repaired | `README.md:101` "Section 4.6 supplies twisting and specialization …; these operations involve no zeta element"; the board package KatoEulerSystems at 9a2ec7c, §4.6, states "These hold at every p, including two, and for every integer j" with no admissibility hypothesis, so the new text is consistent with the supplier. §2.1 *Needs* (`README.md:300`) no longer cites the zeta gap. |

No repair changed `Suggested.lean`; the file is identical to the round-1 head.

## Verified sound

Counts: 9 Lean declarations read (4 definitions, 5 theorems); 30 numbered README targets read plus Conventions, 15 supplier contracts and all 13 gaps; 26 source locator groups verified against the cached texts (BT 12, Kato 8, BKLOS 6); 47 pinned declarations grepped at Mathlib f6090c7 and Tau Ceti 358314d (43 cited in the README with file and line, plus `DivisionRing.toRatAlgebra`, `NumberField.IsTotallyComplex`, `WeierstrassCurve.minimal`, the `MulAction (VariableChange R) (WeierstrassCurve R)` instance); 44 README Checks recomputed; 106 cross-roadmap citations resolved against the current heads (SelmerIwasawaCohomology #869, EllipticCurveModularity #1018, AutomorphicGaloisRepresentations #1007, ArithmeticGaloisDuality #858, PadicHodgeRegulators #1498, ModularIwasawaMainConjectures #1499, GL2AutomorphicRepresentationsAndTransfer #931, ComplexMultiplicationAndExplicitReciprocity #1254, ArithmeticStatisticsPartI #1171, ArithmeticStatisticsPartVII #1178, main ModularForms Layer 7, EllipticCurves Layers 1, 2, 5, 7, AlgebraicCurves Layer 10, the board package KatoEulerSystems at 9a2ec7c, the board design ModularIwasawaMainConjecturesPartII on the board's main). Lean: not run (the brief permits no Lean command here); binders compared by reading.

Dependency check, exact command of the brief, exit 0, complete output:

```text
depcheck: 186 roadmaps, 1222 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Merge order: CMRankZeroConverse is line 281; every supplier named is earlier (ArithmeticGaloisDuality 53, SelmerIwasawaCohomology 64, GL2AutomorphicRepresentationsAndTransfer 106, ArithmeticStatisticsPartI 128, ArithmeticStatisticsPartVII 162, AutomorphicGaloisRepresentations 184, ComplexMultiplicationAndExplicitReciprocity 185, EllipticCurveModularity 188, PadicHodgeRegulators 211, ModularIwasawaMainConjecturesPartII 215, KatoEulerSystems 247, ModularIwasawaMainConjectures 249); the only later roadmap named, RankZeroOneBSDPartII (282), is a consumer; RankOneConverse (251) is named only as an owner of rank-one results.

Gaps: 13 slugs, each in plan `gaps` and in the README contract with identical supplier and `needs` sentence (script comparison); no slug with supplier `none`; every slug is used by at least one *Needs* line. Each gap's supplier section exists at the current head: KatoEulerSystems §§4.4, 4.6, 5.1, 5.3, 7.2 (board 9a2ec7c; its §5.1 constructs `katoZetaMap` "using 4.4", whose admissibility assumption is exactly what `all-coefficient-places-zeta` removes, so the gap is not already provided); ModularForms Layer 7 (main, no conjugate-form identity); EllipticCurveModularity R29.4 and R29.6 ("Continuation and the functional equation" supplies the sign and continuation for E/ℚ only, no quadratic base change, no root-number table); AlgebraicCurves Layer 10; ArithmeticGaloisDuality D7.6–D7.7; SelmerIwasawaCohomology §§2.7, 3.6, 3.15–3.16, 4.26; ComplexMultiplicationAndExplicitReciprocity §§1.1, 1.2, 4.2 (`cmInductionComparison` is for A/ℚ, `ellipticCMLFactorization` for A/K; the arbitrary-A/K theta realization is not there); ArithmeticStatisticsPartVII §§5.9–5.11 ("Even congruent twists have corank zero given smith law" is conditional on the law; "Cm twists have corank zero at least half" assumes its windowed contract C). Minimality: nothing requested is in Mathlib, Tau Ceti, main or the cited heads.

Package policy: `git diff --stat origin/main...HEAD` touches only `packages/CMRankZeroConverse/`; no `lemma`, `set_option`, `#check`, `#eval`, `True` placeholder, sorry'd data, pull-request number, process word or machine path in README or Lean; imports are `import Mathlib` plus four `TauCeti.*` modules that exist at the pin; one module docstring naming the four unstatable headlines (§§3.2, 3.3, 4.2, 4.5) and what each lacks; every backticked local name in the README is declared in the Lean file and conversely; layer section comments in README order.

Headlines and padding: the five analytic headlines (§§5.2, 5.3, 5.4, 6.1, 6.6) are stated on native carriers; the converses (§§3.2, 3.3, 4.2, 4.5) are named as unstatable with their missing carriers (modular Galois realizations, Bloch–Kato Selmer carrier, zeta morphism, CM-newform predicate, classical p∞ Kummer Selmer group); §4.4's doubling identity is an input, not an end theorem. One-tactic probe: none of the five theorems follows from a definition or a pinned limit lemma; none mirrors a Check.

Ownership: `roadmaps grep --lean-only` for the nine local names over main and all open heads: no match outside this package. `roadmaps grep --readme-only` for "even Goldfeld" and "p-converse": only citations of BT and ModularIwasawaMainConjectures §5.4, whose three converses (Skinner–Urban good ordinary p≥3 with residual conditions, Fouquet–Wan with p∤N, rational BCS at good ordinary p>3) are restricted statements distinct from §3.2 (conditional on KMC_rational, every p) and §3.3 (CM, every p). `squareclassHeight` names ArithmeticStatisticsPartI §0.5 as owner and matches its definition (odd support, absolute norm, H(trivial)=1).

### Declaration ledger (all in `TauCetiRoadmap.CMRankZeroConverse`)

| Declaration; README | Explicit context | Instances and computed sides | Result |
| --- | --- | --- | --- |
| `ellipticLNonvanishingAtOne`; §0.1 | `{K} [Field K] [NumberField K] (W)`; no ellipticity | Pinned `WeierstrassCurve.LSeries` is the Euler product over `HeightOneSpectrum (𝓞 K)` of local factors computed on `W.minimal` at each completion (pinned `LFunction.lean:35–47,79,84`), so isomorphic models give one series and the predicate is isomorphism invariant. F=1 and F=2·L: first coefficients 1 and 2, only the first agrees. | sound |
| `congruentTwist`; §5.2 | `(n : ℤ)`, `shortCurve (-(n:ℚ)^2) 0` with `shortCurve A B` = y²=x³+Ax+B (pinned `ShortWeierstrass.lean:109`) | n=1,2,−1,0: a₄=−1,−4,−1,0; Δ=64n⁶=64,4096,64,0; d=4m: a₄=−16m², (4X,8Y) gives Y²=X³−m²X | sound |
| `congruentNumber_densityOne`; §5.2 | none; `open scoped Classical` | X=0: 0/0=0 in ℝ (finitely many); `n % 8 ∈ {1,2,3}` on ℕ; denominator 3X/π²+o(X) | sound |
| `congruentNumber_half_positive`; §5.3 | none | six squarefree classes of mass X/π² each; three allowed; 3/6 | sound |
| `congruentNumber_half_discriminants`; §5.4 | none; `d m : ℤ`, Lean `%` is `Int.emod` | d=−3: −3%4=1 ✓; d=−4: m=−1, −1%4=3 ✓; d=−8: m=−2, 2 ✓; d=−12: m=−3, 1 ✗ (correct: −12 is not fundamental); d=4,9,0 rejected; weights 5/4,1/2,5/4 of 6 | sound |
| `squareclassHeight`; §6.1 | `{K} [Field K] [NumberField K] (c)`; `FractionalIdeal.count K v` with K explicit (pinned `Factorization.lean:304,309`), finprod over the finite odd support | ℚ: [2],[1/2] → 2,2; ℚ(i): [5]→25, [3]→9, [2]=[i]→1 | sound |
| `cmTwists_nonvanishing_lowerHalf`; §6.1 | `[IsTotallyComplex K]`, `finrank ℚ K = 2`, `¬(span{3}).IsPrime`, `[A.IsElliptic]`, `¬Surjective (Int.castRingHom (Hom A.toAffine A.toAffine))`, `0<ε` | (3) in ℚ(ζ₃): 𝔭², not prime ✓; ℚ(√−2): 𝔽₃×𝔽₃ ✓; ℚ(i): 𝔽₉, prime, excluded ✓. End_K(A)≠ℤ forces the CM field inside K (the scalar of [α] on the K-rational cotangent line lies in K), hence equal to K; twist `quadraticTwistOf 0 (−t)` has D=4t (pinned `QuadraticTwist/Basic.lean:150–169`), the class of t; `{H<X}` finite by ArithmeticStatisticsPartI §0.5 Northcott, so `ncard` is the true count | sound; BT Prop 1.3 |
| `descendsToRat`; §6.4 | `{K} [Field K] [Algebra ℚ K] (W)`; instance `DivisionRing.toRatAlgebra` (pinned `Rat.lean:58`); `MulAction (VariableChange R) (WeierstrassCurve R)` (pinned `VariableChange.lean:146`) | base change of y²=x³−x: C=1; Y²=X³+X+(1+i): j=6912/(4+54i) non-real, no descent | sound |
| `cmTwists_nondescending_nonvanishing_lowerHalf`; §6.6 | as §6.1 | N=cX, removed ≤C√X: lower bound 1/2−(C/c)/√X+o(1)→1/2 | sound |

### Statement ledger

| Statement | Instances tried | Values on the two sides | Result |
| --- | --- | --- | --- |
| §0.1 rank-r proposition | (corank, order)=(0,0),(0,1),(1,0), r=0 | implication true, false, true | sound |
| §0.1 finite order | 11a1, 32a2 | first coefficient 1; F(x)→1 along ℝ by `LSeries.tendsto_atTop`; not identically zero | sound |
| §0.2 sign | k=2,4,6; k=0; k=3 | ε=+1,−1,+1; ε(−1)ʰ=−1,−1,−1; k=0 gives 1·1=1 (excluded) | sound |
| §0.2 projection | c=diag(1,−1), v=(1,−1) | P₊v=(1,0), P₋v=(0,−1); ℤ₂² swap: P₊(1,0)=(1/2,1/2) ∉ ℤ₂² | sound |
| §0.3 dictionary | k=2, trivial ψ; k=4 | det M_f=χ⁻¹, det M_f(1)=χ; 1−k+h=−1=1−h | sound |
| Conventions: W≅ρ_(f*) | αβ=ψ(ℓ)ℓ | ρ_f^∨(1) eigenvalues ℓ/α, ℓ/β; trace ψ(ℓ)⁻¹a_ℓ=ā_ℓ; det ψ̄χ | sound |
| §0.4 evaluation | p=3,h=1,c=4; σ₋₁ at h=1,2 | 1/4; −1, +1; BT line 240 σ_c↦c^(−k/2) | sound |
| §1.1 | irreducible rank 2; 1⊕χ | invariants 0; 1 (excluded) | sound |
| §1.2 double Poitou–Tate | (14.9.3) for T′⊂W′ then T⊂W | dual Selmer term H_f¹(ℚ,W)=0; H²(W′)=0; quotient 2−1=1; h¹(W′)=1; H_f¹(W′)=0; then H²(W)=0 | sound |
| §1.3 Euler characteristic | j_* versus G_S | the singular cones at ℓ∈Σ have equal dimensions in degrees 1 and 2, so (14.9.5) holds for j_*; 0−h¹+0=−1 | sound |
| §1.4 | p=2,3 | moduli 2^(−1/2), 1/2, 1/3 ≠ 1; ℚ_p(1) control: H_g=2, H_f=1 | sound |
| §2.1 control | R→R by π | Tor₁(R/π,R/π) length 1; H²_𝔮=0 ⇒ Tor=0; Nakayama on finitely generated H²_Iw,𝔮 | sound |
| §2.2 sign law | h=1,2 | z(cγ)=−(−1)ʰz(γ)=εz(γ); cγ=−εγ forces z=0 | sound |
| §2.3 basis | R/π quotient | length 1 ≠ 0, excluded by unit equality | sound |
| §2.4 | zero class; class ramified at ℓ∈Σ | no contradiction; fails j_* (SelmerIwasawaCohomology §3.15 Check, ℚ, p=3, Σ={2,7}) | sound |
| §3.1 reciprocity | k=2,4,6, r=h | (2πi)^(h−1)=1, 2πi, (2πi)²; signs (−1)^(k−r−1)=+,−,+; P·L=0 or 6 | sound |
| §3.3 CM at contained K | ℚ(i),2; ℚ(√−2),2; ℚ(ζ₃),3 | (ζ₈+ζ₈³)²=−2; Kato 15.14 branch (line 5753) | sound |
| §4.1 typed comparison | ηη̄=χ | η̄=η^∨(1); M_(f_ψ)(1)=Ind η̄, M_(f_ψ̄)(1)=Ind η (summands swap) | sound |
| §4.2 | a,b≠0 | ab≠0; BT line 253–259 same hypotheses; End_K(A)≠ℤ forces CM field = K | sound |
| §4.3 | r=0,1; ℤ₂² swap | 0, 2; integral index 2 | sound |
| §4.4 | (s−1)^r u | squared orders 0,2,4 | sound |
| §4.5 | 2r=0 in ℕ | r=0 | sound |
| §5.1 | ratios 1, 0, 3/4, 1/2 | only 1/2 satisfies the exact limit | sound |
| §5.2 Smith products | roots 0,1,−1 | −1, 2, 2 non-squares | sound |
| §5.3 root numbers | n=1,2,3,5,6,7 | +,+,+,−,−,−; sign −1 gives Λ(1)=0 | sound |
| §5.4 piece weights | odd n: cutoffs n,4n; even n: 4n,4n | allowed 5/4+1/2+5/4=3; total 4·(5/4)+2·(1/2)=6; ratio 1/2; count of fundamental discriminants with abs d ≤ X is 6X/π² | sound |
| §6.1 BKLOS 2.7 → Selmer form | BKLOS lines 196–198, 654–661, 871–880 | T₀(φ)=all s, even 3-Selmer rank, average ≤1 ⇒ mass at 0 ≥ 1/2; torsion exception handled by ArithmeticStatisticsPartVII §5.11 | sound |
| §6.2 forward identity | G(forward) | 81n²(x−y)²(x+y)+27n²(x+y)³−216n³z³=108n²(x³+y³−2nz³) | sound |
| §6.2 inverse identity | F(inverse) | (9nZ+Y)³+(9nZ−Y)³−54nX³=54n(Y²Z−X³+27n²Z³) | sound |
| §6.2 composite, origin, point | n=1 | 18n·id; [1:−1:0]↦[0:18n:0]; (1,1)↦(3,0): 0=27−27 | sound |
| §6.2 discriminant | B=−27n² | −432B²=−2⁴3⁹n⁴=−314928n⁴; n=3: −25509168 | sound |
| §6.3 | α=(ζX,Y) | α³=1, 1+α+α²=0; identity gives 3 | sound |
| §6.4 j≠0,1728 | twists by s and q | isomorphic iff s/q∈K×², one coset | sound |
| §6.4 j=0 | B,B′ rational | s³B/B′∈K×⁶ ⇒ [s]³=1 in exponent-two K×/(ℚ×K×²) ⇒ [s]=1 | sound |
| §6.4 j=1728 | A,A′ rational | s²=q u⁴ ⇒ (s/u²)²∈ℚ ⇒ s/u²∈ℚ or ℚ√D; √−2 on y²=x³−x gives y²=x³+2x, and a²=2b² impossible | sound |
| §6.5 | ℓ=5,3,2 in ℚ(i) | 25, 9, 1; H_K(a[n])≥c n_out², O(√X) choices | sound |
| §6.6 | cX, C√X, ratio 3/4 | lower bound →1/2; 3/4 preserved; empty descent exact | sound |

Checks recomputed (44): §0.1 (5), §0.2 (4), §0.3 (3), §0.4 (3), §1.1–1.4 (4), §2.1–2.4 (4), §3.1–3.3 (3), §4.1–4.5 (5), §5.1–5.4 (5), §6.1–6.6 (8). All agree with their sections and with each other.

Supplier conventions compared at the interface: M_f geometric good polynomial `X²−a_ℓX+ψ(ℓ)ℓ^(k−1)` equals AutomorphicGaloisRepresentations §1.5's cohomological factor; Kato's j_* convention is ModularIwasawaMainConjectures §0.6's `iwasawaH1/H2`; `KMC_rational` is §0.7's "equality of ideals in Λ[1/p]" with the p=2 length form; PadicHodgeRegulators §1.7(d) is local Shapiro carrying H¹_f to H¹_f; SelmerIwasawaCohomology §4.26 gives H¹_f(F,V_pE)=T_pSel_(p∞)⊗ℚ_p, whose dimension is the §2.11 corank; §3.16's twist `Tw_k(γ)=χ(γ)^(−k)γ` matches §0.4's evaluation `σ_c↦c^(−h)`; ArithmeticStatisticsPartI §0.5's height, §0.15's positive denominator `c_(F,Σ)X+o(X)` and §0.1's piecewise rescaling have the hypotheses used (nonempty pieces with `X^κ` asymptotics); ArithmeticStatisticsPartVII §5.11's endpoint is the liminf ≥ 1/2 in the same height, each class once; GL2AutomorphicRepresentationsAndTransfer R17.4.16 gives `L_F(s,AI θ)=L_K(s,θ)` and cuspidality iff θ≠θ^σ.

Binder audit: no `variable` block exists in `Suggested.lean`; every hypothesis is in the declaration's own signature; read against the pins, each elaborated type matches its README statement (the round-1 repair report records a `#check` audit on this unchanged file).

## Not verifiable

- `Suggested.lean` elaboration: not run here (no Lean command is permitted in this pass); the worker's signature extraction failed for an environment reason (a missing Tau Ceti object file), not a package reason; the repair report of round 1 records exit 0 with five `sorry` warnings on this identical file.
- Kato Theorem 12.5(1) at the L-value argument is OCR-damaged in the cached extraction (Kato lines 4066–4068); the roadmap routes the f/f* question through `gap:newform-central-analytic-interface`, under which either reading gives the same nonvanishing.
- ModularIwasawaMainConjecturesPartII is a board design (its plan has no `nodes`; CZ.4–CZ.6 and the five cited target names are in its design README). It is in the merge order and is a valid supplier; its own import of a roadmap `CMAllPrimeMainConjectures` that exists nowhere is that design's defect, not raised here.
- The published BT (Annals 203) was not read; all locators are to arXiv v2 as the manifest records.
- Ownership against open pull requests whose files the brief does not give was not checked beyond the roadmap index's grep over all 414 open heads and main.

## Source issues

- none new. The round-1 items (BT footnote 4 to Theorem 2.6; BT (3.1) one-step deduction; BT untwisted Selmer display at line 256; Kato §14.13 period factor; Kato 15.17 lemma reference; BKLOS (9.2) torsion over ℚ; BKLOS §9.2 raw parity) were re-read at the same lines and stand as recorded.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "902f65d3b72ccf77d25c154a086c5a3794d4aa36", "job": "RT-CMRankZeroConverse~2b", "model": "fable", "worker": "chris-x8"} -->
