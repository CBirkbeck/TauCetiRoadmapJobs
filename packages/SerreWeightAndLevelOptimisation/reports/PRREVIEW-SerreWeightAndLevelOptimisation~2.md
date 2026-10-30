# Review of SerreWeightAndLevelOptimisation (pull request #1013 at 5999164)

**Verdict:** accepted

Full review of `TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md` and `Suggested.lean` at head 5999164f. The gate passes every rule, the dependency check reports no problem, the targeted elaboration has `sorry` as its only warning (four declarations), and the fifteen sampled targets plus the four stated theorems match their sources at the cited locators. The two findings are P3. No P1 or P2.

**Repairs of the previous review (c9bed25), finding by finding.**

- R01 (P2, `HasFiniteFlatModel.of_isUnramified`): the README still cites `FiniteFlatGroupsAndIntegralPadicHodgeTheory:§§R07.1.2, R07.6.8 (HasFiniteFlatModel.of_isUnramified)` at line 87 and in §6.5 (line 1461), unchanged. The citation now resolves on the supplier side: FiniteFlatGroupsAndIntegralPadicHodgeTheory at its open head, §R07.6.8 "Finite flatness under unramified base change, finite extension and twisting", ends with "State `HasFiniteFlatModel.of_isUnramified`: a finite p-primary module with trivial inertia has the finite étale model of the residue-field Galois module" (its shown README line 8723), and §R07.1.2 "Finite étale group schemes over a connected base are π₁-modules" (line 670) carries the finite étale input. The contract's content ("finite étale models of unramified finite local Galois modules … finite étale ⇒ finite flat") is what those two sections state. Repaired by the supplier; not re-raised.
- R02 (P2, §4.7 absent from `Suggested.lean`): repaired. `weight_two_at_level_mul_prime` (lines 122–136) states Ribet, Report, Theorem 2.2 with `3 ≤ ℓ`, `¬ ℓ ∣ N`, `3 < ℓ ∨ 3 < N`, `2 ≤ w ∧ w ≤ ℓ + 1`, output `Eigenform (N * ℓ) 2` with `a₁ = 1`; README line 57 and §4.7 (line 1059) name it.
- R03 (P3, 67 anchors): repaired; `grep -c '<a id='` is 0 and the gate's `residue` rule passes.
- R04 (P3, Lean-style names and Check labels): repaired. §2.3, §3.13, §5.1, §6.6 now carry prose bullets ("The predicate itself: …", "The ideal itself: …", "The condition itself: …", "The data themselves: …"); the only backticked names of this roadmap's own are the six declared in `Suggested.lean` (lines 57, 529, 951, 971, 1059); no Check carries a label.
- R05 (P3, stale anchors): repaired; line 113 cites "AlgebraicModularFormsAndSerreWeights:§7.5, S-type and modularity predicates" and `ArisesFrom` without a `TauCeti.` prefix; line 125 cites "§R16.0.1"; §1.4's three *Needs:* lines (251, 269, 281) cite §7.5 by number.
- R06 (P3, weight one admitted): repaired; `strip_coefficient_prime_powers` has `(hw : 2 ≤ w)` and concludes `∃ w', 2 ≤ w' ∧ …` (lines 99, 104); §4.2 line 971 states the same.
- R07 (P3, Sharifi pages): repaired; lines 221, 223, 1754 now read pp. 43–44, 47, 47–48, 43–48.
- R08 (P3, Diamond not in References): repaired; References line 1732 records the proceedings volume, cited by locator only.
- R09 (P3, nonexistent roadmaps): repaired; line 17 says "a modularity-lifting roadmap in the defect-one direction", line 1714 lists the three as prospective consumers.
- R10 (P3, IKM Proposition 2.10 attribution): repaired; line 71 reads "the nodal-algebra test below, compared with IKM24 Proposition 2.10 and Example 2.11".

## R01 (P3) — §2.10's route ends with Mazur's principle at the auxiliary prime, but its *Needs:* omits §2.9 and §2.9 is worded too narrowly for that use

