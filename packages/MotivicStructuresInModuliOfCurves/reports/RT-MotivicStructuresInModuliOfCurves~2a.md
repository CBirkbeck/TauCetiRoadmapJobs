<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6906396149 -->
Red team round 2 pass a (claude) of 45c2dfc

Verdict: needs_changes

**For the human reviewers:** this review raises 6 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.4 still cites the supplier for the cohomology comparison it does not state

   - **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:553`: "Route: by §2.3 of MappingClassGroupsAndCanonicalRepresentations, `H^*(M_{g,n}, ℚ) = H^*(Mod_{g,n}, ℚ)`".
   - **Claim.** The supplier's §2.3 gives the identification with group cohomology.
   - **Witness.** The README's own contract, `README.md:149`: "Assumed: no statement on cohomology; the comparison `H^*(M_{g,n}, ℚ) ≅ H^*(Mod_{g,n}, ℚ)` is §2.1". The repair report of round 1 says this line was changed; it was not.
   - **Repair.** Replace the quoted clause by "Route: by the comparison of §2.1, `H^*(M_{g,n}, ℚ) = H^*(Mod_{g,n}, ℚ)`". The *Needs* line of §3.4 already lists §2.1. Tested: §2.1 states the comparison for every stable pair, which covers `g ≥ 2`.

2. **F02** (P2) `gap:equivariant-grr` is applied to a presentation that is not a quotient of a scheme

   - **Location.** `README.md:71` (and the same clause of the `needs` sentence in `design/plan.json`): "the Hurwitz stack, its fibration and its universal curve are the quotients by `SL₂` of the parametrized Hurwitz scheme, of its product with `ℙ¹` and of the parametrized universal curve".
   - **Claim.** The gap's hypothesis (a `G`-equivariant projective morphism of smooth quasi-projective schemes) holds for the `SL₂`-presentation.
   - **Witness.** A bielliptic genus-seven curve `C → E → ℙ¹` has gonality four (Castelnuovo–Severi: hyperelliptic needs `g ≤ 3`, trigonal `g ≤ 4`), so the cover lies in `H^◇_{4,7}`; the bielliptic involution is an automorphism over `ℙ¹`, so the parametrized Hurwitz space has a `μ₂` stabilizer there and is not a scheme.
   - **Repair.** (a) In §6.3, after "Construct these data over the `SL₂`-lift of the target on which `O(1)`, `E` and `F` exist", add: "Construct also the framed presentation: `X_{g,n}`, parametrizing degree-four covers `C → ℙ¹` of the fixed projective line by smooth curves of genus `g` with `n` distinct ordered marked points together with a basis of `H⁰(ℙ¹, E)`, of dimension `g + 6` (every summand of `E` has positive degree, since `h⁰(O_C) = 1`), and prove that `X_{g,n}` is a smooth quasi-projective scheme with an ample invertible sheaf linearised for `G = SL₂ × GL_{g+6}` and that `[X_{g,n}/G]` is the `SL₂`-lift of `H_{4,g,n}`. An automorphism of a cover over `ℙ¹` acts faithfully on `E^∨ = α_*O_C/O_{ℙ¹}`, hence on the frame, so `X_{g,n}` has no stabilizers; the parametrized Hurwitz space without the frame has them, for instance at a cover `C → E → ℙ¹` through a double cover of an elliptic curve." (b) In `README.md:71` replace the clause from "on the `SL₂`-lift, where" to the end of the sentence by "on the framed presentation `[X_{g,n}/(SL₂ × GL_{g+6})]` of §6.3; the parametrized Hurwitz space of Canning–Larson genus seven, Remark 2.3, pp. 6–7, is not a scheme where a cover has an automorphism over `ℙ¹`". (c) In `design/plan.json`, in the `needs` of `equivariant-grr`, replace "applied on the SL₂-lift to" by "applied on the framed presentation of §6.3 to". (d) Add to §6.3 the Check: "At a bielliptic cover `C → E → ℙ¹` in genus seven the involution of `C` over `E` fixes the cover and acts by `−1` on a nonzero summand of `E`, so it moves every frame: the stabilizer in `X_{7,0}` is trivial, while the unframed parametrized space has stabilizer `μ₂`." Tested on the witness: `h⁰(E) = deg E + rank E = 10 + 3 = 13 = g + 6` at `g = 7`.

3. **F03** (P2) §§4.3 and 11.1 use Petersen's genus-two theorems beyond what Scope says is owned, with no *Needs* entry

   - **Location.** `README.md:9`: "the compactly supported Euler characteristics of the symplectic local systems `V_{a,b}`, `a + b ≤ 12`, on `A₂`"; `README.md:1610` (§11.1 route): "Petersen's classification of the cohomology of local systems on the moduli of abelian surfaces … leaves only `L S₁₂`"; `README.md:643` (§4.3 route): "for `n < 20` use Petersen's theorem on compact type".
   - **Claim.** The genus-two inputs are the Euler characteristics for `a + b ≤ 12` of §3.6.
   - **Witness.** At `(g, n, k) = (2, 14, 15)` §4.2 gives the quotient `⊕_{|λ|=14} W₁₅H¹(M₂, V_λ) ⊗ T_{λ^T}`: §11.1 needs actual pure cohomology groups, of weight `a + b = 14 > 12`. §11.1's *Needs* (`README.md:1612`) lists neither §3.6, §4.2 nor PELModuli; §4.3 uses `petersen-genus-two` line 407 (Theorem 3.8) as an input.
   - **Repair.** (a) In `README.md:9` replace "and the compactly supported Euler characteristics of the symplectic local systems `V_{a,b}`, `a + b ≤ 12`, on `A₂` from Petersen's computation of their cohomology" by "and Petersen's computation of the semisimplified compactly supported cohomology of the symplectic local systems `V_{a,b}` on `A₂` (Petersen, abelian surfaces, Theorem 2.1), with its three uses: the Euler characteristics for `a + b ≤ 12` (§3.6), the pure cohomology of weights thirteen and fifteen on `M₂`, which involves `a + b ≤ 14` (§11.1), and the degeneration of the Leray spectral sequence of `M₂,n^{ct} → M₂^{ct}` with the tautological even cohomology of `M_{2,n}` for `n < 20` (Petersen, genus two, Theorems 2.1 and 3.8; §4.3)". (b) In §11.1 replace the *Needs* line by "*Needs:* §§0.4, 0.5, 2.6, 2.9, 3.1, 3.2, 3.6 (the Torelli identification `M₂^{ct} ≅ A₂` and the classes on `Sym² M_{1,1}`), 4.2, 4.7, 9.8, 10.1, 10.9; PELModuli §M5.2." and add the Check: "At `n = 14`, `k = 15` the quotient of §4.2 is `⊕_{|λ|=14} W₁₅H¹(M₂, V_λ) ⊗ T_{λ^T}`, so local systems of weight fourteen enter, beyond the range `a + b ≤ 12` of §3.6." (c) In §4.3 add "§3.6; PELModuli §M5.2" to the *Needs* line. Tested on the witness: weight `14 ≤ 14`.

4. **F04** (P2) §§5.4 and 6.2 rest on constructions that are no target, supplier section or declared gap

   - **Location.** `README.md:833` (§5.4): "Route: Hurwitz-space and low-gonality descriptions of `M_{g,n}` stratum by stratum, with §5.2"; `README.md:877` (§6.2), which has no route; *Needs* `README.md:835`, `879`.
   - **Claim.** §§5.2, 5.3, 0.1, 0.6 (and §6.1) suffice for the CKgP ranges `c(g)` in genera one to six and for the trigonal locus in genus seven.
   - **Witness.** The cited proofs build pointed plane-curve stacks (`canning-larson` lines 1179–1315), the trigonal Hurwitz stack `H_{3,g,n}` (lines 1654–1790) and tetragonal strata in genera five and six (lines 2005–2060). The README constructs the tetragonal strata for `g = 7` only (§§6.4, 6.6–6.8) and no trigonal or plane-curve stack. §5.4 feeds §§9.7, 10.2, 10.4, 10.8, 10.9, 12.1, 12.7.
   - **Repair.** In §5.4 replace "Route: Hurwitz-space and low-gonality descriptions of `M_{g,n}` stratum by stratum, with §5.2, and §5.3 for the cohomological consequence;" by: "Route, genus by genus, each step a part of this target. Genus one, `n ≤ 10`: `A^*(M_{1,n}) = ℚ` (Belorousski, recalled in Canning–Larson, Theorem 5.1). Genus two, `n ≤ 10`: the stack of pointed hyperelliptic curves as a quotient of pointed binary forms (Canning–Larson, §6, Theorems 6.1–6.2 and Lemma 6.3; §8.1 for the unpointed presentation). Genus three, `n ≤ 11`: the stack of `n`-pointed plane curves of degree `d`, with the CKgP for `n ≤ 3d − 1`, its Chow generators, and the hyperelliptic locus (Canning–Larson, Lemmas 7.1–7.4 and Corollary 7.5). Genus four, `n ≤ 11`: the trigonal Hurwitz stack `H_{3,g,n}` of degree-three covers with its rank-two bundle `E` of degree `g + 2`, the CKgP and the surjection `A^*((ℙE^∨)^n) → A^*(H_{3,g,n})` for `n ≤ g + 7`, and tautological pushforwards (Canning–Larson, Lemmas 9.1–9.9 and 9.11). Genera five and six, `n ≤ 7` and `n ≤ 5`: the tetragonal stack of §§6.3 and 6.5 with the strata of fixed splitting type and their CKgP for `n ≤ 4f − 2g + 1`, the plane-quintic locus being removed in genus six (Canning–Larson, Lemmas 10.5, 10.9–10.14). Each case concludes by §5.2, and §5.3 gives the cohomological consequence;". Add "§§6.3, 6.5, 8.1" to the *Needs* line of §5.4 (no cycle: §§6.3 and 6.5 need only §§6.1, 0.1, 0.2, 0.6 and suppliers). In §6.2 add: "Route: the case `g = 7` of the trigonal step of §5.4, valid for `n ≤ g + 7 = 14`, together with the hyperelliptic locus (Canning–Larson, Lemma 9.9, which assumes `g ≥ 4`)", and add §5.4 to its *Needs*. Tested: `g + 7 = 14` at `g = 7` is the bound of §6.2; the six ranges are those of `clp` lines 532–534.

5. **F05** (P2) the first step of §2.1 has no route and no input; §2.3 omits the comparison for the ℓ-adic case

   - **Location.** `README.md:391`: "the rational Betti cohomology of the analytic stack `[T/Γ]`, which is that of its homotopy type, the Borel construction `T ×_Γ EΓ`"; `README.md:59`: "the identification of the cohomology of the analytic stack with that of its Borel construction is part of §2.1"; *Needs* `README.md:395`, `418`.
   - **Claim.** §2.1 proves the identification the contract assigns to it.
   - **Witness.** The route starts at the Borel construction; the relative clause is the only mention of the step. The *Needs* line names no supplier of the Betti cohomology of a stack (it is `gap:dm-stack-mixed-hodge`, used in §2.3), so the group of §2.1 is not tied to the one dualized in §2.3. §2.3 is stated in both realizations and cites no Artin comparison.
   - **Repair.** In §2.1 replace "the rational Betti cohomology of the analytic stack `[T/Γ]`, which is that of its homotopy type, the Borel construction `T ×_Γ EΓ`, is `H^*(Γ, ℚ)`. Route:" by "the rational Betti cohomology of the analytic stack `[T/Γ]`, that is the cohomology of the constant sheaf `ℚ` on it, the Betti lattice of gap:dm-stack-mixed-hodge, is `H^*(Γ, ℚ)`. Route: the Čech nerve of the étale atlas `T → [T/Γ]` is the simplicial manifold `T × Γ^•`, and cohomological descent identifies the cohomology of the stack with that of its geometric realization, which is the Borel construction `T ×_Γ EΓ` for the bar model of `EΓ`; then". Add to the *Needs* of §2.1: "MixedHodgeModulesAndIrregularHodgeTheory, gap:dm-stack-mixed-hodge (the Betti cohomology of the stack)". Add to the *Needs* of §2.3: "WeilConjectures, WC.1 (the stack Artin comparison, which carries the vanishing to the ℓ-adic realization)". Tested on `M_{1,1}`: `ℍ × SL₂(ℤ)^•` realizes to `ℍ ×_Γ EΓ`, with rational cohomology `ℚ` in degree zero, the value of the existing Check.

6. **F06** (P3) §4.3, second Check: the Graber–Pandharipande class is in degree 24, not 22

   - **Location.** `README.md:650`: "`H²²(M̄_{2,20})` contains a non-tautological algebraic class (Graber–Pandharipande, recalled in CLP, Introduction, p. 3)".
   - **Claim.** An algebraic non-tautological class in cohomological degree 22.
   - **Witness.** The class is the pushforward of the diagonal of `M̄_{1,11} × M̄_{1,11}`: dimension `11` in `M̄_{2,20}` of dimension `23`, so codimension `12`, degree `24` (homological degree `22`). `clp` line 114 prints the degree as 22; the README's own `README.md:1862` computes `11 + 11 + 2 = 24`.
   - **Repair.** Replace the Check by: "`H²⁴(M̄_{2,20})` contains a non-tautological algebraic class, the pushforward of the diagonal of `M̄_{1,11} × M̄_{1,11}`, of codimension twelve (Graber–Pandharipande, recalled in CLP, Introduction, p. 3, where the degree is printed as 22, its homological degree). Hence `H²²(M̄_{2,20}) ≠ RH²²(M̄_{2,20})`: with `d = 23` and a tautological `a` as in §4.12, `a : H²² → H²⁴` is an isomorphism preserving `RH^*`, so `H²² = RH²²` would give `H²⁴ = RH²⁴`. The range cannot be extended to `r = 11`." Add the misprint to the Corrections to the sources. Tested: `2 · 23 − 22 = 24`.

7. **F07** (P3) "`S_n`-equivariant polynomial count" is used in a target and defined nowhere

   - **Location.** `README.md:367` (§1.6): "has polynomial point count over every finite field, with `S_n`-equivariant polynomial counts".
   - **Claim.** A defined notion.
   - **Witness.** `README.md:38` defines only "polynomial point count"; `README.md:97` says the clause of WeilConjectures, WC.5 on equivariant polynomial counts "is not applied to stacks", so the supplier's definition is excluded and none replaces it.
   - **Repair.** Add to the Conventions bullet "Point counts": "An `S_n`-equivariant polynomial count of `M̄_{g,n}` (or `M_{g,n}`) means: for every `σ ∈ S_n` there is `P_σ ∈ ℚ[T]` such that the mass of the twist by `σ` of §1.1 over `𝔽_q` is `P_σ(q)` at every prime power `q`." Tested on `M̄_{0,4}`: `P_σ = q + 1` for every `σ`, the three boundary points being permuted and `Σ_j tr(σ | H^{2j}) q^j = 1 + q`.

Round 2. Both files were read in full (`packages/MotivicStructuresInModuliOfCurves/README.md`, 1933 lines; `packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, 46 lines). Seven new findings: five P2, two P3. No false target statement was found; one round-1 finding is only partly repaired (S01) and one round-1 repair introduced an error (S02).

