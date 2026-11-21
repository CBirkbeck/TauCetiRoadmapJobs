# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #2888 at 1554ab5)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** needs changes

**Summary.** Needs changes, for two findings. Both concern how the headlines are presented, not the mathematics of the layers. First, integral branching (headline 2) can be stated at the pins with the file's own polynomial model plus one more definition, but `Suggested.lean` states only the integer `c_Br`. Second, the Summary describes the denominator bound of 0.3a for lattices stable under the divided powers of the root operators alone, and for those it is false. Every Check and worked example I recomputed holds, as do the sandwich, block-cut, graded Pieri and four-part bounds on every small case I tested. There are three small corrections and one format note; scope, licence and the formal source that could not be tested are left to the human reviewers.

## R01 (P2) — Integral branching (headline 2) can be stated at the pins with the file's own definitions, but `Suggested.lean` states only the integer `c_Br`

As things stand, the acceptance test for headline (2) says nothing about the lattices. A finished roadmap would pass it without proving that the branching map is integral. The module docstring (lines 30–34) explains the omission like this: "It lacks the actions of `GL_N` and `GL_{N−1}` on the models, with their determinant twists, the equivariant maps between them, and the normalised contravariant form."

That reason no longer holds at this head, because the file now defines the models and `dividedRowOperator`. Take a map that sends `v_σ` to a vector of `GL_{N−1}`-weight `σ`. On the models, it is `GL_{N−1}`-equivariant exactly when it commutes with the `E_{ab}^{(k)}` for `a ≠ b < N − 1`, since the binomials act on weight spaces by scalars. The determinant twists enter only through the weights.

With one added definition, `branchingVector` (the product of minors `ξ` of 1.1, on native `MvPolynomial`), the following elaborates at the pins on a probe copy of the file, with `sorry` as the only warning:

```lean
theorem exists_integral_branching (m : ℕ) (lam : Fin (m + 1) → ℤ) (sigma : Fin m → ℤ)
    (hinterlace : ∀ i : Fin m, sigma i ≤ lam i.castSucc ∧ lam i.succ ≤ sigma i) :
    ∃ io : MvPolynomial (Fin m × Fin m) ℤ →ₗ[ℤ] MvPolynomial (Fin (m + 1) × Fin (m + 1)) ℤ,
      io (highestWeightVector ℤ (normalizedWeight sigma)) =
          branchingInteger m lam sigma • branchingVector m lam sigma ∧
        (∀ (a b : Fin m) (k : ℕ), a ≠ b → ∀ f ∈ dualWeylLattice ℤ sigma,
          io (dividedRowOperator ℤ a b k f) = dividedRowOperator ℤ a.castSucc b.castSucc k (io f)) ∧
        ∀ f ∈ dualWeylLattice ℤ sigma, io f ∈ dualWeylLattice ℤ lam
```

The bound `⟨ξ, ξ⟩_λ ≤ dim V_λ` of 1.1 (e) also elaborates, as `fischerNormSq (branchingVector m lam sigma) ≤ (TauCeti.weylDimension ⟨lam, hlam⟩ : ℤ) * fischerNormSq (highestWeightVector ℤ (normalizedWeight lam))`. The previous review counted the equivariant maps of 1.1 among the headlines with no carrier. That was before the file had the divided row operators.

The smallest repair has three parts. Add the definition of `ξ`. State 1.1 (a) as above, and optionally the bound of (e). Then either keep in the docstring only the clauses that need the adjoint for the normalised form ((b) and the composite in (e)), or state those too with a bilinear Fischer form.

## R02 (P2) — The Summary's description of the denominator bound drops the binomials `C(E_{aa}, k)`, and without them the bound is false

The headline paragraph (line 5) says: "It rests on a denominator bound for the projector onto the invariants of any lattice stable under the divided powers of the root operators." But 0.3a needs `M` to be stable under all of `U_ℤ`, which also contains the binomials `C(E_{aa}, k)`, and the bound fails without them.

