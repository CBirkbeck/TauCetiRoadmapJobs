# GATE-OperatorAlgebraDynamics~1: reply to human review

The review contains four distinct points, all from roed-math (2026-10-19), numbered in the order they appear. Repairs are in commit `2856fa4d` (README only; `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` is unchanged).

## H01 (roed-math) — applied differently

The defect is real, and it is worse than an unpublished supplier. The cited NQS anchor `M1.ProjectiveExtensions` and every QF5.P interface exist nowhere: they are absent from main and from every open roadmap head, and `roadmaps grep 'QF5\.P'` hits only the NoncompactQuantumSymmetry head and this README. NoncompactQuantumSymmetry also consumes this roadmap (its README lines 7, 13, 15, 33, 481 and 588 cite D1, D3 and D5), so the edge D1.TwistedBorel → NQS M1 was a roadmap-level cycle. The fix moves ownership down into this roadmap rather than to NQS. A new subsection, `### D1.BorelPrefix. Polish unitary groups, automatic continuity and Borel circle extensions`, sits before D1.TwistedBorel in `TauCetiRoadmap/OperatorAlgebraDynamics/README.md`. It states the following, with Williams draft 3.1, Appendix D locators checked against the text:

- the strong unitary group `U(H)_s` on the native carrier `unitary (H →L[ℂ] H)`, topologised through Mathlib's `ContinuousLinearMap.toPointwiseConvergenceCLM`, and Polish for separable H (Lemmas D.37 and D.42);
- the Borel-coefficient comparison (Lemmas D.20 and D.43);
- automatic continuity for Borel homomorphisms from a Polish group into a separable metrizable group (Theorem D.11), with the Steinhaus route for lcsc sources (Theorem D.3, Lemma D.4, Mathlib `div_mem_nhds_one_of_haar_pos`);
- Mackey's measurable-group topology on `E_ω` (Theorem D.23);
- the ω-representation ↔ `E_ω`-representation correspondence (Proposition D.28);
- the strong-Borel twisted regular family.

None of it depends on induction, type-I theory or D1.TwistedBorel, and it states that the route never uses `U(H)_s/𝕋`. D1.TwistedBorel's opening (old: "consume only NoncompactQuantumSymmetry M1.ProjectiveExtensions … uses QF5.P's Polish/Banach–Pettis interfaces") now consumes D1.BorelPrefix. The route line in D2.CentralTwists changed from "QF5.P/A7 → NQS M1.ProjectiveExtensions → D1.TwistedBorel → NQS M2" to "A7/C1 → D1.BorelPrefix → D1.TwistedBorel". The phrase "M1's Borel selection theorem" became "lifts already shown to be Borel". Ownership check: no roadmap on main or at an open head owns the Polish unitary group, Borel-coefficient comparison or automatic continuity. Mathlib's `AddMonoidHom.continuous_of_measurable` (`Mathlib/MeasureTheory/Measure/Haar/NormedSpace.lean:79`) is additive and normed-target only, as the review says. MetaplecticAutomorphicForms §1.3 uses the strong operator topology without owning these results. NQS M1's own "Own the Mackey–Weil converse" clause (NQS README line 707) now duplicates D1.BorelPrefix. The reciprocal edit, making NQS M1 consume D1.BorelPrefix, belongs to that roadmap and is not made here.

## H02 (roed-math) — applied differently

First half: the broken `M1.ProjectiveExtensions` anchor is removed, not re-pointed. After H01 this roadmap no longer consumes NoncompactQuantumSymmetry anywhere, so pointing at NQS lines 707–769 would bring the cycle back. Second half: NQS M2 at line 982 still asks for `J_k(E_ω)≅C*(G,ω^k)`. That text lives in another roadmap's file, outside what this job may edit. This README already assigns the per-weight identifications `J_k(E_ω)≃C*(G,ω^k)` to D1.TwistedBorel and leaves the all-weight c₀ decomposition and the type-I consequences to their consumer. The NQS amendment is therefore needed on the NQS side and nowhere here.

## H03 (roed-math) — applied

Old D8 text, the sentence ending "…their invariant domains and the Weyl-to-commutator relation on those domains", claimed no particular domain. New text:

- For each finite-dimensional real subspace F⊆V, `D_F` is the span of `π_φξ=∫_F φ(f)π(W(f))ξ df`, φ∈C_c^∞(F).
- `D_F` is dense, and invariant under every Φ(g) and every π(W(tg)), g∈F, with the explicit formulas `iΦ(g)π_φξ=π_ψξ`, `ψ=−∂_gφ−(i/2)σ(g,·)φ` and `π(W(tg))π_φξ=π_χξ`.
- It is a common core, by the invariant-core argument through SelfAdjointSpectralTheory SA-A21.
- Real linearity and `[Φ(f),Φ(g)]=iσ(f,g)` hold on `D_F`.
- The Schrödinger sign witness: `exp(−ist/2)` and `[Q,P]=i` for `σ(e₁,e₂)=1`.
- The review's `L⁰([0,1],ℝ)` example is a negative control: the intersection of all field domains is {0}, so no domain common to all of V is asserted.

## H04 (roed-math) — answered

`CStarAction` and `CStarAction.multiplier` are not at this roadmap's Tau Ceti pin: the pinned `TauCeti/Analysis/CStarAlgebra/` tree has no `Action/` directory, which agrees with the review. The admitted `multiplierAction` therefore stays for now. Once the pin advances, D1.CentralTwists' multiplier action and its joint strict continuity should consume those declarations. That is a change for a later pin update and is not made now.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `E_ω` inverse `(z̄·overline(ω(s,s⁻¹)),s⁻¹)` | general s | `(z,s)(w,s⁻¹)=(zwω(s,s⁻¹),e)=(1,e)`; left inverse needs `ω(s⁻¹,s)=ω(s,s⁻¹)`, from the cocycle law at (s,s⁻¹,s) | holds | none |
| `ψ_b:E_(ω^b)→E_ω`, `(z,s)↦(zb(s),s)` | G=ℤ/2, ω(a,a)=−1, b(a)=i | `ω^b(a,a)=i·i·(−1)=1`; `(1,a)²=(−1,e)` in E_ω (order 4); `(i,a)²=(i·i·(−1),e)=(1,e)` | direction pinned; recorded as a Check | added |
| Haar on `E_ω` left invariant | translate by (w,t) | `∫∫F(wzω(t,s),ts)dz dμ(s)`: z-integral rotation invariant for each s, then μ left invariant | holds | none |
| `λ^ω_sλ^ω_t=ω(s,t)λ^ω_(st)` | y=t⁻¹s⁻¹x | LHS phase `ω(s,s⁻¹x)ω(t,y)`, RHS `ω(s,t)ω(st,y)`; equal by the cocycle law at (s,t,y) since ty=s⁻¹x | holds | none |
| `U(H)_s` degenerate cases | H=0, dim H=1 | trivial group; 𝕋 with the usual topology (strong=norm in finite dimensions) | holds | stated |
| Automatic continuity hypotheses | Hamel ℚ-linear map ℝ→ℝ | additive and discontinuous, hence not Borel | measurability needed; negative control | added |
| Mackey topology, continuous ω | product topology | an lcsc group topology with the product Borel sets, so equal to Mackey's by uniqueness | holds | stated |
| `iΦ(g)π_φξ=π_ψξ` | W(tg)π_φξ, substituting f′=f+tg | integrand `φ(f′−tg)e^{−iσ(tg,f′)/2}`; t-derivative at 0 gives `−∂_gφ−(i/2)σ(g,·)φ` | holds | added |
| `[Φ(f),Φ(g)]=iσ(f,g)` | Weyl law | `W(sf)W(tg)W(sf)*=e^{−istσ(f,g)}W(tg)`; ∂_t then ∂_s at 0: `−[Φ(f),Φ(g)]=−iσ(f,g)` | holds | added |
| Sign witness | V=ℝ², σ(e₁,e₂)=1, Φ(e₁)=x, Φ(e₂)=−i d/dx | BCH: `[isQ,itP]=−ist`, so `e^{isQ}e^{itP}=e^{−ist/2}e^{i(sQ+tP)}`; `[Q,P]ψ=iψ` | matches both signs | Check added |
| Invariant-core argument | η⊥(Φ(g)±i)D_F | `u′=i·(∓i)u=±u`; a bounded solution on ℝ is 0 | holds | added |
| No common domain | V=L⁰([0,1],ℝ), σ=0, ξ≠0 | f=g/|ξ| on {ξ≠0} with ∫g²=∞ (disjoint pieces E_n, g=Σ m_n^{−1/2}1_{E_n}) gives fξ∉L² | intersection is {0} | negative control added |
| `CentralCocycle.cocycle`, restated on left multipliers: `α_r(ω(s,t).fst(α_r⁻¹(ω(r,st).fst a))) = ω(r,s).fst(ω(rs,t).fst a)` | α trivial, ω≡1; α trivial, ω(s,t)=c(s,t)·1 scalar; general | ω≡1: both sides `a`; scalar: `c(s,t)c(r,st)a = c(r,s)c(rs,t)a`, the usual 2-cocycle law; general: `(α_r(m)n).fst = α_r∘m.fst∘α_r⁻¹∘n.fst` (Mathlib `mul_fst`), and `fst` determines a multiplier of a C*-algebra since `R(x)y = xL(y)` and `zy=0 ∀y ⇒ z=0` | equivalent to the removed multiplier-algebra equation | field restated |
| `CentralCovariantPair.projective`, restated as `π(a)U_sU_t = π(ω(s,t).snd a)U_st` | ω≡1; general | ω≡1: `snd = id`, gives `π(a)U_sU_t=π(a)U_st`, hence `U_sU_t=U_st` by nondegeneracy (take adjoints, compare on the dense span); general: `π(a)ω̄ = π(a·ω)` and `a·ω = ω.snd a` (Mathlib `coe_snd`: `(a:𝓜).snd x = x a`) | equivalent to `U_sU_t = ω̄(s,t)U_st` | field restated |

