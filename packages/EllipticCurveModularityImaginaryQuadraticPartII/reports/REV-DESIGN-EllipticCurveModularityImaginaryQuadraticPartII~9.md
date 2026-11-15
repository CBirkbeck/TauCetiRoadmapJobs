<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6897475454 -->
Review (claude) of a8ff3f5

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Three route passages follow CaptainSude26 clause by clause

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md`:

   - §7.2, route for (a), lines 1140–1143: “spread the `I₃` model and `s` over the ring of integers with `Σ₀` inverted, so that the node and branch data, the thicknesses, good reduction of `E` and the unit leading coefficient of `1/j` persist”.
   - §4.2, route, lines 767–773: “take `σ ∈ G_{C_N}` with `ρ̄(σ) = diag(2, 3)` …, whose coinvariants … are the diagonal line, and multiply `σ` by an element of `G_{LC_N}` …” through “killed by the selected evaluations”.
   - §5.3, route, lines 914–919, and its first Check, line 933: “At full Iwahori level with trivial character …”.

   **Claim.** The References say all statements are in the roadmap's own words; `sources.toml` records for CaptainSude26 “no licence file: cite with provenance only, no passages”.

   **Witness.**

   - CaptainSude26 lines 521–524: seven consecutive words shared (“so that the node and branch data”), and the same six clauses in the same order (spread model and parameter, primes inverted, node and branch data, thicknesses persist, good reduction of `E`, unit leading coefficient of the inverse `j`), then line 529 (valuation large and prime to five).
   - CaptainSude26 lines 245–250 and 262–263: runs of four words (“are the diagonal line”, “by an element of”, “by the selected evaluations”), and the same seven steps in the same order.
   - CaptainSude26 lines 335–341: six consecutive words in the Check (“At full Iwahori level with trivial”), four in the route (“with trivial coefficient character”), and the same four clauses in order (unit acts as one, polynomial `(X − 1)²`, descent coefficient by coefficient, possibly nonreduced ring).

   **Repair.** Replace the three passages (and the Check) by the following, which keep every input and are checked against the same instances as the originals.

   §7.2, route for (a):

   > For (a): the degenerating family of §7.1 and its coordinate `s` are defined over a number field `K₁ ⊇ K`, hence over `O_{K₁}[1/n₀]` for some integer `n₀`. Let `Σ₀` consist of the prime divisors of `n₀`, the primes below the bad reduction of `E`, and the finitely many primes at which the reduced family is no longer a cycle of type `I₃` with nodes of thickness two and one before resolution, or at which the coefficient of `s³` in `1/j(A_t)` is not a unit. For `q ∉ Σ₀` split completely in `K₁`, §7.1(c)–(d) hold over `O_{K_v}`: `q_A = s³λ(s)` with `λ(0) ∈ O_{K_v}^×`, so `v(q_A) = 3v(s)` once `v(s) > 0`. Take `Ω_v` to be the set of `t` with `v(s) = m_v`, for one integer `m_v > 0` prime to five and large enough that `λ(s)` is a unit.

   (Tested: `m_v = 1, 7` give `v(q_A) = 3, 21`; `m_v = 5` gives `15` and is excluded, as in the first Check.)

   §4.2, route:

   > The route. Let `κ ∈ H_∅` be nonzero. By §4.1 it stays nonzero on `G_{LC_N}`, where it is a `Gal(LC_N/F)`-equivariant homomorphism to `M`; its values span a nonzero subrepresentation, hence all of `M`, since `ad⁰` is absolutely irreducible for `SL₂(𝔽₅)`. The element `g = diag(2, 3)` has distinct eigenvalues and `M/(Ad(g) − 1)M` is the line spanned by the image of `h`. As `L ∩ C_N = F`, some `σ₀ ∈ G_{C_N}` has `ρ̄(σ₀) = g`; for `γ ∈ G_{LC_N}`, which acts trivially on `M`, the cocycle rule gives `κ(γσ₀) = κ(γ) + κ(σ₀)`, and because the `κ(γ)` span `M` some `σ = γσ₀` has `κ(σ) ∉ (Ad(g) − 1)M`. This `σ` is the detecting class and `σ₀` a padding class for GlobalGaloisDeformations §5.6, which produces `Q_N`. Finally `H_{Q_N} ⊆ H_∅`, since a class vanishing on `G_{F_w}` is unramified at `w`, and the evaluations at the chosen Frobenius elements leave no nonzero class of `H_∅`.

   (Tested: `Ad(g)` has eigenvalues `4, 1, 4` on `e, h, f`, so `(Ad(g) − 1)M = ke ⊕ kf` and the quotient is the image of `h`.)

   §5.3, route sentence and first Check:

   > At `v ∈ P` the coefficient system is trivial on `Iw_v`, so the Hecke operators of the diagonal matrices with unit entries are the identity and the torus polynomial `P_{v,σ}` of the inertial comparison is `(X − 1)²` for `σ ∈ I_v`, whose image under local reciprocity is a unit. Each coefficient of this identity is an equation in the neat-level Hecke algebra, so it persists in every quotient reached through the non-neat comparison of CrystallineLocalGlobalCompatibilityCM §8.6 and the finitely many nilpotent ideals; Theorem 3.4 holds over every `A ∈ CNL_O`, reduced or not, and turns the identity into the unipotent-inertia condition.

   > - With trivial coefficients on the full Iwahori subgroup at `v ∈ P` the torus polynomial is `(X − 1)²`; with the coefficient character `χ_v⁻¹(a/d)` of the `R` places it would be `(X − χ_v(u))(X − χ_v(u)⁻¹)`, which is not the protected condition.

2. **F02** (P3) ArithmeticGaloisRepresentations Layer 1 does not hold decomposition groups

   **Location.** `design/README.md:264` “**ArithmeticGaloisRepresentations** Layer 1 (decomposition groups)”; line 369 (*Needs* of §1.2); `design/plan.json`, target 1.2, prerequisite `roadmap:ArithmeticGaloisRepresentations Layer 1`.

   **Claim.** Layer 1 of that roadmap supplies decomposition groups.

   **Witness.** ArithmeticGaloisRepresentations at its open head: line 768 “## Layer 1: continuous representations and integral models”; line 1600 “## Layer 2: decomposition groups, inertia and Weil–Deligne representations”.

   **Repair.** In the three places write “ArithmeticGaloisRepresentations Layer 2 (decomposition groups)”. Tested: Layer 2's standing paragraph restricts a global representation to the places of a number field, which is what §1.2(a) uses.

3. **F03** (P3) §2.3, first Check: the last sentence is false

   **Location.** `design/README.md:484–486`: “at a potentially good place with nontrivial inertia the factor is `1` … Weil semisimplification alone cannot distinguish the first two.”

   **Claim.** The Weil representation without `N` cannot tell a split multiplicative place from a potentially good place with nontrivial inertia.

   **Witness.** At a split multiplicative place the Weil representation is unramified (geometric Frobenius eigenvalues `1, q_v`); at the second it is ramified on inertia. They differ before `N` is consulted.

   **Repair.** Replace the last sentence by: “Without `N`, the split multiplicative parameter (unramified, Frobenius eigenvalues `1` and `q_v`) is that of the reducible unramified principal series, whose factor has degree two; the monodromy operator is what separates them.” Tested at `q_v = 4`: both have Frobenius polynomial `(1 − T)(1 − 4T)`; the factors are `(1 − T)⁻¹` and `((1 − T)(1 − 4T))⁻¹`. Change the matching test of target 2.3 in `plan.json`.

4. **F04** (P3) §4.2, second Check: one framed protected place does not make `H_Q` nonzero

   **Location.** `design/README.md:783–786`: “If a protected place were put into the framing set `T` … `H_Q` never vanishes.”

   **Witness.** For `P = {v₁, v₂}`, moving `v₁` into `T` leaves the condition `L_{v₂}^⊥`; by §4.1 the inflated class is ramified at `v₂`, so it is still excluded.

   **Repair.** Begin the Check “If every protected place were put into the framing set `T` (so that no dual condition remains at a protected place), …”. Tested on `P = {v}`: the class is then unconstrained at `v` and locally trivial at every Taylor–Wiles prime.

5. **F05** (P3) §7.2, route for (b): “an odd `d ≠ q`”

   **Location.** `design/README.md:1144–1146`: “the `d`-torsion is locally constant for an odd `d ≠ q`, hence unramified, so nearby fibers are semistable (NeronModelsAndSemistableAbelianVarieties §3.12)”.

   **Witness.** `d = 1` is odd and `≠ q` and gives no information; `d = 3q` is odd and `≠ q` but not invertible in the residue field. That §3.12 asks for `N ≥ 3` invertible in `k`.

   **Repair.** Write “for a prime `d ≥ 3` with `d ≠ q`”. Tested: `d = 3`, `q ≥ 7` meets `N ≥ 3`, `N ∈ k^×`.

6. **F06** (P3) Letters fixed by the Conventions reused with another meaning

   **Location.** `design/README.md:326, 332` (§1.1: intermediate field `E`, complex conjugation `ι`); line 647 (§3.4: `ψ`); line 879 (§5.2: `χ`); lines 1105–1107 against 1191–1213 (Layer 7: `w` the reflection in §7.1, `w` a place in §7.4).

   **Claim.** After rounds 7 and 8 each symbol of the Conventions denotes one object.

   **Witness.** Conventions, lines 103–109: `E/K` is the elliptic curve, `c` is complex conjugation, `w` the reflection, `η, ψ` characters of orders `3, p`, `χ = ηψ`; `ι` is `Q̄₅ ≅ ℂ` in Layers 5–6.

   **Repair.** In §1.1 write the intermediate field as `K'` and the complex conjugation of `L̃` as `c`. Add to the parent-notation bullet of the Conventions: “The characters `η, ψ, χ` of the covers occur in Layer 2 only; in §3.4 `ψ` is the unramified determinant character and in Layer 5 `χ = (χ_v)` is the tuple of tame characters at `R`. The reflection `w` occurs in §7.1 only; elsewhere `w` is a finite place.” Tested: a search of `V_χ`, `V_ψ`, `η` finds them in the Conventions, How to read the build and Layer 2 (and `V_η` in §8.1, which the sentence should then name: “Layer 2 and §8.1”); `⟨w⟩` occurs in the Conventions and §7.1 only.