Here is a counterexample in the setting of 0.3a. Take `N = 2` and `W = K·w₀ ⊕ K·w₁`, with `𝔤𝔩_2` acting by `0` on `w₀` and by the trace on `w₁`. The weights are `(0, 0)` and `(1, 1)`, so `L = 0`. Let `M = O·(w₀ + w₁) + O·p^k·w₁`, a full lattice. Every `E_{ab}^{(m)}` with `a ≠ b` and `m ≥ 1` is zero on `W`, so `M` is stable under all of them. Yet `Inv(M)` contains `w₀`, and `p^j·w₀ ∈ M` only when `j ≥ k`. The exponent of 0.3a is `⌊log_p 1⌋ = 0`, and no exponent independent of `k` works. In 0.3a itself `M` is not `U_ℤ`-stable, since `E_{00}(w₀ + w₁) = w₁ ∉ M`, so 0.3a stands.

The fix is to write "any lattice stable under the Kostant form (the divided powers of the root operators and the binomials `C(E_{aa}, k)`)", or "any `U_ℤ`-stable lattice".

## Previous review's findings

- R01 — repaired. `Suggested.lean` now states the sandwich exponent: "`Suggested.lean` states (b) … as `pow_smul_dualWeylLattice_le_smul_weylLattice`, and the global form of (c) as `lcm_pow_smul_dualWeylLattice_le_smul_weylLattice`". It also states the block cut in both forms and the block-first Pieri bound.
- R02 — repaired. Each item now carries its formal-proof locator, for example "SSBasis (`Formalism/GradedWeylDivisibility/StatementD.lean`)". 2.1 (e) has a route through ReductiveGroups §10B, and 3.3 cites SlopeE with its file.
- R03 — repaired. The Check now reads "`c_W = (q + 2j)(h − 1)/(ℓ − 1) + e_cl + κ₀(x_p − x_m)/ℓ`; the last term is `0` in rank two but not in general", and the `GL_4` instance gives `12/7`.

## Deferred findings

- D01 — stands

## C01 — `Suggested.lean` states the block cut and the block-first Pieri bound over discrete valuation rings, not "over every `O` as in 2.1 (a)"

README lines 198 and 243, and the Lean docstrings at lines 167 and 229, say these are stated over every `O` as in 2.1 (a). That `O` is any integral domain containing `ℤ_(ℓ)` in which `ℓ` is not a unit. The Lean binds `[IsDiscreteValuationRing O] [CharZero O] [CharP (IsLocalRing.ResidueField O) ℓ]`, which is narrower. By 2.1 (a), both forms are equivalent to the form over `ℤ_(ℓ)`, so nothing false follows. The phrase would read "over every discrete valuation ring of characteristic `0` and residue characteristic `ℓ`"; the alternative is to widen the binders.

## C02 — `normalizedWeight` restates a Tau Ceti definition

`TauCeti.DominantWeight.detShiftShape` (`TauCeti/RepresentationTheory/ClassicalGroups/DominantWeight.lean:255`) is the Young diagram of `λ⁰`. Its `rowLen_detShiftShape` (line 258) is exactly `(λ_i − λ_{N−1}).toNat`. That module is already a dependency of the imported `WeylDimension.Basic`, and the file already passes `⟨lam, hlam⟩` as a `TauCeti.DominantWeight`. The docstring of `normalizedWeight` would cite it, or the file could use it, at the cost of giving the lattice definitions dominant weights.

## C03 — 3.4 names no source

3.4 has neither a formal-proof locator nor a sentence saying the roadmap derives it; the References entry for the formal proof stops at 3.3. Its route is complete, so the statement is supported. Would add the locator if the formal proof states it. Otherwise, one clause saying the bound is derived in the route would do, as 3.2 says of its other clauses.

## N01 — The heading of 2.1 (line 184) calls `ex(λ, ℓ)` "the exchange exponent", a term used nowhere else; the Layer 2 guide (line 9) and the Scope (line 375) call it "the exact exponent".

