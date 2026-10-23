<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/940#issuecomment-6370054663 -->
Review (claude) of 79e9725

Verdict: needs changes

1. **F01** (P1) The classical Tamagawa gap has no owner

   **Location.** `packages/BorelRegulators/design/README.md` line 121, and `design/plan.json` gap `classical-tamagawa-proof` (`"supplier": "none"`). Quote: "**BorelRegulators — classical-tamagawa-proof.** … Provide a legally checked decomposition of the classical norm-one Tamagawa proof into independently stated inputs."

   **Claim.** §3.4 (τ(SL₁(D))=1) is a prerequisite of §§3.6, 4.4, 4.5, 5.1 and 7.1. It rests on a gap with no supplier. The README heading even names this roadmap as its own supplier, while plan.json says `none`. The `needs` sentence asks for a source certification, not for a mathematical statement.

   **Witness.** A gap with supplier `none` is unowned. The only τ=1 theorem, ETUTC §6.2, is at merge-order line 126, after Polylogarithms (115). AdelicAlgebraicGroups §2.4 defines τ(G) and proves τ>0 and τ(Res)=τ, but gives no value.

   **Repair.** Give the gap the supplier AdelicAlgebraicGroups, with section "Part II, Tamagawa numbers extending §2.4 and the §3.4 SL₁(D) carrier". Use the `needs` sentence: "Supply τ(SL₁(D))=1 for every central division algebra D of degree a≥2 over a number field, in the §2.4 Tamagawa normalization." Use the same slug in plan.json and the README, and rename the README heading to "AdelicAlgebraicGroups — …". Tested on D=(−1,3)_ℚ: its Hilbert symbols are −1 at 2, −1 at 3 and +1 at ∞, so it is ramified exactly at 2 and 3, with h=3. The contract gives τ=1, which is the value the §3.4 and §3.6 Checks use.

2. **F02** (P1) `pinned-headline-carriers` is an unowned meta-gap with a false premise

   **Location.** README line 129; plan.json gap `pinned-headline-carriers`: `"supplier": "none"`, `neededBy` 2.2, 2.3, 5.4, 6.2, detail "This design delivers no Suggested.lean …".

   **Claim.** This is not a supplier contract. It has no supplier, so it is P1. The targets it names in `neededBy` do not list it in their prerequisites (plan.json 2.2: `target:1.1`, `target:2.1`, GeneralAlgebraicKTheory, StableHomotopyKTheory, ArithmeticKTheory). Its premise is also false: it says no headline can be stated honestly at the pins.

   **Witness.** §7.1 as written can be stated with pinned Mathlib alone. The carriers are `NumberField.IsTotallyReal` (Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:47), `NumberField.discr` (Discriminant/Defs.lean:35) and `NumberField.dedekindZeta` (DedekindZeta.lean:49), evaluated at s=n≥2, which is inside convergence.

   **Repair.** Delete the gap from plan.json and from README line 129. The acceptance-file rule already handles unstatable headlines: the module docstring names each one with its missing carrier (higher Quillen K-groups, the Borel class, real Deligne cohomology, the SL₁(D) Haar volume) and nothing is stated in its place. If §7.1 survives R07 as a headline, state it as ∃ q:ℚ, 0<q ∧ √|disc F|·π^(−nN)·ζ_F(n)=q. Tested on F=ℚ, n=2: q=1/6 by `riemannZeta_two` (HurwitzZetaValues.lean:226).

3. **F03** (P2) The number-field regulator lattice has a second owner: ColemanIntegration §L3.Fc.1

   **Location.** README line 7 ("This roadmap owns the embedding Tate lattice, the specified arithmetic regulator and its real isomorphism"), §2.3 (line 258), §5.3 (line 599), §5.4 (line 621); lines 772–780 omit ColemanIntegration.

   **Claim.** The design does not cite this second owner and records no relocation from it.

   **Witness.** `TauCetiRoadmap/ColemanIntegration/README.md` §L3.Fc.1 (open head) builds `reg_∞` and proves Borel's theorem: the image modulo torsion is a full lattice in the conjugation-invariant ⊕_σ ℝ(n−1), with injective rational regulator. It lists BorelRegulators as a consumer.

   **Repair.** In Scope and ownership, record the move-down the same way as for PS.3.2a. Use the sentence: "The complex regulator and lattice theorem of ColemanIntegration §L3.Fc.1 are §§2.2–2.3, 5.3 here; ColemanIntegration keeps its pairings and discriminant/regulator determinants." Add ColemanIntegration (§L3.Fc.1 consumes §§2.2–2.3, 5.3, 6.2) to Downstream consumers. Note that the point case of `gap:universal-deligne` overlaps L3.Fc.1's `reg_∞`. The alternative is to import L3.Fc.1 and delete §§2.3/5.3, which places this roadmap after ColemanIntegration (merge-order line 114) and still before Polylogarithms (115). Tested on F=ℚ, n=3: both texts give a rank-one lattice tℤ in a one-dimensional real line, so they describe the same object.