Both findings of round 8 are repaired. The mathematics of all 28 targets was recomputed and no statement is false, vacuous or missing a hypothesis. One blocking finding remains (R01, P2): three route passages follow the proofs of CaptainSude26, a manuscript with no licence, clause by clause. Five P3 findings follow, each with an exact repair. The declared gap `acc-torsion-inertial-comparison` is precise, minimal and declared in both files; it is not a finding. This is a design: there is no `Suggested.lean`, and this lane does not elaborate.

## Verified sound

### Round-8 findings

- **F01 (two letters with two meanings): repaired.** §3.3 Checks, lines 632–635: “a split Tate curve `E/F_v` with Tate parameter `q_E` and `p ∤ v(q_E)` … `q_E = ϖ_v⁵`”; Layer 3 Examples, line 715: “`v(q_E) = 1`”; Conventions, lines 133–134: “The matrix `U = 1 + e` … occurs in Layers 3–6 only, the parameter open `U ⊂ 𝔸¹_K` in Layers 2 and 7 only”; lines 112–113 for `t`. The added hypothesis “for `ℓ` prime to the residue characteristic” (line 265) agrees with ArithmeticGaloisRepresentations §6.3 (“for `ℓ ≠ p`”, and its Check `q = 3³` over `ℚ₃`). The same pattern on other letters is R06.
- **F02 (page locator): repaired.** Line 1332: “§4 setting, p. 6 (lines 264–289)”; CaptainSude26 page markers at lines 257 and 304.