Lean: `Suggested.lean` now opens with `import Mathlib` followed by the three `TauCeti.*` modules it uses (`RepresentationTheory.Continuous.Unitary.Basic`, `RepresentationTheory.Continuous.Integrated.Basic`, `Algebra.MonoidAlgebra.Twisted.Basic`), replacing eight `Mathlib.*` sub-imports. The admitted data `multiplierAction`, `extendRepresentation` (and their `_coe` lemmas) are deleted, with the two declarations that mentioned them (`rephasedValue`, `regularTwistedValue`); none is named in the README. The `CentralCocycle.cocycle` and `CentralCovariantPair.projective` fields are restated without them, as in the two table rows above. No other declaration changed; these were checked by the build, not by a `#check` scratch comparison (the worker's signatures file was not available). The new README sections backtick only Mathlib names (`PointwiseConvergenceCLM` notation, `ContinuousLinearMap.toPointwiseConvergenceCLM`, `div_mem_nhds_one_of_haar_pos`, `AddMonoidHom.continuous_of_measurable`, `MonoidHom.isOpenMap_of_sigmaCompact`), all checked at the pinned Mathlib. `roadmaps resolve` reports no unresolved citations or Lean names. Ownership was checked against main and every open roadmap head through `roadmaps grep`.

Source: Williams, *Crossed Products of C*-Algebras*, draft 3.1 (author page), fetched through the sources service as `williams-crossed-products`; locators: Theorem D.3 at line 21913, Theorem D.11 at line 21995, Theorem D.23 at line 22193, Proposition D.28 at line 22546, Lemma D.42 at line 23289, Lemma D.43 at line 23304. This job may not edit `sources.toml`, so the entry is not recorded in the roadmap's manifest. No text is missing, and `needs-references.toml` was not written.

## Build and gate

- `lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested`: Build completed successfully (8984 jobs); six `declaration uses 'sorry'` warnings, no other diagnostics.
- Gate: `gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failing count is `depcheck: NOT IN ORDER`, the design-stage condition. In the README, the nine commit-pinned blob links and the roadmap pull-request link are now relative links naming the roadmap and section (VonNeumannAlgebras V4.0.Fields, V4.0.Decomposition, V8.LCHRegularNormalBridge; SelfAdjointSpectralTheory SA-B85; LieGroupoidsPoisson G0; AmenableGroups). The two Mathlib pull-request links are gone: the Arrow topology is attributed to LieGroupoidsPoisson G0, which the README already names as its owner.
- Depcheck output:

```
depcheck: 148 roadmaps, 1010 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The gate's own depcheck reports "NOT IN ORDER: OperatorAlgebraDynamics (insert it after its last supplier)", the design-stage condition, not a defect here.
