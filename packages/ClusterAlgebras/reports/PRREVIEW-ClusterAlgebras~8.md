# Review of ClusterAlgebras (pull request #2250 at f31d9be)

**Verdict:** needs changes

## R01 (P2) — Four definitions carry `sorry`'d proof obligations; every headline depends on them

**Location:** `TauCetiRoadmap/ClusterAlgebras/Suggested.lean`:321–343, `def mutate (s : Seed c row u B) (k : K) (hE : IsUnit (s.exchangeElement k)) : Seed c row u B where` … `linearIndependent := by sorry`. The same holds at :117 (`ExchangeMatrix.mutation`), :224 (`CoefficientSystem.ofSemifield`) and :259 (`ExchangeData.mutate`).

**Claim:** The gate fails `sorry-data` (no sorry'd data). All ten theorems use `Seed.Reachable`, which goes through `Step` to `Seed.mutate`, so every headline is stated through sorried definitions.

**Witness:** Gate at f31d9be: `sorry-data=4 … FAIL` (lines 117, 224, 259, 321). `lake env lean` warns `declaration uses sorry` at 122, 229, 231, 234, 236, 265, 323, 326, 329, 338, 340 and 342.

**Repair:** Delete `ExchangeMatrix.mutation`, `ExchangeData.mutate`, `Seed.mutate` and `ofSemifield`. State one-step mutation as a relation, which determines `t` because a based chart is determined by its coordinates and form (§0.4):

```lean
def IsMutation (s t : Seed c row u B) (k : K) : Prop :=
  IsUnit (s.exchangeElement k) ∧
  t.state.exchange.matrix = matrixMutation row s.state.exchange.matrix k ∧
  t.state.exchange.symmetrizer = s.state.exchange.symmetrizer ∧
  (∀ j, t.state.polynomial j = if j = k then (s.state.polynomial k).reverse else
    c.normalize ((s.state.polynomial j).dilate ((s.state.polynomial k).dilationFactor
      (s.state.exchange.matrix (row k) j / ((s.state.polynomial j).degree : ℤ))))) ∧
  t.form = formMutation row s.state.exchange.matrix s.form k ∧ t.weight = s.weight ∧
  (t.chart.coordinate (row k) : B) = s.exchangeElement k ∧
  ∀ i, i ≠ row k → t.chart.coordinate i = s.chart.coordinate i

def Step (s t : Seed c row u B) : Prop := ∃ k, s.IsMutation t k
```

In `upperBound_le_of_starfish`, replace `hx'` with `(hx' : ∀ k, algebraMap R F (x' k) = s.exchangeElement k)`. The existence of the mutated seed stays a §1.2 target. A scratch copy with this change (together with R02 and R04) elaborates with only the ten theorem `sorry`s.

## R02 (P3) — `Suggested.lean` declares definitions that no headline uses

**Location:** `Suggested.lean`:15–17: "The statements below give suggested Lean forms for the Layer 1 carriers and the headline targets". The unused declarations are `LaurentChart` (:47), `LaurentChart.coordinate` (:53), `ExchangePolynomial.map` (:177), `Seed.IsTotal` (:358), `Seed.clusterAlgebra` (:373), `Seed.upperClusterAlgebra` (:379), `Seed.toScalarSeed` (:388) and `Seed.GaugeEquivalent` (:404).

**Claim:** `Suggested.lean` should be an acceptance test, but it also works as an API catalogue: none of these eight declarations occurs in any of the ten theorem statements.

**Witness:** A grep of the ten theorem statements finds none of the eight names. `ExchangePolynomial.map` is used only by `toScalarSeed` and `GaugeEquivalent`.

**Repair:** Delete the eight declarations. In the README, drop the backticked Lean names at lines 350 (`LaurentChart`), 867 (`Seed.IsTotal`), 873 (`Seed.GaugeEquivalent`), 886 (`Seed.toScalarSeed`), 1082 (`Seed.clusterAlgebra`) and 1084 (`Seed.upperClusterAlgebra`), and keep the prose. Change docstring lines 16–17 to: "The statements below are the roadmap's headline theorems, with only the definitions their statements need." This was tested in the scratch copy of R01.

## R03 (P3) — Lean names that the README never mentions

**Location:** `Suggested.lean` declarations `Seed.exchangeElement`, `Seed.Reachable`, `Seed.Step`, `Seed.IsGenerating`, `ExchangeData.IsNormalized`, `ExchangeData.IsBinary`, `ExchangeData.valueAtOne`, `ExchangeData.exchangeExponent`, `ExchangeData.dividedColumn`, `ExchangePolynomial.dilationFactor`, `ExchangePolynomial.scale` and `formPairing`.

**Claim:** README and Lean must agree in both directions: every Lean name has to appear in the README.

**Witness:** Each short name gets 0 hits in `README.md`. The README describes these notions in prose, for example "Its exchange element at k is" (line 837) and "The reachable-seed relation is" (line 1053).

**Repair:** Name each one where its notion is defined. Examples:
- line 837: "Its exchange element (`Seed.exchangeElement`) at k is";
- line 1053: "The reachable-seed relation (`Seed.Reachable`) is the reflexive transitive closure of these one-step exchanges (`Seed.Step`)";
- line 353: "A generating regular chart (`Seed.IsGenerating`)".

Do the same for the remaining names at their definitions in §§0.4, 1.2 and 1.4.

## R04 (P3) — `TotalQuotient` restates Mathlib's total fraction ring for rings

**Location:** `README.md`:279–280: "and the comparison with the fraction field when A is a domain ring". Also Conventions :117–118, and `Suggested.lean`:417, `∃ e : TotalQuotient (LaurentRing C I) ≃ₐ[C] F` with `C` a commutative ring.

**Claim:** For every commutative ring A, `Reg(A)=A⁰`, so `T(A)` is Mathlib's `FractionRing A`. The comparison is not limited to domains, and the ring-only headline should use the native carrier.

**Witness:** Mathlib `Mathlib/Algebra/Ring/NonZeroDivisors.lean:80` `isRegular_iff_mem_nonZeroDivisors`. `Mathlib/RingTheory/Localization/FractionRing.lean:744` `FractionRing := Localization (nonZeroDivisors R)`, whose docstring calls it "the total fraction ring" for every `CommRing`.

**Repair:**
- §0.1: "For a commutative ring A, `isRegular_iff_mem_nonZeroDivisors` gives `Reg(A)=A⁰`, so `T(A)` is Mathlib's total fraction ring `FractionRing A`; T is a new construction only for semirings." Make the same change in Conventions.
- Lean: declare `IsGenerating` over `[CommRing C] [CommRing F]` with `∃ e : FractionRing (AddMonoidAlgebra C (I →₀ ℤ)) ≃ₐ[C] F` and `algebraMap (AddMonoidAlgebra C (I →₀ ℤ)) _`, and delete `regulars` and `TotalQuotient`. This was tested and elaborates.

## R05 (P3) — Gate `tex`: TeX subscript outside a code span

**Location:** `README.md`:1983: "scalar extension of upper algebras is not identified with U_{C,S}."

**Claim:** TeX-only syntax appears outside code spans.

**Witness:** Gate at f31d9be: `tex: line 1983`.

**Repair:** Write "… is not identified with `U_{C,S}`."

## R06 (P3) — LaTeX `math` fences

**Location:** `README.md`:826–829, ```` ```math ```` `m_{k,\pm}=\prod_{i\ne\mathrm{row}(k)}X_i^{[\pm\beta_{ik}]_+}`. The same applies at 935–939, 990–994 and 1715–1717.

**Claim:** House style forbids LaTeX displays. A display formula has to be Unicode in a code span or an indented code block.

**Witness:** The four fences contain `\prod`, `\mathrm`, `\frac`, `\mathbin` and `\operatorname`. The gate reports `latex=0`, so it does not catch these fences.

**Repair:** Replace the four fences as follows:
- lines 826–829: `m_{k,±}=∏_{i≠row(k)} X_i^{[±β_ik]_+},  E_k=Σ_{l=0}^{r_k} φ(h_{k,l}) m_{k,+}^l m_{k,−}^{r_k−l}`
- lines 935–939: `E_k=φ(y_k⊕_P 1)⁻¹(φ(y_k)∏_{i≠row(k)} X_i^{[b̃_ik]_+}+∏_{i≠row(k)} X_i^{[−b̃_ik]_+}) ∈ D_k`
- lines 990–994: `x'_k=(φ(y_k)∏_i x_i^{[b_ik]_+} ⊕_Q ∏_i x_i^{[−b_ik]_+})/(φ(y_k⊕_P 1)x_k),  x'_i=x_i (i≠k)`
- lines 1715–1717: `χ_s(Pos(P,K))=χ_t(Pos(P,K))`

## R07 (P3) — Source theorems stated without locators in §§2.2, 3.1 and 4.1

**Location:** `README.md`:1670 "**L6b — principal polynomials and degrees.** Prove `X_{j;t}∈ℤ[u_i][x_i^{±1}]`" (none of §2.2 cites a source). Also :2159–2160 (signed mutation `e'_i=e_i+[±ε_ik]_+e_k`) and :2468–2472 (conditions 1–3).

**Claim:** These are published theorems, but none of them carries a locator at the claim.

**Witness:**
- FZ IV: Prop 3.6 at line 630, Prop 5.1 with (5.3) at lines 916–933, Prop 6.1 at line 1043, Cor 6.3 at line 1081 and Prop 6.6 with (6.12) at lines 1174–1185.
- GHK (2.3)–(2.4) at lines 545–568.
- FZ II: Thm 1.4 at line 239 and Thm 1.8 at line 274.

**Repair:**
- After the L6b paragraph, add "(FZ IV, Propositions 3.6, 5.1, 6.1 and 6.6, and Corollary 6.3)".
- After the signed-mutation formula, add "(GHK, (2.3)–(2.4); GHKK, Remark B.8)".
- After condition 3, add "(FZ II, Theorems 1.4, 1.5 and 1.8)".

## R08 (P3) — The description says the scope and sources do not change

**Location:** The pull-request description, under "What does not change": "The scope, the layers, the milestone labels, the sources and the dependencies on other roadmaps."

**Claim:** At this head both the scope and the sources change, and §1.5 has a new title.

**Witness:**
- Scope, lines 36–37 and 81–90: "coefficient realizations over commutative rings, including rings with zero divisors" and "unit endpoint coefficients". On main these read "arbitrary domains" and "monic with constant coefficient one".
- References add Chekhov–Shapiro and Nakanishi.
- The §1.5 heading changes.

**Repair:** Replace the sentence with: "The layers, the milestone labels and the dependencies on other roadmaps. The scope widens to coefficient realizations over commutative rings with zero divisors and to exchange polynomials with unit endpoint coefficients; References add Chekhov–Shapiro and Nakanishi; §1.5 is retitled 'Polynomial exchange, quantum frames and ordinary quantum seeds'."

## Verified sound

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| §0.5 one-exchange | `y=2/x` over ℤ; quantum `xz=v²zx`, `E=1+z` | `c₋₁=2∈2ℤ`, `c₋₂=4∈4ℤ`; `x⁻¹`, `2x⁻²` fail | `y²=(1+z)(1+v⁻²z)x⁻²=P₂x⁻²`, with `σ⁻¹(z)=v⁻²z` | agree; BFZ III Lemmas 4.1–4.2 lines 1178/1210, BZ Lemmas 5.5–5.6 lines 669/694 |
| §0.5 based-chart form | unit y, `yx∈C`, x normalizes C | `yⁿM(a°)∈C·x⁻ⁿ`; the terms separate by k-degree | independence of `M'` reduces to independence of `M` | holds, over semirings too |
| §0.7 replacement | `x*=(1+z)/x`, `z*=(1+x+x²)/z` | `(1+x*+x*²)/z`: numerator `1+x+x²+2z+xz+z²` over `x²z` | `(x*)²z*−x*−z−2`: same numerator; at `x=z=1`, both sides are 7 | agree; BFZ III Lemma 4.6 line 1295, BZ Lemma 5.8 line 733 |
| §1.1 compatibility | `B=((0,1),(−2,0))`, `Λ₁₂=λ` | `BᵀΛ=diag(2λ,λ)`, `w₁b₁₂=2λ` | `−w₂b₂₁=2λ` | agree; BZ Def 3.1, Props 3.3/3.4/3.6 at lines 202/258/293/326 |
| §1.2 dilation law (scalar system) | A₂, `H₁=1+2T`, `H₂=1+3T`, five mutations | simulated coordinates `(6x₂,6x₁)` | Check: interchanged and multiplied by 6 | agree |
| §1.2 normalized system | A₂ with `(1+2T)/3`, `(1+3T)/4`; `B=((0,2),(−1,0))` with `(1+2T)/3`, `(1+4T+3T²)/8` | A₂: period 5; second seed: six mutations | coordinates, matrix and polynomials return | agree |
| §1.2 κ against sources | CS (2.5) lines 172–176; Nakanishi (2.10) lines 208–220 | ratio `p'_{i,s}/p'_{i,0}` scaled by `p_{k,d}^{sβ}` or `p_{k,0}^{sβ}` | `κ_kj=h_{k,r}^{[β_kj]_+}h_{k,0}^{−[−β_kj]_+}`, `β_kj=b_kj/r_j` | agree, CS rows ↔ README columns |
| §1.2 gauge | general c, e | `X̃'_k/X'_k=e_kc_k⁻¹c^{r_k[−β_k]_+}`, independent of l | mutated-gauge exponent of `c_i`: `−b_ik[b_kj]_+/r_j` on both sides | agree |
| §1.2 normalizer axioms | `ℚ≥0`, `ν=h₀⁻¹`, `H=1+2T` | `ν(H^rev)=ν(2+T)=1/2` | `ν(H)=1` | first axiom fails, as the Check says |
| `Seed.mutate` obligations (R01) | normalized; quasi-commutation; independence | `ν(ν(H)H)ν(H)=ν(H)` ⇒ `ν(N(H))=1`; `Λ(β_k,a°)=0` | `X'M(a°)=u^{2Λ'(e_k,a°)}M(a°)X'` | all true; still sorried data |
| §1.5 endpoint reduction | 12 random rank-2 cases, degrees 1–2, 6-step words | endpoint-one pattern with frozen `D_r` | scalar pattern with `H_k(t_kT)` | coordinates differ by t-monomials in all 12 |
| §1.6 algebras | no mutable labels, one frozen label | `A_{v,∅}=Z_v[X]` | `A_{v,J}=U_v=Z_v[X^{±1}]` | agree; BZ Def 4.12 line 560, (5.2)/(5.3) lines 589/600 |
| §2.1 Q1 | rank-one ordinary pair, engine at `v=2` | `X₁X'₁=1+X₂/2`, `X'₁X₁=1+2X₂` | `(X'₁)²`: `X₁⁻²` coefficients `1, 5/2, 1` both sides | agree |
| `Seed.exists_laurentExpansion` | commutative rank 3, random non-reciprocal H, endpoints `2,3,½,−1` | 31 complete 4-step words Laurent (19 size-capped) | no dilation law: 23 of 25 not Laurent | holds; the law is needed |
| same | quantum `u=2`: rank 2 (6×5 steps), rank 3 plus frozen (7×3 steps), `w` including −4, −2 | every new coordinate left-divides exactly | no failure | no counterexample |
| `Seed.upperBound_eq_of_reachable` | `B=0`, rank 2, `H=1+T` (`hrank` fails) | `2/(xy)∈UB(s)` | `∉ℤ[(2/x)^{±1},(2/y)^{±1}]` (coefficient ½) | hypothesis needed |
| `Seed.exists_laurentExpansion_of_isGenerating` | ℤ/6ℤ, zero column | `H=1+T`: `H(1)=2`, `2·3=0` | `H=1+3T+T²`: `H(1)=5`, a unit | admissibility discriminates |
| `TotalQuotient` (R04) | A a commutative ring | `regulars A = A⁰` | `FractionRing A = Localization A⁰` | same object for every ring |
| `exists_laurentExpansion` | A₂ binary; `B̃=(0,1)ᵀ` | `(1+x₁+x₂)/(x₁x₂)`; `(1+z)/x` | frozen exponents 0 and 1 | all ≥ 0 |
| `somos4_exists_pos_nat` | `b₀..b₃=1` | `2,3,7,23,59` | every quotient exact | positive integers |
| `upperBound_le_of_starfish` | `R=𝕜[x,y]`, `z=xy−1`, `x'=y`; `K=∅` | no height-one prime contains x and y | `UB⊆R`; `K=∅` gives `UB=C[frozen]⊆R` | holds; FWZ Prop 6.4.1 line 431 |
| `finite_clusterVariables_iff` | A₁×A₁, A₂, B₂, G₂; Kronecker | 4, 5, 6, 8 variables; infinitely many | companion determinants > 0; 0 | agree; FZ II Thm 1.8 line 274 |
| `exists_isFiniteType_iff_forall_le_three` | G₂ `((0,1),(−3,0))` | `\|b₁₂b₂₁\|=3` | `DA=((6,−3),(−3,2))`, det 3 | agree |
| `exists_nonneg_laurentExpansion` | A₂, word `[1,2]` | `(1+x₁+x₂)/(x₁x₂)` | coefficients 1, 1, 1 | ≥ 0 |
| `cVector_signCoherent` | `B=((0,1),(−2,0))`, `μ₁` | `C'=((−1,1),(0,1))`, columns `(−1,0)` and `(1,1)` | `G'ᵀdiag(2,1)C'=diag(2,1)` | sign-coherent; agree |
| §2.2 L6b (R07) | principal rank one | `F'F=u+1`, `g'=−1` | FZ IV (5.3) line 933, (6.12) line 1179 | agree; no locator |
| §2.5 bar | `𝔽₇`, `u=2` | `(1+2T)(1+T)(1+4T)=1+7T+14T²+8T³` | `1+T³` | agree; BZ (6.2), Prop 6.2 lines 822–823 |
| §2.6 polynomial | `B=((0,1),(−1,0))`, `H₂=1+2T`, word `[1,2,1]` | dilation: `x'''=(1+2x)/y` | fixed `H₁`: `(1+y+2x+xy)/(y(1+y))` | agree; BCDX line 168: reciprocal, endpoints 1 |
| §2.6 quantum | `B=((0,2),(−2,0))`, `H=1+T+T²`, engine at `v=2` | computed `y**` | `(1+v⁻¹x*+v⁻²x*²)y⁻¹` | equal; Rupel Thm 5.1 line 1641, p. 1266 |
| §2.7 Hartogs | Stacks 0E9I | Divisors Lemma 5.11 line 335: depth ≥ 2 off U gives `Γ(X)=Γ(U)` | the README's use | agree |
| §3.1 (R07) | determinant basis, unit weights | `μ₁⁺: e₂↦e₂`; applied twice, `e₂↦e₂−e₁` | `n↦n+{n,e₁}e₁` sends `e₂↦e₂−e₁` | agree; GHK (2.3) line 545 |
| §3.2 | `B=((0,1),(−2,0))`, `s=(2,1)` | `L=2`, `d=(1,2)` | `ε_ki={e_k,e_i}d_i=B̃_ik`, so `ε=Bᵀ` | agree |
| §3.5 | GHKK Remark B.8 line 4644 | dependent or non-spanning `e_i` allowed | §3.1 allows them | agree; GHK (2.5)–(2.6) lines 573–574; FG §§1.2.5–1.2.6 lines 449/459 |
| §4.1 | Kronecker `((0,2),(−2,0))` | mutation class `{±B}`, finite | product 4, companion det 0 | infinite type; FZ II Thm 7.1 line 1208, Thm 8.6 line 1411 |
| §5.1 | GHKK Thm 1.24 line 1102 | requires the Injectivity Assumption | applied to the full principal seed (`p̃₁*` injective) | agree; GHKK Thm 2.13 line 1438 |
| §6.1 | SL₂, `(s,s)` | `r+ℓ(u)+ℓ(v)=3` | cell `bc≠0` in 3-dimensional SL₂ | agree; FZ98 Thm 1.1 line 168, Thms 1.6/1.16/1.17 |
| §6.3 | SL₂, `(s,s)` | complement `a=d=0`, `bc=−1`: dimension 1 | cell dimension 3 | codimension 2; BFZ III Lemma 2.13 line 759, Thm 2.10 line 668 (p. 15) |

- **Gate and dependencies.** My gate run reports `tex=1 sorry-data=4`, every other counter 0, FAIL. The dependency check prints `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- **Lean.** `lake env lean` gives 22 warnings, all `sorry` (12 in definitions, 10 in theorems), and no errors. The one-tactic probe (`rfl|simp|infer_instance|aesop|trivial`) closes none of the 10 theorems. The five dropped-binder leads in `signatures.md` are only `[DecidableEq I]`/`[DecidableEq K]`.
- **Sources.** I checked 60 locators in 16 texts (FZ I, FZ II, FZ IV, BZ, BFZ III, FZ98, GHKK, GHK, CS, Nakanishi, Nakanishi–Rupel, BCDX, Rupel, FWZ, Stacks, FG). Every locator in the seeded sample holds, except where a locator is missing (R07).
- **Libraries at the pins.** Mathlib `FractionRing.lean:744` and `NonZeroDivisors.lean:80`. Tau Ceti 2fd255d: `laurentEval` (Laurent/Basic.lean:124), `IsFiniteType` (:129), `SatisfiesSerreS` (:85), `DynkinType`/`Valid` (:105/:153). Tau Ceti has no `ExchangeMatrix` or `matrixMutation` at the pin.
- **Cross-roadmap citations** (main 7342e8f): all resolve.
  - ScatteringDiagrams §§0.8, 1.4, 3.3, 3.4, 4.2–4.4, 5.1, 5.6, 7.2 and 7.7, and its 12 cited names.
  - SchemeAndStackFoundations §0.6 `coherent_hartogs` (line 994).
  - ReductiveGroups Layers 7, 7C, 8 and 10; RootSystems Layers 1–3; AnalyticToricGeometry Layer 0.
  - No roadmap cites ClusterAlgebras, and no other `Suggested.lean` uses the `TauCetiRoadmap.ClusterAlgebras` namespace.
- **Overlap check:** I read ScatteringDiagrams (main, 0.18) and QuantumGroups (the named boundary); the open-PR lists are empty. ScatteringDiagrams owns the lattice data, `QuantumMonoidAlgebra` and scattering, and they are consumed here. The theta/cluster comparison and seed mutation invariance are owned here (ScatteringDiagrams lines 27–28 exclude them). QuantumGroups owns σ-derivation extensions, which are unused here.
- **Computations.** I wrote exact Laurent and quantum-torus engines for these checks (first table rows). They reproduce the README Checks at §§1.2, 1.5, 2.1 and 2.6 exactly.
- **Previous review** (cc59a91): it raised no findings, so nothing carries over.

## Not verifiable

- Berenstein–Zelevinsky, *Total positivity in Schubert varieties*, (4.8)–(4.11): the EMS Press copy is not in a known licence class. I checked it only through FZ98 line 463, which cites the same equations for G₂.

## Source issues

- none
