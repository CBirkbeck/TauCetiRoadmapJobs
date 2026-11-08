# Review of OperatorKTheory (pull request #866 at b328ec0)

**Verdict:** needs changes

There are two findings: one P2 and one P3.
- R02–R06 of the previous review are repaired.
- R01 of the previous review is not repaired. The author chose the opposite direction to the one requested, and the other two claimants have not given the object up. That is R01 below.
- The worker's gate passes on this head. `Suggested.lean` elaborates with `sorry` warnings only.

## Status of the previous review's findings (head a53fe15)

- **R01 (7.5 is a third owner of `C*(ℤ^d,c)`): not repaired.**
  - Scope now claims more, at lines 22–26: "the twisted group C*-algebra `C*(L,c)` of a discrete abelian group L … built in 7.5 … with its trace, gauge action, universal property, centre and simplicity criterion".
  - Lines 2327–2330 declare HeisenbergImprimitivity Layer 3 and CompactQuantumMetricSpaces §6.0 to be instances of 7.5.
  - The OperatorAlgebraDynamics head is later than this one (b15a0d4, 2026-11-08 05:00, against b328ec0 at 00:22). It still says K7.5 consumes the object. See R01.
- **R02 (Atkinson's theorem missing from `Suggested.lean`): repaired.**
  - `Suggested.lean` lines 56–69 state `isFredholm_iff_exists_isCompactOperator_comp_sub_one` for T:H₀→H₁ between complete complex inner-product spaces.
  - README 4.1 (line 929), lines 297–300 and the module docstring name it.
  - It elaborates. The one-tactic probe leaves the goal open, so it is not padding.
  - The two-space form matches Zois2010 lines 1655–1657: a bounded S from H₁ to H₀ with both defects compact.
- **R03 (Tau Ceti's full crossed product missing from the contracts): repaired.**
  - Lines 182–196 list `FullCrossedProduct`, `.of`, `.lift`, `CovariantRepresentation.integratedFull` and `.regular`, each with its file.
  - Scope (lines 45–49) and the D1–D2 contract (lines 230–235) say the full product is Tau Ceti's.
  - The *Needs* lines of 7.2 (1536), 7.3 (1592), 7.4 (1763) and 7.7 (1939) cite it.
  - The `regular` formulas match `Covariant/Regular.lean` lines 87–131 at the pin.
- **R04 (trace pairing for non-states): repaired.**
  - 1.5 (lines 460–468) defines `τ_*` for every positive tracial functional and adds the `φ:ℂ→ℂ²` Check (lines 493–495).
  - 2.3 (lines 599–605) cites that definition.
- **R05 (KK domains): repaired.**
  - 5.4 (lines 1221–1223) restricts to separable A and σ-unital B.
  - 6.4 (lines 1378–1383) states the covariant sequence for separable D and the contravariant one for σ-unital D, as Blackadar's Theorem 19.5.7 does.
  - 6.6 and 7.2 add the matching hypotheses (lines 1440 and 1543).
- **R06 (Schochet 4.5 ambiguous): repaired.** Lines 813–815 and 2348 now cite Theorem 4.5, p. 431, which matches Schochet1984 lines 874–876.

## R01 (P2) — `C*(L,c)` has three owners: 7.5, OperatorAlgebraDynamics D1/D2.CentralTwists and HeisenbergImprimitivity §3.1

*Previous review R01, not repaired.*

**Location.** `TauCetiRoadmap/OperatorKTheory/README.md`:
- lines 22–26: "the twisted group C*-algebra `C*(L,c)` of a discrete abelian group L … built in 7.5 … with its trace, gauge action, universal property";
- lines 1825–1859: the construction of W_x, λ_c, C*(L,c), τ, α_χ and the universal property;
- lines 2327–2330: "HeisenbergImprimitivity Layer 3 … CompactQuantumMetricSpaces §6.0 are 7.5's `C*(L,c)`".

**Claim.** This roadmap is the single owner of the scalar twisted group C*-algebra of a discrete abelian group, with its regular representation, trace, gauge action and universal property.

**Witness.** Two other open heads claim the same object.
- OperatorAlgebraDynamics (#1137, b15a0d4):
  - README lines 71–77: "single owner of … the scalar twisted group C*-algebras `C*(G,ω)` … canonical trace, the gauge action … full=reduced theorem (D1.CentralTwists, D2.CentralTwists)";
  - lines 3464–3475: K7.5's algebra "is the instance … consumed from here".
- HeisenbergImprimitivity (#1149, a9eeb6e):
  - README lines 30–37 own `C*(L,c)`;
  - lines 821–828 call 7.5's algebras "§3.1 at L=ℤ^d".
- CompactQuantumMetricSpaces (#1155) consumes it from HeisenbergImprimitivity §3.1 (README lines 94–95). It takes from K7.5 only point-norm continuity of the gauge action (line 103).

**Why OperatorAlgebraDynamics owns it.** It is on main, earlier than this roadmap, and it already supplies K7's crossed products. Its D2.CentralTwists (README lines 1500–1518 at b15a0d4) proves, for scalar ω on a discrete abelian G:
- the faithful tracial state τ=E;
- the gauge action `α̂_γ(u_s)=γ(s)u_s`, implemented by `M_γ`;
- its point-norm continuity;
- `∫α̂_γ=E(·)1`;
- full=reduced for amenable G.

Its unitaries `V_sξ(r)=ω(s,s⁻¹r)ξ(s⁻¹r)` give `V_xδ_y=ω(x,y)δ_(x+y)`, which is 7.5's W_x. OperatorAlgebraDynamics cannot consume the object from this later roadmap without creating a cycle. So 7.5 must consume it.

**Repair.**
1. In 7.5, replace lines 1829–1838 with a consumption sentence, and delete the first five bullets of 7.5 (lines 1846–1859). The consumed objects are:
   - C*(L,c), its projective unitaries `W_xδ_z=c(x,z)δ_(x+z)` and the trace `τ=⟨δ_0,·δ_0⟩`;
   - the gauge action `α_χ=Ad(M_χ)` with its point-norm continuity, and Fourier-coefficient uniqueness;
   - the universal property and `C*(L,c)=C*_r(L,c)`.

   They come from OperatorAlgebraDynamics D1.CentralTwists and D2.CentralTwists at A=ℂ, trivial action, ω=c and counting measure.
2. Keep everything else in 7.5:
   - ρ, C_ρ, κ_x and H_ρ, Q and the annihilator comparison;
   - the centre and the simplicity criterion;
   - the identification of A_θ with C*(ℤ²,c), and the rational and irrational consequences;
   - all the Checks.

   Point-norm continuity of the gauge action is then D2.CentralTwists'. CompactQuantumMetricSpaces line 103 must follow that change. Its repair is for that pull request.
3. Add a contract "From TauCetiRoadmap.OperatorAlgebraDynamics: D1.CentralTwists, D2.CentralTwists". Replace `TauCeti.Amenable.of_commGroup` and `TauCeti.TwistedMonoidAlgebra.lift`/`algHom_ext` in 7.5's *Needs* (lines 1818–1823) with that contract. The contract cites an id that only an open revision defines, so name OperatorAlgebraDynamics #1137 in the description's merge-order paragraph.
4. Rewrite Scope lines 22–26: "OperatorAlgebraDynamics owns the scalar twisted group C*-algebras `C*(L,c)`; 7.5 proves their centre and simplicity criterion."
5. Delete the Downstream-consumers bullet at lines 2327–2330. Those algebras are not this roadmap's.
6. Update the Suggested.lean docstring's K7 bullet (lines 36–43). It should say that the twisted group C*-algebra is a carrier of the OperatorAlgebraDynamics roadmap, not that 7.5 builds it.

**Test.** With the consumed objects, 7.5's own Checks evaluate unchanged:
- The rotation cocycle `c((m,n),(m′,n′))=e(θnm′)` gives `V_(0,1)V_(1,0)=e(θ)V_(1,1)` and `V_(1,0)V_(0,1)=V_(1,1)`, so `uv=e(θ)vu`.
- `ρ=e(θ(nm′−n′m))` gives C_ρ=qℤ² for θ=p/q and C_ρ=0 for irrational θ.
- On (ℤ/2)² with `c=(−1)^(x₂y₁)`, `ρ((1,0),(0,1))=−1` leaves C_ρ=0, and the algebra is M₂(ℂ). D2.CentralTwists' own (ℤ/2)² Check (line 1560) also gets M₂(ℂ).

Nothing is constructed twice.

## R02 (P3) — 9.1 defines asymptotic morphisms only between separable algebras

**Location.** `TauCetiRoadmap/OperatorKTheory/README.md` line 2182: "For separable C*-algebras A,B define an asymptotic morphism (Blackadar, Definition 25.1.1)".

**Claim.** The definition is stated at its source's generality.

**Witness.**
- Blackadar1998 line 11272 (Definition 25.1.1) is stated for arbitrary C*-algebras A and B.
- None of 9.1's bullets uses separability (asymptotic contractivity, the *-homomorphism into `B_∞`, the equivalence relations, functoriality).
- 9.2's selection does not use it either. Separability enters only with 9.3's countable dense sets.

**Repair.**
- In 9.1, write "For C*-algebras A,B define an asymptotic morphism".
- Open 9.3 with "For separable A and B and uniform representatives φ:A→B and ψ:B→C of 9.2". 9.4–9.5 already say separable.

**Test.** For the nonseparable B(H), `φ_t=(1+1/t)id` has multiplicativity defect `−(1/t)(1+1/t)ab→0`. It is an asymptotic morphism by 9.1's own first Check, yet the current wording excludes it. After the repair it is admitted, and composition (9.3) still assumes separability.

## Verified sound

**Gate and direction.**
- The worker's `gate.md` passes every check.
- My full-gate rerun prints only `depcheck=1` with `UPWARD: OperatorKTheory (#9) -> AlgebraicKTheory (#15)`. That line uses the live order, before the move.
- The brief's `--movable` check against the moved order prints `depcheck: 244 roadmaps, 2464 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- The diff of the pull request outside the folder is empty.
- `roadmaps overlaps` reports no dropped ids and no other pull request changing this roadmap.

**Elaboration and signatures.**
- `lake env lean TauCetiRoadmap/OperatorKTheory/Suggested.lean` gives exactly three `declaration uses 'sorry'` warnings (lines 63, 92 and 106).
- In a scratch copy I ran `#check @` on all five declarations. Each matches `signatures.md` and its README statement (4.1, 8.4):
  - Atkinson keeps `[CompleteSpace H₀]` and `[CompleteSpace H₁]`;
  - both BDF theorems keep `[CompleteSpace H] [SeparableSpace H]`;
  - `essentialSpectrum` drops `[CompleteSpace H]`, which `IsFredholm` does not need, so the lead is harmless.
- One-tactic probe (`first | rfl | simp | simp_all | infer_instance | trivial | tauto | aesop | exact?`) on the Atkinson statement: the goal stays open. The two BDF theorems were probed last round and are unchanged.

**Headline theorems.**
- The Summary (lines 9–14) lists ten headline theorems:
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
- Atkinson (parametrix form) and both BDF statements are stated. The docstring names the missing carrier for each of the others (K1–K9 bullets).
- I confirmed each named carrier absent at the pins. There is:
  - no Calkin algebra, essential spectrum or `Atkinson` in Mathlib or Tau Ceti (grep over both);
  - no reduced crossed product file under `TauCeti/Analysis/CStarAlgebra/Action/CrossedProduct/` (`ApproximateUnit`, `Full`, `Functoriality`, `Multiplier`);
  - no spatial C*-tensor product, Cuntz algebra or asymptotic algebra;
  - no adjointable operators on Mathlib's `CStarModule` (`Module/` has `Defs`, `Constructions`, `Synonym`).
- No compact-parametrix Fredholm criterion exists at the pins:
  - Mathlib's `isFredholm_iff_exists_isQuasiInverse` (`Fredholm/Basic.lean` line 368) works modulo finite range (`FiniteRange.lean` line 328);
  - Tau Ceti's Fredholm files hold only perturbation, criteria and adjoint lemmas.
- So the new theorem duplicates nothing. IndexTheory (#1077, 6a51fc7) lines 49 and 277 consume it by this exact Lean name.

**Library declarations.**
- 39 cited library names elaborated with `#check` at the pins, with 0 errors. Among them:
  - Tau Ceti: `TauCeti.Amenable.of_commGroup` (needs only `IsTopologicalGroup`), `FullCrossedProduct`, `.of`, `.lift` (bound `‖ρ f‖ ≤ fullSeminorm f`), `CovariantRepresentation.integratedFull` and `.regular`;
  - Tau Ceti: `IsFactorSet`, `twistedTranslation`, `twistedMonoidAlgebra`, `TwistedMonoidAlgebra.lift` (`u 1 = 1`, `u g * u h = α g h • u (g*h)`) and `.algHom_ext`;
  - Tau Ceti: `isFredholm_one_sub`, `IsFredholm.add_of_isCompactOperator`, `index_add_of_isCompactOperator`, `Path.index_eq` and `Continuous.isLocallyConstant_index`;
  - Mathlib: `IsFredholm.index_comp`, `index_continuousOn_isFredholm`, `FredholmPackage`, `LinearMap.index`, `Unitary.joined` and `Unitary.mem_pathComponentOne_iff`;
  - Mathlib: `CompletelyPositiveMap`, `NonlinearRightInverse`, `exists_nonlinearRightInverse_of_surjective`, `LowerHemicontinuous.exists_continuous_selection` and `LocallyConstant.freeOfProfinite`;
  - Mathlib: `SimpleGraph.mulCayley`, `SimpleGraph.IsTree`, `FreeGroup.toWord`, `ShortExact.extClass`, `CategoryTheory.Tor`, `PontryaginDual`, `lp.single`, `lp.hasSum_single`, `CStarMatrix.conjTranspose` and `IsStarProjection`.
- Read at source:
  - `ContinuousLinearMap.IsFredholm` (`Fredholm/Basic.lean` lines 123–128: strict map, closed range, finite kernel, CoFG range, complemented kernel). All of these are automatic on Hilbert spaces, so the Atkinson statement is the textbook one.
  - `TauCeti.Mean` (`Amenable/Mean.lean` line 61: real-valued, on `UCB G`). This matches lines 177–181.

**Cross-roadmap citations resolved.**
- CStarAlgebras (head 33ddcef): C1.4 (line 380), C1.6 (435), C1.7 (468), C5.1–C5.5 (1112–1230), C6–C7 (1272–1545), C8.2 (1617), C8.4 Toeplitz (1676) and C9.2 (1737).
- HilbertModules (head bbc2ad5): H1–H7 (lines 126–762).
- AlgebraicKTheory (head 7c414ba): 0.1 (87), 0.3 (123), 0.4 (141), A1 (219), A2 (293), A6 (563) and A8 (679).
- On main (3b3f7ef):
  - OperatorAlgebraDynamics D1 (75; `ℂ⋊G≃C*(G)` at 138), D2 (143; expectation 168, absorption 189), D3 (205), D4 (254) and D6 (358; O_n at 457);
  - VonNeumannAlgebras Layer 0 (275) and Layer 11's Pontryagin layer (3150);
  - BanachAlgebras 1.2 (255) and Layer 2 (440);
  - TopologicalKTheory T1–T7 (163–1148) and FactorRigidity Layer 4 (415).
- Essential spectrum also appears in OperatorTheory/UnboundedOperators (#1027) §3.2, for unbounded operators. 8.4's bounded-operator predicate is only the definition BDF needs, so the two do not collide.

**Sources read at their locators (seeded sample).**
- 1.4:
  - Blackadar1998 1.7.2 (line 723);
  - Proposition 4.6.2 (line 1337): `p=ee*r` with `ep=p`, `pe=e`, as in line 425;
  - Proposition 4.6.4 (line 1352: algebraic implies Murray–von Neumann equivalence by polar decomposition);
  - Roe2017 Lemma 2.13 (line 330).
- 2.4: Blackadar1998 Definition 3.1.1 (line 1003: holomorphic calculus closure at every matrix size, as in lines 625–627) and Proposition 3.4.3 with Corollary 3.4.4 (lines 1153–1162: exponentials generate `GL_0`, lifting).
- 3.1:
  - Definition 9.1.1 (line 2996: `β_A([e]−[p_n])=[f_e f_(p_n)⁻¹]`);
  - Theorem 9.2.1 (line 3008, arbitrary A), with the polynomial, linear and idempotent loop steps of 9.2.5–9.2.9;
  - 9.3.2 (line 3171: `∂([e]−[p_n])=[exp(2πix)]`).
- 3.5: Roe2017 Theorem 14.5 (line 2533, unitizations in the nonunital case), Corollary 14.7 with its proof (lines 2548–2573; p. 66 statement, p. 67 proof) and Lemma 16.3 (line 2970).
- 4.1: Zois2010 Definition 4 and Theorem 1, p. 59 (lines 1646–1659; two Hilbert spaces); Blackadar1998 8.3.2 (line 2934); Roe2017 Exercise 7.13 (line 1269).
- 4.2: Blackadar1998 Proposition 12.2.1 and Corollary 12.2.3 (lines 4632 and 4664); Roe2017 Lemmas 12.6–12.8 (lines 2068–2090), Proposition 12.15 (2178) and Theorem 12.16 (2191).
- 4.5 (with 4.4):
  - Definitions 15.2.1, 15.6.1 and 15.6.3 and Examples 15.3.2 (lines 5376, 5546, 5564 and 5407);
  - Theorem 15.7.1 (line 5662: A separable; the unital case lifts by a not necessarily unital CP contraction, as in line 1086);
  - Corollary 15.8.4 (line 5733).
- 5.5: Definition 17.11.1, Proposition 17.11.3 and Theorem 17.11.4 (lines 7140–7216).
  - 5.5 asks for a dense graded *-subalgebra preserving Dom(D), which is stronger than 17.11.1's dense set.
  - The proof of 17.11.4 gives `φ(a_j)Dom D⊆Dom D` with bounded commutators for a total sequence (Lemma 17.11.5(ii)), which yields the stronger form.
- 6.3: Definition 19.1.1 and Examples 19.1.2 (lines 8257–8285); Definition 22.1.1 ((CP) is split exactness for additive targets, line 9798), Theorem 22.2.1 (9859) and Corollary 22.3.1 (9884).
- 6.5: ManuilovThomsen2005:
  - abstract (lines 8–12: A, B separable, A unital, B stable);
  - lines 37–38 (`Ext⁻¹=KK(A,SB)`);
  - Lemma 2 on p. 4 (line 161) and Theorem 3 on p. 5 (line 257; page 5 starts at line 237);
  - the cycle translates term by term into lines 1409–1410.
- 7.1:
  - Definitions 20.1.1, 20.1.2 (with the G-continuity remark at line 9021), 20.2.1 and 20.2.2;
  - Theorem 20.1.5 (line 9060), Theorem 20.3.1 (9120) and Theorem 20.2.7(a) (9112);
  - the conditions in lines 1499–1501 match Definition 20.2.1 condition by condition.
- 7.4: Theorem 10.2.1 (line 3370, every A), Theorems 10.10.4–10.10.5 (lines 3909–3923; printed p. 85) and Exercise 10.11.6(a)–(e) (lines 4016–4035; printed pp. 87–88).
- 8.1: Definition 22.3.4 (line 9924: (N1)–(N4)).
- 8.5: Theorem 23.1.3 (line 10169: A∈N, B arbitrary, torsion-free gives isomorphism).
- 9.1: Definition 25.1.1 (line 11272). See R02.
- Also read for 3.3: Schochet1984 Theorem 4.5 (line 875), Proposition 4.5 (line 823) and Blackadar1998's remark after Theorem 21.2.2 (line 9578).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.4 projective modules (sample) | ℂ; e=[[1,1],[0,0]]; B(H); ℂ→M₂ | `z=1+(e−e*)(e*−e)=2`, `p=ee*/2=diag(1,0)`, `ep=p`, `pe=e`, so `eℂ²=pℂ²≅ℂ`; A²≅A gives [A]=0=K₀(B(H)); [1]↦[1_(M₂)]=2[e₁₁] and [ℂ]↦[M₂]=2[e₁₁M₂] | holds | none |
| 1.5 trace pairing (changed) | φ:ℂ→ℂ²; C₀(ℝ²), Bott; K | τ∘φ=0, `(τ∘φ)_*[1]=0=τ(1,0)`; `τ⁺₂(p)−1=1−1=0=τ₂(p−p(∞))`, and without −n both β and `[p(∞)]−[p(∞)]` give 1; `Nτ(e₀₀)≤‖τ‖` for all N, so τ=0 on K | holds | none |
| 2.3 CAR limit | M_(2^∞) | `τ_k(e)=2^(−k)`, `τ_(k+1)(diag(e,e))=2/2^(k+1)=2^(−k)`; limit ℤ[1/2]⊂ℝ | holds | none |
| 2.4 local normed (sample) | ℂ; g=1/10; ℂ[z]; 0 | GL₁(ℂ) connected, so trivial; `|g−1|=0.9`, `|g⁻¹−1|=9`; `(z−2)⁻¹=−Σzⁿ/2^(n+1)` not polynomial; GL_n(0) trivial | holds | none |
| 3.1 Bott map (headline, sample) | H(r,s) edges; A=ℂ; M | r=0: `exp(2πi(se+(1−s)p))`; r=1: `f_e(s)f_p(s)⁻¹`; s=0: `exp(2πip)=1`; s=1: `exp(2πie)=1`; scalar part `exp(2πip(s+(1−r)(1−s)+r(1−s)))=1`; winding of b_ℂ[1] is +1; `M²=(1+|z|²)M` | holds | none |
| 3.2 six-term (headline) | Toeplitz; B(H)→Q(H) | `δ₁[z]=[1−S*S]−[1−SS*]=0−1=−1=index S`; K₁(Q(H))≅ℤ | holds | none |
| 3.5 Fréchet (sample) | C¹(𝕋); 2+z | `‖(fg)′‖≤‖f′‖‖g‖+‖f‖‖g′‖`, so C=1; `1/(2+z)` has all Fourier modes n≥0 | holds | none |
| 4.1 Atkinson, Lean (headline, sample, changed) | shift S; Vδₙ=δ₂ₙ; 0 on ℓ²; 0:{0}→ℂⁿ; ℓ²→{0}; dim<∞ | `S*S−1=0`, `SS*−1=−e₀₀`: both sides true, index −1; `VV*−1=−P_odd` not compact, coker infinite: both false; `S0−1=−1` not compact: both false; S=0 gives 0 on {0} and −1 on ℂⁿ, index −n: both true; ker ℓ² and `S0−1=−1`: both false; finite dimension: both true | holds; probe open | none |
| 4.2 module index (headline, sample) | [[0,S*],[S,0]]; swap on ℂ^(1\|1) | `F²−1=diag(0,−e₀₀)`, index 0−1=−1; F²=1, index 0 | holds | none |
| 4.5 Ext (headline, sample) | Toeplitz; (M_n,K); C(X) | a *-homomorphic lift would give index 0 against −1, so nonsplit; ordinary class 0 against unital ℤ/n; the inverse sends z to [S*], index +1 | holds | none |
| 5.4 degrees (changed) | K(ℓ²(ℝ)); x=−cot πt | not σ-unital, so excluded in 5.2, 5.4 and 6.4; `(x−i)/(x+i)=e^(2πit)` | holds | none |
| 5.5 unbounded cycles (sample) | −i d/dx; D=0 on ℂ^(1\|0); D=0 on H infinite | `F²−1=−(1+ξ²)⁻¹`; F=0 is class 1; `(1+D²)⁻¹=1` not compact | holds | none |
| 6.2 Kasparov product (headline) | 1_D; [f]⊗[g]; two odd classes | x⊗1_D=x; [g∘f]; `(−1)^(1·1)=−1` | holds | none |
| 6.3 KK category (sample) | (λ1, λ(1−e₀₀)); degenerate; corners | difference `(0,e₀₀)`, giving [e₀₀]=1 and −1 when swapped; `s₀=s₁` gives 0; rank one gives 1, rank two gives 2 | holds | none |
| 6.4 semisplit (changed) | Toeplitz; split; cone | [z]⊗δ=−1; 0; generator of KK₁(ℂ,Sℂ) | holds | none |
| 6.5 Manuilov–Thomsen (sample) | (M_n,K); (ℂ,J); (C(𝕋),K) | ℤ→ℤ multiplication by n and KK₁=0, so U=ℤ/n; identities, so U=0; ev onto and K₁(K)=0, so U≅ℤ | holds | none |
| 6.6 index pairing (changed) | [P,u]; PuP; Pu*P | `[P,u]δ_(−1)=δ_0`, all others 0; index −1; index +1 | holds | none |
| 7.1 equivariant KK (sample) | trivial G; L²(G); C(𝕋) rotation; x_k, y_k | KK_G=KK; `(0²−1)φ(1)=−1` not compact; `β_g(ξ)β_g(b)≠β_g(ξ)b`; `y_k−x_k=π/(x_k+y_k)→0` with M(x_k)→0 and M(y_k)→1 | holds | none |
| 7.2 Green–Julg (headline) | p_G; trivial G; ℤ/2 on ℂ | `(1∗1)(t)=∫1=1`; p_G=1; R(ℤ/2)=ℤ²=K₀(ℂ²), degree one 0 | holds | none |
| 7.3 free groups (headline) | Γ_n; n=0,1; m≠n | `g_nΓ_n=Γ_n∖{1}`; (ℤ,0) and (ℤ,ℤ); ℚ-rank of K₁ is m against n | holds | none |
| 7.4 PV and rotation (headline, sample) | UaU*=α(a); θ=1/2; θ=p/q | `(1−α⁻¹)(−α)=1−α`; `uvu*=v(e(θ)·)=e(θ)v`; ℤ+½ℤ=½ℤ, so not injective on ℤ²; ℤ+(p/q)ℤ=(1/q)ℤ | holds | none |
| 7.5 twisted centres (R01) | OAD V_x; rotation; (ℤ/2)²; L=0 | `V_xδ_y=c(x,y)δ_(x+y)=W_xδ_y`; C_ρ=qℤ² and 0; ρ((1,0),(0,1))=−1, so C_ρ=0 and the algebra is M₂(ℂ); radical of c is {0,(1,0)}; ℂ is simple | mathematics holds; three owners | R01 |
| 7.6 Cuntz (headline) | n=1,2,3 | vacuum class (1−n)[1]; ℤ/0=ℤ; K₀(O₂)=0; K₀(O₃)=ℤ/2 | holds | none |
| 7.7 Connes–Thom (headline) | u=(x+i)/(x−i) | arg u=2arg(x+i) runs from 2π to 0, winding −1 | holds | none |
| 8.1 bootstrap (sample) | 0; Sℂ; B(H) | 0→ℂ→ℂ→0→0; Cℂ is KK-equivalent to 0; B(H) not separable | holds | none |
| 8.3 UCT (headline) | A=ℂ; (O_n,ℂ) | Ext terms 0; KK₀=0, KK₁=Ext¹(ℤ/(n−1),ℤ)=ℤ/(n−1) | holds | none |
| 8.4 BDF, Lean (headline) | S; S⊕S*; S⊗1_∞; dim<∞ | `S*S−SS*=e₀₀`, index −1 inside 𝕋; −1+1=0; `e₀₀⊗1` not compact, so the hypothesis excludes it; σ_e=∅ and both sides true | holds | none |
| 8.5 Künneth (headline, sample) | O₃⊗O₃; A_θ⊗A_θ′; C(𝕋)⊗B | K₀=ℤ/2⊗ℤ/2=ℤ/2, K₁=Tor=ℤ/2; ℤ⁴⊕ℤ⁴=ℤ⁸; free, so the product is an isomorphism | holds | none |
| 9.1 asymptotic morphisms (sample) | (1+1/t)φ; 2a on ℂ; (1+1/t)id on B(H) | defect `−(1/t)(1+1/t)φ(ab)→0`; defect −2 for all t; asymptotic morphism of a nonseparable algebra, excluded by line 2182 | holds; narrowed | R02 |
| 9.5 E-theory (headline) | (O_n,ℂ) | E₀=KK₀=0, E₁=KK₁=ℤ/(n−1) | holds | none |

## Not verifiable

- Slawny1972 is recorded as uncertified (paywalled). It is cited only through Phillips2006 Theorem 1.9.
- I did not reread Cuntz1981, PimsnerVoiculescu1982, Julg2013, Messerschmidt2016, Phillips2006 or StacksProject this round. They are outside the seeded sample, and the README flags no locator as unverified.
- Ownership against open pull requests was checked:
  - through the sibling heads the brief provides (OperatorAlgebraDynamics #1137 and #1097, HeisenbergImprimitivity #1149, CompactQuantumMetricSpaces #1155, IndexTheory #1077, OperatorTheory #1027, CStarAlgebras #860, HilbertModules #861, AlgebraicKTheory #1142);
  - through `roadmaps grep` over all open heads for `C*(L,c)`, Atkinson, `essentialSpectrum` and `IsEssentiallyNormal`.

## Source issues

- **Misprint** in Zois2010 at Analytic K-theory Lecture 1, Theorem 1, p. 59: the proof of a⇒b names the inverse of T as a map from Im T to (Im T)^⊥; it should be a map from Im T to (Ker T)^⊥; affects nothing.
- **Error** in Blackadar1998 at the remark after Theorem 21.2.2, p. 220: the source says the surjectivity hypotheses on f₁ and f₂ may be removed, citing Schochet 4.5; it should say only one may be removed, since Schochet's Theorem 4.5 keeps f₁ surjective; affects nothing.
- **Misprint** in Schochet1984 at §4, pp. 428 and 431: a proposition (all maps surjective) and a theorem (one map surjective) both carry the number 4.5; the theorem should have its own number; affects nothing.
- **Misprint** in ManuilovThomsen2005 at display (1), p. 1: the text announces the sum ϕ⊕ψ but the display defines ψ⊕ϕ with ψ in the V₁ corner; the announced and displayed orders should agree; affects nothing.
