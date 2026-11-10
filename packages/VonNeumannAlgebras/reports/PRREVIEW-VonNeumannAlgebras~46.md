# Review of VonNeumannAlgebras (pull request #1041 at b209478)

**Verdict:** accepted

No findings. The three findings of the previous review are repaired, the gate passes, and the full pass below found nothing that needs a change.

## Previous findings (review of 4fbdf84)

- **R01 (P2, the spectral calculus had two owners): repaired.**
  - Scope (`README.md:33–44`) now reads "The projection-valued-measure carrier `TauCeti.ProjValMeasure` with its integral, null filter, vector identity and dominated convergence; … are implemented in Tau Ceti at the pin and are consumed from there", and lists as owned only multiplicativity, the spectral measure as a `TauCeti.ProjValMeasure`, the essential-supremum norm, the commutant law, the inverse Cayley correspondence and the spectral measure of a self-adjoint operator.
  - "From Tau Ceti" (`:343–420`) names the projection-valued-measure, Borel-extension, diagonal-measure, resolvent and Cayley declarations with their files.
  - V2.BorelCalculus (`:863–917`) consumes `StarAlgHom.representationDiagMeasure`, `StarAlgHom.representationPolarizedMeasure` and `StarAlgHom.representationBorelOperator`, and proves multiplicativity on indicators, `π(f)=∫f dP`, the essential-supremum norm and the commutant law. Its *Needs:* line and the Layer 2 Dependencies (`:1197–1200`) match.
  - V10.ClosedOperators (`:2944–2987`) consumes `IsSelfAdjoint.mem_resolventSet_of_im_ne_zero`, `IsSelfAdjoint.norm_resolvent_le`, `LinearPMap.cayley`, `IsSelfAdjoint.cayley_mem_unitary`, `LinearPMap.cayley_apply_eq_self_iff`, `LinearPMap.mem_graph_iff_exists_cayley` and `TauCeti.ProjValMeasure.map`; the Layer 10 Dependencies (`:3543–3546`) match.
  - All 42 declarations named in the new text exist at Tau Ceti `2fd255d9` in the files given, with the stated content (list under "Library declarations opened" below). The route in the second V2 bullet is sound: `TauCeti.ProjValMeasure.eq_integral_of_continuous` needs continuity of `f↦π(f)`, which the form bound `2·sup|f|·‖ψ‖‖ξ‖` gives, and agreement on simple functions, which linearity of `representationBorelOperator` and `integral_indicator` give once `P` is multiplicative.
- **R02 (P3, GNS implementing group and KMS separation): repaired.**
  - V4.Normality (`:1529–1536`): "implemented in the GNS space of the state φ by Tau Ceti's `TauCeti.CStarAction.gnsImplementingGroup`, applied to the discrete group `Multiplicative ℤ` acting by the powers of α", with the uniqueness clause owned here and a new Check (`:1554–1558`).
  - Layer 6 (`:2161–2167`): the separating property comes from `TauCeti.CStarAction.isKMSState_zero_iff` and `TauCeti.CStarAction.IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero`, transported by the GNS unitary; cyclicity of Ω is what makes that unitary onto. Both modules are in "From Tau Ceti" (`:407–420`) and in the Layer 4 and Layer 6 Dependencies.
- **R03 (P3, heading inside a Check bullet, stray article): repaired.** A blank line precedes "**V0.SeparableFaithful —" (`:596–597`), and `:1840–1841` now reads "and … V2's given-finite-measure multiplication/MASA theorem". A scan of the whole file for a bold target heading that follows a list item without a blank line finds none.

## Verified sound

**Gate, dependencies, build (run this round).**

- `tauceti-roadmap gate … VonNeumannAlgebras --base origin/main` as run by the worker at this head: every counter 0, `build=0`, `OK`.
- Dependency check: no UPWARD, CYCLE or `moved:` line.

  ```text
  depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
  ```