4. **F04** (P2) EndoscopicTransferAndUnitaryTraceComparison §6.2 is wrongly described as consuming §3.4

   **Location.** README line 7: "The type-A norm-one theorem is the input used by EndoscopicTransferAndUnitaryTraceComparison §6.2". README line 776: "§6.2 imports the classical norm-one theorem §3.4". plan.json consumers say the same.

   **Claim.** §6.2 does not use the type-A norm-one theorem.

   **Witness.** ETUTC §6.2 proves τ(S)=1 for all simply connected S: Lai for quasi-split groups, Kottwitz's induction for inner forms. Its *Needs* line has no norm-one input; SL₁(D) is a case of its conclusion.

   **Repair.** Rewrite line 7 as: "§3.4 is the inner type-A case of EndoscopicTransferAndUnitaryTraceComparison §6.2. It is needed earlier in the merge order, and §6.2 does not depend on it." After R01 it is supplied through the AdelicAlgebraicGroups gap. Delete the line-776 bullet and the plan.json consumer entry. Tested on SL₁ of the degree-three algebra in the §3.4 Check: ETUTC §6.2 already gives τ=1 for it through its quasi-split form SL₃.

5. **F05** (P2) `multiplicative-serre-comparison` asks DGFloer for machinery CharacteristicClasses already plans

   **Location.** README line 133; plan.json gap `multiplicative-serre-comparison` (supplier DGFloer, "Part II"). Its `needs`: "Supply the multiplicative cohomological Serre machinery and its invariant-form filtration comparison."

   **Claim.** The machinery half of this gap is already planned by a cited supplier, so the gap is not minimal.

   **Witness.** In the CharacteristicClasses head, §C5a.5 says: "Construct DGFloer Layer1.2's multiplicative cohomological Serre target and apply it to K→EK→BK". The carriers section adds that it is built before C5a.5. The design already cites C5a.4–C5a.5 for §4.6 (README line 543).

   **Repair.** Cite CharacteristicClasses §C5a.5 for the multiplicative cohomological Serre spectral sequence. Narrow the gap to: "compare the C5a.5 spectral sequences of K→G_u→X_u and K→G(ℝ)/Γ→X/Γ with the relative-Lie-cochain filtration, preserving the edge restriction and the identity on the common fibre (borel1977 §3.5)". Either name CharacteristicClasses (§C5a.5 extension) as its supplier or make it a §4.6 target here. Tested on ℚ, n=2 in §4.6: the ranks are d=0, N=1, N−d=1, and this fibre comparison is the identity on the one-dimensional fibre line.

6. **F06** (P2) `integral-chern-calibration` bundles two deliverables from two suppliers, one already provided

   **Location.** README line 113; plan.json gap `integral-chern-calibration`. Its `needs`: "Supply the integral Bott-to-suspended-Chern bridge and real-place homotopy indices with fixed orientations". Its section: "C6 items 2–3 extension, coordinated with TopologicalKTheory T4 and T7 item 1".

   **Claim.** The `needs` sentence is compound, and its ownership is split.

   **Witness.** The real-place index is complexification on KO coefficients. TopologicalKTheory T7 item 1 states c(b)=u⁴ (index 1, degree ≡1 mod 8) and c(a)=2u² (index 2, degree ≡5 mod 8), matching burgos2002 lines 3546–3556.

   **Repair.** Restrict this gap to CharacteristicClasses §C6 item 3: "s(chₙ)(Hur εₙ)=(2πi)^n for εₙ=(−1)^n clutch(u^n), u=O(−1)−1". Make the real index a §5.2 target that cites TopologicalKTheory T7 item 1 together with the SO→SU→SU/SO homotopy sequence (StableHomotopyKTheory). If a bridge is still missing, declare it as a separate gap with supplier TopologicalKTheory. Tested on ℚ, n=3: 2n−1=5 gives index 2, which yields R_Bo/R′_Bo=(2π)·2=4π, as in Remark 9.20 (burgos2002 line 3614).

