# Review of NoncompactQuantumSymmetry (pull request #1015 at a7afa46)

**Verdict:** needs changes

This is a full review of the head a7afa46 (158 changed README lines since 04e6334, the head the previous review read; `Suggested.lean` is unchanged). The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with its five `sorry` warnings and nothing else. Of the previous review's five findings, three (R01, R03, R04) are repaired and verified below; two (R02 and R05) are not repaired and are carried as the only findings of this round. Both are P3 and neither concerns the mathematics of the folder: one is the pull-request description, the other the size of the roadmap.

## R01 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision, which the description does not name

Re-raised: R02 of the previous review at 04e6334 (first raised as R01 of the review before it). No repair report marks it as not actionable.

**Location:** README `:19`, `:133`, `:216`, `:340`, `:1129` and 13 further lines cite `OperatorAlgebraDynamics D1.BorelPrefix`; `:19`, `:133`, `:1724` cite `D1.TwistedBorel`; `:19`, `:133` cite `D4.Harmonic`. The description's revision line reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145".

**Claim:** every cited id resolves on main, or the revision that defines it is named so that it merges first.

**Witness:** main's OperatorAlgebraDynamics README contains none of the three strings (count 0). They are headings at the open revision #1137, now at head 53ad990 (`:52`, `:58`, `:83–86`). The overlap report lists the first two under "only an open revision defines"; I confirmed the third by the same grep. Neither the revision line nor the merge-order chain of the description names #1137.

**Repair:** nothing in the folder changes. Name #1137 (OperatorAlgebraDynamics) in the revision-dependency line next to #1145, and in the merge-order chain before this pull request. The README's citations are correct as they stand.

## R02 (P3) — Size

Re-raised: R05 of the previous review at 04e6334 (first raised as R02 of the review before it). The earlier repair answered that a Part II folder cannot be created inside a repair job; that is true of the job, but it does not settle the finding, since the split is a request the author carries out in a pull request that adds the Part II folder, after which this README's introduction says where the base roadmap stops.

**Location:** the folder. The README has 9,298 lines (669 KB). M5 (`:3676–6313`) has 2,638 lines and M6 (`:6314–9270`) has 2,957.

**Witness:** the figures grew by 114 lines this round and no Part II folder exists. The M5 all-sequence contraction and de Sitter transition tables and the M6 pair, exchange and tree tables exceed every interface a consumer names (RelativisticQuantumFieldTheory consumes M2/M4 and the helicity labels, `:9273–9276`; QuantumFoundations consumes Layer P and the M-layer models, `:9278–9279`).

**Repair:** as before. Move M5.DeSitterNullZero, M5.DeSitterRemainingTransitions, M5.StructuralModelComposition and the M6 tables after M6.MeasuredPair into "NoncompactQuantumSymmetry, Part II", whose introduction says that the base roadmap stops at M5.DeSitterFiber and the M6.MeasuredPair interface.

## Previous findings

