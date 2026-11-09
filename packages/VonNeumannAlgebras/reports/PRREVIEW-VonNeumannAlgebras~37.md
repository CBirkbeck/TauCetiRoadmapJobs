# Review of VonNeumannAlgebras (pull request #1041 at 7d10de2)

**Verdict:** needs changes

This is a full review of the head the previous review (r36) also read; the folder is unchanged since then. The previous review's single finding is not repaired and is carried below as R01. The full pass found three new P3 defects:
- R02: a source locator that credits Tomiyama 1957 with more than its Theorem 1 states.
- R03: two consumer labels, "R6" and "R7", that do not exist in FactorRigidity.
- R04: a false Check in Layer 11.

There is no P1 or P2. The gate and the dependency check pass. `Suggested.lean` elaborates at the branch pins with exactly its 24 `sorry` warnings. Every statement in the adversarial table below holds on the instances computed.

## Previous findings (review of 7d10de2, r36)

- R01 (stale pins, add/add conflict with main): not repaired. The head is byte-identical. `lake-manifest.json` still pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`, and `git merge-tree --write-tree origin/main HEAD` still reports two conflicts, both add/add: `README.md` and `Suggested.lean`. Carried as R01. No repair report marks it not actionable.

## R01 (P3) — The branch is at the old pins and conflicts with the roadmap now on main

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:231–326`, the "From Tau Ceti" contract, which ends "Each is used as stated at the pin."
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:120–124`, which cites `LinearMap.existsUnique_trace_mul_eq`.

**Claim:** The contract holds only at main's Tau Ceti pin. At the branch's own pin, 15 of the 26 cited Tau Ceti files do not exist. Separately, main already carries this roadmap (merged with #889, together with `PROGRESS.md`, `STATUS.md` and `metadata.toml`), so the branch cannot merge as it stands.

**Witness:**
- Absent at `a91d3aaf`, present at `2fd255d9`: `TauCeti/Analysis/CStarAlgebra/{GNS,Representation/Nondegenerate,Action/KMS/Basic,Action/Inner,Action/Gibbs}.lean`, `Analysis/VonNeumannAlgebra/{Adjoin,Density}.lean`, `LinearAlgebra/Matrix/Trace/Duality.lean`, the six Banach-duality/Krein–Šmulian/nuclear files.
- `git merge-tree` reports two add/add conflicts.

**Repair:**
1. Rebase onto main, or merge main.
2. Resolve both add/add conflicts in favour of this head's `README.md` and `Suggested.lean`.
3. Keep main's `PROGRESS.md`, `STATUS.md`, `metadata.toml` and `lake-manifest.json`, then re-run the gate at main's pins.

At main's pin every cited declaration exists in its stated file (see Verified sound).

The previous round also proposed an optional Lean change: state the Layer 0 clause as `π.IsNondegenerate` with its `TauCeti` import. That change is not required, since the written-out body is the definition and `Suggested.lean:17–18` describes it accurately. If it is made, make it only after the rebase, because the module is absent at `a91d3aaf`.

## R02 (P3) — Tomiyama 1957, Theorem 1, does not state complete positivity

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:4341–4348`: "…and P is completely positive… (Hiai, Theorem 6.5, pp. 55–56; Tomiyama, Proc. Japan Acad. 33 (1957), Theorem 1, pp. 608–609, for the unital ambient case…)". `README.md:4990–4991` gives the same attribution.

**Claim:** The parenthesis presents Tomiyama's Theorem 1 as the unital-ambient case of the whole statement, including complete positivity. The theorem proves less.

**Witness:** The publisher copy (J-STAGE, Proc. Japan Acad. 33 no. 10) has Theorem 1 at its line 19–22, p. 608. For a unital C*-algebra and a norm-one projection onto a C*-subalgebra it gives three conclusions:
1. order preservation;
2. bimodularity;
3. the Schwarz inequality `π(x)*π(x)≤π(x*x)`.

It does not state complete positivity. Complete positivity is in Hiai, Theorem 6.5 (v) (hiai-lectures line 2666, p. 55), and in Peterson, Theorem 6.2.1 (peterson-notes lines 3948 and 3971, p. 98).

