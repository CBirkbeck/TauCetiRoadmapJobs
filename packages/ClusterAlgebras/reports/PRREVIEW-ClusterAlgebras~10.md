# Review of ClusterAlgebras (pull request #2250 at b177dca)

**Verdict:** needs changes

## R01 (P2) — The finite-type root parametrization is statable but absent

**Location:** `TauCetiRoadmap/ClusterAlgebras/README.md`:195 "Finite-type classification and root parametrizations"; :2536–2537 "Deduce that there are `rank(Φ)+|Φ_{>0}|` cluster variables and finitely many seeds." `Suggested.lean` states no §4.2 theorem, and its docstring (:30–32) does not name one.

**Claim:** The README lists FZ II's count of cluster variables in finite type as a Layer 4 deliverable. It can be stated at the pins with Mathlib's `RootPairing.Base`, `Base.cartanMatrix` and `Base.IsPos` together with this file's `Seed.clusterVariables`, but `Suggested.lean` does not state it.

**Witness:** I added the theorem below to a scratch copy, and it elaborates at the pins with only the `sorry` warning. Counts: A₂ gives 2+3=5, B₂ gives 2+4=6 and G₂ gives 2+6=8, matching the §4.2 Examples. BC₁ would give 3, so `[P.IsReduced]` is required.

**Repair:** Add the following after `exists_isFiniteType_iff_forall_le_three`:

```lean
/-- **The cluster variables of finite type** (§4.2; FZ II, Theorems 1.4 and 1.9): if the Cartan
companion of the principal block is the Cartan matrix of a finite reduced crystallographic root
system, the seed has `rank Φ + |Φ⁺|` cluster variables. -/
theorem ncard_clusterVariables [Fintype K] {F : Type*} [Field F]
    {ι M N : Type*} [Finite ι] [AddCommGroup M] [Module ℚ M] [AddCommGroup N] [Module ℚ N]
    {P : RootPairing ι ℚ M N} [P.IsCrystallographic] [P.IsReduced] (b : P.Base)
    (s : Seed (CoefficientSystem.trivial ℤ) row (1 : ℤˣ) F) (hs : s.state.IsBinary)
    (e : K ≃ b.support)
    (hA : ∀ i j, cartanCompanion (fun i j ↦ s.state.exchange.matrix (row i) j) i j =
      b.cartanMatrix (e i) (e j)) :
    s.clusterVariables.ncard = Fintype.card K + Nat.card {i // b.IsPos i} := by
  sorry
```

In README §4.2, after "…and finitely many seeds.", add: "For a binary seed over ℤ in a field whose principal block has as Cartan companion the Cartan matrix of a finite reduced root system, `ncard_clusterVariables` states this count (FZ II, Theorems 1.4 and 1.9)."

## R02 (P3) — The module docstring does not name every headline it leaves unstated

**Location:** `TauCetiRoadmap/ClusterAlgebras/Suggested.lean`:30–32 "The cluster scattering diagram (§5.1) needs the completed wall groups from ScatteringDiagrams. The coordinate-ring theorem (§6.3) needs the double Bruhat cell and generalized minors from Layer 6."

**Claim:** The cluster-variety theorem of §3.3 identifies the global functions on `𝒜` with the upper cluster algebra. It is neither stated nor named. The §5.1 sentence names an object rather than the theorem that is left out.

**Witness:** README:2292–2296: "Prove `Γ(𝒜,𝒪)=⋂_t C[M°]_t` … identify this intersection with `U_{C_J}`". The glued scheme `𝒜` has no carrier at the pins, and no declaration of `Suggested.lean` mentions it.

**Repair:** Replace :30–32 with: "Three headline theorems are not statable at the pins and are not stated here. Mutation invariance of the cluster scattering diagram and the theta-function expansion of cluster monomials (§§5.1–5.2) need ScatteringDiagrams' completed wall groups and broken lines. The identification of the global functions on the cluster 𝒜-scheme with the upper cluster algebra (§3.3) needs the glued scheme 𝒜. The coordinate ring of a double Bruhat cell (§6.3) needs the double Bruhat cell and generalized minors of Layer 6."

## R03 (P3) — The based quantum torus exists at the Tau Ceti pin but is not cited

**Location:** README:429–431, "let `T(R,u,Λ)` be the full `QuantumMonoidAlgebra` of ScatteringDiagrams §4.3 with `q=u` and `β=Λ`". The "From Tau Ceti" contract (:139–142) names only `laurentEval`, `laurentEvalEquiv`, `DynkinType` and `IsFiniteType`.

