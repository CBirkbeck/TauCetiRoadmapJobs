<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/81#issuecomment-6309311183 -->
Red team round 2 pass b (claude) of ee784da

Verdict: needs_changes

1. **F01** (P3) Two proved named theorems are Check mirrors restating pinned Mathlib facts

   Location: `packages/QWittVectors/Suggested.lean:121-137`, `theorem cyclotomicCompletedFrobenius_charTwo : Polynomial.cyclotomic 2 (ZMod 2) = Polynomial.X - 1` and `theorem cyclotomicCompletedFrobenius_charThree : Polynomial.cyclotomic 3 (ZMod 3) = (Polynomial.X - 1) ^ 2`; README `:782` "Prove the boundary targets `QWitt.cyclotomicCompletedFrobenius_charTwo` and `QWitt.cyclotomicCompletedFrobenius_charThree`".

   Claim: these are roadmap targets (README "Prove the boundary targets").

   Witness: both are one-line consequences of pinned `Polynomial.cyclotomic_two` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:379`) and `Polynomial.cyclotomic_mul_prime_eq_pow_of_not_dvd` (`Expand.lean:131`); the file-shape rule admits proved content only as `example`s testing a roadmap definition, and the README itself calls them "the two cyclotomic Checks below". A named proved theorem of a library fact is a target the library already has.

   Repair: in `Suggested.lean` replace the two `theorem … :=` headers by `example :` (keep docstrings as comments and keep the proof bodies); in README `:782` replace "Prove the boundary targets `QWitt.cyclotomicCompletedFrobenius_charTwo` and `QWitt.cyclotomicCompletedFrobenius_charThree`: Over 𝔽₂ and 𝔽₃, respectively, Φ_2=q−1 and Φ_3=(q−1)²." by "The two cyclotomic Checks below (Φ_2=q−1 over 𝔽₂, Φ_3=(q−1)² over 𝔽₃) have proved `example`s in `Suggested.lean`." Keep `QWitt.cyclotomicCompletedFrobenius_ideals_ne` as a named sorry'd target: it is not in Mathlib.

2. **F02** (P3) Unused hypothesis in `cyclotomicCompletedFrobenius_ideals`

   Location: `packages/QWittVectors/Suggested.lean:112`, `(A : Type*) [CommRing A] (p d : ℕ) [Fact p.Prime] (hd : 0 < d)`.

   Claim: the radical identity needs d>0.

   Witness: for d=0, `Polynomial.cyclotomic 0 A = 1` and `Polynomial.cyclotomic (p*0) A = 1`, so both ideals are the unit ideal and the equality holds; `hd` is never needed, and the unused-variable linter flags it once a proof replaces `sorry`.

   Repair: delete `(hd : 0 < d)` from the signature (README `:780` may keep "d>0" as the case of interest), or, if the binder is kept for parity with the README, add `_hd` naming. Either is a one-token edit.

Two P3 findings (S01, S02). No false statement, missing hypothesis, unowned prerequisite, supplier drift, upward dependency, sorry'd data or forced headline was found at this head. Every round-1 finding is repaired or settled (table below); no repair introduced a new error.

## Round-1 findings at this head

| Finding | Status | Witness at ee784da |
| --- | --- | --- |
| r1a F01 / r1b F02 (P3) Borger numbering, Bockstein pointer | repaired | `packages/QWittVectors/README.md:206` "Theorem 9.2 and Corollary 9.4, borger lines 1995 and 2095"; `:1289` same; `:1160` "with β_m from §9.3". borger line 1995 is Theorem 9.2, line 2095 is Corollary 9.4 |
| r1a F02 (P2) missing framed-automorphism headline | repaired | `packages/QWittVectors/Suggested.lean:158-170` `QWitt.framedGamma_existsUnique`; README `:981` lists it under §8.1. Statement checked true (see table) |
| r1a F03 (P3) `QWitt.VPD_noFrobenius` | repaired | README `:898` "The identity holds in every q-V system and uses only Verschiebung and the differential."; no occurrence of the name in README or Lean |
| r1a F04 (P3) eleven non-discriminating Checks | repaired | README `:218, :518, :646, :692, :708, :724, :740, :906, :1116, :1196, :1262`; all eleven values recomputed (table) |
| r1b F01 (P2) gap asks for the radical clause | repaired in README; plan.json settled | README `:76` ends the contract after `Phi_d(q^(p^alpha))` and says "The equal-radical consequence of the Mathlib identities is §6.2"; §6.2 `:780` cites the two Mathlib identities and DerivedModuleAlgebra §1.2 `isDerivedCompleteRadical` (exists, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1719`); `gap:cyclotomic-contract` is no longer in the §6.2 *Needs:* line. `design/plan.json` still carries the clause: marked not actionable (file outside the edit allowance), reason correct, not re-raised |
| r1b F03 (P3) board path and extraction as locator scheme | repaired | README `:1292` "Printed pages refer to the stated arXiv versions; the source manifest is `sources.toml` in this folder." |
| r1b F04 (P3) plan.json §8.5 | settled | README gap text `:82` says "§8.4"; `design/plan.json` still says §8.5 and has ids `8.5`, `9.4a`, no `8.1`: not actionable, reason correct, not re-raised |
| r1b F05 (P3) missing Lean mirrors | repaired (applied differently) | `Suggested.lean:108-156` Layer 6 (four declarations) and `:172-216` Layer 9 (three declarations); README `:782`, `:1102`, `:1104` name them. The two proved bodies are mathematically true; see S01 for their form |
| r1b F06 (P3) faithful-flatness locator | repaired | README `:306` cites bhatt-scholze Lemma 2.11 line 594 and wagner-habiro §1.22(e) line 493; both verified (bhatt-scholze line 594-595 states faithful flatness of Frobenius on ℤ_(p){x}; wagner-habiro line 493-497 states it for free Λ-rings); `sources.toml` `cited_for` of both contains "2.2" |

