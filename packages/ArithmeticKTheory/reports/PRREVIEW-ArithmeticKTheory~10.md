# Review of ArithmeticKTheory (pull request #1418 at 1f52567)

**Verdict:** needs changes

This is a full review: 154 lines of the folder changed since 56413ae. All nine findings of the previous review are repaired (table under Verified sound). There are five new findings: one P2 and four P3. The P2 is that `Suggested.lean` calls Solomon–Tits unstatable when the pinned Mathlib already has the nerve of a poset and simplicial homology. The gate passes, the dependency check is clean, both declared gaps are genuine, and the fifteen seeded targets and the new Thomason locators were checked against their sources.

## R01 (P2) — Solomon–Tits is statable at the pins, but the module docstring says it is not

**Location.** `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` lines 27–31: “The Solomon–Tits theorem solomonTits … lack the Tits building of a vector space and its Steinberg module: Mathlib has group homology but no building.” README §3.2, lines 1039–1048, defines titsBuilding as the flag complex of nonzero proper subspaces and states solomonTits.

**Claim.** The pins cannot express the Tits building, so solomonTits cannot be stated.

**Witness.**
- The pinned Mathlib has `CategoryTheory.nerve` (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean:37`).
- It also has `SSet.homology` (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean`, `chainComplexFunctor` at :44, `homologyFunctor` at :144).
- The building is the nerve of the native poset `{W : Submodule K V // W ≠ ⊥ ∧ W ≠ ⊤}`.

**Repair.**
- Add the block below to `Suggested.lean`, before the Layer 7 section comment.
- In the docstring, delete “The Solomon–Tits theorem solomonTits,”. For the three theorems that remain unstated, replace the reason with: “projectiveArithmeticDuality, projectiveSteinbergHomology_fg and curveSteinbergHomology_fg of README §3.2 need the Steinberg module as a representation of Aut(P): the pins have no group action on the homology of `titsBuilding`.”
- In README §3.2, after “construct titsBuilding V as the flag complex of nonzero proper subspaces”, add “(the nerve of their poset)”. After the solomonTits sentence, add: “Suggested.lean states its homological form: for every m, the homology vanishes in positive degrees other than m−2 and is free in degree m−2.”

```lean
/-! ## Layer 3: finite generation, ranks and hermitian consequences -/

section TitsBuilding

universe u v

/-- The Tits building of `V`: the nerve of the poset of nonzero proper subspaces; README §3.2. -/
noncomputable def titsBuilding (K : Type u) (V : Type v) [Field K] [AddCommGroup V]
    [Module K V] : SSet.{v} :=
  CategoryTheory.nerve {W : Submodule K V // W ≠ ⊥ ∧ W ≠ ⊤}

/-- Solomon–Tits (README §3.2): the integral homology of the Tits building of an
`m`-dimensional space vanishes in every positive degree other than `m − 2`, and its
homology in degree `m − 2` is a free abelian group. -/
theorem solomonTits (K : Type u) (V : Type v) [Field K] [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] :
    (∀ k : ℕ, 0 < k → k + 2 ≠ Module.finrank K V →
      CategoryTheory.Limits.IsZero
        ((titsBuilding K V).homology (AddCommGrpCat.of (ULift.{v} ℤ)) k)) ∧
    Module.Free ℤ ((titsBuilding K V).homology (AddCommGrpCat.of (ULift.{v} ℤ))
      (Module.finrank K V - 2) : AddCommGrpCat.{v}) := by
  sorry

end TitsBuilding
```

**Tested.**
- Inserted into a scratch copy of `Suggested.lean`, `lake env lean` gives only `declaration uses 'sorry'` warnings. `#check @titsBuilding` keeps all five binders. A `Type*` variant times out on `HasCoproducts`, hence the explicit universes.
- The statement holds in every case:
  - m=0 and m=1: the poset is empty, so all homology is zero and degree `m−2=0` is free.
  - m=2 over 𝔽₂: three isolated vertices, so H₀=ℤ³ and positive degrees vanish.
  - m=3 over 𝔽₂: the Fano incidence graph has 14 vertices and 21 edges and is connected. So H₁ has rank 21−14+1=8=2³, and H₂=0.

## R02 (P3) — §6.15 re-plans the hypercohomology descent spectral sequence that SchemeKTheoryOperations §4.3 owns

**Location.** `README.md` line 3437: “Prove strong convergence, pullback and coefficient compatibility.” *Needs:* at lines 3469–3472: “the general coefficient and localization spectra, §4.1’s twists, and the étale site supplied by EtaleCohomologyFoundations. The Bott hyperdescent proof and spectrum involution are targets here.” The contract at lines 343–350 names only §§3.6–3.7.

**Claim.** The descent spectral sequence and its strong convergence are planned here, with no supplier.