**Claim:** Tau Ceti at 2fd255d already has the twisted monoid algebra over any commutative semiring, with its basis, universal property and untwisted comparison. The supplier contract has to cite it.

**Witness:** `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`: `twistedMonoidAlgebra` :288, `of_mul_of` :336, `isUnit_of` :345, `basis` :356, `lift` :397 (whose hypotheses are `monomial_zero` and `monomial_mul`), `monoidAlgebraEquiv` :456.

**Repair:** In "From Tau Ceti" add: "`TauCeti.twistedMonoidAlgebra` (`TauCeti.Algebra.MonoidAlgebra.Twisted.Basic`) for `G=Multiplicative (ℤ^I)` and the factor set `(a,b)↦u^{Λ(a,b)}` is the based torus `T(R,u,Λ)` of §0.4 over any commutative semiring. It comes with `TwistedMonoidAlgebra.basis`, `of_mul_of`, `isUnit_of`, `lift` (a based chart is an injective `lift`) and `monoidAlgebraEquiv` for `Λ=0`." In §0.4, replace the quoted clause with "let `T(R,u,Λ)` be Tau Ceti's `twistedMonoidAlgebra` for this factor set, which is ScatteringDiagrams §4.3's `QuantumMonoidAlgebra` with `q=u` and `β=Λ`".

## R04 (P3) — Locators are missing in §1.4 and section-level in §2.3

**Location:** README:1144–1145 "give the exchange relation `x_kx'_k=∏_{i∈I}a_i^{[b_ik]_+}+∏_{i∈I}a_i^{[-b_ik]_+}`" (§1.4 cites nothing); :1823 "See FZ IV, §§3 and 6, for normalization and separation."

**Claim:** The geometric-type dictionary and the separation theorem are published results, but neither carries an exact locator.

**Witness:** FZ IV Definition 2.12 line 402, (2.13) line 471, (2.15) line 500, Theorem 3.7 line 650, Proposition 3.9 line 666, Proposition 3.12 line 760, (3.17) line 785 and Corollary 6.3 line 1081.

**Repair:** After the §1.4 exchange relation, add "(FZ IV, Definition 2.12 and (2.13)–(2.15))". Replace :1823 with: "Sources: FZ IV, Proposition 3.9 for the `ŷ` pattern, Proposition 3.12 and (3.17) for the normalization identities, Theorem 3.7 for the separation formula and Corollary 6.3 for its `g`-vector form."

## R05 (P3) — Four declarations lack docstrings, and one section title differs from the README

**Location:** In `Suggested.lean`, :69 `def coordinate`, :246 `abbrev Frozen`, :311 `def clusterVariables` and :314 `def upperBound` have no docstring. The section comment at :77 reads `/-! ## Layer 1: seeds and mutation -/`.

**Claim:** Every declaration needs a docstring stating its mathematics, and the section comments must use the README's layer titles.

**Witness:** README:711 reads "## Layer 1: classical and quantum seeds and mutation". None of the four declarations is preceded by a `/-- … -/` block.

**Repair:** Insert the following docstrings above the four declarations, in order, and retitle :77:

```lean
/-- The coordinate `X_i = M(e_i)` of a based chart. -/
/-- The frozen indices `J = I ∖ row(K)`. -/
/-- The cluster variables (§1.3): the mutable coordinates of all reachable seeds. -/
/-- The upper bound `UB_S(s)` (§1.3): the chart ring of `s` intersected with the chart rings of
its one-step mutations. -/
/-! ## Layer 1: classical and quantum seeds and mutation -/
```

## R06 (P3) — Two sentences are garbled

**Location:** README:1159–1160 "all directions are regular exactly when `IsRegular (2:C)` or every mutable column of the full extended matrix being nonzero."; :1501–1505 "In finite classical geometric type over ℤ with all frozen coordinates inverted, … (BFZ III, Corollary 1.9)."

**Claim:** The first sentence is ungrammatical. The second says "finite … type", a technical term of Layer 4, where finite rank is meant. It also cites BFZ III, Corollary 1.9 for an identity that holds by definition.

**Witness:** `Suggested.lean`:314–316 defines `Seed.upperBound` as the chart algebra intersected with those of the one-step mutations, in every case. BFZ III line 232: Corollary 1.9 is the invariance of the upper bound, not its definition.