**Repair:** Make two edits.
1. At `:4346–4348`, write "Tomiyama, … Theorem 1, p. 608, with its proof on p. 609, for positivity, bimodularity and the Schwarz inequality in the unital ambient case; complete positivity is Hiai, Theorem 6.5 (v), and Peterson, Theorem 6.2.1".
2. At `:4990–4991`, write "for positivity and bimodularity of a norm-one projection (13.1)".

## R03 (P3) — "FactorRigidity R6" and "R7" are not ids of FactorRigidity

**Location:**
- `README.md:1549`: "V11 and FactorRigidity R6 consume this selection layer."
- `README.md:3846–3847`: "FactorRigidity R6 specializes this API to p.m.p. relations."
- `README.md:3858–3859`: "R7 of FactorRigidity consumes this relation API and owns its p.m.p. cost theory."

**Claim:** These are cross-roadmap citations of ids that FactorRigidity does not define.

**Witness:** FactorRigidity on main contains no "R6" or "R7" anywhere. Its layers are `## Layer 6: Cartan pairs and measured orbit relations` (line 573) and `## Layer 7: Cost and a trivial fundamental group` (line 634). They consume VonNeumannAlgebras §V11 and §V4 at lines 592, 596, 606, 650 and 669. The content of the three sentences is right; only the labels are wrong.

**Repair:**
- Replace "FactorRigidity R6" with "FactorRigidity Layer 6" at `:1549` and `:3846`.
- Replace "R7 of FactorRigidity" with "FactorRigidity Layer 7" at `:3858`.

## R04 (P3) — A Layer 11 Check calls a non-faithful weight faithful

**Location:** `README.md:3350–3351`: "The weight `φ(x)=Σ_n n·x_nn` on `ℓ∞(ℕ)` is normal, faithful and semifinite…"

**Claim:** The README indexes `ℓ∞(ℕ)` from 0 elsewhere, and under that indexing this weight is not faithful. Separately, `x_nn` is a double index on a sequence.

**Witness:** The Layer 4 Checks at `:1259–1266` use `1_{0,…,N}` and the normal state `δ₀` on `ℓ∞(ℕ)`, so ℕ starts at 0. Then `φ(δ₀)=0·1=0` with `δ₀≥0` nonzero, so φ is not faithful.

**Repair:** Write "The weight `φ(x)=Σ_n (n+1)·x_n` on `ℓ∞(ℕ)`".

Check of the repaired weight:
- `φ(δ_n)=n+1>0`, so it is faithful.
- On the finitely supported elements `1_{0,…,N}↑1` its values `(N+1)(N+2)/2` increase to `∞=φ(1)`, so it is normal and not bounded.
- Finitely supported positive elements have finite weight, so it is semifinite.

## Verified sound

**Gate, dependency check and pull-request scope.**
- `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main`, run this round, printed every check 0 and `OK` (exit 0), matching the worker's gate file.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.
- Dependency check output, exit 0. There is no UPWARD, CYCLE or `moved:` line, and VonNeumannAlgebras is line 5 of the merge order:

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

- Every supplier is on main: BanachSpaceTheory, OperatorTheory, AmenableGroups, BanachAlgebras, RepresentationTheory/{CompactGroups,SemisimpleAlgebras,LieHighestWeight}, OptimalTransport, Completed/GlobalNumberFields, Completed/Chebotarev, Completed/OneParameterSemigroups and ModularForms. This matches the rule for a roadmap already on main.

**Lean, at the branch pins.**
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 in 11 s with exactly 24 `declaration uses sorry` warnings and nothing else.
- `#check @name` pass: a scratch copy with one `#check @` per declaration elaborates all 41 declarations. The worker's 42nd item, `and`, is prose at docstring line 62.
  - Every binder of each statement is in its own signature.
  - The four section-variable-free declarations need none: `exists_faithful_nondegenerate_representation`, `exists_injective_nondegenerate_representation_lp`, `tomiyama` and `ergodicSMul_dense_subgroup`.
  - Each elaborated type matches its README statement. Nothing changed.
