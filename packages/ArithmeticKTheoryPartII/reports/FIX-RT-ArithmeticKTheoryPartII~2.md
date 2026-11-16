# FIX-RT-ArithmeticKTheoryPartII~2: repair of red-team round 2 (passes a and b)

Ten findings, settled in seven sections (three overlaps merged). All ten hold on the mathematics. None is disputed and none is outside this package. One part of a/F01 is applied differently: the `topological-symplectic-hodge` gap is deleted, not restated, because its content is already supplied on main.

## RT-ArithmeticKTheoryPartII~2a/F01 (P2) — applied differently

Four vague gap sentences now have exact hypotheses and conclusions, identical in the README and `design/plan.json`: `cm-arbitrary-automorphism`, `duality-transfer`, `low-postnikov-finite-type` and `compact-relative-cocycles`. The fifth, `topological-symplectic-hodge`, is deleted. Its content is now cited from GeneralizedCohomology G5.4–G5.5 and CharacteristicClasses C3.4, C6.2–C6.3, and the short deductions are made in §8.4.

What differs from the suggested repair, and why:
- **`topological-symplectic-hodge` is deleted.** GeneralizedCohomology G5.4 (on main) builds ku with the Γ-machine from the U(r) Hermitian categories. It compares them with the nonskeletal inner-product category and identifies the group completion with ℤ×BU, which is the suggested first clause. G5.5 pins the Bott representative to TopologicalKTheory's β on ℂP¹.
  CharacteristicClasses C6.2 (on main) defines ch_j as the integral Newton polynomial divided by j!, additive and multiplicative. C6.3 gives ch(O(−1)−1)=−U, and C3.4 gives H*(BU(r);ℤ)=ℤ[c₁,…,c_r].
  The facts the gap asked for follow in a line each:
  - primitivity, from additivity;
  - ℤ_(p)-integrality for m<p, since m! is a p-unit;
  - the pairing +1 with bott^m, by multiplicativity on (S²)^∧m.
  The suggested mod-p^r clause is not needed. β_r(y) is killed by p^r, so every ℤ_p-valued class pairs to 0 with it. The §8.4 Hodge pairing and the §8.1 law now give this reason instead of a "coefficient-Bockstein compatibility".
  Pattern: the SymplecticGeometry contract, §8.4, §8.5 and §8.6 *Needs* lines, and the Layer 8 Dependencies now cite CharacteristicClasses. A new "From TauCetiRoadmap.CharacteristicClasses" contract and a Scope sentence were added.
- **`cm-arbitrary-automorphism`.** The new sentence uses this roadmap's sign convention: the Riemann form is −Tr∘b, and the type is defined by Im τ(b(x,x))>0, as in §2.2 and `IsSkewCMLine`. It asks only for an isometry class [X,h], as FGV Theorem 6.6(i) states (FGV lines 1624–1641), not for a natural isometry. The Serre-tensor clause is dropped: σ(Y⊗A)≅Y⊗σA is the base-change law of the supplier's §1.2 Serre tensor.
- **`duality-transfer`.** The clause "corestriction on the étale descent edges" is dropped. That compatibility is ArithmeticKTheory's, consumed at the ArithmeticKTheory contract ("transfer is the actual corestriction edge"). SchemeKTheoryOperations precedes ArithmeticKTheory in the merge order, so it cannot state it. The sentence asks for a homotopy of spectrum maps, which then holds after smashing with any coefficient spectrum.
- **`low-postnikov-finite-type`.** The splitting is asked for at the spectrum level, from which the H-space statement follows by applying Ω∞.
- **`compact-relative-cocycles`.** As suggested, with the bijection written as φ↦((g,m)↦φ([g]⊗m)).

Evidence that the three surviving gaps are not supplied elsewhere:
- SchemeKTheoryOperations §6.11 has finite transfers but no trace-dual comparison, and `roadmaps grep` finds no owner anywhere.
- StableHomotopyKTheory §§3.20, 3.34–3.37 have Postnikov towers and Serre classes, but no p-local splitting and no Eilenberg–Mac Lane homology models.
- ArithmeticGaloisDuality R02 is cohomological.

## RT-ArithmeticKTheoryPartII~2a/F02, RT-ArithmeticKTheoryPartII~2b/F01 (P3) — applied

