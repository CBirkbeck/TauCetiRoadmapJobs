# Review of NoncompactQuantumSymmetry (pull request #1015 at 4e793e8)

**Verdict:** needs changes

This is a full review of the head the previous review read: the folder has 0 changed lines since then, and nothing outside it changed. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with five `sorry` warnings and nothing else. Neither of the two P3 findings from the previous review is repaired, because nothing changed. The full pass found no new defect. It covered the fifteen sampled targets, all five headline theorems, every library declaration the README names, and ownership against the closest open roadmaps. Both findings are P3, and neither touches the folder's mathematics.

## R01 (P3) — Three OperatorAlgebraDynamics ids exist only at that roadmap's open revision #1137, which the description does not name

Carried from R01 of the previous review (R03, R07 and R05 before that). No repair report marks it not actionable.

**Location:** README `:195`, the supplier row "OperatorAlgebraDynamics D1.BorelPrefix, D1.TwistedBorel, D4.Harmonic". The ids recur as follows:
- D1.BorelPrefix: `:11, :19, :282, :357, :388, :406, :477, :1284, :1306, :1595, :1624, :1634–1635, :1658, :1660, :1882, :1904, :1928, :2222, :4391`.
- D1.TwistedBorel: `:11, :19, :1910, :2222`.
- D4.Harmonic: `:19, :243, :268`.
- `Suggested.lean:21` also cites D1.BorelPrefix.

**Claim:** an id this roadmap cites that only an open revision defines is named, as a revision that merges first, in the description or its merge-order paragraph.

**Witness:**
- OperatorAlgebraDynamics on main (39d3d60) has `## D1` at `:148` and `## D4` at `:333`, and no "BorelPrefix", "TwistedBorel" or "Harmonic" anywhere.
- At the #1137 head they are `### D1.BorelPrefix` `:1108`, `### D1.TwistedBorel` `:1218` and `### D4.Harmonic` `:2097`.
- The description's revision line names only #1145. That is SmoothBanachRepresentations, a new folder and not a revision.

The overlap report lists only the two D1 ids. D4.Harmonic is the third.

**Repair:** nothing in the folder changes.
- Name #1137 (OperatorAlgebraDynamics) in the description's revision line and before this pull request in its merge-order chain.
- Move #1145 from the revision line to the new-folder dependencies, where it already appears.
- While editing the description, drop the stale sentence that presents QuantumFoundations QF0/QF1, QF4, QF5/QF5.P and QF6a as "supplier specifications". The README cites QuantumFoundations only as a consumer (`:9472`), and it is line 209 of the merge order, after this roadmap (line 155).

## R02 (P3) — Size: split into a Part II

Carried from R02 of the previous review (R04 and R08 before that). No repair report addresses it.

**Location:** the folder. The README has 9,496 lines (699,245 bytes). Layer 8 (M5) spans `:3869–6507` (2,639 lines) and Layer 9 (M6) spans `:6508–9464` (2,957 lines).

