# Review of DGFloer (pull request #1798 at 72a3f12)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DGFloer/` at 72a3f12. The folder changed by 1100 lines since fc27fe2, and the merge with main moved the Tau Ceti pin from 358314d to 2fd255d. Most of the findings below come from that pin move: the new pin ships cubical chains, Moore paths, the cotangent bundle, Liouville domains, both `π₁`-sensitive Hofer–Zehnder capacities, the almost-existence predicate and fundamental classes. None of these modules existed at 358314d (checked with `git cat-file -e 358314d:<path>`). The README still plans them as its own targets, and `Suggested.lean` still calls Theorem A unstatable. The worker's gate fails on two checks (R05, R09). A rerun this round agrees. Nothing outside the folder changes: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.

## Previous findings

The previous review (at fc27fe2) accepted the folder and recorded no finding. The five repairs it confirmed are still in place at this head:

- the 7.1 Conley–Zehnder normalisation `CZ = n − ind_Morse(H, x) = ind_Morse(−H, x) − n`;
- the 8.6 Check on `T²` with indices `+1, 0, 0, −1`;
- Corollary 2.13 in 5.5, restated with `E` a closed orientable manifold;
- `isAspherical_iff_double_loopSpace_homology` in `Suggested.lean`;
- the mod-2 vanishing theorem at universe `u`.

## R01 (P2) — Theorem A is statable at the pins but absent, and the docstring's missing-carrier claims are false

- **Location.** `TauCetiRoadmap/DGFloer/Suggested.lean:52–55`: "Theorems A and C … closed characteristics of a hypersurface and 1-periodic orbits of a time-dependent Hamiltonian flow on a symplectic manifold; at the pins `cotangentSymplecticForm` lives on the model space only."
  - `:56–57` (Theorems L and M) says they lack "the relative and `π₁`-sensitive Hofer–Zehnder capacities".
  - `:62–64` (the fibration theorem) says it lacks, among other things, "the DG algebra of cubical chains on Moore loops".
  - `:65–66` (the Arnold bound) says it lacks "nondegenerate 1-periodic orbits".
- **Claim.** Theorem A is a headline end theorem (README 10.5). Every carrier it needs exists at Tau Ceti 2fd255d.
- **Witness.** The following carriers are at the pin:
  - `TauCeti.CotangentBundle.symplecticForm` (`Cotangent/Bundle/Liouville.lean:279`);
  - `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` (`Hamiltonian/AlmostExistence.lean:167`, which says it is BDHO Definition 1.1);
  - `TauCeti.HomologicalOrientation.mapFundamentalClass` (`LocalHomology/FundamentalClass.lean:275`);
  - `TauCeti.IsAspherical`.

  The statement below elaborates; the only warning is `sorry`.
- **Repair.** Add Theorem A to `Suggested.lean` and name it in README 10.5. Case 1 was tested in a scratch copy with `lake env lean`:

  ```lean
  theorem hasContractibleAlmostExistence_of_not_isAspherical
      {E : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
      {Q S : Type} [TopologicalSpace Q] [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q]
      [CompactSpace Q] [ConnectedSpace Q] [TopologicalSpace S] [T2Space S] [ChartedSpace E S]
      [CompactSpace S] (oQ : HomologicalOrientation Q E (Module.finrank ℝ E))
      (oS : HomologicalOrientation S E (Module.finrank ℝ E)) (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q))
      (q : Q) (hQ : ¬ IsAspherical Q q)
      (hdeg : oS.mapFundamentalClass rfl ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
          C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ) = oQ.mapFundamentalClass rfl (ContinuousMap.id Q) ∨
        oS.mapFundamentalClass rfl ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
          C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ) = -oQ.mapFundamentalClass rfl (ContinuousMap.id Q))
      (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ) (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
      (hFp : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
      (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφ : ∀ s, F (φ s) < c) :
      (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c := sorry
  ```

  - The imports to add are `TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass`, `TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville` and `TauCeti.Geometry.Symplectic.Hamiltonian.AlmostExistence`.
  - `[ConnectedSpace Q]` is required. `TauCeti.IsAspherical` includes path-connectedness, so for `Q = T² ⊔ T²` the hypothesis `¬ IsAspherical` holds trivially, `d = 1`, and yet the flat `S*Q` carries no contractible closed characteristic.
  - Case 2 ("`Q` not a rational `K(π, 1)`, `d ≠ 0`") is stated the same way, with `∃ ℓ ≥ 2` such that `π_ℓ(Q, q) ⊗ ℚ` is nontrivial and with `d • [Q]` for `d ≠ 0`.