The `needs` of `cyclotomic-p-class-fields` in `design/plan.json` is now the README sentence, character for character, with fully qualified `TauCeti.ClassFieldTheory.` names. All 13 remaining slugs were compared by script and are identical, with the same suppliers. The non-gap part of `plan.json` is unchanged (JSON comparison).

## RT-ArithmeticKTheoryPartII~2a/F03 (P3) — applied

§8.4: "ordered by extension" → "ordered by refinement: one sequence lies below another when it is obtained from it by deleting some of its pairs, in any positions". The locators are mirzaiiVanDerKallen2002 line 46 and lines 238–240.

A negative-control Check was added. Under refinement, ((e₁,f₁)) and ((e₂,f₂)) both lie below ((e₁,f₁),(e₂,f₂)). Under the prefix order the first pair is constant on components, so at g=6 the poset would not be 0-connected.

Evidence: mirzaiiVanDerKallen2002 lines 238–240 place z below wz, the sequence with entries prepended.

## RT-ArithmeticKTheoryPartII~2a/F04, RT-ArithmeticKTheoryPartII~2b/F02 (P3) — applied

§8.4 *Needs*: "§4.18 (the plus comparison and its block-sum product)" → "§4.18 (the plus comparison) and §§4.6, 4.9 (the Pontryagin ring isomorphism …, whose product on BS is orthogonal sum)".

The §8.4 statement now names Quillen's ring isomorphism. With π₀S=ℕ, the localized ring is k[t,t⁻¹]⊗H_*(Sp∞(ℤ);k), and its unit component carries the block-sum product. Sections 4.6 and 4.9 were added to:
- the StableHomotopyKTheory contract, with a sentence saying what is consumed;
- the Scope section;
- the Layer 8 Dependencies.

Evidence: StableHomotopyKTheory on main. §4.18 states only B(S⁻¹S)≃K₀(S)×BAut(s∞)⁺; §4.6 defines the ring localization; §4.9 proves it.

## RT-ArithmeticKTheoryPartII~2a/F05, RT-ArithmeticKTheoryPartII~2b/F03 (P3) — applied

Each *Needs* line whose route uses a declared gap now names it:

| Section | Contract named |
|---|---|
| §0.5, §5.3, §7.3 | relative-homology-edges |
| §7.1 | relative-homology-edges and compact-relative-cocycles |
| §7.2, §7.3 | cyclotomic-p-class-fields (§7.2 also gains ClassFieldTheory Layers 11–13) |
| §4.2 | ppav-embedding-atlases |
| §4.4 | graded-moore-realization |
| §5.1 | cm-arbitrary-automorphism |
| §7.4 | lisse-integral-extension |
| §8.3 | low-postnikov-finite-type |
| §8.6 | Bernoulli nonvanishing |

The same words were added to the Dependencies of Layers 0, 4, 5, 7 and 8. The other gaps were already named (§§0.4, 3.5, 7.6, 8.2). The former topological-symplectic-Hodge entries were replaced by CharacteristicClasses (see a/F01).

## RT-ArithmeticKTheoryPartII~2a/F06 (P3) — applied

§1.2 Checks 2–4 were rules → three computed Checks:
- At q=5 a degree-two period would need 2≡1 (mod 5); m/2=4 is the first exponent that works, since 2⁴≡1.
- At q=25 the period is a multiple of 40; the q=5 period 8 gives χ⁴, and 2⁴=16≢1 (mod 25).
- Multiplication by p on S/p is null for odd p, so its telescope is 0. Adams' map instead gives π_*(KU∧T_p)=𝔽_p[bott^±1]≠0.

The q=3 rule stays in the §1.2 body.

Same pattern elsewhere: §0.1's Check "At q=3 no assertion of a homotopy-associative Moore multiplication is admitted" was deleted. The rule stands in the §0.1 body and laws, and §0.1 keeps three computed Checks.

## RT-ArithmeticKTheoryPartII~2b/F04 (P3) — applied

- §0.2: the "representative decomposition" bullet → R=ℤ[√−5], L=(2,1+√−5), L²=(2). So 2[L]−2↦0 in K₀, while [L]≠1.
- §5.3: the line-728 bullet is deleted (six Checks remain).
- §7.1: the continuity bullet is deleted (three remain).
- §8.1: "Retain the finite-type hypotheses" → for K(ℤ/p,1), H₃(;ℤ_p) is generated by β₁(y²/2)∈β₁(I₁²), so Qᶦⁿᵗ_3=0, whereas I/I² keeps ℤ/p.