## Questions for the author

- Five statement names cited from the formal proof do not occur in the exported environment of the proof that I could read: BranchIsometry (1.1), SandwichModel (0.3), ExZEqO and TensorReal (2.1 (a)), and LemmaD (2.2 (a)). Their modules exist, and the neighbouring names of the same items do occur: XiNorm, SandwichLocal, ExZSpec, LemmaDGraded and LemmaDLast. Are these the names at commit `8c90877ce`? I could not decide, because the export may hold only what the final theorems use.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 0.1 basis, saturation | 10 `GL_3` weights, 176 weight spaces | all bideterminants: Smith invariants all `1`; ranks = #SSYT = Weyl dim (`(2,1,0)`: 9 fillings, 8, 8, 8) | holds |
| 0.1 vs Lean `dualWeylLattice` | 228 weights | kernel of column derivations has the dimension of `Δ_ℚ` in every weight space | holds |
| 0.3a step projector | `N = 2`, spin `j ≤ 7` | `Σ_q(−1)^q C(j+q,q)C(j,q)/(q+1)` = `1, 0, 0, 0, 0, 0, 0, 0` | holds |
| 0.3a `End(K²)` | `p = 2` | `Inv(e_00) = id/2`; exponent `⌊log_2 2⌋ = 1`, attained | holds |
| 0.3 (b), Lean local | 228 cases: `GL_2` (`λ_0 ≤ 12`), `GL_3` (`λ_0 ≤ 6`), `GL_4` (`|λ⁰| ≤ 6`), `p ≤ 7` | least exponent ≤ `e − v_p(dim)` always; `(6,3,0)`, 3: `3 = e`; `(5,2,0)`, 3: `2 = 3 − 1` | holds |
| 0.3 (c), Lean global | `GL_2`, `a ≤ 40` | `max_i v_p C(a,i) = ⌊log_p(a+1)⌋ − v_p(a+1)`; `lcm_i C(a,i)·(a+1) = lcm(1..a+1)` | holds |
| 0.3 Check, divided powers | `(4,0)`, `p = 2` | divided indices `1,4,6,4,1` (product 96); undivided index 24 at `(0,4)` | holds |
| 0.2 lowest alcove | `(4,2,0)`, `(2,1,0)` at 3; `(p−1,0)` | least exponents `0` and `1` (index 3); `C(p−1,i)` prime to `p` | holds |
| Duality `Δ = ∇^∨` | 9 weights, 215 weight spaces | `det Gram(Δ_μ) = [∇_μ:Δ_μ]` throughout; totals 2, 9, 3, 8, 4096, 4096, 819200000000, 54481006265625, 4 | holds |
| 1.1 (a), (d), Lean `c_Br` | 506 interlacing pairs, `m ≤ 4` | `c_Br ≠ 0`, bound holds; `(3,1,0)/(2,0)`: 4; `(3,1,0)/(3,0)`: −36; `(4,2,0)/(4,0)`: 576; `(1⁵,0)/(1⁵)`: −120 ≤ 3125 | holds |
| 1.1 (a) statability | probe copy of the file | integral branching map and `⟨ξ,ξ⟩_F ≤ dim·⟨v,v⟩_F` elaborate, `sorry` only | statable (R01) |
| 2.1 (b), Lean local and global | 924 (weight, cut, `ℓ`) cases | no violation; 246 equalities; `(6,3,0)`, `ℓ = 3`: both cuts give `3 = ex` | holds |
| 2.1 (d) Check | `(3,0)/(2,1)`, `(2,0)/(1,1)` mod 3 | `{0,2} = {2,0}`; `{2,2} ≠ {1,0}` | holds |
| 2.2 (a) graded, Lean (definitions transcribed) | 656,751 (`λ, ℓ, ξ, i′, μ`) | exponent ≤ `e_L + v_ℓ(D)` always; 51,056 equalities | holds |
| 2.2 Checks | `(w,2,0)`, `3 ≤ w ≤ 9`; `(w,1,1)` | `[1,8],[2,10],[1,36],[2,28],[1,80],[2,54],[1,140]`; index `w − 1 = D` | holds |
| 2.2 (b) corollary | 900 cases | `ex((λ₂,w^r)) ≤ ex(λ₂) + ⌊r(λ₂(0)−w+q−1)/(ℓ−1)⌋` always | holds |
| 2.2 (c) | 3,157,572 instances, `GL_2`–`GL_4`, `ℓ ≤ 7`, `h < ℓ²` | no exponent above `⌊c_W⌋`; `GL_4` `(2,1,0,0)`, `κ₀ = 3`, `ℓ = 7`: `c_W = 12/7` | holds |
| 3.1, 3.2 (a), Lean | 40 weights, `N ≤ 4` | `‖v_λ‖²_F = H(λ⁰)`; both bounds hold; `(3,2,1,0)`: `45 = 45` | holds |
| 3.2 `c_λ` Check | `(1,1,0)`, `(2,1,0)`, `(2,2,0)`, `(2,0)` | `2, 3/2, 3, 1` | holds |
| 3.2 (c) | `(2,0)` | `μ(Δ) = −(log 2)/3 ∈ [−1.386, 0]`; `log 2 ≤ μ_max(∇) ≤ 2 log 2` | holds |
| 3.3 | `ν = 1`, `R = 1`; `ν = 2` | both sides `0`; `0 ≤ 8f·log 2` | holds on instances |
| 3.4 Check | `k = 1`, ideal `𝔞`, twist `s` | both sides `s·log N(𝔞)`; opposite sign gives `−s·log N(𝔞)` | holds |
| Summary on 0.3a (R02) | `W` = trivial ⊕ det, `M = O(w₀+w₁) + O p^k w₁` | `M` stable under all `E_{ab}^{(m)}`; `Inv(M) ∋ w₀` needs `p^k`; formula gives `p^0` | false as stated |
| Lean `O` generality (C01) | 2.1 (b), 2.2 (a) | README: every domain as in 2.1 (a); Lean: DVR, char 0, residue char `ℓ` | narrower |
| `normalizedWeight` (C02) | Tau Ceti `DominantWeight.lean:258` | `rowLen_detShiftShape i = (λ_i − λ_{N−1}).toNat` = `normalizedWeight` | duplicate |
| Headline 4 statability | docstring | slopes need SlopesOfHermitianVectorBundles' carriers, owned by that open roadmap | accepted |