### Adversarial table (values computed this round)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, tame witness | `q_v = 11, 7`, `p = 5` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ = 3` | holds |
| Conventions, `ad⁰` | `D = Ad(U)` | `Uh = h − e`, `D(h) = h − 2e`; `Uf = f + E₁₁`, `D(f) = f + h − e`; Gram determinant `1·(0 − 2) = −2` | holds |
| §1.1 | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `S = {1,2}`; `ℚ(√−3)`, `S = {4}` | `{1, 9, 13, 17}` cyclic of order 4, three intermediate fields; `L = K`; `L = ℚ(ζ₁₂)`; fixed field of `c` in `K'` has only real embeddings | holds; `ℚ(√5)` shows `K ⊆ K'` is needed |
| §1.2 | `1 ⊕ 1` over `𝔽₃`; `ℚ`, `ℚ(ζ₃)` | ratio `1 ≠ 2` at `q = 2`; over `ℚ(ζ₃)` split `q ≡ 1`, ratio `1 = q` | converse fails, as the Check says; agrees with AG2.7's Check `(1,1)`, `q = 2` |
| Layer 1 Examples | `{1, 29} ⊂ (ℤ/60)ˣ` | `29 ≡ −1 mod 15`, `≡ 1 mod 4`, `≡ 4 mod 5`, `≡ 2 mod 3`; degree `16/2 = 8` | holds |
| §2.1 | parent §7.4(1), pair `(3,5)`; §5.3 | irreducible on `G_{F(ζ₅)} ⊆ G_{K(ζ₅)}`; witness `q` split in `F`, so `F_w = K_v = ℚ_q`; `cm_modularity` asks only `ζ₅ ∉ L` | holds; `ζ₅ ∉ F` not used |
| §2.2 | lifts at `p, 3, p` | clause (4) of CN23 Theorem 5.2 is for `p = 5` (line 3856); `χ_(h(t))² = 1` | holds with `ζ₅ ∈ K` |
| §2.3 | `q_v = 4`, `a = 4`; `z = i` | `(T − 2)²`, unitary roots `2/√4 = 1`; `diag(i, −i)`, trace `0`, determinant `1`; first Check: Weil representations differ on inertia | theorem holds; Check 1 is R03 |
| §2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)` | `ℚ(i) ⊆ ℚ(ζ₈)`; `ℚ(ζ₈, ζ₃) = ℚ(ζ₂₄)` | both branches occur |
| §3.1 | `X = [[a,b],[c,−a]]`; `diag(2,3)`; characteristic 2 | commutators `[[c,−2a],[0,−c]]`, `[[−b,0],[2a,b]]`; `2·3⁻¹ = 4`, `3·2⁻¹ = 4`; `1 ∈ ad⁰` fixed | invariants zero iff `2 ∈ k^×` |
| §3.2 | `p = 3, 5, 7` | norm `5 + 10(D−1) + 10(D−1)²`; `(D−1)M = ke ⊕ kh`; `p = 3`: `(D−1)²f = −2e = e`, `ker = (D−1)M`; `p = 7`: norm `(D−1)⁶ = 0` | dimensions `0, 1, 1`; consistent with §7.7 of the supplier at `𝔽₃` |
| §3.3 | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` | `M² = [[−1,1],[−1,0]]`, `M³ = 1`, `Φ² = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M²`, `11 ≡ 2 mod 3` | not protected, as stated |
| §3.4 | `N = [[a,b],[−a²/b,−a]]`; `(1+εf)U`, `(1+εh)U`; `diag(11,1)` | `tr N = 0`, `det N = 0`; `N² = 0` and `b` a unit force `tr = det = 0`; `(1+N)^(q_v) = 1 + q_v N`; traces `2 + ε`, `2`; `11·12² = 1584` | (i)⇔(ii); three free parameters `a, b−1, z−[z̄]` |
| §3.5 | `q_v ≡ 1`, `2 mod 5`; `p = 3` | `M^(I) = ke`, `φ` scales `e` by `q_v`; `dim L_v = 3 − (3 − h⁰)`; `Z¹`: `3 + 1`, `B¹`: `2`; `Σ_{i<q} Dⁱ = 1` needs norm `0`, false at `p = 3` | (a)–(d) hold; `p ≥ 5` in (d) needed |
| §4.1 | `G × A`; inertia of order 2 | `H¹(A, M^G) = 0` so `H¹(G × A, M) = H¹(G, M)`; `Hom(ℤ/2, M) = 0` | holds |
| §4.2 | `g = diag(2,3)`; `P = {v₁, v₂}` | eigenvalues `4, 1, 4`; `κ(γσ₀) = κ(γ) + κ(σ₀)`; with `v₂` left in `P` the class is still excluded | theorem holds; Check 2 is R04 |
| §4.3 | `(d,t,r) = (2,1,6)`, `(2,3,10)` | `g = 0`, `6`; `1 + 9 + 4 = 14`, `14 + 6 = 20 = r + 4t − d`, `1 + 11 + 10 = 22` | deficit `d`; formula agrees with CrystallineLocalGlobalCompatibilityCM §9.3 (`q − 3[F⁺:ℚ] − 1 + |S|`) |
| §5.1 | degrees multiples of 4, `≥ 8` | `a + a' < d/2` forces `d > 32`; `36`: `12+12+12` gives `24 ≥ 18`, `8+8+8+12` gives `20 ≥ 18`; `40`: `(8,8,24)` fails at 24, `(8⁵)` gives `24 > 20` | minimal `d = 40` |
| §5.2 | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·11 = 111 = 1 + 30 + 80` | holds |
| §5.3 | `u ∈ R`, `v ∈ P`, `w ∈ Q`; `q_w = 11` | conjugates outside `R ∪ P ∪ Q` lie outside `S ∪ Q`; ACC23's conditions on `(S ∪ Q) ∪ (S ∪ Q)^c` follow from (i) and §4.2; index `12`, `60`; `(1+ε)¹¹ = 1 + ε` | hypotheses of ACC23 Theorem 3.1.1 met |
| §5.4 | `r = 111` | `g = 111 − 120 − 1 + 10 = 0`; `111`, `151` | deficit `40 = l₀` |
| §6.1 | `v ∈ P`, `v^c` | `ρ` unramified at `v^c` and `ρ̄` ramified on `P` give `v^c ∉ P ∪ {v}`; index-5 completion gives `U⁵ = 1` | `P'^c ∩ S' = ∅` reachable |
| §6.2 | `⟨SL₂(𝔽₅), μγ⟩`; determinant of order 4 | `det(μγ) = 4`, `(μγ)² = diag(2,3)`, orders `240`, `120`; `240 > 120` | `ζ₅ ∈ F` is a real hypothesis; matches CN23 Lemma 6.1.4 |
| §7.1 | fixed nodes; `p = 101` | `2rT' = c₀ − 2P₀` has one solution mod 3; arithmetic genus `3 − 2 + 1 = 2` against `2 − 2 + 1 = 1`; `606`, `303` | type `I₃`, thickness `2 + 1` |
| §7.2 | `v(s) = 1, 5, 7`; `d = 1`, `3q` | `3, 15, 21`; `d = 1` gives nothing, `3q` not a unit | (a), (b) hold; wording is R01, R05 |
| §7.3 | `v(q_A) = 3, 15`; non-split | `[[1,3],[0,1]]`, trivial; Frobenius diagonal `−1`, inertia unchanged | holds |
| §7.4 | parent `switch_five`, `hilbert_local_selection` | no `ζ₅` hypothesis; finitely many nonempty opens allowed; trivial completions keep `L_{w'} = F_w` | holds; `Σ = ∅` is `switch_five` |
| §7.5 | transvections with entry `3`; `K ∋ ζ₅` | generate `SL₂(𝔽₅)`; `det = ε̄₅` trivial; split `q ≡ 1 mod 5`, `v ≠ v^c`; `A'[5]` ramified at `v` forces `5 ∤ v(q_{A'})` | hypotheses of Theorem 6.2 over `L` met |
| Theorems 2.5, 6.2, 8.1 | `ℚ(i)`, `K₆₀`, `ℚ(ζ₅)`, `ℚ(i, √5)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)` | `ζ₅ ∈ K`: no, no, yes, no, yes, yes; `K₆₀(ζ₅)` has fixer `{1}` | branches exhaustive |

