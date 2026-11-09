# Review of LieHighestWeight (pull request #1797 at 2654a44)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

The worker's gate passes at this head (every check 0, build OK), and `lake env lean Suggested.lean` gives 11 `declaration uses sorry` warnings and nothing else. The findings below are about content. Two are blocking (P2). The first is targets that restate pinned theorems. The second is a headline route that cannot produce the lower bound it needs.

## R01 (P2) — Several targets restate theorems already pinned in Tau Ceti

- **Location:**
  - `README.md:544` (§2.2): "Prove that `μ ↦ dim Mμ` is invariant under the Weyl group directly".
  - `README.md:1294–1304` (§10.1): "define the coweight lattice `P∨ = Hom_ℤ(Q, ℤ)`", with bullets on the order of `P∨/Q∨` and the fundamental-coweight `ℤ`-basis.
  - `README.md:492–494` (§1.2): the fundamental-weight `ℤ`-basis.
  - `README.md:943–946` (Layer 8): "for each model… construct a split Cartan `H`".
- **Claim:** these sections plan, as open targets, results that the pinned Tau Ceti already proves. Each object then has two owners.
- **Witness:**
  - `TauCeti.finrank_weightSpace_weylGroup_smul` (`Weights/WeylInvariance.lean:342`) is §2.2's invariance, proved by the `sl₂` route.
  - `RootPairing.Base.coweightLatticeBasis` and `relIndex_corootSpan_coweightLattice` (`CoweightLattice/Basis.lean:113,144`) are §10.1's bullets.
  - `TauCeti.Octonion.lieBasis` (`Octonion/Simple.lean:175`) gives the Cartan data of `Der 𝕆`.
- **Repair:**
  - §2.2: replace "Prove …" by "Consume native `TauCeti.finrank_weightSpace_weylGroup_smul` (with `TauCeti.finrank_weightSpace_sub_apply_coroot_smul` for one reflection)".
  - §10.1:
    - Drop the second carrier `Hom_ℤ(Q, ℤ)`. The §10.2 headline uses the native `RootPairing.coweightLattice` (`CoweightLattice.lean:303`).
    - Consume the two declarations above for the first and third bullets.
    - Consume `TauCeti.DynkinType.rationalRootSystem` (`SimplyConnectedRootDatum/Rational.lean`) for the rational extension of the pinned datum.
    - Keep as targets only the extension of an arbitrary integral datum and the comparison with `TauCeti.integralWeightLattice H`.
  - §1.2: consume `TauCeti.span_cartanBasis_dualBasis_eq_integralWeightLattice` (`HighestWeight/Basis.lean:102`) with Mathlib's `LieAlgebra.exists_basis_of_base` (`Lie/Basis/Base.lean:211`). Keep only the transport to `base`.
  - Layer 8 introduction: scope "for each model" to Albert/`F₄` and the `E`-series. Add to *From Tau Ceti* the `Der 𝕆` data already pinned (`TauCeti.Octonion.cartanSubalgebra`, `TauCeti.Octonion.lieBasis`, `TauCeti.Octonion.instIsKillingDerivationLieAlgebra`, `Octonion/Simple.lean:94,175,537`).
  - Tested on `sl₃`: the native invariance gives the §2.2 Example (`α₂ ↔ α₁+α₂`, multiplicity `1 = 1`, and `2` at `0`). The native index gives the §10.1 Checks (`A₁`: 2, `A₂`: 3, `B₂`: 2, `G₂`: 1).

## R02 (P2) — The route to `finrank_e₆`, `finrank_e₇`, `finrank_e₈` has no lower bound

- **Location:** `README.md:1166–1171`: "Independently of the models, prove `finrank_e₆`… have dimensions `78 = 6 + 72`… *Needs:* §7.5; Mathlib `CartanMatrix.E₆`, `E₇`, `E₈`." Also `Suggested.lean:120–133`.
- **Claim:**
  - §7.5's spanning argument bounds `dim Matrix.ToLieAlgebra K (CartanMatrix.E 6)` only from above. §7.5's injectivity needs a given Killing-simple `L` of type `E₆`.
  - The route excludes the models ("Independently of the models") and names no such `L`. As written it cannot reach `≥ 78`.
  - The pins have the missing existence input, and the README cites none of it.
