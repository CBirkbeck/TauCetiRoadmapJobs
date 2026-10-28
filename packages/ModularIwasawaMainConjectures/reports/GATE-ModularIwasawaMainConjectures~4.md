## H01 (CBirkbeck) — applied

The signed package now lives on T_LLZ:=T_K(k−1) with Tate partner A^*=Hom_cont(T_LLZ,μ_(p^∞)), LLZ's T_f̄(k−1) and (V_f/T_f)(1) (LLZ lines 2512–2513, line 2522). Accordingly, `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md` lines 611–651 replace T_K by T_LLZ, line 687 states KMC^η(T_LLZ) ⟺ SMC^{i,η} = KMC^(ηω^(1−k))(T_K) through the new KMC.twist (line 463), the shifted-component equality is required from AutomorphicCongruences as gap:tate-twisted-components (line 132), and §§2.3(2) and 4.3 (lines 1076, 1565–1573) are now conditional on that contract, with only SMC^(1,ω^(k−1)) surviving from the untwisted KMC^1(T_K) (§2.3(3)); the same shift is repaired on the ordinary side (§0.10 matched component = trivial component of T_K(1), lines 574, 903–913, 1076).

## H02 (CBirkbeck) — applied

IMC.greenberg_instance (line 379), the §0.5 Check (line 396) and §5.9(1) (lines 1868–1874) now identify the trivial-component projection of the integral GreenbergCharIdealConjecture of SelmerIwasawaCohomology §4.21 with IMC(D), with its rationalization giving IMC_Q(D), with analytic datum ι_Γ(L_f) (contragredient dual of its §2.10 against the scalar dual of §0.2), and only on the good ordinary domain. The negative controls Λ/(p) with analytic element 1 (lines 397, 1886) and ι_Γ(X−7)~(X+7/8) (line 398) are added.

## H03 (CBirkbeck) — applied differently

At EulerSystemsAndKolyvaginSystems head 7a0e642, §1.13 "Application verifications" (its README line 1259) applies the d=1, p≥5 lifting statement by citing Landesman–Swaminathan–Tao–Xu, without stating a target for it, and no roadmap on main or at an open head other than this one states the lemma; lines 7 and 150 now say "states as a target" instead of "plans" and record that use. At its open head ArithmeticGaloisRepresentations §6.4a states only the generic Frattini detection of full image, not Serre's computation for SL₂(ℤ_p), so moving the lemma there is an ownership decision left to the maintainer; the pro-p Frattini input of the proof route is now named in §3.6's *Needs:* (ProfiniteProPGroups Layer 3, line 1277).

## H04 (CBirkbeck) — answered

The pull-request description is outside the files this job may edit; README line 9 already gives its content: existing suppliers on main and earlier in the merge order; KatoEulerSystems and AutomorphicCongruences as proposed prerequisite contracts (now including gap:tate-twisted-components), listed in the board merge order directly before this roadmap with no owner specification in the content repository; HeegnerPointEulerSystems Layer 8b and the Birch–Swinnerton-Dyer branch as consumers only. The chain for the description is PadicFamilies and the arithmetic foundations → KatoEulerSystems → AutomorphicCongruences → ModularIwasawaMainConjectures → those consumers, and the endpoints of §§1.5, 2.2–2.3, 4.1–4.3 and 5.4(2) depend on publication and implementation of the two contracts.

## Details of the repairs

H01, signed side. LLZ build (60)–(61) on H^i(T_f̄(k−1)) (LLZ lines 2522, 2534), and their Kato zeta element lies in H¹_Iw(ℚ_p,V_f̄(k−1)) (LLZ line 797). In weight two Kato's own lattice is T_pE(−1) (Kato line 6098), so T_K=T_pE^∨ while T_LLZ=T_pE. The README changes are:

- the Coleman domain, the local pairing and A^* (line 611);
- the Poitou–Tate sequence (lines 623, 628, 632);
- the zeta element and module, with localization compatibility from KatoEulerSystems §4.6 (lines 651, 659);
- the §0.13 sequence and equivalence (line 687), and the Kato divisibility moved to T_LLZ (lines 695, 699);
- the determinant Check (line 647) and the index-two Check (line 709).

