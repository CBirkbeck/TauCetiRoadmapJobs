# Review of ArithmeticGaloisRepresentations (pull request #856 at 36e5aac)

**Verdict:** needs changes

This is an incremental re-review of the 55 changed lines since `a67c355`. Only `README.md` changed: supplier contracts (lines 330–332, 369–371, 399–402), §2.6, Layer 2 Dependencies, §3.2, §7.4, §7.6, §7.8, §7.11 and Layer 7 Dependencies. Nothing outside the folder changed.

The previous R01 is mostly repaired. One gap remains: the new Pieri *Needs:* line omits the target that proves the route's last step. The gate passes and the dependency check is clean.

## R01 (P3) — The Pieri route's last step comes from §7.4, which its *Needs:* line does not name

Re-raised from the previous report's R01, which this head partly repairs.

**Location:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:5156`, "`(Sym^{n−1}V)^∨ ≅ Sym^{n−1}V ⊗ det^{1−n}` gives the formula for `End`". The *Needs:* line at `README.md:5159–5160` reads "§7.1 (the quotient symmetric powers and `∧²V = det`); §1.2 (duals and tensor products); Tau Ceti `TauCeti.nonempty_linearEquiv_of_prod_linearEquiv_of_isFiniteLength`."

**Claim:** every input of the Pieri route is recorded.

**Witness:**
- §1.2 supplies the dual and tensor operations, not this isomorphism. The isomorphism fails without `(n−1)!` invertible: §7.1's own Check (`README.md:4476`) gives `Sym³V ≇ Γ³V = (Sym³V)^∨ ⊗ det³` over `F₃`.
- §7.4 **Symmetric powers of a symplectic plane** (`README.md:4790–4793`) is the target that proves it. For `2, d! ∈ F^×` it gives a perfect pairing `B_d` on `Sym^d V` with multiplier `(det r)^d`.

**Repair:** at the end of `README.md:5160`, add: "; §7.4 **Symmetric powers of a symplectic plane** (for `n ≥ 2`, the perfect pairing on `Sym^{n−1}V` with multiplier `det^{n−1}`, giving `(Sym^{n−1}V)^∨ ≅ Sym^{n−1}V ⊗ det^{1−n}`)".

**Test:** take `n = 3` and `p = 5`.
- The route's hypothesis holds: `(2n−2)! = 24` is invertible.
- §7.4's hypotheses hold for `d = 2`: `2` and `2! = 2` are units in `F₅`.
- By §7.4's Check, `B_2(x², y²) = 1` and `B_2(xy, xy) = −1/2`, so `(Sym²V)^∨ ≅ Sym²V ⊗ det^{−2}`. If `V` has eigenvalues `α, β`, both sides have eigenvalues `α^{−2}, (αβ)^{−1}, β^{−2}`.
- Then `End(Sym²V) ≅ Sym²V ⊗ Sym²V ⊗ det^{−2} ≅ Sym⁴ ⊗ det^{−2} ⊕ Sym² ⊗ det^{−1} ⊕ 1`, with dimensions `9 = 5 + 3 + 1`. This is the stated `⊕_{i<3} Sym^{2i}V ⊗ det^{−i}`.
- For `n = 4` over `F₃` (the §7.1 Check), `6! ≡ 0`, so the route's own hypothesis excludes the case where the isomorphism fails.

## Previous findings

- R01 — partly repaired: "cancel the common summand `det ⊗ Sym^a V ⊗ Sym^{b−2}V` by Krull–Schmidt cancellation … *Needs:* … Tau Ceti `TauCeti.nonempty_linearEquiv_of_prod_linearEquiv_of_isFiniteLength`", and "*Needs:* … §1.8; **Pieri and Clebsch–Gordan**" (`README.md:5153–5160`, `5177–5179`). Layer 7 Dependencies (`:5588–5589`) now cite the cancellation. The duality step's owner, §7.4, is still unnamed: R01 above.

## Verified sound

**Gate, dependency check, diff and elaboration.**
- The prescribed gate on this head prints `gate ArithmeticGaloisRepresentations: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run adds `build=0`.
- The dependency check prints `depcheck: 239 roadmaps, 2371 edges, 0 problem(s)` (exit 0). There is no UPWARD, CYCLE or `moved:` line. This roadmap is on line 57 of the merge order.
- `git diff --stat a67c355 HEAD` shows only `README.md` (43 insertions, 12 deletions). `changes.md` lists no file outside the folder.
- `lake env lean Suggested.lean` exits 0 with exactly 20 `declaration uses sorry` warnings and no other message. `Suggested.lean` is byte-identical to the previous head.
- `#check @name` for all 33 declarations in one scratch file: 33 types, 0 errors.
  - They match their README statements, as in the previous report.
  - The `signatures.md` lead on `isEnormous_symPower` is again a false positive. The theorem binds its own `n : ℕ` (elaborated type `∀ {k} [Field k] [Finite k] (n : ℕ) …`), which shadows the section's `n : Type`.
