# Review of CongruenceModulesOfThetaLifts (pull request #2921 at 2d0d9be)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** needs changes

**Summary.** Changes are needed, for one P2 finding: weight elimination (7.16, headline (4)) asks each block character `χ_s` to have Hodge–Tate weight `h − bot_τ − s` at `τ∘c`, which the block characters of the chain, `χ_1·χ_cyc^{−(c−1)}`, do not have once `t ≥ 2`, so 7.16a (2)–(3) cannot invoke 7.16 as written. Everything else I computed or read at its locator holds, including all 94 locators into [FormalProof] and the supplier sections behind 7.7b, 7.8, 7.10a, 7.11, 7.15 and 7.16a. There are one small correction and four format notes, none blocking. The human reviewers have a scope question and a licence question about [FormalProof].

## R01 (P2) — 7.16 gives the block characters the weights `h − bot_τ − s` at `τ∘c`; the characters of the chain have `h − bot_τ − (t − 1 − s)` there, so 7.16 as stated does not apply in 7.16a

An implementer who proves 7.16 as written obtains a theorem that 7.16a (2) and (3) cannot use: the hypothesis of the statement (lines 1511–1514) reads "`χ_s` crystalline characters of Hodge–Tate weight `bot_τ + s` at `τ` and `h − bot_τ − s` at `τ∘c`", for one labelling `s` of the characters. Then `χ_{s+1}/χ_s` has weight `+1` at `τ` and `−1` at `τ∘c`.

The block of a lifted point is `χ_c = χ_1·χ_cyc^{−(c−1)}` (7.5 (1), line 456), so after the twist of 7.16a (3) the character `χ_s` (`s = c − 1`) has weight `(weight of χ_0) + s` at every embedding: `bot_τ + s` at `τ`, and at `τ∘c` the number `a + s` with `a` independent of `s`. The stated hypothesis would need `a + s = h − bot_τ − s` for `s = 0` and `s = 1` at once, which is impossible; as sets the two blocks agree exactly when `a = h − bot_τ − (t − 1)`, and then `χ_s` has weight `h − bot_τ − (t − 1 − s)` at `τ∘c`. Since `t ≥ r + 5`, the case `t = 1`, where the two readings coincide (and where the Check (ii) lives), never occurs on the chain. [FormalProof] has the increasing labelling at every embedding: in `Formalism/PieriBlockIdeals/LatticeInclusionRealSettingAlt.lean` (`LatticeLink`) the weights of the characters are `botJ i + s` for every embedding `i`, and in `Formalism/PieriBlockIdeals/MultiplicityZeroThickEmbedding.lean` (`Labels.Refl`) the bottom at the conjugate embedding is `h − (bot i + t − 1)`. The route of 7.16 uses only the block as a set at each embedding (the multiset matching and the sum over `s` in the principal minor), so it proves the corrected statement.

Write the hypothesis as: "`χ_s` crystalline characters of Hodge–Tate weight `bot_τ + s` at `τ` and `h − bot_τ − (t − 1) + s` at `τ∘c`" (equivalently: at every embedding the weights of `χ_0, …, χ_{t−1}` are the block there, in increasing order, the block at `τ∘c` being `{h − bot_τ − t + 1, …, h − bot_τ}`). The Check (ii) and the Summary's headline (4) need no change.

## C01 — 7.10c says [FormalProof] states the sum as `D_0·(C·f·m·b·L² + V(E, t))`; its statement has a further term, as the route of 7.11 says, and neither 7.10c nor 7.11 names the declaration

At 7.10c (lines 1328–1330) the text calls `Σ_𝔭 ϱ(𝔭)e_𝔭η^{P_0}_j(𝔭) ≤ D_0·( C·f·m·b·L² + V(E, t) )` "the form in which [FormalProof] states the sum". The statement there is `Formalism.MainNotions.TwistedPlaces.aux₃` in `Development/AutomorphicArithmetic/ResidueCharacters/TwistedPlaces.lean`: its bracket is `C·(f·m·b·L² + (log x)²·N_c) + V(E, t)`. The route of 7.11 (lines 1389–1393) describes this correctly, so the two passages disagree, and a reader of 7.10c alone is told the wrong form. The inequality of 7.10c itself is the roadmap's own and its route supports it.

In 7.10c, say that [FormalProof] states the base-level sum with the further term `(log x)²·N_c` in the bracket, and give the locator above there (7.10c has a locator only for `log w_{tr}(E)`, and 7.11 has none).

## N01 — In the route of 7.10c the letter `o` stands for two numbers in one sentence