H01, the twist. KMC.twist (line 463, Checks at lines 476–477) uses the twist of SelmerIwasawaCohomology §3.7, φ_r(λx)=Tw_r(λ)φ_r(x) with Tw_r(σ)=κ(σ)^(−r)σ, and the semilinear transport of PadicMeasuresIwasawaAlgebras §4.6. This is used in place of the suggested KatoEulerSystems §2.2, which is the Hecke and literal-dual dictionary rather than the Tate twist. The Conventions paragraph at line 53 fixes the three twists r=1, k−1 and k/2.

H01, the contract. gap:tate-twisted-components is named in Scope (line 19) and in the AutomorphicCongruences contract (lines 109, 132). For k=2 all three twists are r=1, so the new contract is the same equality, for T_pE, that gap:central-critical-specialization already requires.

H01, the ordinary side. The compact Tate partner of A=T⊗L/O is Hom_O(T,O(1))≅T_f(1), so §0.10's matched component is KMC^1(T_K(1))=KMC^(ω^(−1))(T_K) (line 574, Check at line 604). §1.5 and §2.3(1) had applied §0.10 to the untwisted KMC^1(T_K); the lines changed are:

- §1.4, §1.5 and §2.3: lines 876, 903, 913 and 1076;
- §2.1: lines 1018 and 1042;
- the examples in §§2.3, 5.10 and 5.11: lines 1094, 1890 and 1913;
- dependent statements: the hypothesis table at line 180 and the §0.10 interface at line 607.

The Kobayashi identifications of §§4.5 and 6.3 now match A^*=E[p^∞] (line 1613).

## Mathematical verification

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Tw_r(e_χ)=e_(χω^r) | p=5, χ=1, r=1; ω(2)≡2, ω(3)≡3, ω(4)=−1 | Tw_1(e_1)=¼(δ₁+3δ₂+2δ₃+4δ₄) mod 5 = ¼Σω(δ)⁻¹δ = e_ω; e_ω on a line with δ↦ω(δ) gives ¼·4=1 | Twist moves label 1 to ω | line 53 |
| KMC.twist, Γ-variable | p=5, κ(γ)=6, r=1; p=3, κ(γ)=4, r=2; r=0 | γ acts on φ_r(x) by κ(γ)^r: Λ/(X)↦Λ/(X−5); Λ/(X)↦Λ/(X−15); r=0 identity | X∤X−5 (value −5 at 0): distinct primes, even with equal labels at p=3 | lines 463, 476–477 |
| KMC.twist, tame label | k=2, p=5, δ=−1 | matched component ω^(−1) has value −1; untwisted trivial has value 1 | Components differ | lines 476, 709, 1094 |
| Ordinary matched lattice | general k, trivial character; k=2 | T=T_f(k−1), T^∨=T_f^∨(1−k)=T_f, Hom(T,O(1))=T_f(1); k=2 gives T_pE | Matched component is the trivial one of T_K(1) | lines 574, 604 |
| Three twists distinct | k=4 at p=7, 5, 3 | p=7: ω^(−1), ω^(−3), ω^(−2) of orders 6, 2, 3; p=5: ω^(−1), ω, ω^(−2) distinct; p=3: r=1, 3 share label ω but Tw_1≠Tw_3 | Separate requirements for k≥4 | line 132 |
| T_K versus T_LLZ | k=2, trivial character, κ(g)=4 | det T_K(g)=1/4, det T_LLZ(g)=4; Tate partners E[p^∞](1) and E[p^∞] | Not equivariantly isomorphic | lines 611, 647 |
| Untwisted component, index one | η=ω^(k−1), r=k−1 | ηω^(−(k−1))=1, so KMC^1(T_K) ⟺ KMC^(ω^(k−1))(T_LLZ) ⟺ SMC^(1,ω^(k−1)) | Valid for i=1 only | line 1076 |
| Untwisted component, index two | k=2, p=5; k=4, p=7; k=2, p=3 | ω^(k−1) is ω (order 4), ω³ (order 2), ω (order 2), never 1; k−1 odd, p−1 even | No i=2 statement | line 709 |
| Weight-two coincidence | k=2 | r=1=k−1=k/2; T_K(1)=T_pE | Equals the central-critical equality | lines 53, 132 |
| Greenberg, integral versus rational | Λ=Z_p[[X]], M=Λ/(p), L=1; idempotents (1±δ)/2 at p=5 | integral (p)≠(1); rational both unit ideals; projection keeps (p) | Integral instance is IMC, not IMC_Q | lines 379, 396–397, 1886 |
| Greenberg, dual transport | L_f=X−7 and L_f=X over Z_7[[X]] | ι_Γ(X−7)=−(8X+7)/(1+X)~X+7/8, values 0 and 63/8 at X=7; ι_Γ(X)~X | Datum is ι_Γ(L_f) | line 398 |
| Greenberg, domain | split multiplicative E at p, p∣N | IMC of §0.5 requires p∤N | Dictionary only for good ordinary data | lines 1868, 1870 |
| Lean declarations | the four declarations with `#check @name` | binders as in §§0.8, 3.6, 3.7: DVR and square-zero hypotheses; p≥5, closedness, surjectivity; unit q, ‖q‖<1, algebraic j | Unchanged | none |