- **R01 (P2, CompactGroups Layers 1/4 cited for pinned Tau Ceti content) — repaired.** No line of the README contains "CompactGroups Layer" any more (count 0). The supplier contracts now name `ContRepresentation.isUnitarizable`, `ContRepresentation.exists_isUnitary_congr`, `ContRepresentation.schur_orthogonality_self`, `ContRepresentation.schur_orthogonality_basis`, `ContRepresentation.schur_orthogonality` and `TauCeti.stdPeterWeylBasis` with their files (`:67–94`), and the consumers at `:135`, `:4273–4274`, `:6067`, `:9178–9180` and `:9266–9267` cite those names. The six gap citations read "CompactGroups (`gap:banach-gfinite-density`)" with no layer number (`:9`, `:131`, `:1009`, `:1060`, `:1123`). I opened every named declaration at the pin (below): each exists with the hypotheses the README states, and the README's convention witness at `:96–100` (G=𝕋, coefficients `z⁻¹` and `−iz⁻¹`, both sides `−i`) is correct for `matrixCoeffLp π hπ v w = g ↦ ⟪π g v, w⟫` (`TauCeti/RepresentationTheory/Compact/MatrixCoefficient.lean:67–72`).
- **R02 (P3, #1137 not named) — not repaired.** Carried as R01 above.
- **R03 (P3, M4.ParticleLabels stated no conclusion) — repaired.** `:2435–2512` now states the classification on the cover `ℝ⁴⋊SL(2,ℂ)` by orbit (timelike `P_(m,j)^ε_E`, null `F_h^ε_E` and `C_(ρ,e)^ε_E`, spacelike `S_(r;τ)`, zero `Z_Λ`), the exhaustion through M2, the positive-energy equivalence with the closed forward cone, four Checks and a `*Needs:*` line, citing Mackey1958 Theorems 8.1 and 9.1 (uncertified, cited by locator). Every statement was recomputed (rows 182–190 below) and holds in the roadmap's own conventions (`:2203–2212`, `:2300–2306`, `:3000–3016`).
- **R04 (P3, two supplier locators) — repaired.** `:135`, `:861`, `:1002` and `:1123` cite "Completed/HopfRinow Layer 3" with the relative link `../../Completed/HopfRinow/README.md`, which resolves from this folder to the archived roadmap; its Layer 3 (`Completed/HopfRinow/README.md:451–493`) proves that every closed ball is compact from `(a_p)` and `(f_p)`. `:829–830` cites "LieGroups Layers 0 and 3 (the exponential map; BCH and the analytic local group law)" and `:1065–1066` "Layers 0–3 … and Layers 4–5 (integration of Lie-algebra homomorphisms from simply connected groups, simply connected covers)": on main, LieGroups Layer 0 is the exponential map (`:233`), Layer 3 the Lie functor and BCH (`:300`), Layer 4 Lie's third theorem and the equivalence of categories (`:326`), Layer 5 simply connected covers (`:358`).
- **R05 (P3, size) — not repaired.** Carried as R02 above.

## Verified sound

**Gate.** I ran it on this head:

`gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The worker's gate file records the same with `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

**Dependency check** (`--movable`):

`depcheck: 243 roadmaps, 2456 edges, 0 problem(s)`

No UPWARD, CYCLE or moved line. NoncompactQuantumSymmetry is at line 152 of the merge order; AutomorphicFormsOnReductiveGroups (69), OperatorAlgebraDynamics, CompactGroups, LieGroups, HilbertModules, CStarAlgebras, VonNeumannAlgebras, SmoothBanachRepresentations, UnboundedOperators, MetaplecticAutomorphicForms, LaguerreJacobi and InductionRestriction all precede it or are on main. QuantumFoundations and RelativisticQuantumFieldTheory appear only as consumers (`:9273–9279`).

**Build.** `lake env lean` on `Suggested.lean` takes 7.6 s and warns `declaration uses sorry` at `:75`, `:88`, `:100`, `:116`, `:189`, nothing else. The file has `module`, `public import Mathlib`, `@[expose] public section`, one module docstring, `theorem` only, no `set_option`, no `#check`, 199 lines.

**Signatures.** The worker's file flags `[IsClosed (H : Set G)]` as dropped on five declarations; each elaborated type carries `[inst_8 : IsClosed ↑H]`, so all five leads are false. The five definitions (`rayTransitionProbability`, `InducedModelData`, `.isotropy`, `.rnDerivative`, `.sectionAction`) are exactly what the two headlines `wigner_reconstruction` and `exists_inducedRepresentation` mention; the three theorem statements carry every hypothesis their README statements carry (`CompleteSpace`, `Nontrivial`; `CharZero`, `IsSemisimple`, two `FiniteDimensional`; `PolishSpace G`, `StandardBorelSpace X`, `MeasurableSMul₂`).

**Padding probe.** On a scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | aesop | sorry`: no theorem closes (three still warn `sorry`; `whitehead_two` and `exists_inducedRepresentation` are left with unsolved goals after `simp` rewrites). No declaration restates a definition, mirrors a Check or computes a value.

**Headlines.** Stated: Wigner's theorem (P.1), both characteristic-zero Whitehead lemmas (P.4), the Becker–Kechris realization (M1), the induced representation on the actual `Lp` carrier (M1). The module docstring names every other headline, layer by layer, with the missing carrier, including the new energy-branch theorem of M4.ParticleLabels (joint translation PVM: "covariant position PVMs … beyond the native matrices"). Every Lean name occurs in the README; the four names the citation tool lists as "found nowhere" are this roadmap's own declarations (`InducedModelData.rnDerivative`, `.sectionAction`, `.exists_inducedRepresentation`) and InductionRestriction's `Gassmann.almostConjugate_iff_permutation_equiv` (main `Suggested.lean:729`, as recorded last round).

**Library declarations opened at the pins** (the Tau Ceti pin of `lake-manifest.json`):
- `ContRepresentation.isUnitarizable` (`TauCeti/RepresentationTheory/Compact/Unitarizable.lean:241`): `[RCLike 𝕜] [CompactSpace G] [BorelSpace G] [InnerProductSpace 𝕜 V] [CompleteSpace V]`, `hπ : Continuous π`; conclusion `∃ S, IsSelfAdjoint S ∧ (∀ v ≠ 0, 0 < re ⟪S v, v⟫) ∧ ∀ g, adjoint (π g) ∘ (S ∘ π g) = S`. As the README states.
- `ContRepresentation.exists_isUnitary_congr` (`Compact/UnitaryModel.lean:88`): `[FiniteDimensional 𝕜 V]`, `∃ e : V ≃L[𝕜] V, IsUnitary (congr e π)`. As stated.
- `ContRepresentation.schur_orthogonality_self` (`Compact/SchurOrthogonality.lean:104`): `[IsAlgClosed 𝕜]`, `IsUnitary π`, `Representation.IsIrreducible π.toRepresentation`, conclusion `⟪matrixCoeffLp v₁ w₁, matrixCoeffLp v₂ w₂⟫ = (finrank)⁻¹ * (conj ⟪v₁,v₂⟫ * ⟪w₁,w₂⟫)`. As stated. `schur_orthogonality_basis` (`:122`): `d⁻¹ · [j=l] · [i=k]` for `πᵢⱼ = matrixCoeffLp (e j) (e i)`. As stated. `schur_orthogonality` (`:151`): inequivalent irreducibles, `IsUnitary ρ` on the second, no algebraic closure. As stated.
- `TauCeti.stdPeterWeylBasis` (`Compact/PeterWeyl.lean:713`): `[IsAlgClosed 𝕜]`, a `HilbertBasis` of `Lp 𝕜 2 (haarProb G)`; `coe_stdPeterWeylBasis` (`:723`). As stated.
- `PiTensorProduct.reindexRepresentation` (`TauCeti/RepresentationTheory/Symmetric/TensorAction/Basic.lean:59`), built on Mathlib `PiTensorProduct.reindex` with `reindex_tprod : reindex e (⊗ f) = ⊗ i, f (e.symm i)` (`Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:685`): the `σ⁻¹` convention of M6.TensorCoherence `:8861`.
- `TauCeti.exists_isCompl_of_isKilling` (`Algebra/Lie/HighestWeight/CompleteReducibility.lean:259`), `TauCeti.FactorSet` (`GroupTheory/GroupExtension/Of/FactorSet.lean:96`), `TauCeti.isProjectiveRepEquivExtensionHom` (`RepresentationTheory/ProjectiveRepresentation/Extension.lean:343`), Mathlib `LieAlgebra.IsSemisimple.instHasTrivialRadical` (`Algebra/Lie/Killing.lean:90`) and `HasTrivialRadical.instIsKilling` (named at `Killing.lean:85`, in `CartanCriterion.lean`), all cited at `:35`.
- `matrixCoeffLp` (`Compact/MatrixCoefficient.lean:72`, docstring `:67`): `g ↦ ⟪π g v, w⟫`, conjugate-linear in `v`.

**Seeded sample (15 targets): what was checked at the locator or by computation.**

| Target | Locator | Checked |
| --- | --- | --- |
| M2.DerivedDI `:2009` | derived (M0, V4.0.Fields) | the displayed domain is the direct integral of closed operators; the Gårding graph sections are bounded by `‖φ‖₁‖ξ‖`; the scalar form `T_Z=∫⊕q_Z Id` is restricted to irreducible fields (row 203) |
| Actual stabilizer geometry `:3203` | derived | `k²=Q²=−I`, `Qk=−kQ`, `σ(Q)=Q`, `σ(k)=k`, `σ|H=Ad(k)` on `H=SU(1,1)` (row 196); the Cayley images and the sign action on `J,H₀,X` (row 197) |
| Intrinsic contraction space `:3730` | LieGroupoidsPoisson G0, OAD D5 | H connected from `π₁(ℝ×S³)=0`, zero-fibre law, Haar density `r⁻⁴` (row 198) |
| M5.Coding `:3856` | derived | the SL(2,ℝ) label list and central characters (row 199) |
| M5.LittleDual.CoefficientSequence `:3980` | derived (Fell's criterion) | the subsequence criterion and the coefficient sufficiency (row 200) |
| M5.CompactInductionSupport `:4270` | Echterhoff2010 (5.4), Prop. 5.16 | eda47682 line 991 ((5.4), file page 20), line 1110 (Prop. 5.16, page 23), line 970 (Remark 5.10); support set and isotype unitary (row 201) |
| Euclidean/time-translation groups `:6387` | derived | pair stabiliser `{±1}`, weight coset, `r dr` (row 204) |
| Both momenta nonzero `:6558` | derived | stabiliser `ℝw×{±1}`, multiplicity 2 from `ζ=±κ`, `∞` for a transverse input (row 205) |
| Two opposite-energy null inputs `:6978` | derived | `q(u−v)=−2u·v≤0`, `n=2(h₁−h₂)`, `Ind_K χ_n` (row 206) |
| Orbit measures for the spacelike×massive and spacelike×null rows `:7035` | derived | `μν_in=r₀I`, `I=μ_(t,1)(r₀/2)dΩ`, compact mass `2πr₀²` (row 207) |
| Trivial spacelike little representation `:7160` | derived | `v⊥p_s`, `q(v)=m²+s²/r₀²`, `q=m²−r₀²+2s`, spatial component `(m²+r₀²−q)/(2r₀)` (row 208) |
| Finite helicity; two-sided compact weights `:7278` | derived | multiplicity `2J+1`; `V_J(u)` and `B_L(u)` (rows 209–210) |
| Continuous spin; every spacelike τ `:7347` | Mackey1958 Thm 9.1 (uncertified) | `q(p_n)=0`, `q(v)=s²/r₀²`, `d_τ(2J+1)`, the `s=0` null set (row 211) |
| Orbit measures, exceptional sets and PVM support `:8001` | derived | `du/π` on A via Crofton, the `q`-, `M`- and `r`-densities (rows 212–213) |
| M6.TensorCoherence `:8847` | Mathlib/Tau Ceti pins | `reindexRepresentation` convention (row 214) |

**Adversarial table.** Rows 1–181 of the earlier reviews remain on record for passages this head leaves untouched. The rows below cover the headlines, the changed passages and the sample. All signs and conventions are the README's (pairing `−p₀a₀−p₁a₁−p₂a₂+p₃a₃`, `χ_p(a)=exp(i⟨p,a⟩/ℏ)`, time index 3, `δ(w,θ)` with `θ∈ℝ/4πℤ`).

| # | Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 182 | ParticleLabels orbits `:2437` | the four orbit types | mass shells, punctured half-cones, one-sheeted hyperboloids, origin: each closed in an open set; M1 `:1285` needs exactly "all orbits locally closed" | Pass |
| 183 | timelike stabiliser `:2447`, Check `:2497` | `A(mI)A†=mI` | `⟺ AA†=I`, `SU(2)`; j=½: dim 2, `−I↦−1`, `W²=−m²ℏ²·¾` | Pass |
| 184 | null orbit `:2452` | `(0,0,ε_E,ε_E)` | `q=ε_E²−ε_E²=0`, `ε_E p₃=1>0` | Pass |
| 185 | finite helicity `:2453` | `exp(ihθ)`, `θ∈ℝ/4πℤ` | well defined iff `exp(4πih)=1` iff `2h∈ℤ` | Pass |
| 186 | continuous spin `:2456–2460`, Check `:2492–2495` | `δ(0,θ)` on `χ_ζ` | `w↦e^{iθ}w` (`:2304`) sends `ζ↦e^{∓iθ}ζ`; stabiliser `θ∈{0,2π}`, `δ(0,2π)=−I`; `η_e∈{+1,−1}` gives two models; mod 2π only `e=0` | Pass |
| 187 | Pauli–Lubanski values `:2449`, `:2461` | `P_(m,j)`, `C_(ρ,e)` at the reference | `W·W=−m²ℏ²j(j+1)<0` (spacelike W in the mostly-minus pairing); `:3015` gives `q(W)=−(ℏr₀ρ)²` and `r₀=1` here | Pass |
| 188 | energy equivalence `:2473–2478` | joint spectrum σ closed, `L(A)`-invariant | σ⊆V̄₊ ⟹ `spec(H)=cl(p₃(σ))⊆[0,∞)`; conversely a point with `p₃≥0`, `q<0` has orbit the one-sheeted hyperboloid, which contains `p₃<0` | Pass |
| 189 | Check `:2488–2491` | `(0,0,r cosh t, r sinh t)` | `q=r²sinh²t−r²cosh²t=−r²`, energy `r sinh t` onto ℝ; at `t=0` energy 0 | Pass |
| 190 | Check `:2500–2504` | `F_h^±` | future orbit closure adds only 0: `spec(H)=[0,∞)`, no atom; past: `W=ℏhP`, helicity `W⁰/|P|=h·sign(P⁰)=−h` (`:3004–3005`) | Pass |
| 191 | 𝕋 witness `:96–100` | `π(z)=z`, `v₁=w₁=w₂=1`, `v₂=i` | `matrixCoeffLp v w = ⟪zv,w⟫`: `z̄=z⁻¹` and `conj(zi)=−iz⁻¹`; `∫ z·(−iz⁻¹)=−i`; RHS `1⁻¹·conj⟪1,i⟫·1=conj(i)=−i`; the w-side variant gives `+i` | Pass |
| 192 | `wigner_reconstruction` | `H=ℂ`; `H=ℂ²`, coordinate conjugation | ℂ: one ray, `U=id`; ℂ²: Bloch vector `(x,y,z)↦(x,−y,z)`, det −1, outside `SO(3)=` image of `U(2)`, so the antiunitary disjunct is needed | Pass |
| 193 | `rayTransitionProbability` Checks `:204–206` | `e₁,e₂`; `e₁,e₁+e₂`; `2e₁,i(e₁+e₂)` | 0; `1/(1·2)=½`; `|2i|²/(4·2)=½` | Pass |
| 194 | `whitehead_one`, `whitehead_two` | `L=ℝ` abelian, `V=ℝ` trivial, `f=id`; `L=ℝ²`, `c=det` | `d₁₂f=0` but `f≠⁅·,v⁆=0`; `d₂₃det=0`, every coboundary `−f⁅x,y⁆=0≠det`: `IsSemisimple` needed and present | Pass |
| 195 | `exists_inducedRepresentation` | `H={1}`; `H=G` | `∫r_g(x)‖F(g⁻¹x)‖²dμ=∫‖F‖²d(g_*μ)... =‖F‖²` with `r_g=d(g_*μ)/dμ`; `H=G`: `X` a point, `U g=σ(s₀⁻¹gs₀)` | Pass |
| 196 | stabiliser geometry `:3210` | `Q=[[0,1],[−1,0]]`, `k=diag(i,−i)`, `A=[[α,β],[β̄,ᾱ]]∈SU(1,1)` | `k²=−I=Q²`; `Qk=[[0,−i],[−i,0]]=−kQ`; `(Q†)⁻¹=Q`, `(k†)⁻¹=k`; `(A†)⁻¹=[[α,−β],[−β̄,ᾱ]]=kAk⁻¹`; on `SL(2,ℝ)` instead `(Aᵀ)⁻¹=[[d,−c],[−b,a]]≠[[a,−b],[−c,d]]`, so H is SU(1,1) as `:3195` says | Pass |
| 197 | orientation `:3230–3234` | `Ad(σ₁)` on `J,H₀,X` | `σ₁Jσ₁=−J`, `σ₁H₀σ₁=−H₀`, `σ₁Xσ₁=X` | Pass |
| 198 | DNC `:3730–3757` | `G=SO₀(1,4)`, `dS⁴≅ℝ×S³` | `π₁(G/H)→π₀(H)→π₀(G)=0` gives H connected; `(a,h)(b,k)=(a+h·b,hk)` associative; chart Jacobian `r^{dim 𝔪}=r⁴`, Haar system `r⁻⁴dg` | Pass |
| 199 | M5.Coding labels `:3861–3867` | `I_(1,0)`, `D_n^±`, `I_(0,s)` | `I_(1,0)=D_1^+⊕D_1^−` (`:2299`), so `O_t` needs `t>0`; centre `(−1)^n` on weights `n+2ℕ₀`; `+1` on even series | Pass |
| 200 | CoefficientSequence `:3988–3990` | Fell's criterion | `π_j→π` iff every subsequence's direct sum weakly contains π; a convergent positive-definite coefficient of a cyclic vector determines the Gram matrices of `span π(h)v` | Pass |
| 201 | CompactInductionSupport `:4282–4296` | `L=SL(2,ℂ)`, `K=SU(2)`, `D_j` | K-types of `P_m(ω)` are `j≥|m|/2`, `j≡m/2 mod 1`, so `Supp Ind_K^L D_j={P_m(ω): |m|≤2j, m≡2j (2)}` in the reduced dual; `(R_kf)(g)=√d·(ℓ∘D_j(k)⁻¹)(F(g))`, right action `D_j*`; `∫_K|ℓ(D_j(k)⁻¹v)|²dk=‖ℓ‖²‖v‖²/d` fixes `√d` | Pass |
| 202 | Echterhoff locators `:4276` | file pages | line 956 = page 20 marker, (5.4) at line 991; line 1083 = page 23 marker, Prop. 5.16 at line 1110 | Pass |
| 203 | M2.DerivedDI `:2011–2022` | `π=∫⊕π_ζ`, `u=Z` central | `(π(φ)v)_ζ=π_ζ(φ)v_ζ` a.e.; `‖π_ζ(φ)ξ‖≤‖φ‖₁‖ξ‖`; scalar form only for irreducible fields, as stated | Pass |
| 204 | Euclidean tensor `:6395–6398` | `S_{r₁}×S_{r₂}→` radius `r` | `r²=r₁²+r₂²+2r₁r₂cosθ`, `2r dr∝sinθ dθ`: measure `r dr`; pair stabiliser `{±1}`, `−I↦(−1)^{2(h₁+h₂)}`, so `h−(h₁+h₂)∈ℤ` once each; `Z⊗Eucl`: `D_j|_{circle}` weights `−j..j` | Pass |
| 205 | `B⊗B`, `B⊗C` `:6562–6567` | little group `F₂=ℝ²⋊Spin(2)` of `P` | boosts shift the energy split by `v·p₁`, kernel `ℝw`; stabiliser `ℝw×{±1}`; `Ind_{ℝw}^{ℝ²}1=∫_{ζ∈ℝ}ξ_ζ`, radius `|ζ|` twice: multiplicity 2; `T_(κ,e)|_{ℝw}` is a continuous integral on `(−κ,κ)`: every radius, `∞` | Pass |
| 206 | opposite null `:6982–6990` | `u`, `v` future null | `q(u−v)=−2u·v≤0`, `=0` iff collinear; `Ind_K^{SL(2,ℝ)}χ_n=∫I_(n mod 2,iν)⊕⊕_{2≤l≤|n|, l≡n}D_l^{sign n}`, `n=1`: no discrete atom (`D_1^±` sit at `ν=0`); `n mod 2≡2(h₁+h₂)` | Pass |
| 207 | orbit-measure constants `:7044` | `I=δ(q(p)+r₀²)δ(q(v)−1)δ(p·v)` | along p: `δ(r₀v_p)dv_p=1/r₀`, so `μν_in=r₀I`; along v: `δ(|p|²−r₀²)d³p=(r₀/2)dΩ`; sphere mass `r₀·(r₀/2)·4π=2πr₀²` | Pass |
| 208 | trivial spacelike row `:7175–7200` | `p_s=(0,0,r₀,0)`, `p_m=(0,0,−s/r₀,ε_E√(m²+s²/r₀²))` | `p_s·p_m=s`, `q(p_m)=m²`; `v·p_s=s−s=0`, `q(v)=m²+2s²/r₀²−s²/r₀²`; `q(sum)=m²−r₀²+2s`; spatial sum `(r₀²−s)/r₀=(m²+r₀²−q)/(2r₀)` | Pass |
| 209 | two-sided weights `:7283–7287` | weights `e_τ+h+ℤ`, each once | `#{u: |u|≤J, u∈e+ℤ}=2J+1` | Pass |
| 210 | `V_J(u)`, `B_L(u)` `:7294–7300` | `u>J`; `−J≤u≤J`; `u<−J`; `u=−3`, `L=4` | 0; `J−u+1`; `2J+1` (formula: `J−u−(−J−u)+1`); `k=3−2=1`: weights `−3,−2` with `2|w|≥4` give `2=k+1` | Pass |
| 211 | continuous spin row `:7351–7358`, geometry `:7372–7389` | `p_n=(0,0,−s/r₀,ε_E|s|/r₀)`; `τ=1` vs `τ≠1` | `q(p_n)=0`, `p_s·p_n=s`, `q(v)=s²/r₀²`; `r<r₀⟺s>0`; fibre weight `u` has multiplicity `#weights(τ)=d_τ`; `s=0` is the plane `p_{n,2}=0`, null for `d³p/(2|p₃|)`; `ε_E(0,−1,0,1)`: `q=0`, `⊥p_s` | Pass |
| 212 | `du/π` on A `:8005–8007` | `a_r=diag(r,r⁻¹)` (`:2299`), `u=log r`, rapidity `2u` | `H_s/K=H²` with `½dA`; `H_s/MA=dS₂` with `ν=½cosh t dt dφ`, which pushes to Santaló's `cosh p dp dθ`; Crofton: `∫length(γ∩B)dν=π·Area(B)` must equal `½Area(B)`: A-measure `d(rapidity)/(2π)=du/π` | Pass |
| 213 | two-spacelike densities `:8020–8035` | `s=(q+a²+b²)/2`, `A=a+b`, `d=a−b` | `s²−a²b²=(q+A²)(q+d²)/4`, `√|…|ds=¼√|(q+A²)(q+d²)|dq`; `q=M²`: `½M√(…)dM`; `q=−r²`: `½r√|(A²−r²)(d²−r²)|dr`; against `μ/M²`, `μ/r²`: `√(…)/(2M)`, `√|…|/(2r)` | Pass |
| 214 | TensorCoherence `:8861` | `reindex_tprod` | `reindex e (⊗f)=⊗_i f(e⁻¹i)` = `U_σ(⊗v_i)=⊗v_{σ⁻¹i}` | Pass |
| 215 | R01 of r7 | the six names at the pin | each exists with the README's hypotheses (list above); no line cites a CompactGroups layer number | Pass |
| 216 | R04 of r7 | the links | `Completed/HopfRinow/README.md:451` is "Layer 3: the Hopf–Rinow equivalence"; LieGroups `:233`, `:300`, `:326`, `:358` | Pass |
| 217 | R02 of r7 | main vs #1137 at 53ad990 | 0 occurrences on main; `:52`, `:58`, `:83–86` at the head; description names #1145 only | Fail: R01 |

**Cross-roadmap citations resolved this round:**
- AutomorphicFormsOnReductiveGroups at its open head (`roadmaps show`): the gap "What CompactGroups must provide (gap:banach-gfinite-density)" in its supplier contracts (`:52`) and §2.1 "Compact-finite vectors and admissibility" (`:300`), as `:9` now describes.
- OperatorAlgebraDynamics D1, D3, D5 on main and D1.BorelPrefix, D1.TwistedBorel, D4.Harmonic at #1137 (53ad990).
- Completed/HopfRinow Layer 3; LieGroups Layers 0, 2, 3, 4, 5, 7, 9 on main.
- RelativisticQuantumFieldTheory (#1772) consumes M4 and the labels `ε_E=+1, ℓ=±2` for helicity ±1 (`:104`, `:478`), consistent with `ℓ=2h`. QuantumFoundations (#1771) and QuantitativeOrbitMethod (#1842) cite this roadmap as a supplier and state none of its objects. No open roadmap in the brief's list states the Poincaré orbit classification or the continuous-spin models; ownership against open pull requests whose files the brief does not give was not checked.

## Not verifiable

- Mackey1958 (Acta Math. 99): uncertified in the manifest; cited by locator at `:2443` (Theorems 8.1 and 9.1) and `:7368`.
- Lang, *SL₂(ℝ)*, Ch. VIII, pp. 163–177 (`:7061`, `:7366`): book not held.
- Dooley p. 21 (`:6416`): no legal source.
- Weibel1994 Cor. 7.8.10/7.8.12 and Kechris1995 Thm 9.10: books not held; the Lean statements were checked against Mathlib's `d₁₂` and the Becker–Kechris statement last round.
- The README flags no locator as unverified.

## Source issues

- none