At lines 1346–1350, `o` is first the order of `ℓ` in `(ℤ/2^{n+2})^×/{±1}` ("`ℓ^o ≡ ±1` for some `o ≤ 4L_th`") and then the degree `[ℚ(ψ):ℚ]` ("`2^n·o`", "`o ≤ x^{ε/100}`"). A second letter for the degree would remove the clash.

## N02 — 7.15 attributes `Σ_{𝔭|ℓ} ϱ(𝔭)e_𝔭 = log ℓ` to the product formula

At line 1459 the sum of `e_𝔭·v_ℓ(N)` over the places above `ℓ` is `v_ℓ(N)·log ℓ` because `Σ_{𝔭|ℓ} e_𝔭f_𝔭 = [𝕃:ℚ]` (Check (i) of 7.10c), not by the product formula.

## N03 — The Conventions say the mathematics "follows a complete formal proof"

At line 112. The layers are organised by the roadmap's own dependencies and no section mirrors a directory of [FormalProof], so nothing is wrong with the plan; "every target states what [FormalProof] establishes" already says what is meant, and the first clause would read better as "The statements of this roadmap are those established by a complete formal proof".

## N04 — 7.11 applies UniformWildKernelBounds §7.6 with `κ = C_t`, and §7.6 asks `κ ≥ 1`