Location: `README.md` line 531 (§2.10 proof route: "… assume no descent at q. Compare monodromy/component lengths … Conclude lower-level support and lift its eigenvalues"), line 533 (*Needs:* §2.3, §2.4, §2.7, §2.8, §1.4, ModularCurvesPartII:§§15.1–15.8), line 507 (§2.9: "The independently proved §8 weight-two branch permits odd ℓ≥3 and tame character modulo M").

Claim: the Ribet §7 route proves §2.10 from the listed inputs.

Witness: ribet94 lines 1150–1153 (author p. 23): the indirect argument assumes ρ is not modular of level qM (q the auxiliary prime, p the removed prime), derives the contradiction, and "then Mazur's Principle (4.7) will enable us to deduce the desired conclusion that ρ is modular of level M". In this README's notation the contradiction yields level Mr at the auxiliary r, and the final step is §2.9 at r, which applies because r ≡ −1 (mod ℓ) with ℓ odd gives r ≢ 1, and ρ is unramified at r. Theorem 1.5 allows M divisible by ℓ, and the branch of §2.9 that covers that is Theorem 8.1 (ribet94 lines 1311–1313: weight two on Γ1(N)∩Γ0(q), N prime to q, no condition at ℓ), not a "tame character modulo M".

Repair: add §2.9 to §2.10's *Needs:* and one sentence to its route ("the contradiction shows occurrence at level Mr; §2.9 at r, where r ≡ −1 mod ℓ and ρ is unramified, gives level M"). In §2.9 replace "tame character modulo M" by "character modulo M, with M allowed to contain powers of ℓ (Theorem 8.1 requires only M prime to q)", and drop "using the prime-to-ℓ character normalisation of Ribet (4.7)" from the first sentence, since (4.7) states no such normalisation (ribet94 lines 532–535); the prime-to-ℓ normalisation belongs to the §4 discussion under ℓ ≥ 5 (lines 412–414). No cycle: §2.9 needs §1.4, §2.6, §2.1 and suppliers only.

## R02 (P3) — §3.3 cites Edixhoven §8 as the proof of Theorem 2.8

Location: `README.md` line 651 ("Theorem 2.8, author pp. 6–7; proof §8, author pp. 26–28. Mazur's p+1 boundary and the explicit p=2 adaptation").

Witness: edixhoven92 (author revision, cache page = author page) lines 217–227 state Theorem 2.8 on p. 6 and give the p = 2 adaptation there, referring the proof to Mazur–Ribet [22] §6 ("generalizes without problems to arbitrary ε"). Section 8, pp. 26–28 (lines 933–1012), is "Finiteness at p": Proposition 8.2 (the five equivalent finite-flat/peu-ramifié conditions) and Propositions 8.5–8.6; it does not prove Theorem 2.8.

Repair: "(Edixhoven, Theorem 2.8 and the p = 2 remark following it, author pp. 6–7; §8, Proposition 8.2, author pp. 26–27, for the finite/peu-ramifié equivalence used in the statement; the proof is Mazur–Ribet, Astérisque 196–197, §6)" and, if Mazur–Ribet is to be cited, add it to References by locator.

## Verified sound

**Gate, dependency check, build.** Worker gate at 5999164: every rule 0, `OK`. My rerun of the dependency check: `depcheck: 208 roadmaps, 1477 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line; the roadmap is at line 145 of the merge order, after every cited supplier (IntegralIwasawaTheory 24, ModularCurvesPartII 70, AlgebraicModularFormsAndSerreWeights 84, HilbertModularVarietiesAndShimuraCurves 142) and before its consumers (AutomorphicGaloisRepresentations 147, ClassicalSerreModularity 150, EllipticCurveModularity 151, PadicFamilies 153, GL2ModularityLifting 155). `lake env lean Suggested.lean` from the worktree: exit 0 in 3 s, four `declaration uses sorry` warnings (lines 74, 93, 108, 128), nothing else. `git diff --stat origin/main...HEAD` outside the folder: empty. `metadata.toml` is `topic = "math.NT"`. Imports: `import Mathlib` and `TauCeti.NumberTheory.ModularForms.Newforms.Eigenform` only; no `lemma`, `set_option`, `#eval`, `#print`; no sorry'd data.

