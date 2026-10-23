<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/940#issuecomment-6372383895 -->
Review (claude) of ffdfe1b

Verdict: accepted
Conditional on the announced gaps: `stable-finite-range`, `integral-chern-calibration`, `cyclic-local-degrees`, `inner-type-a-structure`, `adelic-rational-masses`, `classical-tamagawa-proof`, `order-finite-generation`, `universal-deligne`, `infinitesimal-classifying-comparison`, `graded-indecomposable-api`, `multiplicative-serre-comparison`

1. **F01** (P3) The §5.5 locator does not contain the S-integer or order statements

   - **Location.** `packages/BorelRegulators/design/README.md` line 645, and `design/plan.json` line 1387. Quote: "(borel1977, §6.4, pp.632–633, lines 595–615; arithmetic localization import from ArithmeticKTheory §§3.3–3.4.)"
   - **Claim.** §5.5 says that the O_F and O_(F,S) images are equal lattices, and that the image of an order is commensurable with them. The cited source section does not state either claim.
   - **Witness.** borel1977 lines 595–615 (printed pp.632–633) only normalise the regulator R_m of the ring of integers and compare it with the zeta leading term. S-integers and orders do not appear there.
   - **Repair.** Replace the locator with: "(regulator normalisation: borel1977, §6.4, pp.632–633, lines 595–615; the S-integer and order transport is elementary given ArithmeticKTheory §3.3 surjectivity in odd degree ≥3, §3.4 and gap:order-finite-generation.)" Make the same change in plan.json. Tested on F=ℚ, n=3, S={2}: the residue term K₄(𝔽₂)=0 makes K₅(ℤ)→K₅(ℤ[1/2]) onto, so both images are tℤ and the ratio is 1. The new locator claims nothing more.

2. **F02** (P3) §5.2 uses R_Bo before §5.3 defines it, and its *Needs* line points to the wrong section

   - **Location.** README line 580: "Let R′_Bo be Burgos Definition 9.10’s covolume relative to the compact-dual homotopy lattice, and R_Bo the covolume after the character identification with Cₙ(F)." Line 597: "*Needs:* §2.1; §5.1; …". plan.json line 1198 (`target:5.1`).
   - **Claim.** R_Bo is defined only in §5.3 (line 601), and both covolumes need the lattice theorem of §2.3/§5.3. Neither appears in the *Needs* line. §5.1, which is listed, is used by neither the statement nor the proof route. The homotopy-fibre sequence of StableHomotopyKTheory §§2.4–2.5 also needs that roadmap's §2.3 (the fibre of a fibration is its homotopy fibre) before it applies to SO→SU→SU/SO.
   - **Witness.** At the StableHomotopyKTheory head, §2.3 identifies the fibre of a fibration with its homotopy fibre, and §§2.4–2.5 are stated for homotopy fibres only. Nothing in the §5.2 route mentions §5.1.
   - **Repair.** State §5.2 as a lattice fact that needs no covolume of Λₙ: "the transported compact-dual homotopy lattice has covolume (2π)^dₙ·ε(F,n) in the coordinates of Cₙ(F)". Derive R_Bo=(2π)^dₙ·ε·R′_Bo in §5.4, after §5.3. Replace §5.1 by §2.3 in the README and plan prerequisites, and add StableHomotopyKTheory §2.3. Tested on ℚ, n=3: the generator gets index 2 and twist factor 2π, so the covolume is 4π. This is the §5.2 Check value R_Bo/R′_Bo=4π.