- One-tactic probe: in a scratch copy each of the 24 `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | decide`. All 24 sites fail (24 errors, one per site), so no declaration is padding.
- Carrier probe: a scratch file tested the docstring's reason for not stating semidiscreteness. At the pin, `IsClosed (M.toStarSubalgebra : Set (H →L[ℂ] H))` is not an instance, and `StarOrderedRing ↥M.toStarSubalgebra` fails to synthesize. With an explicit `IsClosed` instance, `CStarAlgebra` does synthesize. `B(H)` and `CStarMatrix (Fin n) (Fin n) ℂ` have both instances, and `CompletelyPositiveMap (H →L[ℂ] H) (CStarMatrix …)` elaborates. The docstring claim is accurate.
- The docstring's other not-statable claims were checked at the branch Mathlib:
  - no ultraweak, ultrastrong or σ-weak topology (no file mentions them);
  - no ring on `Lp ∞`, only the Hölder `HSMul (Lp 𝕜 p μ) (Lp E q μ) (Lp E r μ)` (`Mathlib/MeasureTheory/Function/Holder.lean:183`);
  - no direct integral and no group von Neumann algebra.

**Library declarations opened.**
- Mathlib, branch pin `6b7abb3c`:
  - `CompletelyPositiveMap` at `Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean:50`, which needs `NonUnitalCStarAlgebra`, `PartialOrder` and `StarOrderedRing` on both sides;
  - `StarSubalgebra.cstarAlgebra` at `Mathlib/Analysis/CStarAlgebra/Classes.lean:50`, which needs `[IsClosed (s : Set A)]`, with `IsClosed` a class at `Topology/Defs/Basic.lean:106`;
  - `ContinuousLinearMapWOT.ofCLM` at `Mathlib/Analysis/LocallyConvex/WeakOperatorTopology.lean:61`.
- A one-pass search of all 188 backticked library names of the README over the branch Mathlib and Tau Ceti trees finds every Mathlib name. The only misses are the Tau Ceti names in the files absent at `a91d3aaf` (R01).
- Tau Ceti, main pin `2fd255d9`:
  - `Analysis/VonNeumannAlgebra/Adjoin.lean:38–74`: `adjoin`, `coe_adjoin`, `coe_commutant_adjoin`, `subset_adjoin`, `adjoin_le_iff`, `adjoin_mono`.
  - `Analysis/CStarAlgebra/GNS.lean:54–110`: `toGNS`, `denseRange_toGNS`, `gnsVector`, `inner_gnsStarAlgHom_gnsVector`, `inner_gnsVector_coe`, `denseRange_gnsStarAlgHom_gnsVector`, `norm_gnsVector`.
  - `Representation/Nondegenerate.lean:62,68,82`.
  - `Action/KMS/Basic.lean:83–89`. Its fields give `F t = φ(a α_t b)` and `F(t+βI) = φ(α_t b a)`, as the README states.
  - `Action/KMS/Basic.lean:106` (`eqOn`), `:182`, `:222`; `Action/Inner.lean:43,70`; `Action/Gibbs.lean:61,86,117`.
  - `LinearAlgebra/Matrix/Trace/Duality.lean:31`; `Analysis/Normed/Operator/Nuclear.lean:382` (`NuclearOperator.norm_smulRight`); `Analysis/VonNeumannAlgebra/Density.lean:128`.
  - `NumberTheory/HeckeRing/Multiplicity/Basic.lean:70`. `multiplicity` counts pairs with `σ_i g τ_j h Γ₃ = dΓ₃`, the left-coset count of V10.Hecke.
  - `Analysis/Fourier/Pontryagin/DualEval.lean:29` (`continuous_coe_eval_const`).
- Tau Ceti, branch pin `a91d3aaf`: `StronglyMeasurable/InnerRegular.lean:82`, `Integrated/Basic.lean:46`, `Pontryagin/StronglyContinuous.lean:283`, `Measure/FiniteMeasureExt.lean:263`, `Pontryagin/Uniqueness.lean:263`, `Ideal/IntegersRat.lean:162`, `HeckeRing/Multiplication.lean:124`.

**Cross-roadmap citations resolved (31, on main).**
- OperatorTheory:
  - PD-A36–A45 and PD-B23–B36, including B24 and B36;
  - OI-B23, OI-B29–B31 and OI-B32–B41;
  - SelfAdjointSpectralTheory SA-B85, which consumes V4.0.Fields (line 255).
