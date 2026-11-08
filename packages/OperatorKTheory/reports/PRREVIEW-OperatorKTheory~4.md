# Review of OperatorKTheory (pull request #866 at 5dbc4ac)

**Verdict:** needs changes

Nothing blocks. The five findings below are all P3:
- one duplication of Tau Ceti objects (R01);
- one notation clash that hides a degree shift (R02);
- one forward dependency (R03);
- one over-broad supplier citation (R04);
- one missing locator (R05).

The worker's gate passes. `Suggested.lean` elaborates with two `sorry` warnings and nothing else. All five findings of the previous review are repaired.

## Status of the previous review's findings (head c0a811d)

- **R01 (7.1 drops the G-continuity hypothesis): repaired.**
  - Lines 1398–1402 now read "If A₁, A₂ and Δ consist of G-continuous elements of M(J), meaning that `g↦g(x)` is norm continuous, then the elements M and N of 6.1 can be chosen even and G-continuous".
  - Lines 1417–1423 add the translation counterexample as a negative-control Check.
  - Blackadar1998 line 9062 (Theorem 20.1.5, p. 206) states the hypothesis, and line 9066 gives the G-invariant choice for compact G.
- **R02 (Proj(A) re-defined; comparison missing): repaired.**
  - Lines 361–366 now read "use AlgebraicKTheory 0.1's Proj(A), the full subcategory `TauCeti.finiteProjectiveModules Aᵐᵒᵖ` … No other module category is constructed here".
  - Lines 377–381 add the K₀ comparison with 0.3.
  - Lines 140–143 and 218–224 add the supplier contracts.
  - The converse in lines 375–376 takes x=v*, y=v. These satisfy all six conditions of AlgebraicKTheory 0.4 (head fe5ca28, README line 143), including ex=x=xf and fy=y=ye, because v is a partial isometry.
- **R03 (Needs lines of 4.3 and 7.3): repaired.**
  - Line 890 now reads "*Needs:* HilbertModules H1–H4; CStarAlgebras C1.7 multipliers and strict topology; Mathlib `CompletelyPositiveMap`."
  - Lines 1476–1482 split 7.3 into a tree-interface line (Mathlib only) and a KK/PV line.
- **R04 (three locators): repaired.**
  - Line 1917 reads "(Blackadar, Theorem 23.1.1, p. 233)".
  - Lines 1674–1676 read "(Blackadar, Exercise 10.11.6(b), pp. 87–88, for irrational θ; …)", and lines 1687–1688 cite the Powers–Rieffel remark.
  - Line 2149 reads "(Blackadar, Theorem 25.6.3, p. 278)".
- **R05 (title; API as prose): repaired.**
  - Line 1 is `# Roadmap: operator K-theory, extensions, and KK-theory`.
  - All 24 subsections the previous review listed now give their API as bullets.
  - Ten subsections keep prose only: 1.6, 2.3, 4.1, 5.3, 6.1, 6.5, 8.2, 8.5, 9.2 and 9.5. Apart from 6.5, each of these states theorems rather than a new definition. 6.5 is covered by R02's repair.

## R01 (P3) — 7.5 restates Tau Ceti's factor sets and twisted translations instead of citing them

**Location.** `TauCetiRoadmap/OperatorKTheory/README.md` lines 1709–1711: "let c be a normalized circle-valued 2-cocycle on L: `c(x,y)c(x+y,z)=c(x,y+z)c(y,z)` and `c(0,x)=c(x,0)=1`. On `lp (fun _ : L => ℂ) 2` define the twisted shifts `W_xδ_z=c(x,z)δ_(x+z)`". The universal-property bullet is at lines 1725–1729. `Suggested.lean` lines 35–36 say that Mathlib has "no group C*-algebra, twisted or not".

**Claim.** The roadmap defines the normalized cocycle condition, the twisted shift operators and their span itself. "From Tau Ceti" (lines 136–156) names no twisted-algebra declaration.

**Witness.** The pinned `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean` already provides:
- `TauCeti.IsFactorSet` (line 99): the same cocycle identity, normalized at 1;
- `TauCeti.twistedTranslation` (line 238): the basis vector at h goes to α g h times the basis vector at g·h, which is W_x on finitely supported vectors;
- `TauCeti.twistedMonoidAlgebra` (line 288);
- `TauCeti.TwistedMonoidAlgebra.lift` (line 397).

