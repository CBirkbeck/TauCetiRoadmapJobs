# Review of NoncommutativeGeometry (pull request #1143 at 84ba014)

**Verdict:** needs changes

This is an incremental re-review of the 121 lines that changed in `TauCetiRoadmap/NoncommutativeGeometry/README.md` since 2e5c831, the head r23 read. `Suggested.lean` is unchanged, and no file outside the folder changed.

- The repairs of r23 R01 (Dixmier additivity) and r23 R03 (N3 Checks) are correct. Every value in the new text was recomputed, and no new defect was found.
- The two remaining findings are carried from r23. Both are repaired outside the README: in the pull-request description and in OperatorKTheory #866.
- The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with its single `sorry`.

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r23 R02 (r22 R01, r21 R01, r20 R01); not repaired.

**Location.**
- README 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- README 1813–1816: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ.

**Witness.** OperatorKTheory #866 is still at 1377338a. In `TauCetiRoadmap/OperatorKTheory/README.md`:
- 1783–1784 define `A_θ=C(𝕋)⋊_αℤ` and "`τ=HaarIntegral∘E` using D2's expectation";
- 2326 consumes "K7's rotation algebras with their K-groups".

`roadmaps grep --fixed 'τ=HaarIntegral∘E'` still hits #866:1784.

**Repair.** Unchanged from r23. This roadmap is on main, so it is earlier than #866 and may not cite it. The README already takes the only admissible direction, so no README edit is needed:
- The description states that this pull request merges before #866.
- #866 replaces its 1783–1784 and the presentation bullet that follows by a citation of NoncommutativeGeometry N6, and rewrites 2324–2326 as consumption of N6.
- **Test:** afterwards, `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R02 (P3) — The description describes an earlier head and states no merge order

Carried from r23 R04 (r22 R02, r21 R03, r20 R03). The description is unchanged.

**Location.** The pull-request description.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "which merge first: #864";
- a build report for head 84190a1e.

**Witness.**
- `git diff --stat origin/main...HEAD` gives `Suggested.lean | 147 +-`.
- README 1646–1653 writes `x⊠_u y` and `x⊠_s y`.
- README 106 says SmoothBanachRepresentations' inverse closure "is not an input here".
- No *Needs:* line names AlgebraicKTheory.
- #864 is not open.
- #1187 conflicts with this pull request in this folder's `Suggested.lean`.

**Repair.** Rewrite the description for this head.

Contents:
- N1.Tensor consumes Tau Ceti's Banach and locally convex projective tensors and BanachSpaceTheory B4's norm comparison.
- N1.Cyclic consumes the pinned bounded coboundary, currying and dual actions.
- N3–N4 consume NoncommutativeIntegration and VonNeumannAlgebras V4.Core.
- N4 proves additivity of the Dixmier trace on positive operators. It uses the pinned Ky Fan superadditivity and the dilation invariance of ω.
- N6 builds `A_θ` on Tau Ceti's full crossed product.
- N7 consumes HilbertModules H1–H3.
- `Suggested.lean` states only `bijective_matrixExtension`.

Merge order:
- #866 merges after this pull request (R01).
- SmoothBanachRepresentations #1145 and LocallyConvexDuality #1782 merge after it.
- #1187 rebases after it.

Drop the #864 line and the build report for 84190a1e.

## Previous findings

- R01 — repaired: README 357–359 now reads "The pin has no additivity of `dixmierTrace` on positive operators; N4 proves it from these two inputs". N4 1196–1208 proves `Tr_ω(S+T)=Tr_ω(S)+Tr_ω(T)` via Ky Fan with k=l=N and `map_dilate`. 1291 lists both names.
- R02 — not repaired: README 50–56 still says "N6 alone owns the rotation C*-algebra `A_θ`". #866 is unchanged at 1377338a (1783–1784, 2326), and the description names no order. Carried as R01.
- R03 — repaired: N3's **Checks.** at 1038–1069 add four bullets:
  - the circle calibration `τ₁(z⁻¹−1,z−1)=2`, `⟨[z],Ch₁⟩=−1`;
  - the point-cycle index 1 against −1;
  - `Tr′(T)=0` for the half-exchanging unitary;
  - the doubling and sine replacement.
- R04 — not repaired: the description still reads "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged" and "which merge first: #864". Carried as R02.

No repair report marked a finding `not actionable in this package`, so nothing is re-raised.

## Verified sound

**Gate, dependency check, build, signatures.**
- `gate … --base origin/main` at 84ba014, run here: every scanner 0, `OK`. The worker's run, with `build=0`, agrees.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- `git diff --stat 2e5c831 HEAD` touches only the README.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line. The three new edges are the Tau Ceti names added to N4's *Needs:*.
- `lake env lean TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0. The only warning is `declaration uses sorry` at 64:8.
- `Suggested.lean` is unchanged since r23, so its `#check @…` comparison carries over. The elaborated type of `bijective_matrixExtension` in `signatures.md` still matches README 691–696 (the r23 range 682–687, moved by the 9 lines the contract gained), and the file has no `variable` block. r23's one-tactic probe (simp, aesop, exact?) still applies: it is not padding.
- Headlines are unchanged, and the docstring's not-statable list still matches the Summary.