## Round-1 findings at this head

| Finding | Status | Witness at `45c2dfc` |
| --- | --- | --- |
| 1a/F01 (GRR for the cover `α`) | repaired, with a new error | `README.md:71` declares `gap:equivariant-grr`; `README.md:929` and `README.md:975` cite it; the slug is in `design/plan.json`. Its stated application does not meet its own hypothesis: S02. |
| 1a/F02 (boundary factors in homological degree) | repaired | `README.md:1745`: "exactly one factor has odd homological degree, eleven or thirteen … the other factor … has homological degree two or zero, tautological by §10.4"; `README.md:1758` likewise; Check at `README.md:1754`. Recomputed: `H₁₁(M̄_{1,12}) = H¹³(M̄_{1,12})(12) = a·H¹¹`, `H₂(M̄_{2,2}) = H⁸(M̄_{2,2})(5)`. |
| 1a/F03 (family (e), 858) | repaired | `README.md:1664`: "`{i, j}` of the twelve markings other than `x` and `k`, so that `i`, `j` or `k` may be `y` (`858`)"; `13 · 66 = 858`. |
| 1a/F04, 1b/F04 (`g = 1` in §2.2) | repaired | `README.md:405`: "for `g ≥ 2`: CFP, Theorem 1 … For `g = 1` the statement is `H¹(M_{1,1}, ℚ) = … = Hom(SL₂(ℤ), ℚ) = 0`". |
| 1a/F05, 1b/F06 (Summary omits CLP 1.9) | repaired | `README.md:3` ends "and for `n ≤ 11` every `H^k(M̄_{3,n})^ss` is a polynomial in `L` and `S₁₂` (CLP, Theorem 1.9)". |
| 1a/F06 (§4.9, genus one) | repaired | `README.md:734`: "in genus one by §3.2 … zero when `k′ > n′`"; Check at `README.md:743`. Region recomputed: in genus one it is `n′ = k′ ≥ 1`; genus zero has no seed. |
| 1a/F07 (§11.9, the 55) | repaired | `README.md:1710`: "of dimension `11`, `55` or `66` … excludes `55` (`880`) and `66` (`891`)". |
| 1a/F08 (stack `B`) | repaired | `README.md:888` defines `B`, `ℙ → B`, `H_{4,g} → B`, `α`; used at `README.md:949`, `956`, `960`, `971`. |
| 1b/F01 (§9.7 without `p`-adic inputs) | repaired | `README.md:1402`: "every pair `(g′, n′) ≼ (4, n)` lies in the ranges of §5.4 … The clause of WC.5 on polynomial counts over all of `Spec ℤ` is not used". Ranges recomputed: `2g′ + n′ ≤ 11` gives `n′ ≤ 9, 7, 5, 3` in genera one to four, inside `c = 10, 10, 11, 11`. |
| 1b/F02 (cohomology comparison not in the supplier) | partly repaired | `README.md:149` and `README.md:391` repaired; `README.md:553` (§3.4 route) still reads "by §2.3 of MappingClassGroupsAndCanonicalRepresentations, `H^*(M_{g,n}, ℚ) = H^*(Mod_{g,n}, ℚ)`": S01. The new first step of §2.1 has no input: S05. |
| 1b/F03 (§3.2, insertion summands) | repaired | `README.md:528`: "`V^{⊗q}` is the sum of `Sym^qV` and of the images of the insertions … restrict to zero there"; Check at `README.md:537` (`μ(12, 10) = 11`, `S₁₄ = 0`). |
| 1b/F05 (§10.6 Needs) | repaired | `README.md:1541`–`1543`: degree six through the hypothesis, §§10.3, 4.2, 3.2, 2.6; degrees at most five through §§10.1, 10.2, 2.7. |