At line 1385. ThetaChainsOnDefiniteUnitaryGroups §2.1 lists `C_t` among its constants without the bound `C_t ≥ 1`; "with `κ = max(1, C_t)`" covers every case.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| 7.1 definition and Check | `𝕋 = M = {(a,b) : a ≡ b mod ℓⁿ}`, first point; split `M` | `e_YM = O`, `M ∩ V_good = ℓⁿO`: `η = n`; split: `0` / same; `etaLoc` is `MtUp/MtLow` | holds |
| 7.1 (2)–(4) | cut `Z′ = Z_good ∩ X_𝔪`, `Z_good ∪ (X_𝔪∖X_s)` | relative ideal vanishes on `X_s∖Z` since `Z ∩ X_s ⊂ Z_good`; level part: larger ideal, smaller valuation | holds |
| 7.4 (1), (4) | rank one; `κ = −w₀λ` | root `β = BC(Π)_w(ϖ)^{−1}`; `{i−1−λ_i} = {κ_a + n − a}` under `i = n+1−a` | holds |
| 7.5 (1) | twists in rank `n = r + t` | `−(n−r)/2 = −t/2`; `(t−1)/2 − (c−1) − (n−1)/2 = −r/2 − (c−1)`; `χ_cχ_1^{−1}` of weight `c − 1` | holds |
| 7.5a (a)(i) | `m = r + 2t`, `n = r + t` | `m′ = 2n − m = r`, `m > m′ > 0`; GQT Theorem 7.3 (i) allows `r′ ≥ 0`, coefficient `B_0` or `B_{−1}` | holds |
| 7.5b | dimension count | `dim V_x ≤ dim part = dim image ≤ dim V_x`; formal `r + 5 ≤ t` gives `t > r` | holds |
| 7.9 (a) | `N = 6, 7, 8, 9, 10`; invariant subspace of dimension `a` | primes in `(N/2, N−3]`: none, none, 5, 5, 7; block count `1` or `N`; pinned Jordan needs `p + 3 ≤ N` | holds |
| 7.9 (b)(2) | `H⁰, H¹, H²` at `w ∤ ℓ` | no eigenvalue `1` of `ς_w` on module and on dual(1); Euler characteristic `0` | holds |
| 7.6 (a) | window count; formal window | `2(Sc+2η_s+2σ⁺+4)+1 = 2Sc+4η_s+4σ⁺+9`; formal window `[W−η−2σ⁺−3, W+Sc+2η+2σ⁺+4]` is inside | holds (README set larger) |
| 7.7a `v_δ`, Check (i) | `ℓ = 3, t = 3, s₀ = 1`; `ℓ = 5, t = 4`, `χ ≡ 2` | `v_δ = 2`; `1 − 2^{−2} ≡ 0 (3)`; `−2, −3, −1 (5)`; formal `vdel = Σ_{0<k<t}(s0 + v_ℓ(k))` | holds |
| 7.7b (i), (ii) | supplier §1.8e (2); formal `localErrorBoundDecomposition` | `t·Σ_Row(n_w+2)c_B + 4(r+t)(#Col+1)v_δ + t·#Col·h⁰` on both sides; kernels sum to `(1+j_w)e′ + (j_w+r+t+2)v_δ + h⁰` | holds |
| 7.7b cyclotomic level | `ℓ` odd, `ℓ = 2` | image of `1+ℓℤ_ℓ` of order `ℓ^a ≤ n_w`: `s_w = a+1` (`a+2`); `H⁰` length `s_w + v_ℓ(e)` | holds |
| 7.7c | formal `StarE` | `Bd ρ i π 0` for `ℓ > ℓ*`, `ℓ ∉ gset`, `ℓ ∉ exc`: defect `0` | holds |
| 7.7d | cokernel of `H¹_f(T₁) → H¹_f(T)` | rank `≤ n_u·m`, torsion `≤ h_ū`: `n_u·m·e′ + h_ū`; weights of `W^*(1)` at `ū`: `q − t > 0` | holds |
| 7.8 (1) (H5), (2) | `o_δ = 15`, `ℓ = 3, 5`, other | order 3: `ζ₃ − 1 ∣ 3`; order 5: `ζ₅² − 1 ∣ 5`; supplier §3.26 clause 3 with `ε′/(2t)` gives `t·Σ ≤ ε′/2` | holds |
| 7.8a | second half of (TB) | corank `n_w + [e=0]`; quotient `≤ s_w + v_ℓ(e+1) ≤ c_B`; total `(n_w+2)c_B`; formal `cB ≤ c·t·n·nV·L` | holds |
| 7.10a rows 1–6 | formal `admA`, `admB`, `MediumInertPrimeLengthBound`, `SmallPrimeLengthBound`, `midG`, `adm5` | row 2 `½Σ(2n_wm+1)e`; `jA = max 1 ⌈log_{ℓ−1} ℓ_A⌉`; `B = C·f·n·t²·nV·L²` with `n = \|A\|`; rows 5, 6 identical | holds |
| 7.10a row 4, both letters thick | supplier §4.10d (4) at `n = 2`, `H ≤ 2h` | `3r·e + 8m·e′ + 3(r·Sc + 2m((2h+1)/(ℓ−1)+1))`, `e ≤ 64h/ℓ² + 4Sc + 10η/(ℓ−1) + 25(1+log_ℓ 4h)` | holds |
| 7.10b | `v_ℓ(\|G₀\|)`, `ℓ = g_i` | `f·r(r−1)/2 + f·r(r+1) = f(3r²+r)/2 ≤ 2fr²`; `2f·(2r+2t)e_max = 4f(r+t)e_max`; formal `StarH` | holds |
| 7.10c | `ℓ*·B`; small-order primes | `D_* ≥ \|A\|t²(N_m+t)L²` gives `1.1ℓ*B ≤ C·f·m·b`; `M_* = 2^{n+2−a} ≥ 2^n/L_th` | holds; C01 on the description of the source |
| 7.11 (headline 1) | `B₀ = f·m·b·x^ε`, `L = x^ε` | `f·m·b·L² = x^ε·B₀`; `V ≤ exp(x^ε) = b ≤ x^ε·B₀`, so `κ_W = 1` | holds |
| 7.15 (a)–(c′), Check | `M = 𝒪²`, `ℓ = 2`, diagonal `Z` | `PM = 𝒪(1,1)/2`, `(PM)^∨ = 𝒪(1,1)`, `ℐ = 1 = e_𝔭η`; formal `jw_le`: `η + d·(𝔧 + v(DG) + v(s))` | holds |
| 7.16 (headline 4) | chain block `χ_1χ_cyc^{−(c−1)}`, `s = 0, 1` at `τ∘c` | README `h − bot_τ − s`; chain and formal `Labels.Refl`: `h − bot_τ − (t−1) + s` | R01 |
| 7.16 Check (ii) | `ℚ(i)`, `ℓ = 19`, `λ = (44,0)`, `μ = (25,19)` | shifted `{45,0} ≡ {26,19} ≡ {7,0}`; `κ = 3`; `mw = mw′ = 0`; `dp = 19 > 0`; `α^{19} ≡ β` mod 19 | holds |
| 7.16 carries | `o` unmatched carries | matched sums differ by `≤ (t−o)·o`, unmatched `≤ o·κ`: `≤ o(t+κ)`; formal `KapSum`: `mw·(t+2κ)` | holds |
| 7.16a (3) | `ℓ > h`; (b) | both branches give `0` (`ex = 0`); `30·(f/2)·m·b·x^{2ε} = 15x^εB₀`, `2mb ≤ x^εB₀`; formal `lJ`, `Excl`, `Jrec7` | holds |
| Headline 2 (7.8 (2)) | supplier §3.26 | `ν_s = v_ℓ(w_{tr}(E))` for rank `r`, integer `t`; `#Q ≤ 4R`; `R` independent of `ε′`, `A` | holds |
| Headline 3 (7.7b) | Summary against 7.7b, 7.7c | same four global terms; defects vanish for `ℓ > ℓ*`, `ℓ ∉ Exc` | holds |