**Witness.** SchemeKTheoryOperations at #1229, §4.3 “Hypercohomology and K-sheaves”, defines spectral hypercohomology on any site with enough points. It also states the Godement spectral sequence `E₂^{p,q}=H^p(C,π̃_qF)⇒π_{q−p}H(C,F)`, strongly convergent under bounded cohomological dimension (Thomason, Proposition 1.36).

**Repair.**
- Replace line 3437 with: “Its strong convergence is SchemeKTheoryOperations §4.3's convergence of the Godement descent spectral sequence under bounded cohomological dimension, applied to the Bott-localized K-sheaf; prove pullback and coefficient compatibility.”
- Add to the *Needs:* line: “SchemeKTheoryOperations §4.3 for spectral hypercohomology on a site with enough points and its strongly convergent descent spectral sequence.”
- In “From TauCetiRoadmap.SchemeKTheoryOperations” add: “Section 4.3 supplies spectral hypercohomology and the Godement descent spectral sequence with its convergence; §6.15 applies it to the Bott-localized K-sheaf.”

**Tested.** §6.15 bounds the étale p-cohomological dimension of every residue field and requires finite Krull dimension, which is the bounded-dimension hypothesis of §4.3's convergence theorem. For Spec ℤ[1/p], the residue fields are ℚ (cd_p=2) and 𝔽_ℓ (cd_p=1). So only rows 0, 1 and 2 survive, as §6.15's first Check states. The Bott hyperdescent equivalence itself (Thomason 2.45 with 3.1) remains a target here.

## R03 (P3) — Two Layer 1 locators do not state what they are cited for

**Location.**
- `README.md` line 616, after the torsion-class-group localization theorem: “(K-book, I.3, p. 22; VI.8.2, proof, p. 513.)”
- Line 690, after “K₁(O) is finitely generated of rank r₁+r₂+|S|−1”: “(K-book, VI.8.1, p. 513.)”

**Claim.** The cited passages support these statements.

**Witness.**
- kbook lines 1372–1373 (p. 22) say only that Pic(O_F) is finite.
- The proof of VI.8.2 (kbook lines 31305–31313, p. 513) only replaces O_S by O_S[1/ℓ].
- VI.8.1 (kbook line 31281, p. 513) prints K₁(O_S)≅ℤ^(r₂+|S|−1)⊕μ(F), without r₁.

**Repair.**
- At line 616, replace the parenthesis with “(K-book, I.3, p. 22, for the finiteness of Pic(O_F); the localization statement is the argument just given.)”
- At line 690, replace it with “(K-book, VI.8.1, p. 513, which prints the rank as r₂+|S|−1; ℤ[1/p], of rank one, shows that r₁ is missing there.)”

**Tested.** For ℤ[1/p], r₁+r₂+|S|−1=1+0+1−1=1, matching the units ±pⁿ in the README's own Check at line 717. The printed formula gives 0+1−1=0. Tau Ceti's `TauCeti.finrank_sUnits_numberField` gives `NumberField.Units.rank ℚ + 1 = 0+1 = 1`.

## R04 (P3) — `regularPrime_dividedBernoulli_num` assumes `Odd p`, which the statement does not need

**Location.** `Suggested.lean` line 83, `(hodd : Odd p)`; its docstring says “If an odd prime”. README line 3696: “for every odd prime p satisfying the supplied regularity predicate and every k≥1”.

**Claim.** The headline needs p odd.

**Witness.** At p=2 the hypothesis holds, since `CyclotomicField 2 ℚ` is ℚ, with class number 1. By von Staudt–Clausen, v₂(B_(2k))=−1, so v₂(B_(2k)/k)=−1−v₂(k)<0 and the reduced numerator is odd for every k≥1.

**Repair.**
- Delete `(hodd : Odd p)`, and change “If an odd prime” to “If a prime” in the docstring.
- At README line 3696, write “for every prime p”.
- At lines 3717–3718, replace “Multiplication by 2 preserves this valuation for odd p, so this branch also has numerator prime to p.” with “Multiplication by 2 preserves this valuation for odd p and gives v₂(B_(2k)/k)=−1−v₂(k)<0 at p=2, where p−1 divides every m; so this branch also has numerator prime to p.”

**Tested.** At k=1, 2 and 4 the values B₂/1=1/6, B₄/2=−1/60 and B₈/4=−1/120 have numerators ±1. At odd p nothing changes: the rows (5,1), (5,5), (5,7), (5,63) and (3,1) of the table below still hold.

## R05 (P3) — §6.4's two-rank function uses a parameter r that is never defined

**Location.** `README.md` line 2482: “Define the numerical even two-rank function to be r+s+t−1 at n≡2 mod 8”. The Checks at lines 2503–2506 use “(r,s,t,j)”.

**Claim.** The function is defined in terms of the section's data.

**Witness.** §6.4 introduces s, t, j, a, b, c and d, but no r. K-book Corollary VI.9.9 (kbook line 31899, p. 522) has r₁+s+t−1 in this branch. Reading r as r₂ gives 0 for ℤ[1/2], although K₂(ℤ[1/2])=ℤ/2.