**Lean signatures.** Scratch `SigCheck.lean` with `#check @` on all six declarations, elaborated against the built module: `UnramifiedAt` and `IsResidualEigenform` carry `[Field L] [NumberField L] [Field k]`; each of the four theorems carries `[hGalois : IsGalois ℚ L]` (through `include`), `[CharP k ℓ] [IsAlgClosed k]`, `[ρ.IsIrreducible]` and exactly the README's hypotheses (`3 ≤ ℓ`, `¬q ∣ M*ℓ`, `f.χ = 1`, `a₁ = 1`, `UnramifiedAt ρ q`; `3 ≤ ℓ`, `¬ℓ ∣ N`, `2 ≤ w`; `5 ≤ ℓ`, `2 ≤ w`, `hε`; `3 ≤ ℓ`, `¬ℓ ∣ N`, `3 < ℓ ∨ 3 < N`, `2 ≤ w ∧ w ≤ ℓ+1`). Nothing was lost to section variables; the README's generality equals the Lean's. Pinned carriers opened: `HeckeRing.GL2.Eigenform` (TauCeti `NumberTheory/ModularForms/Newforms/Eigenform.lean` lines 73–87: `extends CuspForm ((Gamma1 N).map (mapGL ℝ)) k`, `χ : (ZMod N)ˣ →* ℂˣ`, `mem_charSpace`, `eigenvalue : ℕ+ → ℂ`, `isEigen` at every positive index, `ne_zero`); `IsArithFrobAt` (`#print`: `(MulSemiringAction.toAlgHom R S σ).IsArithFrobAt Q`, so `σ x ≡ x^{#(ℤ/(r))}` mod `P`, arithmetic Frobenius `x ↦ x^r`, matching the Conventions' `det = ε(r) r^{k−1}`); `Ideal.inertia` (`(G) → Ideal α → Subgroup G`, the pointwise-trivial-mod-`P` subgroup, so `UnramifiedAt` is inertia vanishing); `MulChar.ofUnitHom`, `UpperHalfPlane.qExpansion`, `Representation.IsIrreducible` as in the previous review.

**One-tactic probe.** Copy of `Suggested.lean` with each `sorry` replaced by `first | (simp; done) | infer_instance | trivial | rfl`: all four theorems fail (four errors, one per declaration). No padding; both definitions have real bodies on native carriers.