**Witness:** the consumers at open heads use Layer P, M0, M2/M4 and the helicity models, not the M5 all-sequence DNC tables or the M6 pair, exchange and tree tables:
- QuantumFoundations (#1771, `:65–66`).
- RelativisticQuantumFieldTheory (#1772, `:60–64`).
- QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (#1842, `:244`, `:585`, `:633`; M0 only).
- SmoothBanachRepresentations (#1145, `:13`, `:546`; M0 only).

**Repair:** move the following into "NoncompactQuantumSymmetry, Part II", whose introduction says that the base roadmap stops at M5.DeSitterFiber and the M6.MeasuredPair interface:
- M5.DeSitterNullZero, M5.DeSitterRemainingTransitions and M5.StructuralModelComposition;
- the complete labelled DNC dual;
- every M6 table after M6.MeasuredPair (`:6652–9464`).

Every statement there is self-contained and cites earlier targets by name, so the move needs no rewording beyond the two introductions.

## Previous findings

- R01 (#1137 not named): not repaired. The description still names only #1145 (R01 above).
- R02 (size): not repaired. Still 9,496 lines (R02 above).

## Verified sound

**Gate** (my run on this head): `gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate records the same with `build=0`. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.MP"`). `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** (`--movable`): `depcheck: 238 roadmaps, 2323 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. This roadmap is line 155 of the merge order. CStarAlgebras is line 7, VonNeumannAlgebras 5, HilbertModules 8, AutomorphicFormsOnReductiveGroups 60, MetaplecticAutomorphicForms 150 and LieGroupoidsPoisson 152. None of the never-cite roadmaps (HomotopySpheres, QuaternionicModularForms, …) occurs in the README.

**Build.** `lake env lean` on `Suggested.lean` takes 9.7 s and warns `declaration uses sorry` at `:89`, `:137`, `:161`, `:234` and `:273`, and nothing else.

**Signatures.** I put `#check @name` for all 14 declarations in one scratch file and elaborated it once. The five "dropped `[IsClosed (H : Set G)]`" leads are false. `[IsClosed ↑H]`, `[PolishSpace X]` and `[SeparableSpace K]` occur in the elaborated types of `InducedModelData`, `isotropy`, `rnDerivative`, `sectionAction`, `exists_inducedRepresentation` and `exists_induced`. `exists_induced` also carries `[SeparableSpace E]`. Each type matches its README statement in generality: P.1 "nonzero complex Hilbert space" is `[CompleteSpace H] [Nontrivial H]`; M1.BorelRealization is a Polish G, a standard Borel X and `MeasurableSMul₂`. Nothing changed.

**Padding probe.** I replaced all five `sorry`s with `simp`, then `aesop`, then `rfl`, on scratch copies. Each run errors at all five sites (`:97`, `:150`, `:168`, `:239`, `:290`), so none is padding. The file has three definitions (`rayTransitionProbability`, `IsIrreducibleRep`, `IsFactorRep`), each needed by a headline, plus `HasMinimalProjection`, `InducedModelData` with its three derived maps, and `SystemOfImprimitivity`. None is a stand-in.

**Headlines.** The README's headline theorems:
- Stated in `Suggested.lean`: Wigner (P.1); Glimm for separable C*-algebras (M0a.1), in three forms; Becker–Kechris realization (M1.BorelRealization); the induced unitary representation on `Lp K 2`; Mackey's transitive imprimitivity (M1.Core).
- Named in the docstring as not statable, with the missing carrier for each: P.2–P.6; the composition-series and Fell/hull-kernel forms of Glimm; the M0–M6 Hilbert-model classifications and Plancherel; the DNC and Fell topologies; M5.KinematicClassification; the M6 tensor tables.

No statable headline is missing.

**Adversarial table.** The headlines (H1–H5), the fifteen sampled targets (S1–S15) and the two findings (F1–F2), each with values computed here.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| H1 | `wigner_reconstruction` (`:89`) | H=ℂ; H=ℂ²; ray Check `:308` | H=ℂ: one ray, Φ=id, U=id (also conj, so the grade is not determined, as Check `:338` says). H=ℂ²: conj acts on the Bloch sphere by (x,y,z)↦(x,−y,z), det −1, so it lands in the antiunitary branch. The rays e₁, e₁+e₂ give 1/(1·2)=1/2; the representatives 2e₁, i(e₁+e₂) give \|2i\|²/(4·2)=1/2. H=0 is excluded by `Nontrivial`, matching "nonzero". Freed Thm 8 p.3 and footnote 4 ("dim H>1") match P.1's dim≥2 caveat | Pass |
| H2 | `separable_typeI_tfae` (`:137`) | A=0; A=ℂ | A=0: nondegeneracy forces H=0, contradicting `1≠0`, so there are no factor reps; `∃a, π a≠0` fails, so there are no irreducibles; all three items are vacuous. A=ℂ: π(1)=1, π(A)''=ℂ1, and p=1 is minimal. An irreducible π has dim H=1, since ker π(1) is invariant, so K(ℂ)=range. Equal kernels {0} give equivalence. BekkaDeLaHarpe2019 Thm 8.F.3 (line 12057, p.257), Remark 8.F.2(3) (line 12048), Comments (8)–(9) (lines 12090–12099, p.258): Kaplansky (iii)⇒(i), Dixmier (iii)⇔(iv), Glimm (i)⇒(iii) | Pass |
| H3 | `exists_polishTopology_continuousSMul` (`:161`) | X=∅; G trivial | ∅ is Polish. For trivial G, any compatible Polish topology works. `@BorelSpace X t ‹_›` means the given σ-algebra equals `borel t`, as Becker–Kechris Thm 1.1 (arXiv math/9304208, line 79; reformulation lines 83–85) says ("same Borel structure"). The proof route is its §4 (line 85) | Pass |
| H4 | `exists_inducedRepresentation` (`:234`) | RN direction; cocycle; H=G | ∫r(x)\|F(g⁻¹x)\|²dμ=∫\|F\|²dμ iff r=d(g_*μ)/dμ, which is `(μ.map (g•·)).rnDeriv μ` (`:220`). With F=f∘s and f(gh)=τ(h)⁻¹f(g): f(g⁻¹s(x))=τ(c)F(g⁻¹x) for c=s(x)⁻¹g s(g⁻¹x)=`isotropy g x` (`:210`). H=G: X is a point, r=1, U=τ | Pass |
| H5 | `SystemOfImprimitivity.exists_induced` (`:273`) | E=0; X a point | E=0: K=0, L²(X,μ;0)=0, W trivial; μ and s exist (quasi-invariant class, selection). X a point: P(univ)=1, K=E, τ=U\|H. The PVM fields at the pin (`ProjValMeasure/Basic.lean:91`: `proj_univ`, `proj_inter`, `diag_finite`) match README `:77–87` | Pass |
| S1 | M4.SL2R (`:2452`) | Ad(C₀); brackets; q_B | det C₀=(i/2)(−2i)=1 and C₀∈SU(2). M H_K M⁻¹=diag(1,−1), M E₊M⁻¹=[[0,1],[0,0]], M E₋M⁻¹=[[0,0],[−1,0]]. [H,E±]=±2E±, [E₋,E₊]=H. [A,B]=−2J gives E₋E₊=−(A²+B²+2iJ)/4, so q_B=(J²−A²−B²)/4. The primitive coproduct gives the displayed Δ(q_B). Lowest weight l: q_B=l(2−l)/4; trivial: 0=(1−1²)/4; D₁: 1/4=(1−0)/4 | Pass |
| S2 | M4.Riesz (`:2540`) | 0<s<1 | The ℝ² transform of \|x\|^(−α), α=2−2s, is π^(α−1)Γ(1−α/2)/Γ(α/2)\|ξ\|^(α−2)=π^(1−2s)Γ(s)/Γ(1−s)\|ξ\|^(−2s), so c_s=Cπ^(1−2s)Γ(s)/Γ(1−s)>0. ∫₀^∞t^(−s)e^(−t\|z\|²)dt=Γ(1−s)\|z\|^(−2+2s) | Pass |
| S3 | Specified model limits (`:3985`) with the M5 Checks (`:3964–3983`) | DNC, normalizer, fibers | Haar exponent dim 𝔤/𝔥=10−6=4. w=diag(−1,1,1,−1,1) has det 1 and Ad(w)J_a3=w_aw_3J_a3=−w_aJ_a3, so B=diag(1,−1,−1,−1) and (0,0,r,r)↦(0,0,−r,−r), while A=diag(−1,1,1,1) negates J₀₁, so ε_Eℓ is preserved. A scalar −1 forces diag(1,1,1,−1,1) (det −1) or diag(−1,−1,−1,1,−1) (time-reversing). [J_a3,J_b3]=J_ab gives `[P_μ,P_ν]=+R⁻²L_μν`. Q₊(F₊(x))=Ω²(4R²z+R²(1−z)²)=R²; Q₋(F₋(x))=−R². Fibers r>0 are CCR; the Poincaré fiber is GCR, not CCR (null cones not closed) | Pass |
| S4 | Compact eigenforms (`:4201`) | s↓0, s↑1 | π∫₀^∞t^(s−1)(1+t)^(−1−s)dt=πB(s,1)=π/s; ∫(1+\|z\|²)^(−2)=π; form Cπ/s. c̄_s=(s/Cπ)c_s=π^(−2s)Γ(1+s)/Γ(1−s)→1. a_(2j)/(1−s)→(1/2)∏_(k=2)^j(k−1)/k=1/(2j); a_l/(1−s)→(1/2)·2/(l(l+1)). b_(n+2)/b_n=(1/(2j+2))/(1/(2j))=n/(n+2). F(k_θ)=e^(−inθ) gives π(k_t)F=e^(int)F | Pass |
| S5 | M5.NullLittleDual (`:4516`) | ρ>0; ρ→0 | The stabilizer of exp(i Re(ζ̄w)) in ℝ/4πℤ is {0,2π}; the center acts by exp(2πie). Res T_(ρ,e) to the circle has weights ℓ with (−1)^ℓ=exp(2πie), so ℓ≡2e mod 2, as in the basis table. The E(2) part is e=0 with even ℓ. Echterhoff2010 Prop 5.11 (line 1001, p.21) gives the Rieffel homeomorphisms Â≅B̂ and Prim; Thm 7.41(i) (line 2502, p.51) gives the smooth-action bijection | Pass |
| S6 | M5.UniformZeroModel (`:4928`) | δ→0 | η/R=δ^(3/4), ηR=δ^(1/4), δ/(η/R)=δ^(1/4)→0, log R→∞. By Frobenius, Supp Ind_SU2^L D_j={P_M: M≤2j, M≡2j mod 2} (P_M has K-types M/2, M/2+1, …) | Pass |
| S7 | Fixed-label zero-translation rows (`:5313`) | Möllers–Oshima n=3, m=2, σ=2λ | Atoms τ=σ−μ−4j for j<(σ−μ)/4. μ=1: j=0 iff λ>1/2, τ=2λ−1, i.e. C_(λ−1/2). μ=3: none. Continuous: two spherical channels, i.e. all P_(0,ω). For π_(p,0) (σ odd integer): τ/2 over μ=1 gives {k'+1, k'−1, …}>0 and μ=3 gives {k', k'−2, …}>0, whose union is {1, …, p}: exactly P_(2k,0), 1≤k≤p. σ=1/4−λ²: σ>−2⇔λ<3/2; σ>0⇔λ<1/2; for half-integral p, σ>1/4 gives no complementary. Trivial: Ω=2+σ=0 at σ=−2 | Pass |
| S8 | Fixed H̃ restriction support proofs (`:5568`) | jets; Killing; weights | δ^(j)⊗(surface) lies in H^(−λ) iff λ>j+1/2, so j<q−1. B=3Tr gives B(J_ab,J_ab)=3Tr(−ε_aε_b(E_aa+E_bb))=−6ε_aε_b. C_K(N,0)=2·2(N/2)(N/2+1)=N(N+2). N_M0=1+(Ω+2C_K)/6 gives N_G=6N_M0−5 and N_M0≤N_G≤6N_M0. Σ_k w_k/Z_(P,l)=1±6·10⁻¹⁵ for (P,l)=(1,1),(2,1),(2,2),(3,1),(3,2),(5,3),(7,7). sup over P∈{l,…,1000} of (C−1)^(2l)Prob(N>CP) is ≤0.88, 0.46, 0.31 for l=1, 2, 3 and C∈{3,5,10,30}. DLMF 16.4.9 is Rogers–Dougall ₅F₄, convergent for b+c+d−a=1−l<1⇔l>0 | Pass |
| S9 | M5.StructuralModelComposition (`:6050`) | diagonal | At most 4 pairs (ε,h). N_J strictly increasing gives J(n)→∞ and B_(n,J(n))<2^(−J(n)). The scalar endpoint (2,0) agrees with the SL(2,ℂ) s=1 endpoint, whose constituents are the trivial rep and P₂(0) | Pass |
| S10 | Positive-energy Poincaré examples (`:6835`) | back-to-back | A rotation φ about p₁'s axis is −φ about p₂'s axis, giving character h₁−h₂. Ind_Spin2^SU2(V_j₁⊗V_j₂)=L²(S²)⊗V⊗V gives N_J (`:6617`). The massive⊗null count is invariant under a↦−a. CSR weights e+ℤ give 2J+1, (2j+1)(2J+1) and ∞ | Pass |
| S11 | Past/past (`:6887`) | ι(a,A)=(−a,A) | Ind(χ_p⊗τ)∘ι=Ind(χ_(−p)⊗τ) with the same stabilizer. (0,0,1,1)↦(0,0,−1,−1), M4's past representative. h is kept and ε_Eh flips; multiplicities R_J and N_J are unchanged | Pass |
| S12 | Little-group refinement and counts (`:7425`) | V_J, E_L, density | If J≥j+l/2, every summand is J−a−l/2+1, and Σ_a=(2j+1)(J−l/2+1). V_J≠0⇔J+j≥l/2. E_L: b+c=−a−(l+L)/2. For j=2, l=1, L=3: the formula gives 1 (a=−2) and k=0 gives (1·2)/2=1. s=(q−m²+r₀²)/2, so a ds/r₀=√((q−m²+r₀²)²+4m²r₀²)dq/(4r₀²). Spatial part r₀−s/r₀=(m²+r₀²−q)/(2r₀) | Pass |
| S13 | Complementary Lorentz restriction (`:7908`) | Möllers–Oshima n=2, m=1, σ=2s | μ=2k+1, k∈{0,1}. Atom iff j<(2s−1)/4, so only μ=1, j=0, s>1/2, τ=2s−1; weight (s−1/2)Γ(s)Γ(1/2)/(Γ(1/2)²Γ(s+1/2))>0. s=1/2 gives the empty range [0,0). Repka §3 Prop (p.931): 1/p+1/q>1/2 implies quasi-containment. Repka 4(c): σ+τ<−1 gives π_(σ+τ+1), i.e. γ=2s+v−2>0. Here p>2/(1−t), and the b=0 component of E₊v forces c₀=0 | Pass |
| S14 | Identical spacelike inputs (`:8254`) | frames, flip | k²=a²+M²/4. b_h(0,0,a,0)=(0,0,a cosh h, a sinh h)=p₁. u acts by (p₀,−p₁,−p₂,p₃), and u²=−I. Σ²=η_τ²=1. J=0 diagonal has eigenvalue η_τ with infinitely many weights, so b₀=∞ iff s_X=η_τ. For τ=1, only (0,0) remains, giving 1 iff (−1)^J=s_X. Groenevelt §2 (2.1)–(2.3), p.3 (lines 123, 128–132, 135–152): recurrence, ₄F₃, measure | Pass |
| S15 | Normalization transport (`:9407`) | matrix units | (E_ij)*=(d/n!)Σconj(D(σ)_ji)U_σ=E_ji by unitarity. W*W=Σ\|S_a1\|²E₁₁=E₁₁ and WW*=ΣS_a1 conj(S_b1)E_ab=E'₁₁. F'=W_R F W_L⁻¹ | Pass |
| F1 | R01 ids | main vs #1137 | Main: 0 hits for BorelPrefix, TwistedBorel and Harmonic. #1137: `:1108`, `:1218`, `:2097` | Fail (R01) |
| F2 | R02 size | line counts | 9,496 lines in total; M5 has 2,639 and M6 has 2,957 | Fail (R02) |

**Library declarations opened at the pins.**
- Tau Ceti `MeasureTheory/MeasurableSpace/Selection.lean:151` (`exists_measurable_forall_mem`).
- `Analysis/InnerProductSpace/ProjValMeasure/Basic.lean:91, :524`, `Map.lean:40, :56, :69, :77`.
- `Algebra/Lie/Whitehead.lean:105, :113, :140`.
- Mathlib `Algebra/Lie/Killing.lean:133` (`LieEquiv.isKilling`) and `RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:629` (`IsMulCocycle₂`).

A sweep of the README's 96 dotted names against both pins left eight unresolved:
- four are this roadmap's own `Suggested.lean` declarations;
- `Gassmann.almostConjugate_iff_permutation_equiv` is InductionRestriction's, on main;
- the other three resolve at the lines above.

**Cross-roadmap citations resolved** (main 39d3d60 unless marked):
- VonNeumannAlgebras V4.0.Fields, V4.0.Decomposition, V4.Normality, V2, V3, V11.
- SelfAdjointSpectralTheory SA-B85; InductionRestriction §2.1; SpinRepresentations Layer 7 (`:881`); SchurWeyl Layers 3–5.
- RiemannianGeometry R1/R2/R4; PseudodifferentialOperators P5/P6; LieGroupoidsPoisson G0.0/G0.2; HilbertModules H3/H5.
- LieGroups Layer 2 (`:356`); Completed/HopfRinow Layer 3 (`:451`); AffineLieAlgebras A1; LocalVariationalFieldTheory LVF1–LVF6.
- CStarAlgebras C2.3, C2.AnnHull, C5.2, C6.2, C6.5.
- OperatorAlgebraDynamics D1, D3 and D5 on main; D1.BorelPrefix, D1.TwistedBorel and D4.Harmonic only at #1137 (R01).
- AutomorphicFormsOnReductiveGroups §2.1 at #1037: its supplier contract declares `gap:banach-gfinite-density` against CompactGroups Layer 5 and leaves the SL₂ unitary dual, Plancherel and tensors to this roadmap.

**Ownership.**
- Becker–Kechris: BorelEquivalenceRelations (main `:671–672`) and CountableStructureSpaces (#1316 `:739`) both list it out of scope, so M1 owns it.
- Wigner, P.1–P.6 and the M-models: QuantumFoundations (#1771 `:22`, `:65–66`) consumes them.
- RQFT (#1772 `:60–64`), QuantitativeOrbitMethod (#1842 `:119`) and SmoothBanachRepresentations (#1145 `:13`) are consumers or suppliers of named layers only.
- No open pull request changes this roadmap, and no id this README cites is dropped.

**Sources read** from the cache or fetched without editing the manifest:
- Echterhoff2010, BekkaDeLaHarpe2019 and ABF24: §1.2 (1.4) p.7, §1.3 Prop 1.3 p.7, (1.5) and observations (A)–(C) pp.7–8, Lemma 2.2 p.13, Thm 3.8 p.22. ABF24 lines 392, 398, 416–421, 638, 1224; c_N=N+3/2 and c_M=M+1/2 follow from (1.5) with ρ=3/2.
- Möllers–Oshima arXiv:1209.2312v3: §3.5 measure p.26 (lines 1133–1141), Thm 4.1 p.28 (line 1231).
- Groenevelt arXiv:math/0306424v1 §2.
- Repka, Bull. AMS 82 (1976), pp.930–932.
- Freed arXiv:1112.2133v3.
- Becker–Kechris arXiv:math/9304208.
- DLMF §16.4(ii).

The package manifest records only Mackey1958, Echterhoff2010, BekkaDeLaHarpe2019 and ABF24.

## Not verifiable

- Mackey1958 §6: settled as uncertified, cited by locator only.
- Lang, *SL₂(ℝ)*, Chapter VIII, pp.163–177 (Springer, paywalled). It is input to M4.P, which "Little-group refinement and counts" consumes; the counts in S12 were recomputed independently.
- Bargmann 1947 (Annals, JSTOR) for the q_B label dictionary of M4.SL2R. The dictionary was checked here by internal consistency only (S1).
- Dooley's and Grundling's course notes. No legal copy is named in the manifest. The README's comparison of the Dooley p.29 factor (1−z)⁻¹ with the (3,2) quadric was recomputed here (S3), but the printed page was not seen.
- Dixmier 1961, Takahashi 1963, Gel'fand–Naimark 1947, Bacry–Lévy-Leblond and Harshman–Licata lie outside the sample and were not opened this round.

## Source issues

- **Misprint** in BekkaDeLaHarpe2019 at Remark 8.F.2(3), p.257: the source says Glimm's theorem identifies the class of separable C*-algebras with the separable GCR ones; it should say separable C*-algebras of type I; affects nothing.
- **Misprint** in BekkaDeLaHarpe2019 at Remark 8.F.2(3), p.257: the cross-reference to the definition of type I groups prints as an unresolved label; it should point to Section 6.D, as Theorem 8.F.3(i) does; affects nothing.
- **Misprint** in Freed2012Wigner at Example 10, p.3 (arXiv v3): the source calls O(3) the group of orthogonal transformations of SO(3); it should say orthogonal transformations of ℝ³; affects nothing.