- **Witness:**
  - `TauCeti.DynkinType.serreLift : Matrix.ToLieAlgebra ℚ t.cartanMatrixᵀ →ₗ⁅ℚ⁆ t.lieAlgebra` is surjective (`SerrePresentation.lean:126,152`).
  - `DynkinType.lean:224` gives `.E6.cartanMatrix = CartanMatrix.E 6`.
  - Neither is cited, nor is Mathlib's `RootPairing.GeckConstruction.lieAlgebra` (`GeckConstruction/Basis.lean:51`).
- **Repair:**
  - Add to §8.5's *Needs*: Tau Ceti `TauCeti.DynkinType.lieAlgebra` with its Cartan `finrank_cartanSubalgebra` (rank) and `rootEquiv : Fin t.numRoots ≃ root`, and `TauCeti.DynkinType.serreLift_surjective`, which give `finrank_ℚ e₆ ℚ ≥ 6 + 72`. Also name the base change `K ⊗_ℚ Matrix.ToLieAlgebra ℚ A ≅ Matrix.ToLieAlgebra K A` as a target, since the pinned algebra is over `ℚ`.
  - Add `RootPairing.GeckConstruction.lieAlgebra`, `LieAlgebra.Basis` and `LieAlgebra.equivOfRootSystemEquiv` (the isomorphism theorem, `Basis/Base.lean:259`) to *From Mathlib*.
  - Replace "Independently of the models" by "independently of the Vinberg and Freudenthal models".
  - Check on `E₆`: `6 + 72 = 78` from the pinned Geck algebra, and Etingof Theorem 24.2(iv) at `EtingofLieGroupsLieAlgebras` line 4826.

## R03 (P3) — The Serre headline is narrower than its source and its own route

- **Location:** `Suggested.lean:77`: "`[LieAlgebra.IsSimple K L] {H : LieSubalgebra K L}`". `README.md:142–143`: "the indecomposable presentation adds `[LieAlgebra.IsSimple K L]`, and reducible systems are assembled componentwise".
- **Claim:** injectivity of `serreLift hS` holds for every Killing-semisimple `L`. The README plans the reducible case in prose (§7.5, "the direct sum of the simple ideals") but states the headline only for simple `L`.
- **Witness:**
  - For `L = sl₂ × sl₂` and `A = diag(2,2)`, `dim Matrix.ToLieAlgebra K A = 6 = dim L`, so `serreLift` is injective, but `[IsSimple]` excludes this case.
  - Etingof's proof of Theorem 24.2 starts from `g(R₁ ⊔ R₂) = g(R₁) ⊕ g(R₂)` (`EtingofLieGroupsLieAlgebras` line 4827).
- **Repair:** delete `[LieAlgebra.IsSimple K L]` from `serreLift_injective_of_base` and from the §7.5 and Conventions sentences. A scratch copy without the binder elaborates; no other binder depends on it. ReductiveGroups §9, which applies this theorem to "assemble[d] components", then gets the case it uses.

## R04 (P3) — `fundamentalAlcoveStabilizerToQuotient_bijective` is a corollary of pinned declarations