**Sampled targets against the texts** (cache ids: ribet94 = cb7bc437, author pages = cache pages; edixhoven92 = c9d0bfb5 (OCR of the author `.ps.gz`), author pages = cache pages; cg18 = c0ba8de0 author pages; cg20 = fff30587 author pages; buzzard00 = 5732b127, printed page = cache page + 94; gross90 = 302ca2dd, printed = cache page + 444):

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | ribet94 (5.2) lines 707–711 (`ℓ ∤ N`, `2 ≤ k ≤ ℓ+1`, `m ∋ ℓ, η`), parabolic `Sym^{k−2}(ℤ_ℓ²)` lattice `L` lines 715–720, `X ↪ L` with torsion-free cokernel by Ihara, (5.3) lines 737–740, `U` matrix lines 727–732 | matches; injectivity and saturation are the imported Ihara input, as the README says |
| 2.7 | ribet94 (6.2)–(6.3) lines 889–896 (`0→Y_q→L_p→X_p→0`, swapped subscripts), `T_p, T_q` involutions on `J` lines 898–899, (7.2)–(7.3) lines 1175–1180 (localise at `m`, then reduce) | matches |
| 2.9 | ribet94 (4.7) lines 532–535 (`ℓ ≥ 5`, `p ≢ 1`, weight k on `Γ1(M)∩Γ0(p)`, unramified ⇒ `Γ1(M)`), note lines 544–546 (§8 needs only ℓ odd), Theorem 8.1 lines 1311–1313 (weight two, `Γ1(N)∩Γ0(q)`, N prime to q only) | matches except the wording in R01; `q ≢ 1 mod ℓ` forces the q-part of the nebentypus to be trivial (an ℓ-power-order character of `(ℤ/q)^×` with `ℓ ∤ q−1`), so "occurs at level Mq" is the same hypothesis |
| 2.11 | ribet94 (4.5) lines 499–506 (α ramified with unramified reduction ⇒ `α|I_p = ω^i`, `φ = ω^{−i}`, conductor `p² → p`), remark lines 507–510 | matches; the remark's case is empty (Source issues) |
| 2.12 | ribet94 (4.2) lines 394–395, (4.3) line 427 (`e = dim V^{I_p} − dim V_λ^{I_p}`), (4.4) lines 462–489 (principal series: `ℓ ≥ 5` and prime-to-ℓ ε assumed at lines 412–414) | matches, including the `ℓ ≥ 5`, `k ≥ 2` restriction on character replacement |
| 3.3 | edixhoven92 Theorem 2.8 lines 217–221 (type `(N,p+1,ε)`, irreducible, not `Ag` ⇒ `a_p² = ε(p)` and not finite at p), p = 2 remark lines 222–227; §8 Prop 8.2 lines 943–949 | matches; locator note R02 |
| 3.10 | cg18 lines 2586–2596 (`p+1 ≥ k(ρ) ≥ 2`, minimal among twists, `N* = N` if `k=2` else `Np`, `T ∋ T_p`, `p ≥ 3`), Theorem 4.8 lines 2597–2600, Remark 4.9 lines 2601–2606, Tate sequence lines 2620–2623 (`T_pG⁰` free of rank one over `T_m`, `T_pGᵉ = Hom(T_pG⁰, ℤ_p)`, after reducing to the unramified scalar case line 2624) | matches |
| 3.14a | cg20 Lemma 8.14 lines 2540–2552 (`X1(N)`, weight one over `F̄_p`, `α−β ≠ 0`, away-p ideal, Hasse power `A`, projection to the `U−β` nilpotent quotient), proof lines 2557–2600 (`U² − TU + ⟨p⟩ = 0`, `T = U + ⟨p⟩V` in weight one, `T = U` in higher weight, reduction to `UF = αF`, `VF = …`, smallest-exponent contradiction) | matches; the README's extra `αβ ≠ 0`, `N ≥ 5`, `p^h = 0` are the hypotheses its proof uses; misprint `VF = βF` recorded below |
| 4.2 | ribet94 Theorem 2.1 lines 177–178, "arises from" = weight `k ≥ 2` lines 168–169, Step 1 line 201 (`k ≥ 2`), Steps 1–4 lines 197–278 | matches `strip_coefficient_prime_powers` with `2 ≤ w` and `2 ≤ w'` |
| 4.4 | ribet94 Step 2 lines 212–232 (`G = L(1−i,ω^{−i})/2 + Σ…` of type `(i, ω^{−i})` on `Γ0(ℓ)`, negative v-order of the L-value by Kummer and von Staudt, `E = c^{−1}G ≡ 1`, `fE` on `Γ0(ℓ^r)∩Γ1(N)`) | matches; the README's `i ≥ 3` is its own choice within "positive integer" |
| 4.7 | ribet94 Theorem 2.2 lines 280–281 (`N` prime to ℓ, `2 ≤ k ≤ ℓ+1`, `ℓ > 3` or `N > 3` ⇒ `S_2(Γ1(Nℓ))`), Gross `N ≥ 4` lines 284–287; gross90 Prop 8.18 lines 1255–1266 (nonsplit example `N=11, p=3`), Prop 9.3 lines 1286–1291 (`ε_p = ω^{k−2}`, filtration `p+1` ⇒ `ε_p = 1`, line 1358–1363), `p ≥ 5` character prescription and the level-13 failure at `p = 2, 3` lines 1295–1302 | matches `weight_two_at_level_mul_prime` and §4.7's character remarks |
| 5.3 | buzzard00 Lemma 2.5 lines 351–353 (`q > 3`, `q ≡ 3 mod 4`, unramified, nonzero trace), Cor 2.6 proof lines 402–414 (odd-order M-character via Diamond Lemma 2.2, `χ′_q(−1) = 1` and `q ≡ 3 mod 4` ⇒ odd order ⇒ trivial, unramified-special excluded by nonzero trace, `a₂` preserved) | matches |
| 5.4 | buzzard00 Cor 2.7 lines 415–424 (`ψ(−1) = 1`, congruent, not `ℚ(i)`-induced, `a₂` preserved) | matches |
| 5.5 | buzzard00 proof of Theorem 2.8 lines 509–521 (even image order, `q ∤ 2Mp` with `ρ(Frob_q)` of order 2, trace 0, Ribet raising generalised by Lemma 2.3 to `Γ1(M)∩Γ0(pq)`, `a₂` preserved "contained in the proof"); Remark (b) lines 443–447 | matches |
| 5.9 | buzzard00 Theorem 3.2 lines 649–652, Remark lines 653–660 (Cor 2.7 gives Serre's character only when not `ℚ(i)`-induced and finite), proof lines 661–676 (`ℚ(i)` branch: odd-order lift, weight one of level `4N`, Prop 1.3; otherwise Prop 1.3(c), Theorem 3.1, Lemma 1.2) | matches |

Also checked while reading: ribet94 Theorem 1.5 route lines 1107–1123 (auxiliary `q ≡ −1`, `η = U² − 1`, Hecke algebra of `J0(pqM)` without multiplicity one) = §2.10 and §2.5; §7 Proposition 7.6 lines 1184–1194 (`dim Y_p/m = 2μ`, `dim L_p/m = 2λ`) = §2.8; buzzard00 Theorem 2.8 statement lines 426–433 and the unramified use at lines 496–498 = §5.6; Theorem 3.1's four cases lines 621–645 = §5.8; edixhoven92 Theorem 9.2 lines 1018–1029 = §5.2.

**Adversarial pass** (values on both sides):

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| `weight_two_at_level_mul_prime` | `ℓ = 3`, `N = 5` (`3 < N` branch), `k = 4 = ℓ+1`, `f = η(τ)⁴η(5τ)⁴` (5.4.a.a) | script `py/eta.py`: `a_p(f)` = −4, 6, 32, −38, 26, 100, −78, −50, −108, 266 and `a_p` of 15a = −1, 0, −4, −2, 2, 4, 0, −2, 0, −10 at p = 2, 7, …, 37; every difference ≡ 0 mod 3; `S_2(Γ1(15))` is one-dimensional, so 15a is the only possible witness | consistent with the theorem on this instance |
| same | `N = 4`, `ℓ = 3`: `S_2(Γ1(12)) = 0` | `dim S_k(Γ1(4)) = 0` for `k = 2, 3, 4` (genus 0, 3 cusps: `3(−1) + 1·3 = 0`; odd k: `−2 + ½·2 + 1·1 = 0`) | vacuous, consistent |
| same | `N = 1`, `ℓ = 5`: level 5 weight 2 | `S_k(SL₂(ℤ)) = 0` for `k ≤ 6` | vacuous, consistent |
| `ribet_level_lowering` | `M = 1` | no eigenform of level 1 weight 2, so the theorem says an irreducible `ρ̄_f` at prime level q is ramified at q (Theorem 1.5 with `M = 1`) | consistent |
| `strip_coefficient_prime_powers` | `r = 0` | `g = f`, `w' = w ≥ 2` | true |
| `congruent_nebentypus` | `N ≤ 2` | `(ZMod N)ˣ` trivial, `ε′ = f.χ = 1`, `g = f`; parity: `f.χ(−1) = (−1)^w`, `±1` distinct in `k` for `ℓ ≥ 5` ⇒ `ε′(−1) = (−1)^w` | consistent; parity derivable as §4.1 says |
| `IsResidualEigenform` | `ℓ = 0` | `N·0 = 0`, every `r ∣ 0`, predicate vacuous | junk value unreachable in the theorems: `CharP k ℓ` with `3 ≤ ℓ` forces ℓ prime |
| `UnramifiedAt` | `q = 0` | `span{0} = ⊥`, only `P = ⊥` lies over it, `inertia(⊥) = {σ : σx = x}` | vacuous, harmless |
| 2.3 | `ℓ = 5`, `diag(1,−1)` | trace 0, det `−1 ≡ 4`, `r ≡ 4` | matches Check |
| 2.4 Check (11a1, `ℓ = 7`, `q = 29`) | script | `a₂ = −2`, `a₂₉ = 0`; `(29+1)² = 900 ≡ 4`, `0 ≠ 4` in `F₇`; disc of `X²+2X+2` is `−4 ≡ 3`, a non-square mod 7 (squares 1, 2, 4) | matches |
| 2.5 | symbolic | `[[−1,T],[0,−1]]·[[q+1,T],[T,q+1]] = [[T²−q−1, qT],[−T, −q−1]] = U² − 1` with `U² = [[T²−q, qT],[−T, −q]]` | identity holds |
| 2.9 counting | `μ_ℓ × ℤ/ℓ` over `ℤ_ℓ`, ℓ odd, `W = μ_ℓ` | index ℓ; special-fibre points `1·ℓ = ℓ` | matches Check |
| 2.9 nebentypus | `q ≢ 1 mod ℓ` | q-part of ε has ℓ-power order (residually trivial) and order dividing `q − 1`, so is trivial | `Γ1(Mq)` = `Γ1(M)∩Γ0(q)` here |
| 2.11 | `α|I_q = ω_q^i`, `φ = ω_q^{−i}` | conductor `q² → q`; with ε of prime-to-ℓ order, `α²|I_q = ε χ̃^{k−2}|I_q = 1` and odd ℓ-power order ⇒ `α|I_q = 1`, case empty | matches (Source issues) |
| 2.12 | Swan 1, no invariants | `n_q = 2 + 1 = 3`; tame with 1-dim fixed space: 1 | matches Checks |
| 3.3 negative controls | supersingular `E[p]` over `ℤ_p^{nr}`; `μ₂` vs `ℤ/2` over `ℤ₂` | `p²` generic points, 1 special point, no multiplicative part; `μ₂`, `ℤ/2` same generic module, 1 vs 2 special points | matches |
| 3.10 | `T_m` non-Gorenstein | `Hom(T_m, ℤ_p)` not free of rank one; CG18 line 2623 asserts only `T_pGᵉ = Hom(T_pG⁰, ℤ_p)` | README's refusal of rank-two freeness is right |
| 3.14 socle | `F₇`, `α = 2`, `β = 3` | `⟨p⟩ = 6`, `T F = 5F`, `UF = 2F` ⇒ `6·VF = 3F` ⇒ `VF = 3·6 F = 4F = α⁻¹F`; `VF = 3F` would give `UVF = 6F ≠ F` | matches; cg20 misprint |
| 3.14a | `ℤ₂/8`, `A = E₄` | `240 ≡ 0` so `E₄ ≡ 1`; `2⁴ = 16 ≡ 0`; odd `n`: `n⁴ ≡ 1 mod 16` | matches |
| 4.3 | θ of order `ℓ^a`, `2t ≡ −1` | `ξ = θ^t`, `ξ² = θ^{−1}`; no solution at `ℓ = 2` | matches |
| 4.4 | `ℓ = 3`, `i = 4` | `ω^{−4} = 1`; `L(−3, 1 mod 3) = (1 − 3³)ζ(−3) = −26/120`; `c = −13/120`; `v₃(c) = −1` | matches Check |
| 4.6 | `ℓ = 5`, `E = E₄`, `a = 4` | `g = E − 625E(q⁵)`: q-coefficient 240, `v₅ = 1`; `g|W = 25E(q⁵) − 25E`: q-coefficient `−6000 = −2⁴·3·5³`, `v₅ = 3 = 1 + a/2` | matches |
| 4.7 characters | `k = 2`: `ω^0 = 1`; `k = ℓ+1`: `ω^{ℓ−1} = 1` | gross90 lines 1290, 1362 | matches Checks |
| 5.2a / 5.3 parity | `r ≡ 3 mod 4` | `v₂(r−1) = 1`, even character ⇒ odd order; `≡ 1 mod λ` ⇒ trivial; unramified special trace `(r+1)a ≡ 0 mod 2` | matches |
| 5.5 | `[[1,1],[0,1]]` over `F₂` | order 2, trace 0, one-dimensional eigenspace | matches Check |
| 5.9 | `ℚ(i)`-induced | weight-one lift of level `4N`, then Prop 1.3 (buzzard00 lines 669–671) | matches |
| 6.1 | `(33; 6, 2; 3)`, `(141; 7, 1; 3)`, `(141; 7, 1; 7)`, `(45; 7, 7; 7)` | 11, 141, 47, 9 (3² kept since `v₃(45) = 2`) | matches all four Checks |
| 6.5 | scalar `G_{ℚ₂}` character into `F^×`, `F` finite of characteristic 2 | image odd order; `I^{ab} ≅ ℤ₂^× = {±1} × (1 + 4ℤ₂)`, pro-2 ⇒ killed | unramified, finite étale model |
| 6.6 alignment | odd p, ratio of order `p^m` | `ζ = (ψ′/ψ)^{(p^m+1)/2}`, `ζ² = ψ′/ψ` | matches; the `ℚ(i)` example has odd ratio, so no square on a totally real field |
| 6.8 | `f = 2` | `#P¹(F_{p²}) = p² + 1`, `dim V = p² = p·p` | matches |
| 6.9 | symbolic | `det [[Nq+1, T_q],[T_q, ψ(π_q)(Nq+1)]] = (Nq+1)²ψ(π_q) − T_q²` | matches |

**Cross-roadmap citations resolved** (each at the cited roadmap's open head or on main, this round): FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.2 (line 670), R07.1.3 (730), R07.1.24a (1977), R07.6.1 (8300), R07.6.8 (8687, with `HasFiniteFlatModel.of_isUnramified` at 8723); AlgebraicModularFormsAndSerreWeights R15.1–R15.6 (its line 18), §§3.1 "The elliptic Hasse invariant", 3.2 "Deligne congruence and small-prime lifts", 3.3 "Theta and filtration", 3.4 "Coefficient-linear U and V", 3.7 "Socles of torsion section modules", 3.8 "Weight-one `T_p` with torsion coefficients" (`p ≥ 3`, `N ≥ 5`, as the README says), 3.13 "Theta cycles", 3.14 "Weight reduction to at most `p+1`", 4.1 "Tame inertia alternatives", 4.5 "Invariance and renormalized twists", 4.9 "The weight-two criterion", 4.10 "Edixhoven and classical weights", 4.11 "The dyadic weight dichotomy", 5.10 "Deligne–Serre eigenvalue lifting", 7.5 "S-type and modularity predicates" (`ArisesFrom`); the `roadmaps resolve` lead "AMFSW has no R15.3" is a false positive (R15.3 = Layer 3 by its line 18); ArithmeticGaloisRepresentations §§1.8, 3.6, 5.7, 6.3, 6.4; AutomorphicFormsOnReductiveGroups Layer 5 (anemic presentation and Galois eigensystems, lines 889–903) and Layer 7 (`arithmetic-hecke-normalization`, line 1182); ModularCurvesPartII §§7.2, 9.11, 11.1, 12.4, 13.3, 14.4a, 14.15, 15.7, 17.7; NeronModelsAndSemistableAbelianVarieties §§2.4, 4.7, 4.14, 5.3h; ArithmeticGaloisDuality §§R02.4.5b, R02.4.6, R02.6.2 (with the bold paragraph "Finite-order determinant twists" at its line 7288); IntegralIwasawaTheory §§9.0, 9.1; GL2AutomorphicRepresentationsAndTransfer §§R16.0.1, R16.3.5, R17.5.1, R17.5.9, R17.6.4, R17.6.12; HilbertModularVarietiesAndShimuraCurves §§R18.3.5, R18.3.18, R18.3.24, R18.3.29, R18.3.31, R18.3.32, R18.4.17, R18.5.15, R18.5.18, Layer R18.6; LocalGaloisDeformationRings §§8.2, 8.5, 8.13, 8.18; GlobalGaloisDeformations §§4.4, 4.8, 4.11; IntegralHeckeAndGaloisDeterminants Layer 1 "Cayley–Hamilton algebras and reconstruction"; on main: ClassFieldTheory Layers 7, 11, 12, Chebotarev Layer 10, ModularForms Layers 0 (Eisenstein series with character, Bernoulli constant terms), 2, 3, 6, 8, 8G and sublayer 8W. AutomorphicCongruences (line 1716) is board package #129, cited only as a consumer.

**Ownership.** `roadmaps grep --fixed` for `ribet_level`, `IsResidualEigenform`, `level_mul_prime`, `congruent_nebentypus` finds only this pull request; AutomorphicGaloisRepresentations (#1007, order 147) consumes "weight-two squarefree level lowering" from §2.10 as its §7.6 wrapper. The augmented congruence functor of §1.3: DeformationAndDerivedPatchingAlgebra (order 58) cites Iyengar–Khare–Manning only for patching, depth and canonical duality (its §§3–5, 9–11 locators), not Proposition 2.10's `Ψ_λ`; PadicFamilies (order 153) is a consumer. So §1.3 is the owner. Ownership against open pull requests whose files the brief did not give was not checked beyond `roadmaps grep`.

## Not verifiable

- Diamond, *The refined conjecture of Serre* (International Press 1995), Theorem 1.1 and Lemma 2.2: no open copy (not on arXiv, author pages or an open repository); read through wiese04 Theorem 10 and buzzard00 Corollaries 2.6–2.7, whose text was checked.
- Iyengar–Khare–Manning published pagination (Proposition 2.10 on p. 786): only arXiv 2206.08212v3 is in the cache (8f061724); its content was checked in the previous review and not re-opened here.
- Kisin 2009 Lemmas 3.1.8–3.1.11 and 3.5.3 (§§6.9–6.10, outside this round's sample): the Annals PDF's text layer does not carry statement numbers; only the §3.1 standing `p > 2` was verified previously.
- Edixhoven's `.dvi` link: the cache holds the author `.ps.gz` (c9d0bfb5, OCR); pagination agrees with the README's author pages.

## Source issues

- **Error** in buzzard00 at Theorem 2.8, printed p. 103: the statement omits that ρ is unramified at the removed prime p, while the proof on p. 105 uses that the Galois action on `J1(M,p)[m]` is unramified at p; it should include "ρ unramified at p"; affects a stated result; corrected in print at Ribet–Stein, Theorem 3.19, p. 49.
- **Misprint** in cg20 at proof of Lemma 8.14, author p. 66: the final identities for the kernel form are written `TF = (α+β)F`, `UF = αF`, `VF = βF`; from `UVF = F` and `UF = αF` the last should be `VF = α⁻¹F` (for example `α = 2`, `β = 3` in `F₇` gives `4F`, not `3F`); affects nothing (the smallest-exponent argument works for any nonzero scalar).
- **Gap** in ribet94 at the remark after Proposition (4.5), author p. 11: the source says that in the situation of (4.5) with ε of prime-to-ℓ order, f is new on `Γ1(M)∩Γ0(p²)` and φ is quadratic; it should note that `α|I_p` then has both odd ℓ-power order and order dividing 2, so the case is empty; affects nothing.