### Sources: the seeded sample

No locator is flagged unverified. All eight manifest texts were read in the sources cache; nothing was fetched and nothing is missing.

| Target | Checked at | Result |
|---|---|---|
| 2.1 | LeHung26 lines 336, 342–355; CN23 lines 4513–4517 (p. 87) | supported |
| 2.2 | LeHung26 lines 292–299, 344–351, 357–360; CaptainSude26 lines 634–670; OpenAI26 lines 1131 (p. 26), 1163 (p. 27) | supported |
| 2.3 | OpenAI26 line 1192 (§9.4, pp. 27–28); CN23 lines 4545–4555 (p. 88) | supported |
| 3.1 | CaptainSude26 lines 187–193 | action supported; the invariant statement is proved in the text |
| 3.2 | CaptainSude26 lines 231–241 | supported |
| 3.4 | CaptainSude26 lines 184–220 | supported for `μ₅ ⊂ F_v`, `ρ̄(φ) = 1`; the general protected case and (iii) are argued in §3.4 (LocalGaloisDeformationRings §2.21) and recomputed above |
| 4.1 | CaptainSude26 lines 227–241 | supported |
| 4.2 | CaptainSude26 lines 242–263; AKT23 line 3979 (p. 86, `q ≥ h¹`) | supported |
| 5.1 | CaptainSude26 lines 264–289; CN23 lines 4226–4260 (pp. 81–82) | supported |
| 5.2 | CaptainSude26 lines 285–289; CN23 line 4361 | supported |
| 6.1 | CaptainSude26 lines 543–603; CN23 lines 4433–4509; ACC23 lines 7163–7187 (p. 178) | supported |
| 6.2 | CN23 lines 3849–3872 (pp. 73–74), 4562–4572; CaptainSude26 lines 267, 410–415 | supported |
| 7.4 | CaptainSude26 lines 538–603; CN23 lines 4574–4590 (pp. 88–89); CHT08 line 5723 (p. 116) | supported |
| 7.5 | CaptainSude26 lines 120–125, 147, 604–609 | supported |
| 8.1 | CaptainSude26 lines 26–33, 671–683; LeHung26 line 125 | supported |