**Repair:** (1) Replace "being nonzero" with "is nonzero". (2) Replace the quoted sentence with: "For binary seeds over ℤ at `u=1` in a field, with all frozen coordinates inverted, `Seed.chartAlgebra` is the Laurent ring of the chart and `Seed.upperBound` is BFZ's upper bound, so the signature specializes to BFZ III, Corollary 1.9."

## Verified sound

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| §0.2 charts | `X↦t` into `ℚ(t,s)`; evaluation `X=2` | injective, generates `ℚ(t)⊊ℚ(t,s)` | `X⁻¹↦1/2∉ℤ` | Checks hold; no source claim |
| §0.3 expansions | `x'=2/x`; `S={1}⊆{1,2}` | `x=2x'⁻¹`: coefficient 2 at exponent −1 | `z₁⁻¹z₂²∈ℤ[z₁^{±1},z₂]`, `z₂⁻¹∉` | agree |
| §1.3 patterns | rank 1; coefficient-free `A₂` | reduced words `∅,[k]`; `[k,k]` acts as identity | 5 clusters, pentagon | agree |
| §1.4 geometric | column `(0,1,1)ᵀ`; `(0,2)ᵀ` over `𝔽₂` | `xx'=1+z₀z₁` | `1+z²=(1+z)²≠0`; FZ IV (2.15) line 500 | agree; locator missing (R04) |
| §1.6 algebras | no mutable, one frozen label | `A_{v,∅}=Z_v[X]` | `A_{v,J}=U_v=Z_v[X^{±1}]`; BZ Def 4.12 line 560, (5.2)/(5.3) lines 589/600 | agree |
| §2.3 separation | `B=0` rank 2, `y=(w^{1/2},w^{−1/3})` | `y₂⊕1=w^{−1/3}` | `x'₂=(1+w^{1/3})/x₂`; FZ IV Thm 3.7 line 650 | agree; locator section-level (R04) |
| §2.4 Somos-4 | 12 mutations `k_n=n mod 4` | matrix is the cyclic shift; column `k_n` has `−2,1,1` as stated | `a₄..a₉=2,3,7,23,59,314`; FZ-LP Thm 1.8 line 85 | agree |
| §2.6 dilation law | `B=((0,1),(−1,0))`, `H₂=1+2T`, word `[1,2,1]` | dilated: `x'''=(1+2x)/y` | `H₁` kept: `(1+y+2x+xy)/(y(1+y))`; CS (2.5) line 176 | agree |
| §2.6 sources | BCDX Def 2.3 line 174; Rupel Thm 5.1 line 1641 | `h_{k,l}=h_{k,d−l}`, endpoints 1, `h'=h` | rank two, p. 1266 | as the README says |
| §3.4 tropical map | `B=((0,1),(−2,0))`, `d=(1,2)` | `p₁*(e₁)=−e₂*=−2f₂`, `⟨d₁e₁,f₁⟩=1` | `T₁(f₁)=f₁−2f₂`, `T₁(−f₁)=−f₁`; GHKK (1.23) line 1076 | agree |
| §3.4 principal data | GHKK App. B line 4491; Prop B.2 line 4513 | `Ñ=N⊕M°`, form `{n,n'}+⟨n,m'⟩−⟨n',m⟩` | fibre over `e∈T_M` is `𝒜` | matches §3.4 |
| §3.5 presentations | rank-one column `(0,1)ᵀ` | GHK (2.5)–(2.6) lines 573–574 | transition `x↦(1+z)/x` | agree |
| §4.1 classification | `G₂`; Kronecker | `|b₁₂b₂₁|=3` | product 4, infinite; FZ II Thm 1.8 line 274, 7.1 line 1208, 8.6 line 1411 | agree |
| §4.2 constants | FZ II (5.3), `k=1` | numerator `q∏x^{−a_ij}+r` at `x=0` | `r∈P` if `j` has a neighbour, `q+r` for `A₁`; Lemma 5.2 line 983 | agree |
| §5.2 positivity | `A₂`, word `[1,2]` | `(1+x₁+x₂)/(x₁x₂)` | coefficients 1,1,1; GHKK Thm 4.9 line 1873 | agree |
| §6.2 BFZ seed | `SL₂`, word `(−1,1)` | positions `−1,1,2`, all index 1 | 1 mutable, 2 frozen; BFZ III Prop 2.6 line 537 | agree |
| §6.3 coordinate ring | `SL₂`, `(s,s)` | complement `a=d=0`, `bc=−1`: dimension 1 | cell dimension 3; BFZ III Thm 2.10 line 668, Lemma 2.13 line 759 | codimension 2 |
| `Seed.existsUnique_isMutation` | quasi-commutation; independence | `Λ(β_k,a°)=w_k a°_{row k}/r_k=0` | `P_n=y^nx^n` is a unit; comparing by `x`-degree cancels it | holds over semirings |
| same, reverse exchange | new seed at `k` | `Λ'(e_k,γ_l)=lΛ(α₀,β_k)+Λ(α₀,e_k)` | `Λ(α_l,e_k)=Λ(α₀,e_k)+lΛ(β_k,e_k)`; equal since `Λ([−β_k]_+,β_k)=0` | `X''_k=X_k` |
| `Seed.exists_laurentExpansion` | ordinary rank-one pair, `u=v` | `X'₁=(1+vX₂)X₁⁻¹`, `X₁X'₁=1+v⁻¹X₂` | `(X'₁)²=(1+vX₂)(1+v³X₂)X₁⁻²` | agrees with the §2.1 Check |
| same, gauge transfer | general `c,e` | `X̃'_k/X'_k=e_kc_k⁻¹c^{r_k[−β_k]_+}`, independent of `l` | mutated gauge: exponent of `c_i` is `−β_ij−b_ik[b_kj]_+/r_j` on both sides | preserved; frozen `c_j=1` |
| `Seed.upperBound_eq_of_reachable` | `B=0`, rank 2, `H=1+T` (`hrank` fails) | `2/(xy)∈UB(s)` | coefficient `1/2` in `ℤ[(2/x)^{±1},(2/y)^{±1}]` | the hypothesis is needed |
| `Seed.exists_laurentExpansion_of_isGenerating` | `ℤ/6ℤ`, zero column | `H=1+T`: `H(1)=2`, `2·3=0` | `H=1+3T+T²`: `H(1)=5`, a unit | admissibility discriminates |
| same, frozen exponents | universal coefficients | `ord_f(m₊^lm₋^{r−l})=l[β_fk]_++(r−l)[−β_fk]_+` | minimum 0, at `l=0` or `l=r` | frozen exponents ≥0 |
| `exists_laurentExpansion` | `B̃=(0,1)ᵀ`; `A₂` | `(1+z)/x` | `(1+x₁+x₂)/(x₁x₂)` | frozen exponents ≥0 |
| `somos4_exists_pos_nat` | `b₀..b₃=1` | `a₈=(3·23+7²)/2` | `59` | positive integers |
| `upperBound_le_of_starfish` | `R=𝕜[x,y]`, `z=xy−1`; `K=∅` | `x'=y`; the opens miss only the origin | `K=∅`: infimum over an empty type, `UB` = chart ring `⊆R` | holds; one `x_k∈p` forces `a_k∉p` |
| `finite_clusterVariables_iff` | `K=∅`; `A₂` | `IsFiniteType` of the 0×0 matrix: `Finite`, `PosDef` vacuous | 5 variables; companion positive definite | both sides agree |
| `exists_isFiniteType_iff_forall_le_three` | one label; `G₂` | `(2)` is of finite type; right side vacuous | `|b₁₂b₂₁|=3≤3` | agree |
| `exists_nonneg_laurentExpansion` | `A₂`, word `[1,2]` | `(1+x₁+x₂)/(x₁x₂)` | coefficients 1,1,1 | ≥0 |
| `cVector_signCoherent` | `B=((0,1),(−2,0))`, `μ₁` | `C'=((−1,1),(0,1))`, `G'=((−1,0),(2,1))` | `G'ᵀdiag(2,1)C'=diag(2,1)` | sign-coherent; agree |
| R01 `ncard_clusterVariables` | `A₂, B₂, G₂, A₁×A₁`; `BC₁` | `2+3, 2+4, 2+6, 2+2` | `5, 6, 8, 4` (§4.2 Examples); `BC₁` gives `3≠2` | holds; `IsReduced` needed |
| §1.2 normalized degree-2 Check | `B=((0,2),(−1,0))`, `(1+2T)/3`, `(1+4T+3T²)/8` | 6 alternating mutations at a rational point | seed returns | agree |
| §1.2 scalar `A₂` Check | `H₁=1+2T`, `H₂=1+3T` | after 5 steps, ratio to the swapped coordinates | `6, 6` | agree |
| R03 Tau Ceti torus | `α(a,b)=u^{Λ(a,b)}` | cocycle `Λ(a+b,c)+Λ(a,b)=Λ(b,c)+Λ(a,b+c)` | holds since Λ is bilinear; `lift` hypotheses = `monomial_zero`, `monomial_mul` | same object |