- BanachSpaceTheory: B1 (line 54, SOT/WOT generic topologies); B2 (line 135, `james`); B4 (line 239, Schmidt series and identification with OI-B29–B30).
- AmenableGroups: Layers 5, 6 and 7 (lines 289, 391, 415).
- BanachAlgebras: §3.1 (756), §7.2 (1555), A7.IntegratedRepresentations (1615), A7.RegularL2 (1633), A7.CharactersAndUniqueness (1739).
- OptimalTransport: Layer 2 (444, analytic sets and completion) and Layer 8 item 2 (Jankov–von Neumann, line 1004).
- Completed/GlobalNumberFields Layer 4 (418); Completed/Chebotarev Layers 13–14 (593, 612).
- RepresentationTheory/SemisimpleAlgebras double centralizer (line 28).
- Consumer labels: NoncommutativeIntegration I4 (1472–1479), TypeAHeckeAlgebras H3, OperatorAlgebraDynamics D1/D4/D5, CStarAlgebras C3–C6.
- Every dotted V-id cited by the 14 roadmaps on main that cite this one exists in this head.
- Of the 19 Lean names in main's `Suggested.lean`, none is dropped.
- Renamed ids:
  - V2.Abelian* → V4.Abelian* and V7.GroupApplications → V8.GroupApplications are cited by no other roadmap.
  - V11.FourierUniqueness is cited by BanachAlgebras (main, line 2043) and by OperatorAlgebraDynamics at its open head (#1137, lines 172, 477, 2177). This head maps it at `README.md:411–413`.

**Ownership against open pull requests.**
- The ten sibling heads with paths in the brief cite VonNeumannAlgebras for these objects rather than restating them:

  | Open head | Citations of this roadmap |
  | --- | --- |
  | OperatorAlgebraDynamics | 55 |
  | QuantumFoundations | 48 (its line 23 consumes V12.J.Frame/Bloch) |
  | NoncompactQuantumSymmetry | 37 |
  | CategoricalOperatorAlgebras | 11 |
  | CStarClassification | 7 |
  | HilbertModules | 2 |
  | NoncommutativeGeometry | 9 |
  | OperatorTheory | 0 hits on these objects |
  | TemperleyLiebOperatorAlgebras | 7 |
  | OperatorKTheory | 5 |

- `roadmaps overlaps` and `roadmaps resolve` report nothing.
- AnalyticNumberTheoryPartII (#1167) has no path in the brief, so it was not checked.

**Seeded sample (13.1, 13.2): sources at their locators.**
- anantharaman-popa (printed page = pdf page − 6):
  - Definition 10.2.1 and Proposition 10.2.2 at lines 7191 and 7198, p. 161. Injectivity there is a conditional expectation, which footnote 2 equates with a norm-one projection; (i)⇔(ii) CP extension ⇔(iii) every representation.
  - Proposition 10.2.5, line 7269, p. 163: hypertrace.
  - Theorem 10.2.8, line 7325, p. 164: Powers–Størmer `‖x−y‖²₂ ≤ ‖Tr(x²·)−Tr(y²·)‖`, which is the README's `a=x²`, `b=y²` form.
  - Theorem 10.2.9(2), line 7333, p. 164: positive finite-rank T with `‖T‖₂=1`, the commutator bound and `sup_(‖x‖≤1)|Tr(xT²)−τ(x)|≤ε`, exactly as restated.
  - Theorem 10.3.1, line 7413, p. 166: projection form without trace clause, for II₁ factors (line 7404).
  - Theorem 10.3.4, line 7532, p. 168.
  - Definitions 11.1.1–11.1.2 and Theorem 11.1.3, lines 7685–7702, p. 173.
  - Theorem 11.2.2(3), line 8298, p. 186: increasing finite-dimensional unital `*`-subalgebras with `(∪Qₙ)''=M`, which is `IsHyperfinite`.
  - Remark 11.2.3, AFD definition and Corollary 11.2.4 at lines 8358, 8371 and 8376, p. 188.
  - Notes, line 8410, p. 189: "the converse being immediate".
  - §12.5 from p. 208 (TOC line 99; §13.1 at p. 213).
  - Also checked: Definition 2.6.6, p. 48; Definition 2.5.1, p. 40; Theorem 2.5.5 and Remark 2.5.7 (3′) `ω=Σωζₙ`, pp. 42–43; Theorem 6.4.1, p. 93; Theorem 7.1.1, p. 99; Definition 8.3.1, p. 124.
- hiai-lectures:
  - Theorem 6.5 (Tomiyama), line 2666, p. 55, proof to p. 56: for general C*-algebras a norm-one projection satisfies Theorem 6.4 (ii) bimodularity and (v) complete positivity (line 2602).
  - §1.8, p. 9, lines 328–334: sequential AFD definition, injectivity by norm-one projection, Connes 1976.
- peterson-notes:
  - Theorem 6.2.1, line 3948, p. 98: unital inclusion, contractive projection is CP (line 3971).
  - Theorem 6.3.8, line 4146, p. 103.
  - Also checked: Corollary 4.1.7, p. 58; Proposition 4.2.2, p. 60; Theorem 4.4.6, p. 66; Theorem 4.7.10, p. 72; Proposition 4.7.12, p. 73; Theorem 4.8.2, p. 75; Theorem 4.9.4, p. 78 (unique up to scalar, faithful, finite iff finite trace); Theorem 3.3.1, p. 49; Theorems 2.5.6 and 2.6.4, pp. 29, 31.
- Tomiyama 1957, publisher copy: Theorem 1, p. 608 (R02).
- connes-feldman-weiss: Definition 5 (line 265), Definition 6 (281), Proposition 7 (336, norm-one projection restricts to an invariant mean), Lemma 8 (382), Lemma 9 (480), Theorem 10 (520, hyperfinite iff amenable, no ergodicity).
- haagerup-1989: p. 265 restates Connes's uniqueness (lines 35–39). Theorem 6.1, p. 303 (line 1177) needs a normal faithful φ with `σ_(t₀)^φ=id`, `t₀=−2π/log λ`, exactly as restated.
- haagerup-2016: Theorems 1.1–1.2, p. 2 (lines 49–53).
- jones-vna: Theorems 3.2.2 (p. 12), 5.2.1 (p. 32) and 8.1.15 (p. 53); Corollary 5.2.2 (p. 33); EP10 (p. 23); Theorem 16.3.1 (p. 108, constant 14).

**Adversarial pass.** Values were computed this round. CS denotes Cauchy–Schwarz.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `tomiyama` (13.1) | `E(x)=x₁₁e₁₁+x₂₂e₂₂` on M₂; `P(x)=e₁₁xe₁₁`; transpose; A=0 | `a=diag(2,3)`, `b=diag(5,7)`, `x=[[1,2],[3,4]]`: `axb=[[10,28],[45,84]]`, `E(axb)=diag(10,84)=aE(x)b`; P fixes ℂe₁₁, `‖P‖=1`, `P(1)=e₁₁≠1`; transpose sends e₁₂ to e₂₁ (fails fixing); A=0 has `‖P‖=0≠1` | holds; nonunital S and non-closed S both covered (range = `ker(1−P)` closed) |
| Arveson Checks (13.1) | transpose on M₂; state `(a+b)/2` on diagonal | `Σe_ij⊗e_ij` ↦ flip, eigenvalue −1; extensions `Tr(ρ·)`, `ρ=[[1/2,c],[c̄,1/2]]`, `det=1/4−|c|²≥0` iff `|c|≤1/2`, `Tr(ρ diag(a,b))=(a+b)/2` | not CP; non-unique extensions |
| `IsInjective` | `B(H)`; `ℓ∞⊂B(ℓ²)`; H=0 | identity has norm 1; diagonal expectation is normal; on H=0, `P=0` with `‖P‖=0≤1` | definition matches AP 10.2.2(iii) |
| V13b.SpatialNorm Checks | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `1⊗1`; `(0,ℂ,id)` | u swaps `e₁⊗e₁`, `e₂⊗e₂`, kills the others: `u*u` rank 2, `‖u‖=1` vs sum 2; `‖1⊗1‖=1` vs HS `√2·√2=2`; slice norm 0 vs `‖ψ‖=1` | hold |
| `IsHyperfinite` (13.2) | R; `B(ℓ²)`; H=0; `L(ℤ)` | `M_(2ⁿ)`; `A_n=P_nxP_n+λ(1−P_n)` nested since `P_n≤P_(n+1)`; ⊥ subalgebra, `{0}''=B(0)`; `ℓ∞(2ⁿ)` | AP 11.2.2(3) form |
| Følner forms (13.2) | `ℂ²`, `τ(a,b)=(a+2b)/3`, `u=(1,−1)` | basis `√3δ₁`, `√(3/2)δ₂`; rank-one P: `‖[u,P]‖²=8|α|²|β|²≤1/100` forces `|α|²<0.0013` or `>0.9987`; P=1 gives 1/2; τ(x)=1/3 is further than 0.1 from all of these | projection form with trace clause fails here; operator form `T=diag(3^(−1/2),(2/3)^(1/2))` gives `Tr(xT²)=a/3+2b/3` |
| `L(F₂)` has no hypertrace | `F₂=W(a)⊔aW(a⁻¹)` | `ψ(λ_g f λ_g*)=ψ(f)`, so `m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹))`; total 2 > 1 | holds |
| Semidiscreteness Checks | `ℓ∞(ℕ)` truncations; dyadic `E_n` on `1_[0,1/3]` | x=(1,1,…): norm error 1 for every N; dyadic value `frac(2ⁿ/3)∈{1/3,2/3}`, `‖E_nf−f‖_∞≥1/3`, `‖E_nf−f‖₁≤2^(−n)` | point-ultraweak, not norm |
| `isInjective_iff_isHyperfinite` | `B(ℓ²)`; H=0; `L∞[0,1]`; `L(F₂)` | yes/yes; yes (P=0) and yes (⊥ algebras); yes/yes; no/no | both sides agree |
| II₁ and II∞ uniqueness | `M_n`; R; `B(ℓ²)`; `R⊗̄B(ℓ²)` | `M_n` has minimal projections, so it is not IsTypeIIOne; `B(ℓ²)` has minimal projections, so it is not IsTypeIIInfinity; R is finite and diffuse; `R⊗̄B(ℓ²)` is infinite with finite `1⊗e₀₀` | hypotheses select exactly the intended factors |
| CFW Checks | finite classes; full relation on n atoms | `P(f)(x)=|[x]|⁻¹Σf(x,y)` unital positive invariant; regular algebra `M_n` | hold |
| Bicentralizer Checks | M₂, `h=diag(2/3,1/3)`; convention `(aφb)(x)=φ(bxa)` | density of `xφ−φx` is `xh−hx`; `B(M,φ)=D`; `(e₁₂φ)(e₂₁)=φ(e₂₂)=1/3`, `(φe₁₂)(e₂₁)=φ(e₁₁)=2/3` | hold |
| `exists_faithful_nondegenerate_representation` | A=0; A=ℂ | K=0: span{0} dense in 0; `π(z)=z` | holds |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | `π(z)=z·1` nondegenerate on ℓ²; A=0 needs `π=0`, degenerate on ℓ²≠0 | holds; `[Nontrivial A]` needed |
| `double_commutant_iff_isClosed_image_ofCLM` | `{e₁₂}` on ℂ²; `ℂI` | plain `{e₁₂}''=span{I,e₁₂}`, dim 2; star-closed generation gives M₂; `(ℂI)''=ℂI` | iff holds |
| `closure_unitBall_eq_unitBall_double_centralizer` | finite-rank+scalars on ℓ²; even projection q | `A''=B(ℓ²)`; `qP_n→q` strongly; `‖q−(c+F)‖≥max(|1−c|,|c|)≥1/2` | SOT density, not norm |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; block dilation | `{0,1}` misses 1/2; `[[C,√(C(1−C))],[√(C(1−C)),1−C]]²` has (1,1) entry `C²+C(1−C)=C` | infinite dimension needed |
| `exists_predual`, Sakai | `M₂`; `ℂ` | `WStarAlgebra` uses `StrongDual ℂ X ≃ₗᵢ⋆[ℂ] M`; X = conjugate of `M_*` | holds |
| `isNormalFunctional_iff_exists_tsum_inner` | `φ_w` with `w_n=2^(−n−1)`; ultrafilter limit | `φ_w(1_{0..N})=1−2^(−N−1)↑1`; ultrafilter limit gives 0 on all `1_{0..N}` but 1 at 1 | both directions; AP Remark 2.5.7 (3′) |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diagonal; H=0 | `e₁₂e₁=0`; (1,1) is both cyclic and separating, (1,0) is neither; 0 in the zero space is both | holds |
| `equivalent_of_subequivalent` | M₂ with `v=e₁₁`; shift on ℓ² | `e₁₁≼1`, `e₁₁≁1`; `S*S=1`, `SS*=1−e₀e₀*` | equivalence, not equality |
| `tracialState_unique` | `x↦x₁₁`; `ℂ⊕ℂ` | `e₁₂e₂₁=e₁₁` (value 1) vs `e₂₁e₁₂=e₂₂` (value 0); `t·pr₁+(1−t)·pr₂` for all t | factor hypothesis needed |
| `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | ideal I∋x≠0 | `a=x*x`, `ε=‖a‖/2`: `af_ε(a)=1_[ε,∞)(a)≠0` since `‖a‖∈σ(a)`; `q_i=v_i*pv_i` because `pv_i=v_i` | I=M |
| `exists_isNormalSemifiniteTrace_of_isFactor` | `B(ℓ²)`; zero trace; ∞-map | `Tr(p)=rank p`; τ'=0 gives c=0; the ∞-map is not semifinite, so it is excluded | holds (Peterson 4.9.4) |
| `exists_conj_commutant_eq_of_isCyclic` | M₂ on ℂ²; H=0 | vector states of M₂ are pure, so not tracial (vacuous); `‖xyΩ‖²≤‖y‖²‖xΩ‖²` makes Ω separating; on H=0, J=0 | holds |
| `existsUnique_typeDecomposition` | `M₂⊕R`; weak type-I clause | `(1⊕0,0⊕1,0,0)`; with the weak clause `(1,0,0,0)` is also admitted; with the stated clauses every `z_i z′_j`, i≠j, vanishes | unique |
| `ergodicSMul_dense_subgroup` | ℤ⊂ℝ; ℚ⊂ℝ | `1_(⋃[n,n+1/2))` is ℤ-invariant and nonconstant; dense ℚ gives σ-compactness from `G=⋃γK` | density needed |
| `existsUnique_isKMS_flow` | M₂, `h=diag(2/3,1/3)`, x=e₁₂, y=e₂₁ | `F(z)=(2/3)2^(iz)`: `F(t)=(2/3)2^(it)=φ(σ_t(x)y)` and `F(t+i)=(1/3)2^(it)=φ(yσ_t(x))`; r=3 gives `(2/9)3^(it)≠(1/3)3^(it)`; only r=2 passes | exists and unique; matches Tau Ceti's `IsKMSFunction` at β=−1 with the pair exchanged |
| `HasTypeITwoSummand`, `exists_unique_extension_of_finitelyAdditive` | M₂; M₃; M₄; abelian; `Tr(diag(1,−1,0)·)` | M₂: `e₁₁+e₂₂=1`; M₃: `2·rank e=3` impossible; M₄: `eMe≅M₂` is not abelian; abelian: e=f; C=1 but norm 2 ≤ 4 | I₂ exclusion needed; 4C bound sharp-ish |
| `dye` | transpose on M₃; Bloch map on M₂ | `(e₁₂e₂₁)ᵀ=e₁₁`, `e₂₁e₁₂=e₂₂`; image of `(1,0,1)/√2` is `(1,0,2)/√5`; inner product of images −3/5 | Jordan, not *-isomorphism; I₂ needed |
| R02 target (Tomiyama Theorem 1) | statement text, p. 608 | conclusions 1° order, 2° bimodule, 3° Schwarz; no `M_n` amplification | CP not stated (R02) |
| R04 target | `φ(x)=Σ n·x_n` on `ℓ∞(ℕ)`, ℕ∋0 | `φ(δ₀)=0`, `δ₀≠0`; repaired `(n+1)`: `φ(δ₀)=1` | false as written (R04) |
| R03 target | FactorRigidity on main | no "R6"/"R7"; Layer 6 at 573, Layer 7 at 634 | labels wrong, content right (R03) |
| V0, V1 Checks | `c₀`; GNS of `tr/2` and `x↦x₁₁`; `T_n e₀` | `δ_n→0` weak-star, so no compactness; GNS dimensions 4 and 2; `‖T_n e₀‖=1` while `n^(−1/2)Σ_(k≤n)η_k→0` | hold |
| V2 Checks | generator weights; ITP references | `3⁻ⁿ`: 4/9 vs 7/18; `2⁻ⁿ`: 3/4 and 3/4; `1−cos(1/n)≈1/(2n²)` summable, `1−cos(1/√n)≈1/(2n)` divergent; `‖ζ−cη‖²=2(1−|⟨ζ,η⟩|)` | hold |
| V8.RegularL2 Checks | `f=δ₋₁+iδ₀+δ₁`; `h_ε`; affine group | `|2cosθ+i|≤√5<3`; error ε/3, and 5/12 at ε=1; `∫f(xg)dμ=α∫f` so `c(α,β)=α` | hold |
| V10 Checks | Hecke `(α,b)`, α=m/n; complex powers | `L=m`, `R=n`; `Δw_g=(L/R)w_g` via `Se_g=√(L/R)e_(g⁻¹)`; `h⁻¹=[[9/4,−3/4],[−3/4,9/4]]`, `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]` | hold |
| V11 Checks | core of ℂ; triangle function | `Tr(f)=∫f e^(−σ)`, `Tr∘θ_s=e^s Tr`; `max(1−|g|,0)` with density `(sin(t/2)/(t/2))²/(2π)` | hold, except R04 |
| V12 Checks | `R⊕ℂ`, `τ=(1/4)τ_R+(3/4)c`; frame functions | distance² `(1/4)(1+|λ|²)+(3/4)|z|²≥1/4`; `|τ(v,z)|≥1/2`; `(a+⟨b,n⟩)/2` forces `1/2+n₃/4`, which is 0.677 ≠ 3/4 | hold |

## Not verifiable

- **tomiyama-1957, cached copy:** the cache entry recorded as `certified` is an access-denied (Incapsula) page, not the paper. I read the publisher's open copy on J-STAGE instead, fetched into a scratch manifest; the board manifest is untouched. That cache entry should be refetched.
- **wassermann-1988:** image-only scan, no OCR on this worker.
- **Uncertified, settled:** Arveson 1969, Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- **Flagged "cited by locator" in the README:** Sakai, Theorem 4.1.6 (`:3578`) and Takesaki II, Theorem IX.4.2 (`:3598`). Both are books not in the cache and were not read.
- **Not in the cache and not read:**
  - Takesaki I–III: IV.4.9, XV.3, XVI.1.9/1.22–1.23, XVII.3.12, XVIII, XII, VII.2, IX.1;
  - Runde 6.4.14 and 6.4.24–25;
  - Reed–Simon I; Rudin's *Functional Analysis* and *Fourier Analysis on Groups*; Goodman–de la Harpe–Jones §3.3; Folland §4.4;
  - Connes 1973, Connes 1975 and Connes, *Periodic automorphisms*; Connes–Takesaki; Araki–Woods; Connes–Woods;
  - Bost–Connes; Laca–Raeburn; Neshveyev; Gleason 1957; Høegh-Krohn–Landstad–Størmer; Haagerup 1979.
  - None of these lies in the seeded sample except Takesaki I and III and Runde in 13.2.

## Source issues

- **Misprint** in anantharaman-popa at Definition 11.1.2, printed p. 173: the source says for every finite subset F there is a unital finite-dimensional Q with F inside the ε-neighbourhood of Q, but ε is never quantified; it should read for every finite F and every ε>0; affects nothing.
- **Error** in jones-vna at Example 3.3.4, p. 13: the source says every positive operator of norm at most one is a weak limit of projections; it should require H infinite-dimensional, since on ℂ the projections are {0,1} and 1/2 is not a limit; affects nothing (the README adds the hypothesis).
- **Misprint** in hiai-lectures at §1.8, p. 9: the source says an algebra acting on a separable Hilbert space is equivalently one with separable predual; it should say isomorphic to one acting on a separable space (ℂ1 on a nonseparable space has separable predual); affects nothing.
