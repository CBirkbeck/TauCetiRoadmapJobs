# Review of EllipticCurveModularityPartII (pull request #1491 at 9bc95b1)

**Verdict:** needs changes

:robot: This is an incremental AI re-review of the 54 lines changed since `95f7c2f` (review 10's head). The changed passages are the supplier-contract rewrites (lines 23, 91, 106–126, 160), the §1.8, §5.2 and §5.4 locators, the new §6.0b paragraph and Check, the Downstream paragraph, and the new theorem `rational_isogeny_j_tables` with its docstring. Nothing changed outside the folder. Untouched text that review 10 passed is not re-reviewed.

## R01 (P1) — The bad-prime classification and Γ₀(N) index formula are cited at Tau Ceti names absent from the pin

Carried from review 10's R01 (review 9's R01). The passage is unchanged at this head.

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 41 reads: “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` and `…_eq_zero_of_factorization_conductor_lt` (…/Newforms/BadPrime/Classification) give, at weight two and trivial character, a_q²=1 when q∥N and a_q=0 when q²∣N”, and “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors` … states [SL₂(ℤ):Γ₀(N)]·∏q = N·∏(q+1)”. Lines 9, 304, 361 and 363 claim the same supply.

**Claim.** The pinned Tau Ceti supplies the two bad-prime coefficient facts and the Γ₀(N) index formula at those names.

**Witness.** At the Tau Ceti pin `a91d3aaf`, `NumberTheory/ModularForms/Newforms/BadPrime/` contains only `Stability.lean` and `Vanishing.lean`; a grep of the pinned Tau Ceti and Mathlib trees for the three names returns nothing. Mathlib `CongruenceSubgroups/Basic.lean` has `Gamma0_prime_index` (line 547) and `Gamma0_prime_power_index` (line 631) only.

**Repair.** As in review 10:
- **q²∣N.** Cite `HeckeRing.GL2.Newform.qExpansion_coeff_prime_eq_zero_of_sq_dvd` (`Newforms/BadPrime/Vanishing.lean:101`), whose `FactorsThrough` hypothesis the trivial character satisfies.
- **q∥N.** Add a §3.2 target: a weight-two trivial-character newform has a_q=±1 when q∥N (Kraus, Appendix II, §8.1, p. 1160, Kraus1997 line 1146), routed through `HeckeRing.GL2.Newform.atkinLehnerSign_eq_one_or_neg_one` (`AtkinLehner/Sign.lean:307`).
- **Index.** Cite `CongruenceSubgroup.Gamma0_prime_power_index` and add a Layer 1 target for multiplicativity over coprime levels.
- Reword lines 9, 304, 361 and 363 accordingly. `Suggested.lean` needs no change.

**Tested.** 27a has a₃=0 at 3²∣27; 11a has a₁₁=1 and 14a has a₂=−1; μ(12)=24=μ(4)·μ(3).

## R02 (P1) — The Tau Ceti Cartier declaration cited in §6.0f does not exist at the pin

Carried from review 10's R02 (review 9's R02). The passage is unchanged at this head.

**Location.** Line 734 reads: “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier) without its hypothesis that the underlying scheme is affine”. Line 41 cites the same declaration as supplied.

**Witness.** At the pin, `TauCeti/AlgebraicGeometry/Group/` contains only `Smooth.lean`; no file `Cartier.lean` and no declaration `smooth_of_grpObj_of_charZero` exists in the pinned tree.

**Repair.** As in review 10: at line 41 delete the clause naming that declaration, keeping `TauCeti.smoothCommHopfAlgProperty_of_charZero` (`Algebra/AlgebraicGroup/Smooth/CharZero.lean:148`) as the affine Hopf-algebra case; at line 734 state the target directly (a `CategoryTheory.GrpObj` over Spec k, k of characteristic zero, with `LocallyOfFiniteType` structure morphism, is `AlgebraicGeometry.Smooth`) and say that the Tau Ceti declaration is the affine case only.