**Repair.** At line 2482 write “r₁+s+t−1”. In the Checks write “(r₁,s,t,j)” and “Holding r₁,t,j fixed”.

**Tested.** For ℤ[1/2] (r₁=1, s=1, t=0, j=0), the value at n=2 is 1, the 2-rank of K₂(ℤ[1/2])=ℤ/2. With r=r₂=0 it would be 0.

## Verified sound

### The previous review's findings

| Finding | Status at 1f52567 | Evidence |
| --- | --- | --- |
| R01, stable stems attributed to GeometryOfNumbersAndQuadraticArithmetic §6.1a | Repaired | Lines 75–79 now say that no target uses the stable stems as a colimit, and claim no ownership elsewhere. |
| R02, K3BlochGroups reads π₄S=0 and d₃ from §7.5 | Repaired | Lines 4934–4937 state that neither is supplied. |
| R03, contract broader than the declared gap | Repaired | Lines 282–291 state the C₂ contract word for word as `plan.json`. §3.5 (lines 1545–1553) is now for C₂. The S₃ Check is replaced by the Hℤ∧C₂₊ Check (lines 1609–1612). |
| R04, bottEtaleDescent hypotheses unsourced | Repaired | Lines 3421–3446 state Thomason's hypotheses, with locators verified below. |
| R05, pinned S-unit rank not cited | Repaired | Lines 233–241 and 688–690 cite `TauCeti.finrank_sUnits`, `TauCeti.finrank_sUnits_numberField`, `NumberField.Units.finrank_eq` and `card_eq_nrRealPlaces_add_nrComplexPlaces`; all exist at the pins. |
| R06, restriction attributed to a transfer diagram | Repaired | Lines 891–892 and 905 cite Remark III.6.3.1 and SchemeKTheoryOperations §§3.6–3.7. Line 883 keeps V.6.6.3–6.6.4 for transfer, which kbook lines 24596–24624 (p. 410) support. |
| R07, w₁₀ misprint | Repaired | Lines 1814–1817 record it; kbook line 28420 still prints 1320. |
| R08, invented declaration name | Repaired | Lines 4219–4222 and 4237–4238 cite CyclotomicClassGroupsAndStickelberger §3.3 (heading “Kummer reflection with the correct dual action” at #1260). |
| R09, “lacks spectra” | Repaired | The docstring names `TauCeti.SymmetricSpectrum` (`TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92`) and `TauCeti.SymmetricSequence.sphere` (:82). No module in `Spectra/` defines homotopy groups. |

### Gate, dependency check, Lean

- **Worker's gate** (`gate.md`): every check passes. A rerun on this head prints `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- **Dependency check prescribed by the brief:** `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`.
- **Suppliers:**
  - On main: EtaleCohomologyFoundations, ClassFieldTheory, ClassicalArithmeticCompletion, ReductiveGroupsPartII, GeneralizedCohomology, BordismFormalGroups, MorseTheory, GeometricTopology, ClassifyingSpaces, AlgebraicTopology, AlgebraicCurves, JacobianChallenge and SchemeAndStackFoundations.
  - Completed on main: NumberFieldArithmetic, Chebotarev, LocalGaloisGroups and ProfiniteArithmetic.
  - Earlier in the merge order than ArithmeticKTheory (135): StableHomotopyKTheory 16, GeneralAlgebraicKTheory 17, IntegralIwasawaTheory 28, CyclotomicClassGroupsAndStickelberger 33, SchemeKTheoryOperations 36, AdelicAlgebraicGroups 51, GeometryOfNumbersAndQuadraticArithmetic 54, ArithmeticLocallySymmetricSpaces 57, ArithmeticGaloisDuality 59, HermitianKTheoryOfPoincareCategories 61, SelmerIwasawaCohomology 83, KTheoryLowDegrees 86, K2SymbolsBrauer 87, KTheoryFiniteLocalFields 88 and AutomorphicLFunctionsAndLocalFactors 92.
- **Never-cite list and outside-folder diff:** no never-cite roadmap appears in the folder, and the outside-folder diff is empty.
- **Elaboration:** `lake env lean Suggested.lean` gives exactly three `declaration uses 'sorry'` warnings, at lines 64, 70 and 83.
- **`#check @name`** on a scratch copy matches `signatures.md`; no binder is lost. `NumberField (CyclotomicField p ℚ)` resolves for a variable `p`, with no `NeZero` needed.
- **One-tactic probes:** `first | (rfl; done) | (infer_instance; done) | (decide; done) | (norm_num; done) | (simp; done) | (aesop; done) | (simp_all; done) | (exact?; done)` closes none of the three theorems. There is no padding.

### Headline theorems

- **Stated:** `integer_isLocalization_iff`, `integer_isLocalization_of_torsion_classGroup` (§1.1) and `regularPrime_dividedBernoulli_num` (§7.2).
- **Statable but unstated:** solomonTits (R01).
- **Correctly named as not statable:**
  - finite generation, ranks, Soulé and the Harris–Segal summand;
  - the odd and even tables, wild kernels, Bott descent, K₄(ℤ)=0 and H₃(K(ℤ));
  - the order ratio, the even orders and the Vandiver table;
  - the Gaussian and golden tame kernels (no K₂ carrier: Tau Ceti's `ClassFieldTheory/Local/TameSymbol.lean` is the local Kummer-cup symbol, not a K₂ map);
  - hermitian finiteness, the arithmetic CW model and Borel's comparison;
  - π₄(S)⊗ℤ[1/2] and the Adams–Novikov E₂-term.
- No S-integer localization criterion and no all-k regular-prime Bernoulli statement exist at either pin. CyclotomicClassGroupsAndStickelberger's `kummer_criterion` covers only 2≤k≤p−3, so the §7.2 headline duplicates nothing.

### Adversarial pass

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| `integer_isLocalization_iff` | R a field; ℤ with S={(2)} and M=⟨2⟩, {1}, ⟨6⟩; 0∈M | Field: Spec¹=∅, S.integer=F, and every M of nonzero elements works: true=true. ⟨2⟩: ℤ[1/2] and 2∈(2): true=true. {1}: ℤ≠ℤ[1/2] and no m∈(2): false=false. ⟨6⟩: 1/6∉ℤ[1/2]: false=false. 0∈M: 0 is not a unit: false=false. | Pass |
| `…of_torsion_classGroup` | ℤ[√−5], S={𝔭}, 𝔭=(2,1+√−5); infinite S | 𝔭²=(2); 2∈𝔭 is an S-unit, so the right-hand side of the iff holds. For each v∈S, v^h=(a_v) gives a_v∈v with valuation 0 elsewhere. | Pass |
| `regularPrime_dividedBernoulli_num` | (p,k)=(5,1), (5,5), (5,7), (5,63), (3,1); p=2; p=37 | 1/6; B₁₀/5=1/66; B₁₄/7=1/6 (5∣15); B₁₂₆/63≡1 mod 5; B₂/1=1/6 with v₃=−1. p=2: 1/6, −1/60, −1/120 (R04). p=37: 37 divides the numerator of B₃₂ and the hypothesis fails. | Pass; R04 |
| solomonTits (R01) | m=0, 1, 2, 3 over 𝔽₂ | Empty poset gives 0; three points give H₀=ℤ³; Fano incidence graph: 14 vertices, 21 edges, H₁=ℤ⁸=St₃. | Statable; R01 |
| §1.3 rank and transfer | ℤ[1/p]; free quadratic B; virtual (−1,1) | Rank 1 against printed 0 (R03). tr₀(1,1)=(2,1); tr₀(−1,1)=(−d,c_B⁻¹); tr₁res₁(−1)=(−1)²=1. tr₀res₀(n,c)=(dn,c^d c_B^n)=(n,c)·(d,c_B). | Pass; R03 |
| §2.1 signed square | ℤ[ζ₅] at (11,ζ₅−3), m=5 | 3⁵=243≡1 mod 11; B₅x=b̄ and δ gives 3; δx=−[π]·ζ₅ and B gives 3⁻¹=4; ∂₂δx=4⁻¹=3=δ∂₃x. | Pass |
| §3.2 duality | GL₁(O_F), GL₂(ℤ), GL₂(ℤ[i]); χ on diag(−1,1) | vcd r₁+r₂−1; 3−2=1; 4−2=2 (Putman–Studenmund: r·n(n+1)/2+s·n²−n). χ=−1 at m=2 and χ²=1 at m=3. | Pass |
| §3.2 curve case | 𝔽_q[t], P=R², vertex k | Aut(O(k)⊕O) has order (q−1)²q^(k+1) and gap k/2. At q=2, k=1 the order is 4. | Pass |
| §3.3 | ℤ→ℤ[1/3] at n=2; ℤ→ℤ[1/2] at n=3 | ℤ/2↪ℤ/2⊕ℤ/2 with cokernel 𝔽₃^×=ℤ/2. K₂(𝔽₂)=0, so ℤ/48≅ℤ/48. | Pass |
| §3.5 | ℤ; genuine ranges m=0, 1; C₂ orbit Checks | Symmetric ℤ,ℤ/2,0,0 = Prop. 2.3.1 with I={2} and Pic(ℤ)/2=0. Quadratic ℤ,0,ℤ/2,0 = Cor. 2.3.10 with d=1. Ranges n≤−2 / n≥−1 and n≤0 / n≥1. Trivial action ℤ,ℤ/2,0; sign action ℤ/2,0,ℤ/2; Hℤ∧C₂₊ gives ℤ,0,0 against ℤ²,(ℤ/2)²,0. | Pass |
| §5.3, §8.10 | ℚ(i) at i=2; ℚ at ℓ=3 | w₂(ℚ(i))=8·3=24, so K₃=ℤ⊕ℤ/24 = Ex. VI.8.5. K₃(ℤ)_(3)=ℤ/3, the 3-part of 48. K₅(ℤ)_(3)=ℤ_(3) since w₃=2. | Pass |
| §5.4 table | ℚ at n=3, 5, 7, 9, 11 | ℤ/48; ℤ⊕ℤ/1; ℤ/240; ℤ⊕ℤ/2; ℤ/1008. | Pass |
| §6.1 | ℚ(ζ₃) at ℓ=3; ℚ(i) at ℓ=2 | t+s−1=0+1−1=0 in both cases, matching K-book Ex. VI.8.3.1–8.3.2. | Pass |
| §6.2 | ℤ; ℚ(√7)[1/2]; S=∅; ℚ(√34)[1/2] | ℤ: j=0=u−t. ℚ(√7): signs of −1 (−,−), 8+3√7 (+,+) (8−3√7≈0.063) and 3+√7 (+,+) (≈0.354) give j=1. At S=∅, h=1 and h⁺=2 give u−t=1. ℚ(√34): 5+√34 has norm −9 and signs (+,−), so j=0. | Pass |
| §6.4 | ℤ[1/2]; ℚ(√7) at n=4 | Mod-2 log orders for n=1,…,8: 2,2,2,1,1,0,1,1 = table with a=2, b=1, c=1, d=0. Two-rank at n=2: 1 with r₁, 0 with r₂ (R05). ℚ(√7): j+s+t−1=1 = Ex. VI.9.10.1. | Pass; R05 |
| §6.10 | d=−17, −14, 7, 2, 3; norm test m=4, 8 | −17: F_v=ℚ₂(i), special and very special. −14: F_v=ℚ₂(√2) and √2∉F, special but not very special. 7: F_v=ℚ₂(i), special. 2: decomposition group is all of Γ_∞, not special. 3: ℚ₂(√3)∩ℚ₂(μ_2^∞)=ℚ₂, not special. m=4, q^i=3: 1+3≡0 and invariants {0,2}. m=8: norm 4, an isomorphism. | Pass |
| §6.12 | ℚ; ℚ(√−14) at i=1 | Wild-kernel Theorem A (p. 1): index 2 exactly for i odd and F special. ℚ is not special, so 0. ℚ(√−14): {−1,−1}∈WK∖div (Ex. 5.6). Hutchinson Cor. 5.7 (p. 19) has the same dichotomy. | Pass |
| §6.15 slots and table | j=0, −1, 1; FGV Lemma 2.11 | (0,0)/(2,1); (2,0)/(0,−1) with total −2; (2,2). 4k−2 positive is H²(2k), 4k−2 negative H⁰(2k−1), 4k positive H⁰(2k), 4k negative H²(2k+1), all matching FGV p. 13. | Pass; R02 |
| §6.16 | ℤ and ℤ[1/p] at q=p^r | K₁(ℤ;ℤ/q)=0 and K₁(ℤ[1/p];ℤ/q)=ℤ/q; K₀ is ℤ/q on both sides (H²(ℤ[1/p],μ_q)=0). | Pass |
| §7.4 | ℓ=3, 5; H¹ invariants | Degrees 0,3,1 give 1,1,0,1, and degrees 0,1,5,7 give 1,1,0,0,0,1,0,1, matching K-book Ex. VI.10.6.1. Odd weight has one invariant; even weight has one iff (ℓ−1)∣i (Ex. VI.10.4.2). | Pass |
| §7.5 K₄(ℤ) and orders | stem 4 at p=3; ℤ[1/2]; a=0, 2 | Only (1,5) is in range, and 4∤5. s+u−1=1+0−1=0. 2c₁=2, c₂=1, c₆=num(B₁₂/24)=691. | Pass |
| §8.5 | q=5; {i,i} | C={±1,±i,±1±i} has 8 elements; 1+1/√2≈1.707<√5≈2.236. 3{i,i}=0 from {−i,1+i}=0 and 1+i=i(1−i); 4{i,i}=0; so {i,i}=0. | Pass |
| §8.6 | n=2, Δ=5; v=(5), a=2; v=(2) | d=2√5/π≈1.4235 equals Groenewegen's d. vol(B_t)=4√5·t/d equals Lemma 6. (2,1)∈L and (1,1)∉L. (2,2) has zero residue at t=q=4. | Pass |
| §8.7 cutoff | d≈1.4235 | 16d²=320/π²≈32.42<33; (20d)^(2/3)≈9.33; d³≈2.885; (2d)^(12/5)≈12.3. | Pass |
| §8.8–8.9 | the eleven primes; v=(2); real signs | Norms 4,5,9,11,11,19,19,29,29,31,31. Minors 6 and −3 have gcd 3. g↦(−1,−1), h↦(1,−1). w₂(ℚ(√5))=8·3·5=120, and 4/120=1/30=ζ_F(−1). | Pass |

### Sources opened (seeded sample and new locators)

| Target | Locator, cache line | Result |
| --- | --- | --- |
| 1.1 | kbook I.3 lines 1322–1437, pp. 21–22; Ex. I.3.8 line 1742, p. 29 | ✓ for the iff; R03 for the torsion theorem |
| 1.3 | kbook Ex. II.2.2(b) line 4399, p. 78; V.6.6.3–6.6.4 lines 24596–24624, p. 410; VI.8.1 line 31281, p. 513 | ✓; R03 for the VI.8.1 rank |
| 3.2 | kahn Cor. 2.3.7 line 508 and Thm 2.4.1 line 518, p. 12; 4.3.1–4.3.3 lines 713–730, p. 17; putman-studenmund §1 lines 91–118, pp. 3–4, Thm C line 165, p. 4, Prop. 2.1 line 301, p. 8, proof of Thm C line 362; sun pp. 5–6 lines 155–208; quillen-oberwolfach p. 7 lines 219–233 | ✓ |
| 3.3 | kbook V.6.1 line 24317, p. 406; IV.1.13 line 15636, p. 269; IV.6.3–6.3.2 lines 18731–18763, p. 320 | ✓ |
| 3.5 | hermitian Cor. 1.2.12 line 811, p. 18; Cor. 1.3.9 line 1380, p. 30; Prop. 2.3.1 line 1881, Cor. 2.3.2, pp. 41–42; Prop. 2.3.9 line 2031; Cor. 2.3.10 line 2072, p. 45; Cor. 2.3.16 line 2217 and proof, pp. 47–48; Cor. 2.3.18 line 2250, p. 48; Cor. 8 line 214, p. 5 | ✓ |
| 5.3 | kbook Thm VI.8.2 line 31296, p. 513; Thm VI.8.4 line 31382, p. 514; Thm VI.9.5(a) line 31708, p. 519 | ✓ |
| 6.1 | kbook VI.8.2–8.3 lines 31296–31352; Ex. VI.8.3.1 line 31353, p. 514 | ✓ |
| 6.2 | kbook (9.6) line 31761 and Def. VI.9.6.1 line 31768, p. 520; (9.6.2) line 31786, p. 521 | ✓ |
| 6.10 | hutchinson Def. 2.3 line 139, Rem. 2.4 and Ex. 2.5 lines 143–156, p. 4; Lemma 2.7 line 201, p. 5 | ✓ |
| 6.12 | wildkernel Thm A line 26, p. 1; Thm 5.5 line 449, p. 14; Lemma 7.2 line 556, p. 18; Props 7.6 and 7.8 lines 584–592, p. 19; Prop. 8.4 to Thm 8.7 lines 624–655, pp. 20–21; hutchinson Cor. 5.7 line 858, p. 19, Thm 5.6 line 829, p. 18 | ✓ |
| 6.15 | fgv (2.6) line 517, p. 12; Lemma 2.11 lines 586–595, p. 13; thomason Thm 2.43 and (2.112) lines 2445–2450, p. 498; Cor. 2.44 lines 2521–2529, pp. 499–500; Thm 4.1 lines 3174–3183, p. 516; Rem. 4.2 lines 3184–3190, pp. 516–517 | ✓ |
| 7.4 | kbook Ex. VI.8.3.2 line 31359, p. 514; VI.10.4.1–10.4.2 lines 32395–32410, p. 530; Prop. VI.10.5 line 32420, p. 530; Thm VI.10.6 line 32459 and Ex. VI.10.6.1 line 32483, pp. 531–532 | ✓ |
| 8.5 | kbook III.5.2.2 lines 12497–12520, p. 218 (K₂(ℤ[i])=1) | ✓; Bass–Tate not verifiable |
| 8.6 | groenewegen Lemma 4 line 167, p. 1446; Lemma 6 line 226, p. 1447; Lemma 9 line 333, p. 1450; Lemma 12 line 470, p. 1453 | ✓ |
| 8.10 | kbook VI.2.4 line 28557, p. 472; Ex. VI.8.5 line 31530, p. 516; VI.9.5 line 31706, p. 519 | ✓ |

### Library declarations opened at the pins

- **Mathlib:**
  - `NumberField.Units.finrank_eq` and `rank` (`NumberTheory/NumberField/Units/DirichletTheorem.lean:462`, `:359`);
  - `NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces` (`NumberTheory/NumberField/InfinitePlace/Basic.lean:447`);
  - `CategoryTheory.nerve` (`AlgebraicTopology/SimplicialSet/Nerve.lean:37`) and `SSet.chainComplexFunctor`/`homologyFunctor` (`AlgebraicTopology/SimplicialSet/Homology/Basic.lean:44`, `:144`);
  - by `#check`: `IsDedekindDomain.selmerGroup`, `Set.unitEquivUnitsInteger`, `IsLocalization.isLocalization_of_submonoid_le`, `riemannZeta_neg_nat_eq_bernoulli`, `AddSubgroup.index_eq_natAbs_det`, `ZLattice.covolume_div_covolume_eq_relIndex'`, `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`, both `Module.Relations.Solution` surjectivity lemmas, `Bernoulli.vonStaudt_clausen`, `bernoulli_eq_bernoulli'_of_ne_one`, `AddCommGroup.equiv_free_prod_directSum_zmod`, `ClassGroup.equivPic`, `IsCyclotomicExtension.autEquivPow`, `HeightOneSpectrum.intValuation_eq_exp_neg_multiplicity` and `SmoothPartitionOfUnity.exists_isSubordinate`.
- **Tau Ceti:**
  - `finrank_sUnits` (`RingTheory/DedekindDomain/SInteger/Rank.lean:122`);
  - `finrank_sUnits_numberField` (`NumberTheory/NumberField/Units/SUnit/Basic.lean:38`);
  - `ExactStructure` (`CategoryTheory/Exact/ExactStructure.lean:241`), `ExactK0` (`CategoryTheory/GrothendieckGroup/Exact.lean:179`) and `ExactK0.liftEquiv` (:354);
  - `finite_integer_classGroup` (`SInteger/ClassGroup.lean:103`) and `integer_extendedHom_surjective` (:95);
  - the integer-spectrum, unit-valuation and `relNorm` names of lines 218–231, all present.

### Cross-roadmap citations resolved

- `roadmaps resolve` reports no unresolved citation and no unresolved Lean name. The earlier lead `VanishingCycles.etaleTateTwists` is EtaleCohomologyFoundations F.0.3 on main, line 233.
- **On main, checked by heading:**
  - GeneralizedCohomology G2.4, G2.5, G2.7, G3 item 9 (`spectrumPrimeLocalization`, line 885) and G5 item 4 (ko/ku/KO/KU);
  - ReductiveGroupsPartII RG2.2.1, RG2.2.2 and RG2.2.4 (*gl-building-lattice-chains*);
  - ClassFieldTheory Layer 13 (`hilbertClassField`, line 1827) and Chebotarev Layer 10;
  - ClassicalArithmeticCompletion §§1.14, 1.15 and 1.35; MorseTheory M1–M3;
  - GeometricTopology “The smoothing-and-triangulation comparison”; ClassifyingSpaces Stages 3–4;
  - BordismFormalGroups F3–F4; EllipticCohomology E4.S; AlgebraicTopology Stage 8;
  - JacobianChallenge Layer B; SchemeAndStackFoundations §3.3; AlgebraicCurves Layers 0 and 12.
- **At open heads, every cited section heading exists:**
  - IntegralIwasawaTheory (#1306) §§6.0, 7.4, 7.7–7.8, 10.4–10.5 and 12.3;
  - KTheoryFiniteLocalFields (#1281) §§0.5, 1.1–1.6, 2.2, 3.0a, 3.1–3.5, 6.2–6.9, 6.5a and 7.3;
  - GeneralAlgebraicKTheory (#1212) §§2.1–2.6, 4.3, 4.8, 4.14, 5.11–5.12, 7.4–7.8 and 8.12–8.13;
  - K2SymbolsBrauer (#1302) §§7.1–7.2, 9.2–9.6, 11.2, 12.1–12.3, 12.5 and 12.10–12.11;
  - KTheoryLowDegrees (#1248) §§5.1–5.5, 8.1 and 11.1–11.3; CyclotomicClassGroupsAndStickelberger (#1260) §§0.1–0.4, 2.1, 3.1–3.3, 4.5, 5.1 and 5.4;
  - ArithmeticGaloisDuality (#858) R02.1, R02.3 and R02.4.4, whose text holds the invariant-sum Brauer sequence;
  - SelmerIwasawaCohomology (#869) §§2.1–2.4 and 2.21–2.23; HermitianKTheoryOfPoincareCategories (#1266) §§0.1–0.3, 1.2–1.4, 4.4, 7.1–7.5 and 8.1–8.2;
  - ArithmeticLocallySymmetricSpaces (#871) ALS.0.4, 0.5, 0.8, 2.2–2.4, 5a.1, 5b.1 and F.5; AdelicAlgebraicGroups (#792) §3.6; AutomorphicLFunctionsAndLocalFactors (#924) AL.3.10.5 and AL.3.10.7;
  - StableHomotopyKTheory (#1227) §§1.24–1.28, 3.36, 7.1–7.13 and 7.21–7.28; GeometryOfNumbersAndQuadraticArithmetic (#851) §§6.1a, 6.4.2 (`ExactW0`), 6.8a, 6.9, 6.10a and 6.11.
- **Named declarations found at their owners:** `IsRegularPrime`, `kummer_criterion`, `regular_prime_power_class_number`, `herbrand_ribet`, `VandiverCondition`, `oddPrime_specialValueEuler`, `dyadic_specialValueEuler`, `totallyRealHeckeValue_rational`, `motivicCycles`, `motivicToK`, `periodicEtaleK`, `etaleKComparison`, `etaleDescentFiltration`, `quillenLichtenbaumField` and `ExactW0`.

### Declared gaps

- Both slugs and their `needs` sentences in `design/plan.json` match the README contracts (lines 282–291 and 421–428). Each is a single precise statement.
- `gap:connective-c2-homotopy-orbit-spectral-sequence` is genuine:
  - StableHomotopyKTheory Layer 7 at #1227 has no homotopy-orbit spectral sequence;
  - BordismFormalGroups F6.5 on main supplies orbits, fixed points and the norm, but no spectral sequence;
  - `roadmaps grep` finds no other owner. GoNQA §6.1a mentions only “orbit/fixed/Tate spectral-sequence comparisons” and states no E²-term, so it does not provide the contract.
- `gap:number-ring-witt-signature` is genuine: GoNQA §6.11 at #851 treats ℤ only (6.11.1–6.11.12).

### Ownership and overlap

- `overlaps.md` reports no open pull request changing this roadmap and no dropped ids.
- No second owner, by object, of:
  - Solomon–Tits (only Bruhat–Tits buildings in ReductiveGroupsPartII);
  - the S-integer localization criterion, the signature defect and wild kernels;
  - the Harris–Segal summand, Tate's filtration and the golden congruence lattices.
- MotivicEtaleKTheory (#1470) owns cycle and regulator comparisons, not étale descent for S-integers. KTheoryFiniteLocalFields §6.5a owns field-level periodic étale K only.
- K2SymbolsBrauerPartII, K3BlochGroups, BorelRegulators and EllipticKTheory cite this roadmap's §§1.1, 2.1, 2.4, 3.2–3.4, 5.1–5.4, 6.1, 6.3, 6.13, 7.5 and 8.10, all of which exist. There is no cycle: this README cites none of them.
- **Notes for the worker:**
  - The pull-request description still lists “HomotopySpheres Stage 9, item 2” as a direct prerequisite. HomotopySpheres is on the never-cite list and the README no longer cites it.
  - K3BlochGroups at #1430 line 1368 still says §7.5 “shows that d₃ maps onto E₃^(4,8)”, which this README (lines 4934–4937) says it does not supply. K3BlochGroups has to repoint that line.

## Not verifiable

- **Bass–Tate** (`bass-tate`, waived): II §3 and the Appendix, cited in §§8.3–8.5 and 8.8–8.9. Tate's criterion of §8.4 was checked mathematically instead.
- **Groenewegen's preprint pages** (`groenewegen-preprint`, waived). The journal-page locators were checked.
- **Grayson, LNM 966** (`grayson-curve`): uncertified, cited by its page range.
- **Other waived texts:** Harris–Segal, Mitchell, Quillen's Seattle notes and Serre were not read.
- **AINTLIB declarations** (§§7.1–7.3): an external repository, not opened. §7.2's argument uses the supplier's unrestricted statements, not those signatures.
- **Ravenel, Rognes, Rognes–Weibel, Caputo, Banaszak, Sharifi, Ribet, Borel and the handbook:** not in this round's sample, so not reopened. The previous review verified Ravenel, Caputo, Sharifi, Ribet and Borel.

## Source issues

- **Misprint** in kbook at Classical Data VI.8.1, printed page 513: the source says K₁(O_S)≅ℤ^(r₂+|S|−1)⊕μ(F); it should be ℤ^(r₁+r₂+|S|−1)⊕μ(F), since ℤ[1/p] has unit rank one; affects nothing.
- **Misprint** in kbook at Classical Data VI.8.1, printed page 513: the source says K_n(F) is finite for even n>0; it should say K_n(O_S), since K₂(ℚ) is infinite; affects nothing.
- **Misprint** in kbook at the text preceding Theorem VI.10.6, printed page 531: the source says that for even i exactly one summand of R^×⊗μ^(i−1) is invariant, and for odd i only when i≡1 mod ℓ−1; it should swap the parities, as in Example VI.10.4.2; affects nothing.
- **Error** in kbook at Example VI.2.1.2, printed page 470: the source says w₁₀(ℚ)=1320=2³·3·5·11; it should be 264=2³·3·11, since 5−1 does not divide 10 (Lemma VI.2.4: den(B₅/20)=264); affects a stated result.
- **Misprint** in hutchinson at Example 2.5, printed page 4: the source says ℚ(√d) is special for d≡−1 mod 8 or d≡±2 mod 16, excluding only d=−1,−2; it should also exclude d=2, since ℚ(√2) has equal global and dyadic Γ_∞; affects nothing.
