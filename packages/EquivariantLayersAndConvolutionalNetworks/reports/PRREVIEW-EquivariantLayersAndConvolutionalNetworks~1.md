# Review of EquivariantLayersAndConvolutionalNetworks (pull request #3006 at f197d05)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the three layers was recomputed at degenerate parameters and read against its source, and each holds as stated; the correction of the Bell-number dimension of Maron et al. is right (`n = 1`, `k = l = 1` gives dimension 1, not 2), and the repairs of the printed proofs in 2.2 and 2.3 are sound. There are one small correction and two format notes, none blocking. Whether theoretical machine learning with conference-paper sources is in the project's scope is left to the human reviewers.

## C01 — Layer 1 is stated over a field, but its route uses only a commutative ring

The Conventions say (Scalars, line 75) that Layer 1 is over an arbitrary field and 3.1 over an arbitrary commutative ring "because their proofs use no more". For Layer 1 the route uses less: its only non-combinatorial input, `TauCeti.invariantOrbitSumBasis`, is declared for `[CommRing k] [Group I] [MulAction I X] [Finite X]` (`TauCeti/RepresentationTheory/OfMulAction.lean`, variables at line 267 and 277, declaration at line 297), and steps (ii) and (iii) of 1.1 are statements about tuples and permutations. So the pattern basis of 1.1 holds over every commutative ring, and 1.2 over every nontrivial one (the count needs only that the rank of a free module is well defined). An implementer reading "use no more" would take the field hypothesis to be needed.

The smallest change is to the sentence: say that the field in Layer 1 is a choice and that the route works over any commutative ring. Stating 1.1 and `exists_basis_patternMap` over `[CommRing K]` (and 1.2 with `[Nontrivial K]`), as 3.1 already does, would be the more general alternative.

## N01 — A pull-request number and link stand in the scope section

In "Scope and ownership" (lines 521–522) StatisticalLearningTheory is cited as "pull request #2515" with a link. Cite it by roadmap name and section only ("StatisticalLearningTheory, section *Beyond this roadmap*"), so the sentence stays true after that roadmap merges.

## N02 — The remark on group convolutions gives page 5 for Kondor–Trivedi's Def. 4