Also read: ACC23 lines 2309–2355 (pp. 57–58) against the gap text; CN23 lines 4334–4390, 4404–4405; MilneCM lines 273–295; LeHung26 lines 86–88, 318–321, 352–355, 364–366.

### Library, suppliers, order

- Pins `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti), from `lake-manifest.json`. Opened: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142), `isConj_complexConj` (:148), `ofCMExtension` (:510), `of_isAbelianGalois` (:542), `IsCyclotomicExtension.Rat.isCMField` (:43, :575); `NumberField.isTotallyComplex_of_algebra` (`…/InfinitePlace/TotallyRealComplex.lean:229`); `Matrix.SpecialLinearGroup.toGL` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369`); `Matrix.SL2.commutator_eq_top` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`, needs `a ≠ 0`, `a² ≠ 1`); `groupCohomology.map` (`…/GroupCohomology/Functoriality.lean:141`); `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`…/GroupCohomology/FiniteCyclic.lean:114`); `Representation.linHom` (`Mathlib/RepresentationTheory/Basic.lean:655`); `IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`); `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98`); `tateDualityPairing_perfect_mixed` (`…/Local/Duality/Perfect.lean:280`). All exist.
- Supplier citations resolved now, at the open heads or on main: 105 section and layer ids across 21 roadmaps, all present as headings or bold paragraph titles; the 41 names of the parent, the three of PotentialAutomorphyInfrastructure, the three of AutomorphicGaloisRepresentationsPartII, `cht_soluble_prescribed_completions`, *ContinuousRep.adZero* and `ResidualImage.adZeroRep` all occur. Statements read against their use here: the parent's `switch_five`, `solvable_preparation`, `hilbert_local_selection`, `auxiliary_local_types`, `cm_modularity`, §7.2 (general number-field paragraph), §7.4 and its boundary paragraph on `ℚ(ζ₁₅ + ζ₁₅⁻¹, i)`; CrystallineLocalGlobalCompatibilityCM §§8.7, 9.1, 9.3; PotentialAutomorphyInfrastructure §2.3(1)–(2); AG2.7 local genericity; ArithmeticGaloisRepresentations §§6.3, 7.2, 7.7, 7.9; LocalGaloisDeformationRings §§2.3, 2.5, 2.6, 2.15, 2.16, 2.21; NeronModelsAndSemistableAbelianVarieties §3.12; EllipticCurves Layer 4 (`v(Δ) = v(q)`, `j = 1/q + 744 + ⋯`). One mislabel: R02. ModularityAndLanglandsExtensions §§2.29–2.30 and BianchiModularForms are named as consumers only.
- The four leads of `scratch/citations.md` are three source keys and `ResidualImage.adZeroRep`, which ArithmeticGaloisRepresentations §7.9 defines.
- Gap `acc-torsion-inertial-comparison`: same slug in `plan.json` (`gaps`, supplier AutomorphicGaloisRepresentationsPartII, section AG2.5, needed by 5.3) and in the README (“Supplier obligations”, §5.3 *Needs*). The hypotheses and conclusion match ACC23 lines 2309–2355. No roadmap states the theorem: a search of all heads finds only PotentialAutomorphyInfrastructure's supplier table citing AG2.5 for it, and AG2.5 does not contain it.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2249 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined only by a revision, no second copy. The board index lists AnalyticNumberTheory and LawrenceVenkateshMethod, both unrelated. A search of every open head and main for protected or unipotent-inertia conditions at a retained place, the exceptional class of `H¹(SL₂(𝔽₅), ad⁰)` detected on a unipotent subgroup, a width-three degeneration, and CM-ness of intermediate fields of a cyclotomic extension finds no other owner. ArithmeticGaloisRepresentations §7.7 owns the dimension of `H¹(SL₂(𝔽₅), ad⁰)` and is cited for it.

