# Review of ClassicalSerreModularity (pull request #1020 at bacf7a7)

**Verdict:** accepted

Incremental re-review of the 38 changed lines since `8c36ec0` (28 insertions, 10 deletions, all in `TauCetiRoadmap/ClassicalSerreModularity/README.md`; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder). Source ids are those of the sources service: `blggt` (Barnet-Lamb–Gee–Geraghty–Taylor, arXiv 1010.2561v4), `ceggps` (Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin, arXiv 1310.0831v5), `ltxzz` (Liu–Tian–Xiao–Zhang–Zhu, arXiv 1912.11942v3), `tua` (Tung, odd `p`, arXiv 1803.07451v4), `dp` (Dieulefait–Pacetti, arXiv v2); the ids of the previous rounds (`kh`, `kw1`, `kw2`, `kwann`, `tub`, `sw99`, `na`, `ri`, `bm`) are unchanged. `<id> line N` is a line of the cached line-numbered extraction. One P3 finding; no P1 or P2.

## R01 (P3) — The BLGGT citation describes the rank-two statement as a case of a theorem that proves less

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/README.md:1263`: “Theorem 5.5.2, p. 81 (the general theorem, of which this is the rank-two case with every `ℓ`)”.

**Claim.** The target `R33.1/rank-two-unitary-irreducibility` asserts irreducibility of `r_{ℓ,ι}(Π)` for every prime `ℓ` and every `ι`, for every regular algebraic conjugate-self-dual cuspidal `Π` of `GL₂` over an imaginary CM field. BLGGT Theorem 5.5.2 asserts irreducibility only for `ℓ` in a set of rational primes of Dirichlet density one, for polarizable `π` of extremely regular weight. The rank-two every-`ℓ` statement is therefore not a case of Theorem 5.5.2; it is a stronger statement in rank two, which the target proves by its own isobaric-sum argument.

**Witness.** `blggt line 3787`–`3792` (p. 81): “there is a set of rational primes `L` of Dirichlet density 1 such that if `l ∈ L` … then `r_{l,ı}(π)` is irreducible.” The same reading is recorded by the supplier: AutomorphicGaloisRepresentationsPartII AG2.6, “The extremely regular irreducibility input”, says Theorem 5.5.2 proves the input “with a Dirichlet-density-one set of `ℓ′`”.

**Repair.** Replace the parenthesis by: “Theorem 5.5.2, p. 81, proves irreducibility in every rank for a density-one set of `ℓ` under extreme regularity; the rank-two statement for every `ℓ` is proved here directly.” The definition locator (§2.1, p. 32) is correct: `blggt line 1473`–`1475`, with `=== page 33 ===` at `blggt line 1482`.

## Previous findings

- R01 — repaired: README 1274–1278 make the Hecke–Galois input of the odd-prime unitary tower part of `R33.1/global-arithmetic-action` (weak base change from EndoscopicTransferAndUnitaryTraceComparison §§13.1 and 13.4, attachment by AutomorphicGaloisRepresentationsPartII AG2.3 with the AG2.0 normalization, determinant law glued over `𝕋_𝔪`, reconstruction by IntegralHeckeAndGaloisDeterminants Layers 0–1 and AutomorphicGaloisRepresentations §6.9, `𝒢₂`-valued extension into GlobalGaloisDeformations Layer G7, local–global compatibility at the split places above `p` from AG2.6), and the new target `R33.1/rank-two-unitary-irreducibility` (README 1262–1268) discharges AG2.6's irreducibility hypothesis in rank two. Every cited section exists at the suppliers' open heads (below). The repair introduced the P3 above (the BLGGT parenthesis) and nothing else.
- R02 — repaired: README 1301, “Theorem 4.1, Lemma 4.2 and Corollary 4.3, pp. 12–13”; `tua line 620` (Theorem 4.1, p. 12), `tua line 641` (Lemma 4.2, p. 13), `tua line 663` (Corollary 4.3, p. 13).
- R03 — repaired: README 78, the three R33.1 patching targets “are owned here. GL2ModularityLifting Layers 8–9 and CompletedCohomologyAndLocalGlobalCompatibility Layer 5 compare their totally real and rank-`n` generalizations with these targets”; those layers exist at the heads #1071 (Layers 8 and 9 at its README lines 2191 and 2387) and #1270 (Layer 5 at line 1751), merge positions 155 and 235, both after this roadmap (150).
- R04 — repaired: README 597 states the transfer “relative to a lifting hypothesis”, defines it as a class of `p`-adic representations with the modularity statement, says “The lifting theorems of I.1 and I.2 instantiate the hypothesis here; later rational lifting theorems instantiate it where they are proved, and this target does not refer to them”; R33.1 (README 1322) says each of Theorems 1.4–1.7 is an instance.

## Verified sound

### Gate, scope and elaboration

The worker's gate for `bacf7a7` reports every counter zero and OK (build, depcheck, imports, sorry-data, set_option, residue, stray-files, outside-folder). Rerun this round:

```text
depcheck: 205 roadmaps, 1413 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassicalSerreModularity'` is empty. `lake build TauCetiRoadmap.ClassicalSerreModularity.Suggested` from the pull-request worktree completed (9096 jobs) with exactly five `sorry` warnings (`Suggested.lean` lines 112, 123, 156, 168, 178) and no other message; the shared package checkout was at the branch pin (`mathlib 6b7abb3c`, `TauCeti a91d3aa`) with its reflog quiet since 18:44 UTC. The scratch `#check @name` probe for all 20 declarations elaborated with zero errors; the elaborated types are those recorded in the previous report (`Fact p.Prime`, `IsSType`, unramifiedness outside `p`, `p % 4 = 1`, non-solvable image, the complex-conjugation determinant, `NeZero N` all present). `Suggested.lean` is byte-identical to the head the previous review read, so the one-tactic padding probe of that review (none of the five theorems closes) and its headline inventory stand.