## Verified sound

Dependency check, run read-only, exit code 0, output verbatim:

```text
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers named: SchemeAndStackFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves, DGAInfinity (all on main), DerivedDeRhamCohomology, PrismaticCohomology, HabiroCyclotomicCompletions (merge order lines 17, 51, 63, all before QWittVectors at line 64, cited only through declared gaps). The seven gap slugs in `design/plan.json` equal the seven in README `:76-88`; every gap names a supplier; none asks for what Mathlib, Tau Ceti, a main roadmap or this roadmap provides (the radical clause now stays only in plan.json, settled). The pull request changes only `packages/QWittVectors/` (README.md, Suggested.lean, metadata.toml, sources.toml, two reports).

Policy: single `import Mathlib`; no `lemma`, `set_option`, `#eval`, `True` placeholder, sorry'd data, hypothesis containing its conclusion, pull-request number or process word in README or docstrings (grep for "pull request", "PR", "#81", "repair", "review", "set_option", "lemma" in the Lean file: no hit; README hits are only source citations "Lemma n.m"). Every Lean name occurs in the README (13 of 13); every README target has a locator (53 of 53 sections carry a parenthesised source locator).

Lean declarations (17 read line by line: 1 structure, 1 definition, 11 theorems, 4 examples; no ambient `variable` block, so no hypothesis can silently drop):