- Source locators checked against the text: 94 of 94 into [FormalProof] (file and declaration exist); statements read for 7.1, 7.6, 7.7a–7.7c, 7.8a, 7.10a–7.10c, 7.15, 7.16, 7.16a; GanQiuTakeda2014 lines 1690–1709.
- Library declarations opened at the pins: `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` (`TauCeti/GroupTheory/Perm/Jordan.lean` line 154), `ContRepresentation.schur_orthogonality_self` (`TauCeti/RepresentationTheory/Compact/SchurOrthogonality.lean` line 104), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`).
- Cross-roadmap citations resolved: every citation resolves on main or at an open head; supplier statements read at LengthBoundsInPadicFamilies §1.8e, SelmerLengthBoundsAndLocalLifting §3.26, UniformWildKernelBounds §7.6, HermitianFormsAndLattices §§4.0a, 5.2, IntegralWeylModulesOfGeneralLinearGroups §2.2 (c), BernoulliBoundsForClassGroupEigenspaces §6.17, WachLatticesOverTheCyclotomicTower §6.11, RowTowerAndRallisIdentities §5.3 (iii), ThetaChainsOnDefiniteUnitaryGroups §§2.3c, 2.7.
- Dependency check: `depcheck: 171 roadmaps, 2003 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: no output (it declares nothing, so no `sorry` warning, no signature to compare and nothing for the one-tactic probe).
- `Suggested.lean`: four headlines named as not statable; the carriers (crystalline representations, Bloch–Kato classes, algebraic modular forms, congruence modules) are absent at both pins; Tau Ceti's Selmer structures are those of elliptic curves, as the docstring says.
- Pull request text: adds a roadmap, declares nothing in Lean, 15 family suppliers listed and all 15 appear in the supplier contracts; nothing the head contradicts.
- Duplication: nothing of 7.1–7.16a is stated by Mathlib, Tau Ceti or another roadmap; the general theorems are cited from their owners.

Overlap check: read GluedTargetAndDivisionInequality, SelmerLengthBoundsAndLocalLifting, ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, LengthBoundsInPadicFamilies, AutomorphicGaloisRepresentationsPartII, AutomorphicGaloisRepresentations, EndoscopicTransferAndUnitaryTraceComparison; nothing shared (congruence modules along an idempotent and the bound with defects: LengthBoundsInPadicFamilies; twist selection: SelmerLengthBoundsAndLocalLifting; twisting data: ThetaChainsOnDefiniteUnitaryGroups; §§7.12–7.14: GluedTargetAndDivisionInequality; the instances for the chain: this roadmap).

Source independence: 16 passages compared with 2 sources ([FormalProof], GanQiuTakeda2014), none shared (the formal source is Lean code, cited by path and declaration name only); largest share [FormalProof], 94 of 95 locators; contents compared with the directory tree of [FormalProof]: independent (one section draws on several directories, and one file serves 7.1, 7.10a and 7.10b).

Research link: The targets are the congruence-module, Ribet-type and weight-elimination inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), in the tradition of Ribet 1976, Hida 1981 and Bellaïche–Chenevier 2009, with Gan–Qiu–Takeda 2014 for 7.5a; README References and the sources read.

## Not verifiable

- The published works of the References (Ribet, Hida, Labesse, Chenevier–Harris, Caraiani, Bellaïche–Chenevier, Bloch–Kato and the others) are cited without locators and were not opened; no statement rests on them alone.
- The proofs inside [FormalProof] were not traced: only the statements at the locators were compared. In particular the sentence of 7.11 that the term `(log x)²·N_c` "is added only in its last step" was not checked.
- Check (ii) of 7.6 ("(P4) fails at every `ℓ`") and the position conditions (P2)–(P5) were not checked against WachLatticesOverTheCyclotomicTower §6.9 clause by clause.
- The size inequalities taken from ThetaChainsOnDefiniteUnitaryGroups §§2.1–2.3c (`h ≤ 2b`, `r ≥ 100`, `g_i > (kb)⁸`, `SizeDep`) were read where quoted, not rederived.

## Source issues

- none

## For the human reviewers

- **Scope.** 94 of the README's 95 source locators point to [FormalProof], a Lean repository announced on 20 November 2026 (README References); it is not a refereed publication, and the consumers of the headline bounds are roadmaps of the same family.
- **Licence.** The licence of the public repository of [FormalProof] was not established here; the README cites file paths and declaration names only and reproduces no text of it.