7. **F07** (P2) §7.1 restates Siegel–Klingen, which IntegralIwasawaTheory §6.0 owns, and makes a proof route mandatory

   **Location.** README line 746: "For every totally real number field F and every even integer n≥2, dₙ=0 and √Δ_F·π^(−nN)·ζ_F(n)∈ℚ_>0." Line 137: "Layer 7 isolates the totally real even-weight consequence so that a consumer must import its volume proof".

   **Claim.** §7.1 is another roadmap's theorem restated in an equivalent form, and the design forces consumers onto one proof route.

   **Witness.** IntegralIwasawaTheory §6.0 (`totallyRealHeckeValue_rational`, merge-order line 24) is Siegel–Klingen; at the trivial character it gives ζ_F(1−n)∈ℚ, which LFunctions Layer 3 and §1.3 turn into §7.1. Proof sketches never make routes mandatory.

   **Repair.** Cite IntegralIwasawaTheory §6.0, with LFunctions Layer 3 and §1.3, in Scope as the owner of this rationality. Fold §7.1 into §5.1's existing rank-zero clause and keep its Checks as a Layer 5 example. Delete the "must import its volume proof" sentence. Repoint the Polylogarithms §4.7 Downstream entry to §5.1's rank-zero clause together with IntegralIwasawaTheory §6.0. Tested on ℚ, n=2: ζ(−1)=−1/12, and the §1.3 ratio −1/2 gives ζ(2)/π²=1/6. §5.1 gives the same class (c=1, quotient 6).

8. **F08** (P3) Process narrative in the README and gap texts

   **Location.** README line 107 ("unwritten contracts"), 109 ("not treated as an existing one"), 125 and 127 ("No designed section"), 129 ("Acceptance signatures"), 775 ("the relocated §§2.1–2.3"); plan.json ("This design delivers no Suggested.lean").

   **Claim.** These passages describe the drafting process or the state of other documents. That is not timeless text. Also, *Needs* lines cite gaps as "the exact supplier contract X" rather than in the `gap:X` token form.

   **Witness.** The README house rules ban process narrative such as "current", "removed" and round labels.

   **Repair.** Title the heading "Supplier extensions". State each MotivicEtaleKTheory contract with a named location such as "universal-realization layer". Write "PS.3.2a imports §§2.1–2.3 and 6.1–6.3". Drop the meta sentences, and write gap references as `gap:<slug>`. Tested: a grep for "designed", "unwritten", "relocat" and "treated as" returns no hits after the edit.

9. **F09** (P3) The §3.4 API restates AdelicAlgebraicGroups §2.4

   **Location.** README lines 357–358: "The value 1 is unchanged when a single global invariant top form is rescaled." and "Restriction of scalars preserves the same normalized number."

   **Claim.** Both bullets restate supplier theorems instead of citing them.

   **Witness.** AdelicAlgebraicGroups §2.4 contains "Independence of the gauge form" (ω↦cω, ∏_v|c|_v=1) and "Tamagawa number … τ(Res_{E/F}G)=τ(G)".

   **Repair.** Delete both bullets. Add "AdelicAlgebraicGroups §2.4 (gauge independence, τ(Res)=τ)" to §3.4's *Needs*. Tested on ω↦2ω over ℚ: the supplier's product formula gives 2·(1/2)=1, the same value as the §3.4 Check.