## R03 (P3) — Wrong namespace and file for the pinned Sturm and E₂ declarations

Carried from review 10's R07 (review 9's R03). The passages are unchanged at this head.

**Location.** Line 41 reads: “Consume `ModularForm.sturm_bound_finiteIndex` and `ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound, declared in the namespace `ModularForm`)”; the same names at lines 353, 418 and 756. Line 41 also places `correctedE2` in “EisensteinSeries/WeightTwo/Basic”.

**Witness.** `SturmBound.lean` opens `namespace TauCeti` at line 47 and `namespace ModularForm` at line 49; the theorems are at lines 79 and 102, so their full names are `TauCeti.ModularForm.…`. `correctedE2` is at `EisensteinSeries/WeightTwo.lean:81`; there is no `WeightTwo/` directory.

**Repair.** Write `TauCeti.ModularForm.…` at lines 41, 353, 418 and 756; say “namespace `TauCeti.ModularForm`” at line 41; give the file as `EisensteinSeries/WeightTwo`.

## R04 (P3) — The new §6.0b Check contradicts itself about which inclusion a smaller table satisfies

A problem the repair of review 10's R05 introduced.

**Location.** Line 663 reads: “An inclusion of the j-set in the table, which is all that §6.18 consumes, would also hold for a table without −2¹⁵; the equality excludes that smaller table.”

**Claim.** The inclusion {j(E) : E/ℚ with a rational cyclic 11-isogeny} ⊆ T holds for T = {−11·131³, −11²}.

**Witness.** The same Check's first sentence: the curve with CM by the maximal order of ℚ(√−11) has j = −2¹⁵ and a rational cyclic 11-isogeny (the kernel of √−11), so −2¹⁵ lies in the j-set and not in T. The inclusion fails for the smaller table; it is the reverse inclusion T ⊆ j-set (every listed value is attained) that the smaller table satisfies. Since §6.18 consumes j-set ⊆ table, a table without −2¹⁵ would also break §6.18.

**Repair.** Replace the quoted sentence with: “The inclusion of the table in the j-set, that every listed value is attained, would also hold for a table without −2¹⁵; the inclusion of the j-set in the table, which §6.18 consumes, fails for it, and so would §6.18 at this CM curve. Conversely the inclusion §6.18 consumes would also hold for a table with a spurious extra value; the equality excludes both.”

**Tested.** −2¹⁵ = −32768 is the j-invariant of discriminant −11; the other four integral values −24729001, −121, −162677523113838677 and −9317 are not CM j-invariants.

## R05 (P3) — The disposition of EllipticModularityEffectiveComparisons is not stated in the description

Review 10's R03, partly repaired: the Downstream paragraph (line 1061) no longer names that roadmap as the contract and now lists the EC.0–EC.6 sections. The second half of the repair, a statement in the pull-request description, is absent.

**Location.** The description (quoted as data in the worker's scratch) does not mention EllipticModularityEffectiveComparisons.

**Witness.** EllipticModularityEffectiveComparisons (open, #1810, merge order line 282 against this roadmap's 272) still re-declares `localTerms`, `martinValue`, `newDimension`, `GeometricTorsion` and `torsionRepresentation` and plans the same results; its own review has rejected it as a re-plan of this roadmap, so this roadmap keeps ownership.

**Repair.** In the description, state that EllipticModularityEffectiveComparisons is to be closed, or cut down to a consumer citing §§1.4, 1.5–1.8, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18, before either merges.

## R06 (P3) — The description does not name the ModularForms revision whose sections the README cites

Carried from review 10's R08 (review 9's R04). The description is unchanged.

**Location.** Lines 9 and 49 cite “ModularForms §3.1 … §8.2 … and §§0.2 and 1.1”; the ids recur at lines 229, 304, 323, 342, 353, 355, 361, 387, 642, 685, 875 and 1057.

**Witness.** The overlap report lists ModularForms §§0.2, 3.1 and 8.2 as defined only at the head of #1706; main's ModularForms has §10C but none of them. “1706” does not occur in the description.

**Repair.** Add ModularForms (#1706) to the description's depends-on list and merge-order paragraph as a revision that merges first.

## Previous findings

- R01 — not repaired: line 41 still reads “`HeckeRing.GL2.Newform.qExpansion_coeff_prime_sq_of_factorization_eq_one` … (NumberTheory/ModularForms/Newforms/BadPrime/Classification)” and “`CongruenceSubgroup.Gamma0_index_mul_prod_primeFactors`”. Now R01.
- R02 — not repaired: line 734 still reads “State Cartier's theorem as Tau Ceti `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (AlgebraicGeometry/Group/Cartier)”. Now R02.
- R03 — partly repaired: line 1061 now reads “ErdosProgressionPowers consumes this roadmap through its supplier contract labelled EC.0–EC.6: §1.4 (EC.0), §2.2 (EC.1), …”, matching ErdosProgressionPowers' table rows exactly; the description says nothing about EllipticModularityEffectiveComparisons. Now R05.
- R04 — repaired: lines 106, 110, 118, 120, 122, 126 and 160 now read “From EllipticCurveModularity R29.3, …”, “From SerreWeightAndLevelOptimisation §6.1, …”, “From ArithmeticGaloisRepresentations §6.2, …”, “… §4.1, …”, “… §4.5, …”, “From AutomorphicGaloisRepresentations §6.2, …”, “From NeronModelsAndSemistableAbelianVarieties §6.4d, …”; the compound gap at line 112 is now a direct citation of NeronModels §5.3a, ArithmeticGaloisRepresentations §§3.2–3.3 and 3.6, and AlgebraicModularFormsAndSerreWeights Layer 4; `design/plan.json` lists exactly the five remaining slugs. Every cited section exists at its head and states what the contract says (details under Verified sound).
- R05 — repaired: `Suggested.lean` lines 230–237 state `rational_isogeny_j_tables`; the docstring (lines 33–37) now lists only the BPR theorem and coordinates as unstatable; §6.0b line 658 reads “State `rational_isogeny_j_tables`, the moduli form of these tables”. The accompanying Check introduced R04.
- R06 — repaired: line 290 adds “[BS], §2, p. 360, definitions of F, G and H”; line 593 reads “Kenku, pp. 199–201, through the composite-degree classification of §5.0b; BS, §3, proofs of Lemmas 3.3 and 3.5, pp. 362–363, use the consequent irreducibility for ℓ ≥ 7 and ℓ ≥ 11”; line 609 reads “for ℓ ≥ 7; ℓ = 5 is the exclusion of degree 20 in §5.2”.
- R07 — not repaired: line 41 still reads “declared in the namespace `ModularForm`” and “EisensteinSeries/WeightTwo/Basic”. Now R03.
- R08 — not repaired: the description still omits #1706. Now R06.