The new suppliers are all earlier in the merge order than this roadmap (150): IntegralHeckeAndGaloisDeterminants 22, GlobalGaloisDeformations 72, AutomorphicLFunctionsAndLocalFactors 77, EndoscopicTransferAndUnitaryTraceComparison 132, AutomorphicGaloisRepresentationsPartII 146, AutomorphicGaloisRepresentations 147. ModularityAndLanglandsExtensions (position 176, later) states BLGGT's density-one theorem as its §2.43 for extremely regular `GL_n`; it is neither cited nor duplicated: the rank-two every-`ℓ` statement is a different, stronger statement in rank two, and this roadmap is the earlier owner. No other open roadmap or roadmap on main states it (`roadmaps grep` for the Theorem 5.5.2 locator and for “isobaric sum of two characters”).

### Supplier citations resolved at the open heads

| Citation (README line) | Where found and what it states |
| --- | --- |
| AutomorphicGaloisRepresentationsPartII AG2.0 (67, 1262, 1274, 1278) | #1006, Layer AG2.0 (README 641): “A Galois representation attached to `π` at the good places” (line 819): `ι det(X − r(Frob_v^geom)) = P_v(π_v; X)` outside a finite set, uniqueness by Frobenius density; “Conjugate self-dual, essentially conjugate self-dual and polarized” (line 703): conjugate self-duality is the polarized case `χ = 1`, `w = 0`. |
| AutomorphicGaloisRepresentationsPartII AG2.3 (67, 1262, 1274) | #1006, Layer AG2.3 (1359), “Arbitrary regular conjugate-self-dual existence” (1365): for any CM `F` and regular algebraic conjugate-self-dual cuspidal `π` on `GL_n(𝔸_F)`, every `ℓ, ι`, a unique semisimple rank-`n` `r` attached at good places. |
| AutomorphicGaloisRepresentationsPartII AG2.6 (67, 1262, 1274) | #1006, Layer AG2.6 (2150): “Polarized admissibility at the coefficient prime” (2235): `r_{π,λ}|G_{F_v}` de Rham with the stated Hodge–Tate labels, crystalline at spherical and semistable at Iwahori places, for polarized cuspidal `(π,χ)`; “The extremely regular irreducibility input” (2299): `ExtremelyRegularIrreducibility n`, an existential over `(ℓ′, ι′)` for extremely regular weights, “a hypothesis of the coefficient-prime targets below, not a target of this roadmap”; “Full polarized local–global compatibility at `ℓ`” (2450): under that hypothesis, `WD(r|G_{F_v})^{F-ss} ≅ ι⁻¹rec(Π_v|det|^{(1−n)/2})` with monodromy for every `v | ℓ`. The README's reading of AG2.6 (de Rham labels unconditional, Weil–Deligne comparison conditional on the irreducibility input) matches. |
| EndoscopicTransferAndUnitaryTraceComparison §§13.1, 13.4 (67, 1274, 1278) | #999, lines 5041 and 5101: weak automorphic base change of a `U(V)` representation to a finite isobaric sum of discrete representations of `GL_N(𝔸_F)`, matching unramified parameters almost everywhere, unique by strong multiplicity one; §13.4 produces it for standard pairs with regular algebraic infinity type, the definite case by Labesse Corollaire 5.3. `ltxzz line 1160` (Definition 3.2.1(1), p. 26): standard definite means signature `(N,0)` at every real place, no finite-place condition, so Tung's definite group, an outer form of `GL₂` definite at infinity and quasi-split at finite places (CEG+16 §2.1, `ceggps line 607`–`631`), is `U(V)` for a standard definite `V`. `ltxzz line 1234` (Definition 3.2.7, p. 27) states the standard-pair condition with trivial coefficients; the supplier's §13.4 extends to regular algebraic infinity types through Labesse, as its hypotheses say. |
| IntegralHeckeAndGaloisDeterminants Layers 0–1 (67, 1278) | #1689, Layer 0 (585): polynomial laws and determinants; Layer 1 (1858): Cayley–Hamilton algebras, “§1.2 Field structure and semisimple reconstruction”, “§1.3 Henselian lifting and generalized matrix algebras”. |
| AutomorphicGaloisRepresentations §3.13 (65, 1262) | #1007, line 1769: a continuous character of `G_K`, unramified outside finitely many places and de Rham at every `v | ℓ`, is the `λ`-adic avatar of an algebraic Hecke character after enlarging the coefficient field. Exactly the step the rank-two proof uses. |
| AutomorphicGaloisRepresentations §6.9 (65, 1274, 1278) | #1007, line 2757: a continuous degree-two determinant over a complete local `T` whose residual law comes from an absolutely irreducible rank-two representation over the finite residue field lifts to a continuous representation into `GL₂(T)`, unique up to conjugacy; the generic theorem is IntegralHeckeAndGaloisDeterminants §1.3's, which the README also cites. |
| AutomorphicLFunctionsAndLocalFactors AL.3 (68, 1262) | #924, AL.3.7.2 (line 2193): equality of unramified components almost everywhere determines the multiset of cuspidal constituents of an isobaric sum, including multiplicities and norm twists, over a number field. |
| GlobalGaloisDeformations Layer G7 (55, 1274, 1278) | #920, Layer G7 (1872): §8.1 polarized deformation problems with `𝒢ₙ`, `p` odd, `S` a finite set of places of `F⁺` split in `F` containing those above `p`; §8.5 Taylor–Wiles places in rank `n`. The README uses it only for odd `p`. |
| ArithmeticGaloisRepresentations Layer 5 (1262) | #856, line 3134: recognition by Frobenius polynomials. |