**Repair.**
1. In 7.5, take c to be a `TauCeti.IsFactorSet` on `Multiplicative L` with values in ℂˣ, plus the condition |c|=1.
2. Define W_x as the bounded extension to ℓ²(L) of `TauCeti.twistedTranslation ℂ c x`.
3. Define C*(L,c) as the norm closure of the image of `TauCeti.twistedMonoidAlgebra ℂ L c`.
4. Derive the universal-property bullet by extending `TauCeti.TwistedMonoidAlgebra.lift` from this dense subalgebra.
5. Add these four names to "From Tau Ceti". Optionally also add `Matrix.fromBlocks_one_sub_mul_fromBlocks_mul_fromBlocks_one_sub_of_mul_eq` (`TauCeti/Data/Matrix/Block.lean`, line 86), the stabilized conjugacy behind 1.1's last bullet.
6. In the docstring's K7 item, write: "Tau Ceti has the algebraic twisted group algebra `TauCeti.twistedMonoidAlgebra`, but neither library has its C*-completion".

**Test.** Tau Ceti's file header records `twistedTranslation g * twistedTranslation h = α g h • twistedTranslation (g*h)`, which is exactly the README's `W_xW_y=c(x,y)W_(x+y)`. For the rotation cocycle at x=(0,1), y=(1,0), both sides give `exp(2πiθ)`. This agrees with Tau Ceti's `SmoothNoncommutativeTorus.twist`, which is `𝐞(θ·y₂·z₁)`.

## R02 (P3) — 6.5's E(A,J) collides with K9's E-theory, and the two differ by a degree shift

**Location.** README lines 1301–1302: "Write U(A,J) for invertible strong unital stable extension classes and E(A,J) for ordinary invertible classes." 9.4 (line 2118) defines `E(A,B)=[[SA,SB⊗K]]`.

**Claim.** One symbol, E(A,J), names two groups.

**Witness.** Take A=ℂ, J=K.
- The 6.5 meaning is Ext⁻¹(ℂ,K)=KK₁(ℂ,K)=K₁(K)=0 (ManuilovThomsen2005 lines 37–38).
- The K9 meaning gives E(ℂ,K)≅K₀(K)=ℤ (9.4, first Check).

The 6.5 symbol is never used again.

**Repair.**
- Delete "and E(A,J) for ordinary invertible classes", or write `Ext⁻¹(A,J)≅KK₁(A,J)`.
- While editing 6.5, put its facts into bullets: the exactness of the cycle, the kernel K₀(J)/im of the unit evaluation, the image ker(KK₁→K₁), the absence of a nuclearity hypothesis, and the C(X) corollary.

**Test.** With the symbol gone, A=ℂ, J=K gives only U(ℂ,K)=0 and E(ℂ,K)≅ℤ, with no conflicting reading.

## R03 (P3) — 1.5 asserts continuity of the trace pairing under inductive limits, which needs K2.3

**Location.** README lines 416–418: "The trace pairing is … compatible with *-homomorphisms along which the tracial states pull back, and continuous under C*-inductive limits with compatible tracial states." The *Needs:* line at 401 is "1.2–1.3; Mathlib `Matrix.trace`."

**Claim.** K1 proves this continuity.

**Witness.**
- The statement needs K₀(lim Aᵢ)≅lim K₀(Aᵢ), which is proved only in 2.3 (line 521, "Prove continuity of K₀ and K₁ for C*-inductive systems").
- Without it, the clause only repeats naturality, which the same bullet already states.
- CStarClassification (head of its pull request, line 384) needs exactly this continuity for AF limits.

**Repair.** Delete the clause from 1.5. Add a bullet to 2.3: "For A=lim Aᵢ and a tracial state τ of A with τᵢ=τ∘φ_(i,∞), the pairing of τ on K₀(A) is determined by the pairings of the τᵢ through `K₀(A)≅lim K₀(Aᵢ)`."

**Test.** Take the CAR algebra M_(2^∞) with its trace. The class of a rank-one projection of M_(2^k) pairs to 2^(−k) at every later stage, so its image in K₀(M_(2^∞)) pairs to 2^(−k). Identifying the limit group ℤ[1/2] needs 2.3.

## R04 (P3) — "CStarAlgebras C1–C2" is cited for functional calculus, which C2 does not supply

**Location.**
- Line 160: "*CStarAlgebras C1–C2.* Ideals, quotients and functional calculus".
- Lines 262–263: "CStarAlgebras C1–C2 functional calculus".
- Line 454: "CStarAlgebras C1–C2 and C9.2".

**Claim.** CStarAlgebras Layer 2 supplies ideals, quotients or functional calculus.

**Witness.** At the CStarAlgebras head (33ddcef):
- Layer 2 (README line 538) covers irreducible representations, primitive ideals and the bidual.
- Quotients and the membership of `cfcₙ f a` in ideals are in Layer 1 (line 328).

Nothing in this roadmap uses C2.

**Repair.** Replace "C1–C2" by "C1" at lines 160, 262 and 454.