- Padding probe: in a scratch copy, every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | trivial | decide`. That gives 20 errors at the 20 tactic sites (lines 74, 85, 97, 146, 175, 207, 240, 253, 268, 287, 309, 325, 340, 367, 429, 440, 449, 458, 478, 497). None closes in one tactic.

**Pinned declarations opened for the changed passages.**

| Declaration | File:line at the pin | What it states, against the README's description |
| --- | --- | --- |
| `TauCeti.nonempty_linearEquiv_of_prod_linearEquiv_of_isFiniteLength` | Tau Ceti `RingTheory/KrullSchmidt/Cancellation.lean:172` | `IsFiniteLength A P → Nonempty ((M × P) ≃ₗ[A] (N × P)) → Nonempty (M ≃ₗ[A] N)` over a `Ring A`, with no finiteness on `M`, `N`. This matches "a common summand of finite length cancels from `M × P ≃ N × P`" (`README.md:401–402`) |
| `TauCeti.exists_linearEquiv_directSum_isIndecomposableModule` | Tau Ceti `RingTheory/KrullSchmidt/DirectSum.lean:152` | `[IsArtinian A M]`: a finite indecomposable decomposition exists |
| `TauCeti.exists_equiv_linearEquiv_of_directSum` | Tau Ceti `RingTheory/KrullSchmidt/DirectSum.lean:202` | `[IsNoetherian A M] [IsArtinian A M]`: two indecomposable decompositions are matched. This is "uniqueness for modules of finite length" (§2.6, `README.md:2260–2262`) |
| `TauCeti.IsLocalRing.ramificationGroup_antitone` | Tau Ceti `RingTheory/LocalRing/RamificationGroup.lean:183` (namespace `TauCeti.IsLocalRing`, `:106–108`) | `Antitone (ramificationGroup G S)`, which is "the filtration is decreasing" |
| `TauCeti.IsLocalRing.exists_forall_ramificationGroup_eq_bot` | same file, `:325` | `[FaithfulSMul G S]` |
| `TauCeti.LocalFieldsRamification.artinConductorExponent`, `…_mul_card_lowerRamificationGroup_zero` | Tau Ceti `NumberTheory/LocalField/Herbrand/ArtinConductor.lean:69`, `:182` | Both exist as cited in §3.2's new *Needs:* line |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'` | Mathlib `LinearAlgebra/Projectivization/PSL/PSL2.lean:124` | `(∃ a : F, a ≠ 0 ∧ a ^ 2 ≠ 1) → IsSimpleGroup PSL(2, F)`, matching the contract's parenthetical |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` | same file, `:139` | `4 ≤ Nat.card F → …`. Since `Nat.card` of an infinite type is `0`, "finite fields only" is right |
| `Subgroup.goursat`, `Subgroup.goursat_surjective` | Mathlib `GroupTheory/Goursat.lean:131`, `:107` | The second is the surjective-projection form §7.6 specialises |
| `IsAlgClosed` ⇒ `Infinite` | Mathlib `FieldTheory/IsAlgClosed/Basic.lean:394` | Backs §7.6's "an algebraically closed field is infinite" |
| `groupCohomology.H1InfRes_exact` | Mathlib `RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:402` | Inflation–restriction (see the §7.11 remark below) |