In the remark of Layer 1 (lines 170–171), "Def. 4, Case III and eq. (12) (p. 5)" reads as if Def. 4 were on p. 5; it is on p. 4 (KondorTrivedi line 335), as the References section of the README already says. Write "Def. 4 (p. 4), Case III and eq. (12) (p. 5)".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 pattern basis (`exists_basis_patternMap`) | `(n,k,l)` = (1,1,1); (0,0,0); (0,1,0); (2,1,2); Deep Sets `k=l=1, n≥2` | (1,1,1): Hom(K,K) dim 1, setoids of `Fin 2` with ≤1 block: 1. (0,0,0): dim 1, one setoid, 0 blocks. (0,1,0): Hom(0,K)=0, index set empty. (2,1,2): 4 = 1+3. Deep Sets: `I` and `𝟙𝟙ᵀ − I` | holds | none |
| 1.1 against Maron et al. Prop. 2, Thm 1 | `n=1, k=l=1`; `n=1, k=2, l=0` | true dimension 1 and 1; source gives `b(2)=2` both times | source wrong for `n < k+l`; roadmap right | none |
| 1.2 dimension and Bell iff (`finrank_equivariantMaps`) | (3,2,2); (2,1,2); (3,1,2); (0,0,0); (3,0,2); (0,0,1) | 1+7+6=14 ≠ 15; 0+1+3=4 ≠ 5; 5=`B(3)`; `S(0,0)=1=B(0)`, 0≤0; 1+1=2=`B(2)`; `S(1,0)=0≠1`, 1>0 | iff holds both ways; for `n<m` sum ≤ `B(m) − S(m,m)` | none |
| Remark, group convolution | well-definedness in `y`, `x`; `δ_(gH) ⋆ χ`; `S₃`, `H=K=⟨(0 1)⟩`; `H=K=1`; `K=1` | `δ_(gH) ⋆ χ (xK) = χ(g⁻¹x)` (single coset `Hg⁻¹x`); double cosets 2; 6; 3; factor `|H|=2=0` in `𝔽₂` | bijection holds over any field; source's eq. (12) has the factor `|H|` | N02 (page) |
| 2.1 closed embedding (`isClosedEmbedding_powerSum_monotone`) | `M=0,1`; (−1,−1,2) vs (1,1,−2); (0,0) vs (1,−1) | `M=0`: point to point; `M=1`: identity. `p₁,p₂,p₃` = (0,6,6) vs (0,6,−6); `p₁` = 0 vs 0 | holds; `M` power sums needed | none |
| 2.2 invariant iff `ρ ∘ powerSum` | `M=0,1`; max on `ℝ²` | `2q − p² = (x₀−x₁)²`, so `(p + |x₀−x₁|)/2 = max`; `ρ` continuous on all of `ℝ²` | holds; Tietze step needed since range is a proper closed subset | none |
| 2.3 no decomposition of max for `N<M` | `M=1,N=0`; padding step at `j=M` and `j=1`; Hamel-basis `φ` | `M=1,N=0`: `Φ≡0`, max = id. Padded tuples `(t,…,t,x₀..x_(j−1))` have max `x_(j−1)` since `j≥1`. Discontinuous `φ` with `N=1` decomposes max | holds; continuity of `φ` needed, of `ρ` not | none |
| 2.4 equivariant iff (`equivariant_iff_exists_continuous`) | `n=0,1,2`; `F=(x₀x₁², x₁x₀²)`; swap; `F=(x₁,x₁)` | `n=0`: both sides true (empty `∀ i`). `n=1`: `ρ(t,·)=F(t)₀`. `ρ(t,p)=tp²`; `ρ(t,p)=p`; `F(x∘σ)=(x₀,x₀) ≠ (x₁,x₁)` | holds; `n − 1` junk at `n=0` harmless | none |
| 3.1 composition (`realizeWeights_eq_convolution`) | two layers general `s,t`; sizes (3,2), strides (2,1); `s₀=0`; `s₁=0`; `d_L=0` with `L=1,2`; `L=0,d₀=0`; sizes (0,2) | `u_m = Σ_(sj+ℓ=m) w_j v_ℓ`, i.e. `v(X)·w(X^s)`; length 1+2+1·2=5, stride 2; `s₀=0`: filter `(Σw)v`, length `k₀=d₀`; `d_L=0`: `d₀` = formula for `L≥1`; `L=0`: 0 ≠ 1; (0,2): 2 ≠ 3 | holds; both hypotheses needed as the Checks say | none |
| 3.2 function space and filling | sizes (2,2), (3,2), (2,2,2), (2,4), (2,2,2,2); `u=0`; `L=0`; parity | (2,2): `1+X²` count 0<2, `1` count 0+2, `X` count 1+1. (3,2): `1+X²` in length 4: 0+1 ≥ 1. `X+X³`: 1<3. `(1+X²)²`: 0<2. `r ≡ k−1 ≡ e (mod 2)`. `L=0`: {id} ≠ all scalars | holds; count at infinity `k−1−natDegree` is needed | none |
| Conventions, Scalars (C01) | route of 1.1 over `ℤ`, zero ring | orbit-sum basis is over `CommRing`; 1.2 needs nontrivial ring | statements true; sentence understates generality | C01 |
| Zaheer et al. Lemma 3 as quoted in Examples | `σ` injective; `σ` constant | injective: reduces to `Θ` commuting with permutations; constant: equivariant for every `Θ` | README's qualification is right | none |

- Source locators checked against the text: 38 of 38 (Maron et al. 5, Zaheer et al. 8, Wagstaff et al. 7, Sannai–Takai–Cordonnier 2, Kohn–Merkh–Montúfar–Trager 11, Kondor–Trivedi 4, Cohen–Welling 1); one page slip (N02).
- Library declarations opened at the pins: 35 in Mathlib (among them `Nat.bell_succ` at `Combinatorics/Enumerative/Bell.lean:206`, `ContinuousMap.exists_extension'` at `Topology/TietzeExtension.lean:91`, `IsRealClosed.exists_isRoot_of_odd_natDegree` at `FieldTheory/IsRealClosed/Basic.lean:54`, `Topology.IsClosedEmbedding.prodMap` at `Topology/Constructions/SumProd.lean:631`) and 17 in Tau Ceti (among them `Topology.IsOpenEmbedding.finrank_le_of_isEmbedding` at `AlgebraicTopology/Singular/InvarianceOfDomain.lean:272`, `ConvolutionSpec.evalPrefix_succ`, `convolution`, `realizedFunctions`, `MLPSpec.layerActivation`); all exist with the stated content.
- Definitions read at the pin: `ConvolutionSpec.length_eq` is `width i.castSucc = stride i * (width i.succ - 1) + filterLength i`; `activation : Fin (L - 1) → K → K`, so `hact` covers exactly the hidden layers; `convolution h w x i = Σ_j w_j * x (s*i + j)`.
- Cross-roadmap citations resolved: 4 (Neuromanifolds, section on constructors of realisation maps, on main and at its open revision; InductionRestriction Layer 4 on main; SamplingAndDiscreteFourierAnalysis Layer 2 at its open head; StatisticalLearningTheory "Beyond this roadmap" at its open head). None is a supplier beyond Neuromanifolds through Tau Ceti.
- Elaboration: `Suggested.lean` elaborates; the only warnings are the eight `sorry`s. Elaborated types of all 17 declarations compared with the README: same hypotheses and generality; no section variables are used, so no binder is lost. One-tactic probe (`rfl`, `simp` with all nine definitions unfolded, `infer_instance`) closes none of the eight theorems.
- Headline theorems: the eight of the README (1.1, 1.2, 2.1–2.4, 3.1, 3.2) are all stated; none is forced through a stand-in; no padding.
- Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. Automatic checks: all passed. No change outside the roadmap folder.
- No Mathlib or Tau Ceti statement of the eight targets exists at the pins (searched for the commutant of `S_n` on tensors, the partition algebra, set-partition counts by Stirling/Bell numbers, power-sum embeddings, composition of convolutional chains).