| Declaration, `Suggested.lean` line | Context | Instances tried; result | Change |
| --- | --- | --- | --- |
| `BigWitt.TruncationSet` :21 | none | ∅, Div(6), {2}: fields as intended | none |
| `BigWitt.ghostPolynomial` :28 | `{R} [CommRing R]` | n=1,2,6 over ℤ, 𝔽₂, zero ring; w₆ recomputed | none |
| `BigWitt.ghost_image` :33 | explicit `S`, `φ`, `hφ` for primes in S, `b` | ⟹ by the p-power congruence a≡b mod p ⟹ a^{p^k}≡b^{p^k} mod p^{k+1} with the factor d; ⟸ by divisor-ordered construction (each n has finitely many divisors, all in S); hesselholt line 223-228 (modulus p^{v_p(n)}, no commutation) | none |
| `BigWitt.ghost_injective` :46 | explicit injectivity of n· for n∈S | ℤ true; 𝔽₂ with S=Div(2) fails without `hS`; S=∅ vacuous | none |
| `BigWitt.ghost_equiv_of_units` :55 | `IsUnit (n:R)` for n∈S | ℚ, R=0, S=∅; uniqueness only on S | none |
| four `example`s :64-104 | closed | values recomputed: (1,1)↦(1,3); (0,1) has no ℤ-preimage (2x=1); 𝔽₂ witness; Div(6) closure; {2} fails | none |
| `QWitt.cyclotomicCompletedFrobenius_ideals` :111 | any `CommRing A`, prime p, d | A/pA has characteristic p or is zero; Φ_{pd}≡Φ_d^{p−1} or Φ_d^p mod p gives Φ_{pd}∈(p,Φ_d) and Φ_d∈√(p,Φ_{pd}); A=ℤ/4,p=2,d=1; A=𝔽₃,p=2 (unit ideals); A=ℤ,p=2,d=2; d=0 (unit ideals) | S02 |
| `…_charTwo`, `…_charThree` :121-137 | closed | true: X+1=X−1 in ZMod 2; X²+X+1=(X−1)² in ZMod 3 | S01 |
| `…_ideals_ne` :140 | closed | ℤ[X]/(3,Φ₃)=𝔽₃[X]/(X−1)² has X−1≠0, so X−1∉(3,Φ₃): true | none |
| `QWitt.framedGamma_existsUnique` :158 | explicit A, R, r, scalar tower, `Algebra.Etale (MvPolynomial (Fin r) A) R`, i | existence: formal étaleness lifts id_R through R[[h]]/hⁿ with the T_j↦q^{δ_ij}T_j polynomial structure, limit over n, continuous A[[h]]-linear extension to R[[h]]; uniqueness: an A[[h]]-algebra map preserves hⁿR[[h]], so is determined on R, where lifts are unique; inverse from q⁻¹; r=0 vacuous; R=0 trivial. Scholze line 319-321 and wagner line 2830-2841 state exactly this lift. `PowerSeries.constantCoeff`, `PowerSeries.C`, `PowerSeries.X` have implicit ring argument at the pin (`Mathlib/RingTheory/PowerSeries/Basic.lean:63,139,146,154`), `PowerSeries.algebraPowerSeries` at `:942` | none |
| `QWitt.framedTwoTermCohomology_unit` :176 | prime p, e, u, `¬ p ∣ u` | constant coefficient u is a unit of ℤ_p iff p∤u; `PowerSeries.isUnit_iff_constantCoeff` at `Inverse.lean:109`; u=0 excluded by `hu` | none |
| `QWitt.framedTwoTermCohomology_kernel` :184 | prime p, e≤α | f=gs with g=q^{p^e}−1≠0, s=[p^{α−e}]_{q^{p^e}} in the domain ℤ_p[[X]]; gx∈(f) ⟺ x∈(s); e=α gives s=1; e>α would be false, so `he` is needed and present. wagner line 3011 | none |
| `QWitt.framedTwoTermCohomology_two` :201 | closed | p=2,α=1,e=0: f=h(h+2), ann(h)=(h+2); B/(h(h+2),h)=B/(h)≅ℤ₂ | none |

Targets: all 53 sections with their 219 named clauses, every *Needs:* line, construction paragraph and Check (161 Checks) read. Build order: every *Needs:* entry is an earlier target, a listed supplier section, a pinned declaration or a declared gap; no layer-level cycle; no `*Needs:*` of a later roadmap.

Adversarial pass (statement; instances; result), beyond the round-1 tables, which were re-run on the repaired text:

| Statement | Instances | Result |
| --- | --- | --- |
| §1.6 coprime composition W_Div(ab)≅W_Div(a)(W_Div(b)) | a=2,b=3 over ℚ (ghost count 4=2·2); a=1 | true; borger line 1323-1331 Corollary 5.4 (partition E=E′⊔E″ with truncations) and Remark 5.5 line 1332-1334 (pairwise coprime m_i) |
| §1.6 F-pushout, finite S | S=∅, {1}, {1,2} with ℤ→ℤ×ℤ | true; hesselholt line 811-823 Theorem 1.25 (finite S, cocartesian F_n square) |
| §2.4 three equivalent conditions | A→B ff with B perfect ⟹ ψ_n ff (g ff when f∘g ff and f ff); ψ_n ff ⟹ A→A^perf ff (filtered colimit of ff maps, injective transitions) | true; wagner line 1637-1643 footnote 2.3 |
| §2.4 dual-number negative control | ψ₂(ε)=2ε; Tor via 0→(ε)→A→ℤ→0 | ψ₂ not flat: true |
| §3.2 Q₂(𝔽₂) | relations give q=1, ring ℤ/4, V₂(1)=2 | true; consistent with §3.4 sequence 𝔽₂→ℤ/4→𝔽₂ |
| §3.7 p-local decomposition | a=0 (Q_m≅∏R[ζ_d]); R=ℤ_(p) (CRT) | true; wagner line 1214-1219 Lemma 2.30 with ψ_d(q)=q^d |
| §4.1 image formula | toric ℤ[T], m=2: ℤ[T²,q]+(1+q)ℤ[T,q] | true; wagner line 1445-1450 Proposition 2.36 (all ψ_m injective) |
| §4.5 no flatness | polynomial case via π iso for every Λ-ring A | true; wagner line 1583-1620 Lemma 2.46 |
| §5.1, 5.2 étale pushouts | m=d; R=A twist by ψ_d | true; wagner line 1651-1656, 1715-1720 |
| §6.1–6.3 completed Frobenius, q fixed | R=A; p invertible; r⊗a↦φ_p(r)⊗a well defined on the ψ_{pd}-twist since φ_p=ψ_p on A; Φ_{pd}∈(p,Φ_d) makes q↦q well defined mod p | true; wagner-habiro line 647-661, 674-723 (diagram line 684-699 and 712-716) |
| §7.1 V_n d=n dV_n | V(1)=[n]_{q^d}, (q^d−1)V(η)=0 by A[q]-linearity | true, no integer inverted |
| §7.3 dF_n=nF_nd | from FdV=d and VF=[n]_{q^d}, F([n]_{q^d})=n at level d | true |
| §7.4 dV_p(x^p)=V_p(x^{p−1})dV_p(x) | Check system (id, gh₂, V₂=2^{i+1}) verified to be a q-V system; x=T gives 4T dT | true; wagner line 1856-1859 Lemma 3.4, V-only proof line 1860-1874 |
| §7.5 θ_p laws | pθ_pV_ℓ=dF_pV_ℓ, ℓθ_pV_ℓ=V_ℓθ_p from dF=pFd, Vd=ℓdV, coprime interchange; θ₂(τ₂T)²=2T³dT | true |
| §8.2 D(T^n), product rule, D(T⁻¹) | n=2,3; T⁻¹ | [n]_qT^{n−1}; D(fg)=fD(g)+γ(g)D(f); −q⁻¹T⁻²: true; wagner line 2846, 2859 |
| §8.3 Leibniz and skew rule | rank 1, 2 | true; wagner line 2863-2871 |
| §8.4 φ□ on H□ and C□ | p=2: both paths on d_H(T) give (q²−1)T dT; C□ needs [p]_q | true; wagner line 3298, 3456 |
| §9.1 bases | r=1,p=2,α=1 (1,T; T dT,dT); α=0; v=0 convention T^{p^α−1}dT | true; wagner line 2893-2897, 2955 |
| §9.2 H⁰,H¹, tensor splitting | sS_α≅B/(g); S_α/(g)=B/(g); basis change e₂′=te₁+e₂ splits K_{e₁}⊗K_{e₂} | true; wagner line 2973-2992, 3011-3012; ordinary tensor over B and over S_α agree termwise |
| §9.3 β sign, Fβ_mV=β_d | β₁(T)=[dT]; β₂[T²]=[T dT]; d(ax)=f_m y | true; f_m regular since its h-coefficient is m and R is ℤ-torsion-free; wagner line 3027-3030, 3178-3182 |
| §9.4 homotopy Checks | (dX,ω) on ℤ[X,Y]; (a dT,b); rank-one H | −XY dX, hX dX∧dY, Ta·hD(b) dT: true |
| §9.5 cocycle Check | T² vs T mod q²−1 | true |
| §9.6 (a)–(d), ghost quotient | α=0; dV₂(T)∉im V₂ | true; wagner line 2703-2720 battle plan, 2756-2758 Lemma 4.5, 2777-2808 |
| §9.7 product over d∣n, derived tensor over C_α | p=2,m=6 twists ψ₂,ψ₆; p=3,m=2 CRT; Tor₁ over ℤ[q] | true; wagner line 2692-2702 Proposition 4.2, 3645-3654 Lemma 4.36 (tensor over A[q] factors through C_α) |
| §10.1, 10.2 | R=ℤ[x]/x²; ℤ[h]/(h(h+2)) has ann(h^k)=(h+2) for all k; mod 2 bound 2 | true; wagner line 2690-2691, 2810-2822 |
| Conventions: prime-generator ideal at m=6, intersection formula | ([2]_{q³},[3]_{q²})=(Φ₆); (Φ₁,Φ₂), (Φ₂,Φ₆), (Φ₁,Φ₆) | true as contracted |

