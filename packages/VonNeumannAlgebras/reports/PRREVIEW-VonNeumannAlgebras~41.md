# Review of VonNeumannAlgebras (pull request #1041 at 44dcd32)

**Verdict:** needs changes

This is a full review of the head the previous review also read. Two findings are new and blocking: the `Suggested.lean` docstring calls two headline theorems "not statable", but both elaborate at the pins. The carried pin/merge finding is still open.

## R01 (P2) — The tensor commutation theorem is statable at the pins but is listed as not statable

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:25–26`: "Layer 2: the completed spatial tensor product `M ⊗̄ N` and its commutation theorem. There is no completed Hilbert tensor product of von Neumann algebras."
- README `:912–913` (the `B(K)` case) and `:3389` ("Prove the general tensor commutation theorem `(M⊗̄N)′=M′⊗̄N′`").

**Claim:** The stated reason is wrong. Mathlib at both pins (branch `6b7abb3c`, main `1b1ccf4b`) has every carrier the statement needs:
- the complete Hilbert space `UniformSpace.Completion (H ⊗[ℂ] K)`, with its `InnerProductSpace` and `CompleteSpace` instances;
- the bounded operator tensors on the inner-product tensor product;
- their extension to the completion.

The commutation theorem is a headline by the docstring's own list, so its absence is a statable headline missing.

**Witness:**
- `Mathlib/Analysis/InnerProductSpace/TensorProduct.lean` has `TensorProduct.mapL` at line 602 (with `‖mapL f g‖ ≤ ‖f‖‖g‖`) and `ContinuousLinearMap.rTensor`/`lTensor` at lines 470/536.
- `Mathlib/Topology/Algebra/LinearMapCompletion.lean:44` has `ContinuousLinearMap.completion`.
- The scratch file below, run with `lake env lean` from the worktree, exits 0 with the single warning "declaration uses `sorry`".

**Repair (tested at the branch pin):**
1. Add the two definitions and the theorem, in a Layer 11 section or a Layer 2 section for the `B(K)` case:

```lean
/-- The amplification `x ⊗ 1` on the completed Hilbert tensor product `H ⊗̂ K`. -/
def tensorLeft (K : Type*) [NormedAddCommGroup K] [InnerProductSpace ℂ K]
    (x : H →L[ℂ] H) :
    UniformSpace.Completion (H ⊗[ℂ] K) →L[ℂ] UniformSpace.Completion (H ⊗[ℂ] K) :=
  (x.rTensor K).completion