**Test.** After the change, every cited CStarAlgebras section is used:
- C1: 1.1's functional calculus;
- C1.4: 6.1;
- C1.6: 4.1;
- C1.7: 4.3 and 4.4;
- C5: 2.3 and 3.4;
- C6–C8: 4.5 and 8.4;
- C9.2: 1.1.

## R05 (P3) — 3.5's sufficient condition for inverse closure has no locator

**Location.** README lines 800–802: "a dense *-subalgebra complete for a stronger Banach *-algebra norm satisfying `|||xy|||≤C(|||x|||‖y‖+‖x‖|||y|||)` for a fixed C is inverse-closed, by spectral-radius comparison."

**Claim.** This standard sufficient condition carries no source.

**Witness.** Roe2017 lines 2548–2553 (Corollary 14.7, p. 66) state exactly this hypothesis, with the constant C and the norm dominating ‖·‖, and conclude the K-theory isomorphism.

**Repair.** Append "(Roe, Corollary 14.7)".

**Test.** C¹(𝕋) with `|||f|||=‖f‖+‖f′‖` satisfies the inequality with C=1 (computed in the table). This matches the third Example of K3.

## Verified sound

**Gate and direction.**
- The worker's gate (gate.md) reports every check passing.
- My rerun of the full gate printed `depcheck=1` with `UPWARD: OperatorKTheory (#9) -> AlgebraicKTheory (#15)`. This is the moved case, not a defect:
  - with `--movable` against the live order the check prints `moved: AlgebraicKTheory moved in the merge order up before OperatorKTheory … depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`;
  - the brief's command against `merge-order-moved.txt` prints `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`.
- No UPWARD or CYCLE line remains.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The suppliers are all earlier in the merge order or on main. In the merge order: VonNeumannAlgebras (6), CStarAlgebras (8), HilbertModules (9) and AlgebraicKTheory (10). On main: OperatorAlgebraDynamics, BanachAlgebras, GrothendieckEulerForms and TopologicalKTheory.

**Elaboration, signatures and probes.**
- `lake env lean TauCetiRoadmap/OperatorKTheory/Suggested.lean` gives two `declaration uses 'sorry'` warnings (lines 68 and 82) and nothing else.
- I copied the declarations into a scratch file, because the `module` file exports nothing to an importer, and ran `#check @name` on all four. They match the README (8.4) and `signatures.md`:
  - both theorems carry `[CompleteSpace H] [TopologicalSpace.SeparableSpace H]`;
  - `essentialSpectrum` drops `[CompleteSpace H]`, which `IsFredholm` does not need.
- One-tactic probe (`first | rfl | simp | simp_all | infer_instance | trivial | tauto | aesop`) on both theorems: both fail with the goal unchanged, so there is no padding.
- A second scratch file elaborated `#check` for 51 cited library names. All exist at the pins, among them:
  - `Unitary.joined` (distance less than 2) and `Unitary.mem_pathComponentOne_iff`;
  - `ContinuousLinearMap.isFredholm_iff_exists_isQuasiInverse`, `ContinuousLinearMap.index_continuousOn_isFredholm` and `LinearMap.index`;
  - `CompletelyPositiveMap`, `ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective` and `LowerHemicontinuous.exists_continuous_selection`;
  - `LocallyConstant.freeOfProfinite`, `SimpleGraph.mulCayley`, `FreeGroup.toWord` and `CategoryTheory.ShortComplex.ShortExact.extClass`;
  - `TauCeti.SplitK0.mapEquiv` and `TauCeti.finiteProjectiveModules`;
  - `TauCeti.isFredholm_one_sub`, `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` and `ContinuousLinearMap.index_add_of_isCompactOperator`;
  - `Continuous.isLocallyConstant_index` and `Path.index_eq`.
- `TauCeti.IsPartialIsometry` has no built object file. I read it at source: `TauCeti/Algebra/Star/PartialIsometry.lean` lines 52, 71 and 78, with the namespace `TauCeti`.
- All 14 cited Mathlib file paths exist.

**Headline theorems.** The Summary lists ten end theorems:
1. Bott periodicity;
2. the six-term sequence;
3. Atkinson's theorem with the module index;
4. Ext(A,B) for separable nuclear A;
5. associativity of the Kasparov product;
6. Green–Julg, Pimsner–Voiculescu and Connes–Thom;
7. the free-group, rotation and Cuntz K-groups;
8. the UCT and Künneth sequences;
9. Brown–Douglas–Fillmore;
10. the universal property of E-theory.