**Settled, not re-raised.** The slugs `kato-labelled-pushforward` and `kato-labelled-reciprocity` (lines 67 and 69) remain absent from `design/plan.json`; GATE~11 H01 marked this a worker's edit outside the package, and the reason holds.

## Verified sound

### Gate, dependency check and elaboration

**Gate.** My rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate at this head also reports `build=0`.

**Dependency check.**

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. This roadmap is line 272 of the merge order. (ErdosProgressionPowers sits at line 54 and consumes this roadmap; that is its placement to settle, and this README cites it only as a consumer.)

**Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 12 s with 14 `declaration uses sorry` warnings (13 before plus `rational_isogeny_j_tables`) and nothing else. A scratch copy with `#check @rational_isogeny_j_tables` and `#check @HasCyclicIsogeny` elaborates; the type is the README's §6.0b statement (three set equalities over `WeierstrassCurve ℚ` with `IsElliptic`, `HasCyclicIsogeny E r` and `E.j`), no binder lost. The worker's `signatures.md` agrees for all 25 declarations.

**Padding probe.** Replacing the new theorem's `sorry` by `first | rfl | simp | decide | (ext; simp) | infer_instance` fails to close it, so it is not padding. The 13 earlier theorems were probed in review 10.

### Changed supplier contracts, resolved at the open heads