/-- The amplification `1 ⊗ y` on `H ⊗̂ K`. -/
def tensorRight (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (y : K →L[ℂ] K) :
    UniformSpace.Completion (H ⊗[ℂ] K) →L[ℂ] UniformSpace.Completion (H ⊗[ℂ] K) :=
  (y.lTensor H).completion

/-- `(M ⊗̄ N)′ = M′ ⊗̄ N′`. -/
theorem centralizer_tensor (M : VonNeumannAlgebra H) (N : VonNeumannAlgebra K) :
    Set.centralizer (tensorLeft K '' (M : Set (H →L[ℂ] H)) ∪
        tensorRight H '' (N : Set (K →L[ℂ] K))) =
      Set.centralizer (Set.centralizer
        (tensorLeft K '' (M.commutant : Set (H →L[ℂ] H)) ∪
          tensorRight H '' (N.commutant : Set (K →L[ℂ] K)))) := by
  sorry
```

   It needs `open scoped TensorProduct` and a `K` with `[NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]`.
2. Name the three declarations in the README at V2 and V11.
3. Delete the Layer 2 bullet from the docstring.
4. Re-examine the Layer 6 amplification `M ≅ pMp ⊗̄ B(ℓ²)` (docstring `:40–41`) and the Layer 12 two-projection theorem (`:56–57`). Both give the same reason, "no completed tensor product".
   - For Layer 12, `B ⊗̄ M₂(ℂ)` is `M₂(B)` acting on `K ⊕ K`, which needs no completion at all.
   - State each, or give the carrier that is actually missing.

## R02 (P2) — Projection modularity ⇔ finiteness is statable without a lattice instance

**Location:**
- `Suggested.lean:37–38`: "Layers 5 and 7: projection modularity versus finiteness (no lattice structure on the projections of a von Neumann algebra)".
- README `:1841–1843` (V5.LatticeFinite owns "the exact all-cardinality theorem `P(M) is modular ↔ M is finite`").

**Claim:** No lattice instance on `P(M)` is needed. `p ↦ ran p` is an order isomorphism of `P(M)` onto closed subspaces, sending `p∧q` to `ran p ⊓ ran q` and `p∨q` to the closure of `ran p ⊔ ran q`. So the modular law is a statement about Mathlib's `Submodule` lattice and `topologicalClosure`, and it uses the file's own `IsFinite`.

**Witness:** The scratch theorem below elaborates at the branch pin with only the `sorry` warning.
- `M₂(ℂ)`: finite, and the subspace lattice of `ℂ²` is modular, so both sides are true.
- `B(ℓ²)`: the shift has `S*S=1≠SS*`. The V2.NonmodularProjectionLattice subspaces `A=ℓ²⊕0`, `B=graph D`, `C=ℓ²⊕ℂy` give `A∨(B∧C)=A≠C=(A∨B)∧C`. Both sides are false.

**Repair:**
1. Add to the Layer 5 section:

```lean
/-- `M` is finite exactly when its projection lattice is modular, joins and meets being
taken on ranges (V5.LatticeFinite). -/
theorem isFinite_iff_modular (M : VonNeumannAlgebra H) :
    IsFinite M ↔ ∀ p ∈ M, ∀ q ∈ M, ∀ r ∈ M, IsStarProjection p → IsStarProjection q →
      IsStarProjection r → LinearMap.range (p : H →ₗ[ℂ] H) ≤ LinearMap.range (r : H →ₗ[ℂ] H) →
        (LinearMap.range (p : H →ₗ[ℂ] H) ⊔
            (LinearMap.range (q : H →ₗ[ℂ] H) ⊓ LinearMap.range (r : H →ₗ[ℂ] H))).topologicalClosure =
          (LinearMap.range (p : H →ₗ[ℂ] H) ⊔ LinearMap.range (q : H →ₗ[ℂ] H)).topologicalClosure ⊓
            LinearMap.range (r : H →ₗ[ℂ] H) := by
  sorry
```

2. Name it in V5.LatticeFinite.
3. Keep in the docstring only the Layer 7 items whose carriers are really missing (the coupling constant and the index).

## R03 (P3) — The branch is still at the old pins and conflicts with the roadmap on main

This is the previous review's R01, still open.

**Location:**
- `lake-manifest.json`.
- README `:231–326` ("From Tau Ceti … Each is used as stated at the pin").
- The pull-request description.

**Claim:** Main carries this folder (merged 2026-11-05). This branch adds the same folder from an older base, so it cannot merge. Its Tau Ceti pin lacks most of the Tau Ceti contract.

**Witness:**
- The manifest pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`.
- `git merge-tree --write-tree origin/main HEAD` reports "CONFLICT (add/add)" for `README.md` and `Suggested.lean`.
- 30 backticked names are absent at `a91d3aaf` and present at `2fd255d9`, among them:
  - `LinearMap.existsUnique_trace_mul_eq`;
  - `PositiveLinearMap.toGNS`;
  - `TauCeti.CStarAction.IsKMSFunction`;
  - `StarSubalgebra.exists_forall_norm_sub_apply_lt_of_mem_centralizer_centralizer`;
  - `TauCeti.NuclearOperator`.

**Repair:**
1. Merge main into the branch, or rebase onto it.
2. Resolve the two add/add conflicts in favour of this head's `README.md` and `Suggested.lean`.
3. Keep main's `PROGRESS.md`, `STATUS.md`, `metadata.toml` and `lake-manifest.json`.
4. Re-run the gate and `lake env lean` at main's pins. Every Mathlib name the file uses, and the R01 APIs, exist at `1b1ccf4b`.
5. Rewrite the description, which still calls this branch a "historical staged snapshot" and sends review to #889, which is merged.

## R04 (P3) — Revision-instruction residue and two stale internal references

**Location:**
- "Retain …" imperatives at `:1406`, `:1618`, `:1626`, `:1924`, `:2233`, `:2245`, `:2259`, `:2270–2271` and `:3627`. Example: "Retain standard-module dimension1 and `dim_N(L²(N)q)=τ(q)`".
- `:2475`: "generalize the existing V8 finite-multiplicity/spectral-subspace work … with its existing suppliers".
- `:874`: "downstream UO tensor operators consume it".
- `:4045`: "These ultrapower and central-sequence APIs precede the V12 flow/automorphism classification".

**Claim:**
- "Retain" and "existing … work" are edit-history residue, against the timeless house style.
- "UO" is defined nowhere. No roadmap on main has that abbreviation, so it reads as a pointer to a roadmap still in a pull request.
- Layer 12 has no flow or automorphism classification. The outer-conjugacy, flow and III₀ classification is in Layer 13 (`:4752–4810`).

**Witness:** The quoted lines. `grep -c UO` matches only `:874`. Layer 12 (`:3951–4330`) defines `Ct(M)` but classifies nothing.

**Repair:**
1. Rewrite each "Retain X" as a plain target: "Prove X", "State X", or the statement itself.
2. Drop "existing" at `:2475`.
3. Replace "UO tensor operators" with the consumer's roadmap name and section, or delete the clause.
4. Change `:4045` to "precede V13's automorphism and flow classification".

## Previous findings

- **R01 (pins and merge) — not repaired.** The manifest and the conflicts are unchanged. Carried as R03.
- **R02 — repaired.** `README.md:4948–4975` has the eight consumer bullets. Each named section exists on main: FactorRigidity §6.2 (line 594) and §7.1 (line 636); TypeAHeckeAlgebras H3 (line 193); SelfAdjointSpectralTheory SA-B85 (lines 132, 255); OperatorAlgebraDynamics D1/D5.
- **R03 — repaired.** `:874`, `:876` read `MeasureTheory.measurePreserving_piFinTwo`, and `:3727` reads `TauCeti.PontryaginDual.continuous_coe_eval_const`. Both resolve at both pins, as does `Module.Basis.SmithNormalForm` (`:3092`).

## Verified sound

**Gate, dependencies, build**
- `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main`: every check 0, `OK`, exit 0.
- The dependency check, with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
  ```

- `lake env lean …/Suggested.lean`: exit 0 in 35 s, exactly 24 "declaration uses `sorry`" warnings and nothing else.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.

**Lean form**
- `#check @name` for all 41 declarations elaborates in one scratch file. Every type keeps `[CompleteSpace H]`. The classification theorems keep `SeparableSpace` on both H and K. `tomiyama` keeps `PartialOrder`/`StarOrderedRing`. Each type matches its README sentence. Nothing in the roadmap was changed.
- One-tactic probe on a scratch copy (`first | rfl | simp | infer_instance | trivial | decide | exact?`): all 24 theorems fail, so there is no padding.
- The 6 definitions named `ProjectionEquivalent M p q` and similar appear in the README. Every Lean name is in the README.

**Ownership, ids and suppliers**
- This revision renames V2.AbelianClassification, V2.AbelianLocalizable, V2.AbelianRepresentationMultiplicity and V7.GroupApplications to V4.* and V8.GroupApplications. `roadmaps grep` finds no citation of the old ids outside this folder, on main or at any open head.
- Every V-id cited by the 14 roadmaps on main that cite this one exists in this README.
- All 24 relative links resolve on main.
- The cited supplier sections exist on main:
  - AmenableGroups Layers 5 and 7;
  - BanachAlgebras §§3.1, 7.2, 7.3, 7.5 and A7.*;
  - PD-A36/A45/B23, OI-B23/B29;
  - BanachSpaceTheory B1/B2/B4;
  - OptimalTransport Layer 2 (analytic sets, `:458`) and Layer 8 item 2 (Jankov–von Neumann, `:1004`);
  - GlobalNumberFields Layer 4;
  - Chebotarev Layers 13–14.
- The closest open roadmaps cite this one by section and own nothing it owns: QuantumFoundations (#1771) cites V12.J, V12.J.Frame and V12.J.Scalar; OperatorAlgebraDynamics (#1137), NoncompactQuantumSymmetry (#1015) and CategoricalOperatorAlgebras (#888) do the same.
- BanachAlgebras and BanachSpaceTheory list this roadmap only as a consumer, so there is no cycle.

**Library claims at the pins**
- `WStarAlgebra` is at `Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:45` (conjugate-linear predual) and has no instance for `VonNeumannAlgebra`, so `exists_predual` is not padding.
- `IsStarProjection` is at `Algebra/Star/StarProjection.lean:29`.
- `ContinuousLinearMapWOT.ofCLM` is the structure constructor at `LocallyConvex/WeakOperatorTopology.lean:61`.
- `IsStarNormal.commute_star_right` is at `CStarAlgebra/Fuglede.lean:177`.
- Neither pin has an ultraweak topology.
- Neither pin has a `CStarAlgebra`, `NonUnitalCStarAlgebra` or `StarOrderedRing` instance on `M.toStarSubalgebra`; a probe fails to synthesize all three. So the Layer 13 semidiscreteness claim stands.
- Neither pin has a faithful-representation, bicommutant, Kaplansky, Tomiyama or Dixmier theorem, so no headline duplicates the library.
- The two "same-name" leads (`WStarAlgebra.exists_predual`, the group-theoretic `IsCyclic`) are other namespaces.

**Seeded sample, 13.1 and 13.2**

Every locator was read in the cached text. "PDF n" is the page of the cached file; the other number is the printed page.

- **Hiai Theorem 6.5** (Tomiyama; hiai-lectures line 2666) is on p. 55 with proof on pp. 55–56. It is stated for a C*-algebra and a C*-subalgebra, with conclusions (ii) and (v) of Theorem 6.4 (line 2596 and line 2602), exactly as the README says.
- **Peterson Theorem 6.2.1** (peterson-notes line 3948, p. 98): unital A and unital B, `E|B=id`, `‖E‖≤1`, conclusion a conditional expectation, i.e. unital CP.
- **Peterson Theorem 6.3.8** (line 4146, p. 103): hypertrace exists iff a conditional expectation exists.
- **Tomiyama 1957, Theorem 1:** read this round from the J-STAGE open archive. The text is OCR-free, 5 pp. It is on p. 608 with proof continuing to p. 609: a unital C*-algebra M with a C*-subalgebra N, and a norm-one projection that is order preserving and N-bimodular with the Schwarz inequality. This is the "unital ambient case, positivity and bimodularity" scope the README assigns it. Anantharaman–Popa Appendix A.4, Theorem A.4 (line 13610, PDF 320 = p. 314) attributes exactly this to [Tom57].
- **Anantharaman–Popa, printed page = PDF page − 6:**
  - Definition 10.2.1 and Proposition 10.2.2 at lines 7191 and 7198 (p. 161); footnote 2 is "or equivalently a norm-one projection".
  - Proposition 10.2.5, line 7269, p. 163.
  - Theorems 10.2.8 and 10.2.9, lines 7325 and 7333, p. 164. Condition (2) is a positive finite-rank T with `‖T‖_(2,Tr)=1`, (10.1) and (10.2), as restated.
  - Theorem 10.3.1, line 7413, p. 166: a finite-rank projection with `‖uPu*−P‖_(2,Tr)<ε‖P‖_(2,Tr)` and no trace clause.
  - Theorem 10.3.4, line 7532, p. 168.
  - Definitions 11.1.1–11.1.2 and Theorem 11.1.3, lines 7685–7702, p. 173.
  - Theorem 11.2.2, line 8294, p. 186, with (3) the sequential unital form `IsHyperfinite` uses.
  - Remark 11.2.3, the AFD-factor definition, and Corollary 11.2.4, lines 8358–8376, p. 188.
  - Notes, line 8409, p. 189: "the converse being immediate".
  - §12.5 starts on p. 208.
- **Hiai §1.8** (line 327, p. 9): separable H, sequential AFD, injective = norm-one projection, Connes's equivalence.
- **Haagerup 1989:** Connes's result restated on p. 265 (line 35); Theorem 6.1 on p. 303 (line 1177), with the hypothesis `σ_(t₀)^φ=id`.
- **Haagerup 2016:** Theorems 1.1–1.2 on p. 2 (lines 49 and 52), Theorem 2.4 (Connes–Størmer, line 222) and Lemma 4.4 (line 669).
- **Connes–Feldman–Weiss:** Definitions 5–6 (lines 265 and 281), Proposition 7 (line 336; a norm-one projection restricts to an invariant mean), Lemmas 8–9 and Theorem 10 (line 520).

**Other locators read**
- **Anantharaman–Popa:**
  - Definition 2.5.1 (p. 40), Theorem 2.5.5 (p. 42) and Remark 2.5.7 (p. 43, `ω=Σω_(ζ_n)`).
  - Definition 2.6.6 (p. 48), Corollary 2.4.11 and Proposition 2.4.13 (p. 39), Proposition 4.1.6 (p. 61).
  - Theorem 6.2.8 (p. 88), Theorem 6.4.1 (p. 93), Corollary 6.4.2 (p. 94), Theorem 6.4.4 (p. 95), Theorem 7.1.1 (p. 99).
  - Proposition 8.2.2 (p. 124) and Definition 8.3.1 (pp. 124–125), whose (d) semifiniteness and (e) normality match `IsNormalSemifiniteTrace`.
- **Peterson:**
  - Corollary 4.1.7 (p. 58), Theorem 4.4.6 (p. 66), Proposition 4.2.2 (p. 60).
  - Lemma 4.7.9 (p. 71), Theorem 4.7.10 (p. 72), Proposition 4.7.12 (p. 73).
  - Theorem 4.8.2 (p. 75) and Corollary 4.8.3 (p. 76).
  - Theorem 4.9.4 (p. 78), which is the full content of `exists_isNormalSemifiniteTrace_of_isFactor`, and Proposition 4.9.5 (p. 79).
  - Theorem 3.3.1 (p. 49), Theorems 2.5.6, 2.6.4, 2.8.5 and Lemma 2.8.8 (pp. 29–38), Theorem 4.3.3 (p. 62), Proposition 4.1.4 (p. 56), Theorem 5.1.6 (p. 84).
- **Jones:**
  - Theorems 3.2.1–3.2.2 and Corollary 3.2.3 (p. 12), Theorem 5.2.1 (p. 32) and Corollary 5.2.2 (p. 33).
  - Theorems 4.4.1–4.4.2 (p. 28) and Exercises 4.4.3, 4.4.5 with Example 4.4.4 (p. 29).
  - EP10 (p. 23), Theorem 8.1.15 (p. 53), Theorem 16.3.1 (p. 108, hypotheses (a)–(b) and the constant 14 as restated).
  - §11.2 (p. 73, the compact-group paragraph before Example 11.2.17) and Example 11.2.21 (pp. 73–74).
- **Hiai:** §2.2 (p. 17, Definition 2.11 at β=−1 gives the strip `0≤Im z≤1`, `f(t)=φ(α_t(x)y)`, `f(t+i)=φ(yα_t(x))`), Lemma 2.13 and Theorem 2.14 (p. 18), Theorem 9.7 and Propositions 9.3 and 9.4 (pp. 83–87).
- **Bunce–Wright:** Theorems A and B (p. 289), conditions (a)–(b) (p. 288), and Lemma 1.1's bound `‖β‖≤4 sup|β(p)|` (p. 289).
- **Hamhalter:** Dye's theorem with uniqueness (pp. 2–3, lines 85–91) and Theorem 4.3 (p. 14).
- **Wassermann 1988:** the Introduction theorem (p. 309) and Theorem 1 (p. 311). The bound `m_ij(π)≤dim π` is on the last lines of p. 309; I checked a rendered image because the OCR drops that line.

**Adversarial table**

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_faithful_nondegenerate_representation` | A=0; A=c₀ (nonunital) | K=0, span of ranges `{0}` dense in `{0}`; c₀ diagonal on ℓ², span `c₀·ℓ²⊇` finite sequences, dense | holds | none |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | `λ↦λ·1` on ℓ², injective, span = ℓ²; for A=0 a dense span of `{0}` in ℓ² fails, so `Nontrivial A` is needed | holds | none |
| `double_commutant_iff_isClosed_image_ofCLM` | ℂ1 on ℂ²; finite-rank + scalars on ℓ² | `A''=A`, WOT closed: T/T; `A''=B(ℓ²)≠A`, A WOT-dense: F/F | holds | none |
| `closure_unitBall_eq_unitBall_double_centralizer` | finite-rank + scalars on ℓ², q = even-coordinate projection | `qP_n→q` SOT with `‖qP_n‖=1`; `‖q−(c+F)‖≥max(|1−c|,|c|)≥1/2`, so membership is SOT, not norm | holds | none |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ (excluded); ℓ², A=½ | projections `{0,1}`∌½; block `[[½,½],[½,½]]` is idempotent and compresses to ½ on F | holds | none |
| `exists_predual` / `exists_vonNeumannAlgebra_starAlgEquiv` | M₂; ℓ∞(ℕ) | dual of `S₁(ℂ²)` is M₂ via `Tr(xh)`; ℓ∞ = (ℓ¹)*, realized diagonally on ℓ² | holds | none |
| `isNormalFunctional_iff_exists_tsum_inner` | `Σ2^(−n−1)ω_(e_n)` on ℓ∞; ultrafilter state | `ξ_n=2^(−(n+1)/2)e_n`, `Σ‖ξ_n‖²=1`, `τ(1_{0..N})=1−2^(−N−1)→1`: T/T; ultrafilter has `τ(δ_n)=0`, `τ(1)=1`: F/F | holds | none |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diagonal ℂ²; H=0 | e₁ cyclic, M′=ℂ1 separating; (1,0): `diag(0,1)` kills it, not cyclic: F/F; 0: T/T | holds | none |
| `equivalent_of_subequivalent` | B(ℓ²), p=1, q=1−e₀e₀* | S has `S*S=1`, `SS*=q`, so p∼q with p≠q | holds | none |
| `tracialState_unique` | M₂; ℂ⊕ℂ (not a factor); B(ℓ²) | only tr/2; `t·pr₁+(1−t)pr₂` for all t; `τ(1)=2τ(1)`, none | holds | none |
| `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | R=⊗M₂; ideal through p with τ(p)=1/4 | `τ(x*x)=0⇒x=0`; four `q_i=v_i*pv_i` of trace 1/4 sum to 1, so I=M; ℓ∞ ⊃ c₀ shows the II₁ hypothesis is needed | holds | none |
| `exists_isNormalSemifiniteTrace_of_isFactor` | B(ℓ²); R⊗̄B(ℓ²); τ′=0 | `Tr(p)=rank p` (finite ⇔ finite rank); `Tr(p⊗e₀₀)=τ(p)`, `Tr(1)=∞`; τ′=0 gives c=0 | holds | none |
| `IsNormalSemifiniteTrace` negative controls | `x↦‖x‖`; ∞ off 0 | `‖e₁₁+e₂₂‖=1≠2`, not additive; additive, normal and faithful but no finite y≤x, not semifinite | holds | none |
| `exists_conj_commutant_eq_of_isCyclic` | ℂ on ℂ; M₂ on (M₂,tr/2); M₂ on ℂ² | J=conj, M′=ℂ; `Jx=x*`, JMJ = right multiplication; e₁ gives ⟨e₁,e₁₂e₂₁e₁⟩=1 against ⟨e₁,e₂₁e₁₂e₁⟩=0, not tracial | holds | none |
| `existsUnique_typeDecomposition` | M₂, R, R⊗̄B(ℓ²), M₂⊕R | (1,0,0,0), (0,1,0,0), (0,0,1,0), (1⊕0,0⊕1,0,0); a weak type-I clause also admits (1,0,0,0) for M₂⊕R | holds | none |
| `ergodicSMul_dense_subgroup` | ℚ⊂ℝ; ℤ⊂ℝ (not dense) | ergodic; `⋃[n,n+½)` invariant and not null/conull | holds | none |
| `existsUnique_isKMS_flow` | M₂, h=diag(2/3,1/3), x=e₁₂, y=e₂₁; `Ad(diag(3^(it),1))` | `F=(2/3)2^(iz)`, `F(t)=(2/3)2^(it)`, `F(t+i)=(1/3)2^(it)`; for `3^(it)`, `(2/3)3^(i(t+i))=(2/9)3^(it)≠(1/3)3^(it)` | holds | none |
| `exists_unique_extension_of_finitelyAdditive` | M₂ (I₂, excluded); M₃, `μ=Tr(diag(1,−1,0)·)`; H=0 | sgn frame value 3/4 against affine 0.677 at `(1/√2,0,1/√2)`; C=1, `‖φ‖=2≤4`; `μ(0)=2μ(0)` | holds | none |
| `dye`, `HasTypeITwoSummand` | transpose on M₃; Bloch map on M₂; M₃, M₄ | `(e₁₂e₂₁)ᵀ=e₁₁≠e₂₂`, Jordan only; images `(1,0,±2)/√5` have inner product −3/5≠0; `2·rank e=3` impossible, and `eM₄e≅M₂` is not abelian | holds | none |
| `tomiyama` (13.1) | diagonal compression of M₂, a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]]; `x↦e₁₁xe₁₁`; transpose | `E(axb)=diag(10,84)=aE(x)b`; nonunital range ℂe₁₁, norm 1; transpose fails fixing (`e₁₂↦e₂₁`) | holds | none |
| Arveson Checks (13.1) | transpose amplification; state `(a+b)/2` | `Σe_ij⊗e_ij↦` flip with eigenvalue −1, not CP; extensions `Tr(ρ·)` for every `|c|≤½` | holds | none |
| `IsInjective`, `IsHyperfinite`, `isInjective_iff_isHyperfinite` (13.2) | B(ℓ²); R; L(F₂); zero algebra | P=id and `M_n⊕ℂ` tower: T/T; `M_(2ⁿ)`: T/T; a hypertrace gives `m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹))`, total 2>1: F/F; P=0, `A_n=⊤`: T/T | holds | none |
| V13b.SpatialNorm (13.2) | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `1⊗1`; `(A,B,ψ)=(0,ℂ,id)` | `‖u‖_min=1` against cross-norm sum 2; 1 against HS 2; `‖R_ψ‖=0<1` | holds | none |
| AP 10.3.1 projection form (13.2) | ℂ² with `τ=(a+2b)/3`, u=(1,−1), ε=1/10 | `8|α|²|β|²≤1/100⇒|α|²<0.0013` or `>0.9987`, trace ratio far from 1/3; `T=diag(3^(−½),(2/3)^½)`: `‖T‖₂²=1`, `Tr(xT²)=τ(x)` | holds | none |
| injective II₁ / II∞ uniqueness (13.2) | R and L(S_∞); M₂⊗̄B(ℓ²) | both injective II₁ ≅ R; minimal projections make it type I∞, so `IsTypeIIInfinity` fails | holds | none |
| R01 `centralizer_tensor` | M=B(ℂ²), N=ℂ1 on ℂ² | LHS `(B(ℂ²)⊗1)′=1⊗B(ℂ²)`; RHS `(ℂ⊗1 ∪ 1⊗B(ℂ²))″=1⊗B(ℂ²)` | statable, true | add |
| R02 `isFinite_iff_modular` | M₂; B(ℓ²) | finite and modular: T/T; S not unitary, V2 triple violates the modular law: F/F | statable, true | add |