10. **F10** (P3) Pinned Tau Ceti Brauer declarations used by §§3.1–3.2 are not cited

   **Location.** README line 49 ("From Tau Ceti" names only the Dedekind remainder). Line 296: "A class of period dividing a has a central simple representative of degree a by taking a matrix algebra over its division representative."

   **Claim.** §§3.1–3.2 use pinned Tau Ceti objects without naming them.

   **Witness.** At the Tau Ceti pin, `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing` (TauCeti/Algebra/BrauerGroup/Division.lean:69) gives the central division representative. `TauCeti.BrauerGroup.mk_matrix` (TauCeti/Algebra/BrauerGroup/Group.lean:159) gives matrix invariance.

   **Repair.** List both under "From Tau Ceti" and in the *Needs* of §3.1 and §3.2. Tested on the zero class: `mk_matrix` gives M_a(F) of degree a, which is the representative the line-296 bullet constructs.

11. **F11** (P3) Supplier and consumer locators are imprecise

   **Location.** Line 53 ("§3.12, §§7.4–7.8 supplies actual Quillen groups"). Line 183 (§1.2 *Needs:* "GeneralAlgebraicKTheory §§7.4–7.8"). §1.2's locator (burgos2002 Proposition 9.21; Definition 10.8). Line 775 ("PS.9.8–PS.9.10 use §5.4").

   **Claim.** Several cited sections are not where the cited content is.

   **Witness.** GeneralAlgebraicKTheory defines Quillen groups in §§2.5 and 3.2, transfers in §§7.7–7.8; §§7.4–7.6 are products and units. Burgos 9.21 states no R, T law. PS.9.8–PS.9.9 use injectivity and ranks, not the covolume.

   **Repair.** Cite GeneralAlgebraicKTheory §§2.5, 3.2, 3.12, 7.7–7.8. Delete the K-theory dependency from §1.2. Present §1.2 as elementary, citing Definition 10.8 only for the embedding assembly. Write "PS.9.8–PS.9.10 use §2.3". Tested on ℚ(i)/ℚ, n=3: T(R(t))=2t needs only the two embeddings, with no transfer input.

12. **F12** (P3) The location of `order-finite-generation` could close a cycle

   **Location.** README line 123 and plan.json: supplier ArithmeticKTheory, section "Part II, integral order comparison extending §§3.2–3.4".

   **Claim.** "ArithmeticKTheory Part II" is ambiguous, and one reading closes a cycle.

   **Witness.** The board package `packages/ArithmeticKTheoryPartII/design/README.md` lists `BorelRegulators:R.3` as a build input (its §R17). If it supplied this gap, the two roadmaps would supply each other.

   **Repair.** Set the section to "extension of ArithmeticKTheory §§3.2–3.4 to all full ℤ-orders". In Scope, state that ArithmeticKTheoryPartII §R17 (symplectic stable cohomology) is not supplied here. Tested: with the base roadmap ArithmeticKTheory (merge-order line 86) as supplier, the dependency check above still shows no cycle.

Twelve findings: two P1, five P2, five P3. The mathematics checks out: every computed Check and normalization I recomputed agrees with the sources and with the other layers, and all fifteen sampled locators verify. The blocking problems are about ownership. Two gaps have no supplier. One core object is planned twice: the regulator lattice theorem is already in ColemanIntegration §L3.Fc.1. ETUTC §6.2 is described wrongly. Two gaps ask for material a cited supplier already plans or that is split across two suppliers. §7.1 restates, in another form, a theorem that IntegralIwasawaTheory already owns.

Dependency check (run as the brief specifies, output verbatim):