Overlap check: read Neuromanifolds (main and its open revision), ReLUNetworkExpressivity, LinearAutoencodersAndPCA, RobustnessCertificates, UniversalApproximation, and also SamplingAndDiscreteFourierAnalysis, StatisticalLearningTheory and InductionRestriction; nothing shared (convolutional chains and `realizedFunctions` are owned by Neuromanifolds and used by name; the cyclic commutant stays with SamplingAndDiscreteFourierAnalysis §2.4; Hom spaces of induced representations stay with InductionRestriction Layer 4).

Source independence: 12 passages compared with 7 sources, none shared; largest share KMMTLinearConvNets, 11 of 38 locators; contents compared with KMMTLinearConvNets (§2.1, §2.2, §2.3, §4.1, §4.2, §4.3, §5): independent (3.1 merges §2.1, §2.2 and Remark 2.8; 3.2 takes Cor. 2.7 with part of §4.1; §2.3, §4.2, §4.3, §5 absent).

Research link: Layer 1 corrects the dimension theorem of Maron–Ben-Hamu–Shamir–Lipman (2019); Layer 2 makes global the Deep Sets representation of Zaheer et al. (2017) and the latent-dimension bound of Wagstaff et al. (2019); Layer 3 is the stride-one function-space theorem of Kohn–Merkh–Montúfar–Trager (2022). Rests on the README's references, read here.

## Not verifiable

- The README's statement in 2.1 that Tau Ceti's `TauCeti.Sym.coeffHomeomorph` is proved "by the same properness argument": the declaration and its hypotheses were read, its proof was not.
- The machine computations named in the Checks (22 triples by Gaussian elimination over three fields, ten architectures with all filters in `{−1, 0, 1}`, ranks on `S₃`) were not re-run; the values quoted in the README were recomputed by hand from the theorems for the instances in the table above.

## Source issues

- **Error** in MaronEquivariantGraphNetworks at Prop. 2 and Thm 1, p. 5 (also p. 2 and Prop. 3, p. 12): the source says the equality-pattern classes of `[n]^ℓ` correspond to all partitions of `[ℓ]`, giving dimension `b(ℓ)` for every `n`; it should be the partitions with at most `n` blocks, dimension `Σ_(j ≤ n) S(ℓ, j)`, equal to `b(ℓ)` only for `n ≥ ℓ`; affects a stated result.
- **Error** in ZaheerDeepSets at Lemma 3, p. 2: the source says `σ(Θx)` is equivariant if and only if `Θ = λI + γ𝟙𝟙ᵀ`, for any nonlinearity; it should assume a condition on `σ` such as injectivity, since a constant `σ` is equivariant for every `Θ`; affects a stated result.
- **Gap** in ZaheerDeepSets at Thm 7, p. 14, proof pp. 14–15: the source says `ρ` is continuous on `ℝ^(M+1)` but constructs it only on the compact image of the power-sum map; it should extend it to the whole space, for instance by Tietze; affects the proof.
- **Gap** in WagstaffLimitations at Thm 4.1, proof p. 5: the source applies Lemma 4.2, which assumes the decomposition for sets of every size, to a decomposition given for `M` points only; it should derive injectivity from `M`-point tuples, for instance by padding with a small repeated value; affects the proof.
- **Gap** in WagstaffLimitations at Thm 4.3, App. B.4, p. 11: the source says the power-sum map is a homeomorphism onto its image on `ℝ^M`, relying on a result proved on a compact cube, and defines `ρ` on the image only; it should prove the global statement on sorted tuples and extend `ρ`; affects the proof.
- **Misprint** in SannaiTakaiCordonnier at Cor. 3.1, p. 6: the source writes the components of `F` with `f`, `f₁`, …, `f_m`; it should be the single function `f` composed with the transpositions `(1 i)`; affects nothing.

## For the human reviewers

- **Scope.** The subject is the theory of neural-network layers (equivariant layers, set functions, linear convolutional networks). The sources are conference papers (ICLR, NIPS, ICML) and two works cited in their arXiv versions only (Sannai–Takai–Cordonnier; Kohn–Merkh–Montúfar–Trager). Whether this is in scope is yours to decide.
- **Scope.** Several targets (1.1–1.2 with the corrected index set, the global forms of 2.1, 2.2 and 2.4, the `L`-layer formula of 3.1 with zero strides) are stated more generally than any cited source and rest on the README's own routes, which were checked here.