Overlap check: read EllipticCurveModularityTotallyReal, EllipticCurveModularityImaginaryQuadratic, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (the lists on main and by results are empty); nothing shared.

### Shape, headlines and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References. Three definitions (3.3, 5.1, 5.2) with 3, 4, 4 API bullets and 4, 4, 3 Checks; 24 theorems, each with hypotheses and a locator; `plan.json` has 28 targets and 92 tests and parses. Headlines: Theorems 2.5, 6.2, 8.1; none is statable at the pins (no automorphic representations of `GL₂(𝔸_K)`, attached Galois representations or potentially semistable local representations in either library), and the *Lean* paragraph says so for each. The README attributes no backticked Lean name to this roadmap. No LaTeX delimiters, pull-request numbers, machine paths, target tables or algorithms. The order of Layers 3 → 8 is forced by the *Needs* lines (4.1 needs 3.2, 3.5; 5.4 needs 4.2, 4.3; 6.2 needs 5.4; 7.5 needs 6.2; 8.1 needs 7.5); Layers 1–2 are independent of 3–7.

### Copyright and arrangement

Wording: 22 passages put beside their sources (the fifteen sampled targets, §§1.1, 1.2, 2.4, 3.5, 4.3, 5.3, and the gap text). Three follow CaptainSude26 clause by clause (R01); the others share at most four consecutive words beside formulae and hypothesis lists. Arrangement: CaptainSude26 has Sections 2–6. The roadmap puts Section 6's assembly first (Layer 2, with LeHung26), splits Section 3 across Layers 3 and 4, moves the presentation out of the proof of Theorem 4.2 into Layer 4, states a general preparation and lifting theorem (Layer 6) that the manuscript has only inside Section 5, and adds Layer 1; there is no one-to-one run, and the order of Layers 3–8 is forced as above. Reuse: no table, figure or data taken over.