- `lake env lean` on `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`: exit 0, 32 "declaration uses `sorry`" warnings, nothing else.
- One-tactic probe on a scratch copy (`first | rfl | simp | aesop | decide | infer_instance | trivial` in place of each of the 32 `sorry`s): 32 errors at 32 distinct lines and no remaining `sorry`, so none closes. No padding.
- `Suggested.lean` is byte-identical to the file at 4fbdf84 (741 lines, 57 declarations, 32 theorems, one module docstring, `theorem` only, no `set_option`, no sorry'd data). The worker's elaborated signatures report no lost binder, and I compared the Layer 8, 10 and 13 signatures with their README statements again.
- Pins: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, equal to main's (`origin/main` 2bbd3cbf), checked with `git rev-parse` in `.lake/packages`. `git merge-tree origin/main HEAD` reports no conflict. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Every `TauCeti/….lean` and `Mathlib/….lean` path written in the README exists at the pins (scripted check, none missing).

**Seeded sample, read at the locators.**

- 13.1, `tomiyama`:
  - hiai-lectures line 2666 (p. 55): Theorem 6.5, a norm-one projection of a C*-algebra onto a C*-subalgebra satisfies (ii) and (v) of Theorem 6.4; (ii) is bimodularity (line 2596, p. 53).
  - peterson-notes line 3948 (p. 98): Theorem 6.2.1, unital A and B, `E|B=id`, `‖E‖≤1`.
  - anantharaman-popa line 13597 (PDF 320 = p. 314): Appendix A.4, with Theorem A.4 at line 13610.
- 13.1, `IsInjective`: anantharaman-popa line 7191 (PDF 167 = p. 161), Definition 10.2.1; line 7198, Proposition 10.2.2.
- 13.2:
  - anantharaman-popa line 7269 (p. 163), Proposition 10.2.5; line 7325 (p. 164), Theorem 10.2.8; line 7333 (p. 164), Theorem 10.2.9; line 7413 (p. 166), Theorem 10.3.1; line 7532 (p. 168), Theorem 10.3.4;
  - lines 7685 and 7702 (p. 173), Definition 11.1.1 and Theorem 11.1.3; line 8294 (p. 186), Theorem 11.2.2; lines 8358 and 8376 (p. 188), Remark 11.2.3 and Corollary 11.2.4;
  - peterson-notes line 4146 (p. 103), Theorem 6.3.8; jones-vna line 3380 (p. 107), §16.2.
- Each agrees with `README.md:4635–4690` and `:4692–4932` (theorem number, page, hypotheses, statement). Printed page = PDF page − 6 for Anantharaman–Popa.

**Library declarations opened at the pins (Tau Ceti 2fd255d9).**

- `TauCeti/Analysis/InnerProductSpace/ProjValMeasure/`: `Basic.lean:91` (`ProjValMeasure`: fields `proj`, `diag`, `diag_finite`, `inner_proj`, `proj_univ`, `proj_inter`; no self-adjointness field, it is derived), `:524`; `Integral.lean:218, 253, 270, 298, 305, 318`; `Null.lean:88`; `DominatedConvergence.lean:63, 77`; `Polarization.lean:60, 68`; `Variation.lean:46` (bound `‖ψ‖‖ξ‖`); `Map.lean:40, 87`.
- `…/ProjValMeasure/Representation/`: `DiagonalMeasure.lean:94, 120, 150, 178`; `PolarizedMeasure.lean:80, 122, 225` (bound `2‖ψ‖‖ξ‖`), `:250`; `BorelOperator.lean:61, 112, 127, 134`. `representationBorelOperator` is a linear map only, as the README says ("not shown multiplicative at the pin").
- `TauCeti/MeasureTheory/Function/BoundedBorel.lean:81`; `…/BorelCalculus/DiagonalMeasure.lean:66, 81`.
- `TauCeti/Analysis/InnerProductSpace/LinearPMap/Resolvent.lean:70, 83`; `…/LinearPMap/Cayley.lean:79, 85`; `TauCeti/Analysis/Normed/Operator/LinearPMap/Cayley.lean:64, 80, 98`.
- `TauCeti/Analysis/CStarAlgebra/Action/Covariant/GNS.lean:85, 119, 138`; `…/KMS/Separating.lean:114` (unital C*-algebra, x in `VonNeumannAlgebra.adjoin` of the GNS range); `…/KMS/Basic.lean:237`.
- Searched by object for anything else the README restates: the other 70 modules under `Analysis/CStarAlgebra`, `Analysis/InnerProductSpace/{LinearPMap,ProjValMeasure,BorelCalculus}` and `Analysis/VonNeumannAlgebra` that the README does not cite, and the library at large for Kaplansky density, Tomiyama, Stinespring, modular theory, ICC, hyperfiniteness and direct integrals. No target of the README is proved at the pin.
  - `CharacterSpaceMeasure.lean:134, 195` (a positive functional of a commutative C*-algebra is a measure on its character space) composes Gelfand duality with `RealRMK.rieszMeasure`. V4.AbelianLocalizable consumes those two Mathlib inputs directly and states no target for the composite, so nothing is restated.
  - `Action/Covariant/Regular.lean` builds the regular covariant pair for point-norm continuous C*-actions; V8's crossed products are for actions on von Neumann algebras that are only pointwise weakly continuous, a wider class.
  - `Analysis/InnerProductSpace/Polar/Bounded.lean` implements what the README consumes from OperatorTheory PolarDecomposition PD-A36–A45 and PD-B23–B36.

**Cross-roadmap citations resolved (main 2bbd3cbf and open heads).**

- OperatorTheory on main: PD-A36, PD-A45, PD-B23, PD-B24, PD-B36 (`PolarDecomposition/README.md:211–397`); OI-B29, OI-B32 (`OperatorIdeals/README.md:349–355`); SA-B85 consumes V4.0.Fields (`SelfAdjointSpectralTheory/README.md:255`).
- BanachAlgebras on main: §3.1 (line 756), §7.2 (1555), §7.3 with A7.IntegratedRepresentations and A7.RegularL2 (1611–1633), §7.5 with A7.CharactersAndUniqueness (1735–1739). AmenableGroups on main: Layers 5–7 (289, 391, 415).
- BanachSpaceTheory: the overlaps file lists `#b1-…`, `#b2-…` and `#b4-…` as dropped by the open revision of BanachSpaceTheory. That revision's Scope (its lines 26–37) maps each of the three anchors to its Layer 1, 2 and 4 headings, so the citations stay valid: no change and no dependency.
- The worker's citation check lists no unresolved roadmap citation and no unresolved Lean name.
- Overlaps: no open pull request changes this folder, and this pull request drops no id that another roadmap cites. The four closest open roadmaps (OperatorAlgebraDynamics, QuantumFoundations, NoncompactQuantumSymmetry, and UnboundedOperators in the OperatorTheory revision) cite V2, V4.0.Fields, V10.ClosedOperators, V10.Affiliation, V10.KMS, V11 and V12.J as consumers; every label they cite is a heading at this head, and none of them owns an object of this roadmap.

**Headline theorems.** Bicommutant (`double_commutant_iff_isClosed_image_ofCLM`), Kaplansky (`closure_unitBall_eq_unitBall_double_centralizer`), trace on a II₁ factor (`tracialState_unique`, `exists_faithful_tracialState`), type decomposition, KMS characterization of the modular group (`existsUnique_isKMS_flow`), ICC criterion, Dye and Bunce–Wright (`dye`, `exists_unique_extension_of_finitelyAdditive`), Tomiyama, injective iff hyperfinite, uniqueness of the injective II₁ and II∞ factors are stated. The module docstring names the ones that are not statable at the pins (the `S(M)` classification, the type III uniqueness theorems) and what each lacks.

**Adversarial pass (values computed this round).**

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| V2.BorelCalculus (repaired) | `a=diag(0,1)`, `ξ=e₁+ie₂`, `η=e₂`; H=0 | `μ_(ξ,η)({1})=⟨ξ,e₂₂η⟩=conj(i)=−i`; `∫z dμ=−i=⟨ξ,aη⟩`; variation 1 ≤ `‖ξ‖‖η‖=√2` ≤ `2√2`; on H=0 every π(f)=0 and `P(K)=1=0` | holds; agrees with the pin's slot order | none |
| V2 bounded-convergence Check | t on `L²[0,1]`, `f_n=1_([0,1/n])` | `‖f_n(a)ξ‖²=∫₀^(1/n)|ξ|²→0`; `‖f_n(a)‖=1`; limit `1_({0})` is P-null | holds | none |
| V10.ClosedOperators (repaired) | T=0; T=t on `L²(ℝ)`; λ nonreal | `1+2i(−i−0)⁻¹=1+2i·i=−1`; `1+2i/(−i−t)=(i−t)/(−i−t)=(t−i)/(t+i)`, never 1; `sup_t 1/|λ−t|=1/|Im λ|` | holds | none |
| V4.Normality, implementing unitary (repaired) | `M₂`, `φ=tr/2`, `u=diag(1,−1)`, `b=e₁₂` | `ue₁₂u*=−e₁₂`, `φ(e₂₁·(−e₁₂))=−1/2`; `[b]↦[ub]`: `φ(e₂₁e₁₂)=1/2`, sends Ω=1 to u≠1; both covariant for Ad u | holds; the fixed-vector clause separates the two | none |
| Layer 6 separating step (repaired) | `M₂⊗1` on ℂ⁴, `Ω=(e₁⊗e₁+e₂⊗e₂)/√2`; `M₂` on ℂ² | vector state `tr/2`, tracial, so 0-KMS; `(x⊗1)Ω=0` gives `xe₁=xe₂=0`, x=0; on ℂ² no vector state of `M₂` is tracial (`⟨ξ,e₁₂e₂₁ξ⟩=|ξ₁|²`, `⟨ξ,e₂₁e₁₂ξ⟩=|ξ₂|²`, and the cross terms force ξ=0) | holds | none |
| `tomiyama` (13.1) | E diagonal compression on `M₂`, a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]]; `P(x)=e₁₁xe₁₁`; A=0 | `axb=[[10,28],[45,84]]`, `E(axb)=diag(10,84)=aE(x)b`; P has norm 1, fixes `ℂe₁₁`, `P(1)=e₁₁`; on A=0 every map has norm 0≠1 | holds | none |
| `IsInjective` (13.1) | `B(H)`; `ℓ∞⊂B(ℓ²)`; M=0 | identity; diagonal expectation of norm 1; P=0 with `‖P‖=0≤1` | holds | none |
| Arveson Checks (13.1) | transpose on `M₂`; state `(a,b)↦(a+b)/2` | image of `Σe_(ij)⊗e_(ij)` is the flip, eigenvalue −1 on `e₁⊗e₂−e₂⊗e₁`; `ρ=[[1/2,c],[c̄,1/2]]` positive iff `|c|≤1/2` | holds | none |
| V13b.SpatialNorm Checks | `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁`; `1⊗1`; `(0,ℂ,id)` | `u*u=e₂₂⊗e₂₂+e₁₁⊗e₁₁` (cross terms `e₂₁e₂₁=0`), rank 2, `‖u‖=1` vs 2; `‖1⊗1‖=1` vs `√2·√2=2`; slice norm 0 vs `‖ψ‖=1` | holds | none |
| `IsHyperfinite`, hyperfinite Checks (13.2) | R; `B(ℓ²)`; zero algebra; `E_n` on `L∞[0,1]`, `f=1_[0,1/3]` | `M_(2ⁿ)` increasing; `A_n≅M_n⊕ℂ`; `{0}''={0}`; `E_nf` at 1/3 is `frac(2ⁿ/3)∈{1/3,2/3}`, so sup error ≥1/3, L¹ error ≤`2⁻ⁿ` | holds | none |
| Følner Checks (13.2) | ℂ², `τ(a,b)=(a+2b)/3`, u=(1,−1), x=(1,0), ε=1/10 | `8|α|²(1−|α|²)≤1/100` forces `|α|²≤0.001252` or `≥0.998748`; ratios `|α|²` or 1/2, never within 1/10 of 1/3; `T=diag(3^(−1/2),(2/3)^(1/2))`: `1/3+2/3=1`, `Tr(xT²)=a/3+2b/3` | holds | none |
| `isInjective_iff_isHyperfinite` | `L(F₂)`; `ℂ1`; H=0 | hypertrace would give `m(W(a))+m(W(a⁻¹))=1=m(W(b))+m(W(b⁻¹))` on four disjoint sets of mass ≤1: not injective, and not Γ so not hyperfinite; `ℂ1`: both true; H=0: both true | holds | none |
| uniqueness of injective II₁, II∞ | R vs `R⊗̄M₂`; `R⊗̄B(ℓ²)` | `M_(2ⁿ)⊗M₂=M_(2ⁿ⁺¹)`; corner by `1⊗e₀₀` is R; separability of H and K in both signatures | holds | none |
| `double_commutant_iff_isClosed_image_ofCLM` | `ℂ1`; `K(ℓ²)+ℂ1` | `ℂ1''=ℂ1`, closed; commutant `ℂ1`, bicommutant `B(ℓ²)`, not WOT closed: both false | holds | none |
| `tracialState_unique`, `exists_faithful_tracialState` | `M₂`; `ℂ⊕ℂ`; `B(ℓ²)` | `tr/2` only; `t·pr₁+(1−t)pr₂` for every t, not a factor; `1∼p∼1−p` forces `τ(1)=2τ(1)` | holds | none |
| `isFactor_groupVonNeumannAlgebra_iff` | ℤ/2; trivial group; F₂ | circulants `[[a,b],[b,a]]`, centre of dimension 2, class {g} finite: both false; ℂ on ℂ: both true; `bⁿab⁻ⁿ` distinct: both true | holds | none |
| `existsUnique_isKMS_flow` | `M₂`, h=diag(2/3,1/3), x=e₁₂, y=e₂₁; `Ad(diag(3^(it),1))` | `σ_t(e₁₂)=2^(it)e₁₂`: `F(t)=(2/3)2^(it)`, `F(t+i)=(1/3)2^(it)=φ(e₂₁σ_t(e₁₂))`; rate 3 gives `(2/9)3^(it)≠(1/3)3^(it)` | holds; convention `F(t)=φ(σ_t(x)y)` as in the Lean | none |
| `dye`, `exists_unique_extension_of_finitelyAdditive` | ℂ² swap; `M₃` transpose; `M₂` | `(a,b)↦(b,a)` Jordan; `(e₁₂e₂₁)ᵀ=e₁₁` vs `e₂₁e₁₂=e₂₂`, anti-multiplicative; `M₂` is the excluded `I₂` case | holds | none |
| Conventions (`p∼q`, slot order) | `e₂₁` in `M₂`; `ω_ξ` | `e₂₁*e₂₁=e₁₁`, `e₂₁e₂₁*=e₂₂`; `⟨ξ,xξ⟩` linear in x through the second slot, as `inner_gnsImplementingGroup_apply_coe` and `polarizedComplexMeasure_apply` use | holds | none |