Same pattern elsewhere: §0.4's bullet "No ordinary degree-one Bott comparison is inferred" (no object, no value) → K₁(ℤ;ℤ/q)=0, whereas K₁^(β)(ℤ;ℤ/q)≅K₁(ℤ[1/p];ℤ/q)=ℤ/q, generated by p.

Other Check bullets phrased without numerals were not rewritten: for example §1.1 "c_B is not declared Galois-equivariant", §3.5 "Hodge surjectivity precedes the splitting", and §7.3 "D_q is the cyclotomic quotient …". Each names an object and the wrong model it excludes, and their sections keep computed Checks.

## Checks run

- **Elaboration.** I ran `lake env lean packages/ArithmeticKTheoryPartII/Suggested.lean` from the content checkout: exit 0, three warnings, all "declaration uses `sorry`" (lines 57, 100, 131), no errors. The imported `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField` was already built. `Suggested.lean` was not changed.
- **Elaborated signatures.** I appended `#check @name` for all six declarations to a scratch copy and elaborated it once. All six types are unchanged from the previous round and agree with the README:
  - `exists_split_prime_with_signs` and `exists_cm_lines_with_ideal_product` keep `hp`, `hodd`, `hn` and the cyclotomic and CM instances;
  - `pHilbertClassField` has `K : Type`;
  - the Vandiver theorem keeps σ, `hσ` and `hK`.
  No binder was lost.
- **Dependency check.** Output: `depcheck: 242 roadmaps, 2276 edges, 0 problem(s)`. No UPWARD or CYCLE line. The new supplier CharacteristicClasses is on main.
- **Citation resolver.** Cross-roadmap citations found nowhere: none. Lean names found nowhere: none.
- **Gap parity.** README and `plan.json` have 13 slugs each; supplier and sentence are identical for all 13.
- **Style.** No LaTeX delimiters, process words or machine paths in the README, the Lean file, `plan.json` or `sources.toml`.
- **Gate failures.** None were listed for this round.