**Library declarations opened at Tau Ceti 2fd255d for the changed text.**

| File | Declaration (line) | What it says, and what it lacks |
| --- | --- | --- |
| `Analysis/Normed/Order/GeneralizedLimit.lean` | `GeneralizedLimit` (76) | a positive linear functional on `ℕ →ᵇ ℝ` extending limits |
| same | `map_of_tendsto` (120) | null sequences go to 0, the step used at README 1207 |
| same | `IsDilationInvariant` (177) | `∀ f k, 0<k → ω (f.dilate k) = ω f` |
| same | `IsDilationInvariant.map_dilate` (189) | `ω (f.dilate k) = ω f` for `0<k` |
| `Topology/ContinuousMap/Bounded/Normed.lean` | `dilate_apply` (244) | `f.dilate k n = f (n / k)`, the floor, matching README 347 |
| `Analysis/OperatorIdeal/ApproximationNumber/Basic.lean` | `kyFanGauge` (284) | `Σ_(n<k) aₙ`, matching "the first k approximation numbers" |
| `…/ApproximationNumber/Positive.lean` | `IsPositive.kyFanGauge_add_kyFanGauge_le` (114) | `S.kyFanGauge k + T.kyFanGauge l ≤ (S+T).kyFanGauge (k+l)`, for positive S, T on a complete inner product space (`[CompleteSpace E]`, 56), matching README 355 |
| `Analysis/OperatorIdeal/Family/DixmierTrace.lean` | `dixmierTrace` (91) | junk 0 outside `L^(1,∞)` |
| same | `dixmierTrace_of_notMem` (109) | the junk value |
| same | `dixmierTrace_add_le` (187) | subadditivity with both hypotheses in `L^(1,∞)`, matching README 351 "on `L^(1,∞)`" |
| same | `dixmierTrace_modulus` (226) | `Tr_ω(|T|)=Tr_ω(T)` |
| same | `dixmierTrace_eq_of_tendsto` (150) | used by "for every ω" in the new Checks |
| `Analysis/OperatorIdeal/Family/Logarithmic.lean` | `kyFanLogMean` (79) | `K_(N+1)(T)/log(N+2)` |
| `RingTheory/CyclicCohomology/OddPairing/Basic.lean` | `oddPairing` | factor `(1+i)⁻¹2⁻ⁿΓ(n/2+1)⁻¹`, so `(1+i)⁻¹2⁻¹Γ(3/2)⁻¹` at n=1, matching README 1043 |

`grep -rn 'theorem dixmierTrace_add'` over the pinned Tau Ceti finds only `dixmierTrace_add_le`. Mathlib 1b1ccf4 has no file mentioning Dixmier. So N4 owning additivity duplicates nothing.

**Pinned indexing.** The pinned sequence is `m′(N)=m(N+1)` in the README's notation. With that shift, the route at 1200–1208 still works:
- superadditivity at k=l=N+1 gives `K_(2N+2)(S+T)`;
- the dilation by 2 of `N↦m′(2N+1)` is `n↦m′(2⌊n/2⌋+1)`, which differs from m′ by at most one consecutive difference.

The README's sketch in Connes' indexing is therefore sound.

**Ownership.**
- `roadmaps grep -i 'Dixmier trace|Tr_ω|dixmierTrace'` outside this roadmap hits only SpectralManifolds #1158. It consumes N4 (README 7 and 21) and owns no Dixmier additivity.
- `roadmaps grep --fixed 'kyFanGauge_add_kyFanGauge_le'` hits only this README.
- `overlaps.md` reports no dropped or revision-only id, and #1187 is the one conflicting head (R02).
- `citations.md` reports nothing missing.