- **Docstring corrections.**
  - Theorem C: the missing carrier is a mod-2 fundamental class of a non-orientable closed manifold. The pin's fundamental class is integral and needs an orientation.
  - Theorems L and M: what is missing is symplectic homology with DG coefficients and DG Morse homology of `(W, ∂W)`. The capacities are pinned (`Capacity/HoferZehnder.lean:193`, `Capacity/Relative.lean:123`).
  - The fibration theorem: what is missing is DG Morse homology. The loop DG algebra (`TauCeti.cubicalChain_isDGAlgebra` on `TauCeti.MooreLoopSpace`) and the fibre module (`TauCeti.cubicalChainModule`) are pinned.
  - The Arnold bound: what is missing is `c₁` on spherical classes. Periodic orbits and their nondegeneracy are pinned (`TauCeti.periodicSolutions`, `TauCeti.IsNondegenerateFixedPt`).

## R02 (P2) — Layers 0 and 2 restate the cubical chains and Moore-path theory of the pinned Tau Ceti

- **Location.** `README.md:59` claims ownership of "cubical singular chains and their comparison with simplicial singular chains (Layer 0)". `:73` claims "Moore path and loop spaces, transitive lifting functions, the Moore-path replacement with its strict holonomy". `:284` says "what the pins lack is a target of this roadmap". `:434–437` says no pinned carrier "is a transitive lifting function on Moore paths".
- **Claim.** Items 0.1–0.3 and 2.1–2.2 are already at the pin, along with:
  - the conventions' Moore comparison;
  - 3.1's loop DG algebra and 3.2's fibre module;
  - the "Integral and mod-2 chain comparison" of 1.4 (`:1008`).

  They must be cited, not restated.