Source independence: 22 passages compared with 6 sources, 3 following CaptainSude26 clause by clause (R01); largest share CaptainSude26, 25 of 62 locators; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and there is no Lean file at the design stage.
- The global patching argument of CaptainSude26 (lines 315–408, 445–498) beyond its hypotheses, counts and local computations: no refereed source states it, and it was not re-proved here.
- The geometric inputs of the parent (cover family, monodromy, local opens), on which LeHung26 Theorem 1.1 is conditional (line 86): read as supplier statements only.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since that definition excludes only the ratio `q`; affects nothing.
- **Error** in CN23 at Lemma 5.6.5, printed pp. 85–86 (lines 4435–4450): the source says the determinant kernel is reducible in all cases; it should except determinant order three with projective image `A₄`, where the kernel is irreducible; affects a stated result.
- **Misprint** in CN23 at the proof of Theorem 5.2, printed p. 86 (line 4460): the source says the set contains the `q`-adic places of `K`; it should say of `F`; affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft, conditional on the parent's geometric inputs, line 86); the parent rests on OpenAI26. No refereed source states these theorems.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`); R01 concerns three passages close to its wording. OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a8ff3f5e5d189510c4d194b5c76f87c28bd6a035", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~9", "model": "fable", "worker": "chris-x55"} -->