## The adversarial pass: computed values

`Suggested.lean` has no declaration (a module docstring and an empty namespace; the entry `and` of the worker's signature list is a word of the docstring). No Lean was run: there is nothing to elaborate. Rows are README statements recomputed in this pass; the 50 rows of each round-1 pass were not repeated unless the text changed.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, duality | weights | `(W_{2d−k}H^{2d−k})^∨(−d)`: `−(2d − k) + 2d = k` | holds | — |
| §1.5 trace identity | `F = q^jU`, `σ = diag(1,1,−1)`; `σ′` swap | `tr(σF) = q^j`; `tr(σ′F) = 2q^j ≠ q^j` | holds, commutation needed | — |
| §2.3 from §§2.1–2.2 | `n = 0`, `1`, `≥ 2` | `2d − (4g−5) = 2g − 1`; `2d − (4g−3) = 2g − 1`, plus §2.2: `k < 2g`; `2d − (4g−4+n) = 2g − 2 + n` | holds | S05 (Needs) |
| §§2.7–2.9 base regions | `k = 5, 7, 9` | `(1, ≤5), (2, ≤3)`; `(1, ≤7), (2, ≤5), (3, ≤3)`; `(1, ≤9), (2, ≤7), (3, ≤5), (4, ≤3)` | inside §1.6 except genus four | — |
| §3.2 route | `k = 13`; `θ_{st}` | `μ(12,10) = 12 − 1 = 11`; `θ_{st} = [Δ_{st}] − [s = 0] − [t = 0]` on `E²`, zero on `M_{1,n}` | holds | — |
| §3.4 Check 3 | `M_{1,2}` | boundary divisors `2`, `b₂(M̄_{1,2}) = 2`, so `Gr^W_2H¹(M_{1,2}) = 0`; `W₁H¹ = S₂ = 0` | `H¹ = 0`, holds | S01 (route) |
| §3.6 `c₁₂`, `c₁₁` | `(L − V)_{11}`, `(L − V)_{10}` | coefficient of `V^{10}`: `Σ_{i=0}^{10}(L − i) = 11L − 55`; `1` | holds | — |
| §3.6 fifth Check | Petersen's theorem at `(4,4)`, `(9,1)`, `(9,3)`, `(10,0)`, `(11,1)` | `s′₁₂ℚ(−5)` in `H²_c` and `H³_c`; `S_{a+3} = S₁₂`; `s₁₄S₁₂(−1) = 0`; `s₁₆S₁₂(−2)` | agrees with `petersen-abelian-surfaces` lines 145–178 | — |
| §3.6, Siegel terms | `S_{a−b,b+3}`, `a + b ≤ 12` | least weight with a Siegel cusp form: `(7,7)`, `a + b = 14` | none for `a + b ≤ 12` | S03 |
| §4.3 route | `n = 20`, `2r = 20` | `n ≥ k` holds with equality, `W₂₀H²⁰ = Φ²⁰` from `(2, 19)` | holds | S03 (owner) |
| §4.3 Check 2 | diagonal class | `dim = 11`, codimension `23 − 11 = 12`, degree `24` | Check misplaces the degree | S06 |
| §4.9 region | genus zero, one, `≥ 2` | genus zero: `n′ ≤ k′ ≤ n′ − 4` empty; genus one: `n′ = k′ ≥ 1`; `g′ ≥ 3k′/2 + 1 ⟺ k′ ≤ (2g′−2)/3` | route covers the complement | — |
| §6.3 | `g = 7` | `h⁰(E) = 10 + 3 = 13`; `dim W = 28 − 18 = 10` (§7.3) | holds | S02 |
| `gap:equivariant-grr` application | bielliptic `C → E → ℙ¹`, `g = 7` | gonality four; stabilizer `μ₂` in the parametrized space | hypothesis fails | S02 |
| §7.5–7.6 | ranks | `9·7 = 63`, `63 − 45 = 18`; `21 − 16 = 5`; `n + (7−n) = 7` | holds | — |
| §8.1, §8.9 | counts | `(q−1)(q^{2g+2} − q^{2g})/((q²−1)(q²−q)) = q^{2g−1}`; `q¹²(q−1)²(q+1)/(q⁴(q−1)²(q+1)) = q⁸` | holds | — |
| §9.7 route | `n = 3, 4, 5` | `(1,9), (2,7), (3,5), (4,3)` inside `c`; `(1,10)` inside; `(1,11)` outside | holds for `n ≤ 3` | — |
| §9.7 splitting | spanning by invariant vectors | a representation spanned by `χ`-eigenvectors is `χ^{⊕m}` | holds | — |
| §10.6 | `(2,7)`; dimension count | `(1,7,6)`: `8 ≤ 14`, covered by §3.2; `dim H⁶ = dim H^{2d−6} = dim RH^{2d−6} = dim RH⁶` | holds | — |
| §11.9 | quotient dimensions | `825 + 11 = 836`, `825 + 55 = 880`, `825 + 66 = 891` | holds | — |
| §11.1 | `(2, 14, 15)` | quotient `⊕_{|λ|=14} W₁₅H¹(M₂, V_λ) ⊗ T_{λ^T}` | weight 14 is used | S03 |
| §12.1 | base pairs; `(2,11)` | `(1,11)`: `H⁹ = 0`; `(1,12)`: `H¹¹ ⊂ S_ω`; `(1,13)`: `W₁₃H¹³ = 0`; `(2,11)`: `d = 14`, `H¹⁵ = a·H¹³` | holds | — |
| §12.7 | `(8,0)`, `(8,1)` | `2g − 2 + n = 14, 15 ≤ 15`; `2g = 16 > 15` | correction to `clp` line 1184 confirmed | — |
| §12.9 duality | twists | `(L^{d−12}S₁₂)^∨L^d = L S₁₂`; `(L^{d−13}S₁₂)^∨L^d = L²S₁₂`; `(L^{d−15}S₁₆)^∨L^d = S₁₆` | holds | — |
| §12.10 | Künneth factors, `k′ ≤ 15` | odd ⊗ odd needs `11 + 11 = 22 > 15`; genus-one factors have `≤ 12` flags, `S₁₆` needs `15` | holds | — |
| §1.6 | `M̄_{0,4}`, every `σ` | `P_σ = q + 1` | notion undefined | S07 |

## Dependency check

```text
depcheck: 242 roadmaps, 2273 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Read.** 0 Lean declarations; 111 numbered targets, each with a *Needs* line and Checks.
- **Lean file.** `import Mathlib` only; one module docstring of the required form listing eight headline theorems, which are the Summary's; an empty namespace; no `set_option`, `sorry`, `lemma` or stand-in. None of the headlines is statable at the pins (no algebraic stacks, stable curves or their moduli in either library); no padding.
- **Locators verified in this pass (23).** `clp` lines 57–62 (Definition 1.2), 114–115, 309–314 (Proposition 2.6), 478 (Lemma 4.3), 532–534 (Table 1), 535–540 (proof of Theorem 1.9), 548–560 (§5 opening and §5.1), 1182–1185 (Lemma 8.2); `canning-larson` lines 473–482 (Theorem 1.4, p. 4: `g = 4`, `n ≤ 6` compact; `n ≤ 10, 11, 11, 7, 5` open), 845 (Proposition 3.15), 1039, 1150, 1315, 1790 (Lemma 9.9, `g ≥ 4`, `n ≤ g + 7`), 1812, 1932, 2048, 2060; `canning-larson-genus-seven` lines 257–268 (Remark 2.3, pp. 6–7); `petersen-abelian-surfaces` lines 145–178 (Theorem 2.1, p. 4), 183–188 (Remark 2.2); `petersen-genus-two` lines 171, 255, 407 (Theorems 2.1, 3.8, Proposition 2.3).
- **Checks recomputed.** The 26 rows above.
- **Sibling citations checked (28 ids).** StableReductionPartII at its open head: §§0.4, 2.248, 3.1, 3.2, 3.3, 3.5, 3.7, 3.10, 3.11, 4.1, 4.14, 5.1, 5.10, 5.11, 5.15 (the Edidin–Graham comparison is stated there with the README's hypotheses), 7.11. SchemeAndStackFoundations on main: Layer 0, §§2.20, 3.2, 3.3, 4.15, 4.17, 5.1–5.8. EquivariantIntersectionTheory on main: §§2.1–2.3, 3.3; it states no Riemann–Roch theorem, so `gap:equivariant-grr` asks for nothing already provided. SchurWeyl §9.7.
- **Pinned declarations.** `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology` exists at `TauCeti/AlgebraicTopology/Cohomology/GroupCohomology.lean:248`, with `[ContractibleSpace E]` and coefficients a `k`-module `M`, as the contract says; a contractible classifying-space model is in `TauCeti/AlgebraicTopology/ClassifyingSpace/`.
- **Gaps.** The nine slugs of the README are the nine of `design/plan.json`, each with a named supplier and section.
- **Policy.** No pull-request number or process narrative in the README or the docstring; every target has a locator; the dependency check is clean.
- **Arrangement.** Source mentions in Layers 0–12: `clp` 96, `bfp` 51, Petersen's three papers 17, the mapping-class sources 13, `canning-larson` and `canning-larson-genus-seven` 11, Getzler 11. Against the sections of `clp`: `Layer 4 ↔ §§2–3`, `Layer 5 ↔ §4`, `Layers 6–7 ↔ §5`, `Layer 10 ↔ §6`, `Layer 11 ↔ §7`, `Layer 12 ↔ §§7–8`; not one to one (Layer 4 joins two sections with CLP-H11 §2, Layers 6–7 split one, Layer 10 adds CLP-H11 §4, Layers 0–3 and 8–9 come from other sources), and the order is forced by the *Needs* of §10.4 (§7.7), §11.10 (§10.9), §12.1 (§11.10) and §12.9 (§§10.5, 12.3).

## Not verifiable

- `harer-vcd` and `mukai` are uncertified: §§2.1 and 7.3 rest on their locators.
- The Graber–Pandharipande paper is not in the sources cache; S06 rests on the dimension count and on `README.md:1862`, not on its text.
- Whether the framed space `X_{g,n}` of the repair of S02 is quasi-projective with a linearised ample sheaf was not proved here; the repair states it as a clause §6.3 must prove.
- The 891-row matrix of §11.7, CLP Figure 2 and the multiplicities `264` and `836` were checked for consistency only, as in round 1.
- The tables of §§8.9–8.11, 8.14, 9.4–9.6, 9.9 and 9.10 were not recomputed in this pass; both round-1 passes recomputed them and the text is unchanged.
- Page numbers of `canning-larson` Proposition 3.15 (p. 13) and of the Bergström papers were not checked against page markers.

Source independence: 14 passages compared with 5 sources (`clp`, `canning-larson`, `canning-larson-genus-seven`, `petersen-abelian-surfaces`, `petersen-genus-two`), none shared beyond formulas and standard names (longest common run five words, `clp` line 60); largest share `clp`, 96 of about 230 source mentions; contents compared with `clp`: independent.

## Source issues

- **Misprint** in clp at Introduction, paragraph before Conjecture 1.8, p. 3: the source says the Graber–Pandharipande non-tautological algebraic class lies in cohomological degree 22 of the genus-two space with twenty markings; it should be degree 24, the cycle having codimension twelve; affects nothing.
- **Gap** in clp at Lemma 8.2, proof, p. 28: the source says injectivity follows from the bound on `2g − 2 + n` and the Chow–Künneth table; it should also use the bound `2g > 15` for at most one marking, genus eight not being in the table; affects the proof.
- **Error** in canning-larson-genus-seven at Remark 2.3, p. 6: the source says the Hurwitz stack is the quotient of a parametrized Hurwitz scheme; it should be a Deligne–Mumford stack, covers with automorphisms over the line having stabilizers; affects nothing.

## For the human reviewers

- **Scope.** §§3.6, 4.3 and 11.1 own Petersen's theorems on local systems on `A₂` as inputs (`README.md:9`); their proofs use Eisenstein cohomology and the discrete spectrum of `GSp₄`, which no target or supplier of the README plans (`petersen-abelian-surfaces` lines 183–188).
- **Scope.** §§2.1, 2.2 and 3.4 own Harer's virtual cohomological dimension, its top-degree vanishing, Harer stability and the Madsen–Weiss theorem as single targets whose routes are citations (`README.md:393`, `405`, `553`); no layer plans their proofs.
- **Scope.** §4.6 states CLP Lemma 3.2 with an added generator and leaves the printed form open for even `k ≥ 24` (`README.md:28`, `687`); no refereed source states the modified lemma.
- **Licence.** `kannan` (arXiv:2602.09117, version 2) is an unpublished preprint, cited only for a misprint in `gorsky` (`README.md:1312`, `1900`).
- **Licence.** The polynomial tables of §§9.4–9.6, 9.9 and 9.10 restate the numerical content of `bfp` Proposition 9.6 and Theorems 1.4, 1.5, 11.1, 11.5 as targets with locators.
- **Not tested.** `harer-vcd` and `mukai` are uncertified; their wording was not compared with §§2.1 and 7.3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "45c2dfcaf13eda435e8a6da8f18ae8ae8f351c74", "job": "RT-MotivicStructuresInModuliOfCurves~2a", "model": "fable", "worker": "chris-x26"} -->