**Sources.**
- The seeded draw used `shuf --random-source` seeded by 84ba014 over the 15 single-line parenthetical locators.
- The targets that fall in the changed passages, or that those passages depend on, were read at their locators:
  - Connes IV.2, the inequalities and condition (γ), p. 311: connes94 11702–11720. Additivity after Definition 2, p. 312: 11761–11762. These are cited at README 1198–1199. ✓
  - IV.2, Definition 2, p. 312 (README 1189): connes94 11754–11760. ✓
  - IV.2, Theorem 8, p. 315 (README 1378), on which the new N5 Checks rest: connes94 11865–11877. The source has λ_n on φ_ω and pairs φ_ω equal to the Chern character on cycles. It also states scale invariance under D↦λD (11874), as the new Check says. ✓
  - IV.1, Definition 3, p. 302 (README 1046 and 1091): connes94 11343–11347. The odd constant is `√(2i)(−1)^(n(n−1)/2)Γ(n/2+1)`. ✓
  - IV.1, p. 299, `Tr′` (README 1076): connes94 11242–11243. ✓
- Also read: III.3, Proposition 3, p. 229 (connes94 8493–8496: odd pairing on `(u⁻¹−1,u−1,…)` with `(2i)^(−1/2)`) and IV intro, Proposition 2, p. 295 (11093–11100: `Index(EuE)`, E=(1+F)/2), for the sign in Source issues.
- The other sampled targets lie in untouched text and were verified by r23 (its sample table, items 1–15).