**Cross-roadmap citations in the changed passages.** AnalyticNumberTheoryPartI §2.2a, at the head of its open pull request (its README line 1310), defines `lowerArtinConductor` and `lowerSwanConductor` as the cited lower sums for `G` acting on a local ring `B`. This resolves §3.2's new *Needs:* line. SmoothRepresentationsOfLocalGroups SR.5.2 `wd-frobenius-semisimplification` is unchanged in §2.6. `scratch/overlaps.md` lists no open pull request that changes this folder, and no id that is dropped or defined only by an open revision.

**Internal references in the new *Needs:* lines.** Each named section exists, is earlier in the build order, and contains what it is cited for:
- §3.2: Hilbert's form of the different and `|G_0| = e` in §3.0 (`README.md:2558`, `:2567`); the lower sums in §3.1 (`:2723`).
- §7.4: *GaloisRep.IsTotallyOddChar* and *GaloisRep.IsOddAt* in §4.1 (`:3142`, `:3144`); `ad⁰` in §7.2 (`:4557`ff).
- **Modulo `p`**: §1.10 *coeffTwist* for a continuous ring automorphism, so `frobeniusEquiv` of a perfect `k` (`:1341–1342`); §1.7 `V^ss ≅ W^ss ⊕ (V/W)^ss` (`:1180`).
- §7.11: the Asai representation in §7.1 (`:4499`); §7.9's criterion `p ≥ 2(n + 1)` (`:5283`), which gives Lemma 7.5.14's `p ≥ 11` for `n = 4`.