Each cited section exists at the head of its pull request and states what the contract says:
- **EllipticCurveModularity (#1018):** Layer R29.3 subsection “The newform of an elliptic curve” (level N_E, A_ℓ(F_E)=a_ℓ(E) at every good ℓ) and Layer R29.4 subsection “The level is the conductor” (M=N_E).
- **SerreWeightAndLevelOptimisation (#1013):** §6.1 “Reduced elliptic level M₀” (BS (3), q=ℓ included), §6.2 “Elliptic residual weight-two newform” (modularity witness as input, ℓ≥3, λ∣ℓ, ρ_f,λ≅E[ℓ]), §6.3 “Trace congruences at good and removed primes” (Lemma 2.1(i)–(ii) with the split/nonsplit sign, q=ℓ excluded). The contract's hypotheses q∤ℓMM₀ and q∤ℓM₀, q∥M match §6.3 and BS2020 lines 191–193.
- **ArithmeticGaloisRepresentations (#856):** §3.2 (Artin conductor a(V)=ε+Sw, natural-number form), §3.3 (global conductors), §3.6 (conductors of reductions), §4.1 paragraph “Absolute irreducibility from oddness” (irreducible, odd at a real place, char k≠2 ⇒ absolutely irreducible), §4.4 (Dickson), §4.5 paragraph “Serre's propositions” (Prop. 15: ℓ∣#G ⇒ G⊇SL or Borel; Prop. 16: ℓ∤#G ⇒ cyclic, dihedral, A₄, S₄, A₅), §6.2 paragraph “Determinant and oddness” (det E[ℓ] cyclotomic; ±1-eigenspaces of c Lagrangian of dimension g; rank-g eigenlattices span T_ℓA for ℓ odd). The contract's clause “spanning it” is the ℓ-odd statement, and the contract is for odd ℓ.
- **AlgebraicModularFormsAndSerreWeights (#928):** Layer 4 “The local Serre weight”, §§4.1–4.5 (tame alternatives, tame table k=1+pa+b, wild table with peu/très, determinant parity, invariance), a function of a continuous two-dimensional local mod-p representation, as the Conventions line 23 and the line 112 contract say.
- **AutomorphicGaloisRepresentations (#1007):** §6.2 “Residual newform representation” (semisimplified reduction of a stable lattice; prime-to-ℓ conductor divides N; det ρ̄(c)=−1) and §6.3 “The full weight-two Hecke algebra” (good polynomial X²−T_pX+p⟨p⟩ for p∤Nℓ).
- **NeronModelsAndSemistableAbelianVarieties (#852):** §5.3a “The elliptic conductor exponent” (f(E)=a(V_ℓ₀E)), §5.3h “Residual elliptic conductors” (N(E[ℓ]) formula for ℓ≥5 over ℚ), §6.4d “Exact cotangents of semistable quotients” (e<p−1, B semistable, exact free cotangent sequence, exactness preserved by every scalar extension including the residue field).
- **ErdosProgressionPowers (#1336):** README lines 657–663 give EC.0 §1.4, EC.1 §2.2, EC.2 §§1.5–1.8, EC.3 §4.7, EC.4 §§5.4–5.5, EC.5 §6.18, EC.6 §5.1 (`GeometricTorsion`, `torsionRepresentation`, `FullRationalTwo`), and line 667 bounds its progression levels against the §1.8 majorants: the Downstream paragraph at line 1061 is exact.

The five remaining declared gaps (`optimized-weight-two-lift`, `modular-abelian-conductor`, `mixed-modular-curves`, `mixed-modular-jacobians`, `newform-quotient`) are the same slugs in `design/plan.json` and in the README's “What … must provide” lines (108, 128, 132, 134, 136); their `needs` sentences are unchanged since review 10.

### Sources, the changed locators

- **§1.8** (line 290): BS2020 lines 221–233 (p. 360) define F(n)=(μ(n)/6+1)^{2g₀⁺(n)}, G(n)=(μ(lcm(n,4))/6+1)², H=max: the majorants F_K, G_K, H_K as written. Kraus (7)–(9), pp. 1143–1144, verified in review 10.
- **§5.2** (line 593): BS2020 line 294 (Lemma 3.3 proof: full 2-torsion, ℓ≥7, irreducible by Mazur) and lines 334–335 (Lemma 3.5 proof: a rational 2-torsion point, ℓ≥11, irreducible by Mazur); neither states a 2ℓ or 4ℓ exclusion. The sentence is exact.
- **§5.4** (line 609): the same line 294, ℓ≥7 only; ℓ=5 is 20∉{1,…,19,21,25,27,37,43,67,163}.
- **§6.0b and the Lean statement:** Lemos2017 lines 197–202: S₁₁={−11·131³,−2¹⁵,−11²}, S₁₇={−17²·101³/2, −17·373³/2¹⁷}, S₃₇={−7·137³·2083³, −7·11³}, all as in `rational_isogeny_j_tables`.
- **Deletion-level contract** (line 110): BS2020 lines 169–173 (equation (3)), 184–186 (Theorem 3), 191–193 (Lemma 2.1(i)–(ii)).

### Adversarial table

Rows for untouched statements carry forward from review 10, which computed them at the same text.

| Statement | Instances | Values computed on the two sides | Result |
|---|---|---|---|
| **6.0b `rational_isogeny_j_tables` (changed)** | r=11, 17, 37; j=0, 1728; the CM point | Values −24729001, −32768, −121; −297756989/2, −882216989/131072; −162677523113838677, −9317. None is 0 or 1728, so the j-image form of line 140 and the moduli form coincide (a noncuspidal point with j≠0,1728 is represented over ℚ, Aut=±1). −32768 is the CM j of discriminant −11; the kernel of √−11 has order N(√−11)=11, is cyclic, and is fixed by conjugation since −√−11 has the same kernel; the other four integral values are not CM j-invariants. The j-set ⊆ {−24729001, −121} fails at −32768 | Statement sound; Check R04 |
| 6.0b j-image contract (line 140) | 37a1 | #E(𝔽₂)=5, #E(𝔽₃)=7, so (0,0) is nontorsion | Sound (review 10) |
| Conventions: Serre weight (line 23, changed) | 141a1 at ℓ=3; supersingular E at p | SWLO §6.1 Check: N(E[3])=47 with classical weight 4 ≠ 2, so the weight-2 clause does not apply and M₀=141 ≠ N(E[3]); AMFSW §4.2: niveau-two (0,1) gives k=2 | Sound |
| Deletion-level contract (line 110, changed) | M=11, ℓ=5, Δ=−11⁵ | 5∣ord₁₁(Δ)=5 and 11∥11, so M₀=1; BS Lemma 2.2 then bounds ℓ≤(√11+1)^{(1+1)/6}·…: consistent with §2.2's exponent (M₀+1)/6 computed in review 10 | Sound |
| Conjugation contract (line 118, changed) | ℓ=3, c=diag(1,−1) on ℤ₃² | Eigenlattices ℤ₃⊕0 and 0⊕ℤ₃ span; det=−1, trace 0; at ℓ=2 the span is only ⊇2T₂, excluded by “odd ℓ” | Sound |
| Dickson contract (line 122, changed) | p=7; p=11 | A₅ needs 60∣#PGL₂(𝔽₇)=336: no; 60∣#PGL₂(𝔽₁₁)=1320: yes; the unipotent group {(1 a;0 1)} has 7∣#H and lies in a Borel | Sound |
| Residual-newform contract (line 126, changed) | 11a1, λ=5, q=2 | X²−T₂X+2 = X²+2X+2 in 𝔽₅[X] = (X−1)(X−2): the ρ̄=1⊕χ̄₅ polynomial | Sound |
| Cotangent contract (line 160, changed) | K=ℚ₂, e=1 | e<p−1 is 1<1: false, so excluded, as Mazur's p. 138 example requires | Sound |
| Downstream (line 1061, changed) | EC.0–EC.6 | Seven rows of ErdosProgressionPowers lines 657–663 match section by section | Sound |
| Conventions: Frobenius | y²=x³−x over 𝔽₅ | a₅=−2, 1+2T+5T² | Sound (review 10) |
| 1.1–1.2 `localTerms`, `martinValue` | N=1, 11, 30, 35, 121 | 0, 1, 1, 3, 4 = g⁺ | Sound (review 10) |
| 1.3 `dimension_comparison` | N=13; N=1 | 0 vs 2; 1/12−1/2−1/4−1/3+1=0 | Sound (review 10) |
| 1.4 `martin_bound` | N=11, 23, 35; 30, 121 | 12=12, 24=24, 36=36; 12<31, 48<122 | Sound (review 10) |
| 1.5–1.7 F♯, G♯, H♯ | N=1, 4, 11, 35 | F♯(11)=5.828; G♯(11)=13+4√3; H♯(1)=4 | Sound (review 10) |
| 1.8 majorants | N=1, 2, 3, 4, 11 | 5.83≤9 and 19.93≤169 | Sound (review 10; locator now exact) |
| 2.1 `norm_bound` | K=ℚ, I=(5), x=5 | 5≤5≤5 | Sound (review 10) |
| 2.2 removed prime | M₀=11, p=2 | (√2+1)²=5.828 | Sound (review 10) |
| 3.1 `rationality_of_small_prime_coefficients` | N=11 | a₂=−2, a₄=2 | Sound (review 10) |
| 3.2 above F♯ | N=11 | q≤2, q∤11 | Sound (review 10; citation R01) |
| 4.1–4.5 | as review 10 | filters, Sturm bound 1 for Δ, (q+1)(−2)≡0 mod 4, 68 subgroups of GL₂(ℤ/4) | Sound (review 10) |
| 5.0a–5.0b, 5.1–5.5 | as review 10 | j=1728 non-scalar automorphism; 20, 22∉ list; 14∈ list | Sound (review 10; §5.2/§5.4 locators now exact) |
| 6.0a, 6.0c–6.0h, 6.1–6.18 | as review 10 | 2101248=4096·27·19; cusp order 5 on X₀(11); 68880·40=\|GL₂(𝔽₄₁)\|; j=576 traces −2,−4,−3,−2,5,−1 | Sound (review 10; citation R02 at 6.0f) |

### Ownership and overlaps

- `roadmaps resolve` reports no missing citation or Lean name; `scratch/overlaps.md` lists no open pull request changing this roadmap and no dropped id; its three “only an open revision defines” items (ModularForms §§0.2, 3.1, 8.2 at #1706) are R06.
- EllipticModularityEffectiveComparisons (#1810) remains the one second owner (R05); its own review rejected it as a re-plan of this roadmap.
- The new theorem `rational_isogeny_j_tables` names no declaration of another roadmap; its carriers `HasCyclicIsogeny` (this file, line 152) and `WeierstrassCurve.j` (Mathlib `Weierstrass.lean:388`) are at the pins.

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §5.2: uncertified; the composite-degree list used is the standard one.
- **Sources not reopened for this incremental review:** Kraus1997 (7)–(9), Mazur1978, DarmonMerel2001, BPR2013, GaudronRemond2011, Chen1998, DeSmitEdixhoven2000, Elkik1990, Kato2004 and Martin2003 were verified in review 10 at unchanged text.
- **Five remaining declared gaps.** I did not decide whether their suppliers now state them; their text is unchanged.

## Source issues

- none new. Review 10's seven items (Kraus1997 p. 1158; DarmonMerel2001 pp. 20, 21, 22; Lemos2017 p. 5, where J₀(37) has positive rank, Lemos2017 lines 193–194; BPR2013 p. 9; Chen1998 p. 2) stand; the roadmap's §6.0b correctly does not assume rank zero of J₀(37).