Locators verified against the cached extractions this pass (48 distinct anchors, all matching the cited statement and hypotheses): borger 1323, 1332, 1995, 2095; hesselholt 217-228, 711, 753, 787, 811-827; wagner 366-430, 1006-1030, 1083-1135, 1194-1230, 1348, 1445-1468, 1485-1495, 1573-1643, 1651-1665, 1715-1730, 1849-1880, 2688-2722, 2756-2822, 2828-2872, 2882-2891, 2948-3012, 3022-3052, 3081-3095, 3178-3227, 3292-3300, 3341-3350, 3452-3470, 3491-3500, 3584-3608, 3613-3660; wagner-habiro 493-498, 647-661, 674-723; scholze 291-304, 319-323; pridham 371, 506, 635; bhatt-scholze 594, 775-782; langer-zink 453, 601-606. The round-1 anchor lists were not re-read in full; the anchors they verified that are not in this list are unchanged at this head.

Pinned declarations grepped at Mathlib `6b7abb3c` (local checkout of that commit): the ten `WittVector`/`TruncatedWittVector` names of README `:33-37` (`verschiebung_injective`, `verschiebung_coeff_succ`, `ghostComponent_teichmuller`, `frobenius_eq_map_frobenius`, `ghostComponent_frobenius`, `coeff_truncate`, `ghostComponent_apply`, `map_coeff`, `ghostMap`, `instCommRing`), the six cyclotomic lemmas with the hypotheses described at `:38-40`, `KaehlerDifferential.linearMapEquivDerivation`, `PowerSeries.constantCoeff`, `PowerSeries.C`, `PowerSeries.X`, `PowerSeries.algebraPowerSeries`, `PowerSeries.isUnit_iff_constantCoeff`, `Algebra.Etale`. Tau Ceti `a91d3aa` (raw files at the commit): `TauCeti.explicitBockstein1` (`Bockstein/Basic.lean:92`), `TauCeti.integralBockstein` (`Bockstein/Integral.lean:136`), `kaehlerBasisOfFormallyEtale` and `_apply` (`Kaehler/FormallyEtale.lean:67,71`), `WittVector.isAdicComplete_span_p_teichmuller` (`WittVector/Complete.lean:197`), `continuous_frobenius`, `continuous_frobeniusEquiv_symm` (`WittVector/Frobenius.lean:65,79`, the latter with `[PerfectRing R p]` as the README says).

Supplier sections checked on main (17): DerivedModuleAlgebra §§0.K.1, 0.2, 1.1, 1.2 (`isDerivedCompleteRadical` at `:1719`), 1.3, 1.5, 1.7, 1.8, 1.9; DGAInfinity Layers 0, 1; EnhancedDerivedSheaves §0.3, Layer E5:abstract; SchemeAndStackFoundations §§0.23a, 0.24, 0.29, 4.1. Direct sibling citations: none (the two open sibling heads contain no q-Witt, big-Witt, Λ-ring or framed-difference object). Duplication grep of main for big Witt, Λ-rings, q-Witt, Jackson derivative, arithmetic fracture: no second owner.

Headlines: `framedGamma_existsUnique` is the easy Layer 8 headline on existing carriers and is now present; Layers 2–7, 9 (beyond §9.2) and 10 need carriers (`BigWitt`, `Q_m`, `H□`) that are README targets, so no further easy headline is missing and none is forced.

## Not verifiable

- Lean elaboration: the brief permits no Lean command, and the package report records that the file was never compiled. Risks for the build gate: the `let B := PowerSeries ℤ_[p]` binders in `framedTwoTermCohomology_kernel` and `_two` (instance search for `B ⧸ I` through a let-bound type), `simpa` normalising `1 * 2`, `2 - 1` and `cyclotomic_one` in the two proved cyclotomic bodies, `decide` on `Nat.divisors 6`, and `norm_num` closing the `ZMod 2` goals.
- The gap suppliers (HabiroCyclotomicCompletions, DerivedDeRhamCohomology, PrismaticCohomology, the two Part II extensions) are not on main or in the open pull-request checkouts; the gaps were checked for precision, minimality and declaration only.
- Borger Corollary 5.4 was read in statement (line 1323-1331) for the general E-typical functor; its specialisation to Div(ab) uses Remark 5.5 (line 1332-1334) and was not re-derived from Borger's proof.
- Wagner Corollary 3.33 (étale sheaf property, used in §7.7 and the (d)⇒(a) step at line 2803-2808) was read only where cited, not in its own proof.
- `design/plan.json` residuals (radical clause, §8.5, target ids) are settled by the round-1 repair report as outside the edit allowance; they were not re-examined beyond confirming they are unchanged.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ee784da11ef1e4bc6766d51d90175b77ca11180a", "job": "RT-QWittVectors~2b", "model": "fable", "worker": "chris-g"} -->