The changed statements agree with the other Checks on the same objects. The §0.12 image Checks do not depend on the coefficient lattice. The §2.1 evaluation [δg]↦ω(δ)^(−r)κ(g)^(−r) agrees with KMC.twist at r=k/2.

## Ownership, citations and Lean signatures

The generic pieces have other owners:

- the twist: SelmerIwasawaCohomology §3.7, at head 1fa1c7d;
- semilinear transport of characteristic ideals: PadicMeasuresIwasawaAlgebras §4.6, on main;
- the analogous transport for ℚ_p(n): SelmerIwasawaCohomology §4.22.

KMC.twist is the modular instance and adds no generic theorem. PadicHodgeRegulators at head 09a5b3a, §§9.28–9.29, works on V_f̄(k−1) with T=T₀(h) and h=k−1, which now agrees with §0.11.

KatoEulerSystems §4.6 and AutomorphicCongruences §§2.21 and 4.5 were read at their board-package heads 0ff66a0 and bfa3205. Both AutomorphicCongruences sections are stated on the untwisted trivial component, which is why the new contract is needed.

Ownership against open pull requests was checked with the roadmap search over main and every open head. The citation resolver still reports only the proposed KatoEulerSystems §2.2 and AutomorphicCongruences §4.5 contracts, at lines 200 and 97. No supplier moves to a later roadmap, and no new source is needed.

The four declarations of `TauCetiRoadmap/ModularIwasawaMainConjectures/Suggested.lean` were elaborated together with `#check @name` (exit 0) and compared with §§0.8, 3.6 and 3.7. Nothing in that file changed.

## Validation

Commits: 9d672fbc — ModularIwasawaMainConjectures: review repairs (Tate-twisted Kato components for signed and ordinary comparisons, integral Greenberg dictionary, Serre-lemma facts); da7fa7f8 — ModularIwasawaMainConjectures: review repairs (pro-p Frattini supplier for the SL2 lifting lemma). Only `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md` changed (75 insertions, 61 deletions in total), and nothing was pushed.

Build command: `lake build TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested`. It printed `Build completed successfully (8983 jobs).` and exited 0. The three expected `sorry` warnings are at `TauCetiRoadmap/ModularIwasawaMainConjectures/Suggested.lean:50`, line 62 and line 72.

Dependency-direction output, with no UPWARD, CYCLE or moved line:

```text
depcheck: 55 roadmaps, 638 edges, 0 problem(s)
```

Gate summary at da7fa7f8, exit 0; the run before the first commit differed only in dirty=1:

```text
gate ModularIwasawaMainConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