Brown–Douglas–Fillmore is stated, in two forms. For each of the others the docstring names the missing carrier: K-groups, the spatial tensor product, module operators, Kasparov cycles, crossed products and the asymptotic algebra. I confirmed at the pins that Mathlib and Tau Ceti have no Calkin algebra, essential spectrum, Busby invariant, Kasparov cycle or asymptotic morphism. Tau Ceti's `SmoothNoncommutativeTorus` is the smooth algebra; this roadmap's scope leaves it to NoncommutativeGeometry (line 1693).

**Cross-roadmap citations resolved (31 supplier ids, 7 consumers).**
- CStarAlgebras (head 33ddcef):
  - C1.4 (line 380, `exists_quasicentral_approximateUnit`);
  - C1.6 (line 435; simple for separable infinite-dimensional H, zero quotient for finite-dimensional H);
  - C1.7 (line 468);
  - C5.4 (line 1203, the universal unitary algebra) and C5.5 (line 1230);
  - C6, C7 (C7.2 at line 1488) and C8.2 (line 1617);
  - C8.4 (line 1676, the Toeplitz extension);
  - C9.2 (line 1737, with the √2 bound at line 1764).
- HilbertModules (head bbc2ad5):
  - H1 (line 162, `H_A=ℓ²(ℕ,A)`);
  - H2 (lines 202–214: `L_A(E)≅M(K_A(E))` and `L_A(H⊗A)≅M(K(H)⊗min A)`);
  - H4 stabilization (line 337);
  - H5's section-module comparison over compact X (lines 421–424);
  - H6's bounded transform (line 725) and H7 (line 762).
- AlgebraicKTheory (head fe5ca28):
  - 0.1 (line 87), 0.3 (line 123) and 0.4 (line 141, with the side conditions);
  - A1, A2, A6 and A8 (lines 218, 292, 561 and 677).
  - Its Scope (line 17) assigns the comparison that 1.4 now makes.
- On main (eaf17b1):
  - OperatorAlgebraDynamics D1–D4 (lines 75–254) and D6 (line 457, "D6 owns the universal unital C*-algebra O_n");
  - BanachAlgebras 1.2 (line 255) and Layer 2 (line 440);
  - GrothendieckEulerForms Layers 1–2 (lines 215 and 238);
  - TopologicalKTheory T1–T7 (lines 163–1148). Line 159 says "Koszul symbol is conjugate z, so its compact-support class is −β", matching Conventions;
  - VonNeumannAlgebras V0 (Gelfand–Naimark, line 298) and V11 (Pontryagin layer, line 3150).
- The open revisions #1137 and #1097 (OperatorAlgebraDynamics), #1781 (TopologicalKTheory) and #1041 (VonNeumannAlgebras) keep these ids.
- Consumers on main cite existing ids:
  - NoncommutativeGeometry (lines 57 and 605);
  - FreeProbability (lines 79, 308 and 406);
  - OperatorTheory (line 68) and ToeplitzOperators (line 27; the anchor `#k4-fredholm-indices-and-extensions` resolves);
  - SeibergWittenTheory (line 23), GeneralizedCohomology (line 1820) and FactorRigidity (line 988).
- Not a finding here: CStarClassification (open, lines 384 and 445) cites "OperatorKTheory K3 (continuity)". Continuity has always been in K2.3 at every head of this pull request, so the slip is CStarClassification's own.