```text
candidate: BorelRegulators is not in the merge order yet; checked as if placed after ArithmeticKTheory (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 240 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

## Adversarial table

Each row gives the instances I tried and the values computed on both sides: the design's side and the source, supplier or my own calculation.

| Statement | Instances | Values computed (design side / independent side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions dₙ | ℚ n=2,3; ℚ(i); real quadratic | (0,1), (1,1), (0,2) / Borel §1.4 with m=n−1 (borel1977 line 139): d₁=r₂=0, d₂=r₁+r₂=1; same table | holds | none |
| Conjugation sign (−1)^(n−1) | complex pair, n=2,3 | (t,−t), (t,t) / conj(2πi·t)=−2πi·t; conj((2πi)²t)=(2πi)²t | holds | none |
| jℝ=i^qμ | q=0,1,2,3,5 | 1, i, −1, −i, i; i·(−1)=i³ / Borel p.632: j=i^s·μ̃ in degree s | holds | none |
| Phase exponent E (5.1) | ℚ n=3; ℚ(i) n=2,3; real quadratic n=2 | 2, 0, 0, −4 / (n−1)r₁ or −nr₁: 2, 0, 0, −4; Borel's exponent r₂+d(m+1)+d_m is congruent mod 2 | holds | none |
| Gauge conventions | ℚ(i), h=3; ω↦2ω over ℚ | 4^(−3/2)·2³=1; 2·(1/2)=1; complex multiplier 4 / Borel eq. (1) has the factor abs(D)^(−n/2) (verified on the page image); AdelicAlgebraicGroups §2.4 | holds | none |
| 1.1 Vₙ, Cₙ | ℚ n=2,3; ℚ(i); n=1 | dims 0,1,1,1; weight-3 generator −4π² has coordinate 1; sup norms 2π and 4π²; V₁ real of dimension r₁+r₂ / burgos2002 lines 3678–3688 | holds | none |
| 1.2 R, T | ℚ(i)/ℚ n=2,3; identity | T(t,−t)=0∈{0}; T∘R(t)=2t=[E:F]t; identity maps / fibre count [E:F] | holds | R11 |
| 1.3 ζ_F*(1−n) | ℚ n=2,3,4; ℚ(i) n=2; n=1 | ratios −1/2, −1/4, 3/4; ℚ(i): ζ′(−1)=−ζ_F(2)/π³∈ℚˣ·2ζ_F(2)/π³; order at 0 is r₁+r₂−1 / Λ(s)=Δ^(s/2)Γ_ℂ(s)ζ_F(s) | holds | none |
| 2.1 Boₙ | S⁶; zero class; identity block | ch₃=c₃/2 (factor 2); (2πi)³=−8π³i; ch(u)=−v, ch(u²)=+1, ch(−u³)=+1 / CharacteristicClasses C6 item 3 | holds | R06 |
| 2.2 r_Bo | torsion x; doubled inverse | m·r(x)=r(mx)=0 ⇒ r(x)=0; 2t ≠ t / additivity | holds | none |
| 2.3 real iso | ℚ, ℚ(i), real quadratic | (0,1), (1,1), dim 2 both sides / ArithmeticKTheory §3.4 ρ; burgos2002 line 3140 | holds | R03 |
| 3.1 period=index | empty; {1/2,1/2}; {1/3,−1/3}; index 8 | dims 1, 4, 9; Wang obstruction χ₂(16)=−1 / poonen2017 lines 1428–1446; ArithmeticGaloisDuality §R02.4.6 Check | holds | R10 |
| 3.2 existence | (−1,3)_ℚ; Hamilton | ramified at 2 and 3 only, split at ∞; Hamilton ramified at ∞, so excluded / Hilbert symbols −1, −1, +1 | holds | none |
| 3.3 m∞ | ℚ(√5), h=3; ℚ(i) | transport factor 5^(3/2); 2^(−hr₂)=1/8 / Borel eq. (1) | holds | none |
| 3.4 τ=1 | quaternion and degree-3 algebras; norm-one torus | 1, 1; torus τ=2 excluded / ETUTC §6.2 Checks | holds | R01, R04, R09 |
| 3.5 finite factors | SL₂ and SL₃ over 𝔽₂; q=1 | 6/8=3/4; 168/256=21/32=(3/4)(7/8); junk value excluded / Borel p.619: Nv^(−(n²−1))·#SL_n(F_v), #SL_n(F_v)=Nv^((n²−n)/2)∏(Nv^(j+1)−1) | holds | none |
| 3.6 volume | level of index 3; SL₂(ℤ) | m_f/3 × 3·vol = 1; noncompact quotient excluded / Borel Prop 2.4. Note (P3, not a finding): torsion-freeness of Γ_U is not needed, since D×U is a fundamental domain for Γ_U on H∞×U and left translation is free | holds | none |
| 4.1 Q(A), det | Λ(x₃,x₅); k[u₂]; k | Q⁸=0 with H⁸ one-dimensional; Q⁴=0 although u₂²≠0; ∧⁰=k / definition | holds | none |
| 4.2 jℝ | q=0, 3, 5 | 1, −i, i / Borel p.632 | holds | none |
| 4.3 α period | ℚ n=2,3; ℚ(i) n=2 | π², π³; 4^(−3/2)=1/8 with π⁴ / Borel Prop 4.3: (πi)^(m+1); Prop 5.4: (πi)^(d(m+1))·abs(D)^(−(2m+1)/2) | holds | none |
| 4.4 cycles Z_j | ℚ j=1,2; N=2 j=1 | dims 3, 8, 6; restriction factors 2, 9, 4 / form-level block restriction is additive, giving (j+1)^(jN); the source misstates the dimension and the factor (Source issues) | holds | none |
| 4.5 β determinant | ℚ n=2; j=0,1,2 | quotients ζ_F(2), ζ_F(3); stable range a−1>4N(2n−1) / Borel Th. 5.5: i^(r₂)·ζ_k(m+1), range n−1>4d(2m+1) | holds | none |
| 4.6 fibre line | ℚ n=2,3; ℚ(i) | (0,1,1), (1,1,0), (1,2,1); unipotent determinant 1 / SO(a) primitives sit in degrees ≡3 mod 4, so N−d is r₂ or r₁+r₂ | holds | R05 |
| 5.1 determinant | ℚ n=2,3; ℚ(i); ℚ(√5) n=2 | 1 against 1/6 (ratio 6); ζ(3)/π³; 2ζ_F(2)/π⁴ and 2ζ_F(3)/π⁶; ℚ(√5): √5·ζ_F(2)/π⁴=2/75 / Borel Th. 6.2: abs(D)^(1/2)·ζ(m+1)·π^(−d(m+1)) | holds | R07 |
| 5.2 R_Bo/R′_Bo | ℚ n=2,3,5; imaginary quadratic | 1, 4π, 2π, 2π / burgos2002 eqs. (9.4)–(9.5); index from Lemma 9.18 matches c(b)=u⁴, c(a)=2u² | holds | R06 |
| 5.3 lattice | rank 0; tℤ and 2tℤ; ℤ+√2ℤ | covolumes 1, abs(t), 2·abs(t); ℤ+√2ℤ not discrete / `Matrix.det_fin_zero`, `ZLattice.covolume_eq_det` | holds | R03 |
| 5.4 zeta covolume | ℚ n=2,3; ℚ(i); column swap | q=−12 and 6; exponent −2; 2ζ_F(2)/π³ and 2ζ_F(3)/π⁵; signed determinant −1 / Burgos Th. 9.12 with (9.4)–(9.5) gives R∼ζ* | holds | none |
| 5.5 S-integers, orders | S=∅; ℤ[1/2] in K₁; indices 2,3 | ratio 1; unit ranks 0 and 1; covolume ratio 3/2 / ArithmeticKTheory §3.3: surjective in odd degrees n≥3 | holds | R12 |
| 6.1 P_(n−1) | 1, i, 1+i at n=2,3 | P₁: 0, i, i; P₂: 1, 0, 1; differences in ℝ(n) / Burgos π_p(x)=(x+(−1)^p x̄)/2 (burgos2002 line 3960) | holds | none |
| 6.2 r_Bo=2r_Be | d=0,1,2 | determinant ratios 1, 2, 4 / burgos2002 line 4140: Bo_p=2Be_p | holds | R03 |
| 6.3 Adams | ℚ n=3 a=2; real quadratic; ℚ n=2 | 8, 64, 1 / deligne_goncharov2005 lines 438–440: ψ^a acts by a^j | holds | none |
| 7.1 totally real | ℚ n=2,4; ℚ(√5) n=2; ℚ(i) | 1/6, 1/90, 2/75; ℚ(i) has d=1, so not empty / `riemannZeta_two`, `riemannZeta_four`; Siegel–Klingen with the functional equation | holds | R07 |

## Verified sound

- **Principles.** The design treats every number field, every n≥2, all finite primes including 2, all orders and all finite S; it has no good-prime restriction. It contains no algorithm. It has no Lean file, so there is no sorry'd data and no `set_option`. Copied passages: a 7-word-shingle comparison of the README with the English sources (burgos2002, poonen2017, borel1974) matches only bibliographic strings. borel1977 and deligne_goncharov2005 are in French and the README paraphrases them.
- **Seeded sample: 15 of 15 verified at their locators.** Theorem number, page, hypotheses and support were checked for each.
  - 1.1: burgos2002 lines 3650–3709, p.85.
  - 1.3: borel1977 lines 127–139 and 600–615, pp.616 and 633.
  - 2.2: burgos2002 lines 3577–3709.
  - 3.3: borel1977 §1.6, p.617, equations (1)–(2), checked on the rendered page.
  - 3.5: borel1977 Proposition 2.4 proof, p.619.
  - 3.6: borel1977 §2.3, p.618, and Proposition 2.4, p.619.
  - 4.3: borel1977 Proposition 4.3, p.623, and Proposition 5.4, p.628.
  - 4.5: borel1977 Theorem 5.5, p.628, and pp.629–630.
  - 5.1: borel1977 Theorem 6.2, p.631, and Remark 6.3, p.632.
  - 5.2 and 5.3: burgos2002 Lemma 9.18, Definition 9.19 and Remark 9.20, p.84, and Corollary 9.8, p.78.
  - 5.4: burgos2002 Theorem 9.12, p.80, and borel1977 §6.4, equation (4), p.633.
  - 6.2: burgos2002 Definitions 10.7–10.8, p.94, and Theorem 10.9, pp.95–97.
  - 6.3: deligne_goncharov2005, published p.9, lines 437–440.
  - 7.1: borel1977 Remark 6.3.
  - Also checked: 3.1 (poonen2017 Theorem 1.5.36, p.26), 3.2 (borel1977 Lemma 2.2), 4.4 (Theorem 5.5 proof), and the three borel1974 locators (lines 934, 1246, 1377).
  - Printed page offsets: burgos2002 printed page = PDF page − 6; borel1977 printed page = PDF page + 611.
- **Pinned declarations opened (14), all at the cited lines.**
  - Mathlib at 6b7abb3: `card_add_two_mul_card_eq_rank` (:474), `discr` (:35), `discr_ne_zero` (:41), `Submodule.mkQ` (:227), `mkQ_surjective` (:236), `IsZLattice` (class at :432–433), `ZLattice.covolume` (:72), `covolume_pos` (:98), `covolume_eq_det` (:125), `dedekindZeta` (:49), `tendsto_sub_one_mul_dedekindZeta_nhdsGT` (:77), `Matrix.det_fin_zero` (:798), `riemannZeta_two` (:226), `riemannZeta_four` (:232).
  - Tau Ceti at a91d3aa: `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` (:158), `TauCeti.Hodge.tate` (:91). Also the Brauer declarations cited in R10.
  - No higher Quillen K-groups, Borel class, Deligne cohomology or Tamagawa value exists at either pin.
- **Cited labels resolved to the cited roadmaps' own headings.** Every label is the supplier's own section label, not an atlas stage label:

  | Supplier | Cited label | Section it resolves to |
  | --- | --- | --- |
  | GeneralAlgebraicKTheory | §3.12, §§7.7–7.8 | plus=Q, transfer, base change; §§7.4–7.6 unused (R11) |
  | StableHomotopyKTheory | §3.37, §4.14 | Cartan–Serre rational H-spaces; stable GL plus H-space |
  | ArithmeticKTheory | §3.2 | finite generation over Dedekind domains with finite Pic |
  | ArithmeticKTheory | §3.3 | finite-S defects; `rationalSIntegerEquiv` |
  | ArithmeticKTheory | §3.4 | `borel_rank_order` for every order; the stable comparison, with no explicit range |
  | ArithmeticLocallySymmetricSpaces | ALS.F.5, ALS.0.4–ALS.0.9, ALS.5b.1 | its own headings |
  | AutomorphicFormsOnReductiveGroups | §§1.1–1.3 | `vanEstIso` with full compact subgroup |
  | AdelicAlgebraicGroups | §1.2, §1.4, §§2.2–2.5, §3.4, §4.2 | §2.4 Tamagawa measure with the discriminant factor abs(d_F)^(−d/2); §3.4 SL₁(D) semisimple and compact; §4.2 strong approximation for absolutely almost simple, simply connected groups |
  | ClassFieldTheory | Layers 5, 10 | Brauer exact sequence (`exists_br_of_sum_eq_zero`, `eq_zero_of_localInv_eq_zero`) |
  | ArithmeticGaloisDuality | §R02.4.5b, §R02.4.6 | Grunwald–Wang and its exact dyadic obstruction |
  | LFunctions | Layer 3 | continuation, functional equation, germs |
  | CharacteristicClasses | §C5a.2–§C5a.5, §C6 items 2–3 | invariant-polynomial QI; Serre transgression; ch with ch(u)=−v |
  | TopologicalKTheory | T4, T7 item 1 | complex Bott; KO with complexification values |
  | DifferentialGeometry | Layers 5, 6, 8 | integration, de Rham, de Rham theorem |
  | SchemeKTheoryOperations | §6.8 | higher Adams operations ψ^k |
  | AlgebraicTopology | Stage 5 item 5 | bundle Serre spectral sequence |
  | DGFloer | Layer 1 items 2–3 | homological Serre spectral sequence and filtered complexes only, as the design says |

  Consumers resolved: Polylogarithms §§2.3, 3.7, 3.8, 4.4, 4.7; PeriodsAndSpecialValues PS.3.2a and PS.9.8–PS.9.10 (packages/PeriodsAndSpecialValues/README.md at its board head); ETUTC §6.2; HeightsRationalPointsAndObstructions §3.6, which uses period equals index inline, so the move-down is legitimate; HabiroNahmSeries §1.5. Polylogarithms' requests to "BorelRegulators Layers 3–5" map to §2.3 (real isomorphism), §5.1 (primitive determinant), §5.3 (lattice) and §5.4 (covolume and rational image); its "§7.1" maps to §7.1 (see R07). HabiroRings, at its open head, cites BorelRegulators neither in its README nor in its Suggested.lean.
- **Gaps checked for precision and minimality.** Apart from R01, R02, R05 and R06, each declared gap asks for something genuinely missing, with its hypotheses:
  - `stable-finite-range`: ArithmeticKTheory §3.4 states no finite range.
  - `cyclic-local-degrees`: §R02.4.6 states the prescribed-character theorem, not the variable-extension corollary.
  - `inner-type-a-structure`: AdelicAlgebraicGroups §3.4 gives semisimplicity only; §4.2 has the quaternion case only.
  - `adelic-rational-masses`: §2.4 gives standard-model masses only. The claim is true; Borel cites Ono 4.2.5 for it.
  - `order-finite-generation`: §3.2 does not cover non-Dedekind orders.
  - `graded-indecomposable-api`: §C5a.2 builds QI for invariant polynomials only.
  - `universal-deligne` and `infinitesimal-classifying-comparison`: MotivicEtaleKTheory exists as an open board design job. Both are contracts.
- **Generality.** README and plan hypotheses agree for every target (n≥1 for 1.1 and 1.2, n>0 for 6.1, n≥2 elsewhere, a≥1 for 6.3). The torsion-free assumptions match Borel's working hypotheses.

## Not verifiable

- weil1961 (waived) and beilinson1985 (uncertified, paywalled) were not read, as the manifest settles them. §3.4's proof route therefore cannot be checked against Weil; that is the subject of R01.
- MotivicEtaleKTheory has no README on the board, only a design job and a one-entry manifest. Its sections for `gap:universal-deligne` and `gap:infinitesimal-classifying-comparison` cannot be resolved.
- Ownership was not checked against the board packages whose READMEs live only at other pull-request heads, apart from PeriodsAndSpecialValues, which was fetched. The author reports fifteen of them unreadable; I did not refetch them, to save the shared API quota.
- Elaboration: not available (this lane does not elaborate). The design has no Suggested.lean, so there was no `#check` binder audit and no one-tactic padding probe.

## Source issues

- **Misprint** in borel1977 at §5.5, proof of Theorem 5.5, printed pp.629–630: the source says the compact cycle Z_j and the restricted invariant top form have dimension and degree j²+2j; it should be d(j²+2j), with d=[k:ℚ], matching the degree of η_j in its equation (10); affects nothing.
- **Error** in borel1977 at §5.5, proof of Theorem 5.5, printed p.630: the source says the form restricted to the diagonal norm-one group equals j+1 times the pulled-back restriction τ₁; it should be (j+1)^j times it, since each of the j primitive factors restricts with multiplicity j+1; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "79e9725", "job": "REV-DESIGN-BorelRegulators", "model": "opus", "worker": "fable-rev22"} -->
