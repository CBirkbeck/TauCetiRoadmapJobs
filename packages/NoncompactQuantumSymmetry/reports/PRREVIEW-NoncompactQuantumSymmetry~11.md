# Review of NoncompactQuantumSymmetry (pull request #1015 at a304a46)

**Verdict:** needs changes

This is a full review of head a304a46; the folder changed by 308 lines since 1acf23c. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with five `sorry` warnings and nothing else. There are four findings, all P3 and none blocking. Two are new: a selector re-plan that the previous repair missed, and one supplier-contract omission. Two are carried from the previous review: the unnamed revision #1137 and the size.

Status of the previous review's findings:

- **R01 (Glimm statable): repaired.** `separable_typeI_tfae` (`Suggested.lean:137`) states the factor-type-I, GCR and same-kernel forms. It uses `IsIrreducibleRep` (`:109`), `IsFactorRep` (`:118`) and `HasMinimalProjection` (`:126`). The docstring (`:32–35`) now names only the composition series (no C⋆-quotient `I ⧸ J`) and the Fell/hull-kernel homeomorphism as not statable. Both claims are confirmed at the pins.
- **R02 (Borel selector re-planned): partly repaired.** `:1284` reads "M1 derives the Borel section of each quotient map `G→G/H` … from Tau Ceti's Kuratowski–Ryll-Nardzewski theorem". `:1306`, `:1466` and `:1474` now consume `TauCeti.exists_measurable_forall_mem`. A fourth passage, `:1604–1609`, still plans the nested-balls route (R01 below).
- **R03 (`IsUnitary`): repaired.** The `Suggested.lean` fields are now `fiber_isUnitary : fiberRepresentation.IsUnitary`, `U.IsUnitary` and `rep_isUnitary : rep.IsUnitary`. README `:60–64` and `:1293` use the same convention.
- **R04 (Tau Ceti C⋆-dynamical carriers): repaired.** README `:107–127` lists `CovariantRepresentation`, `integratedOperator`, `norm_integratedOperator_le`, `dense_span_integratedOperator_iff`, `FullCrossedProduct`, `of`, `denseRange_of`, `norm_le_iff`, `integratedFull`, `coefficientMultiplier` and `groupMultiplier`. Layer 0 Dependencies (`:268`), M2 (`:2058`, `:2144`) and M4.SpatialLocalization (`:2817`, `:2829`) cite them. M1 Dependencies (`:1877`) add InductionRestriction Layer 2.1, `TauCeti.ProjValMeasure`, `.map`, `TauCeti.exists_measurable_forall_mem` and `ContRepresentation.IsUnitary`. All 11 declarations exist at the pin (listed below).
- **R05 (ABF24 locator, References): repaired.** `:5062–5063` now reads "§1.2, (1.4), and §1.3, Proposition 1.3, (1.5) and observations (A)–(C), pp.7–8", and the References entry (`:9481`) gives the version and every locator. All are checked in rows 33 and 34.
- **R06 (M1 Check, "SA"): repaired.** `:1323–1325` reads "For `G_sp=ℝ³⋊SU(2)` acting on ℝ³ the arbitrary-Hilbert extension is M4.SpatialLocalization; the general transitive theorem is stated for separable 𝓗 only." `:2180` reads "SelfAdjointSpectralTheory SA-B85 supplies".
- **R07 (#1137 not named): not repaired.** The description is unchanged. Carried as R03.
- **R08 (size): not repaired.** The README grew from 9,344 to 9,490 lines. Carried as R04.

## R01 (P3) — M1 still plans its own nested-balls Borel selector for central circle extensions

**Location:** README `:1606–1609`: "prove its Borel selection using countable nested balls in a complete compatible metric. Supply this selection lemma here if the consumed uniformization API only provides a universally measurable selector."

**Claim:** a theorem the pins prove is consumed by name, not re-planned. This passage is the one place the previous R02 repair did not reach.

**Witness:** `TauCeti.exists_measurable_forall_mem` (`TauCeti/MeasureTheory/MeasurableSpace/Selection.lean:151`) needs closed, nonempty values in a Polish space and measurable `{z | (M z ∩ U).Nonempty}`. For the passage's open continuous surjection `q:E→G` of Polish groups, take `M(x)=q⁻¹{x}`. Its values are closed and nonempty, and `{x : M(x)∩U≠∅}=q(U)` is open.

**Repair:** replace the two quoted sentences with the following.

"Apply `TauCeti.exists_measurable_forall_mem` to `M(x)=q⁻¹{x}`. Its values are cosets of the closed kernel 𝕋, nonempty since q is onto, and `{x : M(x)∩U≠∅}=q(U)` is open for open U since q is open. Normalize the resulting Borel section by `s(1)=1`; changing a Borel map at one point keeps it Borel."

Tested on the passage's own data (Polish E, open continuous surjective q): every hypothesis of the pinned theorem holds. Then add `TauCeti.exists_measurable_forall_mem` to the *Needs* of this paragraph. The same name is already listed under "From Tau Ceti" at `:89`.

## R02 (P3) — The CStarAlgebras supplier row omits C2.3, which M0a now consumes

**Location:** README `:201`: "CStarAlgebras C1/C2 | C1 ideal/approximate-unit APIs; C2 separable prime⇒primitive, primitive ideals, hull-kernel topology … Kadison transitivity with its norm bound and quotient-norm lower semicontinuity". Compare `:716–717`: "The same-kernel lemma is consumed from CStarAlgebras §2.3 (C2.3)".

**Claim:** the exact supplier contracts name every section consumed, with what is assumed of it.

**Witness:** CStarAlgebras on main §2.3 (`:616–627`) proves two things: one nonzero compact operator in π(A) forces `K(H)⊆π(A)`, and irreducibles with equal kernels are then equivalent, with no separability. M0a (`:716–720`) and its Dependencies (`:838`) consume this. Row `:201` lists neither.

**Repair:** append the following to the interface cell of row `:201`.

"C2.3 representations containing a nonzero compact operator (`K(H)⊆π(A)` and equal-kernel equivalence, with no separability hypothesis); C2.2's nonzero irreducibility predicate, restated on the same carrier as `IsIrreducibleRep`".

Tested against the main text: the C2.2 body (`CStarAlgebras/Suggested.lean:102–105`) is identical to `Suggested.lean:109–112` here.

## R03 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision #1137, which the description does not name

Carried from R07 of the previous review (and R05 of the one before). No repair report marks it not actionable.

**Location:**

- D1.BorelPrefix: README `:11`, `:19`, `:195`, `:243`, `:282`, `:357`, `:406`, `:1284`, `:1595`, `:1623`, `:1877`, `:2217` and others; `Suggested.lean:21`.
- D1.TwistedBorel: `:11`, `:19`, `:195`, `:1905`, `:2217`.
- D4.Harmonic: `:19`, `:195`, `:243`, `:268`.

The description reads: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1145".

**Witness:** OperatorAlgebraDynamics on main (b3d628f) contains the three ids 0, 0 and 0 times. At the head of #1137 it contains them 14, 12 and 17 times. The overlap report lists D1.BorelPrefix and D1.TwistedBorel as defined only by #1137.

**Repair:** nothing in the folder changes. Name #1137 (OperatorAlgebraDynamics) in the description's revision line and in its merge-order chain before this pull request. #1145 adds a new folder (SmoothBanachRepresentations); it is not a revision of a roadmap on main.

## R04 (P3) — Size: split into a Part II

Carried from R08 of the previous review. No repair report addresses it.

**Location:** the folder. The README has 9,490 lines (697,825 bytes), up from 9,344. M5 spans `:3864–6501` (2,638 lines) and M6 spans `:6502–9458` (2,957 lines).

**Witness:** the consumers that exist at open heads use Layer P, M0, M2/M4 and the helicity models, not the M5 all-sequence tables or the M6 pair, exchange and tree tables:

- QuantumFoundations (#1771 `:65–66`).
- RelativisticQuantumFieldTheory (#1772 `:60–64`).
- QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (#1842 `:121`, `:244`).

**Repair:** as before. Move M5.DeSitterNullZero, M5.DeSitterRemainingTransitions (both first at `:4981`), M5.StructuralModelComposition (`:3986`) and the M6 tables after M6.MeasuredPair (`:6646–9458`) into "NoncompactQuantumSymmetry, Part II". Its introduction should say that the base roadmap stops at M5.DeSitterFiber (`:4979`) and the M6.MeasuredPair interface.

## Verified sound

**Gate** (my run on this head): `gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate records the same, with `build=0`.

- The diff outside the folder is empty.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check** (`--movable`): `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

- NoncompactQuantumSymmetry is line 154 of the merge order.
- Its suppliers in the order all come earlier: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, PseudodifferentialOperators 13, AutomorphicFormsOnReductiveGroups 59, MetaplecticAutomorphicForms 149, LieGroupoidsPoisson 151.
- QuantumFoundations (208) and RelativisticQuantumFieldTheory (210) are consumers. So is QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (291), which consumes M0 item 1.

**Build.** `lake env lean` on `Suggested.lean` (12 s) warns `declaration uses sorry` at `:89`, `:137`, `:161`, `:234` and `:273`, and nothing else.

**Signatures.** I elaborated `#check @name` for all 14 declarations in one scratch file.

- All five "dropped `[IsClosed (H : Set G)]`" leads are false. `[IsClosed ↑H]` appears in the elaborated types of `InducedModelData`, `isotropy`, `rnDerivative`, `sectionAction`, `exists_inducedRepresentation` and `exists_induced`.
- `separable_typeI_tfae` carries `[TopologicalSpace.SeparableSpace A]`, with `H : Type` in all three conditions. This is exactly the README's "for a separable A and Hilbert spaces in the lowest universe" (`:756`).
- The three new definitions carry only type-class binders on their carriers and drop no hypothesis.
- Nothing changed.

**Padding probe.** I replaced each of the five `sorry`s by `first | (simp; done) | rfl | infer_instance | (aesop; done) | exact ⟨_, rfl⟩ | trivial | decide`. None closes. Every definition is used by a stated headline.

**Headlines.**

- Stated: Wigner (P.1), Glimm in three of its four forms (M0a.1), Becker–Kechris realization (M1), the induced representation on `Lp` (M1), and Mackey imprimitivity (M1).
- Not statable, and named in the docstring:
  - Glimm's composition-series form: no C⋆-quotient of closed ideals at either pin; I searched both libraries for a `CStarRing`/`CStarAlgebra` instance on a `⧸` type and found none.
  - The Fell/hull-kernel homeomorphism.
  - The M1 stages/tensor results, M2's classification and disintegrations, and M3–M6's classifications and tables. Their carriers (direct integrals, measurable Hilbert fields, the unitary dual, twisted group C*-algebras) are absent at both pins.
- Consumed and correctly not stated: the Whitehead lemmas, Pettis's theorem and lcsc Polishness. No lcsc⇒Polish instance exists in Mathlib or Tau Ceti at the pins (searched).

**Glimm statement, truth at this generality.** The three conditions are equivalent for separable A with H ranging over `Type`:

- (2)⇒(1) on every space: the README route uses C2's separable prime⇒primitive theorem on A and no separability of H. This is Kaplansky's direction.
- (1)⇒(2): (1) holds in particular on separable spaces in `Type`, so Glimm's theorem applies.
- (2)⇒(3): C2.3, with no separability.
- (3)⇒(2): Glimm.
- Irreducibles of a separable A act on separable, hence `Type`-representable, spaces.

These match BekkaDeLaHarpe2019 Theorem 8.F.3 (line 12057, p.257) and Comments (4), (8) and (9) (lines 12084, 12090, 12097, p.258).

**Adversarial table.** Conventions: η=diag(−1,−1,−1,+1), Hilbert inner products conjugate-linear in the first slot, `Q_sp=[[0,1],[−1,0]]`, `k=diag(i,−i)`, `C₀=((1+i)/2)[[1,i],[1,−i]]`.

| # | Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `separable_typeI_tfae` | A=0 | nondegeneracy forces H=0, where `1≠0` fails; no `π a≠0`; (1), (2), (3) all vacuously true | Pass |
| 2 | same | A=ℂ | nondegenerate π has π(1)=1, `π(A)″=ℂ1`, p=1 with pxp=cp; irreducible π is 1-dimensional with range ℂ=K(ℂ); equal kernels 0 give U a unit scalar; all three true | Pass |
| 3 | same | A=M₂(ℂ), `a↦a⊗1` on ℂ²⊗ℂ³ | factor; minimal projection e₁₁⊗1 with corner x₁₁(e₁₁⊗1); ℂ²⊗e₁ invariant, so not irreducible | Pass |
| 4 | same | K(ℓ²); CAR algebra | K(ℓ²): all three true (amplifications of the identity, `e₀₀⊗1`). CAR: simple, unital, infinite-dimensional, so no compact in any irreducible image; inequivalent irreducibles with kernel 0; tracial II₁ factor without minimal projection; all three false | Pass |
| 5 | `IsIrreducibleRep` nonzero clause | zero representation on ℂ | without the clause: (2) is false for every A (1∉{0}) and (1) is true at A=ℂ, so TFAE fails; the clause `∃ a, π a ≠ 0` is at `:110`; the body equals CStarAlgebras `IsIrreducible` | Pass |
| 6 | `IsFactorRep` | 0 on ℂ²; `c↦diag(c,0)` on ℂ² | `adjoin{0}=ℂ1`, scalar centre, only nondegeneracy fails; diag(c,0): adjoin is the diagonal algebra, centre ≠ℂ1, nondegeneracy fails | Pass |
| 7 | `HasMinimalProjection` | M₂⊕ℂ on ℂ³; L∞[0,1] | `e₁₁⊕0` and `0⊕1` minimal; `(1⊕0)(e₂₂⊕0)(1⊕0)=e₂₂⊕0∉ℂ(1⊕0)`; `1_B1_(B′)1_B=1_(B′)∉ℂ1_B`, so none minimal | Pass |
| 8 | Momentum model `:2332–2337`, product law | random g₁,g₂ in the stated Bargmann law, ℏ=0.7, m=1.3, U=0.4 | numerically `|Π(g₁)Π(g₂)ψ(p)−Π(g₁g₂)ψ(p)|=7·10⁻¹⁷`; arguments agree symbolically as `R₂⁻¹(R₁⁻¹(p−mv₁)−mv₂)` | Pass |
| 9 | Time reversal `:2355–2369` | A, θ, θ_λ | symbolically `AΠ_(m,U,j)A⁻¹` has phase `exp(i(−mz+(−U−|p|²/2m)t−p·a)/ℏ)` and argument `R⁻¹(p+mv)`, which is `Π_(−m,−U,j)`; θ and θ_λ are automorphisms (numeric 0, 5·10⁻¹⁷); `Π(θ_λg)=Π_(−m,−U+mλ)(g)` (numeric 0); `A²=J_j²=(−1)^(2j)` | Pass |
| 10 | Generators `:2340–2352` | commutators; Stone convention | `[iℏ∂_p,p/m]=iℏ/m`; `[K_i,P_j]=iℏm`; `[K_i,H]=m·iℏ·p_i/m=iℏP_i`; `(i/ℏ)²[X̂,Ŷ]=i[X,Y]^/ℏ`, so `[X̂,Ŷ]=−iℏ[X,Y]^`; `dΠ(T)=−iP/ℏ`, so T↦−P; `exp(iv·K/ℏ)ψ(p)=ψ(p−mv)` | Pass |
| 11 | F_ℏ `:2344–2346` | x and −iℏ∂_x | `F(xψ)=iℏ∂_pFψ`, from `iℏ·(−ix/ℏ)=x`; `F(−iℏ∂_xψ)=−iℏ(ip/ℏ)Fψ=pFψ` | Pass |
| 12 | Actual stabilizer geometry `:3391–3426` | identities | `Q_sp²=k²=−I`; `Q_sp k=[[0,−i],[−i,0]]=z k Q_sp`; Q_sp and k unitary, so σ fixes both; SU(1,1) for diag(1,−1) gives `σ=Ad(diag(1,−1))=Ad(k)`; numerically `C₀⁻¹Q_spC₀=[[0,−i],[−i,0]]`, `C₀⁻¹kC₀=[[0,−1],[1,0]]=k_(π/2)`, and `C₀k_(0.7)C₀⁻¹=diag(e^(0.7i),e^(−0.7i))` | Pass |
| 13 | same, cocycle | b_f b_g | `kQ=zQk` gives `z^(r(f)a(g))Q^(a(f)+a(g))k^(−r(f)−r(g))`; `Q²=k⁻²=z` gives γ as displayed; `γ(f,g)−γ(g,f)=r(f)a(g)+a(f)r(g)`; `Ad(b_f)h=Q^a k^(−r)(k^r h k^(−r))k^r Q^(−a)=O^a(h)`; `XJX=−J`, `XH₀X=−H₀`, `XXX=X` | Pass |
| 14 | M5.LittleDual.CoefficientSequence `:4168` | general topology; s=0,1 | in any space x_j→x ⇔ x∈closure of every subsequence's range (a neighbourhood missing infinitely many terms leaves their closure in its complement); coefficient sufficiency is Fell's criterion for irreducible π; `a_(±2j)(0)=1`, `a_(±2)(1)=(1−1)/(1+1)=0`, `a_1(1)=0` | Pass |
| 15 | M5.CompactInductionSupport `:4458` | j=0, ½; normalization | `P_m(ω)` has SU(2) spins ≥|m|/2 of parity m/2, so it contains D_j iff |m|≤2j and m≡2j; j=0 gives the spherical `P_0(ω)` of L²(H³); `e_j=dim·∫conj χ_j·u_k`; `∫_K|ℓ(D_j(k)⁻¹v)|²=‖ℓ‖²‖v‖²/(2j+1)` is cancelled by √dim; `e_m*↦(−1)^(j−m)e_(−m)` | Pass |
| 16 | same, locators | Echterhoff2010 | (5.4) at Echterhoff2010 line 991, p.20; Proposition 5.16 at line 1110, p.23 (Fell continuity of induction; homeomorphism for imprimitivity bimodules) | Pass |
| 17 | M5.InducedLorentzSupport `:4558`, trivial row | Darboux; Casimir | `(−d+l tanh)(d+l tanh)=−d²−l(l+1)sech²+l²`; `(d+l tanh)(−d+l tanh)=−d²−(l−1)l sech²+l²`; `ker A_l=ℂ sech^l t`; `∫sech^(2l)=√πΓ(l)/Γ(l+½)`; eigenvalue −k² of H_l gives C=k²−1, which equals `m²/4−1−ω²` at m=2k, ω=0; the continuous spectrum gives `−1−ω²` at m=0, so Q | Pass |
| 18 | same, Haar and limit | coordinates | SU(1,1) Haar via the disk is `4d²w/(1−|w|²)²=4d²b`, so ∝d²b dθ; `b=e^(−u)we^(−iθ/2)` gives `d²b=e^(−2u)d²w`, so `e^(2u)(Ad a_u)_*dh=d²w dθ/(4π)`; `F↦e^uF(xa_u)` has norm factor `e^(−2u)e^(2u)=1`; `a_u⁻¹h_ua_u→diag(e^(iθ/2),e^(−iθ/2))↦e^(inθ/2)` | Pass |
| 19 | same, D_n row | exclusion | J(D_n) lacks spins <n/2; π≺J gives `π(e_j)π(x)=0`, so `π(e_j)=0` for j=|m|/2<n/2, but P_m contains spin |m|/2; hence m≥n, with centre (−1)^n=(−1)^m: B_n | Pass |
| 20 | Shared compact-subgroup exclusion `:5160` | Spin(4)⊃Spin(3) | (N,M)↦J from |a−b|=|M| to a+b=N, where a,b=(N±M)/2; q_n→∞ removes every fixed J; every nonzero zero-fibre representation has some K₀ type, so L=C=∅ | Pass |
| 21 | All-sequence contraction classification `:6163` | quantifiers; trivial row | `∀j∀N∃n≥N` with a nested basis yields increasing n_j with `(r_(n_j),d_(n_j))∈N_j(b)`, a convergent subsequence; σ≺1 makes ker σ⊇ker 1 of codimension 1, so σ=1 and Lim=Clust={1} | Pass |
| 22 | Both momenta zero / nonzero `:6709`, `:6746` | stabilizers | m₁+m₂=0, `|p₁+p₂|∈I_R`; the generic joint stabilizer is the boost line normal to plane(p₁,p₂); item 4 at λ=0 gives `∫_(κ>0)T²`, hence multiplicity 2 in B⊗B; the E⊗E circle fibre `L²(S¹)` gives each s once | Pass |
| 23 | A massive input and an opposite null input `:7081` | p₁=(0,0,0,m), p₂=(0,0,E,−E) | `q=(m−E)²−E²=m²−2mE`; `d³p/|p|=4πE dE`; `E=(m²−q)/2m`, so density ∝m²−q; E=m/2 gives (0,0,m/2,m/2), future null; `uδ(0,θ)u⁻¹=diag(e^(−iθ/2),e^(iθ/2))`; max `2(a−εh)=2(j+|h|)` | Pass |
| 24 | Pair geometry and all energy branches `:7363` | representatives | `v·p_s=s−s=0`; `q(v)=m²+2s²/r₀²−s²/r₀²`; `p_s·p_m=s`, `q(p_m)=m²`; `q(sum)=m²−r₀²+2s`; spatial `r₀−s/r₀=(m²+r₀²−q)/(2r₀)`; `a ds/r₀` with ds=dq/2 gives `√((q−m²+r₀²)²+4m²r₀²)dq/(4r₀²)`; q=M² gives `MD dM/(2r₀²)` | Pass |
| 25 | Principal Lorentz input, all spacelike inputs `:7841` | m=5,l=1; m=4,l=2 | `k_t(±i,1)ᵀ=e^(±it)(±i,1)ᵀ`; `Ind_Kχ_m⊇D_L^+` for 2≤L≤m by Frobenius; `σn=l+2b−|m|≤−L` iff b≤k, so k+1; m=5,l=1: E₂=2, E₄=1, E₃=0; m=4,l=2: E₂=1 | Pass |
| 26 | The remaining identical exchange sectors `:8766` | j=½ | J=0: S=0,l=0 and S=1,l=1 both give odd `(−1)^(l+1−S)`, so sym 0, antisym 2 = `T_0(1)+2`; J=1: sym 3, antisym 1 = `T_1(1)+2`, `T_1(1)`; `E−P²/(4m)=2U+k²/m`; Euclidean sign `η_h(−1)^a=(−1)^(a+2h)` | Pass |
| 27 | Young fields `:9362` | gauge S | `D(σ⁻¹)=D(σ)*` gives `E_ij*=E_ji`; `E′_ij=ΣS_ai conj(S_bj)E_ab`; `W*W=Σ|S_a1|²E₁₁=E₁₁`, `WW*=E′₁₁`; `‖E_i1v‖²=⟨v,E₁₁v⟩` | Pass |
| 28 | M6.TensorCoherence `:9035` | reindex convention | Tau Ceti `reindexRepresentation σ=reindex σ`, and `reindex(tprod f)=tprod(f∘σ⁻¹)`, which is `U_σ(⊗v_i)=⊗v_(σ⁻¹i)` | Pass |
| 29 | M2.DerivedDI `:2197` | derivative; trivial group; μ=0 | `π(e^(tX))π(f)=∫f(e^(−tX)h)π(h)dh` gives `π(−R_Xf)`; `[R_X,R_Y]=−R_[X,Y]`, so X↦−R_X is a homomorphism; G={e}: u=c and `T_u=c·1` on both sides; μ=0: both sides 0 | Pass |
| 30 | Selector `:1604–1609` | `M(x)=q⁻¹{x}` | closed, nonempty, `{x: M∩U≠∅}=q(U)` open, E Polish: the pinned hypotheses hold | Fail: R01 |
| 31 | CStarAlgebras contract `:201` vs `:716` | C2.3 | consumed at `:716–720` and `:838`; absent from `:201` | Fail: R02 |
| 32 | Brennich locator `:2373` | printed pp.138–140, 144–146 | pp.138–140: group law, simply connected cover, multiplier exp(imτ), time inversion antiunitary (text lines 77–133); pp.144–146: Theorem (15), complete class list on separable spaces, [m,s;e] labels (lines 214–262) | Pass |
| 33 | ABF24 locators `:5062`, `:9481` | arXiv:2406.11349v1 | (1.4) at ABF24 line 392, p.7; §1.3 and Proposition 1.3 at lines 395–398, p.7; (1.5) at line 420, p.8; Lemma 2.2 at line 638, p.13; Theorem 3.8 at line 1224, p.22 | Pass |
| 34 | M0a bullet `:775–779` | BekkaDeLaHarpe2019 Comment (4) | line 12084, p.258: type I iff every factor representation is a multiple of an irreducible | Pass |

**Library declarations opened at the pins.**

- Tau Ceti `Analysis/CStarAlgebra/Representation/Nondegenerate.lean:62` (`IsNondegenerate`, dense span of `π a ξ`) and `:204` (`multiplierExtension`).
- Tau Ceti `Analysis/VonNeumannAlgebra/Adjoin.lean:38` (`adjoin` as a double centralizer), `:49` and `:54`.
- Tau Ceti `RepresentationTheory/Continuous/Unitary/Basic.lean:49`, `:53`, `:62` (`isUnitary_iff_isometry`).
- Tau Ceti `MeasureTheory/MeasurableSpace/Selection.lean:151`.
- Tau Ceti `Analysis/CStarAlgebra/Action/`:
  - `Basic.lean:41`, `:145`.
  - `Covariant/Basic.lean:33` (fields `isUnitary`, `continuous_orbit`, `covariance`).
  - `Covariant/Nondegenerate.lean:104`.
  - `CrossedProduct/Full.lean:266`, `:282`, `:322`, `:417`, `:438` (`norm_le_iff` over `Type (max u v)`).
  - `CrossedProduct/Multiplier.lean:144`, `:224`, `:264`, `:282` (strict continuity).
- Tau Ceti `RepresentationTheory/Symmetric/TensorAction/Basic.lean:59`.
- Mathlib `Algebra/Star/StarProjection.lean:29`.
- All 72 backticked `TauCeti.*`, `ContRepresentation.*`, `NonUnitalStarAlgHom.*`, `VonNeumannAlgebra.*`, `LieModule.*`, `PiTensorProduct.*`, `LieAlgebra.*` and `MeasureTheory.*` names in the README resolve at the pins. The five leads of the citation tool are `Suggested.lean` names of this roadmap, plus InductionRestriction's `Gassmann.almostConjugate_iff_permutation_equiv` (its `Suggested.lean:729`).

**Cross-roadmap citations resolved.**

- CStarAlgebras on main:
  - §2.2 (`:568`, `IsIrreducible` at its `Suggested.lean:102`, identical body).
  - §2.3 (`:616`).
  - §2.6/C2.AnnHull (`:695`).
- VonNeumannAlgebras on main:
  - V3 minimal-corner criterion (`:907`).
  - V5 `IsFactor` (`:1363`, its `Suggested.lean:145`, the same centre condition as `IsFactorRep`).
- OperatorAlgebraDynamics D1 on main (`:148–219`): restriction to closed subgroups, invariant-ideal exact sequence, regular covariant representation, recovery of the pair and `ℂ⋊G≃C*(G)`. This is every item the new Scope bullet `:11` assigns to D1.
- InductionRestriction Layer 2.1 (main `:346`).
- SelfAdjointSpectralTheory SA-B85 (10 occurrences on main).
- D1.BorelPrefix, D1.TwistedBorel and D4.Harmonic at the #1137 head: R03.
- Consumers at open heads:
  - QuantumFoundations (#1771 `:22`, `:65–66`), RelativisticQuantumFieldTheory (#1772 `:60–64`) and QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (#1842 `:121`, `:244`, `:585`) consume Layer P, M0 and M2/M4 without restating them.
  - #1772 `:64` still cites "P.4: the real Whitehead lemmas" from this roadmap, which now consumes them from Tau Ceti. That citation is for #1772's own review and requires no change here.

**Ownership.** I searched main and all open heads.

- "Glimm|GCR|postliminal|factor-type-I": no other owner of Glimm's type-I theorem. CStarClassification's `glimm_classification` is the UHF classification, a different theorem.
- The Suggested.lean files for "wigner|SystemOfImprimitivity|imprimitivity|transitionProbability": no duplicate declaration. OperatorAlgebraDynamics D3 keeps the C⋆-form (Green), which this roadmap consumes.
- #1842 asks AutomorphicSpectralTheory for the general real and p-adic Plancherel formula; M4 here owns only the SL(2,ℝ) and SL(2,ℂ) cases, which no roadmap states.
- The overlap report shows no other pull request changing this roadmap and no dropped id.

## Not verifiable

- Mackey1958 §6: settled as uncertified; cited by locator only.
- Brennich (1970), Numdam AIHPA 1970 13 2: read through the sources service into a scratch copy of the manifest; the package manifest was left unchanged. The display formulas on pp.139 and 144–145 did not survive text extraction (OCR is unavailable on this worker). The sections and theorem numbers are confirmed, and the README's own Bargmann law was checked numerically (row 8). The formulas were not compared character by character with the source.
- The README flags no locator as unverified.
- Lang's SL₂(ℝ), Primet 1983, Fell 1961, Bacry–Lévy-Leblond 1968 and Nelson 1959 lie outside this round's seeded sample. The previous reviews found the paywalled ones not readable legally.

## Source issues

- none