### Seeded source sample, where it falls in the changed passages

| Sampled target | Locator read and comparison |
| --- | --- |
| Modularity transfer along congruences (`R33.1/dp-modularity-lifting-inputs`, README 1322) | `dp line 140`–`147` Theorem 1.4 (p. 4: `p` odd, `ρ̄|G_{ℚ(√p*)}` absolutely irreducible, de Rham with Hodge–Tate weights `{0,k−1}`, `k > 1`, `ρ̄` modular), `dp line 157`–`162` Theorem 1.5 (`p = 2`, non-solvable image), `dp line 166`–`172` Theorem 1.6 (`p ≥ 5`, irreducible, `ρ̄^ss = χ₁ ⊕ χ₂`), `dp line 174`–`180` Theorem 1.7 (`p = 3`, `ρ̄^ss ≅ 1 ⊕ χ̄₃`, `ρ|D₃ ≠ 1`, `ρ|I₃ ≅ (∗,∗;0,1)`, `det ρ = ψχ₃^{k−1}`), `dp line 308` Remark 4 (p. 7). The restatement and the printed `ρ|D₃` condition are as before; the added sentence (each theorem is an instance of I.3's lifting hypothesis) is checked in the table below. |

The other fourteen sampled targets lie in passages the diff does not touch; their locator checks are in the previous report's sample table and were not redone.

New source locators read this round: `blggt line 1473`–`1475` (extreme regularity, p. 32) and `blggt line 3787`–`3836` (Theorem 5.5.2 and proof, pp. 81–82); `ceggps line 648` (§2.3 “Unitary groups”, p. 17, through `line 743`, p. 20), `ceggps line 744` (§2.4 “Galois deformations”, p. 20, through `line 892`, p. 23, including item 3, the deformation of type `S_{Q_N}` valued in the localized Hecke algebra), `ceggps line 885` (Remark 2.7, p. 23: Labesse Corollaire 5.3 for base change and Caraiani for local–global compatibility), `ceggps line 2533` (Lemma 4.17, p. 62: `R_∞(σ)` reduced and `𝒪`-torsion free, the `H(σ)`-action through `R^□(σ)`); `ltxzz line 1160`, `1194`, `1234`, `1248`–`1250` (Definitions 3.2.1, 3.2.3, 3.2.7 and Proposition 3.2.8, pp. 26–27). All agree with the README's page numbers and statements, except the Theorem 5.5.2 parenthesis of R01.

### Computed adversarial pass

Rows for the changed statements carry computed values; rows for untouched statements are carried from the previous report, each marked.

| Statement / object | Instances and computed values | Result / change |
| --- | --- | --- |
| `R33.1/rank-two-unitary-irreducibility`, hypothesis of cuspidality | `ψ₁ ⊞ ψ₂` for conjugate-self-dual algebraic Hecke characters with distinct infinity types at every `τ`: Hodge–Tate labels `{a₁(τ), a₂(τ)}` distinct, so regular algebraic; `(ψ₁ ⊞ ψ₂)^c = ψ₁⁻¹ ⊞ ψ₂⁻¹ = (ψ₁ ⊞ ψ₂)^∨`; Galois representation `χ₁ ⊕ χ₂`, reducible; not cuspidal | Pass: the first Check is the negative control |
| same, proof route | reducible semisimple rank two `⇒ χ₁ ⊕ χ₂`; each `χ_i` a subquotient of a de Rham representation, hence de Rham, unramified outside the ramification set of `r`; §3.13 gives `ψ_i`; at a good split place `v`, `P_v(Π_v;X) = (X − χ₁(Frob_v))(X − χ₂(Frob_v))`, the polynomial of `ψ₁ ⊞ ψ₂` after the norm twist of AG2.0's normalization; AL.3.7.2 gives `Π ≅ ψ₁ ⊞ ψ₂`, which is not cuspidal | Pass |
| same, the `G_L`-restriction control | `L/F` quadratic CM, `θ ≠ θ^σ`: `Ind θ` irreducible of dimension `2`, `Ind θ|G_L = θ ⊕ θ^σ` reducible; the target asserts irreducibility over `F` only | Pass (second Check) |
| same, residual control | level-`11` weight-`2` form at `p = 5`: `ρ̄ ≅ 1 ⊕ χ̄₅` (Eisenstein congruence `a_ℓ ≡ 1 + ℓ (mod 5)`), base change to an imaginary quadratic field in which `5` splits stays reducible residually while `r` is irreducible | Pass (third Check) |
| Extreme regularity in rank two (BLGGT §2.1) | labels `{a_{τ,1}+1, a_{τ,2}}` with `a_{τ,1} ≥ a_{τ,2}`: the two singletons have sums `a_{τ,1}+1 > a_{τ,2}`, distinct; one two-element subset; so every dominant rank-two weight is extremely regular at every `τ` | Pass: the rank-two case of AG2.6's hypothesis has no weight condition, as the README says |
| Direction of the implication into AG2.6's hypothesis | `ExtremelyRegularIrreducibility 2` asks irreducibility for some `(ℓ′, ι′)` per `(F₁, Π₁)`; the target gives it for every `(ℓ, ι)`; a statement for one `ℓ′` only would also suffice, a statement for `ℓ′` in a density-one set (BLGGT 5.5.2) suffices too | Pass; the citation parenthesis overstates the source (R01) |
| Polarized admissibility applied to conjugate-self-dual `Π` | `χ = 1`, so `w = 0` (AG2.0 line 703); total oddness `χ_v(−1) = 1 = (−1)^{2+0}`; AG2.6's admissibility target is stated for every polarized regular algebraic cuspidal `(π,χ)` | Pass |
| `R33.1/global-arithmetic-action`, Hecke–Galois input: alternatives to cuspidality | weak base change is a finite isobaric sum of discrete representations of `GL₂(𝔸_F)` with the regular cohomological infinitesimal character: cuspidal `Π`; `ψ₁ ⊞ ψ₂`; `χ ∘ det = χ|·|^{1/2} ⊞ χ|·|^{−1/2}`. The last two have attached representation `χ₁ ⊕ χ₂` or `r(χ)ε ⊕ r(χ)`, reducible, so `ρ̄` reducible, contradicting a non-Eisenstein `𝔪` | Pass: “isobaric sum of two characters” covers the one-dimensional case with the norm twists |
| same, reducedness and the determinant law | the Hecke algebra on `𝒪`-valued forms embeds in its `E`-span, a product of fields (normal operators on a finite-dimensional space), so is reduced and finite; `ceggps line 2533` Lemma 4.17(1) for `R_∞(σ)`; over an Eisenstein `𝔪` the glued law stays a determinant law with no `GL₂(𝕋_𝔪)`-valued lift (fourth Check); an `𝒪/ϖ^r`-coefficient algebra is not reduced, and the README states reducedness only for the finite-level `𝒪`-algebra | Pass |
| same, the `𝒢₂` extension | `ρ_𝔪^c ≅ ρ_𝔪^∨ ⊗ μ` with `ρ̄` absolutely irreducible; G7 §8.1 is stated for `p` odd with `S` split, which is the only case the unitary tower is used for (`p = 2` is quaternionic) | Pass |
| `I.3/residual-links-and-modularity-transfer`, the lifting-hypothesis form | instances: Theorem 1.4's class (`p` odd, Hodge–Tate `{0,k−1}`, `k > 1`, `ρ̄|G_{ℚ(√p*)}` absolutely irreducible), 1.5's (`p = 2`, non-solvable image), 1.6's (`p ≥ 5`, irreducible, `ρ̄^ss` reducible; the residual-modularity clause is then idle, the theorem being unconditional), 1.7's (`p = 3`, the inertia shape); transfer: `ρ` modular `⇒ ρ̄` modular `⇒ ρ′` modular, and symmetrically; members in different classes: nothing asserted; `ρ̄` not modular: hypothesis fails, nothing asserted | Pass (R04 repaired) |
| `R33.1/dp-modularity-lifting-inputs`, added sentence | each of 1.4–1.7 as above; the biconditional `ρ` modular `⟺ ρ′` modular is the two applications of the instance | Pass |
| Consumers bullet (README 78) | GL2ModularityLifting Layers 8–9 at #1071 lines 2191, 2387; CompletedCohomologyAndLocalGlobalCompatibility Layer 5 at #1270 line 1751 with §5.1 “The patched module `M∞`”, §5.4 and §5.6 (Tung); positions 155 and 235 > 150 | Pass (R03 repaired) |
| TuA §4 labels (README 1301) | `tua line 620` Theorem 4.1 (p. 12), `641` Lemma 4.2 (p. 13), `663` Corollary 4.3 (p. 13) | Pass (R02 repaired) |
| `R33.1/global-arithmetic-action` rank | `A` versus `A ⊕ A`: equal support, generic ranks `1`, `2`; Tung's module has rank `1` with the `U_ϖ_{v₁}` operator and `2` without (r3 table); the supplier gap of r3 R01 is closed by the new paragraph and target | Pass |
| `IsFrobAt` convention Check | `u³+u+1 = 0` in `𝔽₈`: `Frob(u) = u²`; `Frob⁻¹(u) = u⁴ = u·(u+1) = u²+u ≠ u²`. In `𝔽₄`, `v² = v+1` for both | Pass (R06 repaired) (r3 table, text unchanged) |
| `IsUnramifiedAt` | inertia matrix `I₂`: in kernel; `(1,1;0,1)`: invariants of dimension `1`, not in kernel; unramified character with Frobenius `−1`: inertia value `1` | Pass (r3 table, text unchanged) |
| `IsOdd` over `𝔽₂`, `ℚ`, `𝔽₃` | trivial over `ℚ`: `1 ≠ −1`; over `𝔽₂`: `1 = −1`; `diag(1,χ̄₃)(c)`: `det = 2 = −1` | Pass (r3 table, text unchanged) |
| `IsAbsIrreducible` | trivial: span `1`; diagonal: span `2`; `GL₂(𝔽₂)` natural: span `4` | Pass (r3 table, text unchanged) |
| `IsSType` on the `S₃` field of `X³−4X+1` | discriminant `−4(−4)³ − 27 = 229`, prime, positive, so totally real; standard action over `𝔽₅`: conjugation `I₂`, `det 1 ≠ −1`; via `GL₂(𝔽₂)`: `det 1 = −1` | Pass (r3 table, text unchanged) |
| `coeff` and `coefficientRing` | `Δ`: `a₀ = 0`, `a₁ = 1`, `a₂ = −24`; level `11`: `a₂ = −2`; generated subring of `ℤ`-valued data is `ℤ` | Pass (r3 table, text unchanged) |
| `ArisesFrom`, level `11` | `p = 3, ℓ = 2`: trace `−2 ≡ 1`, det `2`; trivial action `2, 1`; `p = 7`: dual det `2⁻¹ = 4 ≠ 2` | Pass (r3 table, text unchanged) |
| `ArisesFrom`, `Δ` at `691` | `τ(2) = −24 ≡ 667`; `1 + 2¹¹ = 2049 = 2·691 + 667`; `2¹¹ = 2048 ≡ 666` | Pass: reducible attachment admitted, excluded only by S-type (r3 table, text unchanged) |
| `ArisesFrom` exponent `k.toNat − 1` | `k = 2`: exponent `1`; `k = 1`: `0`; `k ≤ 0`: `0` (junk, outside the stated `k ≥ 2`) | Pass (r3 table, text unchanged) |
| `IsProjConj` | `I₂ = z·(2I₂)` with `z = 1/2`; unipotent off-diagonal `1 ≠ 0` | Pass (r3 table, text unchanged) |
| `primesOfRat` | `(3)` has norm `3`; inverse image of `{4}` empty; `∅ ↦ ∅` | Pass (r3 table, text unchanged) |
| `auxiliaryPrimes`, `p = 5` | `409`: residues mod `8,3,5` are `1,1,4`; `41`: `1,2,1`; `13`: `5,1,3`; `5`: `5,2,0` | Pass (r3 table, text unchanged) |
| `lemma_8_2` hypotheses | non-solvable subgroup of `GL₂(𝔽_p)` fixing a line over `𝔽̄_p` lies in a Borel, which is solvable; so irreducibility is implied, as the docstring says | Pass (r3 table, text unchanged) |
| Lemma 8.2 compatibility | `p ≡ 1 (mod 4)`: `(q/p) = (−1/p) = 1` for `q ≡ −1 (mod p)`; `det ρ̄(c) = −1` is a square mod `p`, so `ρ̄_proj(c) ∈ PSL₂(𝔽_p)` | Pass (r3 table, text unchanged) |
| Auxiliary level `N′` | `N = 1,4,5,11 ↦ 5,20,5,11`; `N = 0 ↦ 0` | Pass (r3 table, text unchanged) |
| `khare_level_one` at `p = 2, 3` | no S-type level-one representation exists (Tate, Serre), statement vacuous there; `Δ` at `p = 11` is a weight-`12` witness | Pass (r3 table, text unchanged) |
| `finite_level_one_semisimple`, reducible case | characters unramified outside `p` factor through `(ℤ/p)^×`: at most `p−1` each, at most `p(p−1)/2` unordered pairs | Pass (r3 table, text unchanged) |
| `weight_one_artin_modularity` conclusion | the level `N` of `f` equals the Artin conductor of `ρ ≅ ρ_f` (Deligne–Serre), so unramifiedness at `ℓ ∤ N` holds | Pass (r3 table, text unchanged) |
| Soluble base change Checks | `5 ≡ 5 (mod 8)`: `2` inert in `ℚ(√5)`; `4² = 16 ≡ 5 (mod 11)`: `11` splits; `S = S′ = {2}` with quadratic `E₂`: degrees `2` versus `1` | Pass (R03 repaired) (r3 table, text unchanged) |
| Moret-Bailly Checks | `2/3 ∈ (0,1)`, `v₂ = 1`; `1/2`: `v₂ = −1`; `D = ℚ(√2,√3)`: one generating class fixes `√6` | Pass (r3 table, text unchanged) |
| Nearly ordinary projector | `4^{n!} mod 9`: `4, 7, 1, 1`; `v₃(4^{n!}−1) = 1+v₃(n!)`: `1,1,2,2,2` for `n = 1..5`; `3^{n!}` valuations `1,2,6` | Pass (R04 repaired) (r3 table, text unchanged) |
| Ordinary control | identity on `𝒪`: kernel `0`; `𝒪 → 𝒪/π`: kernel `(π)`, generic fibre `0` | Pass (R05 repaired) (r3 table, text unchanged) |
| Auxiliary local quadratic | `(α,β,γ,c,ψ) = (3,2,1,2,6)`: `α−β = 1 = γ(c−1)`, `αβ = 6`; `β²+βγ(c−1)−ψ = 4+2−6 = 0`; printed sign: `4−2−6 = −4` | Source correction confirmed (r3 table, text unchanged) |
| Smoothness derivative | `2β + γ(χ′(τ)−1) ≡ 2r_F` since `η_q^i ≡ 1`; unit for odd `p` | Pass (r3 table, text unchanged) |
| Finite auxiliary-prime estimate | all `2422` primes `5 ≤ p ≤ 21591`: least non-Fermat `P`, exact odd prime power `ℓ^e ∥ P−1` with `ℓ ≤ p` and `(m+1)P+m ≤ (2m+1)p` found for every one; `(5,7,3),(7,11,5),(11,13,3),(13,19,9),(17,19,9),(19,23,11),(23,29,7),(29,31,5),(31,37,9)`; `(251,263,131)`; `(21589,21599,10799)`: `116639999 ≤ 233139611` | Pass (r3 table, text unchanged) |
| Khare's inequality (1) | `p = 31, P = 37, m = 4`: `189 ≤ 279`; `p = 13, P = 19, ℓ^e = 9`: `99 ≤ 117`; right side of (1) minus `3/2 − 1/p` equals `((m−1)/2 + 1/p)/(m+1) ≥ 0` | Pass (r3 table, text unchanged) |
| Ratio bound | `1499/1000 ≤ 3/2 − 1/p` iff `p ≥ 1000`; `36/25 = 1.44 < 1.499`; `263/251 = 1.0478 < 1.4667 = 3/2 − 1/30` | Pass (r3 table, text unchanged) |
| Consecutive-prime ratio | all primes `31 ≤ p ≤ 300000`: `max P/p = 37/31 = 1.1935 < 1.2`; least non-Fermat ratio for `p < 100000` also `1.1935 < 1.499` | Pass (r3 table, text unchanged) |
| Nagura interval | every integer `25 ≤ n ≤ 100000` has a prime `P` with `n < P` and `5P < 6n`; `n = 24`: none; `n = 100000`: `100003` | Pass (r3 table, text unchanged) |
| Nagura constants | `229/250 = 0.916`, `1159/500 = 2.318`, `543/500 = 1.086`, `10851/10000 = 1.0851`; `(10851/10000)(1806/1805) = 1.08570 < 1.086` | Pass (r3 table, text unchanged) |
| Large-range positivity | `x = 100000`, `y = 120000`: `0.916y − 2.318 − 1.086(x + √y + y^{1/3} + y^{1/5}) = 876.65 > 0`; leading coefficient `0.916·1.2 = 1.0992 > 1.086` | Pass (r3 table, text unchanged) |
| Stirling remainder | `x = 1`: `0 − (−1 + log(2π)/2) = 0.08106`, between `0` and `1/12 = 0.08333` | Pass (r3 table, text unchanged) |
| Printed Chebyshev bound | `B = 1.2·0.921`: `B·31/log 31 = 9.98 < π(31) = 11`; `B·100/log 100 = 24.0 < π(100) = 25` | Source error confirmed (r3 table, text unchanged) |
| Weight-interval containment | `(31,37,9)`: `L = 4`, `j ∈ (16,20]` gives `(j+2, P+1−j) = (19,21),(20,20),(21,19),(22,18)`, all `≤ 32`; both bounds reduce to `(m+1)P ≤ (2m+1)p − m` | Pass (r3 table, text unchanged) |
| Dyadic inequality (2) | `(13,17,4)`: `(8+2)·17 + 6 = 176 ≤ 208`; even `i ∈ [8,10]`; interval length `2(P−1)/2^e = 2` | Pass (r3 table, text unchanged) |
| Terminal rows, coset rule `j ≡ k−2 (mod (P−1)/ℓ^e)`, `j` even | `P = 7, L = 2, k = 8`: `j ∈ {2,4}` returns `(4,6),(6,4)`; `P = 11, L = 2`: `j = 4` returns `(6,8)`; `P = 19, L = 2`: `j = 8` returns `(10,12)`; `P = 29, L = 4`: `k = 22`: `j ∈ {4,…,24}`, `j = 16` returns `(18,14)`; `k = 24`: `j ∈ {2,6,…,26}`, `j = 14` returns `(16,16)`; `P = 31, L = 6, k = 32`: `j ∈ {6,12,18,24}`, `j = 18` returns `(20,14)`, `j = 12` returns `(14,20)`; `16 ∉ {6,12,18,24}` | Pass; printed `16` inadmissible (r3 table, text unchanged) |
| Bad-dihedral arithmetic | `p = 2k−3` at `(7,5)`: `gcd(8,4) = 4`, `8/4 = 2`; weight `2`: excluded primes `3` and `1`; `N ≡ 1 (mod 8)` and `p = 5` are not `3 (mod 4)` | Pass (r3 table, text unchanged) |
| Dickson dyadic refinement | `|PGL₂(𝔽₄)| = 60`, Borel order `12 = |A₄|`; `2`-power-order elements are unipotent of order `≤ 2`, `S₄` has order-`4` elements | Pass (r3 table, text unchanged) |
| Good-dihedral algebraic Check | `41 = 5·7 + 6`: `ζ₇^{41} = ζ₇^{−1}`; `41 ≡ 1 (mod 8)`, `7 | 42`, `7 > max(1,5,2)`; `13 ≡ 5 (mod 8)`; `241`: residues mod `8,3,5` are `1,1,1`, mod `7` is `3 ≠ 1` | Pass (r3 table, text unchanged) |
| Paso 2 insertion data | `406561` prime, `≡ 1 (mod 8,3,5,7,11)`, `≡ 12 ≡ −1 (mod 13)`; `13 | 406562`, `13 ∤ 406560` | Pass (r3 table, text unchanged) |
| Dihedral local type Checks | `5²−1 = 24`, `|𝔽₂₅| = 25`; `(7,13)`: `7 | 14`, `7 ∤ 12`; `(3,7)`: `3 | 6 = N−1`, induction reducible | Pass (r3 table, text unchanged) |
| Order-three lattices over `ℤ[ζ]`, `π = ζ−1` | `D₀P = (ζ,0;ζ²,ζ²π) = PD₁` using `1+π = ζ`; `F₀P = (1,π;1,0) = PF₁`; `D₁ ≡ (1,0;1,1)`, `F₁ ≡ diag(1,−1) (mod π)`; `D₁³ = F₁² = 1`, `F₁D₁F₁⁻¹ = D₁²` by conjugation | Pass (r3 table, text unchanged) |
| Lemma 2.3 tame relation | `Frob₂ σ Frob₂⁻¹ = σ²` with `σ = (1,b;0,1)`, `Frob₂ = (α,x;0,β)`: `(1,(α/β)b;0,1) = (1,2b;0,1) = (1,−b;0,1)` in characteristic `3`, so `α = −β`; Steinberg eigenvalues `γ̃·{2,1}` reduce to `γ·{−1,1}` | Pass (r3 table, text unchanged) |
| Dyadic conductor in Theorem 3.4 | Steinberg: `a = 0 + 2 − 1 = 1`; `v₂(N(ρ̄)) = 0`; `r = 0` excluded, so `A ≤ r` | Pass (r3 table, text unchanged) |
| Très ramifiée over odd index | Kummer valuation `1 ↦ e·1`: odd for `e = 3`, even for `e = 2` | Pass (r3 table, text unchanged) |
| `(L_r)`, `(W_r)`, `(D_r)` Checks | `N = 2q²`: `4 ∤ N`, even; `N = 3·5·q²`: three primes; `N = 6`: `(D₁)` yes, `(D₀)` no | Pass (r3 table, text unchanged) |
| Theorem 3.4 auxiliary prime | `s` the largest prime below `p′ > 5`: `s ≥ 5 > 2`; projective inertia order `p′−1 ≥ 6` or `p′+1` | Pass (r3 table, text unchanged) |
| Paso 6 weights | level one and oddness: `k−1` odd, so `k ∈ {2,4,6}` in `[2,6]`; `4 = 3+1` is the BLZ endpoint | Pass (r3 table, text unchanged) |
| Almost-strict exceptions | odd unramified `ℓ` with reducible reduction: `ℓ ∉ S`, so clause (4) gives crystalline; ramified coefficient prime with reducible reduction: only de Rham | Pass (matches `dp line 285`–`301`) (r3 table, text unchanged) |
| Kisin's `p = 5` exception over `ℚ` | `PGL₂(𝔽₅) ≅ S₅` has abelianization `ℤ/2`, no `ℤ/4` quotient, so its field cannot contain `ℚ(μ₅)` | Pass (r3 table, text unchanged) |
| Weight-one reduction, Kodaira–Spencer | `H¹(ω^k(−C))` dual to `H⁰(ω^{2−k})`: zero for `k ≥ 3`, rank `1` for `k = 2`, `M₁(N) ≠ 0` for `k = 1` | Pass (r3 table, text unchanged) |
| Finite-flat export | elliptic `p`-torsion at good `p ≥ 5`: weights `{0,1}`, Serre weight `2`, `det = χ̄_p`, `ε = 1` | Pass (r3 table, text unchanged) |
| Mathlib `psi_sub_theta_le_psi_add_psi_add_psi` | statement at the pin: `ψ x − θ x ≤ ψ(x^{1/2}) + ψ(x^{1/3}) + ψ(x^{1/5})` for all real `x` (Costa–Pereira); exactly the inequality the README uses | Pass (r3 table, text unchanged) |
| `R33.1/type-support-and-cycles` exceptional type | très ramifiée: one noncrystalline component, coefficient `1`; peu ramifiée: `(1,1)`; crystalline-only `(1,0)` fails | Pass (r3 table, text unchanged) |
| Dyadic normalization | one determinant variable: weight cycle `2/2 = 1`; doubled module `4/2 = 2`; `t = 0`: factor `1` | Pass (r3 table, text unchanged) |

### Pinned-library audit

`Suggested.lean` is unchanged since the previous review; the pinned declarations it uses were opened there (file and line at the pin: `Mathlib/RingTheory/Frobenius.lean:40`, `Mathlib/Algebra/Group/Subgroup/Basic.lean:1177`, `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:259`, `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, `Mathlib/RepresentationTheory/Semisimple.lean:34`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104, 134, 164`, among others listed in that report). This round the build replayed the module at the same pins (`mathlib 6b7abb3c`, `TauCeti a91d3aa`), and the probe's elaborated types agree with the README statements; nothing changed.

Ownership against open pull requests was checked through the roadmap index for the objects the diff adds (rank-two irreducibility of conjugate-self-dual Galois representations; the Hecke-algebra Galois representation of a definite unitary tower): the only related statement is ModularityAndLanglandsExtensions §2.43 (later, density-one, rank `n`), and the Hecke-valued representation is built in CompletedCohomologyAndLocalGlobalCompatibility §5.1 only as a later generalization, which the README's consumers bullet now records.

## Not verifiable

- **Labesse, *Changement de base CM et séries discrètes*, Corollaire 5.3**: cited through EndoscopicTransferAndUnitaryTraceComparison §13.4 and CEG+16 Remark 2.7 (`ceggps line 887`); not read this round (Astérisque volume, no open text checked). The README cites the supplier section, not Labesse.
- **Chenevier–Harris, Theorem 3.2.3**, the source of AutomorphicGaloisRepresentationsPartII AG2.3's existence statement: the supplier's citation, not this README's; not read.
- **Kisin, *Modularity for some geometric Galois representations*; Kisin, *Modularity of 2-adic Barsotti–Tate representations*; Khare 1997; Skinner–Wiles 2001 correction**: unchanged since the previous rounds (DVI-only, paywalled, HTTP 403), as recorded there; the diff does not touch the passages that cite them.

## Source issues

The entries of the previous rounds (Khare §4, §6.1 and Proposition 2.2; Khare–Wintenberger I Theorem 9.1 and §3.2; Dieulefait–Pacetti Pasos 2–3, Remark 6 and the minimal-lift definition) stand and are not repeated. In the passages read this round (BLGGT §2.1 and Theorem 5.5.2; CEG+16 §§2.3–2.4, Remark 2.7, Lemma 4.17; LTXZZ §3.2; Tung §4 labels; Dieulefait–Pacetti Theorems 1.4–1.7 and Remark 4) no new mistake was found.

- none