- **Location:** `Suggested.lean:155–164` and `README.md:1328–1332`: "Prove `fundamentalAlcoveStabilizerToQuotient_bijective`… The kernel is trivial because `W_aff` acts freely on alcoves."
- **Claim:** this is padding. It follows from four pinned declarations by the exact argument the README gives.
- **Witness:** a scratch file closes it in 7 lines with `RootPairing.fundamentalAlcoveStabilizerToQuotient_surjective`, `RootPairing.ker_fundamentalAlcoveStabilizerToQuotient`, `RootPairing.eq_one_of_mem_affineWeylGroup_of_mapsTo` and `RootPairing.fundamentalAlcove_nonempty`. It elaborates with no error at the pins.
- **Repair:**
  - Delete it from `Suggested.lean`.
  - In §10.2 and the Summary, record `Ω ≃ P∨/Q∨` as the combination of those four native results (prose, no backticked name of this roadmap's own).
  - Add it to the module docstring's list of headlines the pins already give.

## R05 (P3) — §0.2 says the pinned and the cited proofs of `sl₂` complete reducibility do not use a Casimir; both do

- **Location:** `README.md:452–454`: "`TauCeti.exists_isCompl_sl_fin_two`, proved by the weight-string and primitive-vector argument and therefore independent of the Casimir argument of Layer 5 (EtingofLieGroupsLieAlgebras Theorem 11.16(iv), p. 63)".
- **Claim:** the native proof and the cited proof both use the `sl₂` Casimir operator.
- **Witness:**
  - The module docstring of `TauCeti/Algebra/Lie/Sl2/CompleteReducibility.lean` says it uses "the concrete Casimir operator of `TauCeti/Algebra/Lie/Sl2/Casimir.lean`".
  - Etingof's proof of (iv) introduces `C = 2fe + h²/2 + h` (`EtingofLieGroupsLieAlgebras` lines 2558–2565, p. 64).
- **Repair:** write "proved with the Casimir operator of the triple, built from `h, e, f` alone and so independent of Layer 5's Killing-form Casimir (EtingofLieGroupsLieAlgebras Theorem 11.16(iv), p. 63; proof p. 64)".

## R06 (P3) — §8.3 claims independence of Layers 0–7 but routes the dimension `14` through §7.5

- **Location:**
  - `README.md:1028`: "This sublane is independent of Layers 0–7".
  - `README.md:1079–1080`: "has dimension `14`, from the base change and `g₂ToDerivationLieAlgebra_injective` at `K = ℂ`".
  - The Layer 8 Dependencies at line 1184 repeat this.
- **Claim:** the injectivity headline depends on §7.5. The dimension needs only the native count.
- **Witness:** `TauCeti/Algebra/Octonion/Derivation.lean:958` `TauCeti.Octonion.finrank_derivationLieAlgebra` gives `14` over any commutative ring with the strong rank condition, `ℂ` included.
- **Repair:**
  - Route the dimension through the base change `ℂ ⊗[ℝ] Der(A) ≅ Der(ℂ ⊗[ℝ] A)` and `TauCeti.Octonion.finrank_derivationLieAlgebra` at `ℂ`, and list that in the *Needs* line.
  - Keep `g₂ToDerivationLieAlgebra_injective` only for the identification with split `g₂`.
  - Correct the Dependencies sentence to match.

## R07 (P3) — The §8.4 determinant is cited to a source that gives no formula, over `ℂ`

- **Location:** `README.md:1096–1097`: "`det A = a0 a1 a2 − a0 N(x0) − … + T((x0 x1) x2)` (LandsbergManivelMagicSquare §1.3, p. 4, lines 140–153…)".
- **Claim:** the formula and its real setting are not at the locator.
- **Witness:** `LandsbergManivelMagicSquare` lines 136, 148 and 152–153 take `A = A_ℝ ⊗ ℂ` and diagonal entries in `ℂ`, and only say a cubic "determinant" exists. `BaezOctonions` line 1479 (§3.4, p. 32) states this formula for the real `h₃(𝕆)`.
- **Repair:** cite `BaezOctonions` §3.4, p. 32, line 1479 for the formula. Keep LandsbergManivelMagicSquare only for the Jordan product `½(AB + BA)` (line 151).

## R08 (P3) — The `B₂` Check of §10.3 miscomputes its wrong model

- **Location:** `README.md:1376–1377`: "a model ignoring orientation would give `Γ_root ≅ C₂` and `|Aut| = 4`".
- **Claim:** the unoriented affine diagram does not have 4 automorphisms.
- **Witness:** the affine diagram is the path `0 — 1 — 2`, middle node `1`. Unoriented, its automorphisms are `{id, (0 2)}` (order 2), and the stabilizer of `0` is trivial while unoriented `Γ_root ≅ C₂`.
- **Repair:** write "a model ignoring orientation would give `Γ_root ≅ C₂` while the stabilizer of the affine node in the unoriented `Aut` (order `2`) is trivial, so `Ω ⋊ Γ_root` (order `4`) is not `Aut`".

## R09 (P3) — Targets and claims with neither a locator nor a pinned name

- **Location:**
  - `README.md:480` (§1.1): "Package this as the root-space decomposition of `L`".
  - `README.md:745–751` (§6.1): the Grothendieck ring `R(L) → ℤ[P]^W` with basis `[L(λ)]`.
  - `README.md:786` (§6.2): the fixed-point form.
  - `README.md:1219–1221` (§9.2): "minimal dimension among modules with a cyclic highest weight vector".
  - `README.md:582–583` (§3.1): "consume the native triangular multiplication equivalence".
- **Claim:** each open target needs a locator, and each consumed native result needs its name.
- **Witness:** none of these sentences carries a parenthesized locator. The §3.1 native is `TauCeti.UniversalEnvelopingAlgebra.triangularMulEquiv`, named in `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:27`, and it is absent from *From Tau Ceti*.
- **Repair:**
  - Add a theorem-level locator to §1.1, §6.1, §6.2 and §9.2. For §6.1, Theorem 25.17 and Theorem 26.4 of `EtingofLieGroupsLieAlgebras` cover the basis and the image respectively.
  - Name `TauCeti.UniversalEnvelopingAlgebra.triangularMulEquiv` in §3.1 and in *From Tau Ceti*.

## R10 (P3) — The module docstring calls the zero-fibre Poisson bracket not statable

- **Location:** `Suggested.lean:45–47`: "the first-order Poisson bracket on the zero fibre… the pins have no Poisson-algebra structure on `SymmetricAlgebra`".
- **Claim:** the reason given is wrong. The pins have no Poisson class, but the bracket is statable as a bilinear map. The README Summary also does not count it among the end theorems.
- **Witness:** in a scratch file, `∃! B : SymmetricAlgebra R L →ₗ[R] SymmetricAlgebra R L →ₗ[R] SymmetricAlgebra R L` with Leibniz, alternation and `B (ι x) (ι y) = ι ⁅x, y⁆` elaborates under `import Mathlib`.
- **Repair:** remove this bullet from the docstring's list of non-statable headlines, since it is not an end theorem of the README.

## R11 (P3) — Layer 6F is dropped, and a roadmap on main cites it

- **Location:** `README.md:75–78`, which hands the Fourier boundary values to TensorProductCombinatorics §1.6 and §2.6 with no former-numbering line.
- **Witness:** main's `TauCetiRoadmap/TensorProductCombinatorics/README.md:76` reads "its Layer 6F is a consumer of §1.6", and line 2575 reads "LieHighestWeight Layer 6F consumes §1.6's localization…". Main's LieHighestWeight `README.md:870` is "### Layer 6F: Fourier boundary values of the Weyl formula".
- **Repair:** add one sentence to Scope and ownership: "The former Layer 6F (Fourier boundary values of the Weyl formula) is now TensorProductCombinatorics §§1.6 and 2.6; no section here consumes it."

## R12 (P3) — A conflicting open revision of this roadmap, with no stated order

This was raised before and has not been repaired.

- **Location:** this folder's `README.md` and `Suggested.lean`, which the open revision #1220 ("LieHighestWeight: tensor strings, reductive centers and opposition") also rewrites.
- **Witness:**
  - The overlap listing reports "#1220 and #1797 conflict in `README.md`, `Suggested.lean`".
  - #1220's head has its own §9.2 "Reductive enveloping centers".
  - This description never mentions #1220.
- **Repair:** say in the description which pull request rebases on the other. The order matters: AutomorphicFormsOnReductiveGroups' `gap:reductive-enveloping-centers` asks Layer 9 for the centres that only #1220 plans.

## Verified sound

**Gate and build.**
- The worker's gate passes (every check 0, build OK).
- `lake env lean Suggested.lean`: 0 errors, 11 sorry warnings.
- `#check @name` for all 11 theorems in one scratch file: each elaborated type matches its README statement. No binder is lost, and `[Invertible (2 : K)]` in the `F₄` headline is needed for `Mul (AlbertAlgebra K)` (`AlbertAlgebra/Basic.lean:243`).
- One-tactic probes: `simp` on `finrank_e₈` and on the compact `G₂` dimension makes no progress. `exact?` on the `G₂` injectivity finds only the sorried statement itself. Only R04 closes, and it takes 7 lines.

**Depcheck output.** `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)` (no UPWARD or CYCLE). The suppliers RootSystems and LieGroupoidsPoisson are on main.

**Seeded sample (all 15 targets).**
- Locators that agree with the text:
  - `EtingofLieGroupsLieAlgebras`: Theorem 11.16 (line 2516, p. 63), 11.18 (2597, p. 65), 13.1 (2787, p. 70), Cor. 13.7 (2827, p. 71), 18.8 (3704, p. 93), 20.10 (4049, p. 103), §21.6 (4325–4334, p. 109), 24.2 and 24.2(iv) (4818/4826, p. 122), 25.17 (5088, p. 128), 26.4 (5190, p. 131), Ex. 26.7 (5289/5294, p. 133).
  - `EtingofRepresentationsLieGroups`: Theorem 14.1 (3041, pp. 70–71).
  - `GuttDeformationQuantization`: slide 14, eq. (3) (905–913). Lines 915–920 with `B₁ = −1/2` give `x⋆y = xy + (ε/2)[x, y]`.
  - `SchaferNonassociative`: p. 28 (1022–1025) and p. 41 (1461–1465).
  - `BaezOctonions`: §2.2 eq. (2) (354, p. 8), §3.4 (1479–1481, p. 32), §4.1 (1601/1623, pp. 35–36), §4.2 (1779–1782, p. 39), §4.6 (2175, p. 49).
  - `LandsbergManivelMagicSquare`: §1.1 (66–79, p. 2) and §1.3 (154–169, p. 4).
  - `Stembridge2002LR`: Corollary (109, p. 3), `ν = ∅` (121).
  - `GarnierAlcoves`: §2.2 (362, printed p. 7), Prop.-Def. 2.2.1 (389, p. 8), Cor. 2.2.7 (642, p. 10).
- Exceptions: R05 (the §0.2 route claim) and R07 (the §8.4 locator).
- §5.1, §6.3, §7.4 and §9.2 consume natives. Their statements were opened at the pin: `vermaCentralCharacter_casimirElement` (`CentralCharacter/Basic.lean:232`), `freudenthal_multiplicity_formula` (`Freudenthal.lean:435`, factor `2` as in the README), `minuscule_pieri` (`Pieri.lean:154`), `glCasimir_smul_of_isGlHighestWeightVector` (`GeneralLinear/Casimir.lean:234`, scalar `Σ μᵢ(μᵢ + N − 1 − 2i)`).

**Adversarial table.**

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §0.2 Clebsch–Gordan | `V(1)⊗V(1)`, `V(2)⊗V(1)` | `4 = 3+1`; `6 = 4+2`. Etingof's `|m−n|+2i` gives the same set `{3,1}` | holds |
| §0.2 route | `sl₂` Casimir on `V(n)` | Etingof `C = n(n+2)/2`, native uses the triple's Casimir | R05 |
| §1.1 root-space decomposition | `sl₃` | `8 = 2 + 6` lines | holds; R09 |
| §1.2 Checks | `A₁`, `A₂`, `G₂`, `B₂` | `(ϖ/2)(α∨) = 1/2 ∉ ℤ`; `ρ(α₁∨) = 2−1 = 1`; `det = 3, 1, 2` | holds; R01 |
| §2.2 Weyl invariance | `sl₃` adjoint, `s₁` | `α₂ ↔ α₁+α₂`: `1 = 1`; `0`: `2 = 2` | holds; R01 |
| §4.1 classification | `sl₂`, `λ = 1/2`, `λ = n`; `A₂` | `M(1/2)` infinite-dimensional; `dim L(n) = n+1`; `dim L(ϖ₁+ϖ₂) = 8` | holds |
| §5.1 Casimir eigenvalue | `sl₂`, `κ(h,h)=8`, `κ(e,f)=4` | `C = h²/8 + (ef+fe)/4` on `v_n`: `n²/8+n/4`; `⟨α,α⟩ = 1/2`, `((n+1)²−1)/8`; both `n(n+2)/8` | holds |
| §5.2 complement | `V(1)⊗V(1)` | Casimir `1` on `V(2)`, `0` on `V(0)` | holds |
| §6.1 Checks | `sl₂` | `(e^ϖ+e^{−ϖ})² = e^{2ϖ}+2+e^{−2ϖ}`; unit char `1` vs zero module `0`; `[V(2)]` vs `3[V(0)]`, both dim `3` | holds; R09 |
| §6.2 Weyl, fixed point | `sl₂`, `λ = ϖ, 0`; `A₂` | `(e^ϖ+e^{−ϖ})(1−e^{−2ϖ}) = e^ϖ−e^{−3ϖ}`; sum `= e^ϖ+e^{−ϖ}`; `λ=0` gives `1`; dims `3,3,8,6,10` | holds |
| §6.3 toolkit, Pieri | `V(2)⊕V(0)⊕V(0)`; `λ=0, μ=ϖ` | multiplicities `1,0,2`, `3+0+2 = 5`; only `τ = ϖ` dominant, matching native `minuscule_pieri` | holds |
| §7.1 Harish-Chandra | `sl₂`, `Ω = h²+2h+4fe = 8C` | `t²+2t` invariant under `t↦−t−2`; `HC_lin = (t−1)²+2(t−1) = t²−1` invariant under `t↦−t`; `χ_n(Ω) = n(n+2)` | holds |
| §7.3 / §3.2 first order | ordered vs symmetric splitting | `B₁(x,y)=0`, `B₁(y,x)=−[x,y]`, difference `[x,y]`; symmetric `[x,y]/2 − (−[x,y]/2) = [x,y]` | holds |
| §3.2 `sl₂` Rees Check | `j(h)²+2ħj(h)+4j(f)j(e) = Ωt²` | `{h,·} = 4(2ef−2ef) = 0`; `{e,·} = −4he+4eh = 0`; `{f,·} = 4hf−4hf = 0` | holds |
| §7.4 Freudenthal | `V(n)`, `μ = n−2` | left `c((n+1)²−(n−1)²)/4·m = cnm`; right `2·(nc/2) = nc`; so `m = 1` | holds |
| §7.5 transpose | `B₂`, `A = [[2,−2],[−1,2]]`; `A₁` | `⁅h₁,e₂⁆ = A 2 1 e₂ = −e₂` (untransposed `−2e₂`), as in `isSerreSystem_coroot` (`b.cartanMatrixᵀ`); `3 = 3` | holds |
| `serreLift_injective_of_base` | `A₁`; `sl₂×sl₂` | `3 = 3`; `6 = 6`, injective, but excluded by `[IsSimple]` | R03 |
| `g₂ToDerivationLieAlgebra_injective` | char 0; char 3 | `14 = 2+12` (native finrank); char 3 excluded by `CharZero` (Schafer needs `≠ 3`) | holds |
| `nonempty_derivationAlbert_lieEquiv_f₄` | char 0 | `52 = 4+48` (native `finrank_derivationLieAlgebra`) | holds |
| compact `G₂` dim and Killing | split `g₂ ℝ` | `14`; split Killing signature `(8,6)` is not definite, so the definiteness Check separates the forms | holds; R06 |
| §8.2 Checks | `1`, `1+offDiag₀(1)` | `tr 1 = 3`, `det 1 = 1`; `1−N(1) = 0 = det[[1,0,0],[0,1,1],[0,1,1]]`; at `A = 1`, `6det = 27−27+6 = 6` | holds |
| §8.4 Checks | `offDiag₀(x)`, `P` | `A∘A = diag(0,N,N)`, trace `2‖x‖²`; `P∘P = P`, `tr P = 1` | holds; R07 |
| §8.5 Checks | Vinberg, `E₆`, `E₇` | `80+84+84 = 248`; `72+168 = 240`; `h = E₁₁−E₂₂` acts by `0` and `1`; `78 = 52+26`; `133 = 27+79+27`; `56` | holds |
| `finrank_e₆/₇/₈` | types `E₆–E₈` | `6+72 = 78`, `7+126 = 133`, `8+240 = 248`; the route gives `≤` only | R02 |
| §9.2 `gl₂` Casimir, staircase | `(1,0)`; `ν = (N−½,…,½)` | `μ₀(μ₀+1)+μ₁(μ₁−1) = 2`, and `ΣE_ijE_ji = 2I`; `C(ν−ε_t)−C(ν) = −3N+3+4t`, differences `4(t−s)` | holds |
| LR headline | `N=2`, `λ=μ=(1)`; drop each bound at `N=1`; `N=0` | `ν=(2)`: 1, `ν=(1,1)`: 1, as in `Sym²⊕Λ²`. Without `hnu` (`ν=(1,1)`): 1 vs `Hom(L(1),L(2)) = 0`. Without `hlam` (`λ=(1,1)`, `ν=(1)`): 0 vs 1. Without `hmu` (`μ=(1,1)`, `ν=(1)`): 0 vs 1. `N=0`: `1 = 1` | holds, every bound needed |
| `LRTableau` argument order | definition at the pin | `LRTableau inner outer μ` is shape `outer/inner` (`LittlewoodRichardson/Basic.lean:71`), so `LRTableau lam nu mu` is shape `ν/λ`, content `μ` | holds |
| `Ω ≃ P∨/Q∨` | `A₁, A₂, B₂, D₄, G₂` | `2, 3, 2, 4, 1` = `|det A|` (Garnier Table 1) | holds; R04 |
| `existsUnique_…ToPerm_mul` | `A₂`, `σ = (0 1)`; `A₁`, `σ = id`; non-spanning | `π(ω) = (0 1 2)`, `τ = (1 2)` fixes `0`; `(f*g)x = f(g x)`; `A₁` unique `(1, id)`; non-spanning excluded since `IsIrreducible` forces the coroots to span (`Irreducible.lean:148`) | holds |
| §10.1 Checks | `A₁, G₂, B₂, A₂` | `ℤ/2`, `1`, `ℤ/2`, `ℤ/3`; adjoint index `3` | holds; R01 |
| §10.3 Checks | `A_r, D₄, E₆, B₂` | `2(r+1)`, `24 = 4·6`, `6 = 3·2`; `B₂` unoriented `|Aut| = 2`, not `4` | R08 |

**Library declarations opened at the pins (37).**
- Mathlib:
  - `GeckConstruction/Basis.lean:51,105,109,125`.
  - `Algebra/Lie/Basis/Base.lean:211,259`.
  - `SerreConstruction.lean:152–158`.
  - `RootSystem/Irreducible.lean:148`.
  - `Lie/NonUnitalNonAssocAlgebra.lean:21` (Poisson algebras not defined).
- Tau Ceti:
  - Serre presentation: `Presentation/Serre.lean:256,507,601`; `Serre/Killing.lean` (`isSerreSystem_coroot`, `exists_isSerreSystem_of_base`).
  - Octonions: `Octonion/Serre.lean:267,397`; `Octonion/Simple.lean:94,175,335,343,515,537`; `Octonion/Derivation.lean:958`.
  - Albert algebra and derivations: `AlbertAlgebra/Basic.lean:243`; `AlbertAlgebra/Derivation/Finrank.lean:384`; `Lie/Derivation/Basic.lean:118,317`.
  - Littlewood–Richardson: `LittlewoodRichardson/Basic.lean:71`.
  - Alcoves: `ExtendedAffine/Alcove.lean:86,172,218`; `Affine/Alcove.lean:379`; `RootSystem/Alcove.lean:365`; `ExtendedAffine/Wall.lean:165,201`.
  - Coweight lattice: `CoweightLattice.lean:303`; `CoweightLattice/Basis.lean:113,144`.
  - Weights: `Weights/WeylInvariance.lean:342`; `HighestWeight/Basis.lean:102`.
  - Dynkin types: `SimplyConnectedRootDatum/SerrePresentation.lean:126,152,176`; `SimplyConnectedRootDatum/LieAlgebra/Basic.lean:135`; `DynkinType.lean:219`.
  - `sl₂`: `Sl2/CompleteReducibility.lean:149`.
  - Highest weight: `HighestWeight/CompleteReducibility.lean:259`; `Weights/Integrality.lean:202`; `Weyl/Dimension.lean:116`; `Weyl/Character.lean:324`.

**Cross-roadmap citations resolved (18).**
- On main:
  - ScatteringDiagrams §0.4 (`README.md:273`) and `exists_pbwSymmetrizationEquiv` (`Suggested.lean:85`).
  - TensorProductCombinatorics §1.6 (694) and §2.6 (1191).
  - CharacteristicClasses C5 (1344, anchor matches).
  - LieGroupoidsPoisson §G4.6A (1325). The sign is positive, as the README assumes.
  - RootSystems §2.1 (616), §3.1 (687), §4.2 (833), §5.1 (907), §5.2 (944).
  - LieGroups, ClassicalGroups, AdoIwasawa, ChevalleyGroups, SpinRepresentations, DGFloer and GroebnerGeometry.
  - HamiltonianReduction (under `SymplecticGeometry/`).
- At the open head of TangentialBordism: §9.1 (2627, anchor `#91-idempotent-cayley-plane-b36` matches) and §9.2 (2678).
- This README's "Names cited by other roadmaps" covers the compact Albert names that TangentialBordism, StringOrientation and DGFloer cite.

**Ownership.** `roadmaps grep` finds no other owner of `serreLift` injectivity: ChevalleyGroups specializes it as `DynkinType.serreLift_injective` and cites Layer 7. It also finds no other owner of the `Der 𝕆`/`Der J` identifications, of `Ω` or of the `gl_N` Littlewood–Richardson rule. FormalConnectionsOpers' alcove stabilizer and ReductiveGroupsPartII's alcove stability concern other settings.

## Not verifiable

- `HumphreysIntroLieAlgebras` §18.3 (cited for Serre's theorem): settled as uncertified in the manifest. It was cited by its locator and not read.
- The background references of the last References bullet (Serre, Fulton–Harris, Humphreys' Category O, Bourbaki, Jacobson, Goodman–Wallach, Dixmier, Molev) are cited by chapter only and carry no theorem claim. They were not opened.

## Source issues

- **Gap** in GarnierAlcoves at Corollary 2.2.7, printed p. 10: the source derives normality of `Ω` in `Aut(D̂)` and `Aut(D̂)/Ω ≅ Aut(D)` only from `Ω` acting on the extended diagram; it should argue that automorphisms send the affine node to special nodes, on which `Ω` acts simply transitively; affects the proof.