## Not verifiable

- **Uncertified and settled, cited by locator:** Arveson 1969, Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- **Not in the cache and not cited by a sampled passage, so not read:** Takesaki I–III, Sakai, Reed–Simon I, Rudin (*Functional Analysis*, *Fourier Analysis on Groups*), Folland, Runde, Goodman–de la Harpe–Jones, Gleason 1957, Bost–Connes, Laca–Raeburn, Neshveyev, Connes 1973/1975/1985 and *Periodic automorphisms*, Araki–Woods, Connes–Woods, Connes–Takesaki, Haagerup 1979, Høegh-Krohn–Landstad–Størmer, Wassermann Part I.
  - Takesaki I IV.4.9 and III XV.3 / XVI.1.9 are the 13.2 locators in this group.
- **The manifest's tomiyama-1957 URL** (Project Euclid) still returns a bot-block page. The text was read from J-STAGE instead. This review edits no manifest.

## Source issues

- **Error** in jones-vna at Example 3.3.4, p. 13: the source says every positive self-adjoint contraction is a weak limit of projections; it should be: so on an infinite-dimensional H (in finite dimension the projections are weakly closed, so ½·1 is no such limit); affects nothing.
- **Gap** in hiai-lectures at Theorem 6.5, p. 55: the source states Tomiyama's theorem for any C*-algebra and C*-subalgebra but proves only a von Neumann algebra with a unital von Neumann subalgebra; it should be: a proof at the stated generality (the second-dual reduction, nonunital subalgebra included); affects the proof.