## Not verifiable

- Tomiyama 1957: the cached `tomiyama-1957` text is the host's block page (line 5), so Theorem 1, pp. 608–609, was not read. The README cites it only for positivity and bimodularity in the unital case, as anantharaman-popa line 13597 attributes it; complete positivity is taken from Hiai and Peterson, both read.
- Settled as uncertified and cited by locator: Arveson 1969 (Theorem 1.2.3), Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- Takesaki I, Theorem IV.4.9; Takesaki III, XV.3, XVI.1.9; Reed–Simon I, Theorems VIII.3–VIII.4; Rudin, Theorems 13.19 and 13.30: cited in 13.2 and V10 and not in the cache. No fetch was made. The Rudin and Reed–Simon statements cited for the steps now consumed from Tau Ceti are the pinned theorems themselves.
- The pull request has no readable `design/plan.json`, so no declared supplier gap was checked; the README states none.

## Source issues

- **Misprint** in anantharaman-popa at Definition 10.2.1, p. 161: the source says "a von Neumann M is amenable", omitting a word; it should say "a von Neumann algebra M"; affects nothing.
- **Misprint** in jones-vna at Definition 16.1.1, p. 107: the source's definition of property Γ breaks off after "a central"; it should end with a central sequence that is not trivial; affects nothing.