- **Witness.**
  - Layer 0: `TauCeti.NormalizedCubicalChain` (Massey's convention, `Cubical/Normalized.lean:204`), `crossProduct_assoc`, `cubicalSingularHomotopyEquiv` (acyclic models) and `quasiIso_cubicalCrossProduct`.
  - Layer 2: `TauCeti.MoorePath`, `MooreLiftingFunction.IsTransitive`, `MooreReplacement.isHurewiczFibration_endpoint`, `MooreReplacement.fiberHomotopyEquiv` and `MooreLoopSpace.homotopyEquivPath`.
  - 3.1 and 3.2: `cubicalChain_isDGAlgebra`, `cubicalChainModule`, and the `MulAction (MooreLoopSpace B b)ᵐᵒᵖ (Fiber p b)` instance.
  - 1.4: `isUniquelyTwoDivisible_singularHomology_of_isZero_mod_two`.
- **Repair.**
  - Move these to "Already in the library" and to the From Tau Ceti contract, by name and file.
  - Delete the restated targets. Keep only what the pin lacks, each stated as an extension of the named declaration: for example 0.3's transport of the Serre sequence, 0.4, 2.3, and 1.4's integral-to-mod-2 surjection on `H₁`.
  - In 3.1, define `C_*(Ω_b B)` as `normalizedCubicalChainAlgebra (MooreLoopSpace B b) R`. In 3.2, define the DG local system as `cubicalChainModule` of `MooreReplacement.Fiber p b`.
  - Delete the false sentences at `:284` and `:434–437`.
  - This also repairs 2.1's compact-generation claim (`:1159`). It is stated for arbitrary `X`, but it fails for `X = ℝ^J` with `J` uncountable: the length-zero paths form a closed copy of `X`, which is not compactly generated. The pinned `Moore/Metrizable.lean` proves it for metrizable `X`, which is the hypothesis the conventions carry.

## R03 (P2) — Layer 6 items 1–5 restate the pinned cotangent bundle, Liouville domains, capacities and almost existence

- **Location.** `README.md:2036`: "Construct the cotangent bundle `T*Q` of a smooth manifold with the tautological form `λ_can = p dq` …". `:2021` defines Liouville domains, `:2060` characteristic foliations, `:2081` "Define the contractible almost existence property (the source's Definition 1.1), the relative capacity … and the `π₁`-sensitive Hofer–Zehnder capacity". The From Tau Ceti contract (`:342–345`) names only the model-space `cotangentSymplecticForm`.
- **Claim.** Every one of these definitions is pinned, in the same conventions (`ι_{X_H} ω = dH`, `ω = −dλ`, primitive `−λ` with Liouville field `p ∂_p`).
- **Witness.**
  - `TauCeti.CotangentBundle.liouvilleForm` and `symplecticForm`;
  - `codiscBundle` and `cosphereBundle`;
  - `isLiouvilleDomain_codiscBundle` and `isLiouvilleCompletion_codiscBundle`;
  - `TauCeti.IsLiouvilleDomain`;
  - `SmoothTwoForm.contractibleHZCapacity`, `relContractibleHZCapacity` and `HasContractibleAlmostExistence`;
  - `IsNondegenerate.exists_homeomorph_isMIntegralCurve_comp`.
- **Repair.**
  - Cite these in the From Tau Ceti contract and in 6.1–6.5, and delete the restated definitions and the first half of 6.3.
  - Keep as targets only what the pin lacks:
    - 6.3's magnetic fibre translation;
    - Proposition 6.3 on almost every level. The pin stops at a dense set of levels (`Capacity/Levels.lean` says so); build on `IsNondegenerate.exists_mem_Ioo_hasContractibleClosedCharacteristic`.
  - Restate the 6.5 Check "`c°_HZ` is monotone under exact embeddings" against the pinned definition. That definition tests contractibility in `W`, and its docstring states that it is not monotone under inclusions.
  - Layer 7.C should likewise cite `TauCeti.Floer.PeriodGroup` and `TauCeti.Floer.CapClass` for its `Γ` and cap torsor.

## R04 (P2) — Layer 6 item 0 has two owners: this roadmap and HamiltonianSystems

- **Location.** `README.md:79–83` claims ownership of "the Hamiltonian formalism beyond what the pinned Tau Ceti states: Hamiltonian vector fields of weakly nondegenerate forms, the Poisson bracket … symplectic maps and symplectomorphisms between manifolds, the variational equation …". `Suggested.lean:331` defines `SmoothTwoForm.IsSymplecticMap`.
- **Claim.** The open roadmap HamiltonianSystems (#480) owns the same objects at its head, and this README no longer names it anywhere.
- **Witness.**
  - At the #480 head, HamiltonianSystems' Layers 1–2 contain "Symplectic maps and symplectomorphisms", "The variational equation" and "Milestone 2".
  - Its `Suggested.lean:141` has `def IsSymplecticMap`, and `:160` has `IsSymplectic.apply_mfderiv_maximalIntegralCurve`.
  - HeegaardFloer F2.1 on main (`README.md:2456`) names HamiltonianSystems Layer 1.
- **Repair.** Settle a single owner.
  - Since this roadmap is on main and HamiltonianSystems is not in the merge order, keep Layer 6 item 0 here. Add a "Left to named roadmaps" row naming HamiltonianSystems as a consumer of Layer 6 item 0, with the boundary stated: moment maps and canonical coordinates stay with HamiltonianSystems.
  - Coordinate with #480 so that its Layers 1–2 cite DGFloer Layer 6 item 0 instead of restating it.
  - Otherwise, cut Layer 6 item 0 to what Layers 6–10 consume and leave the rest to HamiltonianSystems. That route keeps no supplier citation of #480.

## R05 (P2) — Gate: upward supplier AnalyticStableMaps

- **Location.** `README.md:533` cites "**AnalyticStableMaps** M3: full marked, multiply covered, unforced genus-zero stable-map compactness". The same citation appears at `:2252`, `:2277`, `:2490`, `:2513`, `:2527` and `:3073`.
- **Claim.** DGFloer is on main, and it consumes AnalyticStableMaps, which is still an open pull request (#987). The dependency check reports `UPWARD: DGFloer (on main) -> AnalyticStableMaps (#216)`. The edge is inherited: main's DGFloer README already cites M3 at lines 219, 240 and 1157.
- **Witness.** The rerun this round prints `depcheck: 239 roadmaps, 2429 edges, 1 problem(s)` with that UPWARD line.
- **Repair.** Keep the citation and merge AnalyticStableMaps first; the description already lists #987 under "Depends on". Rerun the dependency check once it is on main. If this pull request has to merge first, 7.C.3's genus-zero compactness input becomes a declared gap with supplier AnalyticStableMaps, under `## Exact supplier contracts`.

## R06 (P2) — The DifferentialGeometry Layer 10 citation breaks when #886 merges

- **Location.** `README.md:514–515`: "Layer 10: the smooth degree, consumed only through AlgebraicTopology 6.5's homological characterization". Also `:495`, the 10.5 *Needs:* line at `:3412`, and `:3432`.
- **Claim.** At the head of #886, DifferentialGeometry no longer has a Layer 10. Its sibling paragraph moves the Brouwer degree to DeRhamCohomologyAndDuality, which lists "the Brouwer degree (layer 10)" at the #1768 head, line 8.
- **Witness.** The overlap report, confirmed in the #886 checkout: its headings run Layer 0 to 5.6, then Layer 12.
- **Repair.** Drop the DifferentialGeometry Layer 10 edge at `:515`, `:3412` and `:3432`, and the comparison clause at `:495`. 10.5 states the degree homologically. That degree is the pinned `TauCeti.HomologicalOrientation.mapFundamentalClass`, or AlgebraicTopology 6.5, so no smooth degree is consumed. Citing DeRhamCohomologyAndDuality instead would add an edge from a roadmap on main to an open pull request.

## R07 (P3) — `Suggested.lean`'s Layer 6 section is an API catalogue

- **Location.** `Suggested.lean:193–494` holds 35 declarations: `eq_of_isHamiltonianVectorField`, `IsHamiltonianVectorField.add`, `isSymplecticMap_id`, `IsSymplecticMap.comp`, `IsSymplectomorphism.symm`, `poissonBracket_mul_left`, and so on.
- **Claim.** None of them is a headline theorem of this roadmap. Several restate a definition or follow in one tactic.
- **Witness.** In a scratch copy, two of them close with one tactic each:
  - `isSymplecticMap_id` closes by `simp [SmoothTwoForm.IsSymplecticMap, mfderiv_id]`;
  - `hamiltonianVectorField_congr_of_eventuallyEq` closes by `simp only [SmoothTwoForm.hamiltonianVectorField_def, h.mvfderiv_eq]`, using the pinned `Filter.EventuallyEq.mvfderiv_eq`.
- **Repair.**
  - Delete the Layer 6 section from `Suggested.lean` together with its docstring bullet. The README keeps the statements.
  - Drop the backticked Lean names from the README 6.0 bullets (`README.md:1808–1945`), since they will no longer be declared.
  - Remove the now unused imports `Flow.Basic`, `Flow.TimeDependent`, `Hamiltonian.Integrable` and `SymplecticTransport`, if R01's addition does not need them.

## R08 (P3) — Checks with the wrong sign or normalisation

- **Location.**
  - `README.md:1613–1614` (5.1): "for `ind x − ind y = 2` its boundary is `Σ_z s_{x,z} × s_{z,y}`, … which a chain with the wrong Koszul sign would not satisfy".
  - `:3093` (8.1): "the sum of the products".
  - `:1494` (4.3): "`∂ν_{x,y} = Σ_z (−1)^{…} (m⁺_{x,z} ν_{z,y} − ν_{x,z} m⁻_{z,y})`".
  - `:2213` (7.4): "`ε` a bump of integral `δ`".
- **Claim.** These four Checks disagree with the sources they cite, or with the roadmap's own equations.
- **Witness.**
  - BDHO (5.12) (`bdho-morse-dg` line 1648) and source Proposition 3.4 (`bdho-cotangent` line 1732) have the sign `(−1)^{|x|−|z|} = −1` in index difference 2.
  - Definition 1.10 (`bdho-cotangent` line 556) puts a sign on the `νm` term only.
  - For a bump `ε`, `H₊ = H₋` and `∫ε′ = 0`, so the shift is `0`.
- **Repair.**
  - 5.1: "its boundary is `−Σ_z s_{x,z} × s_{z,y}`", with the sign `(−1)^{ind x − ind z} = −1` of 4.1's twisting equation, and drop the claim that the other sign is wrong.
  - 8.1: "minus the sum of the products".
  - 4.3: write the source's equation `∂ν_{x,y} = Σ_z m⁺_{x,z} ν_{z,y} + Σ_z (−1)^{ind x − ind z − 1} ν_{x,z} m⁻_{z,y}`. For `ν = id` the right side is `m − m = 0`. Dropping the second sign gives `2m`.
  - 7.4: "`ε` a nondecreasing step from `0` to `δ`". Then `A_{H₊} = A_H − δ`, and the shift is `δ`.

## R09 (P3) — Gate: TeX outside a code span at README line 1974

- **Location.** `README.md:1973–1974`. A code span opened on line 1973 (`` `X_{qp} = q X_p + p X_q ``) closes on the next line.
- **Claim.** The `tex` check fails here, with rule "no TeX-only syntax … outside code spans".
- **Witness.** The gate output: `tex: line 1974: - Leibniz on … and `X_{qp} = q X_p + p X_q`.
- **Repair.** Put `` `X_{qp} = q X_p + p X_q = q ∂_q − p ∂_p` `` on one line. Its value was recomputed: `ι_X(dq ∧ dp) = q dp + p dq = d(qp)`.

## R10 (P3) — A conflicting open revision of this roadmap, with no stated order

- **Location.** The pull request description. Its merge-order paragraph does not mention #963.
- **Claim.** #963 (@t4v1, "the cubical Serre spectral sequence is built directly") also revises `TauCetiRoadmap/DGFloer/README.md` and `Suggested.lean`, and the two heads conflict.
- **Witness.** `roadmaps overlaps DGFloer` reports: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`".
- **Repair.** State in the description which of #963 and #1798 is rebased on the other before either merges. The README should not restate what #963 changes.

## Verified sound

**Gate and dependency check.** Both were rerun this round.

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=1 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
UPWARD: DGFloer (on main) -> AnalyticStableMaps (#216) at README lines [533, 2277, 2490, 2513, 2527]
depcheck: 239 roadmaps, 2429 edges, 1 problem(s)
```

The run reports no CYCLE line and no `moved:` line.

**Elaboration.** A scratch copy of `Suggested.lean` was elaborated with `lake env lean` from the worktree root, with `#check @name` for all 44 declarations and the one-tactic probes of R07.
- The only warnings are `sorry`. The 44 elaborated types agree with `signatures.md` and with their README statements.
- No declaration lost a binder:
  - `twistedDifferential` keeps `[SMulCommClass R Aᵐᵒᵖ M]`;
  - the Banach statements keep `[CompleteSpace E]`;
  - the flow statements keep `[FiniteDimensional ℝ E] [I₀.Boundaryless] [T2Space M]`.
- Seven probes fail, which shows that those statements are not one-line facts: `eq_of_isHamiltonianVectorField`, `add`, `const_smul`, `isSymplecticMap_iff_mpullback_eq`, `IsSymplectomorphism.symm`, `isSymplecticMap_subtype_val` and `isSymplectomorphism_constSmooth`.
- The R01 statement was elaborated separately, after `lake build` of the two missing Tau Ceti modules.

**Seeded sample.** All 15 targets were checked. Sources are `bdho-cotangent` (BDHO, arXiv v3, numbering as the README says), `bdho-morse-dg` (arXiv v3), `hatcher-at`, `abouzaid-viterbo` and `seidel-biased`.

| Target | Locator checked | Result |
|---|---|---|
| 0.2 | `bdho-morse-dg` §5.2, lines 1422–1439 (Moore loops, degenerate cubes, the product `σ(x)#σ′(y)`) | supported; Massey Ch. VII under Not verifiable |
| 1.6 | Palais 1960 (uncertified) | not verifiable; Checks recomputed below |
| 2.1 | no locator at the item; `bdho-morse-dg` §7.1, lines 3015–3022 define Moore paths | statement covered by R02 (pinned, plus a missing metrizability hypothesis) |
| 2.2 | `bdho-morse-dg` line 3053 (cites [DK69, Prop. 5.5] for the transitive replacement: "cited, not proved" is correct); `hatcher-at` lines 16461–16466 (Proposition 4.48 and the Huebsch–Hurewicz remark) | supported; target restated (R02) |
| 3.4 | `bdho-cotangent` Lemma 2.1 (line 1041), Proposition 2.2 (line 1063) | supported |
| 4.3 | Definitions 1.10 (line 563, equation at 550–556), 1.11 (line 592, equation at 585–591) | supported; Check shape is R08 |
| 5.1 | `bdho-morse-dg` Theorem 5.2.1 (line 1461), Propositions 5.2.6 (line 1638), 5.2.8 (line 1699) | supported; Check sign is R08 |
| 5.4 | `bdho-morse-dg` Theorem 7.2.1 (line 3101; `X` closed manifold), Proposition 7.1.1 (line 3086) | supported |
| 7.3 | Lemma 3.1 (line 1464, sign `(−1)^{dim V₂ · ind D₁}`), Proposition 3.3 (line 1705) | supported |
| 7.5 | `abouzaid-viterbo` §§1.5–1.6 (lines 17–18); `seidel-biased` §3 (line 192) | supported |
| 8.1 | Propositions 3.4 (line 1721), 3.6 (line 1737), Definition 3.5 (line 1735) | supported; Check sign is R08 |
| 8.4 | Propositions 3.14–3.29 at lines 1915–2258; Proposition 3.22 bound at lines 2131–2166 | supported |
| 8.6 | Proposition 3.36 (line 2595), Theorem 3.37 (line 2617), Definition 3.38 (line 2707), Theorem 3.39 (line 2713), Theorem J (line 640) | supported (source gap below) |
| 9.3 | Theorem K (line 688); Lemma 4.5 (3137), Propositions 4.6 (3295), 4.7 (3329), 4.9 (3487), 4.10 (3518), 4.11 (3552), 4.13 (3669), 4.14 (3707), Lemma 4.15 (3728), Proposition 4.16 (3749) | supported |
| 10.2 | Theorem M (line 753) = Theorem 6.4 (line 4382); Propositions 6.6 (4394), 6.7 (4429) | supported |

**Adversarial table.** `ω = dq ∧ dp` throughout, with the convention `ι_X ω = dH`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Theorem A (R01) | `Q = S²`, `S = Q`; `Q = T²`; `Q = T² ⊔ T²`; `S = ∅` | `S²`: `π₂ = ℤ`, `d = 1`, conclusion = worked example 8. `T²`: aspherical, hypothesis fails, flat `S*T²` has no contractible characteristic. `T² ⊔ T²`: `¬IsAspherical` holds, `d = 1`, conclusion false, so `[ConnectedSpace Q]` is needed. `S = ∅`: `φ_*[S] = 0 ≠ ±[Q]` | statable once that hypothesis is added |
| Theorem C | `ℝP²`, `ℝP³` | `π₂(ℝP²) ⊗ ℤ/2 = ℤ/2`, `π₃(ℝP³) ⊗ ℤ/2 = ℤ/2`; the mod-2 degree needs a mod-2 fundamental class, which the pin lacks | not statable; docstring reason corrected |
| Theorems L, M | `D*T^r` | `c°_HZ = ∞` (flat metric), so by contraposition no `(𝓕, α)` exists; capacities are pinned; `SH_*(W; 𝓕)` is absent | not statable for that reason |
| Theorem J / 8.6 | `T²` height function | `CZ = 1 − ind`: `+1, 0, 0, −1` give `H₂`, `H₁` (rank 2), `H₀` | holds |
| Theorem K | `Q = pt`, `S¹` | `ℤ = ℤ`; `SH_k(T*S¹) = ℤ[ℤ]` for `k = 0, 1` | holds |
| Fibration theorem | path–loop over `Sⁿ`, Hopf, double cover | `H_*(pt)` against `H_*(Sⁿ) ⊗ H_*(ΩSⁿ) ≠ ℤ` for the trivial action; Hopf gives `ℤ` in degrees 0 and 3; double cover gives `H_*(S¹)` | holds |
| mod-2 vanishing | `S³`, `M(ℤ/3, 2)`, point | `H̃₃(S³; 𝔽₂) = 𝔽₂` excluded (and `π₃ = ℤ` is not 2-divisible); `ℤ/3 ⊗ 𝔽₂ = Tor = 0` and doubling on `ℤ/3` is bijective | holds |
| `twistedDifferential_mem_totalGrading` | `A = M = ℚ[ε]/ε²`, `|ε| = 1`, `ind x = 1`, `ind y = 0`, `m_{x,y} = 1` | `f = ε` at `x` has degree 0; `(Df)_y = −ε ∈ ℳ(1 + ind y)` and `(Df)_x = 0`, so degree 1 | holds |
| `twistedDifferential_sq` | homogeneous `α` of degree `p` | the `(−1)^p dα · m` terms cancel; the remainder is `α · (dm_{xz} − Σ_y (−1)^{ind x − ind y} m_{xy} m_{yz}) = 0` | holds |
| Lemma 3.41 | `S¹`, `S²`, `S³`, two points | both sides hold; `π₀(Ω²S²) = ℤ`; `H₁(Ω²S³) = ℤ`; two points excluded by `[PathConnectedSpace Q]` | holds |
| torus criterion | `T^r`, `SO(3)`, `SU(2)`, `ℕ → S¹` | `π₃(SO(3)) = π₃(SU(2)) = ℤ`; `(ℤ/2)^ℕ` is uncountable, so `ℕ → S¹` is excluded by `LieGroup` | holds |
| 6.0 uniqueness, zeros | `ω = 0`, `f` constant | `∂_q` and `0` both solve `ι_X ω = df`, and `∂_q` never vanishes | nondegeneracy needed, and stated |
| 6.0 weak vs strong | `V = c₀`, `f = a(q)` | `ι_{(0,−a)} ω = df`, while the pinned `(ω♭)⁻¹ df = 0` (`c₀` is not reflexive); a surjective `ω♭` is injective by Hahn–Banach | holds |
| 6.0 Leibniz, bracket | `ℝ²` | `X_q = −∂_p`, `X_p = ∂_q`, `X_{qp} = q∂_q − p∂_p`, `ι = d(qp)`, `{q, p} = 1 = dq(X_p)` | holds |
| 6.0 transport | `(q₁, p₁) ↦ (q₁, p₁, 0, 0)`, `h = q₂` | `X_{h∘φ} = 0` and `X_h = −∂_{p₂}` | invertibility of `dφ` needed, and stated |
| 6.0 Poisson | derivation | `d(ω(X,Y))(Z) = dk([X,Y]) = X(dk Y) − Y(dk X) = 0`, since `dk(Y) = −dg(Z) = 0` | holds |
| 6.0 flows | `(q² + p²)/2`; `q∂_q`; `H_t = tq` | `R′ = AR` with `A = [[0,1],[−1,0]]`; `q∂_q` gives `e^t dq∧dp`; `H_t = tq` gives `(q, p − (t² − s²)/2)` | holds |
| first integrals | pinned definition | `IsFirstIntegral σ f g := ∀ x, {g, f} x = 0`, so `θ.IsFirstIntegral g f` is `{f, g} = df(X_g)` | holds |
| 0.2 Leibniz | two 1-cubes | `∂σ × τ = −(∂⁰₁ − ∂¹₁)(σ×τ)` and `−σ × ∂τ = (∂⁰₂ − ∂¹₂)(σ×τ)` | holds |
| 2.2 replacement | `pt → S¹` | `F = pt` against `F′ = ΩS¹ ≃ ℤ` | holds |
| 3.4 twist | `S¹`, monodromy `−1` | `d = 2`, `H₀ = ℤ/2`, `H₁ = 0` | holds |
| 5.1 / 8.1 / 4.3 / 7.4 Checks | see R08 | `−Σ` against `+Σ`; `m − m = 0`; shift `0` against `δ` | R08 |
| 7.5 | `D²ⁿ` | the index rises by `2n` per slope crossing, so `SH = 0` | holds |
| 8.4 | Proposition 3.22 | `∫∫ ∂_s H(u) ≤ ∫ max ∂_s H ds`, a valid bound beside the source's `∫₀¹ max ∂_ϑ K dt` | holds |
| 9.3 compact family | constant loop of duration 1 | `geo^r ∘ ev_r` has duration 0, and `r(K) = 1` | holds |
| 1.6 | `S¹ ⊔ S²`; two points | the orbit is the component of `x₀`; for two points `H` is trivial | holds |

**Pinned declarations opened.** Tau Ceti 2fd255d, Mathlib 1b1ccf4.
- **Symplectic, under `Geometry/Symplectic/`:**
  - `Hamiltonian/AlmostExistence.lean:96, :167`, `Capacity/HoferZehnder.lean:193`, `Capacity/Relative.lean:123`, `Capacity/Levels.lean:247`;
  - `Cotangent/Bundle/Liouville.lean:144, :279, :334`, `Cotangent/Bundle/Codisc.lean:82, :89`, `Cotangent/Bundle/Domain.lean:73, :94`, `Cotangent/Bundle/ContactType.lean:86`, `Liouville/Domain.lean:83`;
  - `Hamiltonian/Characteristic.lean:143`, `Hamiltonian/PeriodicOrbit.lean:67`, `Hamiltonian/Manifold.lean:124, :179, :338`, `Hamiltonian/Integrable.lean:91`, `Hamiltonian/Bracket.lean:115`, `Floer/PeriodGroup.lean`, `Floer/Cap/Basic.lean`.
- **Flows and derivatives:** `Geometry/Manifold/Flow/Periodic.lean:80`, `MFDeriv/FixedPoint.lean:74`, `MFDeriv/NormedSpace.lean:74`.
- **Fundamental classes and coefficients:** `LocalHomology/FundamentalClass.lean:204, :275`, `Coefficients/TwoDivisible.lean:46`.
- **Moore paths, under `Topology/PathSpace/`:** `Moore.lean:83, :608`, `Moore/Lifting.lean:130, :198`, `Moore/Replacement/Basic.lean:183, :330`, `Moore/Replacement/Equiv.lean:147`, `Moore/Comparison/Basic.lean:438`, `Moore/Metrizable.lean`.
- **Cubical chains, under `AlgebraicTopology/Singular/Cubical/`:** `Normalized.lean:204`, `CrossProduct/Basic.lean:59`, `CrossProduct/Assoc.lean`, `Comparison/Basic.lean:143`, `Comparison/CrossProduct.lean`, `Kunneth.lean`, `MonoidAlgebra/Graded.lean:142`, `MonoidAlgebra/DGAlgebra.lean:267`, `MonoidAlgebra/Action.lean`.

That is 34 declarations or modules in all. None of these modules existed at the previous pin 358314d. The Layer 6.0 names of this roadmap (`IsSymplecticMap`, `poissonBracket_mul_left`, …) are absent from the pin, as the README says.

**Cross-roadmap citations resolved.**
- HamiltonianSystems at the #480 head: README Layers 1–2 and `Suggested.lean:120, :141, :150, :160`.
- HeegaardFloer F2.1 on main (`README.md:2453–2466`).
- DifferentialGeometry at the #886 head (headings, and the sibling paragraph at 1378–1387).
- DeRhamCohomologyAndDuality at the #1768 head (line 8).
- AlgebraicTopology Stage 8.3 item 3 on main (`README.md:1684–1689`), which agrees that DGFloer owns the degree-one theorem.
- DGFloerPartII at the #1799 head, Layer 2 item 4 (`README.md:775`), cited at `:1573`.
- Main's DGFloer citation of AnalyticStableMaps M3 (main `README.md:219, 240, 1157`).
- `roadmaps resolve` lists 21 Lean names as found nowhere. All 21 are this roadmap's own Layer 6.0 names declared in `Suggested.lean`; R07 removes them.

**Ownership.** The objects of R02–R04 were searched by object at the pins and across main and the open heads with `roadmaps grep` and `roadmaps show`. Only HamiltonianSystems overlaps among the open roadmaps. Ownership against open pull requests outside the `roadmaps` index was not checked.

## Not verifiable

These are books or paywalled texts, cited by locator; none was read:
- Massey Chapters II and VII (0.1–0.3);
- Palais 1960 (1.6);
- Whitehead Chapter I;
- Weibel 5.5.1 and 5.5.10;
- Serre 1951 and 1953;
- Hofer–Zehnder Chapters 1, 3, 4, and Struwe 1990;
- Bröcker–tom Dieck Chapter V;
- Floer–Hofer–Salamon Lemma 6.5;
- Piunikhin–Salamon–Schwarz §4;
- the four sources newly cited for Layer 6.0: McDuff–Salamon §3.1, Abraham–Marsden Chapter 3, Chernoff–Marsden LNM 425, Hartman Chapter V Theorem 3.1.

The proofs in BDHO Chapters 9–13 were not read line by line.

## Source issues

- **Gap** in bdho-cotangent at the proof of Theorem J, printed p. 62 (line 2739–2745): the source says Theorem J, which assumes `X` symplectically aspherical, follows from Theorem 3.37 and Proposition 3.36, which are stated for symplectically atoroidal `X`; it should state the contractible-component part of 3.36–3.37 under asphericity alone, which their proofs support; affects the proof.
- **Gap** in bdho-cotangent at Theorem J, printed p. 15 (line 640–641), and §3.6.2, printed p. 61 (line 2732): the source says the DG local system comes from a Serre fibration; it should be a Hurewicz fibration, or a Serre fibration through the Moore-path replacement, since the module structure is built from a lifting function; affects a stated result.
