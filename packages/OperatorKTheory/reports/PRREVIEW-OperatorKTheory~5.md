# Review of OperatorKTheory (pull request #866 at a53fe15)

**Verdict:** needs changes

There are six findings: two P2 and four P3. All five findings of the previous review are repaired. The worker's gate passes on this head.

## Status of the previous review's findings (head 5dbc4ac)

- **R01 (7.5 restates Tau Ceti's factor sets and twisted translations): repaired.**
  - Lines 1765–1768 now take "a function `c : Multiplicative L → Multiplicative L → ℂˣ` with Tau Ceti's `TauCeti.IsFactorSet c` … and with `|c(x,y)|=1`".
  - Lines 1768–1775 extend `TauCeti.twistedTranslation ℂ c x` to ℓ² and obtain λ_c from `TauCeti.TwistedMonoidAlgebra.lift`.
  - Lines 1790–1796 derive the universal property from `lift` and `algHom_ext`.
  - From Tau Ceti (lines 162–173) lists all five names and `SmoothNoncommutativeTorus.twist`, and the docstring's K7 item has been rewritten.
  - I checked each name at the pin (see Verified sound). The 7.5 ownership question is a separate matter (R01 below).
- **R02 (E(A,J) clashes with E-theory): repaired.**
  - Lines 1349–1352 now read "U(A,J) for the group of invertible strong unital stable extension classes … Ext⁻¹(A,J) … `KK(A,SJ)=KK₁(A,J)` (p. 1); in the cycle it appears only as KK₁(A,J)".
  - The facts are now bullets (lines 1364–1371).
- **R03 (trace pairing under limits stated in K1): repaired.**
  - Lines 443–445 now defer the limit statement to 2.3.
  - 2.3 (lines 556–562) states it.
  - The CAR Example (lines 630–634) computes it.
  - The new text raises a generality gap, which is R04 below.
- **R04 ("C1–C2"): repaired.** Lines 177, 281 and 482 now cite C1, and a grep finds no "C1–C2" anywhere.
- **R05 (3.5 locator): repaired.**
  - Lines 843–850 now cite "(Roe, Corollary 14.7, p. 66, and its proof, p. 67)".
  - The hypothesis `|||·|||≥‖·‖`, the inequality and the unitization norm match Roe2017 lines 2548–2558.
  - The route (`x=y=aⁿ`, then λ1−b*b) matches Roe2017 lines 2561–2573.

## R01 (P2) — 7.5 is a third owner of the twisted group C*-algebra C*(ℤ^d,c)

**Location.** `TauCetiRoadmap/OperatorKTheory/README.md` lines 1772–1775: "`TauCeti.TwistedMonoidAlgebra.lift` turns x↦W_x into an algebra map λ_c … define C*(L,c) as the norm closure of its range". Lines 1784–1796 add the trace, the gauge action, injectivity of λ_c and the universal property by Fell absorption.

**Claim.** The roadmap builds the twisted group C*-algebra itself, with its regular representation, trace, gauge action and full=reduced universal property. Scope (line 22) claims "twisted-group-algebra … calculations" and names no other owner.

**Witness.** Two open heads claim the same objects:
- The OperatorAlgebraDynamics revision (#1137, head 53ad990), README lines 71–77: "single owner of … the scalar twisted group C*-algebras `C*(G,ω)` and `C*_r(G,ω)` … canonical trace, the gauge action … full=reduced theorem (D1.CentralTwists, D2.CentralTwists)".
- HeisenbergImprimitivity (#1149, head a9eeb6e), README lines 30–33, owns "`C*(L,c)` … universal and regular completions, canonical trace, gauge action, full = reduced theorem". Its lines 820–827 say that 7.5's algebras "are §3.1 at L=ℤ^d".

**Repair.** Choose one owner.
1. #1149 (lines 825–827) leaves exactly these to this roadmap, and #1137 claims only the construction (lines 71–77):
   - the commutator bicharacter ρ, with C_ρ and H_ρ;
   - the expectation Q and the centre;
   - the simplicity criterion;
   - the identification of A_θ with C*(ℤ²,c).
2. In 7.5, delete the construction of W_x, λ_c and C*(L,c) (lines 1768–1776). Delete the parts of the bullets at lines 1784–1796 that construct the trace, gauge action, injectivity of λ_c and universal property.
3. Consume these objects from OperatorAlgebraDynamics D1.CentralTwists and D2.CentralTwists:
   - OperatorAlgebraDynamics is earliest in the merge order;
   - add the contract under "From TauCetiRoadmap.OperatorAlgebraDynamics";
   - name that open revision in the description's merge-order paragraph.
4. Keep everything from "Define the continuous alternating commutator bicharacter" onward, the Checks and the convention witness.
5. Add a Scope bullet: "OperatorAlgebraDynamics owns the scalar twisted group C*-algebras; K7.5 proves their centre and simplicity criterion for G=ℤ^d".

#1137 and #1149 are both by this author. If HeisenbergImprimitivity is chosen as the owner instead, cite its §3.1 in the same way. Either way, 7.5 must not be the third construction.

**Test.**
- #1149 line 452 (and #1137 line 3440) give the twisted regular representation as `(λ_c(x)h)(y)=c(x,y−x)h(y−x)`. On δ_z this gives `c(x,z)δ_(x+z)`, which is 7.5's W_x. The consumed objects therefore satisfy 7.5's conventions.
- With the rotation cocycle `e(θnm′)`, 7.5's own Checks then give C_ρ=qℤ² for θ=p/q and C_ρ=0 for irrational θ. Nothing is built twice.

## R02 (P2) — Atkinson's theorem is statable at the pins but absent from `Suggested.lean`

**Location.**
- README lines 9–10: "The end theorems are … Atkinson's theorem with the K₀-valued module index".
- 4.1 (lines 885–888) proves that a Hilbert-space operator "is Fredholm exactly when … it has a bounded two-sided parametrix modulo compact operators".
- `Suggested.lean` lines 27–29 list, under K4, only the module index, the Ext semigroup and Ext(A,B) as not statable.

**Claim.** The docstring accounts for every headline that is not stated.

**Witness.**
- The parametrix form needs only `ContinuousLinearMap.IsFredholm` and `IsCompactOperator`.
- No declaration at the pins proves it:
  - Mathlib's `isFredholm_iff_exists_isQuasiInverse` (`Fredholm/Basic.lean` line 368) works modulo finite rank;
  - Tau Ceti's `CompactPerturbation.lean` contains only perturbation lemmas.
- The candidate below elaborates.

**Repair.** In `Suggested.lean`, add a `/-! ## K4: Atkinson's theorem -/` section with variables `{H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`:

```lean
/-- **Atkinson's theorem.** A bounded operator on a Hilbert space is Fredholm exactly when it is
invertible modulo compact operators (Zois, *18 Lectures on K-Theory*, Analytic K-theory,
Lecture 1, Theorem 1; README, 4.1). -/
theorem isFredholm_iff_exists_isCompactOperator_mul_sub_one {T : H →L[ℂ] H} :
    T.IsFredholm ↔ ∃ S : H →L[ℂ] H,
      IsCompactOperator (S * T - 1 : H →L[ℂ] H) ∧ IsCompactOperator (T * S - 1 : H →L[ℂ] H) := by
  sorry
```

Then name it:
- in 4.1;
- in README lines 269–272;
- in the first paragraph of the module docstring.

The K4 bullet keeps the module index as not statable.

**Test.**
- The statement elaborates at the pins with one `sorry` warning, and `#check` shows `[CompleteSpace H]` kept.
- The one-tactic probe (`first | rfl | simp | simp_all | infer_instance | trivial | tauto | aesop`) leaves the goal open.
- Instances:
  - For the shift S with S=S* as parametrix, `S*S−1=0` and `SS*−1=−e₀₀`, so both sides are true.
  - For the isometry `δ_n↦δ_(2n)`, the cokernel is infinite, so both sides are false.
  - For T=0 on ℓ², `S·0−1=−1` is not compact, so both sides are false.
  - In finite dimension S=0 works and every operator is Fredholm.

## R03 (P3) — Tau Ceti's full crossed product is named in the docstring but not in the README's contracts

**Location.**
- `Suggested.lean` line 35: "Tau Ceti has the full crossed product `TauCeti.CStarAction.FullCrossedProduct`".
- README line 41: "OperatorAlgebraDynamics owns the crossed-product constructions themselves".
- From Tau Ceti (lines 136–173) omits it.
- 7.2, 7.4 and 7.7 (lines 1481, 1705, 1867) take full crossed products from D1–D2.

**Claim.** The README's contracts name every pinned object that the roadmap consumes.

**Witness.** At the pin, `TauCeti/Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean` defines `TauCeti.CStarAction.FullCrossedProduct`:
- the full crossed product of a point-norm continuous action of a locally compact group with Haar measure μ (`#check`: `IsTopologicalGroup G`, `LocallyCompactSpace G`, `BorelSpace G`, `μ.IsHaarMeasure`);
- with `of`, `lift` and `integratedFull`.

`Covariant/Regular.lean` line 127 defines `TauCeti.CStarAction.CovariantRepresentation.regular`.

**Repair.**
1. Add both names, with their files, to From Tau Ceti:
   - the full crossed product as the completion of C_c(G,A) in the universal norm over covariant representations;
   - the regular covariant representation on L²(G,H).
2. In line 41 and in the D1–D2 contract, say that the full crossed product is Tau Ceti's. D1–D2 still supply the reduced products, the regular quotient, ℂ⋊G≅C*(G), the discrete expectation and Fell absorption.
3. Cite the Tau Ceti name in the *Needs* lines of 7.2, 7.4 and 7.7.

**Test.** The crossed products K7 uses are all instances of the pinned declaration: compact G in 7.2, ℤ in 7.4, ℝ in 7.7 and F_n in 7.3. Each is a locally compact group with Haar measure.

## R04 (P3) — 2.3 pairs K₀(Aᵢ) with functionals that 1.5's pairing does not cover

**Location.**
- README lines 556–558: "put `τᵢ=τ∘φ_(i,∞)`, a positive tracial functional of norm at most 1 on Aᵢ, paired with K₀(Aᵢ) by the matrix-trace formula of 1.5".
- 1.5 (lines 432–435) defines the pairing only "For a tracial state τ" and "For a nonunital tracial state".

**Claim.** `(τᵢ)_*` is an object that 1.5 defines, with 1.5's API.

**Witness.** Take the system `ℂ→ℂ²→ℂ²→…` with first map `λ↦(λ,0)` and identity maps after it. The limit is A=ℂ²; take τ(a,b)=b. Then τ₁=τ∘φ_(1,∞)=0, which is not a state. So 1.5 defines no `(τ₁)_*`, and none of its bullets (independence of representatives, additivity, naturality) applies.

**Repair.**
1. In 1.5, define the pairing for every positive tracial functional τ with ‖τ‖≤1:
   - by the same unnormalized matrix trace;
   - with `τ⁺(a+λ)=τ(a)+λ`, which is positive on A⁺ because ‖τ‖≤1.
2. State the bullets at that generality, with tracial states as the norm-one case.
3. In 2.3, cite that definition.

**Test.**
- On the witness, `(τ₁)_*=0` on K₀(ℂ). The image `[(1,0)]` of [1] pairs to τ(1,0)=0. So 2.3's identity `τ_*∘(φ_(1,∞))_*=(τ₁)_*` holds.
- In the CAR Example every τ_k is the normalized trace, so nothing there changes.

## R05 (P3) — KK's domain of definition is stated three ways

**Location.**
- 5.2, line 1113: "For separable graded A and σ-unital graded B, define a Kasparov cycle".
- 5.4, line 1172: "Define `KK_i(A,B)=KK(A,B⊗̂Cl_i)` for all graded A,B".
- 6.4, line 1328: "The six-term exact sequences in both variables hold for separable coefficient algebras (Blackadar, Theorem 19.5.7)".

**Claim.** 5.4 and 6.4 use KK on the domain where 5.2 defines it, and 6.4 states its source's generality.

**Witness.**
- K(ℓ²(ℝ)) is not σ-unital: every compact operator has separable range, so none is strictly positive. KK₀(ℂ,K(ℓ²(ℝ))) is therefore within 5.4's scope but undefined by 5.2.
- Blackadar1998 lines 8700–8712 prove the covariant sequence for semisplit σ-unital extensions and separable D, and, when A is separable, the contravariant sequence for every σ-unital D.

**Repair.**
- In 5.4, write "for separable graded A, σ-unital graded B and i modulo 2 (B⊗̂Cl_i is then σ-unital)".
- In 6.4, write "For a semisplit extension of σ-unital graded C*-algebras … the covariant sequence holds for separable graded D and, when A is separable, the contravariant sequence for σ-unital graded D (Blackadar, Theorem 19.5.7)".

**Test.**
- After the repair, KK(ℂ,K(ℓ²(ℝ))) is excluded in all three places.
- D=B(H), which is unital, hence σ-unital, and not separable, is admitted in the contravariant sequence, as the source allows.

## R06 (P3) — "Schochet, 4.5" names two different results

**Location.**
- README line 770: "the remark after it cites Schochet, *Topological methods for C*-algebras III*, 4.5, for removing that hypothesis".
- References, lines 2268–2269: "… 399–445, 4.5."

**Claim.** The locator identifies one statement.

**Witness.** Schochet1984 has two results numbered 4.5:
- line 823 is Proposition 4.5, p. 428, with all maps surjective;
- line 875 is Theorem 4.5, p. 431: for a homology theory, f₁ surjective and f₂ arbitrary.

**Repair.** Write "Theorem 4.5, p. 431" at both places.

**Test.** Theorem 4.5 is the one-surjective-leg statement that 3.3 relies on. Proposition 4.5 assumes both legs surjective, which is the case 3.3 does not need.

## Verified sound

**Gate and direction.**
- The worker's gate (`gate.md`) shows every check passing.
- My rerun of the full gate prints `depcheck=1` with `UPWARD: OperatorKTheory (#9) -> AlgebraicKTheory (#15)`. That is the live order, before the move.
- The brief's command with `--movable` against the moved order prints `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The suppliers are all earlier in the moved order or on main:
  - in the moved order: VonNeumannAlgebras (6), CStarAlgebras (8), HilbertModules (9) and AlgebraicKTheory (10), with OperatorKTheory at 11;
  - on main: OperatorAlgebraDynamics, BanachAlgebras, GrothendieckEulerForms, TopologicalKTheory, VonNeumannAlgebras and PseudodifferentialOperators.
- `roadmaps resolve` reports no unresolved citation or Lean name.
- `roadmaps overlaps` reports no dropped ids and no other pull request changing this roadmap.

**Elaboration.**
- `lake env lean TauCetiRoadmap/OperatorKTheory/Suggested.lean` gives two `declaration uses 'sorry'` warnings (lines 72 and 86) and nothing else.
- In a scratch copy I ran `#check @` on all four declarations. They match `signatures.md` and README 8.4:
  - both theorems carry `[CompleteSpace H] [TopologicalSpace.SeparableSpace H]`;
  - `essentialSpectrum` drops `[CompleteSpace H]`, which `IsFredholm` does not need, so the lead is not a defect.
- The one-tactic probe leaves both BDF goals open, so there is no padding.

**Library declarations.**
- 39 cited names elaborated with `#check` at the pins, 0 errors. Among them:
  - `TauCeti.IsFactorSet`, `TauCeti.twistedTranslation`, `TauCeti.twistedMonoidAlgebra`, `TauCeti.TwistedMonoidAlgebra.lift` and `.algHom_ext`;
  - `TauCeti.CStarAction.FullCrossedProduct`, `lp.single` and `lp.hasSum_single`;
  - `TauCeti.isFredholm_one_sub`, `ContinuousLinearMap.index_add_of_isCompactOperator`, `Path.index_eq` and `Continuous.isLocallyConstant_index`;
  - `TauCeti.SplitK0`, `TauCeti.finiteProjectiveModules`, `Unitary.joined` and `Unitary.mem_pathComponentOne_iff`;
  - `CompletelyPositiveMap`, `LowerHemicontinuous.exists_continuous_selection`, `LocallyConstant.freeOfProfinite` and `SimpleGraph.mulCayley`;
  - `CategoryTheory.ShortComplex.ShortExact.extClass`, `CategoryTheory.Tor`, `PontryaginDual` and `MeasureTheory.Measure.haar`.
- Read at source, because these modules have no built object file:
  - `Matrix.fromBlocks_one_sub_mul_self_of_mul_eq` and `Matrix.fromBlocks_one_sub_mul_fromBlocks_mul_fromBlocks_one_sub_of_mul_eq` (`TauCeti/Data/Matrix/Block.lean` lines 70 and 86). The hypotheses `ab=e`, `ba=f` and `be=b` (and `ea=a` for the involution) match README lines 157–161.
  - `TauCeti.SmoothNoncommutativeTorus.twist` (`SmoothTorus/Basic.lean` line 180) is `𝐞(θ·y₂z₁)`, with `U₂U₁=exp(2πiθ)U₁U₂` (line 561). This matches 7.5's roles U₁=v and U₂=u, and the relation `uv=e(θ)vu`.
  - `TauCeti.IsPartialIsometry` (`PartialIsometry.lean` line 52).
- Tau Ceti's factor-set conventions (`Twisted/Basic.lean` lines 99–106, 238–244, 397–420) agree with README lines 162–169: the cocycle is `α(gh,j)α(g,h)=α(h,j)α(g,hj)`, `single h ↦ single (g*h)` scaled by `α g h`, and `lift` takes `u 1 = 1`.

**Carriers that the docstring calls missing.** At the pins I found:
- no C*-spatial tensor product (Tau Ceti has only the injective Banach tensor seminorm);
- no adjointable operators on `CStarModule` (Mathlib's `Analysis/CStarAlgebra/Module/` has `Defs`, `Constructions` and `Synonym` only);
- no Calkin algebra, essential spectrum, Busby invariant, corona or asymptotic morphism;
- no reduced crossed product (Tau Ceti has the regular covariant representation only) and no Cuntz algebra;
- no compact-parametrix Fredholm criterion (hence R02).

**Headline theorems.** The Summary lists:
1. Bott periodicity;
2. the six-term sequence;
3. Atkinson's theorem with the module index;
4. Ext(A,B) for separable nuclear A;
5. associativity of the Kasparov product;
6. Green–Julg, Pimsner–Voiculescu and Connes–Thom;
7. the free-group, rotation and Cuntz K-groups;
8. UCT and Künneth;
9. Brown–Douglas–Fillmore;
10. the universal property of E-theory.

BDF is stated. The Hilbert-space Atkinson theorem is statable and missing (R02). The docstring names the missing carrier for every other headline.

**Cross-roadmap citations resolved.**
- CStarAlgebras (head 33ddcef):
  - C1.4 (line 381), C1.6 (line 436) and C1.7 (line 469);
  - C5.1, where the spatial norm comes from VonNeumannAlgebras V13b (line 1115);
  - C5.4 (line 1204) and C5.5 (line 1231; the mapping cone as a closed pullback);
  - C8.2 (line 1618) and C8.4 (line 1677);
  - C9.2 (line 1738).
- HilbertModules (head bbc2ad5): H1–H7 (lines 126–762).
- AlgebraicKTheory (head fe5ca28):
  - Layers 0, 1, 2, 6 and 8 (lines 85, 218, 292, 561 and 677), including 0.1, 0.3 and 0.4 (lines 87, 123 and 141);
  - its line 720 names this roadmap as the consumer of Layers 0–2, 6 and 8.
  - Its Scope (line 17) still says K1 builds its own module category, which 1.4 no longer does (line 392–393, "No other module category is constructed here"). The comparison that this roadmap owns is the same, so this is the supplier's wording, not a defect here.
- On main (eaf17b1):
  - OperatorAlgebraDynamics D1–D4 and D6 (lines 75–358);
  - VonNeumannAlgebras Layer 0 (line 275) and V11's harmonic-analysis layer (lines 3150–3182);
  - BanachAlgebras 1.2 (line 255) and Layer 2 (line 440);
  - GrothendieckEulerForms;
  - TopologicalKTheory T1–T7 (lines 163–1148);
  - FactorRigidity Layer 4 (line 415; line 988 records the leave);
  - NoncommutativeGeometry line 57: "K7 owns all real-parameter rotation C*-presentations".
- Consumers on main cite existing ids: FreeProbability (lines 79, 308 and 406), OperatorTheory (line 68), SeibergWittenTheory (line 23) and GeneralizedCohomology (line 1820).
- CStarClassification (head db5a0c5) attributes continuity to "K3" (lines 384 and 445) and Künneth to "K7" (line 155). These are its own slips: they are 2.3 and 8.5 here.

**Sources read at their locators.** Blackadar page numbers are the printed ones.
- 3.3:
  - Blackadar1998 Theorem 21.2.2, p. 219 (line 9541): both legs surjective, second map `f₂*−f₁*`; the remark at line 9578 cites Schochet 4.5.
  - Schochet1984 Theorem 4.5, p. 431 (line 875); see R06.
- 3.4: Blackadar1998 Theorem 23.1.3 (line 10169), with B arbitrary, A∈N, and α of degree 0.
- 3.5: Roe2017 Theorem 14.5 (line 2533; inverse closure of unitizations), Corollary 14.7 and its proof (lines 2548–2573, pp. 66–67), and Lemma 16.3 (line 2970).
- 4.1: Zois2010 Theorem 1 (Atkinson), p. 59 (line 1653), in the parametrix and Calkin forms as in README 4.1.
- 4.2:
  - Blackadar1998 12.2.1 and 12.2.3 (lines 4632 and 4664);
  - Roe2017 Lemmas 12.6–12.8 (lines 2068–2091; inverse `(−F,E^op)` by the same rotation as the third Check of 5.2), Proposition 12.15 (line 2178) and Theorem 12.16 (line 2191).
- 5.2: Blackadar1998 Definition 17.1.1 (lines 6231–6241), which matches the three compactness conditions, and Definition 17.3.1 (line 6483, `KKⁿ=KK(A,B⊗̂Cₙ)`).
- 5.3: Blackadar1998 Theorem 19.7.1 (line 8769: countable direct sum of separable algebras, product of KK).
- 6.1: Blackadar1998 Theorem 12.4.2 (line 4721): J, A₁ and A₂ σ-unital, Δ separable, `A₁A₂⊆J`, Δ derives A₁; conclusion `0≤M≤1`, N=1−M. This matches lines 1247–1252.
- 6.4: Blackadar1998 Theorem 19.5.7 (line 8700; see R05) and Proposition 17.6.5 (line 6886: KK¹_c≅Ext⁻¹ for σ-unital B, which the README's ∼c/∼h comparison sentence covers).
- 6.5: ManuilovThomsen2005:
  - the abstract (lines 8–12: A and B separable, A unital, B stable);
  - lines 37–38 (Ext⁻¹=KK(A,SB));
  - Lemma 2, p. 4 (line 161) and Theorem 3, p. 5 (line 257);
  - the cycle K₀(B)→Ext⁻¹_unital(A,B)→Ext⁻¹(A,B)→K₁(B)→Ext⁻¹_unital(A,SB)→Ext⁻¹(A,SB)→K₀(B) translates term by term into lines 1355–1356;
  - i₀* is restriction along ℂ→A (line 251).
- 7.2: Blackadar1998 Theorem 20.2.7(a) (line 9112: G compact) and Theorem 20.6.2 (line 9238: descent functorial and compatible with products).
- 7.5: Phillips2006 Notation 1.1, Remark 1.2, Lemma 1.5, Definition 1.6 and Theorem 1.9 (lines 87–171). The simplicity direction is attributed to "[37]" Theorem 3.7, that is Slawny.
- 8.1: Blackadar1998 Definition 22.3.4 (line 9924), with (N1)–(N4) as in 8.1.
- 8.3: Blackadar1998 Theorem 23.1.1, p. 233 (line 10153: A∈N, B separable, unnatural splitting, free or divisible case) and Proposition 23.5.1 (line 10253: lines and planes, `SB⊗K`, semisplit cone).
- 8.4: Blackadar1998 Theorem 16.2.1 and Corollaries 16.2.2–16.2.3, p. 136 (lines 5956–5975). These match both Lean statements and the Checks.
- Also opened: Roe2017 Lemma 19.1 (line 3460; winding −1, as in 7.7) and Blackadar1998 Theorem 25.6.1 (line 11995; additive targets, which 9.5 restricts to abelian ones on purpose because of the half-exactness definition).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 stabilized conjugacy (changed) | general v; p=q=1, v=1 | `w diag(p,0)=[[0,0],[v,0]]`, and `[[0,0],[v,0]]w=[[0,0],[v(1−p),vv*]]=diag(0,q)` since vp=v; w*=w, w²=1; `exp(iπr/2)=[[(1+i)/2,(1−i)/2],[(1−i)/2,(1+i)/2]]` sends diag(1,0) to `[[1/2,i/2],[−i/2,1/2]]` | holds | none |
| 1.5/2.3 trace pairing under limits (changed) | CAR M_(2^∞); ℂ→ℂ² with τ=second coordinate | rank one in M_(2^k): 2^(−k), and diag(e,e): 2/2^(k+1)=2^(−k), limit group ℤ[1/2]; τ₁=0, not a state | identity holds; 1.5 does not define (τ₁)_* | R04 |
| 3.1 Bott map (headline) | H(r,s) on four edges; A=ℂ | r=0: exp(2πi(se+(1−s)p)); r=1: f_e(s)exp(−2πisp)=f_e f_p⁻¹; s=0: exp(2πip)=1; s=1: exp(2πie)=1; b_ℂ[1] has winding +1 | holds | none |
| 3.2 six-term (headline) | Toeplitz | δ₁[z]=[1−S*S]−[1−SS*]=0−1=−1=index S | holds | none |
| 3.3 pullback MV (sample) | A₂=0; Q=0; C(𝕋) as two intervals over ℂ² | D=J; D=A₁×A₂ with ∂=0; ℤ²→ℤ², (m,n)↦(m−n)(1,1), kernel ℤ=K₀(C(𝕋)), cokernel ℤ=K₁(C(𝕋)); ∂₀π₂*=ιδ_(A₂)=0 | holds | R06 (locator) |
| 3.4 external product (sample) | [1]×[1]; 𝕋² flip | 1·1=1; K₀(C(𝕋²))=ℤ⊗ℤ⊕ℤ⊗ℤ=ℤ²; flip has degree −1, giving −q*β | holds | none |
| 3.5 Banach criterion (sample) | C¹(𝕋); z; b=2+z | `‖fg‖+‖(fg)′‖≤‖f‖‖g‖+‖f′‖‖g‖+‖f‖‖g′‖`, so C=1; \|\|\|zⁿ\|\|\|=1+n, so r=1 in both algebras; σ(b*b)=[1,9], and λ=9 gives spectral radius 8<9 | holds | none |
| 4.1 Atkinson (sample, headline) | S; δ_n↦δ_(2n); T=0; dim H<∞ | S*S−1=0 and SS*−1=−e₀₀, index −1; VV*−1=−P_odd, not compact; −1 not compact; Q(H)=0 | holds; not in Lean | R02 |
| 4.2 graded pairs (sample) | [[0,S*],[S,0]]; swap on ℂ^(1\|1) | F²−1=diag(0,−e₀₀), index 0−1=−1; F²=1 and F=F*, index 0 | holds | none |
| 4.5 Ext (headline) | Toeplitz; (M_n,K) | lift of z of index −1, versus 0 for a split lift; unit evaluation ×n, giving ℤ/n | holds | none |
| 5.2 cycles (sample) | (A,id,0); H_A with F=0; inverse | (0−1)a=−a∈K_A(A); diag(a,a,…) not compact; cos(πt/2)(F⊕−F)+sin(πt/2)W reaches degenerate W | holds | none |
| 5.3 countable additivity (sample) | A_n=ℂ, ⊕=c₀ | KK(c₀,ℂ)=Hom(⊕ℤ,ℤ)=∏ℤ (not ⊕ℤ); KK₁=Ext(⊕ℤ,ℤ)=0 | holds | none |
| 5.4 degrees (R05) | B=K(ℓ²(ℝ)); Cayley form | not σ-unital, so outside 5.2; (x−i)/(x+i)=exp(2πit) | convention holds; domain inconsistent | R05 |
| 6.1 technical theorem (sample) | J=K: (A₁,A₂)=(K,ℂ1) and (ℂ1,K), Δ=0 | M=1, N=0: MK⊆K and N·1=0∈K; M=0, N=1: NK⊆K | holds; matches 12.4.2 | none |
| 6.2 Kasparov product (headline) | 1_D; [f]⊗[g]; two odd classes | x⊗1_D=x; [g∘f]; (−1)^(1·1)=−1 | holds | none |
| 6.4 semisplit (sample) | Toeplitz; split; cone; D=B(H) | [z]⊗δ=−1; class 0; [1]↦exp(2πit), generating KK₁(ℂ,Sℂ); B(H) σ-unital but excluded | holds; narrowed | R05 |
| 6.5 Manuilov–Thomsen (sample) | (M_n,K); (ℂ,J); (C(𝕋),K) | ×n, so U=ℤ/n; identity maps, so U=0; ev onto and K₁(K)=0, so U≅KK₁=ℤ | holds | none |
| 7.2 Green–Julg (sample, headline) | p_G; trivial G; ℤ/2 on ℂ | (1∗1)(t)=∫1=1; p_G=1; R(ℤ/2)=ℤ²=K₀(ℂ²), degree 1 is 0 | holds | none |
| 7.3 free groups (headline) | Γ_n; n=0,1; boundary | g_nΓ_n=Γ_n∖{1} (g_n⁻¹∉Γ_n); (ℤ,0) and (ℤ,ℤ); δ₁[u_n]=−[P₁]=−1 | holds | none |
| 7.4 PV and A_θ (headline) | UaU*=α(a); θ=1/2 | (1−α⁻¹)(−α)=1−α; ℤ+½ℤ=½ℤ, τ_* not injective on ℤ² | holds | none |
| 7.5 twisted centres (sample) | x=(0,1), y=(1,0); λ_c injective; C_ρ; d=0 | c(x,y)=e(θ), c(y,x)=1, so uv=e(θ)vu; τ(W_y*λ_c(a))=a_y·conj c(y,−y)·c(−y,y)=a_y; C_ρ=0, qℤ², ℤ²; ℂ is simple | holds; third owner | R01 |
| 7.6 Cuntz (headline) | n=1,2,3 | (1−n)[1]; ℤ/0=ℤ=K₀(C(𝕋)); K₀(O₂)=0; K₀(O₃)=ℤ/2 | holds | none |
| 7.7 Connes–Thom (headline) | u(x)=(x+i)/(x−i) | arg u=2arg(x+i) runs from 2π to 0, winding −1, matching Roe2017 line 3463 | holds | none |
| 8.1 bootstrap (sample) | 0; Sℂ; B(H) | 0→ℂ→ℂ→0→0; Cℂ∼0; B(H) not separable, so not in N | holds | none |
| 8.3 UCT (sample, headline) | A=ℂ; (O_n,ℂ); (O_n,O_n) | Ext terms 0; KK₀=0 and KK₁=Ext(ℤ/(n−1),ℤ)=ℤ/(n−1); Hom=ℤ/(n−1) | holds | none |
| 8.4 BDF Lean (sample, headline) | S; S⊕S*; bilateral shift; S⊗1_∞; compact K; dim H<∞ | index −1 inside 𝕋; −1+1=0; normal, index 0; S*S−SS*=e₀₀⊗1, not compact, so not essentially normal; σ_e(K)={0}; σ_e=∅ and both sides true | holds | none |
| 8.5 Künneth (headline) | O₃⊗O₃; A_θ⊗A_θ′ | K₀=ℤ/2⊗ℤ/2=ℤ/2, K₁=Tor=ℤ/2; ℤ⁴⊕ℤ⁴=ℤ⁸ in both degrees | holds | none |
| 9.5 E-theory (headline) | (O_n,ℂ) | E₀=KK₀=0, E₁=KK₁=ℤ/(n−1) | holds | none |
| Docstring K7 (R03) | FullCrossedProduct signature | requires IsTopologicalGroup, LocallyCompactSpace, BorelSpace and IsHaarMeasure, which covers compact G, ℤ, ℝ and F_n | contract missing | R03 |

## Not verifiable

- Slawny1972 is recorded as uncertified (paywalled). It is cited only through Phillips2006 Theorem 1.9, which I read (line 164).
- I did not reread Cuntz1981, PimsnerVoiculescu1982, Julg2013, Messerschmidt2016 or StacksProject this round. They are outside the seeded sample, and the README flags no locator as unverified.
- Ownership against open pull requests was checked:
  - through the sibling heads the brief provides (#1137, #1149, #863, #861 and #1142, plus CStarAlgebras #860 through `roadmaps show`);
  - through `roadmaps grep` over all 475 open heads, for C*(L,c).

## Source issues

- **Misprint** in Zois2010 at Analytic K-theory Lecture 1, Theorem 1, p. 59: the proof of a⇒b names the inverse of T as a map from Im T to (Im T)^⊥; it should be a map from Im T to (Ker T)^⊥; affects nothing.
- **Misprint** in Schochet1984 at §4, pp. 428 and 431: two different results carry the number 4.5, a proposition (all maps surjective) and a theorem (one map surjective); the theorem should have its own number; affects nothing.
- **Gap** in Roe2017 at Theorem 12.16, pp. 57–58: the theorem is stated for every ungraded C*-algebra, but its surjectivity step adds a pair on Ĥ_A, which is countably generated only for σ-unital A; it should assume σ-unital A or cite Exel's extension; affects the proof.
- **Misprint** in ManuilovThomsen2005 at display (1), p. 1: the text introduces the sum ϕ⊕ψ, but the display defines ψ⊕ϕ with ψ in the V₁ corner; the announced and displayed orders should agree; affects nothing.