- Source locators: 28 of 28 cited formal-proof modules found in the operator-held build manifest; 31 of 36 cited statement names found in its export (statements compiled, not readable); Jantzen's three locators not available.
- Tau Ceti at the pin: `weylDimension` (`WeylDimension/Basic.lean:180`), `DominantWeight` (`DominantWeight.lean:85`, `detShiftShape` 255), `hookLength` (`HookLength/Basic.lean:138`), the beta-number identity (`BetaNumbers.lean:241`), `kostantForm` (`Kostant/Form.lean:125`), complete reducibility (`CompleteReducibility.lean:107`), Pieri (`Pieri.lean:393`), Cauchy (`Cauchy.lean:71`), `eval_one_diagramSchurPoly_eq_card_boundedSSYT` (`Schur/Basic.lean:216`), `weylModuleOfShape` (`WeylModule/Basic.lean:431`), `highestWeightLattice` (`HighestWeight/Lattice.lean:54`).
- Cross-roadmap citations resolved, 23: on main ReductiveGroups §§9A, 10B, 10D, ClassicalGroups §0.4, Layer 3, §§4.1, 4.2, 5.1, 6.1, 6.6, GroebnerGeometry G5, SchurWeyl Layers 0, 5, 7, CompactGroups §4.1; at open heads SlopesOfHermitianVectorBundles §§1.2, 1.3, 1.7, 2.1, 2.2, 2.4 (b), 3.5, HermitianFormsAndLattices §4.0. Consumer citations in five open family roadmaps match Downstream consumers.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`; no other change outside the folder besides the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings and nothing else; the elaborated types of all 22 declarations match the README, with no binder lost.
- One-tactic probe: `simp`, `decide`, `positivity`, `norm_num`, `omega`, `rfl`, `infer_instance` close none of the 7 theorems.
- Computations: an independent model, with `∇` as the kernel of the column derivations and `Δ` as the closure of `v_λ` under the divided row operators, gave the values above.
- None of the 22 `Suggested.lean` names occurs in the formal proof's export.

Overlap check: read ClassicalGroups, SchurWeyl and TensorProductCombinatorics on main, and GluedTargetAndDivisionInequality, LocalGainOfThetaChains and ThetaChainsOnDefiniteUnitaryGroups at their open heads. The Capelli generators are owned by ClassicalGroups §6.6, and hook lengths, Pieri and Cauchy by SchurWeyl and Tau Ceti; both are cited here. `∇_ℤ(λ)`, `Δ_ℤ(λ)`, the sandwich exponent, integral branching and the hook-product Fischer norm are owned here and cited by the three open roadmaps. ThetaChainsOnDefiniteUnitaryGroups §3.1 restates the two lattices, and the repair belongs to that roadmap. No other open roadmap's `Suggested.lean` defines these objects.

Source independence: 6 passages compared with 1 readable source (the announcement): the Summary, the routes of 0.3a and 2.1 (e), the statements of 1.1 and 2.2, and the module docstring; none shared. Largest share: the formal proof, 36 of 39 named locators. Its prose is readable only as compiled declarations, so wording was not compared with it. Contents compared with its module tree: independent. Layer 0 draws on modules under `GradedWeylDivisibility`, `ThetaLogCoordinates` and `SharpRestriction`, Layer 2 on `PieriBlockIdeals` and `Development/AbelianVarietyTheory`, and Layer 3 on `PeriodIntegrals` and `Development/AbelianVarietyTheory`.

Research link: Layers 0–3 supply the integral Weyl lattices, branching maps, exponents and slopes that the family's theta-chain roadmaps use for iterated theta lifts between definite unitary groups, their norms and divisibility, and Bost's slope inequality (Alpöge, announcement, 2026, p. 4, items 8, 9, 13). Classical setting: Kostant 1966, Carter–Lusztig 1974. Rests on the README and the announcement.

## Not verifiable

- The content of every cited formal-proof statement: the operator-held copy is a compiled export; modules (28/28) and names (31/36) were checked instead.
- Doubilet–Rota–Stein 1974, De Concini–Eisenbud–Procesi 1980, Kostant 1966, Green 1980, Asherova–Smirnov–Tolstoy 1971, Zhelobenko 1973, Gelfand–Tsetlin 1950, Capelli 1887, Howe–Umeda 1991, Molev 2006, Carter–Lusztig 1974, Donkin 1985, Mathieu 1990, Arakawa–Suzuki 1998, Okounkov–Vershik 1996, Macdonald 1995, Frame–Robinson–Thrall 1954: cited as attributions without locators. The statements were checked by computation.
- Jantzen II.5.6, II.8, II.6: the book is not legally available online. II.5.6 is cited only for the closed-alcove form, which is not stated.
- 3.3: the route stops after the reduction to one summand, and the bound rests on SlopeE (compiled only); checked on two instances.

## Source issues

- none

## For the human reviewers

- Scope: 0.3a, 0.3, 1.1, 2.1 (a), (b), (d), (e), 2.2 and 3.1–3.3 take as their source one Lean formalization announced on 20 November 2026 (README References, last two entries; announcement p. 2: the author chose to present only Lean). It is unpublished and unrefereed.
- Licence: the formal proof's repository could not be read through the sources service, and its licence was not read; the operator-held copy is a compiled export.
- Not tested: the formal proof, which has 36 of 39 named locators, is readable only as compiled declarations. Wording was not compared with it; only its module tree and declaration names were.