3. **F03** (P3) "Nonintegral gauge place" in §3.5 should name the exact condition

   - **Location.** README line 374: "choose a finite S containing every nonsplit place, every nonintegral gauge place and every place with nonstandard level. At v∉S, |ω|_v(U_v)=∏_(j=2)^a(1−q_v^(−j))."
   - **Claim.** The displayed mass needs ω to generate the invariant top forms of the standard smooth model at v. A form that is integral but not a generator also counts as "integral", and for it the formula fails.
   - **Witness.** Take a split place v=2 with U_v=SL₂(ℤ₂) and ω=2·ω_std. Then |ω|₂(U_v)=(1/2)(3/4)=3/8, not 3/4. AdelicAlgebraicGroups §2.4 (Weil's volume formula) assumes that ω extends to a generator.
   - **Repair.** Write: "every place where ω does not extend to a generator of the invariant top forms of the standard smooth model of H≅SL_a (equivalently, ω is not a v-adic unit multiple of the standard gauge)". Apply the same wording in plan.json 3.5. Tested: v=2 with ω=2ω_std now lies in S, and its factor (3/8)/(3/4)=1/2 goes into c_S. The product formula is unchanged.

4. **F04** (P3) Two gap `needs` sentences refer to "these" with nothing in the sentence to refer to

   - **Location.** README lines 137 and 119; plan.json lines 1894 and 1792. Quotes: "Supply the comparison of these C5a.5 spectral sequences with the Lie-cochain filtration, …" and "… u=O(-1)−1, with these suspension and orientation conventions."
   - **Claim.** A `needs` sentence is announced to the supplier on its own. Both sentences leave the bundles, the hypotheses and the conventions to the detail text, so the supplier cannot read the request without it.
   - **Witness.** At its head, CharacteristicClasses C5a.5 applies the multiplicative Serre target only to the universal bundle K→EK→BK. On its own, "these C5a.5 spectral sequences" most naturally means that sequence, not the arithmetic bundles.
   - **Repair.** In both files, use: "Supply, for a number field F, odd a with a−1>4N(2n−1) and torsion-free arithmetic Γ⊂Res SL_a, the comparison of the C5a.5 spectral sequences of K→Gᵘ→Xᵘ and K→G(ℝ)/Γ→K\G(ℝ)/Γ with the Lie-cochain filtration, preserving edge restriction and the identity on the common compact fibre." For the other gap, use: "…for n≥2, with the ordered suspension of CharacteristicClasses C6 item 3 and the (x,y)↦x+iy orientation of TopologicalKTheory T4." Tested on ℚ, n=2: the fibre line has dimension N−d=1 and multiplier 1, and (2πi)²=−4π² has coordinate 1.

5. **F05** (P3) Three sentences still read as traces of the deleted Layer 7

   - **Location.** README line 3 ("retains the empty determinant"), line 9 ("Section 5.1 retains the empty determinant case of the general period comparison") and line 141 ("The rank-zero case remains in §5.1 and its Layer 5 examples").
   - **Claim.** "Retains" and "remains" describe a change of state. A reader cannot tell what was moved, and the house style asks for timeless text.
   - **Witness.** The house rules list "removed" and similar process words as banned. Round-1 F08 repaired this pattern elsewhere in the README.
   - **Repair.** Line 3: "includes the rank-zero case". Line 9: "Section 5.1 contains the dₙ=0 case of the general period comparison." Line 141: "The rank-zero case is the dₙ=0 clause of §5.1, illustrated in the Layer 5 examples." Tested: after the edit, a grep for "retains the empty" and "remains in §5.1" finds nothing.

6. **F06** (P3) Eight proof-route sentences are ungrammatical

   - **Location.** README lines 294, 335, 397, 471, 490, 530, 561 and 603. Examples: "A proof route is to the invariant exact sequence computes the period." (line 294) and "A proof route is to this is a specialization of the supplied gauge measures" (line 335).
   - **Claim.** "Is to" has been put in front of a full clause, so these sentences do not parse. The other sixteen proof routes read correctly.
   - **Witness.** Grep for "A proof route is to (the|this|division|for|odd|finite) " matches exactly these eight lines.
   - **Repair.** Rewrite each as "In one proof route, <clause>". For example, line 294 becomes "In one proof route, the invariant exact sequence computes the period", and line 397 becomes "In one proof route, division makes H anisotropic …". Tested: after the edit the grep returns nothing.

Six findings, all P3, none blocking. All twelve round-1 findings are repaired, and the repaired passages survive the adversarial pass. The acceptance is conditional on the eleven declared supplier gaps; each names a supplier that exists. Elaboration: not available (this lane does not elaborate). The design has no `Suggested.lean`, so no `#check` binder audit or one-tactic padding probe applies.

## Verified sound

### Round-1 findings: repair status (12 of 12 repaired)

| Round 1 | Repaired passage (quoted, at most 40 words) | Status |
| --- | --- | --- |
| F01 | line 127: "What AdelicAlgebraicGroups must provide (gap:classical-tamagawa-proof): Supply τ(SL₁(D))=1 for every central division algebra D of degree a≥2 over a number field, in the §2.4 Tamagawa normalization." plan.json supplier AdelicAlgebraicGroups. | repaired. The repair report labels it "not actionable", but the repair was applied, so nothing needs re-raising. |
| F02 | `pinned-headline-carriers` is absent from the plan's 11 gaps and from the README. | repaired |
| F03 | line 9: "The complex regulator and lattice theorem of ColemanIntegration §L3.Fc.1 belong to §§2.2–2.3 and 5.3 here, with the Beilinson normalization identified in §6.2." Also line 757 and the (t/2)ℤ Check at line 615. | repaired |
| F04 | The README and plan contain no EndoscopicTransferAndUnitaryTraceComparison citation. Line 7 assigns the norm-one theorem to the AdelicAlgebraicGroups extension. | repaired |
| F05 | line 137: the gap is now with CharacteristicClasses "C5a.5 extension, invariant-form filtration comparison", and C5a.5 is cited for the machinery. | repaired (wording: R04) |
| F06 | line 119: the gap is limited to C6 item 3. §5.2 owns the real index (lines 580–597). | repaired |
| F07 | Layer 7 is deleted. Line 9 cites IntegralIwasawaTheory §6.0. Lines 667–674 contain the Layer 5 example. Line 755 repoints the Polylogarithms §4.7 entry. | repaired (residue: R05) |
| F08 | The heading is "Supplier extensions". All 11 contracts use the form "What X must provide (gap:slug)", and every *Needs* line uses gap tokens. | repaired (residue: R05) |
| F09 | line 357: "Gauge independence and restriction of scalars use its §2.4 directly." The two duplicated API bullets are gone. | repaired |
| F10 | line 53 lists `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` and `mk_matrix`, both checked at the pin. They also appear in the §3.1 and §3.2 *Needs*. | repaired |
| F11 | line 57: "§§2.5, 3.2, 3.12, 7.7–7.8". The §1.2 locator is now elementary plus Definition 10.8. The PS.9 claim is deleted. | repaired |
| F12 | line 129: "Required location: extension of ArithmeticKTheory §§3.2–3.4 to all full ℤ-orders." Line 13 excludes ArithmeticKTheoryPartII §R17. | repaired |

The repair report says PeriodsAndSpecialValues has "no readable main/head copy". That is wrong: the board index lists it, and I read PS.3.2a at its head. The repair only deleted a consumer claim, so nothing is lost.

### Principles

- **No shortcuts.** The design covers all number fields, all n≥2, every finite prime including 2 (Check §5.5), every order and every finite S, with ramified factors kept (§3.5).
- **No algorithms, sorry'd data or `set_option`.** There is no Lean file.
- **No copied passages.** A 7-word shingle comparison of the README with all five cached sources matched only bibliographic strings: 11, 2, 2, 2 and 9 shingles, all titles or URLs.
- **Direction of supply.** It is single; see the gate output below.

### Seeded source sample: 14 of 15 verified, 1 partly (R01)

Each item below was checked for theorem number, page, hypotheses and support. Sections of borel1977 were checked on the rendered pages. Printed page equals PDF page + 611 for borel1977, and PDF page − 6 for burgos2002.

- **1.1**: burgos2002 Proposition 9.22 and Corollary 9.23, lines 3650–3709, p.85. The integral structure is (∏ℤ(p−1))^F.
- **1.2**: Definition 10.8, lines 4091–4106, p.94. It assembles the embeddings only; the fibre laws are elementary.
- **2.2**: Definition 9.19, lines 3577–3606; Propositions 9.21–9.23 factor through ∏K(ℂ), with p≥2 at line 3620.
- **3.1**: poonen2017 Theorem 1.5.36(i), (iii) and (iv), lines 1396–1446. The statement starts at the foot of printed p.25 and continues on p.26. The cyclic extension used has prescribed local degrees, not prescribed local extensions.
- **3.2**: borel1977 Lemma 2.2, lines 177–195, pp.617–618. The rendered page reads n≥1. Borel uses n places with invariant 1/n each, while the design's route uses 1/a and −1/a; either works.
- **3.3**: borel1977 §1.6, p.617, equation (1), Borel's archimedean gauge with the |D|^(−n/2) factor. Equation (2) carries the factor i^(r₂).
- **3.4**: borel1977 line 227 cites Weil Theorem 3.3.1 for τ(H)=1. Borel adds that rationality of τ(H) alone would suffice.
- **3.5**: Proposition 2.4 proof, p.619. It gives the mass formula N(v)^(−(n²−1))·#SL_n(F_v) and the count of SL_n(F_v). My check: the exponent is a(a−1)/2−(a²−1)+(a(a+1)/2−1)=0, so the mass is ∏(1−q^(−j)).
- **3.6**: §2.3 (the quotient is compact) and Proposition 2.4 with strong approximation and a principal fibration, pp.618–619. Borel's ∼ means a nonzero rational factor; ℚ_>0 follows from positivity.
- **4.1**: §1.3, lines 122–126 (indecomposables), and §6.1, lines 567–570.
- **4.2**: §3.4 equation (4), j=i^m·μ̃, and §3.5 (filtrations, Γ torsion-free), p.622; §5.2, pp.626–627. §3.3 begins three lines from the foot of p.620.
- **4.5**: Theorem 5.5, p.628: the hypothesis is n−1>4d(2m+1) and the conclusion β*(L)=i^(r₂)·ζ_k(m+1)·L. The proof on pp.629–630 covers equations (5)–(11).
- **5.4**: burgos2002 Theorem 9.12, lines 3256–3257, p.80: R′∼π^(−d)·ζ*. Equations (9.4)–(9.5), lines 3613–3614, p.84. borel1977 §6.4 equation (4), p.633.
- **5.5**: verified for the O_F regulator only (R01).
- **6.2**: burgos2002 Theorem 10.9, Bo_p=2Be_p, lines 4139–4140, with its proof at lines 4141–4242, pp.95–97.
- Also read: Lemma 9.18, lines 3546–3576; Theorem 6.2 and Remark 6.3, pp.631–632; Prop 5.4, p.628 ((πi)^(d(m+1))·|D|^(−(2m+1)/2)).
- No author-flagged unverified locator exists.

### Adversarial table

Each row gives my values on the design's side and on the independent side (the source, a supplier or my own computation).

| Statement | Instances | Design side / independent side | Result | Change |
| --- | --- | --- | --- | --- |
| dₙ convention | ℚ n=2,3; ℚ(i); real quadratic | (0,1), (1,1), (0,2) / borel1977 line 139: d₁=r₂, d₂=r₁+r₂ | holds | none |
| Phase E=r₂+(2n−1)dₙ−Nn | ℚ n=2,3; ℚ(i) n=2,3; real quadratic n=2 | −2, 2, 0, 0, −4 / closed forms −nr₁ and (n−1)r₁ give the same; Borel's mod-2 exponent r₂+d(m+1)+d_m is 4 for ℚ, n=3 | holds | none |
| jℝ=i^qμ | q=0,1,2,3,5 | 1, i, −1, −i, i; i·(−1)=i³ / borel1977 p.622 eq. (4) | holds | none |
| Gauge conventions | ℚ(i), h=3; ω↦2ω | 4^(−3/2)·2³=1; 2·(1/2)=1 / AdelicAlgebraicGroups §2.4: |d_F|^(−d/2), dx, 2dxdy | holds | none |
| 1.1 Vₙ, Cₙ | ℚ n=2,3; ℚ(i); weight-3 generator | dims 0,1,1; (2πi)²=−4π² has coordinate 1; sup norm 2π / Burgos 9.22 | holds | none |
| 1.2 R, T | ℚ(i)/ℚ n=2,3; degree-4 tower; identity | T(t,−t)=0; TR(t)=2t; 4t=2·2t; t / fibre count [E:F] | holds | none |
| 1.3 ζ*(1−n) | ℚ n=2,3,4; ℚ(i) n=2 | ratios −1/2, −1/4, 3/4; ℚ(i): ζ*(−1)=(−1/12)(2G/π)=−G/(6π) against 2π^(−3)ζ_F(2)=G/(3π), ratio −1/2 / the functional equation gives L′(−1,χ₋₄)=2G/π | holds | none |
| 2.1 Boₙ | weights 2,3; identity block | ch₃ primitive part c₃/2 (factor 2); (2πi)³=−8π³i; adding a block adds 0 / CharacteristicClasses C6 item 2 | holds | none |
| 2.2 r_Bo | mx=0; doubled inverse | r(x)=0; 2t≠t / additivity, ArithmeticKTheory §3.3 forward-map identity | holds | none |
| 2.3 real iso | ℚ, ℚ(i), real quadratic n=3 | (0,0)/(1,1); (1,1); (2,2) / ArithmeticKTheory §3.4: rank r₁+r₂ in degree ≡1 mod 4 | holds | none |
| 3.1 period=index (API changed) | {1/2,1/2}; {1/3,−1/3}; period 2 at a=6; a=0 | dims 4, 9; M₃(D) of degree 6; a=0 excluded / `mk_matrix` needs `[NeZero n]` (Group.lean:159) | holds | none |
| 3.2 existence | (−1,3)_ℚ; Hamilton | Hilbert symbols at 2,3,∞: −1, −1, +1 (ε(−1)ε(3)=1; (−1/3)=−1); Hamilton has inv_∞=1/2 / product formula +1 | holds | none |
| 3.3 m∞ | ℚ(√5), h=3; ℚ(i); ω=0 | 5^(3/2); (1/8)·8=1; mass 0 / borel1977 eq. (1) | holds | none |
| 3.4 norm-one mass (changed) | degrees 2,3; torus; 2ω | h=3,8; τ=1 by the gap; torus character rank 1 against 0; 2·(1/2)=1 / AdelicAlgebraicGroups §2.4 gauge independence | holds | none |
| 3.5 finite factors | SL₂ and SL₃ over 𝔽₂; ω=2ω_std at v=2 | 3/4; 21/32=(3/4)(7/8); 3/8≠3/4 / Borel p.619 count; Weil formula needs a generator | holds as intended | R03 |
| 3.6 volume | index-3 level; SL₂(ℤ); ℚ(√5), a=2 | (m_f/3)(3vol)=1; noncompact; 5^(3/2) / Borel Prop 2.4 | holds | none |
| 4.1 Q, det | Λ(x₃,x₅); k[u₂]; k | Q⁸=0 although H⁸ is one-dimensional; Q⁴=0; ∧⁰=k / definition | holds | none |
| 4.2 jℝ | q=0,3,5 | 1, −i, i / eq. (4) | holds | none |
| 4.3 α period | ℚ n=2; ℚ(i) n=2 | π², ratio 4 to −4π²; 4^(−3/2)=1/8 with π⁴ / Prop 5.4 | holds | none |
| 4.4 cycles | j=1,2 at N=1; j=1 at N=2 | dims 3, 8, 6; factors 2, 9, 4 / my block restriction (j+1)^(jN); the source misprints (Source issues) | holds | none |
| 4.5 β det | j=0,1,2 | 1, ζ_F(2), ζ_F(2)ζ_F(3); successive ratios ζ_F(2), ζ_F(3) / Th 5.5 | holds | none |
| 4.6 fibre line | ℚ n=2,3; ℚ(i) | (0,1,1), (1,1,0), (1,2,1); SO(odd) primitives in degrees 4k−1 / borel1977 §5.2 | holds | none |
| 5.1 determinant (Checks folded in) | ℚ n=2,3; ℚ(i) n=2; ℚ(√5) n=2 | 1 against 1/6 (ratio 6); ζ(3)/π³; 2ζ_F(2)/π⁴; √5·ζ_F(2)/π⁴=2/75 / Th 6.2: |D|^(1/2)·ζ·π^(−d(m+1)); ζ_ℚ(√5)(2)=2π⁴/(75√5) | holds | none |
| 5.2 conversion (changed) | ℚ n=3,5; imaginary quadratic; real quadratic n=3 | 4π, 2π, 2π, 16π² / (9.4)–(9.5); the Cartan composite acts on π_(2k−1) by 1+(−1)^(k+1)=2 (k=3,5); (gh)(gh)ᵗ=ggᵗ=−I | holds | R02 |
| 5.3 lattice (Check added) | rank 0; tℤ; 2tℤ; ℤ+√2ℤ; Beilinson | 1; |t|; 2|t|; not discrete; (t/2)ℤ has covolume |t|/2 / §6.2 factor 2 | holds | none |
| 5.4 zeta covolume | ℚ n=2,3; ℚ(i) n=2,3 | q=−12, with positive class 6; exponent −2; exponents −3, −5 with √Δ=2 / Burgos 9.12 and borel1977 §6.4 (4) | holds | none |
| 5.5 S, orders | S={2}, ℚ, n=3; K₁; indices 2,3 | images equal (K₄(𝔽₂)=0), ratio 1; unit ranks 0, 1; ratio 3/2 / ArithmeticKTheory §3.3 | holds | R01 |
| 6.1 P_(n−1) | 1, i, 1+i at n=2,3 | P₁: 0, i, i; P₂: 1, 0, 1 / kernels ℝ(2)=ℝ and ℝ(3)=iℝ | holds | none |
| 6.2 r_Bo=2r_Be | d=0,1,2; t=3 | 1, 2, 4; 3=2·(3/2) / Burgos Th 10.9 | holds | none |
| 6.3 Adams | ℚ n=3 a=2; real quadratic; ℚ n=2 | 8; 64; 1 / PS.3.2a Checks give the same | holds | none |
| Layer 5 example (new) | ℚ n=2,4; ℚ(√5) | 6·(1/6)=1; 90·(1/90)=1; 2/75 / IntegralIwasawaTheory §6.0 with the §1.3 ratios −1/2, 3/4 | holds | none |
| gap stable-finite-range | ℚ, q=5; ℚ(i), q=3 | a≥22; a−1>24 / Borel p.627 range q<(a−1)/4 implies the conservative bound's conclusion | precise | none |
| gap integral-chern-calibration | n=2,3 | coordinates of −4π² and −8π³i are 1 / C6 item 3: ch(u)=−v | precise | R04 wording |
| gap cyclic-local-degrees | a=2,8 | 2·(1/2)=1≡0; fixed dyadic degree-8 prescription obstructed / AGD §R02.4.5b | precise | none |
| gap inner-type-a-structure | a=2,3 | base changes SL₂, SL₃ / AdelicAlgebraicGroups §3.4 gives semisimplicity only | precise | none |
| gap adelic-rational-masses | index-2 subgroup at q=2 | mass 3/8 / §2.4 Weil formula covers smooth models only | precise | none |
| gap classical-tamagawa-proof | D=(−1,3)_ℚ | τ=1, h=3 / §2.4 gives τ>0 and τ(Res)=τ only | precise | none |
| gap order-finite-generation | ℤ[2i]⊂ℤ[i] | index 2, so the covolume ratio is rational / ArithmeticKTheory §3.2: Dedekind with finite Pic only | precise | none |
| gap graded-indecomposable-api | Λ(x₃,x₅) | x₃x₅=−x₅x₃, so not commutative / Mathlib `Ideal.Cotangent` (Cotangent.lean:40) needs `CommRing` | precise, not provided | none |
| gap multiplicative-serre-comparison | ℚ n=2 | fibre multiplier 1 / C5a.5 covers K→EK→BK only | precise | R04 wording |
| gaps universal-deligne, infinitesimal | ℚ n=3 point | H¹_D has dimension 1; N⁰=ℝ / supplier design not readable | contract | none |

### Library declarations opened at the pins

- **Mathlib 6b7abb3**:
  - `card_add_two_mul_card_eq_rank` (InfinitePlace/Basic.lean:474)
  - `NumberField.discr` (Discriminant/Defs.lean:36; :35 is its docstring) and `discr_ne_zero` (:41)
  - `Submodule.mkQ` (Quotient/Defs.lean:227) and `mkQ_surjective` (:236)
  - `IsZLattice` (ZLattice/Basic.lean:433, with a `[DiscreteTopology L]` parameter and a `span_top` field)
  - `ZLattice.covolume` (Covolume.lean:72), `covolume_pos` (:98) and `covolume_eq_det` (:125)
  - `dedekindZeta` (:49) and `tendsto_sub_one_mul_dedekindZeta_nhdsGT` (:77)
  - `Matrix.det_fin_zero` (:798)
  - `riemannZeta_two` (:226) and `riemannZeta_four` (:232)
  - `NumberField.Units.regulator` (Units/Regulator.lean:266, defined as `ZLattice.covolume`)
  - `Ideal.Cotangent` (RingTheory/Ideal/Cotangent.lean:40)
- **Tau Ceti a91d3aa**:
  - `exists_eq_mk_centralDivisionRing` (Division.lean:69)
  - `mk_matrix` (Group.lean:159, `[NeZero n]`)
  - `exists_differentiableOn_eq_dedekindZeta_sub` (NumberField/DedekindZeta.lean:158)
  - `TauCeti.Hodge.tate` (Tate/Basic.lean:91), with `tateLatticeMap` the plain inclusion (:44)
- Neither pin contains higher Quillen K-groups, a Borel class, Deligne cohomology, a Tamagawa value or a number-field period–index theorem.

### Cross-roadmap citations resolved

Each was resolved against main a4a8652 or the named head.

- **StableHomotopyKTheory**: §§2.4–2.5 cover the homotopy-fibre connecting map and its exact sequence; §3.37 is `rationalHurewicz_hSpace` (finite type); §4.14 is the stable GL plus H-space.
- **IntegralIwasawaTheory** §6.0: `totallyRealHeckeValue_rational`.
- **CharacteristicClasses**: C5a.2 (QI=I₊/I₊²), C5a.5 (multiplicative Serre target on K→EK→BK), C6 items 2–3 (ch(u)=−v, ordered suspension).
- **TopologicalKTheory**: T4 (Bott); T7 item 1 (c(a)=2u², c(b)=u⁴).
- **AdelicAlgebraicGroups**: §2.4 (Tamagawa measure, gauge independence, τ(Res)=τ, Weil formula, SL_n masses); §3.4 (SL₁(D) carrier, compactness); §4.2 (strong approximation for absolutely almost simple, simply connected groups).
- **ArithmeticGaloisDuality**: §R02.4.5b and §R02.4.6.
- **GeneralAlgebraicKTheory**: §2.5, §3.2, §3.12, §7.7 (transfer), §7.8 (base change).
- **ArithmeticKTheory**: §3.2 (finite generation over Dedekind domains with finite Pic); §3.3 (onto in odd n≥3, `rationalSIntegerEquiv`); §3.4 (`borel_rank_order` for every order).
- **ColemanIntegration** §L3.Fc.1: it builds reg_∞ and proves Borel's lattice theorem.
- **LFunctions** Layer 3: continuation, functional equation, germs.
- **SchemeKTheoryOperations** §6.8.
- **ArithmeticLocallySymmetricSpaces**: ALS.F.5, ALS.0.4–ALS.0.9, ALS.5b.1.
- **AutomorphicFormsOnReductiveGroups** §§1.1–1.3.
- **Main-branch roadmaps**: ClassFieldTheory Layers 5 and 10, AlgebraicTopology Stage 5 item 5, DifferentialGeometry Layers 5, 6 and 8.

Two suppliers are other authors' new-roadmap pull requests, which the brief allows: LFunctions, and TopologicalKTheory together with CharacteristicClasses. The resolver flagged "ArithmeticKTheoryPartII §R17". It exists as the board package `packages/ArithmeticKTheoryPartII/design/README.md`, line 1657, and is cited only as an exclusion.

### Ownership and duplication by object

This roadmap is the earliest owner of the following, and I record the moves down:

- the number-field regulator, its real isomorphism, the factor 2 and the Adams weight, from PeriodsAndSpecialValues PS.3.2a (read at its board head, merge order 150);
- the complex regulator lattice theorem, from ColemanIntegration §L3.Fc.1 (order 114), whose downstream list still names BorelRegulators as a consumer;
- number-field period equals index, from HeightsRationalPointsAndObstructions §3.6 (order 117).

Searches across main and the open heads found no other owner of:

- the leading term ζ*_F(1−n) (LFunctions covers s=0 only);
- period equals index;
- a Borel regulator (K3BlochGroups and HabiroRings own none).

The board design ZagierConjecturePolylogarithms consumes this roadmap's real isomorphism, covolume and factor-two comparison under its own labels. Listing it among the downstream consumers is optional. Polylogarithms' gap:borel-period-contract still cites "§7.1"; by content that is now §5.1's dₙ=0 clause together with §§3.4–3.6. HabiroRings does not cite this roadmap at its head.

### Gaps and supplier order

All 11 gaps have the same slug in the plan and in the README, and each `neededBy` entry matches its prerequisite. Each supplier exists:

- ArithmeticKTheory, ArithmeticGaloisDuality and AdelicAlgebraicGroups: open pull requests, in the merge order;
- CharacteristicClasses: another author's open new-roadmap pull request;
- MotivicEtaleKTheory: an open design job and an open fix job on the board.

Dependency check, output verbatim:

```text
candidate: BorelRegulators is not in the merge order yet; checked as if placed after ArithmeticKTheory (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every consumer comes after merge-order line 86: ColemanIntegration 114, Polylogarithms 115, HeightsRationalPointsAndObstructions 117, PeriodsAndSpecialValues 150, HabiroNahmSeries 164.

### Shape

- The README has the upstream headings in order.
- Layers 1–6 each end with Examples and Dependencies.
- All 26 targets have a locator, hypotheses and a *Needs* line, and each has at least three Checks (3 to 5).
- No backticked Lean name of this roadmap's own appears, and there is no LaTeX, pull-request number or path.

## Not verifiable

- **weil1961** is waived and **beilinson1985** is uncertified (paywalled). Both are settled, and I did not read them.
- **MotivicEtaleKTheory.** Its design is not among the readable packages, so the "universal-realization layer" of gap:universal-deligne and gap:infinitesimal-classifying-comparison cannot be resolved, and its future merge-order position is unknown. It must come before this roadmap.
- **Board packages at other pull-request heads.** Apart from PeriodsAndSpecialValues, I did not fetch them, to save the shared API quota. Ownership against them is checked only through the roadmap index and grep.
- **Sign in gap:integral-chern-calibration.** The absolute sign that relates clutching and suspension is the supplier's to prove. I recomputed only the character values ch(u²)=+v² and ch(−u³)=+v³.
- **Lean.** Elaboration is not available (this lane does not elaborate). There is no `Suggested.lean`, so no binder audit or padding probe was run.

## Source issues

- **Misprint** in borel1977 at proof of Theorem 5.5, printed pp.629–630: the source gives the dimension of the compact cycle Z_j, and the degree of the restricted top form, as j²+2j; it should be d(j²+2j), matching the degree of η_j; affects nothing.
- **Error** in borel1977 at proof of Theorem 5.5, printed p.630: the source says β(η_j) restricts to the norm-one group as (j+1) times the pulled-back form; it should be (j+1)^j, since each of the j primitive factors picks up j+1; affects nothing.
- **Misprint** in borel1977 at proof of Theorem 5.5, equation (7)–(8), printed p.629: the source writes the factor in s′_j as |D|^(j+1/2); since Rω carries |D|^(−(2j+1)/2), it should be |D|^(−(j+1/2)); affects nothing, because the two differ by a rational factor.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ffdfe1b", "job": "REV-DESIGN-BorelRegulators~2", "model": "opus", "worker": "fable-rev28"} -->