**Ownership by object.** `roadmaps grep` over main and the 472 open heads, for Brown–Douglas–Fillmore, essential spectrum, Bartle–Graves, Pimsner–Voiculescu, Kasparov product, asymptotic morphism, Green–Julg, Connes–Thom, Manuilov and Busby:
- CStarClassification consumes K9 (its line 54).
- OperatorTheory/UnboundedOperators (#1027, a revision) defines essential spectrum only for unbounded self-adjoint operators.
- No second owner was found. The only library duplication is R01.

**Sources read at their locators (the seeded sample).** Blackadar page numbers are the printed ones.
- 1.2: Blackadar1998 Definitions 5.1.1–5.1.2, p. 27 (line 1460), and Definition 5.3.1, p. 28 (line 1553). The latter includes the equality criterion with an extra orthogonal g, matching the README's r.
- 1.5: Blackadar1998 §6.3, p. 34 (line 1744; Proposition 6.3.3: stably finite gives an ordered group), and §6.9, p. 41 (line 2064; traces induce states).
- 2.1: Blackadar1998 Definition 8.1.1, Example 8.1.2(c) and Proposition 8.1.3, p. 59–60 (lines 2779–2812). The remark at line 2785 covers the unitary picture. Roe2017 Proposition 6.2(b) (line 1028).
- 2.2: Blackadar1998 8.1.5, p. 61 (line 2844), and Corollary 8.3.7, p. 64 (line 2974). Roe2017 Example 7.14 (line 1273): a rank-one corner gives stability.
- 3.1: Blackadar1998:
  - Definition 9.1.1, p. 64 (line 2996), with f_e(z)=ze+(1−e);
  - Theorem 9.2.1, p. 65 (line 3008);
  - 9.3.2, p. 68 (line 3171): `exp(2πix)` with a self-adjoint lift;
  - the Bott projection at line 3146, which equals the README's p(z), with β=[q]−[diag(1,0)].
- 4.2: Blackadar1998 Proposition 12.2.1 and Corollary 12.2.3, p. 104 (lines 4632 and 4664). Roe2017 Lemmas 12.6–12.8 and Proposition 12.15–Theorem 12.16 (lines 2068–2192). Roe's surjectivity step stabilizes onto Ĥ_A, which is countably generated only for σ-unital A, so the README's σ-unital hypothesis is needed for that route.
- 4.3: Blackadar1998 13.7.2, p. 113 (line 5019): A separable, B σ-unital, and the inner product `⟨x₁,φ(a₁*a₂)x₂⟩` (line 5028).
- 5.1: Blackadar1998 Definition 14.1.1 and Examples 14.1.2, pp. 114–115 (lines 5069 and 5098). Theorem 13.6.2, p. 112 (line 4976): E⊕H_B≅H_B with no σ-unital hypothesis.
- 6.5: ManuilovThomsen2005, abstract (A, B separable, A unital, B stable; lines 8–12), lines 37–38 (Ext⁻¹=KK(A,SB)), Lemma 2 (line 161) and Theorem 3 (line 257). The cycle K₀(B)→Ext⁻¹_unital(A,B)→Ext⁻¹(A,B)→K₁(B)→Ext⁻¹_unital(A,SB)→Ext⁻¹(A,SB)→K₀(B) translates term by term into the README's display. The map i₀* (line 251) is restriction along ℂ→A, as stated.
- 6.6: Blackadar1998 16.3.2, p. 138 (line 6023): ⟨τ,u⟩ = Index of the image of u, which is the README's PuP. §17.5 (line 6678).
- 7.4: Blackadar1998:
  - Theorem 10.2.1, p. 73 (line 3370), with horizontal maps 1−α_*;
  - Theorems 10.10.4–10.10.5, p. 85 (lines 3909 and 3918), which use no irrationality;
  - Exercise 10.11.6(b)–(d), pp. 87–88 (lines 4016–4029), and the Powers–Rieffel remark (line 4031).
- 7.5: Phillips2006 Notation 1.1, Remark 1.2, Lemma 1.5, Definition 1.6 and Theorem 1.9 (lines 87–171). The proof of Theorem 1.9 attributes the simplicity direction to "Theorem 3.7 of [37]", and line 1057 identifies [37] as Slawny, Comm. Math. Phys. 24 (1972).
- 8.2: StacksProject tags 00LO (line 7868), 00LT (Lemma 10.71.5, line 7945), 00LY (line 8201), 00LZ (Lemma 10.75.1, line 8208) and 00M3 (Lemma 10.75.5, line 8393). Each matches its cited use.
- 8.4: Blackadar1998 Theorem 16.2.1 and Corollaries 16.2.2–16.2.3, p. 136 (lines 5956–5974). They match the README's product over bounded components, both Lean statements and the third Check.
- 9.4: Blackadar1998 Definition 25.4.4, p. 269 (line 11650; E(A,B)=[[SA,SB⊗K]]), and Proposition 25.5.1, p. 270 (line 11663).

**Other locators opened.**
- Blackadar1998: 4.6.2, 4.6.4 (lines 1337 and 1352; ep=p and pe=e, as 1.4 uses them), 8.3.1–8.3.2, 10.3.1 (f(1)=α(f(0)), line 3426), 17.3.1 (KKⁿ=KK(A,B⊗̂Cₙ), line 6487), 17.6.5, 20.1.1–20.1.5 and 20.2.1, 23.1.1 (A, B separable, A∈N), 23.1.3 (A∈N, B arbitrary, line 10169), 25.1.1, 25.6.1 and 25.6.3.
- Roe2017: Lemma 2.13, Theorem 14.5 and Corollary 14.7, Lemma 16.3.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 nearby projections | p=diag(1,0), q at angle φ; e₀₀, e₁₁ in K | ‖p−q‖=sin φ; ‖u−1‖=2sin(φ/2)≤√2 sin φ ⇔ φ≤π/2; u=1−e₀₀−e₁₁+e₁₀−e₀₁ sends δ₀↦δ₁, δ₁↦−δ₀, eigenvalues ±i, ‖u−1‖=√2 | holds | R04 (supplier label) |
| 1.2 V(A), K₀ (sample) | v=(1 0); B(H); 0 | v*v=diag(1,0), vv*=1; [1]+[1]=[1] in V(B(H)), K₀=0; V(0)=0 | holds | none |
| 1.3 nonunital K₀ | ℂ⁺; C₀(ℝ²); K | ℂ⁺≅ℂ×ℂ, ker K₀(ε)=ℤ×0; V(C₀(ℝ²))=0, K₀=ℤ; [e₀₀] generates | holds | none |
| 1.4 Proj(A) comparison | x=v*, y=v; e=[[1,1],[0,0]]; ℂ→M₂ | xy=p, yx=q, px=v*vv*=v*=xq, qy=v=yp; e²=e, range ℂ×0; [1]↦[e₁₁]+[e₂₂]=2, [ℂ⊗M₂]=2[e₁₁M₂] | holds | none |
| 1.5 trace pairing (sample) | M_n with tr/n; C(X) at x; CAR limit | rank one ↦1/n, [1_(M_k(A))]↦k; rank of p(x); rank-one in M_(2^k) ↦2^(−k), limit group ℤ[1/2] needs 2.3 | true; dependency misplaced | R03 |
| 2.1 K₁ (sample) | C(𝕋); C(S³); ℂ | [z]↦1, [z*]=−1; π₃-class in M₂; 2·(4)^(−1/2)=1 | holds | none |
| 2.2 nonunital K₁ (sample) | K; ℂ→K corners; C₀(ℝ) | σ(1+k) countable, log exists; λe₀₀ gives 1, λ(e₀₀+e₁₁) gives 2; exp(2πit) has scalar part 1, winding +1 | holds | none |
| 2.4 LocalNormed | g=1/10; ℂ[z]; 0 | \|g−1\|=0.9, \|g⁻¹−1\|=9; (z−2)⁻¹=−Σzⁿ/2ⁿ⁺¹ not polynomial; GL_n(0)={0} | holds | none |
| 3.1 Bott map (sample, headline) | H(r,s) four edges; scalar part; A=ℂ | r=0: exp(2πi x(s)); r=1: f_e f_p⁻¹ since exp(2πip)=1; s=0: exp(2πip)=1; s=1: exp(2πie)=1; scalar exponent p[s+(1−r)(1−s)+r(1−s)]=p | holds | none |
| 3.1 θ(b[1])=β sign | w=diag(u,1)R(s)diag(1,ū)R(s)⁻¹ | first column v=(c²u+σ², σc(1−ū)); v=(1,0) on all edges; v∥(0,1) only at s=t=1/2; there 1/ratio≈−π(a+ib) vs z≈π(a+ib): local degree +1 on both sides, so [P]−[e₁]=β | holds | none |
| 3.2 six-term (headline) | Toeplitz; cone of ℂ; B(H)→Q(H) | δ₁[z]=[1−S*S]−[1−SS*]=−1=ind S; x(s)=s gives exp(2πis), winding +1; K₁(Q)≅ℤ | holds | none |
| 3.3 pullback MV | A₂=0; Q=0; patching element | D=J; D=A₁×A₂, ∂=0; π₁(XeX⁻¹)=diag(u,u⁻¹)e diag(u⁻¹,u)=e; ι∂π₂*=ιδ_D=0 by naturality | holds | none |
| 3.4 external product | [1]×[1]; 𝕋² flip | 1·1=1; K₀(𝕋²)=ℤ²; flip gives −q*β=(−1)^(1·1) | holds | none |
| 3.5 Fréchet criterion | C¹(𝕋); 2+z; repeated squaring | \|\|\|fg\|\|\|≤‖f‖‖g‖+‖f′‖‖g‖+‖f‖‖g′‖ (C=1); a_(2m)≤2C‖xᵐ‖a_m gives a_(2^k)^(1/2^k)→r(x) | holds | R05 (locator) |
| 4.1 Atkinson (headline) | S; δ_n↦δ_(2n); dim H<∞ | ind S=0−1; T*T=1 with infinite cokernel; Q(H)=0, all indices 0 | holds | none |
| 4.2 graded pairs (sample) | [[0,S*],[S,0]]; swap on ℂ^(1\|1) | F²−1=diag(0,−e₀₀), index −1; swap gives degenerate, index 0 | holds | none |
| 4.3 dilation (sample) | M₂, φ=a₁₁; φ=λ/2; c=e₁₂, a=e₂₂, b=e₁₂ | null space = zero first column, dim 2; V*V=1/2; φ(cab*)=φ(e₁₁)=1 vs φ(ab*c)=φ(e₂₂)=0 | holds | none |
| 4.4 complete pairs | Σsᵢτsᵢ* multiplicative; U=Σtᵢsᵢ*; e_(3n), e_(3n+1) | Σ_(i,j) sᵢτᵢ(a)sᵢ*sⱼτⱼ(b)sⱼ* = Σsᵢτᵢ(ab)sᵢ*; U*U=Σsᵢsᵢ*=1, Usᵢ=tᵢ; range sum 1−R, R infinite rank | holds | none |
| 4.5 Ext (headline) | Toeplitz; M_n by K; C(X) | lift of z has index 0 vs −1; corank of a lift of 1 mod n gives ℤ/n | holds | none |
| 5.1 Clifford (sample) | e₁=[[0,1],[1,0]], e₂=[[0,i],[−i,0]] | e₂²=1; e₁e₂=diag(−i,i), e₂e₁=diag(i,−i); s e₂+t e₁ has lower block t−is=−i(s+it), winding +1; s e₁+t e₂ gives s−it, winding −1 | holds | none |
| 5.2 cycles, inverse | swap W on E⊕Eᵒᵖ | W(γ⊕−γ)=−(γ⊕−γ)W; W(φ(a)⊕φ(γa))=(−1)^(∂a)(φ(a)⊕φ(γa))W; W(F⊕−F)=−(F⊕−F)W | holds | none |
| 5.4 degrees | x=−cot πt | (x−i)/(x+i)=(−e^(iπt))/(−e^(−iπt))=e^(2πit); KK₁(ℂ,ℂ)=0, KK₂≅ℤ | holds | none |
| 5.5 unbounded | eigenvalue λ; D=0 | F²−1=λ²/(1+λ²)−1=−1/(1+λ²); (1+0)⁻¹=1 is not compact in infinite dimension | holds | none |
| 6.1 technical theorem | Blackadar 12.4.2 (line 4721) and 20.1.5 (line 9060) | hypotheses A₁A₂⊆J, [Δ,A₁]⊆A₁; conclusion M+N=1, MA₁⊆J, NA₂⊆J, [M,Δ]⊆J | matches source | none |
| 6.2 product (headline) | 1_D; [f]⊗[g]; two odd classes | x⊗1_D=x; [g∘f]; (−1)^(1·1)=−1 | holds | none |
| 6.3 quasihomomorphisms | λ1 vs λ(1−e₀₀); rank-two corner | s₀(1)−s₁(1)=(0,e₀₀)↦1, swapped −1; product rank 1, rank-two corner 2 | holds | none |
| 6.5 Manuilov–Thomsen (sample) | (M_n,K); (ℂ,J); (C(𝕋),K); meaning of E(ℂ,K) | KK₀(M_n,K)=ℤ →×n→ ℤ, U=ℤ/n; U(ℂ,J)=0; U(C(𝕋),K)≅ℤ; Ext⁻¹(ℂ,K)=K₁(K)=0 vs E-theory E(ℂ,K)=ℤ | sequence holds; notation clash | R02 |
| 6.6 index pairing (sample) | [P,u]; Pu*P; (1−P)u(1−P) | [P,u]δ₋₁=δ₀, zero elsewhere; PuP index −1, Pu*P index +1; (1−P)u(1−P) kills δ₋₁ and is onto: +1 | holds | none |
| 7.1 equivariant KK, technical theorem | trivial G; ℝ on C₀(ℝ) with f=max(sin x²,0) | KK_G=KK; M(x_k)→0, M(y_k)→1, y_k−x_k=π/(x_k+y_k)→0; f is not uniformly continuous | holds with hypothesis | none |
| 7.2 Green–Julg (headline) | V_gξ(r)=β_g(ξ(rg)); p_G; ℤ/2 on ℂ | V_g(ξb)=V_gξ·β_g(b); ⟨V_gξ,V_gη⟩=β_g⟨ξ,η⟩ by right invariance; V_gρ(b)=ρ(b)V_g; λ_sρ(b)λ_s⁻¹=ρ(β_s b); p_G*=p_G, p_G²=p_G; R(ℤ/2)=ℤ²=K₀(ℂ²) | holds | none |
| 7.3 free groups (headline) | Γ_n; tree defect; S_n*ρ(a)S_n; A=ℂ | g_iΓ_n=Γ_n, g_nΓ_n=Γ_n∖{1} (g_n⁻¹∉Γ_n); defect supported on [g⁻¹,1]; u_g*ρ(a)u_g=ρ(α_(g⁻¹)a); ideal map [p]↦[p]−[α_(g_n⁻¹)p]; δ₁[u_n]=−[P₁]=−1 | holds | none |
| 7.4 PV and A_θ (sample, headline) | UaU*=α(a); θ=1/2; θ=p/q | (1−α⁻¹_*)(−α_*)=1−α_*; uvu*=e^(2πiθ)v; ℤ+½ℤ=½ℤ, τ_* kills 2x−[1]; ℤ+(p/q)ℤ=(1/q)ℤ | holds | none |
| 7.5 twisted centre (sample) | (x,−x,x); rotation cocycle; d=0 | c(x,−x)=c(−x,x); ρ=e^(2πiθ(nm′−n′m)): C_ρ=0, qℤ², ℤ²; W_xW_y=ρ(x,y)W_yW_x; ann(C_ρ)=closure{κ_x} | holds; object already in Tau Ceti | R01 |
| 7.6 Cuntz (headline) | n=1,2,3 | vacuum class (1−n)[1]; ℤ/0=ℤ=K₀(C(𝕋)); K₀(O₂)=0; K₀(O₃)=ℤ/2 | holds | none |
| 7.7 Connes–Thom (headline) | x(t)=(1−t)p+tα(p); u(x)=(x+i)/(x−i) | x(1)=α(x(0)); 3.1's homotopy with e=α(p) gives b_A(α_*[p]−[p]); arg u=2arg(x+i) runs from 2π to 0, winding −1 | holds | none |
| 8.1 bootstrap | 0; Sℂ; O_n | 0→ℂ→ℂ→0→0; Cℂ contractible; E_n∼ℂ, K∼ℂ | holds | none |
| 8.2 Ext, Tor (sample) | ℤ/m; ℤ/2⊗ℤ/2 | Ext¹(ℤ/m,ℤ)=ℤ/m; Tor₁(ℤ/2,ℤ/2)=ℤ/2 | holds | none |
| 8.3 UCT (headline) | A=ℂ; (O_n,ℂ); (O_n,O_n) | Ext terms 0; KK₀=0, KK₁=Ext(ℤ/(n−1),ℤ)=ℤ/(n−1); KK₀(O_n,O_n)=Hom=ℤ/(n−1), both Ext terms 0 | holds | none |
| 8.4 BDF, Lean (sample, headline) | S; S⊕S*; disc; dim H<∞; nonseparable H | ind(S−λ)=−1 inside 𝕋; −1+1=0; Ext(disc)=0; σ_e=∅, both sides true; separability present | holds | none |
| 8.5 Künneth (headline) | O₃⊗O₃; A_θ⊗A_θ′ | K₀=ℤ/2⊗ℤ/2=ℤ/2, K₁=Tor=ℤ/2; ℤ⁴⊕ℤ⁴=ℤ⁸ in both degrees | holds | none |
| 9.1 asymptotic morphisms | (1+1/t)φ; 2a | defect (1+1/t)φ(ab)−(1+1/t)²φ(ab)=−(1/t)(1+1/t)φ(ab); 2−4=−2 | holds | none |
| 9.2 Bartle–Graves | fibre map on the sphere; ℓ^∞/c₀ | ‖(1−s)x₀+sx₁‖≤(1−s)R+sC<R for s>0, so the map is lower hemicontinuous; continuity at 0 gives ‖s(y)‖≤‖y‖/δ | holds | none |
| 9.3 composition | ℂ→ℂ; (1+1/r(t))(1+1/t)ψφ | x_t²−x_t→0 forces x_t→0 or 1; composite tends to ψφ | holds | none |
| 9.4 E-theory (sample) | E(ℂ,ℂ); reversal | ℤ with identity 1; exp(2πit)↦exp(−2πit), giving −1 | holds | none |
| 9.5 universal property (headline) | (O_n,ℂ) via 25.6.3 | E₀=KK₀=0, E₁=KK₁=ℤ/(n−1) | holds | none |
| Conventions: Bott projection | M=[[\|z\|²,z],[z̄,1]] | M²=(1+\|z\|²)M; p(0)=diag(0,1); Blackadar line 3146 has the same q | holds | none |

## Not verifiable

- Slawny1972 is recorded as uncertified (paywalled). It is cited only through Phillips2006 Theorem 1.9, which I read (line 164).
- I did not reread Schochet1984, Cuntz1981, PimsnerVoiculescu1982, Julg2013, Messerschmidt2016 or Zois2010 this round. They are outside the seeded sample, the README flags none of them as unverified, and the previous review read them at their locators.
- I checked ownership against open pull requests through the heads the brief provides and through the `roadmaps grep` index of all 472 open heads.

## Source issues

- **Misprint** in Roe2017 at Definition 6.1, p. 27: the source writes the unitary condition with a stray character, "u8u", in place of u*u; it should read uu*=u*u=1; affects nothing.
- **Misprint** in ManuilovThomsen2005 at display (1), p. 1: the text announces the sum ϕ⊕ψ but the displayed formula defines ψ⊕ϕ, with ψ in the V₁ corner; the announced and displayed orders should agree; affects nothing.