**Adversarial pass.** The changed rows were recomputed for this review in a pure-Python scratch script, or by hand where marked. Rows marked r23 are carried from r23 for statements this diff does not touch.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| N4 additivity target (1196–1208) | S=diag(1/(j+1))⊕0, T=0⊕diag(1/(j+1)); consecutive differences at n=10³, 10⁵ | `m(n)−m(n−1)`: 5.0·10⁻⁶ and 1.75·10⁻⁸; `m(2⌊n/2⌋)−m(n)`: 4.7·10⁻⁶ and 1.75·10⁻⁸, tending to 0. Connes' route (connes94 11705–11720) is the same | true | none |
| N4 negative controls (1209–1212), by hand from the pin | S=1 (not compact), T=diag(1/(j+1)); S=diag(1/(j+1)), T=−S | `Tr_ω(S+T)=0` (`dixmierTrace_of_notMem`; 0≤S≤S+T forces S+T∉L^(1,∞)) against `0+1`; `Tr_ω(0)=0` against `1+1` (`dixmierTrace_modulus`) | true | none |
| N4 Check and Example (1235–1244, 1282–1284) | N=10⁶ | `2H_N=28.7855`; `σ_N(S+T)=2H_(N/2)=27.3992`; means 2.0836 and 1.9832 | true | none |
| Tau Ceti contract (344–359) | the pin, opened | `map_dilate`, `dilate_apply` (floor), `kyFanGauge`=`Σ_(n<k)`, Ky Fan on `[CompleteSpace E]`, `dixmierTrace_add_le` with both arguments in `L^(1,∞)` | matches | none |
| N3 odd-character Check (1038–1047) | ℓ²(ℤ), z | `[F,z]`: only k=−1, weight `sgn(0)−sgn(−1)=2`; `Tr(z⁻¹[F,z])=2`, `Tr[F,z]=0`; `λ₁=−0.886227(1+i)`; pairing −1+0i; Connes' coefficient gives +1+0i; `ind(PzP)=−1`, `ind(Pz⁻¹P)=+1` (kernel e₀) | true | none |
| N3 index-direction Check (1048–1054) | a=2 | `e²=e`; `½Tr(F(FT+TF))=1.0` for T=γπ(e); compression line→0 has index 1, 0→line has −1 | true | none |
| N3 Tr′-domain Check (1055–1059) | `Te_k=e_(−k−1)`, k∈[−50,50) | coefficients of FT+TF: {0}; T permutes the basis (unitary), not compact | true | none |
| N3 doubling Check (1060–1069) | F=1/2; F=±1⊕3 | `F′²=I`; with +F the square has off-diagonal 0.866025; `sin(3π/2)=−1`; `(F/3)²−1=−0.888889` | true | none |
| N5 circle Check (1394–1404, 1417–1419) | D=diag(k+1/2); M=10³, 10⁵, 10⁶ | δ(z) weights for k=−4…2: −1,−1,−1,0,1,1,1; `σ_(2M)=17.74253, 26.95287, 31.55804`, equal to `4(H_(2M)−H_M/2)`; minus `2log M` gives 3.927 (`4log2+2γ`); means 2.334, 2.208, 2.175, tending to 2; `φ_ω(z⁻¹,z)=2λ₁=λ₁τ₁(z⁻¹,z)` | true | none |
| N5 absolute-value Check (1405–1410) | positive part `2/(2j+1)` | `σ_N/log(1+N)`: 1.284, 1.171, 1.142, tending to 1; `Tr_ω(D⁻¹)=1−1=0`; `[cD,a]|cD|⁻¹=[D,a]|D|⁻¹` by hand | true | none |
| `A_θ` ownership (50–56; R01) | #866 at 1377338a | 1783 `A_θ=C(𝕋)⋊_αℤ`; 1784 `τ=HaarIntegral∘E` | two owners | R01 |
| `bijective_matrixExtension` (r23) | A=ℚ against M₂(ℚ), n=0,1; ι=∅; A=0 | `HC⁰` 1 vs 1; `HC¹` 0 vs 0; ι=∅ gives `HC⁰(0)=0≠1`, so `[Nonempty ι]` is needed and present | true | none |
| Sample 1, p-summability (r23) | Hardy, a=z | `μ([F,z])=(2,0,…)` | true | none |
| N5 cocycle at the Fourier triple (r23) | random commuting values | `0.94+0.93i=2i(xy′−yx′)`; `λ₂·2i/(4π)=(2πi)⁻¹` | true | none |
| Hölder (r23) | I₂; diag(2,1)·diag(1,2) | `2=√2·√2`; `4≤5` | true | none |
| `Tr_ω(diag(1/(j+1)))=1` (r23) | N=10³, 10⁵, 10⁶ | 1.08348, 1.05014, 1.04178 | true | none |
| Torus conventions (r23) | `U₂_mul_U₁`, `twist` | `U₂U₁=𝐞(θ)U₁U₂`; phase `exp(2πiθnm′)` | true | none |
| Cross property and Banach comparison (r23) | `e₀⊗e₀` in ℓ¹ | projective 4; injective 2 (ℝ) and 2.828427 (ℂ) | true | none |
| Cyclic sign and coboundary (r23) | M₂ with φ=a₁₁ | `(bφ)(e₁₂,e₂₁)=1`, `bTr=0` | true | none |
| Diophantine Hochschild (r23) | golden θ, n<2·10⁴ | `max|1−λⁿ|⁻¹/n=0.5365` | true | none |
| Heisenberg module (r23) | θ=0.37 | ratio `e(θ)`; curvature `16.981582i=2πi/θ`; index +1 | true | none |
| Circle and Bott calibration (r23) | z^k; Bott density at z=0.3+0.7i | `k/((1+i)√π)`; `0.801154i=2i/(1+|z|²)²` | true | none |
| p-triangle (r23) | p=½ | `9>5`; `3≤3` | true | none |
| Odd and even column constants (r23) | k=0–3 | residuals ≤1·10⁻¹⁷; `1/m!` | true | none |
| ω-dependence (r23) | block integrals | 0.743683 and 0.756317 | true | none |
| Fourier `Tr_ω(|D|⁻²)` (r23) | R=200, 800 | 0.14616, 0.14853, tending to 0.15915 | true | none |
| Weak-class constants (r23) | p=2 | `1.99854≤2` | true | none |
| Hardy product reductions (r23) | W=(σ₁−σ₂)/√2 | `Wσ₁W=−σ₂`, `Wσ₃W=−σ₃` | true | none |
| Projection replacement (r23) | e=[[1,U₁],[0,0]] | `s e s⁻¹=p` | true | none |
| Weighted-shift cyclicity (r23) | S∈S₃∖S₂, T∈S_(3/2)∖S₁ | both traces `ζ(1.1)=10.5844` | true | none |

**Remarks on untouched text (no change requested).**
- N5's `φ_ω` (1374) and N7's `Tr_ω(π(a)|D|⁻²)` (1634) apply the linear Tr_ω to non-positive operators. N4 constructs the linear Tr_ω only for dilation-invariant ω, and neither passage repeats that hypothesis on ω. Connes' ω (connes94 11735–11743) always satisfies (γ).

## Not verifiable

- none. Every locator in the changed passages was read in the cached legal text connes94.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 with Proposition 4, pp. 302–303: the source says the odd constant √(2i)(−1)^(n(n−1)/2)Γ(n/2+1), with the pairing of III.3 Proposition 3, gives Index(EuE), E=(1+F)/2 (p. 295); it should be minus that constant, since the circle Hardy module then pairs [z] to +1 while Index(PzP)=−1; affects a stated result.
