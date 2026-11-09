# Review of VonNeumannAlgebras (pull request #1041 at 296b9d1)

**Verdict:** needs changes

The head is the one the previous review read, so nothing in the folder has changed. Its only finding, the missing rebase, is still open and is R01 below. This full review found five new defects:
- **R02 (P2):** Layer 1 claims, and re-plans, operator-topology results that BanachSpaceTheory B1 on main owns.
- **R03 (P2):** the open BanachSpaceTheory revision (#1854) renames the three heading anchors this roadmap's supplier contract links to, and it records the cited B1, B2 and B4 content as Tau Ceti declarations that exist at main's pin.
- **R04 (P3):** V5.Dixmier's uniqueness claim is cited to theorems that prove only existence.
- **R05 (P3):** Weil's formula is written with the coset on the wrong side.
- **R06 (P3):** two compact-action citations carry no theorem locator.

The gate passes, the dependency check is clean, `Suggested.lean` elaborates with only its 24 `sorry` warnings, and the probe finds no padding.

## Previous findings (review of 296b9d1)

- **R01 (branch not rebased; Tau Ceti contract absent at the branch pin): not repaired.** The head is unchanged.
  - `git merge-tree --write-tree origin/main HEAD` still prints `CONFLICT (add/add)` for `TauCetiRoadmap/VonNeumannAlgebras/README.md` and `Suggested.lean`.
  - `lake-manifest.json` still pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`.
  - It is R01 below.

## R01 (P3) — The branch is still not rebased, and its contract cites Tau Ceti modules absent at its own pin

**Location:**
- `README.md:233–283`, the Tau Ceti contract, which ends "Each is used as stated at the pin."
- `Suggested.lean:17–18`: "written out so that the file imports only Mathlib".
- The pinned-commit links at `README.md:2371` (Tau Ceti `a91d3aaf`, `InnerRegular.lean#L45-L92`, `Integrated/Basic.lean#L104-L229`) and `:2450` (Mathlib `6b7abb3c`).

**Claim:** at the branch's own pin, eight cited Tau Ceti modules do not exist, so the contract sentence is false for the branch as it stands, and the files conflict with main.

**Witness:**
- `git cat-file -e a91d3aaf:<file>` fails for `Analysis/CStarAlgebra/GNS.lean`, `Representation/Nondegenerate.lean`, `Analysis/VonNeumannAlgebra/{Adjoin,Density}.lean`, `Action/KMS/Basic.lean`, `Action/Inner.lean`, `Action/Gibbs.lean` and `LinearAlgebra/Matrix/Trace/Duality.lean`.
- All eight exist at main's pin `2fd255d9`.

**Repair:**
- Rebase onto main, keeping this head's two files.
- Write the Layer 0 nondegeneracy clause as `π.IsNondegenerate` with its import, and delete `Suggested.lean:17–18`.
- Re-point the links at `:2371` and `:2450` to the new pins. At `2fd255d9` the two `InnerRegular.lean` lemmas are at lines 73 and 104.
- Control: `git merge-tree --write-tree origin/main HEAD` prints only a tree id.

## R02 (P2) — V1 re-plans operator-topology results that BanachSpaceTheory B1 owns on main

**Location:**
- `README.md:54–56`: "The operator-topology adapters on `B(H)` (sequence boundedness, bounded joint continuity of products and matrix-coefficient criteria) are not in B1; V1 owns them."
- `README.md:537–546`: "Own here the operator-topology adapters on `B(H)`, which BanachSpaceTheory B1 does not supply. Prove that a SOT- or WOT-convergent sequence … is norm bounded … jointly SOT continuous on norm-bounded sets and is not jointly continuous …"

**Claim:** the scope sentence is false on main, and V1 restates targets of a roadmap that is already a supplier here. That gives two owners for the same results.

**Witness:** main's `TauCetiRoadmap/BanachSpaceTheory/README.md:93–107` reads: "norm⇒SOT⇒WOT and compatibility with the Hilbert matrix-coefficient WOT used by VonNeumannAlgebras V1. On Banach domains, convergent SOT or WOT sequences are norm bounded … joint SOT continuity on norm-bounded sets … SOT-null nets S_i,T_i with S_iT_i a fixed nonzero rank-one operator … the Hilbert specialization consumes this generic topology". The revision #1854 keeps this in its §1.3.

**Repair:**
- Delete from V1 the targets for sequence boundedness, joint SOT continuity on bounded sets and its failure for nets, and norm⇒SOT⇒WOT. Consume them from BanachSpaceTheory B1: `B(H)` with H complete is its Banach-domain case.
- The matrix-coefficient criterion is Mathlib's `ContinuousLinearMapWOT.tendsto_iff_forall_inner_apply_tendsto`: cite it rather than prove it.
- Keep in V1 the ultraweak and ultrastrong wrappers, their bounded-set comparisons, metrizability and the Hilbert examples.
- Replace `:54–56` with "BanachSpaceTheory B1 owns the generic SOT/WOT topologies of bounded maps (sequence boundedness, norm⇒SOT⇒WOT, bounded joint continuity of products); V1 owns the ultraweak and ultrastrong topologies and their comparisons".
- Add "BanachSpaceTheory B1 (operator topologies)" to the `*Needs:*` line at `:568–576` and to the Dependencies at `:694–695`.
- Test: BanachSpaceTheory B1's rank-one net (norms → ∞, SOT → 0) and its sequence bound give V1's two statements at E = F = H, so nothing V1 consumes is lost.

## R03 (P2) — BanachSpaceTheory citations break under the open revision #1854, and their content is Tau Ceti's at main's pin

**Location:**
- `README.md:285–293`: the links `#b1-duality-and-weak-topologies`, `#b2-weak-compactness-and-reflexivity` and `#b4-approximation-and-banach-tensor-products`.
- `README.md:1121`: the B4 link.
- `README.md:1096–1099`: "Consume BanachSpaceTheory B2's generic Krein–Šmulian theorem …"
- `README.md:1118–1119`: "B1's existing annihilator and quotient theory".

**Claim:** these are supplier citations whose heading ids #1854 drops. At that head and at main's pin, part of what they point to is a library declaration and no longer a BanachSpaceTheory target.

**Witness:**
- #1854 (BanachSpaceTheory, head `df0367f`) renames the headings to "## Layer 1: duality and weak topologies (B1)", "## Layer 2: … (B2)" and "## Layer 4: … (B4)" (its `README.md:347, 474, 582`).
- Its scope (`:29–54`) lists annihilators, quotient duals, Goldstine, Mazur, Krein–Šmulian and nuclear operators as "Already in the library at the pins".
- At Tau Ceti `2fd255d9`, `Analysis/Normed/Module/Dual/KreinSmulian.lean:272, 305` has `Convex.isClosed_iff_forall_isClosed_inter_closedBall` and `Submodule.isClosed_iff_isClosed_inter_closedBall_zero_one`. None of these files exists at `a91d3aaf`.

**Repair:**
- Cite BanachSpaceTheory by layer id (B1, B2, B4) without heading fragments. Both main and #1854 keep these ids.
- After R01's rebase, move to "From Tau Ceti", with names and files, and drop from the BanachSpaceTheory contract:
  - Krein–Šmulian, the two names above;
  - Goldstine: `NormedSpace.closure_image_inclusionInDoubleDualWeak_closedBall` (`Dual/Goldstine.lean:50`);
  - quotient duals: `Submodule.quotientDualEquivAnnihilator` (`Dual/Quotient.lean:38`) and `Submodule.quotientAnnihilatorEquivDual` (`Dual/Submodule.lean:78`);
  - the annihilators (`Analysis/Normed/Module/Annihilator.lean`);
  - Mazur (`Analysis/Normed/Module/Mazur.lean`);
  - the nuclear carrier `TauCeti.NuclearOperator` (`Analysis/Normed/Operator/Nuclear.lean:304`).
- Keep B1 for the evaluation continuity criteria, B2 for James, and B4 for the Schmidt series and the Hilbert nuclear/trace-class identification, which #1854 §4.2 still owns.
- Control: `roadmaps overlaps VonNeumannAlgebras` lists no dropped id.

## R04 (P3) — V5.Dixmier's uniqueness is cited to existence theorems, and the route reverses the sources' order

**Location:**
- `README.md:1681–1686`: "meets its center in a unique element D(x) (Dixmier's property: Peterson, Theorem 4.8.2, p. 75; Anantharaman–Popa, Theorem 6.4.1, p. 93). Prove that this assignment constructs the faithful normal center-valued trace".
- `Suggested.lean:280`: "constructed from the Dixmier centre-valued trace".
- `README.md:4845`.

**Claim:** neither cited theorem states uniqueness, and the sources obtain uniqueness from the centre-valued trace rather than the other way round. As written, the route has no supporting proof.

**Witness:**
- peterson-notes line 2956–2958 (Theorem 4.8.2) states only that Z(M)∩K(x) is nonempty, for every von Neumann algebra.
- anantharaman-popa line 4268–4272 (Theorem 6.4.1) covers factors and gives K_x∩ℂ1≠∅.
- Uniqueness is peterson-notes line 2981 (Corollary 4.8.3, p. 76), proved at lines 2985–2988 from the trace of Theorem 4.7.10. anantharaman-popa lines 4337–4339 (Remark 6.4.3) take the same order.
- In B(ℓ²), with q the even-coordinate projection, K(q)∩ℂ1 contains both 1/2 = (q+uqu*)/2 and 0.

**Repair:**
- Cite Peterson, Corollary 4.8.3, p. 76, and Anantharaman–Popa, Remark 6.4.3, p. 95, for uniqueness and for Z(M)∩K(x)={T(x)}.
- Order the route as the sources do: first the centre-valued trace (Peterson, Theorem 4.7.10 with Lemma 4.7.9, pp. 71–72), then D=T.
- Keep Theorems 4.8.2 and 6.4.1 for existence. That is all `tracialState_unique` uses: two tracial states both equal α whenever α1∈K_x.
- At `Suggested.lean:280`, write "from the centre-valued trace (Peterson, Theorem 4.7.10)".
- Test: on M₂, K(e₁₁)∩ℂ1={1/2}=tr(e₁₁)/2, as Corollary 4.8.3 predicts.

## R05 (P3) — Weil's formula sums over the wrong side of the coset

**Location:** `README.md:2529–2530`: "with a right-invariant Haar measure and a fundamental domain D, `∫_G f=∫_(G/Γ)∑_(γ∈Γ)f(γg)`".

**Claim:** on G/Γ (left cosets gΓ), g↦Σf(γg) is not constant on cosets, so the formula does not restate the cited Mathlib lemma.

**Witness:**
- Mathlib `QuotientGroup.automorphize` (`Topology/Algebra/InfiniteSum/Module.lean:231`) sums over the right action of `Γ.op`, that is f(gγ). `QuotientGroup.integral_eq_integral_automorphize` (`MeasureTheory/Measure/Haar/Quotient.lean:378`) assumes `μ.IsMulRightInvariant`.
- Counterexample in S₃ with Γ={e,(12)} and f=δ_(13): Σf(γg) is 1 at g=(13) and 0 at g=(13)(12), which lies in the same coset.

**Repair:**
- Write `∑_(γ∈Γ)f(gγ)`.
- Test: in the same S₃ instance, Σf(gγ) is 1 at both (13) and (13)(12). On ℤ⊂ℝ the two forms agree.

## R06 (P3) — Two compact-action citations have no theorem locator

**Location:**
- `README.md:2390`: "See Høegh-Krohn–Landstad–Størmer, *Compact ergodic groups of automorphisms*, Annals of Mathematics 114 (1981), 75–86".
- `README.md:2395`: "by Wassermann's SU(2) spectral-subspace classification".
- `README.md:2403–2404` and `:4884`.

**Claim:** these targets carry no theorem or page locator: the invariant tracial state of an ergodic compact action, and the absence of ergodic SU(2) actions on II₁ factors.

**Witness:** the only locators are the article page range and "Wassermann (1988, 1989)". The references at `:4884` name the papers but no theorem.

**Repair:** add the theorem and page of Høegh-Krohn–Landstad–Størmer's finiteness/trace theorem, and of Wassermann III's theorem excluding ergodic SU(2) actions on II₁ factors (with Part I's multiplicity bound). If a text cannot be read legally, cite it as uncertified by its locator.

## Verified sound

**Gate and dependency check.**
- My gate run at 296b9d1 printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.
- The dependency check printed, verbatim and with exit 0:

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

- It printed no UPWARD, CYCLE or `moved:` line. VonNeumannAlgebras is at line 5 of the merge order.

**Lean.**
- `lake env lean …/Suggested.lean` exits 0 in 20 s, with exactly 24 `declaration uses 'sorry'` warnings at `:101, 112, 123, 132, 143, 172, 181, 208, 225, 245, 274, 283, 290, 319, 335, 362, 380, 399, 427, 443, 461, 496, 503, 513`.
- **`#check @name` for all 41 declarations** (24 theorems, 17 definitions) was run in one scratch copy, and each type was compared with its README statement. Nothing changed:
  - every H-declaration keeps `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`;
  - the separable theorems keep `[SeparableSpace H]`, and `[SeparableSpace K]` where they have a K;
  - `tomiyama` keeps `[PartialOrder A] [StarOrderedRing A]`;
  - `ergodicSMul_dense_subgroup` keeps `[T2Space G] [LocallyCompactSpace G] [BorelSpace G] [μ.IsHaarMeasure] [μ.Regular] [Countable Γ]`.
  - (The worker's signature list also contains a spurious `and` entry taken from a docstring.)
- **One-tactic probe**, in two runs on scratch copies:
  - `first | rfl | infer_instance | trivial | simp | aesop | exact?` gave 24 errors. Thirteen of them came from `simp` making partial progress.
  - With `(simp; done)` and `(aesop; done)`, all 24 sites fail at `exact?`.
  - There is no padding.
- The docstring's "not statable" claims hold at both pins. There is no ultraweak or ultrastrong topology, no ring structure on `Lp ∞`, no completed tensor product of von Neumann algebras, and no `IsClosed` or `StarOrderedRing` instance for `M.toStarSubalgebra`. `StarSubalgebra.cstarAlgebra` (`Analysis/CStarAlgebra/Classes.lean:50`) needs an `IsClosed` instance.

**Library declarations opened** (Mathlib `6b7abb3c` read through git objects, Tau Ceti `2fd255d9`):
- Mathlib:
  - `QuotientGroup.automorphize` (`InfiniteSum/Module.lean:231`) and `integral_eq_integral_automorphize` (`Haar/Quotient.lean:378`);
  - `Lp.instContinuousSMulDomMulAct` (`LpSpace/DomAct/Continuous.lean:53`);
  - `aeconst_of_dense_setOfPred_preimage_smul_ae` (`Dynamics/Ergodic/Action/OfMinimal.lean`, finite measure only, as `README.md:2438` says);
  - `isMulLeftInvariant_eq_smul_of_innerRegular`, used at `ModularCharacter.lean:96`.
- Tau Ceti (all present):
  - every name in `README.md:212–283`, with these lines: `GNS.lean:54, 62, 72, 86, 94, 99, 110`, `Nondegenerate.lean:62, 68, 82`, `Adjoin.lean:38–74`, `Density.lean:128`, `KMS/Basic.lean:83, 182, 222`, `Inner.lean:43, 70`, `Gibbs.lean:61, 86, 117`, `Duality.lean:31`, `PrimesCongruent.lean:50, 63`, `IntegersRat.lean:183`, `Counting.lean:630` (`primeCount`);
  - `Integrated/Basic.lean:144`, `Pontryagin/StronglyContinuous.lean:283`, `Pontryagin/Uniqueness.lean:263`, `FiniteMeasureExt.lean:263`, `DualEval.lean:29`;
  - the Hecke files `Commutativity.lean:79, 135, 459`, `Multiplicity/Basic.lean:70` and `Multiplication.lean:138`.

**Cross-roadmap citations and ownership.**
- Main's `OperatorAlgebraDynamics`, `CStarAlgebras`, `TypeAHeckeAlgebras` and `SelfAdjointSpectralTheory` cite this roadmap through pinned permalinks or bare file links. No relative anchor link on main points into this README.
- The open QuantumFoundations (#1771) consumes V0–V13 and V12.J.Frame/Scalar/Dye/Bloch/Enriched/CentralSplitting by these ids, all of which exist here, and states that it does not re-prove them.
- `roadmaps resolve` reports nothing. The only overlap lead is R03.
- Single owner with SelfAdjointSpectralTheory on main:
  - its Part B (SA-B05 Borel calculus, SA-B14 PVMs), SA-B85 and Parts D–E state what V2.BorelCalculus, V4.0.Multiplication and V10.ClosedOperators own;
  - since SA-B85 consumes V4.0.Fields (its `README.md:255`), this roadmap is the upstream owner, as `README.md:31–39` says;
  - the matching scope text is on main, so the duplicate copies are SelfAdjointSpectralTheory's to replace, not a finding here.

**Sources: the seeded sample and the other locators.** For anantharaman-popa, printed page = pdf page − 6.
- **13.1:**
  - hiai-lectures line 2666 (Theorem 6.5, p. 55), with the von Neumann-only proof at line 2668;
  - peterson-notes line 3948 (Theorem 6.2.1, p. 98);
  - anantharaman-popa lines 7191–7205 (Definition 10.2.1 and Proposition 10.2.2(i)–(iii), p. 161).
- **13.2:** anantharaman-popa:
  - line 7269 (Proposition 10.2.5, p. 163);
  - lines 7333–7350 (Theorem 10.2.9(2): positive finite-rank T, `‖T‖₂,Tr=1`, (10.1)–(10.2), p. 164);
  - line 7413 (Theorem 10.3.1, finite-rank projection, p. 166) and line 7532 (Theorem 10.3.4, p. 168);
  - lines 7685–7702 (Definitions 11.1.1–11.1.2 and Theorem 11.1.3, p. 173);
  - lines 8294–8302 (Theorem 11.2.2(1)–(5), p. 186) and lines 8358–8377 (Remark 11.2.3, the AFD definition and Corollary 11.2.4, p. 188).
- **13.2, other texts:**
  - peterson-notes line 4146 (Theorem 6.3.8, p. 103);
  - hiai-lectures lines 327–335 (§1.8, p. 9);
  - haagerup-1989 lines 50–52 (p. 265) and 1176–1180 (Theorem 6.1, p. 303);
  - haagerup-2016 lines 49–53 (Theorems 1.1–1.2).
- **Peterson, other layers:** Theorems 2.5.6 (p. 29), 2.6.4 (p. 31), 2.7.4/2.7.6 (pp. 33/35), 2.8.5 (p. 37), 3.3.1/3.3.2/3.3.9 (pp. 49–52), 4.1.6–4.1.7 (pp. 57–58), 4.2.2 (p. 60), 4.3.3–4.3.4 (pp. 62–63), 4.4.6 (p. 66), 4.7.10/4.7.12 (pp. 72–73), 4.9.4/4.9.5 (pp. 78–79) and Lemma 2.8.8 (p. 38). Theorem 4.9.4 states uniqueness up to a scalar and "p finite iff Tr(p)<∞", as `Suggested.lean:319` does.
- **Anantharaman–Popa, other layers:** Definitions and results 2.4.11, 2.4.13, 2.5.1, 2.5.5, 2.5.7, 2.6.6, 3.1.4, 3.2.1, 4.1.6, 6.2.8, 6.3.4–6.3.5, 6.4.1, 6.4.4, 7.1.1, 8.1.1–8.1.2, 8.2.2, 8.3.1–8.3.8, 8.4.2, 8.5.4–8.6.2, and the coupling constant at line 6225 (p. 135). All pages match the README.
- **Jones:** 3.2.2–3.2.3 (p. 12), the p. 13 remark, EP10 (p. 23), 4.4.1–4.4.5 (pp. 28–29), 5.2.2 (p. 33), 8.1.15 (p. 53), Chapter 10 (pp. 61–66), 11.2.17/11.2.21 (p. 73) and 16.3.1 (p. 108, hypotheses (a)–(b) and the constant 14, as at `README.md:3918–3920`).
- **Other texts:**
  - houdayer, Theorems 3.1 and 3.16 (pp. 12, 17);
  - bunce-wright-1992 lines 8, 53–59, 86 (pp. 288–289, and `‖β‖≤4 sup` in Lemma 1.1);
  - hamhalter-2014 lines 85–91 (pp. 2–3) and 627–630 (Theorem 4.3, p. 14, existence only, as the README says);
  - hiai-lectures Theorems 2.2, 2.14, 3.12–3.13, 6.4, 6.6, 7.6, 9.4, 10.7, Proposition 3.8 and §13.

**Adversarial pass.** Every value below was computed this round.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `exists_faithful_nondegenerate_representation` | A=0; A=ℂ²; control z↦diag(z,0) for A=ℂ | K=0, span 0 dense in 0; diag(a,b) spans ℂ²; control injective, span ℂ×0 not dense | holds; nondegeneracy discriminates |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | z↦z·1 on ℓ² has range ℓ²; A=0 gives only π=0, span 0≠ℓ² | holds; `[Nontrivial A]` needed |
| `double_commutant_iff_isClosed_image_ofCLM` | ℂI; finite rank+ℂ on ℓ²; {e₁₂}'' | (ℂI)''=ℂI closed; A''=B(ℓ²)≠A, A not WOT closed; {e₁₂}'' = span{I,e₁₂} (dim 2), not a *-algebra | holds |
| `closure_unitBall_eq_unitBall_double_centralizer` | ℂI; q even projection, A=finite rank+ℂ | qP_n→q SOT; ‖q−(c+F)‖≥max(\|1−c\|,\|c\|)≥1/2 | SOT, not norm; holds |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; ℓ², C=1/2 | {0,1}∌1/2; [[1/2,1/2],[1/2,1/2]] eigenvalues 1,0, compression 1/2 | holds; dimension hypothesis needed |
| projection predicates | M₂⊕ℂ; ℓ∞; L∞[0,1]; B(ℓ²), shift S | central: 0, 1⊕0, 0⊕1, 1; (e₁₁⊕0) not central; S*S=1, SS*=1−e₀₀, so 1 is not finite, e₀₀ is finite | discriminating |
| `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv` | B(ℂⁿ); ℂ1 on ℂ | X = conjugate of S₁(ℂⁿ); X=ℂ, z↦z̄ | holds |
| `IsNormalFunctional`, `isNormalFunctional_iff_exists_tsum_inner` | ℓ∞ with φ_w=Σ2^(−n−1)x_n; ultrafilter state; H=0 | φ_w(1_{≤N})=1−2^(−N−1)→1; ξ_n=2^(−(n+1)/2)e_n, Σ‖ξ_n‖²=1; ultrafilter: φ(1_{≤N})=0↛1, and any tsum gives Σφ(δ_k)=1≠0; H=0: τ=0, ξ=0 | both directions hold |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diagonal; H=0 | e₁ cyclic for M₂ and separating for ℂI; (1,0) is neither for the diagonal; 0 is both on H=0 | holds |
| `equivalent_of_subequivalent` | B(ℓ²), p=1, q=1−e₀₀; M₂ | S implements 1∼q with q≠1; e₁₁≼1 but e₁₁≁1 | holds up to equivalence |
| factor/finite/II₁/trace definitions, `tracialState_unique`, `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | M₂; ℂ⊕ℂ; B(ℓ²); R | x↦x₁₁ not tracial (e₁₂e₂₁=e₁₁, e₂₁e₁₂=e₂₂); t·pr₁+(1−t)pr₂ tracial for all t (factor needed); B(ℓ²): τ(1)=2τ(1) ⇒ no tracial state; R: q_i=v_i*pv_i∈I, Σq_i=1 with n≥1/τ(p) | holds |
| `IsNormalSemifiniteTrace`, `exists_isNormalSemifiniteTrace_of_isFactor` | B(ℓ²); R⊗̄B(ℓ²); τ≡∞ off 0; τ=0; ‖·‖ on M₂; τ′=2Tr | Tr(e₀₀)=1, Tr(1)=∞; Tr(p⊗e₀₀)=τ(p), Tr(p⊗1)=∞; ∞-map normal but not semifinite; 0 semifinite, not faithful (c=0); ‖e₁₁+e₂₂‖=1≠2; c=2 | each clause independent; holds |
| `exists_conj_commutant_eq_of_isCyclic` | L∞[0,1], Ω=1; M₂ on Hilbert–Schmidt, Ω=I/√2; M₂ on ℂ² | J=f↦f̄, JMJ=M=M′; Jx=x*, JMJ = right multiplications = M′; on ℂ² vector states are pure, not tracial (vacuous) | holds |
| `IsTypeIIInfinity`, `existsUnique_typeDecomposition` | B(ℓ²)⊕R⊕(R⊗̄B(ℓ²)); M₂⊕R; H=0 | z=(1⊕0⊕0, 0⊕1⊕0, 0⊕0⊕1, 0); (1⊕0, 0⊕1, 0, 0); every product z_iz′_j (i≠j) is a central projection that some clause forces to be 0; H=0: all z_i=0=1 | unique; holds |
| `ergodicSMul_dense_subgroup` | ℚ⊂ℝ; ℤ⊂ℝ; σ-compactness | G=⋃_(γ∈Γ)γK, since γ∈gU⁻¹ exists by density; ⋃[n,n+1/2) is ℤ-invariant and neither null nor conull | holds; density needed |
| `existsUnique_isKMS_flow` | M₂, h=diag(2/3,1/3), x=e₁₂, y=e₂₁; Ad(diag(r^(it),1)); tracial | σ_t(e₁₂)=2^(it)e₁₂; F(z)=(2/3)2^(iz): F(t+i)=(1/3)2^(it)=φ(yσ_tx); for r: F(t+i)=(2/3)r^(it)/r, which equals (1/3)r^(it) only at r=2; r=3 gives (2/9)3^(it); tracial: σ=id | exists, unique; holds |
| `HasTypeITwoSummand`, `exists_unique_extension_of_finitelyAdditive` | M₂; M₃; M₄; M₃ with μ=Tr(diag(1,−1,0)·); H=0 | yes (e₁₁,e₂₂); no (2·rank e=3); no (eM₄e≅M₂); C=1 and ‖φ‖=Tr\|D\|=2≤4; μ(0)=2μ(0) gives 0; on M₂ the sgn frame function gives 3/4 vs affine 1/2+1/(4√2)≈0.677 | holds |
| `dye` | ℂ² swap; M₃ transpose; M₂ Bloch map | the swap extends to (a,b)↦(b,a); (e₁₂e₂₁)ᵀ=e₁₁ vs e₂₁e₁₂=e₂₂, so Jordan only; Bloch images (1,0,±2)/√5 have inner product −3/5, not orthogonal | holds; I₂ hypothesis needed |
| `tomiyama` (13.1) | diagonal E on M₂, a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]]; F(x)=E(x)+x₁₂e₂₁; P=e₁₁·e₁₁; transpose; A=0 | E(axb)=diag(10,84)=aE(x)b; F(F(x))≠F(x) and F([[1,1],[1,1]])=[[1,0],[1,1]] not positive; ‖P‖=1, P(1)=e₁₁≠1; transpose fails fixing; A=0 gives ‖P‖=0, vacuous | holds; nonunital form |
| 13.1 Arveson Checks | transpose⊗id on Σe_ij⊗e_ij; ρ=[[1/2,c],[c̄,1/2]] | image is the flip, eigenvalue −1; ρ≥0 iff \|c\|≤1/2 | holds |
| `IsInjective`, `IsHyperfinite`, `isInjective_iff_isHyperfinite` (13.2) | ℂ1; ℓ∞; B(ℓ²); L(F₂); H=0 | x↦⟨e₀,xe₀⟩1 has norm 1; A_n=P_nB P_n+ℂ(1−P_n)≅M_n⊕ℂ; a hypertrace of L(F₂) gives an invariant mean with m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹)) over disjoint sets, total 2>1; H=0: P=0, A_n=0 | both sides agree; holds |
| Følner Checks (13.2) | ℂ², τ=(a+2b)/3, u=(1,−1), x=(1,0), ε=1/10 | basis √3δ₁, √(3/2)δ₂; ‖uP−Pu‖²=8s(1−s)≤1/100 ⇒ s≤0.00125 or ≥0.99875; P=1 gives 1/2; none within 1/10 of 1/3; T=diag(3^(−1/2),(2/3)^(1/2)) has Tr T²=1 and Tr(xT²)=τ(x) | holds |
| semidiscreteness Checks (13.2) | ℓ∞ truncations; E_n1_[0,1/3] | ‖(1,1,…)−trunc‖=1; frac(2ⁿ/3)∈{1/3,2/3}, so ‖E_nf−f‖_∞≥1/3 while ‖·‖₁≤2^(−n) | holds |
| V13b.SpatialNorm Checks | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁; 1⊗1; A=ℂ² on ℂ³ (first coordinate doubled) | u swaps e₁⊗e₁↔e₂⊗e₂ and has ‖u‖=1 (vs 2); ‖1⊗1‖=1 (vs 2); rank-2 and rank-3 projections, both of norm 1 | holds |
| II₁ and II∞ uniqueness (13.2) | R vs L(S_∞); M₂; R⊗̄B(ℓ²); B(ℓ²) | both ≅R (A–P 11.2.2); M₂ has a minimal projection, so it is excluded; II∞ via Corollary 11.2.4; B(ℓ²) not II∞ | holds |
| R02: V1 vs BanachSpaceTheory B1 | rank-one net T_F with ‖T_F‖→∞; sequences | T_F→0 SOT with unbounded norms; SOT/WOT-convergent sequences bounded by Banach–Steinhaus: the same statements at E=F=H | duplicate |
| R03: Krein–Šmulian (Tau Ceti) | V=ker φ, φ=Σn⁻²ω_(e_n) on B(ℓ²) | φ ultraweakly continuous, so V and V∩ball are ultraweakly closed (`Submodule.isClosed_iff_isClosed_inter_closedBall_zero_one`); V is WOT dense since φ(1)=π²/6≠0 | the cited statement is Tau Ceti's |
| R04: V5.Dixmier uniqueness | M₂; B(ℓ²), q even projection | K(e₁₁)∩ℂ1={1/2}; (q+uqu*)/2=1/2 and ‖(1/n)Σp_i‖=1/n, so {0,1/2}⊆K(q)∩ℂ1 | uniqueness needs finiteness: Cor 4.8.3 |
| R05: Weil formula | S₃, Γ={e,(12)}, f=δ_(13); ℤ⊂ℝ | Σf(γg): 1 at (13), 0 at (13)(12) (since (12)(13)(12)=(23)); Σf(gγ): 1 at both; abelian case: equal | the formula as written fails |
| V5 algebraic simplicity route | f_ε(t)=1/t for t≥ε=‖a‖/2 | af_ε(a)=1_[ε,∞)(a)≠0 since ‖a‖>ε; v_i*pv_i=q_i as pv_i=v_i | holds |
| V7 dimension Checks | M₂; N⊗̄M₂ ⊃ N; H=L²(N)⊗ℂ² | dim ℂ²=1/2 (L²(M₂)=2 copies); index 4; dim_N H=2=4·(1/2) | holds |
| V8.RegularL2 Checks | f=δ_(−1)+iδ₀+δ₁; h_ε*1_[0,1]; affine group | sup\|2cosθ+i\|=√5<3; error ε/12 per ramp, total ε/3; at ε=1: 1/4+1/12+1/12=5/12; ν(Eg)=ν(E)/α, so c(α,β)=α | holds |
| V10.ModularTheory and complex powers | h=diag(2/3,1/3); h=[[1/2,1/6],[1/6,1/2]] | J(h^(−1/2)e₁₂h)=6^(−1/2)e₂₁ vs (2/3)^(1/2)e₂₁; h⁻¹=[[9/4,−3/4],[−3/4,9/4]], β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]], β₋₁(e₁₁)=its adjoint | holds |
| V10.Hecke / AffineHecke | g=(α,b), α=m/n | gHg⁻¹=(1,αℤ), so L=m and R=n; ‖w_g‖²=R and ‖Δ^(1/2)w_g‖²=L give eigenvalue L/R; s_n: σ^φ_t(s_n)=n^(−it)s_n, so σ^φ_t=σ^BC_(−t) | holds |
| V10.AffineAP | d=4, a₀=3, x=10, 7, 6.9 | the counts 2, 2, 1 agree on both sides | holds |
| V12 R⊕ℂ and frame Checks | τ=(1/4)τ_R+(3/4)c; f=\|v₁\|²−1/2 on ℂ³ | distance²=(1/4)(1+\|λ\|²)+(3/4)\|z\|²≥1/4; \|τ(v,z)\|≥1/2; frame sum 1−3/2=−1/2, diag(1/2,−1/2,−1/2) has trace −1/2 | holds |
| V11 Checks | ℝ, ξ=1_[0,1]; odometer; M=ℂ core | ⟨ξ,λ_gξ⟩=max(1−\|g\|,0) with density (sin(t/2)/(t/2))²/2π of mass 1; d(T,T_n)=2^(−n); Tr∘θ_s(f)=∫f(σ+s)e^(−σ)dσ=e^sTr(f) | holds |
| V2 generator Checks | ℓ∞({x,y}), weights 3⁻ⁿ vs 2⁻ⁿ | 4/9 and 7/18 (two eigenvalues) vs 3/4 and 3/4 | holds |
| Bicentralizer Checks | h=diag(2/3,1/3), (aφb)(x)=φ(bxa) | (e₁₂φ)(e₂₁)=1/3, (φe₁₂)(e₂₁)=2/3; xφ−φx has density xh−hx | holds |

## Not verifiable

- **Uncertified, settled:** Arveson 1969, Theorem 1.2.3; Haagerup 1985; Haagerup 1987; Connes–Størmer 1978. There is no legal full text in the cache.
- **Tomiyama 1957, Theorem 1:** the cached text for `tomiyama-1957` is a five-line bot-block page ("Request unsuccessful"), although the manifest records it as certified. Hiai, Theorem 6.5 and Peterson, Theorem 6.2.1 cover 13.1's statement.
- **Not in the manifest or the cache, not fetched:** Takesaki I–III, Runde, Sakai, Goodman–de la Harpe–Jones, Reed–Simon I, Rudin, Folland, Høegh-Krohn–Landstad–Størmer 1981, Wassermann 1988/1989, Bost–Connes, Laca–Raeburn, Neshveyev, Connes 1973/1975/1985, Connes–Takesaki, Araki–Woods, Connes–Woods, Gleason 1957 and Haagerup 1979.
- **Connes, *Periodic automorphisms*:** an image-only scan, and OCR is not installed on this worker.
- **Ownership against open pull requests:** checked through the sibling checkouts and `roadmaps grep/show/overlaps` (QuantumFoundations #1771; BanachSpaceTheory #1854 via `roadmaps show --pr 1854`). Other open pull requests were checked only through those tools.

## Source issues

- **Gap** in hiai-lectures at Theorem 6.5, pp. 55–56: the source states Tomiyama's theorem for a C*-algebra and a C*-subalgebra but proves only the case of a unital von Neumann subalgebra; it should give the bidual reduction for the general case; affects the proof.
- **Misprint** in anantharaman-popa at Definition 10.2.1, p. 161: the source writes "a von Neumann M" without "algebra"; it should read "a von Neumann algebra M"; affects nothing.
- **Error** in jones-vna at Example 3.3.4, p. 13: the source says every positive contraction is a weak limit of projections, with no dimension hypothesis; it should assume H infinite-dimensional (on ℂ, 1/2 is no such limit); affects nothing.
- **Misprint** in hiai-lectures at §1.8, p. 9: the source calls "acting on a separable Hilbert space" equivalent to "separable predual"; it should say "has a faithful normal representation on a separable space" (ℂ1 on a nonseparable space); affects nothing.
- **Misprint** in anantharaman-popa at Theorem 6.4.4(ii), p. 95: the source lists "a center-valued conditional expectation", which every factor has (any state); it should read "a center-valued trace (Definition 9.1.5)", as Remark 6.4.3 intends; affects a stated result.