## Adversarial pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| gap cm-arbitrary-automorphism | σ=1; σ=c; E=ℚ(√−5), H=E(i), Φ={id}, σ fixing √−5 and sending i↦−i | σ=1: X=(O_E,1), each factor w_τ⁻¹w_τ=1. σ=c: σΦ=Φ̄, h=−1 at the real place, factor (cw_τ)⁻¹cw_τ=1. Third case: σΦ=Φ, product σ\|_H≠1, so [X]=[(2,1+√−5)], the other class of h(E)=2, as classical CM gives | true; the signs of X are fixed by σΦ against Φ | restated |
| gap duality-transfer | A=B; ℤ⊂ℤ[i]; ℤ′⊂O′_q | identity. Dual basis of {1,i} under the trace is {1/2,−i/2}, so Hom_ℤ(ℤ[i],ℤ)≅(1/2)ℤ[i]=𝔡⁻¹, with 𝔡=(2) principal. After inverting p, O′_q/ℤ′ is étale and 𝔡=(1) | true | restated |
| gap low-postnikov (splitting) | stable operations HA→Σ^dHB, A, B finitely generated, 2≤d≤2p−3 | p=3: A₃ is nonzero only in degrees 0, 1, 4, 5, so degrees 2 and 3 vanish. H^d(Hℤ;𝔽_p)=0 for 1≤d≤2p−3. H²(Hℤ/p;ℤ)_(p)=0 by the Bockstein sequence. P¹ in degree 2p−2 links π₁ to π_(2p−2), outside the range | true through 2p−3, sharp | restated |
| gap low-postnikov (models) | K(ℤ/p,1); K(ℤ,2); K(ℤ/p,2); K(ℤ,3) | H_(2j−1)=ℤ_p/(jp)=ℤ/p for j<p, ℤ/p² at j=p. x^j↦j!γ_j is an isomorphism for j≤p−1. ℤ/p in even degrees, matching Γ(ℤ/p)=ℤ/p in degree 4. First torsion of K(ℤ,3) in degree 2p+1 | isomorphism in degrees ≤2p−2 | restated |
| gap compact-relative-cocycles | Γ=C₂, H=1, sign ℤ_p; Γ=ℤ_p, H=1, trivial ℤ_p; Γ=H | finite levels ℤ/p^n with limit ℤ_p, α(c,m)=m ↔ identity; H₁(ℤ/p^k;ℤ/p^n)=ℤ/p^(min(k,n)) with limit ℤ_p; 0. A continuous α factors through Γ/U×(M/p^n)_U | bijection holds | restated |
| ch facts (deleted gap) | m=1 on ℂP¹; m=2; m=p | ch₁(β_Top)=−U, ch₁(bott)=+U; (−U)⊠(−U)=+U²; ch_p(L)=c₁^p/p! is not p-integral (p=3: 1/6) | exactly m<p | gap deleted, §8.4 |
| ℤ_p-class kills β_r images | K(ℤ/p,1), degree 3 | H³(Bℤ/p;ℤ_p)=0; in general p^r⟨c,w⟩=0 forces ⟨c,w⟩=0 in ℤ_p | holds | §8.1 law, §8.4 |
| HU order (F03) | g=6 with prefix order; refinement | components indexed by the first pair, infinitely many; ((e₁,f₁)), ((e₂,f₂)) joined | refinement required | Check added |
| block-sum ring (F04) | S of §1.1 | π₀=ℕ; π₀⁻¹H_*(BS)=k[t^±1]⊗H_*(BSp∞(ℤ)); (x t^(−a))(y t^(−b))=(x⊕y)t^(−a−b) | unit component = block sum | citation |
| §1.2 Checks (F06) | q=5; q=25; p·id on S/p | 2,4,3,1 mod 5; 2¹⁰≡−1, 2²⁰≡1 mod 25, so 2 has order 20; p·id=0 for odd p | values hold | Checks |
| §0.2 Check | ℤ[√−5] | (2,1+√−5)²=(4,2+2√−5,−4+2√−5)∋6, 4, so 2; it equals (2). [L⊕L]=[R²] | ℤ[Pic]→K₀ not injective | Check |
| §8.1 Check | K(ℤ/p,1) | β(y²/2)=y·x≠0 mod p; H₄(;ℤ_p)=0, so β₁ is injective; Q₃=0 whereas (I/I²)₃=ℤ/p | holds | Check |
| §0.4 Check | q=5 | K₁(ℤ)=ℤ/2, so K₁(ℤ;ℤ/5)=0. K₁(ℤ[1/5])=±5^ℤ, so K₁(ℤ[1/5];ℤ/5)=ℤ/5. K_*(𝔽₅;ℤ/5)=ℤ/5 in degree 0 only (K_(2i−1)(𝔽₅)=ℤ/(5^i−1)) | degree one is not an isomorphism | Check |
| Hodge pairing restated | p=3, m=1; p=5, m=2, 3 | 2≤3; ch₂=(c₁²−2c₂)/2 with 2 a 5-unit; at m=3, 6≤7 | holds | wording |
| Consistency with §8.3 | E=ΣHℤ/p, i=3 | π₃=0 and Qᶦⁿᵗ_3=0 at p=3, where 3≤2p−3 | agrees | none |

## Ownership and sources

- **Ownership.** CharacteristicClasses (on main) owns the topological Chern character, and GeneralizedCohomology G5.4 owns ku from Hermitian categories; both are now cited, not requested. `roadmaps grep` (main and all 453 open heads) finds no owner of the trace-dual transfer comparison. The CM supplier and ShimuraVarieties §5 state the CM main theorem only for σ fixing the reflex field. StableHomotopyKTheory and ArithmeticGaloisDuality lack the other two gap contents. So these gaps stay with their declared suppliers. Nothing is newly owned here.
- **Sources.** No new source. The one new locator, mirzaiiVanDerKallen2002 line 46, is in the recorded arXiv text. No `needs-references.toml` was written.

## For the maintainer

- **Supplier gaps.**
  - `gap:topological-symplectic-hodge` is removed from the README and `plan.json`, so GeneralizedCohomology is no longer asked for anything.
  - CharacteristicClasses (on main, C3.4 and C6.2–C6.3) is a new supplier citation.
  - Four gap sentences changed: SchemeKTheoryOperations (`duality-transfer`), StableHomotopyKTheory (`low-postnikov-finite-type`), ComplexMultiplicationAndExplicitReciprocity (`cm-arbitrary-automorphism`) and ArithmeticGaloisDuality (`compact-relative-cocycles`).
  - In `plan.json`, `cyclotomic-p-class-fields` now matches the README.
- **Lean.** No Lean name or statement changed. No section id of this roadmap was renamed or removed.
- **No suspicious instructions** were found in the reviews or the fetched texts.