- **Previous review (r8 at f31d9be):** every finding is repaired.
  - R01: `Seed.IsMutation` now carries explicit `mutatedPolynomial` and `mutatedMonomial`, and the gate reports `sorry-data=0`.
  - R02: the eight declarations are gone, and their README names are now prose.
  - R03: every Lean name occurs in the README.
  - R04: `IsGenerating` uses `FractionRing`, with the README text at :279.
  - R05: README :1993.
  - R06: the four fences are now Unicode.
  - R07: locators at :1702, :2171 and :2485.
  - R08: the description sentence was replaced.
- **Gate:** my run at b177dca reports every counter 0, OK. Depcheck prints `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- **Lean:** `lake env lean` gives 11 warnings, all `declaration uses sorry` on theorems, and no errors.
  - The one-tactic probe (`rfl|simp|infer_instance|trivial|decide|aesop`) closes none of the 11.
  - I ran `#check @` on the headline theorems, and each matches its README statement. The five binder leads are only `[DecidableEq I]`/`[DecidableEq K]`.
- **Sources:** I located 102 locators in 13 texts and read 59 of them at the locator: FZ I, FZ II, FZ IV, FZ-LP, BZ, BFZ III, GHKK, GHK, CS (v3), Nakanishi, BCDX and Rupel. All hold apart from R04.
- **Library declarations at the pins:**
  - Mathlib 1b1ccf4: `NonZeroDivisors.lean:80`, `FractionRing.lean:744`, `RootSystem/Base.lean:68,540,619`, `CartanMatrix.lean:107`, `Reduced.lean:50`, `TensorProduct/MonoidAlgebra.lean:108`.
  - Tau Ceti 2fd255d: `FiniteType/Basic.lean:129`, `SerreCondition/Basic.lean`, `Polynomial/Laurent/Basic.lean`, `MonoidAlgebra/Localization.lean:53` and the `Twisted/Basic.lean` declarations of R03.
  - The Tau Ceti pin has no `ExchangeMatrix`, `matrixMutation` or `CoefficientSemifield`, so `Suggested.lean` duplicates nothing there.