**Seeded sample.** Each sampled target that falls in or is cited by a changed passage was checked:
- §3.2: the locators of **Finite-level conductors**.
  - Serre 1961, n° 3.7, (28)–(29), p. 137 (`serre-1961-corps-locaux` lines 1284–1293): `f(χ) = Σ_{i≥0} (g_i/g_0)(χ(1) − χ(G_i))`, where `χ(G_i)` is the mean over `G_i`, which equals `dim V^{G_i}`. This is the Artin sum.
  - Serre 1987, (4.9.1)–(4.9.2), p. 215 (`serre-1987-modular-galois` lines 1583–1598, PDF p. 37 of the journal's pp. 179–230): `n = Σ_{i≥0}(g_i/g_0) dim V/V_i = dim V/V_0 + b`. These are both sums and their relation.
- §7.4: ACC+, §1.2, p. 909 (`allen-et-al-2023-potential-automorphy` lines 515–522, arXiv p. 13 = Annals p. 909) defines totally odd as `μ(c_v) = −1`. This matches the clause the new *Needs:* line ties to §4.1.
- §3.0, §3.1, §4.1 and §7.9 are cited by the new lines. Their content is listed above.
- The other sampled targets (2.2, 2.5a, 3.1's locators, 5.10–5.13, 6.1, 6.2, 7.5) lie in no changed passage.

**Ownership.** The change adds no object. It adds citations and *Needs:* lines only, so ownership is as in the previous report.

**Adversarial table, changed statements.**

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| Contract: `rank_two_simple'` and `rank_two_simple` hypotheses | `F₂`: `F₂^× = {1}`, so no `a`; `PSL₂(F₂) ≅ S₃` is not simple. `F₃`: `1² = 2² = 1`, so no `a`; `PSL₂(F₃) ≅ A₄` is not simple. `F₄`: `a = ω`, `ω² = ω + 1 ≠ 1`, `Nat.card = 4`; `PSL₂(F₄) ≅ A₅` is simple. `ℚ`: `a = 2` works for the primed form, while `Nat.card ℚ = 0 < 4` blocks the unprimed one | Holds |
| Contract and §3.2: `ramificationGroup_antitone` | `ℚ₂(i)/ℚ₂`: `|G_{−1}| = |G_0| = |G_1| = 2`, `|G_2| = 1`, nonincreasing. In general, `i ≤ j` gives `𝔪^{j+1} ⊆ 𝔪^{i+1}`, so acting trivially mod `𝔪^{j+1}` implies the same mod `𝔪^{i+1}` | Holds |
| Contract: cancellation needs finite length of `P` | For ℤ-modules with `M = ℤ`, `N = 0`, `P = ℤ^(ℕ)`: `ℤ × ℤ^(ℕ) ≅ ℤ^(ℕ) ≅ 0 × ℤ^(ℕ)`, but `ℤ ≇ 0`. The hypothesis is needed, and it is stated | Holds |
| §2.6 Krull–Schmidt for Frobenius-semisimple WD representations | `V = 1 ⊕ 1` (`r` trivial, `N = 0`): the decompositions `⟨e₁⟩ ⊕ ⟨e₂⟩` and `⟨e₁+e₂⟩ ⊕ ⟨e₂⟩` differ as submodules and agree as isomorphism classes, which is all that is claimed. `V = Sp(2) ⊕ 1`: the algebra generated by `r(W_K)` and `N` lies in `End(ℂ³)`, of dimension `≤ 9`, so `V` has finite length and the string lengths `{2, 1}` are unique | Holds |
| §3.2 **Finite-level conductors** (new *Needs:*) | `ℚ₂(i)/ℚ₂`, regular representation: `f = 1`, `|G| = 2 = f|G_0|`; Hilbert's form gives `d = 1 + 1 = 2`, so `f·d = 2 = v₂(−4)`. Artin sum `1 + 1 = 2`, Swan sum `1`. `ℚ₃(√3)/ℚ₃`: `d = 1 = v₃(12)` | Holds |
| §7.4 balance (new *Needs:*) | `n = 3`, `ρ(c) = diag(1,1,−1)`: the centraliser `gl₂ × gl₁` has dimension 5, and `H⁰(ad⁰)` has dimension `4 = a² + b² − 1`; `tr = 1`. `n = 3`, `a = 3`, `b = 0`, `ℓ = 3`: `tr = 0 ∈ {−1,0,1}` although unbalanced, which `ℓ > n` excludes | Holds |
| §7.6 **Goursat for `PGL₂`** (new justification) | `Ω = ℂ`: the graph of complex conjugation has surjective projections and comes from an abstract, non-algebraic automorphism, as allowed. `PGL₂(ℂ) = PSL₂(ℂ)`: `diag(a,1)` equals `diag(√a, 1/√a)` up to the scalar `√a`. Over `ℝ`, `{(g,h) : sgn det g = sgn det h}` has surjective projections and is neither a product nor a graph, because `PSL₂(ℝ)` has index 2 in `PGL₂(ℝ)`; so the squares hypothesis is needed. `F̄₂`: trivial centre, `PGL₂ = SL₂` | Holds |
| §7.8 Pieri, cancellation step | `a = b = 2`, characteristic 5: `M = Sym²⊗Sym²` (9), `P = det⊗Sym²` (3), `N = Sym³⊗V ⊕ det² ≅ Sym⁴ ⊕ det⊗Sym² ⊕ det²` (`5+3+1`). Both `M × P` and `N × P` have dimension 12, and cancelling the finite-length `P` gives `9 = 9`. Pieri uses `r = 3, 2`, both `≤ a + b` | Holds |
| §7.8 Pieri, duality step | `n = 3`: eigenvalues `α^{−2}, (αβ)^{−1}, β^{−2}` on both sides. `n = 4` over `F₃`: fails (§7.1 Check), and is excluded by `6! ≡ 0` | Holds; owner unnamed (R01) |
| §7.8 **Modulo `p`** (new *Needs:*) | `k = F₄`: if `V` has eigenvalues `α, β`, then `Frob V` has `α², β²`. `n = 2`, `p = 2`: `End V` has dimension `4 = 1 + 2 + 1` (previous report) | Holds |
| §7.11 (new *Needs:*) | `W = V ⊕ V^σ`, `dim W = 4`: `Sym²W` has dimension `10 = 6 + 4` (`Ind ad⁰V ⊕ As(V)`), `∧²W` has `6 = 1 + 1 + 4`, and `W ⊗ W` has `16 = 10 + 6`. Lemma 7.5.14's `p ≥ 11` is the first prime `≥ 2(4+1)` | Holds |

**Adversarial table, untouched statements.** Each row is carried from the previous report (`a67c355`), where the values were computed.

| Statement | Values (previous report) | Result |
| --- | --- | --- |
| §1.8 `iso_of_charpoly_eq` | Amitsur in rank 2: `det(g+h) = 1` on both sides for `g = diag(1,2)`, `h = (0 1; 1 0)`. The `ℕ`-monoid nilpotent example | Holds |
| §1.11 quotients over an excellent DVR | `ℤ_(p)`; `G_m` with weights `±1`; `SL₂` by conjugation; `C₂` on `ℤ₂[x]` | Holds |
| §5.3 `iso_of_frobenius_charpoly_eq` | Density 1; dense subset `ℕ ⊂ ℤ_p`; `ℤ/3` over `F₄` | Holds |
| §7.8 irreducibility, one-dimensional constituents, `H⁰(G_ℚ, M(1)) = 0` | `p = 5`, `a = 4`: Vandermonde; `p = 7`, `F₄₉`; `PGL₂(F₅) ≅ S₅`; the `p = 3` Check | Holds |
| `baire_descent`, `exists_integral_conj_GL`, `isAbsolutelyIrreducible_of_isOddAt`, `dickson_projectiveImage` | `n = 0`; `(1 a; 0 1)` conjugated by `diag(ℓ,1)`; `F₂` excluded; `PGL₂(F₃) ≅ S₄` | Hold |
| `imageAlgebra_isCentralSimple`, `realizable_iff_imageAlgebra_split`, `realizable_of_charpoly_mem` | `Q₈` over `ℝ` (`ℍ`); `ℤ/3` over `F₂` | Hold |
| `conj_into_of_trace_mem_of_distinct_eigenvalues`, `carayol_conj_of_trace_eq`, `compact_matrix_frattini_isOpen` | `1 ⊕ sgn`; `habs` excludes `1 ⊕ 1`; `Φ(1+ℓℤ_ℓ) = 1+ℓ²ℤ_ℓ` | Hold |
| `multiplicative_residual_unramified_iff`, `lowerSwanConductor_le` | `11a1` at `p = 5, 3`; `ℚ₂(√2)`: `2 ≤ 2`; `χ₈`: `2 ≤ 3` | Hold |
| `isAdequate_of_coprime_or_large`, `isAdequate_tensor`, `isEnormous_*`, `exists_linear_lift` | `SL₂(F₇)`; `F₅` centraliser; `diag(1,2,3)` over `F₅`; `ℤ/4 → ℤ/2` | Hold |
| §§1.2, 2.4, 2.7, 3.5–3.7, 4.5, 5.4, 5.6, 5.11, 6.1, 6.4, 6.4a, 7.6, 7.10 | For example `Δ(11a1) = −11⁵`, `ε₂ = −i·4^{1/2−s}`, `#E(F₅) = 6` | Hold |

**Remark on a changed passage** (not a finding, and no change requested): §7.11's new *Needs:* line (`README.md:5452–5453`) names existing earlier sections. BCGP21's proofs of Lemma 7.5.9 (lines 9646–9658: inflation–restriction twice, then a group of order prime to `p`) and Lemma 7.5.12 (line 9688: Schur's lemma) use Mathlib `groupCohomology.H1InfRes_exact` (covered by Layer 7's `groupCohomology` dependency), §7.7 (`README.md:5101`) and §7.2 (`:4608`). The README gives no proof sketch for those two lemmas, so the line omits no input the README itself states.

## Not verifiable

- **GHTT, Theorem 9** (§7.9's large-characteristic criterion, which §7.11's new *Needs:* line cites): the text is not in the sources cache. Only its use (`p ≥ 2(n+1)`) was checked against the README.
- **NT26, proof of Lemma 2.2, p. 10** (§7.6 Goursat): not in the cache. The new sentence `PGL₂(Ω) = PSL₂(Ω)` was checked mathematically, above.
- **Tate 1979, (4.1.5)** (§2.6): not in the cache. The changed text adds only the Krull–Schmidt inputs, which were checked at the pin.
- **Serre, *Local Fields*** is uncertified in the manifest, as before.
- The other untouched locators listed as not verifiable in the previous reports were not re-read.

## Source issues

- none