- **Cross-roadmap citations (main 7342e8f):** all resolve.
  - ScatteringDiagrams §§0.8, 1.4, 3.3–3.4, 4.2–4.4, 5.1–5.6 and 7.1–7.7, and its 11 cited names.
  - SchemeAndStackFoundations §0.6 `coherent_hartogs` (:994).
  - ReductiveGroups Layers 7, 7C, 8 and 10; RootSystems Layers 1–3; AnalyticToricGeometry Layer 0.
  - No roadmap cites ClusterAlgebras.
- **Overlap check:** I read ScatteringDiagrams (main, 0.18) and QuantumGroups (the named boundary); the open-PR lists are empty.
  - ScatteringDiagrams owns the lattice data, `QuantumMonoidAlgebra` and scattering, and excludes seeds, mutation and the theta/cluster comparison (:27–28). This roadmap owns those.
  - QuantumGroups owns σ-derivation extensions, which are unused here.
  - Searches of the 439 open heads and main for the cluster, exchange-matrix, Somos-4, double Bruhat, semifield and quantum-torus objects find no other owner.
- **Computations:** I simulated §1.2 mutation over exact rationals, which reproduces the three README Checks above, and ran the Somos-4 matrix check over 12 steps. The gauge, quasi-commutation and Q1 power formulas were derived by hand.

## Not verifiable

- Berenstein–Zelevinsky, *Total positivity in Schubert varieties*, (4.8)–(4.11), cited in §6.1: not fetched this round. It is outside the seeded sample, and its licence class on EMS Press is unknown.

## Source issues

- **Misprint** in Chekhov–Shapiro at §2.1, p. 4 (arXiv v3): the source says the coefficient collection `p_i` runs from `p_{i;0}` to `i_{i;d_i}`; it should be `p_{i;d_i}`; affects nothing.
